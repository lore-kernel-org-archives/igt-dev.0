Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19D410E677
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Feb 2023 01:54:06 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Feb 2023 07:29:55 +0530
Message-Id: <20230208015959.24015-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/4] Restrict the execution to few pipes/planes
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

Nidhi Gupta (4):
  tests/kms_cursor_edge_walk: Execute only on pipe c
  tests/kms_plane_alpha_blend: Limit the execution to two pipes
  tests/kms_color: Limit the execution to two pipes
  tests/i915/kms_frontbuffer_tracking: Reduce the execution time on
    simulation

 tests/i915/kms_frontbuffer_tracking.c |  3 ++
 tests/kms_color.c                     | 41 ++++++++++++++++++-
 tests/kms_cursor_edge_walk.c          | 11 ++++-
 tests/kms_plane_alpha_blend.c         | 58 ++++++++++++++++++++++++++-
 4 files changed, 109 insertions(+), 4 deletions(-)

-- 
2.39.0
