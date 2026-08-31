Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03A4C624C6
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 14:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D44F10E28F;
	Mon, 31 Aug 2026 14:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wEas0RIm";
	dkim-atps=neutral
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C9910E28F
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 14:01:20 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id
 d75a77b69052e-52e2d1bdbc0so24229451cf.0
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 07:01:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788184879; cv=none;
 d=google.com; s=arc-20260327;
 b=dKDZrz2H2Htit6kcZ8X9zwco1ywB/tqkSTKk35d/yfdujAAwAKShKtfmk0sZ+mNvml
 2oJx442xy6r8uF85oL2C+2ZWk/NLqONWKe6Nap/hEJXRlPOdky4HnKVsnnrMA0+/aDHr
 keNKX3opvByQA2Q52k/tRwKXD42yNnP2oX4vDb9dA9Sk7fKd7p7AZDGOANKdSU3XCjHF
 rJbfyzpAxP3ZV9Uh3hVjo3wcOJFNoEahwpGykfDShKLMqIrUMnetQTkC+RHrEDg5hh3q
 DTBRKSMZmxldJc+UFqaJW5m61nofXonLNYX4v+EF2rGjSMNRtYSst+ZJUx31rwfN2SJA
 uzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=H3BurnIf1acdo2QjyF+5k+gl4wMqU1+wSINPn6qNRGc=;
 fh=iGByM33eZi15SEVflS8sZvsighh4/rt15Q4HSXGPf5k=;
 b=lDQ68wfupJy9x222Gw7/T5eJ9yKWWK/I0kpbeJtvUXanHCtp3myjfQBF6KuymODO+W
 oio5E7L0I1/IremSDkdfn8MiygS/P4HCcYj0ik3PxvSRbYxZWUASAnSVB90VfcfKBW1E
 OfXwJL8HytPpzYRwbMIDUfKYtoYaV1fme4LC97VE7bFIeRK9bryvP54LyUvTIJIeY5vw
 KBGmAJX7Nzvu9JdW4eSVzVi5EXKQjPNOPESFRoQ9NSlBdTTjuYuGxdro2/4eMhRslyso
 XbA5rHWC1/Ywk2TDNeZ7NjnDVZMpH2qjBxePW63bm2H04RZJu7EB2u/m7LlqITunPGq3
 SKhQ==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1788184879; x=1788789679;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=H3BurnIf1acdo2QjyF+5k+gl4wMqU1+wSINPn6qNRGc=;
 b=wEas0RImegpNN1Tc1XFc8GQs/+9Muo6tSVH/WIaidxRIEqT8YH4mB1hPudtXwS9vXz
 tAKx/WqvZRFCo/mOfHOzert4UC450KiLx+iKkedSL5aJ5ED56sluj9Elz+RoDgkxTKE4
 h9RQM4lAn6RZkLw0z3jQqxXfhY8eHh9LYa7DAFBhvFP2adK8YHpLT+rSUaoOJrDezt5p
 H/I/0B+mqkmxpUQk0GUIlvOYPmt/t8S6lzE1nWIm7WuO7BoQFaYuJIrJ9yFC0yRZZJsf
 tgQaQK9YfGruOt1XvYi35J8sebXmtWuP9D7zLNab21uJMb/GplmZ5sVY24vVqr0JhSdc
 QDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788184879; x=1788789679;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=H3BurnIf1acdo2QjyF+5k+gl4wMqU1+wSINPn6qNRGc=;
 b=IBP1YpQ4cqvIklscF/duWGr86mjvKxqPbWayteuMhmKFwdLg/RqYqvYfhGgeFGa8LJ
 I+klvZWjYOLuAAsOqtlcu7OuavkX05xTk6oiw5rfOBl/gdV2RpFugxWg63xTzTqkaCyZ
 CaLyJv3MwBKv/9KNMN4eeI2TgJLP8IkuHldjY5ipwb1cO/iAjFyllTg7I/MdPkaDPns2
 WHuG0ndOU7dy/vcPXUi2KLoaPY6FP6pXTmrR8sPIiET5+GYFHI4f3kNMU5gC/OuLYTMz
 +w1UvTlFA33UFmiVGKf8dj006cIjHU9D41xpvz27+wACH4DpgtEdBmRz6ZRT+2weVFyf
 PRdA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqgHqcRxlQIAAanEUzq88AawqI8j5u2RP3BvfjvRrc8VakP4S4IFiW5rVfR0WIKKgVdbtG1r8Ak@lists.freedesktop.org
X-Gm-Message-State: AFuF++mlZT/huZsLFSU8sEj9oLgOLhA7zfbFhOhL5TJSzn2NIVjtjluP
 tzLLSdnBp/EbTiyn8bWvQdFOuKzBL1AXyrjuXv1JmxhsNg7SKhJr089ByyO0ys+l481QL71QI16
 d6lPGNyZUjFqkskYrCD57e8FHwzN1rnE7nLIQRrjk
X-Gm-Gg: AR+sD1333krLcpwqA2rvbZrJNLYDvTmWI0pYLXQDEngVFuylAb7TFEcrERcg4YS3WV2
 YzajPYZiJtYHyEwP+fvCzvhooqpBT90Y1T3kZWpCwWRtk82NEHft3NAYXt3kICdBwVTsvQc+FK4
 5MVbfsw4RQW/+5W7iIUhmv/aTz+8q0+iWwqQ80ZVvjaoZ1ghyP2n+/6G0Gzi/rHNDQ5eCOJsCkW
 kmIRgBXEJdHmlPzLt6wExbYF5BaOxoP7qR89IxstN4E3T3epeI2hCnBPLBLxxwWaO3bGzcoCTAi
 1vHxvjJOUVMk7WDqecyrsKVMKOTQgZmnUHTtweD9yc3zUDWevEddwGoSk5NBxFlITrFbP30nXIs
 =
X-Received: by 2002:a05:622a:258e:b0:51c:849e:e222 with SMTP id
 d75a77b69052e-52fb96da379mr358321001cf.36.1788184878614; Mon, 31 Aug 2026
 07:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260828-vkms_virtual_output_fix-v1-1-789718f4cb00@igalia.com>
 <5443fa9f99309b0ec0afdd98319619a63d5467a3@intel.com>
In-Reply-To: <5443fa9f99309b0ec0afdd98319619a63d5467a3@intel.com>
From: Mark Yacoub <markyacoub@google.com>
Date: Mon, 31 Aug 2026 10:01:07 -0400
X-Gm-Features: AcwNN1Vm6DxVVD1vouZsBNUj-qN4Y7_859ULhcLF_n0YRIHtkn2r1qeGBi_noIU
Message-ID: <CAC0gqY650NvYr5_NwKXM3sFNYQ=G7T9kx_=8GZWE7faveSZwRg@mail.gmail.com>
Subject: Re: [PATCH i-g-t] Revert "lib/igt_kms: Do not treat writeback and
 virtual connectors as connected"
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 igt-dev@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, louis.chauvet@bootlin.com, 
 hamohammed.sa@gmail.comm, simona@ffwll.ch, melissa.srw@gmail.com, 
 robin.clark@oss.qualcomm.com, abhinav.kumar@linux.dev, jesszhan0024@gmail.com, 
 sean@poorly.run, marijn.suijten@somainline.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "S,
 Sowmiya" <sowmiya.s@intel.com>, kernel-dev@igalia.com
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

On Mon, Aug 31, 2026 at 4:51=E2=80=AFAM Jani Nikula <jani.nikula@intel.com>=
 wrote:
>
> On Fri, 28 Aug 2026, Thadeu Lima de Souza Cascardo <cascardo@igalia.com> =
wrote:
> > This reverts commit 321448df7fc9af29b4c6697dc74e6c5e2100af6c.
> >
> > It has broken vkms testing, which has only Virtual connectors.
> >
> > Cc: Mark Yacoub <markyacoub@google.com>
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>
> FWIW,
>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Mark Yacoub <markyacoub@google.com>
>
> But you should solicit feedback from the author, reviewer, and committer
> of 321448df7fc9 ("lib/igt_kms: Do not treat writeback and virtual
> connectors as connected").
>
>
> > ---
> >  lib/igt_kms.h | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> > index 695f666bacb9..27f8877a9f6a 100644
> > --- a/lib/igt_kms.h
> > +++ b/lib/igt_kms.h
> > @@ -669,10 +669,6 @@ static inline bool igt_output_is_connected(igt_out=
put_t *output)
> >           !output->config.connector->count_modes)
> >               return false;
> >
> > -     if (output->config.connector->connector_type =3D=3D DRM_MODE_CONN=
ECTOR_WRITEBACK ||
> > -         output->config.connector->connector_type =3D=3D DRM_MODE_CONN=
ECTOR_VIRTUAL)
> > -             return false;
> > -
> >       if (output->config.connector->connection =3D=3D DRM_MODE_CONNECTE=
D)
> >               return true;
> >
> >
> > ---
> > base-commit: c0c86b23b316bec7d22bbb95e433a8dc25884a1c
> > change-id: 20260828-vkms_virtual_output_fix-c82298792438
> >
> > Best regards,
> > --
> > Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> >
>
> --
> Jani Nikula, Intel
