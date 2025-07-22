Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE81CC83F1A
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 12:00:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB1E710E699;
	Tue, 22 Jul 2025 12:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2GoFCPI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 295F510E66D;
 Tue, 22 Jul 2025 12:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753185602; x=1784721602;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=ufOezXHXtOJ34HFgYnbPoAaCoPKq+Uj8mU7Sr6BAkUQ=;
 b=Z2GoFCPIhg1xFhkO3X2m4HV08KcxWB3Yooq5yEA96xYsofLMDOn92gD0
 RXwUZES5VerUmTlebF+qJ6x29AfUknjkr3gAMHFPNjDIykFo6hFJ4dPjU
 +e8Fz/Clry2ArrQLqOrsYyDLloDgS11hrDe6EyXn9mIHXgA0o76E5TgGF
 957YT+4Ef5ReH/Ga0GTDtvZFxVI9RQsEKtzXF+hm4es0fiFlhRvt82jPB
 m5WVZRjMTWXwrorPRf5qv3usi1zfxzz/Fcp4aUJJ5MfFD2owxe51+G7zz
 gK5pgeDd3YepU7gV2V1QNHnQMHbnNBlZNBeCn7sWrI0ncNnr0VKKcmZ/U w==;
X-CSE-ConnectionGUID: g5wf7fh8S/qPSzDvcyQ90w==
X-CSE-MsgGUID: cjNSBCPrQC20/LqDgnMVFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55388289"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55388289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:00:02 -0700
X-CSE-ConnectionGUID: 1D3dIclxRf2CUVwN5hqjcQ==
X-CSE-MsgGUID: u9ZXzak1SBGVr8K4VKb8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163408623"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:00:00 -0700
Date: Tue, 22 Jul 2025 14:59:57 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/xe_pm: Introduce i2c subtests (rev2)
Message-ID: <aH99Papp_cjO-UYg@black.fi.intel.com>
References: <20250719163101.3459754-1-raag.jadav@intel.com>
 <175294699428.175185.13892093276989169041@1538d3639d33>
 <aH9MWwlXdS2DnrbU@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aH9MWwlXdS2DnrbU@black.fi.intel.com>
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

Cc: ci-infra

On Tue, Jul 22, 2025 at 11:31:26AM +0300, Raag Jadav wrote:
> On Sat, Jul 19, 2025 at 05:43:14PM +0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: tests/intel/xe_pm: Introduce i2c subtests (rev2)
> > URL   : https://patchwork.freedesktop.org/series/146610/
> > State : failure
> > 
> > == Summary ==
> > 
> > CI Bug Log - changes from XEIGT_8468_BAT -> XEIGTPW_13497_BAT
> > ====================================================
> > 
> > Summary
> > -------
> > 
> >   **SUCCESS**
> 
> Is success considered a failure? Or am I missing anything here?
> Please re-report with correct results.
> 
> Raag
> 
> > 
> >   No regressions found.
> > 
> >   
> > 
> > Participating hosts (7 -> 7)
> > ------------------------------
> > 
> >   No changes in participating hosts
> > 
> > Known issues
> > ------------
> > 
> >   Here are the changes found in XEIGTPW_13497_BAT that come from known issues:
> > 
> > ### IGT changes ###
> > 
> > #### Possible fixes ####
> > 
> >   * igt@kms_flip@basic-plain-flip:
> >     - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
> >    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8468/bat-adlp-7/igt@kms_flip@basic-plain-flip.html
> >    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13497/bat-adlp-7/igt@kms_flip@basic-plain-flip.html
> > 
> >   
> >   [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
> > 
> > 
> > Build changes
> > -------------
> > 
> >   * IGT: IGT_8468 -> IGTPW_13497
> >   * Linux: xe-3440-338efc39ef3f17f6759817c857a95054334eae09 -> xe-3441-a8e61e615995f6bc93361cf1752563140349517a
> > 
> >   IGTPW_13497: 13497
> >   IGT_8468: 8468
> >   xe-3440-338efc39ef3f17f6759817c857a95054334eae09: 338efc39ef3f17f6759817c857a95054334eae09
> >   xe-3441-a8e61e615995f6bc93361cf1752563140349517a: a8e61e615995f6bc93361cf1752563140349517a
> > 
> > == Logs ==
> > 
> > For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13499/index.html
