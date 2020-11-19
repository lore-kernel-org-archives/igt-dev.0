Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E3896E527
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 13:47:52 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 19 Nov 2020 14:47:43 +0100
Message-Id: <20201119134746.28020-6-tzimmermann@suse.de>
In-Reply-To: <20201119134746.28020-1-tzimmermann@suse.de>
References: <20201119134746.28020-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v5 5/8] tests/fbdev: Add tests for write
 operations on framebuffer
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
To: petri.latvala@intel.com, chris@chris-wilson.co.uk, daniel.vetter@ffwll.ch
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

The write tests check the written buffer against the content of the mapped
framebuffer.

v4:
	* replace igt_require() by iqt_assert() in "write" (Petri)
	* add write test to CI
v3:
	* put igt_describe() before igt_subtest() (Petri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c                         | 20 ++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 21 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index be9e95c1..23ff146c 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -135,6 +135,26 @@ static void framebuffer_tests(int fd)
 		igt_assert_f(pos, "found 0x55 at pos %zu, none expected\n", pos - buf);
 	}
 
+	igt_describe("Check write operations on framebuffer memory");
+	igt_subtest("write") {
+		ssize_t ret;
+		int cmp;
+
+		/* write 0 to framebuffer and compare */
+		memset(buf, 0, fix_info.smem_len);
+		ret = pwrite(fd, buf, fix_info.smem_len, 0);
+		igt_assert_f(ret == (ssize_t)fix_info.smem_len, "pwrite failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_assert_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
+
+		/* write 0x55 to framebuffer and compare */
+		memset(buf, 0x55, fix_info.smem_len);
+		ret = pwrite(fd, buf, fix_info.smem_len, 0);
+		igt_assert_f(ret == (ssize_t)fix_info.smem_len, "pwrite failed, ret=%zd\n", ret);
+		cmp = memcmp(map, buf, fix_info.smem_len);
+		igt_assert_f(!cmp, "write buffer differs from mapped framebuffer for 0\n");
+	}
+
 	igt_fixture {
 		free(buf);
 		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 2f9148ab..66630e1d 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -5,6 +5,7 @@ igt@debugfs_test@read_all_entries
 igt@fbdev@info
 igt@fbdev@read
 igt@fbdev@unaligned-read
+igt@fbdev@write
 igt@gem_basic@bad-close
 igt@gem_basic@create-close
 igt@gem_basic@create-fd-close
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
