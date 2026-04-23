Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C953F9934C
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 09:21:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BE4910E0C1;
	Thu, 23 Apr 2026 09:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="M19zy6ak";
	dkim-atps=neutral
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63F810F00A
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 09:21:41 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id
 d75a77b69052e-50d87c138e1so66362441cf.1
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 02:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776936101; cv=none;
 d=google.com; s=arc-20240605;
 b=ZOKAKAkCrwAdSl9RcgOuypzZUn7hN1ozCyMMoI9Pbzj1QMq9bd1agwP1UXsqZD/Aj/
 FsaEN5kujPk3poOh5+czlYAbCDa9HtspvdBEwe0pXBUGv5NsvetWZpIOuQxvvF1tM18t
 O3/Lpq/nsvL67JwMM7GyRs1vfXelD3cWxzdiu5N31AjSUI1TTJ2P5aFYfq6+0pDq7uUL
 bVAeFFTq0kL4DYyEtPJ7bHG94PdbTIcMfmOVFYeTy4dYrXGv2JsDe9WkFvFgzQN0ob2g
 agejWY2uh8uVplStmE/ELRMk8vz10zeLqsN0bi10wd9Wz/R7RDWzb5GTRVwm8D6b9f87
 WOpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=DZ38r0I2HLOIY7qtXaEOI4FrdqvuL3W+pFAMGc/dG1g=;
 fh=e+Gl9dwJBKBVft3hqKqPGVMzFBgUFyH8nO8hlodb/Gs=;
 b=AZxMBfIdpj8XwjJgLBQgQ2Qzr4NYe5IsLpeNZBfFU3bHG/xJY4f5kZqx3FUGVbgWHg
 oOybyQhqFaR5+eIKS/5qyO6OCKcmq+o+PQ/G8xtqXVlpVcxxUVsaS7yDRTXkhnOuAALf
 8SjhYLTNw3/+FqSDVVDIcDMqcUWNEYhLGTeIhqUqgIsejSey2tmTetP0LiPzm5FKun3t
 qa+lu04nvrHqvHNUUv46SAPSiy+DhDVJSszXP8wkzhGkYiXyvC0kE8bdu2OG6parupt8
 Z+pU41esIYMQV3kkhJeGeMuUGwB569DhXWbTWdXmCrI7KYW7tZsVALAElnLVozdvGjuW
 X8Gw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776936101; x=1777540901;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DZ38r0I2HLOIY7qtXaEOI4FrdqvuL3W+pFAMGc/dG1g=;
 b=M19zy6ak08p/sH0eHQgOZKeOmUQdCcYj/ZUlbOYzZa21Ku06q4IAPohc6N71Q+Xv+2
 8Ti77VXqetDsOBojcO4J2fEhp/Qqa+pQ1fTQh93gaLLcGHRb35oNtCVgZ26TgDMUEvfs
 f3a9q6SqM4se5Zm/BhmD8D49xWGEFrqZQmKc88cMa/0bcajJR0ucFbr6dwBQ8avn1dLN
 Tkmw65CNX3qKKuSAXh/NzGMFAO/3K98qPTkAIwk/MBpy+uiXw1iPFs+sZuwhyJl03Ost
 oE+nW8lyHXWgJFjTW4FtbILUdpqgqfy0MxXmc7Ic45pqp21WG9OR6sKLIUQw9xLjTqTT
 BIAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776936101; x=1777540901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DZ38r0I2HLOIY7qtXaEOI4FrdqvuL3W+pFAMGc/dG1g=;
 b=aMe4v5oozys9dGd6ou8Kxs1l/aLZBTDwXZZF4dyyPZ9mWWF6+DWqsuzSru205g2CWF
 dRItYyFerqdpniu8GwPCXKixyHWKuX53qKrbzVFyuNLM3KN67AxeBbuTjDjoQ6bqx1Lc
 in/igtposubldE63j96uMK51ROpWcy55fWMucbyX1rxLYR1c1GmPZiOAI7lAcvQwHEzl
 hSlHodDro2al2QU1pHxsZwyrdtiE1bPs+JXagChFdJvbL5yuutSXAd0GN3s/ZpYKAP9g
 ipXncxy4WLqm8Rt/xHeUBVmzHBcLW0Xb1HJzftUwEeugANNu3hsXDIY7F57co/fvKQFP
 v63g==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Q7gBUx9n9oYKOWvZxW67tUGUTVdXm2i6vVVlI8wGPI2k5NOdW7OzUoma67GGqyt8WIERfGgUo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzxQxjB6C5DLd5BM0kQIPzuBXxYoKHNyHg96Fl24j8zz2vMQf9
 2LXYiSMxH8E/mt2gyaIT+Egg6WhuUcmbiEKrDnux+lcUVrgu3W7iBfPE9YkQvkewDC9O+k2BgVZ
 qe5Q1uaB+iaDkmOlbJfXgebCm07D7aF+gmMhVBxMn
X-Gm-Gg: AeBDiev2lLNCmFk/8zzstNLaEFjXA639/NYfLWbsUVpvrfcrNJQU11RiCYnlRHsAHo8
 bZwRxMnmnQo2Ox5u1vUhYy2PjTJVWIyHhwV7QpLFZ83BZ+CceC75sBgVLRth4zVkSqu24iuEPa3
 bw9nAyfODTrRDYxlN3NK5EeNiPpmTlvfenVGj+3upahmoVfPozugs1e07QHMCbkTb5aF0ptWoU4
 J40XSGYVSg+enr9NAdKlXWoFYc3acQT0xfNum+/yM0SknqZOxloR7S1SjAnKuL5a/uyCLhhcuLQ
 xvohG3iGRn4G1Twc1fl8EoK65Rg=
X-Received: by 2002:ac8:5851:0:b0:50e:fcbc:6b82 with SMTP id
 d75a77b69052e-50efcbc6ed3mr210953641cf.15.1776936100294; Thu, 23 Apr 2026
 02:21:40 -0700 (PDT)
MIME-Version: 1.0
References: <b4757a01-6cff-4c92-b7ba-5a6578c7c06a@intel.com>
 <20260421064342.2851479-2-jingpingjan@google.com>
 <eb51511e2445b2cd19dda662bf1f402ed92887e1@intel.com>
 <20260422170557.434ohgvhvjzqmrws@kamilkon-DESK.igk.intel.com>
 <aekEACGEcS2QGQgV@intel.com>
In-Reply-To: <aekEACGEcS2QGQgV@intel.com>
From: Jing-Ping Jan <jingpingjan@google.com>
Date: Thu, 23 Apr 2026 17:21:02 +0800
X-Gm-Features: AQROBzAOYwTWTT86ZqCIxnIiNqWyX6YimA1TLV0CNsqIKZcFNWx4TR3-FjWXEho
Message-ID: <CAMYCwo5YH+WBOGbDu4uVPgRkQ_N1T3bTZ2fdUSMa7dr+Jvzjqw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms: correct index validation logic
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
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

On Thu, Apr 23, 2026 at 1:23=E2=80=AFAM Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Wed, Apr 22, 2026 at 07:05:57PM +0200, Kamil Konieczny wrote:
> > Hi Jani,
> > On 2026-04-21 at 15:02:01 +0300, Jani Nikula wrote:
> > > On Tue, 21 Apr 2026, Jing-Ping Jan <jingpingjan@google.com> wrote:
> > > > Based on the original implementation and the comment above the func=
tion,
> > > > it appears the expected behavior is for the plane indices to remain
> > > > consistent with those in crtc->planes. Therefore, after swapping th=
e old
> > > > and new primary planes, we must update the index in igt_plane_t to
> > > > ensure it matches the corresponding index in crtc->planes.
> > > >
> > > > Therefore, we should expect the indices of the old and new primary
> > > > planes to remain unchanged after swapping them.
> > > >
> > > > Fixes: ac37e1174cc4 ("lib/kms: Pimp the primary plane swapping")
> > >
> > > With Fixes: it's customary to Cc the author and reviewer(s).
> > >
> > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> > >
> > > > Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> > > > ---
> > > > v2:
> > > >   - Add Fixes tag to the commit message.
> > > >  lib/igt_kms.c | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > > > index bec96f267..405a04640 100644
> > > > --- a/lib/igt_kms.c
> > > > +++ b/lib/igt_kms.c
> > > > @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t =
*display)
> > >
> >
> > Lets have for simplicity simple struct { char name; int index; }
> > and old -> { A, 0 }, new -> { F, 7 }
> >
> > > The whole context here is:
> > >
> > >                     if (new_primary->index !=3D 0) {
> > >                             igt_assert(old_primary !=3D new_primary);
> > >
> > >                             igt_assert_eq(old_primary->index, 0);
> > >                             igt_assert_neq(new_primary->index, 0);
> > >
> > > >                           igt_swap(*old_primary, *new_primary);
> >
> > Now old -> { F, 7 }, new -> { A, 0 }
> >
> > > >                           igt_swap(old_primary->index, new_primary-=
>index);
> >
> > Now old -> { F, 0 }, new -> { A, 7 }
> >
> > Or do I miss something?
>
> The problem is the pointers weren't swapped.
>
> [0] =3D { 0, A } <- old
> [1] =3D { 1, B } <- new
>
> step1: full swap
> [0] =3D { 1, B } <- old
> [1] =3D { 0, A } <- new
>
> step2: index swap
> [0] =3D { 0, B } <- old
> [1] =3D { 1, A } <- new
>
> So after this I think the proper fix is to also swap the pointers.
> Then the asserts after the swap start to make actual sense.
>
> step3: pointer swap
> [0] =3D { 0, B } <- new
> [1] =3D { 1, A } <- old
>
> >
> > > >
> > > > -                         igt_assert_neq(old_primary->index, 0);
> > > > -                         igt_assert_eq(new_primary->index, 0);
> > > > +                         igt_assert_eq(old_primary->index, 0);
> > > > +                         igt_assert_neq(new_primary->index, 0);
> > >
> > > Why do you expect these to remain the same as before the swapping?
> > > That's why we are swapping.
> > >
> > > >                   } else {
> > > >                           igt_assert(old_primary =3D=3D new_primary=
);
> > >
> > > --
> > > Jani Nikula, Intel
>
> --
> Ville Syrj=C3=A4l=C3=A4
> Intel

I don=E2=80=99t believe swapping the pointers is the right approach.
Currently, old_primary and new_primary point to the first element and
the original primary plane in crtc->planes, respectively. Swapping the
pointers merely redirects them without addressing the underlying data
structure.

According to the original design(Commit 58a5a2d5), the logic should
swap the plane indices first and then swap the entire plane objects
between the two pointers. This ensures that the first element in the
pipe->planes array remains the primary plane. Therefore, it makes more
sense to validate that the index of the first element is 0 while the
other index is non-zero.

Alternatively, we could rename old_primary to first_plane and
new_primary to primary_plane to make the logic more transparent.

Regards,
Jing-Ping Jan
