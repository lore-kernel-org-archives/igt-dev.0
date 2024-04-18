Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA319C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 18:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64597113EE5;
	Thu, 18 Apr 2024 18:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fHKd7z4J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78FDD113EE3;
 Thu, 18 Apr 2024 18:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713465222; x=1745001222;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3k16kP1waffg5RIh9AtJn/EBE1CwN5dntorjonOwPRo=;
 b=fHKd7z4JdRf8y2Pw0nH083OlQ34XWYi7+o+DGgPyraTN/AfJfyfEX98U
 R2dyDQ6jor2cdjLeS59gqJDIQG7csXYVZmYD9i2EEjTPUO3XV1OadgOnU
 RaPtLId88qrwmFRXIaQdc/IFUBG8zvtQqyzxhTZSywEgOnCkPsa4oexXf
 hGz+vDtOKf4rZ/GRUu5mEDStAqsgjR+UPi2HpVylMQmky6qaPIKVpAbv3
 kbSNSb4G5TR2lCES2K5/iQqxwNHwH6rJ6QBiYxrWcpTqF90WI8YPelpDZ
 PXgWAcbrXnEc3dGVaE3K6Cc1HF9ANOSisY2hMr+XW+szBafw+h71hP08P g==;
X-CSE-ConnectionGUID: wgLIKZ4ZTrmxVRFfVMqqdg==
X-CSE-MsgGUID: hjHUKMfOQWiSLKrIy9mseQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9206609"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="9206609"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 11:33:41 -0700
X-CSE-ConnectionGUID: 7y7OwKVPSB2p6TqTCl7aAQ==
X-CSE-MsgGUID: c8IJmytLTSGVWnGBUEk3gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="22944792"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 11:33:40 -0700
Date: Thu, 18 Apr 2024 20:33:18 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVy?= =?utf-8?Q?e?= for Align
 Xe header and restore some uAPI flags (rev5)
Message-ID: <20240418183318.kiet76e5vdw7fo7u@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Francois Dugast <francois.dugast@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240412142159.6-1-francois.dugast@intel.com>
 <171345217181.1501116.17620227248295049537@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171345217181.1501116.17620227248295049537@8e613ede5ea5>
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
On 2024-04-18 at 14:56:11 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Align Xe header and restore some uAPI flags (rev5)
> URL   : https://patchwork.freedesktop.org/series/131816/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_7813 -> IGTPW_11039
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11039 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11039, please notify your bug team (&quot;I915-ci-infra@lists.freedesktop.org&quot;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html
> 
> Participating hosts (42 -> 36)
> ------------------------------
> 
>   Additional (1): fi-elk-e7500 
>   Missing    (7): fi-kbl-7567u bat-dg1-7 fi-glk-j4005 fi-kbl-8809g bat-dg2-11 bat-mtlp-8 bat-mtlp-6 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11039:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_busy@basic@flip:
>     - bat-adls-6:         [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adls-6/igt@kms_busy@basic@flip.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adls-6/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-legacy:
>     - bat-arls-1:         NOTRUN -> [ABORT][3]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-legacy.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@b-dp1:
>     - fi-cfl-8109u:       [PASS][4] -> [INCOMPLETE][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-8109u/igt@kms_flip@basic-flip-vs-dpms@b-dp1.html
> 
>   * igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1:
>     - fi-tgl-1115g4:      NOTRUN -> [INCOMPLETE][6]
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-modeset@b-hdmi-a1.html
> 

These are unrelated to changes in Xe libs/tests,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11039 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@core_auth@basic-auth:
>     - fi-kbl-x1275:       NOTRUN -> [INCOMPLETE][7] ([i915#2295])
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-kbl-x1275/igt@core_auth@basic-auth.html
> 
>   * igt@debugfs_test@basic-hwmon:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][8] ([i915#9318])
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@debugfs_test@basic-hwmon.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][9] ([i915#3826])
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@debugfs_test@basic-hwmon.html
> 
>   * igt@fbdev@eof:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][10] ([i915#2582]) +3 other tests skip
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@fbdev@eof.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][11] ([i915#2582]) +3 other tests skip
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@fbdev@eof.html
> 
>   * igt@fbdev@info:
>     - fi-rkl-11600:       NOTRUN -> [SKIP][12] ([i915#1849] / [i915#2582])
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@fbdev@info.html
>     - bat-adlm-1:         NOTRUN -> [SKIP][13] ([i915#1849] / [i915#2582])
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@fbdev@info.html
> 
>   * igt@gem_exec_basic@basic:
>     - fi-rkl-11600:       NOTRUN -> [INCOMPLETE][14] ([i915#2295])
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@gem_exec_basic@basic.html
> 
>   * igt@gem_huc_copy@huc-copy:
>     - fi-elk-e7500:       NOTRUN -> [SKIP][15] +6 other tests skip
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-elk-e7500/igt@gem_huc_copy@huc-copy.html
> 
>   * igt@kms_busy@basic@modeset:
>     - bat-dg2-14:         [PASS][16] -> [DMESG-WARN][17] ([i915#10875])
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-14/igt@kms_busy@basic@modeset.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-14/igt@kms_busy@basic@modeset.html
>     - bat-rplp-1:         [PASS][18] -> [DMESG-WARN][19] ([i915#10875])
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-rplp-1/igt@kms_busy@basic@modeset.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-rplp-1/igt@kms_busy@basic@modeset.html
>     - fi-cfl-guc:         [PASS][20] -> [INCOMPLETE][21] ([i915#10056])
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-guc/igt@kms_busy@basic@modeset.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-guc/igt@kms_busy@basic@modeset.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
>     - bat-adln-1:         NOTRUN -> [SKIP][22] ([i915#4213]) +1 other test skip
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adln-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> 
>   * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
>     - fi-apl-guc:         NOTRUN -> [SKIP][23] +2 other tests skip
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-apl-guc/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
>     - bat-arls-2:         NOTRUN -> [ABORT][24] ([i915#10875])
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
> 
>   * igt@kms_cursor_legacy@basic-flip-before-cursor-atomic:
>     - fi-blb-e6850:       NOTRUN -> [SKIP][25]
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-blb-e6850/igt@kms_cursor_legacy@basic-flip-before-cursor-atomic.html
> 
>   * igt@kms_force_connector_basic@force-connector-state:
>     - fi-cfl-8700k:       [PASS][26] -> [INCOMPLETE][27] ([i915#9878])
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-cfl-8700k/igt@kms_force_connector_basic@force-connector-state.html
> 
>   
> #### Possible fixes ####
> 
>   * igt@gem_close_race@basic-threads:
>     - bat-dg2-9:          [DMESG-WARN][28] ([i915#10875]) -> [PASS][29]
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-9/igt@gem_close_race@basic-threads.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-9/igt@gem_close_race@basic-threads.html
> 
>   * igt@i915_module_load@load:
>     - fi-rkl-11600:       [INCOMPLETE][30] -> [PASS][31]
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-rkl-11600/igt@i915_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-rkl-11600/igt@i915_module_load@load.html
>     - bat-adlm-1:         [INCOMPLETE][32] ([i915#10875]) -> [PASS][33]
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adlm-1/igt@i915_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adlm-1/igt@i915_module_load@load.html
>     - fi-kbl-x1275:       [INCOMPLETE][34] -> [PASS][35]
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-kbl-x1275/igt@i915_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-kbl-x1275/igt@i915_module_load@load.html
> 
>   * igt@kms_busy@basic@flip:
>     - fi-bsw-nick:        [INCOMPLETE][36] -> [PASS][37]
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-bsw-nick/igt@kms_busy@basic@flip.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-bsw-nick/igt@kms_busy@basic@flip.html
>     - fi-apl-guc:         [INCOMPLETE][38] -> [PASS][39]
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-apl-guc/igt@kms_busy@basic@flip.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-apl-guc/igt@kms_busy@basic@flip.html
> 
>   * igt@kms_busy@basic@modeset:
>     - fi-ivb-3770:        [INCOMPLETE][40] -> [PASS][41]
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-ivb-3770/igt@kms_busy@basic@modeset.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-ivb-3770/igt@kms_busy@basic@modeset.html
>     - fi-ilk-650:         [INCOMPLETE][42] -> [PASS][43]
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-ilk-650/igt@kms_busy@basic@modeset.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-ilk-650/igt@kms_busy@basic@modeset.html
> 
>   * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
>     - bat-arls-2:         [ABORT][44] ([i915#10875]) -> [PASS][45]
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>     - bat-arls-1:         [ABORT][46] ([i915#10875]) -> [PASS][47]
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-arls-1/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
> 
>   * igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1:
>     - fi-tgl-1115g4:      [INCOMPLETE][48] -> [PASS][49]
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/fi-tgl-1115g4/igt@kms_flip@basic-flip-vs-dpms@c-hdmi-a1.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@load:
>     - bat-dg2-8:          [INCOMPLETE][50] ([i915#10877]) -> [INCOMPLETE][51] ([i915#10875] / [i915#10877])
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-dg2-8/igt@i915_module_load@load.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-dg2-8/igt@i915_module_load@load.html
> 
>   * igt@kms_busy@basic@modeset:
>     - bat-adls-6:         [ABORT][52] ([i915#10875]) -> [DMESG-WARN][53] ([i915#10875])
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7813/bat-adls-6/igt@kms_busy@basic@modeset.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/bat-adls-6/igt@kms_busy@basic@modeset.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [i915#10056]: https://gitlab.freedesktop.org/drm/intel/issues/10056
>   [i915#10875]: https://gitlab.freedesktop.org/drm/intel/issues/10875
>   [i915#10877]: https://gitlab.freedesktop.org/drm/intel/issues/10877
>   [i915#1849]: https://gitlab.freedesktop.org/drm/intel/issues/1849
>   [i915#2295]: https://gitlab.freedesktop.org/drm/intel/issues/2295
>   [i915#2582]: https://gitlab.freedesktop.org/drm/intel/issues/2582
>   [i915#3826]: https://gitlab.freedesktop.org/drm/intel/issues/3826
>   [i915#4213]: https://gitlab.freedesktop.org/drm/intel/issues/4213
>   [i915#9318]: https://gitlab.freedesktop.org/drm/intel/issues/9318
>   [i915#9878]: https://gitlab.freedesktop.org/drm/intel/issues/9878
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7813 -> IGTPW_11039
> 
>   CI-20190529: 20190529
>   CI_DRM_14602: 4eddedf2b31be4f2280a7c42966eaf9b6cb251a8 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11039: 7d07174eaa3a97b60dd118a1775ae7b23c06817c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_7813: 66841b7d9024447be4f4f5449aaf4f021e6323e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11039/index.html
