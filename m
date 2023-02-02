Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D74E10E1D0
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Feb 2023 05:09:27 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Feb 2023 10:45:02 +0530
Message-Id: <20230202051509.28983-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 0/7] Limit the execution to few pipes/planes
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

Bhanuprakash Modem (6):
  tests/i915/kms_draw_crc: Ignore RGB565 & XRGB2101010 formats on
    simulation
  tests/kms_async_flips: Limit the execution to single pipe
  tests/kms_pipe_crc_basic: Limit the execution to two pipes
  tests/kms_plane_alpha_blend: Limit the execution to single pipe & two
    planes
  tests/kms_plane_cursor: Limit the execution to two pipes
  tests/kms_plane_scaling: Limit the execution to two pipes/planes

Nidhi Gupta (1):
  tests/i915/kms_frontbuffer_tracking: Reduce the execution time on
    simulation

 tests/i915/kms_draw_crc.c             | 12 +++++--
 tests/i915/kms_frontbuffer_tracking.c |  3 ++
 tests/kms_async_flips.c               | 18 +++++-----
 tests/kms_pipe_crc_basic.c            | 41 ++++++++++++++++++++-
 tests/kms_plane_alpha_blend.c         | 51 +++++++++++++++++++++++++--
 tests/kms_plane_cursor.c              | 15 ++++++++
 tests/kms_plane_scaling.c             | 47 ++++++++++++++++++++++++
 7 files changed, 171 insertions(+), 16 deletions(-)

-- 
2.39.0
