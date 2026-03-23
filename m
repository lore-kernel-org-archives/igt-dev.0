Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D47F483E6
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 19:22:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0E0910E475;
	Mon, 23 Mar 2026 19:22:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTMgle2G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 782A310E475;
 Mon, 23 Mar 2026 19:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774293747; x=1805829747;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tZGyl4SzpWoTeqNGFdwGzlMzV3cLJW6Fu4jCIFQ2YCk=;
 b=FTMgle2GzKsYYZ/6kIrGr184k9JfPbK9D8i4mTrs/zNC+4s7CuJK5fKY
 j0h6M3Tqkrh0XIAb36GiUxwofibA7Y3FmbxpoK1whorDEmdoVHIHTtUr1
 pybBqTi0Y3tYHZfE0uUXDUQlxpVSwIG/22lk/Q8GAGT6WYwrLF0tOIvMn
 S+aZjVwfjEqMIRTE5fi4iEKyRm/rH+XzUnr3B13C5rl5n9whIL3PAkvXn
 SIJdy70eE5XYauHyCb9SoSrWDkvNy64Rw+Qxj84XllNwmXK7yMS6SvWzn
 y6lox8Pgzwj51yxzNi6xkrfo6zAW9i9SCH6MS/i+1YjYk7LJcCAH2G+mg Q==;
X-CSE-ConnectionGUID: SNaoRQ2ySsWfE5AVAr5Uug==
X-CSE-MsgGUID: ska7ZbKJRcG8j+qbh7dzyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="100753835"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="100753835"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:22:26 -0700
X-CSE-ConnectionGUID: Xm7e0DT+RDOfhc5bCvfnLg==
X-CSE-MsgGUID: 54oHR98pTeOA59WhNFg0rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="229040520"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 12:22:25 -0700
Date: Mon, 23 Mar 2026 20:22:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Renjun Wang <renjunw0@foxmail.com>, I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?Q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests=2Fkms?=
 =?utf-8?Q?=5Fplane?= =?utf-8?Q?=3A?= Allow planar-pixel-format-settings to
 pass on VKMS (rev3)
Message-ID: <20260323192222.iwobfwzfauhshslx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Renjun Wang <renjunw0@foxmail.com>,
 I915-ci-infra@lists.freedesktop.org
References: <20260320101606.22163-1-kamil.konieczny@linux.intel.com>
 <177409624648.383329.11464542859853171585@a3b018990fe9>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177409624648.383329.11464542859853171585@a3b018990fe9>
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
On 2026-03-21 at 12:30:46 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/kms_plane: Allow planar-pixel-format-settings to pass on VKMS (rev3)
> URL   : https://patchwork.freedesktop.org/series/161064/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8814_FULL -> XEIGTPW_14821_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_14821_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_14821_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_14821_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap:
>     - shard-bmg:          [PASS][1] -> [ABORT][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8814/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14821/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-dontunmap.html
> 

Unrelated.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_14821_FULL that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>     - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +2 other tests skip
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14821/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
> 
...cut...
