Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309DD10E551
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Jun 2023 14:29:39 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5149c76f4dbso1430955a12.1
 for <igt-dev@lists.freedesktop.org>; Thu, 01 Jun 2023 07:29:39 -0700 (PDT)
Message-ID: <d301567a-cd90-8c09-f2d5-7d323555f7e3@gmail.com>
Date: Thu, 1 Jun 2023 17:29:32 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230601130850.26359-1-ville.syrjala@linux.intel.com>
 <20230601130850.26359-8-ville.syrjala@linux.intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230601130850.26359-8-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 7/7] tests/kms_tiled_display:
 Override the EDID to fake some tiles
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
List-ID: <igt-dev@lists.freedesktop.org>

On 1.6.2023 16.08, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Pretend we have a tiled display if we don't actually have one.
> 
> We don't actually know whether the kernel will sync up the displays,
> but let's assume it does.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   tests/kms_tiled_display.c | 128 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 126 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 7f579bacb3d5..d9baf98786a4 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -111,8 +111,8 @@ static void get_number_of_h_tiles(data_t *data)
>   	for (int i = 0; !data->num_h_tiles && i < res->count_connectors; i++) {
>   		drmModeConnectorPtr connector;
>   
> -		connector = drmModeGetConnectorCurrent(data->drm_fd,
> -						       res->connectors[i]);
> +		connector = drmModeGetConnector(data->drm_fd,
> +						res->connectors[i]);
>   		igt_assert(connector);
>   
>   		if (connector->connection == DRM_MODE_CONNECTED) {
> @@ -427,6 +427,119 @@ static void test_with_chamelium(data_t *data)
>   }
>   #endif
>   
> +static void edid_fill_tile_block(struct edid_ext *ext,
> +				 int tile, int num_tiles,
> +				 int hdisplay, int vdisplay)
> +{
> +	struct dispid_header *dispid;
> +	void *ptr;
> +
> +	dispid = ptr = edid_ext_dispid(ext);
> +
> +	ptr = dispid_init(ptr);
> +	ptr = dispid_block_tiled(ptr, num_tiles, 1,
> +				 tile, 0,
> +				 hdisplay, vdisplay,
> +				 "IGT-TILES");
> +	ptr = dispid_done(dispid, ptr);
> +}
> +
> +static struct edid *
> +edid_with_tile(const struct edid *old_edid,
> +	       const drmModeModeInfo *mode,
> +	       int tile, int num_tiles)
> +{
> +	struct edid *edid = malloc(edid_get_size(old_edid) + EDID_BLOCK_SIZE);
> +
> +	memcpy(edid, old_edid, edid_get_size(old_edid));
> +	edid->extensions_len++;
> +
> +	edid_fill_tile_block((struct edid_ext *)&edid[edid->extensions_len],
> +			     tile, num_tiles, mode->hdisplay, mode->vdisplay);
> +
> +	edid_update_checksum(edid);
> +
> +	return edid;
> +}
> +
> +static void force_edid_with_tile(data_t *data,
> +				 igt_output_t *output,
> +				 const drmModeModeInfo *mode,
> +				 int tile, int num_tiles)
> +{
> +	struct edid *edid;
> +	drmModePropertyBlobPtr blob;
> +	uint64_t blob_id;
> +
> +	kmstest_get_property(data->drm_fd, output->id,
> +			     DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +			     NULL, &blob_id, NULL);
> +
> +	blob = drmModeGetPropertyBlob(data->drm_fd, blob_id);
> +	edid = edid_with_tile(blob->data, mode, tile, num_tiles);
> +	drmModeFreePropertyBlob(blob);
> +
> +	kmstest_force_edid(data->drm_fd, output->config.connector, edid);
> +
> +	free(edid);
> +}
> +
> +static bool mode_equal(const drmModeModeInfo *a,
> +		       const drmModeModeInfo *b)
> +{
> +	return a->hdisplay == b->hdisplay &&
> +		a->hsync_start == b->hsync_start &&
> +		a->hsync_end == b->hsync_end &&
> +		a->htotal == b->htotal &&
> +		a->vdisplay == b->vdisplay &&
> +		a->vsync_start == b->vsync_start &&
> +		a->vsync_end == b->vsync_end &&
> +		a->vtotal == b->vtotal &&
> +		a->clock == b->clock &&
> +		a->flags == b->flags &&
> +		a->hskew == b->hskew &&
> +		a->vscan == b->vscan;
> +}
> +
> +static void override_edid(data_t *data)
> +{
> +	drmModeModeInfo common_mode = {};
> +	igt_output_t *outputs[8] = {};
> +	igt_output_t *output;
> +	int num_outputs = 0;
> +	int num_tiles = 0;
> +	drmModeResPtr res;
> +
> +	igt_require(data->display.n_pipes >= 2);
> +
> +	for_each_connected_output(&data->display, output) {
> +		drmModeModeInfo *mode = igt_output_get_mode(output);
> +
> +		if (!common_mode.hdisplay)
> +			common_mode = *mode;
> +
> +		if (mode_equal(&common_mode, mode)) {
> +			outputs[num_outputs] = output;
> +			if (++num_outputs >= ARRAY_SIZE(outputs))
> +				break;
> +		}
> +	}
> +
> +	igt_require(num_outputs >= 2);
> +
> +	num_tiles = min(num_outputs, data->display.n_pipes);
> +
> +	/* disable everything so that we are sure to get a full modeset */
> +	res = drmModeGetResources(data->drm_fd);
> +	igt_require(res);
> +	kmstest_unset_all_crtcs(data->drm_fd, res);
> +	drmModeFreeResources(res);
> +
> +	for (int i = 0; i < num_tiles; i++)
> +		force_edid_with_tile(data, outputs[i],
> +				     &common_mode, i, num_tiles);
> +}
> +
>   static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
>   {
>   		int ret;
> @@ -470,6 +583,17 @@ igt_main
>   		drm_event.page_flip_handler2 = page_flip_handler;
>   		data.commit = data.display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY;
>   		igt_require(data.commit == COMMIT_ATOMIC);
> +
> +		get_number_of_h_tiles(&data);
> +		igt_debug("Number of real horizontal tiles: %d\n", data.num_h_tiles);
> +
> +		if (data.num_h_tiles == 0) {
> +			override_edid(&data);
> +			get_number_of_h_tiles(&data);
> +
> +			igt_debug("Number of fake horizontal tiles: %d\n", data.num_h_tiles);
> +		}
> +		igt_require(data.num_h_tiles > 0);

I wonder does it make sense to run this with 1 tile only? Anyway code 
look all ok on the series. Patches 1..5 and 7 are

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On patch 6 I think will need to document those functions since they're 
public functions in lib.

/Juha-Pekka


>   	}
>   
>   	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
