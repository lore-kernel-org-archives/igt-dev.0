Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3039CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 12:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A521310E7D7;
	Wed,  8 Oct 2025 12:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dMOkbloB";
	dkim-atps=neutral
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AF610E7D7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 12:03:55 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3322e63602eso9531841a91.0
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Oct 2025 05:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759925035; x=1760529835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BuQmDjTmYJg78y7y3jZXUrRuJ2KfGHYWqc512mbcWTs=;
 b=dMOkbloBxRfH5so8gy6TcnMhvrEB1bvqJu8WzEda1T04U1t+l0B+iJArvupyUaGMmn
 PxPxBqQioO9SsF+asPU6KNlc123NBrv9qFhj5n+MpOTf7TISmytc/XAKJhO0JMXK4o7P
 YjeZwDN3cSZOPQ4yFwUTUG94RUnZ6cBjcqZ7y9Cxlpd3SHRsMWgbPTUQX56fAsjFEQCj
 /7mxVwC8aHOVVknZUpQ6M3ccMIAncop8gG1OY9gmukuPLHVkmfUQFLArCzIoN+0Y/yCS
 j79rXJBTVJCivgGoT+wJpccsoHfedH9uqZMAptkSUCEk1m/HmbRMUDCJtYectEh4PuOr
 ZORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759925035; x=1760529835;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuQmDjTmYJg78y7y3jZXUrRuJ2KfGHYWqc512mbcWTs=;
 b=f7ypRPEkRBTHk7OJT+MTzpnFXGasLK47VbvhwEeJifqAoNG+U543bjIy6FkMaWOhc4
 aJoDlCUiBw4+3/+AZJ2tExiDFaFe8rN9RVBxfuZIJ2lWQgeCCyXtiMR570vhvZkYeFgj
 V+/1GDJwmViy+L3rIgLxQJ/3e4eG8Qj97kmBf8RjUd6oa82870HnlLINtoZGqXXzI9Bi
 LdHTNEpt61j5+nqC7kP6WPNbWI82vm+TDA71UEsoeK/npQ0hqdpqnpbvjiNgomF8+DpF
 PG1R7e8sFNf1iFTSXvAVpv3QjbzOtDM8FTwNFMMZcosayWcXShXdpP3ovUYa4hovCAUW
 NGKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8r+4UcKQoEA2Cn7r7H/1Zn/p5y9aDpOwVBb/b5QmIfEQlP0knWz8GmbpRJ+avkULaasIXLXnq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ3YET9dGf7rLLbw0REg0L4Qyou3zuiwWIl0oKwz+VE4U4LLgm
 lLwHuUI0MmwAtenmTwGVE0xhqHNetrsb6WJOUirwcXD9X6YRQzmITCaHK8u30idZH6quYarDQJu
 K6dn8YEw5WwbwjLZZFv0qmhLfzLWrSu2OY2JD0OzXqA==
X-Gm-Gg: ASbGnctj+ubXKYdfkayLeEFB6VO952ClId7KU+PFDj4j5TpJbF3d0QqcFxgtr0EEWPy
 qYZFEX4i+skbSofeopaF01MLqKkbGFxl/KYEz0KkAwUlBdYzWuPA2TZtxM9+kzgIWqip1QEBJVM
 0ozcnrsf7IrGVeS5vV2KdPrqsirMrMKAtW648X/R5UzUa6HvdkSu82VPqIhPoTf/5Eog6PuIqGN
 kn3dUX7vxM1HNI07CtHBXe/2T+Y2sXBbQ==
X-Google-Smtp-Source: AGHT+IFE+TIsBjOCilRxjNpvAYRXMPQLtuH/5cM4/jciHqJ3gSzET+Jv1n78s4oTNVSTZhqxNqA7NO9FOTYZy3VPq5k=
X-Received: by 2002:a17:90b:1d01:b0:32b:9506:1780 with SMTP id
 98e67ed59e1d1-33b511624e8mr4054844a91.9.1759925034742; Wed, 08 Oct 2025
 05:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20251001183958.3383532-1-markyacoub@google.com>
 <20251002132105.r2jvf5as72pdywdd@kamilkon-DESK.igk.intel.com>
 <CAJ=qYWQrEiMbA1hkM-hVVTSgJv8-gec7_b6=0yki9CFfMN-_tw@mail.gmail.com>
 <CAC0gqY4kT2K9F=MA574tX+iZ8vCkbx1R=LcvSS18b3sDyKNWzg@mail.gmail.com>
 <CAC0gqY7LpUSTWXvhubQnATV9YLVBtvW3f=u+Z1W6CW9akLzkgQ@mail.gmail.com>
In-Reply-To: <CAC0gqY7LpUSTWXvhubQnATV9YLVBtvW3f=u+Z1W6CW9akLzkgQ@mail.gmail.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Wed, 8 Oct 2025 15:03:43 +0300
X-Gm-Features: AS18NWB2mhH6bQ0tjEJzv0aGBsMxA361yQ7-Z_y5cxiZzAEBcb9BzEO4auRwW9o
Message-ID: <CAJ=qYWQZvxu9AGSiDdcWz64xBmtd+3te=4rTOtvX8EJ1L4mRNg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before
 setting displays.
To: Mark Yacoub <markyacoub@google.com>
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

Hi Mark,

I think there was some changes that Kamil was asking for or did I miss
something? For the code part things look ok to me, with those changes
which Kamil was asking this is

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>


On Tue, Oct 7, 2025 at 8:44=E2=80=AFPM Mark Yacoub <markyacoub@google.com> =
wrote:
>
> Hello, friendly ping on this. thanks!!
>
> On Fri, Oct 3, 2025 at 10:50=E2=80=AFAM Mark Yacoub <markyacoub@google.co=
m> wrote:
> >
> > Hello, just following up on this! thanks Juha-Pekka!
> >
> > On Thu, Oct 2, 2025 at 1:02=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
> > <juhapekka.heikkila@gmail.com> wrote:
> > >
> > > On Thu, Oct 2, 2025 at 4:21=E2=80=AFPM Kamil Konieczny
> > > <kamil.konieczny@linux.intel.com> wrote:
> > > >
> > > > Hi Mark,
> > > > On 2025-10-01 at 14:39:58 -0400, Mark Yacoub wrote:
> > > >
> > > > remove dot from subject, so it will be:
> > > >
> > > > [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before s=
etting displays
> > > >
> > > > > [Why]
> > > > > Drivers such as VKMS do not support HDCP, so the test fails on
> > > >
> > > > Please decipher VKMS here for more clear description, like
> > > >
> > > > Drivers such as VKMS (Virtual KMS) do not support HDCP, ...rest fol=
lows...
> > > >
> > > > > `modeset_with_fb`:
> > > > > Test assertion failure function do_display_commit, file external/=
igt-gpu-tools/lib/igt_kms.c:4632
> > > > > errno: 34, Math result not representable
> > > > >
> > > > > [How]
> > > > > Move the HDCP check before any modesets.
> > > > >
> > > > > Test: kms_content_protection on AVD with VKMS
> > > >
> > > > Please make it a sentence and add newline before any cc: or s-o-b,
> > > > like:
> > > >
> > > > Tested on AVD (please write here what ADV means) with VKMS.
> > > >
> > > > +cc
> > > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> > > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > >
> > > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > > > ---
> > > > >  tests/kms_content_protection.c | 16 +++++++---------
> > > > >  1 file changed, 7 insertions(+), 9 deletions(-)
> > > > >
> > > > > diff --git a/tests/kms_content_protection.c b/tests/kms_content_p=
rotection.c
> > > > > index 51fc1d3be..effeb66dc 100644
> > > > > --- a/tests/kms_content_protection.c
> > > > > +++ b/tests/kms_content_protection.c
> > > > > @@ -638,22 +638,20 @@ test_content_protection(enum igt_commit_sty=
le commit_style, int content_type)
> > > > >
> > > > >       for_each_connected_output(display, output) {
> > > > >               for_each_pipe(display, pipe) {
> > > > > -                     igt_display_reset(display);
> > > > > -
> > > > > -                     igt_output_set_pipe(output, pipe);
> > > > > -                     if (!intel_pipe_output_combo_valid(display)=
)
> > > > > -                             continue;
> > > > > -
> > > > > -                     modeset_with_fb(pipe, output, commit_style)=
;
> > > > > -
> > > > >                       if (!output_hdcp_capable(output, content_ty=
pe))
> > > > >                               continue;
> > > > > -
> > > > >                       if (is_output_hdcp_test_exempt(output)) {
> > > > >                               igt_info("Skipping HDCP test on %s,=
 as the panel is blocklisted\n",
> > > > >                                         output->name);
> > > > >                               continue;
> > > > >                       }
> > > > > +
> > > > > +                     igt_display_reset(display);
> > > > > +                     igt_output_set_pipe(output, pipe);
> > > > > +                     if (!intel_pipe_output_combo_valid(display)=
)
> > > > > +                             continue;
> > > > > +
> > > > > +                     modeset_with_fb(pipe, output, commit_style)=
;
> > > >
> > > > I am not sure if this is correct so I added Karthik and J-P to cc.
> > > > Karthik or J-P: could you look into CI fails? At least in Xe I see
> > > > fails in this test.
> > >
> > > I'm not super familiar with this test but that change look ok to my
> > > eye. It look like that is_output_hdcp_test_exempt() just moves up a
> > > bit as the description stated.
> > >
> > > Looking at ci history for this test, getting fail on our ci for this
> > > test probably doesn't mean so much:
> > >
> > > https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13852/shards-all.html=
?testfilter=3Dkms_content_protection
> > > https://intel-gfx-ci.01.org/tree/intel-xe/shards-all.html?testfilter=
=3Dkms_content_protection
> > >
> > > The fail with/without this change look the same.
> > >
> > > I'll need to take AR for myself on checking why our own drivers are
> > > not able to pass this test.
> > >
> > > /Juha-Pekka
> > >
> > > >
> > > > >
> > > > >                       igt_dynamic_f("pipe-%s-%s", kmstest_pipe_na=
me(pipe), output->name)
> > > > >                               test_content_protection_on_output(o=
utput, pipe, commit_style, content_type);
> > > > > --
> > > > > 2.51.0.618.g983fd99d29-goog
> > > > >
