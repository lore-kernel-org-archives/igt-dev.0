Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFB36EA17
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:39:40 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so1860122pjp.4
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:39:40 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:38:40 -0500
Message-Id: <20210609173903.249112-21-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 70/93] tests/i915/gem_exec_endless: Stop
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
index c3c80654..b83d5a2c 100644
--- a/tests/i915/gem_exec_endless.c
+++ b/tests/i915/gem_exec_endless.c
@@ -309,7 +309,7 @@ static void endless_dispatch(int i915, const struct intel_execution_engine2 *e)
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
