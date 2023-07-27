Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Thu, 27 Jul 2023 10:20:22 +0100
Message-Id: <20230727092025.1895728-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] gputop memory usage
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, Chris Healy <cphealy@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Same general approach as with engine utilisation, adding parsing of the relevant
fdinfo fields and plumbing to client discovery helpers to finally present some
of the available data in gputop:

DRM minor 0
 PID      MEM      RSS  render    copy     video   NAME
8098     124M     124M |███████||       ||       ||       | neverball
 888      76M      75M |▊      ||       ||       ||       | Xorg
 966      12M      12M |       ||       ||       ||       | xfwm4

Or with Wayland:

DRM minor 0
 PID      MEM      RSS    render        copy         video    video-enhance NAME
2093     191M     191M |▊          ||           ||           ||           | gnome-shell
DRM minor 128
 PID      MEM      RSS    render        copy         video    video-enhance NAME
2551      71M      71M |██▉        ||           ||           ||           | neverball
2553      50M      50M |           ||           ||           ||           | Xwayland

There is probably scope to consolidate some of the igt_drm_fdinfo code and to
improve on the presentation but this is a start.

For now, out of the available memory categories, only total and resident are
displayed, and also all discovered memory regions are summed up and shown under
a single heading.

v2:
 * One style tweak, two missing s-o-b, one build failure.

Cc: Rob Clark <robdclark@chromium.org>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Chris Healy <cphealy@gmail.com>

Tvrtko Ursulin (3):
  lib/igt_drm_fdinfo: Parse memory usage
  lib/igt_drm_clients: Store memory info in the client
  gputop: Add memory information

 lib/igt_drm_clients.c   |  35 +++++++++-
 lib/igt_drm_clients.h   |  11 ++++
 lib/igt_drm_fdinfo.c    | 143 ++++++++++++++++++++++++++++++++++++++--
 lib/igt_drm_fdinfo.h    |  24 ++++++-
 tests/i915/drm_fdinfo.c |   8 +--
 tools/gputop.c          |  34 +++++++++-
 tools/intel_gpu_top.c   |   2 +-
 7 files changed, 242 insertions(+), 15 deletions(-)

-- 
2.39.2
