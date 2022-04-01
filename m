Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Apr 2022 15:11:52 +0100
Message-Id: <20220401141155.3122817-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Per client GPU utilisation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Only first three patches for review purposes (first stage) - adding the test and
intel_gpu_top support.

Tvrtko Ursulin (3):
  lib: Helper library for parsing i915 fdinfo output
  tests/i915/drm_fdinfo: Basic and functional tests for GPU busyness
    exported via fdinfo
  intel-gpu-top: Add support for per client stats

 lib/igt_drm_fdinfo.c    | 188 ++++++++++
 lib/igt_drm_fdinfo.h    |  69 ++++
 lib/meson.build         |   7 +
 man/intel_gpu_top.rst   |   4 +
 tests/i915/drm_fdinfo.c | 557 +++++++++++++++++++++++++++
 tests/meson.build       |   8 +
 tools/intel_gpu_top.c   | 806 +++++++++++++++++++++++++++++++++++++++-
 tools/meson.build       |   2 +-
 8 files changed, 1638 insertions(+), 3 deletions(-)
 create mode 100644 lib/igt_drm_fdinfo.c
 create mode 100644 lib/igt_drm_fdinfo.h
 create mode 100644 tests/i915/drm_fdinfo.c

-- 
2.32.0
