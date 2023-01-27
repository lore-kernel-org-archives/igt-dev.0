Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri, 27 Jan 2023 11:12:35 +0000
Message-Id: <20230127111241.3624629-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/6] Assorted intel_gpu_top improvements
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Mostly by popular demand from
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/109, although for
some of these changes I'd like some second opinions. For instance is it user
friendly to change the default aggregation mode for stdout and JSON output?

Plus a GPU selection fix to prepare for Intel VPU being a DRM device, making
intel_gpu_top not try to monitor it.

And finally some memory freeing fixes.

Tvrtko Ursulin (6):
  intel_gpu_top: Fix man page formatting
  intel_gpu_top: Automatically enclose JSON output into brackets
  intel_gpu_top: Add command line switch to start in physical engine
    mode
  intel_gpu_top: Aggregate engine classes in all output modes
  intel_gpu_top: Fix cleanup on old kernels / unsupported GPU
  lib/igt_device_scan: Improve Intel discrete GPU selection

 lib/igt_device_scan.c |  7 +++--
 man/intel_gpu_top.rst | 60 +++++++++++++++++++++----------------------
 tools/intel_gpu_top.c | 37 +++++++++++++++++++-------
 3 files changed, 62 insertions(+), 42 deletions(-)

-- 
2.34.1
