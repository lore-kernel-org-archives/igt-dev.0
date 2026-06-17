Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A865CCD98F0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 12:50:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F63E10E713;
	Wed, 17 Jun 2026 12:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IPaAGqpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2825310E713
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 12:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781700595; x=1813236595;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pLp4ON2kCaoKKgG8/8ZD0X4IfKBsFDzOj1Cz7HzcoQQ=;
 b=IPaAGqpxEeor9WGoWIfpZi8XQtU6EcZEoKU6QZz8VWBo1hgcsP/JgrTy
 yPb2a1POYQQWYQD6Fcd3LiFs/orAXMY6R0RS3R6pMm9AoLHj3Cm5uqa/2
 2D+x9uuczpBxeD56SjWhGnlDmb3xNvyx8EUPS9766YourUy3y3K9pTESn
 zByyJOHHCyFYzt0uVWHY/0I0Y1m/DKuyqvv55AlJ6tOIqTNoxza3Emj/F
 nDcYmyR0hsE0uzDL+qd49PWE+Q0QsrZuYvOxj/1ataEte4fNM1uZ96vta
 J/XvvrMk+liv2lJl3KLAi0fvcBN8sHO4YHkmkxft/nX5Oq8qqAxKG9C37 Q==;
X-CSE-ConnectionGUID: GOWQtFQ1QtKQpyYKnyO0dA==
X-CSE-MsgGUID: ysQeyiGhQ6aoStsLKFE/AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82499132"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82499132"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 05:49:54 -0700
X-CSE-ConnectionGUID: jRdZCdSTTder8oE+HBNTnQ==
X-CSE-MsgGUID: MpWxsvHAQE+IBEjVHhgqQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="252363153"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 05:49:52 -0700
Date: Wed, 17 Jun 2026 14:49:48 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
Subject: Re: [PATCH 2/2] tests/panthor/panthor_vm: Add vm_bind
 intersect-with-kbo-range test
Message-ID: <20260617124948.buvoihk3cnxltx5e@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, igt-dev@lists.freedesktop.org,
 kernel@collabora.com
References: <20260616-panthor-vmbind-checkaddr-v1-0-f35b1b067f7c@collabora.com>
 <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260616-panthor-vmbind-checkaddr-v1-2-f35b1b067f7c@collabora.com>
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

Hi Adrián,
On 2026-06-16 at 16:43:23 +0100, Adrián Larumbe wrote:
> Users of vm_bind ioctl() should never specify a VA region that intersects
> with that reserved for internal kernel BOs.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
> ---
>  tests/panthor/panthor_vm.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/tests/panthor/panthor_vm.c b/tests/panthor/panthor_vm.c
> index 92b105b9e83a..9548dbcbaa45 100644
> --- a/tests/panthor/panthor_vm.c
> +++ b/tests/panthor/panthor_vm.c
> @@ -270,6 +270,23 @@ int igt_main() {
>  		igt_panthor_vm_destroy(fd, vm_id, 0);
>  	}
>  
> +	igt_describe("Perform a vm_bind in the VM's kernel BOs reserved range");
> +	igt_subtest("vm_bind_intersect_kbo_range") {

In our Intel tests we use '-' as word separator, so there is
igt@this_is_test_name@and-this-is-subtest-name

But it is only out naming convention, yours can differ.

LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

PS. I could merge it now or should I wait for others to review?

> +		uint32_t vm_id;
> +		struct panthor_bo bo;
> +		uint64_t bo_size = SZ_2M;
> +		uint64_t uva_range;
> +
> +		igt_panthor_vm_create_userva_range(fd, &vm_id, 0, &uva_range);
> +		igt_assert(vm_id != 0);
> +
> +		igt_panthor_bo_create(fd, &bo, bo_size, 0, 0);
> +		igt_panthor_vm_bind(fd, vm_id, bo.handle, ALIGN(uva_range, bo_size),
> +				    bo_size, DRM_PANTHOR_VM_BIND_OP_TYPE_MAP, EINVAL);
> +
> +		igt_panthor_vm_destroy(fd, vm_id, 0);
> +	}
> +
>  	igt_fixture() {
>  		drm_close_driver(fd);
>  	}
> 
> -- 
> 2.54.0
> 
