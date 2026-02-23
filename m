Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1BAEA4FAD
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 11:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4131210E36B;
	Mon, 23 Feb 2026 11:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7OY8H4P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1245810E36A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771847319; x=1803383319;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=hU3vRyHxc5rippTEZD1Rp4rbpLaVsWKf7VOTcNI+cIw=;
 b=G7OY8H4Poz1OlzJ/N6CwvNXkY0MEHrpX3kbyDVkXPR+l73HUbOeepsUb
 M1u8NivEd6D2NquwmNTjLCf/XYLmtsG7vdLdTeCFORrMQBcqhi1yQ7zcu
 ZoRklFwt5ZpjPGQ6zvN7ciZqwBJwYtyhooPUwwF0MhFtODrgRW2eSDPEj
 e8zOGwLpliY5t80CcS/7GqkbDFrFF7xdvnC6p9gqrosUGMmHbnVhDlC5p
 dIRO0sQ8IKxsAvYy4nHVJzm9HL/DMKe4VW9004QPrDtQ8hoe/yYUiXVBB
 VsHhqIWLUU4gu45x7C79lgICxqx3wI9joT16lYa7CnySxwBvVM4Au9Zzj w==;
X-CSE-ConnectionGUID: e+x0njxbSwC+IGTUTK4cZw==
X-CSE-MsgGUID: yzYMz/piRD2rQZ6S8yVeFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="83551242"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="83551242"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:48:39 -0800
X-CSE-ConnectionGUID: NBgx+boLQoWVPi17GgAMsg==
X-CSE-MsgGUID: WYu8WlXJSimwXWqXzHH9UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="219652492"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.249])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 03:48:37 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 08/23] tests/kms_lease: Use igt_crtc_t instead
 of enum pipe
In-Reply-To: <20260221032003.30936-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260221032003.30936-1-ville.syrjala@linux.intel.com>
 <20260221032003.30936-9-ville.syrjala@linux.intel.com>
Date: Mon, 23 Feb 2026 13:48:33 +0200
Message-ID: <a17eb7ae8eb2ffb95a94e6df8f96276f58d0eaef@intel.com>
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

On Sat, 21 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert kms_lease from 'enum pipe' to 'igt_crtc_t'.
>
> The lessor and lessee each have their own igt_display_t and
> igt_crtc_ts. Thus we have to track the igt_crtc_t in the lease_t
> structure instead of the previous approach of tracking the pipe
> in the shared data_t structure.
>
> The CRTC ID will be the same for both lessor and lessee, so
> we can use that to locate the appropriate igt_crtc_t. The
> CRTC ID is already being tracked in the data_t structure.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/kms_lease.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 39f5e69440b4..045cd62de0d7 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -126,6 +126,7 @@ typedef struct {
>  	uint32_t lessee_id;
>  	igt_display_t display;
>  	struct igt_fb primary_fb;
> +	igt_crtc_t *crtc;
>  	igt_output_t *output;
>  	drmModeModeInfo *mode;
>  } lease_t;
> @@ -133,7 +134,6 @@ typedef struct {
>  typedef struct {
>  	lease_t lease;
>  	lease_t master;
> -	enum pipe pipe;
>  	uint32_t crtc_id;
>  	uint32_t connector_id;
>  	uint32_t plane_id;
> @@ -152,8 +152,8 @@ static int prepare_crtc(data_t *data, bool is_master)
>  	drmModeModeInfo *mode;
>  	lease_t *lease =3D is_master ? &data->master : &data->lease;
>  	igt_display_t *display =3D &lease->display;
> +	igt_crtc_t *crtc =3D igt_crtc_for_crtc_id(display, data->crtc_id);
>  	igt_output_t *output =3D connector_id_to_output(display, data->connecto=
r_id);
> -	enum pipe pipe =3D igt_crtc_for_pipe(display, data->pipe)->pipe;
>  	igt_plane_t *primary;
>  	int ret;
>=20=20
> @@ -161,7 +161,7 @@ static int prepare_crtc(data_t *data, bool is_master)
>  		return -ENOENT;
>=20=20
>  	/* select the pipe we want to use */
> -	igt_output_set_crtc(output, igt_crtc_for_pipe(display, pipe));
> +	igt_output_set_crtc(output, crtc);
>=20=20
>  	/* create and set the primary plane fb */
>  	mode =3D igt_output_get_mode(output);
> @@ -179,8 +179,9 @@ static int prepare_crtc(data_t *data, bool is_master)
>  	if (ret)
>  		return ret;
>=20=20
> -	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
> +	igt_wait_for_vblank(crtc);
>=20=20
> +	lease->crtc =3D crtc;
>  	lease->output =3D output;
>  	lease->mode =3D mode;
>  	return 0;
> @@ -308,8 +309,6 @@ static int paint_fb(int drm_fd, struct igt_fb *fb, co=
nst char *test_name,
>=20=20
>  static void simple_lease(data_t *data)
>  {
> -	enum pipe pipe =3D data->pipe;
> -
>  	/* Create a valid lease */
>  	igt_assert_eq(make_lease(data), 0);
>=20=20
> @@ -321,7 +320,7 @@ static void simple_lease(data_t *data)
>  	/* Paint something attractive */
>  	paint_fb(data->lease.fd, &data->lease.primary_fb, "simple-lease",
>  		 data->lease.mode->name, igt_output_name(data->lease.output),
> -		 kmstest_pipe_name(pipe));
> +		 igt_crtc_name(data->lease.crtc));
>  	igt_debug_wait_for_keypress("lease");
>  	cleanup_crtc(&data->lease,
>  		     connector_id_to_output(&data->lease.display, data->connector_id));
> @@ -341,8 +340,6 @@ static void page_flip_implicit_plane(data_t *data)
>  	drmModePlaneRes *plane_resources;
>  	uint32_t wrong_plane_id =3D 0;
>  	int i;
> -	igt_display_t *display;
> -	enum pipe pipe =3D data->pipe;
>=20=20
>  	/* find a plane which isn't the primary one for us */
>  	plane_resources =3D drmModeGetPlaneResources(data->master.fd);
> @@ -374,9 +371,7 @@ static void page_flip_implicit_plane(data_t *data)
>  			      data->master.primary_fb.fb_id,
>  			      0, NULL));
>=20=20
> -	display =3D &data->master.display;
> -
> -	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
> +	igt_wait_for_vblank(data->master.crtc);
>=20=20
>  	do_or_die(drmModePageFlip(data->lease.fd, data->crtc_id,
>  			      data->master.primary_fb.fb_id,
> @@ -386,7 +381,7 @@ static void page_flip_implicit_plane(data_t *data)
>  	object_ids[mcl.object_count++] =3D wrong_plane_id;
>  	do_or_die(create_lease(data->master.fd, &mcl, &data->lease.fd));
>=20=20
> -	igt_wait_for_vblank(igt_crtc_for_pipe(display, pipe));
> +	igt_wait_for_vblank(data->master.crtc);
>=20=20
>  	igt_assert_eq(drmModePageFlip(data->lease.fd, data->crtc_id,
>  				      data->master.primary_fb.fb_id,
> @@ -1290,7 +1285,6 @@ int igt_main()
>  			igt_subtest_with_dynamic_f("%s", f->name) {
>  				for_each_crtc_with_valid_output(display, crtc,
>  								output) {
> -					data.pipe =3D crtc->pipe;
>  					igt_display_reset(display);
>=20=20
>  					igt_output_set_crtc(output,

--=20
Jani Nikula, Intel
