Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157CB10E065
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Sep 2023 11:05:54 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, karolina.stolarek@intel.com,
 sai.gowtham.ch@intel.com
Date: Mon,  4 Sep 2023 16:34:54 +0530
Message-Id: <20230904110458.24177-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] Add copy basic test to exercise blt
 commands
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add copy basic test which exercies mem-se and mem-copy commands, this
patch series involves in following changes:

1. Add copy basic test to exercise blt commands.
2. check if blt commands are supported by the platforms.
3. Add copy commands to blt_cmd_type.
4. Add copy commands MEM_SET_CMD and MEM_COPY_CMD in the lib.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (4):
  intel/xe_copy_basic: Add copy basic test to exercise blt commands
  lib/intel_blt: check if blt commands are supported by the platforms
  lib/intel_cmds_info: Add copy commands to blt_cmd_type
  lib/intel_reg: Add copy commands in the lib

 lib/intel_blt.c             |  32 ++++
 lib/intel_blt.h             |   2 +
 lib/intel_cmds_info.h       |   2 +
 lib/intel_reg.h             |   4 +
 tests/intel/xe_copy_basic.c | 284 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 6 files changed, 325 insertions(+)
 create mode 100644 tests/intel/xe_copy_basic.c

-- 
2.39.1
