Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C03C54732
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217EF10E270;
	Tue, 27 Aug 2024 05:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cd8MCj1L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E85710E1C7
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724737921; x=1756273921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s5onfmEJAjn+W0LjuJquAHhQArSvS/lu6CGftKyoJJM=;
 b=Cd8MCj1Lk263tM69+eCiKg8OmzSNZmK2zfxycWn7cGY9Fn9p9C2YXaR4
 S/FrHeKSoam2edhoOnyRz0qjv42eNXq7WNkX3KwezsUffExoKGpPfI97h
 6Nu8Iwgr9ZVZ+K+fTpoy4dYcxL8ZJ45uSX3g+58nG/4gckmMJXTJqjJvM
 CqUgLpeNT8zJnpORXy3X5oE4BkSnBxrugd0stXhnpvv3MejOfH6DRyb9b
 2SpD9+MFCg94ZYFl9LJXSwDVMBYHZBIVyFU+0SjJiCW2tbS2DOi5KM2ij
 +BADnj8e8VGYNhJRI0EtdIdEAuCcjNjaTSbV5txN35LEBoxQGkobA+Atb g==;
X-CSE-ConnectionGUID: o8sU+eVuQZG4Tag2iNEMKQ==
X-CSE-MsgGUID: VB7zqVNQQh6ZyERsqBa2DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="23355594"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="23355594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
X-CSE-ConnectionGUID: zDfAYJUqRwWRZYOxloRLrg==
X-CSE-MsgGUID: 8JiHvuPQTsmMz0Ip8Onjfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62800401"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:52:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 06/10] tests/intel/xe_drm_fdinfo: Use usec for batch
 duration
Date: Mon, 26 Aug 2024 22:51:25 -0700
Message-ID: <20240827055129.1671873-7-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827055129.1671873-1-lucas.demarchi@intel.com>
References: <20240827055129.1671873-1-lucas.demarchi@intel.com>
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

It's only used to control the time to usleep(), so use a better unit.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index ad563aa20..96468e1be 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_ns = (1 * NSEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
 
 static const char *engine_map[] = {
 	"rcs",
@@ -516,7 +516,7 @@ single(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int flags)
 	if (flags & TEST_ISOLATION)
 		read_engine_cycles(new_fd, pceu1[1]);
 
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 
@@ -552,7 +552,7 @@ busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe, unsigned int fl
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		spin_sync_end(fd, ctx);
 	read_engine_cycles(fd, pceu2);
@@ -579,7 +579,7 @@ single_destroy_queue(int fd, struct drm_xe_engine_class_instance *hwe)
 	spin_sync_start(fd, ctx);
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 
 	/* destroy queue before sampling again */
 	spin_sync_end(fd, ctx);
@@ -618,7 +618,7 @@ most_busy_check_all(int fd, struct drm_xe_engine_class_instance *hwe,
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
@@ -662,7 +662,7 @@ all_busy_check_all(int fd, unsigned int flags)
 	}
 
 	read_engine_cycles(fd, pceu1);
-	usleep(batch_duration_ns / 1000);
+	usleep(batch_duration_usec);
 	if (flags & TEST_TRAILING_IDLE)
 		xe_for_each_engine_class(class)
 			spin_sync_end(fd, ctx[class]);
-- 
2.43.0

