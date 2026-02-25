Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E2AFD374E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Feb 2026 12:51:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E98410E772;
	Wed, 25 Feb 2026 12:51:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="crci8gnB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F6D10E76F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Feb 2026 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772023890; x=1803559890;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8zvLbdi1iTs8Nll38aMZyF6B+8xzX8YOBxcqNXh2By4=;
 b=crci8gnBGrOm6xmevrBOEtcTfCzuzXzdnbCpt8cfFw5y2XV1uB6rbvGJ
 6JZzyli+eRPRFmMfc6pOWtglddqlMw2WGxWfhp087KfqSKz4/rfzBDR9z
 owIDGGiCkdWm8dFI73RwPpAOAaAyGdwi7+pWk7MpHS4KnWzqrg8wQRyaC
 x95NKMzL8sc+Hv23qVoim5KXOJ4t1GV3RBpIaEVuINxFoNuh7bg10m6BQ
 iICNslrpEIqV774+HHflivz7RgQif3WReBK0hAfg7JjVmvYX6M4vutB+g
 oal4NpFBIiAiwH11oLi1LdsSL+Mlvsmp0mCxqCdQgqf8+xg7C9mRVyUXo w==;
X-CSE-ConnectionGUID: T2HHfYilRAW6FGqTusJ/QA==
X-CSE-MsgGUID: wQnN0B0BQgy9eQJEY9PxRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="72934499"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72934499"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:30 -0800
X-CSE-ConnectionGUID: dFWZbwVZT2SNohEu8iB/gA==
X-CSE-MsgGUID: T59BgYRzQHadecx7gA2hVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="215331981"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.16])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 04:51:29 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 05/19] lib/kms: Introduce
 igt_first_crtc_with_single_output()
Date: Wed, 25 Feb 2026 14:50:54 +0200
Message-ID: <20260225125108.31119-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
References: <20260225125108.31119-1-ville.syrjala@linux.intel.com>
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

Several tests just want to find a single CRTC with an output.
Add a new helper (igt_first_crtc_with_single_output() for it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 15 +++++++++++++++
 lib/igt_kms.h |  2 ++
 2 files changed, 17 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index bec96f2677ad..ee95afc49aa7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7964,3 +7964,18 @@ igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id)
 
 	return NULL;
 }
+
+igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output)
+{
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+
+	for_each_crtc_with_single_output(display, crtc, output) {
+		*ret_output = output;
+		return crtc;
+	}
+
+	*ret_output = NULL;
+
+	return NULL;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5a2dd87b509f..ae488bbf4806 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -575,6 +575,8 @@ int igt_display_n_crtcs(igt_display_t *display);
 
 const char *igt_crtc_name(igt_crtc_t *crtc);
 
+igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
+
 static inline igt_crtc_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
 {
 	if (pipe == PIPE_NONE)
-- 
2.52.0

