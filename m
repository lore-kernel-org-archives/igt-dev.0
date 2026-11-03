Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AF8606A327
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SLUZu2tC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E798410E07F;
	Tue,  3 Nov 2026 12:48:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D16610E07F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793710076; x=1825246076;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XBbtUq7Q02A6f6XTJMkBlKMWBcCg51cyDMC8SD9FAas=;
 b=SLUZu2tCQIBKzpOKohH1EJ8HUTlAVuCMwQlUf+S1QsVNi8Iau9q7T1Dm
 TuSgpdAcNOhIfm4ljxJBBLm97TRiH8G4RMGLZ9Ar/HYiuqL1oOw2SAf9C
 qgZ9wdIM62u+N31C/65j6U0d00V/raY8StOyF2RBiRlSn5yB5+oXECQ9y
 tBDXGrGS3Sn1VrLOxvCNHat2krKi9TWuDU+lj9pt15HaP/CFcCKHp2LlW
 RejDkJOpj/3/egmq13BDI9btNyo5bWfcqFiV4nXcJu1/6htWhV7cxaBqC
 qCCByMVzQ/4NqtpqA74tbEUDscDk7ufGn73DUfIlFaA7K7QPdI6/c+MtO Q==;
X-CSE-ConnectionGUID: jOFCWu4ZQJq2Csovw3EZ+Q==
X-CSE-MsgGUID: jIUGWEjeTAKEVDebn6LnDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2315927"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2315927"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:47:56 -0800
X-CSE-ConnectionGUID: sZqPrvQKSAWwfUDi+l5fRg==
X-CSE-MsgGUID: rBRXeoNxRP6gtUB4qOSsFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6572655"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 04:47:53 -0800
Date: Tue, 3 Nov 2026 13:47:32 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Cc: igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Felix Kuehling <felix.kuehling@amd.com>, Lancelot Six <lancelot.six@amd.com>, 
 James Zhu <james.zhu@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
 Samuel Pitoiset <hakzsam@gmail.com>, Natalie Vock <natalie.vock@gmx.de>, 
 Timur =?utf-8?Q?Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH] tests/amdgpu: Add SLTH validation tests for trap
 handling and trap return.
Message-ID: <rx6mv4bwvbf7wtudfwv552majaxiasayt7ed6pmdw2y2loesnq@l2otmnrbjdnf>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 igt-dev@lists.freedesktop.org, 
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>, 
 Lancelot Six <lancelot.six@amd.com>, James Zhu <james.zhu@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, 
 Samuel Pitoiset <hakzsam@gmail.com>, Natalie Vock <natalie.vock@gmx.de>, 
 Timur =?utf-8?Q?Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20261102152147.1456213-1-srinivasan.shanmugam@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261102152147.1456213-1-srinivasan.shanmugam@amd.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Srinivasan,
On 2026-11-02 at 20:51:47 +0530, Srinivasan Shanmugam wrote:
> SLTH allows a shader to trigger a trap, execute a trap
> handler, return from the trap, and continue shader
> execution.
> 
> This patch adds validation tests to verify that each step
> of this flow works correctly.
> 
[cut]
> 
> Together, these tests verify trap entry, trap handler
> execution, trap return, VGPR state preservation across
> trap return, and correct resumption of shader execution.
> 
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: Felix Kuehling <felix.kuehling@amd.com>
> Cc: Lancelot Six <lancelot.six@amd.com>
> Cc: James Zhu <james.zhu@amd.com>
> Cc: Lijo Lazar <lijo.lazar@amd.com>
> Cc: Samuel Pitoiset <hakzsam@gmail.com>
> Cc: Natalie Vock <natalie.vock@gmx.de>
> Cc: Timur Kristóf <timur.kristof@gmail.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h         |   18 +-

Please make changes to UAPI in separate commit, also note to which
public tree you sync, drm-next or some other, and write a commit
hash. If it is not drm-next, imho write also a link to lore.kernel.org
so anyone can see and pull your kernel change.

For example see commit a31c48a76e8849084afd70331484a019d55d82f8
drm-uapi/xe: sync with kernel f99a05cc0b85

Regards,
Kamil

>  lib/amdgpu/shaders/amd_shader_store.h |  190 +++
>  tests/amdgpu/amd_basic.c              | 1860 +++++++++++++++++++++++--
>  3 files changed, 1928 insertions(+), 140 deletions(-)
> 
[cut]
