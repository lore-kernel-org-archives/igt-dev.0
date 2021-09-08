Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20210830162232.1328594-1-robdclark@gmail.com>
In-Reply-To: <20210830162232.1328594-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 8 Sep 2021 11:02:42 -0700
Message-ID: <CAF6AEGs2dycGhitXWdcOD8pNqmsueRxD_ZmR0NCXc074kHTwUw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH igt v3 0/3] Initial igt tests for drm/msm
 ioctls
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: freedreno <freedreno@lists.freedesktop.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>, Akhil P Oommen <akhilpo@codeaurora.org>, Petri Latvala <petri.latvala@intel.com>, Rob Clark <robdclark@chromium.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 30, 2021 at 9:18 AM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> Add an initial set of tests for the gpu SUBMIT ioctl.  There is
> plenty more we can add, but need to start somewhere.
>
> Rob Clark (3):
>   drmtest: Add DRIVER_MSM support
>   msm: Add helper library
>   msm: Add submit ioctl tests

If there are no more comments on this series, could somebody push it?

BR,
-R

>  .../igt-gpu-tools/igt-gpu-tools-docs.xml      |   1 +
>  lib/drmtest.c                                 |   3 +
>  lib/drmtest.h                                 |   1 +
>  lib/igt_msm.c                                 | 211 ++++++++++++++++++
>  lib/igt_msm.h                                 | 142 ++++++++++++
>  lib/meson.build                               |   1 +
>  tests/meson.build                             |   1 +
>  tests/msm_submit.c                            | 194 ++++++++++++++++
>  8 files changed, 554 insertions(+)
>  create mode 100644 lib/igt_msm.c
>  create mode 100644 lib/igt_msm.h
>  create mode 100644 tests/msm_submit.c
>
> --
> 2.31.1
>
