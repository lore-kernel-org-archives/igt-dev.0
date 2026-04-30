Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D12CD13DE
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 23:01:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A9E10E4AB;
	Thu, 30 Apr 2026 23:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="UNaRzRUw";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0A8A10E4AB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 23:01:32 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b9358bc9c50so216299266b.1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 16:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777590091; cv=none;
 d=google.com; s=arc-20240605;
 b=SE89SmtUS9xcwEHiLwsIFWcLGtMi71x29WOSye5EzDUei56XaAMD48k+1AdyERUVwc
 91dwURR64Zcu6NjCxIUhENymOwEoms1O0MwVVXwBr4raG3MRxsapusdYTPWAvbgGqduz
 UM/OKnePSeM/0k2WeI6jsGz8dHzqQGLDrQa+MXoFykcLDrWGoZSXzZPqMOwtHhpP46E0
 5P+OeoGcNhHkg2uG49INYudwk0zB1c3rBdZkX6bn8zGyqmWOYzZ/yPegoBKKegvCjNBq
 1xa9SD3gDz8B9KZSuqKu6DWN9kS4hQKuDWJVr1la1BkNhY6LAClCv5DoCGa6b1jCHtRt
 z6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=urF7K1BZql+olBmW9j7CLQ5cQwfgjq5lMWrmfRSzRT8=;
 fh=KpsZjmwnWQb33Nryq3vcNAqjbJ4qiEd9MM230HYqgbA=;
 b=TDfdR32tElRed25XVmc83p91ThgAwAs/JVV70HlH9mSEEtYPsw0NguYDB9pffz5fsP
 LwPDM/a3ldpul/SrnUSnSfBJSPOdZqOCebVh1mfheP81HxunnxOugJVhsRNu1JXvmo3R
 wav/eMLjYfyAiV/nt+yLsb6sTA5U0kIw50QGcq1xqo+Xe5gKRlEqbygyNz9o6rQsjwgF
 CWZ6rj3HSdCDwVYiL3yf76BdktjIpicg8NPWPbTQxbTvTRxtMEgxiQXRzi6MZ4E22e26
 4wL+ou+QJd4TfKUuXDCTQUapiZ8DRrDa/Ll67Ctwdfhr5NMlLR/JUrv9C+a0YnLFuGR7
 41uw==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1777590091; x=1778194891;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=urF7K1BZql+olBmW9j7CLQ5cQwfgjq5lMWrmfRSzRT8=;
 b=UNaRzRUwuHo2w3HOSaarmdvkGN3MOkEAxd2hdNfmImJYP1J+reGigkjXDiY7nSg+sC
 h0CqlvOuUIrUKcTG+TrT4ECyhTBidiMNQIOOGzSvEte7MmpOXsOZH9dfOcoD3hkjm4s/
 yPn0TBzOVDeMwM/rifGAAZskvtYWWoKQrwsKcgB4m2E3LAlYblrptA+feQfxwn363Tlq
 1gjJpjdI3x8OnvSJ80Z7xYn0WCpt1sd706nsA4KavZaT9vW+tF73op2Ct3B2wj8wyDxF
 UdoY9avFF8Y8WdFD7AhEzZK3/m2WQgrIdc9Lnmvxj4YFm0CLktWlePGjhm7XpNy5OnDs
 4wGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777590091; x=1778194891;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=urF7K1BZql+olBmW9j7CLQ5cQwfgjq5lMWrmfRSzRT8=;
 b=OKP4wYOClDlTFsPSsACCTNM92qgB1uiOh5OfdFZ4wB5Km8y771IZ56KrNSwUoBWIPo
 cZLfTxJVBJfRmNfIXQIbYlycrwqt/vshCIJT/1xPacCFYf7hSW/PN4IVzfQk7jWWiWzP
 XXJdn6sLeB1xd8XC2kVPhn3DDP/6P1j/7dVa3B3r+yJ4NK0FbGl4oKjtL9m1JS2gZIUT
 3EjhWKDG4TuqlLBq/vup9HgoNrNQMoD5RuozAPTgA87lM5uGdfYJGm+QtL5IRIxBSTQH
 /qP+8JttWonUjliickXruh2/+ji0m9swAiEZlooBWoAEGlht0q+TTSN9YvrBe/mryhcb
 weXw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+EHe8eQeUcZNZcgIeu1grzikNhRTqwcz/jCQ1mS+QnG99Vtl9WjFzpBc8JYNU59SAjvzuyiLsb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpO9fFb9DLWX59NOFDjTMOrN1D2MksStYbsmYZOG1OLbZaWlxU
 vYudYEi6rZjaHZIz+0CtRE500k+MvbxJfWivsIqx6kKAF+L11iNHNv+r87eAtGcLrpKxrxLnC82
 xIhSNRb5zcum96X0fxqENiZcdHXXLx6JuMV2Fi/Tc
X-Gm-Gg: AeBDietrdfGs+GcFqWYbkJSd1ySSsqByhAq6KvnFyClLjVqSofRpafwrXKikSu9b+Vr
 /N/dIBZCk/j0S4RxtFohXmDIypeRJydkdWr/HZh20PdCwUGtcZM/D3TV3KU2HRZc7LlkoqOmK2a
 BYWwxACGNptu1aNo+BK9sKb/oNyW6McKh5BboedilBE+5YkofiG1bQJcsKZO8iV5yOnZh8g20ox
 ot8w1MVqKhyOgCsEGd5AjVUCExMzvz6xjQTWj5kpNHzKHDwO7LycMCqEvSX7TDZaJYw0CWa3EyI
 NxMjOsXfKYMzz/hLzCXgVsGhc17UMk/SOGfDxXwHyOGITYMedoo+vZ2KiSajzGvca1umH5TL5R3
 VPgw8nGnXx2pFINzZlz9uloQN3ikiqQ8e2toPXQ==
X-Received: by 2002:a17:907:a184:b0:b97:1d24:c004 with SMTP id
 a640c23a62f3a-bbac789852amr219889766b.21.1777590090643; Thu, 30 Apr 2026
 16:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260415015132.2297990-1-jason-jh.lin@mediatek.com>
 <CAC=S1nhr7DFMN-e794MGXp7Nv+LDTQcO4QqG-79XiotFVC7stQ@mail.gmail.com>
 <CAMNLLoQJ3w80Art1VkvYoh4duM5HY2skEH8gztG4TQBWJaUHrg@mail.gmail.com>
In-Reply-To: <CAMNLLoQJ3w80Art1VkvYoh4duM5HY2skEH8gztG4TQBWJaUHrg@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Thu, 30 Apr 2026 16:01:18 -0700
X-Gm-Features: AVHnY4K3z2XM2d-3LFFyCqklEFpf_0SajCKg02ldxXcevt8IbveK1syKv0YxvTE
Message-ID: <CAMNLLoQSwnMz_-u2PqTDRM2qVXp=hxwXak5HFnCUqvpbMRVTDg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="000000000000e986920650b571f0"
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

--000000000000e986920650b571f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Karthik B S <karthik.b.s@intel.com>  @Jani Nikula
<jani.nikula@intel.com> :

Signal boosting this, we have reviewed this patch and verified for the MTK
driver,
Could you please take a look and  help on getting this upstreamed?

Regards
Manasi

On Wed, Apr 29, 2026 at 1:37=E2=80=AFPM Manasi Navare <navaremanasi@google.=
com>
wrote:

> Thanks for the patch and for addressing Jani's comments.
> This looks good to me.
>
> Reviewed-by: Manasi Navare <navaremanasi@google.com>
>
> @Jani Nikula <jani.nikula@intel.com> @Karthik B S <karthik.b.s@intel.com>
> Would you be able to help land this upstream, its required
> to run this test on non intel platforms and review comments from Jani hav=
e
> been addressed.
>
> Thanks a lot for your help on landing this.
>
> Regards
> Manasi
>
> On Thu, Apr 16, 2026 at 9:04=E2=80=AFPM Fei Shao <fshao@chromium.org> wro=
te:
>
>> On Wed, Apr 15, 2026 at 9:51=E2=80=AFAM Jason-JH Lin <jason-jh.lin@media=
tek.com>
>> wrote:
>> >
>> > The clock-too-high subtest was being skipped on non-Intel platforms
>> > because igt_get_max_dotclock() returns 0 when reading from
>> > Intel-specific debugfs fails.
>> >
>> > This change allows the test to run on all platforms by using -1 as an
>> > invalid clock value when max_dotclock is unavailable. The -1 converts
>> > to UINT_MAX for unsigned int, which clearly exceeds any reasonable
>> > hardware limit and should be rejected by all drivers.
>> >
>> > This prevents the test from being marked as IGNORED/SKIP on non-Intel
>> > platforms while maintaining the original test intent of verifying that
>> > drivers properly reject modes with excessively high clock rates.
>> >
>> > Tested on MTK platforms where the test now properly executes
>> > and verifies clock validation.
>> >
>> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>> > Suggested-by: Jani Nikula<jani.nikula@intel.com>
>>
>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>
>>
>> > ---
>> >  tests/kms_invalid_mode.c | 10 +++++++++-
>> >  1 file changed, 9 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
>> > index 5edffb649ef4..78ab965ede91 100644
>> > --- a/tests/kms_invalid_mode.c
>> > +++ b/tests/kms_invalid_mode.c
>> > @@ -126,7 +126,15 @@ adjust_mode_clock_too_high(data_t *data,
>> drmModeModeInfoPtr mode)
>> >  {
>> >         int max_dotclock =3D data->max_dotclock;
>> >
>> > -       igt_require(max_dotclock !=3D 0);
>> > +       /*
>> > +        * If max_dotclock is unavailable (e.g., non-Intel platforms),
>> > +        * use -1 as an invalid clock value. This will be converted to
>> > +        * UINT_MAX, which clearly exceeds any reasonable hardware
>> limit.
>> > +        */
>> > +       if (max_dotclock =3D=3D 0) {
>> > +               mode->clock =3D -1;
>> > +               return true;
>> > +       }
>> >
>> >         /*
>> >          * FIXME When we have a fixed mode, the kernel will ignore
>> > --
>> > 2.43.0
>> >
>>
>

--000000000000e986920650b571f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyC=
hip-1" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthik B S</=
a>=C2=A0=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-2" href=3D"m=
ailto:jani.nikula@intel.com" tabindex=3D"-1">@Jani Nikula</a>=C2=A0:</div><=
div><br></div><div>Signal boosting this, we have reviewed this patch and ve=
rified for the MTK driver,</div><div>Could you please take a look and=C2=A0=
 help on getting this upstreamed?</div><div><br></div><div>Regards</div><di=
v>Manasi</div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2026 at 1:37=E2=80=AFPM Manas=
i Navare &lt;<a href=3D"mailto:navaremanasi@google.com">navaremanasi@google=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr">Thanks for the patch and for addressi=
ng Jani&#39;s comments.</div><div>This looks good to me.</div><div><br></di=
v><div>Reviewed-by: Manasi Navare &lt;<a href=3D"mailto:navaremanasi@google=
.com" target=3D"_blank">navaremanasi@google.com</a>&gt;</div><div><br></div=
><div><a class=3D"gmail_plusreply" id=3D"m_-9025511830230408148plusReplyChi=
p-5" href=3D"mailto:jani.nikula@intel.com" target=3D"_blank">@Jani Nikula</=
a>=C2=A0<a class=3D"gmail_plusreply" id=3D"m_-9025511830230408148plusReplyC=
hip-6" href=3D"mailto:karthik.b.s@intel.com" target=3D"_blank">@Karthik B S=
</a>=C2=A0 Would you be able to help land this upstream, its required<br></=
div><div>to run this test on non intel platforms and review comments from J=
ani have been addressed.</div><div><br></div><div>Thanks a lot for your hel=
p on landing this.</div><div><br></div><div>Regards</div><div>Manasi</div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Apr 16, 2026 at 9:04=E2=80=AFPM Fei Shao &lt;<a href=3D"mailto:fshao@chrom=
ium.org" target=3D"_blank">fshao@chromium.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Wed, Apr 15, 2026 at 9:51=
=E2=80=AFAM Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediatek.com" t=
arget=3D"_blank">jason-jh.lin@mediatek.com</a>&gt; wrote:<br>
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
</blockquote></div></div>

--000000000000e986920650b571f0--
