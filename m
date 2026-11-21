Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CD9606A330
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=emersion.fr header.i=@emersion.fr header.a=rsa-sha256 header.s=protonmail2 header.b=ByidOVvS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D8410E29A;
	Sat, 21 Nov 2026 12:02:21 +0000 (UTC)
X-Greylist: delayed 496 seconds by postgrey-1.36 at gabe;
 Sat, 21 Nov 2026 12:01:14 UTC
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1746610E29A
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 12:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1795262467; x=1795521667;
 bh=aGUxUCLnym8PrRXggTZMwTh66dymQYGTP2/cZoMTE7M=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=ByidOVvSmmnO4xEJMcThdIl81JXHcQ2pJWOCbR3UCoLSEc2Vi+fJCifiWF+CL6R5c
 Qv8hTDb5a7nilCyJAQx3ekM/dSRV3GIHlVGzQyTJ/TVu7jI5jxst3AECMq95pwuhFb
 C9rhfXUiNOVEodNegragOCRVIv6fFZXHLBkXGXSmZ20rrU1IfEsZUAzGTWE7Ns6KbD
 ysJHxF0VT+JuG41Nzi1EVBd7T0ZtYCWltIzDbfsun2GT1mC0noXnKstxUjMDcdPoa7
 AjBt/FxU5HjBUecKcMC8kkz/T9kDKSjA9Gk7m0OaK5ibRmHbC7Nvxf0q33KxAQUvgA
 x6J13pp36Q8lw==
Date: Sat, 21 Nov 2026 12:01:03 +0000
To: Jani Nikula <jani.nikula@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: Gil Dekel <gildekel@google.com>, igt-dev@lists.freedesktop.org,
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mark Yacoub <markyacoub@google.com>, kunal1.joshi@intel.com
Subject: Re: [PATCH i-g-t 0/3] lib/igt_hdr: Find HDR in DisplayID EDIDs
Message-ID: <8dbiQ-xKIF5RNdybtcEVmHNWSf03BlJaPre_6_aNt7aSjmvw1EgoZ5aoOI-2-mxrCT-6i0BTv5XighYrhZEpvugCRa8rUTQ4YAqPL3cVmwU=@emersion.fr>
In-Reply-To: <412e328e1721b30468a2fa1b8e93215b2fa30c11@intel.com>
References: <20261114222911.1405626-1-gildekel@google.com>
 <7d0886fd698760ab0b2163f6853b64f76199d4ee@intel.com>
 <CA++eeRP3m6kv-zu-Ea9WQOcyWZay77rjmut4R=5+twRpRETcrw@mail.gmail.com>
 <412e328e1721b30468a2fa1b8e93215b2fa30c11@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: dd1633626797966361f3bd7bbeff4f92da6a82da
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

On Wednesday, November 18th, 2026 at 11:46, Jani Nikula <jani.nikula@intel.=
com> wrote:

> On Mon, 16 Nov 2026, Gil Dekel <gildekel@google.com> wrote:
> > Hi Jani,
> >
> > On Mon, Nov 16, 2026 at 11:40:12AM +0200, Jani Nikula wrote:
> >> I suggested using libdisplay-info in IGT in April [1]. Has anything
> >> happened in that front?
> >>
> >> The more EDID parsing gets added to IGT, the harder it will be to
> >> migrate, and the cost of maintaining the local parser increases.
> >
> > Nothing I am aware of, and I agree libdisplay-info is the right
> > long-term direction for IGT. Driving a tree-wide migration (build/CI
> > dependencies and converting existing lib/igt_edid callers) is beyond
> > what I can take on right now, though.
>=20
> Well, it's beyond what *anyone* can take on right now, always.
>=20
> I keep bringing this up, because more and more EDID parsing keeps
> getting added, incrementally in small pieces. And it becomes harder for
> anyone to migrate. Or to maintain.

I don't think the goal should be to migrate everything, everywhere,
all at once. Nobody can tackle the migration this way. I would
recommend to migrate incrementally, ideally spreading the effort on
multiple people. One way to do this would be to ask people to migrate
a function to libdi instead of adding a new feature to igt_edid if
that's not a lot more work. Another way would be to freeze igt_edid
after a given amount of time.

> > I kept the parser delta here minimal so it won't get in the way of that
> > migration:
> > - 1/3 isolates the check behind igt_is_edid_hdr(data, size), fixes two
> >   OOB/overwrite bugs in the CTA loop, and adds unit tests in
> >   lib/tests/igt_hdr - leaving a single tested function to swap over
> >   when libdisplay-info lands.
> > - 2/3 is ~38 net lines reusing lib/igt_edid.h's edid_dispid structs to
> >   pass DisplayID 0x81 CTA blocks into the same CTA helper, unblocking
> >   kms_hdr on DisplayID 2.0 eDP OLED panels today.
> > - 3/3 switches kms_hdr invalid-hdr to /dev/kmsg (no EDID changes).
> >
> > Would you be open to landing this series in the meantime so DisplayID
> > HDR panels aren't blocked while IGT figures out its libdisplay-info
> > path?
>=20
> I'm not an IGT maintainer. I don't make the decisions. I'm only
> commenting on what I personally view as a gradually happening train
> wreck. Nobody's causing the train wreck, and everyone is. *shrug*.
>=20
> Cc: Simon, maybe we could nerd snipe him to add the scaffolding to use
> libdisplay-info. :p

I've sent a small patch to convert igt_hdr, and it also happens to
supersede this patch for free:
https://lists.freedesktop.org/archives/igt-dev/2026-November/118994.html

I won't be able to spend a lot of time on this, but I would be happy
to reply to questions, provide some support and perhaps send an
occasional migration patch from time to time.

Simon
