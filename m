Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AA1105F784
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519A310E04D;
	Fri, 13 Mar 2026 09:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2iie1Nx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EABB10E04D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773394339; x=1804930339;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cTFC1Eer8lIzmXw7cxlFDT815oc36NTND7ZuG8WVVps=;
 b=j2iie1NxTMiqOIExrYjLvi9pXKubXuIFhHiAUokNZg4WIAXsI5WJfBIp
 eztOQA84JyQpVp2WI72hK6cLEPLtQNP01MiwGVlhUnMz2WReJuDa8fs30
 uHkSNkUlmMCYd1FP6LY+tTkrp0PiD6eI8ywIfLY02a2HX8PnKoWsFG7/5
 YsZC4uMQ9o8Q3aY/ub9iczJogrMGDphpWoyBGQelLRG3X110aiccZF1tl
 vlFNiHhM2fxc28BbDma2oyXoc4FlghmdRkNSKdquKcApvLkG+wr6H7Khp
 RbYHnGKCtM0jILZ2obl0hRHLoYplWtIkIBxz2X/rBq6I0FSDazrWXpyPv A==;
X-CSE-ConnectionGUID: M7Dg35zyRG6W5aioSy8Mrg==
X-CSE-MsgGUID: fZYoCeqbTuyKLaRvgdI+Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74380915"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="74380915"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:19 -0700
X-CSE-ConnectionGUID: vX3xp2jgTwSSFdG4+CXTUg==
X-CSE-MsgGUID: hYigAfNLTYGeSt5TSHsYQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225801379"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.158])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 02:32:16 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 2/8] lib/kms: add igt_crtc_for_crtc_index()
Date: Fri, 13 Mar 2026 11:31:54 +0200
Message-ID: <165c823266c054b2b1f75ccf162b29674899d0f8.1773394225.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773394225.git.jani.nikula@intel.com>
References: <cover.1773394225.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

Add a function similar to igt_crtc_for_pipe() and igt_crtc_for_crtc_id()
but based on CRTC index. We'll be adding a user in follow-up.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 12 ++++++++++++
 lib/igt_kms.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 6ccc9d0e6221..57f5e099a313 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8020,6 +8020,18 @@ igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id)
 	return NULL;
 }
 
+igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index)
+{
+	igt_crtc_t *crtc;
+
+	for_each_crtc(display, crtc) {
+		if (crtc->crtc_index == crtc_index)
+			return crtc;
+	}
+
+	return NULL;
+}
+
 /*
  * igt_first_crtc:
  * @display: pointer to igt_display_t
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 2492dac77e4f..0bb2734ea3d7 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -583,6 +583,7 @@ static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pi
 	return &display->crtcs[pipe];
 }
 igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
+igt_crtc_t *igt_crtc_for_crtc_index(igt_display_t *display, int crtc_index);
 igt_crtc_t *igt_first_crtc(igt_display_t *display);
 igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
 igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc);
-- 
2.47.3

