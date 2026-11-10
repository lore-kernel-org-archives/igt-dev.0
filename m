Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48177606A32E
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 08:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC15E10EE7D;
	Tue, 10 Nov 2026 08:03:10 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F201510EE7A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 08:02:12 +0000 (UTC)
Received: from 85-156-80-143.elisa-laajakaista.fi ([85.156.80.143]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xQgnp-000000058g4-2Wtb; Tue, 10 Nov 2026 10:02:10 +0200
Message-ID: <70a6b6cc10b5056679b60c5ee9d6c99e089c79b6.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka =?ISO-8859-1?Q?Heikkil=E4?= <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Tue, 10 Nov 2026 10:02:13 +0200
In-Reply-To: <b07529dc-413a-460d-a9c4-2b73332a7b41@gmail.com>
References: <20261028145202.3128915-1-juhapekka.heikkila@gmail.com>
 <20261028145202.3128915-10-juhapekka.heikkila@gmail.com>
 <ac5ccacc1790da44668432893595d432b90ffb28.camel@coelho.fi>
 <b07529dc-413a-460d-a9c4-2b73332a7b41@gmail.com>
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

On Mon, 2026-11-09 at 20:07 +0200, Juha-Pekka Heikkil=C3=A4 wrote:
>=20
> On 09/11/2026 11.34, Luca Coelho wrote:
> > On Wed, 2026-10-28 at 16:52 +0200, Juha-Pekka Heikkila wrote:
> > > The plane-*-max-crc subtests search scaling limits kernel actually ac=
cepts
> > > for each pixel format, modifier and rotation, on all pipes, for prima=
ry
> > > and overlay planes alone and together, and verify result with crc. Le=
gacy
> > > subtests below only checked that commit with fixed scaling factor was
> > > accepted, skipping on -EINVAL or -ERANGE, so they never
> > > verified the scaled output.
> > >=20
> > > The first three removed groups each had six variants: upscale-20x20,
> > > upscale-factor-0-25, downscale-factor-0-25, downscale-factor-0-5,
> > > downscale-factor-0-75 and scaler-unity-scaling.
> > >=20
> > > plane-*-with-pixel-format
> > >    Covered by plane-{up/down}scale-max-crc-linear, which tests every
> > >    format at largest accepted factor and checks the crc.
> > >    Unity scaling is reference commit of each max-crc step.
> > >=20
> > > plane-*-with-modifiers
> > >    Covered by per modifier plane-{up/down}scale-max-crc-* subtests.
> > >=20
> > > plane-*-with-rotation
> > >    Linear XRGB8888 walking rotations 0, 90, 180, 270 and returning on=
 the
> > >    first rejected commit. Where 90 is advertised it is rejected with
> > >    linear, so only rotation 0 was ever exercised; Covered by
> > >    plane-{up/down}scale-max-crc-* and plane-{up/down}scale-max-crc-ro=
tation-*
> > >=20
> > > planes-* (24 subtests)
> > >    Covered by the two plane steps of the max-crc subtests on pipes wi=
th
> > >    at least two scalers: both planes unscaled as the crc reference, b=
oth
> > >    planes at their limits at the same time, and the primary at its li=
mit
> > >    with the overlay scaled 2x in the opposite direction.
> > >=20
> > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > ---
> >=20
> > When looking at this again, I had a feeling some of the tests were
> > still missing, so I ran it through Claude and it seems that there are
> > still a bunch of tests dropped, or with reduced coverage.  But instead
> > of just copying its comments here, I think it's more efficient if you
> > run these changes through an LLM to compare the previous coverage with
> > the current one.
> >=20
> > Also, it would be nice to have a cover-letter with a small changelog on
> > what changed between one patchset version and the next, so it's easy to
> > check what has changed without going over the patches again.
> >=20
>=20
> Hi Luca,
>=20
> not sure what was missed. Here's a comparison of old and new coverage.
>=20
> Covered now with crc instead of commit-only: every format, modifier and=
=20
> rotation at the limit; fixed factors (the search probes the whole range=
=20
> with TEST_ONLY and crc-checks the extreme); unity (the reference commit=
=20
> of every step); two planes in the same and in opposite directions. The=
=20
> old rotation tests in reality only ran rotation 0 and nothing else.
>=20
> Differences that are intentional:
>=20
> - Width and height are scaled separately. Each axis has its own limit=20
> and testing them one at a time keeps the framebuffers small as well as=
=20
> tells which axis broke.
> - Only primary and first overlay are used. Scalers are pipe resource and=
=20
> get assigned to whichever plane needs one, so more overlays would run=20
> the same scalers again. Per-plane format/modifier support is checked=20
> before the overlay is used.
> - Native mode only instead of walking connector modes until one is=20
> accepted. The test is about scaler limits and not about mode selection.
> - Pipe crc is required. Without crc old tests only showed commit was=20
> accepted, which the TEST_ONLY still cover.
> - Intermediate factors are only probed with TEST_ONLY. Extreme factor is=
=20
> the one that stresses the scaler.
>=20
> If something else is missing that isn't covered by the above, please=20
> point it out and I'll take a second look.

This is, very shortly, what Claude found:

* Other plane pairs: these still aren't covered, which JP agreed to on
  v1, yet the commit message says planes-* is covered.

* Full-screen scaling: two full-screen overlapping planes became two
  64-pixel strips side by side, so the expensive bandwidth case isn't
  exercised anymore.

* Fixed factors: 0.25, 0.5 and 0.75 used to be committed for real.  Now
  only the limit is, and the binary search only uses TEST_ONLY commits,
  which never reach the hardware.

I'm not sure these make sense, so I'll leave them for you to comment.=20
In any case, I don't want to block this, so if you think this is all
fine, you have my:

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
