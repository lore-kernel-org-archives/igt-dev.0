Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A09C10E2DB
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 10:58:47 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 27 Jun 2023 12:58:17 +0200
Message-Id: <cover.1687862551.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/3] Use intel_cmds_info in i915_pm_rpm
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

i915_pm_rpm test uses XY_COLOR_BLT blitter command which is not
supported on newer generations. This series modifies gem-execbuf
test to switch to fast copy if it can't do a color blit. It also
introduces an updated version of intel_cmds_info library that has
information on XY_COLOR_BLT support.

v2:
  - Rebase the series on the top of "lib/intel_blt: Prepare blt
    library to support xe" commit
  - Update regions iteration in gem_execbuf_subtest() to first
    create a buffer on device memory, if possible
  - Re-order blt_cmd_info definitions (no functional change)
  - Drop BLT_CMD_LONG flag, and re-use BLT_CMD_EXTENDED

Karolina Stolarek (1):
  tests/i915/i915_pm_rpm: Check command property instead of gen

Vikas Srivastava (2):
  lib/intel_cmds_info: Add library support for XY_COLOR_BLT
  tests/i915/i915_pm_rpm: Modify gem-execbuf test for gen12+

 lib/intel_blt.c          |  16 ++++
 lib/intel_blt.h          |   1 +
 lib/intel_cmds_info.c    |  23 ++++-
 lib/intel_cmds_info.h    |   1 +
 tests/i915/i915_pm_rpm.c | 195 ++++++++++++++++++++++++++++++---------
 5 files changed, 191 insertions(+), 45 deletions(-)

-- 
2.25.1
