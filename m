Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0432FF9D0E4
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 16:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71E410E620;
	Tue, 14 Apr 2026 16:05:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQbdRAyl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F37010E61E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 16:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776182699; x=1807718699;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fmotSBgTJ1OfVxvMQKfnHVFagcdzKR9HZ03ONyxXZWw=;
 b=dQbdRAylq1JJbbST69dbvC3VWwVzLi77JnsxlRd/jqRUzDXet9f95eCp
 MphuD3TaWZhu/8Q7pjM5keIaLIxa5XvNlK5IFZ6XPW6ySe/Zdt6epshHB
 m5+uANsDTqfGsYU2hWBDR7QiHIAstaFfd55pIbdzBODg9xEyAWawd52V3
 BfSWTPPIC9MDpyHL55Ib4APb0TJdgdmSDwzyRbL738UpOPnopZIuXWuaz
 g5bioN0vWHQbNXYh4BXpT85ZXwBTEmrFdYqYCfwhF1p0kIf52kwmynaeQ
 bO5KVu+7kPBGGKiGBRDXEnvvZxBT889nGAxBJIF44g6nxrViC/wKfxWtz w==;
X-CSE-ConnectionGUID: 0hxDK9w8RuqW3mczr5jAPA==
X-CSE-MsgGUID: KvrOWZVdQnmQjCDeaEjvFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="94712811"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="94712811"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:04:59 -0700
X-CSE-ConnectionGUID: cgfOK5OlR86LC9q1T9jISA==
X-CSE-MsgGUID: VEpIfM0JRHKvq1zaD1UzNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253530540"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:04:58 -0700
Date: Tue, 14 Apr 2026 18:04:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH i-g-t v3 3/4] tools/intel_hdcp: Show actual HDCP status
Message-ID: <20260414160455.lmwa4uexlnp2sald@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
 <20260413233629.771034-4-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413233629.771034-4-John.Harrison@Igalia.com>
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
On 2026-04-13 at 16:36:28 -0700, John Harrison wrote:
> The 'video player' showed what the requested HDCP mode was but not the
> actual status. The menu system does redraw the screen with a special
> colour to denote the status, but that is immediately overwritten by
> the player thread. So all you get is a very brief full screen flicker
> (to be fixed in next patch).
> 
> Instead, add the current HDCP status as an extra text line of the
> video player's output so it is permanently visible and clear.
> 
> Also, move the enable of HDCP inside the mutex lock with the
> internal state change. That way, the newly added 'enabled/desired'
> line does not update in advance of the 'requested' line (due to the
> video player thread being asynchronous and managing to turn HDCP on
> while the menu thread is waiting on the mutex lock).
> 
> v2: Split into two patches (review feedback by Kamil)
> v3: Fix text positions by using helper function
> 
> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tools/intel_hdcp.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> index 4dfeda594..c12de06df 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -485,7 +485,8 @@ static void *video_player_thread(void *arg)
>  	struct igt_fb fb;
>  	cairo_t *cr;
>  	igt_plane_t *primary;
> -	const char *hdcp_str;
> +	const char *hdcp_request;
> +	const char *hdcp_status;
>  	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
>  	enum hdcp_type cur_type, prev_type;
>  	data_t *data;
> @@ -512,22 +513,24 @@ static void *video_player_thread(void *arg)
>  			prev_type = cur_type;
>  		}
>  
> +		hdcp_status = get_hdcp_status(data, data->selected_connector);
> +
>  		switch (cur_type) {
>  		case HDCP_TYPE_1_4:
>  			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
> -			hdcp_str = "HDCP1.4";
> +			hdcp_request = "HDCP1.4";
>  			break;
>  		case HDCP_TYPE_2_2_TYPE_0:
>  			bg_r = 0.0; bg_g = 0.45; bg_b = 0.45;
> -			hdcp_str = "HDCP2.2 TYPE 0";
> +			hdcp_request = "HDCP2.2 TYPE 0";
>  			break;
>  		case HDCP_TYPE_2_2_TYPE_1:
>  			bg_r = 0.45; bg_g = 0.15; bg_b = 0.6;
> -			hdcp_str = "HDCP2.2 TYPE 1";
> +			hdcp_request = "HDCP2.2 TYPE 1";
>  			break;
>  		default:
>  			bg_r = 0.0; bg_g = 0.0; bg_b = 0.0;
> -			hdcp_str = "NO HDCP";
> +			hdcp_request = "NO HDCP";
>  			break;
>  		}
>  
> @@ -555,7 +558,10 @@ static void *video_player_thread(void *arg)
>  		y = draw_text_right(cr, font_size / 2.0, x, y, timer_str );
>  
>  		/* Draw HDCP status above timer */
> -		y = draw_text_right(cr, font_size, x, y, hdcp_str );
> +		y = draw_text_right(cr, font_size, x, y, hdcp_status );
> +
> +		/* Draw HDCP request above status */
> +		y = draw_text_right(cr, font_size, x, y, hdcp_request );

Here also spaces before closing bracked should be removed,
no need for resend as this could be fixed at merge.

Regards,
Kamil

>  
>  		cairo_destroy(cr);
>  
> @@ -598,8 +604,8 @@ static void stop_video_player(data_t *data)
>  
>  static void enable_hdcp_type(data_t *data, enum hdcp_type type)
>  {
> -		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
>  		pthread_mutex_lock(&data->lock);
> +		set_hdcp_prop(data, CP_DESIRED, type, data->selected_connector);
>  		data->hdcp_type = type;
>  		data->video_start_time = time(NULL);
>  		pthread_mutex_unlock(&data->lock);
> -- 
> 2.43.0
> 
