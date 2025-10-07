Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF37CCA470
	for <igt-dev@archiver.kernel.org>; Tue,  7 Oct 2025 17:44:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B2010E19E;
	Tue,  7 Oct 2025 17:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="RVQWHliC";
	dkim-atps=neutral
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04C910E19E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Oct 2025 17:44:18 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id
 af79cd13be357-85a4ceb4c3dso628492985a.3
 for <igt-dev@lists.freedesktop.org>; Tue, 07 Oct 2025 10:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759859058; x=1760463858;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fEiFoMV9JXIdrvb0mClOLR4r2XTRfU12cJlsyIkWGWw=;
 b=RVQWHliCyPAiEgpOT7wV4zYFWGpI5sp8w8+mzQZcUxLoEkaMmpG0ZYOgt206RS1MNp
 YbZbUzHK1hCG2c/9N7h0/FUDFj6XaaRRWORRcYSJc4coQWR6nzHfRimlniznPzbdV81p
 tyf9lNZb9Syusps5ktKqQCIDyvh1nfUgzes5KEX3OsMGxFoplndamxzw41QEITmxuTzy
 NWUmoPOd2/SUzcEytbSoxzHJkh+xY6KZ51JRq4l5+uo17e/C7x0zg0fkKtXsIT9hWm0T
 Z3DLDJDwWZbWvsxOsq7oiF36b+TnhwNgkhcmIKIjbZfpuiT+a+HOMOU8OpJp9xxDv2UV
 Yt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759859058; x=1760463858;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEiFoMV9JXIdrvb0mClOLR4r2XTRfU12cJlsyIkWGWw=;
 b=QtWFp+HyiJTR4pXU1h9sM7JM/QyJeLLTBfnQ00dC3sCyD3ZKJZQz62yfN12CxXp7CI
 cXPS6fhiXfS6JXWMYYIzQe9HcuToFjOH09KRQpRdhorwaxh6MlOmvdyorZ0zanhhm7A4
 RKFkma91rUnSadphqH9N3OJFK/rWHHgfDTt6EV3x2LUcOJpDv4FINwgx/ZaH6z/ElSPs
 W5AwV0R7dKw+yEZ1QEXwY5GAAHRy+xPA5r9CtRY+zQZbPUNVku7LBnwAJkNPYG2b7Bp9
 A/6FhnEyAfBYVo8e6k+x9tHZrshpXXD8ne3ifCo2d5n8iUch6UO1/VA8sDvPplXuAuZB
 HjNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrv26YAVvqx27F5U3U8gvozsisaw+Lr3LC/Z7MtBtz+6tG8roM/2T6oWRDteKrpIFWK2y+nTXy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx76OLEaoPa1GF9Si00HhtYb10GkjSKcxd+JvWlRDY5hM52+Cz/
 KzAE6LsIQo03s99X+AJmDKSJLjDihTbo4HbmZ+bykSQ7/AIT4B9ijpHFCpW04oW+PuHqBQLloB9
 z4m+L0Y6txaIU/HRWJjS385QRj5cA481RLxCOG/CS
X-Gm-Gg: ASbGnct2LW6OY0tXDskBGQlCXE4DaDaROmAtRVWIEhuslNmUDpgMLhCUZ67Xl2m3l1D
 CrZXDSOdg5TVT2yPvwxt8eZK5G2WZqoOioIrKUrRbU0Yy58tR6JIRJmKbOzNc1BsHENOpiNlwb6
 75JE0CapBbaOcGcvPE1j07hCFZmfdd3tq8DqNxESanLs7lQ7vK7O2C5peousLsOov7XPz2/2OZP
 brERFVyIf81C7JeAmdAC+Tn2L7THpRmR1R8xGS2FEDcmU0y3v+c2B09+7V3yUKu+uSzIh2h8Y0Y
 zCM=
X-Google-Smtp-Source: AGHT+IGTyou+Um50H7opgwIvkQn4Y6jB81WnJDy1GkTvxyuM6VJE1gxdlMs2NcpOS3iNYm8xYWAeRH6N1cEHzhMHg5k=
X-Received: by 2002:a05:620a:44d3:b0:84a:64f:12b8 with SMTP id
 af79cd13be357-88354ac5cc0mr98559885a.63.1759859057488; Tue, 07 Oct 2025
 10:44:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251001183958.3383532-1-markyacoub@google.com>
 <20251002132105.r2jvf5as72pdywdd@kamilkon-DESK.igk.intel.com>
 <CAJ=qYWQrEiMbA1hkM-hVVTSgJv8-gec7_b6=0yki9CFfMN-_tw@mail.gmail.com>
 <CAC0gqY4kT2K9F=MA574tX+iZ8vCkbx1R=LcvSS18b3sDyKNWzg@mail.gmail.com>
In-Reply-To: <CAC0gqY4kT2K9F=MA574tX+iZ8vCkbx1R=LcvSS18b3sDyKNWzg@mail.gmail.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Tue, 7 Oct 2025 13:44:06 -0400
X-Gm-Features: AS18NWAOnI7AFJdljR9vBpK1zRweE4NjIktMuyYnjIAUUCKCAStt6jZy0TX4cPk
Message-ID: <CAC0gqY7LpUSTWXvhubQnATV9YLVBtvW3f=u+Z1W6CW9akLzkgQ@mail.gmail.com>
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

Hello, friendly ping on this. thanks!!

On Fri, Oct 3, 2025 at 10:50=E2=80=AFAM Mark Yacoub <markyacoub@google.com>=
 wrote:
>
> Hello, just following up on this! thanks Juha-Pekka!
>
> On Thu, Oct 2, 2025 at 1:02=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
> <juhapekka.heikkila@gmail.com> wrote:
> >
> > On Thu, Oct 2, 2025 at 4:21=E2=80=AFPM Kamil Konieczny
> > <kamil.konieczny@linux.intel.com> wrote:
> > >
> > > Hi Mark,
> > > On 2025-10-01 at 14:39:58 -0400, Mark Yacoub wrote:
> > >
> > > remove dot from subject, so it will be:
> > >
> > > [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before set=
ting displays
> > >
> > > > [Why]
> > > > Drivers such as VKMS do not support HDCP, so the test fails on
> > >
> > > Please decipher VKMS here for more clear description, like
> > >
> > > Drivers such as VKMS (Virtual KMS) do not support HDCP, ...rest follo=
ws...
> > >
> > > > `modeset_with_fb`:
> > > > Test assertion failure function do_display_commit, file external/ig=
t-gpu-tools/lib/igt_kms.c:4632
> > > > errno: 34, Math result not representable
> > > >
> > > > [How]
> > > > Move the HDCP check before any modesets.
> > > >
> > > > Test: kms_content_protection on AVD with VKMS
> > >
> > > Please make it a sentence and add newline before any cc: or s-o-b,
> > > like:
> > >
> > > Tested on AVD (please write here what ADV means) with VKMS.
> > >
> > > +cc
> > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> > > Cc: Karthik B S <karthik.b.s@intel.com>
> > >
> > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > > ---
> > > >  tests/kms_content_protection.c | 16 +++++++---------
> > > >  1 file changed, 7 insertions(+), 9 deletions(-)
> > > >
> > > > diff --git a/tests/kms_content_protection.c b/tests/kms_content_pro=
tection.c
> > > > index 51fc1d3be..effeb66dc 100644
> > > > --- a/tests/kms_content_protection.c
> > > > +++ b/tests/kms_content_protection.c
> > > > @@ -638,22 +638,20 @@ test_content_protection(enum igt_commit_style=
 commit_style, int content_type)
> > > >
> > > >       for_each_connected_output(display, output) {
> > > >               for_each_pipe(display, pipe) {
> > > > -                     igt_display_reset(display);
> > > > -
> > > > -                     igt_output_set_pipe(output, pipe);
> > > > -                     if (!intel_pipe_output_combo_valid(display))
> > > > -                             continue;
> > > > -
> > > > -                     modeset_with_fb(pipe, output, commit_style);
> > > > -
> > > >                       if (!output_hdcp_capable(output, content_type=
))
> > > >                               continue;
> > > > -
> > > >                       if (is_output_hdcp_test_exempt(output)) {
> > > >                               igt_info("Skipping HDCP test on %s, a=
s the panel is blocklisted\n",
> > > >                                         output->name);
> > > >                               continue;
> > > >                       }
> > > > +
> > > > +                     igt_display_reset(display);
> > > > +                     igt_output_set_pipe(output, pipe);
> > > > +                     if (!intel_pipe_output_combo_valid(display))
> > > > +                             continue;
> > > > +
> > > > +                     modeset_with_fb(pipe, output, commit_style);
> > >
> > > I am not sure if this is correct so I added Karthik and J-P to cc.
> > > Karthik or J-P: could you look into CI fails? At least in Xe I see
> > > fails in this test.
> >
> > I'm not super familiar with this test but that change look ok to my
> > eye. It look like that is_output_hdcp_test_exempt() just moves up a
> > bit as the description stated.
> >
> > Looking at ci history for this test, getting fail on our ci for this
> > test probably doesn't mean so much:
> >
> > https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13852/shards-all.html?t=
estfilter=3Dkms_content_protection
> > https://intel-gfx-ci.01.org/tree/intel-xe/shards-all.html?testfilter=3D=
kms_content_protection
> >
> > The fail with/without this change look the same.
> >
> > I'll need to take AR for myself on checking why our own drivers are
> > not able to pass this test.
> >
> > /Juha-Pekka
> >
> > >
> > > >
> > > >                       igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name=
(pipe), output->name)
> > > >                               test_content_protection_on_output(out=
put, pipe, commit_style, content_type);
> > > > --
> > > > 2.51.0.618.g983fd99d29-goog
> > > >
