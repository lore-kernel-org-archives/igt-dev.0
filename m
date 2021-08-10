Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5B589E52
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Aug 2021 05:28:56 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 10 Aug 2021 07:27:10 +0200
Message-Id: <20210810052711.7866-65-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
References: <20210810052711.7866-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v6 64/65] WIP: tests/gem_exec_flush: Adopt
 to no-reloc
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
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/i915/gem_exec_flush.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
index 629fdd7af..08851b4c3 100644
--- a/tests/i915/gem_exec_flush.c
+++ b/tests/i915/gem_exec_flush.c
@@ -128,6 +128,7 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
 		uint32_t *ptr;
 		uint32_t *map;
 		int i;
+		bool has_relocs = gem_has_relocations(fd);
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].handle = gem_create(fd, 4096);
@@ -382,6 +383,7 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
 		uint32_t *ptr;
 		uint32_t *map;
 		int i;
+		bool has_relocs = gem_has_relocations(fd);
 
 		memset(obj, 0, sizeof(obj));
 		obj[0].handle = gem_create(fd, 4096);
@@ -407,7 +409,11 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
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
