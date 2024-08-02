Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20C8C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 12:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2C410E09B;
	Fri,  2 Aug 2024 12:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idm45UPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C261110E09B
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Aug 2024 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722601431; x=1754137431;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=991p73QiAssQr6n1YiN2WysrmqK1RfjWb2/7uisgtPM=;
 b=idm45UPkSwQuESsuawlUYCxBt1y3AN1A9vPKQqDpUah6BZENwYpGbyzU
 bktX3saX+2UOZcIxyNjDQiuIxSEJqfEJu4KphMm3KRZENdkmp07l0a7+J
 NcpsI+RGd5+PP+WhtbdrzZ/qliDRhAmWMQn+KQSIuMu8FAcxQ3Wc8zOwj
 ra6rVkMWk/Gp+kGzmcPxPzpmFQb+km5nDUkSrU3EAmwKUakHL0RX/Qobs
 cp1I5/fBUFASQfJvCwNMk32+Eg6Lmbt+2hU+NZ24wNes7drRoZc5oSSqd
 1dXiLDBLYVY1lL5aTW/5dQeHg5e4+5B4DqQEeoQdfRgKHs5gvpMokkR/+ w==;
X-CSE-ConnectionGUID: yxJ97h/XSNegJ3L83qkjgg==
X-CSE-MsgGUID: ul4nu2FKRQW/u2ZHF6Tivw==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20497508"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="20497508"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:23:47 -0700
X-CSE-ConnectionGUID: dmdGLPQ2Q4aa40izTFTaeg==
X-CSE-MsgGUID: YkZdaNVcQ9CYuiiH1celWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="56146248"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 05:23:45 -0700
Date: Fri, 2 Aug 2024 14:23:42 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [i-g-t] tests/kms: Apply igt.cocci transforms
Message-ID: <20240802122342.nlyy5wupujbtpxi2@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
References: <20240802111059.2105927-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240802111059.2105927-1-bhanuprakash.modem@intel.com>
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

Hi Bhanuprakash,
On 2024-08-02 at 16:40:59 +0530, Bhanuprakash Modem wrote:
> A number of KMS tests are using checks like "igt_assert(x < y)" rather
> than using the dedicated comparison assertions that print the actual
> values on assertion failure. Run all KMS tests through Coccinelle to
> apply these conversions and also apply some other general coding style
> cleanup:
> 
>        spatch --in-place --sp-file lib/igt.cocci tests/kms_*
>        spatch --in-place --sp-file lib/igt.cocci tests/intel/kms_*
>        spatch --in-place --sp-file lib/igt.cocci tests/testdisplay*
>        spatch --in-place --sp-file lib/igt.cocci tests/fbdev.c
> 
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/kms_ccs.c         | 12 +++++-------
>  tests/kms_async_flips.c       | 22 +++++++++++-----------
>  tests/kms_atomic_transition.c |  6 +++---
>  tests/kms_cursor_legacy.c     |  2 +-
>  tests/kms_dither.c            |  2 +-
>  tests/kms_dp_aux_dev.c        |  4 ++--
>  tests/kms_hdmi_inject.c       | 12 ++++++------
>  tests/kms_lease.c             |  8 ++++----
>  tests/kms_plane.c             |  9 +++++----
>  tests/kms_plane_multiple.c    |  2 +-
>  tests/kms_prime.c             |  6 +++---
>  tests/kms_properties.c        |  6 +++---
>  tests/kms_setmode.c           |  2 +-
>  tests/kms_tiled_display.c     |  2 +-
>  tests/kms_vrr.c               |  2 +-
>  tests/kms_writeback.c         | 10 +++++-----
>  16 files changed, 53 insertions(+), 54 deletions(-)
> 
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index f262b271c..6b66a06db 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -272,7 +272,7 @@ create_fb_prepare_add(int drm_fd, int width, int height,
>  		      igt_fb_t *fb, struct drm_mode_fb_cmd2 *f)
>  {
>  	igt_create_bo_for_fb(drm_fd, width, height, format, modifier, fb);
> -	igt_assert(fb->gem_handle > 0);
> +	igt_assert_lt_u32(0, fb->gem_handle);
>  
>  	addfb_init(fb, f);
>  }
> @@ -314,7 +314,7 @@ static void check_ccs_plane(int drm_fd, igt_fb_t *fb, int plane)
>  		if (*(uint32_t *)(ccs_p + i))
>  			break;
>  
> -	igt_assert(gem_munmap(map, fb->size) == 0);
> +	igt_assert_eq(0, gem_munmap(map, fb->size));
>  
>  	igt_assert_f(i < ccs_size,
>  		     "CCS plane %d (for main plane %d) lacks compression meta-data\n",
> @@ -350,7 +350,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb_t *fb, int plane, const float
>  
>  	igt_assert_eq_u32(native_color, cc_p[4].d);
>  
> -	igt_assert(gem_munmap(map, fb->size) == 0);
> +	igt_assert_eq(0, gem_munmap(map, fb->size));
>  };
>  
>  static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const float *cc_color, bool check_cc_plane)
> @@ -453,7 +453,7 @@ static void fill_fb_random(int drm_fd, igt_fb_t *fb)
>  	for (i = 0; i < fb->size; i++)
>  		p[i] = rand();
>  
> -	igt_assert(gem_munmap(map, fb->size) == 0);
> +	igt_assert_eq(0, gem_munmap(map, fb->size));
>  
>  	/* randomize also ccs surface on Xe2 */
>  	if (AT_LEAST_GEN(intel_get_drm_devid(drm_fd), 20))
> @@ -728,7 +728,6 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  	struct drm_mode_fb_cmd2 f = {0};
>  	uint64_t modifier;
>  	cairo_t *cr;
> -	int ret;
>  	const float cc_color[4] = {colors[!!data->plane].r,
>  				   colors[!!data->plane].g,
>  				   colors[!!data->plane].b,
> @@ -793,8 +792,7 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>  		}
>  	}
>  
> -	ret = drmIoctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
> -	igt_assert_eq(ret, 0);
> +	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_ADDFB2, &f);
>  
>  	if (check_ccs_planes)
>  		check_all_ccs_planes(data->drm_fd, fb, cc_color, !(data->flags & TEST_RANDOM));
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 1c80e9514..5b70c4033 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -147,7 +147,7 @@ static void wait_flip_event(data_t *data)
>  		break;
>  	case 1:
>  		ret = drmHandleEvent(data->drm_fd, &evctx);
> -		igt_assert(ret == 0);
> +		igt_assert_eq(ret, 0);
>  		break;
>  	default:
>  		/* unexpected */
> @@ -275,7 +275,7 @@ static void test_async_flip(data_t *data)
>  					      data->bufs[frame % NUM_FBS].fb_id,
>  					      flags, data);
>  
> -			igt_assert(ret == 0);
> +			igt_assert_eq(ret, 0);
>  
>  			wait_flip_event(data);
>  
> @@ -286,7 +286,7 @@ static void test_async_flip(data_t *data)
>  						      data->bufs[frame % NUM_FBS].fb_id,
>  						      flags, data);
>  
> -				igt_assert(ret == 0);
> +				igt_assert_eq(ret, 0);
>  
>  				wait_flip_event(data);
>  			}
> @@ -298,7 +298,7 @@ static void test_async_flip(data_t *data)
>  		if (frame == 1 && data->allow_fail)
>  			igt_skip_on(ret == -EINVAL);
>  		else
> -			igt_assert(ret == 0);
> +			igt_assert_eq(ret, 0);
>  
>  		wait_flip_event(data);
>  
> @@ -335,7 +335,7 @@ static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsigned int
>  	wait_vbl.request.type = DRM_VBLANK_RELATIVE | pipe_id_flag;
>  	wait_vbl.request.sequence = 1;
>  
> -	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl) == 0);
> +	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl);
>  	*vbl_time = wait_vbl.reply.tval_sec * 1000000 + wait_vbl.reply.tval_usec;
>  	*seq = wait_vbl.reply.sequence;
>  }
> @@ -358,7 +358,7 @@ static void test_timestamp(data_t *data)
>  			      data->bufs[0].fb_id,
>  			      flags, data);
>  
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	wait_flip_event(data);
>  
> @@ -368,7 +368,7 @@ static void test_timestamp(data_t *data)
>  			      data->bufs[0].fb_id,
>  			      flags, data);
>  
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	wait_flip_event(data);
>  
> @@ -423,7 +423,7 @@ static void test_cursor(data_t *data)
>  			      data->bufs[0].fb_id,
>  			      flags, data);
>  
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	wait_flip_event(data);
>  
> @@ -459,7 +459,7 @@ static void test_invalid(data_t *data)
>  	/* first async flip is expected to allow modifier changes */
>  	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
>  			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  	wait_flip_event(data);
>  
>  	/* subsequent async flips should reject modifier changes */
> @@ -483,7 +483,7 @@ static void queue_vblank(data_t *data)
>  		.request.signal = (long)data,
>  	};
>  
> -	igt_assert(drmIoctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl) == 0);
> +	do_ioctl(data->drm_fd, DRM_IOCTL_WAIT_VBLANK, &wait_vbl);
>  }
>  
>  static void vblank_handler_crc(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -533,7 +533,7 @@ static void wait_events_crc(data_t *data)
>  			break;
>  		case 1:
>  			ret = drmHandleEvent(data->drm_fd, &evctx);
> -			igt_assert(ret == 0);
> +			igt_assert_eq(ret, 0);
>  			break;
>  		default:
>  			/* unexpected */
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 89348f435..f4f8afc66 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -522,7 +522,7 @@ static int fd_completed(int fd)
>  	int ret;
>  
>  	ret = poll(&pfd, 1, 0);
> -	igt_assert(ret >= 0);
> +	igt_assert_lte(0, ret);
>  	return ret;
>  }
>  
> @@ -633,8 +633,8 @@ run_transition_test(data_t *data, enum pipe pipe, igt_output_t *output,
>  			break;
>  		}
>  
> -		if (!ret)
> -			igt_skip("Cannot run tests without proper size sprite planes\n");
> +		igt_skip_on_f(!ret,
> +			      "Cannot run tests without proper size sprite planes\n");
>  	}
>  
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index 5b97028c7..4e2cfde17 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -970,7 +970,7 @@ static void flip_vs_cursor(igt_display_t *display, enum flip_test mode, int nloo
>  		igt_assert(shared != MAP_FAILED);
>  
>  		cpu = sched_getcpu();
> -		igt_assert(cpu >= 0);
> +		igt_assert_lte(0, cpu);
>  
>  		CPU_ZERO(&mask);
>  		CPU_SET(cpu, &mask);
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index 21b1210b4..d8255f190 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -95,7 +95,7 @@ static dither_status_t get_dither_state(data_t *data, enum pipe pipe)
>  	dither_status_t status;
>  
>  	dir = igt_debugfs_dir(data->drm_fd);
> -	igt_assert(dir >= 0);
> +	igt_assert_lte(0, dir);
>  
>  	igt_require_intel(data->drm_fd);
>  
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 3e1d8be3a..c8ada3fec 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -80,7 +80,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>  	connector = drmModeGetConnectorCurrent(drm_fd, connector_id);
>  	dir_fd = igt_connector_sysfs_open(drm_fd, connector);
>  	drmModeFreeConnector(connector);
> -	igt_assert(dir_fd >= 0);
> +	igt_assert_lte(0, dir_fd);
>  
>  	if (connector->connection != DRM_MODE_CONNECTED &&
>  	    is_mst_connector(drm_fd, connector_id)) {
> @@ -107,7 +107,7 @@ static bool test(int drm_fd, uint32_t connector_id)
>  		snprintf(path, sizeof(path), "/dev/%s", ent->d_name);
>  
>  		fd = open(path, O_RDONLY);
> -		igt_assert(fd >= 0);
> +		igt_assert_lte(0, fd);
>  
>  		ret = read(fd, buf, sizeof(buf));
>  		igt_info("%s: %s\n", path,
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index d28be38e4..79dfae40e 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -118,8 +118,8 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
>  	edid = igt_kms_get_4k_edid();
>  	kmstest_force_edid(drm_fd, connector, edid);
>  
> -	if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
> -		igt_skip("Could not force connector on\n");
> +	igt_skip_on_f(!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON),
> +		      "Could not force connector on\n");
>  
>  	cid = connector->connector_id;
>  
> @@ -152,7 +152,7 @@ hdmi_inject_4k(int drm_fd, drmModeConnector *connector)
>  			     &connector->connector_id, 1,
>  			     &connector->modes[i]);
>  
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	igt_remove_fb(drm_fd, &fb);
>  
> @@ -173,8 +173,8 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
>  	edid = igt_kms_get_hdmi_audio_edid();
>  	kmstest_force_edid(drm_fd, connector, edid);
>  
> -	if (!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON))
> -		igt_skip("Could not force connector on\n");
> +	igt_skip_on_f(!kmstest_force_connector(drm_fd, connector, FORCE_CONNECTOR_ON),
> +		      "Could not force connector on\n");
>  
>  	cid = connector->connector_id;
>  	connector = drmModeGetConnectorCurrent(drm_fd, cid);
> @@ -197,7 +197,7 @@ hdmi_inject_audio(int drm_fd, drmModeConnector *connector)
>  			     &connector->modes[0]);
>  
>  
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	/*
>  	 * Test if we have /proc/asound/HDMI/eld#0.0 and is its contents are
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 9e56d8b8b..0f3a68fed 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -547,8 +547,8 @@ static void atomic_implicit_crtc(data_t *data)
>  		if (strcmp(prop->name, "CRTC_ID") == 0)
>  			crtc_id_prop = props->props[i];
>  
> -		printf("prop name %s, prop id %u, prop id %u\n",
> -		       prop->name, props->props[i], prop->prop_id);
> +		igt_info("prop name %s, prop id %u, prop id %u\n", prop->name,
> +			 props->props[i], prop->prop_id);
>  		drmModeFreeProperty(prop);
>  		if (crtc_id_prop)
>  			break;
> @@ -564,7 +564,7 @@ static void atomic_implicit_crtc(data_t *data)
>  	igt_assert(req);
>  	ret = drmModeAtomicAddProperty(req, data->plane_id,
>  				       crtc_id_prop, data->crtc_id);
> -	igt_assert(ret >= 0);
> +	igt_assert_lte(0, ret);
>  
>  	/* sanity check */
>  	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> @@ -579,7 +579,7 @@ static void atomic_implicit_crtc(data_t *data)
>  	igt_assert(req);
>  	ret = drmModeAtomicAddProperty(req, data->connector_id,
>  				       crtc_id_prop, data->crtc_id);
> -	igt_assert(ret >= 0);
> +	igt_assert_lte(0, ret);
>  
>  	/* sanity check */
>  	ret = drmModeAtomicCommit(data->master.fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index aac8e3ef0..28df846d3 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -875,10 +875,11 @@ static bool test_format_plane_colors(data_t *data, enum pipe pipe,
>  		}
>  	}
>  
> -	if (crc_mismatch_count)
> -		igt_warn("CRC mismatches with format " IGT_FORMAT_FMT " on %s.%u with %d/%d solid colors tested (0x%X)\n",
> -			 IGT_FORMAT_ARGS(format), kmstest_pipe_name(pipe),
> -			 plane->index, crc_mismatch_count, data->num_colors, crc_mismatch_mask);
> +	igt_warn_on_f(crc_mismatch_count,
> +		      "CRC mismatches with format " IGT_FORMAT_FMT " on %s.%u with %d/%d solid colors tested (0x%X)\n",
> +		      IGT_FORMAT_ARGS(format), kmstest_pipe_name(pipe),
> +		      plane->index, crc_mismatch_count, data->num_colors,
> +		      crc_mismatch_mask);
>  
>  	return result;
>  }
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 6bffb1f68..b7922c357 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -317,7 +317,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
>  	igt_plane_t *plane;
>  	int i;
>  	int err, c = 0;
> -	int iterations = opt.iterations < 1 ? 1 : opt.iterations;
> +	int iterations = max(1, opt.iterations);
>  	bool loop_forever;
>  	char info[256];
>  
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 0b5dbf06e..e52eba8cf 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -219,7 +219,7 @@ static void import_fb(int importer_fd, struct igt_fb *fb,
>  			    DRM_FORMAT_XRGB8888,
>  			    handles, pitches, offsets,
>  			    &fb->fb_id, 0);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  }
>  
>  static void set_fb(struct igt_fb *fb,
> @@ -235,7 +235,7 @@ static void set_fb(struct igt_fb *fb,
>  	igt_plane_set_fb(primary, fb);
>  	ret = igt_display_commit(display);
>  
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  }
>  
>  static void collect_crc_for_fb(int importer_fd, struct igt_fb *fb, igt_display_t *display,
> @@ -368,7 +368,7 @@ static void kms_poll_state_restore(void)
>  {
>  	int sysfs_fd;
>  
> -	igt_assert((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
> +	igt_assert_lte(0, (sysfs_fd = open(KMS_HELPER, O_RDONLY)));
>  	__igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);
>  	close(sysfs_fd);
>  
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index c0e5be1c9..a93c93ccc 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -136,7 +136,7 @@ static void max_bpc_prop_test(int fd, uint32_t id, uint32_t type, drmModePropert
>  			igt_assert_eq(ret, 0);
>  		} else {
>  			ret = drmModeAtomicAddProperty(req, id, prop_id, i);
> -			igt_assert(ret >= 0);
> +			igt_assert_lte(0, ret);
>  
>  			ret = drmModeAtomicCommit(fd, req, DRM_MODE_ATOMIC_TEST_ONLY | DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  			igt_assert_eq(ret, 0);
> @@ -199,7 +199,7 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic)
>  			igt_assert_eq(ret, 0);
>  		} else {
>  			ret = drmModeAtomicAddProperty(req, id, prop_id, prop_value);
> -			igt_assert(ret >= 0);
> +			igt_assert_lte(0, ret);
>  
>  			ret = drmModeAtomicCommit(fd, req, DRM_MODE_ATOMIC_TEST_ONLY, NULL);
>  			igt_assert_eq(ret, 0);
> @@ -384,7 +384,7 @@ static void test_invalid_properties(int fd,
>  			igt_assert(req);
>  
>  			ret = drmModeAtomicAddProperty(req, id1, prop_id, prop_value);
> -			igt_assert(ret >= 0);
> +			igt_assert_lte(0, ret);
>  
>  			ret = drmModeAtomicCommit(fd, req, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>  			igt_assert_eq(ret, -ENOENT);
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 95c5bfadc..bc7b8fabb 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -862,7 +862,7 @@ static void iterate_combinations(int n, int k, bool allow_repetitions,
>  	int v;
>  
>  	if (!k) {
> -		igt_assert(set->count < set->capacity);
> +		igt_assert_lt(set->count, set->capacity);
>  		set->items[set->count++] = *comb;
>  		return;
>  	}
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index 2c9d63799..ce42b890b 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -564,7 +564,7 @@ static void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *
>  		DRM_MODE_PAGE_FLIP_EVENT, data);
>  	while (!got_all_page_flips(data)) {
>  		ret = poll(pfd, 1, 1000);
> -		igt_assert(ret == 1);
> +		igt_assert_eq(ret, 1);
>  		drmHandleEvent(data->drm_fd, drm_event);
>  	}
>  }
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 7e8885f16..04405c93c 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -263,7 +263,7 @@ get_vrr_range(data_t *data, igt_output_t *output)
>  	range_t range;
>  
>  	fd = igt_debugfs_connector_dir(data->drm_fd, output->name, O_RDONLY);
> -	igt_assert(fd >= 0);
> +	igt_assert_lte(0, fd);
>  
>  	res = igt_debugfs_simple_read(fd, "vrr_range", buf, sizeof(buf));
>  	igt_require(res > 0);
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index 65d4db26b..e1d31bb93 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -136,11 +136,11 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  
>  		ret = igt_create_fb(display->drm_fd, width, height,
>  				    fourcc[i], modifier, &input_fb);
> -		igt_assert(ret >= 0);
> +		igt_assert_lte(0, ret);
>  
>  		ret = igt_create_fb(display->drm_fd, width, height,
>  				    fourcc[i], modifier, &output_fb);
> -		igt_assert(ret >= 0);
> +		igt_assert_lte(0, ret);
>  
>  		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  		igt_plane_set_fb(plane, &input_fb);
> @@ -293,7 +293,7 @@ static void test_invalid_parameters(igt_output_t *output, igt_fb_t *valid_fb, ig
>  		ret = do_writeback_test(output, invalid_tests[i].fb_id,
>  					invalid_tests[i].out_fence_ptr,
>  					invalid_tests[i].ptr_valid);
> -		igt_assert(ret != 0);
> +		igt_assert_neq(ret, 0);
>  	}
>  }
>  
> @@ -308,11 +308,11 @@ static void writeback_fb_id(igt_output_t *output, igt_fb_t *valid_fb, igt_fb_t *
>  
>  	/* Zero WRITEBACK_FB_ID */
>  	ret = do_writeback_test(output, 0, NULL, false);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  
>  	/* Valid output buffer */
>  	ret = do_writeback_test(output, valid_fb->fb_id, NULL, false);
> -	igt_assert(ret == 0);
> +	igt_assert_eq(ret, 0);
>  }
>  
>  static void fill_fb(igt_fb_t *fb, uint32_t pixel)
> -- 
> 2.43.2
> 
