Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D94D7CCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 13:28:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D630310E8FB;
	Thu, 23 Oct 2025 13:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LAko/K+n";
	dkim-atps=neutral
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921E710E8FB
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 13:28:17 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-4e88dbe8b77so7313931cf.3
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1761226096; x=1761830896;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=44QcXyc+0Zawew42Ql11EUo04Z4D2Q13OMQejPTiBSk=;
 b=LAko/K+nkIU4TDABuDIUgClj+YXABjPGbyUxN0ljtjcFCI4yUyM0fkNiYkbp38yJoC
 JPk3zjt2x7Wv2jmLQcyYmLWTv+AyWYAF9al9eD8iD+HcFhtRrKIu70xqkLa9m1T6PKTF
 Qk5/MXiNCxz27E+QqsPrfCCwbxE8s1EU0mA4KKGUh4EF9YLSB1popDmJsZnMD463jph4
 BX/YiioxYgKob6L1ECXE3a4TxatE9uEjpgaA+/4ckoizCrpOe1GFaK7jdthXvKdiUBg3
 nv0Bzy945S+l2fkV0aWY90AWWF2Q2FgRB6+hAqZYhgfTKpRQdvqRGPFyE5EK7kk/Cxar
 hx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761226096; x=1761830896;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=44QcXyc+0Zawew42Ql11EUo04Z4D2Q13OMQejPTiBSk=;
 b=Qa+aTl7d9TYkdHr6ui4/q6/tgHv0Xhd+Njp7lozX2ozHudjyNU+1CmMyWICT+tmo2Z
 RhvU+3ePjcdBJZIDh9MWbHXUDoxZT2X49W5pvyBx6LzhsIYLQMYsV3A2e6tly4Cdv6uR
 ccF2YzNKUNqUqonl1gwx/+s4y6gcpKZs8aARbX/7Hq0d2UrJ8qSS6PsyGRTzhwtdkC7U
 iSGuRJYc0zIUFH1E8GUjo3Wxol3Vyq9xhTHlnm6pL6Hxq7cBc9QYr1shp2E5TSPqVwKZ
 w/HUjqRIdpRZoptSvLmYrPqzJYvewW27e7UkfJ3DienMcOvenk5uGPttU/iUlAex3iZD
 hL5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgOhooHPCft2rn1T98B5SAtoLYPWfM7X7y8GlkkWWM57EiyFes4zSv1yvQ8qV6FWieWc/MjHmd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfCT9Ie4vCQill0GOd7Fq81X2a5oLLNgzgKOkfLTYx3BqXCqiT
 d5fSYY7cDRiCFsRQFoVX6eHy9YkpR9fZP4qkDn76mm2uSxNAJeI5+UYxT6OLDvGX69ZpIfoGywZ
 1Z0A5pxW7eIGyVbNGLXdRUiitByYTAM/dxlcTNEJJ
X-Gm-Gg: ASbGncsozNFc1SYEHG8J/KhrgDZJApFOy89G8/fjSjfRantJ12QHWphixv/GC8itjNY
 Kyx3EnY0Xqz+r3Letq/5/aVP2AirL+Z3cNW4fSkaMA0OTuim71gKUkTTzDfPsGO+3t9aYom1M6/
 5sJG8uhuGggku34pnpbZpLeAao1PhTq/OtJBRuW9Odv2w5Dl3i1gqWjF0348rWZsxosHH5x5caD
 V9SWV6pj1VNqtk25k9F/oMDG7lP1h0U323rIVhsDBG8oXJvCcoyew737Os689NiIWj8vPq7+VyP
 YXnMrEd4egho8JU9bX2u70PFaQ==
X-Google-Smtp-Source: AGHT+IEP+uv3abcu226vkgZ2OZeDG/Be/tqovXwKR/occqHyhb1vrPKvTvxXSM92L9iSsVMmr7azxg16Wz3Uyiwd1Ys=
X-Received: by 2002:a05:622a:10e:b0:4e8:b910:3a7e with SMTP id
 d75a77b69052e-4e8c18d1194mr202249501cf.73.1761226096090; Thu, 23 Oct 2025
 06:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20251021173912.4050926-1-jason-jh.lin@mediatek.com>
 <20251021173912.4050926-3-jason-jh.lin@mediatek.com>
 <CAC=S1ni8gxFJC9Qu6UUx9BtOZUPLgm1vuwHcDe5ZdOw3kO89vQ@mail.gmail.com>
In-Reply-To: <CAC=S1ni8gxFJC9Qu6UUx9BtOZUPLgm1vuwHcDe5ZdOw3kO89vQ@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Thu, 23 Oct 2025 09:28:05 -0400
X-Gm-Features: AS18NWBId18XZR20ptWVIOCSwXDmYvqf6X07scJutMpVXM3ruQOYZ6QrmCP3Cqo
Message-ID: <CAC0gqY6wHwvKzRcKB73n2kWuFXp2+F-Z2hru2vAPTjCmYL9hRQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2 2/5] tests/kms_content_protection: Add "SDC" to
 HDCP panel blocklist
To: Fei Shao <fshao@chromium.org>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org, 
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Wed, Oct 22, 2025 at 4:34=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> On Wed, Oct 22, 2025 at 1:39=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediat=
ek.com> wrote:
> >
> > Add "SDC" to the HDCP blocklist to improve compatibility with panels
> > that do not support HDCP.
> >
> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > ---
> >  tests/kms_content_protection.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/kms_content_protection.c b/tests/kms_content_protect=
ion.c
> > index fcc0023e365f..e056951c92f4 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -141,6 +141,7 @@ __u8 facsimile_srm[] =3D {
> >   */
> >  static const char *const hdcp_blocklist[] =3D {
> >         "DPF90435", /* Example monitor name */
> > +       "SDC",
Just so this list doesn't grow with random acronyms in the future, can
you add in a comment more info about this display. at least which
device it's coming from. Just so it's a bit more meaningful, and maybe
the reason it's on this list.
>
> >         /* Add more monitor names here as needed */
> >  };
>
> A plain "SDC" without additional model identifier looks slightly odd,
> but I guess it is what it is from that monitor's EDID.
>
> Reviewed-by: Fei Shao <fshao@chromium.org>
