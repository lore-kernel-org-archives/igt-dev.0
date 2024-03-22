Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE1FC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 09:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0E710EF3C;
	Fri, 22 Mar 2024 09:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="lP0XCb44";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3210EF3C
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 09:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711101062;
 bh=tocMq447TB/Gt753AH2+yRBGemwfOPpC0Np3wN9sn0A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lP0XCb44801wxDQx7u+o++R3kVOiUVUc51wi/2dyOKI78aHUFozVNXCT85M4Ei5Uc
 lmyrb2ycC5XryEyEyxKA3XZOxiydDcQHrK6FmD49V07lyGswkDih503VWgD1RmfuiK
 Tq4fqhyyzYnu5nqHULBhmOrr2lxvhEZBw2g/JmletDc76HyRsNV+h+yFfdeYaeytXT
 EBypmfMhc+r9StlZv/SuwNw/nEX1SylWQYAGWyCeufdCmbJZ8bbFVP3THLYu7T7tl3
 QqcRBrAS7q3zm5ct1xGQUXsiXNcsyoZVyiVhF/aR2/+oroNjPPWoa1LAgo3HUG7BZn
 jsz4qE4sV8NxQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 899A337820AC;
 Fri, 22 Mar 2024 09:51:01 +0000 (UTC)
Date: Fri, 22 Mar 2024 11:51:00 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t v3 5/7] benchmarks/kms_fb_stress: Don't paint the
 FB's if the format is DRM_FORMAT_RGB565
Message-ID: <20240322115100.2885a116.pekka.paalanen@collabora.com>
In-Reply-To: <5b66792a-1f1b-4070-ab5e-d27346316162@riseup.net>
References: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
 <20240307-kms_fb_stress-dev-v3-5-d5b948a541be@riseup.net>
 <20240320173645.1a5479e2.pekka.paalanen@collabora.com>
 <5b66792a-1f1b-4070-ab5e-d27346316162@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1tn_K.leS/1sszKU8=OHgRw";
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

--Sig_/1tn_K.leS/1sszKU8=OHgRw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Mar 2024 12:14:17 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 20/03/24 12:36, Pekka Paalanen wrote:
> > On Thu, 07 Mar 2024 16:41:07 -0300
> > Arthur Grillo <arthurgrillo@riseup.net> wrote:
> >  =20
> >> Cairo does not fully support the RGB565 due to some stride issues.
> >> So, don't paint the FB's if the format is DRM_FORMAT_RGB565. =20
> >=20
> > Cairo, as it is based on Pixman, requires stride to be divisible by
> > sizeof(uint32_t). Pixman makes use of that requirement to go faster.
> >=20
> > It probably wouldn't hurt if VKMS happened to have the same convention?=
 =20
>=20
> By not supporting too? Or converting the plane to have strides divisible
> by sizeof(uint32_t) before doing the format conversion?

The DRM driver decides what stride a dumb buffer shall have, so VKMS
could just make the stride to meet Pixman's requirements. I don't
recall if userspace can suggest a stride when allocating a dumb buffer.

If userspace allocates the buffer via some other API, the it is
userspace's own responsibility to make sure the stride is good for
whatever userspace wants to do with it, that is, use it with both
Pixman/Cairo and VKMS.

> >=20
> > Anyway, it would be better to test the stride, not format. Maybe IGT
> > should grow a function to check if it can paint with a specific stride
> > & format? =20
>=20
> If the stride issue is the only thing that decides if a format can be
> painted, I think I can create this function.

Would be best if one could simply try to use a buffer and then handle
failure gracefully when expected.

Btw. it came to my mind, Cairo supports very few pixel formats and
none of them are YUV. So maybe depending on Cairo in IGT in the first
place is not a good decision?

Pixman supports a lot more formats, but I'm unsure of its YUV support,
and it has its own stride requirements due to hand-written assembly
functions to accelerate chosen operations, and maybe the C code paths
too. Pixman might not be a good option either.

If IGT needs to be able to fill buffers of any format with any stride...
and it will need that in order to make sure drivers/hardware process
all pixel formats correctly by CRC or writeback.

Doesn't IGT already have something more featureful than Cairo for
filling buffers?


Thanks,
pq

> >  =20
> >>
> >> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> >> ---
> >>  benchmarks/kms_fb_stress.c | 55 ++++++++++++++++++++++++++++++++++---=
---------
> >>  1 file changed, 41 insertions(+), 14 deletions(-) =20
> >=20
> > Thanks,
> > pq =20


--Sig_/1tn_K.leS/1sszKU8=OHgRw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmX9VIQACgkQI1/ltBGq
qqflQw/+K0StVmj/MD3ndf4Jt98Yu9XazEp/RAIhgEcVk3qd1vL3Y/u8MHG4/0px
ZhxgRvEP/8hoZsV43kWNywuKJ5eHX7iWS4L7Va8HZwpXWdi01gbQGhnfR794v5wV
EhJHFtmNZuj54XK8XHAVC+XFMJDznh/V8G/mT6Qob32Mt6iBftkI7WgiYzLPuoS4
/mnuSEUybMp4xWU9odxHDAl2EEca+z387s4zfyJeWG242wWD14MLcBgcwMBGn14B
/OXvRs7J8AzLAgMeg1ZEJaDALt8ODNqt6hme9GhQza/8G+G6yEpS5qS/eOePxfce
+cc3vvujNDeMJS1K2M9Ta69pbvi+eQhbhN4XI7GKv3rlljAboxVG37HgnCCMg5vM
RyX6aLcUgEV1S0yUeo/8ElpOCKVFWweThZLjCsEN5HagCrEGck+w1f/yaXtRhCwg
2HOXlFl9oVUTYsEbsNGD37kLJhe03zLzYrGTvt2OlE1FM+mm5evLKc8OSBT2svCW
tVEZCOqN4XCtTCx3iD1M+aA1ZJsW5dUFwvR4fXgmVt+hX11akWV+KDl+YU1NHRXq
uuafYWg5HzjbpqCrVPs3xsA+4SHDacHiiV9ucdFq6yVhC08fNAZjQ9t+tLX2PpLJ
ULUmtrT4FDdTDlk0UGqLzA6wRVU7hlpRWHhF2leEhO2abAuw5Ko=
=J2lY
-----END PGP SIGNATURE-----

--Sig_/1tn_K.leS/1sszKU8=OHgRw--
