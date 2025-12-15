Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5A6D5B174
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 13:45:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E0510E4B8;
	Mon, 15 Dec 2025 13:45:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l1T+/VXr";
	dkim-atps=neutral
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0B10E4B8
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 13:45:36 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id
 41be03b00d2f7-bf5ac50827dso2138914a12.2
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 05:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765806336; x=1766411136; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cxpbwAvqV4hZUGk5VjXZjJ8lzZ27z0gFLdgDEzM2VSU=;
 b=l1T+/VXrVTazbUma9KpW/VrG+bQYFO+t/Pl/rBVx0Qc1sX82aMxW13U1xhlTFwwbZV
 7aHuNaRhnYCmEopvQzO0Q6deFewPSSx0i/WQUFot3Fu1OQ2KYLXyxNaE1d7Os0J5U7VM
 4zD4ythPrtCqqv8VPzWW2w2BFrxXfRK4XswQOgk8mjnuK522e93tmvdGnT/1fdG8c65f
 Q8PwiSSDF66P7vM6HFki2pokL+mQAr+YhcvYV/zzAPXoQE67X69g3PqD9/YN63SgGXf2
 gTPLSxkR0BnOyGfrorEAs0JGzqT1y+oLevmWaAKlzNwb4tnzDtA/LAX8wdVmMycVsbyL
 Pg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765806336; x=1766411136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cxpbwAvqV4hZUGk5VjXZjJ8lzZ27z0gFLdgDEzM2VSU=;
 b=DBlmJnVsKLq7VN3uuPI2KHV+GonD9vJLm6zZvSyqxMnL7cqE1RpperufCwr/PkTM3i
 1DhtPWuyG5G80zyjaO2nkIhBiyLELD/Z717dOVtx4XQ86D18GeGPhZOq6xS41Ury0b0N
 VefGgEZveBX2fcc6M0iDYkby5fycTnvDKaTbrFI8dXFv4JiIMw/Qpq6Cm5v0l6DCs90v
 IiRTk8fG65I1eEeeKgbLDj9b4rBlaiLeOp1IKZzBP9zn30ZEbiADlon+GjJ+N21Vcr4B
 YMwMr4kmET8Ze6ytdQp1wgrfZX43LsGzwHFKzuMze8nN4/mL0xDVRD3KokZX6YHR1mWB
 d5QA==
X-Gm-Message-State: AOJu0Yy4cvk/dFQq9enHHtMJ63Ukjf/fBjgvjp6xLCuZLpIb6uUxyLlS
 ks0bCSYJD917hG/5wY1RGV9pCokz6g217l9iwRI3ZqFlZbgTKywMDWyAu2KGmGQc
X-Gm-Gg: AY/fxX5ani6a1tB+vf36PkUkWXprGSXvVNvisjbRChP0/Qa3QzrSKkdyaT//r6J/PB9
 ToKKWAY9oIoVhUZmheEjA0WYfo3jHrXctm8S8dtdi1FNP/tNzzp6X8WzGKjVIQM1E33aodjNG3j
 4ax7N5IDfanLiYWddWwYQMRRG2zciZF6aDtXPxNsoUW3JV/eHi4Diem3KyiRBD4KvW2SkKsm3G8
 quzpw+StvTYM8BewzVC10MqDqUBSgHUg2HK5iYDXrpzqSOzM1F017aameL7ftmMU8L8v2f2shEx
 Dgvymfip3z+SgD8xjjMIOYLDDGZZVHZkG1CDWkPqp5bd6/Qb/m8BZ2KnAjqMF4FYKCQUNQSEOEV
 5kH+KPlUKc3mARTefQFxXpuosD89DNZn2gxge8kyAtjnxV86mn/kHQkukFbtYMPVkBnVARVmD+B
 XaajnERp9nLNrEsJEeX0T3uwDG/smPjczVK+VhNbhZOpwnV0U=
X-Google-Smtp-Source: AGHT+IHrUPIhujY41NYGqiRFoZHdT5+ZZ70WSFfZqwV7wpan99N4wr8xFyswrxUAzEhc4dkSm1u5sA==
X-Received: by 2002:a05:7301:db10:b0:2a4:5ce8:44d0 with SMTP id
 5a478bee46e88-2ac303f31aamr5986040eec.38.1765806335523; 
 Mon, 15 Dec 2025 05:45:35 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ac342eeaaasm18767772eec.6.2025.12.15.05.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 05:45:35 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/i915_module_load: take out
 reload-with-fault-injection test
Date: Mon, 15 Dec 2025 15:44:35 +0200
Message-ID: <20251215134510.183735-3-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215134510.183735-1-juhapekka.heikkila@gmail.com>
References: <20251215134510.183735-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/i915_module_load.c | 83 ----------------------------------
 1 file changed, 83 deletions(-)

diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
index 8da9a1ca4..26e30a100 100644
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
@@ -681,43 +635,6 @@ int igt_main()
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

