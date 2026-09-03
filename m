Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB8FC624A4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 11:32:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD97110F52C;
	Thu,  3 Sep 2026 11:32:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRwzs5hZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4EE10F527
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 11:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788435120; x=1819971120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dJwP2VtxDa0o7AVlLMHP7Tv6x5WCMQXW0KF0ca9hN94=;
 b=GRwzs5hZO4mNUPH3AYcDlJ5uIOYQhbbZ9njFuYbqWW3Oro6hs0bsNfNv
 YsZZcFzjigddCw2lDQbaP5M5oI3bHsYB/VQCS3trkdl2H8QguGszmEwQB
 JKJ00nsjhXxis4MkSgUDyJujmqThESlBXcSNp0PJIf71pKdFX9xrBKxsH
 0RX4yiDS1Big5NBBs+FG5soEVVzai0I/+gg5/JK4GRpFS2Ng8A7we47QK
 psYtwZPrF2GTAbS61XUrQgecYMVwSMzdPmJt5A/J4fRUwG4WRZpT7IkFg
 4AKTdSx7tqDoqprSHikdV09mVY1bdLo9/TkE84q/DIT3fTjCR4SAohXqp g==;
X-CSE-ConnectionGUID: V0yLtA0LSR+iHb6dEuPmLA==
X-CSE-MsgGUID: wxevVsmSSG+h9LSfJqiagg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100429133"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="100429133"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 04:32:00 -0700
X-CSE-ConnectionGUID: O0jZKUYYRjecqpb0R0jfwA==
X-CSE-MsgGUID: m3CTubq3T22at4lyY3wjTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; d="scan'208";a="273212891"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:31:59 -0700
Date: Thu, 3 Sep 2026 13:31:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_joiner_helper: iterate CRTCs
 instead of pipes
Message-ID: <20260903113141.qlhdnayz65uhfmik@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org,
 ville.syrjala@linux.intel.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <cover.1788252273.git.jani.nikula@intel.com>
 <a9a1b7c524e682ec6e1a8a7dd12534f661ac598a.1788252273.git.jani.nikula@intel.com>
 <20260902144516.2zpativ7ii32zsdv@kamilkon-DESK.igk.intel.com>
 <0b75f984893404cd108db3e21001242e7e107d64@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b75f984893404cd108db3e21001242e7e107d64@intel.com>
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

Hi Jani,
On 2026-09-03 at 00:40:54 +0300, Jani Nikula wrote:
> On Wed, 02 Sep 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> > Hi Jani,
> > On 2026-09-01 at 11:46:38 +0300, Jani Nikula wrote:
> >> Reduce the direct pipe usage.
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  tests/intel/kms_joiner_helper.c | 11 ++++++-----
> >>  1 file changed, 6 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
> >> index da0ac7f624f3..5bacf6cb9e27 100644
> >> --- a/tests/intel/kms_joiner_helper.c
> >> +++ b/tests/intel/kms_joiner_helper.c
> >> @@ -101,13 +101,14 @@ static enum pipe get_next_master_pipe(uint32_t pipe_mask)
> >>   */
> >>  void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
> >>  {
> >> -	enum pipe pipe;
> >> +	igt_crtc_t *crtc;
> >>  
> >>  	*master_pipes = 0;
> >> -	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
> >> -		if (igt_crtc_for_pipe(display, pipe) && igt_crtc_for_pipe(display, pipe + 1)) {
> >> -			*master_pipes |= BIT(pipe);
> >> -			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
> >> +
> >> +	for_each_crtc(display, crtc) {
> >> +		if (igt_crtc_for_pipe(display, crtc->pipe + 1)) {
> >
> > I am not sure here as this is not 1:1, original code has two
> > conditions. +cc Swati and Karthik.
> 
> The original had igt_crtc_for_pipe(display, pipe) to ensure there's a
> valid CRTC for that pipe, but for_each_crtc() iterates valid CRTCs
> only. Only need to check pipe + 1.

You are right, LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> 
> BR,
> Jani.
> 
> >
> >
> > Regards,
> > Kamil
> >
> >> +			*master_pipes |= BIT(crtc->pipe);
> >> +			igt_info("Found master pipe %s\n", igt_crtc_name(crtc));
> >>  		}
> >>  	}
> >>  }
> >> -- 
> >> 2.47.3
> >> 
> 
> -- 
> Jani Nikula, Intel
