Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEC210E647
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Oct 2022 15:34:06 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 i25-20020a4a8d99000000b0047fa712fc6dso465709ook.2
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Oct 2022 08:34:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220929200644.4160588-1-alex.hung@amd.com>
 <ae9f24ee-6982-4ef8-ba52-835184c03a25@amd.com>
In-Reply-To: <ae9f24ee-6982-4ef8-ba52-835184c03a25@amd.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 6 Oct 2022 11:33:54 -0400
Message-ID: <CAJUqKUqO9wDLDU2=Q=EcyZsXRO5yZ-if6-kV8HWaZeBqg+uDSw@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH][V3] tests/kms_plane_multiple: turn off pipe
 if all planes are off
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, michel.daenzer@mailbox.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshminarayana, I have a feeling that this might be an intel bug -
the code is pretty straightforward and works on amdpgu. we have a
feeling that i915 might be missing something.

On Mon, Oct 3, 2022 at 12:25 PM Alex Hung <alex.hung@amd.com> wrote:
>
> Hi Mark,
>
> As expected, the rev 3 has kms_plane_multiple failures on CI.IGT unlike
> rev 2 which has "is_amdgpu_device()" on the first set_pipe, and the
> failures are as below. The first set_pipe required by amdgpu is not
> needed on all devices.
>
> (kms_plane_multiple:1581) igt_debugfs-CRITICAL: Test assertion failure
> function igt_pipe_crc_start, file
> ../../../usr/src/igt-gpu-tools/lib/igt_debugfs.c:884:
> (kms_plane_multiple:1581) igt_debugfs-CRITICAL: Failed assertion:
> pipe_crc->crc_fd != -1
> (kms_plane_multiple:1581) igt_debugfs-CRITICAL: Last errno: 5,
> Input/output error
>
> The Fi.CI.IGT results are available on
> https://patchwork.freedesktop.org/series/109086/
>
>
> On 2022-09-29 14:06, Alex Hung wrote:
> > amdgpu rejects when crtc is on + all planes are off, and it
> > is necessary to turn off crtc when all planes are off in the
> > subtest "tiling-none".
> >
> > This is revised from https://patchwork.freedesktop.org/series/80904/
> >
> > Signed-off-by: Alex Hung <alex.hung@amd.com>
> > ---
> > V2 - remove second is_amdgpu_device() before setting PIPE_NONE
> >
> > V3 - remove both is_amdgpu_device() before setting PIPE_NONE
> >
> >   tests/kms_plane_multiple.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> > index cbe8c189..6c0bc36d 100644
> > --- a/tests/kms_plane_multiple.c
> > +++ b/tests/kms_plane_multiple.c
> > @@ -311,6 +311,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
> >               for_each_plane_on_pipe(&data->display, pipe, plane)
> >                       igt_plane_set_fb(plane, NULL);
> >
> > +             igt_output_set_pipe(output, PIPE_NONE);
> >               igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >
> >               for (int x = 0; x < c; x++)
> > @@ -344,6 +345,7 @@ test_plane_position_with_output(data_t *data, enum pipe pipe,
> >               for_each_plane_on_pipe(&data->display, pipe, plane)
> >                       igt_plane_set_fb(plane, NULL);
> >
> > +             igt_output_set_pipe(output, PIPE_NONE);
> >               igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >
> >               for (int x = 0; x < c; x++)
