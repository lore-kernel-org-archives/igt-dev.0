Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60725F9D0D5
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 15:55:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC2F10E0AE;
	Tue, 14 Apr 2026 15:55:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EazJ2Plv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D51B10E0AE
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 15:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776182132; x=1807718132;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=st5sYf4f32CnkHnA6MWg7rREILiBBk+e0ciotswGKa0=;
 b=EazJ2PlvYmoqtEp+8zKLOTIKy/Aj9DgLTLnVz+fXw6YUAv0nPD6nByJU
 qqERfFjmHVjM4XWH3dp29sjgr77N4VQWTMUq2m2aoJ0+rYN1/1QuaVnA4
 fpKkcqqB5yY2pbatuyMbD0QLNR3bnPnNlDL/zJG5E1gE0eXeAZWbA1WA+
 QK9s3Z0CI4hqOmYIzB9LdPGjcVTLZ0kkZpM64O8xin+9mICzM+bAvZxCa
 WX3rSogSBVJMEqY0HONdiF6/ybOW8ulkU2S0hbmLQq6runEIEKgWIB3cr
 676Qfbb9/dpmdoUAp0YMfUiQZ/BdPr/U1CtfYePe8mcBZvGmDmWAloSeq g==;
X-CSE-ConnectionGUID: iq8MR2+xTPiNXYri1kUYQA==
X-CSE-MsgGUID: xFTqEkncQiOhDhL8A6bDsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77022042"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="77022042"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 08:55:31 -0700
X-CSE-ConnectionGUID: j7Qg68b0QyWN8WfaxBZtnw==
X-CSE-MsgGUID: NnPh9YM8Q/qMJtlV9Qa58w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="260570774"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 08:55:29 -0700
Date: Tue, 14 Apr 2026 17:55:13 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH i-g-t v3 1/4] tools/intel_hdcp: Fix status rendering
Message-ID: <20260414155513.rcdopcdmujfl4pfb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
 <20260413233629.771034-2-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413233629.771034-2-John.Harrison@Igalia.com>
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
On 2026-04-13 at 16:36:26 -0700, John Harrison wrote:
> The time was being drawn twice and the position of the text was based
> on magic numbers rather than the font size. Which meant it could move
> to different places depending upon the screen resolution (as the font
> size is calculated based on the screen size).
> 
> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>

LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil 

> ---
>  tools/intel_hdcp.c | 34 +++++++++++++---------------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> index 266ee1968..c9968f329 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -470,7 +470,7 @@ static void *keypress_thread(void *arg)
>  
>  static void *video_player_thread(void *arg)
>  {
> -	double font_size, x, y;
> +	double font_size, x, y, edge_gap;
>  	struct igt_fb fb;
>  	cairo_t *cr;
>  	igt_plane_t *primary;
> @@ -528,29 +528,13 @@ static void *video_player_thread(void *arg)
>  
>  		draw_menu_text(cr, data);
>  
> -		current_time = time(NULL);
> -		elapsed = current_time - data->video_start_time;
> -		minutes = elapsed / 60;
> -		seconds = elapsed % 60;
> -		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes, seconds);
> -
>  		cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
>  				       CAIRO_FONT_WEIGHT_BOLD);
>  		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>  		font_size = data->height / 12.0;
> -		cairo_set_font_size(cr, font_size / 2.0);
> -		cairo_text_extents(cr, timer_str, &ext);
> -		cairo_move_to(cr, data->width - ext.width - 20, data->height - 20);
> -		cairo_show_text(cr, timer_str);
> -
> -		/* Draw HDCP status above timer */
> -		cairo_set_font_size(cr, font_size);
> -		cairo_text_extents(cr, hdcp_str, &ext);
> -		x = data->width - ext.width - 20;
> -		y = data->height - ext.height - 60;
> -
> -		cairo_move_to(cr, x, y);
> -		cairo_show_text(cr, hdcp_str);
> +		edge_gap = font_size / 5;
> +		x = data->width - edge_gap;
> +		y = data->height - edge_gap;
>  
>  		/* Add timer in bottom-right corner */
>  		current_time = time(NULL);
> @@ -561,8 +545,16 @@ static void *video_player_thread(void *arg)
>  
>  		cairo_set_font_size(cr, font_size / 2.0);
>  		cairo_text_extents(cr, timer_str, &ext);
> -		cairo_move_to(cr, data->width - ext.width - 20, data->height - 20);
> +		cairo_move_to(cr, x - ext.width, y);
>  		cairo_show_text(cr, timer_str);
> +		y -= ext.height + edge_gap;
> +
> +		/* Draw HDCP status above timer */
> +		cairo_set_font_size(cr, font_size);
> +		cairo_text_extents(cr, hdcp_str, &ext);
> +		cairo_move_to(cr, x - ext.width, y);
> +		cairo_show_text(cr, hdcp_str);
> +		y -= ext.height + edge_gap;
>  
>  		cairo_destroy(cr);
>  
> -- 
> 2.43.0
> 
