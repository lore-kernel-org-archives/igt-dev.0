Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65399C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 14:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09F4D10EB27;
	Fri,  7 Feb 2025 14:43:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hNqeJ+/g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E2410EB27;
 Fri,  7 Feb 2025 14:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738939415; x=1770475415;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=HxRIoCoay/gOOWGwwP8bQPMPLhaUGi52fDbPpse+cOo=;
 b=hNqeJ+/gAWVCi4QMzA6pHROZgjcmVmVM5VaSL7inZJx3y+wTgFBFnUtJ
 NPoLRLt95+vbVBqdEMdYES7LZ02PKqVbsVTzEIKhs41ZDg4eWxJcojPgX
 A/zRmpWVRfxI+y2BZQK1uuFmf/RcrkiI+Fg4IeIJgcYOkCyQuz9iD4fYy
 SyXx1sTIGADG+5OeCc0FgoLa/lnPiUbgtJ6Uhb1SopaoRAP7fTCzf0Jlm
 7Txr5oCN6/MuqKbUHFbXUxfBDtUMrZYoQdrgjMPRSgYvdesW+hBL7Sodx
 05HyvDDfAaV/I76S81u7krVsOtIb3MsKCzjXexoTKOHeoU31ECXMq9M0Z g==;
X-CSE-ConnectionGUID: VH0JJK4vSxamIT0ADkK+DQ==
X-CSE-MsgGUID: JeCbSeeBQMa9Stcqs9R/Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="50201341"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="50201341"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:43:34 -0800
X-CSE-ConnectionGUID: +GH+huoyQ1G87xaDqRNlWw==
X-CSE-MsgGUID: 0n9s81jBROGW8DYm44DG4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="112052705"
Received: from pnass-mobl.ger.corp.intel.com (HELO [10.245.112.60])
 ([10.245.112.60])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 06:43:33 -0800
Message-ID: <13d04614-e172-438a-ad1e-b4ed6d217653@linux.intel.com>
Date: Fri, 7 Feb 2025 15:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_Bump_abort?=
 =?UTF-8?Q?ing_on_network_failure_deadline_to_40_seconds?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250206152147.209277-1-peter.senna@linux.intel.com>
 <173893723487.2663815.3949318546357202110@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <173893723487.2663815.3949318546357202110@b555e5b46a47>
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

On 07.02.2025 15:07, Patchwork wrote:
> == Series Details ==
> 
> Series: Bump aborting on network failure deadline to 40 seconds
> URL   : https://patchwork.freedesktop.org/series/144424/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8224 -> IGTPW_12556
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12556 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12556, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/index.html
> 
> Participating hosts (44 -> 43)
> ------------------------------
> 
>   Missing    (1): fi-snb-2520m 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12556:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@gt_pm:
>     - bat-jsl-3:          [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8224/bat-jsl-3/igt@i915_selftest@live@gt_pm.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/bat-jsl-3/igt@i915_selftest@live@gt_pm.html
> 
>   
> #### Warnings ####
> 
>   * igt@i915_module_load@load:
>     - bat-mtlp-9:         [ABORT][3] ([i915#13641]) -> [ABORT][4]
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8224/bat-mtlp-9/igt@i915_module_load@load.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12556/bat-mtlp-9/igt@i915_module_load@load.html

These are unrelated to my change. Please fix and re-run.

Thanks

[...]
