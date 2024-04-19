Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3032C071FD
	for <igt-dev@archiver.kernel.org>; Fri, 19 Apr 2024 17:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBEC10F243;
	Fri, 19 Apr 2024 17:29:46 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7158810FF3D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Apr 2024 17:29:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C092C0002;
 Fri, 19 Apr 2024 17:29:41 +0000 (UTC)
From: Peter Senna Tschudin <me@petersenna.com>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com,
 andi.shyti@linux.intel.com
Subject: [PATCH i-g-t v2] tests/intel/gem_exec_capture: fix use of
 uninitialized hang var
Date: Fri, 19 Apr 2024 19:29:12 +0200
Message-ID: <20240419172940.1412-1-me@petersenna.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411191934.10368-1-me@petersenna.com>
References: <20240411191934.10368-1-me@petersenna.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: me@petersenna.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

The function main has a variable igt_hang_t hang defined, and it is
currently used by igt_disallow_hang(). However igt_disallow_hang() is
using the variable uninitialized making valgrind unhappy:

 Syscall param ioctl(generic) points to uninitialised byte(s)
    at 0x4ACD3ED: ioctl (in /usr/lib64/libc.so.6)
    by 0x49ACF4F: drmIoctl (xf86drm.c:704)
    by 0x488AF46: __gem_context_set_param (gem_context.c:260)
    by 0x48A540A: igt_disallow_hang (igt_gt.c:236)
    by 0x4013D7: __igt_unique____real_main959 (gem_exec_capture.c:1069)
    by 0x401242: main (gem_exec_capture.c:959)
  Address 0x1fff0001b0 is on thread 1's stack
  in frame #3, created by igt_disallow_hang (igt_gt.c:224)
  Uninitialised value was created by a stack allocation
    at 0x401340: __igt_unique____real_main959 (gem_exec_capture.c:960)

This patch sets the content of the variable hang with the return value
of igt_allow_hang() following what is used elsewhere in the code.  After
this patch valgrind does not complain about the error listed.

Signed-off-by: Peter Senna Tschudin <me@petersenna.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/gem_exec_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_exec_capture.c b/tests/intel/gem_exec_capture.c
index 57b178f3e..2dc5f94e8 100644
--- a/tests/intel/gem_exec_capture.c
+++ b/tests/intel/gem_exec_capture.c
@@ -983,7 +983,7 @@ igt_main
 
 			gem_context_set_param(fd, &param);
 		}
-		igt_allow_hang(fd, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
+		hang = igt_allow_hang(fd, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
 
 		dir = igt_sysfs_open(fd);
 		igt_require(igt_sysfs_set(dir, "error", "Begone!"));
-- 
2.44.0

