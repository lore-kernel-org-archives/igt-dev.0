Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F89D3C918
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26B610E6E2;
	Wed, 10 Dec 2025 14:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S0E56myH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545CA10E6E2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376980; x=1796912980;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=domi/Ai4CMXI0FvWKJG0WHxrpbfGY6Lu6KhrlZPPdO4=;
 b=S0E56myHuzXhOwRl+iKUW9coXOh2x0Nmk1PgzMJlQzbqzlPHzth3zrsF
 SZ5GScK58voFlGmWZtYGxKWmG4AEFw01g0DgSAIxoibiMLWhJfCHB2T4b
 I5QuQBshs2sVJOSwnO3zaBHOCZkdCkpFtxZfvGKK3AA8FRbqXe1a5StJL
 QGSk4iAKEwGEfgBVv/5ayHYfEGDFjUMVQgF4ObupcRfBDOEh5WDWr0P8c
 ZnmDXILAfgCMBoeavkHMt2Qp76fo/unTRFuYoYj5Cm0H7KNLaE0EJkvho
 TDAX3z2THmvxDPR9NP9EsycLq2DIwWyB7mMsWdVJFJSpXes9WOim3t0or Q==;
X-CSE-ConnectionGUID: B7MCrE6JT9mfFYBVnXuu+Q==
X-CSE-MsgGUID: 8UqFUvQPTyWcPqmuOMRsDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67236110"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67236110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:29:39 -0800
X-CSE-ConnectionGUID: 88lQg7yfTtim8hIm8sAf4Q==
X-CSE-MsgGUID: 7QjY0yldTGG/dSb8JRipJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200697473"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:29:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/10] lib/kms: Pass the entire igt_pipe_t to
 igt_wait_for_vblank*()
In-Reply-To: <20251210093903.15934-8-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-8-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:29:34 +0200
Message-ID: <18d3b14d3c099ec209ef3b2a4f19016effa1583d@intel.com>
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

On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Raise the abstraction level a bit by passing the entire
> igt_pipe_t to igt_wait_for_vblank*().
>
> One step towards using 'crtcs' instead of 'pipes'.
>
> Done with cocci (with the docs fixed up by hand):
>  #include "scripts/iterators.cocci"
>
> @@
> expression FD, PIPE, COUNT;
> @@
> (
> - igt_wait_for_vblank_count(FD, PIPE->crtc_offset, COUNT)
> + igt_wait_for_vblank_count(PIPE, COUNT)
> |
> - igt_wait_for_vblank(FD, PIPE->crtc_offset)
> + igt_wait_for_vblank(PIPE)
> )
>
> @plane@
> igt_display_t *display;
> igt_plane_t *plane;
> @@
> - &display->pipes[plane->pipe->pipe]
> + plane->pipe
>
> @depends on plane@
> expression E;
> identifier DISPLAY;
> @@
> - igt_display_t *DISPLAY =3D E;
> ... when !=3D DISPLAY;
>
> @@
> typedef igt_pipe_t;
> identifier FD, CRTC_OFFSET, COUNT;
> @@
> igt_wait_for_vblank_count(
> - int FD, int CRTC_OFFSET
> + igt_pipe_t *crtc
>   ,int COUNT
>  )
> {
> <...
> (
> - FD
> + crtc->display->drm_fd
> |
> - CRTC_OFFSET
> + crtc->crtc_offset
> )
> ...>
> }
>
> @@
> identifier FD, CRTC_OFFSET, COUNT;
> @@
> void igt_wait_for_vblank_count(
> - int FD,
> - int CRTC_OFFSET
> + igt_pipe_t *crtc
>   ,int COUNT
>  );
>
> @@
> typedef igt_pipe_t;
> identifier FD, CRTC_OFFSET;
> @@
> igt_wait_for_vblank(
> - int FD, int CRTC_OFFSET
> + igt_pipe_t *crtc
>  )
> {
> <...
> (
> - FD
> + crtc->display->drm_fd
> |
> - CRTC_OFFSET
> + crtc->crtc_offset
> )
> ...>
> }
>
> @@
> identifier FD, CRTC_OFFSET;
> @@
> void igt_wait_for_vblank(
> - int FD,
> - int CRTC_OFFSET
> + igt_pipe_t *crtc
>  );

Sob missing!

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  lib/igt_kms.c                 | 12 ++++++------
>  lib/igt_kms.h                 |  4 ++--
>  tests/amdgpu/amd_ilr.c        |  3 +--
>  tests/intel/kms_pm_dc.c       |  4 +---
>  tests/intel/perf_pmu.c        |  3 +--
>  tests/kms_atomic_transition.c |  6 ++----
>  tests/kms_color.c             | 24 ++++++++----------------
>  tests/kms_cursor_crc.c        | 14 +++++---------
>  tests/kms_cursor_edge_walk.c  |  3 +--
>  tests/kms_lease.c             |  9 +++------
>  tests/kms_pipe_crc_basic.c    |  8 +++-----
>  tests/kms_plane.c             |  3 +--
>  tests/kms_plane_cursor.c      |  3 +--
>  tests/kms_sequence.c          |  3 +--
>  tests/kms_universal_plane.c   |  3 +--
>  tests/kms_vblank.c            |  3 +--
>  16 files changed, 38 insertions(+), 67 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 3e7543ae1d88..3b71cee61635 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5823,28 +5823,28 @@ static int __igt_vblank_wait(int drm_fd, int crtc=
_offset, int count)
>  /**
>   * igt_wait_for_vblank_count:
>   * @drm_fd: A drm file descriptor
> - * @crtc_offset: offset of the crtc in drmModeRes.crtcs
> + * @crtc: the CRTC
>   * @count: Number of vblanks to wait on
>   *
>   * Waits for a given number of vertical blank intervals
>   */
> -void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
> +void igt_wait_for_vblank_count(igt_pipe_t *crtc, int count)
>  {
> -	igt_assert(__igt_vblank_wait(drm_fd, crtc_offset, count) =3D=3D 0);
> +	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_offset, =
count) =3D=3D 0);
>  }
>=20=20
>  /**
>   * igt_wait_for_vblank:
>   * @drm_fd: A drm file descriptor
> - * @crtc_offset: offset of a crtc in drmModeRes.crtcs
> + * @crtc: the CRTC
>   *
>   * See #igt_wait_for_vblank_count for more details
>   *
>   * Waits for 1 vertical blank intervals
>   */
> -void igt_wait_for_vblank(int drm_fd, int crtc_offset)
> +void igt_wait_for_vblank(igt_pipe_t *crtc)
>  {
> -	igt_assert(__igt_vblank_wait(drm_fd, crtc_offset, 1) =3D=3D 0);
> +	igt_assert(__igt_vblank_wait(crtc->display->drm_fd, crtc->crtc_offset, =
1) =3D=3D 0);
>  }
>=20=20
>  /**
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index fd3c8448983e..a9d2d9027ae8 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -637,8 +637,8 @@ static inline bool igt_plane_has_rotation(igt_plane_t=
 *plane, igt_rotation_t rot
>  }
>  const char *igt_plane_rotation_name(igt_rotation_t rotation);
>=20=20
> -void igt_wait_for_vblank(int drm_fd, int crtc_offset);
> -void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count);
> +void igt_wait_for_vblank(igt_pipe_t *crtc);
> +void igt_wait_for_vblank_count(igt_pipe_t *crtc, int count);
>=20=20
>  /**
>   * igt_output_is_connected:
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index 680b46763af3..5875dc36d69b 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -180,8 +180,7 @@ static void test_ilr_policy(data_t *data, igt_output_=
t *output)
>  		/* Secondly check trained BW is sufficient.
>  		 * If BW is insufficient, crc retrieving will timeout
>  		 */
> -		igt_wait_for_vblank_count(data->drm_fd,
> -					data->pipe->crtc_offset, 10);
> +		igt_wait_for_vblank_count(data->pipe, 10);
>=20=20
>  		igt_pipe_crc_collect_crc(data->pipe_crc, &data->crc_dprx);
>  		crc_str =3D igt_crc_to_string(&data->crc_dprx);
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 47b2db268568..8cc260fac0e5 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -697,9 +697,7 @@ static void test_deep_pkgc_state(data_t *data)
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
>  	/* Wait for the vblank to sync the frame time */
> -	igt_wait_for_vblank_count(data->drm_fd,
> -				  igt_crtc_for_pipe(&data->display, pipe)->crtc_offset,
> -				  1);
> +	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe), 1);
>  	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
>  	/* Add a half-frame delay to ensure the flip occurs when the frame is a=
ctive. */
>  	usleep(delay * 0.5);
> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
> index ef95b50cd1ab..5d96f91a6704 100644
> --- a/tests/intel/perf_pmu.c
> +++ b/tests/intel/perf_pmu.c
> @@ -1065,8 +1065,7 @@ static void prepare_crtc(data_t *data, int fd, igt_=
output_t *output)
>=20=20
>  	igt_display_commit(display);
>=20=20
> -	igt_wait_for_vblank(fd,
> -			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
> +	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
>  }
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index ab04b9f711b7..63c7cf9f9f08 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -162,15 +162,13 @@ run_primary_test(data_t *data, enum pipe pipe, igt_=
output_t *output)
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  		if (!(i & 1))
> -			igt_wait_for_vblank(data->drm_fd,
> -					igt_crtc_for_pipe(&data->display, pipe)->crtc_offset);
> +			igt_wait_for_vblank(igt_crtc_for_pipe(&data->display, pipe));
>=20=20
>  		igt_plane_set_fb(primary, (i & 1) ? fb : NULL);
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
>=20=20
>  		if (i & 1)
> -			igt_wait_for_vblank(data->drm_fd,
> -					igt_crtc_for_pipe(&data->display, pipe)->crtc_offset);
> +			igt_wait_for_vblank(igt_crtc_for_pipe(&data->display, pipe));
>=20=20
>  		igt_plane_set_fb(primary, (i & 1) ? NULL : fb);
>  	}
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index d7c713a775b0..c68ccafd390a 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -130,8 +130,7 @@ static bool test_pipe_degamma(data_t *data,
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>=20=20
>  	/*
> @@ -142,8 +141,7 @@ static bool test_pipe_degamma(data_t *data,
>  	igt_plane_set_fb(primary, &fb);
>  	set_degamma(data, primary->pipe, degamma_full);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>=20=20
>  	/*
> @@ -219,8 +217,7 @@ static bool test_pipe_gamma(data_t *data,
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>=20=20
>  	/*
> @@ -230,8 +227,7 @@ static bool test_pipe_gamma(data_t *data,
>  	paint_gradient_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>=20=20
>  	/*
> @@ -315,8 +311,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	paint_rectangles(data, mode, red_green_blue, &fb);
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullcolors);
>=20=20
>  	/*
> @@ -332,8 +327,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, primary->pipe->crtc_id,
>  					  legacy_lut_size, red_lut, green_lut, blue_lut), 0);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_fullgamma);
>=20=20
>  	/*
> @@ -574,8 +568,7 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_plane_set_fb(primary, &fb);
>  	set_ctm(primary->pipe, ctm_identity);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_software);
>=20=20
>  	/* With CTM transformation. */
> @@ -583,8 +576,7 @@ static bool test_pipe_ctm(data_t *data,
>  	igt_plane_set_fb(primary, &fb);
>  	set_ctm(primary->pipe, ctm_matrix);
>  	igt_display_commit(&data->display);
> -	igt_wait_for_vblank(data->drm_fd,
> -			    primary->pipe->crtc_offset);
> +	igt_wait_for_vblank(primary->pipe);
>  	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_hardware);
>=20=20
>  	/*
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index fe5a63eb0a64..ff682b93a242 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -214,8 +214,7 @@ static void cursor_disable(data_t *data)
>  	igt_display_commit(&data->display);
>=20=20
>  	/* do this wait here so it will not need to be added everywhere */
> -	igt_wait_for_vblank_count(data->drm_fd,
> -				  igt_crtc_for_pipe(&data->display, data->pipe)->crtc_offset,
> +	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, data->pipe),
>  				  data->vblank_wait_count);
>  }
>=20=20
> @@ -300,8 +299,7 @@ static void do_single_test(data_t *data, int x, int y=
, bool hw_test,
>  		igt_display_commit(display);
>=20=20
>  		/* Extra vblank wait is because nonblocking cursor ioctl */
> -		igt_wait_for_vblank_count(data->drm_fd,
> -					  igt_crtc_for_pipe(display, data->pipe)->crtc_offset,
> +		igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
>  					  data->vblank_wait_count);
>=20=20
>  		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
> @@ -350,9 +348,8 @@ static void do_single_test(data_t *data, int x, int y=
, bool hw_test,
>  		 * synchronized to the same frame on AMD HW
>  		 */
>  		if (is_amdgpu_device(data->drm_fd))
> -			igt_wait_for_vblank_count(data->drm_fd,
> -				igt_crtc_for_pipe(display, data->pipe)->crtc_offset,
> -				data->vblank_wait_count);
> +			igt_wait_for_vblank_count(igt_crtc_for_pipe(display, data->pipe),
> +						  data->vblank_wait_count);
>=20=20
>  		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>  		igt_assert_crc_equal(&crc, hwcrc);
> @@ -735,8 +732,7 @@ static void timed_cursor_changes(data_t *data, void (=
changefunc)(data_t *, enum
>  	igt_display_commit(&data->display);
>=20=20
>  	/* Extra vblank wait is because nonblocking cursor ioctl */
> -	igt_wait_for_vblank_count(data->drm_fd,
> -				  igt_crtc_for_pipe(&data->display, data->pipe)->crtc_offset,
> +	igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, data->pipe),
>  				  data->vblank_wait_count);
>=20=20
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc1);
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index e84dfeb9aefb..ff8fe3402fe8 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -126,8 +126,7 @@ static void cursor_move(data_t *data, int x, int y, i=
nt i)
>  	igt_assert(drmModeMoveCursor(data->drm_fd, crtc_id, x, y) =3D=3D 0 ||
>  		   (IS_CHERRYVIEW(data->devid) && data->pipe =3D=3D PIPE_C &&
>  		    x < 0 && x > -data->curw));
> -	igt_wait_for_vblank(data->drm_fd,
> -			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
> +	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
>  }
>=20=20
>  #define XSTEP 8
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index df16fc7af78e..d2e55ffcf538 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -179,8 +179,7 @@ static int prepare_crtc(data_t *data, bool is_master)
>  	if (ret)
>  		return ret;
>=20=20
> -	igt_wait_for_vblank(lease->fd,
> -			    igt_crtc_for_pipe(display, pipe)->crtc_offset);
> +	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
>=20=20
>  	lease->output =3D output;
>  	lease->mode =3D mode;
> @@ -377,8 +376,7 @@ static void page_flip_implicit_plane(data_t *data)
>=20=20
>  	display =3D &data->master.display;
>=20=20
> -	igt_wait_for_vblank(data->master.fd,
> -			igt_crtc_for_pipe(display, pipe)->crtc_offset);
> +	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
>=20=20
>  	do_or_die(drmModePageFlip(data->lease.fd, data->crtc_id,
>  			      data->master.primary_fb.fb_id,
> @@ -388,8 +386,7 @@ static void page_flip_implicit_plane(data_t *data)
>  	object_ids[mcl.object_count++] =3D wrong_plane_id;
>  	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>=20=20
> -	igt_wait_for_vblank(data->master.fd,
> -			igt_crtc_for_pipe(display, pipe)->crtc_offset);
> +	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
>=20=20
>  	igt_assert_eq(drmModePageFlip(data->lease.fd, data->crtc_id,
>  				      data->master.primary_fb.fb_id,
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 1699b68ff3d0..0a52b651ee72 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -169,13 +169,11 @@ static void test_read_crc(data_t *data, enum pipe p=
ipe,
>=20=20
>  			pipe_crc =3D igt_pipe_crc_new_nonblock(data->drm_fd, pipe,
>  							     IGT_PIPE_CRC_SOURCE_AUTO);
> -			igt_wait_for_vblank(data->drm_fd,
> -					    igt_crtc_for_pipe(display, pipe)->crtc_offset);
> +			igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
>  			igt_pipe_crc_start(pipe_crc);
>=20=20
> -			igt_wait_for_vblank_count(data->drm_fd,
> -					igt_crtc_for_pipe(display, pipe)->crtc_offset,
> -					N_CRCS);
> +			igt_wait_for_vblank_count(igt_crtc_for_pipe(display, pipe),
> +						  N_CRCS);
>  			n_crcs =3D igt_pipe_crc_get_crcs(pipe_crc, N_CRCS+1, &crcs);
>  			igt_pipe_crc_stop(pipe_crc);
>  			igt_pipe_crc_free(pipe_crc);
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 84455e77bbb2..c8701cf1a07d 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -792,8 +792,7 @@ restart_round:
>  			if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR) {
>  				igt_display_t *display =3D &data->display;
>=20=20
> -				igt_wait_for_vblank(data->drm_fd,
> -						igt_crtc_for_pipe(display, pipe)->crtc_offset);
> +				igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
>  			}
>  		}
>=20=20
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 7817d6df9f1d..b9aa0deed292 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -188,8 +188,7 @@ static void test_cursor_pos(data_t *data, int x, int =
y, unsigned int flags)
>  	/* Wait for one more vblank since cursor updates are not
>  	 * synchronized to the same frame on AMD hw */
>  	if(is_amdgpu_device(data->drm_fd))
> -		igt_wait_for_vblank_count(data->drm_fd,
> -					  igt_crtc_for_pipe(&data->display, data->pipe_id)->crtc_offset,
> +		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, data->pipe=
_id),
>  					  1);
>=20=20
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 80a586ce62f5..1d3b98728e15 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -122,8 +122,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>=20=20
>  	igt_display_commit(display);
>=20=20
> -	igt_wait_for_vblank(fd,
> -			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
> +	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
>  }
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index a4913ec13819..4f43050791f8 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -711,8 +711,7 @@ cursor_leak_test_pipe(data_t *data, enum pipe pipe, i=
gt_output_t *output)
>  	 * framebuffer.
>  	 */
>  	if (is_xe_device(data->drm_fd))
> -		igt_wait_for_vblank_count(data->drm_fd,
> -					  igt_crtc_for_pipe(&data->display, pipe)->crtc_offset,
> +		igt_wait_for_vblank_count(igt_crtc_for_pipe(&data->display, pipe),
>  					  2);
>=20=20
>  	/* We should be back to the same framebuffer count as when we started */
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index 1803308c56e1..9057905acd67 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -143,8 +143,7 @@ static void prepare_crtc(data_t *data, int fd, igt_ou=
tput_t *output)
>=20=20
>  	igt_display_commit(display);
>=20=20
> -	igt_wait_for_vblank(fd,
> -			igt_crtc_for_pipe(display, data->pipe)->crtc_offset);
> +	igt_wait_for_vblank(igt_crtc_for_pipe(display, data->pipe));
>  }
>=20=20
>  static void cleanup_crtc(data_t *data, int fd, igt_output_t *output)

--=20
Jani Nikula, Intel
