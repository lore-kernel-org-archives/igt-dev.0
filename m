Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4432789933
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2020 10:23:17 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 23 Jul 2020 12:22:52 +0200
Message-Id: <20200723102252.23677-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/device_reset: Fix missing autotools
 support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Marcin Bernatowicz <marcin.bernatowicz@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Marcin Bernatowicz <marcin.bernatowicz@intel.com>

Updated Makefile.source to make device_reset test visible by autotools.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
---
 tests/Makefile.sources | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index 0653c3d35..93d7768c4 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -22,6 +22,7 @@ TESTS_progs = \
 	core_setmaster \
 	core_setmaster_vs_auth \
 	debugfs_test \
+	device_reset \
 	dmabuf \
 	drm_import_export \
 	drm_mm \
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
