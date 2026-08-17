Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEACC5DF66
	for <igt-dev@archiver.kernel.org>; Mon, 17 Aug 2026 15:58:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF39310E888;
	Mon, 17 Aug 2026 15:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FccCdSnP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D6210E261
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Aug 2026 15:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786982265; x=1818518265;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=r8Udwhfe/4P0ewLmsa+cQG8uIj5XHYq2z8hz3g+k29Q=;
 b=FccCdSnP7uQ3gk5f2HsJEA37rZPETdwzscDF5C3g1/vD1p1TrIWHVhlQ
 2o0jLTns3hdDsvipfRdKlGL5/OYq7GzHlWXOYNr3HgBMWBP56FAem3RBt
 S4yqrCpvc5ibFnc+kMdNzIWwiVDIuYiE2y/xnHWybdPqFm2TbcluCYVYV
 4Vv10NeJSJi3qEs9uSX44PTNyuft7DjmnvheUTumDEHx+ZIOTLP4qGKMh
 5TzchgIicAo9UKtgOvywHwgrMiBMIuod8l9NYeFpUdxyFJ/eXWTWzP/MF
 0rAdtwLxz+vcGDHIkPvRPhrBtIPoPSASv6hDbjP6du15eN8trQ7urSBff g==;
X-CSE-ConnectionGUID: CrXcTui1RxaUJyvGPvVwdg==
X-CSE-MsgGUID: 291Tp/vMR42i/wDzYAdoHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87583434"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="87583434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 08:57:45 -0700
X-CSE-ConnectionGUID: t1xEDwHYSaCq6QGmrixScw==
X-CSE-MsgGUID: A63LcXl3QP6Qlewa93MNeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; d="scan'208";a="270150553"
Received: from abityuts-desk1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.110])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2026 08:57:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, John Harrison
 <John.Harrison@Igalia.com>, Rodrigo Siqueira <siqueira@igalia.com>, Simon
 Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland
 <harry.wentland@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH i-g-t v4 8/8] lib/igt_kms: add macros to iterate color
 pipelines and colorops
In-Reply-To: <20260817150749.66509-9-mwen@igalia.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260817150749.66509-1-mwen@igalia.com>
 <20260817150749.66509-9-mwen@igalia.com>
Date: Mon, 17 Aug 2026 18:57:37 +0300
Message-ID: <ac3bce062c3fc16a78aa561c300b5c3af6496b11@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 17 Aug 2026, Melissa Wen <mwen@igalia.com> wrote:
> Walking a plane's color pipelines, and the colorop chain of a given
> pipeline, is open-coded in six places across lib and the colorop tests.
> Add for_each_color_pipeline() to iterate over all color pipelines
> supported by a plane and for_each_colorop_in_pipeline() to iterate over
> all colorops of a pipeline, together with the igt_colorop_next() helper
> the latter builds on, and convert the existing walks.
>
> The chain walk in igt_fill_plane_color_pipelines() is left as is: it
> discovers colorops while walking, so igt_find_colorop() cannot resolve
> them yet.
>
> Suggested-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>
> v4:
> - new patch, suggested by Jani
> ---
>  lib/igt_kms.c              | 52 ++++++++++++++++++++------------------
>  lib/igt_kms.h              |  9 +++++++
>  tests/kms_colorop.c        | 17 +++++--------
>  tests/kms_colorop_helper.c | 40 ++++++++++-------------------
>  tests/kms_properties.c     | 17 ++++---------
>  5 files changed, 62 insertions(+), 73 deletions(-)

I like the diffstat, but I like the clarity more. :)

>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e9a14c991..7a21404b8 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -815,6 +815,21 @@ igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id)
>  	return NULL;
>  }
>  
> +/**
> + * igt_colorop_next:
> + * @display: a pointer to an #igt_display_t structure
> + * @colorop: Current colorop.
> + *
> + * Returns: the colorop pointed to by @colorop's NEXT property, or NULL at the
> + * end of the chain.
> + */
> +igt_colorop_t *igt_colorop_next(igt_display_t *display, igt_colorop_t *colorop)
> +{

Hmm. Can't you get at display via colorop->plane->crtc->display? Or can
some of those be NULL?

Not a big deal to keep it, might be a rabbit hole to ensure the above.

> +	uint32_t next = igt_colorop_get_prop(display, colorop, IGT_COLOROP_NEXT);
> +
> +	return igt_find_colorop(display, next);
> +}
> +
>  /*
>   * Retrieve all the properies specified in props_name and store them into
>   * colorop->props.
> @@ -3809,13 +3824,14 @@ igt_atomic_prepare_plane_commit(igt_plane_t *plane, igt_crtc_t *crtc,
>   * Add colorop properties
>   */
>  static void
> -igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
> +igt_atomic_prepare_colorop_commit(igt_colorop_t *color_pipeline, igt_crtc_t *crtc,
>  				  drmModeAtomicReq *req)
>  {
>  	igt_display_t *display = crtc->display;
> -	int i, next_val;
> +	igt_colorop_t *colorop;
> +	int i;
>  
> -	while (colorop) {
> +	for_each_colorop_in_pipeline(display, color_pipeline, colorop) {
>  		LOG(display,
>  		    "populating colorop data: %s.%d\n",
>  		    igt_crtc_name(crtc),
> @@ -3837,11 +3853,6 @@ igt_atomic_prepare_colorop_commit(igt_colorop_t *colorop, igt_crtc_t *crtc,
>  							colorop->props[i],
>  							colorop->values[i]));
>  		}
> -
> -		/* get next colorop */
> -		next_val = igt_colorop_get_prop(display, colorop,
> -						IGT_COLOROP_NEXT);
> -		colorop = igt_find_colorop(display, next_val);
>  	}
>  }
>  
> @@ -4414,18 +4425,16 @@ bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
>   */
>  bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
>  {
> -	int i;
> -	bool found = false;
> +	igt_colorop_t *color_pipeline;
>  
> -	for (i = 0; i < plane->num_color_pipelines; i++) {
> -		if (plane->color_pipelines[i] == colorop) {
> -			found = true;
> -			break;
> -		}
> +	for_each_color_pipeline(plane, color_pipeline) {
> +		if (color_pipeline == colorop)
> +			return true;
>  	}
>  
> -	return found;
> +	return false;
>  }
> +
>  /**
>   * igt_plane_set_color_pipeline:
>   * @plane: Target plane.
> @@ -4925,15 +4934,10 @@ display_commit_changed(igt_display_t *display, enum igt_commit_style s)
>  				 * so already-committed property values aren't re-emitted on
>  				 * the next commit.
>  				 */
> -				colorop = plane->assigned_color_pipeline;
> -				while (colorop) {
> -					uint32_t next_val;
> -
> +				for_each_colorop_in_pipeline(display,
> +							     plane->assigned_color_pipeline,
> +							     colorop)
>  					colorop->changed = 0;
> -					next_val = igt_colorop_get_prop(display, colorop,
> -									IGT_COLOROP_NEXT);
> -					colorop = igt_find_colorop(display, next_val);
> -				}
>  
>  				fd = plane->values[IGT_PLANE_IN_FENCE_FD];
>  				if (fd != -1)
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index ace8c2b1f..b4b666796 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1022,6 +1022,15 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
>  		igt_colorop_set_prop_changed(colorop, prop); \
>  	} while (0)
>  
> +igt_colorop_t *igt_colorop_next(igt_display_t *display, igt_colorop_t *colorop);

If this is only ever to be used with the iterator, maybe call it
__igt_colorop_next(), because otherwise people will start using it
willy-nilly.

> +
> +#define for_each_color_pipeline(plane, color_pipeline) \
> +	for (int i__ = 0; i__ < (plane)->num_color_pipelines && \
> +	     ((color_pipeline) = (plane)->color_pipelines[i__], true); i__++)

With this, you could avoid the loop variable:

	for ((color_pipeline) = &(plane)->color_pipelines[0]; \
	     (color_pipeline) < &(plane)->color_pipelines[(plane)->num_color_pipelines]; \
	     (color_pipeline)++)

We do this in for_each_output(), for_each_crtc(),
for_each_connector_mode(), etc. too.

> +
> +#define for_each_colorop_in_pipeline(display, pipeline, colorop) \
> +	for ((colorop) = (pipeline); (colorop); \
> +	     (colorop) = igt_colorop_next((display), (colorop)))
>  
>  extern bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
>  					    enum igt_atomic_colorop_properties prop,
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 8648bd7ce..ae67d4f4c 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -296,10 +296,8 @@ static void colorop_plane_test(igt_display_t *display,
>  static void check_plane_colorop_ids(igt_display_t *display)
>  {
>  	igt_plane_t *plane;
> -	int colorop_idx;
> -	igt_colorop_t *next;
> +	igt_colorop_t *colorop, *color_pipeline;
>  	igt_crtc_t *crtc;
> -	int prop_val = 0;
>  
>  	/* Use hash tables to track drm_planes and unique IDs */
>  	GHashTable *plane_set = g_hash_table_new(g_direct_hash, g_direct_equal);
> @@ -314,18 +312,15 @@ static void check_plane_colorop_ids(igt_display_t *display)
>  
>  			g_hash_table_add(plane_set, GINT_TO_POINTER(plane->drm_plane->plane_id));
>  
> -			for (colorop_idx = 0; colorop_idx < plane->num_color_pipelines; colorop_idx++) {
> -				next = plane->color_pipelines[colorop_idx];
> -				while (next) {
> +			for_each_color_pipeline(plane, color_pipeline) {
> +				for_each_colorop_in_pipeline(display, color_pipeline, colorop) {
>  					/* Check if the ID already exists in the set */
> -					if (g_hash_table_contains(id_set, GINT_TO_POINTER(next->id))) {
> +					if (g_hash_table_contains(id_set, GINT_TO_POINTER(colorop->id))) {
>  						igt_fail_on_f(true, "Duplicate colorop ID %u found on plane %d\n",
> -						next->id, plane->drm_plane->plane_id);
> +						colorop->id, plane->drm_plane->plane_id);
>  					}
>  
> -					g_hash_table_add(id_set, GINT_TO_POINTER(next->id));
> -					prop_val = igt_colorop_get_prop(display, next, IGT_COLOROP_NEXT);
> -					next = igt_find_colorop(display, prop_val);
> +					g_hash_table_add(id_set, GINT_TO_POINTER(colorop->id));
>  				}
>  			}
>  		}
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 707661378..192502c18 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -230,29 +230,25 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>   * colorops[] to it.
>   */
>  static bool map_to_pipeline(igt_display_t *display,
> -			    igt_colorop_t *colorop,
> +			    igt_colorop_t *color_pipeline,
>  			    kms_colorop_t *colorops[])
>  {
> -	igt_colorop_t *next = colorop;
> +	igt_colorop_t *colorop;
>  	kms_colorop_t *current_op;
>  	int i = 0;
> -	int prop_val = 0;
>  
>  	current_op = colorops[i];
>  	i++;
>  	igt_require(current_op);
>  
> -	while (next) {
> -		if (can_use_colorop(display, next, current_op)) {
> -			current_op->colorop = next;
> +	for_each_colorop_in_pipeline(display, color_pipeline, colorop) {
> +		if (can_use_colorop(display, colorop, current_op)) {
> +			current_op->colorop = colorop;
>  			current_op = colorops[i];
>  			i++;
>  			if (!current_op)
>  				break;
>  		}
> -		prop_val = igt_colorop_get_prop(display, next,
> -						IGT_COLOROP_NEXT);
> -		next = igt_find_colorop(display, prop_val);
>  	}
>  
>  	if (current_op) {
> @@ -272,18 +268,16 @@ igt_colorop_t *get_color_pipeline(igt_display_t *display,
>  			          igt_plane_t *plane,
>  				  kms_colorop_t *colorops[])
>  {
> -	igt_colorop_t *colorop = NULL;
> -	int i;
> +	igt_colorop_t *color_pipeline;
>  
>  	/* go through all color pipelines */
> -	for (i = 0; i < plane->num_color_pipelines; ++i) {
> -		if (map_to_pipeline(display, plane->color_pipelines[i], colorops)) {
> -			colorop = plane->color_pipelines[i];
> -			break;
> +	for_each_color_pipeline(plane, color_pipeline) {
> +		if (map_to_pipeline(display, color_pipeline, colorops)) {
> +			return color_pipeline;
>  		}
>  	}
>  
> -	return colorop;
> +	return NULL;
>  }
>  
>  static void fill_custom_1dlut(igt_display_t *display, kms_colorop_t *colorop)
> @@ -374,8 +368,7 @@ void set_color_pipeline(igt_display_t *display,
>  			kms_colorop_t *colorops[],
>  			igt_colorop_t *color_pipeline)
>  {
> -	igt_colorop_t *next;
> -	int prop_val = 0;
> +	igt_colorop_t *colorop;
>  	int i;
>  
>  	igt_plane_set_color_pipeline(plane, color_pipeline);
> @@ -384,17 +377,12 @@ void set_color_pipeline(igt_display_t *display,
>  		set_colorop(display, colorops[i]);
>  
>  	/* set unused ops in pipeline to bypass */
> -	next = color_pipeline;
>  	i = 0;
> -	while (next) {
> -		if (!colorops[i] || colorops[i]->colorop != next)
> -			igt_colorop_set_prop_value(next, IGT_COLOROP_BYPASS, 1);
> +	for_each_colorop_in_pipeline(display, color_pipeline, colorop) {
> +		if (!colorops[i] || colorops[i]->colorop != colorop)
> +			igt_colorop_set_prop_value(colorop, IGT_COLOROP_BYPASS, 1);
>  		else
>  			i++;
> -
> -		prop_val = igt_colorop_get_prop(display, next,
> -						IGT_COLOROP_NEXT);
> -		next = igt_find_colorop(display, prop_val);
>  	}
>  }
>  
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 764c77963..1395f10ae 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -239,9 +239,7 @@ static void run_colorop_property_tests(igt_display_t *display,
>  {
>  	struct igt_fb fb, afb;
>  	igt_plane_t *plane;
> -	igt_colorop_t *colorop;
> -	int i;
> -	int colorop_id = 0;
> +	igt_colorop_t *colorop, *color_pipeline;
>  
>  	prepare_crtc(display, crtc, output,
>  		     &fb);
> @@ -268,23 +266,18 @@ static void run_colorop_property_tests(igt_display_t *display,
>  		}
>  
>  		/* iterate over all color pipelines on plane */
> -		for (i = 0; i < plane->num_color_pipelines; ++i) {
> -			/* iterate over all colorops in pipeline*/
> -			colorop = plane->color_pipelines[i];
> -			igt_plane_set_color_pipeline(plane, colorop);
> +		for_each_color_pipeline(plane, color_pipeline) {
> +			igt_plane_set_color_pipeline(plane, color_pipeline);
>  			igt_display_commit2(display, COMMIT_ATOMIC);
>  
> -			while (colorop) {
> +			/* iterate over all colorops in pipeline*/
> +			for_each_colorop_in_pipeline(display, color_pipeline, colorop) {
>  				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
>  					  igt_crtc_name(crtc), plane->index,
>  					  colorop->id,
>  					  kmstest_plane_type_name(plane->type), output->name);
>  				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
>  						atomic, display->has_plane_color_pipeline);
> -
> -				colorop_id = igt_colorop_get_prop(display, colorop,
> -								IGT_COLOROP_NEXT);
> -				colorop = igt_find_colorop(display, colorop_id);
>  			}
>  		}

-- 
Jani Nikula, Intel
