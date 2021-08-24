Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 24 Aug 2021 15:49:29 -0700
Message-Id: <20210824224932.564352-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 0/3] Initial igt tests for drm/msm ioctls
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>, Akhil P Oommen <akhilpo@codeaurora.org>, Rob Clark <robdclark@chromium.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Add an initial set of tests for the gpu SUBMIT ioctl.  There is
plenty more we can add, but need to start somewhere.

Rob Clark (3):
  drmtest: Add DRIVER_MSM support
  msm: Add helper library
  msm: Add submit ioctl tests

 lib/drmtest.c      |   3 +
 lib/drmtest.h      |   1 +
 lib/igt_msm.c      | 163 +++++++++++++++++++++++++++++++++++++++
 lib/igt_msm.h      | 128 ++++++++++++++++++++++++++++++
 lib/meson.build    |   1 +
 tests/meson.build  |   1 +
 tests/msm_submit.c | 188 +++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 485 insertions(+)
 create mode 100644 lib/igt_msm.c
 create mode 100644 lib/igt_msm.h
 create mode 100644 tests/msm_submit.c

-- 
2.31.1
