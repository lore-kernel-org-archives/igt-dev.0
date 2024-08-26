Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21942C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 10:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA2A310E166;
	Mon, 26 Aug 2024 10:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JvzpC6sD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8414E10E166
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724666707; x=1756202707;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=VrAF+tTfLGpKpXywQW8sJRF3z+8DS8jberdWAKhgreE=;
 b=JvzpC6sDyBNSogMvE7DWe9tegcLhgX4TXVEMR+d8OD0oXYCA6L+oeGFM
 902sdqgsWxthAWLCDtrhMJlCb6CqWTs/K9SHOAWBaU0gjc8rsbPJ9/fjc
 UrDGx8t7SnWbxw2ZIRYBKvr8LHjx0uSmLFVNp9cKynle0h0goQ0m3TpTn
 W5fEsAi6KkSYMRTX+Qe08c5KIRd4GgyXMl2X6SaJB9QEW/Mb9SBZ2iiq6
 w1QCSQpba1QJvUCIN6i642E2Yo08Y/rrgdlo4KH8srL76j8f9c1AKOAMe
 9syKcHAF+/lUM/b8nEA9HIGXQTEIM0CleuycigGbYwNGb3UdfGuBhZeUM g==;
X-CSE-ConnectionGUID: hCRAo0flRMSV56Dl3qUvkA==
X-CSE-MsgGUID: IwwPHrLhTX6L8tdaoAjMEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="22666947"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="22666947"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:05:06 -0700
X-CSE-ConnectionGUID: INP4XXnSTZqeKUPlLJtlWQ==
X-CSE-MsgGUID: td/xnY0ZQZK41R+M5un6Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; d="scan'208";a="62147080"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 03:05:03 -0700
Date: Mon, 26 Aug 2024 12:05:00 +0200
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
Subject: Re: [PATCH i-g-t v4 06/17] lib/gpgpu_shader: Add set/clear exception
 register (cr0.1) helpers
Message-ID: <20240826100500.5u7tgf4dtwfhs2q7@zkempczy-mobl2>
References: <20240823182222.305965-1-christoph.manszewski@intel.com>
 <20240823182222.305965-7-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240823182222.305965-7-christoph.manszewski@intel.com>
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

On Fri, Aug 23, 2024 at 08:22:11PM +0200, Christoph Manszewski wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> To allow enabling and handling exceptions from shader and siplet
> proper helpers should be provided.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpgpu_shader.c          | 28 ++++++++++++++++++++++
>  lib/gpgpu_shader.h          |  2 ++
>  lib/iga64_generated_codes.c | 48 ++++++++++++++++++++++++++++++++++++-
>  3 files changed, 77 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 920db0be2..1616c1942 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -628,6 +628,34 @@ void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  	", 2, y_offset, 3, value, value, value, value);
>  }
>  
> +/**
> + * gpgpu_shader__clear_exception:
> + * @shdr: shader to be modified
> + * @value: exception bits to be cleared
> + *
> + * Clear provided bits in exception register: cr0.1 &= ~value.
> + */
> +void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value)
> +{
> +	emit_iga64_code(shdr, clear_exception, "		\n\
> +(W)	and (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud	\n\
> +	", ~value);
> +}
> +
> +/**
> + * gpgpu_shader__set_exception:
> + * @shdr: shader to be modified
> + * @value: exception bits to be set
> + *
> + * Set provided bits in exception register: cr0.1 |= value.
> + */
> +void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value)
> +{
> +	emit_iga64_code(shdr, set_exception, "		\n\
> +(W)	or (1|M0) cr0.1<1>:ud cr0.1<0;1,0>:ud ARG(0):ud	\n\
> +	", value);
> +}
>

LGTM:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

+
>  /**
>   * gpgpu_shader__write_on_exception:
>   * @shdr: shader to be modified
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 76ff4989e..0bbeae66f 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -66,6 +66,8 @@ void gpgpu_shader__common_target_write(struct gpgpu_shader *shdr,
>  				       uint32_t y_offset, const uint32_t value[4]);
>  void gpgpu_shader__common_target_write_u32(struct gpgpu_shader *shdr,
>  				     uint32_t y_offset, uint32_t value);
> +void gpgpu_shader__clear_exception(struct gpgpu_shader *shdr, uint32_t value);
> +void gpgpu_shader__set_exception(struct gpgpu_shader *shdr, uint32_t value);
>  void gpgpu_shader__end_system_routine(struct gpgpu_shader *shdr,
>  				      bool breakpoint_suppress);
>  void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 695e921fa..b9d1f6f0a 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 872801f6be6b8c5141d85b9d5eb466cd
> +#define MD5_SUM_IGA64_ASMS ff21151a5dd5398ffc2e0404e9b6f605
>  
>  struct iga64_template const iga64_code_end_system_routine_step_if_eq[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -218,6 +218,52 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>  	}}
>  };
>  
> +struct iga64_template const iga64_code_set_exception[] = {
> +	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
> +		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +		0x80000966, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x80000966, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80000166, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_clear_exception[] = {
> +	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
> +		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +		0x80000965, 0x80118220, 0x02008010, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x80000965, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80000165, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
>  struct iga64_template const iga64_code_media_block_write[] = {
>  	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
>  		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> -- 
> 2.34.1
> 
