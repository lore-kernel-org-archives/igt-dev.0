Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF10CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 18:15:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6C110E548;
	Wed,  6 May 2026 18:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="jvg7Fpws";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D127010E552
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 18:15:31 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-bab8ae52954so1013136466b.1
 for <igt-dev@lists.freedesktop.org>; Wed, 06 May 2026 11:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778091330; cv=none;
 d=google.com; s=arc-20240605;
 b=EnGJJTTg2zdbMJ0KIyo+lKuBCaKxYgsJfXHx4BYYJD+SkVanADimjGiV4Sp2okA13Z
 TCXL7BowNX4I3Se3l0nJtO5Pi6vmzBPJPzeuBhPfkrWOmYj9hb2NNf+aW/7LXwJEsvZx
 0PuQPSNoiZFr60GItZ6Qp0spb3ZxHzdfwH4KFP8YtJ6sE+HUrJikf56dSH24DZnvJveK
 DzXs9/XobHE/wHuXuYl69pQZ4Wwh6P8S4BgJFDtcGIRUJaSbvczQBaLFd1qqthKHLsic
 NiEbt+6TOdNoY5iSv3CxNuLnkq/Ghx89kO0bY09qrFfyi7TznmSky9PxLpKR9jPoqDbZ
 S9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gMeKu6av301vfWRW08dK8Y0wxbsRNRLymm83LkecwPs=;
 fh=pfEwOTVM2TwjFv8Lhm/oKWfNC6nS93/IEOHj0LmUcj4=;
 b=gd6M6oGoDD5c8K3XFtmF/h5U1od6zCu57t4XHa9wRn6LGbP/k3WRuVmoAlQdB3Jbqo
 FLdbvTptipo2DTWtOCQhSIxvY22voVgS/PHx4G2Y2TPjN7Y51GrKsmfLjVN+fH20wyc4
 3iym5UG7WzF6++G1Ff9NUrlGrwTJEz2lKIbPyNs9KsY2whYxudWP4t7s6GPhPq4o5usy
 l5uNcLfZbvkVP/IOCQ77Xm92qC4RDDWHmG/n005rbjNxJZ0MIox7ylu+2a4XSOUXL+Nm
 bylz6YyNywvln7Gd/vTwPiRjM+HJjm6P4880rGFFT3omGrebp8YXp8bBN1UgxyXr8mB6
 fXSQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1778091330; x=1778696130;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gMeKu6av301vfWRW08dK8Y0wxbsRNRLymm83LkecwPs=;
 b=jvg7FpwsXt+5wbhbIF+7jO4ea8EOwwqnDXSiSe5k+Tg3QtaJu4a/fvhxnX/Kt3b8Jq
 +wCMIf+6fDQaTvM4ch6fAe4AdOSvSGAnxMtmMSXXeYsCTGbrwrKVkKtWn9Rqr/xctcgK
 VaMzgy4k6sQpF2NNBE44z9gxkFfM3Kv86PHzt1CHbKdUFuoumjILqVOM878WUimapc8b
 xQSlU2Vg3Mn8zS5RAx+GansVFHRCadbb1Q91f08iJo+Gx1oJouizrDfmp0v9SH8Iml0p
 MEhu8fSQzQwU40s92IeukY+pzrGQNs4viZ/B9zfWojoKk366Pjk3qFApmlgBb/g56+1o
 RfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778091330; x=1778696130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMeKu6av301vfWRW08dK8Y0wxbsRNRLymm83LkecwPs=;
 b=MeN8gSmqQ+lQf10zXOzmJAXiJoEmkpTyMlviwFO6+cl6w92QkbE61MpgJzm1u/gyU8
 JaC0ADABePjRQlhicO1ATbuQzdKo4b/5jck6Rwbn4xuJvgOqlzrR/3IWcHoFOxMGKWvk
 WAd0hBMi6FbLIIezwXTzvxFB1r1TjhP0N109enDjIniBA5lAnb3n0wmW+xwn9jCw4oZo
 SqxRomGcPPWFqe59RcdzEur1Rfj+yjDn4p27et52/1oI4H+cHX7zEY1oCSgOowFX8rm0
 UGRlTZ8JrynOphmYtAtScGs47Y8rHLWhRy+f8+ir8WDtWHWSEeq8x2b+w+lN3N6F+LYP
 ncnw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8YhDkp63hsGBpvbDlUxcUHl/wISZrvlKDj9IoXpRo2zlKn+diMdhskYrYgH7yOukO7R/QIYCki@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRWE31b9iRmChvk2wBeihXFaLLHo/dPll4wG4YprWMDheco90j
 dND5Q03nGGaexKg3wc6yWGHdZsjo+B7IXLvG28L2/kZA7PM1b2xN/SqonuF0JvVj/F3Tc87S6Sq
 PjdG6cdGtKURMhHO5cSLehW1jqwIArXS+zFDyJAn/
X-Gm-Gg: AeBDievcu3nmYhwKU0KhRs/mn5AKhug+osajqBhULEsLy09Ouh5bLC8GquWUIwqcfB7
 oF08CqwWHlGwCesK7DNXQM/Bkec6sEGwwrkZO2xFbzIHUBWeZhsjvd82cCrx6l2IyMC43oP+3kt
 iU+9uZ3BsWlLbk9ZLVJOgjb1o7b/CVNfdoBQAJ/CuIf3tsYfPPniOmU+oMmNhiEoq1Kvz/gFOxT
 cXe/UGtKgU1VgyXlY65bbpsXALPxo88kNj4dQL30uTeh8fN9cOIjw/eI8TG/Ve5/xdp8I6/wG7Q
 DW8nWkr6mx3N9g6M8bQqpp6rayIw6nuUZSqowQWiE3KgarS6JakCHQjKx5pIaBj7a/XgGzbYiFn
 LaKOca9f0dHLbO3yJ/okYr1IpoI4=
X-Received: by 2002:a17:907:9689:b0:bc3:782c:da7a with SMTP id
 a640c23a62f3a-bc56a6470ddmr273777566b.5.1778091329493; Wed, 06 May 2026
 11:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
 <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
 <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
 <2a95efab-841c-47c5-bafe-f80f59e45a32@intel.com>
 <CAMNLLoRO_-bF0-SaUVgMq0R0T8mc6yk4GmPY=_FCJwhLWohigA@mail.gmail.com>
 <CAMNLLoSiS316uKO-1t31DmMcTaD9AC3ieJ7Kgfp=dF0sn6Nsbw@mail.gmail.com>
 <baf903e9-bdfc-4107-a703-b65686ab2fd7@intel.com>
In-Reply-To: <baf903e9-bdfc-4107-a703-b65686ab2fd7@intel.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 6 May 2026 11:15:17 -0700
X-Gm-Features: AVHnY4L1aTz8K9NGZ9Jjgr3nheqoPe82yRZvg3FfEp1PieRubJdMZcaUVOVUOxA
Message-ID: <CAMNLLoSsKXkA5tGDR3u7Z-NoeJ0g8WZM703w5Fofs7AufYTMJA@mail.gmail.com>
Subject: Re: [PATCH i-g-t v5 1/3] tests/kms_content_protection: Add per-CRTC
 framebuffer infrastructure
To: Karthik B S <karthik.b.s@intel.com>
Cc: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, 
 Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="000000000000143f3f06512a2627"
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

--000000000000143f3f06512a2627
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Kathik and Santosh for testing this on your end, for your reviews
and for getting this landed

Regards
Manasi

On Wed, May 6, 2026 at 5:16=E2=80=AFAM Karthik B S <karthik.b.s@intel.com> =
wrote:

> Hi Manasi,
>
> Santhosh from our team has tested this out at our end. Thanks Santhosh.
>
> Will get this merged.
> Thanks and Regards,
> Karthik.B.S
>
> On 5/6/2026 3:58 AM, Manasi Navare wrote:
>
> Hi @Karthik B S <karthik.b.s@intel.com> , were you able to test this
> locally for regressions?
> If you could add your R-B , we can get this landed as soon as possible.
> This is time critical for us and is required to scale to MTK platform
>
> Regards
> Manasi
>
> On Mon, May 4, 2026 at 1:32=E2=80=AFPM Manasi Navare <navaremanasi@google=
.com>
> wrote:
>
>> Thanks a lot @Karthik B S <karthik.b.s@intel.com>  for your response,
>> And appreciate you trying this on your end and for your help on getting
>> this landed.
>>
>> Regards
>> Manasi
>>
>> On Mon, May 4, 2026 at 1:31=E2=80=AFAM Karthik B S <karthik.b.s@intel.co=
m> wrote:
>>
>>> Hi Manasi,
>>> On 5/1/2026 4:29 AM, Manasi Navare wrote:
>>>
>>> This change looks good to me,
>>>
>>> Reviewed-by: Manasi Navare <navaremanasi@google.com>
>>>
>>> @Karthik B S <karthik.b.s@intel.com>  and others from Intel signal
>>> boosting this, could we get some traction on this, its reviewed by the
>>> team, could we please land this?
>>>
>>> Sure, the idea LGTM in general. Will try this out at our end once befor=
e
>>> merging as this test doesn't have coverage on CI currently.
>>> Regards,
>>> Karthik.B.S
>>>
>>>
>>> Regards
>>> Manasi
>>>
>>> On Wed, Apr 29, 2026 at 1:31=E2=80=AFPM Manasi Navare <navaremanasi@goo=
gle.com>
>>> wrote:
>>>
>>>> Thanks Jason-JH for this improvement in the kms_content_protection IGT
>>>> test.
>>>> It makes sense to create a fb per CRTC given that each CRTC can have
>>>> different mode timings/resolutions.
>>>>
>>>> @karthik.b.s@intel.com <karthik.b.s@intel.com> , @
>>>> bhanuprakash.modem@gmail.com, @swati2.sharma@intel.com
>>>> Could you please take a look at this patch and help provide feedback?
>>>> We would like to get this landed as it helps improve our testing.
>>>>
>>>> Regards
>>>> Manasi
>>>>
>>>>
>>>>
>>>> On Sun, Mar 29, 2026 at 8:22=E2=80=AFPM Jason-JH Lin <jason-jh.lin@med=
iatek.com>
>>>> wrote:
>>>>
>>>>> Replace global framebuffers (data.red/green) with per-CRTC array
>>>>> (data.fbs[IGT_MAX_PIPES]) to support multiple outputs with different
>>>>> resolutions.
>>>>>
>>>>> Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at
>>>>> test initialization/cleanup, creating each FB with the resolution of
>>>>> the first output that can connect to that CRTC.
>>>>>
>>>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>>>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>>>> ---
>>>>>  tests/kms_content_protection.c | 50 +++++++++++++++++++++++++-------=
--
>>>>>  1 file changed, 37 insertions(+), 13 deletions(-)
>>>>>
>>>>> diff --git a/tests/kms_content_protection.c
>>>>> b/tests/kms_content_protection.c
>>>>> index caf3d7a56ae4..df9ff5efcaa2 100644
>>>>> --- a/tests/kms_content_protection.c
>>>>> +++ b/tests/kms_content_protection.c
>>>>> @@ -107,10 +107,15 @@
>>>>>
>>>>>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>>>>>
>>>>> +struct hdcp_test_fbs {
>>>>> +       struct igt_fb red;
>>>>> +       struct igt_fb green;
>>>>> +};
>>>>> +
>>>>>  struct data {
>>>>>         int drm_fd;
>>>>>         igt_display_t display;
>>>>> -       struct igt_fb red, green;
>>>>> +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>>>>>         unsigned int cp_tests;
>>>>>         struct udev_monitor *uevent_monitor;
>>>>>         bool is_force_hdcp14;
>>>>> @@ -991,31 +996,49 @@ static void test_content_protection_cleanup(voi=
d)
>>>>>                 igt_info("CP Prop being UNDESIRED on %s\n",
>>>>> output->name);
>>>>>                 test_cp_disable(output, display->is_atomic ?
>>>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>>>>         }
>>>>> -
>>>>> -       igt_remove_fb(data.drm_fd, &data.red);
>>>>> -       igt_remove_fb(data.drm_fd, &data.green);
>>>>>  }
>>>>>
>>>>>  static void create_fbs(void)
>>>>>  {
>>>>> -       uint16_t width =3D 0, height =3D 0;
>>>>>         drmModeModeInfo *mode;
>>>>>         igt_output_t *output;
>>>>> +       igt_crtc_t *crtc;
>>>>>
>>>>> +       /* Create framebuffers for each connected output's pipe */
>>>>>         for_each_connected_output(&data.display, output) {
>>>>>                 mode =3D igt_output_get_mode(output);
>>>>>                 igt_assert(mode);
>>>>>
>>>>> -               width =3D max(width, mode->hdisplay);
>>>>> -               height =3D max(height, mode->vdisplay);
>>>>> +               /* Find a valid crtc for this output */
>>>>> +               for_each_crtc(&data.display, crtc) {
>>>>> +                       if (!igt_crtc_connector_valid(crtc, output))
>>>>> +                               continue;
>>>>> +
>>>>> +                       /* Skip if already created for this crtc */
>>>>> +                       if (data.fbs[crtc->crtc_index].red.fb_id)
>>>>> +                               continue;
>>>>> +
>>>>> +                       igt_create_color_fb(data.drm_fd,
>>>>> mode->hdisplay, mode->vdisplay,
>>>>> +                                           DRM_FORMAT_XRGB8888,
>>>>> DRM_FORMAT_MOD_LINEAR,
>>>>> +                                           1.f, 0.f, 0.f,
>>>>> &data.fbs[crtc->crtc_index].red);
>>>>> +                       igt_create_color_fb(data.drm_fd,
>>>>> mode->hdisplay, mode->vdisplay,
>>>>> +                                           DRM_FORMAT_XRGB8888,
>>>>> DRM_FORMAT_MOD_LINEAR,
>>>>> +                                           0.f, 1.f, 0.f,
>>>>> &data.fbs[crtc->crtc_index].green);
>>>>> +                       break;
>>>>> +               }
>>>>>         }
>>>>> +}
>>>>>
>>>>> -       igt_create_color_fb(data.drm_fd, width, height,
>>>>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEA=
R,
>>>>> -                           1.f, 0.f, 0.f, &data.red);
>>>>> -       igt_create_color_fb(data.drm_fd, width, height,
>>>>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEA=
R,
>>>>> -                           0.f, 1.f, 0.f, &data.green);
>>>>> +static void remove_fbs(void)
>>>>> +{
>>>>> +       igt_crtc_t *crtc;
>>>>> +
>>>>> +       for_each_crtc(&data.display, crtc) {
>>>>> +               if (data.fbs[crtc->crtc_index].red.fb_id)
>>>>> +                       igt_remove_fb(data.drm_fd,
>>>>> &data.fbs[crtc->crtc_index].red);
>>>>> +               if (data.fbs[crtc->crtc_index].green.fb_id)
>>>>> +                       igt_remove_fb(data.drm_fd,
>>>>> &data.fbs[crtc->crtc_index].green);
>>>>> +       }
>>>>>  }
>>>>>
>>>>>  static const struct {
>>>>> @@ -1241,6 +1264,7 @@ int igt_main()
>>>>>
>>>>>         igt_fixture() {
>>>>>                 test_content_protection_cleanup();
>>>>> +               remove_fbs();
>>>>>                 igt_display_fini(&data.display);
>>>>>                 drm_close_driver(data.drm_fd);
>>>>>         }
>>>>> --
>>>>> 2.43.0
>>>>>
>>>>>

--000000000000143f3f06512a2627
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Kathik and Santosh for testing this on your end, fo=
r your reviews and for getting this landed<div><br></div><div>Regards</div>=
<div>Manasi</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 6, 2026 at 5:16=E2=80=AF=
AM Karthik B S &lt;<a href=3D"mailto:karthik.b.s@intel.com">karthik.b.s@int=
el.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><u></u>

 =20
  <div>
    <p>Hi Manasi,</p>
    <p>Santhosh from our team has tested this out at our end. Thanks
      Santhosh.</p>
    <p>Will get this merged.</p>
    Thanks and Regards,<br>
    Karthik.B.S
    <div><br>
    </div>
    <div>On 5/6/2026 3:58 AM, Manasi Navare
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">Hi=C2=A0<a class=3D"gmail_plusreply" id=3D"m_-138752=
9405113799300plusReplyChip-3" href=3D"mailto:karthik.b.s@intel.com" target=
=3D"_blank">@Karthik B S</a>=C2=A0, were you able to
        test this locally for regressions?
        <div>If you could add your R-B , we can get this landed as=C2=A0soo=
n
          as possible.</div>
        <div>This is time critical for us and is required to scale to
          MTK platform</div>
        <div><br>
        </div>
        <div>Regards</div>
        <div>Manasi</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2026 at 1:32=
=E2=80=AFPM
          Manasi Navare &lt;<a href=3D"mailto:navaremanasi@google.com" targ=
et=3D"_blank">navaremanasi@google.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
          <div dir=3D"ltr">
            <div>Thanks a lot=C2=A0<a class=3D"gmail_plusreply" id=3D"m_-13=
87529405113799300m_8697978727895870520plusReplyChip-1" href=3D"mailto:karth=
ik.b.s@intel.com" target=3D"_blank">@Karthik B S</a>=C2=A0 for your
              response,</div>
            <div>And appreciate you trying this on your end and for your
              help on getting this landed.</div>
            <div><br>
            </div>
            <div>Regards</div>
            <div>Manasi</div>
            <br>
            <div class=3D"gmail_quote">
              <div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2026 at
                1:31=E2=80=AFAM Karthik B S &lt;<a href=3D"mailto:karthik.b=
.s@intel.com" target=3D"_blank">karthik.b.s@intel.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                <div>
                  <p>Hi Manasi,</p>
                  <div>On 5/1/2026 4:29 AM, Manasi Navare wrote:<br>
                  </div>
                  <blockquote type=3D"cite">
                    <div dir=3D"ltr">
                      <div>This change looks good to me,</div>
                      <div><br>
                      </div>
                      <div>Reviewed-by: Manasi Navare &lt;<a href=3D"mailto=
:navaremanasi@google.com" target=3D"_blank">navaremanasi@google.com</a>&gt;=
</div>
                      <div><br>
                      </div>
                      <div><a class=3D"gmail_plusreply" id=3D"m_-1387529405=
113799300m_8697978727895870520m_-2777679078897058853plusReplyChip-0" href=
=3D"mailto:karthik.b.s@intel.com" target=3D"_blank">@Karthik
                          B S</a>=C2=A0 and others from Intel signal boosti=
ng
                        this, could we get some traction on this, its
                        reviewed by the team, could we please land this?<br=
>
                      </div>
                    </div>
                  </blockquote>
                  <p>Sure, the idea LGTM in general. Will try this out
                    at our end once before merging as this test doesn&#39;t
                    have coverage on CI currently.</p>
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
                        <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr
                          29, 2026 at 1:31=E2=80=AFPM Manasi Navare &lt;<a =
href=3D"mailto:navaremanasi@google.com" target=3D"_blank">navaremanasi@goog=
le.com</a>&gt;
                          wrote:<br>
                        </div>
                        <blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                          <div dir=3D"ltr">
                            <div>Thanks=C2=A0Jason-JH for this improvement=
=C2=A0in
                              the kms_content_protection IGT test.</div>
                            <div>It makes sense to create a fb per CRTC
                              given that each CRTC can have different
                              mode timings/resolutions.</div>
                            <div><br>
                            </div>
                            <div><a class=3D"gmail_plusreply" id=3D"m_-1387=
529405113799300m_8697978727895870520m_-2777679078897058853m_103923413481302=
6890plusReplyChip-1" href=3D"mailto:karthik.b.s@intel.com" target=3D"_blank=
">@karthik.b.s@intel.com</a>=C2=A0,
                              @<a href=3D"mailto:bhanuprakash.modem@gmail.c=
om" target=3D"_blank">bhanuprakash.modem@gmail.com</a>,=C2=A0@<a href=3D"ma=
ilto:swati2.sharma@intel.com" target=3D"_blank">swati2.sharma@intel.com</a>=
<br>
                            </div>
                            <div>Could you please take a look at this
                              patch and help provide feedback?</div>
                            <div>We would like to get this landed as it
                              helps improve our testing.</div>
                            <div><br>
                            </div>
                            <div>Regards</div>
                            <div>Manasi</div>
                            <div><br>
                            </div>
                            <div><br>
                            </div>
                            <br>
                            <div class=3D"gmail_quote">
                              <div dir=3D"ltr" class=3D"gmail_attr">On Sun,
                                Mar 29, 2026 at 8:22=E2=80=AFPM Jason-JH Li=
n
                                &lt;<a href=3D"mailto:jason-jh.lin@mediatek=
.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;
                                wrote:<br>
                              </div>
                              <blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Replace
                                global framebuffers (data.red/green)
                                with per-CRTC array<br>
                                (data.fbs[IGT_MAX_PIPES]) to support
                                multiple outputs with different<br>
                                resolutions.<br>
                                <br>
                                Add create_fbs()/remove_fbs() to manage
                                framebuffer lifecycle at<br>
                                test initialization/cleanup, creating
                                each FB with the resolution of<br>
                                the first output that can connect to
                                that CRTC.<br>
                                <br>
                                Signed-off-by: Jason-JH Lin &lt;<a href=3D"=
mailto:jason-jh.lin@mediatek.com" target=3D"_blank">jason-jh.lin@mediatek.c=
om</a>&gt;<br>
                                Reviewed-by: Fei Shao &lt;<a href=3D"mailto=
:fshao@chromium.org" target=3D"_blank">fshao@chromium.org</a>&gt;<br>
                                ---<br>
                                =C2=A0tests/kms_content_protection.c | 50
                                +++++++++++++++++++++++++---------<br>
                                =C2=A01 file changed, 37 insertions(+), 13
                                deletions(-)<br>
                                <br>
                                diff --git
                                a/tests/kms_content_protection.c
                                b/tests/kms_content_protection.c<br>
                                index caf3d7a56ae4..df9ff5efcaa2 100644<br>
                                --- a/tests/kms_content_protection.c<br>
                                +++ b/tests/kms_content_protection.c<br>
                                @@ -107,10 +107,15 @@<br>
                                <br>
                                =C2=A0IGT_TEST_DESCRIPTION(&quot;Test conte=
nt
                                protection (HDCP)&quot;);<br>
                                <br>
                                +struct hdcp_test_fbs {<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct igt_fb r=
ed;<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct igt_fb g=
reen;<br>
                                +};<br>
                                +<br>
                                =C2=A0struct data {<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 int drm_fd;<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_display_t d=
isplay;<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct igt_fb r=
ed, green;<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hdcp_tes=
t_fbs
                                fbs[IGT_MAX_PIPES];<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int cp=
_tests;<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct udev_mon=
itor
                                *uevent_monitor;<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_force_h=
dcp14;<br>
                                @@ -991,31 +996,49 @@ static void
                                test_content_protection_cleanup(void)<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 igt_info(&quot;CP Prop being
                                UNDESIRED on %s\n&quot;, output-&gt;name);<=
br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 test_cp_disable(output,
                                display-&gt;is_atomic ? COMMIT_ATOMIC :
                                COMMIT_LEGACY);<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
                                -<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(d=
ata.drm_fd,
                                &amp;data.red);<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(d=
ata.drm_fd,
                                &amp;data.green);<br>
                                =C2=A0}<br>
                                <br>
                                =C2=A0static void create_fbs(void)<br>
                                =C2=A0{<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t width =
=3D 0, height =3D 0;<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 drmModeModeInfo=
 *mode;<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_output_t *o=
utput;<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_crtc_t *crt=
c;<br>
                                <br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Create frame=
buffers for each
                                connected output&#39;s pipe */<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                for_each_connected_output(&amp;data.display=
,
                                output) {<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 mode =3D
                                igt_output_get_mode(output);<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 igt_assert(mode);<br>
                                <br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0width =3D max(width,
                                mode-&gt;hdisplay);<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0height =3D max(height,
                                mode-&gt;vdisplay);<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Find a valid crtc for
                                this output */<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0
                                =C2=A0for_each_crtc(&amp;data.display, crtc=
)
                                {<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if
                                (!igt_crtc_connector_valid(crtc,
                                output))<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0continue;<br>
                                +<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Skip if
                                already created for this crtc */<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if
                                (data.fbs[crtc-&gt;crtc_index].red.fb_id)<b=
r>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0continue;<br>
                                +<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0igt_create_color_fb(data.drm_fd,
                                mode-&gt;hdisplay, mode-&gt;vdisplay,<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0 =C2=A01.f, 0.f, 0.f,
                                &amp;data.fbs[crtc-&gt;crtc_index].red);<br=
>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0igt_create_color_fb(data.drm_fd,
                                mode-&gt;hdisplay, mode-&gt;vdisplay,<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0 =C2=A00.f, 1.f, 0.f,
                                &amp;data.fbs[crtc-&gt;crtc_index].green);<=
br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0}<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
                                +}<br>
                                <br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_create_colo=
r_fb(data.drm_fd,
                                width, height,<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.f, 0.f,
                                0.f, &amp;data.red);<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_create_colo=
r_fb(data.drm_fd,
                                width, height,<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0DRM_FORMAT_XRGB8888,
                                DRM_FORMAT_MOD_LINEAR,<br>
                                -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.f, 1.f,
                                0.f, &amp;data.green);<br>
                                +static void remove_fbs(void)<br>
                                +{<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_crtc_t *crt=
c;<br>
                                +<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_crtc(&=
amp;data.display,
                                crtc) {<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if
                                (data.fbs[crtc-&gt;crtc_index].red.fb_id)<b=
r>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0igt_remove_fb(data.drm_fd,
                                &amp;data.fbs[crtc-&gt;crtc_index].red);<br=
>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if
                                (data.fbs[crtc-&gt;crtc_index].green.fb_id)=
<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
                                =C2=A0igt_remove_fb(data.drm_fd,
                                &amp;data.fbs[crtc-&gt;crtc_index].green);<=
br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
                                =C2=A0}<br>
                                <br>
                                =C2=A0static const struct {<br>
                                @@ -1241,6 +1264,7 @@ int igt_main()<br>
                                <br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_fixture() {=
<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
                                test_content_protection_cleanup();<br>
                                +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0remove_fbs();<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
                                igt_display_fini(&amp;data.display);<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0
                                drm_close_driver(data.drm_fd);<br>
                                =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
                                -- <br>
                                2.43.0<br>
                                <br>
                              </blockquote>
                            </div>
                          </div>
                        </blockquote>
                      </div>
                    </div>
                  </blockquote>
                </div>
              </blockquote>
            </div>
          </div>
        </blockquote>
      </div>
    </blockquote>
  </div>

</blockquote></div>

--000000000000143f3f06512a2627--
