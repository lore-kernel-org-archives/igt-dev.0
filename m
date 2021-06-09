Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89736EC89
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 04:33:29 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id y15so17428251pfl.4
 for <igt-dev@lists.freedesktop.org>; Tue, 08 Jun 2021 21:33:29 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue,  8 Jun 2021 23:32:32 -0500
Message-Id: <20210609043259.102581-17-jason@jlekstrand.net>
In-Reply-To: <20210609043035.102359-1-jason@jlekstrand.net>
References: <20210609043035.102359-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 66/93] tests/i915/gem_exec_balancer: Stop
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
 tests/i915/gem_exec_balancer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 9c36c147..b928c1b3 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -3081,7 +3081,7 @@ static void noheartbeat(int i915)
 	 * heartbeat has already been disabled.
 	 */
 
-	__for_each_physical_engine(i915, e)
+	for_each_physical_engine(i915, e)
 		set_heartbeat(i915, e->name, 0);
 
 	for (int class = 0; class < 32; class++) {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
