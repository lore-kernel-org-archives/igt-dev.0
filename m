Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E53F4BB7F
	for <igt-dev@archiver.kernel.org>; Tue, 24 Feb 2026 19:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C5510E0A2;
	Tue, 24 Feb 2026 19:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wbt+xT+E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D322510E0A2
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Feb 2026 19:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771961448; x=1803497448;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/QOir+pZG+F9uwj5rzKZpYXSkjRUL+sL1X7+TCvoV/w=;
 b=Wbt+xT+EKUXRqHmusTN9bNp2yBB0jB3SZzjbkyz1VDW9NE9z9LCRhc8X
 BQZeTVvOSze82+Eax8Wt381hNktd+YpQ1D+cH9wYiKOfP9yd5/Tkgw4z6
 IElDf4qxn05GQggeVOhOlplR2srwd9PmxFMEtx+DbP9zvDXgiY7Q25Pd7
 DIWxl5kq0aJPemleEyqx6UfGARKzAQBtNzp7peaOQyzoSv67BAFzozxQ1
 Eii0TLRpxkvxhk9gMt+W2UPT3VDUaI3KCZLgfI0aiytjfzqF4IYDsS7wL
 TXxjPdI5L0hHTMfFzJ/A770qY34UoTXUKpKSQxy5ftPUzHUrl2Vao3YWx Q==;
X-CSE-ConnectionGUID: DJXD1zXdSumuNJ83n3F6+w==
X-CSE-MsgGUID: KxLBeQfMQiSxWblvq/x/Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="84355072"
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="84355072"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 11:30:48 -0800
X-CSE-ConnectionGUID: CWRV4KrgSXyB0+eSs1pIZg==
X-CSE-MsgGUID: RZ5U9QTfSsODN4KA6/I2uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,309,1763452800"; d="scan'208";a="215103603"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 11:30:47 -0800
Date: Tue, 24 Feb 2026 20:30:44 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
Message-ID: <20260224193044.vf5aauujilkcyth3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-2-John.Harrison@Igalia.com>
 <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <852e3018-2ba2-4687-9794-49291636472d@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <852e3018-2ba2-4687-9794-49291636472d@Igalia.com>
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
On 2026-02-17 at 08:58:01 -0800, John Harrison wrote:
> On 2/16/26 19:00, Kandpal, Suraj wrote:
> > > Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
> > > 
> > > The 'video player' showed what the requested HDCP mode was but not the
> > > actual status. The menu system does redraw the screen with a special colour to
> > > denote the status, but that is immediately overwritten by the player thread. So
> > > all you get is a very brief full screen flicker (to be fixed in next patch).
> > So we do not want to refer to the next "patch" just mention what this patch is doing.
> > Also do not call it a "patch" since once it gets merged it becomes a commit.
> But this patch is part of a series and a series of tightly related patches
> has always explained what is happening as a whole. Otherwise, you
> effectively have this patch/commit saying "this is totally broken and I'm
> not doing anything about it".
> 
> > 
> > > Instead, add the current HDCP status as an extra text line of the video player's
> > > output so it is permanently visible and clear.
> > > 
> > > Also, move the enable of HDCP inside the mutex lock with the internal state
> > > change. That way, the newly added 'enabled/desired'
> > > line does not update in advance of the 'requested' line (due to the video player
> > > thread being asynchronous and managing to turn HDCP on while the menu
> > > thread is waiting on the mutex lock).
> > > v2: Split into two patches (review feedback by Kamil)
> > You can just write (Kamil) here
> > 
> > > CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> > > CC: Suraj Kandpal <suraj.kandpal@intel.com>
> > > Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> > > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >   tools/intel_hdcp.c | 15 +++++++++++++--
> > >   1 file changed, 13 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index cd5d2b6be..8e29c5e32
> > > 100644
> > > --- a/tools/intel_hdcp.c
> > > +++ b/tools/intel_hdcp.c
> > > @@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
> > >   	char timer_str[32];
> > >   	time_t current_time, elapsed;
> > >   	int minutes, seconds;
> > > +	const char *status = NULL;
> > > 
> > >   	data = (data_t *)arg;
> > >   	cur_type = data->hdcp_type;
> > > @@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
> > >   			prev_type = cur_type;
> > >   		}
> > > 
> > > +		status = get_hdcp_status(data, data->selected_connector);
> > > +
> > >   		switch (cur_type) {
> > >   		case HDCP_TYPE_1_4:
> > >   			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
> > > @@ -544,10 +547,18 @@ static void *video_player_thread(void *arg)
> > >   		cairo_show_text(cr, timer_str);
> > > 
> > >   		/* Draw HDCP status above timer */
> > > +		cairo_set_font_size(cr, font_size);
> > > +		cairo_text_extents(cr, status, &ext);
> > > +		x = data->width - ext.width - 20;
> > > +		y = data->height - ext.height - 20;
> > > +
> > > +		cairo_move_to(cr, x, y);
> > > +		cairo_show_text(cr, status);
> > > +
> > >   		cairo_set_font_size(cr, font_size);
> > >   		cairo_text_extents(cr, hdcp_str, &ext);
> > >   		x = data->width - ext.width - 20;
> > > -		y = data->height - ext.height - 60;
> > > +		y = data->height - ext.height - 120;
> > > 
> > >   		cairo_move_to(cr, x, y);
> > >   		cairo_show_text(cr, hdcp_str);
> > > @@ -605,8 +616,8 @@ static void stop_video_player(data_t *data)
> > > 
> > >   static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
> > > -		set_hdcp_prop(data, CP_DESIRED, type, data-
> > > > selected_connector);
> > >   		pthread_mutex_lock(&data->lock);
> > > +		set_hdcp_prop(data, CP_DESIRED, type, data-
> > > > selected_connector);
> > Move this change into its own patch logically a different change
> But it is not a logically different change. As per the commit description,
> the only reason for making this change is because the video thread is now
> displaying the HDCP status. Without the display of the status, it does not
> matter that the change occurs asynchronously to that display (because there
> is nothing for it to be asynchronous to). So splitting this out into a later
> patch means this patch would be introducing a bug and the follow up patch

Would it help if this change will be the first one in a series?

If yes, then it should go first as a fix. If not, if this one
change do not help in anything then imho it should stay in this
one bigger change.

Regards,
Kamil

> would need a 'Fixes' tag. Which is just pointless for the sake of a one line
> delta. Or it could be a prior patch but then it would need to say 'doing
> this thing that is pointless now but is required by a future patch' and you
> have already said you don't like descriptions referring to future changes.
> 
> John.
> 
> > 
> > Regards,
> > Suraj Kandpal
> > 
> > >   		data->hdcp_type = type;
> > >   		data->video_start_time = time(NULL);
> > >   		pthread_mutex_unlock(&data->lock);
> > > --
> > > 2.43.0
> 
