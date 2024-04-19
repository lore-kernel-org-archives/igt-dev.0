Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEC4C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 14:13:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6165010F1E8;
	Fri, 19 Apr 2024 14:13:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L7FoPnrn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C62910E26B;
 Fri, 19 Apr 2024 14:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713536012; x=1745072012;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gcGcGL3azeM0WMmTX3I2H49JFUkAr8cxYCFeWk0PEA4=;
 b=L7FoPnrnCrYVRjDw4BwpFNNOsy8wX+SQ4yeC+rGdtm+zYBbX+RZjx4ZL
 6+iSW9kArW04FGKCd2nc6Rf2gDzgRRiXZMsfvYX8Sz8mzClVhRKxReIpd
 IkFjn8O1aek72GX78R2S4H5ORZUCAZvTK1YThvhEvyr/MHqR4By34WA44
 LM+aH9DhDK1vwUSs11vZAKzEt0+TtJdJCPY7bD6jzfoUF1aFto5Dv8Me2
 fxNqc5O5eI/9Emr6Q3e6C4VX/hK6UCrUaB/xdvmd00cnUWZGdtC2FF67g
 IKItnsUZ3hUJDU+PV91s+W/QuayCTmUBr/+TLipBtB8v6A0IJkvrQepCc w==;
X-CSE-ConnectionGUID: MqCzp57tTnG8XULQy2WKEg==
X-CSE-MsgGUID: 0W00qFdARh+g6NMoi5V9MA==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="20278217"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="20278217"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 07:13:32 -0700
X-CSE-ConnectionGUID: lKoDabI7QcGVpoNwX3QBWw==
X-CSE-MsgGUID: go3qTTwOQTaQDh1cp9Evfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="28169540"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 07:13:31 -0700
Date: Fri, 19 Apr 2024 16:13:28 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVA==?= =?utf-8?Q?=3A?= failure for
 tools/intel_reg: Fix mchbar register write
Message-ID: <20240419141328.x6v47co72dfaoqdi@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240418112633.2423-1-ville.syrjala@linux.intel.com>
 <171347345398.1501116.8089173337776586006@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171347345398.1501116.8089173337776586006@8e613ede5ea5>
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
On 2024-04-18 at 20:50:53 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tools/intel_reg: Fix mchbar register write
> URL   : https://patchwork.freedesktop.org/series/132598/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14606 -> IGTPW_11040
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11040 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11040, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html
> 
> Participating hosts (39 -> 36)
> ------------------------------
> 
>   Additional (3): bat-adlm-1 fi-apl-guc bat-mtlp-6 
>   Missing    (6): fi-kbl-7567u fi-bsw-n3050 fi-glk-j4005 fi-cfl-8109u fi-elk-e7500 bat-dg2-11 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11040:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@load:
>     - fi-kbl-x1275:       [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-kbl-x1275/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-kbl-x1275/igt@i915_module_load@load.html
> 
>   * igt@kms_busy@basic@flip:
>     - bat-adls-6:         [PASS][3] -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-adls-6/igt@kms_busy@basic@flip.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adls-6/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
>     - fi-apl-guc:         NOTRUN -> [INCOMPLETE][5]
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-apl-guc/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
> 
>   * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2:
>     - bat-dg1-7:          NOTRUN -> [ABORT][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-hdmi-a-2.html
> 

These are unrelated to change in tools,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11040 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@debugfs_test@basic-hwmon:
>     - fi-apl-guc:         NOTRUN -> [SKIP][7] +3 other tests skip
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-apl-guc/igt@debugfs_test@basic-hwmon.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][8] ([i915#9318])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@eof:
>     - bat-kbl-2:          NOTRUN -> [SKIP][9] +4 other tests skip
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@fbdev@eof.html
> 
>   * igt@fbdev@info:
>     - bat-kbl-2:          NOTRUN -> [SKIP][10] ([i915#1849])
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@fbdev@info.html
>     - bat-mtlp-6:         NOTRUN -> [SKIP][11] ([i915#1849] / [i915#2582])
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@fbdev@info.html
> 
>   * igt@fbdev@write:
>     - bat-mtlp-6:         NOTRUN -> [SKIP][12] ([i915#2582]) +3 other tests skip
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@fbdev@write.html
> 
>   * igt@gem_close_race@basic-process:
>     - bat-mtlp-6:         NOTRUN -> [DMESG-WARN][13] ([i915#10875])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-6/igt@gem_close_race@basic-process.html
> 
>   * igt@i915_module_load@load:
>     - bat-adlm-1:         NOTRUN -> [INCOMPLETE][14] ([i915#10875])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adlm-1/igt@i915_module_load@load.html
>     - bat-dg2-8:          [PASS][15] -> [INCOMPLETE][16] ([i915#10877])
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-8/igt@i915_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-8/igt@i915_module_load@load.html
> 
>   * igt@kms_busy@basic@modeset:
>     - bat-dg2-14:         [PASS][17] -> [INCOMPLETE][18] ([i915#10056] / [i915#10875])
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-14/igt@kms_busy@basic@modeset.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-14/igt@kms_busy@basic@modeset.html
>     - fi-cfl-guc:         [PASS][19] -> [INCOMPLETE][20] ([i915#10056])
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-cfl-guc/igt@kms_busy@basic@modeset.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-cfl-guc/igt@kms_busy@basic@modeset.html
>     - bat-mtlp-8:         [PASS][21] -> [DMESG-WARN][22] ([i915#10875])
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-mtlp-8/igt@kms_busy@basic@modeset.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-mtlp-8/igt@kms_busy@basic@modeset.html
>     - bat-adls-6:         [PASS][23] -> [DMESG-WARN][24] ([i915#10875])
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-adls-6/igt@kms_busy@basic@modeset.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-adls-6/igt@kms_busy@basic@modeset.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - bat-dg1-7:          NOTRUN -> [SKIP][25] ([i915#4103] / [i915#4213]) +1 other test skip
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_dsc@dsc-basic:
>     - bat-dg1-7:          NOTRUN -> [SKIP][26] ([i915#3555] / [i915#3840])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_dsc@dsc-basic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@b-edp1:
>     - bat-jsl-1:          [PASS][27] -> [INCOMPLETE][28] ([i915#10876])
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-jsl-1/igt@kms_flip@basic-flip-vs-dpms@b-edp1.html
> 
>   * igt@kms_force_connector_basic@force-load-detect:
>     - bat-dg1-7:          NOTRUN -> [SKIP][29]
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_force_connector_basic@force-load-detect.html
> 
>   * igt@kms_hdmi_inject@inject-audio:
>     - bat-dg1-7:          NOTRUN -> [SKIP][30] ([i915#433])
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_hdmi_inject@inject-audio.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_ctx_create@basic:
>     - fi-rkl-11600:       [DMESG-WARN][31] -> [PASS][32]
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/fi-rkl-11600/igt@gem_ctx_create@basic.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/fi-rkl-11600/igt@gem_ctx_create@basic.html
> 
>   * igt@i915_module_load@load:
>     - bat-kbl-2:          [INCOMPLETE][33] ([i915#10875] / [i915#10877]) -> [PASS][34]
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-kbl-2/igt@i915_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-kbl-2/igt@i915_module_load@load.html
> 
>   * igt@kms_busy@basic@modeset:
>     - bat-dg1-7:          [ABORT][35] ([i915#10875]) -> [PASS][36]
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg1-7/igt@kms_busy@basic@modeset.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg1-7/igt@kms_busy@basic@modeset.html
> 
>   
> #### Warnings ####
> 
>   * igt@gem_close_race@basic-process:
>     - bat-dg2-9:          [INCOMPLETE][37] ([i915#10875]) -> [DMESG-WARN][38] ([i915#10875])
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14606/bat-dg2-9/igt@gem_close_race@basic-process.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/bat-dg2-9/igt@gem_close_race@basic-process.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10056]: https://gitlab.freedesktop.org/drm/intel/issues/10056
>   [i915#10875]: https://gitlab.freedesktop.org/drm/intel/issues/10875
>   [i915#10876]: https://gitlab.freedesktop.org/drm/intel/issues/10876
>   [i915#10877]: https://gitlab.freedesktop.org/drm/intel/issues/10877
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3555]: https://gitlab.freedesktop.org/drm/intel/issues/3555
>   [i915#3840]: https://gitlab.freedesktop.org/drm/intel/issues/3840
>   [i915#4103]: https://gitlab.freedesktop.org/drm/intel/issues/4103
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#433]: https://gitlab.freedesktop.org/drm/intel/issues/433
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7813 -> IGTPW_11040
> 
>   CI-20190529: 20190529
>   CI_DRM_14606: 121bb3cb2e7ce2d6f5c35cea84c6ae308cf1da0a @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11040: d591925568a45c97dc8484361a79e9d0b01636c3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11040/index.html
