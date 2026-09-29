Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25573CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 10:26:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CB410E3A8;
	Tue, 29 Sep 2026 10:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iK8INKzl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAF410E9C5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790677548; x=1822213548;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OLinIfqyoQvxJRZs/Z8Crczq7OuBaQ+hndF+HXfzBX8=;
 b=iK8INKzlgS66UuV1wYaHIST+uZ+Pi76Xwm+NaRcnB1Pjw+vqZ4UufGh6
 km0YtmFZOvgjHSSuPREkwOCTfNYb/+TUeYhCOS5fT+7dOZ49Le+LamIMl
 8X9LHHZVgsaphp79Y+3jmzJ2wuAchM7Rhr1HuwWY3XsLJbmIR2PxoKVGV
 oiwlvjALOWpSZ/h5wgDBxY24jNWVtWhzR6JGFJ1y+ix6B8B83tClmMbyE
 RMfyOy3/1yrxsHu/b9Du++HuGMfGo+9VUZSdiUQKMWt4r/vBlT1RXOr+B
 Ewt7DhuaobZ2lXorG56WUNYZPJ5w//HqUt3si+N2MizDAeyutsCjiCDXM A==;
X-CSE-ConnectionGUID: fCAqJpAIQKGjrnMHqTAKqA==
X-CSE-MsgGUID: Ci6cM0rtT7iemUw6nzIIUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90435836"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="90435836"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 03:25:47 -0700
X-CSE-ConnectionGUID: 7QwWLjaUSkixMgSbCqW+yA==
X-CSE-MsgGUID: uA6M+td4QJCQ0cXF8ipa0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="273121480"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 03:25:46 -0700
Date: Tue, 29 Sep 2026 12:25:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>,
 igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com, Alex.Hung@amd.com
Subject: Re: [PATCH] tests/kms_atomic: skip missing CRTC props in state
 snapshot
Message-ID: <20260929102542.y23ihtimz2xhjdfh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 igt-dev@lists.freedesktop.org, Harry.Wentland@amd.com,
 Alex.Hung@amd.com
References: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
 <21199785-0140-4433-add2-5df33d7eca55@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <21199785-0140-4433-add2-5df33d7eca55@intel.com>
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

Hi Sharma,,
On 2026-09-25 at 17:54:17 +0530, Sharma, Swati2 wrote:
> Hi
> 
> Patch LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> 
> On 23-09-2026 08:51 pm, Aurabindo Pillai wrote:
> > crtc_get_current_state() always calls igt_crtc_get_prop() for
> > BACKGROUND_COLOR after 10fc80949. Drivers that do not advertise that
> > property (amdgpu) fail igt_crtc_has_prop during atomic_setup, so the
> > entire kms_atomic suite dies on the first connected CRTC.
> > 
> > Only snapshot properties the CRTC actually has; igt_crtc_reset() already
> > guards the BACKGROUND_COLOR default the same way.
> > 
> > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

Applied, thanks!

Regards,
Kamil

> > ---
> >   tests/kms_atomic.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> > index 09b7915af..20bb80182 100644
> > --- a/tests/kms_atomic.c
> > +++ b/tests/kms_atomic.c
> > @@ -230,7 +230,7 @@ static void crtc_get_current_state(igt_crtc_t *crtc, uint64_t *values)
> >   	int i;
> >   	for (i = 0; i < IGT_NUM_CRTC_PROPS; i++) {
> > -		if (crtc_filter(i)) {
> > +		if (crtc_filter(i) || !igt_crtc_has_prop(crtc, i)) {
> >   			values[i] = 0;
> >   			continue;
> >   		}
