Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DC810E23C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 07:35:15 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, karolina.stolarek@intel.com,
 zbigniew.kempczynski@intel.com, sai.gowtham.ch@intel.com
Date: Tue,  3 Oct 2023 13:03:42 +0530
Message-Id: <20231003073344.20470-1-sai.gowtham.ch@intel.com>
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

 lib/intel_blt.c             | 195 +++++++++++++++++++++++++++++++++
 lib/intel_blt.h             |  39 +++++++
 lib/intel_reg.h             |   4 +
 tests/intel/xe_copy_basic.c | 208 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 5 files changed, 447 insertions(+)
 create mode 100644 tests/intel/xe_copy_basic.c

-- 
2.39.1
