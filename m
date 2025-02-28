Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641DDC19776
	for <igt-dev@archiver.kernel.org>; Fri, 28 Feb 2025 09:07:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BAFF10EC28;
	Fri, 28 Feb 2025 09:07:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZQDVq3Gw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C452D10EC26;
 Fri, 28 Feb 2025 09:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740733623; x=1772269623;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=AKEq1MoJFeLlyO5Lrj8Rh+cFUTk3v/r7qbb/8ILGPOA=;
 b=ZQDVq3GwfApd5B6Qr96jfCIsv7Mn/d0L21P/qp1xB/8dLw3KZwWoC9oo
 KOo3d3KzwmgAE7MkMjDb4uokMs8iSRn4Eprw9AV8Bv0vxaqflANUQSnzi
 6sSKtEthzP71ck/xp3VV9MIDlR5Hu0Gd5qzpqKtgmaMNv9nr/21NLKA5K
 Eie+g07a+NEaX3GH2AoezlHUeDcWVMMCXfpzP0gu5Rus5VDV2v58K7lgU
 ECJOvhZWacOeV430DhmUEd1WmzPIqV3aXVm05p8Y8eh4hJk+10G1bS7ow
 8uBUGuRzl3fgLtwscnaF7iFxbE9S5dM8YB2i3uWF4WjfJpK1YVf2gwUQB A==;
X-CSE-ConnectionGUID: 4LCshXQ0QMWIkvohQQq1yQ==
X-CSE-MsgGUID: uCrnEXMXTLOpfGeBO0Fwig==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="29250674"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="29250674"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:07:00 -0800
X-CSE-ConnectionGUID: NN5EKstQTnSreM364ixbqQ==
X-CSE-MsgGUID: Z2720vXwRVGn+ktlhnguew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; d="scan'208";a="117078075"
Received: from pbabighi-mobl1.amr.corp.intel.com (HELO [10.246.16.179])
 ([10.246.16.179])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 01:06:59 -0800
Message-ID: <7c74dc20-592f-423d-8c9a-0e34c9926a65@linux.intel.com>
Date: Fri, 28 Feb 2025 10:06:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Integrate_k?=
 =?UTF-8?Q?memleak_scans_in_igt=5Frunner_=28rev5=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250227101853.361504-1-peter.senna@linux.intel.com>
 <174073185638.3133457.7448117036983986046@b555e5b46a47>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174073185638.3133457.7448117036983986046@b555e5b46a47>
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

On 28.02.2025 09:37, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrate kmemleak scans in igt_runner (rev5)
> URL   : https://patchwork.freedesktop.org/series/143996/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8251_full -> XEIGTPW_12677_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12677_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12677_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12677_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_cdclk@mode-transition-all-outputs:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12677/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
> 
>   * igt@kms_plane_lowres@tiling-none:
>     - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12677/shard-dg2-436/igt@kms_plane_lowres@tiling-none.html
> 
>   * igt@xe_vm@large-binds-2147483648:
>     - shard-dg2-set2:     [PASS][3] -> [DMESG-WARN][4]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8251/shard-dg2-432/igt@xe_vm@large-binds-2147483648.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12677/shard-dg2-434/igt@xe_vm@large-binds-2147483648.html
> 

These are unrelated to my change. Please fix and re-run.

Thank you,

Peter

[...]
