Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C88CCF9EB
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 16:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D8EE10E4F1;
	Mon, 27 Oct 2025 16:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Mr5JN/p8";
	dkim-atps=neutral
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0443710E4F1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 16:27:16 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso3314829a12.3
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 09:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761582435; x=1762187235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aScZtylva1Z2pMJcvsQrebhO8pEA4MYgpZOPKv+/g2g=;
 b=Mr5JN/p8ZaN2PTgIGmIpGP9c0IxvshJWWpK8WBl16QDLibnr325zmuKYDJIGCorwYQ
 MpfxbcvXktAVrPwhKqmrm4eDSV0PlIMCixex8xiosw2wXxGgru/7Xuy8HxQ3CdiuI6y7
 Z9auWCclsV3X/lGs2wiyeovZHHtz9kY5m+RXu219Fbm1gCz9Qwp6geLzxO88tSeFUMH3
 arnb/vPYU4IdIc7TuTC0h2PO9vZmSffSJtBYf/qlxjLW05DRIrKUguG3mVfgB25J32s3
 aw6QPaSW3cKIkCw+lCSMK/np4vng++K8n2RWI52/ZpObd1NwvllUdMjye3TTjEJ8L8R4
 3f1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761582435; x=1762187235;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aScZtylva1Z2pMJcvsQrebhO8pEA4MYgpZOPKv+/g2g=;
 b=X/GlsTXBt8QwrlkOsVJGgTnlvaVpeOFvsv4CFB6ji0bhob27lVdYkXhg7paHImQVwh
 j9RTVYub8bKBNQEOb3yQOhCwJbdEhBD8HwdRPojChHU6RRcvUFSpk7aBRK8WvPosGiZZ
 SXkbr0aK+EIv6NL99GwChKWNM4clcWZL9aMGTK1wvd7T1V11IwwVslwxChOSKuWYriCn
 XWkXMj+3boTyUNTilK12l59GfC0+vW756CcqYjmhJBS1jXNIIfAgNZO/fJ6hx6XC227t
 lacFtFDzmCE3wWDSHKDdxZVZJEZDvFW6xuJr1pwNnBfUFuwDtWrweGDZK9QbZQGWOnfo
 JkSg==
X-Gm-Message-State: AOJu0YzWji9etWxPRMjeDfxoNWjArHAziiXsH6uonOXo9o46Uz3TVr55
 fOnXx9znPXdZoebnsd8aMX3rkWPGHas0NFFRNfIatHR0yChkp0HZGl3LL2dfRufl6GLdFalleY1
 tW/DAGg0MjzbEeIza/3FDp13Q2uegmc9Qwvui7XI=
X-Gm-Gg: ASbGncs/sCK7Sq8w/ngjJPXh7iS3IJp2DnD6ju7s25b+JQI1zwf4Wo7svNQwu21XdQu
 i73LayISjtKl4lo+6xeSP3Nlmq21DPM4giz6o28/uYsODTGZgjZ9ZNt+FD2RAfVSMoJ4xnbpWrw
 xrgC4kkiqlSgoFvVW2e4qeQR5abw31U/cPUxkMdaa3eg6mcWKUNwc2Y+JrOt3/zCF/Pjzo6A40r
 eKx80x3XEH4dOEfSd7aviiEUvEW1Yoz4+5F9T7OnxZjw/AiLfOWXUK8VxAjLANwiReM4UA3eQ==
X-Google-Smtp-Source: AGHT+IGvhMLCRt+6CG3aF3nTGkqiT7EUHFTxcL8sZUKY11ddioR6GbNyy/dAM/uau9akxTvh2d9MIiP8is4IzgaZNKs=
X-Received: by 2002:a17:902:ce8d:b0:293:e12:1bec with SMTP id
 d9443c01a7336-294cb3b9d5dmr7102685ad.20.1761582435253; Mon, 27 Oct 2025
 09:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251027130025.1771523-1-michal.grzelak@intel.com>
In-Reply-To: <20251027130025.1771523-1-michal.grzelak@intel.com>
From: =?UTF-8?Q?Juha=2DPekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
Date: Mon, 27 Oct 2025 18:27:03 +0200
X-Gm-Features: AWmQ_bkMPwfRh43dLNzVg2zqRXViY9-uA_gIL4sBaGZkJEiwRcRbbHv1p_RJc1Q
Message-ID: <CAJ=qYWSqX2SBgbggxAreGsGRaVzXgu4MoY7jFoVVRogH2=VnVg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 1/1] tests/kms_big_fb: Open compatible driver for
 the platform
To: =?UTF-8?Q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: igt-dev@lists.freedesktop.org
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

Hi Michal,

On Mon, Oct 27, 2025 at 3:00=E2=80=AFPM Micha=C5=82 Grzelak <michal.grzelak=
@intel.com> wrote:
>
> On platforms older than ADL-P, tests should be executed with i915 loaded
> before xe. Currently, when tests are executed and xe is loaded first,
> failures are reported in multiple subtests along errors in the dmesg.
>
> Check if i915 has been loaded before xe. If not, open and optionally
> reload proper driver according to platform's display version.

I was wondering what is the problem you are solving with this? adlp
you mention is supported by both xe and i915 and I don't think it is
good idea test silently switches the driver. If xe is loaded when
running with adlp I'd expect it is done with force probing and it is
intentional; ie test is wanted to be run against xe driver.

/Juha-Pekka

>
> Signed-off-by: Micha=C5=82 Grzelak <michal.grzelak@intel.com>
> ---
>  tests/intel/kms_big_fb.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
> index 41fdcacab..5e8fa6112 100644
> --- a/tests/intel/kms_big_fb.c
> +++ b/tests/intel/kms_big_fb.c
> @@ -30,6 +30,8 @@
>   */
>
>  #include "igt.h"
> +#include "igt_device.h"
> +#include "igt_kmod.h"
>  #include <errno.h>
>  #include <stdbool.h>
>  #include <stdio.h>
> @@ -967,6 +969,30 @@ static bool test_requirements(data_t *input_data, in=
t l)
>         return true;
>  }
>
> +static int open_compatible_driver(int drm_fd) {
> +       uint32_t devid;
> +       bool is_adl, is_xe;
> +
> +       devid =3D is_intel_device(drm_fd);
> +       is_adl =3D intel_display_ver(devid) <=3D 13;
> +       is_xe =3D is_xe_device(drm_fd);
> +
> +       if (!is_adl || !is_xe) return drm_fd;
> +
> +       igt_xe_driver_unload();
> +       if(igt_kmod_is_loaded("i915")) {
> +               igt_kmod_unbind("i915", NULL);
> +               igt_kmod_unload("i915");
> +       }
> +       igt_device_drop_master(drm_fd);
> +       drm_close_driver(drm_fd);
> +       drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +
> +       igt_require(is_i915_device(drm_fd));
> +
> +       return drm_fd;
> +}
> +
>  igt_main
>  {
>         igt_fixture {
> @@ -976,6 +1002,8 @@ igt_main
>
>                 igt_require(is_intel_device(data.drm_fd));
>
> +               data.drm_fd =3D open_compatible_driver(data.drm_fd);
> +
>                 data.devid =3D intel_get_drm_devid(data.drm_fd);
>
>                 kmstest_set_vt_graphics_mode();
> --
> 2.45.2
>
