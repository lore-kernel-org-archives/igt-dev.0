Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8CCCF9C70
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 13:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60BB310E3FB;
	Mon, 23 Sep 2024 13:43:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QNHZCeyV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBC510E3FB
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 13:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727099008; x=1758635008;
 h=date:from:to:subject:message-id:reply-to:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=AjEdFJcEztD2VtV/Hqmwm99RpwPzu1hXKzc0RaC7JPQ=;
 b=QNHZCeyVxG8+E3q+kNNmE4f1Xkuh9zzrGF0XlTDk+awpB/ikc2V30G/O
 YtExvChiI92UXuLXSKipS4/D8dbRA8vOYwpcNLYopXih3L34RAZdycIJ6
 TsGrAwlr23SuEK6s4NiVgYzseTCPJmc3rO81KMM9o63mG0tkz0pWMBRCW
 Q9tkxF4BJczJGrC3SBOd7XJIHUZdrlathZh/G9sFnS13abJtXXl2fOGKZ
 JHpSo12shwdXzrTq0iHz0ffijZXtK+P5QOf9H0WH9RwvAO1V6654iph57
 ODnKYqfn3+kJn97sqJ3w7wUiwtvr3NiwhCH/hMajXBS4gcdfTjYR1gMDk A==;
X-CSE-ConnectionGUID: ejFvQMJRRpqD89FkWWNFdQ==
X-CSE-MsgGUID: X+7Z/26AQ1mK//sddF89xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="13676316"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="13676316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 06:43:27 -0700
X-CSE-ConnectionGUID: mNUaE2OGTxez0I15dBeUyg==
X-CSE-MsgGUID: spDowFrpRaioV5x3mDg8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; d="scan'208";a="75185688"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 06:43:26 -0700
Date: Mon, 23 Sep 2024 16:43:52 +0300
From: Imre Deak <imre.deak@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 6/7] tests/intel/kms_dp_linktrain_fallback: add
 test for validating fallback
Message-ID: <ZvFwmFdqi6GWIs2m@ideak-desk.fi.intel.com>
References: <20240922212549.1361889-1-kunal1.joshi@intel.com>
 <20240922212549.1361889-7-kunal1.joshi@intel.com>
 <ZvFdVykXZDn3PrZk@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZvFdVykXZDn3PrZk@ideak-desk.fi.intel.com>
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
Reply-To: imre.deak@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Mon, Sep 23, 2024 at 03:21:43PM +0300, Imre Deak wrote:
> On Mon, Sep 23, 2024 at 02:55:48AM +0530, Kunal Joshi wrote:
> > add test to valdiate fallback for DP connector,
> > eDP subtest will be added later.
> > 
> > How does test validates fallback?
> > - test start by doing initial modeset on default mode
> >    (if connector is DP then we enable just that connector,
> >     if its DP-MST we enable all on the same topology)
> > - force link training failures and retrain until we reach
> >   lowest param or retrain is disabled
> > - expect hotplug and link-status to turn bad
> > - expect link params reduce after fallback
> > 
> > v2: add test for mst (imre)
> >     refresh mode list (imre)
> >     monitor got hotplugs (imre)
> >     check link parameter are reduced (imre)
> > 
> > v3: call check_fn (Santosh)
> > 
> > v4: handle buggy lg monitor (Imre)
> >     remove reset in between (Imre)
> > 
> > v5: fit modes wrt to bw in non-mst case as well
> > 
> > v6: remove LT_FAILURE_SAME_CAPS (Imre)
> >     explain LT_FAILURE_REDUCED_CAPS to be 2 (Imre)
> >     combine infra for mst and non-mst case (Imre)
> >     call igt_reset_link_params before setup (Imre)
> >     Avoid duplication setting prev_(link_rate/lane_count) (Imre)
> >     use the cached property name here instead of hard-coding it (Imre)
> >     move test logic to function (Imre)
> >     remove extra w/s (Imre)
> >     remove braces in one liners (Imre)
> >     enhance igt_info message (Pranay)
> > 
> > v7: rename kms_fallback -> kms_dp_linktrain_fallback (Imre)
> >     remove unused headers (Imre)
> >     fill mst outputs based on root id (Imre)
> >     check bounds for array (Imre)
> >     use same syntax across code (Imre)
> >     add todo for joined pipe (Imre)
> >     remove redundant commit (Imre)
> > 
> > Cc: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > Suggested-by: Imre Deak <imre.deak@intel.com>
> > ---
> >  tests/intel/kms_dp_linktrain_fallback.c | 397 ++++++++++++++++++++++++
> >  tests/meson.build                       |   1 +
> >  2 files changed, 398 insertions(+)
> >  create mode 100644 tests/intel/kms_dp_linktrain_fallback.c
> > 
> > diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> > new file mode 100644
> > index 000000000..06e61851e
> > --- /dev/null
> > +++ b/tests/intel/kms_dp_linktrain_fallback.c
> > @@ -0,0 +1,397 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2024 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: kms fallback
> > + * Category: Display
> > + * Description: Test link training fallback for eDP/DP connectors
> > + * Driver requirement: i915, xe
> > + * Functionality: link training
> > + * Mega feature: General Display Features
> > + * Test category: functionality test
> > + */
> > +
> > +#include <sys/types.h>
> > +
> > +#include "igt.h"
> > +
> > +/**
> > + * SUBTEST: dp-fallback
> > + * Description: Test fallback on DP connectors
> > + */
> > +
> > +#define RETRAIN_COUNT 1
> > +/*
> > + * Two consecutives link training failures
> > + * reduces link params (link rate, lane count)
> > + */
> > +#define LT_FAILURE_REDUCED_CAPS 2
> > +#define SPURIOUS_HPD_RETRY 3
> > +
> > +static int traversed_mst_outputs[IGT_MAX_PIPES];
> > +static int traversed_mst_output_count;
> > +typedef struct {
> > +	int drm_fd;
> > +	igt_display_t display;
> > +	drmModeModeInfo *mode;
> > +	igt_output_t *output;
> > +	enum pipe pipe;
> > +	struct igt_fb fb;
> > +	struct igt_plane *primary;
> > +	int n_pipes;
> > +} data_t;
> > +
> > +typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
> > +
> > +IGT_TEST_DESCRIPTION("Test link training fallback");
> > +
> > +static void find_mst_outputs(int drm_fd, data_t *data,
> > +			     igt_output_t *output,
> > +			     igt_output_t *mst_outputs[],
> > +			     int *num_mst_outputs)
> > +{
> > +	int output_root_id, root_id;
> > +	igt_output_t *connector_output;
> > +
> > +	output_root_id = igt_get_dp_mst_connector_id(output);
> > +	/*
> > +	 * If output is MST check all other connected output which shares
> > +	 * same path and fill mst_outputs and num_mst_outputs
> > +	 */
> > +	for_each_connected_output(&data->display, connector_output) {
> > +		if (!igt_check_output_is_dp_mst(connector_output))
> > +			continue;
> > +		root_id = igt_get_dp_mst_connector_id(connector_output);
> > +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> > +			mst_outputs[(*num_mst_outputs)++] = connector_output;
> > +	}
> > +}
> > +
> > +static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
> > +			      int *output_count)
> > +{
> > +	int i;
> > +	igt_output_t *output;
> > +
> > +	/*
> > +	 * Check if this is already traversed
> > +	 */
> > +	for (i = 0; i < traversed_mst_output_count; i++)
> > +		if (i < IGT_MAX_PIPES &&
> > +		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
> > +			return false;
> > +
> > +	find_mst_outputs(data->drm_fd, data, data->output,
> > +			 mst_output, output_count);
> > +
> > +	for (i = 0; i < *output_count; i++) {
> > +		output = mst_output[i];
> > +		if (traversed_mst_output_count < IGT_MAX_PIPES) {
> 
> I suppose the function should fail if the traversed output can't be
> saved, since then later the above check for an already tested output
> wouldn't work.
> 
> > +			traversed_mst_outputs[traversed_mst_output_count++] = output->config.connector->connector_id;
> > +			igt_info("Output %s is in same topology as %s\n",
> > +				 igt_output_name(output),
> > +				 igt_output_name(data->output));
> > +		}
> > +	}
> > +	return true;
> > +}
> > +
> > +static void setup_pipe_on_outputs(data_t *data,
> > +				      igt_output_t *outputs[],
> > +				      int *output_count)
> > +{
> > +	int i = 0;
> > +
> > +	igt_require_f(data->n_pipes >= *output_count,
> > +		      "Need %d pipes to assign to %d outputs\n",
> > +		      data->n_pipes, *output_count);
> > +
> > +	for_each_pipe(&data->display, data->pipe) {
> > +		if (i >= *output_count)
> > +			break;
> > +		/*
> > +		 * TODO: add support for modes requiring joined pipes
> > +		 */
> > +		igt_info("Setting pipe %s on output %s\n",
> > +			 kmstest_pipe_name(data->pipe),
> > +			 igt_output_name(outputs[i]));
> > +		igt_output_set_pipe(outputs[i++], data->pipe);
> > +	}
> > +}
> > +
> > +static void setup_modeset_on_outputs(data_t *data,
> > +				     igt_output_t *outputs[],
> > +				     int *output_count,
> > +				     drmModeModeInfo *mode[],
> > +				     struct igt_fb fb[],
> > +				     struct igt_plane *primary[])
> > +{
> > +	int i;
> > +
> > +	for (i = 0; i < *output_count; i++) {
> > +		outputs[i]->force_reprobe = true;
> > +		igt_output_refresh(outputs[i]);
> > +		mode[i] = igt_output_get_mode(outputs[i]);
> > +		igt_info("Mode %dx%d@%d on output %s\n",
> > +			 mode[i]->hdisplay, mode[i]->vdisplay,
> > +			 mode[i]->vrefresh,
> > +			 igt_output_name(outputs[i]));
> > +		primary[i] = igt_output_get_plane_type(outputs[i],
> > +						       DRM_PLANE_TYPE_PRIMARY);
> > +		igt_create_color_fb(data->drm_fd,
> > +				    mode[i]->hdisplay,
> > +				    mode[i]->vdisplay,
> > +				    DRM_FORMAT_XRGB8888,
> > +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> > +				    &fb[i]);
> > +		igt_plane_set_fb(primary[i], &fb[i]);
> > +	}
> > +}
> > +
> > +static bool fit_modes_in_bw(data_t *data)
> > +{
> > +	bool found;
> > +	int ret;
> > +
> > +	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
> 
> This should be a TEST_ONLY commit as I commented earlier, so something
> like:
> 
> igt_display_try_commit_atomic(&data->display,
> 			      DRM_MODE_ATOMIC_TEST_ONLY |
> 			      DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> 
> The function returns 0 in case of success so the condition should be
> also flipped. The commit also requires the link state property to be
> updated to good already here, otherwise the commit assumes the mode
> hasn't changed and so won't recompute the state for the mode, thus
> ignoring the reduced link parameters (and so pass incorrectly). So
> before this commit you should update the link status calling
> igt_output_set_prop_value() for all outputs.
> 
> > +		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> > +		igt_require_f(found,
> > +			      "No valid mode combo found for MST modeset\n");
> 
> The function is also called for SST outputs.
> 
> > +		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> 
> This should be also just a TEST_ONLY commit as above.
> 
> > +		igt_require_f(ret == 0,
> > +			      "Commit failure during MST modeset\n");
> > +	}
> > +	return true;
> > +}
> > +
> > +static bool validate_modeset_for_outputs(data_t *data,
> > +					igt_output_t *outputs[],
> > +					int *output_count,
> > +					drmModeModeInfo *mode[],
> > +					struct igt_fb fb[],
> > +					struct igt_plane *primary[])
> > +{
> > +	igt_require_f(*output_count > 0, "Require at least 1 output\n");
> > +	setup_pipe_on_outputs(data, outputs, output_count);
> > +	setup_modeset_on_outputs(data, outputs,
> > +				 output_count,
> > +				 mode, fb, primary);

Another thing that came to mind: the above will create FBs of a certain
size, then git_modes_in_bw() below will possibly pick a mode with a
smaller size. Hence scaling would get enabled, which may fail - due to
some scaling specific limitation, which is not interesting in this test.
So I think the FB(s) should be created with a size matching the already
reduced resolution(s).

> > +	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
> > +	return true;
> > +}
> > +
> > +static bool setup_outputs(data_t *data, bool is_mst,
> > +		      igt_output_t *outputs[],
> > +		      int *output_count, drmModeModeInfo *mode[],
> > +		      struct igt_fb fb[], struct igt_plane *primary[])
> > +{
> > +	bool ret;
> > +
> > +	*output_count = 0;
> > +
> > +	if (is_mst) {
> > +		ret = setup_mst_outputs(data, outputs, output_count);
> > +		if (!ret) {
> > +			igt_info("Skipping MST output %s as already tested\n",
> > +				 igt_output_name(data->output));
> > +			return false;
> > +		}
> > +	} else
> > +		if ((*output_count) < IGT_MAX_PIPES)
> > +			outputs[(*output_count)++] = data->output;
> > +
> > +	ret = validate_modeset_for_outputs(data, outputs,
> > +					   output_count, mode,
> > +					   fb, primary);
> > +
> > +	if (!ret) {
> > +		igt_info("Skipping output %s as valid pipe/output combo not found\n",
> > +			 igt_output_name(data->output));
> > +		return false;
> > +	}
> > +
> > +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> > +	return true;
> > +}
> > +
> > +static int check_condition_with_timeout(int drm_fd, igt_output_t *output,
> > +					condition_check_fn check_fn,
> > +					double interval, double timeout)
> > +{
> > +	struct timespec start_time, current_time;
> > +	double elapsed_time;
> > +
> > +	clock_gettime(CLOCK_MONOTONIC, &start_time);
> > +
> > +	while (1) {
> > +		if (check_fn(drm_fd, output) == 0)
> > +			return 0;
> > +
> > +		clock_gettime(CLOCK_MONOTONIC, &current_time);
> > +		elapsed_time = (current_time.tv_sec - start_time.tv_sec) +
> > +			(current_time.tv_nsec - start_time.tv_nsec) / 1e9;
> > +
> > +		if (elapsed_time >= timeout)
> > +			return -1;
> > +
> > +		usleep((useconds_t)(interval * 1000000));
> > +	}
> > +}
> > +
> > +static void test_fallback(data_t *data, bool is_mst)
> > +{
> > +	int output_count, retries;
> > +	int max_link_rate, curr_link_rate, prev_link_rate;
> > +	int max_lane_count, curr_lane_count, prev_lane_count;
> > +	igt_output_t *outputs[IGT_MAX_PIPES];
> > +	uint32_t link_status_prop_id;
> > +	uint64_t link_status_value;
> > +	drmModeModeInfo *modes[IGT_MAX_PIPES];
> > +	drmModePropertyPtr link_status_prop;
> > +	struct igt_fb fbs[IGT_MAX_PIPES];
> > +	struct igt_plane *primarys[IGT_MAX_PIPES];
> > +	struct udev_monitor *mon;
> > +
> > +	retries = SPURIOUS_HPD_RETRY;
> > +
> > +	igt_display_reset(&data->display);
> > +	igt_reset_link_params(data->drm_fd, data->output);
> > +	if (!setup_outputs(data, is_mst, outputs,
> > +			   &output_count, modes, fbs,
> > +			   primarys))
> > +		return;
> > +
> > +	igt_info("Testing link training fallback on %s\n",
> > +		 igt_output_name(data->output));
> > +	max_link_rate = igt_get_max_link_rate(data->drm_fd, data->output);
> > +	max_lane_count = igt_get_max_lane_count(data->drm_fd, data->output);
> > +	prev_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
> > +	prev_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
> > +
> > +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
> > +						 data->output)) {
> > +		igt_info("Current link rate: %d, Current lane count: %d\n",
> > +			 prev_link_rate,
> > +			 prev_lane_count);
> > +		mon = igt_watch_uevents();
> > +		igt_force_lt_failure(data->drm_fd, data->output,
> > +				     LT_FAILURE_REDUCED_CAPS);
> > +		igt_force_link_retrain(data->drm_fd, data->output,
> > +				       RETRAIN_COUNT);
> > +
> > +		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> > +							   data->output,
> > +							   igt_get_dp_pending_retrain,
> > +							   1.0, 20.0), 0);
> > +		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> > +							   data->output,
> > +							   igt_get_dp_pending_lt_failures,
> > +							   1.0, 20.0), 0);
> > +
> > +		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
> > +						     data->output)) {
> > +			igt_reset_connectors();
> > +			return;
> > +		}
> > +
> > +		igt_assert_f(igt_hotplug_detected(mon, 20),
> > +			     "Didn't get hotplug for force link training failure\n");
> > +
> > +		kmstest_get_property(data->drm_fd,
> > +				data->output->config.connector->connector_id,
> > +				DRM_MODE_OBJECT_CONNECTOR, "link-status",
> > +				&link_status_prop_id, &link_status_value,
> > +				&link_status_prop);
> > +		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
> > +		igt_flush_uevents(mon);
> > +		igt_assert_f(validate_modeset_for_outputs(data,
> > +							  outputs,
> > +							  &output_count,
> > +							  modes,
> > +							  fbs,
> > +							  primarys),
> > +			     "modeset failed\n");
> > +
> > +		kmstest_set_connector_link_status(data->drm_fd,
> > +						  data->output->config.connector,
> > +						  DRM_MODE_LINK_STATUS_GOOD);
> 
> Setting the property for only one connector on an MST link just happens
> to work, it should be set for all connectors. That will be done already
> at this point, as discussed under fit_modes_in_bw(), so the above should
> be simply a igt_display_commit2() call.
> 
> > +
> > +		igt_assert_eq(data->output->values[IGT_CONNECTOR_LINK_STATUS], DRM_MODE_LINK_STATUS_GOOD);
> > +		curr_link_rate = igt_get_current_link_rate(data->drm_fd, data->output);
> > +		curr_lane_count = igt_get_current_lane_count(data->drm_fd, data->output);
> > +
> > +		igt_assert_f((curr_link_rate < prev_link_rate ||
> > +			     curr_lane_count < prev_lane_count) ||
> > +			     ((curr_link_rate == max_link_rate && curr_lane_count == max_lane_count) && --retries),
> > +			     "Fallback unsuccessful\n");
> > +
> > +		prev_link_rate = curr_link_rate;
> > +		prev_lane_count = curr_lane_count;
> > +	}
> > +}
> > +
> > +static bool run_test(data_t *data)
> > +{
> > +	bool ran = false;
> > +	igt_output_t *output;
> > +
> > +	for_each_connected_output(&data->display, output) {
> > +		data->output = output;
> > +
> > +		if (!igt_has_force_link_training_failure_debugfs(data->drm_fd,
> > +								 data->output)) {
> > +			igt_info("Output %s doesn't support forcing link training failure\n",
> > +				 igt_output_name(data->output));
> > +			continue;
> > +		}
> > +
> > +		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
> > +			igt_info("Skipping output %s as it's not DP\n", output->name);
> > +				continue;
> > +		}
> > +
> > +		ran = true;
> > +
> > +		/*
> > +		 * Check output is MST
> > +		 */
> > +		if (igt_check_output_is_dp_mst(data->output)) {
> > +			igt_info("Testing MST output %s\n",
> > +				 igt_output_name(data->output));
> > +			test_fallback(data, true);
> > +		} else {
> > +			igt_info("Testing DP output %s\n",
> > +				 igt_output_name(data->output));
> > +			test_fallback(data, false);
> > +		}
> > +	}
> > +	return ran;
> > +}
> > +
> > +igt_main
> > +{
> > +	data_t data = {};
> > +
> > +	igt_fixture {
> > +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL |
> > +						     DRIVER_XE);
> > +		kmstest_set_vt_graphics_mode();
> > +		igt_display_require(&data.display, data.drm_fd);
> > +		igt_display_require_output(&data.display);
> > +		for_each_pipe(&data.display, data.pipe)
> > +			data.n_pipes++;
> > +	}
> > +
> > +	igt_subtest("dp-fallback") {
> > +		igt_require_f(run_test(&data),
> > +			      "Skipping test as no output found or none supports fallback\n");
> > +	}
> > +
> > +	igt_fixture {
> > +		igt_remove_fb(data.drm_fd, &data.fb);
> > +		igt_display_fini(&data.display);
> > +		close(data.drm_fd);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index 00556c9d6..4adaf34f2 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -247,6 +247,7 @@ intel_kms_progs = [
> >  	'kms_ccs',
> >  	'kms_cdclk',
> >  	'kms_dirtyfb',
> > +        'kms_dp_linktrain_fallback',
> >  	'kms_draw_crc',
> >  	'kms_dsc',
> >  	'kms_fb_coherency',
> > -- 
> > 2.43.0
> > 
