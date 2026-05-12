Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ED9CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE92F10EA88;
	Tue, 12 May 2026 12:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Si3LKBVj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDB410E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778588558; x=1810124558;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=77CqH+L9MOtxsa2VWBfnEmpGj7JGemp34WpfgUVsZI8=;
 b=Si3LKBVjx0rLeixg8Lck/3y16h7VDmP2Sf3bZDZ2Y/8nsDMUV0itG5cW
 BhsOOGc5NgVd+gplt5/YKO2geMpCMHSzBIqQw8s/9odJtfBRZM56o/wVe
 dIWmkbzG1BFpCr3FduRfVDL46hNOJhUwLy+JwyLtYanNPIzzrFwYZKvmp
 O2sCnTklFBjxP9IUVeros9D6WLAvlyJDb69OkCjv9UF3jijJsarqkCG/a
 PpRg1U1hxl8aa0P5tQTdz+092KfdaklNuqIWfMAGMjni3vFRNucERKWUJ
 b+gS3OQIhrBKFCjKycQNTJRbcGcd/iXx3Arf/ATZ91RAOT81tbJjBxuwG w==;
X-CSE-ConnectionGUID: wrHa74GXT0aJ+8z7q3wE6Q==
X-CSE-MsgGUID: q22uFux/QHqTWAeiq2tyew==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78641393"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="78641393"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:38 -0700
X-CSE-ConnectionGUID: 8YPKBfWURVqtWFVzomrqKQ==
X-CSE-MsgGUID: 3uhoK66BRJu7sMo5gzFCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; d="scan'208";a="261502779"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.104])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 05:22:37 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/25] lib/kms: Add display->format_mods_async
Date: Tue, 12 May 2026 15:21:31 +0300
Message-ID: <20260512122143.11013-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
References: <20260512122143.11013-1-ville.syrjala@linux.intel.com>
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

Create a display wide union of the planes' async format+modifier
lists, just as we already have done for the sync format+modifiers.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 6 ++++++
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index dc3486a795a4..ebc13063dfb0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6385,9 +6385,15 @@ static const struct igt_format_mods *plane_format_mods(igt_plane_t *plane)
 	return &plane->format_mods;
 }
 
+static const struct igt_format_mods *plane_format_mods_async(igt_plane_t *plane)
+{
+	return &plane->format_mods_async;
+}
+
 static void igt_fill_display_format_mod(igt_display_t *display)
 {
 	display_format_mods_fill(display, &display->format_mods, plane_format_mods);
+	display_format_mods_fill(display, &display->format_mods_async, plane_format_mods_async);
 }
 
 /**
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 35923f94d7ff..e02c5dd25d16 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -535,6 +535,7 @@ struct _igt_display {
 	bool first_commit;
 
 	struct igt_format_mods format_mods;
+	struct igt_format_mods format_mods_async;
 };
 
 typedef struct {
-- 
2.52.0

