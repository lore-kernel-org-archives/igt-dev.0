Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6703EF9D0DA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 16:04:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0601F10E0AE;
	Tue, 14 Apr 2026 16:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmPDGcgg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDDCE10E61E
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776182632; x=1807718632;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=THyupqavsbkICVxOFATQ7SYsPjxZ1gGoZwR9HpccP+Q=;
 b=ZmPDGcgghbwtwcXbwAbnfOXNwX5FBPzMvAjqhA4coLbqstxEPWyUVdiI
 5HkQMouipwwg7q8LspTvUf4pxNCrNhZJRDyC/1/bT1emNbuOKSvJqVDZe
 Bj6MhWwNhs4hsJFQSsn27CCZ5SBoBwQtsYbrs2SEohC0qKtkKvuHtqWRH
 cnpOC4nHar+oBEXZGgtJaLVrFnnlqjUYbsFR4+ya3QMzzNqVJI/Foh3ot
 pZIIOQ67HZNS5vXKBRomfufG+OYdiDzXEjClD6KMMR7jgEXePX6crIvoh
 /HTpkOBrS9c+nwElTZX4V9/HbDLRRzB/I732rmAxI1mSiiF44wfSFWB2f g==;
X-CSE-ConnectionGUID: Ei6nJnKuRJCvHYvkrYVd6Q==
X-CSE-MsgGUID: ynjAhKoMS5GRF3QQLEdo3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88591926"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88591926"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 09:03:48 -0700
X-CSE-ConnectionGUID: bNbJqRsLQq6llnBEfVZOEQ==
X-CSE-MsgGUID: eZrZFjKSRl6lfhqTwd0Q7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="235096582"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 09:03:48 -0700
Date: Tue, 14 Apr 2026 18:03:44 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH i-g-t v3 2/4] tools/intel_hdcp: Move text rendering into
 helper function
Message-ID: <20260414160344.s2yui7kbt7t6pvt6@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 igt-dev@lists.freedesktop.org,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260413233629.771034-1-John.Harrison@Igalia.com>
 <20260413233629.771034-3-John.Harrison@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260413233629.771034-3-John.Harrison@Igalia.com>
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
On 2026-04-13 at 16:36:27 -0700, John Harrison wrote:
> Rather than duplicate the text rendering calculations over and over,
> add a helper function.
> 

Few small nits, could be fixed at merge, see below.

> CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> CC: Suraj Kandpal <suraj.kandpal@intel.com>
> Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> ---
>  tools/intel_hdcp.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> index c9968f329..4dfeda594 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -468,6 +468,17 @@ static void *keypress_thread(void *arg)
>  	return NULL;
>  }
>  
> +static double draw_text_right(cairo_t *cr, double font_size, double x, double y, const char *str )
> +{
> +	cairo_text_extents_t ext;
> +
> +	cairo_set_font_size(cr, font_size);
> +	cairo_text_extents(cr, str, &ext);
> +	cairo_move_to(cr, x - ext.width, y);
> +	cairo_show_text(cr, str);

Add newline before return.

> +	return y - ext.height - (font_size / 4);
> +}
> +
>  static void *video_player_thread(void *arg)
>  {
>  	double font_size, x, y, edge_gap;
> @@ -476,7 +487,6 @@ static void *video_player_thread(void *arg)
>  	igt_plane_t *primary;
>  	const char *hdcp_str;
>  	double bg_r = 0.0, bg_g = 0.0, bg_b = 0.0;
> -	cairo_text_extents_t ext;
>  	enum hdcp_type cur_type, prev_type;
>  	data_t *data;
>  	char timer_str[32];
> @@ -542,19 +552,10 @@ static void *video_player_thread(void *arg)
>  		minutes = elapsed / 60;
>  		seconds = elapsed % 60;
>  		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes, seconds);
> -
> -		cairo_set_font_size(cr, font_size / 2.0);
> -		cairo_text_extents(cr, timer_str, &ext);
> -		cairo_move_to(cr, x - ext.width, y);
> -		cairo_show_text(cr, timer_str);
> -		y -= ext.height + edge_gap;
> +		y = draw_text_right(cr, font_size / 2.0, x, y, timer_str );

Somehow there is a space before last ')', s/ timer_str )/timer_str)/
>  
>  		/* Draw HDCP status above timer */
> -		cairo_set_font_size(cr, font_size);
> -		cairo_text_extents(cr, hdcp_str, &ext);
> -		cairo_move_to(cr, x - ext.width, y);
> -		cairo_show_text(cr, hdcp_str);
> -		y -= ext.height + edge_gap;
> +		y = draw_text_right(cr, font_size, x, y, hdcp_str );

Same here for 'hdcp_str )'

With above fixed
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil


>  
>  		cairo_destroy(cr);
>  
> -- 
> 2.43.0
> 
