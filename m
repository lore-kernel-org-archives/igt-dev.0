Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D12210E341
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 10:04:35 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: bhanuprakash.modem@intel.com, daniels@collabora.com,
 helen.koike@collabora.com, juhapekka.heikkila@gmail.com,
 igt-dev@lists.freedesktop.org
Date: Mon, 13 Nov 2023 15:34:19 +0530
Message-Id: <20231113100419.1111165-3-vignesh.raman@collabora.com>
In-Reply-To: <20231113100419.1111165-1-vignesh.raman@collabora.com>
References: <20231113100419.1111165-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3 v6] intel-ci: Blacklist tests on pipe I
 to pipe P
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

Blacklist tests on pipe I to pipe P on both
XE blocklist and intel-ci blacklist.

Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v5:
  - Split the commits and added a new commit for blacklisting tests.

v6:
  - No change.

---
 tests/intel-ci/blacklist.txt    | 7 ++-----
 tests/intel-ci/xe.blocklist.txt | 6 +++---
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index e13759d3e..4427804d5 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -117,12 +117,9 @@ igt@gem_ctx_isolation@.*-s4
 ###############################################
 igt@i915_suspend@shrink
 ###############################################
-# pipe-e, pipe-f, pipe-g, pipe-h no current HW support
+# pipe-e to pipe-p no current HW support
 ###############################################
-igt@.*@.*pipe-e($|-.*)
-igt@.*@.*pipe-f($|-.*)
-igt@.*@.*pipe-g($|-.*)
-igt@.*@.*pipe-h($|-.*)
+igt@.*@.*pipe-[e-pE-P]($|-.*)
 
 ###############################################
 # Temporary workarounds for CI-impacting bugs
diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 135ab18a3..71946a50f 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -44,11 +44,11 @@ igt@syncobj_.*
 igt@template
 igt@tools_test
 ##################################################################
-# KMS: Pipe E, F, G and H are not available on Intel hardware,
+# KMS: Pipe E to Pipe P are not available on Intel hardware,
 # hence can't use more than 4 displays.
 ##################################################################
-igt@.*@.*pipe-(e|f|g|h).*
-igt@kms_bw@.*-(5|6|7|8)-displays-.*
+igt@.*@.*pipe-[e-pE-P].*
+igt@kms_bw@.*-([5-9]|1[0-6])-displays-.*
 ##################################################################
 # KMS: Tests specific to i915 driver
 ##################################################################
-- 
2.40.1
