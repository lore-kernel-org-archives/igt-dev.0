Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D9BC25B5F
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 14:13:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C64810E121;
	Mon, 13 May 2024 14:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EiwuVjyw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FFF10E121;
 Mon, 13 May 2024 14:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715609614; x=1747145614;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=KR7yiHexJFYNqFsh09OA2b/la4j9oJWAFZa7m7+B6Yg=;
 b=EiwuVjywE7/bLtH5itUw+vmSfwGA2tOxmHnETq9hS8O4cK2LZGK3K6BJ
 +dUStTWhRXzK75lEHD/9NJZvZ5XWFdESXE1gIiuCafRUKAlNQkj+2JyoD
 h1iMofWt3WkG6E6p/eRrb7XRytljdyjeuCUTUZooLnyHyOOiOD7o6HnJq
 2U3tg7nhnZTbG3ptxqbRlIUL3cLFDcwvrDRfDjwdRoiAi8irO981jHRJq
 fr9EdsW6nixEzP88fqGXCd/zq7oXDEzw5zsQo0tHHAFnUGG7EFcOjcaul
 A82c3Cnus+OGm0yhT/RVGPEz8rvLYoTZISEpZ9yrTp1nsEWSxRMwQ4pWx g==;
X-CSE-ConnectionGUID: +y7QiOeqS6STP1tilWRS8Q==
X-CSE-MsgGUID: hezU3juqT2yPOyHQTLeOGg==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="11678549"
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="11678549"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2024 07:13:34 -0700
X-CSE-ConnectionGUID: /NkBuGLgQZyAs0QFN3DwMQ==
X-CSE-MsgGUID: jefkVqiBRtCSgrNnER8pWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,158,1712646000"; d="scan'208";a="35037824"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 07:13:32 -0700
Date: Mon, 13 May 2024 16:13:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 lib/i915/perf: Accumulate clocks for MPEC format too
Message-ID: <20240513141329.yvo24ek7cucf3akl@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20240510170450.2404385-1-ashutosh.dixit@intel.com>
 <171549613754.2076247.10178397078084136771@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171549613754.2076247.10178397078084136771@8e613ede5ea5>
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
On 2024-05-12 at 06:42:17 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: lib/i915/perf: Accumulate clocks for MPEC format too
> URL   : https://patchwork.freedesktop.org/series/133460/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_14749_full -> IGTPW_11128_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_11128_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11128_full, please notify your bug team (&#x27;I915-ci-infra@lists.freedesktop.org&#x27;) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11128/index.html
> 
> Participating hosts (9 -> 9)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_11128_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-1-pipe-b-vga-1:
>     - shard-snb:          NOTRUN -> [FAIL][1] +3 other tests fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11128/shard-snb5/igt@kms_display_modes@extended-mode-basic@pipe-a-hdmi-a-1-pipe-b-vga-1.html
> 
>   * igt@kms_flip@plain-flip-ts-check@a-hdmi-a4:
>     - shard-dg1:          [PASS][2] -> [FAIL][3]
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14749/shard-dg1-18/igt@kms_flip@plain-flip-ts-check@a-hdmi-a4.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11128/shard-dg1-15/igt@kms_flip@plain-flip-ts-check@a-hdmi-a4.html
> 
>   * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
>     - shard-snb:          [PASS][4] -> [DMESG-WARN][5]
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14749/shard-snb2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11128/shard-snb2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
> 

These are unrelated to i915/perf change.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_11128_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 


...cut...

> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7846 -> IGTPW_11128
> 
>   CI-20190529: 20190529
>   CI_DRM_14749: afd593c3e9f9218ececa93e30c33182346295ac9 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_11128: 11128
>   IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11128/index.html
