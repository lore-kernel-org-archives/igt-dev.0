Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFF6FF8875
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 20:32:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7850A10E041;
	Wed, 29 Apr 2026 20:32:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="NgWhgeDE";
	dkim-atps=neutral
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 674C210E041
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 20:32:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-672645dbfeaso231757a12.0
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 13:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777494732; cv=none;
 d=google.com; s=arc-20240605;
 b=EhINjaUVFulxGB4plTxl2DAMk0uIAfDPqdaZvO9xuqG7Ltcl01XVR6BYh6yq4rIDm9
 mWoXNXAn5WpkAKamkfQyIub0jaVYh5Xu8wz2Z25eZiEDeGV/zqrGBxcS5HpZUudm6FCt
 EO+UC/z8UrFujj1V41TJ/v4LWdY94ZY6OnQKEE4yav3s3GLCJwAe4wJMnQ5NWe6k/moL
 /HCgXeXDl2OAZUNR0XmIhv4eYKHHVkdgm2W9JcqiUBeqdpbfJG8HKC+NGJ+E5eQkJzev
 ryGuoMRZBGyEFb7aYMLqEkUC31zXpDHuLzt7GT/RIAXf5mSeNBoWdiTzV4sZGPAFV9az
 UBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=ouicIFfiHizKz2EClVDa+cGBpmTEyPGt8UdSSJOKplI=;
 fh=efnYlFohctE3XauRDK0z680Ql1GH19F4h1uknwBjDzA=;
 b=Sj5Fez/lVHu1dkbCkS8AfmzC2TTgWygDvdtK1U/wXB9HzzqTHxRgv7iGB5i+scNomb
 qoDMVehtn+NxX1N7dPA9a07EoVhkhE8SI6H7rDkpgMMowaLFuGLnx/qG1D3zeV/NEB4i
 Ecu1hUHaqcimhvJAIineNU2rS89nr58oxbgAxzuFtvuI8R2Re2qk9WDBWnUvt9Bt45Db
 mInUHaopXnq47K5zwAcETM1pL8ury1bz9mfHGHPquqc/iHG/dmKL9QeuIHb6RBjDV47c
 zsW2JRVrb7/0Den2bkdDu7Jsi365ytFNg8MlBaWQ1Ul1fkaUCQ83zaHlW4obV03s6qUb
 DbbA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1777494732; x=1778099532;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ouicIFfiHizKz2EClVDa+cGBpmTEyPGt8UdSSJOKplI=;
 b=NgWhgeDELaSI5667l5vuE5R5hvhIhN43u8d0g7epVHnN/U3cB6vSOcEABgvqGFHpzx
 DF51e0Q2T9q8KSpCXlDWrwaT9QXE5mVXfANE+kwf359LoHY+9Sn7wCO8NFA+AYoopgpV
 Y2uMLJOsYMDHChO2xSGcFW9OacziiFdpFU+PzXnNLnkfxbBZnOGxHzBYmpsWp8z262a/
 V/U7JvpMkQC+Or02SpmOaXpFoZe1O4crlBUr5EmiWAV0pTy8tJaWnIgb6f3T1SZkoOzI
 sKhXfcQHO/JtBlxJv2IGliUtzzRIXkWjQ0l2iNF9V0Ak4xcDV538WytNOQ9odMyc+dxb
 IFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777494732; x=1778099532;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ouicIFfiHizKz2EClVDa+cGBpmTEyPGt8UdSSJOKplI=;
 b=DTFX8PNyUbOmrHJsr68CAotLw0dobti/KoXTHfcE86uwc0ARQWECgZwgSSEgRw41Gv
 h+R56zxNDHpPHCEm3ApQN9BHGckLxtFrpWFfGB5M/XyudQBQZCjW0JWDlcnEEXwlKdDu
 TUnB0bz1IMS+T2ednDJxLEpoxCJge/uMBv+sQ5YHHkAb3QxplzDfMKQ8tyW6HB7WMMWI
 zMGfNInPHqgrL/NdL3spVPtrCeTgTduwvBJh7BZkzw+sjNUsZXEC3815OvnPStm1lUMo
 m7LbCvo893Yng255ilrI2s8yqehqkM4IdPqmYozOpCXgVhkR+LjGeo/E3vThiwG+W/Ls
 W+zA==
X-Gm-Message-State: AOJu0YyGhfMuWPGANqLA5yighTA5Kz5JPZjqLojv2zc4xKzRA8whqX4K
 nLDeUN9smquIReBy/XfSeBEs3zr7Om1SDQyeTxt0xSDfkxow42rtbgix/qaHbQZmVqGaec36oVB
 d7t/WWL+q/S90sR0IldaOpOyjg+HhUy4w6VvfS+rZ
X-Gm-Gg: AeBDievMHmEJP8IPgPLmBhR6ENnxAT+7SGOupJDDwYugDwJsy2bCO6YqMiSZf3GP8ci
 WJuoyuogFMZXhqRdxtcmOmsvOpSr7OV+75rBkaHGjqKIxoF74N7SC6ZSfE1hkmYDST+Pk7+X2ZE
 MkFmtO2FfzWTHUXp8Qy3v0AKPoTsrDQFMuUO3GtoFAZwmnkTgVwDkm9fMVWagabQkjp0tjNlpuF
 L+zMoLwExG5VoTkRtZI2GtgxjQUL8R7Wy9lFX/N4NIsG7+rUvfbKR9lhPd626xTHsA0Gee5bOQa
 vXTvuPWqONZJccswvbduNVJ5Z9YRFelCGQhzaMZGRSdwCOKh3245Mmg73B31NVWYVOPvlI7gh3o
 hA57upeiQ8bPkHaa3McIBDuTq9rI=
X-Received: by 2002:a17:907:72ca:b0:bab:ca56:a42a with SMTP id
 a640c23a62f3a-bbad547297emr15381266b.42.1777494731304; Wed, 29 Apr 2026
 13:32:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260330032205.467130-1-jason-jh.lin@mediatek.com>
 <20260330032205.467130-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20260330032205.467130-2-jason-jh.lin@mediatek.com>
From: Manasi Navare <navaremanasi@google.com>
Date: Wed, 29 Apr 2026 13:31:59 -0700
X-Gm-Features: AVHnY4J86SKSewy47oJ0u9gHfAeLX7SmD602exUUYG3MhvFjm8xPlYmfLM-c5cQ
Message-ID: <CAMNLLoSPncgBBOGc--Mi=Kb8-Uok5ZOxS3Fj+oFQTRJtrkEKYg@mail.gmail.com>
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
Content-Type: multipart/alternative; boundary="0000000000000da17d06509f3e53"
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

--0000000000000da17d06509f3e53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jason-JH for this improvement in the kms_content_protection IGT test=
.
It makes sense to create a fb per CRTC given that each CRTC can have
different mode timings/resolutions.

@karthik.b.s@intel.com <karthik.b.s@intel.com> , @
bhanuprakash.modem@gmail.com, @swati2.sharma@intel.com
Could you please take a look at this patch and help provide feedback?
We would like to get this landed as it helps improve our testing.

Regards
Manasi



On Sun, Mar 29, 2026 at 8:22=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediatek=
.com>
wrote:

> Replace global framebuffers (data.red/green) with per-CRTC array
> (data.fbs[IGT_MAX_PIPES]) to support multiple outputs with different
> resolutions.
>
> Add create_fbs()/remove_fbs() to manage framebuffer lifecycle at
> test initialization/cleanup, creating each FB with the resolution of
> the first output that can connect to that CRTC.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> ---
>  tests/kms_content_protection.c | 50 +++++++++++++++++++++++++---------
>  1 file changed, 37 insertions(+), 13 deletions(-)
>
> diff --git a/tests/kms_content_protection.c
> b/tests/kms_content_protection.c
> index caf3d7a56ae4..df9ff5efcaa2 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -107,10 +107,15 @@
>
>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>
> +struct hdcp_test_fbs {
> +       struct igt_fb red;
> +       struct igt_fb green;
> +};
> +
>  struct data {
>         int drm_fd;
>         igt_display_t display;
> -       struct igt_fb red, green;
> +       struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
>         unsigned int cp_tests;
>         struct udev_monitor *uevent_monitor;
>         bool is_force_hdcp14;
> @@ -991,31 +996,49 @@ static void test_content_protection_cleanup(void)
>                 igt_info("CP Prop being UNDESIRED on %s\n", output->name)=
;
>                 test_cp_disable(output, display->is_atomic ? COMMIT_ATOMI=
C
> : COMMIT_LEGACY);
>         }
> -
> -       igt_remove_fb(data.drm_fd, &data.red);
> -       igt_remove_fb(data.drm_fd, &data.green);
>  }
>
>  static void create_fbs(void)
>  {
> -       uint16_t width =3D 0, height =3D 0;
>         drmModeModeInfo *mode;
>         igt_output_t *output;
> +       igt_crtc_t *crtc;
>
> +       /* Create framebuffers for each connected output's pipe */
>         for_each_connected_output(&data.display, output) {
>                 mode =3D igt_output_get_mode(output);
>                 igt_assert(mode);
>
> -               width =3D max(width, mode->hdisplay);
> -               height =3D max(height, mode->vdisplay);
> +               /* Find a valid crtc for this output */
> +               for_each_crtc(&data.display, crtc) {
> +                       if (!igt_crtc_connector_valid(crtc, output))
> +                               continue;
> +
> +                       /* Skip if already created for this crtc */
> +                       if (data.fbs[crtc->crtc_index].red.fb_id)
> +                               continue;
> +
> +                       igt_create_color_fb(data.drm_fd, mode->hdisplay,
> mode->vdisplay,
> +                                           DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +                                           1.f, 0.f, 0.f,
> &data.fbs[crtc->crtc_index].red);
> +                       igt_create_color_fb(data.drm_fd, mode->hdisplay,
> mode->vdisplay,
> +                                           DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +                                           0.f, 1.f, 0.f,
> &data.fbs[crtc->crtc_index].green);
> +                       break;
> +               }
>         }
> +}
>
> -       igt_create_color_fb(data.drm_fd, width, height,
> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -                           1.f, 0.f, 0.f, &data.red);
> -       igt_create_color_fb(data.drm_fd, width, height,
> -                           DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> -                           0.f, 1.f, 0.f, &data.green);
> +static void remove_fbs(void)
> +{
> +       igt_crtc_t *crtc;
> +
> +       for_each_crtc(&data.display, crtc) {
> +               if (data.fbs[crtc->crtc_index].red.fb_id)
> +                       igt_remove_fb(data.drm_fd,
> &data.fbs[crtc->crtc_index].red);
> +               if (data.fbs[crtc->crtc_index].green.fb_id)
> +                       igt_remove_fb(data.drm_fd,
> &data.fbs[crtc->crtc_index].green);
> +       }
>  }
>
>  static const struct {
> @@ -1241,6 +1264,7 @@ int igt_main()
>
>         igt_fixture() {
>                 test_content_protection_cleanup();
> +               remove_fbs();
>                 igt_display_fini(&data.display);
>                 drm_close_driver(data.drm_fd);
>         }
> --
> 2.43.0
>
>

--0000000000000da17d06509f3e53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks=C2=A0Jason-JH for this improvement=C2=A0in the=
 kms_content_protection IGT test.</div><div>It makes sense to create a fb p=
er CRTC given that each CRTC can have different mode timings/resolutions.</=
div><div><br></div><div><a class=3D"gmail_plusreply" id=3D"plusReplyChip-1"=
 href=3D"mailto:karthik.b.s@intel.com" tabindex=3D"-1">@karthik.b.s@intel.c=
om</a>=C2=A0, @<a href=3D"mailto:bhanuprakash.modem@gmail.com">bhanuprakash=
.modem@gmail.com</a>,=C2=A0@<a href=3D"mailto:swati2.sharma@intel.com">swat=
i2.sharma@intel.com</a><br></div><div>Could you please take a look at this =
patch and help provide feedback?</div><div>We would like to get this landed=
 as it helps improve our testing.</div><div><br></div><div>Regards</div><di=
v>Manasi</div><div><br></div><div><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 29,=
 2026 at 8:22=E2=80=AFPM Jason-JH Lin &lt;<a href=3D"mailto:jason-jh.lin@me=
diatek.com">jason-jh.lin@mediatek.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">Replace global framebuffers (data.red/=
green) with per-CRTC array<br>
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

--0000000000000da17d06509f3e53--
