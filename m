Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62735C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 07:02:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D8A10E67B;
	Thu, 18 Apr 2024 07:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EF+xP84t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0D010E67B;
 Thu, 18 Apr 2024 07:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713423754; x=1744959754;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fUe0TUB5LBnFp7Zx+ZvBWVYY0fEJjTiWdzavBOuFnuQ=;
 b=EF+xP84tN1n1tiaPrswzxM83pQCRuWtWKi40dc3LuDfjrXLuAzaUoBqJ
 ShZGi3x5nv0VHY/3/hsnSU7X18WYPal5tmiUpqZTcgqhgSiOVK7biUSJd
 +3fSrxRgURFwaYTUhZGccmoVH2zGQpNz2Nrvg+sIzG7JYI7LADsIYK9NL
 Xox5dEyxc7oCUEEXOSp3hhztCPzsnUW57iguZneK67pOX63rQRs/hQA9W
 mNUnLy6n7/5oZ/V3HjoWDcj6QWywVqTU7lSNJaLfXgNb2Dj1Flr5WSQWV
 0mIbNG4Ir9Wh/XY4B++Rr4VamXoOjTLvmouHvCGESv0ErnNJ9rPf8jV+N Q==;
X-CSE-ConnectionGUID: 3UV1ImF5Qd+p+uSRT38CFw==
X-CSE-MsgGUID: ElShxkwJSKeNucVEtaPyaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26460323"
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="26460323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 00:02:34 -0700
X-CSE-ConnectionGUID: GV3zCx9URXqBB5pT4Ftm/Q==
X-CSE-MsgGUID: Pw/y1i9JQUK7RleEIpsWvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,211,1708416000"; d="scan'208";a="22982544"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.234])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 00:02:32 -0700
Date: Thu, 18 Apr 2024 09:02:29 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMveGVf?=
 =?utf-8?Q?evict|exec=5Fthreads?= =?utf-8?Q?=3A?= Use fd reopen to avoid
 corrupting global data (rev2)
Message-ID: <20240418070229.b27ijfjlnzsik7eg@zkempczy-mobl2>
References: <20240417142607.193339-1-zbigniew.kempczynski@intel.com>
 <171342033048.1484551.4427391781925272219@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171342033048.1484551.4427391781925272219@8e613ede5ea5>
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

On Thu, Apr 18, 2024 at 06:05:30AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  tests/xe_evict|exec_threads: Use fd reopen to avoid corrupting    
>             global data (rev2)                                                
>    URL:     https://patchwork.freedesktop.org/series/132562/                  
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11037/index.html   
> 
>              CI Bug Log - changes from CI_DRM_14598 -> IGTPW_11037
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11037 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11037, please notify your bug team
>    ("I915-ci-infra@lists.freedesktop.org") to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11037/index.html
> 
> Participating hosts (38 -> 34)
> 
>    Additional (2): bat-dg2-11 fi-bsw-n3050
>    Missing (6): bat-mtlp-9 fi-apl-guc fi-snb-2520m bat-jsl-1 bat-arls-2
>    bat-arls-3
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_11037:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@i915_selftest@live@gt_lrc:
>           * bat-adlp-6: PASS -> INCOMPLETE

Change is unrelated, may I ask for continue running the test?

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_11037 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@gem_lmem_swapping@random-engines:
> 
>           * fi-bsw-n3050: NOTRUN -> SKIP +19 other tests skip
>      * igt@gem_mmap@basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_tiled_fence_blits@basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4079) +1 other test skip
>      * igt@i915_pm_rps@basic-api:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#6621)
>      * igt@i915_selftest@live@execlists:
> 
>           * fi-bsw-n3050: NOTRUN -> ABORT (i915#10594)
>      * igt@i915_selftest@live@requests:
> 
>           * bat-dg2-9: PASS -> ABORT (i915#10366)
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4212) +7 other tests skip
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>      * igt@kms_dsc@dsc-basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3555 / i915#3840)
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-dg2-11: NOTRUN -> SKIP
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#5274)
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#5354)
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#1072 / i915#9732) +3 other tests
>             skip
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3555)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3708)
>      * igt@prime_vgem@basic-fence-mmap:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@basic-read:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3291 / i915#3708) +2 other tests
>             skip
> 
>     Possible fixes
> 
>      * igt@i915_selftest@live@objects:
> 
>           * bat-arls-1: DMESG-FAIL (i915#10262) -> PASS +35 other tests pass
>      * igt@i915_selftest@live@sanitycheck:
> 
>           * bat-arls-1: DMESG-WARN (i915#10341) -> PASS
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7811 -> IGTPW_11037
> 
>    CI-20190529: 20190529
>    CI_DRM_14598: a4f566444a645b1ade1b8d948f6e0286136b2cb3 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11037: a6851ac09cdf73891c6ffabac4ac6c1a04324181 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>    IGT_7811: 2d95df5757eb99a42ea9ac30fd74001dee804d03 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
