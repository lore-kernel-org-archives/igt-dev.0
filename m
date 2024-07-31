Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD2EC3DA7F
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jul 2024 15:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3C610E657;
	Wed, 31 Jul 2024 15:14:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cP2NoUxq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA8810E656;
 Wed, 31 Jul 2024 15:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722438842; x=1753974842;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=OLJ0DRKc0Z1CSRnw+gUAQaUw8s52hgWQBCX78zI95Hc=;
 b=cP2NoUxqLY7+W/dkybIpiIdEPZ0Ikc2BWRgVJnnzlKogW884OQSImhZm
 0wk7xTc77WdJdup9nF/iC2/d1RbT7SQlusSMstuB5llkTf+ewXjSCZyJ9
 7ev7F3YxWJQPbtpugos6JAO21TniyC39qf57O72EmRrxTHIWkYmsi/kWe
 s/JkX7f6Y5BiFhT1QaUS81AmF99AmBDppsCokpbUDs5aUIYpFwiMYYuUa
 xuV4B9Wp858RO/yqLrcNtCAsGu1Lna1k3jOtI9+aFnIf5uPhMIxoo3MV1
 8HKscgq85siho+uhpRj6t8/Wi5KipwoaB5b/fjTLRppXw/50DOa+sDmCR g==;
X-CSE-ConnectionGUID: OxsRGUlORYeJKwbcq2brUg==
X-CSE-MsgGUID: cSWodhhfQqq51PWvZ7TTKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="30955846"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="30955846"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 08:14:01 -0700
X-CSE-ConnectionGUID: sTb5oZjZTC2OYAjgE6vdDQ==
X-CSE-MsgGUID: tRbxBi7UQgS1hOrIC5bx+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; d="scan'208";a="55306695"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 08:13:58 -0700
Date: Wed, 31 Jul 2024 17:13:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL3hlL3hl?=
 =?utf-8?Q?=5Fquery?= =?utf-8?Q?=3A?= Do not require QUERY_OA_UNITS for all
 Xe tests (rev5)
Message-ID: <20240731151355.ix4lqivxnbbgj4xa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <78c5f531-f482-49c7-8290-38710698e4a7@linux.intel.com>
 <172243508272.468001.18077501123874457966@2413ebb6fbb6>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <172243508272.468001.18077501123874457966@2413ebb6fbb6>
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
On 2024-07-31 at 14:11:22 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/xe/xe_query: Do not require QUERY_OA_UNITS for all Xe tests (rev5)
> URL   : https://patchwork.freedesktop.org/series/136499/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7946 -> IGTPW_11505
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11505 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11505, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/index.html
> 
> Participating hosts (38 -> 39)
> ------------------------------
> 
>   Additional (3): bat-dg2-11 bat-arls-1 fi-bsw-n3050 
>   Missing    (2): fi-cfl-8109u fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11505:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@runner@aborted:
>     - fi-bsw-n3050:       NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/fi-bsw-n3050/igt@runner@aborted.html
> 

This is unrelated to change in Xe lib and Xe test,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11505 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-arls-1:         NOTRUN -> [SKIP][2] ([i915#9318])
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_lmem_swapping@random-engines:
>     - bat-arls-1:         NOTRUN -> [SKIP][3] ([i915#10213]) +3 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@gem_lmem_swapping@random-engines.html
> 
>   * igt@gem_mmap@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][4] ([i915#4083])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@gem_mmap@basic.html
>     - bat-arls-1:         NOTRUN -> [SKIP][5] ([i915#11343] / [i915#4083])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-arls-1:         NOTRUN -> [SKIP][6] ([i915#10197] / [i915#10211] / [i915#4079])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-arls-1:         NOTRUN -> [SKIP][7] ([i915#10196] / [i915#4077]) +2 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_fence_blits@basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][8] ([i915#4077]) +2 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@gem_tiled_fence_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][9] ([i915#4079]) +1 other test skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@gem_tiled_pread_basic.html
>     - bat-arls-1:         NOTRUN -> [SKIP][10] ([i915#10206] / [i915#4079])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-dg2-11:         NOTRUN -> [SKIP][11] ([i915#6621])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@i915_pm_rps@basic-api.html
>     - bat-arls-1:         NOTRUN -> [SKIP][12] ([i915#10209])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@i915_pm_rps@basic-api.html
> 
>   * igt@i915_selftest@live@hangcheck:
>     - bat-arls-2:         [PASS][13] -> [DMESG-WARN][14] ([i915#11349] / [i915#11378])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7946/bat-arls-2/igt@i915_selftest@live@hangcheck.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-2/igt@i915_selftest@live@hangcheck.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-arls-1:         NOTRUN -> [SKIP][15] ([i915#10200]) +9 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][16] ([i915#4212]) +7 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy.html
> 
>   * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][17] ([i915#5190])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> 
>   * igt@kms_addfb_basic@basic-y-tiled-legacy:
>     - bat-dg2-11:         NOTRUN -> [SKIP][18] ([i915#4215] / [i915#5190])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_addfb_basic@basic-y-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][19] ([i915#4103] / [i915#4213]) +1 other test skip
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-arls-1:         NOTRUN -> [SKIP][20] ([i915#10202] / [i915#11346]) +1 other test skip
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg2-11:         NOTRUN -> [SKIP][21] ([i915#3555] / [i915#3840])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_dsc@dsc-basic.html
>     - bat-arls-1:         NOTRUN -> [SKIP][22] ([i915#11346] / [i915#9886])
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-arls-1:         NOTRUN -> [SKIP][23] ([i915#10207] / [i915#11346])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-dg2-11:         NOTRUN -> [SKIP][24]
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_force_connector_basic@prune-stale-modes:
>     - bat-dg2-11:         NOTRUN -> [SKIP][25] ([i915#5274])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_force_connector_basic@prune-stale-modes.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-dg2-11:         NOTRUN -> [SKIP][26] ([i915#5354])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_pm_backlight@basic-brightness.html
>     - bat-arls-1:         NOTRUN -> [SKIP][27] ([i915#11346] / [i915#9812])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-arls-1:         NOTRUN -> [SKIP][28] ([i915#11346] / [i915#9732]) +3 other tests skip
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_psr@psr-sprite-plane-onoff:
>     - bat-dg2-11:         NOTRUN -> [SKIP][29] ([i915#1072] / [i915#9732]) +3 other tests skip
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_psr@psr-sprite-plane-onoff.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-dg2-11:         NOTRUN -> [SKIP][30] ([i915#3555])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-arls-1:         NOTRUN -> [SKIP][31] ([i915#10208] / [i915#8809])
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-flip:
>     - bat-dg2-11:         NOTRUN -> [SKIP][32] ([i915#3708])
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@prime_vgem@basic-fence-flip.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-dg2-11:         NOTRUN -> [SKIP][33] ([i915#3708] / [i915#4077]) +1 other test skip
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-arls-1:         NOTRUN -> [SKIP][34] ([i915#10212] / [i915#3708])
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-gtt:
>     - bat-arls-1:         NOTRUN -> [SKIP][35] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@prime_vgem@basic-gtt.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-dg2-11:         NOTRUN -> [SKIP][36] ([i915#3291] / [i915#3708]) +2 other tests skip
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-dg2-11/igt@prime_vgem@basic-read.html
>     - bat-arls-1:         NOTRUN -> [SKIP][37] ([i915#10214] / [i915#3708])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-arls-1:         NOTRUN -> [SKIP][38] ([i915#10216] / [i915#3708])
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/bat-arls-1/igt@prime_vgem@basic-write.html
> 
>   
>   [i915#10196]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10196
>   [i915#10197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
>   [i915#10200]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
>   [i915#10202]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
>   [i915#10206]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10206
>   [i915#10207]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
>   [i915#10208]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
>   [i915#10209]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
>   [i915#10211]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
>   [i915#10212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
>   [i915#1072]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1072
>   [i915#11343]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11343
>   [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
>   [i915#11349]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11349
>   [i915#11378]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11378
>   [i915#3291]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3291
>   [i915#3555]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
>   [i915#3840]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3840
>   [i915#4077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4103
>   [i915#4212]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4212
>   [i915#4213]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4213
>   [i915#4215]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4215
>   [i915#5190]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5190
>   [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
>   [i915#5354]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5354
>   [i915#6621]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6621
>   [i915#8809]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
>   [i915#9318]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9318
>   [i915#9732]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
>   [i915#9886]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7946 -> IGTPW_11505
> 
>   CI-20190529: 20190529
>   CI_DRM_15161: 2a74e6714291a2c9cf26c08f729d5feb203e8338 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11505: 11505
>   IGT_7946: 7946
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11505/index.html
