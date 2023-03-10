Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94D8D10E31D
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:42:52 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:25 +0100
Message-Id: <20230310194125.14781-20-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 19/19] scripts/igt_doc.py: set
 have_implemented when --files is used
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

Without that, the option won't work:

	$ ../../scripts/igt_doc.py  --config xe_test_config.json   --files xe_compute.c
	$ Need file names to be processed

Reported-by: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index f1b6d64615..67ab7984dd 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -293,6 +293,10 @@ class TestList:
                     for fname in glob.glob(cfg_file):
                         self.filenames.append(fname)
                         has_implemented = True
+            else:
+                for cfg_file in self.filenames:
+                    if cfg_file:
+                        has_implemented = True
 
             has_planned = False
             if include_plan and "planning_files" in self.config:
-- 
2.34.1
