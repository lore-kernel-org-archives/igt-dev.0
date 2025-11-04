Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229C0CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 06:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A914810E520;
	Tue,  4 Nov 2025 06:01:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haOei6Vy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45CF010E520
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 06:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762236108; x=1793772108;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=okh4pB5Jlxtm/xOwK9esaBh9VCVP7ahg8Mm5IUFfFfM=;
 b=haOei6Vyzhv2avGG1Ww0Lj0BHceOFfUE4EkDWAD/bi+sbNVzIHvUtmk8
 uWF+zpgpvcml7OuxrI7y9q/9h9OlQOCfY1y1ktaZbIfnJV6OFEI5HF5zK
 O8MOkEt5KdRSMB8MOven+RJSyctzBtohDhN/Vo4m1D6wg3keTspinX00C
 1DebnAAf6VmvrI3SmBIforketP6kFb+hox1znAsqeFevHLEQWNtpOHAF4
 Cl5eb32a89o2yXuJruPIVeCpqH/YVtC4yaSrQceIdd3i9E03MD+5LUVVz
 mAAMZpdP0o8e1InW651SBZnM61MPJmmCCsa7LKW7GW5weneWBpTtKkWn0 w==;
X-CSE-ConnectionGUID: cN6n00/SQDq9YwRjk4HKkA==
X-CSE-MsgGUID: EJU6FIOlRPmPKoR30shG8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="81728720"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="81728720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:48 -0800
X-CSE-ConnectionGUID: XjrChR+qRwi6rcm1eNcWIg==
X-CSE-MsgGUID: 4yyUitHIQo+uezUCOuJ/bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="217709596"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2025 22:01:46 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t 2/3] lib/xe/xe_spin: Export xe_spin_sync_wait
Date: Tue,  4 Nov 2025 11:21:28 +0530
Message-Id: <20251104055129.3826274-3-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251104055129.3826274-1-soham.purkait@intel.com>
References: <20251104055129.3826274-1-soham.purkait@intel.com>
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

libify xe_spin_sync_wait enabling reuse for Xe driver

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 lib/xe/xe_spin.c | 2 +-
 lib/xe/xe_spin.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index 9909f4e03..d29d8281d 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -302,7 +302,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 	return spin;
 }
 
-static void xe_spin_sync_wait(int fd, struct igt_spin *spin)
+void xe_spin_sync_wait(int fd, struct igt_spin *spin)
 {
 	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
 }
diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
index af32ab563..1cd578e2d 100644
--- a/lib/xe/xe_spin.h
+++ b/lib/xe/xe_spin.h
@@ -77,6 +77,7 @@ void xe_spin_reset(int fd, igt_spin_t *spin);
 bool xe_spin_started(struct xe_spin *spin);
 void xe_spin_wait_started(struct xe_spin *spin);
 void xe_spin_end(struct xe_spin *spin);
+void xe_spin_sync_wait(int fd, struct igt_spin *spin);
 
 /*
  * xe_cork: higher level API that simplifies exec'ing an xe_spin by taking care
-- 
2.34.1

