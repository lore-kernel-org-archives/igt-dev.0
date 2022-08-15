Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F4014BAB5
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 14:52:28 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id bj43so3789331vkb.4
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Aug 2022 07:52:28 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: Petri Latvala <petri.latvala@intel.com>,
	igt-dev@lists.freedesktop.org
Date: Mon, 15 Aug 2022 11:51:45 -0300
Message-Id: <20220815145146.24038-4-tales.aparecida@gmail.com>
In-Reply-To: <20220815145146.24038-1-tales.aparecida@gmail.com>
References: <20220815145146.24038-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/4] lib/kselftests: Skip kselftest when
 opening kmsg fails
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Check for errors in igt_kselftest_begin() during open("/dev/kmsg")
and fail appropriately, removing the always-zero return of the function.

Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
---

Notes:
    v2 -> v3: Use igt_require_fd to skip tests instead of igt_assert_fd, which would fail tests

 lib/igt_kmod.c | 7 +++----
 lib/igt_kmod.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index bde0461a..5864f68c 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -922,7 +922,7 @@ int igt_kselftest_init(struct igt_kselftest *tst,
 	return 0;
 }
 
-int igt_kselftest_begin(struct igt_kselftest *tst)
+void igt_kselftest_begin(struct igt_kselftest *tst)
 {
 	int err;
 
@@ -933,8 +933,7 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
 	igt_require(err == 0 || err == -ENOENT);
 
 	tst->kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
-
-	return 0;
+	igt_require_fd(tst->kmsg);
 }
 
 int igt_kselftest_execute(struct igt_kselftest *tst,
@@ -1012,7 +1011,7 @@ void igt_kselftests(const char *module_name,
 		return;
 
 	igt_fixture
-		igt_require(igt_kselftest_begin(&tst) == 0);
+		igt_kselftest_begin(&tst);
 
 	igt_kselftest_get_tests(tst.kmod, filter, &tests);
 	igt_subtest_with_dynamic(filter ?: "all") {
diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
index f98dd29f..0d80451b 100644
--- a/lib/igt_kmod.h
+++ b/lib/igt_kmod.h
@@ -65,7 +65,7 @@ struct igt_kselftest_list {
 
 int igt_kselftest_init(struct igt_kselftest *tst,
 		       const char *module_name);
-int igt_kselftest_begin(struct igt_kselftest *tst);
+void igt_kselftest_begin(struct igt_kselftest *tst);
 
 void igt_kselftest_get_tests(struct kmod_module *kmod,
 			     const char *filter,
-- 
2.37.1
