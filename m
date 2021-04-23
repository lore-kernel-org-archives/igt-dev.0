Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C1A6EC8E
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:50:53 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso2014247pjn.0
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:50:53 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:48:34 -0500
Message-Id: <20210423214853.876911-71-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 70/89] tests/i915/gem_exec_endless: Stop
 munging ctx0 engines
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 tests/i915/gem_exec_endless.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
index a3e2fa49..5eed8f21 100644
--- a/tests/i915/gem_exec_endless.c
+++ b/tests/i915/gem_exec_endless.c
@@ -308,7 +308,7 @@ static void endless_dispatch(int i915, const struct intel_execution_engine2 *e)
 }
 
 #define test_each_engine(T, i915, e) \
-	igt_subtest_with_dynamic(T) __for_each_physical_engine(i915, e) \
+	igt_subtest_with_dynamic(T) for_each_physical_engine(i915, e) \
 		for_each_if(gem_class_can_store_dword(i915, (e)->class)) \
 			igt_dynamic_f("%s", (e)->name)
 
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
