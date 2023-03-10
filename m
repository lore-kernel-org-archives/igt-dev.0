Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A96510E323
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:42:18 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:16 +0100
Message-Id: <20230310194125.14781-11-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
References: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 10/19] scripts/igt_doc.py: sets the
 minimal version to run the script
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

according with vermin, the minimal version for this script is 3.6 due
to:

	  'argparse' module requires 2.7, 3.2
	  'enumerate' member requires 2.3, 3.0
	  'json' module requires 2.6, 3.0
	  'open(encoding)' requires !2, 3.0
	  'os.path.realpath' member requires 2.2, 3.0
	  'sorted' member requires 2.4, 3.0
	  'sorted(key)' requires 2.4, 3.0
	  'str.format' member requires 2.6, 3.0
	  'subprocess' module requires 2.4, 3.0
	  'subprocess.run' member requires !2, 3.5
	  'sys.version_info' member requires 2.0, 3.0
	  `with` requires 2.5, 3.0
	  f-strings require !2, 3.6
	  print(expr) requires 2.0, 3.0

So, print an error if one tries to run with an older version.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 scripts/igt_doc.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 0795272275..5b08ac1442 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -18,6 +18,10 @@ import re
 import subprocess
 import sys
 
+MIN_PYTHON = (3, 6)
+if sys.version_info < MIN_PYTHON:
+    sys.exit("Python %s.%s or later is required.\n" % MIN_PYTHON) # pylint: disable=C0209
+
 IGT_BUILD_PATH = 'build'
 IGT_RUNNER = 'runner/igt_runner'
 
-- 
2.34.1
