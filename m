Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D313ECD343F
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 03:18:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7080810E2DB;
	Wed, 13 May 2026 03:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P76kWQ+5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C2310E2DB
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 03:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778642288; x=1810178288;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ghd5mEJKdqW/XjsPljGpvVxquohToWOI973xDZG5YTI=;
 b=P76kWQ+5jGyigMHH2T1xApqLyiHO7sN+Qxu3ciK+PBQaxjDX6956ORW+
 dM9a330HIj/rNp0qNhH65LKf+PRyk2kum4SQyeiRAaTkVRMLgSoge31vn
 xqbUnvwkZ1KjYbltUiW3nC6mzk0X3LjBmspBHu2vpguMLJha7b3mKKoNx
 XLJMbvDa8WUUfFjWhCuSG3YY1edOQw8eRIXCcRkPitfR7iDUTvO8Qq4Qu
 SA7iz7o43XXo8DV393kP6ASvc09Al8qyXIhBr+tEq5VQiWXBn2ba2JRk7
 uaE8bidHUnZx2ieEtaPRs66k2zIBYYCx+VGCc4cMl5CYzMN81EN2EDI5s A==;
X-CSE-ConnectionGUID: tFd/elfwTMaNqHWLkDQuwg==
X-CSE-MsgGUID: /eqWjSYaRqm/SyjR6hBg0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79275264"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="79275264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 20:18:08 -0700
X-CSE-ConnectionGUID: +8mlyf8LRn2MPIiI5dBQkA==
X-CSE-MsgGUID: 2BKnOqf9SJqksrqoJ4eczw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="276077428"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.244.10])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 20:18:06 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 17/25] lib/kms: Add helpers to query igt_format_mods
Date: Wed, 13 May 2026 06:17:59 +0300
Message-ID: <20260513031759.27394-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 34 ++++++++++++++++++++++++++++++++--
 lib/igt_kms.h |  8 ++++++++
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 75f7ca2d64e0..96fc7837b783 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6285,8 +6285,8 @@ static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t *plane
 	}
 }
 
-static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
-						    uint32_t format, uint64_t modifier)
+bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods *format_mods,
+					     uint32_t format, uint64_t modifier)
 {
 	uint64_t _modifier;
 	uint32_t _format;
@@ -6299,6 +6299,36 @@ static bool igt_format_mods_has_format_and_modifier(const struct igt_format_mods
 	return false;
 }
 
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
index 2f4526407aa2..037defa63657 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1204,8 +1204,16 @@ bool igt_connector_event_detected(struct udev_monitor *mon, uint32_t conn_id,
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
+bool igt_plane_has_modifier(igt_plane_t *plane, uint64_t modifier);
 
 /**
  * igt_vblank_after_eq:
-- 
2.52.0

