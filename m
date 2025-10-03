Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5E8CAC5B0
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 14:50:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0910E149;
	Fri,  3 Oct 2025 14:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YV40pzJ/";
	dkim-atps=neutral
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 356F010E149
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 14:50:23 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4dfb1f481ecso29290961cf.1
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Oct 2025 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759503022; x=1760107822;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7a3EnNK4xowVNKUsLyB498K03db5fKlm8TN98lxQRMM=;
 b=YV40pzJ/ZpHUMhHneesOXrTJjalCDszkdW2Y/dIvVmUf6M9Ue7OdRbrEwuvQzpZZUK
 M7y0YPqn3sN3OxpCsGq/ycvgmrRfSA3dmAPAS7e3NHHkz8usS7dTJyewodauDjOJyyZa
 KG3HtyqNT9fkuIJaNLigMRIt56xo6LswNURYJ1Zkpgiu59Y4/7t5EPMe0VlfAuk+08zS
 kXVYQBilVAgw5AdfImV+7/dE2/PYGXzG/u8Jt9/4WBRHcChKgIN/C/0PjIdJTZhXY4us
 TjNPleEu8VeuDSZAxi9FMRFj2muOKIkus/g4XyygIbR6Dd0FjZ1tSjOipn7+N9M4+sP/
 PfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759503022; x=1760107822;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7a3EnNK4xowVNKUsLyB498K03db5fKlm8TN98lxQRMM=;
 b=F1flV+bWyTEXI6//CYTOC+P1E0tKScueKQBer882qo6+xF/YaN1U3n2zrks8tRoe5u
 LaMNm9rQFAyQKcJhTMVF3z6h6q64xo3yZGrSww94DdrenJ2V+wU++85ROepofWv21BAE
 +Bg30lMCqJbzFS9QfFyET7qoTmRDoX3zgHFpEdGMErU1vadbruSCTLf8C0jTGSLaJZ6a
 /V2TLUfw53p7I+SHUXGJSFtw7Ok/I15k1nIB2xTflU5uT2q54rF9OL5zzKyi3aR1AduE
 DEeIaDU8Ma+A+68Y2hG9XUNIAkH+FSnuaewkvBfFebkE8I5VBwFbVJqAaP3ZyWgPlyHY
 naFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6JXomAS52RikHOWcVGV4cv0kVNCVS2+oeFt91pw4R48mN0fGfHkIq/ynIaC1nFdkMkEPGNzBo@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWmUfZ3yC0t0OoplbfH1ww4nuadNkF3jPl2Gn3gebZ70OxaaFk
 QVE/nBs8BDKU9LoO0MVYvF4gV8tPT2z1PfFoqu8CqeaMvF3PJeN8lef+K4d76OOlgVFfQG8twk7
 ZHflUlwfbr6tzbGiy7Zy0kDvA8WPhf2/p+wMk4+cf
X-Gm-Gg: ASbGncuC7SrXo+qvtNyCQjnUjSgN+gVh7E5NFRQl3yWluEgH13qofPXtBc77kekQVsk
 XN1d7HFBwBrtxdLO7NJHunTTmPpMmomKH6DjKaarzFngkePQeqBnwVxccb5CBUHqsghcUv+/QfL
 shafMJa2Oe0JqnC6cl/cDyYugKyXcT9AI9h7pzh82DDNOOKQusaMT0o0LXXRy9c6Tu2/anVdDSi
 i2IVqzLZlwimvn+mxy5nDcV4BTT2E0XjpqAC3OpAkcDmMf/NqvsdDvW6v02Mh63c40D1NQbkZNL
 geQ=
X-Google-Smtp-Source: AGHT+IE/47uad3rRMktBy6yru7OaogVBQfxDHrhah03E+CNAoZnckiQ/edKQGeajHvX/ML1Mng7ZcD55DVtgadKcAas=
X-Received: by 2002:a05:622a:83:b0:4b5:e7e4:ba74 with SMTP id
 d75a77b69052e-4e576b22551mr42695231cf.56.1759503021501; Fri, 03 Oct 2025
 07:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <20251001183958.3383532-1-markyacoub@google.com>
 <20251002132105.r2jvf5as72pdywdd@kamilkon-DESK.igk.intel.com>
 <CAJ=qYWQrEiMbA1hkM-hVVTSgJv8-gec7_b6=0yki9CFfMN-_tw@mail.gmail.com>
In-Reply-To: <CAJ=qYWQrEiMbA1hkM-hVVTSgJv8-gec7_b6=0yki9CFfMN-_tw@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 3 Oct 2025 10:50:10 -0400
X-Gm-Features: AS18NWA6dPveGbuuBzx5lq1A3n0cmd3I5Nfz1TVNZM61rwv6xtz4EkZDrlDQvt0
Message-ID: <CAC0gqY4kT2K9F=MA574tX+iZ8vCkbx1R=LcvSS18b3sDyKNWzg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before
 setting displays.
To: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, louis.chauvet@bootlin.com, 
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

Hello, just following up on this! thanks Juha-Pekka!

On Thu, Oct 2, 2025 at 1:02=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
<juhapekka.heikkila@gmail.com> wrote:
>
> On Thu, Oct 2, 2025 at 4:21=E2=80=AFPM Kamil Konieczny
> <kamil.konieczny@linux.intel.com> wrote:
> >
> > Hi Mark,
> > On 2025-10-01 at 14:39:58 -0400, Mark Yacoub wrote:
> >
> > remove dot from subject, so it will be:
> >
> > [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before setti=
ng displays
> >
> > > [Why]
> > > Drivers such as VKMS do not support HDCP, so the test fails on
> >
> > Please decipher VKMS here for more clear description, like
> >
> > Drivers such as VKMS (Virtual KMS) do not support HDCP, ...rest follows=
...
> >
> > > `modeset_with_fb`:
> > > Test assertion failure function do_display_commit, file external/igt-=
gpu-tools/lib/igt_kms.c:4632
> > > errno: 34, Math result not representable
> > >
> > > [How]
> > > Move the HDCP check before any modesets.
> > >
> > > Test: kms_content_protection on AVD with VKMS
> >
> > Please make it a sentence and add newline before any cc: or s-o-b,
> > like:
> >
> > Tested on AVD (please write here what ADV means) with VKMS.
> >
> > +cc
> > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> > Cc: Karthik B S <karthik.b.s@intel.com>
> >
> > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > ---
> > >  tests/kms_content_protection.c | 16 +++++++---------
> > >  1 file changed, 7 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/tests/kms_content_protection.c b/tests/kms_content_prote=
ction.c
> > > index 51fc1d3be..effeb66dc 100644
> > > --- a/tests/kms_content_protection.c
> > > +++ b/tests/kms_content_protection.c
> > > @@ -638,22 +638,20 @@ test_content_protection(enum igt_commit_style c=
ommit_style, int content_type)
> > >
> > >       for_each_connected_output(display, output) {
> > >               for_each_pipe(display, pipe) {
> > > -                     igt_display_reset(display);
> > > -
> > > -                     igt_output_set_pipe(output, pipe);
> > > -                     if (!intel_pipe_output_combo_valid(display))
> > > -                             continue;
> > > -
> > > -                     modeset_with_fb(pipe, output, commit_style);
> > > -
> > >                       if (!output_hdcp_capable(output, content_type))
> > >                               continue;
> > > -
> > >                       if (is_output_hdcp_test_exempt(output)) {
> > >                               igt_info("Skipping HDCP test on %s, as =
the panel is blocklisted\n",
> > >                                         output->name);
> > >                               continue;
> > >                       }
> > > +
> > > +                     igt_display_reset(display);
> > > +                     igt_output_set_pipe(output, pipe);
> > > +                     if (!intel_pipe_output_combo_valid(display))
> > > +                             continue;
> > > +
> > > +                     modeset_with_fb(pipe, output, commit_style);
> >
> > I am not sure if this is correct so I added Karthik and J-P to cc.
> > Karthik or J-P: could you look into CI fails? At least in Xe I see
> > fails in this test.
>
> I'm not super familiar with this test but that change look ok to my
> eye. It look like that is_output_hdcp_test_exempt() just moves up a
> bit as the description stated.
>
> Looking at ci history for this test, getting fail on our ci for this
> test probably doesn't mean so much:
>
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13852/shards-all.html?tes=
tfilter=3Dkms_content_protection
> https://intel-gfx-ci.01.org/tree/intel-xe/shards-all.html?testfilter=3Dkm=
s_content_protection
>
> The fail with/without this change look the same.
>
> I'll need to take AR for myself on checking why our own drivers are
> not able to pass this test.
>
> /Juha-Pekka
>
> >
> > >
> > >                       igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(p=
ipe), output->name)
> > >                               test_content_protection_on_output(outpu=
t, pipe, commit_style, content_type);
> > > --
> > > 2.51.0.618.g983fd99d29-goog
> > >
