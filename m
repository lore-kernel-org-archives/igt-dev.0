Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA2F6E8B2
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 10:52:22 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Fri, 20 Nov 2020 11:52:17 +0100
Message-Id: <20201120105217.5058-9-tzimmermann@suse.de>
In-Reply-To: <20201120105217.5058-1-tzimmermann@suse.de>
References: <20201120105217.5058-1-tzimmermann@suse.de>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v6 8/8] tests/fbdev: Add tests for read/writing
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
To: petri.latvala@intel.com, chris@chris-wilson.co.uk, daniel.vetter@ffwll.ch
Cc: igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
List-ID: <igt-dev@lists.freedesktop.org>

Trying to read and write with a NULL-pointer buffer should fail and
report EFAULT.

v6:
	* actually replace igt_require() (Petri)
v4:
	* replace igt_require() by igt_assert() in "nullptr" (Petri)
	* add nullptr test to CI
v3:
	* put igt_describe() before igt_subtest() (Petri)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 tests/fbdev.c                         | 11 +++++++++++
 tests/intel-ci/fast-feedback.testlist |  1 +
 2 files changed, 12 insertions(+)

diff --git a/tests/fbdev.c b/tests/fbdev.c
index 62aa99b4..598e2963 100644
--- a/tests/fbdev.c
+++ b/tests/fbdev.c
@@ -229,6 +229,17 @@ static void framebuffer_tests(int fd)
 		igt_assert_f(ret == 0, "read at EOF, ret=%zd\n", ret);
 	}
 
+	igt_describe("Check framebuffer access with NULL");
+	igt_subtest("nullptr") {
+		ssize_t ret;
+
+		ret = pread(fd, NULL, fix_info.smem_len, 0);
+		igt_assert_f((ret == -1) && (errno == EFAULT), "reading into NULL did not return EFAULT, ret=%zd\n", ret);
+
+		ret = pwrite(fd, NULL, fix_info.smem_len, 0);
+		igt_assert_f((ret == -1) && (errno == EFAULT), "writing from NULL did not return EFAULT, ret=%zd\n", ret);
+	}
+
 	igt_fixture {
 		free(buf);
 		memset(map, 0, fix_info.smem_len); // don't leave garbage on the screen
diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index 9e0b71e9..eaa904fa 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -4,6 +4,7 @@ igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
 igt@fbdev@eof
 igt@fbdev@info
+igt@fbdev@nullptr
 igt@fbdev@read
 igt@fbdev@write
 igt@gem_basic@bad-close
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
