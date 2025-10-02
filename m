Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C62FCAC5B8
	for <igt-dev@archiver.kernel.org>; Thu,  2 Oct 2025 17:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DCE10E81C;
	Thu,  2 Oct 2025 17:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HUcmKNAE";
	dkim-atps=neutral
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D8E10E81C
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Oct 2025 17:02:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-267facf9b58so7784875ad.2
 for <igt-dev@lists.freedesktop.org>; Thu, 02 Oct 2025 10:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759424574; x=1760029374; darn=lists.freedesktop.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GgRnLS9U2fGSJJw+Q86izIhncDq72r2z24GDqjmpM68=;
 b=HUcmKNAEGmguGVhGjl02xe5xvnHSy9ypPqvM0SGjClvNJdnwDdWrTS2h73oSXUAYfp
 WueQSOxmKuC2cy2xRZoMBzrNLsBFxih91Twxg8qp+e72fuQ0dCv9sEg9vgXSsZeZEAjk
 DsUJL2cwfQUZHT3wDR+6jWXJhr0Qs+cI79uo8WeLN3N1481YeBsGCX9x/K5oGBYhMQ8J
 4HqogvPKTnYTyCLsD72YEmj6OtJeiVYbDcEDYVokU+RraGlxL5cIHhgU2bumhGR+/wK3
 Mj1/yIPQcRn50wveZkT74FzSAM83fOiZSBMPM1F/v+cp7oc6JiztsVapIhTP21cQktuq
 P9+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759424574; x=1760029374;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GgRnLS9U2fGSJJw+Q86izIhncDq72r2z24GDqjmpM68=;
 b=CcjvyLd0lH5Nd9abCzc+4mcFHkTsHj96qNEjHXGG5SG/tlVbtynWgZ95HWrd/1tdKE
 F0DVdASL3WHEnFLv6YOFUSwE8rkjHyAur6bmq3l2pAwx2CGJMC/YOe55HrIjB/cFenJI
 +bYNKlRiapf5yHfcRPWjdH82V/gNXHXnXCf1AAsGe3rBOJUk3El2ZPLjFv9xmH9bSPWh
 9dgu/10wrjHukzeg7GqK10qsiwmnBE6RNOLTvvsDc7wmjwIi3NC30HO4CWYGKAq996wS
 /k53wOPO26ZPIYUf0JOt4fON3GAd8YxETI5WedB/bVspKcV01RelvL9yPDdOocRQFIhU
 nuFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnuQOtByEcX9u++uA73u7Z4yi0nr8bvbT02uKiueWwCSI5HQtl24DOiSYzHTbfhX3tsLp7fqXN@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGl98ZWff2YuzWzRLiaGGbBshKJAgVcRtAWVJ7Iz3nA+Mc0f9i
 xpJ0PHfU/eQnP985zajstP4lMsBYsmamRvctd8WALVtmspwrEugMh2ukwYV8LgbG/qqHok3nOb9
 djGTEHCgZP6nIHSLQCBdvs5zGst3fudPPsq8wIJDKjw==
X-Gm-Gg: ASbGncsNRPCOE95Bn9rqKvTm0bI9MjBTp2LKhcXe3QAVN3rGRbUanygnedVi+oPzkn7
 gnmD+PR3f0a32khqmDWg5IWHAz3u877ySNMH2YqJe3D0I3fe+AiXrU7Cr7wiDMUxAKyhKCXBIK3
 q2MOH4dhaSfOHzkOb8llu87BYLR6z5uerzbwZ6h+h/otuK6MTjWT7MJ7gfmmXur+wr49zDQA2+5
 FuZN7OBmIjezKSgHDHguGhv7C2MJe2V3w==
X-Google-Smtp-Source: AGHT+IGwR+NxrQX7mkry6+6qCiooY8j1Qj8T033DXttDg7za+DGk8KtGPaVJhkwkzhmxv1dyyRldwFQg4bQ+Wkcxids=
X-Received: by 2002:a17:903:2384:b0:26c:3e5d:43b6 with SMTP id
 d9443c01a7336-28e7f2f4ef0mr93984925ad.32.1759424573013; Thu, 02 Oct 2025
 10:02:53 -0700 (PDT)
MIME-Version: 1.0
References: <20251001183958.3383532-1-markyacoub@google.com>
 <20251002132105.r2jvf5as72pdywdd@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251002132105.r2jvf5as72pdywdd@kamilkon-DESK.igk.intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Thu, 2 Oct 2025 20:02:41 +0300
X-Gm-Features: AS18NWDZQEjJ174nljQWnfOkJJsIDFQyDz6L243hztKziJl-RjZ9SGHA-6YOa0E
Message-ID: <CAJ=qYWQrEiMbA1hkM-hVVTSgJv8-gec7_b6=0yki9CFfMN-_tw@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before
 setting displays.
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>, 
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
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

On Thu, Oct 2, 2025 at 4:21=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Mark,
> On 2025-10-01 at 14:39:58 -0400, Mark Yacoub wrote:
>
> remove dot from subject, so it will be:
>
> [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before setting=
 displays
>
> > [Why]
> > Drivers such as VKMS do not support HDCP, so the test fails on
>
> Please decipher VKMS here for more clear description, like
>
> Drivers such as VKMS (Virtual KMS) do not support HDCP, ...rest follows..=
.
>
> > `modeset_with_fb`:
> > Test assertion failure function do_display_commit, file external/igt-gp=
u-tools/lib/igt_kms.c:4632
> > errno: 34, Math result not representable
> >
> > [How]
> > Move the HDCP check before any modesets.
> >
> > Test: kms_content_protection on AVD with VKMS
>
> Please make it a sentence and add newline before any cc: or s-o-b,
> like:
>
> Tested on AVD (please write here what ADV means) with VKMS.
>
> +cc
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
>
> > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > ---
> >  tests/kms_content_protection.c | 16 +++++++---------
> >  1 file changed, 7 insertions(+), 9 deletions(-)
> >
> > diff --git a/tests/kms_content_protection.c b/tests/kms_content_protect=
ion.c
> > index 51fc1d3be..effeb66dc 100644
> > --- a/tests/kms_content_protection.c
> > +++ b/tests/kms_content_protection.c
> > @@ -638,22 +638,20 @@ test_content_protection(enum igt_commit_style com=
mit_style, int content_type)
> >
> >       for_each_connected_output(display, output) {
> >               for_each_pipe(display, pipe) {
> > -                     igt_display_reset(display);
> > -
> > -                     igt_output_set_pipe(output, pipe);
> > -                     if (!intel_pipe_output_combo_valid(display))
> > -                             continue;
> > -
> > -                     modeset_with_fb(pipe, output, commit_style);
> > -
> >                       if (!output_hdcp_capable(output, content_type))
> >                               continue;
> > -
> >                       if (is_output_hdcp_test_exempt(output)) {
> >                               igt_info("Skipping HDCP test on %s, as th=
e panel is blocklisted\n",
> >                                         output->name);
> >                               continue;
> >                       }
> > +
> > +                     igt_display_reset(display);
> > +                     igt_output_set_pipe(output, pipe);
> > +                     if (!intel_pipe_output_combo_valid(display))
> > +                             continue;
> > +
> > +                     modeset_with_fb(pipe, output, commit_style);
>
> I am not sure if this is correct so I added Karthik and J-P to cc.
> Karthik or J-P: could you look into CI fails? At least in Xe I see
> fails in this test.

I'm not super familiar with this test but that change look ok to my
eye. It look like that is_output_hdcp_test_exempt() just moves up a
bit as the description stated.

Looking at ci history for this test, getting fail on our ci for this
test probably doesn't mean so much:

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13852/shards-all.html?testf=
ilter=3Dkms_content_protection
https://intel-gfx-ci.01.org/tree/intel-xe/shards-all.html?testfilter=3Dkms_=
content_protection

The fail with/without this change look the same.

I'll need to take AR for myself on checking why our own drivers are
not able to pass this test.

/Juha-Pekka

>
> >
> >                       igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pip=
e), output->name)
> >                               test_content_protection_on_output(output,=
 pipe, commit_style, content_type);
> > --
> > 2.51.0.618.g983fd99d29-goog
> >
