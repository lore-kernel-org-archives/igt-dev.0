Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD87FF8855
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 22:29:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0267610EC36;
	Tue,  5 May 2026 22:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Nq8Zc5JF";
	dkim-atps=neutral
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA2B10EC36
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 22:29:09 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-bc4da3e2729so128936666b.0
 for <igt-dev@lists.freedesktop.org>; Tue, 05 May 2026 15:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778020148; cv=none;
 d=google.com; s=arc-20240605;
 b=DfJEwq8WLOzH2NcOAuQ0cL5kdEu7YJBQofAYdohvwRjpZ5k5Bb9oyj6KEXqZTJgh7u
 TiJCtMwLfNPk3fpFQFSTCgEkrcZkULK8XfTxEG2jYmpDX/2CUzkNNwTjbY2hskJejlc7
 mz3Z5YriMK5Xoy0pgmc+aarvJ9rciCFQQgLrXvOzuxaPnrgbLTx1sy4wisraxUW6EFQj
 0wIeRcSTZQwJwmMRiC0QyoCsv4+bo++j5tcKukFMBM3ooi8pc9gFUkf9IxjEZk4+8dPV
 vK2fSUk3nf9wO01wtkzq5sIIXcSxLAfA57Fney3prEvGBbkbWS9yL8tmyGVwdAOfc5VG
 HRiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=d6SiIsSJpKpF/tM5CYzoKLRAPAf4ENKLfRBV6mw0RKE=;
 fh=M8r5WW2DnJKXNnE2sgxBJdQnaAKYBxYbuabD2VdxNUs=;
 b=Kf5KfxdIyxFKjYgV459jJA0cwXupMEhYm6dLlEKP3A3ThOqo3BFQ5tSjDvx7TVOt6t
 hkdmKD6HocY1Ud6Upga6thhM41Xq5tYbQk0adgUOWpqBzwGI7fmhxlwS86bRCdCWhiIz
 1/2mnQWv73YRXnXjfsZUc/cC6xkZsB9vxGDoAmiHA8tnlmkhEIJDaa4gPvmZg1efNcWS
 y4h+GfmMamVCX5Agk9E/Jsnv1EpsP78cQgehAmWcXEcUJuTIKsOi5cIWr4UkOuDaNbIM
 7BpSCmxZBzHNzrU/9VbARyOdpJtAYEbbx3d22iHBMQsxlhOeHK+meAPgJUtRPlN2q7bt
 UKMA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1778020148; x=1778624948;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=d6SiIsSJpKpF/tM5CYzoKLRAPAf4ENKLfRBV6mw0RKE=;
 b=Nq8Zc5JFDDJZ/IJuARfZZ1uVfwBjz938WnDsYiGVSkr2qIn60RW1tvNpeNj010mbx5
 0MAX6WYadvcOrJUWVZBt+N3Pxyz48Y9PN4jTe0GC3JhrU8DDn/Mofpt12/oZqgXN51NF
 Q6tiSPL3SYAeRuVXNs+96Vz80/V7STpZw/7oGU1G8DVfU54Edk53FL3X2Zk42E3R+zz8
 B34zpwxC3VpDsjplY7jXnqrpJZRy/Zir54uda/TCwCB03SnFETUv7YIArHbsGYNXX+VH
 wdV3skvZXbMOepD+VDgSTLFkBuAsIV+MOKzX/EJPWFDqjRKKHASV5jOR5pD4a9Byhp2J
 bjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778020148; x=1778624948;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d6SiIsSJpKpF/tM5CYzoKLRAPAf4ENKLfRBV6mw0RKE=;
 b=k2yWZ16yI9q+Tx9EJXvUe1cCMtLuZtqEC6MJjO7TlqsFWaPJw5W9m2dTBEe89oXNTT
 CNQ11w7wo2JstCpPBnlgT8YsPwGEoZnNxJ3MdrEM7tqOrXp19HYGAmJOsH1pPONqUw7M
 quIK5vG1ZFUsnnKVHRTRS+5/B6jsQWv6uQ3+3PjJMFt7b+zWD8PVzkEDgk82vFBPq7pB
 Ik+GCTpMjsbh86mMrMdj8rdggyERkGPov5KelIbFYwF31FTqWDoDKr0Yvpy7HjrXbV1I
 KuSbz5Z4p7XUf3H0xfTSXMNdorMl9ZmVLJAlQmV6BptaV6FlMkcd7I1/Jg63GkYraqKn
 6UMg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qh1Z2SV2uCWpw/3DHeeoq3rlmfGOFBzYtZKiKRW7UETKIs6S2BjZ1Ov+rkiR6AMz9GVMg9uk2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEIt7GbQaiFgda90vGhVocEFkDwdVuzffNGPctWCGs9y1d81ou
 bFVjt/kjPds7LxYLiO65bQ/Sa7Mxcx/yu2zDdP6E8j3r3exDk5+vRSfS7KhQvOrHfcgvuKWMKeQ
 08ePORDa8gAWSKO6dYNiHnQvDqfhRjrGfHMGqKXqB
X-Gm-Gg: AeBDieu42Uy9slqzTdJXFNsE+/dA3No9SvADmk38oNouBb6HDWBfQj8XdqTLTTPGyx8
 5RsoRalxN7NgqErdg/vNC27/DHPoBYai/bFYjEZ53gmI4aAKNOvXq835FL2uBB/X13f79YLRZip
 klsRLbpWQCBYaDxgRZJeFHQZeEOVa9kholy12+HROYTF8IhNdbGELK5/UKecrHvCWNq6+DawlYe
 x2ykn7LFCo3/VcKwvbT+gi9IgpjyycO/Qt166jPOgefsOg9XdT55vq+kkdOyGGGAebZ+jZWhaZp
 i9Agw/Hem4t+z4zxqyXvapAMJZdlWYeGdTx30mc0dfYVW5TSTBSxN0z4+V8AHc2PuVXrWtb8GeT
 0y2V9aD8p4Hvl+g5ynO6uGSYlNMk=
X-Received: by 2002:a17:907:743:b0:bae:d2dc:1114 with SMTP id
 a640c23a62f3a-bc56dd1a556mr17616866b.24.1778020147550; Tue, 05 May 2026
 15:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
 <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
 <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
 <2a95efab-841c-47c5-bafe-f80f59e45a32@intel.com>
 <CAMNLLoRO_-bF0-SaUVgMq0R0T8mc6yk4GmPY=_FCJwhLWohigA@mail.gmail.com>
In-Reply-To: <CAMNLLoRO_-bF0-SaUVgMq0R0T8mc6yk4GmPY=_FCJwhLWohigA@mail.gmail.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Tue, 5 May 2026 15:28:55 -0700
X-Gm-Features: AVHnY4KcemFEqIKgzpPuYNPvmDajcMgC75aF3_LrXLhggSSllczVpeAjsdmiRCA
Message-ID: <CAMNLLoSiS316uKO-1t31DmMcTaD9AC3ieJ7Kgfp=dF0sn6Nsbw@mail.gmail.com>
Subject: Re: [PATCH i-g-t v5 1/3] tests/kms_content_protection: Add per-CRTC
 framebuffer infrastructure
To: Karthik B S <karthik.b.s@intel.com>
Cc: Jason-JH Lin <jason-jh.lin@mediatek.com>, igt-dev@lists.freedesktop.org, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Fei Shao <fshao@chromium.org>, 
 Jani <jani.nikula@intel.com>, Paul-PL Chen <paul-pl.chen@mediatek.com>, 
 Nancy Lin <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
 Gil Dekel <gildekel@google.com>, Yacoub <markyacoub@chromium.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: multipart/alternative; boundary="0000000000004dc29e06511993e9"
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

--0000000000004dc29e06511993e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi @Karthik B S <karthik.b.s@intel.com> , were you able to test this
locally for regressions?
If you could add your R-B , we can get this landed as soon as possible.
This is time critical for us and is required to scale to MTK platform

Regards
Manasi

On Mon, May 4, 2026 at 1:32=E2=80=AFPM Manasi Navare <navaremanasi@google.c=
om>
wrote:

> Thanks a lot @Karthik B S <karthik.b.s@intel.com>  for your response,
> And appreciate you trying this on your end and for your help on getting
> this landed.
>
> Regards
> Manasi
>
> On Mon, May 4, 2026 at 1:31=E2=80=AFAM Karthik B S <karthik.b.s@intel.com=
> wrote:
>
>> Hi Manasi,
>> On 5/1/2026 4:29 AM, Manasi Navare wrote:
>>
>> This change looks good to me,
>>
>> Reviewed-by: Manasi Navare <navaremanasi@google.com>
>>
>> @Karthik B S <karthik.b.s@intel.com>  and others from Intel signal
>> boosting this, could we get some traction on this, its reviewed by the
>> team, could we please land this?
>>
>> Sure, the idea LGTM in general. Will try this out at our end once before
>> merging as this test doesn't have coverage on CI currently.
>> Regards,
>> Karthik.B.S
>>
>>
>> Regards
>> Manasi
>>
>> On Wed, Apr 29, 2026 at 1:31=E2=80=AFPM Manasi Navare <navaremanasi@goog=
le.com>
>> wrote:
>>
>>> Thanks Jason-JH for this improvement in the kms_content_protection IGT
>>> test.
>>> It makes sense to create a fb per CRTC given that each CRTC can have
>>> different mode timings/resolutions.
>>>
>>> @karthik.b.s@intel.com <karthik.b.s@intel.com> , @
>>> bhanuprakash.modem@gmail.com, @swati2.sharma@intel.com
>>> Could you please take a look at this patch and help provide feedback?
>>> We would like to get this landed as it helps improve our testing.
>>>
>>> Regards
>>> Manasi
>>>
>>>
>>>
>>> On Sun, Mar 29, 2026 at 8:22=E2=80=AFPM Jason-JH Lin <jason-jh.lin@medi=
atek.com>
>>> wrote:
>>>
>>>> Replace global framebuffers (data.red/green) with per-CRTC array
>>>> (data.fbs[IGT_MAX_PIPES]) to support multiple outputs with different
>>>> resolutions.
>>>>
>>>> Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at
>>>> test initialization/cleanup, creating each FB with the resolution of
>>>> the first output that can connect to that CRTC.
>>>>
>>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>>> ---
>>>>  tests/kms_content_protection.c | 50 +++++++++++++++++++++++++--------=
-
>>>>  1 file changed, 37 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/tests/kms_content_protection.c
>>>> b/tests/kms_content_protection.c
>>>> index caf3d7a56ae4..df9ff5efcaa2 100644
>>>> --- a/tests/kms_content_protection.c
>>>> +++ b/tests/kms_content_protection.c
>>>> @@ -107,10 +107,15 @@
>>>>
>>>>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>>>>
>>>> +struct hdcp_test_fbs {
>>>> +       struct igt_fb red;
>>>> +       struct igt_fb green;
>>>> +};
>>>> +
>>>>  struct data {
>>>>         int drm_fd;
>>>>         igt_display_t display;
>>>> -       struct igt_fb red, green;
>>>> +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>>>>         unsigned int cp_tests;
>>>>         struct udev_monitor *uevent_monitor;
>>>>         bool is_force_hdcp14;
>>>> @@ -991,31 +996,49 @@ static void test_content_protection_cleanup(void=
)
>>>>                 igt_info("CP Prop being UNDESIRED on %s\n",
>>>> output->name);
>>>>                 test_cp_disable(output, display->is_atomic ?
>>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>>>         }
>>>> -
>>>> -       igt_remove_fb(data.drm_fd, &data.red);
>>>> -       igt_remove_fb(data.drm_fd, &data.green);
>>>>  }
>>>>
>>>>  static void create_fbs(void)
>>>>  {
>>>> -       uint16_t width =3D 0, height =3D 0;
>>>>         drmModeModeInfo *mode;
>>>>         igt_output_t *output;
>>>> +       igt_crtc_t *crtc;
>>>>
>>>> +       /* Create framebuffers for each connected output's pipe */
>>>>         for_each_connected_output(&data.display, output) {
>>>>                 mode =3D igt_output_get_mode(output);
>>>>                 igt_assert(mode);
>>>>
>>>> -               width =3D max(width, mode->hdisplay);
>>>> -               height =3D max(height, mode->vdisplay);
>>>> +               /* Find a valid crtc for this output */
>>>> +               for_each_crtc(&data.display, crtc) {
>>>> +                       if (!igt_crtc_connector_valid(crtc, output))
>>>> +                               continue;
>>>> +
>>>> +                       /* Skip if already created for this crtc */
>>>> +                       if (data.fbs[crtc->crtc_index].red.fb_id)
>>>> +                               continue;
>>>> +
>>>> +                       igt_create_color_fb(data.drm_fd,
>>>> mode->hdisplay, mode->vdisplay,
>>>> +                                           DRM_FORMAT_XRGB8888,
>>>> DRM_FORMAT_MOD_LINEAR,
>>>> +                                           1.f, 0.f, 0.f,
>>>> &data.fbs[crtc->crtc_index].red);
>>>> +                       igt_create_color_fb(data.drm_fd,
>>>> mode->hdisplay, mode->vdisplay,
>>>> +                                           DRM_FORMAT_XRGB8888,
>>>> DRM_FORMAT_MOD_LINEAR,
>>>> +                                           0.f, 1.f, 0.f,
>>>> &data.fbs[crtc->crtc_index].green);
>>>> +                       break;
>>>> +               }
>>>>         }
>>>> +}
>>>>
>>>> -       igt_create_color_fb(data.drm_fd, width, height,
>>>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR=
,
>>>> -                           1.f, 0.f, 0.f, &data.red);
>>>> -       igt_create_color_fb(data.drm_fd, width, height,
>>>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR=
,
>>>> -                           0.f, 1.f, 0.f, &data.green);
>>>> +static void remove_fbs(void)
>>>> +{
>>>> +       igt_crtc_t *crtc;
>>>> +
>>>> +       for_each_crtc(&data.display, crtc) {
>>>> +               if (data.fbs[crtc->crtc_index].red.fb_id)
>>>> +                       igt_remove_fb(data.drm_fd,
>>>> &data.fbs[crtc->crtc_index].red);
>>>> +               if (data.fbs[crtc->crtc_index].green.fb_id)
>>>> +                       igt_remove_fb(data.drm_fd,
>>>> &data.fbs[crtc->crtc_index].green);
>>>> +       }
>>>>  }
>>>>
>>>>  static const struct {
>>>> @@ -1241,6 +1264,7 @@ int igt_main()
>>>>
>>>>         igt_fixture() {
>>>>                 test_content_protection_cleanup();
>>>> +               remove_fbs();
>>>>                 igt_display_fini(&data.display);
>>>>                 drm_close_driver(data.drm_fd);
>>>>         }
>>>> --
>>>> 2.43.0
>>>>
>>>>

--0000000000004dc29e06511993e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-3=
" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@Karthik B S</a>=C2=
=A0, were you able to test this locally for regressions?<div>If you could a=
dd your R-B , we can get this landed as=C2=A0soon as possible.</div><div>Th=
is is time critical for us and is required to scale to MTK platform</div><d=
iv><br></div><div>Regards</div><div>Manasi</div></div><br><div class=3D"gma=
il_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, May 4, 2026 at 1:32=E2=80=AFPM Manasi Navare &lt;<a href=3D"mailto:navar=
emanasi@google.com">navaremanasi@google.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Thanks a l=
ot=C2=A0<a class=3D"gmail_plusreply" id=3D"m_8697978727895870520plusReplyCh=
ip-1" href=3D"mailto:karthik.b.s@intel.com" target=3D"_blank">@Karthik B S<=
/a>=C2=A0 for your response,</div><div>And appreciate you trying this on yo=
ur end and for your help on getting this landed.</div><div><br></div><div>R=
egards</div><div>Manasi</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, May 4, 2026 at 1:31=E2=80=AFAM Karthik B S &=
lt;<a href=3D"mailto:karthik.b.s@intel.com" target=3D"_blank">karthik.b.s@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><u></u>

 =20
  <div>
    <p>Hi Manasi,</p>
    <div>On 5/1/2026 4:29 AM, Manasi Navare
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div>This change looks good to me,</div>
        <div><br>
        </div>
        <div>Reviewed-by: Manasi Navare &lt;<a href=3D"mailto:navaremanasi@=
google.com" target=3D"_blank">navaremanasi@google.com</a>&gt;</div>
        <div><br>
        </div>
        <div><a class=3D"gmail_plusreply" id=3D"m_8697978727895870520m_-277=
7679078897058853plusReplyChip-0" href=3D"mailto:karthik.b.s@intel.com" targ=
et=3D"_blank">@Karthik B S</a>=C2=A0 and others from
          Intel signal boosting this, could we get some traction on
          this, its reviewed by the team, could we please land this?<br>
        </div>
      </div>
    </blockquote>
    <p>Sure, the idea LGTM in general. Will try this out at our end once
      before merging as this test doesn&#39;t have coverage on CI currently=
.</p>
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
            1:31=E2=80=AFPM Manasi Navare &lt;<a href=3D"mailto:navaremanas=
i@google.com" target=3D"_blank">navaremanasi@google.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div>Thanks=C2=A0Jason-JH for this improvement=C2=A0in the
                kms_content_protection IGT test.</div>
              <div>It makes sense to create a fb per CRTC given that
                each CRTC can have different mode timings/resolutions.</div=
>
              <div><br>
              </div>
              <div><a class=3D"gmail_plusreply" id=3D"m_8697978727895870520=
m_-2777679078897058853m_1039234134813026890plusReplyChip-1" href=3D"mailto:=
karthik.b.s@intel.com" target=3D"_blank">@karthik.b.s@intel.com</a>=C2=A0, =
@<a href=3D"mailto:bhanuprakash.modem@gmail.com" target=3D"_blank">bhanupra=
kash.modem@gmail.com</a>,=C2=A0@<a href=3D"mailto:swati2.sharma@intel.com" =
target=3D"_blank">swati2.sharma@intel.com</a><br>
              </div>
              <div>Could you please take a look at this patch and help
                provide feedback?</div>
              <div>We would like to get this landed as it helps improve
                our testing.</div>
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
                <div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 29, 2026
                  at 8:22=E2=80=AFPM Jason-JH Lin &lt;<a href=3D"mailto:jas=
on-jh.lin@mediatek.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Replace
                  global framebuffers (data.red/green) with per-CRTC
                  array<br>
                  (data.fbs[IGT_MAX_PIPES]) to support multiple outputs
                  with different<br>
                  resolutions.<br>
                  <br>
                  Add create_fbs()/remove_fbs() to manage framebuffer
                  lifecycle at<br>
                  test initialization/cleanup, creating each FB with the
                  resolution of<br>
                  the first output that can connect to that CRTC.<br>
                  <br>
                  Signed-off-by: Jason-JH Lin &lt;<a href=3D"mailto:jason-j=
h.lin@mediatek.com" target=3D"_blank">jason-jh.lin@mediatek.com</a>&gt;<br>
                  Reviewed-by: Fei Shao &lt;<a href=3D"mailto:fshao@chromiu=
m.org" target=3D"_blank">fshao@chromium.org</a>&gt;<br>
                  ---<br>
                  =C2=A0tests/kms_content_protection.c | 50
                  +++++++++++++++++++++++++---------<br>
                  =C2=A01 file changed, 37 insertions(+), 13 deletions(-)<b=
r>
                  <br>
                  diff --git a/tests/kms_content_protection.c
                  b/tests/kms_content_protection.c<br>
                  index caf3d7a56ae4..df9ff5efcaa2 100644<br>
                  --- a/tests/kms_content_protection.c<br>
                  +++ b/tests/kms_content_protection.c<br>
                  @@ -107,10 +107,15 @@<br>
                  <br>
                  =C2=A0IGT_TEST_DESCRIPTION(&quot;Test content protection
                  (HDCP)&quot;);<br>
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
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct hdcp_test_fbs fbs[IGT_=
MAX_PIPES];<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int cp_tests;<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct udev_monitor *uevent_m=
onitor;<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool is_force_hdcp14;<br>
                  @@ -991,31 +996,49 @@ static void
                  test_content_protection_cleanup(void)<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
gt_info(&quot;CP Prop being UNDESIRED on
                  %s\n&quot;, output-&gt;name);<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
est_cp_disable(output,
                  display-&gt;is_atomic ? COMMIT_ATOMIC :
                  COMMIT_LEGACY);<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
                  -<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data.drm_fd, &a=
mp;data.red);<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data.drm_fd, &a=
mp;data.green);<br>
                  =C2=A0}<br>
                  <br>
                  =C2=A0static void create_fbs(void)<br>
                  =C2=A0{<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0uint16_t width =3D 0, height =
=3D 0;<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 drmModeModeInfo *mode;<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_output_t *output;<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_crtc_t *crtc;<br>
                  <br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Create framebuffers for ea=
ch connected
                  output&#39;s pipe */<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 for_each_connected_output(&am=
p;data.display,
                  output) {<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 m=
ode =3D igt_output_get_mode(output);<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
gt_assert(mode);<br>
                  <br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0w=
idth =3D max(width, mode-&gt;hdisplay);<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0h=
eight =3D max(height,
                  mode-&gt;vdisplay);<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/=
* Find a valid crtc for this output
                  */<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0f=
or_each_crtc(&amp;data.display, crtc)
                  {<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if
                  (!igt_crtc_connector_valid(crtc, output))<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
                  +<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Skip if already created for
                  this crtc */<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if
                  (data.fbs[crtc-&gt;crtc_index].red.fb_id)<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;<br>
                  +<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0
                  =C2=A0igt_create_color_fb(data.drm_fd, mode-&gt;hdisplay,
                  mode-&gt;vdisplay,<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
                  =C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01.f, 0.f,
                  0.f, &amp;data.fbs[crtc-&gt;crtc_index].red);<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0
                  =C2=A0igt_create_color_fb(data.drm_fd, mode-&gt;hdisplay,
                  mode-&gt;vdisplay,<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0
                  =C2=A0DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00.f, 1.f,
                  0.f, &amp;data.fbs[crtc-&gt;crtc_index].green);<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}=
<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
                  +}<br>
                  <br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_create_color_fb(data.drm_=
fd, width,
                  height,<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,
                  DRM_FORMAT_MOD_LINEAR,<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.f, 0.f, 0.f,
                  &amp;data.red);<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_create_color_fb(data.drm_=
fd, width,
                  height,<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,
                  DRM_FORMAT_MOD_LINEAR,<br>
                  -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.f, 1.f, 0.f,
                  &amp;data.green);<br>
                  +static void remove_fbs(void)<br>
                  +{<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_crtc_t *crtc;<br>
                  +<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_crtc(&amp;data.displ=
ay, crtc) {<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f
                  (data.fbs[crtc-&gt;crtc_index].red.fb_id)<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data.drm_fd,
                  &amp;data.fbs[crtc-&gt;crtc_index].red);<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i=
f
                  (data.fbs[crtc-&gt;crtc_index].green.fb_id)<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0igt_remove_fb(data.drm_fd,
                  &amp;data.fbs[crtc-&gt;crtc_index].green);<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
                  =C2=A0}<br>
                  <br>
                  =C2=A0static const struct {<br>
                  @@ -1241,6 +1264,7 @@ int igt_main()<br>
                  <br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 igt_fixture() {<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
est_content_protection_cleanup();<br>
                  +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r=
emove_fbs();<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 i=
gt_display_fini(&amp;data.display);<br>
                  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 d=
rm_close_driver(data.drm_fd);<br>
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

</blockquote></div></div>
</blockquote></div>

--0000000000004dc29e06511993e9--
