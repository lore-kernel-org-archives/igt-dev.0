Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9026EC8E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:35 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 27so18397551pgy.3
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:35 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:36 -0500
Message-Id: <20210609043259.102581-21-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
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
