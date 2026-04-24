Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85769FE5206
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 11:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E2410E3BB;
	Fri, 24 Apr 2026 11:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ONAJGIMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0346110E3BB;
 Fri, 24 Apr 2026 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777028680; x=1808564680;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lSG3bxnXnTZKQy/asJ7StzpmcU8khY0jIlQrOIwGvv4=;
 b=ONAJGIMyEE8Yx6Yu19LmfkhVNi5owNsCZXpdQBrOMoKhhWPoUILmxJip
 HG5x1iDUtx7hO/T0+J8ZKM0kj0ivCndfXk2SZLoew4TBOkE1JCFVDiXOD
 4tZRhjNqqQ2+ibY6WCqU5AQQj15LbbHztMksvwABRMl5nwJc+0njvTJPb
 x7Pikvfw0PtrKIDDkl7Nmu7KoYzo+eafTlupgFD+4PQYWv573ABtwpV4Z
 HLYF3/G2Dxn6uB1/EmStigWIVOwkGaiIpUPLhoQMsOmHRpI7slWRZiwXv
 ldcsOfiT+ycV4yTXQ+DETzo1gTgFQ1ZcFy6vmnChfK9AquK/+1YsxC5aN A==;
X-CSE-ConnectionGUID: bKe4Ew/kReaOM79WLBGFfQ==
X-CSE-MsgGUID: PNdp2aFuTUKyeQ1dX7UK8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="65539210"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="65539210"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2026 04:04:39 -0700
X-CSE-ConnectionGUID: DDMiOY+FTASWtfc7ZyJY1A==
X-CSE-MsgGUID: 4Jrv8L5wTxO6Vm9nN9aZUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; d="scan'208";a="232782300"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 04:04:39 -0700
Date: Fri, 24 Apr 2026 13:04:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 tests/intel/kms_pwrite_crc: Create basic subtest (rev2)
Message-ID: <20260424110420.qgeurv67pjefv5fa@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20260421120652.27364-1-kamil.konieczny@linux.intel.com>
 <177683226256.484500.781324138392444428@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177683226256.484500.781324138392444428@a3b018990fe9>
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
On 2026-04-22 at 04:31:02 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/kms_pwrite_crc: Create basic subtest (rev2)
> URL   : https://patchwork.freedesktop.org/series/165171/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8865_FULL -> XEIGTPW_15027_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_15027_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_15027_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 2)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_15027_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>     - shard-bmg:          NOTRUN -> [SKIP][1] +2 other tests skip
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15027/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> 

Unrelated.


Regards,
Kamil 

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_15027_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@intel_hwmon@hwmon-write:
>     - shard-bmg:          NOTRUN -> [FAIL][2] ([Intel XE#7445])
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15027/shard-bmg-1/igt@intel_hwmon@hwmon-write.html
> 
...cut...
