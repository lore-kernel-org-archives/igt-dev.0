Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8197C6FD1F
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 17:51:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A44310F1AB;
	Tue, 26 Mar 2024 17:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WlYBW2i1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E177810F19D;
 Tue, 26 Mar 2024 17:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711475461; x=1743011461;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=B7A3Hwt0/eaTuuhKjMxu4BlTLYhfe/iSZq/al17cS/g=;
 b=WlYBW2i1aVScY4SwUO7UinPrjVgLJ4E5A5iCnISaRjxMLM+ndeFz7QC0
 6VAc1mheD0fJCARTDwVO8HTSK5NtmsJ0LhTDmQmQXI+UJQ2PpESQ6+RLt
 YgiF+4Ao3Opc8iFQvs+DtJj9pmPs4awfdj/vvjDDzynGDtobsMNaNVkhj
 aFNZg7F9Lc9xsduFd6RFXJ4UmtOaaxubqsb6VGJs2dDWVqjuAzjUU2Yot
 rI24gtj2FlSC8ePv0AYtofqvprg/eljssh8v4yCx8CW5MXBG8M16JcoRO
 p0btXvhrOLS+GHnzBQLP0nGbm2oyiCI0ehlu25X99xAxiH2Pmc7YyeTyp Q==;
X-CSE-ConnectionGUID: LLt9xkzdQQ6Q+FTjtc6BCA==
X-CSE-MsgGUID: KzFeIbIGRvmoHCVa9vhtgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6409008"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; 
   d="scan'208";a="6409008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 10:51:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="20737832"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 10:50:59 -0700
Date: Tue, 26 Mar 2024 18:50:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for Align
 Xe test documentation to recent i915 changes (rev2)
Message-ID: <20240326175056.qlw3soqcfahwcfzu@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 I915-ci-infra@lists.freedesktop.org, lgci.bug.filing@intel.com,
 TejasreeX Illipilli <tejasreex.illipilli@intel.com>
References: <20240326092907.1979345-1-katarzyna.piecielska@intel.com>
 <171145159684.1039951.396965938016284304@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171145159684.1039951.396965938016284304@8e613ede5ea5>
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
On 2024-03-26 at 11:13:16 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Align Xe test documentation to recent i915 changes (rev2)
> URL   : https://patchwork.freedesktop.org/series/131492/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14483 -> IGTPW_10914
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_10914 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_10914, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/index.html
> 
> Participating hosts (37 -> 35)
> ------------------------------
> 
>   Additional (2): bat-arls-4 fi-glk-j4005 
>   Missing    (4): bat-dg1-7 bat-dg2-11 fi-snb-2520m fi-tgl-1115g4 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_10914:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@execlists:
>     - fi-bsw-nick:        [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14483/fi-bsw-nick/igt@i915_selftest@live@execlists.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/fi-bsw-nick/igt@i915_selftest@live@execlists.html
> 

This is unrelated to changes in comments.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_10914 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - bat-jsl-1:          NOTRUN -> [SKIP][3] ([i915#9318])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-jsl-1/igt@debugfs_test@basic-hwmon.html
>     - bat-arls-3:         NOTRUN -> [SKIP][4] ([i915#9318])
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - bat-jsl-1:          NOTRUN -> [SKIP][5] ([i915#2190])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-jsl-1/igt@gem_huc_copy@huc-copy.html
>     - fi-glk-j4005:       NOTRUN -> [SKIP][6] ([i915#2190])
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/fi-glk-j4005/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@gem_lmem_swapping@basic:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][7] ([i915#4613]) +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/fi-glk-j4005/igt@gem_lmem_swapping@basic.html
> 
>   * igt@gem_lmem_swapping@parallel-random-engines:
>     - bat-arls-3:         NOTRUN -> [SKIP][8] ([i915#10213]) +3 other tests skip
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@gem_lmem_swapping@parallel-random-engines.html
> 
>   * igt@gem_lmem_swapping@verify-random:
>     - bat-jsl-1:          NOTRUN -> [SKIP][9] ([i915#4613]) +3 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-jsl-1/igt@gem_lmem_swapping@verify-random.html
> 
>   * igt@gem_mmap@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][10] ([i915#4083])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@gem_mmap@basic.html
> 
>   * igt@gem_render_tiled_blits@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][11] ([i915#10197] / [i915#10211] / [i915#4079])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@gem_render_tiled_blits@basic.html
> 
>   * igt@gem_tiled_blits@basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][12] ([i915#10196] / [i915#4077]) +2 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@gem_tiled_blits@basic.html
> 
>   * igt@gem_tiled_pread_basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][13] ([i915#10206] / [i915#4079])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@gem_tiled_pread_basic.html
> 
>   * igt@i915_pm_rps@basic-api:
>     - bat-arls-3:         NOTRUN -> [SKIP][14] ([i915#10209])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@i915_pm_rps@basic-api.html
> 
>   * igt@kms_addfb_basic@addfb25-x-tiled-legacy:
>     - bat-arls-3:         NOTRUN -> [SKIP][15] ([i915#10200]) +9 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@kms_addfb_basic@addfb25-x-tiled-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - fi-glk-j4005:       NOTRUN -> [SKIP][16] +10 other tests skip
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/fi-glk-j4005/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
>     - bat-arls-3:         NOTRUN -> [SKIP][17] ([i915#10202]) +1 other test skip
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-jsl-1:          NOTRUN -> [SKIP][18] ([i915#4103]) +1 other test skip
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-jsl-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-arls-3:         NOTRUN -> [SKIP][19] ([i915#9886])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@kms_dsc@dsc-basic.html
>     - bat-jsl-1:          NOTRUN -> [SKIP][20] ([i915#3555] / [i915#9886])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-jsl-1/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-arls-3:         NOTRUN -> [SKIP][21] ([i915#10207])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@kms_force_connector_basic@force-load-detect.html
>     - bat-jsl-1:          NOTRUN -> [SKIP][22]
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-jsl-1/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_pm_backlight@basic-brightness:
>     - bat-arls-3:         NOTRUN -> [SKIP][23] ([i915#9812])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@kms_pm_backlight@basic-brightness.html
> 
>   * igt@kms_psr@psr-primary-mmap-gtt:
>     - bat-arls-3:         NOTRUN -> [SKIP][24] ([i915#9732]) +3 other tests skip
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@kms_psr@psr-primary-mmap-gtt.html
> 
>   * igt@kms_setmode@basic-clone-single-crtc:
>     - bat-jsl-1:          NOTRUN -> [SKIP][25] ([i915#3555])
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-jsl-1/igt@kms_setmode@basic-clone-single-crtc.html
>     - bat-arls-3:         NOTRUN -> [SKIP][26] ([i915#10208] / [i915#8809])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@kms_setmode@basic-clone-single-crtc.html
> 
>   * igt@prime_vgem@basic-fence-mmap:
>     - bat-arls-3:         NOTRUN -> [SKIP][27] ([i915#10196] / [i915#3708] / [i915#4077]) +1 other test skip
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@prime_vgem@basic-fence-mmap.html
> 
>   * igt@prime_vgem@basic-fence-read:
>     - bat-arls-3:         NOTRUN -> [SKIP][28] ([i915#10212] / [i915#3708])
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@prime_vgem@basic-fence-read.html
> 
>   * igt@prime_vgem@basic-read:
>     - bat-arls-3:         NOTRUN -> [SKIP][29] ([i915#10214] / [i915#3708])
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@prime_vgem@basic-read.html
> 
>   * igt@prime_vgem@basic-write:
>     - bat-arls-3:         NOTRUN -> [SKIP][30] ([i915#10216] / [i915#3708])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-arls-3/igt@prime_vgem@basic-write.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@i915_selftest@live@gt_contexts:
>     - bat-dg2-14:         [ABORT][31] ([i915#10366]) -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14483/bat-dg2-14/igt@i915_selftest@live@gt_contexts.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/bat-dg2-14/igt@i915_selftest@live@gt_contexts.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10196]: https://gitlab.freedesktop.org/drm/intel/issues/10196
>   [i915#10197]: https://gitlab.freedesktop.org/drm/intel/issues/10197
>   [i915#10200]: https://gitlab.freedesktop.org/drm/intel/issues/10200
>   [i915#10202]: https://gitlab.freedesktop.org/drm/intel/issues/10202
>   [i915#10206]: https://gitlab.freedesktop.org/drm/intel/issues/10206
>   [i915#10207]: https://gitlab.freedesktop.org/drm/intel/issues/10207
>   [i915#10208]: https://gitlab.freedesktop.org/drm/intel/issues/10208
>   [i915#10209]: https://gitlab.freedesktop.org/drm/intel/issues/10209
>   [i915#10211]: https://gitlab.freedesktop.org/drm/intel/issues/10211
>   [i915#10212]: https://gitlab.freedesktop.org/drm/intel/issues/10212
>   [i915#10213]: https://gitlab.freedesktop.org/drm/intel/issues/10213
>   [i915#10214]: https://gitlab.freedesktop.org/drm/intel/issues/10214
>   [i915#10216]: https://gitlab.freedesktop.org/drm/intel/issues/10216
>   [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
>   [i915#2190]: https://gitlab.freedesktop.org/drm/intel/issues/2190
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3708]: https://gitlab.freedesktop.org/drm/intel/issues/3708
>   [i915#4077]: https://gitlab.freedesktop.org/drm/intel/issues/4077
>   [i915#4079]: https://gitlab.freedesktop.org/drm/intel/issues/4079
>   [i915#4083]: https://gitlab.freedesktop.org/drm/intel/issues/4083
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4613]: https://gitlab.freedesktop.org/drm/intel/issues/4613
>   [i915#8809]: https://gitlab.freedesktop.org/drm/intel/issues/8809
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9732]: https://gitlab.freedesktop.org/drm/intel/issues/9732
>   [i915#9812]: https://gitlab.freedesktop.org/drm/intel/issues/9812
>   [i915#9886]: https://gitlab.freedesktop.org/drm/intel/issues/9886
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7782 -> IGTPW_10914
> 
>   CI-20190529: 20190529
>   CI_DRM_14483: d652ec2b081fc8e252cc86ee84f72a3b78ee9732 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_10914: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/index.html
>   IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10914/index.html
