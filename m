Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8E8FD375F
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 13:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95CD810E17F;
	Wed, 25 Feb 2026 13:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnoQ1zz2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62C410E17F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772027906; x=1803563906;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=ck/kG4pI5eT4WkElBZDldegc24NLuidHOumWM80VKF4=;
 b=QnoQ1zz2zaBiKgetBrcRRsAyC3CA5/XWiqBnPzVOuTWzwhu7md6xZmzE
 gacC/mRYdvJckZTxT6TRG/6bWi/LnyeQkQTM0armQMq/DtpXNMIJd5oIp
 lVjuROz0dgu8nZurvE+nA9O3GzEFfNRNxGch3IDdtcH9p3dBFd3xX9Bwa
 9kAzF5rhNHXaw4aDnWg3hvnj/PJRdd6GHow8PhFY9NglXBWLvWfh2Kxp+
 upYAZbUmgcZxQWVU2RtXS6vHF9Jy9w+0fuA7RmHMdFv9OqTZJCJqBRATn
 hjFedsbywt9HScOon90BYn26lOv0a5JMvWICbcgXu+WyndrPve4v0Xsui A==;
X-CSE-ConnectionGUID: 87asgkprQ+W7Ik0SbJnBdg==
X-CSE-MsgGUID: b0y3LpbuQNGlAdojzPEkTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76670427"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="76670427"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:58:26 -0800
X-CSE-ConnectionGUID: YpgJaSNaSvOQWwctfvY+QA==
X-CSE-MsgGUID: s1kbSJ2tSm+XkFmSd+GH1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="239250380"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:58:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 02/19] tests/kms_async_flips: Remove redundant
 data.crtc_id
In-Reply-To: <20260225125108.31119-3-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
 <20260225125108.31119-3-ville.syrjala@linux.intel.com>
Date: Wed, 25 Feb 2026 15:58:22 +0200
Message-ID: <ac2a4c0875f8bf0586bc926aafc9aa1389ef3036@intel.com>
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

On Wed, 25 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> kms_async_flips already tacks the entire crtc as data.crtc.

*tracks

> data.crtc_id is completely redundant, and just serves to
> confuse things. Get rid of it.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/kms_async_flips.c | 29 +++++++++++------------------
>  1 file changed, 11 insertions(+), 18 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 014b7f3476be..53990917c9e4 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -124,7 +124,6 @@ IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
>=20=20
>  typedef struct {
>  	int drm_fd;
> -	uint32_t crtc_id;
>  	uint32_t refresh_rate;
>  	struct igt_fb bufs[NUM_FBS];
>  	struct igt_fb bufs_overlay[NUM_FBS];
> @@ -299,11 +298,9 @@ static void test_init(data_t *data)
>=20=20
>  	mode =3D igt_output_get_mode(data->output);
>=20=20
> -	data->crtc_id =3D data->crtc->crtc_id;
>  	data->refresh_rate =3D mode->vrefresh;
>=20=20
> -	igt_output_set_crtc(data->output,
> -		            data->crtc);
> +	igt_output_set_crtc(data->output, data->crtc);
>=20=20
>  	data->plane =3D igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_=
PRIMARY);
>  	if (data->overlay_path)
> @@ -398,7 +395,7 @@ static int perform_flip(data_t *data, int frame, int =
flags)
>  	bufs =3D data->overlay_path ? data->bufs_overlay : data->bufs;
>=20=20
>  	if (!data->atomic_path) {
> -		ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +		ret =3D drmModePageFlip(data->drm_fd, data->crtc->crtc_id,
>  				     bufs[frame % NUM_FBS].fb_id, flags, data);
>  	} else {
>  		igt_plane_set_fb(plane, &bufs[frame % NUM_FBS]);
> @@ -555,9 +552,8 @@ static void test_async_flip(data_t *data)
>=20=20
>  static void wait_for_vblank(data_t *data, unsigned long *vbl_time, unsig=
ned int *seq)
>  {
> -	int crtc_index =3D kmstest_get_crtc_index_from_id(data->drm_fd, data->c=
rtc_id);
>  	drmVBlank wait_vbl =3D {
> -		.request.type =3D DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc_inde=
x),
> +		.request.type =3D DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(data->crt=
c->crtc_index),
>  		.request.sequence =3D 1,
>  	};
>=20=20
> @@ -581,7 +577,7 @@ static void test_timestamp(data_t *data)
>  	 * So flip timestamp can be verified only from the second flip.
>  	 * The first async flip just enables the async address update.
>  	 */
> -	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc->crtc_id,
>  			      data->bufs[0].fb_id,
>  			      flags, data);
>=20=20
> @@ -591,7 +587,7 @@ static void test_timestamp(data_t *data)
>=20=20
>  	wait_for_vblank(data, &vbl_time, &seq);
>=20=20
> -	ret =3D drmModePageFlip(data->drm_fd, data->crtc_id,
> +	ret =3D drmModePageFlip(data->drm_fd, data->crtc->crtc_id,
>  			      data->bufs[0].fb_id,
>  			      flags, data);
>=20=20
> @@ -639,7 +635,7 @@ static void test_cursor(data_t *data)
>  			    DRM_FORMAT_MOD_LINEAR, 1., 1., 1., &cursor_fb);
>=20=20
>  	cur.flags =3D DRM_MODE_CURSOR_BO;
> -	cur.crtc_id =3D data->crtc_id;
> +	cur.crtc_id =3D data->crtc->crtc_id;
>  	cur.width =3D width;
>  	cur.height =3D height;
>  	cur.handle =3D cursor_fb.gem_handle;
> @@ -700,13 +696,13 @@ static void test_invalid(data_t *data)
>  	 */
>  	if (!data->atomic_path) {
>  		/* first async flip is expected to allow modifier changes */
> -		ret =3D drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id, flag=
s, data);
> +		ret =3D drmModePageFlip(data->drm_fd, data->crtc->crtc_id, fb[1].fb_id=
, flags, data);
>  		igt_assert_eq(ret, 0);
>=20=20
>  		wait_flip_event(data);
>=20=20
>  		/* subsequent async flips should reject modifier changes */
> -		ret =3D drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id, flag=
s, data);
> +		ret =3D drmModePageFlip(data->drm_fd, data->crtc->crtc_id, fb[0].fb_id=
, flags, data);
>  		igt_assert(ret =3D=3D -EINVAL);
>  	} else {
>  		igt_plane_set_fb(data->plane, &fb[1]);
> @@ -728,10 +724,9 @@ static void test_invalid(data_t *data)
>=20=20
>  static void queue_vblank(data_t *data)
>  {
> -	int crtc_index =3D kmstest_get_crtc_index_from_id(data->drm_fd, data->c=
rtc_id);
>  	drmVBlank wait_vbl =3D {
>  		.request.type =3D DRM_VBLANK_RELATIVE | DRM_VBLANK_EVENT |
> -			kmstest_get_vbl_flag(crtc_index),
> +			kmstest_get_vbl_flag(data->crtc->crtc_index),
>  		.request.sequence =3D 1,
>  		.request.signal =3D (long)data,
>  	};
> @@ -827,7 +822,6 @@ static void paint_fb(data_t *data, struct igt_fb *fb,
>=20=20
>  static void test_crc(data_t *data)
>  {
> -	igt_display_t *display =3D &data->display;
>  	unsigned int frame =3D 0;
>  	unsigned int start;
>  	int ret, width, height;
> @@ -847,12 +841,11 @@ static void test_crc(data_t *data)
>  	paint_fb(data, &data->bufs[frame], width, height, 0xff0000ff);
>  	paint_fb(data, &data->bufs[!frame], width, height, 0xff0000ff);
>=20=20
> -	ret =3D drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].f=
b_id, 0, 0,
> +	ret =3D drmModeSetCrtc(data->drm_fd, data->crtc->crtc_id, data->bufs[fr=
ame].fb_id, 0, 0,
>  			     &data->output->config.connector->connector_id, 1, mode);
>  	igt_assert_eq(ret, 0);
>=20=20
> -	data->pipe_crc =3D igt_crtc_crc_new(igt_crtc_for_pipe(display, kmstest_=
get_crtc_index_from_id(data->drm_fd, data->crtc_id)),
> -					  IGT_PIPE_CRC_SOURCE_AUTO);
> +	data->pipe_crc =3D igt_crtc_crc_new(data->crtc, IGT_PIPE_CRC_SOURCE_AUT=
O);
>=20=20
>  	igt_pipe_crc_start(data->pipe_crc);
>  	igt_pipe_crc_get_single(data->pipe_crc, &data->ref_crc);

--=20
Jani Nikula, Intel
