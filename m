Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A33606A320
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K5Cx5lMq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F10210FDD4;
	Wed, 18 Nov 2026 15:30:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6419B10FDE2
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795015765; x=1826551765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FzxTZ+bZkeI/5QaciVcdl7b5RmtB0ygna9BHz3EzbjQ=;
 b=K5Cx5lMq/4108bJBA8Gi9Qb+Q3q+O/w+Ek79RVT9JW2V+yuTDtgOsN0R
 Zd9XB6wr68nwY0mTjyMFW08Uc9muklLn4aeW50LI+zR20d3Sjr3dcR9Dj
 tu0WD1R6kiVKnWkTTXMjYtOaN8gfuTOcugRLgh/Z5eLA/gQr9sisgUkaV
 y9vMffoDQLhrG7PguxPJTukurXe0tyOQh1Pv4P9A4ApTl4xfQzqySCVYp
 Fntulb38LrFa2uwSU7tHenR1X4vBvnzIlZYeRenOkSvyu+B2Sykcn2wGR
 WlhXvfD2dfgYGJE/jc7ulvAia5x1op753OLnQc4W0dp0B69Fpqc4PU+dU g==;
X-CSE-ConnectionGUID: J1BlR2ITSJyLUjSCzV3OQA==
X-CSE-MsgGUID: o5/u6wNUT9yZVvz5PPNn7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3723398"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3723398"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:29:25 -0800
X-CSE-ConnectionGUID: y1WWfv8DRSGrQZvu1uIYIA==
X-CSE-MsgGUID: pc2upIkpQTqtMun4zMq+ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10263372"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:29:24 -0800
Date: Wed, 18 Nov 2026 16:29:02 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH 1/2] lib/gpgpu: re-generate shaders
Message-ID: <vqfw7tjdhb7zyqq24yjxmu4p6yrrdzr7yk33jb3hpguqqevqvi@75r3dzz4d54b>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, igt-dev@lists.freedesktop.org, 
 Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
References: <20261118-rebuild_shaders-v1-0-92bf629f4f27@intel.com>
 <20261118-rebuild_shaders-v1-1-92bf629f4f27@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261118-rebuild_shaders-v1-1-92bf629f4f27@intel.com>
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
On 2026-11-18 at 15:47:19 +0100, Andrzej Hajda wrote:
> After recent changes to shaders codes were not re-generated.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/gpgpu_fill.c.gen.iga64_codes.c   | 2 +-
>  lib/gpgpu_shader.c.gen.iga64_codes.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/gpgpu_fill.c.gen.iga64_codes.c b/lib/gpgpu_fill.c.gen.iga64_codes.c
> index 467a2686f86c..b10e1544ba66 100644
> --- a/lib/gpgpu_fill.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_fill.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 0a2221edb21775cf2319cd7240765ec4
> +#define MD5_SUM_IGA64_ASMS 2d1cdb2fd7d6e9b7f605a91a9d431c9d
>  
>  struct iga64_template const iga64_code_xe3p_gpgpu_fill[] = {
>  	{ .gfx_ver = 3500, .size = 144, .code = (const uint32_t []) {
> diff --git a/lib/gpgpu_shader.c.gen.iga64_codes.c b/lib/gpgpu_shader.c.gen.iga64_codes.c
> index c03914a69a7e..cb36998670db 100644
> --- a/lib/gpgpu_shader.c.gen.iga64_codes.c
> +++ b/lib/gpgpu_shader.c.gen.iga64_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS a428d5bacd5eeee4ee187971ec476f48
> +#define MD5_SUM_IGA64_ASMS 0c79cb03ae27f62406e222cb2f485de6
>  
>  struct iga64_template const iga64_code_read_a64_d32[] = {
>  	{ .gfx_ver = 2000, .size = 40, .code = (const uint32_t []) {
> 
> -- 
> 2.55.0
> 
