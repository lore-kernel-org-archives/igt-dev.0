Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D171CCAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 13:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F1110E7E3;
	Thu,  2 Oct 2025 13:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CEWNVVgi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9201210E7E2;
 Thu,  2 Oct 2025 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759410294; x=1790946294;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=71Ymv19X47vi2bVf9VAQ2FMbibucwVwfSWualwgt4+8=;
 b=CEWNVVgi4H8IdvSI7Jg2DdC3zeNF31ogT7dqqFu/L+IYqq4Ub+hMX1RB
 Q/Nr4l+3p+mewTUKZmuXu2JnaiSgS0+AXMdOF8Njjg85LGlgf7U3wnf6c
 Ny6O11zOkyVv3HScf7qeraPTPwN6poPPudwEIAKg3jghZJWGIYMYMys2p
 Qj4GaTb5O/md9fQYq0SZOrvBL76RFQFFBXzqgSvWHJu07/GScr1f4rBNa
 DJBvviIRCKcYLszBxcvmz7FVm6+2THHwhNGF4tLT+YWYt4B/QdfNQyWbW
 p/Kvq+N62TPQWOdgOrNN08EM6/k1DuJd6cbs9wvmIGtu1YqIQ5fFVzih1 A==;
X-CSE-ConnectionGUID: p0xrSs9wQbi9IPzxv6+s9w==
X-CSE-MsgGUID: ojUXclveQ0yjJDbCqpljiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="61794583"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="61794583"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 06:04:53 -0700
X-CSE-ConnectionGUID: SEgbqkwoR6GbLEBTlj44UQ==
X-CSE-MsgGUID: gejfsQ4ZTvikvs0Bcm/GRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="178311454"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 06:04:51 -0700
Date: Thu, 2 Oct 2025 15:04:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>,
	I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_lib=2Fdrm?=
 =?utf-8?Q?test=3A_Allo?= =?utf-8?Q?w?= DRIVER_ANY tests to run on VKMS when
 supported. (rev2)
Message-ID: <20251002130449.5lz6hepqsoopw4zm@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Mark Yacoub <markyacoub@google.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20251001185039.3386207-1-markyacoub@google.com>
 <175936544730.384434.14414929038374061519@1538d3639d33>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175936544730.384434.14414929038374061519@1538d3639d33>
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

Hi igt-dev,
On 2025-10-02 at 00:37:27 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/drmtest: Allow DRIVER_ANY tests to run on VKMS when supported. (rev2)
> URL   : https://patchwork.freedesktop.org/series/155302/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_17294_full -> IGTPW_13853_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13853_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13853_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13853/index.html
> 
> Participating hosts (11 -> 11)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13853_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4:
>     - shard-dg1:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_17294/shard-dg1-18/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13853/shard-dg1-17/igt@kms_flip@wf_vblank-ts-check-interruptible@a-hdmi-a4.html
> 
>   * igt@kms_pm_dc@dc9-dpms:
>     - shard-dg2:          NOTRUN -> [FAIL][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13853/shard-dg2-3/igt@kms_pm_dc@dc9-dpms.html
> 

These are unrelated. No need for re-run.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_13853_full that come from known issues:
> 
> ### IGT changes ###

...cut...

>   [i915#9917]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9917
>   [i915#9934]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9934
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_8568 -> IGTPW_13853
>   * Piglit: piglit_4509 -> None
> 
>   CI-20190529: 20190529
>   CI_DRM_17294: 5f87abb254011980c8332008cfff72d2cfab4952 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_13853: 13853
>   IGT_8568: 8568
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13853/index.html
