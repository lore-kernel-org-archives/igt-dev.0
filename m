Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 10 Nov 2021 10:42:10 -0800
Message-Id: <20211110184213.649787-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt v2 0/3] msm: Add tests for gpu fault handling
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
Cc: Rob Clark <robdclark@chromium.org>, Petri Latvala <petri.latvala@intel.com>, linux-arm-msm@vger.kernel.org, Akhil P Oommen <akhilpo@codeaurora.org>, Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The first patch adds a easy way to write debugfs files (needed to
disable hw fault detection, so we can test the sw timeout fallback).
The second adds some helpers for cmdstream building.  And the third
adds the new tests.

v2: Fix headerdoc comments in first patch

Rob Clark (3):
  lib/igt_debugfs: Add helper for writing debugfs files
  msm: Add helper for cmdstream building and submission
  msm: Add recovery tests

 lib/igt_debugfs.c    |  17 +++++
 lib/igt_debugfs.h    |  13 ++++
 lib/igt_msm.c        | 102 +++++++++++++++++++++++++
 lib/igt_msm.h        |  51 +++++++++++++
 tests/meson.build    |   1 +
 tests/msm_recovery.c | 172 +++++++++++++++++++++++++++++++++++++++++++
 6 files changed, 356 insertions(+)
 create mode 100644 tests/msm_recovery.c

-- 
2.31.1
