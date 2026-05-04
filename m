Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C854CD3427
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 20:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C530B10E86B;
	Mon,  4 May 2026 20:32:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="G15Luj1I";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9110E86B
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 20:32:30 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-ba6838e76f2so524739966b.2
 for <igt-dev@lists.freedesktop.org>; Mon, 04 May 2026 13:32:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777926749; cv=none;
 d=google.com; s=arc-20240605;
 b=D3RpKAZTsOI6cGvD9XOr6NeKmh6oAD0MUmdq7AbPr6qxqyBOAbDgr3LBqRDoSBeiXV
 b5KQFH8X4VlAb6qUrOHY4cBpY03BnpPhKExnF6jizkFc5PO9yaNmE12MLNTdpklzfKfP
 XRQSc9WjGnqavQXrJSIaKx7qiT/Fm4ZRAUur5Z1jopy+uYnc0377RN9Jtm6nW2fm9g6G
 uASkJPsFiXG9PSTKk/ypNO72IhQOFLCReI1eLt6WtjqH68tQOwF2cZQgIVWhd9XtnibV
 m2wqfjOGDeA+hhaWCTEraG+Ly7CqihlTydZGRu8enct0ClWWYXfktvylzTQlfiN5lJ1Y
 EmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hpjzpKU6p+o10VKc6+Hz7WyTIIfFTuvj8bX1PAco+mQ=;
 fh=4MiY8lZKuzZUWr7CQlPLx2c2emmgbYf/dM33a5XUADk=;
 b=a+0BDEwdQleMVuBYvBw0hHzYaRV7YvBrsh+dUlOLJa+TsLASiuiEg5OXJ9JfcrLdm+
 5hed601w+XVZtzbn9mpOvbDdl26XVaxj3nW14dHPL8nOEwb3g/KC4eeQ7m/SXgeZ9TpJ
 lVpdANZWEVbANLFfAjjMf5Te0mul/dgJvErELugISMkwDe5jQoVOYq0XdBhwOrSL4N1C
 a4rAY9Vfa+3otRz7mojTq7GKjP96BqiyqGLsGYWv+/0NuaFEMSbvji9/2LRcJOw8u8+W
 +/fH2tUy3V9Q2zR1wUakvQaLPde2gR5OOpajyw/glmcqVkUbri81yJXBzN8yBI7JBO7N
 iG/w==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1777926749; x=1778531549;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hpjzpKU6p+o10VKc6+Hz7WyTIIfFTuvj8bX1PAco+mQ=;
 b=G15Luj1I7HmWwzVvsFyeSKjpmiRE9gkdH82RST1k9+pnXCtuTogFhlYxshhNjqXf/4
 ccN1ATCYnq5gEPaczUL7E1+rWIFa7t4RjHkUdU8ROWvPC/Eb4s+sRwfzquTZwe46oWSb
 PkbwKGb3uJKU3Srq3HB3eLepjtVMSBzj6BZQu6WhmToowzZJ3VjYpx2l9mtkGkYenck9
 /FW8+WqD6kppY5DPJgBsK1xbcxiAnGZLDb6SAp3ELhKf6v7CwFfCJTr5Gk6rR7XTcH57
 IyJAr9ckB8CkunouH5BzF7YFqUVv+u7esijSVW6SrUdUBEhtDb1eN7ZW9ojcnPcmL+iU
 iRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777926749; x=1778531549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hpjzpKU6p+o10VKc6+Hz7WyTIIfFTuvj8bX1PAco+mQ=;
 b=jrVcKbiXqYcFgZYrN8JAe5TO0sCruhRTLI5aWdswlMDkS6aCXJhwwQFTR257qXiJz1
 /Z735FyXIXdqlRvbMr9m0XUR3I7ZWX0wk9h122Au5ZQmxRwxhRIV0kkePlgoydvqZXyA
 jGUvrVH8sXtBFmkuxvl7Z8seDeZgqbO4WC6e/NL7MLSXlvTg6GrszEgkrApuBxVYaGDN
 w7DrXUokgEn9bNXmi5gXRFnldOTGCMRwzjhPUgjploZc0wM1d8k1iHXSPzl2ZQJMJ0X/
 wZYVNflGSsMOabqn1fx/0pue+DGSw6M5z4FzWJyGrlv1bb5W/bmEdieYvh+F+axLOd3d
 B+NQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9MFYnhhpAPvmZTCUBI+xbpI3JYWOd/at8FrW9piM62N0GXlyUaiIvcdDcisKf6EjqLhr1g6vPW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkSASvL4NZ8kfSn8D9j9iwsCA2kn/Rq4FeYVIuTtrn+n3VB8Hl
 h+dDqhNky3lGzGdok0DY73lKHTGFKvfFSVMp+em+7UFQ9V1Z6+GNFM9AIU6aw90UbTGcUnFz70S
 unwpRMig5RkKI+GuBA+eqOZzCcXpmM0qsdR5quMWP
X-Gm-Gg: AeBDiesuib+ziAyUG9gXzYj/ph0Tn+agEnvfSdJ/vm28Bnhpmv1pED2tJbIDNTjXTX3
 rtIQ+/9EzFVAuY4kABFORAdo77YPnt1uD7/qIPFf9tbV2sw6C1VR6bbKQdgr5ssifEW7QSlD9js
 LFKekPGuOSZ0DPeKpr+1VqW/vGI00/rRTJfn11WSfub/W+EDrDRftPLWtCzjntKJdvi4RZczI63
 /1KtmQJ18tv9M2m6S4DYq9dCRVFbwSPP+zpK0byPbQHodG9ohu8jQZw4dqewBMGmM/x/mEd0wRV
 6E4v1mJBZTYLTIPgjjRf4Bd1HnY7ulVFjtKlr39s3pP82cHh7XLKPJcx/SIUtWZN6GYejzPCT2B
 AIrFxBHStWEfkjEkAwxkpZ1AiuSEphmwxVRYiQBxk21GRCTkm3WwuC9YDsQ==
X-Received: by 2002:a17:907:d10:b0:bac:14e:3b60 with SMTP id
 a640c23a62f3a-bbffaf3d920mr632712866b.22.1777926748661; Mon, 04 May 2026
 13:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
 <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
 <CAMNLLoRrGA34vVZg6HAGwqrsVbZWEOtD9F4yKWmboiAwp+2paA@mail.gmail.com>
 <2a95efab-841c-47c5-bafe-f80f59e45a32@intel.com>
In-Reply-To: <2a95efab-841c-47c5-bafe-f80f59e45a32@intel.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Mon, 4 May 2026 13:32:15 -0700
X-Gm-Features: AVHnY4KBOkPdrPKi-6l82YlSu7NluJoffiOEhpauIzYkZMmSzuRLLmHDhNELvhA
Message-ID: <CAMNLLoRO_-bF0-SaUVgMq0R0T8mc6yk4GmPY=_FCJwhLWohigA@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000004bf87a065103d468"
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

--0000000000004bf87a065103d468
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks a lot @Karthik B S <karthik.b.s@intel.com>  for your response,
And appreciate you trying this on your end and for your help on getting
this landed.

Regards
Manasi

On Mon, May 4, 2026 at 1:31=E2=80=AFAM Karthik B S <karthik.b.s@intel.com> =
wrote:

> Hi Manasi,
> On 5/1/2026 4:29 AM, Manasi Navare wrote:
>
> This change looks good to me,
>
> Reviewed-by: Manasi Navare <navaremanasi@google.com>
>
> @Karthik B S <karthik.b.s@intel.com>  and others from Intel signal
> boosting this, could we get some traction on this, its reviewed by the
> team, could we please land this?
>
> Sure, the idea LGTM in general. Will try this out at our end once before
> merging as this test doesn't have coverage on CI currently.
> Regards,
> Karthik.B.S
>
>
> Regards
> Manasi
>
> On Wed, Apr 29, 2026 at 1:31=E2=80=AFPM Manasi Navare <navaremanasi@googl=
e.com>
> wrote:
>
>> Thanks Jason-JH for this improvement in the kms_content_protection IGT
>> test.
>> It makes sense to create a fb per CRTC given that each CRTC can have
>> different mode timings/resolutions.
>>
>> @karthik.b.s@intel.com <karthik.b.s@intel.com> , @
>> bhanuprakash.modem@gmail.com, @swati2.sharma@intel.com
>> Could you please take a look at this patch and help provide feedback?
>> We would like to get this landed as it helps improve our testing.
>>
>> Regards
>> Manasi
>>
>>
>>
>> On Sun, Mar 29, 2026 at 8:22=E2=80=AFPM Jason-JH Lin <jason-jh.lin@media=
tek.com>
>> wrote:
>>
>>> Replace global framebuffers (data.red/green) with per-CRTC array
>>> (data.fbs[IGT_MAX_PIPES]) to support multiple outputs with different
>>> resolutions.
>>>
>>> Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at
>>> test initialization/cleanup, creating each FB with the resolution of
>>> the first output that can connect to that CRTC.
>>>
>>> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
>>> Reviewed-by: Fei Shao <fshao@chromium.org>
>>> ---
>>>  tests/kms_content_protection.c | 50 +++++++++++++++++++++++++---------
>>>  1 file changed, 37 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/tests/kms_content_protection.c
>>> b/tests/kms_content_protection.c
>>> index caf3d7a56ae4..df9ff5efcaa2 100644
>>> --- a/tests/kms_content_protection.c
>>> +++ b/tests/kms_content_protection.c
>>> @@ -107,10 +107,15 @@
>>>
>>>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>>>
>>> +struct hdcp_test_fbs {
>>> +       struct igt_fb red;
>>> +       struct igt_fb green;
>>> +};
>>> +
>>>  struct data {
>>>         int drm_fd;
>>>         igt_display_t display;
>>> -       struct igt_fb red, green;
>>> +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>>>         unsigned int cp_tests;
>>>         struct udev_monitor *uevent_monitor;
>>>         bool is_force_hdcp14;
>>> @@ -991,31 +996,49 @@ static void test_content_protection_cleanup(void)
>>>                 igt_info("CP Prop being UNDESIRED on %s\n",
>>> output->name);
>>>                 test_cp_disable(output, display->is_atomic ?
>>> COMMIT_ATOMIC : COMMIT_LEGACY);
>>>         }
>>> -
>>> -       igt_remove_fb(data.drm_fd, &data.red);
>>> -       igt_remove_fb(data.drm_fd, &data.green);
>>>  }
>>>
>>>  static void create_fbs(void)
>>>  {
>>> -       uint16_t width =3D 0, height =3D 0;
>>>         drmModeModeInfo *mode;
>>>         igt_output_t *output;
>>> +       igt_crtc_t *crtc;
>>>
>>> +       /* Create framebuffers for each connected output's pipe */
>>>         for_each_connected_output(&data.display, output) {
>>>                 mode =3D igt_output_get_mode(output);
>>>                 igt_assert(mode);
>>>
>>> -               width =3D max(width, mode->hdisplay);
>>> -               height =3D max(height, mode->vdisplay);
>>> +               /* Find a valid crtc for this output */
>>> +               for_each_crtc(&data.display, crtc) {
>>> +                       if (!igt_crtc_connector_valid(crtc, output))
>>> +                               continue;
>>> +
>>> +                       /* Skip if already created for this crtc */
>>> +                       if (data.fbs[crtc->crtc_index].red.fb_id)
>>> +                               continue;
>>> +
>>> +                       igt_create_color_fb(data.drm_fd, mode->hdisplay=
,
>>> mode->vdisplay,
>>> +                                           DRM_FORMAT_XRGB8888,
>>> DRM_FORMAT_MOD_LINEAR,
>>> +                                           1.f, 0.f, 0.f,
>>> &data.fbs[crtc->crtc_index].red);
>>> +                       igt_create_color_fb(data.drm_fd, mode->hdisplay=
,
>>> mode->vdisplay,
>>> +                                           DRM_FORMAT_XRGB8888,
>>> DRM_FORMAT_MOD_LINEAR,
>>> +                                           0.f, 1.f, 0.f,
>>> &data.fbs[crtc->crtc_index].green);
>>> +                       break;
>>> +               }
>>>         }
>>> +}
>>>
>>> -       igt_create_color_fb(data.drm_fd, width, height,
>>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>> -                           1.f, 0.f, 0.f, &data.red);
>>> -       igt_create_color_fb(data.drm_fd, width, height,
>>> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>>> -                           0.f, 1.f, 0.f, &data.green);
>>> +static void remove_fbs(void)
>>> +{
>>> +       igt_crtc_t *crtc;
>>> +
>>> +       for_each_crtc(&data.display, crtc) {
>>> +               if (data.fbs[crtc->crtc_index].red.fb_id)
>>> +                       igt_remove_fb(data.drm_fd,
>>> &data.fbs[crtc->crtc_index].red);
>>> +               if (data.fbs[crtc->crtc_index].green.fb_id)
>>> +                       igt_remove_fb(data.drm_fd,
>>> &data.fbs[crtc->crtc_index].green);
>>> +       }
>>>  }
>>>
>>>  static const struct {
>>> @@ -1241,6 +1264,7 @@ int igt_main()
>>>
>>>         igt_fixture() {
>>>                 test_content_protection_cleanup();
>>> +               remove_fbs();
>>>                 igt_display_fini(&data.display);
>>>                 drm_close_driver(data.drm_fd);
>>>         }
>>> --
>>> 2.43.0
>>>
>>>

--0000000000004bf87a065103d468
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks a lot=C2=A0<a class=3D"gmail_plusreply" id=3D"=
plusReplyChip-1" href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@Kar=
thik B S</a>=C2=A0 for your response,</div><div>And appreciate you trying t=
his on your end and for your help on getting this landed.</div><div><br></d=
iv><div>Regards</div><div>Manasi</div><br><div class=3D"gmail_quote gmail_q=
uote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 4, 2026 a=
t 1:31=E2=80=AFAM Karthik B S &lt;<a href=3D"mailto:karthik.b.s@intel.com">=
karthik.b.s@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><u></u>

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
        <div><a class=3D"gmail_plusreply" id=3D"m_-2777679078897058853plusR=
eplyChip-0" href=3D"mailto:karthik.b.s@intel.com" target=3D"_blank">@Karthi=
k B S</a>=C2=A0 and others from
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
              <div><a class=3D"gmail_plusreply" id=3D"m_-277767907889705885=
3m_1039234134813026890plusReplyChip-1" href=3D"mailto:karthik.b.s@intel.com=
" target=3D"_blank">@karthik.b.s@intel.com</a>=C2=A0, @<a href=3D"mailto:bh=
anuprakash.modem@gmail.com" target=3D"_blank">bhanuprakash.modem@gmail.com<=
/a>,=C2=A0@<a href=3D"mailto:swati2.sharma@intel.com" target=3D"_blank">swa=
ti2.sharma@intel.com</a><br>
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

--0000000000004bf87a065103d468--
