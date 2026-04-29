Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461F7FF8873
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 20:38:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EADEF10E3F9;
	Wed, 29 Apr 2026 20:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="B5ss4tZF";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64A210E3F9
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 20:38:06 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-ba60d78aff3so24423266b.2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 13:38:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777495085; cv=none;
 d=google.com; s=arc-20240605;
 b=SvUUta2S3RsyIUOEG4WQ45rFhLBlnFTjRtCA9F9J7NaXDDapEaQ462mN6ImtnLoraC
 yQbUGnWqlLw6TuLTkBJgJl2E3JP+jPE//hV4sfofRqXvEHdnTeV2qJshmG/tPo+HmCEx
 SSH6VA+iFHy/GfS96FjRsgm0kcU5fBOpTUFLq3GGQPcfk0VvjkTymFwc2vyNNnfByFhq
 /f2o5ZT0FDTnpjJxO+HBRRwSUlixoilS3VH33H6Y/97OvWZ1mC5UW/OICHuZvNMqcqu1
 V4UVB/8qsSLJK3jqVdK+Vf4wYulHe6Yrh4ODrGPqo5o10SUd/DyjRQXeo4AU3+V7AEwg
 /BDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=SHUg9BmBKDcbaQY+PAlF06VQyJiSUAYTeqzgOEYp4pU=;
 fh=Vgjo2Q8CTjyFj8x5dp0cxIpl693FuxhZs2UCyQx8awk=;
 b=NUroqjbBHCfucDnTcDeqwO9QbHoSAHhB905lLV+Jm4fgVY8XJpGCKEBeS3zb04D723
 1mlB8JxiTUCCWbfIUTlfsmeO833AFqwvMy6KUgCFQsEbbKAp391VCRBYfauwlaVmEcqO
 oUA/MA0IKwuBaPk/Ttf3vgTgvV0U3Yuczn8hR6Iec9vRuUs7yI7Gx6pD+8O/8AhiCrCz
 IVJTqn/30iA9XWN66e22q8i1oJ2+B6WWugPidfQaIgkE1xNfDQd+ZjIy01jXCUXUMtlE
 B2OusU8GyG1zntZlIyAj333GSvOnvWxsUDXzT/6ev//1ixdeykKiJCFaMHQ4giccLLWQ
 NyYg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1777495085; x=1778099885;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SHUg9BmBKDcbaQY+PAlF06VQyJiSUAYTeqzgOEYp4pU=;
 b=B5ss4tZF9dPfeDsmy9kjiuWdaZtLtwQTNKtot6wAD0VKyLCKaGv8blr16Qk3LQPOdR
 ShURTWbdjehSPpdk6e+BKnSg4DcrO/QeL88IAsh7087kDTxqRhq45NdjQ1e4coGyxnCq
 HQOUeawe31joZGJu+ujO7RzxkjZ6fNxl7XjDX0oOBPkot4STo32RtdNjt4JFMIg0Lz4v
 S8TH89NuvLabmzswyYcbDLUPxQ4EWuNqcpsFB6All5foO6as6SgbUeigReW/E4eXLWg0
 l2fkIPj0njPev5pekalY9gJgUeAI3KBWT/Vzj7Owc5Ro0MHUIaRdfPt4Es+xYubW9mCx
 ExQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777495085; x=1778099885;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SHUg9BmBKDcbaQY+PAlF06VQyJiSUAYTeqzgOEYp4pU=;
 b=r176SoPRZdbFr9cIDyenz7L4V0wCKto3toOdK4Y8APctSBzEfpQApAn4vb9d44VKpY
 EeEqa3mAPorP3pfKQwMeR7LbPV+ZbNCGnilVLzicmHGTBq7bBYHzqaZVfbIRo2uP2bRQ
 VVkWgp7UE8DNQZWdmlnndPEqEbf4W653mz7F+vPo3h9m4bPU1LwKhR8aEvxGcHYVwvPC
 weRP3xR0oK+5E8eE4GifuhNKosfyWdCNTkjB5mDDmG7Sk/DxAyhnA0qXVrgTVQQovGGv
 9/nAcaVjZkx0lggboVeQHXs9C+aQPzpIsaLMlWyDkBCrbt/NxoC3jEK/5teGKFnwGV79
 /qJQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Q31mb8ftNGXbRSkp3gio8vX+/V7f71Fe2Er/ZUPrAK6cxeBabJ06SfBgAzSSYMprvQdKbc8WU@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHz9mcy4GRzjmDLBDN8TiWp+GMMID7iI2tvNPvkZrRyGRcM0BH
 b/dFGdHBcrlI9kHHa1IjoGco7O5qFRqZbbOfNhYIQAaM/Wpkcc5gBr7BniLZehmTn16S6a6uVz3
 zgBa+NnoUevrGGuyUCHkbIq/pW0pbK05v3t+I+K/1
X-Gm-Gg: AeBDietsGnoIfG1k9XzBqc5RtSKpQ7RhafcHmIUw8KhsBCqb/H+iY4XJwhi6LO59TI6
 zGCmzmE6KsuQkV2Yasr4bBob9PzTjtlG6uZUX9DQy5c9ZOk8mtmqVERQt41QdbGmwqAZFrF0giz
 r4W4pK9+qQ9nEnBnurlsAqZG4Xp6998rOj9v+NsVQHQama6/3ty15WjLo6nlitumuPYWHGLCfVM
 5RNQxgeUJod4y3U1e647mbvM3j43DR4EFhcOWAujfcSc83FsAA/2tLqj8EcTrHlBEf+TromVATp
 JMrjB5mNOKrIAVuwQXFLBcgr7dLHYx4m0mnvrNI7G0P7uE8vQWSQv9GDqddSia0lnG30a3S4hn3
 0uqRua3AlxvhNpZZtwTbWQXbbmSQ=
X-Received: by 2002:a17:907:3d10:b0:bb7:eb68:514e with SMTP id
 a640c23a62f3a-bbac7b9a461mr14520266b.36.1777495084759; Wed, 29 Apr 2026
 13:38:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260415015132.2297990-1-jason-jh.lin@mediatek.com>
 <CAC=S1nhr7DFMN-e794MGXp7Nv+LDTQcO4QqG-79XiotFVC7stQ@mail.gmail.com>
In-Reply-To: <CAC=S1nhr7DFMN-e794MGXp7Nv+LDTQcO4QqG-79XiotFVC7stQ@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 29 Apr 2026 13:37:52 -0700
X-Gm-Features: AVHnY4KV8-msnvhxteBgbI8eiuC8B0gv9nA7FzsMuqlLRhicgAoGilYEyZhL9nY
Message-ID: <CAMNLLoQJ3w80Art1VkvYoh4duM5HY2skEH8gztG4TQBWJaUHrg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/kms_invalid_mode: Allow clock-too-high test on
 non-Intel platforms
To: Fei Shao <fshao@chromium.org>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org, 
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="0000000000001f1dcd06509f5367"
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

--0000000000001f1dcd06509f5367
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the patch and for addressing Jani's comments.
This looks good to me.

Reviewed-by: Manasi Navare <navaremanasi@google.com>

@Jani Nikula <jani.nikula@intel.com> @Karthik B S <karthik.b.s@intel.com>
Would you be able to help land this upstream, its required
to run this test on non intel platforms and review comments from Jani have
been addressed.

Thanks a lot for your help on landing this.

Regards
Manasi

On Thu, Apr 16, 2026 at 9:04=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote=
:

> On Wed, Apr 15, 2026 at 9:51=E2=80=AFAM Jason-JH Lin <jason-jh.lin@mediat=
ek.com>
> wrote:
> >
> > The clock-too-high subtest was being skipped on non-Intel platforms
> > because igt_get_max_dotclock() returns 0 when reading from
> > Intel-specific debugfs fails.
> >
> > This change allows the test to run on all platforms by using -1 as an
> > invalid clock value when max_dotclock is unavailable. The -1 converts
> > to UINT_MAX for unsigned int, which clearly exceeds any reasonable
> > hardware limit and should be rejected by all drivers.
> >
> > This prevents the test from being marked as IGNORED/SKIP on non-Intel
> > platforms while maintaining the original test intent of verifying that
> > drivers properly reject modes with excessively high clock rates.
> >
> > Tested on MTK platforms where the test now properly executes
> > and verifies clock validation.
> >
> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> > Suggested-by: Jani Nikula<jani.nikula@intel.com>
>
> Reviewed-by: Fei Shao <fshao@chromium.org>
>
>
> > ---
> >  tests/kms_invalid_mode.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> > index 5edffb649ef4..78ab965ede91 100644
> > --- a/tests/kms_invalid_mode.c
> > +++ b/tests/kms_invalid_mode.c
> > @@ -126,7 +126,15 @@ adjust_mode_clock_too_high(data_t *data,
> drmModeModeInfoPtr mode)
> >  {
> >         int max_dotclock =3D data->max_dotclock;
> >
> > -       igt_require(max_dotclock !=3D 0);
> > +       /*
> > +        * If max_dotclock is unavailable (e.g., non-Intel platforms),
> > +        * use -1 as an invalid clock value. This will be converted to
> > +        * UINT_MAX, which clearly exceeds any reasonable hardware limi=
t.
> > +        */
> > +       if (max_dotclock =3D=3D 0) {
> > +               mode->clock =3D -1;
> > +               return true;
> > +       }
> >
> >         /*
> >          * FIXME When we have a fixed mode, the kernel will ignore
> > --
> > 2.43.0
> >
>

--0000000000001f1dcd06509f5367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for the patch and for addressing J=
ani&#39;s comments.</div><div>This looks good to me.</div><div><br></div><d=
iv>Reviewed-by: Manasi Navare &lt;<a href=3D"mailto:navaremanasi@google.com=
">navaremanasi@google.com</a>&gt;</div><div><br></div><div><a class=3D"gmai=
l_plusreply" id=3D"plusReplyChip-5" href=3D"mailto:jani.nikula@intel.com" t=
abindex=3D"-1">@Jani Nikula</a>=C2=A0<a class=3D"gmail_plusreply" id=3D"plu=
sReplyChip-6" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthi=
k B S</a>=C2=A0 Would you be able to help land this upstream, its required<=
br></div><div>to run this test on non intel platforms and review comments f=
rom Jani have been addressed.</div><div><br></div><div>Thanks a lot for you=
r help on landing this.</div><div><br></div><div>Regards</div><div>Manasi</=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Thu, Apr 16, 2026 at 9:04=E2=80=AFPM Fei Shao &lt;<a=
 href=3D"mailto:fshao@chromium.org">fshao@chromium.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Apr 15, 2026 =
at 9:51=E2=80=AFAM Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediatek=
.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The clock-too-high subtest was being skipped on non-Intel platforms<br=
>
&gt; because igt_get_max_dotclock() returns 0 when reading from<br>
&gt; Intel-specific debugfs fails.<br>
&gt;<br>
&gt; This change allows the test to run on all platforms by using -1 as an<=
br>
&gt; invalid clock value when max_dotclock is unavailable. The -1 converts<=
br>
&gt; to UINT_MAX for unsigned int, which clearly exceeds any reasonable<br>
&gt; hardware limit and should be rejected by all drivers.<br>
&gt;<br>
&gt; This prevents the test from being marked as IGNORED/SKIP on non-Intel<=
br>
&gt; platforms while maintaining the original test intent of verifying that=
<br>
&gt; drivers properly reject modes with excessively high clock rates.<br>
&gt;<br>
&gt; Tested on MTK platforms where the test now properly executes<br>
&gt; and verifies clock validation.<br>
&gt;<br>
&gt; Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediate=
k.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
&gt; Suggested-by: Jani Nikula&lt;<a href=3D"mailto:jani.nikula@intel.com" =
target=3D"_blank">jani.nikula@intel.com</a>&gt;<br>
<br>
Reviewed-by: Fei Shao &lt;<a href=3D"mailto:fshao@chromium.org" target=3D"_=
blank">fshao@chromium.org</a>&gt;<br>
<br>
<br>
&gt; ---<br>
&gt;=C2=A0 tests/kms_invalid_mode.c | 10 +++++++++-<br>
&gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c<br>
&gt; index 5edffb649ef4..78ab965ede91 100644<br>
&gt; --- a/tests/kms_invalid_mode.c<br>
&gt; +++ b/tests/kms_invalid_mode.c<br>
&gt; @@ -126,7 +126,15 @@ adjust_mode_clock_too_high(data_t *data, drmModeM=
odeInfoPtr mode)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int max_dotclock =3D data-&gt;max_dot=
clock;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require(max_dotclock !=3D 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If max_dotclock is unavailable (e.g., n=
on-Intel platforms),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * use -1 as an invalid clock value. This =
will be converted to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * UINT_MAX, which clearly exceeds any rea=
sonable hardware limit.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (max_dotclock =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mode-&gt;clock=
 =3D -1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIXME When we have a fixed mode, t=
he kernel will ignore<br>
&gt; --<br>
&gt; 2.43.0<br>
&gt;<br>
</blockquote></div></div>

--0000000000001f1dcd06509f5367--
