Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 826616EB0D
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 21:10:36 +0000 (UTC)
From: Lyude <lyude@redhat.com>
Date: Fri, 17 Apr 2020 17:10:22 -0400
Message-Id: <20200417211025.109574-3-lyude@redhat.com>
In-Reply-To: <20200417211025.109574-1-lyude@redhat.com>
References: <20200417211025.109574-1-lyude@redhat.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/5] lib/igt_core: Add igt_require_fd()
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
To: nouveau@lists.freedesktop.org, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Lyude Paul <lyude@redhat.com>

Like igt_assert_fd(), but using igt_require() instead

Changes since v1:
* Fix documentation error in igt_require_fd() - Petri Latvala

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 lib/igt_core.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/igt_core.h b/lib/igt_core.h
index 3f69b072..8f68b2dd 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -1021,6 +1021,18 @@ void igt_describe_f(const char *fmt, ...);
 	else igt_debug("Test requirement passed: %s\n", #expr); \
 } while (0)
 
+/**
+ * igt_require_fd:
+ * @fd: file descriptor
+ *
+ * Skips (sub-) test if the given file descriptor is invalid.
+ *
+ * Like igt_require(), but displays the stringified identifier that was supposed
+ * to contain a valid fd on failure.
+ */
+#define igt_require_fd(fd) \
+	igt_require_f(fd >= 0, "file descriptor " #fd " failed\n");
+
 /**
  * igt_skip_on_f:
  * @expr: condition to test
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
