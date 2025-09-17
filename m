Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A0DCAC5A0
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 17:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895DE10E576;
	Wed, 17 Sep 2025 17:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nyj4IEGr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0F410E075
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 17:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758128641; x=1789664641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z9qoDCb3BAbK3GeZVDUF3IKAAtDRVEBmYksVH9fQ5nc=;
 b=Nyj4IEGrKSy/2uoCvlBHuesqmQ8tU3KTIhrKRnvo5reOFFCKeYpuBwTH
 jw6BQ9zMh1IIXzmGxMAlFNV/AapH0N9SJwccMRCOdUmWl7U7T/F+Rn9Sf
 RaLk2S/eeAQYa254Y827EuB8UREJIO5PAt5JfTLTSb7TkYrih7xV8WWZs
 MkU3kXNVrL6omFf4wc3P+EVqANdPGphA9Qi4eay+RgmRWQh4iRaD46jDK
 jynqTNfoiQ+AIEN2XE0kZnzqrV/qtCNKMoRd+Iy/XjVg1Mutn53OyDWcg
 H/1k7T9QUKCFt88kxrZqT35zVhEai22tdA70TuiCl1rHcocpugM7l1VyJ Q==;
X-CSE-ConnectionGUID: 4sXEwNNkSqm2hPqiuFdqWw==
X-CSE-MsgGUID: NE9hBcZMQjGYjLmMEoHmAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71073536"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="71073536"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:56:00 -0700
X-CSE-ConnectionGUID: olIEbDA4QguoOVLlt70OIw==
X-CSE-MsgGUID: p1XHbhjUQ66EONY8SPI9QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="212449797"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 09:55:58 -0700
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gwan-gyeong.mun@intel.com, andrzej.hajda@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 3/4] lib/xe/xe_query: add function to retrieve uint32_t value
 from hwconfig
Date: Wed, 17 Sep 2025 16:55:40 +0000
Message-Id: <20250917165541.85203-4-jan.maslak@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250917165541.85203-1-jan.maslak@intel.com>
References: <20250917165541.85203-1-jan.maslak@intel.com>
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

Adds helper function to xe_query which retrieves a single u32 value out of
hwconfig.

Signed-off-by: Jan Maslak <jan.maslak@intel.com>
---
 lib/xe/xe_query.c | 9 +++++++++
 lib/xe/xe_query.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
index da2788372..ae3d30b33 100644
--- a/lib/xe/xe_query.c
+++ b/lib/xe/xe_query.c
@@ -1035,6 +1035,15 @@ uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32
 	return NULL;
 }
 
+uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute)
+{
+	uint32_t len, *val;
+
+	val = xe_hwconfig_lookup_value(fd, attribute, &len);
+	igt_assert(val && len == 1);
+	return *val;
+}
+
 igt_constructor
 {
 	xe_device_cache_init();
diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 26535bb74..6404d800f 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -136,6 +136,7 @@ bool xe_is_media_gt(int fd, int gt);
 bool xe_is_main_gt(int fd, int gt);
 uint16_t xe_gt_get_tile_id(int fd, int gt);
 uint32_t *xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute, uint32_t *len);
+uint32_t xe_hwconfig_lookup_value_u32(int fd, enum intel_hwconfig attribute);
 
 struct xe_device *xe_device_get(int fd);
 void xe_device_put(int fd);
-- 
2.34.1

