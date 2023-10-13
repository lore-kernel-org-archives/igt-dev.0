Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D930B10E5D5
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Oct 2023 10:39:11 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 karolina.stolarek@intel.com, sai.gowtham.ch@intel.com
Date: Fri, 13 Oct 2023 16:07:26 +0530
Message-Id: <20231013103728.24748-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] Add copy basic test to exercise blt
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
2. Add wrappers for batch preparation and submit exec.
3. Add copy commands MEM_SET_CMD and MEM_COPY_CMD in the lib.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  lib/intel_blt: Add wrappers to prepare batch buffers and submit exec
  intel/xe_copy_basic: Add copy basic test to exercise blt commands

 lib/intel_blt.c             | 199 ++++++++++++++++++++++++++++++++++++
 lib/intel_blt.h             |  39 +++++++
 lib/intel_reg.h             |   4 +
 tests/intel/xe_copy_basic.c | 195 +++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 5 files changed, 438 insertions(+)
 create mode 100644 tests/intel/xe_copy_basic.c

-- 
2.39.1
