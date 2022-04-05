Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FB210EE51
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Apr 2022 08:41:54 +0000 (UTC)
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  5 Apr 2022 09:41:30 +0100
Message-Id: <20220405084138.3216500-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/8] Vendor agnostic gputop
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

This is a pile of patches which implements a rudimentary vendor agnostic gputop
tool based of the new DRM spec as documented in
Documentation/gpu/drm-usage-stats.rst.

First part of the series is code refactoring which should be reasonably stable,
I've tested it all while working on it both against intel_gpu_top and gputop,
albeit probably needs more and better comments.

The actual tools itself (last patch) works but I think not quite nice enough to
be user facing. Ideally someone gets intrigued enough to improve it? Although it
is only IGT so maybe it is good enough for a start? Not sure. To start with it
depends on more drivers adopting the spec.

Fundamental difference between intel_gpu_top and gputop is that the former is
centered around a single card and only shows processes belonging to it. Gputop
on the other hand has an idea to show all processes with DRM file descriptors
open and sort them into groups per card. It also makes no effort to provide
sorting modes, well any interactivity, or any pretty names for GPUs or engines.

It looks like this:
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

I did test it as well with two cards and confirmed that too works.

Rob Clark also tested it with a patch which exports the respective data from the
msm driver and confirmed that too works.

Tvrtko Ursulin (8):
  lib: Extract igt_drm_clients from intel_gpu_top
  libdrmfdinfo: Allow specifying custom engine map
  libdrmclients: Record client drm minor
  libdrmclient: Support multiple DRM cards
  libdrmfdinfo: Track largest engine index
  libdrmclient/intel_gpu_top: Decouple hardcoded engine assumptions
  libdrmclient: Enforce client status sort order in the library
  gputop: Basic vendor agnostic GPU top tool

 lib/igt_drm_clients.c   | 451 +++++++++++++++++++++++++++
 lib/igt_drm_clients.h   |  97 ++++++
 lib/igt_drm_fdinfo.c    |  50 ++-
 lib/igt_drm_fdinfo.h    |  16 +-
 lib/meson.build         |   8 +
 tests/i915/drm_fdinfo.c |  18 +-
 tools/gputop.c          | 276 +++++++++++++++++
 tools/intel_gpu_top.c   | 663 ++++++++++------------------------------
 tools/meson.build       |   7 +-
 9 files changed, 1067 insertions(+), 519 deletions(-)
 create mode 100644 lib/igt_drm_clients.c
 create mode 100644 lib/igt_drm_clients.h
 create mode 100644 tools/gputop.c

-- 
2.32.0
