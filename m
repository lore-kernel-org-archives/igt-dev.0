Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA7AFF885A
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 20:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E320210E86B;
	Mon,  4 May 2026 20:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LxHe/D8o";
	dkim-atps=neutral
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282310E86B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 20:37:33 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ba92146cc86so757610666b.1
 for <igt-dev@lists.freedesktop.org>; Mon, 04 May 2026 13:37:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777927052; cv=none;
 d=google.com; s=arc-20240605;
 b=dSwTkJzW52H9kUkjSFGdF8qCtFaHDnRL8Rq5DS13ReGTPlKVzZEc7mgIpZ+M06Vira
 gcAgPhmkTiCo+HIBuBw+TiblXsZ0bAKZOYFVfx4sAFLYuBxfYa4cF50THS0iH1KYadq8
 KKVuRS7VrUaHgfFZVTcOEMVcB/vkkhnA1FgxR9emGLj+fmK3ijcjAMbTL+UBahq6God6
 k30e+4yk8F/IuJUX83fuaWmiMdBP0h6XqwBp9peT9bqZNcnLrDI3v7RwCmW4HZsK0wKv
 NM138fDDwAlshBpUoO2AyCLcgoLCWst1KSddXuFG6UYx17jl5VAZX3s6UkUUfB+w2QiA
 OGug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=iPi5ThC5Fz+4bBW217CMpMOHXw60idXl+ZwtpvZ3CVU=;
 fh=ZPlM6nzOAre26/y6pjSX5ZZv4t7HRrvPG34uPbZBOPI=;
 b=OQMsriFy07dDQ2EjebYDbvkv06D01ASDN+mRz3JfL0YFXZkmdAol+3W7SWK9omMLyY
 F3D9R4iJKEgJUOjHROhAIy1Wk7H5ZRQAuQdIsJC4Wzev6FUba/7bXCvuUVBad1E2pGIb
 Al51Yg/DI8gvPCWtig+OjIPm9G4eJAN4wNPCa+Sh7JreGOm4G9UDwGTuXwuOApYM/g6O
 9eSuzjjzIak3QNFFul0SUnt7v7MqEPb58cqqn1wRhVVivWosoxMSqlqrOgod2u2M5nHQ
 5fBvvsXzy8XY8oQYpzhPySr9bMyxhQ7xOY9dcbgWReQ2Qz/hzL0QuGE7By6dsriu9kz/
 ESzg==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1777927052; x=1778531852;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iPi5ThC5Fz+4bBW217CMpMOHXw60idXl+ZwtpvZ3CVU=;
 b=LxHe/D8olRykVJoHT8OP39GR6WSIoG0bduFfEa+WbVSd+jq0Wv1J4ACzxSp+LTGwM7
 mNNoPwg68D0OEX/imnMet+ooU56/6jKtcThSEeLW+OD1ZV9yk3UDt3gDYKE4HC2+a2pG
 cZf0k1W2jguJxVgkY941S8K4F22Bcp4whwD+g9i9nV/6K4QA9mzdYTFxMTsiCrEkDuwJ
 gpUVfJXs+Uqir6SfD251jrzvbanYOjwg4RAsZ/NiDKFI6XKgm8jads+lZ8rBJkRiBg+2
 b5okkcbfRllpBPi3PJxQpWs55RKxqoYbyPlZBYuIMivfM3GJWIj/PoBoupV5/ew/kxe1
 PUvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777927052; x=1778531852;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iPi5ThC5Fz+4bBW217CMpMOHXw60idXl+ZwtpvZ3CVU=;
 b=OTYMmq4R8dbX02pamvDirjpWuSkd2ppxs6cbxOz/38L+oMHK/Cmk2OA/03YibEDaoK
 D5mELTMkWKZ9NCYdKqcbfyGAh/ZlcTQ7cCt9+QMbbTFicJPtDkFqfOsIhag7r/xhnKZN
 AKpXSThh5RKU4Xz52burOvD1a0YJIGWx4lEE13uLYskAxPLBTh+VuH3IT1FpqC9Q94A7
 LUWziTb1ukntUe0v2pSDotgYurLwDlc0Ja7C05LNRjntP1YNYUzSbl/wkrl2HSDOa0vr
 vsRKQDOmLpoOEwPeOs7No/RoRIZv0lN0wzp3pn4ZtCGOhIybu8kh4Yd0OrZwyDXQ5fnZ
 9/pw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9pQZJTWn2Jb0STIumz9yqbPrH/CuB/vWheLA91XvP6CJiPtGYnSUj50+eyWch4eMcxRa/EshE6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMSRvbsu1kYdoQUj7ZFB3MR7gxHOwSNYUB1fxxqr6EooXjKiNY
 U9OMITBquW0wkr33UJHHkZuOFqaj6XgHD1WDqoXYDPsa8uQVi8VBhwQivaO8lIguqYLyz44n4A5
 FZq5etnb6GkkIGV8VwaakIQ0QaSnfWe9YolfeeB6P
X-Gm-Gg: AeBDiesDRIKNLJuzXJUrUkjfVCniQGfOn7g59v8SrqlsUx5yLEwlz0amoLQYs0JcxQo
 u0TTDG0GwreiHomkzkwG77s1k3ItkXhKRQ5gbAogq7qQsBHNuojM4VY64isxcpyh/1mOQDGtzcO
 X/GuKSRfcA/5FyoPN2RwAmILf7fwNQ4lwK3PhGtJhGQCLETFekL18IOCnaEVIhKkGxy5mmBDfzG
 Ei+Jr1v1NG0MJxmg/632L5nc3Z12TE7GxBpChIyONNGkZN4Ahh+EvM8Lbji32Y8Fpwj/Ohjb5QY
 Itt30GD9HT1N0JPdZK4JNb9FT8s8Fz/+vTdKebR0PtKgzuilZP6C+zbjO8l8LJ7rLT0Q3Q+h4Wx
 OOzODWzx0Xh7sYgyIU1FBjyvjhaxZ+CIjo9vsT0GTywfksV3m9dFwPr7zpQ==
X-Received: by 2002:a17:907:a591:b0:ba0:d58b:6045 with SMTP id
 a640c23a62f3a-bc411213bf2mr5832966b.27.1777927051717; Mon, 04 May 2026
 13:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260415015132.2297990-1-jason-jh.lin@mediatek.com>
 <CAC=S1nhr7DFMN-e794MGXp7Nv+LDTQcO4QqG-79XiotFVC7stQ@mail.gmail.com>
 <CAMNLLoQJ3w80Art1VkvYoh4duM5HY2skEH8gztG4TQBWJaUHrg@mail.gmail.com>
 <CAMNLLoQSwnMz_-u2PqTDRM2qVXp=hxwXak5HFnCUqvpbMRVTDg@mail.gmail.com>
 <2b0203e2-30de-4954-92ca-051b04c0fe4a@intel.com>
In-Reply-To: <2b0203e2-30de-4954-92ca-051b04c0fe4a@intel.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Mon, 4 May 2026 13:37:18 -0700
X-Gm-Features: AVHnY4Ir_2JwJV-XgX0krkVoiVQtpaOuCQbXRfQxMXFxJt0O81tBZestKnZjKy4
Message-ID: <CAMNLLoSTN1m_H252_NRNUTQ5_6=bcTRnN+P8JPF5i6RPM3KsVg@mail.gmail.com>
Subject: Re: [PATCH v2] tests/kms_invalid_mode: Allow clock-too-high test on
 non-Intel platforms
To: Karthik B S <karthik.b.s@intel.com>
Cc: Fei Shao <fshao@chromium.org>, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="0000000000005bd2cf065103e6ed"
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

--0000000000005bd2cf065103e6ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot @Karthik B S <karthik.b.s@intel.com> for confirming and
helping land this.
Thanks @Jason-JH Lin <jason-jh.lin@mediatek.com>  for the patch to make
this test scalable to MTK platform.

Regards
Manasi

On Mon, May 4, 2026 at 1:32=E2=80=AFAM Karthik B S <karthik.b.s@intel.com> =
wrote:

> Hi Manasi,
> On 5/1/2026 4:31 AM, Manasi Navare wrote:
>
> Hi @Karthik B S <karthik.b.s@intel.com>  @Jani Nikula
> <jani.nikula@intel.com> :
>
> Signal boosting this, we have reviewed this patch and verified for the MT=
K
> driver,
> Could you please take a look and  help on getting this upstreamed?
>
> Sure, this LGTM and CI is also fine. Will merge this.
> Regards,
> Karthik.B.S
>
>
> Regards
> Manasi
>
> On Wed, Apr 29, 2026 at 1:37=E2=80=AFPM Manasi Navare <navaremanasi@googl=
e.com>
> wrote:
>
>> Thanks for the patch and for addressing Jani's comments.
>> This looks good to me.
>>
>> Reviewed-by: Manasi Navare <navaremanasi@google.com>
>>
>> @Jani Nikula <jani.nikula@intel.com> @Karthik B S <karthik.b.s@intel.com=
>
>> Would you be able to help land this upstream, its required
>> to run this test on non intel platforms and review comments from Jani
>> have been addressed.
>>
>> Thanks a lot for your help on landing this.
>>
>> Regards
>> Manasi
>>
>> On Thu, Apr 16, 2026 at 9:04=E2=80=AFPM Fei Shao <fshao@chromium.org> wr=
ote:
>>
>>> On Wed, Apr 15, 2026 at 9:51=E2=80=AFAM Jason-JH Lin <jason-jh.lin@medi=
atek.com>
>>> wrote:
>>> >
>>> > The clock-too-high subtest was being skipped on non-Intel platforms
>>> > because igt_get_max_dotclock() returns 0 when reading from
>>> > Intel-specific debugfs fails.
>>> >
>>> > This change allows the test to run on all platforms by using -1 as an
>>> > invalid clock value when max_dotclock is unavailable. The -1 converts
>>> > to UINT_MAX for unsigned int, which clearly exceeds any reasonable
>>> > hardware limit and should be rejected by all drivers.
>>> >
>>> > This prevents the test from being marked as IGNORED/SKIP on non-Intel
>>> > platforms while maintaining the original test intent of verifying tha=
t
>>> > drivers properly reject modes with excessively high clock rates.
>>> >
>>> > Tested on MTK platforms where the test now properly executes
>>> > and verifies clock validation.
>>> >
>>> > Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>> > Suggested-by: Jani Nikula<jani.nikula@intel.com>
>>>
>>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>>
>>>
>>> > ---
>>> >  tests/kms_invalid_mode.c | 10 +++++++++-
>>> >  1 file changed, 9 insertions(+), 1 deletion(-)
>>> >
>>> > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
>>> > index 5edffb649ef4..78ab965ede91 100644
>>> > --- a/tests/kms_invalid_mode.c
>>> > +++ b/tests/kms_invalid_mode.c
>>> > @@ -126,7 +126,15 @@ adjust_mode_clock_too_high(data_t *data,
>>> drmModeModeInfoPtr mode)
>>> >  {
>>> >         int max_dotclock =3D data->max_dotclock;
>>> >
>>> > -       igt_require(max_dotclock !=3D 0);
>>> > +       /*
>>> > +        * If max_dotclock is unavailable (e.g., non-Intel platforms)=
,
>>> > +        * use -1 as an invalid clock value. This will be converted t=
o
>>> > +        * UINT_MAX, which clearly exceeds any reasonable hardware
>>> limit.
>>> > +        */
>>> > +       if (max_dotclock =3D=3D 0) {
>>> > +               mode->clock =3D -1;
>>> > +               return true;
>>> > +       }
>>> >
>>> >         /*
>>> >          * FIXME When we have a fixed mode, the kernel will ignore
>>> > --
>>> > 2.43.0
>>> >
>>>
>>

--0000000000005bd2cf065103e6ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks a lot=C2=A0<a class=3D"gmail_plusreply" id=3D"plusR=
eplyChip-2" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthik =
B S</a>=C2=A0for confirming and helping=C2=A0land this.<div>Thanks=C2=A0<a =
class=3D"gmail_plusreply" id=3D"plusReplyChip-3" href=3D"mailto:jason-jh.li=
n@mediatek.com" tabindex=3D"-1">@Jason-JH Lin</a>=C2=A0 for the patch to ma=
ke this test scalable to MTK platform.</div><div><br></div><div>Regards</di=
v><div>Manasi</div></div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2026 at 1:32=E2=80=
=AFAM Karthik B S &lt;<a href=3D"mailto:karthik.b.s@intel.com">karthik.b.s@=
intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><u></u>

 =20
  <div>
    <p>Hi Manasi,</p>
    <div>On 5/1/2026 4:31 AM, Manasi Navare
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>Hi=C2=A0<a class=3D"gmail_plusreply" id=3D"m_49275762467715063=
75plusReplyChip-1" href=3D"mailto:karthik.b.s@intel.com" target=3D"_blank">=
@Karthik B S</a>=C2=A0=C2=A0<a class=3D"gmail_plusreply" id=3D"m_4927576246=
771506375plusReplyChip-2" href=3D"mailto:jani.nikula@intel.com" target=3D"_=
blank">@Jani Nikula</a>=C2=A0:</div>
        <div><br>
        </div>
        <div>Signal boosting this, we have reviewed this patch and
          verified for the MTK driver,</div>
        <div>Could you please take a look and=C2=A0 help on getting this
          upstreamed?</div>
      </div>
    </blockquote>
    <p>Sure, this LGTM and CI is also fine. Will merge this.</p>
    Regards,<br>
    Karthik.B.S
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div>Regards</div>
        <div>Manasi</div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 29, 2026 at
            1:37=E2=80=AFPM Manasi Navare &lt;<a href=3D"mailto:navaremanas=
i@google.com" target=3D"_blank">navaremanasi@google.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div dir=3D"ltr">Thanks for the patch and for addressing
                Jani&#39;s comments.</div>
              <div>This looks good to me.</div>
              <div><br>
              </div>
              <div>Reviewed-by: Manasi Navare &lt;<a href=3D"mailto:navarem=
anasi@google.com" target=3D"_blank">navaremanasi@google.com</a>&gt;</div>
              <div><br>
              </div>
              <div><a class=3D"gmail_plusreply" id=3D"m_4927576246771506375=
m_-9025511830230408148plusReplyChip-5" href=3D"mailto:jani.nikula@intel.com=
" target=3D"_blank">@Jani Nikula</a>=C2=A0<a class=3D"gmail_plusreply" id=
=3D"m_4927576246771506375m_-9025511830230408148plusReplyChip-6" href=3D"mai=
lto:karthik.b.s@intel.com" target=3D"_blank">@Karthik B S</a>=C2=A0 Would y=
ou be
                able to help land this upstream, its required<br>
              </div>
              <div>to run this test on non intel platforms and review
                comments from Jani have been addressed.</div>
              <div><br>
              </div>
              <div>Thanks a lot for your help on landing this.</div>
              <div><br>
              </div>
              <div>Regards</div>
              <div>Manasi</div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 16, 2026
                  at 9:04=E2=80=AFPM Fei Shao &lt;<a href=3D"mailto:fshao@c=
hromium.org" target=3D"_blank">fshao@chromium.org</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
                  Wed, Apr 15, 2026 at 9:51=E2=80=AFAM Jason-JH Lin &lt;<a =
href=3D"mailto:jason-jh.lin@mediatek.com" target=3D"_blank">jason-jh.lin@me=
diatek.com</a>&gt;
                  wrote:<br>
                  &gt;<br>
                  &gt; The clock-too-high subtest was being skipped on
                  non-Intel platforms<br>
                  &gt; because igt_get_max_dotclock() returns 0 when
                  reading from<br>
                  &gt; Intel-specific debugfs fails.<br>
                  &gt;<br>
                  &gt; This change allows the test to run on all
                  platforms by using -1 as an<br>
                  &gt; invalid clock value when max_dotclock is
                  unavailable. The -1 converts<br>
                  &gt; to UINT_MAX for unsigned int, which clearly
                  exceeds any reasonable<br>
                  &gt; hardware limit and should be rejected by all
                  drivers.<br>
                  &gt;<br>
                  &gt; This prevents the test from being marked as
                  IGNORED/SKIP on non-Intel<br>
                  &gt; platforms while maintaining the original test
                  intent of verifying that<br>
                  &gt; drivers properly reject modes with excessively
                  high clock rates.<br>
                  &gt;<br>
                  &gt; Tested on MTK platforms where the test now
                  properly executes<br>
                  &gt; and verifies clock validation.<br>
                  &gt;<br>
                  &gt; Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:ja=
son-jh.lin@mediatek.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt=
;<br>
                  &gt; Suggested-by: Jani Nikula&lt;<a href=3D"mailto:jani.=
nikula@intel.com" target=3D"_blank">jani.nikula@intel.com</a>&gt;<br>
                  <br>
                  Reviewed-by: Fei Shao &lt;<a href=3D"mailto:fshao@chromiu=
m.org" target=3D"_blank">fshao@chromium.org</a>&gt;<br>
                  <br>
                  <br>
                  &gt; ---<br>
                  &gt;=C2=A0 tests/kms_invalid_mode.c | 10 +++++++++-<br>
                  &gt;=C2=A0 1 file changed, 9 insertions(+), 1 deletion(-)=
<br>
                  &gt;<br>
                  &gt; diff --git a/tests/kms_invalid_mode.c
                  b/tests/kms_invalid_mode.c<br>
                  &gt; index 5edffb649ef4..78ab965ede91 100644<br>
                  &gt; --- a/tests/kms_invalid_mode.c<br>
                  &gt; +++ b/tests/kms_invalid_mode.c<br>
                  &gt; @@ -126,7 +126,15 @@
                  adjust_mode_clock_too_high(data_t *data,
                  drmModeModeInfoPtr mode)<br>
                  &gt;=C2=A0 {<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int max_dotclock =
=3D data-&gt;max_dotclock;<br>
                  &gt;<br>
                  &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_require(max_dotclock=
 !=3D 0);<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * If max_dotclock is un=
available (e.g.,
                  non-Intel platforms),<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * use -1 as an invalid =
clock value. This
                  will be converted to<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 * UINT_MAX, which clear=
ly exceeds any
                  reasonable hardware limit.<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (max_dotclock =3D=3D =
0) {<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0mode-&gt;clock =3D -1;<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0return true;<br>
                  &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
                  &gt;<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
                  &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * FIXME When we ha=
ve a fixed mode, the
                  kernel will ignore<br>
                  &gt; --<br>
                  &gt; 2.43.0<br>
                  &gt;<br>
                </blockquote>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--0000000000005bd2cf065103e6ed--
