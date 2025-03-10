Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC96C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 07:01:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12ACE10E1AF;
	Mon, 10 Mar 2025 07:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRBgWtOv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AB410E179;
 Mon, 10 Mar 2025 07:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741590083; x=1773126083;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=KimCVeLw2hPOXWe350ve4+uT23So4NI5qBb2dytyFPw=;
 b=iRBgWtOvmYhBb98GFZ8Bz36GzBFRrmNl6D4W9Tyuu4ThQmP54GjZ54Eh
 Jfs9u9durzXj4fWS0E7LLUxx9Xztl059QoSKRLQxry0/0WuNCvwHDipOq
 oI37231FBKPY5xG4sfiOf2lNqiz4S/O+kMUURjwvcfmsahTR3Ol/3ubik
 Hig11P0dTP6AOT2GYkYS1ET0gWe76oZ2ApKhaqFiv0vg5qKX3ozfkW4kD
 03ZUAQCPdjRrSUEO1TUDUlp6BDXLwkRbAKz0Tp+le2EToRxm+1j86itrV
 UOYSnz17fy1gXcJq956XA8z9rLbATIZj2md/TMSQDz0Fag++Ic+mlS5g9 w==;
X-CSE-ConnectionGUID: d5SKrQyERLK2JlDi/COd+g==
X-CSE-MsgGUID: 9Z1TqimZR4GB6o0vuulpKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42281675"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42281675"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 00:01:22 -0700
X-CSE-ConnectionGUID: LbyWxwyPRZe1Bs0w+MI/NQ==
X-CSE-MsgGUID: Zs8XQfn8R7Wu0mKySARTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="124503541"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO [10.245.118.0])
 ([10.245.118.0])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 00:01:21 -0700
Message-ID: <bf969c79-9e03-4a21-99ca-6e8197515a1c@linux.intel.com>
Date: Mon, 10 Mar 2025 08:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Integrate_k?=
 =?UTF-8?Q?memleak_scans_in_igt=5Frunner_=28rev6=29?=
To: igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20250307093426.90479-1-peter.senna@linux.intel.com>
 <174151755169.8813.10481170897966899845@18a75f3d1eae>
Content-Language: en-US
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
In-Reply-To: <174151755169.8813.10481170897966899845@18a75f3d1eae>
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

On 09.03.2025 11:52, Patchwork wrote:
> == Series Details ==
> 
> Series: Integrate kmemleak scans in igt_runner (rev6)
> URL   : https://patchwork.freedesktop.org/series/143996/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8265_full -> XEIGTPW_12726_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12726_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12726_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12726_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@xe_eudebug_sriov@deny-eudebug:
>     - shard-dg2-set2:     NOTRUN -> [SKIP][1]
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12726/shard-dg2-464/igt@xe_eudebug_sriov@deny-eudebug.html
>     - shard-lnl:          NOTRUN -> [SKIP][2]
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12726/shard-lnl-5/igt@xe_eudebug_sriov@deny-eudebug.html
>     - shard-bmg:          NOTRUN -> [SKIP][3]
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12726/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html
> 
>   * igt@xe_oa@buffer-size:
>     - shard-lnl:          NOTRUN -> [FAIL][4]
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12726/shard-lnl-7/igt@xe_oa@buffer-size.html

These are unrelated to my change.

Thank you,

Peter

[...]
