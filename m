Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9E0CCA471
	for <igt-dev@archiver.kernel.org>; Mon,  6 Oct 2025 09:58:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8CA10E356;
	Mon,  6 Oct 2025 09:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFaaygEi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA6C10E356
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Oct 2025 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759744712; x=1791280712;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=XbdKWiom7DVq5DYmNaPN8sELG/1NwqbJ3Z8CYVhODlI=;
 b=oFaaygEiKAcMd3ScQrjPjKCjxYDGuktiKkI/VP+NGNBT4VZOALwxiYc0
 lHeLcy8relZaBCewXFChQVbO3eVNSZ+BVoBBHcy1hc/OdI740wcd+ChTi
 CLQn2KuyythP87KlIynBTnzrK9D51FFE7IpRmXx6mxyBo2GwMfJMx47bF
 lzVO0SqYrT6/mOFxslSp2lK2zUaeJEDn+ynK5pNwCPw/itP6t/t4Sk5Fn
 9kUWJh1PGNrz/ZHvA2C0AojypYSiOkuKKpNaQjfbYIgjWNrWMs0r5//bl
 UmZ9f/9wwF00TSLB1kgupD+H3itZfFHH4I/SrjmK+2ONyFQFNCbeZCl+p w==;
X-CSE-ConnectionGUID: M72wYEQVS++ubqhTl3UchQ==
X-CSE-MsgGUID: BsBc9/aPSoS5k6dSWGPP3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11573"; a="79565686"
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="79565686"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:58:31 -0700
X-CSE-ConnectionGUID: uS22B3cGRMe/dERbLaiW8w==
X-CSE-MsgGUID: HKES3fEGTVCX4ohxKMn2qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="180266626"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2025 02:58:29 -0700
Date: Mon, 6 Oct 2025 11:58:09 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Marius Vlad <marius.vlad@collabora.com>
Cc: igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com,
 adrinael@adrinael.net, juhapekka.heikkila@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com, Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t] kms_max_link_bpc: Add 'link bpc' DRM connector
 property
Message-ID: <20251006095809.7ik5tgd74qi32nuj@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Marius Vlad <marius.vlad@collabora.com>,
 igt-dev@lists.freedesktop.org, ashutosh.dixit@intel.com,
 adrinael@adrinael.net, juhapekka.heikkila@gmail.com,
 dmitry.baryshkov@oss.qualcomm.com,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20251006080705.2869-1-marius.vlad@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251006080705.2869-1-marius.vlad@collabora.com>
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

Hi Marius,
On 2025-10-06 at 11:07:01 +0300, Marius Vlad wrote:
> We can make use of 'link bpc' -- assuming that's available, to determine
> the current physical bpc used by the driver on a particular connector.
> 
> This adds support for the DRM connector property and adds a simple test
> that would set-up 'max bpc' followed by reading back the 'link bpc'.
> Test expect less or equal than 'max bpc'.
> 
> kms_vrr, kms_hdr or kms_color assume CRC support  and all make use of
> debugfs to query 'max bpc', while this test will get the actual min/max
> values from 'max bpc' without the implication of having CRC support.
> 
> A more thorough test would be to come up with a way that's known to
> lower the bpc value to an expected one but that's left for another time.
> 
> Reference: https://lore.kernel.org/dri-devel/20250801101750.1726-1-marius.vlad@collabora.com/T/#u

+cc Karthik and Swati

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>

> 
> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
> ---
>  lib/igt_kms.c            |  40 +++++++
>  lib/igt_kms.h            |   4 +
>  tests/kms_max_link_bpc.c | 225 +++++++++++++++++++++++++++++++++++++++
>  tests/meson.build        |   1 +

Please split changes into lib/igt_kms and a new test
tests/kms_max_link_bpc

Btw why not a shorter name: tests/kms_link_bpc

with one subtest basic-max-link-bpc

>  4 files changed, 270 insertions(+)
>  create mode 100644 tests/kms_max_link_bpc.c
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index df4a96a17..d00b85a96 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -732,6 +732,7 @@ const char * const igt_connector_prop_names[IGT_NUM_CONNECTOR_PROPS] = {
>  	[IGT_CONNECTOR_WRITEBACK_FB_ID] = "WRITEBACK_FB_ID",
>  	[IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR] = "WRITEBACK_OUT_FENCE_PTR",
>  	[IGT_CONNECTOR_DITHERING_MODE] = "dithering mode",
> +	[IGT_CONNECTOR_LINK_BPC] = "link bpc",
>  };
>  
>  const char * const igt_rotation_names[] = {
> @@ -6261,6 +6262,20 @@ unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name)
>  	return maximum;
>  }
>  
> +/**
> + * igt_get_output_link_bpc:
> + * @output: Target output
> + *
> + * Returns: The current 'link bpc' value from the connector property.
> + */
> +unsigned long int igt_get_output_link_bpc(igt_output_t *output)
> +{
> +	if (!igt_output_has_prop(output, IGT_CONNECTOR_LINK_BPC))
> +		return 0;
> +
> +	return igt_output_get_prop(output, IGT_CONNECTOR_LINK_BPC);
> +}
> +
>  /**
>   * igt_get_pipe_current_bpc:
>   * @drmfd: A drm file descriptor
> @@ -6346,6 +6361,31 @@ bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>  	return (current == bpc);
>  }
>  
> +/**
> + * igt_assert_output_link_bpc_equal:
> + * @output: Target output
> + * @bpc: link bpc to compare with
> + *
> + * Assert if outputs's current link bpc is not matched with the requested one.
> + */
> +void igt_assert_output_link_bpc_equal(igt_output_t *output, unsigned int bpc)
> +{
> +	igt_assert_eq(igt_get_output_link_bpc(output), bpc);
> +}
> +
> +/**
> + * igt_check_output_link_bpc_equal:
> + * @output: Target output
> + * @bpc: link bpc to compare with
> + *
> + * Returns: True if outputs's current link bpc is matched with the requested bpc,
> + * else False.
> + */
> +bool igt_check_output_link_bpc_equal(igt_output_t *output, unsigned int bpc)
> +{
> +	return (igt_get_output_link_bpc(output) == bpc);
> +}
> +
>  /**
>   * igt_max_bpc_constraint:
>   * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 6ef6871d5..04dcd39df 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -191,6 +191,7 @@ enum igt_atomic_connector_properties {
>         IGT_CONNECTOR_WRITEBACK_FB_ID,
>         IGT_CONNECTOR_WRITEBACK_OUT_FENCE_PTR,
>         IGT_CONNECTOR_DITHERING_MODE,
> +       IGT_CONNECTOR_LINK_BPC,
>         IGT_NUM_CONNECTOR_PROPS
>  };
>  
> @@ -1234,11 +1235,14 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
>  bool igt_fit_modes_in_bw(igt_display_t *display);
>  bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>  unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
> +unsigned long int igt_get_output_link_bpc(igt_output_t *output);
>  unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
>  void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
>  				char *output_name, unsigned int bpc);
>  bool igt_check_output_bpc_equal(int drmfd, enum pipe pipe,
>  				char *output_name, unsigned int bpc);
> +bool igt_check_output_link_bpc_equal(igt_output_t *output, unsigned int bpc);
> +void igt_assert_output_link_bpc_equal(igt_output_t *output, unsigned int bpc);
>  
>  int sort_drm_modes_by_clk_dsc(const void *a, const void *b);
>  int sort_drm_modes_by_clk_asc(const void *a, const void *b);
> diff --git a/tests/kms_max_link_bpc.c b/tests/kms_max_link_bpc.c
> new file mode 100644
> index 000000000..f5e2006ab
> --- /dev/null
> +++ b/tests/kms_max_link_bpc.c
> @@ -0,0 +1,225 @@

Add SPDX here.

> +/*
> + * Copyright © 2025 Collabora Ltd.,
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

And remove text from here as SPDX raplaces it.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +/**
> + * TEST: kms max link bpc
> + * Category: Display
> + * Description: Test 'link bpc' connector property. 'max bpc' gives the

Add also what BPC is (my guess: bits per color)

> + * possiblity to set-up the maximum value but there's nothing to rely on for
> + * the current physical link value, as drivers could downgrade the bpc value.
> + * 'link bpc' can be used to get the current physical bpc value
> + * Mega feature: General Display Features

Karthik or Swati: do we need more fields here?

> + */
> +
> +#include "igt.h"

Move igt headers after system ones, also with one newline
separating them.

> +#include <fcntl.h>
> +#include <termios.h>
> +#include <unistd.h>
> +

Here should go igt headers.

> +/**
> + * SUBTEST: max-link-bpc
> + * Description: Verifies that 'link bpc' is at least the set-up value of 'max
> + * bpc'
> + *
> + */
> +
> +IGT_TEST_DESCRIPTION("Test 'max bpc' and 'link bpc' connector properties");
> +
> +/* Common test data. */
> +typedef struct data {
> +	igt_display_t display;
> +	igt_plane_t *primary;
> +	igt_output_t *output;
> +	int fd;
> +} data_t;
> +
> +typedef struct range {
> +	uint64_t min;
> +	uint64_t max;
> +} range_t;
> +
> +/* rather than using debugfs to get max bpc or current max bpc
> + * use the actual range */
> +static range_t
> +get_bpc_range(igt_output_t *output, const char *prop_name)
> +{
> +	range_t range = { 0, 0 };
> +	drmModeObjectPropertiesPtr proplist;
> +	drmModePropertyPtr _prop;
> +	int drm_fd = output->display->drm_fd;
> +	int conn_id = output->config.connector->connector_id;
> +	int i;
> +
> +	if (!prop_name)
> +		return range;
> +
> +	proplist = drmModeObjectGetProperties(drm_fd, conn_id, DRM_MODE_OBJECT_CONNECTOR);
> +	if (!proplist)
> +		return range;
> +
> +	for (i = 0; i < proplist->count_props; i++) {
> +		_prop = drmModeGetProperty(drm_fd, proplist->props[i]);
> +		if (!_prop || !(_prop->flags & DRM_MODE_PROP_RANGE ||
> +				_prop->flags & DRM_MODE_PROP_SIGNED_RANGE))
> +			continue;
> +
> +		if (strcmp(_prop->name, prop_name) == 0) {
> +			igt_assert_eq(_prop->count_values, 2);
> +
> +			range.max = _prop->values[1];
> +			range.min = _prop->values[0];
> +
> +			igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> +				"Found %s property with min %lu max %lu\n",
> +				prop_name, range.min, range.max);
> +
> +			drmModeFreeProperty(_prop);
> +			break;
> +		} else {
> +			drmModeFreeProperty(_prop);
> +		}
> +	}
> +
> +	drmModeFreeObjectProperties(proplist);
> +	return range;
> +}
> +
> +static void
> +run_test_bpc(data_t *data, igt_output_t *output, range_t range)
> +{
> +	cairo_t *cr = NULL;
> +	igt_fb_t fb;
> +	int fb_id;
> +	unsigned long int link_bpc = 0;
> +
> +	fb_id = igt_create_fb(data->fd, 512, 512,
> +			      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_assert(fb_id);
> +	cr = igt_get_cairo_ctx(fb.fd, &fb);
> +
> +	igt_paint_color(cr, 0, 0, fb.width, fb.height, 1.0, 1.0, 1.0);
> +	igt_paint_test_pattern(cr, fb.width, fb.height);
> +
> +	igt_put_cairo_ctx(cr);
> +
> +	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_plane_set_fb(data->primary, &fb);
> +	igt_plane_set_size(data->primary, fb.width, fb.height);
> +	igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> +
> +	/* set to range.max */
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.max);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	link_bpc = igt_get_output_link_bpc(output);
> +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> +		"Setting max bpc to %lu, link bpc is %lu\n", range.max, link_bpc);
> +	igt_assert_lte_u64(link_bpc, range.max);
> +
> +	/* FIXME: do a potential modeline change to determine a bpc downgrade
> +	 * which should be followed by a check for
> +	 * (igt_get_output_link_bpc(output) < range.max)) */
> +
> +	/* set to range.min */
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.min);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	link_bpc = igt_get_output_link_bpc(output);
> +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> +		"Setting max bpc to %lu, link bpc is %lu\n", range.min,
> +		igt_get_output_link_bpc(output));
> +	igt_assert_lte_u64(link_bpc, range.min);
> +
> +	/* go back to range.max */
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, range.max);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	link_bpc = igt_get_output_link_bpc(output);
> +	igt_log(IGT_LOG_DOMAIN, IGT_LOG_INFO,
> +		"Setting max bpc to %lu, link bpc is %lu\n", range.max,
> +		igt_get_output_link_bpc(output));
> +	igt_assert_lte_u64(link_bpc, range.max);
> +
> +	igt_display_reset(&data->display);
> +	igt_remove_fb(data->fd, &fb);
> +}
> +
> +static void
> +test_bpc(data_t *data)
> +{
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +
> +	igt_display_reset(display);
> +
> +	for_each_connected_output(display, output) {
> +		enum pipe pipe;
> +		range_t max_bpc_range;
> +
> +		if (!igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC)) {
> +			igt_info("Output %s: Doesn't support \"max bpc\" property.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		if (!igt_output_has_prop(output, IGT_CONNECTOR_LINK_BPC)) {
> +			igt_info("Output %s: Doesn't support \"link bpc\" property.\n",
> +				 igt_output_name(output));
> +			continue;
> +		}
> +
> +		max_bpc_range = get_bpc_range(output, "max bpc");
> +		for_each_pipe(&data->display, pipe) {
> +			igt_output_set_pipe(output, pipe);
> +			if (!intel_pipe_output_combo_valid(&data->display)) {
> +				igt_output_set_pipe(output, PIPE_NONE);
> +				continue;
> +			}
> +
> +			igt_dynamic_f("output-%s-%s", kmstest_pipe_name(pipe), output->name)
> +				run_test_bpc(data, output, max_bpc_range);
> +		}
> +	}
> +}
> +
> +igt_main
> +{
> +	data_t data = { 0 };
> +
> +	igt_fixture {
> +		data.fd = drm_open_driver_master(DRIVER_ANY);
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require(&data.display, data.fd);
> +		igt_require(data.display.is_atomic);
> +		igt_display_require_output(&data.display);
> +	}
> +
> +	igt_describe("Tests 'link bpc' being the at least 'max bpc'");
> +	igt_subtest_with_dynamic("max-link-bpc")
> +		test_bpc(&data);
> +
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		drm_close_driver(data.fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index a7b9375ed..e948c5c3c 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -32,6 +32,7 @@ test_progs = [
>  	'kms_cursor_legacy',
>  	'kms_debugfs',
>  	'kms_dither',
> +	'kms_max_link_bpc',

Move it to proper place to keep list in alphabeticall order.

Regards,
Kamil

>  	'kms_display_modes',
>  	'kms_dp_aux_dev',
>  	'kms_feature_discovery',
> -- 
> 2.47.2
> 
