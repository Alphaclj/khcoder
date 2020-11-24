package gui_window::r_plot::cod_netg;
use base qw(gui_window::r_plot);

sub start{
	my $self = shift;
	
	$self->{button_interactive} = $self->{bottom_frame}->Button(
		-text => kh_msg->get('gui_window::r_plot::word_netgraph->interactive'), # interactive html
		-font => "TKFN",
		-borderwidth => '1',
		-command => sub {
			my $html = $::project_obj->file_TempHTML;
			$self->{plots}[$self->{ax}]->save($html);
			gui_OtherWin->open($html);
		}
	)->pack(-side => 'right');
	
	$self->win_obj->bind(
		'<Key-h>',
		sub{
			$self->{button_interactive}->flash;
			$self->{button_interactive}->invoke;
		}
	);
}

sub option1_options{
	my $self = shift;

	if (@{$self->{plots}} == 2){
		return [
			kh_msg->get('gui_window::r_plot::word_netgraph->col'), # ���顼
			kh_msg->get('gui_window::r_plot::word_netgraph->gray'), # ���졼
		] ;
	}
	elsif (@{$self->{plots}} == 3){
		return [
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_b'), # �濴�����޲��
			kh_msg->get('gui_window::r_plot::word_netgraph->com_r'),
			kh_msg->get('gui_window::r_plot::word_netgraph->com_m'), # ���֥���ո��С�modularity��
		];
	}
	elsif (@{$self->{plots}} == 4){
		return [
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_b'), # �濴�����޲��
			kh_msg->get('gui_window::r_plot::word_netgraph->com_r'),
			kh_msg->get('gui_window::r_plot::word_netgraph->com_m'), # ���֥���ո��С�modularity��
			kh_msg->get('gui_window::r_plot::word_netgraph->cor'),  # ���
		];
	}
	elsif (@{$self->{plots}} == 8){
		return [
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_b'), # �濴�����޲��
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_d'), # �濴���ʼ�����
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_v'), # �濴���ʸ�ͭ�٥��ȥ��
			kh_msg->get('gui_window::r_plot::word_netgraph->com_b'), # ���֥���ո��С��޲��
			kh_msg->get('gui_window::r_plot::word_netgraph->com_r'),
			kh_msg->get('gui_window::r_plot::word_netgraph->com_m'), # ���֥���ո��С�modularity��
			kh_msg->get('gui_window::r_plot::word_netgraph->cor'),  # ���
			kh_msg->get('gui_window::r_plot::word_netgraph->none'),  # �ʤ�
		];
	} else {
		return [
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_b'), # �濴�����޲��
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_d'), # �濴���ʼ�����
			kh_msg->get('gui_window::r_plot::word_netgraph->cnt_v'), # �濴���ʸ�ͭ�٥��ȥ��
			kh_msg->get('gui_window::r_plot::word_netgraph->com_b'), # ���֥���ո��С��޲��
			kh_msg->get('gui_window::r_plot::word_netgraph->com_r'),
			kh_msg->get('gui_window::r_plot::word_netgraph->com_m'), # ���֥���ո��С�modularity��
			kh_msg->get('gui_window::r_plot::word_netgraph->none'),  # �ʤ�
		];
	}
}

sub extra_save_types{
	return (
		[ "GraphML",[qw/.graphml/] ],
		[ "Pajek",[qw/.net/] ],
		[ "Interactive HTML",[qw/.html/] ],
	);
}

sub option1_name{
	return kh_msg->get('gui_window::r_plot::word_netgraph->color'); #  ���顼��
}

sub win_title{
	return kh_msg->get('win_title'); # �����ǥ��󥰡������ͥåȥ��
}

sub win_name{
	return 'w_cod_netg_plot';
}


sub base_name{
	return 'cod_netg';
}

1;