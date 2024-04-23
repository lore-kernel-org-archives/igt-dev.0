Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD23C04FFE
	for <igt-dev@archiver.kernel.org>; Tue, 23 Apr 2024 19:57:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C47113643;
	Tue, 23 Apr 2024 19:57:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gveGrQ2j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9B6113643;
 Tue, 23 Apr 2024 19:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713902247; x=1745438247;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=wLoZbmShl4mPD9pAbmB6mjWnLYLmDd/FyHgFb2uxpXA=;
 b=gveGrQ2jXV0hyGREH6Ck3PkwSSijTijMNSfHzXsNOEzT/GMnpw6WfDUZ
 +BLQ8Vpv0pehSGAMC3k7jsiho4uJSu4Wtk9qxw6HT4N6Y5VakYNyJYuDv
 8dzaqkwT+tRN4RPgoK8JV6nDhWxiI4kXPXHHhsb+b8k60yfmIjcpWtc3e
 jiLg2V4h4CYpq4iQS7yPVNdClgX+ZuhEXRIQrqUo0FNwo21d5RY2W/wx2
 nv/wETFzLcOtFIO7vO8R/5DVFnmxl3FW4BqzIQX9a7hTxWZ3shZ7Xc53K
 aO8nA0sc5fS4IrhtHsy5e4/lLOmtRNy311QbtqqzzNQ89Ail97oh4x+fN A==;
X-CSE-ConnectionGUID: EtyMZbnFQnuj8vpfHxvdKw==
X-CSE-MsgGUID: IB6kBTs8SbmxGIWzW1Z99A==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="13294109"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="13294109"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2024 12:57:26 -0700
X-CSE-ConnectionGUID: ThDhm+/6SZCOdgfNc0Xk+Q==
X-CSE-MsgGUID: 6RPKK5zUSNKYQSr7R0lQdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24539442"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 12:57:25 -0700
Date: Tue, 23 Apr 2024 21:57:22 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Arthur Grillo <arthurgrillo@riseup.net>,
 I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIENJLnhlRlVMTDogZmFpbHVy?= =?utf-8?Q?e?= for
 benchmarks/kms_fb_stress: benchmark formats (rev2)
Message-ID: <20240423195722.4g2675fxisehilyg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 I915-ci-infra@lists.freedesktop.org
References: <20240422-kms_fb_stress-dev-v5-0-0c577163dc88@riseup.net>
 <171385160068.1590705.18375349371599871766@8e613ede5ea5>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <171385160068.1590705.18375349371599871766@8e613ede5ea5>
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
On 2024-04-23 at 05:53:20 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: benchmarks/kms_fb_stress: benchmark formats (rev2)
> URL   : https://patchwork.freedesktop.org/series/132328/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_7815_full -> XEIGTPW_11052_full
> ====================================================
> 
> Summary
> -------
> 
>   **WARNING**
> 
>   Minor unknown changes coming with XEIGTPW_11052_full need to be verified
>   manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_11052_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   
> 
> Participating hosts (2 -> 1)
> ------------------------------
> 
>   Missing    (1): shard-adlp 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in XEIGTPW_11052_full:
> 
> ### IGT changes ###
> 
> #### Warnings ####
> 
>   * igt@kms_tiled_display@basic-test-pattern:
>     - shard-dg2-set2:     [SKIP][1] ([Intel XE#1201] / [Intel XE#362]) -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7815/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11052/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html
> 

Unrelated to change in benchmark, no need for respin.

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_11052_full that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 

...cut...

> 
> Build changes
> -------------
> 
>   * IGT: IGT_7815 -> IGTPW_11052
>   * Linux: xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a -> xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa
> 
>   IGTPW_11052: 11052
>   IGT_7815: d5d516bfdf77898e934b4c7ed947a43711cfb226 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-1137-ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a: ff2f70f345aaee3cbcf93a3a06ff3a5ab88e1d7a
>   xe-1153-5b3637fab551c28eef3e80d371ea7500e2aafbaa: 5b3637fab551c28eef3e80d371ea7500e2aafbaa
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132328v2/index.html
