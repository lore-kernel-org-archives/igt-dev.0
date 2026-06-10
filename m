Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A5ECD8CB2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Jun 2026 14:22:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D922F10E9C8;
	Wed, 10 Jun 2026 14:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ug8xyMua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2342810E9C6
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Jun 2026 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781101297; x=1812637297;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=2eyLxfl8sceGOhgk0SE95HLl6LPHTMIiWF+AfTQK4aM=;
 b=Ug8xyMuaGI9obYlvCJ2O88jyyzgOyIndnh39Er7+7Eri6X2Zyiuju/PS
 z8AXQsfUkwcTO2AZ1oLWc9o8VUEqgd2Q1Sco1NyPYIydX1FjQTpj9Qv8R
 PpCx0Oh4Xyh6h2aT8rZ9ej6rO5Hy/Dh7Mrbq51b9pvLwx7fpy380XppuE
 IdKRIH2njqw1bcU49SrvRM8MEkKh+0/bardzc/fAdsLTL9l08B775zje8
 65cnozNq38HNl75M5FFNxY6jFv5NMGV2Efss4+2fbCgidtDOPcxkPGPYA
 Y4IyA0MIK65Y++cgTAaz0bzrrHMBJMWr3gIl0O0PuHfHn9AgMrJ/vpnLo g==;
X-CSE-ConnectionGUID: 1uiUSevlS7qAYC4HvRrZ0Q==
X-CSE-MsgGUID: gPa1TNj1TzS/McPhgcNYdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="85737723"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="85737723"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 07:21:34 -0700
X-CSE-ConnectionGUID: vtx8RS2ARTqpTx8xr/kF5w==
X-CSE-MsgGUID: JXrsGG3vTd2bKZMF75f3QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246044716"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 07:21:33 -0700
Date: Wed, 10 Jun 2026 16:21:29 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>
Cc: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] tests/amdgpu: Add amd_lockdep test for lock ordering
 validation
Message-ID: <20260610142129.log22brfpoxzxuip@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20260604005925.127581-1-vitaly.prosyak@amd.com>
 <DM4PR12MB5152C2F5994FCF4154687214E3102@DM4PR12MB5152.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM4PR12MB5152C2F5994FCF4154687214E3102@DM4PR12MB5152.namprd12.prod.outlook.com>
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

Hi Zhang,,
On 2026-06-04 at 01:02:30 +0000, Zhang, Jesse(Jie) wrote:
> AMD General
> 
> Reviewd-by: " Jesse Zhang <jesse.zhang@amd.com>"

s/Reviewd-by:/Reviewed-by:/

Please do not use '"' this way, when you have only ascii chars
you could ommit that, so:

Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>

There could be '"' in case someone name has UTF-8 chars or some
other which could break tooling, like comma ','. In such cases,
use '"' only for name, before e-mail, like

Reviewed-by: "Jesse Zhang" <jesse.zhang@amd.com>

If you are in a hurry you could write 'You could add my r-b for
this patch/series'.

Regards,
Kamil

> 
> > -----Original Message-----
> > From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
> > Sent: Thursday, June 4, 2026 8:59 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
> > Subject: [PATCH] tests/amdgpu: Add amd_lockdep test for lock ordering validation
> >
> > From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> >
> > Exercise lock-heavy GPU code paths concurrently to trigger lockdep warnings
> > when lock ordering is violated. Requires kernel built with
> > CONFIG_PROVE_LOCKING=y and amdgpu lockdep annotation patch.

[cut]
