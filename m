Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70AFC25B75
	for <igt-dev@archiver.kernel.org>; Tue, 14 May 2024 17:26:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6197B10E062;
	Tue, 14 May 2024 17:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ige/OA1A";
	dkim-atps=neutral
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067D310E062
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 17:26:40 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-2e6792ea67dso64875721fa.3
 for <igt-dev@lists.freedesktop.org>; Tue, 14 May 2024 10:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715707599; x=1716312399; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gBCoGQhPXO2AzBXUVrIFLMWDwfg+xW7tp4aODmfoCig=;
 b=ige/OA1AJ0UaVUw8W7h1DrZxJBWcMgVAgMhPS+E2ofJlj53K7zX3mricCp2VBW0jAN
 ebqsc7vJDZGvaq0GRoXm+M9ucunGNWciRWVtMhpCeJh7LqFd61OEz0EBCM1MNnGQu54M
 xTecqVfouhxGN4P4RaxBkaN0cDrdH5aXuKNmlUnUX8ESS8yQpwSBCF9SZFti/apBZL/4
 ZCxVOgJOB44vu1HKL7e4UPhccOvP6M55DRiqI1Lm14SuSR94nUqbGtjNfNKISzfIE0YY
 Al2M1h9dIjubUDgO5ec0GMDuYx6NMcHArHKwOP/mbc9PgqI+ihfEhMbJkmEUsGL4hUuJ
 1OVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715707599; x=1716312399;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gBCoGQhPXO2AzBXUVrIFLMWDwfg+xW7tp4aODmfoCig=;
 b=A6k2M99bvZrdDeRCvQ+hJRIW3Fk5rl9qUm/E2VqNBxCndExmPDoLGxk6ISpsWglcUj
 jAyjR8iOPyQK0xIwNG8n3SsIkDykbfYnAwj3dXhFrHcI/I1ME0o48a0mF3daDmKCN89E
 bnvh3N6+a0MOz6KVfHKsV5hjL2FhAmA+pL+9nNb3HE2nhbJtN3iPVYzcEoOnsmmVvZs3
 kDWztATroSoej7uhbzKzuL+JJIDaERvt3Mj9YXMVgjCHtsZpvFyJQTEZABwxG0/ESuJL
 qaOxHkIQGXD1IQDiOGGeZpySHqDX2YlAMC/RGL/IVq7c+wWEYsHMXAZ/WX8LyYg6wpYu
 OwHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVAtFijE4jHXVwcHsR40W769bxB45NLPIDyenNbXnctglVqwCrZHFv/akPXdtTMkD8AdOV9T9hM8FdIHnxatKkUldZQACenaJvQBjHgA==
X-Gm-Message-State: AOJu0Yzuc+P35aOpCS6jabG3bWrP3OIaMreBRa495i7bnUcQwKx/rHc1
 cDkgxkFZQ6Wr7sde9ljftxiWgd3RLTFv+eHiG0GGE/2QmN1m2G4BSHDmWCTenn0=
X-Google-Smtp-Source: AGHT+IFoYY+ZphtU+kW6ZxDxu+KXFNeWlymD03saosJpp+S5/6/Zb+0vtsMOocc3u+i/LM1wStIxOA==
X-Received: by 2002:a2e:b0db:0:b0:2e5:566:c752 with SMTP id
 38308e7fff4ca-2e52039dc2fmr110470891fa.48.1715707598717; 
 Tue, 14 May 2024 10:26:38 -0700 (PDT)
Received: from [0.0.0.0] ([134.134.139.87])
 by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a5a17b17f0dsm743278766b.211.2024.05.14.10.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 10:26:38 -0700 (PDT)
Message-ID: <9d38043b-f0a5-4faf-a9c0-aa4c3709ad22@gmail.com>
Date: Tue, 14 May 2024 20:26:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 10/11] tests/xe_render_copy: Add subtest which
 exercises compression
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20240509053359.449885-1-zbigniew.kempczynski@intel.com>
 <20240509053359.449885-11-zbigniew.kempczynski@intel.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20240509053359.449885-11-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 9.5.2024 8.33, Zbigniew Kempczyński wrote:
> Add subtest which iterates over all supported tilings and does
> render-copy to and from compressed surface.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   tests/intel/xe_render_copy.c | 91 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 86 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index ef75c4ce6d..6f6c2e39bf 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -37,6 +37,10 @@
>    *
>    * SUBTEST: render-full
>    * Description: Copy surface using 3d engine (1:1)
> + *
> + * SUBTEST: render-full-compressed
> + * Description: Copy surface using 3d engine (1:1) when intermediate surface
> + *              is compressed
>    */
>   #define WIDTH	256
>   #define HEIGHT	256
> @@ -56,9 +60,13 @@ static void scratch_buf_init(struct buf_ops *bops,
>   {
>   	int fd = buf_ops_get_fd(bops);
>   	int bpp = 32;
> +	uint64_t region = system_memory(fd);
> +
> +	if (compression && xe_has_vram(fd))
> +		region = vram_memory(fd, 0);
>   
>   	intel_buf_init_in_region(bops, buf, width, height, bpp, 0,
> -				 req_tiling, compression, system_memory(fd));
> +				 req_tiling, compression, region);
>   
>   	igt_assert(intel_buf_width(buf) == width);
>   	igt_assert(intel_buf_height(buf) == height);
> @@ -120,6 +128,67 @@ static int compare_bufs(struct intel_buf *buf1, struct intel_buf *buf2,
>   	return ret;
>   }
>   
> +static bool buf_is_aux_compressed(struct buf_ops *bops, struct intel_buf *buf)
> +{
> +	int xe = buf_ops_get_fd(bops);
> +	unsigned int gen = intel_gen(buf_ops_get_devid(bops));
> +	uint32_t ccs_size;
> +	uint8_t *ptr;
> +	bool is_compressed = false;
> +
> +	igt_assert_neq(buf->ccs[0].offset, 0);
> +
> +	ccs_size = intel_buf_ccs_width(gen, buf) * intel_buf_ccs_height(gen, buf);
> +	ptr = xe_bo_map(xe, buf->handle, buf->size);
> +	for (int i = 0; i < ccs_size; i++)
> +		if (ptr[buf->ccs[0].offset + i] != 0) {
> +			is_compressed = true;
> +			break;
> +		}
> +	munmap(ptr, buf->size);
> +
> +	return is_compressed;
> +}
> +
> +static bool buf_is_compressed(struct buf_ops *bops, struct intel_buf *buf)
> +{
> +	struct drm_xe_engine_class_instance inst = {
> +		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
> +	};
> +	int xe = buf_ops_get_fd(bops);
> +	struct blt_copy_object obj;
> +	uint64_t ahnd;
> +	uint32_t vm, exec_queue;
> +	uint32_t tiling = i915_tile_to_blt_tile(buf->tiling);
> +	uint32_t devid = buf_ops_get_devid(bops);
> +	intel_ctx_t *ctx;
> +	bool is_compressed;
> +
> +	if (!HAS_FLATCCS(devid))
> +		return buf_is_aux_compressed(bops, buf);
> +
> +	vm = xe_vm_create(xe, 0, 0);
> +	exec_queue = xe_exec_queue_create(xe, vm, &inst, 0);
> +	ctx = intel_ctx_xe(xe, vm, exec_queue, 0, 0, 0);
> +	ahnd = intel_allocator_open(xe, ctx->vm, INTEL_ALLOCATOR_RELOC);
> +
> +	blt_set_object(&obj, buf->handle,
> +		       buf->size, buf->region, buf->mocs_index,
> +		       buf->pat_index, tiling,
> +		       buf->compression ? COMPRESSION_ENABLED : COMPRESSION_DISABLED,
> +		       COMPRESSION_TYPE_3D);
> +	blt_set_geom(&obj, buf->surface[0].stride, 0, 0, buf->width, buf->height, 0, 0);
> +
> +	is_compressed = blt_surface_is_compressed(xe, ctx, NULL, ahnd, &obj);
> +
> +	xe_exec_queue_destroy(xe, exec_queue);
> +	xe_vm_destroy(xe, vm);
> +	put_ahnd(ahnd);
> +	free(ctx);
> +
> +	return is_compressed;
> +}
> +
>   /*
>    *
>    * Scenarios implemented are presented below. We copy from linear to and forth
> @@ -176,6 +245,7 @@ enum render_copy_testtype {
>   	COPY_HSTRIPES,
>   	COPY_RANDOM,
>   	COPY_FULL,
> +	COPY_FULL_COMPRESSED,
>   };
>   
>   static const char * const testname[] = {
> @@ -184,6 +254,7 @@ static const char * const testname[] = {
>   	[COPY_HSTRIPES]	= "hstripes",
>   	[COPY_RANDOM]	= "random",
>   	[COPY_FULL]	= "full",
> +	[COPY_FULL_COMPRESSED] = "full-compressed",
>   };
>   
>   static int render(struct buf_ops *bops, uint32_t tiling,
> @@ -196,6 +267,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>   	uint32_t fails = 0;
>   	uint32_t devid = intel_get_drm_devid(xe);
>   	igt_render_copyfunc_t render_copy = NULL;
> +	int compression = testtype == COPY_FULL_COMPRESSED ? I915_COMPRESSION_RENDER :
> +							     I915_COMPRESSION_NONE;
> +	bool is_compressed;
>   	struct posrc {
>   		uint32_t x0, y0;
>   		uint32_t x1, y1;
> @@ -241,7 +315,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>   	scratch_buf_init(bops, &src, width, height, I915_TILING_NONE,
>   			 I915_COMPRESSION_NONE);
>   	scratch_buf_init(bops, &dst, width, height, tiling,
> -			 I915_COMPRESSION_NONE);
> +			 compression);
>   	scratch_buf_init(bops, &final, width, height, I915_TILING_NONE,
>   			 I915_COMPRESSION_NONE);
>   	scratch_buf_init(bops, &grfs, 64, height * 4, I915_TILING_NONE,
> @@ -317,6 +391,7 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>   
>   
>   	case COPY_FULL:
> +	case COPY_FULL_COMPRESSED:
>   		render_copy(ibb,
>   			    &src, 0, 0, width, height,
>   			    &dst, 0, 0);
> @@ -339,7 +414,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>   					   tiling, width, height);
>   	}
>   
> -	fails = compare_bufs(&src, &final, true);
> +	fails = compare_bufs(&src, &final, false);
> +	if (compression == I915_COMPRESSION_RENDER)
> +		is_compressed = buf_is_compressed(bops, &dst);
>   
>   	intel_buf_close(bops, &src);
>   	intel_buf_close(bops, &dst);
> @@ -347,6 +424,9 @@ static int render(struct buf_ops *bops, uint32_t tiling,
>   
>   	igt_assert_f(fails == 0, "%s: (tiling: %d) fails: %d\n",
>   		     __func__, tiling, fails);
> +	if (compression == I915_COMPRESSION_RENDER && blt_platform_has_flat_ccs_enabled(xe))
> +		igt_assert_f(is_compressed, "%s: (tiling: %d) buffer is not compressed\n",
> +			     __func__, tiling);
>   
>   	return fails;
>   }
> @@ -398,12 +478,13 @@ igt_main_args("dpiW:H:", NULL, help_str, opt_handler, NULL)
>   		srand(time(NULL));
>   	}
>   
> -	for (int id = 0; id <= COPY_FULL; id++) {
> +	for (int id = 0; id <= COPY_FULL_COMPRESSED; id++) {
>   		igt_subtest_with_dynamic_f("render-%s", testname[id]) {
>   			igt_require(xe_has_engine_class(xe, DRM_XE_ENGINE_CLASS_RENDER));
>   
>   			for_each_tiling(tiling) {
> -				if (!blt_block_copy_supports_tiling(xe, tiling))
> +				if (!render_supports_tiling(xe, tiling,
> +							    id == COPY_FULL_COMPRESSED))
>   					continue;
>   
>   				tiling_name = blt_tiling_name(tiling);

