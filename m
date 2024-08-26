Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93327C5321E
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 11:13:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468C610E1A6;
	Mon, 26 Aug 2024 11:13:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JXCV3CIP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1B2E10E1A6
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 11:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724670826; x=1756206826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Wcq5OG8Lp/ShERtQ8dtl4OdzhKNXR3SrByjK9iGaxo8=;
 b=JXCV3CIPcQBmN3vcqWTzN5SbzrDOFt3w3wYb1u1f79ooR1F1mjiZm0av
 /pigttSyuBNuRJTODO12QxVHuJQWherqJ+6TMLpO4kUNdpMAFc4+4CRph
 tP7HHlpNk62Ry1mMdFzTg1jK/Ea5DX1y5yhPxzgMenxok8ukzEpZx2LET
 u6P9cwJ7UMUFG04URmxNYwuyBymPAsrMIXQa4H+925FZzwtLm75//V0KS
 7riemsTjNztX/HbpHcsNd4QtGisNQ803uQbrgqa1XlOXTB1lsp7+U4Qlm
 gr9sCjYvqVjTPW9PjKIZJe3dArSTvZHoey1Fnj5Hl17TXW39RUN+mbM+e A==;
X-CSE-ConnectionGUID: m9keXOmfQuSdnXo6L+HaQw==
X-CSE-MsgGUID: MTrL6McWQsmCDU+5snKQcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22952489"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="22952489"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 04:13:45 -0700
X-CSE-ConnectionGUID: 2H9wRC+AT/WzKM085BIpkw==
X-CSE-MsgGUID: Ns0VeWkHQL66TWNOqkXsEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62632603"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 04:13:41 -0700
Date: Mon, 26 Aug 2024 13:13:39 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>,
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Subject: Re: [PATCH i-g-t v4 08/17] lib/gpgpu_shader: Allow enabling illegal
 opcode exceptions in shader
Message-ID: <20240826111339.yne2miwgychead26@zkempczy-mobl2>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
 <20240823182222.305965-9-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823182222.305965-9-christoph.manszewski@intel.com>
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

On Fri, Aug 23, 2024 at 08:22:13PM +0200, Christoph Manszewski wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Illegal opcode exceptions can be enabled in interface descriptor data
> passed to COMPUTE_WALKER instruction.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Acked-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  lib/gpgpu_shader.c | 4 ++++
>  lib/gpgpu_shader.h | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 1616c1942..4e61a548f 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -103,6 +103,7 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>  		      struct gpgpu_shader *sip,
>  		      uint64_t ring, bool explicit_engine)
>  {
> +	struct gen8_interface_descriptor_data *idd;
>  	uint32_t interface_descriptor, sip_offset;
>  	uint64_t engine;
>  
> @@ -113,6 +114,8 @@ __xelp_gpgpu_execfunc(struct intel_bb *ibb,
>  	interface_descriptor = gen8_fill_interface_descriptor(ibb, target,
>  							      shdr->instr,
>  							      4 * shdr->size);
> +	idd = intel_bb_ptr_get(ibb, interface_descriptor);
> +	idd->desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
>  
>  	if (sip && sip->size)
>  		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
> @@ -163,6 +166,7 @@ __xehp_gpgpu_execfunc(struct intel_bb *ibb,
>  
>  	xehp_fill_interface_descriptor(ibb, target, shdr->instr,
>  				       4 * shdr->size, &idd);
> +	idd.desc2.illegal_opcode_exception_enable = shdr->illegal_opcode_exception_enable;
>  
>  	if (sip && sip->size)
>  		sip_offset = fill_sip(ibb, sip->instr, 4 * sip->size);
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 0bbeae66f..26a117a0b 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -22,6 +22,7 @@ struct gpgpu_shader {
>  		uint32_t (*instr)[4];
>  	};
>  	struct igt_map *labels;
> +	bool illegal_opcode_exception_enable;
>  };
>  
>  struct iga64_template {
> -- 
> 2.34.1
> 

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
