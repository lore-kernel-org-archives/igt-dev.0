Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273BACF319D
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 07:50:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF9610E6B2;
	Wed,  2 Oct 2024 07:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRmOgGo/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B6B10E6B2
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727855405; x=1759391405;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=jtgsSuOUBTNp+dXAgpQWQcrvRhhzPfoxc9HcCpFD9sQ=;
 b=VRmOgGo/WKHj7O+/RFJx9u7243UDwGbF1EyaIX24PxQjCqQcqtwFyQZL
 AJRjvO5OQtVF1XkPtacaMsS8Seb/GQ+CbtsMFlkNsXKR+8b/ucjevthLA
 bkbAFCzlg9o768m+tO5Vsfo1Av7BEGtJHXqQHnPwIMhTKW39joPt7DCJy
 Kd/G5s3PHrpDubQhbVWzAH2BwgDBDSkcPqo6WXvVdyNlnPckPSvEgjMmA
 hkFVoR24d0lZ1dgWxvoerMwmGihdRQ9HT2rlqD+Cdqx603Sw30RiISpjR
 NdNJTBB3bo72fn7giquK5gYu8IYfm4T9NTpQlFZKtMK1R2S/d64wRcXLJ w==;
X-CSE-ConnectionGUID: Z/+3kwPySL2rtVsZ3aftjA==
X-CSE-MsgGUID: eqDlGaTgQ6e4QDkdepb7ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27145588"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27145588"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 00:50:05 -0700
X-CSE-ConnectionGUID: sT3l3BQjS6WY65eyhDWgVg==
X-CSE-MsgGUID: u+IYgX5KSeeFmQwJxDu4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="78671796"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.15])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 00:50:03 -0700
Date: Wed, 2 Oct 2024 09:50:00 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH i-g-t 2/2] tests/xe_exec_sip: Write on invalidinstr
Message-ID: <20241002075000.ygzmnjgytw4z4lpz@zkempczy-mobl2>
References: <20240925133003.41959-1-christoph.manszewski@intel.com>
 <20240925133003.41959-3-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240925133003.41959-3-christoph.manszewski@intel.com>
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

On Wed, Sep 25, 2024 at 03:30:03PM +0200, Christoph Manszewski wrote:
> Currently we use 'gpgpu_shader__write_on_exception' only in a negative
> way which causes the write not happening in the default (passing) case.
> Change one of the usages to positive, to ensure the expected value has
> been written.
> 
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/intel/xe_exec_sip.c | 80 ++++++++++++++++++++++++---------------
>  1 file changed, 49 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index ed27d9c32..2294468c2 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -27,10 +27,12 @@
>  #define WIDTH 64
>  #define HEIGHT 64
>  
> -#define COLOR_C4 0xc4
> +#define COLOR_C4 0xc4c4c4c4
>  
>  #define SHADER_CANARY 0x01010101
> -#define SIP_CANARY 0x02020202
> +#define SHADER_CANARY2 0x02020202
> +#define SIP_CANARY 0x03030303
> +#define SIP_CANARY2 0x04040404
>  
>  enum shader_type {
>  	SHADER_HANG,
> @@ -71,7 +73,7 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
>  static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
>  {
>  	static struct gpgpu_shader *shader;
> -	uint32_t bad;
> +	uint32_t expected_cr0_bit;
>  
>  	shader = gpgpu_shader_create(fd);
>  	if (shader_type == SHADER_INV_INSTR_WALKER_ENABLED)
> @@ -92,15 +94,17 @@ static struct gpgpu_shader *get_shader(int fd, enum shader_type shader_type)
>  		__attribute__ ((fallthrough));
>  	case SHADER_INV_INSTR_DISABLED:
>  	case SHADER_INV_INSTR_WALKER_ENABLED:
> -		bad = (shader_type == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
> -		gpgpu_shader__write_on_exception(shader, 1, 0, 0, ILLEGAL_OPCODE_ENABLE, bad);
> +		expected_cr0_bit = shader_type == SHADER_INV_INSTR_DISABLED ?
> +				   0 : ILLEGAL_OPCODE_ENABLE;
> +		gpgpu_shader__write_on_exception(shader, SHADER_CANARY2, 1, 0,
> +						 ILLEGAL_OPCODE_ENABLE, expected_cr0_bit);
>  		gpgpu_shader__nop(shader);
>  		gpgpu_shader__nop(shader);
>  		/* modify second nop, set only opcode bits[6:0] */
>  		shader->instr[gpgpu_shader_last_instr(shader)][0] = 0x7f;
> -		/* SIP should clear exception bit */
> -		bad = ILLEGAL_OPCODE_STATUS;
> -		gpgpu_shader__write_on_exception(shader, 2, 0, 0, ILLEGAL_OPCODE_STATUS, bad);
> +		/* SIP should clear exception bit, negative check */
> +		gpgpu_shader__write_on_exception(shader, SHADER_CANARY2, 0, 0,
> +						 ILLEGAL_OPCODE_STATUS, ILLEGAL_OPCODE_STATUS);
>  		break;
>  	}
>  
> @@ -120,7 +124,8 @@ static struct gpgpu_shader *get_sip(int fd, enum sip_type sip_type, unsigned int
>  
>  	switch (sip_type) {
>  	case SIP_INV_INSTR:
> -		gpgpu_shader__write_on_exception(sip, 1, 0, y_offset, ILLEGAL_OPCODE_STATUS, 0);
> +		gpgpu_shader__write_on_exception(sip, SIP_CANARY2, 0, y_offset,
> +						 ILLEGAL_OPCODE_STATUS, 0);
>  		break;
>  	default:
>  		break;
> @@ -135,7 +140,7 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>  			     enum sip_type sip_type, unsigned int threads, unsigned int width,
>  			     unsigned int height)
>  {
> -	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
> +	struct intel_buf *buf = create_fill_buf(fd, width, height, (uint8_t)COLOR_C4);
>  	struct gpgpu_shader *sip = get_sip(fd, sip_type, height / 2);
>  	struct gpgpu_shader *shader = get_shader(fd, shader_type);
>  
> @@ -148,59 +153,72 @@ static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, enum shader_type shad
>  	return buf->handle;
>  }
>  
> -static void check_fill_buf(uint8_t *ptr, const int width, const int x,
> -			   const int y, const uint8_t color)
> +static void check_fill_buf(uint32_t *ptr, const int dword_width, const int x, const int y,
> +			   const uint32_t color)
>  {
> -	const uint8_t val = ptr[y * width + x];
> +	const uint32_t val = ptr[y * dword_width + x];
>  
>  	igt_assert_f(val == color,
> -		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
> +		     "Expected 0x%08x, found 0x%08x at (%d,%d)\n",
>  		     color, val, x, y);
>  }
>  
> -static void check_buf(int fd, uint32_t handle, int width, int height,
> -		      enum shader_type shader_type, enum sip_type sip_type, uint8_t poison_c)
> +static void check_buf(int fd, uint32_t handle, int width, int height, int thread_count_expected,
> +		      enum shader_type shader_type, enum sip_type sip_type, uint32_t poison_c)
>  {
> +	int thread_count = 0, sip_count = 0, invalidinstr_count = 0;
>  	unsigned int sz = ALIGN(width * height, 4096);
> -	int thread_count = 0, sip_count = 0;
> +	const uint32_t dword_width = width / 4;
>  	uint32_t *ptr;
>  	int i, j;
>  
>  	ptr = xe_bo_mmap_ext(fd, handle, sz, PROT_READ);
>  
> -	for (i = 0, j = 0; j < height / 2; ++j) {
> -		if (ptr[j * width / 4] == SHADER_CANARY) {
> +	for (i = 1, j = 0; j < height / 2; ++j) {
> +		if (ptr[j * dword_width] == SHADER_CANARY)
>  			++thread_count;
> -			i = 4;
> +		else
> +			check_fill_buf(ptr, dword_width, 0, j, poison_c);
> +
> +		if (ptr[j * dword_width + 1] == SHADER_CANARY2) {
> +			++invalidinstr_count;
> +			++i;
>  		}
>  
> -		for (; i < width; i++)
> -			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
> +		for (; i < dword_width; i++)
> +			check_fill_buf(ptr, dword_width, i, j, poison_c);
>  
> -		i = 0;
> +		i = 1;
>  	}
>  
>  	for (i = 0, j = height / 2; j < height; ++j) {
> -		if (ptr[j * width / 4] == SIP_CANARY) {
> +		if (ptr[j * dword_width] == SIP_CANARY) {
>  			++sip_count;
>  			i = 4;
>  		}
>  
> -		for (; i < width; i++)
> -			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
> +		for (; i < dword_width; i++)
> +			check_fill_buf(ptr, dword_width, i, j, poison_c);
>  
>  		i = 0;
>  	}

I thought to simplify above to avoid looping twice, especially you've
added x position in write_on_exception(). This would require to write
SHADER_CANARY on x == 0, SHADER_CANARY2 on x == 1, SHADER_SIP on x == 2
and SHADER_SIP2 on x == 3. I think this would make code clearer, especially
you wouldn't need to double the surface size. But this is not a blocker
for this patch, especially it is doing what I asked for (proves
write_on_exception() has the reflection in the memory).

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  
>  	igt_assert(thread_count);
> -	if (shader_type == SHADER_INV_INSTR_DISABLED)
> -		igt_assert(!sip_count);
> -	else if (sip_type == SIP_INV_INSTR && shader_type != SHADER_INV_INSTR_DISABLED)
> +
> +	if (shader_type >= SHADER_INV_INSTR_DISABLED &&
> +	    shader_type <= SHADER_INV_INSTR_WALKER_ENABLED)
> +		igt_assert_f(thread_count == invalidinstr_count,
> +			     "Thread and invalid instruction count mismatch, %d != %d\n",
> +			     thread_count, invalidinstr_count);
> +	else
> +		igt_assert_eq(invalidinstr_count, 0);
> +
> +	if (sip_type == SIP_INV_INSTR && shader_type != SHADER_INV_INSTR_DISABLED)
>  		igt_assert_f(thread_count == sip_count,
>  			     "Thread and SIP count mismatch, %d != %d\n",
>  			     thread_count, sip_count);
>  	else
> -		igt_assert(sip_count == 0);
> +		igt_assert_eq(sip_count, 0);
>  
>  	munmap(ptr, sz);
>  }
> @@ -270,7 +288,7 @@ static void test_sip(enum shader_type shader_type, enum sip_type sip_type,
>  	intel_bb_sync(ibb);
>  	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
>  
> -	check_buf(fd, handle, width, height, shader_type, sip_type, COLOR_C4);
> +	check_buf(fd, handle, width, height, threads, shader_type, sip_type, COLOR_C4);
>  
>  	gem_close(fd, handle);
>  	intel_bb_destroy(ibb);
> -- 
> 2.34.1
> 
