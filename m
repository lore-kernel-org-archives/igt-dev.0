Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D30C28B2F
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 15:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E1310E5BB;
	Tue, 11 Mar 2025 15:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJfDVxb6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7344010E5B8;
 Tue, 11 Mar 2025 15:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741706503; x=1773242503;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=U8+OZAf/kmfDRbf25pOyxwqCZjSYUTEwy2fNY2MfUR8=;
 b=cJfDVxb6Wquo8HDd/dL/YbC4tkJUhU9X2bPnOS3hdLKQghmbLSn4xoFJ
 Sfzywzhz+JSUvmSUqmnHz4BF732gR7aWGdb9w0nnxdXGKdu3P/cHeysv2
 FEL6Kxp3Fd85k41Gdupf0vOmyi1ENQzu81sRNBrtJTJV6Uyy5QEHGCi6X
 +/7zkAP49ckb8dtCYX/WFI9PmqIWINLBSA26eGjB6jMNKmFO6dMGdVbfG
 gz48qD7SH+Lj5vSsTzkc/0jDnV025dvxL9Zs6eekqQj2EUoRVa4fm2ZeW
 4rFmSBxxyrE3wVpslzgTVwWXcTkeA83cID92jljUNn88V96S1e/vCtGBp Q==;
X-CSE-ConnectionGUID: lT8N94pfQMOFZhdCs3rUnA==
X-CSE-MsgGUID: QFRH/kvXRX6OIksd+k3VtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46662734"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="46662734"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:21:39 -0700
X-CSE-ConnectionGUID: V9fT7E2+SDG4iNOR8vf32g==
X-CSE-MsgGUID: 8OPwG3qSSXiRADSHe/QyrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; d="scan'208";a="120583377"
Received: from unknown (HELO [10.245.253.236]) ([10.245.253.236])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 08:21:38 -0700
Message-ID: <a7f324d2-3669-4b29-b1af-bf5ed9117574@linux.intel.com>
Date: Tue, 11 Mar 2025 16:21:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_runner/km?=
 =?UTF-8?Q?emleak=3A_Remove_unnecessary_lseek=28=29_calls?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250310200220.233045-1-peter.senna@linux.intel.com>
 <174170073662.18798.15227116741701124889@18a75f3d1eae>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174170073662.18798.15227116741701124889@18a75f3d1eae>
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

On 11.03.2025 14:45, Patchwork wrote:
> == Series Details ==
> 
> Series: runner/kmemleak: Remove unnecessary lseek() calls
> URL   : https://patchwork.freedesktop.org/series/146105/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16260_full -> IGTPW_12739_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12739_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12739_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/index.html
> 
> Participating hosts (11 -> 12)
> ------------------------------
> 
>   Additional (2): shard-snb-0 shard-dg2-set2 
>   Missing    (1): pig-kbl-iris 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12739_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_module_load@load:
>     - shard-tglu-1:       ([PASS][1], [PASS][2], [PASS][3]) -> [SKIP][4]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-1/igt@i915_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-1/igt@i915_module_load@load.html
>     - shard-dg1:          ([PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28], [PASS][29]) -> ([SKIP][30], [SKIP][31], [SKIP][32], [SKIP][33], [SKIP][34], [SKIP][35], [SKIP][36], [SKIP][37], [SKIP][38], [SKIP][39], [SKIP][40], [SKIP][41], [SKIP][42], [SKIP][43], [SKIP][44], [SKIP][45], [SKIP][46], [SKIP][47], [SKIP][48], [SKIP][49], [SKIP][50], [SKIP][51], [SKIP][52], [SKIP][53])
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_load@load.html
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_load@load.html
>    [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html
>    [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-12/igt@i915_module_load@load.html
>    [10]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
>    [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-19/igt@i915_module_load@load.html
>    [12]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html
>    [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-13/igt@i915_module_load@load.html
>    [14]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
>    [15]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-19/igt@i915_module_load@load.html
>    [16]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-16/igt@i915_module_load@load.html
>    [17]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-13/igt@i915_module_load@load.html
>    [18]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-19/igt@i915_module_load@load.html
>    [19]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_load@load.html
>    [20]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-15/igt@i915_module_load@load.html
>    [21]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/igt@i915_module_load@load.html
>    [22]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
>    [23]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_load@load.html
>    [24]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
>    [25]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
>    [26]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/igt@i915_module_load@load.html
>    [27]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-17/igt@i915_module_load@load.html
>    [28]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-14/igt@i915_module_load@load.html
>    [29]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg1-18/igt@i915_module_load@load.html
>    [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
>    [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
>    [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
>    [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-19/igt@i915_module_load@load.html
>    [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/igt@i915_module_load@load.html
>    [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/igt@i915_module_load@load.html
>    [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-18/igt@i915_module_load@load.html
>    [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
>    [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
>    [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
>    [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-17/igt@i915_module_load@load.html
>    [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-16/igt@i915_module_load@load.html
>    [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
>    [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
>    [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
>    [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-15/igt@i915_module_load@load.html
>    [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
>    [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
>    [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
>    [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-13/igt@i915_module_load@load.html
>    [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
>    [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
>    [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
>    [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg1-12/igt@i915_module_load@load.html
>     - shard-tglu:         ([PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [PASS][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75]) -> ([SKIP][76], [SKIP][77], [SKIP][78], [SKIP][79], [SKIP][80], [SKIP][81], [SKIP][82], [SKIP][83], [SKIP][84], [SKIP][85], [SKIP][86], [SKIP][87], [SKIP][88], [SKIP][89], [SKIP][90], [SKIP][91], [SKIP][92], [SKIP][93], [SKIP][94], [SKIP][95], [SKIP][96], [SKIP][97], [SKIP][98], [SKIP][99])
>    [54]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-5/igt@i915_module_load@load.html
>    [55]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-10/igt@i915_module_load@load.html
>    [56]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html
>    [57]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-10/igt@i915_module_load@load.html
>    [58]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/igt@i915_module_load@load.html
>    [59]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/igt@i915_module_load@load.html
>    [60]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-5/igt@i915_module_load@load.html
>    [61]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html
>    [62]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-2/igt@i915_module_load@load.html
>    [63]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-4/igt@i915_module_load@load.html
>    [64]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-6/igt@i915_module_load@load.html
>    [65]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-9/igt@i915_module_load@load.html
>    [66]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-2/igt@i915_module_load@load.html
>    [67]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-2/igt@i915_module_load@load.html
>    [68]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-8/igt@i915_module_load@load.html
>    [69]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-7/igt@i915_module_load@load.html
>    [70]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-4/igt@i915_module_load@load.html
>    [71]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module_load@load.html
>    [72]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-8/igt@i915_module_load@load.html
>    [73]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module_load@load.html
>    [74]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-7/igt@i915_module_load@load.html
>    [75]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-tglu-3/igt@i915_module_load@load.html
>    [76]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
>    [77]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
>    [78]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-7/igt@i915_module_load@load.html
>    [79]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-7/igt@i915_module_load@load.html
>    [80]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-6/igt@i915_module_load@load.html
>    [81]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-6/igt@i915_module_load@load.html
>    [82]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-6/igt@i915_module_load@load.html
>    [83]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
>    [84]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
>    [85]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
>    [86]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-5/igt@i915_module_load@load.html
>    [87]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-4/igt@i915_module_load@load.html
>    [88]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-4/igt@i915_module_load@load.html
>    [89]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-4/igt@i915_module_load@load.html
>    [90]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915_module_load@load.html
>    [91]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915_module_load@load.html
>    [92]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-3/igt@i915_module_load@load.html
>    [93]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_module_load@load.html
>    [94]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_module_load@load.html
>    [95]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-2/igt@i915_module_load@load.html
>    [96]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-10/igt@i915_module_load@load.html
>    [97]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
>    [98]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-9/igt@i915_module_load@load.html
>    [99]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-tglu-8/igt@i915_module_load@load.html
>     - shard-mtlp:         ([PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124]) -> ([SKIP][125], [SKIP][126], [SKIP][127], [SKIP][128], [SKIP][129], [SKIP][130], [SKIP][131], [SKIP][132], [SKIP][133], [SKIP][134], [SKIP][135], [SKIP][136], [SKIP][137], [SKIP][138], [SKIP][139], [SKIP][140], [SKIP][141], [SKIP][142], [SKIP][143], [SKIP][144], [SKIP][145], [SKIP][146], [SKIP][147], [SKIP][148], [SKIP][149])
>    [100]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html
>    [101]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/igt@i915_module_load@load.html
>    [102]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_load@load.html
>    [103]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-4/igt@i915_module_load@load.html
>    [104]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_load@load.html
>    [105]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html
>    [106]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-4/igt@i915_module_load@load.html
>    [107]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html
>    [108]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-8/igt@i915_module_load@load.html
>    [109]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/igt@i915_module_load@load.html
>    [110]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-6/igt@i915_module_load@load.html
>    [111]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/igt@i915_module_load@load.html
>    [112]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html
>    [113]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-4/igt@i915_module_load@load.html
>    [114]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-1/igt@i915_module_load@load.html
>    [115]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
>    [116]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/igt@i915_module_load@load.html
>    [117]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
>    [118]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
>    [119]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html
>    [120]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-3/igt@i915_module_load@load.html
>    [121]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html
>    [122]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-2/igt@i915_module_load@load.html
>    [123]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-5/igt@i915_module_load@load.html
>    [124]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-mtlp-7/igt@i915_module_load@load.html
>    [125]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
>    [126]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
>    [127]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
>    [128]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
>    [129]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-8/igt@i915_module_load@load.html
>    [130]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-7/igt@i915_module_load@load.html
>    [131]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
>    [132]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
>    [133]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
>    [134]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
>    [135]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
>    [136]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-6/igt@i915_module_load@load.html
>    [137]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
>    [138]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
>    [139]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
>    [140]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-5/igt@i915_module_load@load.html
>    [141]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-4/igt@i915_module_load@load.html
>    [142]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
>    [143]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
>    [144]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
>    [145]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
>    [146]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
>    [147]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-3/igt@i915_module_load@load.html
>    [148]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
>    [149]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-mtlp-1/igt@i915_module_load@load.html
>     - shard-dg2-9:        ([PASS][150], [PASS][151]) -> ([SKIP][152], [SKIP][153], [SKIP][154])
>    [150]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-9/igt@i915_module_load@load.html
>    [151]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-9/igt@i915_module_load@load.html
>    [152]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_load@load.html
>    [153]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_load@load.html
>    [154]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-9/igt@i915_module_load@load.html
>     - shard-dg2:          ([PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177]) -> ([SKIP][178], [SKIP][179], [SKIP][180], [SKIP][181], [SKIP][182], [SKIP][183], [SKIP][184], [SKIP][185], [SKIP][186], [SKIP][187], [SKIP][188], [SKIP][189], [SKIP][190], [SKIP][191], [SKIP][192], [SKIP][193], [SKIP][194], [SKIP][195], [SKIP][196], [SKIP][197], [SKIP][198], [SKIP][199])
>    [155]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html
>    [156]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-7/igt@i915_module_load@load.html
>    [157]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html
>    [158]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-11/igt@i915_module_load@load.html
>    [159]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-7/igt@i915_module_load@load.html
>    [160]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-10/igt@i915_module_load@load.html
>    [161]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-10/igt@i915_module_load@load.html
>    [162]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-1/igt@i915_module_load@load.html
>    [163]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-1/igt@i915_module_load@load.html
>    [164]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-6/igt@i915_module_load@load.html
>    [165]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-8/igt@i915_module_load@load.html
>    [166]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-6/igt@i915_module_load@load.html
>    [167]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_module_load@load.html
>    [168]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-8/igt@i915_module_load@load.html
>    [169]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.html
>    [170]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_module_load@load.html
>    [171]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-2/igt@i915_module_load@load.html
>    [172]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-3/igt@i915_module_load@load.html
>    [173]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.html
>    [174]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-5/igt@i915_module_load@load.html
>    [175]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-3/igt@i915_module_load@load.html
>    [176]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-4/igt@i915_module_load@load.html
>    [177]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-dg2-4/igt@i915_module_load@load.html
>    [178]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-8/igt@i915_module_load@load.html
>    [179]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@load.html
>    [180]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@load.html
>    [181]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-7/igt@i915_module_load@load.html
>    [182]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_module_load@load.html
>    [183]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_module_load@load.html
>    [184]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-6/igt@i915_module_load@load.html
>    [185]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5/igt@i915_module_load@load.html
>    [186]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5/igt@i915_module_load@load.html
>    [187]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-5/igt@i915_module_load@load.html
>    [188]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_module_load@load.html
>    [189]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_module_load@load.html
>    [190]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-4/igt@i915_module_load@load.html
>    [191]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html
>    [192]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html
>    [193]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-3/igt@i915_module_load@load.html
>    [194]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-2/igt@i915_module_load@load.html
>    [195]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-1/igt@i915_module_load@load.html
>    [196]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-11/igt@i915_module_load@load.html
>    [197]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i915_module_load@load.html
>    [198]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i915_module_load@load.html
>    [199]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-dg2-10/igt@i915_module_load@load.html
>     - shard-rkl:          ([PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221]) -> ([SKIP][222], [SKIP][223], [SKIP][224], [SKIP][225], [SKIP][226], [SKIP][227], [SKIP][228], [SKIP][229], [SKIP][230], [SKIP][231], [SKIP][232], [SKIP][233], [SKIP][234], [SKIP][235], [SKIP][236], [SKIP][237], [SKIP][238], [SKIP][239], [SKIP][240], [SKIP][241], [SKIP][242], [SKIP][243], [SKIP][244])
>    [200]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html
>    [201]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_module_load@load.html
>    [202]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html
>    [203]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-5/igt@i915_module_load@load.html
>    [204]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-6/igt@i915_module_load@load.html
>    [205]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-6/igt@i915_module_load@load.html
>    [206]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_module_load@load.html
>    [207]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html
>    [208]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_load@load.html
>    [209]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-3/igt@i915_module_load@load.html
>    [210]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html
>    [211]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
>    [212]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
>    [213]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
>    [214]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-7/igt@i915_module_load@load.html
>    [215]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
>    [216]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_load@load.html
>    [217]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
>    [218]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
>    [219]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-4/igt@i915_module_load@load.html
>    [220]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-1/igt@i915_module_load@load.html
>    [221]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16260/shard-rkl-8/igt@i915_module_load@load.html
>    [222]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
>    [223]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
>    [224]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
>    [225]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-1/igt@i915_module_load@load.html
>    [226]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
>    [227]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
>    [228]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
>    [229]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-3/igt@i915_module_load@load.html
>    [230]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
>    [231]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
>    [232]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
>    [233]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-5/igt@i915_module_load@load.html
>    [234]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-6/igt@i915_module_load@load.html
>    [235]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-6/igt@i915_module_load@load.html
>    [236]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-6/igt@i915_module_load@load.html
>    [237]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
>    [238]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
>    [239]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
>    [240]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-7/igt@i915_module_load@load.html
>    [241]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html
>    [242]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html
>    [243]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html
>    [244]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12739/shard-rkl-8/igt@i915_module_load@load.html
> 
These are unrelated to my change. Please fix and re-run.

Thank you,

Peter

[...]
