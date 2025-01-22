Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AFBC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 08:23:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCB310E1DE;
	Wed, 22 Jan 2025 08:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RTEBscqJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341B510E1DE;
 Wed, 22 Jan 2025 08:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737534236; x=1769070236;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=xU/NNEpZYHIOLu1Fbcc8ej+dKx6XxsWJT2YFCAbzVVA=;
 b=RTEBscqJuK+VJ2J8KTv5KOIyu21icNofYWj+J1bmc4vWfo8pcl3qVPIV
 mazkFKLwVdtl4xIGDz41tBoRuO3n4Jw92GYnGQTSVIjFJAMNlT+kORETy
 +3sQOfDfR6qv53w0Ky1AxSPUAOwHA5bQ/RluchAjrhbE+y6e+kLdiH/yA
 cihN3/QjeBvU64l3vrTqz1M6royBd5nLDidCM+owG1N1iEBnz8cGOMfQ4
 2NMsA4TpI4ktsAe6hsQUGmyM/x0xKXVN++dpDoPp0bVr4zPAddVB7aEv/
 rEb38EWL9KUDo8lapeAaUPe2RBYFVzuHk4A9wvMU9ooKqscZ9FS/r3h1L g==;
X-CSE-ConnectionGUID: sTLbQRjHRv2pBUmaxTvfWw==
X-CSE-MsgGUID: d5cerglTQe+QeGUF2YFAbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37856242"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="37856242"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 00:23:51 -0800
X-CSE-ConnectionGUID: R20hIBwTS4Kv7T3YMmT4Yw==
X-CSE-MsgGUID: fvsPKbAiRXG7ug1SEtx9Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111686427"
Received: from hpabst-mobl.ger.corp.intel.com (HELO [10.246.21.97])
 ([10.246.21.97])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 00:23:50 -0800
Message-ID: <69a971ce-3503-4119-ae7a-d6b66322ff0a@linux.intel.com>
Date: Wed, 22 Jan 2025 09:23:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Integrat_km?=
 =?UTF-8?Q?emleak_scans_in_igt=5Frunner?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250121112944.115491-1-peter.senna@linux.intel.com>
 <173748418205.2687243.16683826694177507557@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173748418205.2687243.16683826694177507557@b555e5b46a47>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Dear I915,

On 21.01.2025 19:29, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrat kmemleak scans in igt_runner
> URL   : https://patchwork.freedesktop.org/series/143791/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8202_full -> XEIGTPW_12473_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12473_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12473_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 4)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_12473_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@core_setmaster@master-drop-set-root:
>     - shard-bmg:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-bmg-8/igt@core_setmaster@master-drop-set-root.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-bmg-3/igt@core_setmaster@master-drop-set-root.html
> 
>   * igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3:
>     - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check@bd-dp2-hdmi-a3.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
>     - shard-bmg:          [PASS][5] -> [DMESG-WARN][6] +51 other tests dmesg-warn
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
> 
>   * igt@kms_hdr@bpc-switch-suspend:
>     - shard-dg2-set2:     [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
>    [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-dg2-463/igt@kms_hdr@bpc-switch-suspend.html
>    [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-dg2-436/igt@kms_hdr@bpc-switch-suspend.html
> 
>   * igt@xe_gt_freq@freq_suspend:
>     - shard-dg2-set2:     [PASS][9] -> [INCOMPLETE][10]
>    [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-dg2-435/igt@xe_gt_freq@freq_suspend.html
>    [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-dg2-466/igt@xe_gt_freq@freq_suspend.html
> 
>   
> #### Warnings ####
> 
>   * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>     - shard-dg2-set2:     [DMESG-WARN][11] ([Intel XE#1033]) -> [DMESG-WARN][12]
>    [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
>    [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> 
>   * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>     - shard-bmg:          [SKIP][13] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][14]
>    [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-bmg-1/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
>    [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-bmg-7/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
> 
>   * igt@kms_flip@plain-flip-ts-check-interruptible:
>     - shard-bmg:          [FAIL][15] ([Intel XE#2882]) -> [DMESG-WARN][16]
>    [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
>    [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-bmg-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
> 
>   * igt@kms_pm_rpm@drm-resources-equal:
>     - shard-bmg:          [SKIP][17] ([Intel XE#2446]) -> [DMESG-WARN][18]
>    [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8202/shard-bmg-1/igt@kms_pm_rpm@drm-resources-equal.html
>    [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12473/shard-bmg-2/igt@kms_pm_rpm@drm-resources-equal.html

These are unrelated to my change. Can you fix and re-run?
