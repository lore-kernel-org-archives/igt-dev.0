Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397BECA5FF0
	for <igt-dev@archiver.kernel.org>; Tue,  6 Oct 2026 08:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC20210E013;
	Tue,  6 Oct 2026 08:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n903gsMv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E6C10E013
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Oct 2026 08:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791276469; x=1822812469;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=U0TwQ0xccebboyIGmNPFGXtB/IuVyS3mfnBJVO3XoqE=;
 b=n903gsMvuZF0EYAFKLvgkyp8g27epvEcVWqDMPBEeOdpGytkRxKozd+9
 roaM3DH/C2VzVMpQasusPk1ywkhuGICD7nsW5+mxRxRW3Gredv5fXU42z
 ZZPgwnzKBoqCeWKGSs27exIN5wRhBtbMfXDpzI2KmdEm9QZ3b0OgmFdhH
 daRjlc5UAMVqoe6CNkq5Qf5rkkVl7ifAbbjqnXHp3uphqk3em+GzojMG/
 hb/yoLUSWrdkebtZ+C5///akhNOU/RxfUX/l8g/ksCmMPGMysjyWqwDve
 ySOzvutCFWh3N//fFXWFcvesbIVEtAmwFGFugq8galTCb8GAjJrXcDyop A==;
X-CSE-ConnectionGUID: 16Ck7THLQRukG/3u2T11Wg==
X-CSE-MsgGUID: F2IpfVVVSCmZjVQtSU5BuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="10117"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="10117"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2026 01:47:49 -0700
X-CSE-ConnectionGUID: ZbWGfowhQNmZlpDHberp4g==
X-CSE-MsgGUID: 1sMokWtJSCiDdyR/POByiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; d="scan'208";a="276599562"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 01:47:47 -0700
Date: Tue, 6 Oct 2026 10:47:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/xe_pmu: Do not enable VFs in unrelated subtests
Message-ID: <20261006084745.3vgjjkjf2xvq7akx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Gustavo Sousa <gustavo.sousa@intel.com>
References: <20261005-xe_pmu-do-not-enable-vfs-in-unrelated-subtests-v1-1-ccf95739aacc@intel.com>
 <179127374122.243272.9824423396843370596@61270ab9df2a>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179127374122.243272.9824423396843370596@61270ab9df2a>
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
On 2026-10-06 at 08:02:21 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/xe_pmu: Do not enable VFs in unrelated subtests
> URL   : https://patchwork.freedesktop.org/series/175577/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_9130_FULL -> XEIGTPW_15942_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15942_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15942_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (3 -> 3)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15942_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
>     - shard-ptl:          NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15942/shard-ptl-7/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
>     - shard-bmg:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15942/shard-bmg-6/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html
> 
>   * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
>     - shard-ptl:          [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9130/shard-ptl-6/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15942/shard-ptl-5/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
> 

Unrelated, this is change in xe_pmu.


Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15942_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1125] / [Intel XE#7312])
>    [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15942/shard-lnl-4/igt@intel_hwmon@hwmon-write.html
> 
...cut...
