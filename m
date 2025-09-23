Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2358CAC5A5
	for <igt-dev@archiver.kernel.org>; Tue, 23 Sep 2025 06:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A374410E565;
	Tue, 23 Sep 2025 06:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nZ59NhYv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B7210E565
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Sep 2025 06:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758607308; x=1790143308;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tpLx+Eh8P7vHwE5alPgZHUp5XA1qlk9TIK+uATRSvCk=;
 b=nZ59NhYvQLvvS78i/KKvpgOt1M80McP101Gfa/qHWotxMqVQ5PfzZQ8e
 oaycGOn0ch4kD4gnIrEiLRkaVLTJh9deL+EVPDp7hZi2+iEiUJHphb/db
 eVieksld9aF3wcpxGePNG1FK5CN8GqxPvugh77I4nB5/zYTH9lRco2IvG
 pAIiLvfEjKVuTmuzWLDCBmdT+xdfqHzQhB3i9WrLWs/O6N/nlpQuKplLd
 Y37AMBQBFH0a30FTgK1f1DSe7kaQlCox6XPdQ+we0hvnim79KjOQ7Kvrt
 iGyimx1Ucm5/8LIY7sQ8pFwfhvNGgm7WkAngK8mRugFXJh2AK3jLknB9Z Q==;
X-CSE-ConnectionGUID: n0e475S+QpK0TPCJba2L7g==
X-CSE-MsgGUID: ZqZrMYDQTKWab5asJNiDIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60579774"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="60579774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:01:48 -0700
X-CSE-ConnectionGUID: NJ+omQUlSLWjrIoOzNBjSQ==
X-CSE-MsgGUID: +xe/BbPURJCZrZQ/VZgSkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; d="scan'208";a="176516827"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.223])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 23:01:47 -0700
Date: Tue, 23 Sep 2025 08:01:43 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jan Maslak <jan.maslak@intel.com>
Cc: igt-dev@lists.freedesktop.org, gwan-gyeong.mun@intel.com, 
 andrzej.hajda@intel.com
Subject: Re: [PATCH 1/4] lib/gpgpu_shader: Add num_threads_in_tg to shader
 struct
Message-ID: <2dtqjq6am5elehp3r5cchrfyt4yuiiilct3alugxk5cyn3ulbz@ridazbezsoeu>
References: <20250917165541.85203-1-jan.maslak@intel.com>
 <20250917165541.85203-2-jan.maslak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917165541.85203-2-jan.maslak@intel.com>
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

On Wed, Sep 17, 2025 at 04:55:38PM +0000, Jan Maslak wrote:
> Add parameter num_threads_in_tg inside the gpgpu_shader struct, so that it
> can be accessed and set from within the tests.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>

LGTM,

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  lib/gpgpu_shader.c | 3 +++
>  lib/gpgpu_shader.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index a63af0d23..e8600de23 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -116,6 +116,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>  							      4 * shdr->size);
>  	idd = intel_bb_ptr_get(ibb, interface_descriptor);
>  	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
> +	idd->desc6.num_threads_in_tg = shdr->num_threads_in_tg;
>  
>  	if (sip && sip->size)
>  		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
> @@ -178,6 +179,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>  	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
>  				       4 * shdr->size, &idd);
>  	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
> +	idd.desc5.num_threads_in_tg = shdr->num_threads_in_tg;
>  
>  	if (shdr->vrt != VRT_DISABLED)
>  		idd.desc2.registers_per_thread = shdr->vrt;
> @@ -279,6 +281,7 @@ struct gpgpu_shader *gpgpu_shader_create(int fd)
>  	shdr->max_size = 16 * 4;
>  	shdr->code = malloc(4 * shdr->max_size);
>  	shdr->labels = igt_map_create(igt_map_hash_32, igt_map_equal_32);
> +	shdr->num_threads_in_tg = 1;
>  	shdr->vrt = VRT_DISABLED;
>  	igt_assert(shdr->code);
>  
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index ca996d574..90ef3eec8 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -28,6 +28,7 @@ struct gpgpu_shader {
>  	};
>  	struct igt_map *labels;
>  	bool illegal_opcode_exception_enable;
> +	uint32_t num_threads_in_tg;
>  	enum gpgpu_shader_vrt_modes vrt;
>  };
>  
> -- 
> 2.34.1
> 
