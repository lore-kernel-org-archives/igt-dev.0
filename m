Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8A7C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 09:10:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD1610E885;
	Wed, 26 Feb 2025 09:10:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L8fL6s5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867A710E885
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740561003; x=1772097003;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Eon2GhkOGPcqt5sW0XJgUf4TVj/LDUtThxzb9e+1OKc=;
 b=L8fL6s5Hj/PjXxaiDKH2baH9X4DH0zmOSjMm9NusUuQSwAbyACCsmQ4a
 aWHncB+e0fRdOMhBuafl4O37yOTpGmEEnxoCy3hUpoMVmMlH+6rUaThRz
 ZPjENUh496+oAclkM1k719efdPJAjFNvymmyfbP4rUPVpbpvwbwpYhN1X
 okJ7Q+63iaIGpItfo8+dcW74i/RYBteQP5JQ0sryqAEUoqa1w17gl1+no
 edVBMxRZfOw8JYSmAttpz4wZHVSetJesODrMr8wyI1TUGSckIspb0PqsQ
 9pCrWkN4Pr2VJQP4FJcEGnwnsCCX9PVdyxx3ZmXFU/o1yr9FWRvzg0Nby A==;
X-CSE-ConnectionGUID: uBmaCrnVTvmO1ilw8YYldg==
X-CSE-MsgGUID: Z7kra2qGR+WSd2gRLbRC2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="58932630"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; d="scan'208";a="58932630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:10:03 -0800
X-CSE-ConnectionGUID: 4IDQ8hRnQAa0KBA1Ye15+A==
X-CSE-MsgGUID: IE6nd3LhRDiPStw6qBIFVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120760225"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.62])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 01:10:01 -0800
Date: Wed, 26 Feb 2025 10:09:58 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: vitaly prosyak <vprosyak@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 vitaly.prosyak@amd.com, igt-dev@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Harry Wentland <harry.wentland@amd.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: Re: [PATCH] lib/amd: add memleak functions
Message-ID: <20250226090958.32igx6wiy4svxw3h@zkempczy-mobl2>
References: <20250218114341.122653-1-vitaly.prosyak@amd.com>
 <20250219104149.npgbvmtr5vikkkhr@kamilkon-desk.igk.intel.com>
 <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93281b6c-1ae1-426e-aae7-46974d355532@amd.com>
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

On Wed, Feb 19, 2025 at 12:50:49PM -0500, vitaly prosyak wrote:
> Hi Kamil,
> 
> Thanks for raising this question. Currently, only a single test uses the memleak feature. However, we are planning to add more. This effort requires careful selection, as we want to avoid unnecessary overhead or burden. Enabling the memleak configuration significantly slows down test execution—potentially increasing the duration by 2-3 times.
> 
> Additionally, we aim to reach internal consensus on which tests should have this feature enabled. We also want to avoid enabling both KASAN and memleak simultaneously. These considerations are the reason for the delay.
> 
> Thanks for your understanding!
> 
> Vitaly

+Peter

Peter proposed solution which is global and vendor agnostic. I mean
his changes https://patchwork.freedesktop.org/series/143996/
allow you to selectively run with kmemleak on using runner (-k).
Together with proper list selection passed to the runner you're
able to run only tests which you want to check for memory leaks.

--
Zbigniew

> 
> On 2025-02-19 05:41, Kamil Konieczny wrote:
> > Hi Vitaly,
> > On 2025-02-18 at 06:43:41 -0500, vitaly.prosyak@amd.com wrote:
> >> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >>
> >> refactor memory leak functions and add
> >> them to the library for reuse across different tests.
> >>
> >> Cc: Christian Koenig <christian.koenig@amd.com>
> >> Cc: Alexander Deucher <alexander.deucher@amd.com>
> >> Cc: Jesse Zhang <jesse.zhang@amd.com>
> >> Cc: Harry Wentland <harry.wentland@amd.com>
> >>
> >> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >> ---
> >>  lib/amdgpu/amd_mem_leak.c   | 112 ++++++++++++++++++++++++++++++++++++
> >>  lib/amdgpu/amd_mem_leak.h   |  17 ++++++
> >>  lib/meson.build             |   1 +
> >>  tests/amdgpu/amd_mem_leak.c |  88 ++--------------------------
> >>
> > [...cut...]
> >
> > Why moving to library when there is only one user?
> >
> > Regards,
> > Kamil
> >
