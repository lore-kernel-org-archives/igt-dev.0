Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96E3606A339
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 17:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=emersion.fr header.i=@emersion.fr header.a=rsa-sha256 header.s=protonmail2 header.b=DCQ64EZ2
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75D6510EFBF;
	Mon, 23 Nov 2026 17:25:30 +0000 (UTC)
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0ABD10EF82
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 17:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1795454373; x=1795713573;
 bh=Kq+oA7X+AN/GK24WoqxIoBjUVRoQUIMwAoGbgl2h/iY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=DCQ64EZ2iyp988D3H5BcY0bKdxKzm6EEw56jdrGtvaDHn01YB3OLvbHIQ5iJZcjF3
 zOiV90n9mWhRzyyjS3h6Mv/O98ygTgqLK5fctc4/6V7Ws9/pT4CjRUGo/1WbByvWG0
 zOPH2NUhNuc3ZyZA7Y99e+mFbwIwGQuw/1atK1jCl/KDOC6PMre+rvq+tGd+7kTJTF
 NZzTOOXQDU092LATO2qGGXjBHfE72aDXN76hxkDwvELtLAwv+dgDeEMPAmPcRkTN8O
 p/X0b2Be/sKR28nniC1IPLUwUwGcij2CVhXP8yLGIoxNhQI/OWqNps2pu62EtKtltt
 7y1D4kfkpE80g==
Date: Mon, 23 Nov 2026 17:19:28 +0000
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: "Knop, Ryszard" <ryszard.knop@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "gildekel@google.com" <gildekel@google.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Message-ID: <saI4meshmqTKkqO84blXJkekIvNTygnDunXPz9D3FwZLXHpuDPBp_pS49A1hGjCKIEFONucGamZQl3Cbntsf9GpsrD8jNzjAydR84XPgrb8=@emersion.fr>
In-Reply-To: <6mp3fkbdjc7dv275kuxt4r2mjblqres2tmt22z3bi5zmudrctf@uiijq7irlodj>
References: <20261121115236.124211-1-contact@emersion.fr>
 <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
 <6369f30cf5d7dc9346589d34fe3e3c6bcaa41cbd.camel@intel.com>
 <_AyHlId1OFTsoV5vKPYws3tD9Eby8_rd9Jho0Sqiae49jcQKNbgWnkdSdJKbzix-27LaZzQMdQR3hHeLo0ICb9ZQXnuR6M8f9yVmDxDA66s=@emersion.fr>
 <d513043d046bcf2b2d7bbd788aee4caa350a1156.camel@intel.com>
 <XzEMWGkYBNYIocNS9OH9POwFuhngAbGWhJ5VwFbO27k5cJTvUeQUv2BZXTF323SkL2KMDfcZezEHPXsnkIZs0cSFIbZTkh-oZ_oJPhmf0TA=@emersion.fr>
 <6mp3fkbdjc7dv275kuxt4r2mjblqres2tmt22z3bi5zmudrctf@uiijq7irlodj>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 3780b2bc008834787e39f9755c8cb9e4f92c6479
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Monday, November 23rd, 2026 at 18:14, Kamil Konieczny <kamil.konieczny@l=
inux.intel.com> wrote:

> Hi Simon,
> On 2026-11-23 at 16:36:31 +0000, Simon Ser wrote:
> > On Monday, November 23rd, 2026 at 17:07, Knop, Ryszard <ryszard.knop@in=
tel.com> wrote:
> >
> > > On Mon, 2026-11-23 at 15:06 +0000, Simon Ser wrote:
> > > > On Monday, November 23rd, 2026 at 16:03, Knop, Ryszard <ryszard.kno=
p@intel.com> wrote:
> > > >
> > > > > > Please wait with merging as now it will not build in CI
> > > > > > on Ubuntu 20.04 and 22.04.
> > > > >
> > > > > Hey Simon. Intel CI still runs on Ubuntu 20/22.04 and RHEL 8 wher=
e we
> > > > > don't have these libs in the repo - could you make this lib optio=
nal
> > > > > for now (old impl and new ifdefed with HAVE_LIBDISPLAY_INFO)?
> > > > >
> > > > > We will likely drop distros older than 24.04/RHEL 9 in the near f=
uture,
> > > > > but it's a pain to maintain a single external lib for those distr=
os :<
> > > >
> > > > Maintaining two codepaths is a bit of a pain. Could we instead use =
Meson
> > > > subprojects for these old distros?
> > >
> > > That and a Git submodule? Works for me, although maintaining that is
> > > also a bit painful.
> >
> > Not a Git submodule, but just a matter of dropping this into a
> > subprojects/libdisplay-info.wrap file:
> >
> >     [wrap-git]
> >     url =3D https://gitlab.freedesktop.org/emersion/libdisplay-info.git
> >     revision =3D 0.4.0
> >
> > Then Meson will automatically download it at build time if the system
> > version isn't available (or new enough according to the dependency
> > version requirements, which might be useful if IGT needs a recent
> > libdisplay-info in the future).
> >
>=20
> There are some distros which disable downloading during build,
> so this will not work for them.

Subproject downloads are purely optional, and I would indeed expect
distros to disable that (ie, always use system deps). This can be done
by setting the wrap_mode=3Dnodownload option. We can set that in our
meson.build if we want to opt out of Meson's default behavior.
"meson subprojects download" can be used to manually download
subprojects prior to the build step.

tl;dr the wrap file would be useful for developers and CI, not for
distros.
