Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D42B3EE0
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Aug 2022 10:17:04 +0000 (UTC)
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 5 Aug 2022 12:16:52 +0200
Message-ID: <20220805101654.1152678-2-raphael.gallais-pou@foss.st.com>
In-Reply-To: <20220805101654.1152678-1-raphael.gallais-pou@foss.st.com>
References: <20220805101654.1152678-1-raphael.gallais-pou@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 1/3] stm-ci: Add STM blacklist
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Yannick
 Fertre <yannick.fertre@st.com>, Philippe Cornu <philippe.cornu@st.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This blacklist contains all tests that do not run on STM platforms.
This list is inspired from intel-ci 'blacklist.txt'.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 tests/meson.build              |  2 ++
 tests/stm-ci/blacklist-stm.txt | 41 ++++++++++++++++++++++++++++++++++
 tests/stm-ci/meson.build       |  6 +++++
 3 files changed, 49 insertions(+)
 create mode 100644 tests/stm-ci/blacklist-stm.txt
 create mode 100644 tests/stm-ci/meson.build

diff --git a/tests/meson.build b/tests/meson.build
index b548dc3b..99c59152 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -473,3 +473,5 @@ image_files = [
 install_data(sources : image_files, install_dir : datadir)
 
 subdir('intel-ci')
+
+subdir('stm-ci')
diff --git a/tests/stm-ci/blacklist-stm.txt b/tests/stm-ci/blacklist-stm.txt
new file mode 100644
index 00000000..bd4bb21f
--- /dev/null
+++ b/tests/stm-ci/blacklist-stm.txt
@@ -0,0 +1,41 @@
+###############################################
+# Broadcom
+###############################################
+igt@vc4_.*
+igt@v3d_.*
+###############################################
+# AMD
+###############################################
+igt@amdgpu/.*
+###############################################
+# Panfrost
+###############################################
+igt@panfrost_.*
+###############################################
+# Qualcomm
+###############################################
+igt@msm_.*
+###############################################
+# Intel
+###############################################
+igt@i915_.*
+igt@(.*)i915.*
+igt@gen3_.*
+igt@gen7_.*
+igt@gen9_.*
+###############################################
+# GEM
+###############################################
+igt@gem_.*
+###############################################
+# Hibernate: not configured correctly on CI
+###############################################
+igt@.*@.*-hibernate
+###############################################
+# pipe-b to pipe-f no current HW support
+###############################################
+igt@.*@.*pipe-b($|-.*)
+igt@.*@.*pipe-c($|-.*)
+igt@.*@.*pipe-d($|-.*)
+igt@.*@.*pipe-e($|-.*)
+igt@.*@.*pipe-f($|-.*)
diff --git a/tests/stm-ci/meson.build b/tests/stm-ci/meson.build
new file mode 100644
index 00000000..43f94a27
--- /dev/null
+++ b/tests/stm-ci/meson.build
@@ -0,0 +1,6 @@
+
+stmci_files = [
+  'blacklist-stm.txt',
+]
+
+install_data(sources : stmci_files, install_dir : datadir)
-- 
2.25.1
