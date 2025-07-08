Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4704BC8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 08:25:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25F310E5C0;
	Tue,  8 Jul 2025 08:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZM2yFCQp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3312A10E5C1;
 Tue,  8 Jul 2025 08:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751963132; x=1783499132;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=bcYNrWn2obLy945X5nuPRddRuseioeLrTHgjwwdxvlA=;
 b=ZM2yFCQpxx8KRamMqO1IQ2jOcOemvCbFziQLJ1/NJZwpU+KZjGjZQOdD
 ST+xlqUbckD1E6dqMIdhvrm9eSdV2uwBRUpPV1l1u2xbf6YTxKPMgHdpT
 1+HioG7GTlfjFUAXKYVwbK2hATVESTpaeICdmAcT2CFhONKJymVxs0cgn
 XcD+dyJ9nMKl5gN43BKCmM+A4I5evC4DcDoi9k+TAHn2i5RO28AWLB6Zr
 Uom0qWU93cJeaEIr5hipzusReH9VFVrjKTArz+TRkvVvInOeCSOQt6EZa
 +xTR6/6PzU4EBO2qR4PjgK/uB4L0vjQjK3js2LZmJ9AnKDAauvVl04nmp w==;
X-CSE-ConnectionGUID: 0YTsjb3NSwCRZYjrgVS44g==
X-CSE-MsgGUID: kY0oRX9oSwCp4F0xb7IMbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54320823"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="54320823"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 01:25:31 -0700
X-CSE-ConnectionGUID: rlfHqmQ8Qs+VxMwWkyPFWg==
X-CSE-MsgGUID: qBymaYMlT0WDxymGGs5tTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; d="scan'208";a="154848717"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2025 01:25:30 -0700
Message-ID: <f0f7df35-28a7-48ec-a4d7-094186233128@linux.intel.com>
Date: Tue, 8 Jul 2025 10:25:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_Replace_i?=
 =?UTF-8?Q?ntel=5Fsysfs=5Fdebugfs?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250707210726.55334-1-peter.senna@linux.intel.com>
 <175193763895.141900.16796195912362119879@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175193763895.141900.16796195912362119879@1538d3639d33>
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

On 7/8/2025 3:20 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: Replace intel_sysfs_debugfs
> URL   : https://patchwork.freedesktop.org/series/151297/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_16819_full -> IGTPW_13423_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_13423_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_13423_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13423/index.html
> 
> Participating hosts (9 -> 10)
> ------------------------------
> 
>   Additional (1): shard-glk 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_13423_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-b-hdmi-a-2-y:
>     - shard-rkl:          NOTRUN -> [DMESG-WARN][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13423/shard-rkl-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-b-hdmi-a-2-y.html
> 
>   * igt@kms_psr@psr2-cursor-plane-move@edp-1:
>     - shard-mtlp:         [PASS][2] -> [FAIL][3] +1 other test fail
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16819/shard-mtlp-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13423/shard-mtlp-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

These are unrelated to my change. Please fix and re-run.

Thank you,

Peter


[...]
