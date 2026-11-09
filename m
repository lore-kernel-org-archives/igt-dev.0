Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0F606D81A
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 09:35:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A9910E857;
	Mon,  9 Nov 2026 09:35:35 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F8410E857
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 09:34:39 +0000 (UTC)
Received: from 85-156-80-143.elisa-laajakaista.fi ([85.156.80.143]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xQLlr-0000000577d-2rbz; Mon, 09 Nov 2026 11:34:36 +0200
Message-ID: <ac5ccacc1790da44668432893595d432b90ffb28.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Mon, 09 Nov 2026 11:34:48 +0200
In-Reply-To: <20261028145202.3128915-10-juhapekka.heikkila@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
 <20261028145202.3128915-10-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
Subject: Re: [PATCH i-g-t 10/10] tests/kms_plane_scaling: remove legacy
 subtests covered by max-crc tests
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
> The plane-*-max-crc subtests search scaling limits kernel actually accept=
s
> for each pixel format, modifier and rotation, on all pipes, for primary
> and overlay planes alone and together, and verify result with crc. Legacy
> subtests below only checked that commit with fixed scaling factor was
> accepted, skipping on -EINVAL or -ERANGE, so they never
> verified the scaled output.
>=20
> The first three removed groups each had six variants: upscale-20x20,
> upscale-factor-0-25, downscale-factor-0-25, downscale-factor-0-5,
> downscale-factor-0-75 and scaler-unity-scaling.
>=20
> plane-*-with-pixel-format
>   Covered by plane-{up/down}scale-max-crc-linear, which tests every
>   format at largest accepted factor and checks the crc.
>   Unity scaling is reference commit of each max-crc step.
>=20
> plane-*-with-modifiers
>   Covered by per modifier plane-{up/down}scale-max-crc-* subtests.
>=20
> plane-*-with-rotation
>   Linear XRGB8888 walking rotations 0, 90, 180, 270 and returning on the
>   first rejected commit. Where 90 is advertised it is rejected with
>   linear, so only rotation 0 was ever exercised; Covered by
>   plane-{up/down}scale-max-crc-* and plane-{up/down}scale-max-crc-rotatio=
n-*
>=20
> planes-* (24 subtests)
>   Covered by the two plane steps of the max-crc subtests on pipes with
>   at least two scalers: both planes unscaled as the crc reference, both
>   planes at their limits at the same time, and the primary at its limit
>   with the overlay scaled 2x in the opposite direction.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---

When looking at this again, I had a feeling some of the tests were
still missing, so I ran it through Claude and it seems that there are
still a bunch of tests dropped, or with reduced coverage.  But instead
of just copying its comments here, I think it's more efficient if you
run these changes through an LLM to compare the previous coverage with
the current one.

Also, it would be nice to have a cover-letter with a small changelog on
what changed between one patchset version and the next, so it's easy to
check what has changed without going over the patches again.

--
Cheers,
Luca.
