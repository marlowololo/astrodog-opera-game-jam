draw_set_color(c_white);
draw_set_valign(fa_middle);

draw_set_halign(fa_right);
draw_text(centerPos - 25, 50, "Score : " + string(currentTotalScore));

draw_set_halign(fa_left);
draw_text(centerPos + 25, 50, "Wifi : " + string(currentWifiCollected));