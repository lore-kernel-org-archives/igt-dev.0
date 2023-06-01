Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D0D710E12C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 05:32:40 +0000 (UTC)
Date: Thu, 1 Jun 2023 07:32:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230601053236.kb753il5xnlictmg@kamilkon-desk1>
References: <20230530045810.342043-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230530045810.342043-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/kms_fbcon_fbt: remove
 hard-coded PIPE_A while computing CRC
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-30 at 10:28:10 +0530, Swati Sharma wrote:
> Removed hard-coded PIPE_A while computing CRC.
> 
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/kms_fbcon_fbt.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
> index 831ec867..6c557dca 100644
> --- a/tests/i915/kms_fbcon_fbt.c
> +++ b/tests/i915/kms_fbcon_fbt.c
> @@ -39,7 +39,7 @@ IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
>  #define MAX_CONNECTORS 32
>  
>  struct drm_info {
> -	int fd, debugfs_fd;
> +	int fd, debugfs_fd, crtc_id;
>  	struct igt_fb fb;
>  	drmModeResPtr res;
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS];
> @@ -117,9 +117,10 @@ static bool fbc_check_cursor_blinking(struct drm_info *drm)
>  	igt_pipe_crc_t *pipe_crc;
>  	igt_crc_t crc[2];
>  	bool ret;
> -	int i;
> +	int i, pipe;
>  
> -	pipe_crc = igt_pipe_crc_new(drm->fd, PIPE_A, IGT_PIPE_CRC_SOURCE_AUTO);
> +	pipe = kmstest_get_pipe_from_crtc_id(drm->fd, drm->crtc_id);
> +	pipe_crc = igt_pipe_crc_new(drm->fd, pipe, IGT_PIPE_CRC_SOURCE_AUTO);
>  
>  	igt_pipe_crc_start(pipe_crc);
>  	igt_pipe_crc_drain(pipe_crc);
> @@ -165,7 +166,6 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>  				    connector_possible_fn connector_possible)
>  {
>  	int i, rc;
> -	uint32_t crtc_id;
>  	drmModeModeInfoPtr mode;
>  	uint32_t buffer_id;
>  	drmModeConnectorPtr c = NULL;
> @@ -182,7 +182,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>  	igt_require_f(i < drm->res->count_connectors,
>  		      "No connector available\n");
>  
> -	crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
> +	drm->crtc_id = kmstest_find_crtc_for_connector(drm->fd, drm->res, c, 0);
>  
>  	buffer_id = igt_create_fb(drm->fd, mode->hdisplay, mode->vdisplay,
>  				  DRM_FORMAT_XRGB8888,
> @@ -193,7 +193,7 @@ static void set_mode_for_one_screen(struct drm_info *drm,
>  		 mode->hdisplay, mode->vdisplay,
>  		 kmstest_connector_type_str(c->connector_type));
>  
> -	rc = drmModeSetCrtc(drm->fd, crtc_id, buffer_id, 0, 0,
> +	rc = drmModeSetCrtc(drm->fd, drm->crtc_id, buffer_id, 0, 0,
>  			    &c->connector_id, 1, mode);
>  	igt_assert_eq(rc, 0);
>  }
> -- 
> 2.25.1
> 
