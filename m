Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC9FD3514F
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 08:06:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F7A10EC41;
	Wed,  1 Apr 2026 08:06:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FvEKbGwv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03910EC41
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775030807; x=1806566807;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VV5KuHWt2GNvoB6ei0RfZkmz/NOlxb/+7SjYjA3PTss=;
 b=FvEKbGwvWv6lVF7uM4X2EmO6QI7JUb4c8OxDDbydCVEyUSMtSaEsUUR7
 aUGE0ti4mY728IpoKkXXR6mGRq7+ojfgLU7M45/ffSIsFkCnTrGK6iDot
 JfrQulbPuoxyF69DGltN2ogHWF4EDm1ZvEz9UZM1aKi62G2QDNEODW4a/
 1/15O/5A8FYqi08V3UlgTuwJZP63L8d+NAYfeL1x5JQB638AL+XWe292E
 PDt8boTGidBxGwH4bA6x5kKqsX0F/mJwI/ZUGaZUq/8Ek7RfRoO+47jb6
 lQVMC38r0egeY0htgLn200XgeypfZxBNT4WufN7HsjBILxDSGjzs9QSc5 A==;
X-CSE-ConnectionGUID: bkjWt/JGTAeZ7XUKGNpimQ==
X-CSE-MsgGUID: FB+ba9I4SwOgSKug4KwQkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87520938"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="87520938"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 01:06:46 -0700
X-CSE-ConnectionGUID: FTIqZfv4Sb2gigfw4Mrl4Q==
X-CSE-MsgGUID: UprccCqwRj+KyKWnHmRttg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="230663746"
Received: from mwiniars-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.106])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 01:06:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jeevan B <jeevan.b@intel.com>, igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, ankit.k.nautiyal@intel.com, Jeevan B
 <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_setmode: Convert to igt_display atomic API
In-Reply-To: <20260331174502.616141-1-jeevan.b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260331174502.616141-1-jeevan.b@intel.com>
Date: Wed, 01 Apr 2026 11:06:40 +0300
Message-ID: <1f68b44135350be22b0a3d3a9a34e8863dea9937@intel.com>
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

On Tue, 31 Mar 2026, Jeevan B <jeevan.b@intel.com> wrote:
> Replace legacy drmModeSetCrtc()-based modeset handling with the
> igt_display atomic commit API.
>
> Use igt_output/igt_crtc abstractions for connector and pipe handling,
> and perform modesets via igt_display_try_commit_atomic() with
> ALLOW_MODESET.
>
> Drop legacy resource handling and switch to igt_display_t for
> managing outputs and CRTCs. Update connector handling to use
> igt_output_t and igt_crtc_connector_valid() for compatibility checks.
>
> Simplify cleanup by using igt_display_reset() instead of manually
> unsetting CRTCs.
>
> Remove the TEST_STEALING subtest, as its behavior relies on legacy
> drmModeSetCrtc() semantics that do not map to the atomic API.
>
> Update related helpers and data structures accordingly.

You're doing way, *way* too many things at once.

I've read this through, there are so many changes that it's impossible
to do thorough review. I'm commenting on some changes anyway, because
there's a lot of things that are just plain wrong here.

>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 314 +++++++++++++++++++-------------------------
>  1 file changed, 135 insertions(+), 179 deletions(-)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 1f2849bc2..28ba50a64 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -64,10 +64,6 @@
>   * SUBTEST: invalid-clone-single-crtc
>   * Description: Tests the mode by cloning the single crtc by iterating through all
>   *              invalid crtc/connector combinations
> - *
> - * SUBTEST: invalid-clone-single-crtc-stealing
> - * Description: Tests the stealing mode by cloning the single crtc by iterating
> - *              through all invalid crtc/connector combinations
>   */
>  
>  #define MAX_CONNECTORS  10
> @@ -80,7 +76,7 @@
>  #define CRTC_RESTRICT_CNT 2
>  
>  static int drm_fd;
> -static drmModeRes *drm_resources;
> +static igt_display_t display;

More common is to pass a pointer to display around than accessing this
directly in the test.

>  static int filter_test_id;
>  static bool dry_run;
>  static bool extended = false;
> @@ -109,26 +105,23 @@ enum test_flags {
>  	TEST_CLONE			= 0x02,
>  	TEST_SINGLE_CRTC_CLONE		= 0x04,
>  	TEST_EXCLUSIVE_CRTC_CLONE	= 0x08,
> -	TEST_STEALING			= 0x10,

How's this related?

>  	TEST_TIMINGS			= 0x20,
>  };
>  
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

Well, maybe store igt_crtc_t * here instead of leaving crtc_idx.

>  	int connector_count;
>  	struct connector_config *cconfs;
>  	struct igt_fb fb_info;
> @@ -153,9 +146,10 @@ static bool drm_mode_equal(drmModeModeInfo *m1, drmModeModeInfo *m2)
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
> @@ -170,13 +164,21 @@ static bool crtc_supports_mode(struct crtc_config *crtc, drmModeModeInfo *mode)
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
> @@ -248,8 +250,8 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
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
> @@ -262,7 +264,7 @@ static void get_mode_for_crtc(struct crtc_config *crtc,
>  	 * incompatible with modes supported by external displays.
>  	 */
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		drmModeConnector *conn = crtc->cconfs[i].connector;
> +		drmModeConnector *conn = crtc->cconfs[i].output->config.connector;
>  
>  		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP) {
>  			mode = &conn->modes[0];
> @@ -302,17 +304,18 @@ static int get_encoder_idx(drmModeRes *resources, drmModeEncoder *encoder)
>  static void get_crtc_config_str(struct crtc_config *crtc, char *buf,
>  				size_t buf_size)
>  {
> +	igt_crtc_t *igt_crtc = &display.crtcs[crtc->crtc_idx];

display.crtcs is strictly off-limits to tests. See
igt_crtc_for_crtc_index(). You can't even index it with CRTC
index. However, I think it would be better to embrace this higher up in
the whole test than doing the conversion at the last minute.

Usually the variable name is just "crtc", absolutely everywhere. This
test is an outlier. It would be *much* better to rename the existing
struct crtc_config *crtc to something else than using igt_crtc. We'll
want everything to conform instead of deviate.

>  	int pos;
>  	int i;
>  
>  	pos = snprintf(buf, buf_size,
>  		       "CRTC[%d] [Pipe %s] Mode: %s@%dHz Connectors: ",
> -		       crtc->crtc_id, kmstest_pipe_name(crtc->pipe_id),
> +		       igt_crtc->crtc_id, kmstest_pipe_name(igt_crtc->pipe),
>  		       crtc->mode.name, crtc->mode.vrefresh);
>  	if (pos > buf_size)
>  		return;
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		drmModeConnector *connector = crtc->cconfs[i].connector;
> +		drmModeConnector *connector = crtc->cconfs[i].output->config.connector;
>  
>  		pos += snprintf(&buf[pos], buf_size - pos,
>  			"%s%s-%d[%d]", i ? ", " : "",
> @@ -328,14 +331,24 @@ static void setup_crtcs(const struct test_config *tconf,
>  			int connector_count, struct crtc_config *crtcs,
>  			int *crtc_count_ret, bool *config_valid_ret)
>  {
> +	igt_display_t *disp = tconf->display;
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
> +
> +	encoder_usage_count = calloc(resources->count_encoders,
> +				     sizeof(*encoder_usage_count));
> +	igt_assert(encoder_usage_count);

Why does this have to be dynamically allocated, and why is it done in
the same patch with a bunch of other changes?

>  
> -	kmstest_unset_all_crtcs(drm_fd, resources);
> +	/* Reset pending display state for a clean slate */
> +	igt_display_reset(disp);
>  
>  	i = 0;
>  	crtc_count = 0;
> @@ -349,11 +362,6 @@ static void setup_crtcs(const struct test_config *tconf,
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
> @@ -366,11 +374,18 @@ static void setup_crtcs(const struct test_config *tconf,
>  
>  		encoder_mask = 0;
>  		for (j = 0; j < crtc->connector_count; j++) {
> +			igt_output_t *output;
>  			drmModeConnector *connector;
>  			drmModeEncoder *encoder;
> +			igt_crtc_t *igt_crtc;
>  
>  			crtc->cconfs[j] = cconf[i + j];
> -			connector = cconf[i + j].connector;
> +			output = cconf[i + j].output;
> +			connector = output->config.connector;
> +			igt_crtc = &disp->crtcs[crtc->crtc_idx];

Worth repeating, do not access disp->crtcs in tests.

> +
> +			/* Check CRTC/output compatibility using IGT helper */
> +			config_valid &= igt_crtc_connector_valid(igt_crtc, output);
>  
>  			/* Intel connectors have only a single encoder */
>  			if (connector->count_encoders == 1) {
> @@ -386,9 +401,6 @@ static void setup_crtcs(const struct test_config *tconf,
>  			}
>  			igt_assert(encoder);
>  
> -			config_valid &= !!(encoder->possible_crtcs &
> -					  (1 << crtc->crtc_idx));
> -
>  			encoder_mask |= 1 << get_encoder_idx(resources,
>  							     encoder);
>  			config_valid &= !(encoder_mask &
> @@ -397,16 +409,15 @@ static void setup_crtcs(const struct test_config *tconf,
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
> @@ -423,6 +434,9 @@ static void setup_crtcs(const struct test_config *tconf,
>  				!!(tconf->flags & TEST_SINGLE_CRTC_CLONE))
>  			config_valid = false;
>  
> +	free(encoder_usage_count);
> +	drmModeFreeResources(resources);
> +
>  	*crtc_count_ret = crtc_count;
>  	*config_valid_ret = config_valid;
>  }
> @@ -431,55 +445,17 @@ static void cleanup_crtcs(struct crtc_config *crtcs, int crtc_count)
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
>  }
>  
> -static uint32_t *get_connector_ids(struct crtc_config *crtc)
> -{
> -	uint32_t *ids;
> -	int i;
> -
> -	ids = malloc(sizeof(*ids) * crtc->connector_count);
> -	igt_assert(ids);
> -	for (i = 0; i < crtc->connector_count; i++)
> -		ids[i] = crtc->cconfs[i].connector->connector_id;
> -
> -	return ids;
> -}
> -
> -static int test_stealing(int fd, struct crtc_config *crtc, uint32_t *ids)
> -{
> -	int i, ret = 0;
> -
> -	if (!crtc->connector_count)
> -		return drmModeSetCrtc(fd, crtc->crtc_id,
> -				     crtc->fb_info.fb_id, 0, 0,
> -				     ids, crtc->connector_count, &crtc->mode);
> -
> -	for (i = 0; i < crtc->connector_count; ++i) {
> -		ret = drmModeSetCrtc(fd, crtc->crtc_id,
> -				     crtc->fb_info.fb_id, 0, 0,
> -				     &ids[i], 1, &crtc->mode);
> -
> -		igt_assert_eq(ret, 0);
> -
> -		ret = drmModeSetCrtc(fd, crtc->crtc_id,
> -				     crtc->fb_info.fb_id, 0, 0,
> -				     ids, crtc->connector_count, &crtc->mode);
> -
> -		/* This should fail with -EINVAL */
> -		if (!ret)
> -			return 0;
> -	}
> -
> -	return ret;
> -}
> -

Again, should not be part of the same patch with everything else that's
going on.

>  #define frame_time(km) (1000.0 * (km)->htotal * (km)->vtotal / (km)->clock)
>  #define line_time(km) (1000.0 * (km)->htotal / (km)->clock)
>  
> @@ -495,9 +471,10 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  	double mean;
>  	double stddev;
>  	int n;
> +	int pipe_crtc_index = display.crtcs[crtc_idx].crtc_index;

Hey, no, absolutely not.

Pass igt_crtc_t* around, and you can look at crtc->crtc_index. But you
can't look at display.crtcs, and it's not "pipe_crtc_index". It's just
CRTC index. Nothing pipe about it.

>  
>  	memset(&wait, 0, sizeof(wait));
> -	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
> +	wait.request.type = kmstest_get_vbl_flag(pipe_crtc_index);

I don't know what you're trying to achieve here.

>  	wait.request.type |= DRM_VBLANK_RELATIVE | DRM_VBLANK_NEXTONMISS;
>  	do_or_die(drmWaitVBlank(drm_fd, &wait));
>  
> @@ -507,7 +484,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  	last_timestamp += wait.reply.tval_usec;
>  
>  	memset(&wait, 0, sizeof(wait));
> -	wait.request.type = kmstest_get_vbl_flag(crtc_idx);
> +	wait.request.type = kmstest_get_vbl_flag(pipe_crtc_index);
>  	wait.request.type |= DRM_VBLANK_ABSOLUTE | DRM_VBLANK_EVENT;
>  	wait.request.sequence = last_seq;
>  	for (n = 0; n < CALIBRATE_TS_STEPS; n++) {
> @@ -517,7 +494,7 @@ static bool check_timings(int crtc_idx, const drmModeModeInfo *kmode)
>  		do_or_die(drmWaitVBlank(drm_fd, &wait));
>  
>  		/* Double check that haven't already missed the vblank */
> -		check.request.type = kmstest_get_vbl_flag(crtc_idx);
> +		check.request.type = kmstest_get_vbl_flag(pipe_crtc_index);
>  		check.request.type |= DRM_VBLANK_RELATIVE;
>  		do_or_die(drmWaitVBlank(drm_fd, &check));
>  
> @@ -625,14 +602,17 @@ static void test_crtc_config(const struct test_config *tconf,
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
> @@ -648,41 +628,63 @@ retry:
>  	}
>  
>  	for (i = 0; i < crtc_count; i++) {
> -		uint32_t *ids;
> +		igt_plane_t *primary;
> +		igt_crtc_t *igt_crtc;
> +		bool invalid_clone;
> +		int j;
>  
>  		crtc = &crtcs[i];
> +		igt_crtc = &display.crtcs[crtc->crtc_idx];

No.

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
> -		ids = get_connector_ids(crtc);
> -		if (tconf->flags & TEST_STEALING)
> -			ret = test_stealing(drm_fd, crtc, ids);
> -		else
> -			ret = drmModeSetCrtc(drm_fd, crtc->crtc_id,
> -					     crtc->fb_info.fb_id, 0, 0, ids,
> -					     crtc->connector_count, &crtc->mode);
> +		/* Assign each output to this CRTC with the selected mode */
> +		for (j = 0; j < crtc->connector_count; j++) {
> +			igt_output_t *output = crtc->cconfs[j].output;
>  
> -		if (is_intel_device(drm_fd))
> -			intel_drrs_disable_crtc_index(drm_fd, crtc->crtc_idx);
> +			igt_output_set_crtc(output, igt_crtc);
> +			igt_output_override_mode(output, &crtc->mode);
> +		}
>  
> -		free(ids);
> +		primary = igt_crtc_get_plane_type(igt_crtc, DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &crtc->fb_info);
> +	}
>  
> -		if (ret < 0) {
> -			if (errno == ENOSPC) {
> -				igt_skip_on_f(retry, "No suitable mode(s) found to fit into the link BW.\n");
> +	ret = igt_display_try_commit_atomic(tconf->display,
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  
> -				retry = true;
> -				goto retry;
> -			}
> +	if (is_intel_device(drm_fd) && ret == 0) {
> +		for (i = 0; i < crtc_count; i++)
> +			intel_drrs_disable(&display.crtcs[crtcs[i].crtc_idx]);
> +	}
>  
> -			igt_assert_eq(errno, EINVAL);
> -			config_failed = true;
> +	if (ret < 0) {
> +		if (ret == -ENOSPC) {
> +			igt_skip_on_f(retry, "No suitable mode(s) found to fit into the link BW.\n");
> +
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
> @@ -707,10 +709,11 @@ static int get_test_name_str(struct crtc_config *crtc, char *buf,
>  	int pos;
>  	int i;
>  
> -	pos = snprintf(buf, buf_size, "pipe-%s-", kmstest_pipe_name(crtc->pipe_id));
> +	pos = snprintf(buf, buf_size, "pipe-%s-",
> +		       kmstest_pipe_name(display.crtcs[crtc->crtc_idx].pipe));

What? Why? What are you doing?

>  
>  	for (i = 0; i < crtc->connector_count; i++) {
> -		drmModeConnector *connector = crtc->cconfs[i].connector;
> +		drmModeConnector *connector = crtc->cconfs[i].output->config.connector;
>  
>  		pos += snprintf(&buf[pos], buf_size - pos,
>  			"%s%s-%d", i ? "-" : "",
> @@ -747,18 +750,15 @@ static void test_one_combination(const struct test_config *tconf,
>  
>  		for (i = 0; i < crtc_count; i++) {
>  			struct crtc_config *crtc = &crtcs[i];
> -			char conn_name[24], prev_conn_name[24];
> +			char conn_name[64], prev_conn_name[64];
> +			int n_valid_crtcs = get_crtc_count(tconf->display->n_crtcs, extended);

display->n_crtcs is not for tests to look at. igt_display_n_crtcs() is
the function.

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
> @@ -775,7 +775,7 @@ static void test_one_combination(const struct test_config *tconf,
>  			 */
>  			if (((igt_check_force_joiner_status(drm_fd, conn_name) ||
>  			      igt_bigjoiner_possible(drm_fd, &crtc->mode, max_dotclock)) &&
> -			     ((crtc->crtc_idx >= (tconf->resources->count_crtcs - 1)) ||
> +			     ((crtc->crtc_idx >= (n_valid_crtcs - 1)) ||
>  			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
>  			    ((i > 0) && (igt_check_force_joiner_status(drm_fd, prev_conn_name) ||
>  					 igt_bigjoiner_possible(drm_fd, &crtc[i - 1].mode, max_dotclock)) &&
> @@ -820,63 +820,33 @@ static int assign_crtc_to_connectors(const struct test_config *tconf,
>  	return 0;
>  }
>  
> -static int get_one_connector(drmModeRes *resources, int connector_id,
> -			     struct connector_config *cconf)
> +static int get_one_output(igt_display_t *disp, int output_idx,
> +			  struct connector_config *cconf)
>  {
> -	drmModeConnector *connector;
> +	igt_output_t *output = &disp->outputs[output_idx];
>  
> -	connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
> -	igt_assert(connector);
> -	cconf->connector = connector;
> -
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
> @@ -924,14 +894,6 @@ static void get_combinations(int n, int k, bool allow_repetitions,
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
> @@ -939,36 +901,33 @@ static void test_combinations(const struct test_config *tconf,
>  	struct combination_set crtc_combs;
>  	struct connector_config *cconfs;
>  	int i;
> -	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
> -
> -	if (connector_count > 2 && (tconf->flags & TEST_STEALING))
> -		return;
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
> @@ -984,7 +943,6 @@ static void test_combinations(const struct test_config *tconf,
>  			test_one_combination(tconf, cconfs, connector_count);
>  		}
>  
> -		free_connectors(cconfs, connector_count);
>  free_cconfs:
>  		free(cconfs);
>  	}
> @@ -996,7 +954,7 @@ free_cconfs:
>  static void run_test(const struct test_config *tconf)
>  {
>  	int connector_num;
> -	int crtc_count = get_crtc_count(tconf->resources->count_crtcs, extended);
> +	int crtc_count = get_crtc_count(tconf->display->n_crtcs, extended);
>  
>  	connector_num = tconf->flags & TEST_CLONE ? 2 : 1;
>  	for (; connector_num <= crtc_count; connector_num++)
> @@ -1043,8 +1001,6 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  					"invalid-clone-exclusive-crtc" },
>  		{ TEST_CLONE | TEST_EXCLUSIVE_CRTC_CLONE,
>  					"clone-exclusive-crtc" },
> -		{ TEST_INVALID | TEST_CLONE | TEST_SINGLE_CRTC_CLONE | TEST_STEALING,
> -					"invalid-clone-single-crtc-stealing" }
>  	};
>  	int i;
>  
> @@ -1056,8 +1012,8 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
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
> @@ -1068,14 +1024,14 @@ int igt_main_args("det:", NULL, help_str, opt_handler, NULL)
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
