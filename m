Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD8F36E118
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 13:37:23 +0000 (UTC)
Date: Mon, 21 Jun 2021 09:37:10 -0400
From: Alyssa Rosenzweig <alyssa@collabora.com>
Message-ID: <YNCWBrobwghmkDea@maud>
References: <20210621125724.1592104-1-boris.brezillon@collabora.com>
 <20210621125724.1592104-7-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210621125724.1592104-7-boris.brezillon@collabora.com>
Subject: Re: [igt-dev] [PATCH 6/7] lib/panfrost: Get rid of
 igt_panfrost_trivial_job()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, Steven Price <steven.price@arm.com>, igt-dev@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Robin Murphy <robin.murphy@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>

r-b, glad to see this reminder of early Mesa gone.

On Mon, Jun 21, 2021 at 02:57:23PM +0200, Boris Brezillon wrote:
> We no longer use fragment jobs to test job submission, let's get rid
> of igt_panfrost_trivial_job(). If we ever need to issue fragment
> jobs again, we'll probably have to pull the pan_pack() infra from
> mesa and make the helper deal with Bifrost specificities.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  lib/igt_panfrost.c | 136 ---------------------------------------------
>  lib/igt_panfrost.h |   1 -
>  2 files changed, 137 deletions(-)
> 
> diff --git a/lib/igt_panfrost.c b/lib/igt_panfrost.c
> index 60995f4ed18d..361c8fe44cd5 100644
> --- a/lib/igt_panfrost.c
> +++ b/lib/igt_panfrost.c
> @@ -206,142 +206,6 @@ struct panfrost_submit *igt_panfrost_null_job(int fd)
>          return submit;
>  }
>  
> -struct panfrost_submit *igt_panfrost_trivial_job(int fd, bool do_crash, int width, int height, uint32_t color)
> -{
> -        struct panfrost_submit *submit;
> -        struct mali_job_descriptor_header header = {
> -                .job_type = JOB_TYPE_FRAGMENT,
> -                .job_index = 1,
> -                .job_descriptor_size = 1,
> -        };
> -        struct mali_payload_fragment payload = {
> -                .min_tile_coord = MALI_COORDINATE_TO_TILE_MIN(0, 0),
> -                .max_tile_coord = MALI_COORDINATE_TO_TILE_MAX(ALIGN(width, 16), height),
> -        };
> -        struct bifrost_framebuffer mfbd_framebuffer = {
> -            .unk0 = 0x0,
> -            .unknown1 = 0x0,
> -            .tiler_meta = 0xff00000000,
> -            .width1 = MALI_POSITIVE(ALIGN(width, 16)),
> -            .height1 = MALI_POSITIVE(height),
> -            .width2 = MALI_POSITIVE(ALIGN(width, 16)),
> -            .height2 = MALI_POSITIVE(height),
> -            .unk1 = 0x1080,
> -            .unk2 = 0x0,
> -            .rt_count_1 = MALI_POSITIVE(1),
> -            .rt_count_2 = 1,
> -            .unk3 = 0x100,
> -            .clear_stencil = 0x0,
> -            .clear_depth = 0.000000,
> -            .unknown2 = 0x1f,
> -        };
> -        struct mali_single_framebuffer sfbd_framebuffer = {
> -            .unknown2 = 0x1f,
> -            .width = MALI_POSITIVE(width),
> -            .height = MALI_POSITIVE(height),
> -            .stride = width * 4,
> -            .resolution_check = ((width + height) / 3) << 4,
> -            .tiler_flags = 0xfff,
> -            .clear_color_1 = color,
> -            .clear_color_2 = color,
> -            .clear_color_3 = color,
> -            .clear_color_4 = color,
> -            .clear_flags = 0x101100 | MALI_CLEAR_SLOW,
> -            .format = 0xb84e0281,
> -        };
> -        struct mali_rt_format fmt = {
> -                .unk1 = 0x4000000,
> -                .unk2 = 0x1,
> -                .nr_channels = MALI_POSITIVE(4),
> -                .flags = do_crash ? 0x444 | (1 << 8) : 0x444,
> -                .swizzle = MALI_CHANNEL_BLUE | (MALI_CHANNEL_GREEN << 3) | (MALI_CHANNEL_RED << 6) | (MALI_CHANNEL_ONE << 9),
> -                .unk4 = 0x8,
> -        };
> -        struct bifrost_render_target rts = {
> -                .format = fmt,
> -                .chunknown = {
> -                    .unk = 0x0,
> -                    .pointer = 0x0,
> -                },
> -                .framebuffer_stride = ALIGN(width, 16) * 4 / 16,
> -                .clear_color_1 = color,
> -                .clear_color_2 = color,
> -                .clear_color_3 = color,
> -                .clear_color_4 = color,
> -        };
> -        int gpu_prod_id = igt_panfrost_get_param(fd, DRM_PANFROST_PARAM_GPU_PROD_ID);
> -        uint32_t *known_unknown;
> -        uint32_t *bos;
> -
> -        submit = malloc(sizeof(*submit));
> -
> -        submit->fbo = igt_panfrost_gem_new(fd, ALIGN(width, 16) * height * 4);
> -        rts.framebuffer = submit->fbo->offset;
> -        sfbd_framebuffer.framebuffer = submit->fbo->offset;
> -
> -        submit->tiler_heap_bo = igt_panfrost_gem_new(fd, 32768 * 128);
> -        mfbd_framebuffer.tiler_heap_start = submit->tiler_heap_bo->offset;
> -        mfbd_framebuffer.tiler_heap_end = submit->tiler_heap_bo->offset + 32768 * 128;
> -        sfbd_framebuffer.tiler_heap_free = mfbd_framebuffer.tiler_heap_start;
> -        sfbd_framebuffer.tiler_heap_end = mfbd_framebuffer.tiler_heap_end;
> -
> -        submit->tiler_scratch_bo = igt_panfrost_gem_new(fd, 128 * 128 * 128);
> -        mfbd_framebuffer.tiler_scratch_start = submit->tiler_scratch_bo->offset;
> -        mfbd_framebuffer.tiler_scratch_middle = submit->tiler_scratch_bo->offset + 0xf0000;
> -        sfbd_framebuffer.unknown_address_0 = mfbd_framebuffer.tiler_scratch_start;
> -
> -        submit->scratchpad_bo = igt_panfrost_gem_new(fd, 64 * 4096);
> -        igt_panfrost_bo_mmap(fd, submit->scratchpad_bo);
> -        mfbd_framebuffer.scratchpad = submit->scratchpad_bo->offset;
> -        sfbd_framebuffer.unknown_address_1 = submit->scratchpad_bo->offset;
> -        sfbd_framebuffer.unknown_address_2 = submit->scratchpad_bo->offset + 512;
> -
> -        known_unknown = ((void*)submit->scratchpad_bo->map) + 512;
> -        *known_unknown = 0xa0000000;
> -
> -        if (gpu_prod_id >= 0x0750) {
> -            submit->fb_bo = igt_panfrost_gem_new(fd, sizeof(mfbd_framebuffer) + sizeof(struct bifrost_render_target));
> -            igt_panfrost_bo_mmap(fd, submit->fb_bo);
> -            memcpy(submit->fb_bo->map, &mfbd_framebuffer, sizeof(mfbd_framebuffer));
> -            memcpy(submit->fb_bo->map + sizeof(mfbd_framebuffer), &rts, sizeof(struct bifrost_render_target));
> -            payload.framebuffer = submit->fb_bo->offset | MALI_MFBD;
> -        } else {
> -            // We don't know yet how to cause a hang on <=T720
> -            // Should probably use an infinite loop to hang the GPU
> -            igt_require(!do_crash);
> -            submit->fb_bo = igt_panfrost_gem_new(fd, sizeof(sfbd_framebuffer));
> -            igt_panfrost_bo_mmap(fd, submit->fb_bo);
> -            memcpy(submit->fb_bo->map, &sfbd_framebuffer, sizeof(sfbd_framebuffer));
> -            payload.framebuffer = submit->fb_bo->offset | MALI_SFBD;
> -        }
> -
> -        submit->submit_bo = igt_panfrost_gem_new(fd, sizeof(header) + sizeof(payload) + 1024000);
> -        igt_panfrost_bo_mmap(fd, submit->submit_bo);
> -
> -        memcpy(submit->submit_bo->map, &header, sizeof(header));
> -        memcpy(submit->submit_bo->map + sizeof(header), &payload, sizeof(payload));
> -
> -        submit->args = malloc(sizeof(*submit->args));
> -        memset(submit->args, 0, sizeof(*submit->args));
> -        submit->args->jc = submit->submit_bo->offset;
> -        submit->args->requirements = PANFROST_JD_REQ_FS;
> -
> -        bos = malloc(sizeof(*bos) * 6);
> -        bos[0] = submit->fbo->handle;
> -        bos[1] = submit->tiler_heap_bo->handle;
> -        bos[2] = submit->tiler_scratch_bo->handle;
> -        bos[3] = submit->scratchpad_bo->handle;
> -        bos[4] = submit->fb_bo->handle;
> -        bos[5] = submit->submit_bo->handle;
> -
> -        submit->args->bo_handles = to_user_pointer(bos);
> -        submit->args->bo_handle_count = 6;
> -
> -        igt_assert_eq(drmSyncobjCreate(fd, DRM_SYNCOBJ_CREATE_SIGNALED, &submit->args->out_sync), 0);
> -
> -        return submit;
> -}
> -
>  void igt_panfrost_free_job(int fd, struct panfrost_submit *submit)
>  {
>          free(from_user_pointer(submit->args->bo_handles));
> diff --git a/lib/igt_panfrost.h b/lib/igt_panfrost.h
> index 953dd4b7dd47..227ea9e25e28 100644
> --- a/lib/igt_panfrost.h
> +++ b/lib/igt_panfrost.h
> @@ -47,7 +47,6 @@ struct panfrost_submit {
>  struct panfrost_bo *igt_panfrost_gem_new(int fd, size_t size);
>  void igt_panfrost_free_bo(int fd, struct panfrost_bo *bo);
>  
> -struct panfrost_submit *igt_panfrost_trivial_job(int fd, bool do_crash, int width, int height, uint32_t color);
>  struct panfrost_submit *igt_panfrost_job_loop(int fd);
>  struct panfrost_submit *igt_panfrost_null_job(int fd);
>  void igt_panfrost_free_job(int fd, struct panfrost_submit *submit);
> -- 
> 2.31.1
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
