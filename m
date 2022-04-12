Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F4510FD3A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 08:59:39 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>,
 Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Date: Tue, 12 Apr 2022 10:59:04 +0200
Message-Id: <ddf631418d66acef1b399120edcc7c9d9407df27.1649753814.git.mchehab@kernel.org>
In-Reply-To: <cover.1649753814.git.mchehab@kernel.org>
References: <cover.1649753814.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 05/12] scripts/meson.build: install code
 coverage scripts
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

Those scripts are needed at runtime. So, place them under
bindir.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1649753814.git.mchehab@kernel.org/

 meson.build         |  1 +
 scripts/meson.build | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 scripts/meson.build

diff --git a/meson.build b/meson.build
index f9a284d844a3..3e937f5a5b98 100644
--- a/meson.build
+++ b/meson.build
@@ -315,6 +315,7 @@ if libdrm_intel.found()
 endif
 subdir('overlay')
 subdir('man')
+subdir('scripts')
 
 gtk_doc = dependency('gtk-doc', required : build_docs)
 if build_tests and gtk_doc.found()
diff --git a/scripts/meson.build b/scripts/meson.build
new file mode 100644
index 000000000000..342972e66078
--- /dev/null
+++ b/scripts/meson.build
@@ -0,0 +1,13 @@
+scripts = [
+	'code_cov_capture',
+	'code_cov_gather_on_build',
+	'code_cov_gather_on_test',
+	'code_cov_gen_report',
+	'code_cov_parse_info',
+]
+
+if build_tests
+	foreach prog : scripts
+		install_data(prog, install_dir : bindir, install_mode : 'r-xr-xr-x')
+	endforeach
+endif
-- 
2.35.1
