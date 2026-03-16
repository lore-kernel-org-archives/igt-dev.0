Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EABF53D8B
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 19:06:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F8C10E023;
	Mon, 16 Mar 2026 19:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JzM9XTW0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E0710E023
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 19:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773687964; x=1805223964;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=jivhOkqxRxy8T5XaaxWhJDcr0K388dQYOroo2SNPw0I=;
 b=JzM9XTW0MvJFXFBmqYeqOxXNv16UjP3MFhwqQklSHVO7Or0gy2ZRlM5P
 z+IN2bE4z1T3M8QTcqa+ukS0nNXz3shQNlW4/LC+uw6uS3f4836jwYnjD
 fLc9d+DMCSzP/73CO2MmTLxUseR/jMTK9cwTwP2EM4PugH+xcMdud8RnE
 WTOMJYA3bCFyPbXJ0oDy7Uf87oj7IiNuOvPOdP8p2u2BoDj4Gs6u4mrNY
 j/k21ADwmiUr5etjG4a0dCAsKYl08EY4UbPFSSI/TPz4HjEERmZIR7RNX
 zX+/VS3Xf7D7Ue1ujiAWFGiSmEswR4xRHGFd9iiwvRvVRwAoVHFqQzLDe A==;
X-CSE-ConnectionGUID: BpV7HKIzTu+N2wJVVAdkUQ==
X-CSE-MsgGUID: wg+7oBu/SvCqyRd5I+b9Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74829689"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74829689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 12:06:04 -0700
X-CSE-ConnectionGUID: xNW1+b85QFOAGksNeuL34g==
X-CSE-MsgGUID: ffbbNGKmRKm7YOcnWNfjpA==
X-ExtLoop1: 1
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 12:06:02 -0700
Date: Mon, 16 Mar 2026 20:06:00 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: John Harrison <John.Harrison@Igalia.com>
Cc: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
Message-ID: <20260316190600.52rtxdxekh5dh6iw@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-2-John.Harrison@Igalia.com>
 <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <852e3018-2ba2-4687-9794-49291636472d@Igalia.com>
 <20260224193044.vf5aauujilkcyth3@kamilkon-DESK.igk.intel.com>
 <8466ebfe-5d07-4330-b87f-d6757a65fadb@Igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8466ebfe-5d07-4330-b87f-d6757a65fadb@Igalia.com>
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
On 2026-02-24 at 14:31:51 -0800, John Harrison wrote:
> On 2/24/26 11:30, Kamil Konieczny wrote:
> > Hi John,
> > On 2026-02-17 at 08:58:01 -0800, John Harrison wrote:
> > > On 2/16/26 19:00, Kandpal, Suraj wrote:
> > > > > Subject: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
> > > > > 
> > > > > The 'video player' showed what the requested HDCP mode was but not the
> > > > > actual status. The menu system does redraw the screen with a special colour to
> > > > > denote the status, but that is immediately overwritten by the player thread. So
> > > > > all you get is a very brief full screen flicker (to be fixed in next patch).
> > > > So we do not want to refer to the next "patch" just mention what this patch is doing.
> > > > Also do not call it a "patch" since once it gets merged it becomes a commit.
> > > But this patch is part of a series and a series of tightly related patches
> > > has always explained what is happening as a whole. Otherwise, you
> > > effectively have this patch/commit saying "this is totally broken and I'm
> > > not doing anything about it".
> > > 
> > > > > Instead, add the current HDCP status as an extra text line of the video player's
> > > > > output so it is permanently visible and clear.
> > > > > 
> > > > > Also, move the enable of HDCP inside the mutex lock with the internal state
> > > > > change. That way, the newly added 'enabled/desired'
> > > > > line does not update in advance of the 'requested' line (due to the video player
> > > > > thread being asynchronous and managing to turn HDCP on while the menu
> > > > > thread is waiting on the mutex lock).
> > > > > v2: Split into two patches (review feedback by Kamil)
> > > > You can just write (Kamil) here
> > > > 
> > > > > CC: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> > > > > CC: Suraj Kandpal <suraj.kandpal@intel.com>
> > > > > Signed-off-by: John Harrison <John.Harrison@Igalia.com>
> > > > > Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > > > ---
> > > > >    tools/intel_hdcp.c | 15 +++++++++++++--
> > > > >    1 file changed, 13 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index cd5d2b6be..8e29c5e32
> > > > > 100644
> > > > > --- a/tools/intel_hdcp.c
> > > > > +++ b/tools/intel_hdcp.c
> > > > > @@ -482,6 +482,7 @@ static void *video_player_thread(void *arg)
> > > > >    	char timer_str[32];
> > > > >    	time_t current_time, elapsed;
> > > > >    	int minutes, seconds;
> > > > > +	const char *status = NULL;
> > > > > 
> > > > >    	data = (data_t *)arg;
> > > > >    	cur_type = data->hdcp_type;
> > > > > @@ -502,6 +503,8 @@ static void *video_player_thread(void *arg)
> > > > >    			prev_type = cur_type;
> > > > >    		}
> > > > > 
> > > > > +		status = get_hdcp_status(data, data->selected_connector);
> > > > > +
> > > > >    		switch (cur_type) {
> > > > >    		case HDCP_TYPE_1_4:
> > > > >    			bg_r = 0.0; bg_g = 0.7; bg_b = 0.0;
> > > > > @@ -544,10 +547,18 @@ static void *video_player_thread(void *arg)
> > > > >    		cairo_show_text(cr, timer_str);
> > > > > 
> > > > >    		/* Draw HDCP status above timer */
> > > > > +		cairo_set_font_size(cr, font_size);
> > > > > +		cairo_text_extents(cr, status, &ext);
> > > > > +		x = data->width - ext.width - 20;
> > > > > +		y = data->height - ext.height - 20;
> > > > > +
> > > > > +		cairo_move_to(cr, x, y);
> > > > > +		cairo_show_text(cr, status);
> > > > > +
> > > > >    		cairo_set_font_size(cr, font_size);
> > > > >    		cairo_text_extents(cr, hdcp_str, &ext);
> > > > >    		x = data->width - ext.width - 20;
> > > > > -		y = data->height - ext.height - 60;
> > > > > +		y = data->height - ext.height - 120;
> > > > > 
> > > > >    		cairo_move_to(cr, x, y);
> > > > >    		cairo_show_text(cr, hdcp_str);
> > > > > @@ -605,8 +616,8 @@ static void stop_video_player(data_t *data)
> > > > > 
> > > > >    static void enable_hdcp_type(data_t *data, enum hdcp_type type)  {
> > > > > -		set_hdcp_prop(data, CP_DESIRED, type, data-
> > > > > > selected_connector);
> > > > >    		pthread_mutex_lock(&data->lock);
> > > > > +		set_hdcp_prop(data, CP_DESIRED, type, data-
> > > > > > selected_connector);
> > > > Move this change into its own patch logically a different change
> > > But it is not a logically different change. As per the commit description,
> > > the only reason for making this change is because the video thread is now
> > > displaying the HDCP status. Without the display of the status, it does not
> > > matter that the change occurs asynchronously to that display (because there
> > > is nothing for it to be asynchronous to). So splitting this out into a later
> > > patch means this patch would be introducing a bug and the follow up patch
> > Would it help if this change will be the first one in a series?
> > 
> > If yes, then it should go first as a fix. If not, if this one
> > change do not help in anything then imho it should stay in this
> > one bigger change.
> That's the thing, there is no reason for the set_hdcp_prop call to be inside
> the mutex lock without adding the display of the HDCP status to the video
> thread. Hence the reason it was previously not inside the lock.
> 
> The lock is protecting the display thread. If the display thread does not
> show HDCP status then changing the status asynchronously to that thread is
> totally fine. But with the changes in this patch to add the status to the
> display thread, having an asynchronous update does cause 'flickering' of the
> display - the 'active' line changes before the 'requested' line does.
> 
> You could move the re-order into it's own private patch. But given that it
> is always best to do the least amount of work inside a lock, that patch
> would have to have a description of 'moving this because of changes coming
> in the next commit'. Which is not ideal. Hence I think it is better kept
> together with the rest of this patch.
> 
> Thanks,
> John.

Sound reasonable. Suraj could you please ack or review this series?
Does it improve this tool and works as intended?

Thanks in advance!

Regards,
Kamil

> 
> > 
> > Regards,
> > Kamil
> > 
> > > would need a 'Fixes' tag. Which is just pointless for the sake of a one line
> > > delta. Or it could be a prior patch but then it would need to say 'doing
> > > this thing that is pointless now but is required by a future patch' and you
> > > have already said you don't like descriptions referring to future changes.
> > > 
> > > John.
> > > 
> > > > Regards,
> > > > Suraj Kandpal
> > > > 
> > > > >    		data->hdcp_type = type;
> > > > >    		data->video_start_time = time(NULL);
> > > > >    		pthread_mutex_unlock(&data->lock);
> > > > > --
> > > > > 2.43.0
> 
