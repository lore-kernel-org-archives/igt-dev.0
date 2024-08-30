Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86905CA0FE1
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 11:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3870E10EA99;
	Fri, 30 Aug 2024 11:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7tbgedD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA5410EA95
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 11:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725018851; x=1756554851;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mGYStIDSdUaxH3mYckNIdT7L4+tR/DldMEFhZKZDPJI=;
 b=P7tbgedDlQFaxAxjN+M3BAC0mis4Z1xb0lfSbDuHEpJ1UPtaZNRUOvWy
 IvDmLi7LiKhCkKolS+oZmb0RfiDtnnfaUr4FRAsK5k8a2QQhSjq2flieO
 dO0jW4nuQaa8nW3TJ7Qmwsdbqwo1y19iXQXmY8+rcVUPJECTc6R5h2BGa
 RLsOMChYf3mV/xoxWiQJ/HLg+RxnyiAwNVn3P62i2VNTdi1hHJX/nYSL6
 qeoUW/ki8DgCyKau8n0Nn4Dpn3J5Aiwql/Jh+HFgdvapBHKW3ia+ED1Cu
 uLFJWYAC9bvXJG+viLcMk/nQeH8ONsnkqScNSKkN6cChBvVTTydvL3cbx Q==;
X-CSE-ConnectionGUID: AXz3Ma+iTTeVYz5Wcv0L5A==
X-CSE-MsgGUID: 4aD9ylqBTyWgpM5RxqkYbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="13296421"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="13296421"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 04:54:10 -0700
X-CSE-ConnectionGUID: 72022Cv+TSGrox31luvaPw==
X-CSE-MsgGUID: LrNgBqpXSZSpwmG7sGcwUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; d="scan'208";a="68720276"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2024 04:54:07 -0700
Date: Fri, 30 Aug 2024 13:54:03 +0200
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
Subject: Re: [PATCH i-g-t v5 09/17] tests/xe_exec_sip: Introduce invalid
 instruction tests
Message-ID: <20240830115403.nielctid6n532lea@zkempczy-mobl2>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
 <20240829144547.105371-10-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829144547.105371-10-christoph.manszewski@intel.com>
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

On Thu, Aug 29, 2024 at 04:45:39PM +0200, Christoph Manszewski wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Xe2 and earlier gens are able to handle very limited set of invalid
> instructions - only illegal and undefined opcodes, other errors in
> instruction can cause undefined behavior.
> Illegal/undefined opcode results in:
> - setting illegal opcode status bit - cr0.1[28],
> - calling SIP if illegal opcode bit is enabled - cr0.1[12].
> cr0.1[12] can be enabled directly from the thread or by thread dispatcher
> from Interface Descriptor Data provided to COMPUTE_WALKER instruction.
> 
> Implemented cases:
> - check if SIP is not called when exception is not enabled,
> - check if SIP is called when exception is enabled from EU thread,
> - check if SIP is called when exception is enabled from COMPUTE_WALKER
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Mika Kuoppala <mika.kuoppala@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_exec_sip.c | 118 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 108 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> index 3b46f5618..5384979a6 100644
> --- a/tests/intel/xe_exec_sip.c
> +++ b/tests/intel/xe_exec_sip.c
> @@ -30,12 +30,25 @@
>  #define COLOR_C4 0xc4
>  
>  #define SHADER_CANARY 0x01010101
> +#define SIP_CANARY 0x02020202
>  
>  enum shader_type {
>  	SHADER_HANG,
> +	SHADER_INV_INSTR_DISABLED,
> +	SHADER_INV_INSTR_THREAD_ENABLED,
> +	SHADER_INV_INSTR_WALKER_ENABLED,
>  	SHADER_WRITE,
>  };
>  
> +enum sip_type {
> +	SIP_INV_INSTR,
> +	SIP_NULL,
> +};
> +
> +/* Control Register cr0.1 bits for exception handling */
> +#define ILLEGAL_OPCODE_ENABLE BIT(12)
> +#define ILLEGAL_OPCODE_STATUS BIT(28)
> +
>  static struct intel_buf *
>  create_fill_buf(int fd, int width, int height, uint8_t color)
>  {
> @@ -58,8 +71,12 @@ create_fill_buf(int fd, int width, int height, uint8_t color)
>  static struct gpgpu_shader *get_shader(int fd, const int shadertype)
>  {
>  	static struct gpgpu_shader *shader;
> +	uint32_t bad;
>  
>  	shader = gpgpu_shader_create(fd);
> +	if (shadertype == SHADER_INV_INSTR_WALKER_ENABLED)
> +		shader->illegal_opcode_exception_enable = true;
> +
>  	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
>  
>  	switch (shadertype) {
> @@ -70,19 +87,59 @@ static struct gpgpu_shader *get_shader(int fd, const int shadertype)
>  		break;
>  	case SHADER_WRITE:
>  		break;
> +	case SHADER_INV_INSTR_THREAD_ENABLED:
> +		gpgpu_shader__set_exception(shader, ILLEGAL_OPCODE_ENABLE);
> +		__attribute__ ((fallthrough));

Just be curious - on which gcc you're observing this warning without
fallthrough attribute? clang explicitely requires -Wimplicit-fallthrough
to enable this warning.

> +	case SHADER_INV_INSTR_DISABLED:
> +	case SHADER_INV_INSTR_WALKER_ENABLED:
> +		bad = (shadertype == SHADER_INV_INSTR_DISABLED) ? ILLEGAL_OPCODE_ENABLE : 0;
> +		gpgpu_shader__write_on_exception(shader, 1, 0, ILLEGAL_OPCODE_ENABLE, bad);
> +		gpgpu_shader__nop(shader);
> +		gpgpu_shader__nop(shader);
> +		/* modify second nop, set only opcode bits[6:0] */
> +		shader->instr[shader->size / 4 - 1][0] = 0x7f;

This pattern 'shader->size / 4 - 1' deserves own macro or inline
like last_instr(shader) or similar.

> +		/* SIP should clear exception bit */
> +		bad = ILLEGAL_OPCODE_STATUS;
> +		gpgpu_shader__write_on_exception(shader, 2, 0, ILLEGAL_OPCODE_STATUS, bad);
> +		break;
>  	}
>  
>  	gpgpu_shader__eot(shader);

I would add one blank line before return on all functions in which
return is glued with the code.

>  	return shader;
>  }
>  
> -static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype,
> +static struct gpgpu_shader *get_sip(int fd, const int siptype, unsigned int y_offset)
> +{
> +	static struct gpgpu_shader *sip;
> +
> +	if (siptype == SIP_NULL)
> +		return NULL;
> +
> +	sip = gpgpu_shader_create(fd);
> +	gpgpu_shader__write_dword(sip, SIP_CANARY, y_offset);
> +
> +	switch (siptype) {
> +	case SIP_INV_INSTR:
> +		gpgpu_shader__write_on_exception(sip, 1, y_offset, ILLEGAL_OPCODE_STATUS, 0);
> +		break;
> +	}
> +
> +	gpgpu_shader__end_system_routine(sip, false);

Ditto.

> +	return sip;
> +}
> +
> +static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, const int shadertype, const int siptype,
>  			     unsigned int threads, unsigned int width, unsigned int height)
>  {
>  	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
> +	struct gpgpu_shader *sip = get_sip(fd, siptype, height / 2);
>  	struct gpgpu_shader *shader = get_shader(fd, shadertype);
>  
> -	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, 1, threads, shader, sip, 0, 0);
> +
> +	if (sip)
> +		gpgpu_shader_destroy(sip);
> +
>  	gpgpu_shader_destroy(shader);

Ditto.

>  	return buf->handle;
>  }
> @@ -98,10 +155,10 @@ static void check_fill_buf(uint8_t *ptr, const int width, const int x,
>  }
>  
>  static void check_buf(int fd, uint32_t handle, int width, int height,
> -		      uint8_t poison_c)
> +		      int shadertype, int siptype, uint8_t poison_c)
>  {
>  	unsigned int sz = ALIGN(width * height, 4096);
> -	int thread_count = 0;
> +	int thread_count = 0, sip_count = 0;
>  	uint32_t *ptr;
>  	int i, j;
>  
> @@ -119,7 +176,27 @@ static void check_buf(int fd, uint32_t handle, int width, int height,
>  		i = 0;
>  	}
>  
> +	for (i = 0, j = height / 2; j < height; ++j) {
> +		if (ptr[j * width / 4] == SIP_CANARY) {
> +			++sip_count;
> +			i = 4;
> +		}
> +
> +		for (; i < width; i++)
> +			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
> +
> +		i = 0;
> +	}
> +
>  	igt_assert(thread_count);
> +	if (shadertype == SHADER_INV_INSTR_DISABLED)
> +		igt_assert(!sip_count);
> +	else if (siptype == SIP_INV_INSTR && shadertype != SHADER_INV_INSTR_DISABLED)
> +		igt_assert_f(thread_count == sip_count,
> +			     "Thread and SIP count mismatch, %d != %d\n",
> +			     thread_count, sip_count);
> +	else
> +		igt_assert(sip_count == 0);
>  
>  	munmap(ptr, sz);
>  }
> @@ -143,8 +220,20 @@ xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
>   *
>   * SUBTEST: sanity-after-timeout
>   * Description: check basic shader execution after job timeout
> + *
> + * SUBTEST: invalidinstr-disabled
> + * Description: Verify that we don't enter SIP after running into an invalid
> + *		instruction when exception is not enabled.
> + *
> + * SUBTEST: invalidinstr-thread-enabled
> + * Description: Verify that we enter SIP after running into an invalid instruction
> + *              when exception is enabled from thread.
> + *
> + * SUBTEST: invalidinstr-walker-enabled
> + * Description: Verify that we enter SIP after running into an invalid instruction
> + *              when exception is enabled from COMPUTE_WALKER.
>   */
> -static void test_sip(int shader, struct drm_xe_engine_class_instance *eci, uint32_t flags)
> +static void test_sip(int shader, int sip, struct drm_xe_engine_class_instance *eci, uint32_t flags)
>  {
>  	unsigned int threads = 512;
>  	unsigned int height = max_t(threads, HEIGHT, threads * 2);
> @@ -171,12 +260,12 @@ static void test_sip(int shader, struct drm_xe_engine_class_instance *eci, uint3

Likely I missed this in previous patch review, shader should be
enum, not int.

--
Zbigniew

>  	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
>  
>  	igt_nsec_elapsed(&ts);
> -	handle = gpgpu_shader(fd, ibb, shader, threads, width, height);
> +	handle = gpgpu_shader(fd, ibb, shader, sip, threads, width, height);
>  
>  	intel_bb_sync(ibb);
>  	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
>  
> -	check_buf(fd, handle, width, height, COLOR_C4);
> +	check_buf(fd, handle, width, height, shader, sip, COLOR_C4);
>  
>  	gem_close(fd, handle);
>  	intel_bb_destroy(ibb);
> @@ -204,17 +293,26 @@ igt_main
>  		fd = drm_open_driver(DRIVER_XE);
>  
>  	test_render_and_compute("sanity", fd, eci)
> -		test_sip(SHADER_WRITE, eci, 0);
> +		test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
>  
>  	test_render_and_compute("sanity-after-timeout", fd, eci) {
> -		test_sip(SHADER_HANG, eci, 0);
> +		test_sip(SHADER_HANG, SIP_NULL, eci, 0);
>  
>  		xe_for_each_engine(fd, eci)
>  			if (eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
>  			    eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE)
> -				test_sip(SHADER_WRITE, eci, 0);
> +				test_sip(SHADER_WRITE, SIP_NULL, eci, 0);
>  	}
>  
> +	test_render_and_compute("invalidinstr-disabled", fd, eci)
> +		test_sip(SHADER_INV_INSTR_DISABLED, SIP_INV_INSTR, eci, 0);
> +
> +	test_render_and_compute("invalidinstr-thread-enabled", fd, eci)
> +		test_sip(SHADER_INV_INSTR_THREAD_ENABLED, SIP_INV_INSTR, eci, 0);
> +
> +	test_render_and_compute("invalidinstr-walker-enabled", fd, eci)
> +		test_sip(SHADER_INV_INSTR_WALKER_ENABLED, SIP_INV_INSTR, eci, 0);
> +
>  	igt_fixture
>  		drm_close_driver(fd);
>  }
> -- 
> 2.34.1
> 
