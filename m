Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E27CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 08:26:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1C310E9FE;
	Tue, 23 Jun 2026 08:26:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxASjLy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B51A10EA01
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 08:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782203181; x=1813739181;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=+L2ljZ8VhzKdlXIZYY0l7p0H9Y0WZaFfVSSfDgElMKM=;
 b=dxASjLy6FDTYZLKEpwpnJyiUN/JgV123URqhyxZgACmvIH2oSday7aZp
 /Hyqc+OGGz1mJT1fkVP7hwPLdQc6DMY3ckQkXNKUKM8h4AwogwnayQGyF
 U+gBNFFi66yoQtQNwi+TQAWTi9xW4vIKM2Q1H/hZQ+ehdvHkKG8QZmcl8
 yYGts/wac9KQ6r9teczRV/ISNg1zP6glPGasy+Plp0rfkhQJ1Y0f5uoRK
 8sw7eDbN2/Y4v/7SyJH8NLecIgP27ksyhq8kIT2X+2p4U7dBbxSeaXjDH
 8FkkHZ3cjaFYYujZLMx3gOIh2C7MeQBpfcyNFZnfuyHEXrOVwzHwBnqIv A==;
X-CSE-ConnectionGUID: ZpaLkX5CQpm9jJnAzotgMQ==
X-CSE-MsgGUID: QLodnuykTcKjJ8wFs3QaxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="81919403"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="81919403"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:26:20 -0700
X-CSE-ConnectionGUID: fuQEZ+/HQLyi3YcF7ZBNcQ==
X-CSE-MsgGUID: /OHr77igQE+thkQ7JBnbBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; d="scan'208";a="273152909"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.35])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2026 01:26:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2 2/3] tests/kms_setmode: Convert modeset path to
 atomic API
In-Reply-To: <20260623080927.3216500-3-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260623080927.3216500-1-jeevan.b@intel.com>
 <20260623080927.3216500-3-jeevan.b@intel.com>
Date: Tue, 23 Jun 2026 11:26:17 +0300
Message-ID: <cf7268b08634a77de10ab9b77d32e2a5ae546001@intel.com>
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

On Tue, 23 Jun 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Replace legacy DRM modeset and resource handling with the IGT atomic
> display API, migrating the test to use igt_display_t, igt_output_t,
> and atomic commit helpers. This removes direct drmModeSetCrtc() usage
> in favor of igt_display_try_commit_atomic() and proper reset/commit
> flows, updates helper functions and data structures accordingly,
> and aligns the test with the modern atomic KMS model without
> introducing functional changes.

Thanks for doing this.

> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 264 ++++++++++++++++++++++----------------------
>  1 file changed, 135 insertions(+), 129 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 5236078e0..419f5b518 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -79,7 +79,7 @@
>  #define HDMI_2_0_MAX_CLOCK_KHZ 600000
>  
>  static int drm_fd;
> -static drmModeRes *drm_resources;
> +static igt_display_t display;
>  static int filter_test_id;
>  static bool dry_run;
>  static bool extended = false;
> @@ -114,19 +114,17 @@ enum test_flags {
>  struct test_config {
>  	const char *name;
>  	enum test_flags flags;
> -	drmModeRes *resources;
> +	igt_display_t *display;
>  };
>  
>  struct connector_config {
> -	drmModeConnector *connector;
> +	igt_output_t *output;
>  	int crtc_idx;
>  	drmModeModeInfo default_mode;
>  };
>  
>  struct crtc_config {
>  	int crtc_idx;
> -	int crtc_id;
> -	int pipe_id;
>  	int connector_count;
>  	struct connector_config *cconfs;
>  	struct igt_fb fb_info;
> @@ -151,9 +149,10 @@ static bool drm_mode_equal(drmModeModeInfo *m1, drmModeModeInfo *m2)
>  	return true;
>  }
>  
> -static bool connector_supports_mode(drmModeConnector *connector,
> +static bool connector_supports_mode(igt_output_t *output,
>  				    drmModeModeInfo *mode)
>  {
> +	drmModeConnector *connector = output->config.connector;
>  	int i;
>  
>  	for (i = 0; i < connector->count_modes; i++)
> @@ -179,7 +178,7 @@ static bool mode_compatible_with_connectors(struct crtc_config *crtc,
>  	int i;
>  
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		drmModeConnector *conn = crtc->cconfs[i].connector;
> +		drmModeConnector *conn = crtc->cconfs[i].output->config.connector;
>  
>  		/* Check HDMI 2.0 clock + per-connector compatibility */
>  		if (hdmi_connector_mode_exceeds_hdmi20_limit(conn, mode))
> @@ -194,13 +193,21 @@ static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
>  	int i;
>  
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		if (!connector_supports_mode(crtc->cconfs[i].connector, mode))
> +		if (!connector_supports_mode(crtc->cconfs[i].output, mode))
>  			return false;
>  	}
>  
>  	return true;
>  }
>  
> +static int get_crtc_count(int count_crtcs, bool extend)
> +{
> +	if ((count_crtcs <= CRTC_RESTRICT_CNT) || extend)
> +		return count_crtcs;
> +	else
> +		return CRTC_RESTRICT_CNT;
> +}
> +
>  static int paint_fb(struct igt_fb *fb, const char *test_name,
>  		    const char **crtc_str, int crtc_count, int current_crtc_idx)
>  {
> @@ -272,8 +279,8 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  	 * Then just fall back to find any that is supported by all
>  	 * connectors.
>  	 */
> -	for (i = 0; i < crtc->cconfs[0].connector->count_modes; i++) {
> -		mode = &crtc->cconfs[0].connector->modes[i];
> +	for (i = 0; i < crtc->cconfs[0].output->config.connector->count_modes; i++) {
> +		mode = &crtc->cconfs[0].output->config.connector->modes[i];
>  		if (crtc_supports_mode(crtc, mode)) {
>  			*mode_ret = *mode;
>  			return;
> @@ -286,7 +293,7 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  	 * incompatible with modes supported by external displays.
>  	 */
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		drmModeConnector *conn = crtc->cconfs[i].connector;
> +		drmModeConnector *conn = crtc->cconfs[i].output->config.connector;
>  
>  		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
>  			mode = &conn->modes[0];
> @@ -329,17 +336,18 @@ static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
>  static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
>  				size_t buf_size)
>  {
> +	igt_crtc_t *igt_crtc = &display.crtcs[crtc->crtc_idx];

Please use "crtc" for igt_crtc_t. That's the naming convention
everywhere. Please rename the old one first.

Please don't access display.crtcs directly. Please use
igt_crtc_for_crtc_index() instead.


>  	int pos;
>  	int i;
>  
>  	pos = snprintf(buf, buf_size,
>  		       "CRTC[%d] [Pipe %s] Mode: %s@%dHz Connectors: ",
> -		       crtc->crtc_id, kmstest_pipe_name(crtc->pipe_id),
> +		       igt_crtc->crtc_id, kmstest_pipe_name(igt_crtc->pipe),

igt_crtc_name() throughout.

>  		       crtc->mode.name, crtc->mode.vrefresh);
>  	if (pos > buf_size)
>  		return;
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		drmModeConnector *connector = crtc->cconfs[i].connector;
> +		drmModeConnector *connector = crtc->cconfs[i].output->config.connector;
>  
>  		pos += snprintf(&buf[pos], buf_size - pos,
>  			"%s%s-%d[%d]", i ? ", " : "",
> @@ -355,14 +363,24 @@ static void setup_crtcs(const struct test_config *tconf,
>  			int connector_count, struct crtc_config *crtcs,
>  			int *crtc_count_ret, bool *config_valid_ret)
>  {
> +	igt_display_t *disp = tconf->display;

igt_display_t *display is the naming convention everywhere.

>  	struct crtc_config *crtc;
>  	int crtc_count;
>  	bool config_valid;
>  	int i;
> -	drmModeRes *resources = tconf->resources;
> -	int encoder_usage_count[resources->count_encoders];
> +	drmModeRes *resources;
> +	int *encoder_usage_count;
> +
> +	/* Fetch resources locally only for encoder clone validity checks */
> +	resources = drmModeGetResources(drm_fd);
> +	igt_assert(resources);
>  
> -	kmstest_unset_all_crtcs(drm_fd, resources);
> +	encoder_usage_count = calloc(resources->count_encoders,
> +				     sizeof(*encoder_usage_count));
> +	igt_assert(encoder_usage_count);
> +
> +	/* Reset pending display state for a clean slate */
> +	igt_display_reset(disp);
>  
>  	i = 0;
>  	crtc_count = 0;
> @@ -376,11 +394,6 @@ static void setup_crtcs(const struct test_config *tconf,
>  		igt_assert_lt(crtc_count, MAX_CRTCS);
>  
>  		crtc->crtc_idx = cconf[i].crtc_idx;
> -		crtc->crtc_id = resources->crtcs[crtc->crtc_idx];
> -
> -		/* FIXME: avoid __intel_get_pipe_from_crtc_index() */
> -		crtc->pipe_id = is_intel_device(drm_fd) ?
> -			__intel_get_pipe_from_crtc_index(drm_fd, crtc->crtc_idx) : crtc->crtc_idx;
>  
>  		crtc->connector_count = 1;
>  		for (j = i + 1; j < connector_count; j++)
> @@ -393,11 +406,18 @@ static void setup_crtcs(const struct test_config *tconf,
>  
>  		encoder_mask = 0;
>  		for (j = 0; j < crtc->connector_count; j++) {
> +			igt_output_t *output;
>  			drmModeConnector *connector;
>  			drmModeEncoder *encoder;
> +			igt_crtc_t *igt_crtc;

crtc

>  
>  			crtc->cconfs[j] = cconf[i + j];
> -			connector = cconf[i + j].connector;
> +			output = cconf[i + j].output;
> +			connector = output->config.connector;
> +			igt_crtc = &disp->crtcs[crtc->crtc_idx];

Please don't access display->crtcs directly.

> +
> +			/* Check CRTC/output compatibility using IGT helper */
> +			config_valid &= igt_crtc_connector_valid(igt_crtc, output);
>  
>  			/* Intel connectors have only a single encoder */
>  			if (connector->count_encoders == 1) {
> @@ -413,9 +433,6 @@ static void setup_crtcs(const struct test_config *tconf,
>  			}
>  			igt_assert(encoder);
>  
> -			config_valid &= !!(encoder->possible_crtcs &
> -					  (1 << crtc->crtc_idx));
> -
>  			encoder_mask |= 1 << get_encoder_idx(resources,
>  							     encoder);
>  			config_valid &= !(encoder_mask &
> @@ -424,16 +441,15 @@ static void setup_crtcs(const struct test_config *tconf,
>  			drmModeFreeEncoder(encoder);
>  		}
>  		get_mode_for_crtc(crtc, &crtc->mode);
> -		create_fb_for_crtc(crtc, &crtc->fb_info);
> +		memset(&crtc->fb_info, 0, sizeof(crtc->fb_info));
>  
>  		i += crtc->connector_count;
>  		crtc_count++;
>  		crtc++;
>  	}
>  
> -	memset(encoder_usage_count, 0, sizeof(encoder_usage_count));
>  	for (i = 0; i < connector_count; i++) {
> -		drmModeConnector *connector = cconf[i].connector;
> +		drmModeConnector *connector = cconf[i].output->config.connector;
>  		drmModeEncoder *encoder;
>  		int idx = 0;
>  
> @@ -450,6 +466,9 @@ static void setup_crtcs(const struct test_config *tconf,
>  				!!(tconf->flags & TEST_SINGLE_CRTC_CLONE))
>  			config_valid = false;
>  
> +	free(encoder_usage_count);
> +	drmModeFreeResources(resources);
> +
>  	*crtc_count_ret = crtc_count;
>  	*config_valid_ret = config_valid;
>  }
> @@ -458,9 +477,12 @@ static void cleanup_crtcs(struct crtc_config *crtcs, int crtc_count)
>  {
>  	int i;
>  
> +	igt_display_reset(&display);
> +	igt_display_commit_atomic(&display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
>  	for (i = 0; i < crtc_count; i++) {
> -		igt_remove_fb(drm_fd, &crtcs[i].fb_info);
> -		drmModeSetCrtc(drm_fd, crtcs[i].crtc_id, 0, 0, 0, NULL, 0, NULL);
> +		if (crtcs[i].fb_info.fb_id)
> +			igt_remove_fb(drm_fd, &crtcs[i].fb_info);
>  
>  		free(crtcs[i].cconfs);
>  	}
> @@ -481,9 +503,10 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  	double mean;
>  	double stddev;
>  	int n;
> +	int pipe_crtc_index = display.crtcs[crtc_idx].crtc_index;

Please don't access display.crtcs directly.

pipe_crtc_index doesn't mean anything. It's either enum pipe (which
should be avoided) or int crtc_index.

>  
>  	memset(&wait, 0, sizeof(wait));
> -	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
> +	wait.request.type = kmstest_get_vbl_flag(pipe_crtc_index);

It's just crtc_index here. Please don't confuse pipe here.

>  	wait.request.type |= DRM_VBLANK_RELATIVE | DRM_VBLANK_NEXTONMISS;
>  	do_or_die(drmWaitVBlank(drm_fd, &wait));
>  
> @@ -493,7 +516,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  	last_timestamp += wait.reply.tval_usec;
>  
>  	memset(&wait, 0, sizeof(wait));
> -	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
> +	wait.request.type = kmstest_get_vbl_flag(pipe_crtc_index);

Ditto.

>  	wait.request.type |= DRM_VBLANK_ABSOLUTE | DRM_VBLANK_EVENT;
>  	wait.request.sequence = last_seq;
>  	for (n = 0; n < CALIBRATE_TS_STEPS; n++) {
> @@ -503,7 +526,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  		do_or_die(drmWaitVBlank(drm_fd, &wait));
>  
>  		/* Double check that haven't already missed the vblank */
> -		check.request.type = kmstest_get_vbl_flag(crtc_idx);
> +		check.request.type = kmstest_get_vbl_flag(pipe_crtc_index);

Ditto.

>  		check.request.type |= DRM_VBLANK_RELATIVE;
>  		do_or_die(drmWaitVBlank(drm_fd, &check));
>  
> @@ -611,14 +634,17 @@ static void test_crtc_config(const struct test_config *tconf,
>  
>  retry:
>  	if (retry) {
> -		kmstest_unset_all_crtcs(drm_fd, tconf->resources);
> +		igt_display_reset(tconf->display);
>  
>  		for (i = 0; i < crtc_count; i++) {
> -			/* Sort the modes in asending order by clock freq. */
> -			igt_sort_connector_modes(crtcs[i].cconfs->connector,
> +			if (crtcs[i].fb_info.fb_id)
> +				igt_remove_fb(drm_fd, &crtcs[i].fb_info);
> +			/* Sort modes in ascending order by clock to find a lower-BW mode */
> +			igt_sort_connector_modes(crtcs[i].cconfs->output->config.connector,
>  						 sort_drm_modes_by_clk_asc);
>  
> -			crtcs[i].mode = crtcs[i].cconfs->connector->modes[0];
> +			crtcs[i].mode = crtcs[i].cconfs->output->config.connector->modes[0];
> +
>  		}
>  	}
>  
> @@ -634,42 +660,63 @@ retry:
>  	}
>  
>  	for (i = 0; i < crtc_count; i++) {

for_each_crtc(), bail out early if you want to limit. Ditto everywhere
for looping crtcs.

> -		uint32_t *ids;
> +		igt_plane_t *primary;
> +		igt_crtc_t *igt_crtc;

crtc

> +		bool invalid_clone;
> +		int j;
>  
>  		crtc = &crtcs[i];
> +		igt_crtc = &display.crtcs[crtc->crtc_idx];

Please don't access display.crtcs directly.

> +
> +		/* Treat this as expected failure for invalid tests.*/
> +		invalid_clone = (tconf->flags & TEST_INVALID) &&
> +				 (crtc->connector_count > 1);
> +
> +		if (invalid_clone) {
> +			config_failed = true;
> +			continue;
> +		}
>  
>  		igt_info("    %s\n", crtc_strs[i]);
>  
>  		create_fb_for_crtc(crtc, &crtc->fb_info);
>  		paint_fb(&crtc->fb_info, tconf->name, crtc_strs, crtc_count, i);
>  
> -		ids = malloc(sizeof(*ids) * crtc->connector_count);
> -		igt_assert(ids);
> -		for (int j = 0; j < crtc->connector_count; j++)
> -			ids[j] = crtc->cconfs[j].connector->connector_id;
> +		/* Assign each output to this CRTC with the selected mode */
> +		for (j = 0; j < crtc->connector_count; j++) {
> +			igt_output_t *output = crtc->cconfs[j].output;
>  
> -		ret = drmModeSetCrtc(drm_fd, crtc->crtc_id,
> -				     crtc->fb_info.fb_id, 0, 0, ids,
> -				     crtc->connector_count, &crtc->mode);
> +			igt_output_set_crtc(output, igt_crtc);
> +			igt_output_override_mode(output, &crtc->mode);
> +		}
>  
> -		if (is_intel_device(drm_fd))
> -			intel_drrs_disable_crtc_index(drm_fd, crtc->crtc_idx);
> +		primary = igt_crtc_get_plane_type(igt_crtc, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &crtc->fb_info);
> +	}
>  
> -		free(ids);
> +	ret = igt_display_try_commit_atomic(tconf->display,
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  
> -		if (ret < 0) {
> -			if (errno == ENOSPC) {
> -				igt_skip_on_f(retry, "No suitable mode(s) found to fit into the link BW.\n");
> +	if (is_intel_device(drm_fd) && ret == 0) {
> +		for (i = 0; i < crtc_count; i++)
> +			intel_drrs_disable(&display.crtcs[crtcs[i].crtc_idx]);
> +	}
>  
> -				retry = true;
> -				goto retry;
> -			}
> +	if (ret < 0) {
> +		if (ret == -ENOSPC) {
> +			igt_skip_on_f(retry, "No suitable mode(s) found to fit into the link BW.\n");
>  
> -			igt_assert_eq(errno, EINVAL);
> -			config_failed = true;
> +			retry = true;
> +			goto retry;
>  		}
> +
> +		igt_assert_eq(ret, -EINVAL);
> +		config_failed = true;
>  	}
>  
> +	if (!(tconf->flags & TEST_INVALID) && config_failed)
> +		igt_skip("No compatible mode for this combination\n");
> +
>  	igt_assert(config_failed == !!(tconf->flags & TEST_INVALID));
>  
>  	if (ret == 0 && tconf->flags & TEST_TIMINGS) {
> @@ -694,10 +741,11 @@ static int get_test_name_str(struct crtc_config *crtc, char *buf,
>  	int pos;
>  	int i;
>  
> -	pos = snprintf(buf, buf_size, "pipe-%s-", kmstest_pipe_name(crtc->pipe_id));
> +	pos = snprintf(buf, buf_size, "pipe-%s-",
> +		       kmstest_pipe_name(display.crtcs[crtc->crtc_idx].pipe));

Please have igt_crtc_* handy, use igt_crtc_name() instead of
kmstest_pipe_name(), avoid pipe usage like the plague.

>  
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		drmModeConnector *connector = crtc->cconfs[i].connector;
> +		drmModeConnector *connector = crtc->cconfs[i].output->config.connector;
>  
>  		pos += snprintf(&buf[pos], buf_size - pos,
>  			"%s%s-%d", i ? "-" : "",
> @@ -734,18 +782,15 @@ static void test_one_combination(const struct test_config *tconf,
>  
>  		for (i = 0; i < crtc_count; i++) {
>  			struct crtc_config *crtc = &crtcs[i];
> -			char conn_name[24], prev_conn_name[24];
> +			char conn_name[64], prev_conn_name[64];
> +			int n_valid_crtcs = get_crtc_count(tconf->display->n_crtcs, extended);

Don't access display->n_crtcs directly. Just throughout, check if
there's an accessor function available, and use that instead. Please use
igt_display_n_crtcs().

>  
> -			snprintf(conn_name, sizeof(conn_name),
> -				 "%s-%d",
> -				 kmstest_connector_type_str(crtcs[i].cconfs->connector->connector_type),
> -				 crtcs[i].cconfs->connector->connector_type_id);
> +			snprintf(conn_name, sizeof(conn_name), "%s",
> +				 igt_output_name(crtc->cconfs->output));
>  
>  			if (i > 0)
> -				snprintf(prev_conn_name, sizeof(prev_conn_name),
> -					 "%s-%d",
> -					 kmstest_connector_type_str(crtcs[i - 1].cconfs->connector->connector_type),
> -					 crtcs[i - 1].cconfs->connector->connector_type_id);
> +				snprintf(prev_conn_name, sizeof(prev_conn_name), "%s",
> +					 igt_output_name(crtcs[i - 1].cconfs->output));
>  
>  			/*
>  			 * Handle BW limitations on intel hardware:
> @@ -762,7 +807,7 @@ static void test_one_combination(const struct test_config *tconf,
>  			 */
>  			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
>  			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
> -			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
> +			     ((crtc->crtc_idx >= (n_valid_crtcs - 1)) ||
>  			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>  			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
>  					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
> @@ -807,63 +852,33 @@ static int assign_crtc_to_connectors(const struct test_config *tconf,
>  	return 0;
>  }
>  
> -static int get_one_connector(drmModeRes *resources, int connector_id,
> -			     struct connector_config *cconf)
> +static int get_one_output(igt_display_t *disp, int output_idx,
> +			  struct connector_config *cconf)

igt_display_t *display

>  {
> -	drmModeConnector *connector;
> -
> -	connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
> -	igt_assert(connector);
> -	cconf->connector = connector;
> +	igt_output_t *output = &disp->outputs[output_idx];
>  
> -	if (connector->connection != DRM_MODE_CONNECTED) {
> -		drmModeFreeConnector(connector);
> +	if (!igt_output_is_connected(output))
>  		return -1;
> -	}
>  
> -	if (!kmstest_get_connector_default_mode(drm_fd, connector,
> -						&cconf->default_mode)) {
> -		drmModeFreeConnector(connector);
> -		return -1;
> -	}
> +	cconf->output = output;
> +	cconf->default_mode = *igt_output_get_mode(output);
>  
>  	return 0;
>  }
>  
> -static int get_connectors(drmModeRes *resources, int *connector_idxs,
> +static int get_connectors(igt_display_t *disp, int *output_idxs,
>  			  int connector_count, struct connector_config *cconfs)

igt_display_t *display

>  {
>  	int i;
>  
>  	for (i = 0; i < connector_count; i++) {
> -		int connector_idx;
> -		int connector_id;
> -
> -		connector_idx = connector_idxs[i];
> -		igt_assert_lt(connector_idx, resources->count_connectors);
> -		connector_id = resources->connectors[connector_idx];
> -
> -		if (get_one_connector(resources, connector_id, &cconfs[i]) < 0)
> -			goto err;
> +		igt_assert_lt(output_idxs[i], disp->n_outputs);
>  
> +		if (get_one_output(disp, output_idxs[i], &cconfs[i]) < 0)
> +			return -1;
>  	}
>  
>  	return 0;
> -
> -err:
> -	while (i--)
> -		drmModeFreeConnector(cconfs[i].connector);
> -
> -	return -1;
> -}
> -
> -static void free_connectors(struct connector_config *cconfs,
> -			    int connector_count)
> -{
> -	int i;
> -
> -	for (i = 0; i < connector_count; i++)
> -		drmModeFreeConnector(cconfs[i].connector);
>  }
>  
>  struct combination {
> @@ -911,14 +926,6 @@ static void get_combinations(int n, int k, bool allow_repetitions,
>  	iterate_combinations(n, k, allow_repetitions, 0, 0, &comb, set);
>  }
>  
> -static int get_crtc_count(int count_crtcs, bool extend)
> -{
> -	if ((count_crtcs <= CRTC_RESTRICT_CNT) || extend)
> -		return count_crtcs;
> -	else
> -		return CRTC_RESTRICT_CNT;
> -}
> -
>  static void test_combinations(const struct test_config *tconf,
>  			      int connector_count)
>  {
> @@ -926,33 +933,33 @@ static void test_combinations(const struct test_config *tconf,
>  	struct combination_set crtc_combs;
>  	struct connector_config *cconfs;
>  	int i;
> -	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
> +	int crtc_count = get_crtc_count(tconf->display->n_crtcs, extended);
>  
> -	igt_assert(tconf->resources);
> +	igt_assert(tconf->display);
>  
> -	connector_combs.capacity = pow(tconf->resources->count_connectors,
> +	connector_combs.capacity = pow(tconf->display->n_outputs,
>  				       crtc_count + 1);
>  	crtc_combs.capacity = pow(crtc_count,
>  				  crtc_count + 1);
>  	connector_combs.items = malloc(connector_combs.capacity * sizeof(struct combination));
>  	crtc_combs.items = malloc(crtc_combs.capacity * sizeof(struct combination));
>  
> -	get_combinations(tconf->resources->count_connectors, connector_count,
> +	get_combinations(tconf->display->n_outputs, connector_count,
>  			 false, &connector_combs);
>  	get_combinations(crtc_count, connector_count, true, &crtc_combs);
>  
>  	igt_info("Testing: %s %d connector combinations\n", tconf->name,
>  		 connector_count);
>  	for (i = 0; i < connector_combs.count; i++) {
> -		int *connector_idxs;
> +		int *output_idxs;
>  		int ret;
>  		int j;
>  
>  		cconfs = malloc(sizeof(*cconfs) * connector_count);
>  		igt_assert(cconfs);
>  
> -		connector_idxs = &connector_combs.items[i].elems[0];
> -		ret = get_connectors(tconf->resources, connector_idxs,
> +		output_idxs = &connector_combs.items[i].elems[0];
> +		ret = get_connectors(tconf->display, output_idxs,
>  				     connector_count, cconfs);
>  		if (ret < 0)
>  			goto free_cconfs;
> @@ -968,7 +975,6 @@ static void test_combinations(const struct test_config *tconf,
>  			test_one_combination(tconf, cconfs, connector_count);
>  		}
>  
> -		free_connectors(cconfs, connector_count);
>  free_cconfs:
>  		free(cconfs);
>  	}
> @@ -980,7 +986,7 @@ free_cconfs:
>  static void run_test(const struct test_config *tconf)
>  {
>  	int connector_num;
> -	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
> +	int crtc_count = get_crtc_count(tconf->display->n_crtcs, extended);
>  
>  	connector_num = tconf->flags & TEST_CLONE ? 2 : 1;
>  	for (; connector_num <= crtc_count; connector_num++)
> @@ -1038,8 +1044,8 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  		if (!dry_run)
>  			kmstest_set_vt_graphics_mode();
>  
> -		drm_resources = drmModeGetResources(drm_fd);
> -		igt_require(drm_resources);
> +		igt_display_require(&display, drm_fd);
> +		igt_require(display.is_atomic);
>  
>  		max_dotclock = igt_get_max_dotclock(drm_fd);
>  	}
> @@ -1050,14 +1056,14 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  			struct test_config tconf = {
>  				.flags		= tests[i].flags,
>  				.name		= tests[i].name,
> -				.resources	= drm_resources,
> +				.display	= &display,
>  			};
>  			run_test(&tconf);
>  		}
>  	}
>  
>  	igt_fixture() {
> -		drmModeFreeResources(drm_resources);
> +		igt_display_fini(&display);
>  		drm_close_driver(drm_fd);
>  	}
>  }

-- 
Jani Nikula, Intel
