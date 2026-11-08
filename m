Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102E9606A31C
	for <igt-dev@archiver.kernel.org>; Sun,  8 Nov 2026 13:39:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA1810E02D;
	Sun,  8 Nov 2026 13:39:04 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3071A10E02D
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Nov 2026 13:38:05 +0000 (UTC)
Received: from 85-156-80-143.elisa-laajakaista.fi ([85.156.80.143]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xQ35u-0000000566p-3EFX; Sun, 08 Nov 2026 15:38:03 +0200
Message-ID: <3d481b028468265d11887af45d26b6ef5c85c454.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Sun, 08 Nov 2026 15:38:15 +0200
In-Reply-To: <20261028145202.3128915-8-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
 <20261028145202.3128915-8-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
Subject: Re: [PATCH i-g-t 08/10] tests/kms_plane_scaling: test overlay plane
 in plane-*-max-crc
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Wed, 2026-10-28 at 16:52 +0200, Juha-Pekka Heikkila wrote:
> After primary plane, put first overlay plane alone in place of primary at
> the same scaling limit and check it produces the same crc as the unscaled
> reference. If overlay does not accept primary plane limits,
> search its own limit and report difference. Overlay is skipped if it does
> not support the format, modifier or rotation under test.
>=20
> With at least two scalers on pipe, also scale primary and overlay at
> the same time into adjacent bands and compare against both planes unscale=
d,
> so second scaler on pipe gets crc checked as well.
>=20
> Each failing step is reported by axis and plane in the final assert.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 160 ++++++++++++++++++++++++++++++--------
>  1 file changed, 129 insertions(+), 31 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 506c03393..dfd19b1f5 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -901,7 +901,8 @@ struct scale_axis {
>  	bool scale_width;
>  	struct igt_fb fb;
>  	int dst_w, dst_h, dst_scaled, limit;
> -	bool tested, failed;
> +	int align, cap;
> +	bool tested;
>  };
> =20
>  /* 90/270 rotation swaps which source axis lands on the scaled dst axis.=
 */
> @@ -1024,6 +1025,50 @@ static void set_legacy_lut(data_t *data, igt_crtc_=
t *crtc,
>  	free(lut);
>  }
> =20
> +static bool scale_has_headroom(enum scale_dir dir, int limit, int dst)
> +{
> +	if (limit < 0)
> +		return false;
> +
> +	return dir =3D=3D SCALE_DOWN ? limit > dst : limit < dst;
> +}
> +
> +static void scale_plane_set(igt_plane_t *plane, struct scale_axis *a,
> +			    igt_rotation_t rot, int len, int x, int y)
> +{
> +	int w, h;
> +
> +	scale_src_size(a, rot, len, &w, &h);
> +	igt_plane_set_fb(plane, &a->fb);
> +	igt_plane_set_rotation(plane, rot);
> +	igt_fb_set_position(&a->fb, plane, 0, 0);
> +	igt_fb_set_size(&a->fb, plane, w, h);
> +	igt_plane_set_position(plane, x, y);
> +	igt_plane_set_size(plane, a->dst_w, a->dst_h);
> +}
> +
> +static bool scale_try_commit(igt_display_t *display)
> +{
> +	return igt_display_try_commit_atomic(display,
> +					     DRM_MODE_ATOMIC_TEST_ONLY |
> +					     DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					     NULL) =3D=3D 0;
> +}
> +
> +static void scale_crc_check(const igt_crc_t *ref, const igt_crc_t *crc,
> +			    const char *axis, const char *step,
> +			    char *failures, size_t len)
> +{
> +	size_t used =3D strlen(failures);
> +
> +	if (igt_check_crc_equal(ref, crc))
> +		return;
> +
> +	igt_critical("CRC mismatch on %s %s\n", axis, step);
> +	snprintf(failures + used, len - used, "%s%s %s",
> +		 used ? ", " : "", axis, step);
> +}
> +
>  static void
>  check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt_output_t *outpu=
t,
>  			uint32_t format, uint64_t modifier, enum scale_dir dir,
> @@ -1036,10 +1081,11 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *cr=
tc, igt_output_t *output,
>  		{ .name =3D "vertical", .scale_width =3D false },
>  	};
>  	igt_pipe_crc_t *pipe_crc;
> -	igt_crc_t ref_crc, scaled_crc;
> +	igt_crc_t ref_crc, both_ref_crc, crc;
>  	drmModeModeInfo mode;
> -	igt_plane_t *plane;
> -	int halign, valign, dalign;
> +	igt_plane_t *plane, *overlay =3D NULL;
> +	int halign, valign, dalign, num_scalers;
> +	char failures[256] =3D "";
>  	char limits[128] =3D "";
>  	bool any_tested =3D false;
>  	/* Pre-ver14 scalers round planar YUV differently from 1:1. */
> @@ -1067,6 +1113,18 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crt=
c, igt_output_t *output,
>  	plane =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>  	igt_require(plane);
> =20
> +	if (igt_crtc_count_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY) > 0)
> +		overlay =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_OVERLAY);
> +	if (overlay && (!igt_plane_has_format_mod(overlay, format, modifier) ||
> +			!igt_plane_has_rotation(overlay, rot))) {
> +		igt_debug("Overlay plane skipped, no " IGT_FORMAT_FMT " "
> +			  IGT_MODIFIER_FMT " rotation %s support\n",
> +			  IGT_FORMAT_ARGS(format), IGT_MODIFIER_ARGS(modifier),
> +			  igt_plane_rotation_name(rot));
> +		overlay =3D NULL;
> +	}
> +	num_scalers =3D igt_crtc_num_scalers(crtc);
> +
>  	yuv_src_alignment(d, format, rot, &halign, &valign);
>  	/* Each dst side is also a source side at 1:1, possibly rotated. */
>  	dalign =3D max(halign, valign);
> @@ -1085,6 +1143,8 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc=
, igt_output_t *output,
>  		a->dst_scaled =3D a->scale_width ? a->dst_w : a->dst_h;
> =20
>  		cap =3D scale_src_cap(d, dir, src_width, a->dst_scaled, align);
> +		a->align =3D align;
> +		a->cap =3D cap;
> =20
>  		/* Every probed and committed source is a crop of this fb. */
>  		scale_src_size(a, rot, cap, &w, &h);
> @@ -1093,9 +1153,7 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crtc=
, igt_output_t *output,
> =20
>  		a->limit =3D find_scale_src_limit(d, plane, &a->fb, dir, a, rot,
>  						align, cap);
> -		if (a->limit < 0 ||
> -		    (dir =3D=3D SCALE_DOWN ? a->limit <=3D a->dst_scaled :
> -					 a->limit >=3D a->dst_scaled)) {
> +		if (!scale_has_headroom(dir, a->limit, a->dst_scaled)) {
>  			igt_debug("No %s %s headroom (limit src %d, dst %d)\n",
>  				  a->name, scale_dir_name(dir),
>  				  a->limit, a->dst_scaled);
> @@ -1132,36 +1190,81 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *cr=
tc, igt_output_t *output,
> =20
>  	for (int i =3D 0; i < ARRAY_SIZE(axes); i++) {
>  		struct scale_axis *a =3D &axes[i];
> -		int w, h;
> +		/* The overlay band sits right next to the primary band. */
> +		int ox =3D a->scale_width ? 0 : a->dst_w;
> +		int oy =3D a->scale_width ? a->dst_h : 0;
> +		int ovl_limit;
> =20
>  		if (!a->tested)
>  			continue;
> =20
>  		/* Reference: unscaled crop of exactly the destination size. */
> -		scale_src_size(a, rot, a->dst_scaled, &w, &h);
> -		igt_plane_set_fb(plane, &a->fb);
> -		igt_plane_set_rotation(plane, rot);
> -		igt_fb_set_position(&a->fb, plane, 0, 0);
> -		igt_fb_set_size(&a->fb, plane, w, h);
> -		igt_plane_set_position(plane, 0, 0);
> -		igt_plane_set_size(plane, a->dst_w, a->dst_h);
> +		scale_plane_set(plane, a, rot, a->dst_scaled, 0, 0);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>  		igt_pipe_crc_collect_crc(pipe_crc, &ref_crc);
> =20
> -		/* Test: limit sized crop scaled into the same rectangle. */
> -		scale_src_size(a, rot, a->limit, &w, &h);
> -		igt_fb_set_position(&a->fb, plane, 0, 0);
> -		igt_fb_set_size(&a->fb, plane, w, h);
> +		/* Primary: limit sized crop scaled into the same rectangle. */
> +		scale_plane_set(plane, a, rot, a->limit, 0, 0);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
> -		igt_pipe_crc_collect_crc(pipe_crc, &scaled_crc);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +		scale_crc_check(&ref_crc, &crc, a->name, "primary",
> +				failures, sizeof(failures));
> +
> +		if (!overlay)
> +			continue;
> +
> +		/* Overlay alone in the primary's place, at primary's limit. */
> +		igt_plane_set_fb(plane, NULL);
> +		ovl_limit =3D a->limit;
> +		scale_plane_set(overlay, a, rot, ovl_limit, 0, 0);
> +		if (!scale_try_commit(display)) {
> +			ovl_limit =3D find_scale_src_limit(d, overlay, &a->fb,
> +							 dir, a, rot,
> +							 a->align, a->cap);
> +			igt_info("Overlay %s %s limit %d, primary %d\n",
> +				 a->name, scale_dir_name(dir), ovl_limit,
> +				 a->limit);
> +			if (!scale_has_headroom(dir, ovl_limit,
> +						a->dst_scaled))
> +				continue;
> +			scale_plane_set(overlay, a, rot, ovl_limit, 0, 0);
> +		}
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +		scale_crc_check(&ref_crc, &crc, a->name, "overlay",
> +				failures, sizeof(failures));
> +
> +		if (num_scalers < 2) {
> +			igt_plane_set_fb(overlay, NULL);
> +			continue;
> +		}
> +
> +		/* Both planes scaled at once, each into its own band. */
> +		scale_plane_set(plane, a, rot, a->dst_scaled, 0, 0);
> +		scale_plane_set(overlay, a, rot, a->dst_scaled, ox, oy);
> +		igt_display_commit2(display, COMMIT_ATOMIC);
> +		igt_pipe_crc_collect_crc(pipe_crc, &both_ref_crc);
> +
> +		scale_plane_set(plane, a, rot, a->limit, 0, 0);
> +		scale_plane_set(overlay, a, rot, ovl_limit, ox, oy);
> +		if (scale_try_commit(display)) {
> +			igt_display_commit2(display, COMMIT_ATOMIC);
> +			igt_pipe_crc_collect_crc(pipe_crc, &crc);
> +			scale_crc_check(&both_ref_crc, &crc, a->name,
> +					"primary+overlay", failures,
> +					sizeof(failures));
> +		} else {
> +			igt_info("Primary and overlay %s %s at their limits "
> +				 "rejected together\n",
> +				 a->name, scale_dir_name(dir));
> +		}

If the kernel rejects this combination, the dynamic subtest will still
pass without the tw-plane case running.  This is probably okay, because
it's not really a failure, but then it's not easy to see if the second
scaler was was CRC checked or not...


> -		a->failed =3D !igt_check_crc_equal(&ref_crc, &scaled_crc);
> -		if (a->failed)
> -			igt_critical("CRC mismatch on %s %s\n",
> -				     a->name, scale_dir_name(dir));
> +		igt_plane_set_fb(overlay, NULL);
>  	}
> =20
>  	igt_plane_set_fb(plane, NULL);
> +	if (overlay)
> +		igt_plane_set_fb(overlay, NULL);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> =20
>  	igt_reset_fifo_underrun_reporting(display->drm_fd);
> @@ -1173,13 +1276,8 @@ check_one_scale_max_crc(data_t *d, igt_crtc_t *crt=
c, igt_output_t *output,
>  	if (mask_lut)
>  		set_legacy_lut(d, crtc, 0xffff);
> =20
> -	igt_assert_f(!(axes[0].failed || axes[1].failed) ||
> -		     igt_skip_crc_compare,
> -		     "%s%s%s %s CRC mismatch\n",
> -		     axes[0].failed ? axes[0].name : "",
> -		     axes[0].failed && axes[1].failed ? " and " : "",
> -		     axes[1].failed ? axes[1].name : "",
> -		     scale_dir_name(dir));
> +	igt_assert_f(!failures[0] || igt_skip_crc_compare,
> +		     "%s CRC mismatch on: %s\n", scale_dir_name(dir), failures);
>  }
> =20
>  static void

Regardless:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
