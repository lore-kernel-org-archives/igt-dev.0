Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AC810E0D2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Feb 2023 23:32:20 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Feb 2023 05:08:05 +0530
Message-Id: <20230206233810.16696-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/5] Restrict the execution to few
 pipes/planes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As the execution is taking more time in simulation, limit the execution to
few pipes and few planes.

Bhanuprakash Modem (1):
  tests/i915/kms_draw_crc: Ignore RGB565 & XRGB2101010 formats on
    simulation

Nidhi Gupta (4):
  tests/kms_cursor_edge_walk: Limit the execution to two pipes
  tests/kms_plane_alpha_blend: Limit the execution to two pipes
  tests/kms_color: Limit the execution to two pipes
  tests/i915/kms_frontbuffer_tracking: Reduce the execution time on
    simulation

 tests/i915/kms_draw_crc.c             | 12 ++++--
 tests/i915/kms_frontbuffer_tracking.c |  3 ++
 tests/kms_color.c                     | 43 +++++++++++++++++++-
 tests/kms_cursor_edge_walk.c          | 29 +++++++++++++-
 tests/kms_plane_alpha_blend.c         | 58 ++++++++++++++++++++++++++-
 5 files changed, 138 insertions(+), 7 deletions(-)

-- 
2.39.0
