Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF35C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 16:24:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35AF10E614;
	Tue,  1 Apr 2025 16:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dRYHDSKF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A6910E614
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743524687; x=1775060687;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/9+5mlUj1hcG6Va2FIoobF21nmAByueFLSvZPoW9E9U=;
 b=dRYHDSKFuz4Agc/gus+F55GjOQTND5Mb0rldWwwoBRUGdX9+4X0SKNf0
 kcOxELeRiHr1QrbAdL/57j957i7ZOqC6PIw7O4lcGvI8oxOuisxeR2mbQ
 Qjtm7i/3+WdmsUEyZiWxLDZMECndPQVSU0J12ABUhdtHtYF1EFNAQlsS8
 gQE3B5yoZNIZWqqq51CaXA+lfJQxTNrTycwQlPuDYj6RgSVQvOYEobt0K
 a2y429IJ5qwfcFkF9W6h8GOWXtYYh8uUONXY0zG1IPowEnAqu+b6yKwlh
 3nif8o8wVmGUAPSfzA2UA9LLcXXGyTzn4bNZKIx+kc+3T9kRhWoQrBSym w==;
X-CSE-ConnectionGUID: 4LWUy5v1R4uXhR/U75LdyA==
X-CSE-MsgGUID: moTcpBkOT626jmT0q4G1RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="55517833"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="55517833"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 09:24:47 -0700
X-CSE-ConnectionGUID: N9X0i9OnTPC3Y4OQAT3BjQ==
X-CSE-MsgGUID: dIfFv5+zSuS34es0cYoTNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131632871"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 01 Apr 2025 09:24:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Apr 2025 19:24:43 +0300
Date: Tue, 1 Apr 2025 19:24:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_flip: Add flip-vs-dpms-on-nop subtest
Message-ID: <Z-wTSwYb5mg1R1Qp@intel.com>
References: <20250228194240.20023-1-ville.syrjala@linux.intel.com>
 <79f7f21b-cbc4-46c4-ab61-c214a6169f95@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79f7f21b-cbc4-46c4-ab61-c214a6169f95@intel.com>
X-Patchwork-Hint: comment
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

On Tue, Apr 01, 2025 at 01:44:16PM +0530, Sharma, Swati2 wrote:
> Hi Ville,
> 
> Since this test is failing across all platforms.
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12687/shards-all.html?testfilter=lip-vs-dpms-on-nop
> If this is expected beh, do we need to modify IGT to handle this 
> negative scenario.

It won't fail anymore since the kernel fix is in already.

> 
> On 01-03-2025 01:12 am, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> > Verify that redundant DPMS ON requests don't result in
> > actual commits (and thus frame drops). This behaviour
> > is guaranteed by the kernel for atomic drivers.
> >
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > ---
> >   tests/kms_flip.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > index 3ad4d0afb1f6..59740aca25bd 100755
> > --- a/tests/kms_flip.c
> > +++ b/tests/kms_flip.c
> > @@ -176,6 +176,7 @@
> >    * @single-buffer-flip-vs-dpms-off-vs-modeset: pageflip of same buffer along with
> >    *                                             the modeset and dpms off
> >    * @dpms-vs-vblank-race:                       vblank along with the dpms & modeset
> > + * @flip-vs-dpms-on-nop:                       pageflip and issue nop DPMS ON
> >    */
> >   
> >   /**
> > @@ -240,6 +241,7 @@
> >    */
> >   
> >   #define TEST_DPMS		(1 << 0)
> > +#define TEST_DPMS_ON_NOP	(1 << 1)
> >   
> >   #define TEST_PAN		(1 << 3)
> >   #define TEST_MODESET		(1 << 4)
> > @@ -957,7 +959,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
> >   	if (o->flags & TEST_MODESET)
> >   		igt_assert(set_mode(o, o->fb_ids[o->current_fb_id], 0, 0) == 0);
> >   
> > -	if (o->flags & TEST_DPMS)
> > +	if (o->flags & (TEST_DPMS | TEST_DPMS_ON_NOP))
> >   		set_dpms(o, DRM_MODE_DPMS_ON);
> >   
> >   	if (o->flags & TEST_VBLANK_RACE) {
> > @@ -2020,6 +2022,7 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
> >   			"plain-flip-fb-recreate" },
> >   		{ 30, TEST_FLIP | TEST_RMFB | TEST_MODESET , "flip-vs-rmfb" },
> >   		{ 2, TEST_FLIP | TEST_DPMS | TEST_EINVAL | TEST_BASIC, "flip-vs-dpms" },
> > +		{ 2, TEST_FLIP | TEST_DPMS_ON_NOP | TEST_CHECK_TS, "flip-vs-dpms-on-nop" },
> >   		{ 30,  TEST_FLIP | TEST_PAN, "flip-vs-panning" },
> >   		{ 2, TEST_FLIP | TEST_MODESET | TEST_EINVAL | TEST_BASIC, "flip-vs-modeset" },
> >   		{ 30,  TEST_FLIP | TEST_VBLANK_EXPIRED_SEQ,

-- 
Ville Syrjälä
Intel
