Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E0810E97F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 08:23:59 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 09:23:17 +0100
Message-Id: <20230310082326.12088-10-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
References: <20230310082326.12088-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 09/18] scripts/igt_doc.py: make it
 compatible with Python 3.6
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

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 scripts/igt_doc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 1d1d7856f2..0795272275 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -760,7 +760,7 @@ class TestList:
             result = subprocess.run([ f"{IGT_BUILD_PATH}/{IGT_RUNNER}",
                                     "-L", "-t",  self.min_test_prefix,
                                     f"{IGT_BUILD_PATH}/tests"], check = True,
-                                    capture_output = True, text = True)
+                                    stdout=subprocess.PIPE, universal_newlines=True)
         except subprocess.CalledProcessError as sub_err:
             print(sub_err.stderr)
             print("Error:", sub_err)
-- 
2.34.1
