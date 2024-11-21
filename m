Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12CDE64025
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 22:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99E710E1EA;
	Thu, 21 Nov 2024 22:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d02ogQZX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B4D10E1EA
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 22:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732226542; x=1763762542;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=bbiuH9DoEkQdbidKd3JsLQMwmsaiwXVoKcHFgMsNbek=;
 b=d02ogQZXFE71NlbpkwqB5jOOd9blODXtl8mf/5RQA8KJw4gDo/Jvzpwe
 NweP8TuLvEN+Z8dcYAcckoX8gt654ZXK/YWOKw9JdrN/AL6xndmMQYTXZ
 hAqKvTshLKku/lFV83hoL68OxSsbW8xcNKUA0c2o9ZjvJJHYCpVEp/qBe
 fCWO3TnMlIX0URMa8KBHxTiMbwCLaKE7CMgipGGAyLcNC6l94BQe1TPsc
 mK2b2Ds1iwl4t15I+LjCrSPfHrkoR3tALWiPu2/s8WVnpQcC66FAJCZbu
 1Wj4BV0IoLZEfcG67YoiP7hCMDFwNl+Dz4mQ5OJ+9CXx/86DJcyN//0KT Q==;
X-CSE-ConnectionGUID: rxuMGViJSKSG0FPZqxP+6Q==
X-CSE-MsgGUID: oljhhbRnQHyi8AQsas8jbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="36031464"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="36031464"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:02:22 -0800
X-CSE-ConnectionGUID: iwE7P9KoT2Gp14n2VuqseQ==
X-CSE-MsgGUID: +d1m4fVbR7mRmI2KpgZXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; d="scan'208";a="94475025"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.109.234])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 14:02:21 -0800
Date: Thu, 21 Nov 2024 16:02:16 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Fi=2ECI=2EBAT=3A_failure_for_serie?=
 =?utf-8?Q?s?= starting with [CI,1/9] lib/igt_kmod: Remove unused module_ref
Message-ID: <jv5wepyykcudndxiszdjnumqlfmtxzvq57nw4kggydhrlhige2@rufphvdmtsu2>
References: <20241119054008.2001984-1-lucas.demarchi@intel.com>
 <173203520559.373309.724792645696617234@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <173203520559.373309.724792645696617234@b555e5b46a47>
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

On Tue, Nov 19, 2024 at 04:53:25PM +0000, Patchwork wrote:
>== Series Details ==
>
>Series: series starting with [CI,1/9] lib/igt_kmod: Remove unused module_ref
>URL   : https://patchwork.freedesktop.org/series/141532/
>State : failure
>
>== Summary ==
>
>CI Bug Log - changes from IGT_8118 -> IGTPW_12135
>====================================================
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_12135 absolutely need to be
>  verified manually.
>
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_12135, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/index.html
>
>Participating hosts (46 -> 44)
>------------------------------
>
>  Missing    (2): bat-mtlp-9 fi-snb-2520m
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_12135:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@core_hotunplug@unbind-rebind:

oh well... CI is definitely not happy with this series, hitting this:

<3> [152.880835] i915 0000:00:02.0: [drm] *ERROR* audio power refcount 1 after unbind

Need to check what's going on

Lucas De Marchi

>    - fi-cfl-guc:         [PASS][1] -> [ABORT][2]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
>   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-guc/igt@core_hotunplug@unbind-rebind.html
>    - bat-dg2-9:          [PASS][3] -> [ABORT][4]
>   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
>   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-9/igt@core_hotunplug@unbind-rebind.html
>    - bat-dg2-11:         [PASS][5] -> [ABORT][6]
>   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
>   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@core_hotunplug@unbind-rebind.html
>    - bat-dg2-14:         [PASS][7] -> [ABORT][8]
>   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
>   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-14/igt@core_hotunplug@unbind-rebind.html
>    - bat-dg2-8:          [PASS][9] -> [ABORT][10]
>   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
>   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-8/igt@core_hotunplug@unbind-rebind.html
>    - bat-adls-6:         [PASS][11] -> [ABORT][12]
>   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
>   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adls-6/igt@core_hotunplug@unbind-rebind.html
>    - fi-rkl-11600:       [PASS][13] -> [ABORT][14]
>   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
>   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-rkl-11600/igt@core_hotunplug@unbind-rebind.html
>    - bat-dg1-7:          [PASS][15] -> [ABORT][16]
>   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
>   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg1-7/igt@core_hotunplug@unbind-rebind.html
>    - bat-rpls-4:         [PASS][17] -> [ABORT][18]
>   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
>   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-rpls-4/igt@core_hotunplug@unbind-rebind.html
>    - fi-cfl-8109u:       [PASS][19] -> [ABORT][20]
>   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
>   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-cfl-8109u/igt@core_hotunplug@unbind-rebind.html
>    - fi-kbl-7567u:       [PASS][21] -> [ABORT][22]
>   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
>   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-kbl-7567u/igt@core_hotunplug@unbind-rebind.html
>    - bat-apl-1:          [PASS][23] -> [ABORT][24]
>   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
>   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@core_hotunplug@unbind-rebind.html
>    - fi-tgl-1115g4:      [PASS][25] -> [ABORT][26]
>   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
>   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-tgl-1115g4/igt@core_hotunplug@unbind-rebind.html
>
>  * igt@i915_pm_rpm@module-reload:
>    - bat-adlp-6:         [PASS][27] -> [ABORT][28]
>   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
>   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-6/igt@i915_pm_rpm@module-reload.html
>    - bat-adlp-9:         [PASS][29] -> [ABORT][30]
>   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
>   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-adlp-9/igt@i915_pm_rpm@module-reload.html
>    - bat-arls-5:         [PASS][31] -> [ABORT][32]
>   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-5/igt@i915_pm_rpm@module-reload.html
>   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-5/igt@i915_pm_rpm@module-reload.html
>
>
>#### Suppressed ####
>
>  The following results come from untrusted machines, tests, or statuses.
>  They do not affect the overall result.
>
>  * igt@i915_pm_rpm@module-reload:
>    - {bat-arls-6}:       [PASS][33] -> [ABORT][34]
>   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arls-6/igt@i915_pm_rpm@module-reload.html
>   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arls-6/igt@i915_pm_rpm@module-reload.html
>
>
>Known issues
>------------
>
>  Here are the changes found in IGTPW_12135 that come from known issues:
>
>### IGT changes ###
>
>#### Issues hit ####
>
>  * igt@dmabuf@all-tests@dma_fence_chain:
>    - fi-bsw-nick:        [PASS][35] -> [INCOMPLETE][36] ([i915#12904]) +1 other test incomplete
>   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
>   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/fi-bsw-nick/igt@dmabuf@all-tests@dma_fence_chain.html
>
>  * igt@i915_selftest@live:
>    - bat-arlh-3:         [PASS][37] -> [ABORT][38] ([i915#12829])
>   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live.html
>   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live.html
>
>  * igt@i915_selftest@live@workarounds:
>    - bat-arlh-3:         [PASS][39] -> [ABORT][40] ([i915#12061])
>   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-arlh-3/igt@i915_selftest@live@workarounds.html
>
>
>#### Possible fixes ####
>
>  * igt@i915_module_load@load:
>    - bat-twl-2:          [DMESG-WARN][41] ([i915#1982]) -> [PASS][42]
>   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_module_load@load.html
>   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_module_load@load.html
>
>  * igt@i915_selftest@live:
>    - bat-mtlp-8:         [ABORT][43] ([i915#12829]) -> [PASS][44]
>   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live.html
>   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live.html
>
>  * igt@i915_selftest@live@gt_mocs:
>    - bat-twl-2:          [ABORT][45] ([i915#12919]) -> [PASS][46] +1 other test pass
>   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
>   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-twl-2/igt@i915_selftest@live@gt_mocs.html
>
>  * igt@i915_selftest@live@workarounds:
>    - bat-mtlp-8:         [ABORT][47] -> [PASS][48]
>   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
>   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-mtlp-8/igt@i915_selftest@live@workarounds.html
>
>  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence:
>    - bat-apl-1:          [DMESG-WARN][49] -> [PASS][50] +2 other tests pass
>   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-apl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence.html
>
>  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
>    - bat-dg2-11:         [SKIP][51] ([i915#9197]) -> [PASS][52]
>   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8118/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/bat-dg2-11/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
>
>
>  {name}: This element is suppressed. This means it is ignored when computing
>          the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
>  [i915#12829]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12829
>  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>  [i915#12919]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12919
>  [i915#1982]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1982
>  [i915#9197]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9197
>
>
>Build changes
>-------------
>
>  * CI: CI-20190529 -> None
>  * IGT: IGT_8118 -> IGTPW_12135
>
>  CI-20190529: 20190529
>  CI_DRM_15720: f8f85a38f6c75e091805f01ceff4041ac2fdf3fd @ git://anongit.freedesktop.org/gfx-ci/linux
>  IGTPW_12135: 12135
>  IGT_8118: 17707095f1e5d3c30f463b43022f01c0160579b6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
>== Logs ==
>
>For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12135/index.html
