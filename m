Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92447F33829
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 09:33:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42FE710E3F4;
	Tue, 17 Mar 2026 09:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="bvscK9ym";
	dkim-atps=neutral
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F16A10E4CE
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 09:33:31 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-56a9a7e762bso5234374e0c.3
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1773740010; x=1774344810;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YFUEWGBSQp8Q9h+NmGVEXfj3k7BAPV/ouodzJB7Fctk=;
 b=bvscK9ymZO/m80zQqke+32VESmixX1rpE/RNz9i0snUbT46zwXzzxSwMiNcdtY8h7r
 tbN0w82kdXls4iJblALkf4YJI6xUF9sWTwjHuGCrPdE8KRHVwQuEO7+1yn2krfVPaU0s
 ZwTCmoSqR0ckFyLadkV5+58HURfBV9bNO9hPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773740010; x=1774344810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YFUEWGBSQp8Q9h+NmGVEXfj3k7BAPV/ouodzJB7Fctk=;
 b=lCxworcM7p4MT2EZ9C9WxIDJq2+kFJAbOHsdl7z9alnpT08sB+A8yHB9BnHyMdq4Kb
 fIWyH4LF6C0sa5gf81qvs9MRpV+bCDdnZ+8ShH0m6gIu+hpYsnKMXESFOoqoZ5WXI2Z7
 DwYWpXON5jJ4fvEe9DZrq2jlzNLAsSmoCkEX9N29sT+lXsWW3F8BfS9ZOlPhDpE2n+Yp
 LCGK9xefF2DMDrIRRcghe3MR22vqXa78h7YA+56YM7C2iKUP9YiehSQzoNdhmBQSQNc/
 Tb8y8im77b6+C7OPkRdo1vSCIo+3F6RKHt7RQtnBPmD4HNd1Nc8pLiQEfK12CG7e39uW
 Qo1w==
X-Gm-Message-State: AOJu0YxdesIY2rnIHXKR0aS+KBExV95mfN0ql8zefOn513KotBCXZ0Rg
 YTAIlLn7TceYOWH+Dy/IaZHOtmvo1nX5SyGYU2iSkVJkwxxSZJhaAXQ5jXrWMYMaXKsHEZ4MDkT
 LMxI=
X-Gm-Gg: ATEYQzyXSdv7Iow08n94J4EffIcl/nYtzkj+w2+vz6PphCQgEoAYc1LVPZme2zEAgnI
 0J4KRr+sUhl5KJA/awn/4zf0Oy97wnHKWm8BEPj95oxu2wGDc/MiyRNzgOyLJbzpKT0P71nmCx2
 9la/ugH4FJvKlKFTBDThGgByRtf/eTwVOIgoaDoWyvXFDctsZKqnJsqS1EBqb2KHLD6wI5FUs7e
 8eBrJLWKmgIxSpZX3sl/NSJ4hlMfDreI+dFBUtlGXCAkH77BTBWmIjeRrTJL0aXtlXTllOQabd9
 wetN7SwxCc5y6CYWJJryOaaIEHX2bfNkVvRWhrZkhi4dcOt57cdOe/il7ZVjqoRy5KTibPUBC0v
 OyAocxTEBEIDOFjNWBLf9HJn7tp7zyuGSL1Rk2+ZTuhe3vaowj4mipcfNUZt3E78EJAHIRV9DqO
 7foT9RnA4tKDT5OkGgMEFgGEuA1f48oAsJz+LmonTOdXUaG+pRvIUvcGcSuUZ0cw==
X-Received: by 2002:a05:6122:8b01:b0:56b:5979:34c8 with SMTP id
 71dfb90a1353d-56b62a3e65dmr6796914e0c.14.1773740009865; 
 Tue, 17 Mar 2026 02:33:29 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56ba10d02e2sm191394e0c.17.2026.03.17.02.33.29
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Mar 2026 02:33:29 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id
 71dfb90a1353d-56b1b9899d2so5062874e0c.1
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 02:33:29 -0700 (PDT)
X-Received: by 2002:a67:ea8d:0:b0:5fd:ff75:f437 with SMTP id
 ada2fe7eead31-602607f0ab1mr1538405137.33.1773739634898; Tue, 17 Mar 2026
 02:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260316080735.2128881-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260316080735.2128881-1-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 17 Mar 2026 17:26:38 +0800
X-Gmail-Original-Message-ID: <CAC=S1nj0Xwd4jnX1mx-093u4_thggWbqX0sDt0ntpOP+wJz-Xg@mail.gmail.com>
X-Gm-Features: AaiRm50ELHHFELnJ94ZRteVCuO0r_TLY8Q8WSrUUMDAdsfZQMR2yvHxM64dfv7s
Message-ID: <CAC=S1nj0Xwd4jnX1mx-093u4_thggWbqX0sDt0ntpOP+wJz-Xg@mail.gmail.com>
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: Optimize
 framebuffer management
To: Jason-JH Lin <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org, Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>, Jani <jani.nikula@intel.com>,
 Paul-PL Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 Singo Chang <singo.chang@mediatek.com>, Gil Dekel <gildekel@google.com>, 
 Yacoub <markyacoub@chromium.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
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

On Mon, Mar 16, 2026 at 4:07=E2=80=AFPM Jason-JH Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> Refactor framebuffer management to improve reusability:
> - Create framebuffers once per pipe at test initialization via
>   create_fbs() and reuse them across all subtests
> - Centralize cleanup in remove_fbs() called at test fixture end
> - Use per-pipe framebuffer array (data.fbs[IGT_MAX_PIPES]) instead
>   of single global framebuffers
>
> Each framebuffer is created with the actual resolution of the first
> output that can connect to that pipe, avoiding buffer size mismatch
> issues (e.g., 3504x2190 panel incorrectly using 3840x2160 buffer).
>
> For MST tests, multiple outputs share bandwidth and may require mode
> override to fit within bandwidth constraints. When mode override
> changes the resolution, properly detach planes before removing the
> existing framebuffers, then recreate them with the new dimensions.
>
> Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
> Suggested-by: Karthik B.S <karthik.b.s@intel.com>
> ---
>  tests/kms_content_protection.c | 198 +++++++++++++++++++++++++--------
>  1 file changed, 150 insertions(+), 48 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index f35c9fa73a57..6b4287b41668 100644
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
> @@ -257,7 +262,7 @@ commit_display_and_wait_for_flip(enum igt_commit_styl=
e commit_style)
>         }
>  }
>
> -static void modeset_with_fb(igt_output_t *output,
> +static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
>                             enum igt_commit_style commit_style)

Align the parameter order with other modifications for consistency
(i.e. output, pipe, commit_style, ...)

>  {
>         igt_display_t *display =3D &data.display;

<snip>

> @@ -314,13 +320,15 @@ static void test_mst_cp_disable(igt_output_t *hdcp_=
mst_output[],
>  {
>         igt_display_t *display =3D &data.display;
>         igt_plane_t *primary;
> +       igt_crtc_t *crtc;
>         bool ret;
>         int count;
>         u64 val;
>
>         for (count =3D 0; count < valid_outputs; count++) {
> +               crtc =3D igt_output_get_driving_crtc(hdcp_mst_output[coun=
t]);

It's better to have a following `igt_assert(crtc);` or a branch to
handle the NULL case.
The same applies to other `igt_output_get_driving_crtc()` usages.
Optional: consider introducing another static helper if it's a repeated pat=
tern.

>                 primary =3D igt_output_get_plane_type(hdcp_mst_output[cou=
nt], DRM_PLANE_TYPE_PRIMARY);
> -               igt_plane_set_fb(primary, &data.red);
> +               igt_plane_set_fb(primary, &data.fbs[crtc->pipe].red);
>                 igt_output_set_prop_value(hdcp_mst_output[count], IGT_CON=
NECTOR_CONTENT_PROTECTION,
>                                           CP_UNDESIRED);
>         }

<snip>

> @@ -577,21 +586,24 @@ static bool sink_hdcp2_capable(igt_output_t *output=
)
>         return strstr(buf, "HDCP2.2");
>  }
>
> -static void prepare_modeset_on_mst_output(igt_output_t *output, bool is_=
enabled)
> +static void prepare_modeset_on_mst_output(igt_output_t *output, int pipe=
, bool is_enabled)

You mean `enum pipe pipe`?

>  {
>         drmModeModeInfo *mode;
>         igt_plane_t *primary;
>         int width, height;
> +       struct igt_fb *fb;
>
>         mode =3D igt_output_get_mode(output);
>
>         width =3D mode->hdisplay;
>         height =3D mode->vdisplay;
>
> +       fb =3D is_enabled ? &data.fbs[pipe].green : &data.fbs[pipe].red;
> +
>         primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>         igt_plane_set_fb(primary, NULL);
> -       igt_plane_set_fb(primary, is_enabled ? &data.green : &data.red);
> -       igt_fb_set_size(is_enabled ? &data.green : &data.red, primary, wi=
dth, height);
> +       igt_plane_set_fb(primary, fb);
> +       igt_fb_set_size(fb, primary, width, height);
>         igt_plane_set_size(primary, width, height);
>  }
>

<snip>
