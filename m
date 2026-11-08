Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3E9606A31C
	for <igt-dev@archiver.kernel.org>; Sun,  8 Nov 2026 13:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7820410E02D;
	Sun,  8 Nov 2026 13:31:00 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F5210E02D
 for <igt-dev@lists.freedesktop.org>; Sun,  8 Nov 2026 13:30:05 +0000 (UTC)
Received: from 85-156-80-143.elisa-laajakaista.fi ([85.156.80.143]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xQ2yA-0000000566E-3QVB; Sun, 08 Nov 2026 15:30:04 +0200
Message-ID: <3c8e24b51d9cf021bfbb475e34943b61b84c16db.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Sun, 08 Nov 2026 15:30:14 +0200
In-Reply-To: <20261028145202.3128915-6-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
 <20261028145202.3128915-6-juhapekka.heikkila@gmail.com>
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
Subject: Re: [PATCH i-g-t 06/10] tests/kms_plane_scaling: run
 plane-*-max-crc on all pipes
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
> Instead of testing only the pipe driving the highest native resolution,
> run the max scaling crc tests on every pipe that has a scaler, each with
> the valid output that has the largest native mode on that pipe.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 80 ++++++++++++++-------------------------
>  1 file changed, 29 insertions(+), 51 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 957a4ab61..2e7434b7e 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1128,7 +1128,6 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt=
_output_t *output,
>  	uint32_t format;
> =20
>  	plane =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> -	igt_require(plane);

Thanks! There's another dead check like this after
igt_output_get_plane_type() in check_one_scale_max_crc().  No need to
change this patch just for that, but if you respin it for some other
reason, you could remove that too.  Otherwise a separate patch would
also be nice.

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca Coelho.
