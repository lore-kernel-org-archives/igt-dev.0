Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A897CCD6E6D
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 14:19:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED5F11A125;
	Thu,  4 Jun 2026 14:19:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nc1KfbLm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016E411A125
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780582721; x=1812118721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4j+mNB28xk+QHRnC0WOYpdPRrjM3btnR8nPNCczV1YQ=;
 b=Nc1KfbLmzxMzMlDmgV79/PlbQaYIPKbiQWMS7MQLHzXnQuivyogUDe68
 wxqzI2oZ6Le1RTIm+50qz6g33KuYQqEc3cqMGJ0gFH+IHainnDKUu46Hj
 bWN2rb0S54ZUn6ZvDe+SjX1qf8lqTtGu2xfEt0b+o+VI273zqh11NdeIA
 ZBKQ3veRlUmejKX+Gk6dqBsz1VKcvRvibIaS2Zpv96lpEG9Cru7WhfaNP
 Zsp1hjF1Wy9Xn9h64eb89+40hJHgzbo+fPaLLStJtpIvVBPr5HGdnioyQ
 A2NSs6XupDhACCoiG1oowIfAUdPjJ9lv15xQH+JGu7a1ZfvDK+BVLIBDM g==;
X-CSE-ConnectionGUID: t5YQWVuGRfOUKMd43qnSVA==
X-CSE-MsgGUID: g8CT5PkyRxyAUN+mq+vXAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="91726207"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="91726207"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:18:40 -0700
X-CSE-ConnectionGUID: /65OSHa4RO+LKqSlJMRkEw==
X-CSE-MsgGUID: 33643xSTTuKVOr69wA8UUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="246389293"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.98])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:18:39 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 17/25] lib/kms: Add helpers to query igt_format_mods
Date: Thu,  4 Jun 2026 17:18:35 +0300
Message-ID: <20260604141835.18012-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512122143.11013-18-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-18-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Add three new helpers for igt_format_mods:
- igt_format_mods_has_format_and_modifier()
- igt_format_mods_has_format()
- igt_format_mods_has_modifier()

These should be useful to some tests, avoiding for the tests
to iterate the igt_format_mods directly.

v2: Fix _modifier type in igt_format_mods_*()
v3: Add some docs (Juha-Pekka)
    Drop bogus igt_plane_has_modifier() prototype

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++--
 lib/igt_kms.h |  7 +++++++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 75f7ca2d64e0..0268d71d5eca 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6285,8 +6285,16 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 }
 
-static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
-						    uint32_t format, uint64_t modifier)
+/**
+ * igt_format_mods_has_format_and_modifier:
+ * @format_mods: a pointer to an #igt_format_mods structure
+ * @format: Pixel format
+ * @modifier: Modifier
+ *
+ * Returns: True if @format_mods includes the given @format/@modifier tuple, else false
+ */
+bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
+					     uint32_t format, uint64_t modifier)
 {
 	uint64_t _modifier;
 	uint32_t _format;
@@ -6299,6 +6307,50 @@ static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods
 	return false;
 }
 
+/**
+ * igt_format_mods_has_format:
+ * @format_mods: a pointer to an #igt_format_mods structure
+ * @format: Pixel format
+ *
+ * Returns: True if @format_mods includes the given @format, else false
+ */
+bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
+				uint32_t format)
+{
+	uint64_t _modifier;
+	uint32_t _format;
+
+	for_each_format_and_modifier(format_mods, _format, _modifier) {
+		if (_format == format)
+			return true;
+		(void)_modifier;
+	}
+
+	return false;
+}
+
+/**
+ * igt_format_mods_has_modifier:
+ * @format_mods: a pointer to an #igt_format_mods structure
+ * @modifier: Modifier
+ *
+ * Returns: True if @format_mods includes the given @modifier, else false
+ */
+bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
+				  uint64_t modifier)
+{
+	uint64_t _modifier;
+	uint32_t _format;
+
+	for_each_format_and_modifier(format_mods, _format, _modifier) {
+		if (_modifier == modifier)
+			return true;
+		(void)_format;
+	}
+
+	return false;
+}
+
 /**
  * igt_plane_has_format_mod:
  * @plane: Target plane
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2f4526407aa2..b81a7c1ac646 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1204,6 +1204,13 @@ bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
 void igt_flush_uevents(struct udev_monitor *mon);
 void igt_cleanup_uevents(struct udev_monitor *mon);
 
+bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
+					     uint32_t format, uint64_t modifier);
+bool igt_format_mods_has_format(const struct igt_format_mods *format_mods,
+				uint32_t format);
+bool igt_format_mods_has_modifier(const struct igt_format_mods *format_mods,
+				  uint64_t modifier);
+
 bool igt_display_has_format_mod(igt_display_t *display, uint32_t format, uint64_t modifier);
 bool igt_plane_has_format_mod(igt_plane_t *plane, uint32_t format, uint64_t modifier);
 
-- 
2.53.0

