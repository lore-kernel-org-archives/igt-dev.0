Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991116E56D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Aug 2021 07:47:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 13 Aug 2021 09:47:01 +0200
Message-Id: <20210813074703.18778-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
References: <20210813074703.18778-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 7/9] tests/gem_exec_flush: Adopt to no-reloc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, Petri Latvala <petri.latvala@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Test uses "warming" execbuf which direct consequence is each child
will have objects pinned in gtt before core of the test is performed.
For gens with ppgtt we don't expect relocations so we can just add
EXEC_OBJECT_PINNED flag. We can do this due to each batch created
uses above offsets already.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_flush.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 629fdd7af..40c58db2b 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -128,6 +128,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 		uint32_t *ptr;
 		uint32_t *map;
 		int i;
+		bool has_relocs = gem_has_relocations(fd);
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].handle = gem_create(fd, 4096);
@@ -175,8 +176,20 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 		gem_write(fd, obj[2].handle, 0, &bbe, sizeof(bbe));
 		igt_require(__gem_execbuf(fd, &execbuf) == 0);
 
-		obj[1].relocation_count = 1;
-		obj[2].relocation_count = 1;
+		if (has_relocs) {
+			obj[1].relocation_count = 1;
+			obj[2].relocation_count = 1;
+		} else {
+			/*
+			 * For gens without relocations we already have
+			 * objects in appropriate place of gtt as warming
+			 * execbuf pins them so just set EXEC_OBJECT_PINNED
+			 * flag.
+			 */
+			obj[0].flags |= EXEC_OBJECT_PINNED;
+			obj[1].flags |= EXEC_OBJECT_PINNED;
+			obj[2].flags |= EXEC_OBJECT_PINNED;
+		}
 
 		ptr = gem_mmap__wc(fd, obj[1].handle, 0, 64*1024,
 				   PROT_WRITE | PROT_READ);
@@ -382,6 +395,7 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 		uint32_t *ptr;
 		uint32_t *map;
 		int i;
+		bool has_relocs = gem_has_relocations(fd);
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].handle = gem_create(fd, 4096);
@@ -407,7 +421,11 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 		gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
 		igt_require(__gem_execbuf(fd, &execbuf) == 0);
 
-		obj[1].relocation_count = 1;
+		if (!has_relocs) {
+			obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+			obj[1].flags |= EXEC_OBJECT_PINNED;
+		}
+		obj[1].relocation_count = has_relocs ? 1 : 0;
 		obj[1].relocs_ptr = to_user_pointer(&reloc);
 
 		switch (mode) {
-- 
2.26.0
