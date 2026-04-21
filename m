Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF9F5A8A2
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 02:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4E710E164;
	Tue, 21 Apr 2026 02:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="q4JFs/Es";
	dkim-atps=neutral
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23E310E164
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 02:07:46 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-8b1f2b7f1bcso4996916d6.1
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 19:07:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776737266; cv=none;
 d=google.com; s=arc-20240605;
 b=Y7IctD8Hn3aBT4HpmFnrbB1Gb2NFWYym29oXsl2g5HWY5aOS7qWeR/roKFmfbZLJZf
 SlY6AANW3t2uaVXovD5vaQRbVjbjqDoII9eOLHT24mc6kBH1V9R/DNYNfOqpcJ1SIRlV
 2AqIvgVlJqOEDdqotwKghLzTAi6q8XOLxhb29FlIzhYHKlt0aEBKQEu+b3d4YPbiBeAt
 WXTG+pvvbPul+7Xlrx91B2fovMCG4msuFLB6yYOm/2ewPh/5N8SHEz+Fg1/4dwZ0FwkF
 SVVS4pmWcJ5CA80g0Za0rAPz3Ju065/lHvyyGGJicALm8ppu9yqAK6Mqos/OsdyAHCIV
 8+4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=L61Pa3RwjWMmycGXhWDnKSSEnbBRXZBnMfQwOijmtfw=;
 fh=mFIMd5p2JkKOlIpZ0u05Jl5GbM3eh1loriUshaL9a5A=;
 b=MuB48AAekdNEBg7GxLco9ODNWooERPyR/BmES6DPnYl0jELdTKCWFoafOTgh8wlmPc
 86yL0uouv3Rt5iOrE+OVmvkmaYeY811a2OntGnivrxhtdeQ7lj2x67TXgiABYBdXAdVz
 NQJ4xY2q18eLwNP0av5wDDmgnfF8rikg5/tWtbU+7iC9h+IPljjZ07rvbz3pQLi3RNy3
 IB90ab9bw9rhBqiKvrSHs3PTTYHQmtENHygox1MiGTPJV3Fnm0fhbYcsZ1Lgo5//GOLK
 CnwnW1vqjQzq4Z8l0mLUh6Db7xBQihvNo4Sk5pVC9jjhamfcpWtXp5qwY+o47pzD8/x2
 Nr7A==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1776737266; x=1777342066;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L61Pa3RwjWMmycGXhWDnKSSEnbBRXZBnMfQwOijmtfw=;
 b=q4JFs/Esi2OFO065RkNBm34Anqifn9Yr5jVYXF6yM+pUd8ELyBzIoOFnMGvW2Udsv/
 WVkukBo9TJkZESaC0z9dbbC7Gt4GHi6EirgJgJUh74GxYu2aXNOeqzJ/JwFYiP2QWI8V
 LxHXhaA8Cli4M3ZoqFakT1zoG5K9JLgCujh/cgVZICBMT9qnELRHP+dc2ov5pMdND6KI
 nGOts1VH/I+wroKz/XzpUKvNfOI9pEmdPEkqnEA3XnYYxCofPUpX9InXuqiAE6yhgkn6
 xnPu7dB2nK2bTf7P1l3lgPSwnyByas2vBvcAWui8wKO6BLe3qQxCUbFQicJxxP1hRVOh
 GRmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776737266; x=1777342066;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=L61Pa3RwjWMmycGXhWDnKSSEnbBRXZBnMfQwOijmtfw=;
 b=gzV90H7EpIsLFfbFUus5A5KXT3nvaV6Y4lVwvXBCVBNKM73oCGdhpM1scDxwTdp6Fy
 AynprDCqNwXM7Hn/KpJt2FHMFTi5wJjM8GCKZ2ZpeFMYsirQ2rQP9OvD0J0341bzdRJm
 OswOXhMkZaO03Ta10UgS5Anujadwb+QdFgNLVbewwXoJpimbyqIXWOE5jbjb0HxydV1C
 JaeACFQgtJqwuREK91Xy5Zp6iA2SzVRWjk8uPo512rgxC4/lISCiaLb6CYy9XHzili9q
 tWicDxBig5DnMdP685o2BRO5wS06UGAGl1t+aJfSl8U/rmtObRvvo8CjeU4gMp4by2LV
 t0bQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9j183SG+/uizXy8HUzoAyoa1gv4RQt5sEdp697N4qTAonxR6dLaIXjyASPZyJPvLFMZ8JknMs1@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzyWrbO9aNQikzywTGYKesGnK8FA5z5iQitdX7YkRTIA8fCsDbx
 EHVlAWyViXm6rdX6MeI4ulzN5XlMw1dZnUmHu766YbuI6ibz2F+D/8d8LEIIBuUI0t1M1AAfCrI
 hvZtpQQPiDU0Ghyqcg22lBGWsEPs9wf+f4LkUn6es
X-Gm-Gg: AeBDieu5PkdQJbVOYDYwCcnJGUqOK1+Bf3FIhcjOYk+AZvqUb8DZV5qHBLUMn8ZCEzU
 FGlKTDR3UHfPZ13DoQ5kDukQVMCrK32Kzroh83iM5s0e4W3kdk3UJzrS0RS8PtLIes44oy3j9Vb
 dm54LrTtu7REjLLRIGiyeiUSKyPVp4T1/6yJJqcpaz1EF9GKmUkaN8ZH0ARM00wzXDzLRM6T026
 ayp3aZCBwIIAIIr3N7INRnocz+bDjNDbr/9Ng9ra2ZVbYHLVsfEcNpillO5Dg8Vwjhl2NzhWuGT
 4EZhMGSClseh3rN8GckmpXKROQKlNbzfjrNS7q2/znVVSWhfSXFs5EWvKYDMOZ4=
X-Received: by 2002:a05:6214:411e:b0:8ac:b204:3231 with SMTP id
 6a1803df08f44-8b0287d336dmr219928736d6.26.1776737265414; Mon, 20 Apr 2026
 19:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260420074925.1710024-1-jingpingjan@google.com>
 <20260420181651.ox3divkbdpmuvj2t@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260420181651.ox3divkbdpmuvj2t@kamilkon-DESK.igk.intel.com>
From: Jing-Ping Jan <jingpingjan@google.com>
Date: Tue, 21 Apr 2026 10:07:07 +0800
X-Gm-Features: AQROBzDMBjmqK8FkuANPvzSiIIEQrCRsxedJ8Ep1Yyk_MTflv9qz0WhcYS0tsGU
Message-ID: <CAMYCwo6_=W8reh5s+Ne6UZxDXSHdLRzraPbZk8BEJuNfcVUa8A@mail.gmail.com>
Subject: Re: [PATCH i-g-t] tests/kms: correct index validation logic
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jing-Ping Jan <jingpingjan@google.com>, igt-dev@lists.freedesktop.org, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, 
 Swati Sharma <swati2.sharma@intel.com>
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

Hi Kamil,
On Tue, Apr 21, 2026 at 2:16=E2=80=AFAM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Jing-Ping,
> On 2026-04-20 at 15:49:25 +0800, Jing-Ping Jan wrote:
> > Based on the original implementation and the comment above the function=
,
> > it appears the expected behavior is for the plane indices to remain
> > consistent with those in crtc->planes. Therefore, after swapping the ol=
d
> > and new primary planes, we must update the index in igt_plane_t to
> > ensure it matches the corresponding index in crtc->planes.
> >
> > Therefore, we should expect the indices of the old and new primary
> > planes to remain unchanged after swapping them.
> >
> > Signed-off-by: Jing-Ping Jan <jingpingjan@google.com>
> > ---
> >  lib/igt_kms.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> > index bec96f267..405a04640 100644
> > --- a/lib/igt_kms.c
> > +++ b/lib/igt_kms.c
> > @@ -2982,8 +2982,8 @@ void igt_display_reset_outputs(igt_display_t *dis=
play)
> >                               igt_swap(*old_primary, *new_primary);
> >                               igt_swap(old_primary->index, new_primary-=
>index);
> >
> > -                             igt_assert_neq(old_primary->index, 0);
> > -                             igt_assert_eq(new_primary->index, 0);
> > +                             igt_assert_eq(old_primary->index, 0);
> > +                             igt_assert_neq(new_primary->index, 0);
>
> Do you have an error report for this? This code is lib
> and should also trigger in Intel CI, unless it is a dead
> code.
>
> +cc Karthik, Swati, and J-P
>
> Regards,
> Kamil
>
> >                       } else {
> >                               igt_assert(old_primary =3D=3D new_primary=
);
> >
> > --
> > 2.54.0.rc1.513.gad8abe7a5a-goog
> >

I do not have a specific error report available at this time. This
change is based on an issue we encountered and the existing comment in
the code, which indicates that plane indices should remain consistent
with those in crtc->planes after a swap.

Regarding the lack of Intel CI hits, I suspect the bug depends on the
primary plane not being the first plane in the driver's index. CI
likely hasn't encountered this because it doesn't test this specific
plane ordering.

Please see the following output from our testing:

(kms_getfb:20359) INFO: IGT-Version: IGT_VERSION-GIT (arm64) (Linux:
6.6.118-android15-8-g34da635f9b82-ab14801981-4k aarch64)
(kms_getfb:20359) INFO: Using IGT_SRANDOM=3D1771906178 for randomisation
(kms_getfb:20359) INFO: Opened device: /dev/dri/card0
(kms_getfb:20359) DEBUG: Test requirement passed: !(fd<0)
(kms_getfb:20359) DEBUG: Test requirement passed: has_getfb_iface(fd)
(kms_getfb:20359) DEBUG: display: init {
(kms_getfb:20359) DEBUG: Test requirement passed:
igt_has_drm_cap(drm_fd, DRM_CAP_VBLANK_HIGH_CRTC)
(kms_getfb:20359) DEBUG: Test requirement passed:
resources->count_crtcs <=3D IGT_MAX_PIPES
(kms_getfb:20359) DEBUG: display:     DSI-1: Selecting pipe None
(kms_getfb:20359) DEBUG: display:     DSI-2: Selecting pipe None
(kms_getfb:20359) DEBUG: display:     DP-1: Selecting pipe None
(kms_getfb:20359) DEBUG: display:     DP-1: Selecting pipe None
(kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=3D
igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
pipe)->valid)
(kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=3D
igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
pipe)->valid)
(kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(width=3D2152,
height=3D2076, format=3DXR24(0x34325258), modifier=3D0x0, size=3D0)
(kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(handle=3D1, pitch=3D864=
0)
(kms_getfb:20359) DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
(kms_getfb:20359) DEBUG: Test requirement passed:
cairo_surface_status(fb->cairo_surface) =3D=3D CAIRO_STATUS_SUCCESS
(kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=3D
igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
pipe)->valid)
(kms_getfb:20359) DEBUG: Test requirement passed: !(pipe >=3D
igt_display_n_crtcs(display) || !igt_crtc_for_pipe(display,
pipe)->valid)
(kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(width=3D1080,
height=3D2364, format=3DXR24(0x34325258), modifier=3D0x0, size=3D0)
(kms_getfb:20359) DEBUG: igt_create_fb_with_bo_size(handle=3D1, pitch=3D435=
2)
(kms_getfb:20359) DEBUG: Test requirement passed: igt_has_fb_modifiers(fd)
(kms_getfb:20359) DEBUG: Test requirement passed:
cairo_surface_status(fb->cairo_surface) =3D=3D CAIRO_STATUS_SUCCESS
(kms_getfb:20359) CRITICAL: Test assertion failure function
igt_display_reset_outputs, file
external/igt-gpu-tools/lib/igt_kms.c:2985:
(kms_getfb:20359) CRITICAL: Failed assertion: old_primary->index !=3D 0
(kms_getfb:20359) CRITICAL: error: 0 =3D=3D 0
(kms_getfb:20359) INFO: Stack trace: not implemented

Regards,
Jing-Ping Jan
