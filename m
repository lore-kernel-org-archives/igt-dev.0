Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9F8606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 16:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=emersion.fr header.i=@emersion.fr header.a=rsa-sha256 header.s=protonmail2 header.b=ipMEEaCL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE2A10EF16;
	Mon, 23 Nov 2026 16:38:56 +0000 (UTC)
X-Greylist: delayed 5455 seconds by postgrey-1.36 at gabe;
 Mon, 23 Nov 2026 16:37:43 UTC
Received: from mail-244104.protonmail.ch (mail-244104.protonmail.ch
 [109.224.244.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B61310E80B
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1795451797; x=1795710997;
 bh=dpDeFS/UDQgvzwqplmNj+3GI+8mJ5oNdN5xF9C6S+QU=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ipMEEaCLHU/UPC8EyDubXpAW13dH/ZDoPoNe1YT89INa6BUP+GfpjLyLzp9HuRq55
 55SguLJwQ8M0DxI7aA0eG7w+jfLzQ2CoW8kpgGSmDcxk4NZ0UEskwOzKeXjpi0qWVD
 AEl1sWpg8bCafjj9iOtHh/DrdtTJ7bsnUSOEjr3WsrMjca75MkBM/pdQF1qxTfKcJn
 wiAx63+aKUJHwii8puc6RW6MHreazw4Kp8lF2dzM5L5umSKF7PJiEdOS6XrX1wT9tQ
 8pZ8HGI92pTDjVxn6AQrqeP4jpoSwVl2OTBESxTRbzN60rdsvBfg7/g0GyHI85RbrA
 Qn3rlf2/N6haQ==
Date: Mon, 23 Nov 2026 16:36:31 +0000
To: "Knop, Ryszard" <ryszard.knop@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nikula,
 Jani" <jani.nikula@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "gildekel@google.com" <gildekel@google.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Message-ID: <XzEMWGkYBNYIocNS9OH9POwFuhngAbGWhJ5VwFbO27k5cJTvUeQUv2BZXTF323SkL2KMDfcZezEHPXsnkIZs0cSFIbZTkh-oZ_oJPhmf0TA=@emersion.fr>
In-Reply-To: <d513043d046bcf2b2d7bbd788aee4caa350a1156.camel@intel.com>
References: <20261121115236.124211-1-contact@emersion.fr>
 <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
 <6369f30cf5d7dc9346589d34fe3e3c6bcaa41cbd.camel@intel.com>
 <_AyHlId1OFTsoV5vKPYws3tD9Eby8_rd9Jho0Sqiae49jcQKNbgWnkdSdJKbzix-27LaZzQMdQR3hHeLo0ICb9ZQXnuR6M8f9yVmDxDA66s=@emersion.fr>
 <d513043d046bcf2b2d7bbd788aee4caa350a1156.camel@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: df0dca316a6cd3ca2bcfcb26730a68128894ad7e
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

On Monday, November 23rd, 2026 at 17:07, Knop, Ryszard <ryszard.knop@intel.=
com> wrote:

> On Mon, 2026-11-23 at 15:06 +0000, Simon Ser wrote:
> > On Monday, November 23rd, 2026 at 16:03, Knop, Ryszard <ryszard.knop@in=
tel.com> wrote:
> >
> > > > Please wait with merging as now it will not build in CI
> > > > on Ubuntu 20.04 and 22.04.
> > >
> > > Hey Simon. Intel CI still runs on Ubuntu 20/22.04 and RHEL 8 where we
> > > don't have these libs in the repo - could you make this lib optional
> > > for now (old impl and new ifdefed with HAVE_LIBDISPLAY_INFO)?
> > >
> > > We will likely drop distros older than 24.04/RHEL 9 in the near futur=
e,
> > > but it's a pain to maintain a single external lib for those distros :=
<
> >
> > Maintaining two codepaths is a bit of a pain. Could we instead use Meso=
n
> > subprojects for these old distros?
>=20
> That and a Git submodule? Works for me, although maintaining that is
> also a bit painful.

Not a Git submodule, but just a matter of dropping this into a
subprojects/libdisplay-info.wrap file:

    [wrap-git]
    url =3D https://gitlab.freedesktop.org/emersion/libdisplay-info.git
    revision =3D 0.4.0

Then Meson will automatically download it at build time if the system
version isn't available (or new enough according to the dependency
version requirements, which might be useful if IGT needs a recent
libdisplay-info in the future).

> If you can give me a day or two, I'm trying to
> figure out if there's anyone who still really needs that 20.04 build,
> maybe it can be avoided entirely.

I'm perfectly fine waiting for a bit (but maybe Gil Dekel has a
deadline?).
