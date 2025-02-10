Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30067C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:21:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67DC10E1E7;
	Mon, 10 Feb 2025 18:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DhtwJ18K";
	dkim-atps=neutral
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D39810E1E7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:21:46 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2fa1c093d6eso5408904a91.0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 10:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739211706; x=1739816506; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u9wq9b0sCexJTX+iksPefmlmHpro8eO6G/INNXQ3eaU=;
 b=DhtwJ18K87kCh/b8JdVLU8M631peEtDqe38GoTE3DPc9aCPE8iTR1mJAXVLAp7smJd
 gWFUtiEDVShwOknFzLvSidrhJxJUsGKZc8LOOb1L4ksHp8FpSnpi+iPkIQ7R36/i4wRI
 TGT8ZSb7jT3RDeWbZjvaqwj5SdGhV9fSnH2L079snGRNi+jpLUPAptfGmYJ6Uewqke7V
 Jx5/GITTrpY2NdY3lgVrvLQO6jXXzsHLJARsb7du5SoSZOgJR7GF9SKlRrA4m3LQDeiq
 Ua/IOWDr5zuqpQ+CmuEsc5n8070iHi0KwZX66+rWoZw4v4gkqla0oFJyXi2lTo0870a1
 XI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739211706; x=1739816506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u9wq9b0sCexJTX+iksPefmlmHpro8eO6G/INNXQ3eaU=;
 b=nfBlHGrk92eVFV6uwo+G9YR0Csxy+DzfcnFFL7c3vES1KkyOGZATd4ExAhHMb5wssE
 VsbTejQAF6QBhdN4pNNOIQNajrXPkSklKz0pxmVeDxZxjwKixLlo0k04/2H2Pg3ZfhYn
 IWxuyO6sTZsaTkU460rO6iYEFvxmB9VG4cXEHlbLy5LK0urd3QKYLiXYId47cPaxD1cC
 mrInqc536Cql3xBFM5sESJzEjFnLEpqEKS+o9WQw3Zhkats+CAecuCq81gm7tpft3VtZ
 uJfEL/tvN1DZRSIoVkelK7fmgnZZ5d+TJmByLKZo3VF+1tnySqO/hFuBn/BrZnVCMg/i
 UqGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4H9qKWtiR6FdfOw4SMET7q2fcEu7K5plQo+5RXMb581uq5ywvfXQSL4Byoru0I0ipv1VEK+zP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+nnuimiZ65GQ7/Jy9umsuiMEyAtOCmyBkhADOrBfrrOJa2c3h
 ZJOyOBkIsNzC9Q6PGbik3TkwSSa5eb1AzH9omsI2/n8pk0kwXhKQDD4Xmvzxm8IGx1f0Afvnpzz
 CNqGr3U/vTV3ADJdYrKiOak7qv84=
X-Gm-Gg: ASbGnctl9XogoVuB0J1OAyMmhibvi9jEsIi4NeXK6IZIpIH1KjLQdtY/CC4rra3SgiO
 Bx7QHecJTFbjWLbLi2nbT1uDNG54tNnpIrn5pdKxN4W3aGLrYZKLov3lXadtd6PBw6tgn30NmNw
 ==
X-Google-Smtp-Source: AGHT+IFDhadqRnzhYBlt88/+Aa2nfupnRCY9Fn2O9q9E1gU3W3OevRXIxbI3U70b1lMUcWQO86nE2tTPCW3d+S16rVw=
X-Received: by 2002:a17:90b:510e:b0:2ee:8430:b831 with SMTP id
 98e67ed59e1d1-2fa23f55c3bmr23731531a91.2.1739211705834; Mon, 10 Feb 2025
 10:21:45 -0800 (PST)
MIME-Version: 1.0
References: <20250207001432.48524-1-matthew.s.atwood@intel.com>
 <Z6otorjM88ECUD-2@intel.com>
In-Reply-To: <Z6otorjM88ECUD-2@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 10 Feb 2025 20:21:36 +0200
X-Gm-Features: AWEUYZmMyPTsrHbhOpwL3wGIqrTqyFuZ48FjDGXBaG6zgVEEr4pucOCzTJsFqJg
Message-ID: <CAJ=qYWRoht3TV3zv6v8LA+cQDVP7SHMT2=45OkZuGniZiyZysw@mail.gmail.com>
Subject: Re: [PATCH v2] lib/pciids: Sync pci id changes for DG2/MTL/BMG/PTL
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matt Atwood <matthew.s.atwood@intel.com>,
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org, 
 matthew.d.roper@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

It's only s-o-b which was missed? I don't think we're doing much on
that other than say "let's be more careful next time". It's not like
reverting does much on it and I don't think we're going to do force
pushes for this, force push would just confuse people. If there ever
come any question question, this thread is found on igt-dev list.

/Juha-Pekka

On Mon, Feb 10, 2025 at 6:47=E2=80=AFPM Rodrigo Vivi <rodrigo.vivi@intel.co=
m> wrote:
>
> On Thu, Feb 06, 2025 at 04:14:32PM -0800, Matt Atwood wrote:
> > There have been several changes to pciids upstream that need to be
> > sync'd into igt. This synchronization is different from the normal
> > process because kernel history differences in drm-xe-next, and
> > drm-i915-next cause conflicts that create conflicts.
>
> I did a s/drm-i915-next/drm-intel-next (i915)/ while applying the patch
>
> But I forgot the -s on both b4 shazam and on git amend,
> so the patch is without my signed off by...
>
> Cc IGT maintainers here to see if there's some correction needed.
>
> I'm sorry for the mistake,
> Rodrigo.
>
> >
> > Sync with the following kernel commits:
> > f9a15b968dce ("drm/intel/pciids: Refactor DG2 PCI IDs into segment
> > ranges")
> > e35ecd95ecf2 ("drm/i915/display: Add MTL subplatforms definition")
> > fa8ffaae1b15 ("drm/xe/bmg: Add new PCI IDs")
> > 16016ade13f6 ("drm/xe/ptl: Update the PTL pci id table")
> >
> > v2: More verbose commit message
> >
> > Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> > ---
> >  lib/pciids.h | 62 +++++++++++++++++++++++++++++++++++++++-------------
> >  1 file changed, 47 insertions(+), 15 deletions(-)
> >
> > diff --git a/lib/pciids.h b/lib/pciids.h
> > index 23f349f65..4736ea525 100644
> > --- a/lib/pciids.h
> > +++ b/lib/pciids.h
> > @@ -717,37 +717,66 @@
> >       MACRO__(0xA7AB, ## __VA_ARGS__)
> >
> >  /* DG2 */
> > -#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > -     MACRO__(0x5690, ## __VA_ARGS__), \
> > -     MACRO__(0x5691, ## __VA_ARGS__), \
> > -     MACRO__(0x5692, ## __VA_ARGS__), \
> > +#define INTEL_DG2_G10_D_IDS(MACRO__, ...) \
> >       MACRO__(0x56A0, ## __VA_ARGS__), \
> >       MACRO__(0x56A1, ## __VA_ARGS__), \
> > -     MACRO__(0x56A2, ## __VA_ARGS__), \
> > +     MACRO__(0x56A2, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G10_E_IDS(MACRO__, ...) \
> >       MACRO__(0x56BE, ## __VA_ARGS__), \
> >       MACRO__(0x56BF, ## __VA_ARGS__)
> >
> > -#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > -     MACRO__(0x5693, ## __VA_ARGS__), \
> > -     MACRO__(0x5694, ## __VA_ARGS__), \
> > -     MACRO__(0x5695, ## __VA_ARGS__), \
> > +#define INTEL_DG2_G10_M_IDS(MACRO__, ...) \
> > +     MACRO__(0x5690, ## __VA_ARGS__), \
> > +     MACRO__(0x5691, ## __VA_ARGS__), \
> > +     MACRO__(0x5692, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G10_IDS(MACRO__, ...) \
> > +     INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +     INTEL_DG2_G10_E_IDS(MACRO__, ## __VA_ARGS__), \
> > +     INTEL_DG2_G10_M_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G11_D_IDS(MACRO__, ...) \
> >       MACRO__(0x56A5, ## __VA_ARGS__), \
> >       MACRO__(0x56A6, ## __VA_ARGS__), \
> >       MACRO__(0x56B0, ## __VA_ARGS__), \
> > -     MACRO__(0x56B1, ## __VA_ARGS__), \
> > +     MACRO__(0x56B1, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G11_E_IDS(MACRO__, ...) \
> >       MACRO__(0x56BA, ## __VA_ARGS__), \
> >       MACRO__(0x56BB, ## __VA_ARGS__), \
> >       MACRO__(0x56BC, ## __VA_ARGS__), \
> >       MACRO__(0x56BD, ## __VA_ARGS__)
> >
> > -#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > -     MACRO__(0x5696, ## __VA_ARGS__), \
> > -     MACRO__(0x5697, ## __VA_ARGS__), \
> > +#define INTEL_DG2_G11_M_IDS(MACRO__, ...) \
> > +     MACRO__(0x5693, ## __VA_ARGS__), \
> > +     MACRO__(0x5694, ## __VA_ARGS__), \
> > +     MACRO__(0x5695, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G11_IDS(MACRO__, ...) \
> > +     INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +     INTEL_DG2_G11_E_IDS(MACRO__, ## __VA_ARGS__), \
> > +     INTEL_DG2_G11_M_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G12_D_IDS(MACRO__, ...) \
> >       MACRO__(0x56A3, ## __VA_ARGS__), \
> >       MACRO__(0x56A4, ## __VA_ARGS__), \
> >       MACRO__(0x56B2, ## __VA_ARGS__), \
> >       MACRO__(0x56B3, ## __VA_ARGS__)
> >
> > +#define INTEL_DG2_G12_M_IDS(MACRO__, ...) \
> > +     MACRO__(0x5696, ## __VA_ARGS__), \
> > +     MACRO__(0x5697, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_G12_IDS(MACRO__, ...) \
> > +     INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +     INTEL_DG2_G12_M_IDS(MACRO__, ## __VA_ARGS__)
> > +
> > +#define INTEL_DG2_D_IDS(MACRO__, ...) \
> > +     INTEL_DG2_G10_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +     INTEL_DG2_G11_D_IDS(MACRO__, ## __VA_ARGS__), \
> > +     INTEL_DG2_G12_D_IDS(MACRO__, ## __VA_ARGS__)
> > +
> >  #define INTEL_DG2_IDS(MACRO__, ...) \
> >       INTEL_DG2_G10_IDS(MACRO__, ## __VA_ARGS__), \
> >       INTEL_DG2_G11_IDS(MACRO__, ## __VA_ARGS__), \
> > @@ -782,9 +811,12 @@
> >       INTEL_ARL_S_IDS(MACRO__, ## __VA_ARGS__)
> >
> >  /* MTL */
> > -#define INTEL_MTL_IDS(MACRO__, ...) \
> > +#define INTEL_MTL_U_IDS(MACRO__, ...) \
> >       MACRO__(0x7D40, ## __VA_ARGS__), \
> > -     MACRO__(0x7D45, ## __VA_ARGS__), \
> > +     MACRO__(0x7D45, ## __VA_ARGS__)
> > +
> > +#define INTEL_MTL_IDS(MACRO__, ...) \
> > +     INTEL_MTL_U_IDS(MACRO__, ## __VA_ARGS__), \
> >       MACRO__(0x7D55, ## __VA_ARGS__), \
> >       MACRO__(0x7D60, ## __VA_ARGS__), \
> >       MACRO__(0x7DD5, ## __VA_ARGS__)
> > --
> > 2.45.0
> >
