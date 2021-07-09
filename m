Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14436EA3D
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jul 2021 15:31:03 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id f30so24028780lfj.1
 for <igt-dev@lists.freedesktop.org>; Fri, 09 Jul 2021 08:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210708160127.1944507-1-markyacoub@chromium.org>
 <20210709124126.ta4xfyd2ny62xsxa@hatecraft.localdomain>
In-Reply-To: <20210709124126.ta4xfyd2ny62xsxa@hatecraft.localdomain>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Fri, 9 Jul 2021 11:30:50 -0400
Message-ID: <CAJUqKUpHf9uaSoOrDiUp1fUVSEnjXg-Ouq74bD-6JH697QZmUg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH] lib/igt_debugfs: skip test instead of assert
 if crc/control is invalid
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arek@hiler.eu>
Cc: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>, Petri Latvala <petri.latvala@intel.com>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jul 9, 2021 at 8:41 AM Arkadiusz Hiler <arek@hiler.eu> wrote:
>
> On Thu, Jul 08, 2021 at 12:01:27PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > Some drivers such as msm do not currently support debugfs yet.
> >
> > [How]
> > Change igt_assert of opening "crtc-%d/crc/control" to igt_require_f.
> > Opening this file doesn't involved a complicated logic so assert isn't
> > required to verify that things are smooth. -1 indicates that the file
> > isn't supported by the driver.
> >
> > Test: kms_atomic:plane-immutable-zpos on ChromeOS Trogdor(msm)
>
> Hey Mark,
>
> I am generally not a fan of hidden requirements that are burried deep in
> the helper libraries. It's nice when the tests explicitly state what they
> need through the use of functions with _require_ or _skip_ in the name.
Makes sense to keep visible. thanks!
>
> When you probably want to do here is to call igt_require_pipe_crc[1] in
> plane-immutable-zpos just like the other pipe crc tests do.
So i was thinking of sending the new patch as a v2 but it's completely
different change in a different file with a different commit message
so i thought it makes more sense to make it a completely different
unrelated patch: https://patchwork.freedesktop.org/series/92369/
Does this make sense, or a v2 would have been more adequate?
>
> [0]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-debugfs.html#igt-require-pipe-crc
>
> --
> Cheers,
> Arek
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
