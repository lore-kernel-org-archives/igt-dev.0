Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB12CD3424
	for <igt-dev@archiver.kernel.org>; Thu, 30 Apr 2026 22:59:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCF810E4A9;
	Thu, 30 Apr 2026 22:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wmrJbNQH";
	dkim-atps=neutral
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B59210E4A9
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 22:59:15 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-65c4152313fso1914509a12.1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Apr 2026 15:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777589954; cv=none;
 d=google.com; s=arc-20240605;
 b=klbneWhJ+EveMoEhfR6bqr3O4tH6aYZe7E1y/w1jSp7nQx4vuSOLHb1sRlPStBEk9A
 6UEHb0Bd40nc331d5Tzs2gkW6nZmLbjDB/hFyjhpeNrt5RWqSDaKFIAHnZb+JUa6qf7/
 YPjAOp57sqxInfl5fmLj1en88WuxlOLJ8tYF9kZH/7ZVulTBG8aj6oeze0Fx0PqArl0v
 7oPZ26lRiR8U6R4BlcB/XLH9LQSR9KrFK8JtXpclUoTXeMGx0LdoHIzQfIrm99lHsLPz
 GQalrIMunrw+BA0Imao4uOSdEKw3QOwgucghq8oLIfOdMpcAc7pGT3yKZOaotqowQKg/
 0EHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=vnkXGAnM4TV4flO67y7pJpYA0lEu3zrak1YXXY1PudA=;
 fh=efnYlFohctE3XauRDK0z680Ql1GH19F4h1uknwBjDzA=;
 b=jlMsgTywJ3QQQpSkA/Dvf/D7TIg5yHiP5jU2QeYL6ZSB2aWrxCCw8m7bZzhRodEWA6
 wch4bNp9hOOwHWhM8cRcnWKlTDreA1yG4VAvDg5RqMF0VYWaiizlBJwcc8PisbcJhGyX
 4mcz8W1sekDk9e//p+rWPQ0cdvyic7BjQq6PkmOnB0/rhRoQ1YwENuZIz7FlFduWoeKj
 N6WypswXoBLGvm1AolxPtwXFwhEMnIosyRzdKMNT0WI0y9GU/OfxqM0L1N/J9wKXDkON
 hVOjFp27zeoaIIQCfM38P+HouTqomkVa6SV6NA+TcfgPXZmIkVCCS4pZJB9IShV4h6kk
 9D1A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1777589954; x=1778194754;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vnkXGAnM4TV4flO67y7pJpYA0lEu3zrak1YXXY1PudA=;
 b=wmrJbNQHUr+OCrBZWKy3pMjrvlAZzTC5Ufhz12dl3V2IkCDuYv6PMbdzrtNE5TCQ5R
 SRhpqYvvlwcJfvZNv39LOgJHRH87f3mCqhKXzTi2F4qY6XpAVHW+r9Rf8XsWDylA7gCw
 mPxzzUhrL4XaxFZFMnvOuG5cdjkl8dhWJtIXp/VIYDm2a2AZbyW5B0uNcHHIDX1S7IUA
 0IP2rjlJbUOvrn2p/ZjugTiFI2y4GTvJkEGhZAaW3THprVxNRDFvVnszWCbXIGa60IuI
 d8/PoK0lw42flP1hzBWJ9ub294ln8QCt/8lfo1TBnF8VvmvbU4JAqm7PkBR7eSQFR45O
 q4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777589954; x=1778194754;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnkXGAnM4TV4flO67y7pJpYA0lEu3zrak1YXXY1PudA=;
 b=JxhKdw3x5RVkqR/y3ugJTYrQWUrDs0vci0jtEo7PoGJrsizamHjby1p4GkUcgfiK3B
 fGVipgeKnWX1t6bjWqAHQgClDc5lSzexO4a+4gf/1lbbsmI05KIg5UCsRtgwbixT90i8
 zr8V+Z2AOhS/+t4SqlKBSn9vCk2HX6tqfPsVPpjc8X50vn96dNBXAxLJDct6cKHIeieg
 NY0J6pfPTbspEuOhtn+havl5R+sxXNKo6NbocBYPGSLLUkJk2YqSq2BJ7wELCDojmSLv
 qUyAICdEetiPetqCOptXpmy8feFNAp9X4c0uDZ/Y3loceeb1YGS+pRpmjU+QR5VXPhsg
 D6sA==
X-Gm-Message-State: AOJu0YxC9aREnyJG92lSVeUhuRqoBk0m3wBrQBXEoT/bnbdHgm1wyulP
 OpJCYDzs0MaDa55I2MuEFI4lC5dV3dB7Eve80ARDuxApq/bEd46zdFrvl9Q+mDdhfnpcj8/UWLp
 lPk7Ne1i5LqU3exC49Lbn0YlJj4dmgdnj+pAAcrIY
X-Gm-Gg: AeBDieuZ/aSWFmOCUPhlwZT4uysmtW86iUEZH/3SuqrIS87Cy+uBAjd5ixF6WMksTLh
 dh0t6uKYvCJasImwo6xGp3r9RN/ba7vVOv5IHQQzsJpepkYV5Dski1CiXF64Vzvza9CfjyZ+aXJ
 cnRhoj8ZQF4gFenqvspHY7NYez9VgPIY9rxCmVMB5k8HAqEy0NNXQgcQn/kq3QHOemDi3VMZygH
 1syU8IEZpx8gwXZbeQX5ysJ68iyNrlieViAVURX8t3rfdMrDZB+0xZZnIkfylv/D+N7uXH2nVvt
 gYKryl8YN8olPb2Dgr+dJVFSRxCieW9nmVqvUhwqfdyAFH2e/re2rgfmPAFeSdOnpcBsU4Ea2ty
 4WhHu9yqnE52oZp+NZ5IEmXro/aQ=
X-Received: by 2002:a17:906:cb93:b0:bae:642a:8712 with SMTP id
 a640c23a62f3a-bbb6b18fe3cmr248738466b.26.1777589953470; Thu, 30 Apr 2026
 15:59:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
 <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
In-Reply-To: <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Thu, 30 Apr 2026 15:59:01 -0700
X-Gm-Features: AVHnY4KAeY7a-2VYr70UNZzlqBI4hXDZaeIOdLN-tT7psObYM8U7qmgvNbyG8KE
Message-ID: <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v5 1/3] tests/kms_content_protection: Add per-CRTC
 framebuffer infrastructure
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="000000000000bc53a30650b569ba"
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

--000000000000bc53a30650b569ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This change looks good to me,

Reviewed-by: Manasi Navare <navaremanasi@google.com>

@Karthik B S <karthik.b.s@intel.com>  and others from Intel signal boosting
this, could we get some traction on this, its reviewed by the team, could
we please land this?

Regards
Manasi

On Wed, Apr 29, 2026 at 1:31=E2=80=AFPM Manasi Navare <navaremanasi@google.=
com>
wrote:

> Thanks Jason-JH for this improvement in the kms_content_protection IGT
> test.
> It makes sense to create a fb per CRTC given that each CRTC can have
> different mode timings/resolutions.
>
> @karthik.b.s@intel.com <karthik.b.s@intel.com> , @
> bhanuprakash.modem@gmail.com, @swati2.sharma@intel.com
> Could you please take a look at this patch and help provide feedback?
> We would like to get this landed as it helps improve our testing.
>
> Regards
> Manasi
>
>
>
> On Sun, Mar 29, 2026 at 8:22=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediat=
ek.com>
> wrote:
>
>> Replace global framebuffers (data.red/green) with per-CRTC array
>> (data.fbs[IGT_MAX_PIPES]) to support multiple outputs with different
>> resolutions.
>>
>> Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at
>> test initialization/cleanup, creating each FB with the resolution of
>> the first output that can connect to that CRTC.
>>
>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>> Reviewed-by: Fei Shao <fshao@chromium.org>
>> ---
>>  tests/kms_content_protection.c | 50 +++++++++++++++++++++++++---------
>>  1 file changed, 37 insertions(+), 13 deletions(-)
>>
>> diff --git a/tests/kms_content_protection.c
>> b/tests/kms_content_protection.c
>> index caf3d7a56ae4..df9ff5efcaa2 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -107,10 +107,15 @@
>>
>>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>>
>> +struct hdcp_test_fbs {
>> +       struct igt_fb red;
>> +       struct igt_fb green;
>> +};
>> +
>>  struct data {
>>         int drm_fd;
>>         igt_display_t display;
>> -       struct igt_fb red, green;
>> +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>>         unsigned int cp_tests;
>>         struct udev_monitor *uevent_monitor;
>>         bool is_force_hdcp14;
>> @@ -991,31 +996,49 @@ static void test_content_protection_cleanup(void)
>>                 igt_info("CP Prop being UNDESIRED on %s\n", output->name=
);
>>                 test_cp_disable(output, display->is_atomic ?
>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>         }
>> -
>> -       igt_remove_fb(data.drm_fd, &data.red);
>> -       igt_remove_fb(data.drm_fd, &data.green);
>>  }
>>
>>  static void create_fbs(void)
>>  {
>> -       uint16_t width =3D 0, height =3D 0;
>>         drmModeModeInfo *mode;
>>         igt_output_t *output;
>> +       igt_crtc_t *crtc;
>>
>> +       /* Create framebuffers for each connected output's pipe */
>>         for_each_connected_output(&data.display, output) {
>>                 mode =3D igt_output_get_mode(output);
>>                 igt_assert(mode);
>>
>> -               width =3D max(width, mode->hdisplay);
>> -               height =3D max(height, mode->vdisplay);
>> +               /* Find a valid crtc for this output */
>> +               for_each_crtc(&data.display, crtc) {
>> +                       if (!igt_crtc_connector_valid(crtc, output))
>> +                               continue;
>> +
>> +                       /* Skip if already created for this crtc */
>> +                       if (data.fbs[crtc->crtc_index].red.fb_id)
>> +                               continue;
>> +
>> +                       igt_create_color_fb(data.drm_fd, mode->hdisplay,
>> mode->vdisplay,
>> +                                           DRM_FORMAT_XRGB8888,
>> DRM_FORMAT_MOD_LINEAR,
>> +                                           1.f, 0.f, 0.f,
>> &data.fbs[crtc->crtc_index].red);
>> +                       igt_create_color_fb(data.drm_fd, mode->hdisplay,
>> mode->vdisplay,
>> +                                           DRM_FORMAT_XRGB8888,
>> DRM_FORMAT_MOD_LINEAR,
>> +                                           0.f, 1.f, 0.f,
>> &data.fbs[crtc->crtc_index].green);
>> +                       break;
>> +               }
>>         }
>> +}
>>
>> -       igt_create_color_fb(data.drm_fd, width, height,
>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> -                           1.f, 0.f, 0.f, &data.red);
>> -       igt_create_color_fb(data.drm_fd, width, height,
>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> -                           0.f, 1.f, 0.f, &data.green);
>> +static void remove_fbs(void)
>> +{
>> +       igt_crtc_t *crtc;
>> +
>> +       for_each_crtc(&data.display, crtc) {
>> +               if (data.fbs[crtc->crtc_index].red.fb_id)
>> +                       igt_remove_fb(data.drm_fd,
>> &data.fbs[crtc->crtc_index].red);
>> +               if (data.fbs[crtc->crtc_index].green.fb_id)
>> +                       igt_remove_fb(data.drm_fd,
>> &data.fbs[crtc->crtc_index].green);
>> +       }
>>  }
>>
>>  static const struct {
>> @@ -1241,6 +1264,7 @@ int igt_main()
>>
>>         igt_fixture() {
>>                 test_content_protection_cleanup();
>> +               remove_fbs();
>>                 igt_display_fini(&data.display);
>>                 drm_close_driver(data.drm_fd);
>>         }
>> --
>> 2.43.0
>>
>>

--000000000000bc53a30650b569ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This change looks good to me,</div><div><br></div><di=
v>Reviewed-by: Manasi Navare &lt;<a href=3D"mailto:navaremanasi@google.com"=
>navaremanasi@google.com</a>&gt;</div><div><br></div><div><a class=3D"gmail=
_plusreply" id=3D"plusReplyChip-0" href=3D"mailto:karthik.b.s@intel.com" ta=
bindex=3D"-1">@Karthik B S</a>=C2=A0 and others from Intel signal boosting =
this, could we get some traction on this, its reviewed by the team, could w=
e please land this?<br></div><div><br></div><div>Regards</div><div>Manasi</=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, Apr 29, 2026 at 1:31=E2=80=AFPM Manasi Navare &=
lt;<a href=3D"mailto:navaremanasi@google.com">navaremanasi@google.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div>Thanks=C2=A0Jason-JH for this improvement=C2=A0in the kms_c=
ontent_protection IGT test.</div><div>It makes sense to create a fb per CRT=
C given that each CRTC can have different mode timings/resolutions.</div><d=
iv><br></div><div><a class=3D"gmail_plusreply" id=3D"m_1039234134813026890p=
lusReplyChip-1" href=3D"mailto:karthik.b.s@intel.com" target=3D"_blank">@ka=
rthik.b.s@intel.com</a>=C2=A0, @<a href=3D"mailto:bhanuprakash.modem@gmail.=
com" target=3D"_blank">bhanuprakash.modem@gmail.com</a>,=C2=A0@<a href=3D"m=
ailto:swati2.sharma@intel.com" target=3D"_blank">swati2.sharma@intel.com</a=
><br></div><div>Could you please take a look at this patch and help provide=
 feedback?</div><div>We would like to get this landed as it helps improve o=
ur testing.</div><div><br></div><div>Regards</div><div>Manasi</div><div><br=
></div><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Mar 29, 2026 at 8:22=E2=80=AFPM Jason-JH Lin &lt;<a=
 href=3D"mailto:jason-jh.lin@mediatek.com" target=3D"_blank">jason-jh.lin@m=
ediatek.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Replace global framebuffers (data.red/green) with per-CRTC array=
<br>
(data.fbs[IGT_MAX_PIPES]) to support multiple outputs with different<br>
resolutions.<br>
<br>
Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at<br>
test initialization/cleanup, creating each FB with the resolution of<br>
the first output that can connect to that CRTC.<br>
<br>
Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@mediatek.com=
" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
Reviewed-by: Fei Shao &lt;<a href=3D"mailto:fshao@chromium.org" target=3D"_=
blank">fshao@chromium.org</a>&gt;<br>
---<br>
=C2=A0tests/kms_content_protection.c | 50 +++++++++++++++++++++++++--------=
-<br>
=C2=A01 file changed, 37 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.=
c<br>
index caf3d7a56ae4..df9ff5efcaa2 100644<br>
--- a/tests/kms_content_protection.c<br>
+++ b/tests/kms_content_protection.c<br>
@@ -107,10 +107,15 @@<br>
<br>
=C2=A0IGT_TEST_DESCRIPTION(&quot;Test content protection (HDCP)&quot;);<br>
<br>
+struct hdcp_test_fbs {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct igt_fb red;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct igt_fb green;<br>
+};<br>
+<br>
=C2=A0struct data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int drm_fd;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_display_t display;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0struct igt_fb red, green;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hdcp_test_fbs fbs[IGT_MAX_PIPES];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int cp_tests;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct udev_monitor *uevent_monitor;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_force_hdcp14;<br>
@@ -991,31 +996,49 @@ static void test_content_protection_cleanup(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_info(&quot;CP P=
rop being UNDESIRED on %s\n&quot;, output-&gt;name);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_cp_disable(out=
put, display-&gt;is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data.drm_fd, &amp;data.red);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data.drm_fd, &amp;data.green);<br=
>
=C2=A0}<br>
<br>
=C2=A0static void create_fbs(void)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t width =3D 0, height =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drmModeModeInfo *mode;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_output_t *output;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_crtc_t *crtc;<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Create framebuffers for each connected outpu=
t&#39;s pipe */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for_each_connected_output(&amp;data.display, ou=
tput) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mode =3D igt_output=
_get_mode(output);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_assert(mode);<b=
r>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0width =3D max(width=
, mode-&gt;hdisplay);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0height =3D max(heig=
ht, mode-&gt;vdisplay);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Find a valid crt=
c for this output */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_crtc(&amp;=
data.display, crtc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (!igt_crtc_connector_valid(crtc, output))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* Skip if already created for this crtc */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (data.fbs[crtc-&gt;crtc_index].red.fb_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0igt_create_color_fb(data.drm_fd, mode-&gt;hdisplay, mode-&gt;vdis=
play,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A01.f, 0.f, 0.f, &amp;data.fbs[crtc-&gt;crtc_index].red);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0igt_create_color_fb(data.drm_fd, mode-&gt;hdisplay, mode-&gt;vdis=
play,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A00.f, 1.f, 0.f, &amp;data.fbs[crtc-&gt;crtc_index].green);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_create_color_fb(data.drm_fd, width, height,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01.f, 0.f, 0.f, &amp;data.red);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_create_color_fb(data.drm_fd, width, height,=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00.f, 1.f, 0.f, &amp;data.green);<br>
+static void remove_fbs(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_crtc_t *crtc;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_crtc(&amp;data.display, crtc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data.fbs[crtc-&=
gt;crtc_index].red.fb_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0igt_remove_fb(data.drm_fd, &amp;data.fbs[crtc-&gt;crtc_index].red=
);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data.fbs[crtc-&=
gt;crtc_index].green.fb_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0igt_remove_fb(data.drm_fd, &amp;data.fbs[crtc-&gt;crtc_index].gre=
en);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
<br>
=C2=A0static const struct {<br>
@@ -1241,6 +1264,7 @@ int igt_main()<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_fixture() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 test_content_protec=
tion_cleanup();<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0remove_fbs();<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_display_fini(&a=
mp;data.display);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_close_driver(da=
ta.drm_fd);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000bc53a30650b569ba--
