Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C904CEDD97
	for <igt-dev@archiver.kernel.org>; Tue, 18 Nov 2025 14:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D800210E4D0;
	Tue, 18 Nov 2025 14:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DZVPkKnu";
	dkim-atps=neutral
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB4F10E4D0
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 14:33:25 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-34361025290so4243045a91.1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Nov 2025 06:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763476404; x=1764081204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eT/0UQVKEnn7dZyxX4zoJYKYTtyhPenp94F2Ge9GuzA=;
 b=DZVPkKnuBpNJhn+FGbCIkg6pueQ/wnmSMlmLuN927CJVAtS7hlhMYjwBmzjRXxFLgZ
 xeuWphsVtHmnMSqKdskyuwzgnDJztkBD48X5tclQnjY/7rA7DUmcEyIbfVBywS+qWDEk
 txHvjmDj5s+xByOshV0ITIWR11ZtA2+JyoegWhdFVJmMgRBdud6uwb4eGYJwEOvVA3f1
 s3YR9f4wIXX2+iLwslgCu+5D09kKMtPungVv5krPjG7kvjMi/8iAlhL7ozOACqXaFSrU
 OfhayVEQzB5Ztd2IOpbLzwRQlNN8x2gE5WRzXD30/neYhHpt29SzBZwvb3WYy/0tOnNn
 2F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763476404; x=1764081204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eT/0UQVKEnn7dZyxX4zoJYKYTtyhPenp94F2Ge9GuzA=;
 b=YTbfAkLRFDfpZEO7S1TCcijzduY1UwwDz33dhbxeigjzAWdFl4bWKdBBFw4lLfo2bj
 PwxcUtN+DhIpejn3IOjjdA7GxEIBxGQieDQ0woGHPhTe3klEHyIxb8NF0dOkjmiW9wn6
 9LNP8p/ur/AjLIMLb9bDAgBoEOv6b+EvtM8zogIZ3tLlHZjzd4Rb7tnTy+SXO0/xU012
 qEXSw/aIrmqt2GPr62eBcsCqjDKw/Lm2TWSeDQLzsLifa1eLRdJVIn1wodpwJGCzCgLh
 hdXzgQxqgiwiDgHDjjfYC5EpDLPFKjqPzQEBCZ91TwJ0D07H2i7sF0uF9u0VYfs2NoDF
 ZVwA==
X-Gm-Message-State: AOJu0Ywh77zKXraSP9ZU71mSNEXR9z80xAZ9YeK1KAIQVdvGwrX64UFE
 lk7YPR2hvFHCzXMXLMH58Ad3VdwtgfwUVQXKJ7rroy1y51MktY5seSNzeeg3WDTJ
X-Gm-Gg: ASbGncuH0k1QIKX2j/sWTJzkwSqeezcRt+7nka4dNA1C3+l2g1vYdG/atQ74gvnycQk
 k+yBubrBAf2yOQzbUIkLjp69YiU3leHfBIuOItCRVeJGdFd7v5N40EPuSYjCURuS90z/5o2XzKJ
 ODBE9udRBps5e92nAxAl45ho5ECiLw2AkXR5+DQ/XeQHMOA96mnLwt8q188HH1HrClZloSqI5dX
 kdlkdDajxZ77AYNNJ+jo18C7ZF03OzpOcoerbC6KHXSxX4gahQr91lbv7oss2lWGsY2Jlh4yImL
 TI794Kr8kUoXa1PrT8ToCwJbioTsywO6yzZYG9OcNjay0Ri6X0zdkRQ2AFwNPO7Vp6ER+VrCvpG
 VqPnOtvTXPX3SSmdhhQXvW6ZdczYLVMnVWh+8wCHIKrRfQ5mR7eZxAvLqe6TeX3nbhaypMpMHs7
 cY8J0FoXtZ0ADmmuM=
X-Google-Smtp-Source: AGHT+IEhwVINQDZjtUAkFNl4zg2TTOyv+nZARR05yx5siic0HPor9AX0NVv9UESJIMyMSLjszYkk/A==
X-Received: by 2002:a17:90b:5804:b0:340:f05a:3ed3 with SMTP id
 98e67ed59e1d1-343fa52544fmr19493731a91.17.1763476404306; 
 Tue, 18 Nov 2025 06:33:24 -0800 (PST)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-345b03c7515sm1285267a91.5.2025.11.18.06.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:33:23 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/2] tests/intel/i915_module_load: take out
 reload-with-fault-injection test
Date: Tue, 18 Nov 2025 16:32:53 +0200
Message-ID: <20251118143301.510707-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118143301.510707-1-juhapekka.heikkila@gmail.com>
References: <20251118143301.510707-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

i915 fault injection mechanism is replaced with kernel generic
fault inject mechanishm hence take reload-with-fault-injection
test out as it would just skip.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/i915_module_load.c | 83 ----------------------------------
 1 file changed, 83 deletions(-)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index c23b6cd30..6bdd1d8ba 100644
--- a/tests/intel/i915_module_load.c
+++ b/tests/intel/i915_module_load.c
@@ -48,10 +48,6 @@
  * Description: Verify that i915 driver can be successfully loaded with disabled display.
  * Feature: core, sriov-core
  *
- * SUBTEST: reload-with-fault-injection
- * Description: Verify that i915 driver can be successfully reloaded at least once with fault injection.
- * Feature: core, sriov-core
- *
  * SUBTEST: resize-bar
  * Description: Check whether lmem bar size can be resized to only supported sizes.
  */
@@ -194,14 +190,6 @@ static void store_all(int i915)
 		igt_assert_eq_u32(engines[i], i);
 }
 
-static int open_parameters(const char *module_name)
-{
-	char path[256];
-
-	snprintf(path, sizeof(path), "/sys/module/%s/parameters", module_name);
-	return open(path, O_RDONLY);
-}
-
 static void unload_or_die(const char *module_name)
 {
 	int err, loop;
@@ -224,40 +212,6 @@ static void unload_or_die(const char *module_name)
 		       module_name, err, loop);
 }
 
-static void must_unload(int sig)
-{
-	unload_or_die("i915");
-}
-
-static int
-inject_fault(const char *module_name, const char *opt, int fault)
-{
-	char buf[1024];
-	int dir;
-
-	igt_assert_lt(0, fault);
-	snprintf(buf, sizeof(buf), "%s=%d", opt, fault);
-
-	if (igt_kmod_load(module_name, buf)) {
-		igt_warn("Failed to load module '%s' with options '%s'\n",
-			 module_name, buf);
-		return 1;
-	}
-
-	dir = open_parameters(module_name);
-	igt_sysfs_scanf(dir, opt, "%d", &fault);
-	close(dir);
-
-	igt_debug("Loaded '%s %s', result=%d\n", module_name, buf, fault);
-
-	if (strcmp(module_name, "i915")) /* XXX better ideas! */
-		igt_kmod_unload(module_name);
-	else
-		igt_i915_driver_unload();
-
-	return fault;
-}
-
 static void gem_sanitycheck(void)
 {
 	struct drm_i915_gem_busy args = {};
@@ -680,43 +634,6 @@ igt_main
 		igt_i915_driver_unload();
 	}
 
-	igt_describe("Verify that i915 driver can be successfully reloaded at least once"
-		     " with fault injection.");
-	igt_subtest("reload-with-fault-injection") {
-		const char *param;
-		int i;
-
-		igt_i915_driver_unload();
-
-		/*
-		 * inject_fault() leaves the module unloaded, but if that fails
-		 * we must abort the run. Otherwise, we leave a dangerous
-		 * modparam affecting all subsequent tests causing bizarre
-		 * failures.
-		 */
-		igt_install_exit_handler(must_unload);
-
-		i = 0;
-		param = getenv("IGT_SRANDOM");
-		if (param)
-			i = atoi(param);
-		if (!i)
-			i = time(NULL);
-		igt_info("Using IGT_SRANDOM=%d for randomised faults\n", i);
-		srandom(i);
-
-		param = "inject_probe_failure";
-		if (!igt_kmod_has_param("i915", param))
-			param = "inject_load_failure";
-		igt_require(igt_kmod_has_param("i915", param));
-
-		i = 1;
-		while (inject_fault("i915", param, i) == 0)
-			i += 1 + random() % 17;
-
-		unload_or_die("i915");
-	}
-
 	igt_describe("Test i915 fault injection");
 	igt_subtest_with_dynamic_f("fault-injection")
 		test_fault_injection();
-- 
2.43.0

