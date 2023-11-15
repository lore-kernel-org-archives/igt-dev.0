Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E8E10E1EF
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Nov 2023 06:35:08 +0000 (UTC)
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Nov 2023 12:12:51 +0530
Message-Id: <20231115064253.1680913-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] add new subtests for dark screen
 detection
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

dark screen detection feature when enable will monitor frames
and if black frame is detcted it will raise drm_error, added
two tests for positive (black frame) and negative case (white frame)

Kunal Joshi (2):
  lib/igt_debugfs: added helper to enable/disable dark screen detection
  tests/kms_pipe_crc_basic: added new subtest for darkscreen detection

 lib/igt_debugfs.c          | 23 ++++++++++++++++
 lib/igt_debugfs.h          |  2 ++
 tests/kms_pipe_crc_basic.c | 55 +++++++++++++++++++++++++++++++++-----
 3 files changed, 73 insertions(+), 7 deletions(-)

-- 
2.25.1
