Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7AF6E8E1
 for <igt-dev@lists.freedesktop.org>; Mon, 31 May 2021 11:15:29 +0000 (UTC)
Date: Mon, 31 May 2021 14:17:11 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YLTFtxka3CyIrIH4@platvala-desk.ger.corp.intel.com>
References: <20210531105138.169530-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531105138.169530-1-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Fixup clang compiler warnings.
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, May 31, 2021 at 12:51:38PM +0200, Maarten Lankhorst wrote:
> Allows building cleanly with clang again. It complains about using
> invalid initialisers like char[][] = { 0 }.
> 
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>  lib/igt_kms.c               | 2 +-
>  lib/igt_nouveau.c           | 2 +-
>  tests/i915/gem_exec_fence.c | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 28fb9c094eb2..fb7a14f940ea 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -292,7 +292,7 @@ struct edid **igt_kms_get_tiled_edid(uint8_t htile, uint8_t vtile)
>  {
>  	uint8_t top[2];
>  	int edids, i;
> -	static  char raw_edid[MAX_EDID][256] = {0};
> +	static  char raw_edid[MAX_EDID][256] = {{0}};

Can't this be {} ?


-- 
Petri Latvala


>  	static struct edid *edid[MAX_EDID];
>  
>  	top[0] = 0x00;
> diff --git a/lib/igt_nouveau.c b/lib/igt_nouveau.c
> index ae6104e332f1..fdf6020a35af 100644
> --- a/lib/igt_nouveau.c
> +++ b/lib/igt_nouveau.c
> @@ -118,7 +118,7 @@ int igt_nouveau_create_bo(int drm_fd, bool sysmem, igt_fb_t *fb)
>  {
>  	struct igt_nouveau_dev *dev = get_nouveau_dev(drm_fd);
>  	struct nouveau_device *nvdev = dev->dev;
> -	union nouveau_bo_config config = {0};
> +	union nouveau_bo_config config = { };
>  	struct igt_nouveau_fb_priv *priv;
>  	uint32_t flags = sysmem ? NOUVEAU_BO_GART : NOUVEAU_BO_VRAM;
>  
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index 70bb00113a97..c3a650d89861 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -2382,8 +2382,8 @@ static void submit_timeline_execbuf(struct inter_engine_context *context,
>  				    uint32_t signal_syncobj,
>  				    uint64_t signal_value)
>  {
> -	uint64_t values[2] = { 0, };
> -	struct drm_i915_gem_exec_fence fences[2] = { 0, };
> +	uint64_t values[2] = { };
> +	struct drm_i915_gem_exec_fence fences[2] = { };
>  	struct drm_i915_gem_execbuffer_ext_timeline_fences fence_list = {
>  		.base = {
>  			.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES,
> -- 
> 2.31.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
