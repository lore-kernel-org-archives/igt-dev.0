Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DBBC10E29B
 for <igt-dev@lists.freedesktop.org>; Mon, 22 May 2023 09:57:40 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 22 May 2023 11:57:10 +0200
Message-Id: <cover.1684747649.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Use intel_cmds_info in i915_pm_rpm
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
supported in newer generations. This series modifies gem-execbuf
test to switch to fast copy if it can't do a color blit. It also
introduces an updated version of intel_cmds_info library that has
information on XY_COLOR_BLT support. 

Karolina Stolarek (2):
  lib/intel_cmds_info: Drop BLT_CMD_LONG flag
  tests/i915/i915_pm_rpm: Check command property instead of gen

Vikas Srivastava (2):
  lib/i915: Add library support for XY_COLOR_BLT
  tests/i915/i915_pm_rpm: Modify gem-execbuf test for gen12+

 lib/i915/i915_blt.c        |  16 +++
 lib/i915/i915_blt.h        |   1 +
 lib/i915/intel_cmds_info.c |  23 ++++-
 lib/i915/intel_cmds_info.h |   1 +
 tests/i915/i915_pm_rpm.c   | 195 +++++++++++++++++++++++++++++--------
 5 files changed, 191 insertions(+), 45 deletions(-)

-- 
2.25.1
