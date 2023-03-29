Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C97C410E537
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Mar 2023 12:37:14 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Mar 2023 14:37:07 +0200
Message-Id: <20230329123707.2590437-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] intel-ci/xe-fast-feedback.testlist: use
 xe_module_load@load
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

Provided that the force_load parameter is already set either as:

- boot time: xe.force_load=<value>
- modprobe time: adding "option xe force_load=<value>" to a
  /etc/modprobe.d/ file;
- at boot time, via CONFIG_DRM_XE_FORCE_PROBE="<value>"

There's no need to use igt@xe_module_load@force_load. Use
instead the cleaner test: igt@xe_module_load@load.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 3140d648833a..5f3bd2e917d5 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,5 +1,5 @@
 # Should be the first test
-igt@xe_module_load@force-load
+igt@xe_module_load@load
 
 igt@xe_compute@compute-square
 igt@xe_debugfs@base
-- 
2.39.2
