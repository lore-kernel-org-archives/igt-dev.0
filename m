Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418BC606A338
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 15:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=emersion.fr header.i=@emersion.fr header.a=rsa-sha256 header.s=protonmail2 header.b=PqtyL3Ix
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74410EEBE;
	Mon, 23 Nov 2026 15:07:56 +0000 (UTC)
Received: from mail-106110.protonmail.ch (mail-106110.protonmail.ch
 [79.135.106.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2A210EEBE
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 15:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1795446406; x=1795705606;
 bh=3Ltnf5Kv4C3bXKJTOo4erR2aguVYypNPFjWR0nS5ib4=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=PqtyL3IxFj2wDkmkvGqCxRaiT+mT8fD2UojCgn3YLacv/jyuN+jfVgtF+yg6fOn1j
 gI1pSXW1VSxIunetWiRYK4oOLORbEL3eC2bEHdTkO1vsLCTJ8hhy4mLexcL8KZXJSu
 RtnvV23auCpi2u7Ydc/5jhvFVkvFgSkMKqMS773zLJ3pc5Gckfz12AxBcRKofxi0le
 NZPoPCyGZu3UCoYk7lWiY6kVBqJc6EhPwveQdnW0JD+bSWWA/e/st06x4EsBIp/g0i
 EWSwaB3zxU7Sl2HpTecwEQbLjPqUwVW66CaZTxrZ2OBw8N4A+JlSHzB7ID/doge7RE
 vL97fMXUBP9HQ==
Date: Mon, 23 Nov 2026 15:06:40 +0000
To: "Knop, Ryszard" <ryszard.knop@intel.com>
From: Simon Ser <contact@emersion.fr>
Cc: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma,
 Swati2" <swati2.sharma@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
 "gildekel@google.com" <gildekel@google.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "markyacoub@google.com" <markyacoub@google.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH] lib/igt_hdr: switch to libdisplay-info for EDID parsing
Message-ID: <_AyHlId1OFTsoV5vKPYws3tD9Eby8_rd9Jho0Sqiae49jcQKNbgWnkdSdJKbzix-27LaZzQMdQR3hHeLo0ICb9ZQXnuR6M8f9yVmDxDA66s=@emersion.fr>
In-Reply-To: <6369f30cf5d7dc9346589d34fe3e3c6bcaa41cbd.camel@intel.com>
References: <20261121115236.124211-1-contact@emersion.fr>
 <no3gurwcnsisfnjvfezh4xub7a6b3jw4wyxjyl4h5wr5rraq6p@gfmxhhez5xm2>
 <6369f30cf5d7dc9346589d34fe3e3c6bcaa41cbd.camel@intel.com>
Feedback-ID: 1358184:user:proton
X-Pm-Message-ID: 3cb238dcca68ccb2eaea5d4b187a144abdc1a9d6
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
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Monday, November 23rd, 2026 at 16:03, Knop, Ryszard <ryszard.knop@intel.=
com> wrote:

> > Please wait with merging as now it will not build in CI
> > on Ubuntu 20.04 and 22.04.
>=20
> Hey Simon. Intel CI still runs on Ubuntu 20/22.04 and RHEL 8 where we
> don't have these libs in the repo - could you make this lib optional
> for now (old impl and new ifdefed with HAVE_LIBDISPLAY_INFO)?
>=20
> We will likely drop distros older than 24.04/RHEL 9 in the near future,
> but it's a pain to maintain a single external lib for those distros :<

Maintaining two codepaths is a bit of a pain. Could we instead use Meson
subprojects for these old distros?
