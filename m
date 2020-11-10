Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E1F1898B6
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2020 07:51:10 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 10 Nov 2020 08:51:02 +0100
Message-Id: <20201110075102.5033-9-tzimmermann@suse.de>
In-Reply-To: <20201110075102.5033-1-tzimmermann@suse.de>
References: <20201110075102.5033-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v3 8/8] tests/fbdev: Add tests for read/writing
 with NULL-pointer buffers
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
To: daniel.vetter@ffwll.ch, chris@chris-wilson.co.uk, petri.latvala@intel.com
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Trying to read and write with a NULL-pointer buffer should fail and
report EFAULT.

v3:
	* put igt_describe() before igt_subtest() (Petri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 8fd920be..814188b5 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -229,6 +229,17 @@ static void framebuffer_tests(int fd)
 		igt_require_f(ret == 0, "read at EOF, ret=%zd\n", ret);
 	}
 
+	igt_describe("Check framebuffer access with NULL");
+	igt_subtest("nullptr") {
+		ssize_t ret;
+
+		ret = pread(fd, NULL, fix_info.smem_len, 0);
+		igt_require_f((ret == -1) && (errno == EFAULT), "reading into NULL did not return EFAULT, ret=%zd\n", ret);
+
+		ret = pwrite(fd, NULL, fix_info.smem_len, 0);
+		igt_require_f((ret == -1) && (errno == EFAULT), "writing from NULL did not return EFAULT, ret=%zd\n", ret);
+	}
+
 	igt_fixture {
 		free(buf);
 		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
