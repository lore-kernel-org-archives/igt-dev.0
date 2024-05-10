Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D29C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 06:17:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6264D10E221;
	Fri, 10 May 2024 06:17:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GF7zKJBf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543AC10E435;
 Fri, 10 May 2024 06:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715321879; x=1746857879;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=M/4QTsdh6vstPyglgZ3K9Hb2F2q9L359OP5Xfms5Zo4=;
 b=GF7zKJBf+AkVRMSxhrN5JyV+6OjmKfncOLkF5S+rxMrkB7fH2zbTms9O
 F2ZAuI2Vj/fkPfKER2mDGUVUZ9mzbOUsdcKAJudzj3WDqnTSmnao7I/Tn
 AvH/vDP3lanmHCw1hBkj1V6GYafDOJt27rW1fT2MN39gmtyECG3/4+UEK
 MhPnEEptS6Ykpl1iuje9u56B1HtxedigZYIw8yzZK4ZjykXbiBC5/JCfl
 LpawZDpLRb26o6kY9ABbA/sDw+zhB5sZ1GKjtU0IJYOu1APpWpf7fS/2K
 kU7tGeu+8PM0KP/6AJch5RDx+ze2cFByiZesxAAG4WSKIHLkgcRF0fjEg Q==;
X-CSE-ConnectionGUID: CGY1+vD3Q0KsKJgJ4zhtFw==
X-CSE-MsgGUID: ckhxvYcMRtSqIbkysU3y5w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="33797823"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="33797823"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 23:17:58 -0700
X-CSE-ConnectionGUID: 14A8OvJkRNmb2w+DOOg1nw==
X-CSE-MsgGUID: pxy1u70xSNaGuTC2UB5mMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="60355432"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.164])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 23:17:56 -0700
Date: Fri, 10 May 2024 08:17:53 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for Add
 render-copy compression on Xe+ (rev5)
Message-ID: <20240510061753.neso625uvj7ounmo@zkempczy-mobl2>
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <171524063798.2037450.724462476881894746@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171524063798.2037450.724462476881894746@8e613ede5ea5>
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

On Thu, May 09, 2024 at 07:43:57AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Add render-copy compression on Xe+ (rev5)                       
>    URL:     https://patchwork.freedesktop.org/series/132902/                
>    State:   failure                                                         
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11117/index.html 
> 
>              CI Bug Log - changes from CI_DRM_14737 -> IGTPW_11117
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_11117 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_11117, please notify your bug team
>    ('I915-ci-infra@lists.freedesktop.org') to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11117/index.html
> 
> Participating hosts (42 -> 41)
> 
>    Additional (3): fi-glk-j4005 bat-dg2-11 bat-mtlp-6
>    Missing (4): fi-kbl-8809g fi-cfl-8109u fi-snb-2520m bat-adlp-6
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_11117:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@dmabuf@all-tests:
>           * bat-jsl-3: NOTRUN -> INCOMPLETE

Unrelated to the change.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_11117 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@debugfs_test@basic-hwmon:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9318)
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#9318)
>      * igt@fbdev@info:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#1849 / i915#2582)
>      * igt@fbdev@write:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#2582) +3 other tests skip
>      * igt@gem_huc_copy@huc-copy:
> 
>           * fi-glk-j4005: NOTRUN -> SKIP (i915#2190)
>      * igt@gem_lmem_swapping@parallel-random-engines:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10213) +3 other tests skip
>           * fi-glk-j4005: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_lmem_swapping@verify-random:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#4613) +3 other tests skip
>      * igt@gem_mmap@basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4083)
>           * bat-arls-3: NOTRUN -> SKIP (i915#4083)
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#4083)
>      * igt@gem_render_tiled_blits@basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4079) +1 other test skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10197 / i915#10211 / i915#4079)
>      * igt@gem_tiled_blits@basic:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10196 / i915#4077) +2 other
>             tests skip
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@gem_tiled_fence_blits@basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4077) +2 other tests skip
>      * igt@gem_tiled_pread_basic:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#4079) +1 other test skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10206 / i915#4079)
>      * igt@i915_pm_rps@basic-api:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#6621)
>           * bat-arls-3: NOTRUN -> SKIP (i915#10209)
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#6621)
>      * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#4212 / i915#9792) +8 other tests
>             skip
>      * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4212) +7 other tests skip
>      * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#5190 / i915#9792)
>           * bat-dg2-11: NOTRUN -> SKIP (i915#5190)
>      * igt@kms_addfb_basic@basic-y-tiled-legacy:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10200) +9 other tests skip
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4215 / i915#5190)
>      * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#4103 / i915#4213) +1 other test
>             skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10202) +1 other test skip
>      * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#9792) +17 other tests skip
>      * igt@kms_dsc@dsc-basic:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3555 / i915#3840)
>           * bat-arls-3: NOTRUN -> SKIP (i915#9886)
>      * igt@kms_flip@basic-flip-vs-dpms:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#3637 / i915#9792) +3 other tests
>             skip
>      * igt@kms_force_connector_basic@force-load-detect:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10207)
>           * bat-dg2-11: NOTRUN -> SKIP
>      * igt@kms_force_connector_basic@prune-stale-modes:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#5274 / i915#9792)
>           * bat-dg2-11: NOTRUN -> SKIP (i915#5274)
>      * igt@kms_frontbuffer_tracking@basic:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#4342 / i915#5354 / i915#9792)
>      * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#9197) +3 other tests skip
>      * igt@kms_pm_backlight@basic-brightness:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#5354)
>           * bat-arls-3: NOTRUN -> SKIP (i915#9812)
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#5354 / i915#9792)
>      * igt@kms_psr@psr-cursor-plane-move:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#1072 / i915#9673 / i915#9732 /
>             i915#9792) +3 other tests skip
>      * igt@kms_psr@psr-primary-mmap-gtt:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#9732) +3 other tests skip
>      * igt@kms_psr@psr-primary-page-flip:
> 
>           * fi-glk-j4005: NOTRUN -> SKIP +10 other tests skip
>      * igt@kms_psr@psr-sprite-plane-onoff:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#1072 / i915#9732) +3 other tests
>             skip
>      * igt@kms_setmode@basic-clone-single-crtc:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#3555 / i915#8809 / i915#9792)
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3555)
>           * bat-arls-3: NOTRUN -> SKIP (i915#10208 / i915#8809)
>      * igt@prime_vgem@basic-fence-flip:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3708)
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#3708 / i915#9792)
>      * igt@prime_vgem@basic-fence-mmap:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>      * igt@prime_vgem@basic-fence-read:
> 
>           * bat-arls-3: NOTRUN -> SKIP (i915#10212 / i915#3708)
>      * igt@prime_vgem@basic-gtt:
> 
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3708 / i915#4077) +1 other test
>             skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10196 / i915#3708 / i915#4077)
>             +1 other test skip
>      * igt@prime_vgem@basic-read:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#3708) +1 other test skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10214 / i915#3708)
>      * igt@prime_vgem@basic-write:
> 
>           * bat-mtlp-6: NOTRUN -> SKIP (i915#10216 / i915#3708)
>           * bat-dg2-11: NOTRUN -> SKIP (i915#3291 / i915#3708) +2 other tests
>             skip
>           * bat-arls-3: NOTRUN -> SKIP (i915#10216 / i915#3708)
> 
>     Possible fixes
> 
>      * igt@gem_lmem_swapping@basic@lmem0:
> 
>           * bat-dg2-8: FAIL (i915#10378) -> PASS
>      * igt@i915_module_load@load:
> 
>           * bat-arls-3: ABORT (i915#11041) -> PASS
>      * igt@i915_pm_rpm@module-reload:
> 
>           * {bat-mtlp-9}: CRASH (i915#10911) -> PASS
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_7843 -> IGTPW_11117
> 
>    CI-20190529: 20190529
>    CI_DRM_14737: 92f877dd46245e4a44b6d24b5e303b8c03c40c75 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_11117: 11117
>    IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
