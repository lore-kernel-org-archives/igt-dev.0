Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E2D910E1A9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 09:40:58 +0000 (UTC)
Message-ID: <2bf9b06d-b3c4-43d1-a00f-3bc3a4fffa73@intel.com>
Date: Mon, 23 Oct 2023 15:10:52 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231023081446.3886687-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231023081446.3886687-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V2] lib/kms: Fix the missing documentaion for
 KMS library
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

Hi Bhanu,

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Pushed!

On 23-Oct-23 1:44 PM, Bhanuprakash Modem wrote:
> This patch will fix the missing documentaion for KMS library
> includes:
> 
>    - Add missing documentaion
>    - Fix the documentaion style to detect by the scripts
>    - Other minor cleanups
> 
> V2: - Add missing return docs
>      - Other minor cleanup
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   lib/igt_kms.c | 214 +++++++++++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_kms.h | 181 ++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 392 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 53f9ff19f..e1dfc2137 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -133,6 +133,20 @@ const struct edid *igt_kms_get_base_edid(void)
>   	return &edid;
>   }
>   
> +/**
> + * igt_kms_get_full_edid:
> + *
> + * Get the full edid block, which includes the following modes:
> + *
> + *  - 2288x1287 144Hz
> + *  - 1920x1080 60Hz
> + *  - 1280x720 60Hz
> + *  - 1024x768 60Hz
> + *  - 800x600 60Hz
> + *  - 640x480 60Hz
> + *
> + * Returns: a full edid block
> + */
>   const struct edid *igt_kms_get_full_edid(void)
>   {
>   	static struct edid edid;
> @@ -163,6 +177,20 @@ const struct edid *igt_kms_get_full_edid(void)
>   	return &edid;
>   }
>   
> +/**
> + * igt_kms_get_base_tile_edid:
> + *
> + * Get the base tile edid block, which includes the following modes:
> + *
> + *  - 1920x2160 60Hz
> + *  - 1920x1080 60Hz
> + *  - 1280x720 60Hz
> + *  - 1024x768 60Hz
> + *  - 800x600 60Hz
> + *  - 640x480 60Hz
> + *
> + * Returns: a basic tile edid block
> + */
>   const struct edid *igt_kms_get_base_tile_edid(void)
>   {
>   	static struct edid edid;
> @@ -270,6 +298,13 @@ generate_audio_edid(unsigned char raw_edid[static AUDIO_EDID_SIZE],
>   	return edid;
>   }
>   
> +/**
> + * igt_kms_get_hdmi_audio_edid:
> + *
> + * Get a basic edid block, which includes the HDMI Audio
> + *
> + * Returns: a basic HDMI Audio edid block
> + */
>   const struct edid *igt_kms_get_hdmi_audio_edid(void)
>   {
>   	int channels;
> @@ -294,6 +329,13 @@ const struct edid *igt_kms_get_hdmi_audio_edid(void)
>   	return generate_audio_edid(raw_edid, true, &sad, &speaker_alloc);
>   }
>   
> +/**
> + * igt_kms_get_dp_audio_edid:
> + *
> + * Get a basic edid block, which includes the DP Audio
> + *
> + * Returns: a basic DP Audio edid block
> + */
>   const struct edid *igt_kms_get_dp_audio_edid(void)
>   {
>   	int channels;
> @@ -318,6 +360,15 @@ const struct edid *igt_kms_get_dp_audio_edid(void)
>   	return generate_audio_edid(raw_edid, false, &sad, &speaker_alloc);
>   }
>   
> +/**
> + * igt_kms_get_tiled_edid:
> + * @htile: Target H-tile
> + * @vtile: Target V-tile
> + *
> + * Get a basic edid block, which includes tiled display
> + *
> + * Returns: a basic tiled display edid block
> + */
>   struct edid **igt_kms_get_tiled_edid(uint8_t htile, uint8_t vtile)
>   {
>   	uint8_t top[2];
> @@ -405,6 +456,13 @@ static const uint8_t edid_4k_svds[] = {
>   	19,                  /* 720p @ 50Hz */
>   };
>   
> +/**
> + * igt_kms_get_4k_edid:
> + *
> + * Get a basic edid block, which includes 4K resolution
> + *
> + * Returns: a basic edid block with 4K resolution
> + */
>   const struct edid *igt_kms_get_4k_edid(void)
>   {
>   	static unsigned char raw_edid[256] = {0};
> @@ -457,6 +515,13 @@ const struct edid *igt_kms_get_4k_edid(void)
>   	return edid;
>   }
>   
> +/**
> + * igt_kms_get_3d_edid:
> + *
> + * Get a basic edid block, which includes 3D mode
> + *
> + * Returns: a basic edid block with 3D mode
> + */
>   const struct edid *igt_kms_get_3d_edid(void)
>   {
>   	static unsigned char raw_edid[256] = {0};
> @@ -1398,6 +1463,13 @@ static char *kmstest_connector_dirname(int idx,
>   	return name;
>   }
>   
> +/**
> + * igt_connector_sysfs_open:
> + * @drm_fd: drm file descriptor
> + * @connector: drm connector
> + *
> + * Returns: The connector sysfs fd, or -1 on failure.
> + */
>   int igt_connector_sysfs_open(int drm_fd,
>   			     drmModeConnector *connector)
>   {
> @@ -1607,6 +1679,9 @@ void kmstest_force_edid(int drm_fd, drmModeConnector *connector,
>    * @b: second element
>    *
>    * Comparator function for sorting DRM modes in descending order by clock.
> + *
> + * Returns: True if first element's clock is less than second element's clock,
> + * else False.
>    */
>   int sort_drm_modes_by_clk_dsc(const void *a, const void *b)
>   {
> @@ -1621,6 +1696,9 @@ int sort_drm_modes_by_clk_dsc(const void *a, const void *b)
>    * @b: second element
>    *
>    * Comparator function for sorting DRM modes in ascending order by clock.
> + *
> + * Returns: True if first element's clock is greater than second element's clock,
> + * else False.
>    */
>   int sort_drm_modes_by_clk_asc(const void *a, const void *b)
>   {
> @@ -1635,6 +1713,9 @@ int sort_drm_modes_by_clk_asc(const void *a, const void *b)
>    * @b: second element
>    *
>    * Comparator function for sorting DRM modes in descending order by resolution.
> + *
> + * Returns: True if first element's resolution is less than second element's
> + * resolution, else False.
>    */
>   int sort_drm_modes_by_res_dsc(const void *a, const void *b)
>   {
> @@ -1649,6 +1730,9 @@ int sort_drm_modes_by_res_dsc(const void *a, const void *b)
>    * @b: second element
>    *
>    * Comparator function for sorting DRM modes in ascending order by resolution.
> + *
> + * Returns: True if first element's resolution is greater than second element's
> + * resolution, else False.
>    */
>   int sort_drm_modes_by_res_asc(const void *a, const void *b)
>   {
> @@ -1790,6 +1874,9 @@ _kmstest_connector_config_find_encoder(int drm_fd, drmModeConnector *connector,
>    *
>    * This tries to find a suitable configuration for the given connector and CRTC
>    * constraint and fills it into @config.
> + *
> + * Returns: True if suitable configuration found for a given connector & CRTC,
> + * else False.
>    */
>   static bool _kmstest_connector_config(int drm_fd, uint32_t connector_id,
>   				      unsigned long crtc_idx_mask,
> @@ -1885,6 +1972,9 @@ err1:
>    *
>    * This tries to find a suitable configuration for the given connector and CRTC
>    * constraint and fills it into @config.
> + *
> + * Returns: True if suitable configuration found for a given connector & CRTC,
> + * else False.
>    */
>   bool kmstest_get_connector_config(int drm_fd, uint32_t connector_id,
>   				  unsigned long crtc_idx_mask,
> @@ -1894,6 +1984,15 @@ bool kmstest_get_connector_config(int drm_fd, uint32_t connector_id,
>   					 config, 0);
>   }
>   
> +/**
> + * kmstest_get_path_blob:
> + * @drm_fd: DRM fd
> + * @connector_id: DRM connector id
> + *
> + * Finds a property with the name "PATH" on the connector object.
> + *
> + * Returns: Pointer to the connector's PATH property if found else NULL.
> + */
>   drmModePropertyBlobPtr kmstest_get_path_blob(int drm_fd, uint32_t connector_id)
>   {
>   	uint64_t path_blob_id = 0;
> @@ -1920,6 +2019,9 @@ drmModePropertyBlobPtr kmstest_get_path_blob(int drm_fd, uint32_t connector_id)
>    * This tries to find a suitable configuration for the given connector and CRTC
>    * constraint and fills it into @config, fully probing the connector in the
>    * process.
> + *
> + * Returns: True if suitable configuration found for a given connector & CRTC,
> + * else False.
>    */
>   bool kmstest_probe_connector_config(int drm_fd, uint32_t connector_id,
>   				    unsigned long crtc_idx_mask,
> @@ -2062,6 +2164,8 @@ void kmstest_unset_all_crtcs(int drm_fd, drmModeResPtr resources)
>    *
>    * Get the CRTC index based on its ID. This is useful since a few places of
>    * libdrm deal with CRTC masks.
> + *
> + * Returns: CRTC index for a given @crtc_id
>    */
>   int kmstest_get_crtc_idx(drmModeRes *res, uint32_t crtc_id)
>   {
> @@ -2196,6 +2300,12 @@ static void igt_display_log_shift(igt_display_t *display, int shift)
>   	igt_assert(display->log_shift >= 0);
>   }
>   
> +/**
> + * igt_output_refresh:
> + * @output: Target output
> + *
> + * This function sets the given @output to a valid default pipe
> + */
>   void igt_output_refresh(igt_output_t *output)
>   {
>   	igt_display_t *display = output->display;
> @@ -2510,7 +2620,7 @@ static void igt_handle_spurious_hpd(igt_display_t *display)
>   }
>   
>   /**
> - * igt_display_require:
> + * igt_display_reset_outputs:
>    * @display: a pointer to an initialized #igt_display_t structure
>    *
>    * Initialize @display outputs with their connectors and pipes.
> @@ -2922,6 +3032,14 @@ igt_output_t *igt_output_from_connector(igt_display_t *display,
>   	return found;
>   }
>   
> +/**
> + * igt_std_1024_mode_get:
> + * @vrefresh: Required refresh rate for 1024 mode
> + *
> + * This function will create a standard drm mode with a given @vrefresh
> + *
> + * Returns: Standard 1024@vrefresh mode.
> + */
>   drmModeModeInfo *igt_std_1024_mode_get(int vrefresh)
>   {
>   	const drmModeModeInfo std_1024_mode = {
> @@ -3175,6 +3293,12 @@ igt_plane_t *igt_pipe_get_plane_type_index(igt_pipe_t *pipe, int plane_type,
>   	return NULL;
>   }
>   
> +/**
> + * output_is_internal_panel:
> + * @output: Target output
> + *
> + * Returns: True if the given @output type is internal else False.
> + */
>   bool output_is_internal_panel(igt_output_t *output)
>   {
>   	switch (output->config.connector->connector_type) {
> @@ -3800,6 +3924,15 @@ static bool igt_mode_object_get_prop_enum_value(int drm_fd, uint32_t id, const c
>   	return false;
>   }
>   
> +/**
> + * igt_plane_try_prop_enum:
> + * @plane: Target plane.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * Returns: False if the given @plane doesn't have the enum @prop or
> + * failed to set the enum property @val else True.
> + */
>   bool igt_plane_try_prop_enum(igt_plane_t *plane,
>   			     enum igt_atomic_plane_properties prop,
>   			     const char *val)
> @@ -3817,6 +3950,15 @@ bool igt_plane_try_prop_enum(igt_plane_t *plane,
>   	return true;
>   }
>   
> +/**
> + * igt_plane_set_prop_enum:
> + * @plane: Target plane.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * This function tries to set given enum property @prop value @val to
> + * the given @plane, and terminate the execution if its failed.
> + */
>   void igt_plane_set_prop_enum(igt_plane_t *plane,
>   			     enum igt_atomic_plane_properties prop,
>   			     const char *val)
> @@ -3875,6 +4017,15 @@ uint64_t igt_output_get_prop(igt_output_t *output, enum igt_atomic_connector_pro
>   					output->id, output->props[prop]);
>   }
>   
> +/**
> + * igt_output_try_prop_enum:
> + * @output: Target output.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * Returns: False if the given @output doesn't have the enum @prop or
> + * failed to set the enum property @val else True.
> + */
>   bool igt_output_try_prop_enum(igt_output_t *output,
>   			      enum igt_atomic_connector_properties prop,
>   			      const char *val)
> @@ -3892,6 +4043,15 @@ bool igt_output_try_prop_enum(igt_output_t *output,
>   	return true;
>   }
>   
> +/**
> + * igt_output_set_prop_enum:
> + * @output: Target output.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * This function tries to set given enum property @prop value @val to
> + * the given @output, and terminate the execution if its failed.
> + */
>   void igt_output_set_prop_enum(igt_output_t *output,
>   			      enum igt_atomic_connector_properties prop,
>   			      const char *val)
> @@ -3950,6 +4110,15 @@ uint64_t igt_pipe_obj_get_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties
>   					pipe->crtc_id, pipe->props[prop]);
>   }
>   
> +/**
> + * igt_pipe_obj_try_prop_enum:
> + * @pipe_obj: Target pipe object.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * Returns: False if the given @pipe_obj doesn't have the enum @prop or
> + * failed to set the enum property @val else True.
> + */
>   bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe_obj,
>   				enum igt_atomic_crtc_properties prop,
>   				const char *val)
> @@ -3967,6 +4136,15 @@ bool igt_pipe_obj_try_prop_enum(igt_pipe_t *pipe_obj,
>   	return true;
>   }
>   
> +/**
> + * igt_pipe_obj_set_prop_enum:
> + * @pipe_obj: Target pipe object.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * This function tries to set given enum property @prop value @val to
> + * the given @pipe_obj, and terminate the execution if its failed.
> + */
>   void igt_pipe_obj_set_prop_enum(igt_pipe_t *pipe_obj,
>   				enum igt_atomic_crtc_properties prop,
>   				const char *val)
> @@ -4485,7 +4663,7 @@ void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode)
>    * igt_output_preferred_vrefresh:
>    * @output: Output whose preferred vrefresh is queried
>    *
> - * Return the vertical refresh rate of @output's preferred
> + * Returns: The vertical refresh rate of @output's preferred
>    * mode. If the output reports no modes return 60Hz as
>    * a fallback.
>    */
> @@ -4648,6 +4826,17 @@ void igt_pipe_refresh(igt_display_t *display, enum pipe pipe, bool force)
>   		igt_pipe_obj_set_prop_changed(pipe_obj, IGT_CRTC_MODE_ID);
>   }
>   
> +/**
> + * igt_output_get_plane:
> + * @output: Target output
> + * @plane_idx: Plane index
> + *
> + * Finds a driving pipe for the given @output otherwise and gets the valid
> + * plane associated with that pipe for the given @plane_idx. This function
> + * will terminate the execution if driving pipe is not for a given @output.
> + *
> + * Returns: A #igt_plane_t structure that matches the requested plane index
> + */
>   igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx)
>   {
>   	igt_pipe_t *pipe;
> @@ -5363,6 +5552,14 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
>   	igt_assert_eq(idx, plane->format_mod_count);
>   }
>   
> +/**
> + * igt_plane_has_format_mod:
> + * @plane: Target plane
> + * @format: Target format
> + * @modifier: Target modifier
> + *
> + * Returns: true if @plane supports the given @format and @modifier, else false
> + */
>   bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format,
>   			      uint64_t modifier)
>   {
> @@ -5439,6 +5636,14 @@ static void igt_fill_display_format_mod(igt_display_t *display)
>   	}
>   }
>   
> +/**
> + * igt_display_has_format_mod:
> + * @display: a pointer to an #igt_display_t structure
> + * @format: Target format
> + * @modifier: Target modifier
> + *
> + * Returns: true if @display supports the given @format and @modifier, else false
> + */
>   bool igt_display_has_format_mod(igt_display_t *display, uint32_t format,
>   				uint64_t modifier)
>   {
> @@ -5783,6 +5988,9 @@ void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
>    *
>    * This is similar to igt_assert_output_bpc_equal, instead of assert
>    * it'll return True if crtc has the correct requested bpc, else False.
> + *
> + * Returns: True if crtc's current bpc is matched with the requested bpc,
> + * else False.
>    */
>   bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>   				char *output_name, unsigned int bpc)
> @@ -5793,7 +6001,7 @@ bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>   }
>   
>   /**
> - * igt_max_bpc_constraint
> + * igt_max_bpc_constraint:
>    * @display: a pointer to an #igt_display_t structure
>    * @pipe: Display pipe
>    * @output: Target output
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 356620dc6..9028ab9be 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -354,6 +354,13 @@ typedef enum {
>   #define IGT_ROTATION_MASK \
>   	(IGT_ROTATION_0 | IGT_ROTATION_90 | IGT_ROTATION_180 | IGT_ROTATION_270)
>   
> +/**
> + * igt_rotation_90_or_270:
> + * @rotation: Target rotation
> + *
> + * Returns: True if the given @rotation contains 90 or 270 degrees,
> + * else False.
> + */
>   static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
>   {
>   	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
> @@ -541,6 +548,13 @@ const char *igt_plane_rotation_name(igt_rotation_t rotation);
>   void igt_wait_for_vblank(int drm_fd, int crtc_offset);
>   void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
>   
> +/**
> + * igt_output_is_connected:
> + * @output: #igt_output_t to check.
> + *
> + * Returns: True if given @output's connection status is CONNECTED,
> + * else False.
> + */
>   static inline bool igt_output_is_connected(igt_output_t *output)
>   {
>   	/* Something went wrong during probe? */
> @@ -682,10 +696,26 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
>   	for_each_connected_output((display), (output)) \
>   		for_each_if (igt_pipe_connector_valid((pipe), (output)))
>   
> +/**
> + * for_each_plane_on_pipe:
> + * @display: a pointer to an #igt_display_t structure
> + * @pipe: Pipe to enumerate valid outputs over
> + * @plane: The enumerated plane.
> + *
> + * This for loop iterates over all planes associated to the given @pipe.
> + * If there are no valid planes for this pipe, nothing happens.
> + */
>   #define for_each_plane_on_pipe(display, pipe, plane)			\
>   	for (int j__ = 0; assert(igt_can_fail()), (plane) = &(display)->pipes[(pipe)].planes[j__], \
>   		     j__ < (display)->pipes[(pipe)].n_planes; j__++)
>   
> +/**
> + * for_each_connector_mode:
> + * @output: Output to enumerate available modes.
> + *
> + * This for loop iterates over all modes associated to the given @output.
> + * If there are no mode available for this output, nothing happens.
> + */
>   #define for_each_connector_mode(output)		\
>   	for (int j__ = 0;  j__ < output->config.connector->count_modes; j__++)
>   
> @@ -708,15 +738,44 @@ igt_plane_has_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop)
>   
>   uint64_t igt_plane_get_prop(igt_plane_t *plane, enum igt_atomic_plane_properties prop);
>   
> +/**
> + * igt_plane_is_prop_changed:
> + * @plane: Plane to check.
> + * @prop: Property to check.
> + *
> + * Check whether a given @prop changed for the @plane.
> + */
>   #define igt_plane_is_prop_changed(plane, prop) \
>   	(!!((plane)->changed & (1 << (prop))))
>   
> +/**
> + * igt_plane_set_prop_changed:
> + * @plane: Plane to check.
> + * @prop: Property to check.
> + *
> + * Sets the given @prop for the @plane.
> + */
>   #define igt_plane_set_prop_changed(plane, prop) \
>   	(plane)->changed |= 1 << (prop)
>   
> +/**
> + * igt_plane_clear_prop_changed:
> + * @plane: Plane to check.
> + * @prop: Property to check.
> + *
> + * Clears the given @prop for the @plane.
> + */
>   #define igt_plane_clear_prop_changed(plane, prop) \
>   	(plane)->changed &= ~(1 << (prop))
>   
> +/**
> + * igt_plane_set_prop_value:
> + * @plane: Plane to check.
> + * @prop: Property to check.
> + * @value: Value to set.
> + *
> + * Sets the given @prop with the @value for the @plane.
> + */
>   #define igt_plane_set_prop_value(plane, prop, value) \
>   	do { \
>   		plane->values[prop] = value; \
> @@ -752,14 +811,44 @@ igt_output_has_prop(igt_output_t *output, enum igt_atomic_connector_properties p
>   
>   uint64_t igt_output_get_prop(igt_output_t *output, enum igt_atomic_connector_properties prop);
>   
> +/**
> + * igt_output_is_prop_changed:
> + * @output: Output to check.
> + * @prop: Property to check.
> + *
> + * Check whether a given @prop changed for the @Output.
> + */
>   #define igt_output_is_prop_changed(output, prop) \
>   	(!!((output)->changed & (1 << (prop))))
> +
> +/**
> + * igt_output_set_prop_changed:
> + * @output: Output to check.
> + * @prop: Property to check.
> + *
> + * Sets the given @prop for the @output.
> + */
>   #define igt_output_set_prop_changed(output, prop) \
>   	(output)->changed |= 1 << (prop)
>   
> +/**
> + * igt_output_clear_prop_changed:
> + * @output: Output to check.
> + * @prop: Property to check.
> + *
> + * Clears the given @prop for the @output.
> + */
>   #define igt_output_clear_prop_changed(output, prop) \
>   	(output)->changed &= ~(1 << (prop))
>   
> +/**
> + * igt_output_set_prop_value:
> + * @output: Output to check.
> + * @prop: Property to check.
> + * @value: Value to set.
> + *
> + * Sets the given @prop with the @value for the @output.
> + */
>   #define igt_output_set_prop_value(output, prop, value) \
>   	do { \
>   		(output)->values[prop] = (value); \
> @@ -830,30 +919,88 @@ igt_pipe_has_prop(igt_display_t *display, enum pipe pipe,
>   	return display->pipes[pipe].props[prop];
>   }
>   
> +/**
> + * igt_pipe_obj_is_prop_changed:
> + * @pipe_obj: Pipe object to check.
> + * @prop: Property to check.
> + *
> + * Check whether a given @prop changed for the @pipe_obj.
> + */
>   #define igt_pipe_obj_is_prop_changed(pipe_obj, prop) \
>   	(!!((pipe_obj)->changed & (1 << (prop))))
>   
> +/**
> + * igt_pipe_is_prop_changed:
> + * @pipe: Pipe object to check.
> + * @prop: Property to check.
> + *
> + * Check whether a given @prop changed for the @pipe.
> + */
>   #define igt_pipe_is_prop_changed(display, pipe, prop) \
>   	igt_pipe_obj_is_prop_changed(&(display)->pipes[(pipe)], prop)
>   
> +/**
> + * igt_pipe_obj_set_prop_changed:
> + * @pipe_obj: Pipe object to check.
> + * @prop: Property to check.
> + *
> + * Sets the given @prop for the @pipe_obj.
> + */
>   #define igt_pipe_obj_set_prop_changed(pipe_obj, prop) \
>   	(pipe_obj)->changed |= 1 << (prop)
>   
> +/**
> + * igt_pipe_set_prop_changed:
> + * @pipe: Pipe object to check.
> + * @prop: Property to check.
> + *
> + * Sets the given @prop for the @pipe.
> + */
>   #define igt_pipe_set_prop_changed(display, pipe, prop) \
>   	igt_pipe_obj_set_prop_changed(&(display)->pipes[(pipe)], prop)
>   
> +/**
> + * igt_pipe_obj_clear_prop_changed:
> + * @pipe_obj: Pipe object to check.
> + * @prop: Property to check.
> + *
> + * Clears the given @prop for the @pipe_obj.
> + */
>   #define igt_pipe_obj_clear_prop_changed(pipe_obj, prop) \
>   	(pipe_obj)->changed &= ~(1 << (prop))
>   
> +/**
> + * igt_pipe_clear_prop_changed:
> + * @pipe: Pipe object to check.
> + * @prop: Property to check.
> + *
> + * Clears the given @prop for the @pipe.
> + */
>   #define igt_pipe_clear_prop_changed(display, pipe, prop) \
>   	igt_pipe_obj_clear_prop_changed(&(display)->pipes[(pipe)], prop)
>   
> +/**
> + * igt_pipe_obj_set_prop_value:
> + * @pipe_obj: Pipe object to check.
> + * @prop: Property to check.
> + * @value: Value to set.
> + *
> + * Sets the given @prop with the @value for the @pipe_obj.
> + */
>   #define igt_pipe_obj_set_prop_value(pipe_obj, prop, value) \
>   	do { \
>   		(pipe_obj)->values[prop] = (value); \
>   		igt_pipe_obj_set_prop_changed(pipe_obj, prop); \
>   	} while (0)
>   
> +/**
> + * igt_pipe_set_prop_value:
> + * @pipe: Pipe to check.
> + * @prop: Property to check.
> + * @value: Value to set.
> + *
> + * Sets the given @prop with the @value for the @pipe.
> + */
>   #define igt_pipe_set_prop_value(display, pipe, prop, value) \
>   	igt_pipe_obj_set_prop_value(&(display)->pipes[(pipe)], prop, value)
>   
> @@ -865,9 +1012,27 @@ extern void igt_pipe_obj_set_prop_enum(igt_pipe_t *pipe,
>   				       enum igt_atomic_crtc_properties prop,
>   				       const char *val);
>   
> +/**
> + * igt_pipe_try_prop_enum:
> + * @pipe: Target pipe.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * Returns: False if the given @pipe doesn't have the enum @prop or
> + * failed to set the enum property @val else True.
> + */
>   #define igt_pipe_try_prop_enum(display, pipe, prop, val) \
>   	igt_pipe_obj_try_prop_enum(&(display)->pipes[(pipe)], prop, val)
>   
> +/**
> + * igt_pipe_set_prop_enum:
> + * @pipe: Target pipe.
> + * @prop: Property to check.
> + * @val: Value to set.
> + *
> + * This function tries to set given enum property @prop value @val to
> + * the given @pipe, and terminate the execution if its failed.
> + */
>   #define igt_pipe_set_prop_enum(display, pipe, prop, val) \
>   	igt_pipe_obj_set_prop_enum(&(display)->pipes[(pipe)], prop, val)
>   
> @@ -875,6 +1040,22 @@ extern void igt_pipe_obj_replace_prop_blob(igt_pipe_t *pipe,
>   					   enum igt_atomic_crtc_properties prop,
>   					   const void *ptr, size_t length);
>   
> +/**
> + * igt_pipe_replace_prop_blob:
> + * @pipe: pipe to set property on.
> + * @prop: property for which the blob will be replaced.
> + * @ptr: Pointer to contents for the property.
> + * @length: Length of contents.
> + *
> + * This function will destroy the old property blob for the given property,
> + * and will create a new property blob with the values passed to this function.
> + *
> + * The new property blob will be committed when you call igt_display_commit(),
> + * igt_display_commit2() or igt_display_commit_atomic().
> + *
> + * Please use igt_output_override_mode() if you want to set #IGT_CRTC_MODE_ID,
> + * it works better with legacy commit.
> + */
>   #define igt_pipe_replace_prop_blob(display, pipe, prop, ptr, length) \
>   	igt_pipe_obj_replace_prop_blob(&(display)->pipes[(pipe)], prop, ptr, length)
>   
