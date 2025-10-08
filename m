Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0DFCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 14:31:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECB810E833;
	Wed,  8 Oct 2025 14:31:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="YIVMMC7R";
	dkim-atps=neutral
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9DD10E833
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 14:31:49 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id
 d75a77b69052e-4e0302e2b69so125424741cf.0
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Oct 2025 07:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759933909; x=1760538709;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SKljry/NYekJL7jL7enDe+yfUCK5Kikvn3pZyWOXcSY=;
 b=YIVMMC7RuVXZ8/Y0MMG0d6s/17O3qSuaW7qAEA7+yRmQzrtDLVyaw0/KfISwS8XBsC
 t6u4lr3mznD1wz3PZdcoMAmztV1TX4Ro5MIMsM9S879URLjHmqixgzXqYNKpRCr0MfDQ
 w8teoj7mQXqNKpnq2HYt9cINO9fXAJTSAYM11xfGKwJqsSmHk6Uq1tYvmVnCf8+Iwx8x
 E5gPnUAKirmTpPueutzJk7O7AKzyncSbDTkMshIbFp1FQlOiZqlqazmMS1MA41mGCFRG
 UhtSkKnDWL3uSmyjodeRdu/U7Brk92d1XZryMHuThvb2F4G0DJgWzfpUiuYJwF2hSdn4
 QwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759933909; x=1760538709;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SKljry/NYekJL7jL7enDe+yfUCK5Kikvn3pZyWOXcSY=;
 b=k0m1pv3jsnIUQ+csZhSz6YoiAFuWu7K1GLLfofy3e/CkSSvfQkTw29t7ZBvkLi4LmL
 CA34wY4odhIfAk099VtvE+h020A2RCpe42vUrru8J6CN9B8XimDYB3AdUZQNZ+ZKNXIR
 ly8bf7+vbuCpwr5qwkAff0q62eoFPPIh7apcFHnxLJzPQ0mfzqVTlvsz1N4pD8qNPxDA
 lfszmUHJn0H4fq1iVN0qrD0pHFixy2QkimYV13XXBYLfcAPlPzkxts1FAgfDso7G0tUR
 tF7/ABBDLDIkwhThcheJO1bdKHPBBQ1rc1xVcY6t8mg99P5onQymS8t5GxD2XOpzSj/Z
 ch+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUbcjhTknRHdsWYbg3cmAlbRtYt9SnqihkbNwpynGN8DEuxcgQRWv2hzozgWyJydP47QhZfwgv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyTBANDFCn0qDXSeWgv1hYGQEO6bC6KSSVG3ype0G0xoaxxGL0p
 /VD1d9AzC7ISPHDRlx3F1nQEXMh2EOXwTRxmoXNEmbGElUNZShP6DOfUJBJM1MU4Su+OWRMFbIZ
 CL7G1HJoCzeD06hy3WuuN/do9FyHEfGOgawxc+wsl
X-Gm-Gg: ASbGncuzDn5yyggRh+/UXfdmkQ9Sx/KK0qNoS7CDQ1YcZWbmVeMysKpAHPPkshBs3sf
 8FRogLluxXZZlOIsKHGqn67DpJz0pQOHZighk44a6lfaIcxMn7i6ZMJP0yWbWGEKBkETgZxIQum
 8GnN12N/H+8fDw5yeII/TOcbeuuw7XEBF7nEOJFcvwpOIJLBI4VwqTAPVlaPLYMt4mOqI5fRV6l
 iHB14jjuvOJ6ZqUW1rfjNx4eZFsJiJjN04hmV8YGGzZlMyxKiJ0G5HtNj1qeeMGOpUhFikJcI09
 /S3R
X-Google-Smtp-Source: AGHT+IGhFzs6KK78rhqoJRia3fIvZJdr6518vu43RQvS4M+wLGn2WVzZr/9krlf9uh7RVQhT7VjzT2VotI7VeXSZm30=
X-Received: by 2002:a05:622a:250f:b0:4dc:d94f:cbd9 with SMTP id
 d75a77b69052e-4e6ead35acdmr44344271cf.36.1759933908410; Wed, 08 Oct 2025
 07:31:48 -0700 (PDT)
MIME-Version: 1.0
References: <20251001183958.3383532-1-markyacoub@google.com>
 <20251002132105.r2jvf5as72pdywdd@kamilkon-DESK.igk.intel.com>
 <CAJ=qYWQrEiMbA1hkM-hVVTSgJv8-gec7_b6=0yki9CFfMN-_tw@mail.gmail.com>
 <CAC0gqY4kT2K9F=MA574tX+iZ8vCkbx1R=LcvSS18b3sDyKNWzg@mail.gmail.com>
 <CAC0gqY7LpUSTWXvhubQnATV9YLVBtvW3f=u+Z1W6CW9akLzkgQ@mail.gmail.com>
 <CAJ=qYWQZvxu9AGSiDdcWz64xBmtd+3te=4rTOtvX8EJ1L4mRNg@mail.gmail.com>
 <20251008142914.2djm7rsk2mifhwnz@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20251008142914.2djm7rsk2mifhwnz@kamilkon-DESK.igk.intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Wed, 8 Oct 2025 10:31:34 -0400
X-Gm-Features: AS18NWBLQa7yIhkjiryjaYBzIfrHXm6M8VjukjbGBkkjdcGrj2wKPYc3ngXu2zw
Message-ID: <CAC0gqY4hCbnFkVaZhw_rGXUPq_+AR0ohtJZWFhaaRmdxYvDVeA@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms_content_protection: Check for HDCP before
 setting displays.
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>, 
 Mark Yacoub <markyacoub@google.com>, igt-dev@lists.freedesktop.org, 
 louis.chauvet@bootlin.com, 
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

I appreciate it a lot! Thanks!

On Wed, Oct 8, 2025 at 10:29=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Juha-Pekka,
> On 2025-10-08 at 15:03:43 +0300, Juha-Pekka Heikkil=C3=A4 wrote:
> > Hi Mark,
> >
> > I think there was some changes that Kamil was asking for or did I miss
> > something? For the code part things look ok to me, with those changes
> > which Kamil was asking this is
> >
> > Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> >
>
> Thank you all, I corrected subject and descriptions and
> pushed it.
>
> Regards,
> Kamil
>
> >
> > On Tue, Oct 7, 2025 at 8:44=E2=80=AFPM Mark Yacoub <markyacoub@google.c=
om> wrote:
> > >
> > > Hello, friendly ping on this. thanks!!
> > >
> > > On Fri, Oct 3, 2025 at 10:50=E2=80=AFAM Mark Yacoub <markyacoub@googl=
e.com> wrote:
> > > >
> > > > Hello, just following up on this! thanks Juha-Pekka!
> > > >
> > > > On Thu, Oct 2, 2025 at 1:02=E2=80=AFPM Juha-Pekka Heikkil=C3=A4
> > > > <juhapekka.heikkila@gmail.com> wrote:
> > > > >
> > > > > On Thu, Oct 2, 2025 at 4:21=E2=80=AFPM Kamil Konieczny
> > > > > <kamil.konieczny@linux.intel.com> wrote:
> > > > > >
> > > > > > Hi Mark,
> > > > > > On 2025-10-01 at 14:39:58 -0400, Mark Yacoub wrote:
> > > > > >
> > > > > > remove dot from subject, so it will be:
> > > > > >
> > > > > > [PATCH i-g-t] tests/kms_content_protection: Check for HDCP befo=
re setting displays
> > > > > >
> > > > > > > [Why]
> > > > > > > Drivers such as VKMS do not support HDCP, so the test fails o=
n
> > > > > >
> > > > > > Please decipher VKMS here for more clear description, like
> > > > > >
> > > > > > Drivers such as VKMS (Virtual KMS) do not support HDCP, ...rest=
 follows...
> > > > > >
> > > > > > > `modeset_with_fb`:
> > > > > > > Test assertion failure function do_display_commit, file exter=
nal/igt-gpu-tools/lib/igt_kms.c:4632
> > > > > > > errno: 34, Math result not representable
> > > > > > >
> > > > > > > [How]
> > > > > > > Move the HDCP check before any modesets.
> > > > > > >
> > > > > > > Test: kms_content_protection on AVD with VKMS
> > > > > >
> > > > > > Please make it a sentence and add newline before any cc: or s-o=
-b,
> > > > > > like:
> > > > > >
> > > > > > Tested on AVD (please write here what ADV means) with VKMS.
> > > > > >
> > > > > > +cc
> > > > > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > > > > Cc: Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>
> > > > > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > > > >
> > > > > > > Signed-off-by: Mark Yacoub <markyacoub@google.com>
> > > > > > > ---
> > > > > > >  tests/kms_content_protection.c | 16 +++++++---------
> > > > > > >  1 file changed, 7 insertions(+), 9 deletions(-)
> > > > > > >
> > > > > > > diff --git a/tests/kms_content_protection.c b/tests/kms_conte=
nt_protection.c
> > > > > > > index 51fc1d3be..effeb66dc 100644
> > > > > > > --- a/tests/kms_content_protection.c
> > > > > > > +++ b/tests/kms_content_protection.c
> > > > > > > @@ -638,22 +638,20 @@ test_content_protection(enum igt_commit=
_style commit_style, int content_type)
> > > > > > >
> > > > > > >       for_each_connected_output(display, output) {
> > > > > > >               for_each_pipe(display, pipe) {
> > > > > > > -                     igt_display_reset(display);
> > > > > > > -
> > > > > > > -                     igt_output_set_pipe(output, pipe);
> > > > > > > -                     if (!intel_pipe_output_combo_valid(disp=
lay))
> > > > > > > -                             continue;
> > > > > > > -
> > > > > > > -                     modeset_with_fb(pipe, output, commit_st=
yle);
> > > > > > > -
> > > > > > >                       if (!output_hdcp_capable(output, conten=
t_type))
> > > > > > >                               continue;
> > > > > > > -
> > > > > > >                       if (is_output_hdcp_test_exempt(output))=
 {
> > > > > > >                               igt_info("Skipping HDCP test on=
 %s, as the panel is blocklisted\n",
> > > > > > >                                         output->name);
> > > > > > >                               continue;
> > > > > > >                       }
> > > > > > > +
> > > > > > > +                     igt_display_reset(display);
> > > > > > > +                     igt_output_set_pipe(output, pipe);
> > > > > > > +                     if (!intel_pipe_output_combo_valid(disp=
lay))
> > > > > > > +                             continue;
> > > > > > > +
> > > > > > > +                     modeset_with_fb(pipe, output, commit_st=
yle);
> > > > > >
> > > > > > I am not sure if this is correct so I added Karthik and J-P to =
cc.
> > > > > > Karthik or J-P: could you look into CI fails? At least in Xe I =
see
> > > > > > fails in this test.
> > > > >
> > > > > I'm not super familiar with this test but that change look ok to =
my
> > > > > eye. It look like that is_output_hdcp_test_exempt() just moves up=
 a
> > > > > bit as the description stated.
> > > > >
> > > > > Looking at ci history for this test, getting fail on our ci for t=
his
> > > > > test probably doesn't mean so much:
> > > > >
> > > > > https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13852/shards-all.=
html?testfilter=3Dkms_content_protection
> > > > > https://intel-gfx-ci.01.org/tree/intel-xe/shards-all.html?testfil=
ter=3Dkms_content_protection
> > > > >
> > > > > The fail with/without this change look the same.
> > > > >
> > > > > I'll need to take AR for myself on checking why our own drivers a=
re
> > > > > not able to pass this test.
> > > > >
> > > > > /Juha-Pekka
> > > > >
> > > > > >
> > > > > > >
> > > > > > >                       igt_dynamic_f("pipe-%s-%s", kmstest_pip=
e_name(pipe), output->name)
> > > > > > >                               test_content_protection_on_outp=
ut(output, pipe, commit_style, content_type);
> > > > > > > --
> > > > > > > 2.51.0.618.g983fd99d29-goog
> > > > > > >
