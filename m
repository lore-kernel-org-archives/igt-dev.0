Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9263BC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 18:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A37010E596;
	Tue, 30 Jul 2024 18:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="cSLrSP7g";
	dkim-atps=neutral
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBE710E592
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 18:53:01 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e087264e297so3885320276.3
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 11:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722365580; x=1722970380;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m6MboAlXgm44SdzSq+saEjtO2tj60Wh7YKykBTLN1Rc=;
 b=cSLrSP7gumyIZByz7ZTVFLYdwslgS1bkxd+Vp+CX/Wua6S6crAFexKSnCE+4QVytBu
 vAztVu4H24GY72F8aE/Xjrdn1d7oEey0h9DzWdZnbhFJ87SzMbH0hV7rXSj/rZdwExL6
 0obhVD2SNBhuA9NXQ+fItqKTRllzVxLFPxWJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722365580; x=1722970380;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m6MboAlXgm44SdzSq+saEjtO2tj60Wh7YKykBTLN1Rc=;
 b=FKvhDUtw6bs5yYy5cZ/UrYTfH0u5x9Etp1eL7ZZoCmf5JD/9SAqjIkmNYcKB3OAxgQ
 2nS8Gb4xtXet05rvlXJ8xPcEEZ0zAcwazbuni4fVrNsK1wzmEPPcQjFZCt8WQXBi1Ajx
 cKmSnFK97LiR2rjqVQd7dHpg8SO20yqM1KihdKfqyFe/teWHKdHMIP6O3ct4nEYUTASr
 DTQFYZqIWKFCuF+FboE9bRCANZs8VGvxIv5ldr5nkFljzASuZohWQ2l5xhUOum56tlDS
 9qLQk1YzRTFJGW3TAPpMtRpVxULULw7MuWqIMnRdDxYhBmwPAGhm716rubq4k+RoSBVH
 +oXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3lV82im1t2zjRTxmKFnW1TjnjFAF36Lkc9Cf2DL/FUGCGuUk04yzaCTPkR2rYuD+2xw9EcE5CdtrPbvq/kw18Cj6dB7FJxAHf2BloWQ==
X-Gm-Message-State: AOJu0Ywte4sH9xCQUbUdTwFuHrDKMFKBDnFIyLH7icmeSv3oCNIyiNIm
 UqIo9mQcTlgvHLITyeWhHHX0fjeICmMWtRkmHK34u61uyLx7tf3r5DJSABqIfoGH0xbsnIYjLid
 yx0YvPZZlI1gIHH1P4o3/T8qzPsRg6k3+PqHh
X-Google-Smtp-Source: AGHT+IFjo39MNvtM72h361ufrkrTFH3kIe+ujVcfvBc0CIaEmmcGbHs/Z3iT/T0HYBO7sFdE4vL/HPCdIt9+e8CSpD4=
X-Received: by 2002:a05:6902:124b:b0:e0b:a355:2f67 with SMTP id
 3f1490d57ef6-e0ba35530a6mr3268275276.51.1722365579910; Tue, 30 Jul 2024
 11:52:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240729043846.1892343-1-zack.rusin@broadcom.com>
 <20240729043846.1892343-5-zack.rusin@broadcom.com>
 <20240730175824.55bw334tqk32fs3o@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240730175824.55bw334tqk32fs3o@kamilkon-DESK.igk.intel.com>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 30 Jul 2024 14:52:49 -0400
Message-ID: <CABQX2QPma=6Cp9h_d=RReReLUsV6fE5rkqogYNBEVwOA3grNBQ@mail.gmail.com>
Subject: Re: [PATCH i-g-t v4 4/4] tests/vmwgfx: Fix and extend the reference
 counting test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, 
 Zack Rusin <zack.rusin@broadcom.com>, ian.forbes@broadcom.com, 
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
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

On Tue, Jul 30, 2024 at 1:58=E2=80=AFPM Kamil Konieczny
<kamil.konieczny@linux.intel.com> wrote:
>
> Hi Zack,
> On 2024-07-29 at 00:37:56 -0400, Zack Rusin wrote:
> > Fix a few issues related to buffer management in the reference counting
> > test. Extend it to include various prime related reference counting
> > issues.
>
> Please describe also that you updated licence and copyright.

In general we don't really do that for the same reason why you wouldn't do:
/* add a to b */
c =3D a + b;
i.e. "Updating copyrights." comment isn't very valuable, because one
can see that copyrights are being updated. I'm happy to do it
differently for igt, and respin v5 with the updated commit message.

> > @@ -154,6 +134,7 @@ bool vmw_save_data_as_png(struct vmw_surface *surfa=
ce, void *data,
> >       /* Can separate this into another function as it grows */
> >       switch (surface->params.base.format) {
> >       case SVGA3D_R8G8B8A8_UNORM:
> > +     case SVGA3D_B8G8R8X8_UNORM:
>
> This looks like a fix.

It's an adjustment for the rest of the changes in that file. It's not
valuable without the tests that are being added.

> > @@ -471,7 +456,7 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
> >       arg.req.base.autogen_filter =3D autogen_filter;
> >       arg.req.base.drm_surface_flags |=3D surface_flags;
> >       arg.req.base.buffer_handle =3D buffer_handle;
> > -     if (buffer_handle !=3D SVGA3D_INVALID_ID) {
> > +     if (buffer_handle =3D=3D SVGA3D_INVALID_ID) {
>
> This also looks like a fix.

Same as above. It's only needed for the tests that this change is adding.

> I do not see why you cannot
> split this patch into a fixes, extending already existing
> tests and adding new ones but it is up to you.

Even if those were fixes we're not going to be backporting them or
running the tests without the rest of the changes. The reviewers
already reviewed the changes. So all the splitting would do is add
more work for everyone with zero practical benefits.

z
