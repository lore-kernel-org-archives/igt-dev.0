Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A262010E34E
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Jan 2023 13:31:17 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 31 Jan 2023 19:06:51 +0530
Message-Id: <20230131133658.21970-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v3 0/7] Limit the execution to few pipes/planes
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

Bhanuprakash Modem (5):
  tests/i915/kms_draw_crc: Ignore RGB565  & XRGB2101010 formats on
    simulation
  tests/kms_async_flips: Limit the execution to single pipe
  tests/kms_pipe_crc_basic: Limit the execution to two pipes
  tests/kms_plane_cursor: Limit the execution to two pipes
  tests/kms_plane_scaling: Limit the execution to two pipes/planes

Nidhi Gupta (2):
  tests/kms_plane_alpha_blend: Restrict the execution to 2 pipes and
    planes
  tests/i915/kms_frontbuffer_tracking: Reduce the execution time on
    simulation

 tests/i915/kms_draw_crc.c             | 12 +++++--
 tests/i915/kms_frontbuffer_tracking.c |  3 ++
 tests/kms_async_flips.c               | 18 +++++-----
 tests/kms_pipe_crc_basic.c            | 41 ++++++++++++++++++++++-
 tests/kms_plane_alpha_blend.c         | 21 +++++++++++-
 tests/kms_plane_cursor.c              | 15 +++++++++
 tests/kms_plane_scaling.c             | 47 +++++++++++++++++++++++++++
 7 files changed, 142 insertions(+), 15 deletions(-)

-- 
2.39.0
