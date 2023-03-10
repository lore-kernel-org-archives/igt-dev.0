Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2433810E323
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:42:32 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:20 +0100
Message-Id: <20230310194125.14781-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 14/19] xe/xe_huc_copy: add GPU dependency
 to its documentation
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

Currently, the test is limited to TGL and works only if the
GPU matches a hardcoded list of PCI IDs.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/xe/xe_huc_copy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c
index 7c1906a317..ee3896cef8 100644
--- a/tests/xe/xe_huc_copy.c
+++ b/tests/xe/xe_huc_copy.c
@@ -9,6 +9,10 @@
  * Sub-category: HuC
  * Functionality: HuC copy
  * Test category: functionality test
+ * TODO: make the test more generic, getting rid of the PCI ID list
+ * GPU requirements: This test currently requires TGL, and runs only if the
+ *	PCI ID is 0x9A60, 0x9A68, 0x9A70, 0x9A40, 0x9A49, 0x9A59, 0x9A78,
+ *	0x9AC0, 0x9AC9, 0x9AD9 or 0x9AF8
  */
 
 #include <string.h>
-- 
2.34.1
