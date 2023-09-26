Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D2B10E3B9
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 12:29:12 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, karolina.stolarek@intel.com,
 Zbigniew.Kempczynski@intel.com, sai.gowtham.ch@intel.com
Date: Tue, 26 Sep 2023 17:57:46 +0530
Message-Id: <20230926122749.32460-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] Add copy basic test to exercise blt
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
3. Add wrappers for batch preparation and submit exec.
3. Add copy commands to blt_cmd_type.
4. Add copy commands MEM_SET_CMD and MEM_COPY_CMD in the lib.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (3):
  lib/intel_blt: Add check to see if blt commands are supported by the
    platforms
  lib/intel_blt: Add wrappers to prepare batch buffers and submit exec
  intel/xe_copy_basic: Add copy basic test to exercise blt commands

 lib/intel_blt.c             | 237 ++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h             |  45 +++++++
 lib/intel_cmds_info.c       |  12 ++
 lib/intel_cmds_info.h       |   7 ++
 lib/intel_reg.h             |   4 +
 tests/intel/xe_copy_basic.c | 206 +++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 7 files changed, 512 insertions(+)
 create mode 100644 tests/intel/xe_copy_basic.c

-- 
2.39.1
