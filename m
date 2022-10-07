Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BBB10E911
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 04:07:53 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id n198so2809683iod.3
 for <igt-dev@lists.freedesktop.org>; Thu, 06 Oct 2022 21:07:53 -0700 (PDT)
From: Jake Freeland <jake@technologyfriends.net>
To: igt-dev@lists.freedesktop.org
Date: Thu,  6 Oct 2022 23:07:14 -0500
Message-Id: <20221007040717.2924978-6-jfree@freebsd.org>
In-Reply-To: <20221007040717.2924978-1-jfree@freebsd.org>
References: <20221007040717.2924978-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/10] lib/tests/igt_fork.c: Fix error in
 mmap() flags
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

In subtest_leak(), mmap() is called with the flag PROT_WRITE,
but no PROT_READ. Later in the function, the mapped memory is
read using `children[i]`. In FreeBSD, the lack of PROT_READ
causes SIGSEGV. Adding the PROT_READ flag to the mmap() call
fixes this.

Signed-off-by: Jake Freeland <jfree@freebsd.org>
---
 lib/tests/igt_fork.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index d19d0945..d883aba4 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -109,7 +109,7 @@ __noreturn static void igt_fork_timeout_leak(void)
 __noreturn static void subtest_leak(void)
 {
 	pid_t *children =
-		mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
+		mmap(0, 4096, PROT_READ | PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
 	const int num_children = 4096 / sizeof(*children);
 
 	igt_subtest_init(fake_argc, fake_argv);
-- 
2.37.3
