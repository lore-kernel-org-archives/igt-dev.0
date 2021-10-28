Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DAA6E554
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 08:08:52 +0000 (UTC)
Date: Thu, 28 Oct 2021 11:07:28 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YXpaQHSM5XbcKU98@platvala-desk.ger.corp.intel.com>
References: <20211027182404.2189964-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027182404.2189964-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_cursor: igt_require_pipe_crc
 for test_init
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, arek@hiler.eu, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 27, 2021 at 02:24:04PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> 
> [Why]
> test_init uses CRC in debugfs which is not supported by some drivers.
> 
> [How]
> igt_require_pipe_crc before igt_pipe_crc_new is called.
> 
> Test: igt@kms_plane_cursor@pipe-A-overlay-size-64 on ChromeOS Jacuzzi
> (MTK)
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  tests/kms_plane_cursor.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 9bda4746..73085cc8 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -76,6 +76,7 @@ static void test_init(data_t *data, enum pipe pipe_id)
>  	data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
>  	data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
>  
> +	igt_require_pipe_crc(data->drm_fd);
>  	data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
>  					  INTEL_PIPE_CRC_SOURCE_AUTO);
>  
> -- 
> 2.33.0.1079.g6e70778dc9-goog
> 
