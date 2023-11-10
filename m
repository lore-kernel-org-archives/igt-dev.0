Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F8710E266
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 08:41:20 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: bhanuprakash.modem@intel.com, daniels@collabora.com,
 helen.koike@collabora.com, juhapekka.heikkila@gmail.com,
 igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 14:11:05 +0530
Message-Id: <20231110084106.655504-2-vignesh.raman@collabora.com>
In-Reply-To: <20231110084106.655504-1-vignesh.raman@collabora.com>
References: <20231110084106.655504-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3 v5] tests: Update test documentation
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

This commit updates the test documentation to align with
the recent increase of IGT_MAX_PIPES to 16.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Split the commits and added a new commit for test documentation
    update.

---
 tests/intel/kms_ccs.c | 24 ++++++++++++++++++++++++
 tests/kms_bw.c        |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 93e837b84..6dc30ac24 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -53,6 +53,14 @@
  * @pipe-F:                    Pipe F
  * @pipe-G:                    Pipe G
  * @pipe-H:                    Pipe H
+ * @pipe-I:                    Pipe I
+ * @pipe-J:                    Pipe J
+ * @pipe-K:                    Pipe K
+ * @pipe-L:                    Pipe L
+ * @pipe-M:                    Pipe M
+ * @pipe-N:                    Pipe N
+ * @pipe-O:                    Pipe O
+ * @pipe-P:                    Pipe P
  *
  * arg[2]:
  *
@@ -90,6 +98,14 @@
  * @pipe-F:                      Pipe F
  * @pipe-G:                      Pipe G
  * @pipe-H:                      Pipe H
+ * @pipe-I:                      Pipe I
+ * @pipe-J:                      Pipe J
+ * @pipe-K:                      Pipe K
+ * @pipe-L:                      Pipe L
+ * @pipe-M:                      Pipe M
+ * @pipe-N:                      Pipe N
+ * @pipe-O:                      Pipe O
+ * @pipe-P:                      Pipe P
  *
  * arg[2]:
  *
@@ -131,6 +147,14 @@
  * @pipe-F:                      Pipe F
  * @pipe-G:                      Pipe G
  * @pipe-H:                      Pipe H
+ * @pipe-I:                      Pipe I
+ * @pipe-J:                      Pipe J
+ * @pipe-K:                      Pipe K
+ * @pipe-L:                      Pipe L
+ * @pipe-M:                      Pipe M
+ * @pipe-N:                      Pipe N
+ * @pipe-O:                      Pipe O
+ * @pipe-P:                      Pipe P
  *
  * arg[2]:
  *
diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 5f9a020da..896114a3a 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -37,7 +37,7 @@
  * Mega feature: General Display Features
  * Test category: functionality test
  *
- * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8
+ * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16
  *
  * arg[2]:
  *
-- 
2.40.1
