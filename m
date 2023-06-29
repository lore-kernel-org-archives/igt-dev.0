Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B7210E108
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 06:48:37 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 08:48:07 +0200
Message-Id: <20230629064807.557491-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/xe_vm: Fix missing jiffies ->
 nanoseconds conversion
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

In the commit 471bfababd070e1dac0ebb87470ac4f2ae85e663 I changed
timeout granularity from ms -> ns, but I missed one occurence.
Fix this as we need to want to stop using jiffies in xe wait
user fence.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/xe/xe_vm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
index 12ecd17fa4..04d6c39568 100644
--- a/tests/xe/xe_vm.c
+++ b/tests/xe/xe_vm.c
@@ -357,7 +357,7 @@ static void *vm_async_ops_err_thread(void *data)
 		.op = DRM_XE_UFENCE_WAIT_NEQ,
 		.flags = DRM_XE_UFENCE_WAIT_VM_ERROR,
 		.mask = DRM_XE_UFENCE_WAIT_U32,
-		.timeout = 1000,
+		.timeout = MS_TO_NS(1000),
 	};
 
 	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE,
-- 
2.34.1
