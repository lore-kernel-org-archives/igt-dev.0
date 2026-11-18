Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CC4606A338
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lNk7jjLK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28AA10FDDB;
	Wed, 18 Nov 2026 15:31:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56DD210FDD2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015788; x=1826551788;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=iEnoRsV1IyIwN4dVzfL+dxW6OAwMK1QIJm3cWetqlW8=;
 b=lNk7jjLKw6LnKVgR9ymaZMFRoeoqdzboDG7cz7rtfupHOETEVo0sNOAL
 lD9oBwnq9OudIcTAqtN7YJakHu8fjy1kCXScLYFRtkpHSGyzgyXhxVNKh
 JEnsS8OOhNDuirBswkW2hl77GTDHxsKhiBI2aXeCVL4BU0m2D2KgG4SIu
 lG5awFOdci+o8gLRQBqQF52NEVdfwA5XaBNg+pG2VicyW2Yet/GOzq/Hk
 b6zGxrkB1DoZ4+mwv9QCLNrTKsBEibdElUo6nS3/+ugEbejGGDRyAeBe+
 xPVadrEYQe5Zai+eA7+5IkGLYZnYiA4Al2zDR/dZo9SCAEfNQhmNVuRs8 w==;
X-CSE-ConnectionGUID: ceJtGzjQR0inTaHLIeFEQQ==
X-CSE-MsgGUID: hvxceu+NSlSaY6WZEtaFRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3711822"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3711822"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:29:47 -0800
X-CSE-ConnectionGUID: iZfxvlnLSl60GzgTPlfKLg==
X-CSE-MsgGUID: pa5DRuniQQudL7Vg103tDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10258495"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:29:46 -0800
Date: Wed, 18 Nov 2026 16:29:43 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH 2/2] tests/intel/xe_prefetch_fault: re-generate shaders
Message-ID: <6nm2tjci2euk7k3uruq5hr2ux7g72gjftcorwn2dk4oiywmm5r@a3hm7dziu2ki>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
References: <20261118-rebuild_shaders-v1-0-92bf629f4f27@intel.com>
 <20261118-rebuild_shaders-v1-2-92bf629f4f27@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-rebuild_shaders-v1-2-92bf629f4f27@intel.com>
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

Hi Andrzej,
On 2026-11-18 at 15:47:20 +0100, Andrzej Hajda wrote:
> After recent changes to shaders codes were not re-generated.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> index b5fdec567089..fe0edfe866b7 100644
> --- a/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> +++ b/tests/intel/xe_prefetch_fault.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 546bddbd13ed40a4cc520c886248c178
> +#define MD5_SUM_IGA64_ASMS ba37a1e020e016887839753e42d4eb01
>  
>  struct iga64_template const iga64_code_xe_l2_prefetch_fault_prefetch[] = {
>  	{ .gfx_ver = 3500, .size = 28, .code = (const uint32_t []) {
> 
> -- 
> 2.55.0
> 
