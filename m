Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDD1D2447B
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 06:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AC610EA3E;
	Fri, 11 Oct 2024 06:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UvJTWVMg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6909210EA3E
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728628753; x=1760164753;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=8iIMaRA/VbwXnvK32rFfL9hwZQxZpi6M6R36RpqvhEs=;
 b=UvJTWVMgeX90b1Ovn4acwS3GW404AuNTwQs1tISkM6YYju4i58DdX/9l
 6qXXUsROGdxvxAGYoMOv5aVC6KygfP0vcatZizfHSCch0C5I/pOY3AOG8
 jHmLvH2mvFKfbUvafXjpNEXOjTNt4nzvr/LWXHwNjRmsOtLBtiMxb17mJ
 G7bTsjdYP1npKhcz/jqSq6L0dqUIcMF4Z8hc9XuVaenjCCt5pm0t7S/5R
 igeNUC0hq3/Qj/D2YPNIhgByLoNdUOhYsm7eQ68XzsetkVlCOlROhGzLI
 UAgrS1Ds0Z9DmQd7JcBsvac5S2I+VGUkgsSdA81E3va1wsmTTSbPDf/oi Q==;
X-CSE-ConnectionGUID: fAdjsz2uSwS+0qjTFfT9cA==
X-CSE-MsgGUID: rMpjlqHWSVSEP/Sde3UlHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="50559114"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="50559114"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:39:13 -0700
X-CSE-ConnectionGUID: 3kyyae0gS0mg7OrGkzbZVg==
X-CSE-MsgGUID: Yokwtpz0QEKijzawk+LYmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="76823891"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.161])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 23:39:11 -0700
Date: Fri, 11 Oct 2024 08:39:07 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: Re: [PATCH v2] tests/xe_exec_sip: skip invalid instruction in SIP
 routine
Message-ID: <20241011063907.gceenm6zphsb33wd@zkempczy-mobl2>
References: <20241010-skip_invalid_instruction-v2-1-5766d861e2c5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-skip_invalid_instruction-v2-1-5766d861e2c5@intel.com>
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

On Thu, Oct 10, 2024 at 05:59:27PM +0200, Andrzej Hajda wrote:
> Exception handler (SIP) should skip invalid instruction,
> ie after return from SIP IP should point to the next instruction.
> Otherwise we risk undefined behavior.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2977
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Great, looks good to me.

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
> v2: resend due to malformed RCPT list.
> ---
>  lib/gpgpu_shader.c          | 14 ++++++++++++++
>  lib/gpgpu_shader.h          |  1 +
>  lib/iga64_generated_codes.c | 39 +++++++++++++++++++++++++++++++--------
>  tests/intel/xe_exec_sip.c   |  2 ++
>  4 files changed, 48 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index e88870bbb675..4e1b8d5e9009 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -593,6 +593,20 @@ void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset)
>  	", y_offset);
>  }
>  
> +/**
> + * gpgpu_shader__increase_aip:
> + * @shdr: shader to be modified
> + * @value: value to be added to AIP register
> + *
> + * Increase AIP by @value. Useful in SIP to skip instruction causing exception.
> + */
> +void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value)
> +{
> +	emit_iga64_code(shdr, write_aip, "					\n\
> +(W)	add (1|M0)		cr0.2:ud	cr0.2:ud	ARG(0):ud	\n\
> +	", value);
> +}
> +
>  /**
>   * gpgpu_shader__write_dword:
>   * @shdr: shader to be modified
> diff --git a/lib/gpgpu_shader.h b/lib/gpgpu_shader.h
> index 5f6260fb3a8f..c7c21c115c71 100644
> --- a/lib/gpgpu_shader.h
> +++ b/lib/gpgpu_shader.h
> @@ -80,6 +80,7 @@ void gpgpu_shader__end_system_routine_step_if_eq(struct gpgpu_shader *shdr,
>  						 uint32_t dw_offset,
>  						 uint32_t value);
>  void gpgpu_shader__write_aip(struct gpgpu_shader *shdr, uint32_t y_offset);
> +void gpgpu_shader__increase_aip(struct gpgpu_shader *shdr, uint32_t value);
>  void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
>  			       uint32_t y_offset);
>  void gpgpu_shader__write_on_exception(struct gpgpu_shader *shdr, uint32_t dw, uint32_t x_offset,
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 9f0be5cd336e..6638be07b356 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,7 +3,7 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM_IGA64_ASMS 8a479a91a5152263281914a99be4f4d4
> +#define MD5_SUM_IGA64_ASMS ec9d477415eebb7d6983395f1bcde78f
>  
>  struct iga64_template const iga64_code_gpgpu_fill[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
> @@ -204,7 +204,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>  		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
> -		0x84134031, 0x00000000, 0xd00e0494, 0x04000000,
> +		0x84132031, 0x00000000, 0xd00e0494, 0x04000000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> @@ -220,7 +220,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>  		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
> -		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>  		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> @@ -237,7 +237,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>  		0x80000965, 0x03058220, 0x02008010, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
> -		0x84134031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x84132031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> @@ -253,7 +253,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>  		0x80000965, 0x03058220, 0x02008020, 0xc0ded005,
>  		0x80000961, 0x30014220, 0x00000000, 0x00000000,
>  		0x80001a70, 0x00018220, 0x12000304, 0xc0ded006,
> -		0x80001a01, 0x00010000, 0x00000000, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
>  		0x81044031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> @@ -270,7 +270,7 @@ struct iga64_template const iga64_code_write_on_exception[] = {
>  		0x80000165, 0x03058220, 0x02008020, 0xc0ded005,
>  		0x80000161, 0x30014220, 0x00000000, 0x00000000,
>  		0x80000270, 0x00018220, 0x12000304, 0xc0ded006,
> -		0x8104a031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x81049031, 0x00000000, 0xc0000414, 0x02a00000,
>  		0x80000001, 0x00010000, 0x20000000, 0x00000000,
>  		0x80000001, 0x00010000, 0x30000000, 0x00000000,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> @@ -408,6 +408,29 @@ struct iga64_template const iga64_code_media_block_write[] = {
>  	}}
>  };
>  
> +struct iga64_template const iga64_code_write_aip[] = {
> +	{ .gen_ver = 2000, .size = 8, .code = (const uint32_t []) {
> +		0x80000940, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1270, .size = 8, .code = (const uint32_t []) {
> +		0x80000940, 0x80418220, 0x02008040, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1260, .size = 8, .code = (const uint32_t []) {
> +		0x80000940, 0x80218220, 0x02008020, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 8, .code = (const uint32_t []) {
> +		0x80000940, 0x80418220, 0x02008040, 0xc0ded000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80000140, 0x80418220, 0x02008040, 0xc0ded000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
>  struct iga64_template const iga64_code_media_block_write_aip[] = {
>  	{ .gen_ver = 2000, .size = 44, .code = (const uint32_t []) {
>  		0x80000961, 0x05050220, 0x00008020, 0x00000000,
> @@ -586,7 +609,7 @@ struct iga64_template const iga64_code_inc_r40_jump_neq[] = {
>  		0x80000040, 0x28058220, 0x02002804, 0x00000001,
>  		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>  		0x80000270, 0x00018220, 0x22002804, 0xc0ded000,
> -		0x81000020, 0x00004000, 0x00000000, 0xffffffd0,
> +		0x81000120, 0x00004000, 0x00000000, 0xffffffd0,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
> @@ -656,7 +679,7 @@ struct iga64_template const iga64_code_jump_dw_neq[] = {
>  		0x80049031, 0x1f0c0000, 0xc0001e0c, 0x02400000,
>  		0x80000061, 0x30014220, 0x00000000, 0x00000000,
>  		0x80002070, 0x00018220, 0x22001f04, 0xc0ded001,
> -		0x81000020, 0x00004000, 0x00000000, 0xffffff90,
> +		0x81000120, 0x00004000, 0x00000000, 0xffffff90,
>  		0x80000101, 0x00010000, 0x00000000, 0x00000000,
>  	}}
>  };
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index 2294468c2983..de33bdf2dd0f 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -126,6 +126,8 @@ static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, unsigned int
>  	case SIP_INV_INSTR:
>  		gpgpu_shader__write_on_exception(sip, SIP_CANARY2, 0, y_offset,
>  						 ILLEGAL_OPCODE_STATUS, 0);
> +		/* skip invalid instruction */
> +		gpgpu_shader__increase_aip(sip, 16);
>  		break;
>  	default:
>  		break;
> 
> ---
> base-commit: cc3fa4e36bb0445565f40f989540b9deacb92e12
> change-id: 20241010-skip_invalid_instruction-1ea5b45a0834
> 
> Best regards,
> -- 
> Andrzej Hajda <andrzej.hajda@intel.com>
> 
