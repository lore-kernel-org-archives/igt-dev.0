Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11986C54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:36:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7751010F024;
	Wed, 20 Mar 2024 15:36:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pltV/w9N";
	dkim-atps=neutral
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2E110F024
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710949007;
 bh=igJZSYpbHkeLg2qL+MFdqYrFjrI8faeGfMTI0tK44K8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pltV/w9NR223fYj6v0fKIECNqMne0fcc2hc+0btfH/8oO/Sn2gaOBhYElzNnLwzT7
 mgCLEDfXfdcpS6SAJeqcppK29XmVZAdtLjWSLDhZ8f5IS2TnByx9xS7FN7G2Z2hTjD
 AZU/HsywH3H8AQwn3TBNKOWpYrypIyx9NsrxRuo+mIeGmycvlG+i45Q1lr6DfJhzku
 g1C9A5iJR4QR2MwvQA5fOEhMLJRTp/ZjopR82pB0gMtCh+R88xyaf++jcvI9LQkruy
 8+JzIIjYdlejKVQeDbnlAeCMyGvye2szKQIi5OFz2VgN4V0i9ms4riKqR3gCgH313u
 EUsr4K9U1cmdQ==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0DF0837813C4;
 Wed, 20 Mar 2024 15:36:47 +0000 (UTC)
Date: Wed, 20 Mar 2024 17:36:45 +0200
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
Message-ID: <20240320173645.1a5479e2.pekka.paalanen@collabora.com>
In-Reply-To: <20240307-kms_fb_stress-dev-v3-5-d5b948a541be@riseup.net>
References: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
 <20240307-kms_fb_stress-dev-v3-5-d5b948a541be@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/89+/mTBmKVOMCe8p6gCdrLO";
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

--Sig_/89+/mTBmKVOMCe8p6gCdrLO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 07 Mar 2024 16:41:07 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> Cairo does not fully support the RGB565 due to some stride issues.
> So, don't paint the FB's if the format is DRM_FORMAT_RGB565.

Cairo, as it is based on Pixman, requires stride to be divisible by
sizeof(uint32_t). Pixman makes use of that requirement to go faster.

It probably wouldn't hurt if VKMS happened to have the same convention?

Anyway, it would be better to test the stride, not format. Maybe IGT
should grow a function to check if it can paint with a specific stride
& format?

>=20
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  benchmarks/kms_fb_stress.c | 55 ++++++++++++++++++++++++++++++++++------=
------
>  1 file changed, 41 insertions(+), 14 deletions(-)

Thanks,
pq

--Sig_/89+/mTBmKVOMCe8p6gCdrLO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmX7Ao0ACgkQI1/ltBGq
qqdXtQ//bGV8T5qqaiPbYUN6gDmocXu+grTx2tWZgTrRIdhxRGV/8SsadaBbT+19
khhLE3DnKp8tUoDQndTQlyFv/Z79/1EuBZc3JUSrXwnBUHXt7k4W4XDAlBU+fqqx
EbMl5lTAts5vGWXC6ddYLFZCLSzOnMhKX+061VSFy37kpGlEQeDHYyLY5t1hxdNO
sUAebDE6uWVGcqcVM7EnQXGVoI2e/YnQiStVsUZMdyghMau9oOj8hG6Lpj3NOqGw
NTCkAyV5vH1Zc0hEr4OMUlrygOWm/W51CFOD0hkMSusGxwdzzMb6XpknX6lX6Way
kCSzqAYbCKrZxQon/kGyx7OWaQJOl8Bc57YRkH5fjQIyiKsvpi4NI3hKYstA6XU6
WSZZhl1SvwGouIditOroviV/AU4sc76f3KMCOZ3Spw7v55Z2uO89pVa+rcQINSPE
K1oGQY6zQ39XH2p54SA5eRY6KXsIYidvNs6RG2+6q9LM0ooxFyynCh9uxOaCu+iw
TAi7rQoLSFuN1m5G2zCKtqNg7OSnA1Yld44s0l5iKGB/qXs+DqYXMWNqvOepZFfg
BNoduqfNhT0MOCTHXU3ZN/yiLe5fcEceAfcJJXryo1wAlarBvBD8twBraGJxMWOB
jF51LfLqOfSzbznhDupX0LatzFmk4z5h7n22DKY2fqTXEiqxSNw=
=vZ1k
-----END PGP SIGNATURE-----

--Sig_/89+/mTBmKVOMCe8p6gCdrLO--
