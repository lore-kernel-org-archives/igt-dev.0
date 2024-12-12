Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D7EE7717F
	for <igt-dev@archiver.kernel.org>; Thu, 12 Dec 2024 19:17:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF02510E301;
	Thu, 12 Dec 2024 19:17:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Re9I9QxA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 099E910E301;
 Thu, 12 Dec 2024 19:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734031077; x=1765567077;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+qxyi4aKMRoYXreFd3Z2hdlEW1fT20SMnJz/o48wQMk=;
 b=Re9I9QxADQHip6jJ4Leviob8niKkqyN2w9grokyZK6XXHZk4KJJSn5nU
 z+Mhno54faI0Nvh/8roXAqM931Hn+2gK3xdqCucCGildWAGaTuSsvDu7n
 KfP01B6o/HSWy7BG4oX7uq40a95n0kZOl09uezpKbu6/gOxTl0ZHhji+F
 bVhqfVcV/0t74fDGk0W5LPPGBTRJRKOGEgIMce+d326LLVhnZhQemZG2F
 J+Zj/a+JZ6DVW6QhYA8W9E+YWsiP0EjOUJ7gmLJKqJ44PlKJ+6MriRL4/
 3F2YFHkEum0DrOvvRqEHpkyRFv0MwQxwCNQo+pUH0n2UL3RC6tsZ+KDi3 w==;
X-CSE-ConnectionGUID: KT7zGmEoRyimDwGFsPhplQ==
X-CSE-MsgGUID: MXQgxnCfQgmWLVgqzve61A==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="44943449"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="44943449"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2024 11:17:57 -0800
X-CSE-ConnectionGUID: POIjI8wRSy2ZSUcYuoPPkw==
X-CSE-MsgGUID: dvh9o71cTt25Hu754kJimg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,229,1728975600"; d="scan'208";a="101352569"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 11:17:56 -0800
Date: Thu, 12 Dec 2024 20:17:53 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: I915-ci-infra@lists.freedesktop.org
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw=?= =?utf-8?Q?=3A?= failure for Fix
 dist building with iga64 codes script
Message-ID: <20241212191753.js3urzg3sb254fiz@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, I915-ci-infra@lists.freedesktop.org
References: <20241212105231.49481-1-kamil.konieczny@linux.intel.com>
 <173402722484.1683112.5397657921764172473@b555e5b46a47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <173402722484.1683112.5397657921764172473@b555e5b46a47>
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
On 2024-12-12 at 18:13:44 -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Fix dist building with iga64 codes script
> URL   : https://patchwork.freedesktop.org/series/142473/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from XEIGT_8150_full -> XEIGTPW_12305_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with XEIGTPW_12305_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in XEIGTPW_12305_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
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
>   Here are the unknown changes that may have been introduced in XEIGTPW_12305_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
>     - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
>    [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
>    [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12305/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html
> 
>   * igt@xe_exec_balancer@once-cm-virtual-basic:
>     - shard-bmg:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
>    [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8150/shard-bmg-6/igt@xe_exec_balancer@once-cm-virtual-basic.html
>    [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12305/shard-bmg-2/igt@xe_exec_balancer@once-cm-virtual-basic.html
> 

Unrelated,

Regards,
Kamil

>   
> Known issues
> ------------
> 
>   Here are the changes found in XEIGTPW_12305_full that come from known issues:
> 
> ### IGT changes ###
> 
...cut...
> 
> Build changes
> -------------
> 
>   * IGT: IGT_8150 -> IGTPW_12305
>   * Linux: xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292 -> xe-2362-7b441ab54824526dd570dfbfbef51bcd2ba4c5b5
> 
>   IGTPW_12305: 0932f2e7c292a51f7699665c8c6dce1fd6f4ccaa @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   IGT_8150: 7812065f4aebab1629b570bd78ef71e09480b359 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>   xe-2356-b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292: b34d1ff04eaa0ed48ef25f1d758d2a55f7c3c292
>   xe-2362-7b441ab54824526dd570dfbfbef51bcd2ba4c5b5: 7b441ab54824526dd570dfbfbef51bcd2ba4c5b5
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12305/index.html
