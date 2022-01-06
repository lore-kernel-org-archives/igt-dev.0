Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu,  6 Jan 2022 16:49:12 +0000
Message-Id: <20220106164915.56855-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Tests and intel_gpu_top with fdinfo
 support
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
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Mostly sending so I can use Test-with: but review is always welcome.

Tvrtko Ursulin (3):
  lib: Helper library for parsing i915 fdinfo output
  tests/i915/drm_fdinfo: Basic and functional tests for GPU busyness
    exported via fdinfo
  intel-gpu-top: Add support for per client stats

 lib/igt_drm_fdinfo.c    | 161 ++++++++
 lib/igt_drm_fdinfo.h    |  47 +++
 lib/meson.build         |   7 +
 man/intel_gpu_top.rst   |   4 +
 tests/i915/drm_fdinfo.c | 555 +++++++++++++++++++++++++++
 tests/meson.build       |   8 +
 tools/intel_gpu_top.c   | 803 +++++++++++++++++++++++++++++++++++++++-
 tools/meson.build       |   2 +-
 8 files changed, 1584 insertions(+), 3 deletions(-)
 create mode 100644 lib/igt_drm_fdinfo.c
 create mode 100644 lib/igt_drm_fdinfo.h
 create mode 100644 tests/i915/drm_fdinfo.c

-- 
2.32.0
