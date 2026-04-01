Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900B210F6FD6
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 16:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2B810E20B;
	Wed,  1 Apr 2026 16:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FhTGrIAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEBC10E20B
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 16:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775059252; x=1806595252;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=0Kv2NTR4QEhW8uy52j6oHN8IHoz6k01F8szZMivGf8Y=;
 b=FhTGrIAd13UEPpa3i+kf4cnDVAcFLnfZMCwJcvB6eOugNzj5pU6wgHkN
 +r0G9EYAwcvuR3vkBRTcrpw3jLAkYoxXHOfCeBzE0WMyQaMWMzP7zaS2n
 ZCJuMWk5uEypqVK7x4FAy5oWbCul5fJ+C2q7bXRjV8wvHmkpNWO9bFe1R
 6bufLY5O6br4i5SGbEME09bGjI1tLuwiIADd5X1Ui67mR8b+SodeC+c6o
 NWJfIuzI1464xzzLFr31npFEUwBfKnNJdWMd8+op6vL5gsTkqXkY/q/mn
 5CTEgWq9Asizup19ejYyuOet+j1eQvEPFoLV5U0Gazih8tKPYNqPt8wYF A==;
X-CSE-ConnectionGUID: zDWQdIctSamukemP7xDXIA==
X-CSE-MsgGUID: Mql4pMxBS1+Q+z1leLFmdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="78697377"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="78697377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:00:51 -0700
X-CSE-ConnectionGUID: +uf8azsiSBmTaIDPPymmxA==
X-CSE-MsgGUID: ov6giHCiQfGedkJ865iEgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="226577478"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.199])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 09:00:50 -0700
Date: Wed, 1 Apr 2026 19:00:46 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jeevan B <jeevan.b@intel.com>
Cc: igt-dev@lists.freedesktop.org, uma.shankar@intel.com, jani.nikula@intel.com
Subject: Re: [PATCH i-g-t v2 1/2] lib: Add modifier helper for querying
 driver-supported modifiers
Message-ID: <ac1BLkuepyVmF4bl@intel.com>
References: <20260401152538.632846-1-jeevan.b@intel.com>
 <20260401152538.632846-2-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260401152538.632846-2-jeevan.b@intel.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

On Wed, Apr 01, 2026 at 08:55:36PM +0530, Jeevan B wrote:
> Introduce a new helper library that collects DRM format modifiers
> reported by KMS planes via the IN_FORMATS property.

We already have this parsed.

> Two functions are
> added:
> 
>  - igt_get_all_supported_modifiers()
>  - igt_get_basic_tiling_modifiers()
> 
> These helpers return unique modifier lists for a given format and will
> be used by modifier-related tests.
> 
> v2: Update license headers, removes unnecessary inline usage,
>     standardizes loops to use int, drops unused casts, introduces
>     a small struct to manage modifier lists more cleanly, improves
>     allocation handling, simplifies the basic modifier selection
>     logic, and update coding‑style improvements.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  lib/igt_modifier.c | 242 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_modifier.h |  18 ++++
>  lib/meson.build    |   1 +
>  3 files changed, 261 insertions(+)
>  create mode 100644 lib/igt_modifier.c
>  create mode 100644 lib/igt_modifier.h
> 
> diff --git a/lib/igt_modifier.c b/lib/igt_modifier.c
> new file mode 100644
> index 000000000..ffcf09bc9
> --- /dev/null
> +++ b/lib/igt_modifier.c
> @@ -0,0 +1,242 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +
> +#include <stdlib.h>
> +#include <string.h>
> +#include <stdbool.h>
> +
> +#include <drm_fourcc.h>
> +#include <xf86drm.h>
> +#include <xf86drmMode.h>
> +
> +#include "igt_modifier.h"
> +#include "igt_core.h"
> +#include "drmtest.h"
> +
> +/*
> + * Modifier array with dynamic allocation.
> + */
> +struct modifiers {
> +	uint64_t *array;
> +	int nelems;
> +	int alloc;
> +};
> +
> +static void modifiers_init(struct modifiers *m)
> +{
> +	m->array = NULL;
> +	m->nelems = 0;
> +	m->alloc = 0;
> +}
> +
> +static bool modifiers_contains(const struct modifiers *m, uint64_t val)
> +{
> +	for (int i = 0; i < m->nelems; i++)
> +		if (m->array[i] == val)
> +			return true;
> +	return false;
> +}
> +
> +static void modifiers_append_unique(struct modifiers *m, uint64_t val)
> +{
> +	if (modifiers_contains(m, val))
> +		return;
> +
> +	if (m->nelems == m->alloc) {
> +		int new_alloc = m->alloc ? m->alloc * 2 : 8;
> +		m->array = realloc(m->array, new_alloc * sizeof(uint64_t));
> +		igt_assert(m->array);
> +
> +		m->alloc = new_alloc;
> +	}
> +
> +	m->array[m->nelems++] = val;
> +}
> +
> +static void modifiers_finalize(struct modifiers *m, uint64_t **out, int *count)
> +{
> +	*out = m->array;
> +	*count = m->nelems;
> +}
> +
> +
> +static const uint32_t *
> +blob_formats_ptr(const struct drm_format_modifier_blob *blob)
> +{
> +	return (const uint32_t *)((const char *)blob + blob->formats_offset);
> +}
> +
> +static const struct drm_format_modifier *
> +blob_modifiers_ptr(const struct drm_format_modifier_blob *blob)
> +{
> +	return (const struct drm_format_modifier *)
> +		((const char *)blob + blob->modifiers_offset);
> +}
> +
> +static void collect_modifiers_from_blob(struct modifiers *m,
> +		const struct drm_format_modifier_blob *blob,
> +		uint32_t format)
> +{
> +	const uint32_t *formats = blob_formats_ptr(blob);
> +	const struct drm_format_modifier *mods = blob_modifiers_ptr(blob);
> +
> +	int fmt_idx = -1;
> +
> +	for (int i = 0; i < (int)blob->count_formats; i++) {
> +		if (formats[i] == format) {
> +			fmt_idx = i;
> +			break;
> +		}
> +	}
> +
> +	if (fmt_idx < 0)
> +		return;
> +
> +	for (int i = 0; i < (int)blob->count_modifiers; i++) {
> +		const struct drm_format_modifier *entry = &mods[i];
> +		int rel = fmt_idx - entry->offset;
> +
> +		if (rel < 0 || rel >= 64)
> +			continue;
> +
> +		if (entry->formats & (1ULL << rel))
> +			modifiers_append_unique(m, entry->modifier);
> +	}
> +}
> +
> +static int query_plane_modifiers(int drm_fd, uint32_t format,
> +				 uint64_t **out)
> +{
> +	struct modifiers mods;
> +	drmModePlaneResPtr pres;
> +
> +	modifiers_init(&mods);
> +
> +	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> +
> +	pres = drmModeGetPlaneResources(drm_fd);
> +	if (!pres)
> +		goto fallback;
> +
> +	for (int i = 0; i < (int)pres->count_planes; i++) {
> +		drmModePlanePtr p;
> +		drmModeObjectPropertiesPtr props;
> +		drmModePropertyBlobPtr blob;
> +		bool supported;
> +		int f, j;
> +
> +		p = drmModeGetPlane(drm_fd, pres->planes[i]);
> +		if (!p)
> +			continue;
> +
> +		supported = false;
> +
> +		for (f = 0; f < (int)p->count_formats; f++) {
> +			if (p->formats[f] == format) {
> +				supported = true;
> +				break;
> +			}
> +		}
> +
> +		if (!supported) {
> +			drmModeFreePlane(p);
> +			continue;
> +		}
> +
> +		props =	drmModeObjectGetProperties(drm_fd, p->plane_id,
> +						   DRM_MODE_OBJECT_PLANE);
> +
> +		blob = NULL;
> +
> +		if (props) {
> +			for ( j = 0; j < props->count_props; j++) {
> +				drmModePropertyPtr prop =
> +					drmModeGetProperty(drm_fd, props->props[j]);
> +				if (!prop)
> +					continue;
> +
> +				if (!strcmp(prop->name, "IN_FORMATS") &&
> +				    drm_property_type_is(prop, DRM_MODE_PROP_BLOB) &&
> +				    props->prop_values[j] != 0) {
> +					blob = drmModeGetPropertyBlob(
> +							drm_fd, props->prop_values[j]);
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
> +			const struct drm_format_modifier_blob *b =
> +				(const struct drm_format_modifier_blob *)blob->data;
> +
> +			collect_modifiers_from_blob(&mods, b, format);
> +			drmModeFreePropertyBlob(blob);
> +		} else {
> +			modifiers_append_unique(&mods, DRM_FORMAT_MOD_LINEAR);
> +		}
> +
> +		drmModeFreePlane(p);
> +	}
> +
> +	drmModeFreePlaneResources(pres);
> +
> +fallback:
> +	int count;
> +
> +	if (mods.nelems == 0)
> +		modifiers_append_unique(&mods, DRM_FORMAT_MOD_LINEAR);
> +
> +	modifiers_finalize(&mods, out, &count);
> +	return count;
> +}
> +
> +int igt_get_all_supported_modifiers(int drm_fd, uint32_t format,
> +				    uint64_t **modifiers_out)
> +{
> +	igt_assert(modifiers_out);
> +	return query_plane_modifiers(drm_fd, format, modifiers_out);
> +}
> +
> +static const uint64_t basic_mods[] = {
> +	DRM_FORMAT_MOD_LINEAR,
> +	I915_FORMAT_MOD_X_TILED,
> +	I915_FORMAT_MOD_Y_TILED,
> +	I915_FORMAT_MOD_4_TILED,
> +};
> +
> +int igt_get_basic_tiling_modifiers(int drm_fd, uint32_t format,
> +				   uint64_t **modifiers_out)
> +{
> +	uint64_t *all = NULL;
> +	int all_count = query_plane_modifiers(drm_fd, format, &all);
> +	int count;
> +
> +	struct modifiers out;
> +	modifiers_init(&out);
> +
> +	for (int i = 0; i < all_count; i++) {
> +		for (int j = 0; j < (int)(sizeof(basic_mods)/sizeof(basic_mods[0])); j++) {
> +			if (all[i] == basic_mods[j]) {
> +				modifiers_append_unique(&out, all[i]);
> +				break;
> +			}
> +		}
> +	}
> +
> +	free(all);
> +
> +	if (out.nelems == 0)
> +		modifiers_append_unique(&out, DRM_FORMAT_MOD_LINEAR);
> +
> +	modifiers_finalize(&out, modifiers_out, &count);
> +	return count;
> +}
> diff --git a/lib/igt_modifier.h b/lib/igt_modifier.h
> new file mode 100644
> index 000000000..069ea334a
> --- /dev/null
> +++ b/lib/igt_modifier.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
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
> @@ -99,6 +99,7 @@ lib_sources = [
>  	'igt_draw.c',
>  	'igt_list.c',
>  	'igt_map.c',
> +        'igt_modifier.c',
>  	'igt_panel.c',
>  	'igt_pm.c',
>  	'igt_dummyload.c',
> -- 
> 2.43.0

-- 
Ville Syrjälä
Intel
