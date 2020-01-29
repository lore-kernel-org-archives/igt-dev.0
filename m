Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9506F648
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 19:29:21 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed, 29 Jan 2020 11:29:13 -0800
Message-Id: <20200129192914.26341-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_exec_reloc: Require
 mappable gtt when necessary
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
List-ID: <igt-dev@lists.freedesktop.org>

The test loops across several mappings so, when explicitly asking for a
GTT mapping it has to make sure such mapping is available.

Signed-off-by: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 tests/i915/gem_exec_reloc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
index ef995a67..bc904a0a 100644
--- a/tests/i915/gem_exec_reloc.c
+++ b/tests/i915/gem_exec_reloc.c
@@ -110,6 +110,9 @@ static void from_mmap(int fd, uint64_t size, enum mode mode)
 	uint64_t max, i;
 	int retry = 2;
 
+	if ((mode & ~RO) == GTT)
+		gem_require_mappable_ggtt(fd);
+
 	/* Worst case is that the kernel has to copy the entire incoming
 	 * reloc[], so double the memory requirements.
 	 */
@@ -387,6 +390,9 @@ static void basic_reloc(int fd, unsigned before, unsigned after, unsigned flags)
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	unsigned int reloc_offset;
 
+	if ((before | after) & I915_GEM_DOMAIN_GTT)
+		gem_require_mappable_ggtt(fd);
+
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, OBJSZ);
 	obj.relocs_ptr = to_user_pointer(&reloc);
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
