Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FA4C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 08:34:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6761E10E517;
	Tue,  1 Apr 2025 08:34:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HomRUYcG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7FF10E51C;
 Tue,  1 Apr 2025 08:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743496456; x=1775032456;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=qunSh8UhzTHcjsEc4XlTlufCWSnB3Oe58bMPRs7VQUA=;
 b=HomRUYcGdeFglt5r7J3M+glgU1y+szKO5MiyxiwNjU5TLaUJcrwEsMkc
 bQ7/YTL1nTmAYsYeZFnydR3gqpt/IS1rbdKPiDmCmU470z5eACTkgGZVF
 ffrQs2eRccp7/a/jY07YXlZaPib1ffbisBi2FudbO9zE+GqUcHBFnt9jn
 sEyJgXVl0cejjvkF5KOcYpd9S0tKyanYv9tUNxtSEU93L+2ekhO6IA2sv
 6My1T0XONrHMTgUAVEJlI9OUiibUI0GUSEhZ9IceH/xkDUexbR2srOEHo
 6fPbmTcgtQjbpORR2VO++Xw7PG1v/N9bIxiGV6Ugu/0MuxJErPoZCB1OX Q==;
X-CSE-ConnectionGUID: gLyqYzRtReeY+3LTN7UkZQ==
X-CSE-MsgGUID: KLIk8aDbRM+rXBerVFrGKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44960647"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="44960647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:34:16 -0700
X-CSE-ConnectionGUID: ToSzEYaRRwCRjOJBU/3jdg==
X-CSE-MsgGUID: CM5Zf8jSTh2uH7sFRYXl6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="126319035"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 01:34:10 -0700
Message-ID: <4339c705-a19e-417b-bb94-f562c63b7e85@linux.intel.com>
Date: Tue, 1 Apr 2025 10:34:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/intel=5Fsysfs=5Fdebugfs=3A_Unify_sysfs_and_debugfs_testing_=28re?=
 =?UTF-8?B?djIp?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250331180538.57393-1-peter.senna@linux.intel.com>
 <174346529452.21412.6795674895879532025@e6b6f09ec485>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174346529452.21412.6795674895879532025@e6b6f09ec485>
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

On 4/1/2025 1:54 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/intel_sysfs_debugfs: Unify sysfs and debugfs testing (rev2)
> URL   : https://patchwork.freedesktop.org/series/146940/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8294_FULL -> XEIGTPW_12891_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12891_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12891_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12891_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane_multiple@2x-tiling-yf:
>     - shard-bmg:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12891/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html
> 
>   * igt@kms_pm_rpm@modeset-stress-extra-wait:
>     - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][2] +4 other tests incomplete
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12891/shard-dg2-432/igt@kms_pm_rpm@modeset-stress-extra-wait.html
> 
>   * igt@kms_pm_rpm@universal-planes-dpms@plane-50:
>     - shard-lnl:          NOTRUN -> [INCOMPLETE][3] +1 other test incomplete
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12891/shard-lnl-7/igt@kms_pm_rpm@universal-planes-dpms@plane-50.html
> 
>   * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
>     - shard-lnl:          NOTRUN -> [SKIP][4] +12 other tests skip
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12891/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
> 
>   
> #### Suppressed ####
> 
>   The following results come from untrusted machines, tests, or statuses.
>   They do not affect the overall result.
> 
>   * {igt@xe_eu_stall@invalid-event-report-count}:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][5]
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12891/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html
>     - shard-adlp:         NOTRUN -> [SKIP][6] +1 other test skip
>    [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12891/shard-adlp-2/igt@xe_eu_stall@invalid-event-report-count.html

These are unrelated to my change.

Thank you,

Peter
