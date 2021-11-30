Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 29 Nov 2021 16:43:22 -0800
Message-Id: <20211130004324.337399-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt 0/2] msm+lib: Add test for buffer mapping
 permissions
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

First patch just splits out a couple of helpers from igt_sysfs so they
can be re-used.  Second patch adds a test which locates the address of
a given buffer, and verifies (depending on expected permissions) that
writes and/or reads trigger an iova fault rather than succeeding.

Rob Clark (2):
  igt: Split out I/O helpers
  msm: Add test for kernel buffer permissions

 lib/igt_io.c        |  96 +++++++++++++++++
 lib/igt_io.h        |  33 ++++++
 lib/igt_msm.h       |   1 +
 lib/igt_sysfs.c     |  45 +-------
 lib/meson.build     |   1 +
 tests/meson.build   |   1 +
 tests/msm_mapping.c | 257 ++++++++++++++++++++++++++++++++++++++++++++
 7 files changed, 394 insertions(+), 40 deletions(-)
 create mode 100644 lib/igt_io.c
 create mode 100644 lib/igt_io.h
 create mode 100644 tests/msm_mapping.c

-- 
2.33.1
