Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CF66E05A
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 16:02:06 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id 1so5651664ljv.2
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 09:02:06 -0700 (PDT)
MIME-Version: 1.0
References: <20211027182404.2189964-1-markyacoub@chromium.org>
 <YXpaQHSM5XbcKU98@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YXpaQHSM5XbcKU98@platvala-desk.ger.corp.intel.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 28 Oct 2021 12:01:52 -0400
Message-ID: <CAJUqKUp7bN4j_THw2bryvaL3YU82Z=o=k3BC6LWzc0ZYiemg2Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_cursor: igt_require_pipe_crc
 for test_init
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, arek@hiler.eu, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

Applied. thanks!

On Thu, Oct 28, 2021 at 4:16 AM Petri Latvala <petri.latvala@intel.com> wrote:
>
> On Wed, Oct 27, 2021 at 02:24:04PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > [Why]
> > test_init uses CRC in debugfs which is not supported by some drivers.
> >
> > [How]
> > igt_require_pipe_crc before igt_pipe_crc_new is called.
> >
> > Test: igt@kms_plane_cursor@pipe-A-overlay-size-64 on ChromeOS Jacuzzi
> > (MTK)
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
>
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
>
> > ---
> >  tests/kms_plane_cursor.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> > index 9bda4746..73085cc8 100644
> > --- a/tests/kms_plane_cursor.c
> > +++ b/tests/kms_plane_cursor.c
> > @@ -76,6 +76,7 @@ static void test_init(data_t *data, enum pipe pipe_id)
> >       data->overlay = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_OVERLAY);
> >       data->cursor = igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_CURSOR);
> >
> > +     igt_require_pipe_crc(data->drm_fd);
> >       data->pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe_id,
> >                                         INTEL_PIPE_CRC_SOURCE_AUTO);
> >
> > --
> > 2.33.0.1079.g6e70778dc9-goog
> >
