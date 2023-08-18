Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0254110E445
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 05:19:52 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org,
	sai.gowtham.ch@intel.com
Date: Fri, 18 Aug 2023 10:49:14 +0530
Message-Id: <20230818051916.28272-1-sai.gowtham.ch@intel.com>
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

Add copy basic test to exercise copy commands like mem-copy and mem-set.

Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (2):
  lib/intel_reg: Add copy commands in the lib
  tests/xe/xe_copy_basic: Add copy basic test to exercise blt commands

 lib/intel_mocs.h         |   2 +
 lib/intel_reg.h          |   4 +
 tests/meson.build        |   1 +
 tests/xe/xe_copy_basic.c | 262 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 269 insertions(+)
 create mode 100644 tests/xe/xe_copy_basic.c

-- 
2.39.1
