Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBB36E079
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 10:52:55 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id k9so10012380oia.8
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2020 03:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190128154211.19558-1-nicholas.kazlauskas@amd.com>
In-Reply-To: <20190128154211.19558-1-nicholas.kazlauskas@amd.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 14 Apr 2020 12:52:43 +0200
Message-ID: <CAKMK7uEhtWP3En4seViodQ+cigt0nQJf3bP=w+0=gvLRY3-2+Q@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests: Add variable refresh rate
 tests
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
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, "Wentland,
 Harry" <harry.wentland@amd.com>, Alex Deucher <alexdeucher@gmail.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> +/* Performs an asynchronous non-blocking page-flip on a pipe. */
> +static int
> +do_flip(data_t *data, enum pipe pipe_id, igt_fb_t *fb)
> +{
> +       igt_pipe_t *pipe = &data->display.pipes[pipe_id];
> +       int ret;
> +
> +       igt_set_timeout(1, "Scheduling page flip\n");
> +
> +       /*
> +        * Only the legacy flip ioctl supports async flips.
> +        * It's also non-blocking, but returns -EBUSY if flipping too fast.
> +        * 2x monitor tests will need async flips in the atomic API.
> +        */

Uh, if this is also how your amdgpu userspace works we've just fucked
up the uapi for good :-/

FLIP_ASYNC = please tear

VRR = please don't strictly obey the vrefresh, but very much dont tear

Tying them together means we're deeply mixing things up.

Also amdgpu is still using it's own flip implementation, which makes
me wonder whether VRR would even work with atomic, or whether that's
also butchered ...

How I thought this stuff was supposed to work:

- VRR_ENABLED controls whether we do VRR
- since atomic is awesome you can change that on every frame
- VRR has nothing to do with ASYNC

So a) do I read this correctly b) how do we get out of this hole (and
maybe c) amdgpu really needs to remove
amdgpu_display_crtc_page_flip_target asap).

Manasi pointed this out to me, so adding a few more people here.
-Daniel

> +       do {
> +               ret = drmModePageFlip(data->drm_fd, pipe->crtc_id,
> +                                     fb->fb_id,
> +                                     DRM_MODE_PAGE_FLIP_EVENT |
> +                                     DRM_MODE_PAGE_FLIP_ASYNC,
> +                                     data);
> +       } while (ret == -EBUSY);
> +
> +       igt_assert_eq(ret, 0);
> +       igt_reset_timeout();
> +
> +       return 0;
> +}
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
