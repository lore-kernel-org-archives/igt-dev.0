Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DC4CCD184
	for <igt-dev@archiver.kernel.org>; Tue, 21 Oct 2025 08:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F076110E591;
	Tue, 21 Oct 2025 08:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="l+X1Ey2j";
	dkim-atps=neutral
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFF210E391
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 09:50:47 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-930ae1b2627so2646987241.2
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Oct 2025 02:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1760953846; x=1761558646;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pLrJ1eKK1yfwgoixcaM3sqGYA3l6lioJeU6g8/Fg6TI=;
 b=l+X1Ey2jEEIJsswnWUGO1NGZyexTQ+lQnzT0QJESxOr3er9qhB5YbfQLznMEwyiT9/
 PZ+C9J4M8x3Vm3gVwf68vW4pYfDCSt57gruM8cfhLQEshSHz9LFLaUjTfBtJ6QP361xH
 yMV4ym46oZH3GLw5Gv92mNPwylPIORTXR7HxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953846; x=1761558646;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pLrJ1eKK1yfwgoixcaM3sqGYA3l6lioJeU6g8/Fg6TI=;
 b=vyAJCoBKkxKsInk4sYetNCc9o4sipgL0WOPs7dJr41Nwp9hUQkrykO4ECLIq6Rlglj
 Hgd7xCIOLwnemIh/NYZvf9hFWKxibGNAP/+s2u0F5tuYkopdVC8vTRzDmydpxCLoVn5D
 ZGeOxMz+CYswSWUsDvtZqnwQeLV9f/jCblpo75Ta81HwnIf46SJN6qiz88i7NUOMlTsp
 VrvTnUIp/58VOYer4GhPTdkuAZHFMLGsFJlP8MOM0pUGj/m6DA3uujm/si5vyYSd1L+c
 /e1ptDoA47tt8MswPTMJchvF7+e1s4TcxZxGUJ6EfW+FBgz3OhF85MshW3S2I4bCca8h
 eZQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVpbQS1JrZq06G7wGyIL7hn4P8oOTK7FGESF2iKiF0gjgoD4/q8qZJ46o3kib1rRcrxdyLw9nP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/7BlOo3cndoN5jcDHCiYdQ5hoC36iBHHb64wPRUZUvWQTD2UD
 Hm56Boj+fPFgnByYKukpUYAFxqFLwtAJZ1kNlN/kwr1rLxccXpa4Sxgdi2fgkquP8jd8EcXTzbI
 skWEx/6VC7NYLZ9QbXpQ1B2qWV4wTcFbipgYAW4PU
X-Gm-Gg: ASbGncuuOTQxMwaPxZXH8/7Fa0gL5aGpemh/4rTY7VzjwGfD4SBTulrPi2lIKD4avd5
 QNLY+TLO4tVDzVbTlS4j92xRQjL2c0cglt03SNa73QyAMmO/GVcILJ735+8WSljEPb5MyHyOI06
 4YoiHWKVE7LvEdZ3Tc3xn1sAL2bib026DuyN/8cNGF71NWyT79a1GAWa2Y39nAoBhJ6G6nDoG92
 Sw9SD9kaGkrCfyjSM/ISXgJ7V554vmrRSPtCzhkdc3aKR/0vAQatBG0AmQlCzzFZdMTgm51ymlA
 4mcLl+i1Qu3fWDCLFgIWGV1ugg==
X-Google-Smtp-Source: AGHT+IEexIjx6T/678Lzmc4XDULIys8tCDgAg2T6F+p3mXEZncA9LBdZ42Sm1qGVonLqbuuxq/ZPL8grDfBNkSsBUXQ=
X-Received: by 2002:a05:6102:548b:b0:521:356e:2883 with SMTP id
 ada2fe7eead31-5d7dd4288c3mr4070201137.7.1760953846140; Mon, 20 Oct 2025
 02:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251012171459.3773990-1-jason-jh.lin@mediatek.com>
 <1fe5cad9c4fe83c20cbc86135fab174d4055e0b4.camel@mediatek.com>
 <CAC0gqY46coQAzqDaRuBxhzAbLPH3Fn_yapb+RJ6pZf9ByAhrGQ@mail.gmail.com>
 <20251016144521.vqihx7ewu3z4clki@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251016144521.vqihx7ewu3z4clki@kamilkon-DESK.igk.intel.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 20 Oct 2025 17:50:10 +0800
X-Gm-Features: AS18NWC-L2q9POLYGsSwK5Rr7T0eKb8c2MMxglTSfqUFkwh-1dA0ASuYTCHyL1Y
Message-ID: <CAJ66y9HV=kiPnxV-k47anps-_hQ0Lg-bfzQV7CyPUs9E0y+S_g@mail.gmail.com>
Subject: Re: [PATCH i-g-t 0/6] Add MediaTek devices support
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, 
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 =?UTF-8?B?UGF1bC1wbCBDaGVuICjpmbPmn4/pnJYp?= <Paul-pl.Chen@mediatek.com>, 
 "markyacoub@chromium.org" <markyacoub@chromium.org>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>, 
 =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>, 
 "gildekel@google.com" <gildekel@google.com>,
 Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 21 Oct 2025 08:12:55 +0000
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

On Thu, Oct 16, 2025 at 10:45=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mark,
> On 2025-10-16 at 09:50:14 -0400, Mark Yacoub wrote:
> > Hello maintainers,
> > These patches are needed by the MTK team to make IGT run on their platf=
orm.
> > I will ask a team to google to do the reviews. But feel free to interje=
ct
> > at any point if things don't look right to you.
> > Thanks!
>
> Thank you, I already looked into them and asked Karthik and Swati
> for help. Also I did see Jani checked last patch so it should
> proceed with a help from google team as I only acked few patches,
> it would be nicer to have r-b.

Hello, a Google team member here. :)

Patch 1 to 4 LGTM. Since there'll be next revision for patch 5 and 6,
I'll wait and give my R-b then.

Regards,
Fei

>
> Regards,
> Kamil
>
> +cc Karthik and Swati
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
>
> >
> > On Thu, Oct 16, 2025 at 12:11=E2=80=AFAM Jason-JH Lin (=E6=9E=97=E7=9D=
=BF=E7=A5=A5) <
> > Jason-JH.Lin@mediatek.com> wrote:
> >
> > > Hi Kamil, Juha-Pekka, Bhanuprakash,
> > >
> > > Could you please take a moment to review this series?
> > > Your guidance will be very valuable. Thanks!
> > >
> > > Regards,
> > > Jason-JH Lin
> > >
> > > On Mon, 2025-10-13 at 01:13 +0800, Jason-JH Lin wrote:
> > > > This patch series is aimed at extending IGT GPU Tools support for
> > > > MediaTek devices. The following changes are included:
> > > >
> > > > - Various test case improvements to allow execution on MediaTek SoC=
s
> > > > - MediaTek-specific handling for debugfs, suspend tests, and pixel
> > > > format
> > > >   requirements
> > > > - Improvements to EDID parsing and content protection logic for
> > > > better
> > > >   cross-platform compatibility
> > > >
> > > > Jason-JH Lin (6):
> > > >   tests/kms_hdr: Use original 512x512 fb size on devices without
> > > > scaler
> > > >   tests/kms_plane: Add support for planar-settings on non-Intel
> > > > devices
> > > >   tests/kms_pipe_crc_basic: Use SUSPEND_TEST_DEVICES for MediaTek
> > > >     devices
> > > >   lib/igt_kms: Add support for mtk_current_bpc debugfs in bpc-switc=
h
> > > >     test
> > > >   tests/kms_content_protection: Add MediaTek device support
> > > >   lib/igt_edid: Fix monitor name parsing and trim EDID string paddi=
ng
> > > >
> > > >  lib/igt_edid.c                 | 13 ++++++++++---
> > > >  lib/igt_kms.c                  |  2 ++
> > > >  tests/kms_content_protection.c | 11 +++++++++++
> > > >  tests/kms_hdr.c                |  6 +++++-
> > > >  tests/kms_pipe_crc_basic.c     |  8 +++++++-
> > > >  tests/kms_plane.c              |  8 +++++---
> > > >  6 files changed, 40 insertions(+), 8 deletions(-)
> > > >
> > >
> > >
> > >
> > > ************* MEDIATEK Confidentiality Notice
> > >  ********************
> > > The information contained in this e-mail message (including any
> > > attachments) may be confidential, proprietary, privileged, or otherwi=
se
> > > exempt from disclosure under applicable laws. It is intended to be
> > > conveyed only to the designated recipient(s). Any use, dissemination,
> > > distribution, printing, retaining or copying of this e-mail (includin=
g its
> > > attachments) by unintended recipient(s) is strictly prohibited and ma=
y
> > > be unlawful. If you are not an intended recipient of this e-mail, or =
believe
> > >
> > > that you have received this e-mail in error, please notify the sender
> > > immediately (by replying to this e-mail), delete any and all copies o=
f
> > > this e-mail (including any attachments) from your system, and do not
> > > disclose the content of this e-mail to any other person. Thank you!
> > >
> > >
