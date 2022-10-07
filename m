Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA69810E151
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 23:28:13 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id 187so4761123iov.10
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 16:28:13 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Fri,  7 Oct 2022 18:27:56 -0500
Message-Id: <20221007232757.3210308-6-jfree@freebsd.org>
In-Reply-To: <20221007232757.3210308-1-jfree@freebsd.org>
References: <20221007232757.3210308-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v1 5/6] tests/i915/i915_pm_rpm.c: Add
 FreeBSD I/O iic header
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jake Freeland <jfree@freebsd.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

FreeBSD uses iic instead of i2c for I/O management.
This patch includes the FreeBSD iic header and uses
a macro substitution to convert the i2c addr member
into the iic slave member.

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 tests/i915/i915_pm_rpm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index e95875dc..1ff69a06 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -40,8 +40,13 @@
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#if defined(__linux__)
 #include <linux/i2c.h>
 #include <linux/i2c-dev.h>
+#elif defined(__FreeBSD__)
+#include <dev/iicbus/iic.h>
+#define	addr	slave
+#endif
 
 #include <drm.h>
 
-- 
2.37.3
