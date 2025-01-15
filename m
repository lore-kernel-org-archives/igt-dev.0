Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A2BC02185
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 07:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B10A10E4DE;
	Wed, 15 Jan 2025 07:10:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j+xzeHVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5F410E4DE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 07:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736925048; x=1768461048;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pnIgt4gwEYX4Rp0FDZI//3N1snNm2dnSw33EjbGWejk=;
 b=j+xzeHVjxi99f+vMxSBvY6bEuxlCFIKPQOWtGghlWpPTToyrsGBvP8t9
 xlptwhiaRUTlsCUmyLFRxCWF9wdLTIBiibq3x/WqnJpZoHjd/GgA2C1UY
 kANJXGY1OKBdUIwndyh8OwziDOx2Z+5OMY+Z0iMrMPi9VRZat3mXy/4cv
 yXM0ClcDf5PsnU/FM2wXkMTrSY2RCypOfE+1rjUge6vGBbQNi0Ps2otdW
 tQfj38NM8K7YRWDw2gx8nim2iUevxOSAkp0O/Uini/HS0mtO/UI8e3DUx
 ZetnkUsuggl3TxIgfOgi+J4peROEdHr5+ZiqHty6Z+rj7CqMjIXoydPKY A==;
X-CSE-ConnectionGUID: Z0rHPueIT9CbBgvtFN9xpw==
X-CSE-MsgGUID: riNxCr6lQViT5yIEOhP2aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40927156"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="40927156"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:10:46 -0800
X-CSE-ConnectionGUID: UnyoGmoCSyOYUsB/TvdR5w==
X-CSE-MsgGUID: 4Shl0rmySa2RC5Jtuept0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="104881250"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:10:43 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 1/3] lib/igt_perf: Add helper functions to read format
 entries
Date: Wed, 15 Jan 2025 13:00:38 +0530
Message-ID: <20250115073040.1852977-2-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115073040.1852977-1-riana.tauro@intel.com>
References: <20250115073040.1852977-1-riana.tauro@intel.com>
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

add helper functions to read format entries of pmu

Signed-off-by: Riana Tauro <riana.tauro@intel.com>
---
 lib/igt_perf.c | 23 +++++++++++++++++++++++
 lib/igt_perf.h |  1 +
 2 files changed, 24 insertions(+)

diff --git a/lib/igt_perf.c b/lib/igt_perf.c
index 3866c6d77..7d2ff8969 100644
--- a/lib/igt_perf.c
+++ b/lib/igt_perf.c
@@ -129,6 +129,29 @@ uint64_t igt_perf_type_id(const char *device)
 	return strtoull(buf, NULL, 0);
 }
 
+int igt_perf_format(const char *device, const char *name, char *buff, int buflen)
+{
+	char buf[NAME_MAX];
+	ssize_t ret;
+	int fd;
+
+	snprintf(buf, sizeof(buf),
+		 "/sys/bus/event_source/devices/%s/format/%s", device, name);
+
+	fd = open(buf, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	ret = read(fd, buff, buflen - 1);
+	close(fd);
+	if (ret < 1)
+		return -1;
+
+	buf[ret] = '\0';
+
+	return 0;
+}
+
 int igt_perf_events_dir(int i915)
 {
 	char buf[80];
diff --git a/lib/igt_perf.h b/lib/igt_perf.h
index 3d9ba2917..c9c6b27f7 100644
--- a/lib/igt_perf.h
+++ b/lib/igt_perf.h
@@ -57,6 +57,7 @@ uint64_t igt_perf_type_id(const char *device);
 int igt_perf_events_dir(int i915);
 int igt_perf_open(uint64_t type, uint64_t config);
 int igt_perf_open_group(uint64_t type, uint64_t config, int group);
+int igt_perf_format(const char *device, const char *name, char *buff, int buflen);
 
 const char *i915_perf_device(int i915, char *buf, int buflen);
 uint64_t i915_perf_type_id(int i915);
-- 
2.47.1

