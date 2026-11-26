Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2A606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=emersion.fr header.i=@emersion.fr header.a=rsa-sha256 header.s=protonmail2 header.b=RRlzGY8K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362C3112281;
	Thu, 26 Nov 2026 10:04:49 +0000 (UTC)
Received: from mail-4321.protonmail.ch (mail-4321.protonmail.ch [185.70.43.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE5211227F
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 10:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1795687279; x=1795946479;
 bh=93CEM9rRfj84aloxCaucbMnnLuaAdOEFpKc3WFvZXzw=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=RRlzGY8Kbpr9gdDRU4mDzqz2fi/Jp4ep+ybPlC43tFqIiWmW/l3PBsAo8682XS3vd
 UnzE+ok141xUdklvzdjRoyova/PZp3+7+bhGMcVnIwCtIpW7iHObB1oT5lMiXNLeme
 4UODq0cXJDz4CFTCcCCgfrOYqVHaevtJjSqA6KRzrZMeCQ1keLQcpev/mbeg6fxehr
 wCuhNeHBQNMQqNy2oxMEF53fhSG8LGIjJ5DAnh1MxR/gRFai7yzt1P+2D4RRHgEFGp
 A/VZo+bee/1z6sfjMFvgdbXaK1KW+mOoFTO5GAA6lnXGKttIn1aKEvin/x+iWa0ba+
 mR5KiUUl8LaKw==
Date: Thu, 26 Nov 2026 10:01:12 +0000
To: Gil Dekel <gildekel@google.com>
From: Simon Ser <contact@emersion.fr>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mark Yacoub <markyacoub@google.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Message-ID: <f0kqdnSslJ5aAt-_9T_HNf07PsmBlKfKkvhAFvy1KtRSS-gD7Bkkncrxv1AushLYuWS3XZulBswj4YRfi_E7I0h6r9XeVLFh4Mwuz6dskVY=@emersion.fr>
In-Reply-To: <CA++eeRNu6hCHrKUdNKcs_so5F+3rsdBpmHszP9qjZc2gfiSi9Q@mail.gmail.com>
References: <20261121115236.124211-1-contact@emersion.fr>
 <CA++eeRNu6hCHrKUdNKcs_so5F+3rsdBpmHszP9qjZc2gfiSi9Q@mail.gmail.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: bcac838bbbd2efc9988e0edb7f75a507307a875a
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tuesday, November 24th, 2026 at 19:26, Gil Dekel <gildekel@google.com> w=
rote:

> I'll drop patches 1/3 and 2/3 of my series in favor of this. A few
> comments inline below.

Thanks for the review! I'll be sending v2 shortly.

> > diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> > index c0ed9e843163..b8175ceef1f7 100644
> > --- a/lib/igt_hdr.c
> > +++ b/lib/igt_hdr.c
> > @@ -11,6 +11,8 @@
> >  #include <termios.h>
> >  #include <unistd.h>
> >
> > +#include <libdisplay-info/info.h>
>=20
> Nit: #include "igt_edid.h" (at line 7, and in lib/igt_hdr.h) looks
> unused now.

Good catch! Removed both.

> >  /**
> >   * igt_is_panel_hdr:
> >   * @fd: DRM file descriptor
> > @@ -63,13 +38,10 @@ static bool cta_block(const char *edid_ext)
> >  bool igt_is_panel_hdr(int fd, igt_output_t *output)
>=20
> Nit: the doc comment right above igt_is_panel_hdr() still says "in the
> CTA extension".

I've reworded this section to be a bit more explicit, explaining that a
CTA extension may be inside the base EDID, or nested inside a DisplayID
extension).

> > +=09info =3D di_info_parse_edid(edid_blob->data, edid_blob->length);
> > +=09igt_assert(info);
>=20
> di_info_parse_edid() returns NULL when an EDID fails its base-block
> checksum, so igt_assert(info) fails the test where the old code
> returned false. Would it make sense to warn and return false when !info
> instead of asserting?

Yup, I've done that!

> > diff --git a/meson.build b/meson.build
> > index eec131375e06..e7c685116b13 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -151,6 +151,7 @@ build_info +=3D 'Valgrind annotations: @0@'.format(=
valgrind.found())
> >  cairo =3D dependency('cairo', version : '>1.12.0', required : true)
> >  libpci =3D dependency('libpci', required : true)
> >  libudev =3D dependency('libudev', required : true)
> > +libdisplay_info =3D dependency('libdisplay-info', required : true)
>=20
> DisplayID CTA HDR parsing landed in libdisplay-info 0.4.0; 0.2.0 and
> 0.3.0 only check CTA-861 extensions (and return pq=3D0 on this panel's
> EDID). Since build-fedora currently pulls 0.3.0, could this require
> version : '>=3D 0.4.0' so Meson also falls back to your 0.4.0 wrap there?

I've added a patch with the version bump and the wrap file. (Feel free
to let me know if you'd rather have it squashed into the previous
commit.)

Simon
