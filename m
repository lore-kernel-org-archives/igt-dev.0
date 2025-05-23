Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902F4C3DA6D
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 07:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401F810E766;
	Fri, 23 May 2025 07:52:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SHQZhPzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F9D10E766;
 Fri, 23 May 2025 07:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747986771; x=1779522771;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=ka2IZ1FyHxcl9Vx2k7qO/O4KIidPbab0sORxNQQOLXY=;
 b=SHQZhPzuBoLZm3mIPrTpLw6bV1TzqI+hFqkev1tV7yzuhXkC/wDB0c2g
 /RvVoVhWcrRjKrQzkhhCuGV++RDPfEy94NGuGDZVns7d28yylwZBvqnCA
 B/X7o3OSVfShdL2SpEvzVzaNdx4TNHUBtzmf9Pf0sAgeGrefUWcE6+/Bz
 su+HAWXGi7qAYoDft7akja3nuirekCu9vMnr4KnvLdxrz81g/X9aNT8+X
 KInMHCI67FdPrecz8upckw5Qijgv71+FaURI3WVew6zHk5g6FmQoeYEfj
 fG/A+gM1fkfr3wyqfyUTU8SFyD71tCpbEdOOWd+Mhuxdyfux69fNfL/lP w==;
X-CSE-ConnectionGUID: hv1xTxmmQ7C2QpiamJioLw==
X-CSE-MsgGUID: +ETIoDpMSdWJiGS/TgI3ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60290972"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="60290972"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 00:52:50 -0700
X-CSE-ConnectionGUID: yFyffFthSU6vK591iopuDg==
X-CSE-MsgGUID: ZlvLfb7qTi6ykfZSsn7FpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="141451740"
Received: from mdvorski-mobl1.ccr.corp.intel.com (HELO [10.245.81.194])
 ([10.245.81.194])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 00:52:49 -0700
Message-ID: <7940fd09-2b6c-41a6-856d-5d75ec91880d@linux.intel.com>
Date: Fri, 23 May 2025 09:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Replace_int?=
 =?UTF-8?Q?el=5Fsysfs=5Fdebugfs_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250522110126.628720-1-peter.senna@linux.intel.com>
 <174797163358.16284.251730595330315343@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174797163358.16284.251730595330315343@1538d3639d33>
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

On 5/23/2025 5:40 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: Replace intel_sysfs_debugfs (rev2)
> URL   : https://patchwork.freedesktop.org/series/149023/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8375_FULL -> XEIGTPW_13170_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13170_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13170_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (4 -> 3)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_13170_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_plane@planar-pixel-format-settings:
>     - shard-bmg:          NOTRUN -> [FAIL][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13170/shard-bmg-6/igt@kms_plane@planar-pixel-format-settings.html
> 
>   * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
>     - shard-dg2-set2:     [PASS][2] -> [INCOMPLETE][3]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8375/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13170/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
These are unrelated to my change. Please fix.

Thank you,

Peter
