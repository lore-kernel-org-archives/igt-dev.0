Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A723C25B5F
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 11:30:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C25510E97D;
	Fri, 10 May 2024 11:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRehe5ns";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F4210E74E
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 11:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715340620; x=1746876620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=iQ8yvdgUD0ebWMEhSoCuqCaBhYGipepe0ALP1jnhPk8=;
 b=VRehe5nso4WUsViPFi2qyKyN4w5j/6akCwl8JA5ryi40R/svqv9bIoDz
 HeCDN6YVh6+a2my1BTqywtj+nh2Z+MYRbMKT0sXgbbyOIf4xicCbTQuH/
 24e96dLETDKQ83HfZs0UqezadHu0GQ4fRjI7M4OOVWA8y0uMKVcRjOkUq
 Fiibq/s18Y90NdAVFX9NnGhqqxgN0ZbB8a2KInWGox9A0WQBqKBqkSnFP
 F9eKHqt2a9JCzN/v0nj1FzyURAvPJhZ1X2CDViZxecZqGYxdVRygILITY
 Ux/FaiCW0sd9je2krybzO8tkzdjc3UtB+7x/gzJaCmwykmX53Y4XOGWO0 g==;
X-CSE-ConnectionGUID: eiCUC5UHToapoOn8wNkHxw==
X-CSE-MsgGUID: zh6cYsD0SfyB50+qr6Yl+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="22714701"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="22714701"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 04:30:19 -0700
X-CSE-ConnectionGUID: 5M3eDvUBSCmQ7G+nyBSrhg==
X-CSE-MsgGUID: /WRcAew0Th+iqjmYNuCpjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="30143186"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 04:30:17 -0700
Date: Fri, 10 May 2024 13:30:14 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
Subject: Re: [PATCH 4/4] intel/xe_exec_sip: port test for shader sanity check
Message-ID: <20240510113014.uyqaptrpzz6ld2gx@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Dominik Karol =?utf-8?Q?Pi=C4=85tkowski?= <dominik.karol.piatkowski@intel.com>
References: <20240429-iga64_inline_ups-v1-0-2e9ac46cf6ba@intel.com>
 <20240429-iga64_inline_ups-v1-4-2e9ac46cf6ba@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240429-iga64_inline_ups-v1-4-2e9ac46cf6ba@intel.com>
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

Hi Andrzej,
On 2024-04-29 at 14:08:20 +0200, Andrzej Hajda wrote:
> xe_exec_sip will contain tests for shader and SIP interaction.

Please decipher 'SIP' here and in test description below.

> For starters let's implement test checking if shader is run correctly.
s/is run/runs/

> The patch also demostrates usage of inline iga64 assembly.
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  lib/gpgpu_shader.c          |  63 ++++++++++++
>  lib/iga64_generated_codes.c |  83 ++++++++++++++-
>  tests/intel/xe_exec_sip.c   | 239 ++++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build           |   1 +
>  4 files changed, 385 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/gpgpu_shader.c b/lib/gpgpu_shader.c
> index 3317e9e35c91..cd8c82ff9c8c 100644
> --- a/lib/gpgpu_shader.c
> +++ b/lib/gpgpu_shader.c
> @@ -248,3 +248,66 @@ void gpgpu_shader_destroy(struct gpgpu_shader *shdr)
>  	free(shdr->code);
>  	free(shdr);
>  }
> +
> +/**
> + * gpgpu_shader__eot:
> + * @shdr: shader to be modified
> + *
> + * Append end of thread instruction to @shdr.
> + */
> +void gpgpu_shader__eot(struct gpgpu_shader *shdr)
> +{
> +	emit_iga64_code(shdr, eot, R"ASM(
> +(W)     mov (8|M0)               r112.0<1>:ud  r0.0<8;8,1>:ud
> +#if GEN_VER < 1250
> +(W)     send.ts (16|M0)          null r112 null 0x10000000 0x02000010 {EOT,@1} // wr:1+0, rd:0; end of thread
> +#else
> +(W)     send.gtwy (8|M0)         null r112 src1_null     0 0x02000000 {EOT}
> +#endif
> +	)ASM");
> +}
> +
> +/**
> + * gpgpu_shader__write_dword:
> + * @shdr: shader to be modified
> + * @value: dword to be written
> + * @y_offset: write target offset within the surface in rows
> + *
> + * Fill dword in (row, column/dword) == (tg_id_y + @y_offset, tg_id_x).
> + */
> +void gpgpu_shader__write_dword(struct gpgpu_shader *shdr, uint32_t value,
> +			       uint32_t y_offset)
> +{
> +	emit_iga64_code(shdr, media_block_write, R"ASM(
> +	// Payload
> +(W)     mov (1|M0)               r5.0<1>:ud    ARG(3):ud
> +(W)     mov (1|M0)               r5.1<1>:ud    ARG(4):ud
> +(W)     mov (1|M0)               r5.2<1>:ud    ARG(5):ud
> +(W)     mov (1|M0)               r5.3<1>:ud    ARG(6):ud
> +#if GEN_VER < 2000 // Media Block Write
> +        // X offset of the block in bytes := (thread group id X << ARG(0))
> +(W)     shl (1|M0)               r4.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud
> +        // Y offset of the block in rows := thread group id Y
> +(W)     mov (1|M0)               r4.1<1>:ud    r0.6<0;1,0>:ud
> +(W)     add (1|M0)               r4.1<1>:ud    r4.1<0;1,0>:ud   ARG(1):ud
> +        // block width [0,63] representing 1 to 64 bytes
> +(W)     mov (1|M0)               r4.2<1>:ud    ARG(2):ud
> +        // FFTID := FFTID from R0 header
> +(W)     mov (1|M0)               r4.4<1>:ud    r0.5<0;1,0>:ud
> +(W)     send.dc1 (16|M0)         null     r4   src1_null 0    0x40A8000
> +#else // Typed 2D Block Store
> +        // Load r2.0-3 with tg id X << ARG(0)
> +(W)     shl (1|M0)               r2.0<1>:ud    r0.1<0;1,0>:ud    ARG(0):ud
> +        // Load r2.4-7 with tg id Y + ARG(1):ud
> +(W)     mov (1|M0)               r2.1<1>:ud    r0.6<0;1,0>:ud
> +(W)     add (1|M0)               r2.1<1>:ud    r2.1<0;1,0>:ud    ARG(1):ud
> +        // payload setup
> +(W)     mov (16|M0)              r4.0<1>:ud    0x0:ud
> +        // Store X and Y block start (160:191 and 192:223)
> +(W)     mov (2|M0)               r4.5<1>:ud    r2.0<2;2,1>:ud
> +        // Store X and Y block max_size (224:231 and 232:239)
> +(W)     mov (1|M0)               r4.7<1>:ud    ARG(2):ud
> +(W)     send.tgm (16|M0)         null     r4   null:0    0    0x64000007
> +#endif
> +	)ASM", 2, y_offset, 3, value, value, value, value);
> +}
> diff --git a/lib/iga64_generated_codes.c b/lib/iga64_generated_codes.c
> index 449c5e9bcf31..f06362d806cd 100644
> --- a/lib/iga64_generated_codes.c
> +++ b/lib/iga64_generated_codes.c
> @@ -3,4 +3,85 @@
>  
>  #include "gpgpu_shader.h"
>  
> -#define MD5_SUM d41d8cd98f00b204e9800998ecf8427e
> +#define MD5_SUM 1a47442138fa63fddb0f260694ef9edb
---------- ^^^^^^^
Name looks a little too generic.

> +
> +struct iga64_template const iga64_code_media_block_write[] = {
> +	{ .gen_ver = 2000, .size = 56, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x02058220, 0x02000014, 0xc0ded000,
> +		0x80000061, 0x02150220, 0x00000064, 0x00000000,
> +		0x80001940, 0x02158220, 0x02000214, 0xc0ded001,
> +		0x80100061, 0x04054220, 0x00000000, 0x00000000,
> +		0x80041a61, 0x04550220, 0x00220205, 0x00000000,
> +		0x80000061, 0x04754220, 0x00000000, 0xc0ded002,
> +		0x80132031, 0x00000000, 0xd00e0494, 0x04000000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1272, .size = 52, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05154220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05354220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000014, 0xc0ded000,
> +		0x80000061, 0x04150220, 0x00000064, 0x00000000,
> +		0x80001940, 0x04158220, 0x02000414, 0xc0ded001,
> +		0x80000061, 0x04254220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04450220, 0x00000054, 0x00000000,
> +		0x80132031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 56, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80001940, 0x04258220, 0x02000424, 0xc0ded001,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80044031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000901, 0x00010000, 0x00000000, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 52, .code = (const uint32_t []) {
> +		0x80000061, 0x05054220, 0x00000000, 0xc0ded003,
> +		0x80000061, 0x05254220, 0x00000000, 0xc0ded004,
> +		0x80000061, 0x05454220, 0x00000000, 0xc0ded005,
> +		0x80000061, 0x05654220, 0x00000000, 0xc0ded006,
> +		0x80000069, 0x04058220, 0x02000024, 0xc0ded000,
> +		0x80000061, 0x04250220, 0x000000c4, 0x00000000,
> +		0x80000140, 0x04258220, 0x02000424, 0xc0ded001,
> +		0x80000061, 0x04454220, 0x00000000, 0xc0ded002,
> +		0x80000061, 0x04850220, 0x000000a4, 0x00000000,
> +		0x80049031, 0x00000000, 0xc0000414, 0x02a00000,
> +		0x80000001, 0x00010000, 0x20000000, 0x00000000,
> +		0x80000001, 0x00010000, 0x30000000, 0x00000000,
> +		0x80000101, 0x00010000, 0x00000000, 0x00000000,
> +	}}
> +};
> +
> +struct iga64_template const iga64_code_eot[] = {
> +	{ .gen_ver = 1272, .size = 8, .code = (const uint32_t []) {
> +		0x800c0061, 0x70050220, 0x00460005, 0x00000000,
> +		0x800f2031, 0x00000004, 0x3000700c, 0x00000000,
> +	}},
> +	{ .gen_ver = 1250, .size = 12, .code = (const uint32_t []) {
> +		0x80030061, 0x70050220, 0x00460005, 0x00000000,
> +		0x80001901, 0x00010000, 0x00000000, 0x00000000,
> +		0x80034031, 0x00000004, 0x3000700c, 0x00000000,
> +	}},
> +	{ .gen_ver = 0, .size = 8, .code = (const uint32_t []) {
> +		0x80030061, 0x70050220, 0x00460005, 0x00000000,
> +		0x80049031, 0x00000004, 0x7020700c, 0x10000000,
> +	}}
> +};
> diff --git a/tests/intel/xe_exec_sip.c b/tests/intel/xe_exec_sip.c
> new file mode 100644
> index 000000000000..af0eaf8cbda6
> --- /dev/null
> +++ b/tests/intel/xe_exec_sip.c
> @@ -0,0 +1,239 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +/**
> + * TEST: Tests for gpgpu shader and system routine execution

Please add here SIP meaning (in TEST: or in Descriptio: ).

> + * Category: Software building block
> + * Sub-category: gpgpu
> + * Functionality: system routine
> + * Test category: functionality test
> + */
> +
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <stdio.h>

Add newline.

> +#include "gpgpu_shader.h"
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +#define WIDTH 64
> +#define HEIGHT 64
> +
> +#define COLOR_C4 0xc4
> +
> +#define SHADER_CANARY 0x01010101
> +
> +#define NSEC_PER_MSEC (1000 * 1000ull)
> +
> +static struct intel_buf *
> +create_fill_buf(int fd, int width, int height, uint8_t color)
> +{
> +	struct intel_buf *buf;
> +	uint8_t *ptr;
> +
> +	buf = calloc(1, sizeof(*buf));
> +	igt_assert(buf);
> +
> +	intel_buf_init(buf_ops_create(fd), buf, width / 4, height, 32, 0,
> +		       I915_TILING_NONE, 0);
> +
> +	ptr = xe_bo_map(fd, buf->handle, buf->surface[0].size);
> +	memset(ptr, color, buf->surface[0].size);
> +	munmap(ptr, buf->surface[0].size);
> +
> +	return buf;
> +}
> +
> +static struct gpgpu_shader *get_shader(int fd)
> +{
> +	static struct gpgpu_shader *shader;
> +
> +	shader = gpgpu_shader_create(fd);
> +	gpgpu_shader__write_dword(shader, SHADER_CANARY, 0);
> +	gpgpu_shader__eot(shader);
> +	return shader;
> +}
> +
> +static uint32_t gpgpu_shader(int fd, struct intel_bb *ibb, unsigned int threads,
> +			     unsigned int width, unsigned int height)
> +{
> +	struct intel_buf *buf = create_fill_buf(fd, width, height, COLOR_C4);
> +	struct gpgpu_shader *shader = get_shader(fd);
> +
> +	gpgpu_shader_exec(ibb, buf, 1, threads, shader, NULL, 0, 0);
> +	gpgpu_shader_destroy(shader);
> +	return buf->handle;
> +}
> +
> +static void check_fill_buf(uint8_t *ptr, const int width, const int x,
> +			   const int y, const uint8_t color)
> +{
> +	const uint8_t val = ptr[y * width + x];
> +
> +	igt_assert_f(val == color,
> +		     "Expected 0x%02x, found 0x%02x at (%d,%d)\n",
> +		     color, val, x, y);
> +}
> +
> +static void check_buf(int fd, uint32_t handle, int width, int height,
> +		      uint8_t poison_c)
> +{
> +	unsigned int sz = ALIGN(width * height, 4096);
> +	int thread_count = 0;
> +	uint32_t *ptr;
> +	int i, j;
> +
> +	ptr = xe_bo_mmap_ext(fd, handle, sz, PROT_READ);
> +
> +	for (i = 0, j = 0; j < height / 2; ++j) {
> +		if (ptr[j * width / 4] == SHADER_CANARY) {
> +			++thread_count;
> +			i = 4;
> +		}
> +
> +		for (; i < width; i++)
> +			check_fill_buf((uint8_t *)ptr, width, i, j, poison_c);
> +
> +		i = 0;
> +	}
> +
> +	igt_assert(thread_count);
> +
> +	munmap(ptr, sz);
> +}
> +
> +static const char *class_to_str(int class)
> +{
> +        const char *str[] = {
> +                [DRM_XE_ENGINE_CLASS_RENDER] = "rcs",
> +                [DRM_XE_ENGINE_CLASS_COPY] = "bcs",
> +                [DRM_XE_ENGINE_CLASS_VIDEO_DECODE] = "vcs",
> +                [DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE] = "vecs",
> +		[DRM_XE_ENGINE_CLASS_COMPUTE] = "ccs",
> +        };
> +
> +        if (class < ARRAY_SIZE(str))
> +                return str[class];
> +
> +        return "unk";
> +}

Above looks like a candidate for lib function or it is somewhere
already?

> +
> +static uint64_t xe_sysfs_get_job_timeout_ms(int fd, struct drm_xe_engine_class_instance *eci)
> +{
> +	struct dirent *de;
> +	int engines_fd = -1;
> +	int gt_fd = -1;
> +	DIR *dir;
> +	/* Default timeout is 5s */
> +	uint64_t ret = 5ULL * MSEC_PER_SEC;
> +
> +	gt_fd = xe_sysfs_gt_open(fd, eci->gt_id);
> +	if (gt_fd == -1)
> +		return ret;

Why the same timeout here?

> +
> +	engines_fd = openat(gt_fd, "engines", O_RDONLY);
> +	if (engines_fd == -1) {
> +		close(gt_fd);
> +		return ret;

Why the same timeout here?

> +	}
> +
> +	lseek(engines_fd, 0, SEEK_SET);
> +	dir = fdopendir(engines_fd);
> +	while (dir && (de = readdir(dir))) {
> +		int engine_fd;
> +		if (strcmp(de->d_name, class_to_str(eci->engine_class)))
> +			continue;
> +
> +		engine_fd = openat(engines_fd, de->d_name, O_RDONLY);
> +		if (engine_fd < 0)
> +			break;
> +
> +		ret = igt_sysfs_get_u64(engine_fd, "job_timeout_ms");
> +		close(engine_fd);
> +		break;
> +	}
> +
> +	close(engines_fd);
> +	close(gt_fd);

Add newline here.

> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: sanity
> + * Description: check basic shader with write operation
> + * Run type: BAT
> + *
> + */
> +static void test_sip(struct drm_xe_engine_class_instance *eci, uint32_t flags)
> +{
> +	unsigned int threads = 512;
> +	unsigned int height = max_t(threads, HEIGHT, threads * 2);
> +	uint32_t exec_queue_id, handle, vm_id;
> +	unsigned int width = WIDTH;
> +	struct timespec ts = { };
> +	uint64_t timeout;
> +	struct intel_bb *ibb;
> +	int fd;
> +
> +	igt_debug("Using %s\n", xe_engine_class_string(eci->engine_class));
> +
> +	fd = drm_open_driver(DRIVER_XE);
> +	xe_device_get(fd);
> +
> +	vm_id = xe_vm_create(fd, 0, 0);
> +
> +	/* Get timeout for job, and add 4s to ensure timeout processes in subtest. */
> +	timeout = xe_sysfs_get_job_timeout_ms(fd, eci) + 4ull * MSEC_PER_SEC;
> +	timeout *= NSEC_PER_MSEC;
> +	timeout *= igt_run_in_simulation() ? 10 : 1;
> +
> +	exec_queue_id = xe_exec_queue_create(fd, vm_id, eci, 0);
> +	ibb = intel_bb_create_with_context(fd, exec_queue_id, vm_id, NULL, 4096);
> +
> +	igt_nsec_elapsed(&ts);
> +	handle = gpgpu_shader(fd, ibb, threads, width, height);
> +
> +	intel_bb_sync(ibb);
> +	igt_assert_lt_u64(igt_nsec_elapsed(&ts), timeout);
> +
> +	check_buf(fd, handle, width, height, COLOR_C4);
> +
> +	gem_close(fd, handle);
> +	intel_bb_destroy(ibb);
> +
> +	xe_exec_queue_destroy(fd, exec_queue_id);
> +	xe_vm_destroy(fd, vm_id);
> +	xe_device_put(fd);
> +	close(fd);
> +}
> +
> +#define test_render_and_compute(t, __fd, __eci) \
> +	igt_subtest_with_dynamic(t) \
> +		xe_for_each_engine(__fd, __eci) \
> +			if (__eci->engine_class == DRM_XE_ENGINE_CLASS_RENDER || \
> +			    __eci->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) \
> +				igt_dynamic_f("%s%d", xe_engine_class_string(__eci->engine_class), \
> +					      __eci->engine_instance)
> +
> +igt_main
> +{
> +	struct drm_xe_engine_class_instance *eci;
> +	int fd;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
--------^^
No need for this, drm_open_driver do this.

> +	}
> +
> +	test_render_and_compute("sanity", fd, eci)
> +		test_sip(eci, 0);
> +
> +	igt_fixture {
> +		xe_device_put(fd);
--------^^
> +		close(fd);
--------^^
Use drm_close_driver instead.

Regards,
Kamil

> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 65b8bf23b972..63588e473616 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -292,6 +292,7 @@ intel_xe_progs = [
>  	'xe_exec_fault_mode',
>  	'xe_exec_queue_property',
>  	'xe_exec_reset',
> +	'xe_exec_sip',
>  	'xe_exec_store',
>  	'xe_exec_threads',
>  	'xe_exercise_blt',
> 
> -- 
> 2.34.1
> 
