Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F95C10FEBC
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 14:35:09 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  8 Jun 2022 16:34:51 +0200
Message-Id: <20220608143451.32524-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] i915/gem_pipe_control_store_loop: Adopt to
 softpin
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

New gens has no relocations so enable both paths, relocs for
older gens and softpin for newer ones.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_pipe_control_store_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_pipe_control_store_loop.c b/tests/i915/gem_pipe_control_store_loop.c
index 305ac7ae..20fdc9c1 100644
--- a/tests/i915/gem_pipe_control_store_loop.c
+++ b/tests/i915/gem_pipe_control_store_loop.c
@@ -68,7 +68,7 @@ store_pipe_control_loop(bool preuse_buffer, int timeout)
 	struct intel_buf *target_buf;
 	static struct intel_bb *ibb;
 
-	ibb = intel_bb_create_with_relocs(buf_ops_get_fd(bops), 4096);
+	ibb = intel_bb_create(buf_ops_get_fd(bops), 4096);
 
 	igt_until_timeout(timeout) {
 		/* we want to check tlb consistency of the pipe_control target,
-- 
2.34.1
