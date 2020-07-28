Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B356E1C0
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2020 07:34:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 28 Jul 2020 10:33:59 +0300
Message-Id: <20200728073359.15807-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] autotools: Remove $(HANG) handling
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Last use of $(HANG) was removed in 8a50ca9985d2
("i915/gem_non_secure_batch.c: Remove"), remove the last dangling
references to the variable.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Lukasz Fiedorowicz <lukasz.fiedorowicz@intel.com>
---
 tests/Makefile.am | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/Makefile.am b/tests/Makefile.am
index 8219e79b..c81b6333 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -34,7 +34,6 @@ test-list-full.txt: Makefile
 
 
 noinst_PROGRAMS = \
-	$(HANG) \
 	$(TESTS_testsuite) \
 	$(NULL)
 
@@ -67,11 +66,9 @@ dist_pkgdata_DATA = \
 
 all-local: .gitignore
 .gitignore: Makefile.sources
-	@echo "$(pkglibexec_PROGRAMS) $(HANG) test-list.txt test-list-full.txt /.gitignore" | sed 's/\s\+/\n/g' | sort > $@
+	@echo "$(pkglibexec_PROGRAMS) test-list.txt test-list-full.txt /.gitignore" | sed 's/\s\+/\n/g' | sort > $@
 
-EXTRA_PROGRAMS = $(HANG)
-
-CLEANFILES = $(EXTRA_PROGRAMS) test-list.txt test-list-full.txt .gitignore
+CLEANFILES = test-list.txt test-list-full.txt .gitignore
 
 AM_CFLAGS = $(CWARNFLAGS) -Wno-unused-result $(DEBUG_CFLAGS)\
 	-I$(top_srcdir)/include/drm-uapi \
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
