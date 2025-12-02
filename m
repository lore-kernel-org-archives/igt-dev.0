Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72975CFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 09:43:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19BB10E5CF;
	Tue,  2 Dec 2025 09:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IkKA4qWL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6434E10E5CF
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 09:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764668588; x=1796204588;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=6DVmUISF3Rd32mhBTWuuvRxW8UqDatU7msS1WJsenT8=;
 b=IkKA4qWLFadheyqPcQAq8WrRmwzbHj62ti27XHNvp14fweG7fSITkIBg
 gyOwtafAgsUlftyTlj5sVnSKIq4UPXaRhdKPA6eaPGOSVgHoLbzrY/oEh
 IwKCf6kd0uE49oeK3Y3vnjYID6TapzxONkbYaJOUmFT6FbH5BuuZMbYtg
 ZiuiB1A+kLm2zJwpBM216408nWrp3nfVshJxxLdPnEDmvRxmPsyUrybWi
 q7pqJ5vYvux1NMjc87PbYaTLYjTmC+5CZKNwMqqZ847t389fFHG2mvfKv
 KT8gcfJqduMkBGs6EKAgt1J3NiGa5EDvebneVqpqIxQKb2eebOhpDGi3S A==;
X-CSE-ConnectionGUID: m5S/oXkvQ+yRVSdxSw+znw==
X-CSE-MsgGUID: zlO3aCoCR3C8ou7y86qbaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77315356"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="77315356"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:43:08 -0800
X-CSE-ConnectionGUID: cb4vqq2qTZqTYimEy++qqA==
X-CSE-MsgGUID: 6GtoJW0GSF24zzHkRkI7Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="198791397"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 01:43:07 -0800
Date: Tue, 2 Dec 2025 10:43:03 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 igt-dev@lists.freedesktop.org, David Yat Sin <David.YatSin@amd.com>
Subject: Re: [PATCH v2] tests/amdgpu/amd_bo: Add UMQ-based HDP =?utf-8?Q?f?=
 =?utf-8?B?bHVzaCBWUkFN4oaSR1RU?= coherency test v2
Message-ID: <20251202094303.zdk3lz7pvdngxzzx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 igt-dev@lists.freedesktop.org, David Yat Sin <David.YatSin@amd.com>
References: <20251201185947.292015-1-srinivasan.shanmugam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201185947.292015-1-srinivasan.shanmugam@amd.com>
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

Hi Srinivasan,
On 2025-12-02 at 00:29:47 +0530, Srinivasan Shanmugam wrote:
> Introduce a UMQ-only coherency test that validates host HDP flush behaviour
> using MMIO_REMAP and a VRAM→GTT linear copy. The flow performs one PASS-A

Please do not use non-ascii chars in subject nor description, here
it is better 'VRAM to GTT'

Also in subject no need for 'test v2':

[PATCH v2] tests/amdgpu/amd_bo: Add UMQ-based HDP flush VRAM to GTT coherency test

Regards,
Kamil

> (with flush) and one PASS-B (without flush) to detect whether CPU writes
> propagate without an explicit HDP poke.
> 
> v2:
>  - Move all local declarations to the top of their blocks. (Vitaly)
>  - No functional changes from v1; logic and test flow remain identical.
> 
> TODO: A kernel patch enabling this path is pending merge; once it lands,
> the Link below can serve as the stable reference.
> 
> Link: https://patchwork.freedesktop.org/series/153209/#rev5
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: David Yat Sin <David.YatSin@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  tests/amdgpu/amd_bo.c | 296 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 296 insertions(+)
> 
[cut]
