Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442616E384
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2020 08:09:42 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 11 Sep 2020 10:07:57 +0200
Message-Id: <20200911080757.12766-41-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200911080757.12766-1-zbigniew.kempczynski@intel.com>
References: <20200911080757.12766-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v34 40/40] i915/gem_concurrent_all.c: Fixup
 failure spotted in review
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

From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>

Obviously, I forgot to clear ptr which was smuggling dmabuf.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/i915/gem_concurrent_all.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
index 3b17ffd9..6609e1df 100644
--- a/tests/i915/gem_concurrent_all.c
+++ b/tests/i915/gem_concurrent_all.c
@@ -444,6 +444,7 @@ dmabuf_release_bo(struct intel_buf *buf)
 {
 	struct dmabuf *dmabuf = (void *) buf->ptr;
 	igt_assert(dmabuf);
+	buf->ptr = NULL;
 
 	munmap(dmabuf->map, buf->surface[0].size);
 	close(dmabuf->fd);
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
