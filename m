Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 31 Mar 2022 15:03:36 +0100
Message-Id: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/12] Per client GPU utilisation
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

This series contains four main components:

 1. Per client support for intel_gpu_top.
 2. IGT test for per client data exposed via fdinfo from i915.
 3. Extracting intel_gpu_top code into shared IGT libraries - which makes
    possible to write:
 4. Vendor agnostic rudimentary gputop tool.

Since I had the intel_gpu_top code for years, this flow of the series is what
I ended up with. But it also makes sense since we can have a cut point after
intel_gpu_top, in case the common drm fdinfo specification does not end up
getting enough traction. I other words, first three patches are enough for i915
side of things while the rest are optional.

Example of the intel_gpu_top output:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
intel-gpu-top: Intel Tigerlake (Gen12) @ /dev/dri/card0 -  220/ 221 MHz
    70% RC6;  0.62/ 7.08 W;      760 irqs/s

         ENGINES     BUSY                                 MI_SEMA MI_WAIT
       Render/3D   23.06% |██████▊                      |      0%      0%
         Blitter    0.00% |                             |      0%      0%
           Video    5.40% |█▋                           |      0%      0%
    VideoEnhance   20.67% |██████                       |      0%      0%

   PID              NAME  Render/3D    Blitter      Video    VideoEnhance
  3082               mpv |          ||          ||▌         ||██        |
  3117         neverball |█▉        ||          ||          ||          |
     1           systemd |▍         ||          ||          ||          |
  2338       gnome-shell |          ||          ||          ||          |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Example of the gputop output:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
DRM minor 0
    PID               NAME    render       copy       video
    3816          kwin_x11 |███▎      ||          ||          ||          |
    3523              Xorg |▊         ||          ||          ||          |
 1120449               mpv |          ||          ||▋         ||          |
 1120529          glxgears |▋         ||          ||          ||          |
 1120449               mpv |▍         ||          ||          ||          |
    3860       plasmashell |▏         ||          ||          ||          |
    4764           krunner |          ||          ||          ||          |
  575206            chrome |          ||          ||          ||          |
  833481           firefox |          ||          ||          ||          |
  892924       thunderbird |          ||          ||          ||          |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Tvrtko Ursulin (12):
  lib: Helper library for parsing i915 fdinfo output
  tests/i915/drm_fdinfo: Basic and functional tests for GPU busyness
    exported via fdinfo
  intel-gpu-top: Add support for per client stats
  lib: Extract igt_drm_clients from intel_gpu_top
  libdrmfdinfo: Allow specifying custom engine map
  libdrmclients: Record client drm minor
  libdrmclient: Support multiple DRM cards
  libdrmfdinfo: Track largest engine index
  libdrmclient/intel_gpu_top: Decouple hardcoded engine assumptions
  libdrmclient: Enforce client status sort order in the library
  libdrmclient: Unexport igt_drm_client_update
  gputop: Basic vendor agnostic GPU top tool

 lib/igt_drm_clients.c   | 443 +++++++++++++++++++++++++++++++
 lib/igt_drm_clients.h   | 101 +++++++
 lib/igt_drm_fdinfo.c    | 203 +++++++++++++++
 lib/igt_drm_fdinfo.h    |  54 ++++
 lib/meson.build         |  15 ++
 man/intel_gpu_top.rst   |   4 +
 tests/i915/drm_fdinfo.c | 565 ++++++++++++++++++++++++++++++++++++++++
 tests/meson.build       |   8 +
 tools/gputop.c          | 276 ++++++++++++++++++++
 tools/intel_gpu_top.c   | 497 ++++++++++++++++++++++++++++++++++-
 tools/meson.build       |   7 +-
 11 files changed, 2161 insertions(+), 12 deletions(-)
 create mode 100644 lib/igt_drm_clients.c
 create mode 100644 lib/igt_drm_clients.h
 create mode 100644 lib/igt_drm_fdinfo.c
 create mode 100644 lib/igt_drm_fdinfo.h
 create mode 100644 tests/i915/drm_fdinfo.c
 create mode 100644 tools/gputop.c

-- 
2.32.0
