Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD0C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 10:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C79910F2CF;
	Fri, 22 Mar 2024 10:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xr2bjB2/";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EB710F2C8
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 10:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711102374;
 bh=I9dMky1hx4x7YkNne3w6CGnJ3e8O36FS6GdTDKS1mG0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xr2bjB2/oXuy1cc3a289pMUkB5SJLMn62zbSXV8TkfrkVUWMtkfK76iqikYoz83Vq
 knTogrK0SxeRbOZSJpXvftnmTC5VBJHSRF8fQ80ZhSciC4P/7JbXqYX4Bn6FJWeIJU
 8UVMhjdgS9aYQH707Czk7zWgcn4JBMlHxK24fDuRNaq02Y93ZpnodpIRbVUhiGc2tB
 UEXGGngUBGXeopmnDhVcgNpvUPbMlG+SBKBbot0tFO5B9JrIedeNHnk/ztQ93Ch4+9
 8B5aNrmXOQj/aNUtzxWeosJl0uryLsLfjUXs0Pg13HNMrnXdk/nhHRAXrvJbAeLXaZ
 vDYrT1uE88DhQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9F732378042B;
 Fri, 22 Mar 2024 10:12:53 +0000 (UTC)
Date: Fri, 22 Mar 2024 12:12:52 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v3 0/7] benchmarks/kms_fb_stress: Test all
 possible combinations of formats
Message-ID: <20240322121252.675f99c0.pekka.paalanen@collabora.com>
In-Reply-To: <cde03f01-76b2-4628-bcb8-2fd2754b5fd8@riseup.net>
References: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
 <20240320174201.3b49c82a.pekka.paalanen@collabora.com>
 <cde03f01-76b2-4628-bcb8-2fd2754b5fd8@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/82o.Jr7hl2TmJYH=1/3PKmV";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/82o.Jr7hl2TmJYH=1/3PKmV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Mar 2024 12:27:20 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 20/03/24 12:42, Pekka Paalanen wrote:
> > On Thu, 07 Mar 2024 16:41:02 -0300
> > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >  =20
> >> After some discussion[1], I changed how to tackle the problem.
> >>
> >> With the upcoming addition of YUV format to VKMS[2] it would be great =
to
> >> test the their performance. So, test all possible combinations of
> >> formats. =20
> >=20
> > Hi Arthur,
> >=20
> > what do you gain by testing all possible combinations of formats on
> > planes?
> >=20
> > I would have thought that if you can pick and choose a format, then you
> > don't need to test combinations. Each format alone (but as plane source
> > and writeback destination separately) would exercise all the VKMS code
> > there is for that format, given that VKMS uses the intermediate pixel
> > format for all blending etc. operations. =20
>=20
> Yeah, that does make a lot more sense. I think I was overcomplicating
> things, sorry XD. About "but as plane source and writeback destination
> separately", I didn't quite understand that part, could you talk more
> about it?

If you think of VKMS code, you have separate functions for reading and
writing each pixel format. Both would be good to test. Read functions
are used on KMS plane FBs, and write functions are used on writeback
connector FBs.

Here we are talking about performance benchmarking, but some other
tests should be doing correctness testing, too.

> >=20
> >=20
> > What will the standard benchmark results printout look like?
> >=20
> > I imagine it should be a simple table that people could put in their
> > commit message, something like this:
> >=20
> > kms_fb_stress test results, plane source:
> >=20
> >             before    after    difference
> >   ARGB8888   3.6 s    3.7 s       +2.7 %
> >   ABGR8888   3.6 s    3.8 s       +5.6 %
> >   YUV420    15.5 s    9.9 s        -36 %
> >   YUV410         -    8.8 s          -
> >=20
> > and another table for writeback destination, if that's interesting.
> >=20
> > But that requires both before and after runs, so one would need to save
> > results in a file, and use a tool to generate the table. Well, maybe
> > something to consider in the future. One could also get even fancier
> > with statistical analysis, but I guess this would be plenty already. =20
>=20
> Interesting ideas, maybe, for now, just the format and the time it took
> run would suffice? What do you think?

Yes, that's exactly what a single benchmark run should print. Maybe for
all supported formats (but not format combinations ;-).

That's all the benchmark itself can do. Then a developer would run it
before and after changes and save the results into files, and use some
script to turn the files into that table. So the benchmark printout
should be easily machine-readable.

The reason I proposed the original benchmark to have all those KMS
planes with different pixel formats was that I was trying to cram
everything into a single benchmark result number. It's an ok first
step, but once you get more pixel formats, it's both too much and not
enough. Ideally there would be two kinds of benchmark scenarios:

- pixel format oriented, that mainly measures the performance of
  converting each pixel format to or from the VKMS intermediate pixel
  format, and

- blending and color operation oriented, that does lots of blending and
  runs all the color operations (like GAMMA LUT or CTM, once VKMS
  supports those).

For the former, you only really need a single KMS plane. Or maybe two
at most, to be able to use odd positions and odd sizes and maybe also
for a partially off-screen plane. This benchmark would be printing a
time for each pixel format.

The latter would use several overlapping planes to stress the blending.
This benchmark could probably do with just a couple different
configurations, and does not need to iterate over pixel formats. So
this benchmark is what you mostly already have.

Because VKMS converts everything to its internal intermediate pixel
format, the blending performance is largely independent of the pixel
formats. You can test pixel formats more efficiently by minimizing
blending, and blending tests don't need to use every possible pixel
format.


Thanks,
pq

--Sig_/82o.Jr7hl2TmJYH=1/3PKmV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmX9WaQACgkQI1/ltBGq
qqdfiQ/9GEjFCR0/M1VM4vR7CEu87ICODwHWIGnO7vO+QQ4dfJ+wBwpjo9vnimU0
fbLjI80k6EhVj/i4/3yMZ2cxQAldUQP7wh77bLwgjZg0y3bQQwgOBpqIwWt/J42E
63DQvV+ZnkpOVI3dslVbB2aDMHGJjnqKZPaN2lWM3CuqBSMho2JwJjFxiT8zL5CU
NliyJOb6l/Bgzo2Va15vOm0IUwN/LYU+Tis7ZGObA705i13WRIezPwFVdruBbS3n
/WVtquHqr0XxSnxvD+mVnMCmWdqrbFQQR72aUB6PLSMR1kbirETTJuAruPC5m+q4
wAIaTGlAMMp6oHIkF75hOqNN1Ui+3OOP3DgP/xWcBzpoWD71iqOzpPNtw2713Tsz
nsz8gKwruz4ey2pK3Z7wthsN2IwMuLWXNa2OdpzgwTeYfUWlRyaxqZh8xtDD9C4f
gKtLw807IdesgGpXMpnnZ9xfXBR0J/ulzQKQxsmqCl5HuGLNm0pJi1BY4R18f9my
RdY1Kf7X024BTkAGtRkFDFFHx3++nk3dhAz9h9mV2qQPd0uGQl3DPrdAspOLdpNz
KUvYUWrUZJSqC+gdpCsQFTssjiKqm9Ri2jMG8woepg8C17+zdBlgHUtfPRwI0Okn
cLOdugefIzj5Fbum6zHBbFg79ASBQQKUilDx+S3B0vA5hYVgNJY=
=jNa9
-----END PGP SIGNATURE-----

--Sig_/82o.Jr7hl2TmJYH=1/3PKmV--
