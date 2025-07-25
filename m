Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31B3C83F26
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 10:16:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6660110E9AF;
	Fri, 25 Jul 2025 10:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="em9AqE5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F28910E9AF;
 Fri, 25 Jul 2025 10:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753438557; x=1784974557;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=FRNcaXJCj93Z0kXemqvf9OOdH8Ow0GwQjAYVbZH+uG4=;
 b=em9AqE5RPvEVXBIyNZ+tN/sIMuNBDQWQH+oFtnW14DqdKsEF8KeXTw/T
 pJKMQt2IXB3wboKxAJpfSxnnORFxV4bXmPkHeyter6sejblAEfT7vmtxe
 ZNumJkeAAziqpedOQaL4W8vbER9SL4MaLxtcFDpkYfnB1CLBL/5XITiwE
 LCcnSA9DZANN2yTWpQemu821zNc08xAhmlOuaXxw/OzG26+8RduNUadWe
 yl7X0YtWWaprCmEdagBypW4gW0O+GsxICYVUjCsLH9CVs1M+E3b15Y2WC
 bZ8OsTkcNgUy1SXon4ZmYHjF2c1pgIV1/nuxXdK6bUGCd2btU6yWXHwwG Q==;
X-CSE-ConnectionGUID: UOe5rIkYRGW0UL/wftjURw==
X-CSE-MsgGUID: PhktkfnSTyqa3/FwozlBjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66469669"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="66469669"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:15:57 -0700
X-CSE-ConnectionGUID: 2ujPfRJLTDymOh2CU0XUkw==
X-CSE-MsgGUID: 7P8ahJ8ATdOt+PqaN01NPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="164894916"
Received: from eanguian-mobl1.amr.corp.intel.com (HELO [10.245.82.244])
 ([10.245.82.244])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 03:15:58 -0700
Message-ID: <f8dd5b74-554f-44d1-acc1-bc2cb9e844f7@linux.intel.com>
Date: Fri, 25 Jul 2025 12:15:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Add_post-km?=
 =?UTF-8?Q?od-unbind_igt=5Fhook_=28rev2=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250723104406.58784-1-peter.senna@linux.intel.com>
 <175330842359.184315.3898226578927745363@1538d3639d33>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <175330842359.184315.3898226578927745363@1538d3639d33>
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

On 7/24/2025 12:07 AM, Patchwork wrote:
> == Series Details ==
> 
> Series: Add post-kmod-unbind igt_hook (rev2)
> URL   : https://patchwork.freedesktop.org/series/151642/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8475_FULL -> XEIGTPW_13514_FULL
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_13514_FULL absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_13514_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_13514_FULL:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
>     - shard-lnl:          [PASS][1] -> [FAIL][2]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8475/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13514/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html

These are unrelated to my change. Thank you.

[...]
