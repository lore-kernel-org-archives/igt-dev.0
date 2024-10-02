Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B03CF31B0
	for <igt-dev@archiver.kernel.org>; Wed,  2 Oct 2024 10:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5426810E6F5;
	Wed,  2 Oct 2024 10:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EwxCro9S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDA3810E6F5
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Oct 2024 10:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727865927; x=1759401927;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CsY1zTAx+UAdW/HRu1yYPwq9JaE6LdgEJH9+zdoxIJo=;
 b=EwxCro9Sj3J1rpmZRvofTboZTZgTyzTNPSYI1PFtwUaajeULzQLz5OeO
 nMrd/C0VjB37qJCLilwWic4TkBANN43EPsWi6HkxF/mHPgz/8e2vXT15E
 tbm/yboITe03GjSf5+aO3+fcwXkNDwpdDqmSnJe4ObAexa1t9ZAeyumZt
 HET97hb2Q8i85Wp/SJoucxtCeB50rgMAWz8fenwi6GzJiX9I7urUNjAMK
 m5Q5oDOkS9uKb/TTwMDSsdDYzjKkNhac4hladL7PG/vOmD+/wqEM098LS
 Bps1lZ+67eLC6yFfmCXa0Fj7lNiblWxVTigf+B/HMstkqohAuAJZYqasn g==;
X-CSE-ConnectionGUID: 9EUE2PctQXSMAAjBlEzxOg==
X-CSE-MsgGUID: pGuuTTWpTlyCc0TttFP7iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="38382977"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="38382977"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 03:45:27 -0700
X-CSE-ConnectionGUID: eJWBDzw0SU6a5ONfKwf67A==
X-CSE-MsgGUID: y1L4TAxKTAOypkHP4edcxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74077131"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Oct 2024 03:45:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2024 13:45:23 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 4/4] lib/intel: Documnent gem_can_store_dword()
Date: Wed,  2 Oct 2024 13:45:15 +0300
Message-ID: <20241002104515.32164-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
References: <20241002104515.32164-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add basic docs for gem_class_can_store_dword() and
gem_can_store_dword().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_gt.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index b8faf2b7bd09..a8f7f4431d1c 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -667,6 +667,13 @@ static bool gem_store_dword_needs_physical(const struct intel_device_info *info)
 	}
 }
 
+/**
+ * gem_class_can_store_dword:
+ * @fd: open i915 drm file descriptor
+ * @class: engine class
+ *
+ * Is the MI_STORE_DWORD instruction actually usable?
+ */
 bool gem_class_can_store_dword(int fd, int class)
 {
 	uint16_t devid = intel_get_drm_devid(fd);
@@ -685,6 +692,13 @@ bool gem_class_can_store_dword(int fd, int class)
 	return true;
 }
 
+/**
+ * gem_can_store_dword:
+ * @fd: open i915 drm file descriptor
+ * @engine: engine
+ *
+ * Is the MI_STORE_DWORD instruction actually usable?
+ */
 bool gem_can_store_dword(int fd, unsigned int engine)
 {
 	return gem_class_can_store_dword(fd,
-- 
2.45.2

