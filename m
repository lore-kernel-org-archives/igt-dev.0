Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5A9CCA468
	for <igt-dev@archiver.kernel.org>; Tue, 30 Sep 2025 10:37:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B192A10E560;
	Tue, 30 Sep 2025 10:37:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="qfvsLzCU";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E3110E562
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:37:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id C7DA54E40DF4
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Sep 2025 10:37:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9D4CC606E4;
 Tue, 30 Sep 2025 10:37:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4BCD0102F17D5; 
 Tue, 30 Sep 2025 12:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759228662; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
 bh=rRVrSPiMO4v3mvNeQfLoy80eSANWzWCWH+I8YsF1hYE=;
 b=qfvsLzCU//UmlpES2ppvqBJdbCeZzpqnCZLR2WuFHAQOnzzWVCQ1BkX42qJwsT4JGgciJI
 zCuLBvWxLPgajgwyAzMr2E1p3pQQ9iiabUa61/VNApNFxslkou66nRBfmEw5c3+O3mn8SY
 89NMK7pILOsrU1SzvZh3iWrQFQMeNt0QDmLBYNtfQeZI2ZBc646Ubnxv83zBFGQQUrYVi0
 i3BnnnqZN8digsmx7trL3rPJ/SQwhJMnnClxaGPl2AWKVy/0+0XhaYWqugevP4WmguCxff
 97i/e0edjh70yDugVB+jQh/uX1HD+1HSz/6ByyP26KUmFjvMyyXroBZKC8shyA==
Message-ID: <43b1953e-44a6-4964-8fd5-02743f55587a@bootlin.com>
Date: Tue, 30 Sep 2025 12:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH V10 03/30] drm-uapi: Add COLOROP object
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, leo.liu@amd.com
References: <20250815040659.3321102-1-alex.hung@amd.com>
 <20250815040659.3321102-4-alex.hung@amd.com>
Content-Language: en-US, fr
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250815040659.3321102-4-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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



Le 15/08/2025 à 06:06, Alex Hung a écrit :
> From: Harry Wentland <harry.wentland@amd.com>
> 
> DRM is introducing a new DRM core obejct, a drm_colorop. This
> object will represent one color operation in a color pipeline.
> 
> Introduce the object type in the drm-uapi, including the
> following types:
> - DRM_COLOROP_1D_CURVE,
> - DRM_COLOROP_1D_LUT,
> - DRM_COLOROP_CTM_3X4,
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   include/drm-uapi/amdgpu_drm.h |   9 --
>   include/drm-uapi/drm_mode.h   |  23 +++

Same as 01/30, I think this could be a separate patch "update headers".
I don't know what maintainers want, but I think all the update could be 
done in only one commit "update drm uapi headers to match color_op patches"

>   lib/igt_kms.c                 | 272 +++++++++++++++++++++++++++++++++-
>   lib/igt_kms.h                 |  89 +++++++++++
>   tests/kms_properties.c        |   3 +
>   5 files changed, 381 insertions(+), 15 deletions(-)
> 
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index b38f27d69..ca24519c7 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -1590,15 +1590,6 @@ struct drm_amdgpu_info_uq_metadata {
>   #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
>   #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
>   
> -/* FIXME wrong namespace! */
> -struct drm_color_ctm_3x4 {
> -	/*
> -	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> -	 * (not two's complement!) format.
> -	 */
> -	__u64 matrix[12];
> -};
> -
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index c082810c0..fce45b5cf 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
>   #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
>   #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
>   #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
> +#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
>   #define DRM_MODE_OBJECT_ANY 0
>   
>   struct drm_mode_obj_get_properties {
> @@ -846,6 +847,22 @@ struct drm_color_ctm {
>   	__u64 matrix[9];
>   };
>   
> +struct drm_color_ctm_3x4 {
> +	/*
> +	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
> +	 * (not two's complement!) format.
> +	 *
> +	 * TODO what's the format?
> +	 *
> +	 * out   matrix          in
> +	 * |R|   |0  1  2  3 |   | R |
> +	 * |G| = |4  5  6  7 | x | G |
> +	 * |B|   |8  9  10 12|   | B |
> +	 *                       |1.0|
> +	 */
> +	__u64 matrix[12];
> +};
> +
>   struct drm_color_lut {
>   	/*
>   	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
> @@ -857,6 +874,12 @@ struct drm_color_lut {
>   	__u16 reserved;
>   };
>   
> +enum drm_colorop_type {
> +	DRM_COLOROP_1D_CURVE,
> +	DRM_COLOROP_1D_LUT,
> +	DRM_COLOROP_CTM_3X4,
> +};
> +
>   /**
>    * struct drm_plane_size_hint - Plane size hints
>    * @width: The width of the plane in pixel
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index a9641eba4..69beb523f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -92,6 +92,7 @@
>   #define MAX_CONNECTORS 32
>   #define MAX_EDID 2
>   #define DISPLAY_TILE_BLOCK 0x12
> +#define MAX_NUM_COLOROPS 128
>   
>   typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
>   
> @@ -702,6 +703,14 @@ const char * const igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>   	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
>   	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
>   	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
> +	[IGT_PLANE_COLOR_PIPELINE] = "COLOR_PIPELINE",
> +};
> +
> +const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
> +	[IGT_COLOROP_TYPE] = "TYPE",
> +	[IGT_COLOROP_BYPASS] = "BYPASS",
> +	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
> +	[IGT_COLOROP_NEXT] = "NEXT",
>   };
>   
>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = {
> @@ -769,6 +778,108 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
>   	return rotations;
>   }
>   
> +/**
> + * igt_find_colorop:
> + * @display: display on which to look for colorop.
> + * @id: DRM object id of the colorop.
> + *
> + * Returns: An igt_colorop_t if found, or NULL otherwise.
> + */
> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
> +{
> +	int i;
> +
> +	/* find corresponding igt_colorop */
> +	for (i = 0; i < display->n_colorops; ++i) {
> +		igt_colorop_t *colorop = &display->colorops[i];
> +
> +		if (colorop->id == id)
> +			return colorop;
> +	}
> +
> +	return NULL;
> +}
> +
> +/*
> + * Retrieve all the properies specified in props_name and store them into
> + * colorop->props.
> + */
> +static void
> +igt_fill_colorop_props(igt_display_t *display, igt_colorop_t *colorop,
> +		       int num_props, const char * const prop_names[])
> +{
> +	drmModeObjectPropertiesPtr props;
> +	int i, j, fd;
> +
> +	fd = display->drm_fd;
> +
> +	props = drmModeObjectGetProperties(fd, colorop->id, DRM_MODE_OBJECT_COLOROP);
> +	igt_assert(props);
> +
> +	for (i = 0; i < props->count_props; i++) {
> +		drmModePropertyPtr prop =
> +			drmModeGetProperty(fd, props->props[i]);
> +
> +		for (j = 0; j < num_props; j++) {
> +			if (strcmp(prop->name, prop_names[j]) != 0)
> +				continue;
> +
> +			colorop->props[j] = props->props[i];
> +			break;
> +		}
> +
> +		drmModeFreeProperty(prop);
> +	}
> +	drmModeFreeObjectProperties(props);
> +}
> +
> +static void igt_fill_colorop(igt_display_t *display, igt_plane_t *plane,
> +			     igt_colorop_t *colorop, uint32_t id,
> +			     char *name)
> +{
> +	colorop->id = id;
> +	colorop->plane = plane;
> +
> +	if (name)
> +		memcpy(colorop->name, name, sizeof(colorop->name));

Maybe use strncpy to avoid issue if name is smaller than colorop->name.

> +	igt_fill_colorop_props(display, colorop, IGT_NUM_COLOROP_PROPS, igt_colorop_prop_names);
> +}
> +
> +static void
> +igt_fill_plane_color_pipelines(igt_display_t *display, igt_plane_t *plane,
> +			       drmModePropertyPtr prop)
> +{
> +	int i;
> +	uint32_t colorop_id;
> +
> +	plane->num_color_pipelines = 0;
> +
> +	for (i = 0; i < prop->count_enums; i++) {
> +		if (prop->enums[i].value) {
> +			igt_colorop_t *colorop = &display->colorops[display->n_colorops++];
> +
> +			igt_assert(display->n_colorops < MAX_NUM_COLOROPS);
> +
> +			igt_fill_colorop(display, plane, colorop, prop->enums[i].value, prop->enums[i].name);
> +			plane->color_pipelines[plane->num_color_pipelines++] = colorop;
> +
> +			/* get all NEXT colorops */
> +			colorop_id = igt_colorop_get_prop(display, colorop,
> +							IGT_COLOROP_NEXT);
> +			while (colorop_id) {
> +				colorop = &display->colorops[display->n_colorops++];

I think you also need to check the n_colorops value:

	igt_assert(display->n_colorops < MAX_NUM_COLOROPS);

> +				igt_fill_colorop(display, plane, colorop, colorop_id, NULL);
> +				colorop_id = igt_colorop_get_prop(display, colorop,
> +								IGT_COLOROP_NEXT);
> +			}
> +		}
> +	}
> +
> +	igt_assert(plane->num_color_pipelines < IGT_NUM_PLANE_COLOR_PIPELINES);
> +
> +}
> +

[...]

> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 8ec39fa85..dc2a2d9e0 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -366,9 +366,18 @@ enum igt_atomic_plane_properties {
>          IGT_PLANE_HOTSPOT_Y,
>          IGT_PLANE_SIZE_HINTS,
>          IGT_PLANE_IN_FORMATS_ASYNC,
> +       IGT_PLANE_COLOR_PIPELINE,
>          IGT_NUM_PLANE_PROPS,
>   };
>   
> +enum igt_atomic_colorop_properties {
> +	IGT_COLOROP_TYPE,
> +	IGT_COLOROP_BYPASS,
> +	IGT_COLOROP_CURVE_1D_TYPE,
> +	IGT_COLOROP_NEXT,
> +	IGT_NUM_COLOROP_PROPS
> +};
> +
>   /**
>    * igt_plane_prop_names
>    *
> @@ -377,10 +386,20 @@ enum igt_atomic_plane_properties {
>    */
>   extern const char * const igt_plane_prop_names[];
>   
> +/**
> + * igt_colorop_prop_names
> + *
> + * igt_colorop_prop_names contains a list of colorop property names,
> + * as indexed by the igt_atomic_colorop_properties enum.
> + */
> +extern const char * const igt_colorop_prop_names[];
> +
>   typedef struct igt_display igt_display_t;
>   typedef struct igt_pipe igt_pipe_t;
>   typedef uint32_t igt_fixed_t;			/* 16.16 fixed point */
>   
> +#define IGT_NUM_PLANE_COLOR_PIPELINES 4
> +
>   typedef enum {
>   	/* this maps to the kernel API */
>   	IGT_ROTATION_0   = 1 << 0,
> @@ -406,6 +425,20 @@ static inline bool igt_rotation_90_or_270(igt_rotation_t rotation)
>   	return rotation & (IGT_ROTATION_90 | IGT_ROTATION_270);
>   }
>   
> +typedef struct igt_plane igt_plane_t;
> +
> +typedef struct igt_colorop {
> +	uint32_t id;
> +	igt_plane_t *plane;
> +
> +	char name[DRM_PROP_NAME_LEN];
> +
> +	uint64_t changed;
> +	uint32_t props[IGT_NUM_COLOROP_PROPS];
> +	uint64_t values[IGT_NUM_COLOROP_PROPS];
> +
> +} igt_colorop_t;
> +
>   typedef struct igt_plane {
>   	/*< private >*/
>   	igt_pipe_t *pipe;
> @@ -443,6 +476,11 @@ typedef struct igt_plane {
>   	uint64_t *async_modifiers;
>   	uint32_t *async_formats;
>   	int async_format_mod_count;
> +
> +	igt_colorop_t *color_pipelines[IGT_NUM_PLANE_COLOR_PIPELINES];
> +	int num_color_pipelines;
> +
> +	igt_colorop_t *assigned_color_pipeline;
>   } igt_plane_t;
>   
>   /*
> @@ -501,9 +539,11 @@ struct igt_display {
>   	int log_shift;
>   	int n_pipes;
>   	int n_planes;
> +	int n_colorops;
>   	int n_outputs;
>   	igt_output_t *outputs;
>   	igt_plane_t *planes;
> +	igt_colorop_t *colorops;
>   	igt_pipe_t *pipes;
>   	bool has_cursor_plane;
>   	bool is_atomic;
> @@ -846,6 +886,53 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
>   				    enum igt_atomic_plane_properties prop,
>   				    const char *val);
>   
> +
> +
> +extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
> +
> +extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
>

(maybe a dumb question) why those fonctions are extern?

> +/**
> + * igt_colorop_has_prop:
> + * @colorop: colorop to check.
> + * @prop: Property to check.
> + *
> + * Check whether colorop supports a given property.
> + *
> + * Returns: True if the property is supported, otherwise false.
> + */
> +static inline bool
> +igt_colorop_has_prop(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop)
> +{
> +	return colorop->props[prop];
> +}
> +
> +uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop);
> +
> +#define igt_colorop_is_prop_changed(colorop, prop) \
> +	(!!((colorop)->changed & (1 << (prop))))
> +
> +#define igt_colorop_set_prop_changed(colorop, prop) \
> +	((colorop)->changed |= 1 << (prop))
> +
> +#define igt_colorop_clear_prop_changed(colorop, prop) \
> +	((colorop)->changed &= ~(1 << (prop)))
> +
> +#define igt_colorop_set_prop_value(colorop, prop, value) \
> +	do { \
> +		colorop->values[prop] = value; \
> +		igt_colorop_set_prop_changed(colorop, prop); \
> +	} while (0)
> +
> +
> +extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
> +				      enum igt_atomic_colorop_properties prop,
> +				      const char *val);
> +
> +extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
> +				      enum igt_atomic_colorop_properties prop,
> +				      const char *val);
> +
>   extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
>   					enum igt_atomic_plane_properties prop,
>   					const void *ptr, size_t length);
> @@ -1289,4 +1376,6 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>   
>   drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
>   
> +igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
> +
>   #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index e646b8184..3bdf23aad 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -112,6 +112,9 @@ static bool ignore_property(uint32_t obj_type, uint32_t prop_flags,
>   			return true;
>   		break;
>   	case DRM_MODE_OBJECT_PLANE:
> +		if (!has_color_pipeline && !strcmp(name, "COLOR_PIPELINE"))
> +			return true;
> +
>   		if (has_color_pipeline && !strcmp(name, "COLOR_RANGE"))
>   			return true;
>   

-- 
--
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


