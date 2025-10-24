Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E02CCD1AB
	for <igt-dev@archiver.kernel.org>; Fri, 24 Oct 2025 08:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D5B10E9FC;
	Fri, 24 Oct 2025 08:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bo/vFIvo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA7E10E9FC
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Oct 2025 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761293598; x=1792829598;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=a75248JvAoDZXOAXLbcDXsXKFama4FN6O4b0aEKQ62c=;
 b=Bo/vFIvohqerywc2lFt5VJBXmISi4kMVudFoLoUDHz35zs/loiAvkc7i
 RcPz4DXRADnsp2logzBr+XlPsF11qNND1F1M/A6iKxYRpsuOyNsGGcVRH
 +jWcdtDRxG5jKp82KTtT/VodCanK2BxQXFGdceFakgnkXnrY/pD99k00H
 oCIa7QY0csQIl30Y+LnQQF/L5z0pUKijeJb3UI4Bt1hQAapy4MHHqCowh
 HYRBnv0h5G73YrCdtbkRpXOsYPVEXPUZ3DcrGzVBPpkTYaRmjycWNd9MQ
 njqC69f14qjIgn++IOTCEN0dpDFZ3vCNXOl+9aFwPAUd8O0Cm7CQsRqHc g==;
X-CSE-ConnectionGUID: 3DFN7I5XTQyQoN1/F8MRtQ==
X-CSE-MsgGUID: T5smQ+1mTVuNZdhe/8QQsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63397400"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63397400"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:13:09 -0700
X-CSE-ConnectionGUID: YEEgCnj9Rlmz01vTM2pZ3g==
X-CSE-MsgGUID: AS2YkGQuSRivkJdZtPY+Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,251,1754982000"; d="scan'208";a="184751103"
Received: from pmaziews-mobl1.ger.corp.intel.com (HELO [10.94.249.25])
 ([10.94.249.25])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 01:13:07 -0700
Message-ID: <ba3e07c1-9527-44b9-95e1-29c8f4a3a14d@linux.intel.com>
Date: Fri, 24 Oct 2025 10:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tests/int?=
 =?UTF-8?Q?el/xe=5Fsriov=5Fauto=5Fprovisioning=3A_Add_restore=5Fauto=5Fprovi?=
 =?UTF-8?Q?sioning_tests?=
To: igt-dev@lists.freedesktop.org, lgci.bug.filing@intel.com
References: <20251023203233.592113-1-marcin.bernatowicz@linux.intel.com>
 <176129332777.50546.16990825399766919825@97596180aaec>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <176129332777.50546.16990825399766919825@97596180aaec>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 10/24/2025 10:08 AM, Patchwork wrote:
> == Series Details ==
>
> Series: tests/intel/xe_sriov_auto_provisioning: Add restore_auto_provisioning tests
> URL   : https://patchwork.freedesktop.org/series/156445/
> State : failure
>
> == Summary ==
>
> CI Bug Log - changes from IGT_8596_full -> IGTPW_13936_full
> ====================================================
>
> Summary
> -------
>
>    **FAILURE**
>
>    Serious unknown changes coming with IGTPW_13936_full absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_13936_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>    to document this new failure mode, which will reduce false positives in CI.
>
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13936/index.html
>
> Participating hosts (11 -> 11)
> ------------------------------
>
>    No changes in participating hosts
>
> Possible new issues
> -------------------
>
>    Here are the unknown changes that may have been introduced in IGTPW_13936_full:
>
> ### IGT changes ###
>
> #### Possible regressions ####
>
>    * igt@kms_plane_multiple@tiling-x:
>      - shard-dg1:          NOTRUN -> [FAIL][1] +4 other tests fail
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13936/shard-dg1-16/igt@kms_plane_multiple@tiling-x.html

Not related to the change.

--

marcin

>    
> New tests
> ---------
>
>    New tests have been introduced between IGT_8596_full and IGTPW_13936_full:
>
> ### New IGT tests (5) ###
>
>    * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-c-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [2.42] s
>
>    * igt@kms_cursor_crc@cursor-onscreen-256x256@pipe-c-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [2.42] s
>
>    * igt@kms_cursor_crc@cursor-random-256x256@pipe-c-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [4.07] s
>
>    * igt@kms_cursor_crc@cursor-sliding-128x128@pipe-c-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [3.92] s
>
>    * igt@kms_plane_alpha_blend@alpha-basic@pipe-c-hdmi-a-2:
>      - Statuses : 1 pass(s)
>      - Exec time: [2.89] s
>
>    
>
> Known issues
> ------------
[...]
> Build changes
> -------------
>
>    * CI: CI-20190529 -> None
>    * IGT: IGT_8596 -> IGTPW_13936
>
>    CI-20190529: 20190529
>    CI_DRM_17415: c63ccee28ae7ab4cb57a2433314f08c71da914ff @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_13936: 13936
>    IGT_8596: 8596
>
> == Logs ==
>
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13936/index.html
>
