Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BFDD3516F
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 10:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 384BE10ED45;
	Wed,  1 Apr 2026 10:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQqBzqFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA9010ED3E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 10:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775038457; x=1806574457;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lFYl8WDahudumof1GYspJqDc/DLmk+yK9tpWcYk7QsA=;
 b=UQqBzqFSXAp4VlInmk/lTc/fP7yquc6UlwMUixtlDrVVVI5W9B3c0Q4R
 vUReZ+1swceKUiunPxZ579PjftBBLgq43tky5aifYsy2XrQ6ccbsCwQ+E
 B18cUuJrDmFBZhuQZXb2WkBGKJfNSoGF9eC5Pm57OMykT8bFQi7TOCvbz
 uba6MYVZLk5KAex2qoFuJ55ToCnI4/3KiI565ec2CsD71jdf5K1qPvulk
 VQq6IzBDqJ6GbY0X69QfKy5pOZZKeOxeD2G0TTcstYNTfl+quNK5KxNTT
 bVRqVllivpooLPhrz4P4HWOuxPRUtHHcctvaNbRU4urDFb2qD9QVsabfb Q==;
X-CSE-ConnectionGUID: u5AHB4OpQh+swJEwv6Kd1A==
X-CSE-MsgGUID: KCLYseLRQdu21mHA+ANPpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76260155"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="76260155"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:14:17 -0700
X-CSE-ConnectionGUID: ybSlyn1+S0+EtYNMulWGdw==
X-CSE-MsgGUID: lq8ZKxFPTeKIekQsdPVHLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="228247926"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.152])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 03:14:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: uma.shankar@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t 1/2] lib: Add modifier helper for querying
 driver-supported modifiers
In-Reply-To: <20260401085851.627453-2-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260401085851.627453-1-jeevan.b@intel.com>
 <20260401085851.627453-2-jeevan.b@intel.com>
Date: Wed, 01 Apr 2026 13:14:10 +0300
Message-ID: <58476acba312c1002fc69e0f80684f3f101e0079@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Wed, 01 Apr 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Introduce a new helper library that collects DRM format modifiers
> reported by KMS planes via the IN_FORMATS property. Two functions are
> added:
>
>  - igt_get_all_supported_modifiers()
>  - igt_get_basic_tiling_modifiers()
>
> These helpers return unique modifier lists for a given format and will
> be used by modifier-related tests.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_modifier.c | 310 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_modifier.h |  35 +++++
>  lib/meson.build    |   1 +
>  3 files changed, 346 insertions(+)
>  create mode 100644 lib/igt_modifier.c
>  create mode 100644 lib/igt_modifier.h
>
> diff --git a/lib/igt_modifier.c b/lib/igt_modifier.c
> new file mode 100644
> index 000000000..561afb346
> --- /dev/null
> +++ b/lib/igt_modifier.c
> @@ -0,0 +1,310 @@
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */

// SPDX-License-Identifier: MIT

for new files?

> +
> +/**
> + * SECTION:igt_modifier
> + * @short_description: Helpers to query supported DRM format modifiers
> + * @title: IGT Modifier Helpers
> + */
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdbool.h>
> +#include <errno.h>
> +
> +#include <drm_fourcc.h>
> +#include <xf86drm.h>
> +#include <xf86drmMode.h>
> +
> +#include "drmtest.h"
> +#include "igt_modifier.h"
> +#include "igt_core.h"
> +
> +/*
> + * Basic tiling modifier candidates.  Only those reported as actually
> + * supported by the driver for the requested format will be returned by
> + * igt_get_basic_tiling_modifiers().
> + */
> +static const uint64_t basic_modifier_candidates[] =3D {
> +	DRM_FORMAT_MOD_LINEAR,
> +	I915_FORMAT_MOD_X_TILED,
> +	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_4_TILED,
> +};
> +
> +static inline const uint32_t *

There's not a whole lot using inline in .c files brings you. Just let
the compiler do its job.

> +blob_formats_ptr(const struct drm_format_modifier_blob *blob)
> +{
> +	return (const uint32_t *)((const char *)blob + blob->formats_offset);
> +}
> +
> +static inline const struct drm_format_modifier *
> +blob_modifiers_ptr(const struct drm_format_modifier_blob *blob)
> +{
> +	return (const struct drm_format_modifier *)
> +		((const char *)blob + blob->modifiers_offset);
> +}
> +
> +/*
> + * append_unique_modifier - add @mod to @list if not already present.
> + *
> + * @list:  pointer to the growing array (may be reallocated).
> + * @count: current number of entries.
> + * @mod:   modifier to add.
> + *
> + * Returns the new count.
> + */
> +static int append_unique_modifier(uint64_t **list, int count, uint64_t m=
od)
> +{
> +	for (int i =3D 0; i < count; i++) {
> +		if ((*list)[i] =3D=3D mod)
> +			return count;
> +	}
> +
> +	*list =3D realloc(*list, (count + 1) * sizeof(**list));
> +	igt_assert(*list);
> +	(*list)[count] =3D mod;
> +	return count + 1;

I'm not saying you have to, but if I were doing this, I'd add some
struct for this, so that 1) you can just pass the struct pointer around,
without the count, and 2) you can track allocation size and number of
elements separately.

struct modifiers {
	uint64_t *array;
        int alloc_size;
        int nelems;
};

Cook up better names for the members if you like.

Then you can have something like this:

static void has_modifier(struct modifiers *modifiers, uint64_t mod)
{
	for (int i =3D 0; i < modifiers->nelems; i++)
		if (modifiers->array[i] =3D=3D mod)
			return true;

	return false;
}

static void append_unique_modifier(struct modifiers *modifiers, uint64_t mo=
d)
{
	if (has_modifier(modifiers, mod))
		return;

	if (modifiers->nelems =3D=3D modifiers->alloc_size) {
		/* arbitrary initial size of 8 */
		modifiers->alloc_size =3D modifiers->alloc_size ? modifiers->alloc_size *=
 2 : 8;
		modifiers->array =3D realloc(modifiers->array, modifiers->alloc_size * si=
zeof(modifiers->array[0]));
	}

	modifiers->array[modifiers->nelems++] =3D mod;
}

Crucially, when there's not enough space, you can e.g. double the
allocation size, so you don't have to realloc for every single element
you add to the array.

In the end, you can realloc trim to number of elements, but even that
doesn't really matter all that much.

> +}
> +
> +/*
> + * collect_modifiers_from_blob - parse an IN_FORMATS blob and collect ev=
ery
> + * modifier that is paired with @format into @list.
> + *
> + * Returns the updated count of unique modifiers in @list.
> + */
> +static int collect_modifiers_from_blob(const struct drm_format_modifier_=
blob *blob,
> +				       uint32_t format,
> +				       uint64_t **list, int count)
> +{
> +	const uint32_t *formats =3D blob_formats_ptr(blob);
> +	const struct drm_format_modifier *mods =3D blob_modifiers_ptr(blob);
> +
> +	/* Find the index of @format in the blob's format array. */
> +	int fmt_idx =3D -1;
> +
> +	for (uint32_t f =3D 0; f < blob->count_formats; f++) {

Please just use int for looping.

> +		if (formats[f] =3D=3D format) {
> +			fmt_idx =3D (int)f;

And then you also don't need to use the icky cast.

> +			break;
> +		}
> +	}
> +
> +	if (fmt_idx < 0)
> +		return count;
> +
> +	/*
> +	 * Each drm_format_modifier entry covers a window of 64 formats
> +	 * starting at modifier.offset.  Check whether our format index falls
> +	 * inside the window and whether the corresponding bit is set.
> +	 */
> +	for (uint32_t m =3D 0; m < blob->count_modifiers; m++) {
> +		const struct drm_format_modifier *entry =3D &mods[m];
> +		int rel =3D fmt_idx - (int)entry->offset;

What's with the cast?

> +
> +		if (rel < 0 || rel >=3D 64)
> +			continue;
> +
> +		if (!(entry->formats & (UINT64_C(1) << rel)))
> +			continue;
> +
> +		count =3D append_unique_modifier(list, count, entry->modifier);
> +	}
> +
> +	return count;
> +}
> +
> +/*
> + * query_plane_modifiers - iterate all KMS planes and collect supported
> + * modifiers for @format via the IN_FORMATS property blob.
> + *
> + * Falls back to DRM_FORMAT_MOD_LINEAR when a plane supports @format in =
the
> + * legacy format list but exposes no IN_FORMATS blob.
> + *
> + * Returns the number of unique modifiers written into *modifiers_out (>=
=3D0).
> + * The caller must free() the returned array.
> + */
> +static int query_plane_modifiers(int drm_fd, uint32_t format,
> +				 uint64_t **modifiers_out)
> +{
> +	drmModePlaneResPtr plane_res;
> +	uint64_t *list =3D NULL;
> +	int count =3D 0;
> +
> +	/* Universal planes capability is needed to see overlay and cursor plan=
es. */
> +	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> +
> +	plane_res =3D drmModeGetPlaneResources(drm_fd);
> +	if (!plane_res)
> +		goto out;
> +
> +	for (uint32_t p =3D 0; p < plane_res->count_planes; p++) {

Please just use int for loops.

> +		drmModePlanePtr plane;
> +		drmModeObjectPropertiesPtr props;
> +		drmModePropertyBlobPtr blob =3D NULL;
> +		bool format_in_plane =3D false;
> +
> +		plane =3D drmModeGetPlane(drm_fd, plane_res->planes[p]);
> +		if (!plane)
> +			continue;
> +
> +		/* Check whether this plane supports @format at all. */
> +		for (uint32_t f =3D 0; f < plane->count_formats; f++) {

Ditto.

> +			if (plane->formats[f] =3D=3D format) {
> +				format_in_plane =3D true;
> +				break;
> +			}
> +		}
> +
> +		if (!format_in_plane) {
> +			drmModeFreePlane(plane);
> +			continue;
> +		}
> +
> +		props =3D drmModeObjectGetProperties(drm_fd, plane->plane_id,
> +						   DRM_MODE_OBJECT_PLANE);
> +		if (props) {
> +			for (uint32_t i =3D 0; i < props->count_props; i++) {

Ditto.

> +				drmModePropertyPtr prop =3D
> +					drmModeGetProperty(drm_fd, props->props[i]);
> +				if (!prop)
> +					continue;
> +
> +				if (strcmp(prop->name, "IN_FORMATS") =3D=3D 0 &&
> +				    drm_property_type_is(prop, DRM_MODE_PROP_BLOB) &&
> +				    props->prop_values[i] !=3D 0) {
> +					blob =3D drmModeGetPropertyBlob(
> +						drm_fd, props->prop_values[i]);
> +				}
> +
> +				drmModeFreeProperty(prop);
> +
> +				if (blob)
> +					break;
> +			}
> +			drmModeFreeObjectProperties(props);
> +		}
> +
> +		if (blob) {
> +			const struct drm_format_modifier_blob *blob_data =3D
> +				(const struct drm_format_modifier_blob *)blob->data;
> +
> +			count =3D collect_modifiers_from_blob(blob_data, format,
> +							    &list, count);
> +			drmModeFreePropertyBlob(blob);
> +		} else {
> +			/*
> +			 * No IN_FORMATS blob: we know the format is supported
> +			 * but not which modifiers; assume linear only.
> +			 */
> +			count =3D append_unique_modifier(&list, count,
> +						       DRM_FORMAT_MOD_LINEAR);
> +		}
> +
> +		drmModeFreePlane(plane);
> +	}
> +
> +	drmModeFreePlaneResources(plane_res);
> +
> +out:
> +	if (count =3D=3D 0)
> +		count =3D append_unique_modifier(&list, count,
> +					       DRM_FORMAT_MOD_LINEAR);
> +
> +	*modifiers_out =3D list;
> +	return count;
> +}
> +
> +/**
> + * igt_get_all_supported_modifiers:
> + * @drm_fd:       open DRM file descriptor for the device under test
> + * @format:       DRM FOURCC pixel format (e.g. %DRM_FORMAT_XRGB8888)
> + * @modifiers_out: output pointer; set to a malloc'd array of unique mod=
ifiers
> + *                 on success. The caller must free() this array.
> + *
> + * Returns the number of modifiers in the returned array (always >=3D 1 =
because
> + * %DRM_FORMAT_MOD_LINEAR is used as a fallback).  The list is deduplica=
ted
> + * across all KMS planes; it covers every modifier reported in the %IN_F=
ORMATS
> + * plane property for the given @format on the running platform.
> + *
> + * Returns: number of entries in @modifiers_out (>=3D 1).
> + */
> +int igt_get_all_supported_modifiers(int drm_fd, uint32_t format,
> +				    uint64_t **modifiers_out)
> +{

So you'd have

	struct modifiers modifiers =3D {};

here and pass &modifiers around.

In the end, you can just *modifiers =3D modifiers->array; and return
modifiers->nelems; or something.

> +	igt_assert(modifiers_out);
> +	return query_plane_modifiers(drm_fd, format, modifiers_out);
> +}
> +
> +/**
> + * igt_get_basic_tiling_modifiers:
> + * @drm_fd:       open DRM file descriptor for the device under test
> + * @format:       DRM FOURCC pixel format (e.g. %DRM_FORMAT_XRGB8888)
> + * @modifiers_out: output pointer; set to a malloc'd array of unique mod=
ifiers
> + *                 on success. The caller must free() this array.
> + *
> + * Returns the subset of the "basic" tiling modifiers that are actually
> + * supported by the driver for @format.  The basic set comprises:
> + *
> + * - %DRM_FORMAT_MOD_LINEAR
> + * - %I915_FORMAT_MOD_X_TILED
> + * - %I915_FORMAT_MOD_Y_TILED
> + * - %I915_FORMAT_MOD_4_TILED
> + *
> + * Only modifiers that are actually reported by the driver via the %IN_F=
ORMATS
> + * KMS plane property are included in the result.
> + *
> + * Returns: number of entries in @modifiers_out (>=3D 1, since at least
> + * %DRM_FORMAT_MOD_LINEAR is always included as a fallback).
> + */
> +int igt_get_basic_tiling_modifiers(int drm_fd, uint32_t format,
> +				   uint64_t **modifiers_out)
> +{
> +	uint64_t *all =3D NULL;
> +	uint64_t *basic =3D NULL;
> +	int all_count, basic_count =3D 0;
> +
> +	igt_assert(modifiers_out);
> +
> +	all_count =3D query_plane_modifiers(drm_fd, format, &all);
> +
> +	for (int i =3D 0; i < all_count; i++) {
> +		for (int j =3D 0; j < (int)ARRAY_SIZE(basic_modifier_candidates); j++)=
 {
> +			if (all[i] =3D=3D basic_modifier_candidates[j]) {
> +				basic_count =3D append_unique_modifier(&basic,
> +								     basic_count,
> +								     all[i]);
> +				break;
> +			}
> +		}
> +	}

And you could store basic_modifier_candidates in a static const struct
modifier too, and add generic set intersection operation for struct
modifier, so this is not all so specific.

> +
> +	free(all);
> +
> +	if (basic_count =3D=3D 0)
> +		basic_count =3D append_unique_modifier(&basic, basic_count,
> +						     DRM_FORMAT_MOD_LINEAR);
> +
> +	*modifiers_out =3D basic;
> +	return basic_count;
> +}
> diff --git a/lib/igt_modifier.h b/lib/igt_modifier.h
> new file mode 100644
> index 000000000..48ce769f5
> --- /dev/null
> +++ b/lib/igt_modifier.h
> @@ -0,0 +1,35 @@
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + */

SPDX.

> +
> +#ifndef __IGT_MODIFIER_H__
> +#define __IGT_MODIFIER_H__
> +
> +#include <stdint.h>
> +
> +int igt_get_all_supported_modifiers(int drm_fd, uint32_t format,
> +				    uint64_t **modifiers_out);
> +
> +int igt_get_basic_tiling_modifiers(int drm_fd, uint32_t format,
> +				   uint64_t **modifiers_out);
> +
> +#endif /* __IGT_MODIFIER_H__ */
> diff --git a/lib/meson.build b/lib/meson.build
> index 5c4829345..ca2867eed 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -99,6 +99,7 @@ lib_sources =3D [
>  	'igt_draw.c',
>  	'igt_list.c',
>  	'igt_map.c',
> +        'igt_modifier.c',
>  	'igt_panel.c',
>  	'igt_pm.c',
>  	'igt_dummyload.c',

--=20
Jani Nikula, Intel
