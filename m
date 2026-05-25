Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287C5CD5BB1
	for <igt-dev@archiver.kernel.org>; Mon, 25 May 2026 15:55:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1F310E14C;
	Mon, 25 May 2026 15:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSdF+hae";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F69510E3CA
 for <igt-dev@lists.freedesktop.org>; Mon, 25 May 2026 15:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779724484; x=1811260484;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=swPomsfMGJo6GWEtyX1zAtwz7B16bSBN85NSba3+CN4=;
 b=DSdF+haeh6zeUwc7LuZtWfi8hlpaLebsczPEvPTT+aEYKfBX497Klf9a
 zRKOuMCC3bQRu032a0X6KL4dbtyvZ0sQAbrjMUp09dDwDFD4yjivHZq7Z
 6v/4TMpZchN7qX3wdydZforSOgHweyGAftTnxKBHKg2Z9w73KFALs6oP6
 y7opws004oJIOfqBcfQyo0/srfj1CRKxHP1niIEjIUhrhk46cSPUCEBHo
 aQTReVuFcrBcb0jvNoWhmmopxkHJxZ/HtMUitNOznv62D0yho46MD/Y8d
 svHAkKJyNI2m3LZgdTdrc41kwETfh0aZ9sGTW3c7Yzm6/q6/JZYQcw5RX Q==;
X-CSE-ConnectionGUID: vLnxP2MqRVG397ZTMsg7xQ==
X-CSE-MsgGUID: Dysylrh3S1+DjlRLVZcg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="91935933"
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="91935933"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 08:54:44 -0700
X-CSE-ConnectionGUID: TmGFGfDLTVujFtn4fH8CZg==
X-CSE-MsgGUID: TawEPgCrT36PHQqKfWM3rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,168,1774335600"; d="scan'208";a="238610883"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.244.3])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2026 08:54:43 -0700
Date: Mon, 25 May 2026 18:54:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
Message-ID: <ahRwvyhwKp3IRfzW@intel.com>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <aeIo15_JaYs0A_Y7@intel.com>
 <937ff9a3-ff20-400c-a634-d3eb493556d4@intel.com>
 <ahRaIc6kM1hGLZrt@intel.com>
 <40e0df88-b335-4a07-97a5-14a812b32a21@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40e0df88-b335-4a07-97a5-14a812b32a21@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Mon, May 25, 2026 at 08:03:39PM +0530, Thasleem, Mohammed wrote:
> 
> On 25-05-2026 07:48 pm, Ville Syrjälä wrote:
> > On Mon, May 25, 2026 at 07:41:29PM +0530, Thasleem, Mohammed wrote:
> >> On 17-04-2026 06:04 pm, Ville Syrjälä wrote:
> >>> On Fri, Apr 17, 2026 at 02:04:59PM +0530, Mohammed Thasleem wrote:
> >>>> Remove the deep-pkgc subtest as it depends on other display IPs which makes
> >>>> testing unreliable. Current validation uses Package C-state counters that
> >>>> are affected by unrelated system components and requires platform-specific
> >>>> checks that vary across different platforms.
> >>>> A redesigned test with proper display IP isolation will be implemented
> >>>> in a future patch.
> >>> What is the actual plan for that? How would it even be implemented
> >>> and when should we expect to get it?
> >> It's in discussion with hardware design team to come up with hooks for
> >> better validation and tracking.
> > And how are you going to catch regression on current systems?
> The removed deep-pkgc subtest was providing unreliable results due to 
> its dependency on unrelated system components, making it more likely to 
> produce false positives rather than catch actual regressions.

Are you saying the CI setups are unstable enough that we sometimes
reach deep pkgc and sometimes we don't, on the same system? Someone
should fix that so that there isn't random ping pong. Either the
systems have been configured correctly and can reach deep pkgc, or
they have not and never reach those states.

I know it's a real pain to figure out what is preventing the pkgc
states due to lack of good feedback from the SoC level stuff, and
the pmc debugfs stuff is an undocumented mess. But it should still
be possible to get there in most cases.

> And we will test pkg c tests as part of manual validation.

Aren't you removing those tests here? And on which platforms
does this manual testing happen? I also have no idea where the
results of this manual testing are tracked.

I would also like to know which systems in CI can actually
reach deep pkgc states and which can't because that really does
affect how the display hardware works, and might be important
if we eg. get underruns.

> >
> >>>> Mohammed Thasleem (7):
> >>>>     Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
> >>>>       test"
> >>>>     Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
> >>>>     Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
> >>>>     Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
> >>>>       check"
> >>>>     Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
> >>>>       calculation"
> >>>>     Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
> >>>>       sleep state during extended vblank"
> >>>>     tests/intel/kms_pm_dc: Remove unused pkgc functions
> >>>>
> >>>>    tests/intel/kms_pm_dc.c | 98 -----------------------------------------
> >>>>    1 file changed, 98 deletions(-)
> >>>>
> >>>> -- 
> >>>> 2.43.0

-- 
Ville Syrjälä
Intel
