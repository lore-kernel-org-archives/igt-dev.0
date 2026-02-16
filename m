Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C2DE63F3F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 17:51:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4807610E3DD;
	Mon, 16 Feb 2026 17:51:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwbqxZc2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5167610E3DD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771264309; x=1802800309;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EfipdGQXTvCjPJKS8pHK1HwHBVXjXm/sphRYrzQGZmQ=;
 b=gwbqxZc2RKxd247xo4a6im8fZ3NjhOZWVcYZk2fcThW2sCSK9gf0iftU
 XQgbG5b+2PUKOoXBw+3V0uIhm8jrr3m/lPRkE7JhC2rygrNW6LZlVjafh
 V0FKqROXVWsKiOnCAExgaPgQ5+FUG+UtvlFONZjfWz560fbQ2bTQNBQbw
 SOBmw/BFWCb1zXiWRkUC4xiooQ4EIfE+VlrULmNAvLs8y0xEdTayLMym/
 2XB0l6+2czj3l9Hohv3WrGlKKYU2HeTv+4jmGA9MiOAlJ+TtGOKLJqXnN
 FOfRvIB+rpd0rY12a1+FMi4O1FwIthuhHVCZtAO+atLti6hcR+G72OrHv g==;
X-CSE-ConnectionGUID: 1+6NApMOS1ekl0kjCMa8sA==
X-CSE-MsgGUID: jJT7vZCJSfewDBggTDdGYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72519776"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="72519776"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 09:51:48 -0800
X-CSE-ConnectionGUID: iswcluskSAGOyRJYszkalw==
X-CSE-MsgGUID: yiHOd1eRQo6JAlKy7mHsXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; d="scan'208";a="218197583"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 09:51:46 -0800
Date: Mon, 16 Feb 2026 18:51:27 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH i-g-t] tool/intel_hdcp: Fix flickering and show actual
 HDCP status
Message-ID: <20260216175127.h7dfw3eokjbpmxcv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260211214631.265577-1-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260211214631.265577-1-John.Harrison@Igalia.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi John,
On 2026-02-11 at 13:46:31 -0800, John Harrison wrote:
> The 'video player' showed what the requested HDCP mode was but not the
> actual status. The menu system did redraw the screen with a special
> colour to denote the status, but that was immediately overwritten by
> the player thread. So all you got was a very brief full screen flicker.
> 
> Instead, add the current HDCP status as an extra text line of the
> video player's output. Also, drop the menu update once the video
> player is running to remove the flickering.
> 
> Lastly, move the enable of HDCP inside the mutex lock with the
> internal state change. That way, the 'enabled/desired' line does not
> update in advance of the 'requested' line (due to the video player
> thread being asynchronous and managing to turn HDCP on while the menu
> thread is waiting on the mutex lock).
> 

+cc
Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>

Could it be splitted into two patches? One for a fix and second for
showing actual status? It could help review. Up to you, this is

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> ---
>  tools/intel_hdcp.c | 49 +++++++++++++++++-----------------------------
>  1 file changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> index cd5d2b6be..56ed720cf 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -102,24 +102,13 @@ static void draw_menu_text(cairo_t *cr, data_t *data)
>  	}
>  }
>  
> -static void draw_menu(data_t *data, const char *status)
> +static void draw_menu(data_t *data)
>  {
>  	cairo_t *cr = igt_get_cairo_ctx(data->fd, &data->fb);
>  
> -	/* Background color and text color based on HDCP status */
> -	if (strcmp(status, "INIT") == 0) {
> -		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -	} else if (strcmp(status, "Enabled") == 0) {
> -		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
> -	} else {
> -		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
> -		cairo_paint(cr);
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -	}
> +	cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> +	cairo_paint(cr);
> +	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>  
>  	draw_menu_text(cr, data);
>  
> @@ -482,6 +471,7 @@ static void *video_player_thread(void *arg)
>  	char timer_str[32];
>  	time_t current_time, elapsed;
>  	int minutes, seconds;
> +	const char *status = NULL;
>  
>  	data = (data_t *)arg;
>  	cur_type = data->hdcp_type;
> @@ -502,6 +492,8 @@ static void *video_player_thread(void *arg)
>  			prev_type = cur_type;
>  		}
>  
> +		status = get_hdcp_status(data, data->selected_connector);
> +
>  		switch (cur_type) {
>  		case HDCP_TYPE_1_4:
>  			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
> @@ -544,10 +536,18 @@ static void *video_player_thread(void *arg)
>  		cairo_show_text(cr, timer_str);
>  
>  		/* Draw HDCP status above timer */
> +		cairo_set_font_size(cr, font_size);
> +		cairo_text_extents(cr, status, &ext);
> +		x = data->width - ext.width - 20;
> +		y = data->height - ext.height - 20;
> +
> +		cairo_move_to(cr, x, y);
> +		cairo_show_text(cr, status);
> +
>  		cairo_set_font_size(cr, font_size);
>  		cairo_text_extents(cr, hdcp_str, &ext);
>  		x = data->width - ext.width - 20;
> -		y = data->height - ext.height - 60;
> +		y = data->height - ext.height - 120;
>  
>  		cairo_move_to(cr, x, y);
>  		cairo_show_text(cr, hdcp_str);
> @@ -605,8 +605,8 @@ static void stop_video_player(data_t *data)
>  
>  static void enable_hdcp_type(data_t *data, enum hdcp_type type)
>  {
> -		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
>  		pthread_mutex_lock(&data->lock);
> +		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
>  		data->hdcp_type = type;
>  		data->video_start_time = time(NULL);
>  		pthread_mutex_unlock(&data->lock);
> @@ -667,13 +667,12 @@ int main(int argc, char **argv)
>  {
>  	data_t data;
>  	pthread_t tid;
> -	const char *status = NULL;
>  	igt_plane_t *primary;
>  
>  	data.selected_connector = -1;
>  	test_init(&data);
>  
> -	draw_menu(&data, "INIT");
> +	draw_menu(&data);
>  	primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data.fb);
>  	igt_display_commit2(&data.display, COMMIT_ATOMIC);
> @@ -707,7 +706,6 @@ int main(int argc, char **argv)
>  			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
>  			break;
>  		case 5:
> -			stop_video_player(&data);
>  			set_hdcp_prop(&data, CP_UNDESIRED, HDCP_TYPE_2_2_TYPE_1,
>  				      data.selected_connector);
>  			data.hdcp_type = HDCP_TYPE_NONE;
> @@ -716,17 +714,6 @@ int main(int argc, char **argv)
>  			break;
>  		}
>  
> -		if (cmd == 1) {
> -			draw_menu(&data, "INIT");
> -		} else {
> -			status = get_hdcp_status(&data, data.selected_connector);
> -			draw_menu(&data, status);
> -		}
> -
> -		primary = igt_output_get_plane_type(data.output, DRM_PLANE_TYPE_PRIMARY);
> -		igt_plane_set_fb(primary, &data.fb);
> -		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> -
>  		usleep(200 * 1000);
>  	}
>  
> -- 
> 2.43.0
> 
