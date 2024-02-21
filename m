Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13629C48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 08:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F5210E256;
	Wed, 21 Feb 2024 08:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f3/jIYY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354A610E256
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 08:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708504891; x=1740040891;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WibBZvJFpDWR/EzfbEVMW98g2cxUDYwsN+JVnnSkUuI=;
 b=f3/jIYY8/LinGyu4+sco/Rwcc/obWRM5gGDCnecBLtYrNNc/OohSWDOc
 WSUteUr3bQ5SZcDUULRfFs4RrspqYBVXhmbryldjWb+Bv7Y4AzGELcfGa
 ch13FLRyi0Jg9/Mload9y86X2ADN1BQ412MnUw8u4gZBFH8zk2qvcYBiu
 x/KcSf5PEWZt1+xatuci7wXIrdgIiMwOmi0LFEDehnlqZDwPOqV3noP4d
 q5x1/ozKQW0Klcrn1sBAK73uP56DL0iAy2P+DJp5KA3shQKJpZl044O6Q
 lOZBcUo26FM+k4ztLxFm/2Z+l8RJ7Eu7TAqZbaKlzkbCHhk+WzCpTNAjE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2519065"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2519065"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 00:41:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="28217019"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 00:41:28 -0800
Date: Wed, 21 Feb 2024 09:41:25 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Hung, Alex" <Alex.Hung@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
Subject: Re: tests/amdgpu/amd_ilr: Fix psr eDP crc read timeout IGT CI test
 failure need hep
Message-ID: <20240221084125.72yrvhjy6njnte4x@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Wu, Hersen" <hersenxs.wu@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Hung, Alex" <Alex.Hung@amd.com>,
 "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>
References: <PH8PR12MB696282278F678780346276A0FD502@PH8PR12MB6962.namprd12.prod.outlook.com>
 <PH8PR12MB69628159E1CE801CA868386DFD502@PH8PR12MB6962.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PH8PR12MB69628159E1CE801CA868386DFD502@PH8PR12MB6962.namprd12.prod.outlook.com>
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

Hi Wu,,
On 2024-02-20 at 18:37:13 +0000, Wu, Hersen wrote:
> [AMD Official Use Only - General]
> 
> Hi Kamil,
> 
> Amd_ilr test (https://patchwork.freedesktop.org/series/129382/) is for AMD GPU only.
> There are test failures or warnings on Intel GPU. Such as,
> ▼ Fi.CI.IGT failure (See full logs)<https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10687/index.html>
> 
> I check log of test and confirm failures are not related to amd_ilr.
> I’d like to know if I should do for this IGT CI test failure.
> 
> Thanks!
> Hesen
> 

No special action, you could replay to CI letter that it is unrelated,
if it will have more than seven day you could ignore it.

In the body of CI letter there is e-mail which you can use if you want
your patchset be green, I collected two addresses:

Cc: I915-ci-infra@lists.freedesktop.org
Cc: lgci.bug.filing@intel.com

Btw pay attention when you will change common igt lib code, it
can have some impact on all other tests.

Regards,
Kamil

> 
> 
> 
> 
> 
