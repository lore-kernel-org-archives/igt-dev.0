Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2718A606A31C
	for <igt-dev@archiver.kernel.org>; Sun,  8 Nov 2026 12:57:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3ADE10E0DC;
	Sun,  8 Nov 2026 12:57:36 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98D510E0DC
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Nov 2026 12:56:42 +0000 (UTC)
Received: from 80-186-47-64.elisa-mobile.fi ([80.186.47.64]
 helo=[10.148.179.248])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xQ2Rp-000000055tm-46AA; Sun, 08 Nov 2026 14:56:40 +0200
Message-ID: <7c13a53f42496d266f7aeac1e876131420fb8f9c.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Sun, 08 Nov 2026 14:56:50 +0200
In-Reply-To: <20261028145202.3128915-3-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
 <20261028145202.3128915-3-juhapekka.heikkila@gmail.com>
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
Subject: Re: [PATCH i-g-t 03/10] tests/kms_plane_scaling: add
 plane-downscale-max-crc subtest
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

On Wed, 2026-10-28 at 16:51 +0200, Juha-Pekka Heikkila wrote:
> Probe the maximum horizontal and vertical plane downscaling
> factor and verify the downscaled framebuffer render correctly
> by verifying via crc.

The s/render/renders/ remains here and in the comment, but it doesn't
matter, because the comment will be changed in patch 4 anyway.


>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 146 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 146 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 41f56a5ed..2b7a6d632 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -189,6 +189,13 @@
>   * Description: Test for validating max source size.
>   */
> =20
> +/**
> + * SUBTEST: plane-downscale-max-crc
> + * Description: Probe the maximum horizontal and vertical plane downscal=
ing
> + *              factor and verify the downscaled framebuffer render corr=
ectly
> + *              by verifying via crc.
> + */
> +
>  IGT_TEST_DESCRIPTION("Test display plane scaling");
> =20
>  enum scaler_combo_test_type {
> @@ -709,6 +716,36 @@ static const uint64_t modifiers[] =3D {
>  	I915_FORMAT_MOD_4_TILED
>  };
> =20
> +static void yuv_src_alignment(data_t *d, uint32_t format, igt_rotation_t=
 rot,
> +			      int *halign, int *valign)
> +{
> +	int disp_ver =3D is_intel_device(d->drm_fd) ?
> +		       intel_display_ver(d->devid) : 0;
> +	int hsub, vsub;
> +
> +	*halign =3D 1;
> +	*valign =3D 1;
> +
> +	if (!igt_format_is_yuv(format))
> +		return;
> +
> +	igt_format_get_subsampling(format, &hsub, &vsub);
> +
> +	/*
> +	 * these must match to intel_plane_check_src_coordinates() in
> +	 * i915/Xe driver
> +	 */
> +	if (disp_ver >=3D 20 && igt_format_is_yuv_semiplanar(format)) {
> +		/* The kernel applies this to display version 35 only. */

Thanks, this comment makes it clearer now.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
