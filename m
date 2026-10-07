Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16845CA5FF1
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 13:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0D0510E20C;
	Wed,  7 Oct 2026 13:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PDipoNWn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D85DC10F5EE
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 13:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791381187; x=1822917187;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=61k62HYyNzOarT07ZYtGGhztJ5zBofa2e/OLZCM+0LA=;
 b=PDipoNWnDHG7cLQBKxOSZshZV54KKJh1qhXh6NMJYBAM2Jm16+InZhUS
 cOM0VFnHhu7JdmUbIHvJgyPhaWYWyWNiDWRm69cw9ieiKOTJHj0aacr1q
 aTdX39UsezxaHK/GXE40h/5j8er1U0yJB+zqQdSs577514kMVxgeEkiOO
 YKZAbKxj/22KTvL/3QIWbM1elGU5a87g/Jq40wutJ2h9qLNFuOTVdkLou
 68SD1SyDZTJwdlzwQAWkQzYMSh6JNk5igHwbCqpxnOD2tUFi5a9ipgjOp
 2IvW/cav3YMYfAaw93oKtsQOlG2R0FG1VHg/km0lB8IJ3E6quO80xP7FR w==;
X-CSE-ConnectionGUID: ASZsAAFrRGCO7TWK6PU2AA==
X-CSE-MsgGUID: PuOIz/VgQp2+2K8d3Q0GCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="137231"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="137231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 06:53:06 -0700
X-CSE-ConnectionGUID: SoQnkVzIS0SU7IKJVpCeTw==
X-CSE-MsgGUID: n5sPgseQR5ew1iozQcKWrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="285377882"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:53:05 -0700
Date: Wed, 7 Oct 2026 15:53:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIFhlLkNJLkZVTEw6IGZhaWx1cg==?= =?utf-8?Q?e?= for
 lib/pciids: sync with kernel commit 682b943f1547
Message-ID: <20261007135303.dzqf3gwuqtkfwhbb@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20261005063943.2638847-1-himanshu.girotra@intel.com>
 <179118974541.239246.2561991615486442754@61270ab9df2a>
 <CH0PR11MB55648B1BB0A609084A85F9E598962@CH0PR11MB5564.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CH0PR11MB55648B1BB0A609084A85F9E598962@CH0PR11MB5564.namprd11.prod.outlook.com>
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

Hi Girotra,,
On 2026-10-05 at 09:16:16 +0000, Girotra, Himanshu wrote:
> Hi, the below failures are not related to my change.
> 
> Thanks

Please cut your responses after 'Known failures', until you
want to comment on some of them. See below.

> --Himanshu
> From: Patchwork <patchwork@emeril.freedesktop.org>
> Sent: 05 October 2026 14:12
> To: Girotra, Himanshu <himanshu.girotra@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: ✗ Xe.CI.FULL: failure for lib/pciids: sync with kernel commit 682b943f1547
> 
> Patch Details
> Series:
> lib/pciids: sync with kernel commit 682b943f1547
> URL:
> https://patchwork.freedesktop.org/series/175538/
> State:
> failure
> Details:
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15938/index.html
> CI Bug Log - changes from XEIGT_9126_FULL -> XEIGTPW_15938_FULL
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with XEIGTPW_15938_FULL absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_15938_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org<mailto:I915-ci-infra@lists.freedesktop.org>) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (3 -> 3)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in XEIGTPW_15938_FULL:
> 
> IGT changes
> Possible regressions
> 
>   *   igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
> 
>      *   shard-bmg: PASS<https://intel-gfx-ci.01.org/tree/intel-xe/IGT_9126/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html> -> FAIL<https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15938/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
> 
> New tests
> 
> New tests have been introduced between XEIGT_9126_FULL and XEIGTPW_15938_FULL:
> 
> New IGT tests (3)
> 
>   *   igt@kms_cursor_crc@cursor-size-hints@pipe-a-dp-2:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.67] s
> 
>   *   igt@kms_cursor_crc@cursor-size-hints@pipe-c-edp-1:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [1.42] s
> 
>   *   igt@kms_cursor_crc@cursor-size-hints@pipe-d-dp-2:
> 
>      *   Statuses : 1 pass(s)
>      *   Exec time: [0.50] s
> 
> Known issues
> 
> Here are the changes found in XEIGTPW_15938_FULL that come from known issues:
> 
[cut]



Regards,
Kamil
