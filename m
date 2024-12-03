Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B761CE6C60C
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 06:15:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7185D10E8ED;
	Tue,  3 Dec 2024 06:15:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PfUb+o85";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BB610E8ED
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 06:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733206527; x=1764742527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FN6MMwSs/fXkGjfZY3kfvKUEUYgl85WxsoAfLYx2skg=;
 b=PfUb+o85jWPYBbaOk9W+KxHSXubXvgT3LxR6+aM+C2/YKnDj3Ip0CZTN
 P1wS+Nvh6c1VYGrybWLSyxMbdp4X9gktXKKkNXtwg7BwvQw4QwA+GyYIi
 XlHvxOOvlTDRZqdpOtz+AFyk0GpTtHJ7W5zM7kV5ZU3ePZc2I50ZNsTQx
 ujbmC4QITMeRGUNVItZ8JgOLQGN7NThQikAP9/4DsseRLhzfOE4vq/ehU
 59NQpP5wefq4zpZTgVhhBxgnDpjsh7IubUpTgnp6Y8bnweFIiBTRaZeQt
 hsrFMvxDznpGMMiioXXCVrp5Xj9sJD2NXTZhFaca0BIi5LNiKTwj90IlO w==;
X-CSE-ConnectionGUID: s/+evykoTO6+MC141/ILVw==
X-CSE-MsgGUID: U53avSP+RzSeQ1BMRf+kkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="50816191"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="50816191"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 22:15:27 -0800
X-CSE-ConnectionGUID: JDgiGgklR32w5V/Pp3+xBg==
X-CSE-MsgGUID: YIMDpC/eTJeDez9myBEHIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="98346300"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa003.jf.intel.com with ESMTP; 02 Dec 2024 22:15:26 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] test/kms_content_protection: Account for
 reauthetication in LIC
Date: Tue,  3 Dec 2024 11:45:19 +0530
Message-Id: <20241203061519.2121105-1-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.34.1
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

During LIC the link may fail due to a variety of reasons but this
does not reflect a problem with HDCP. It becomes a problem only when
we are not able to recover from the Link Integrity Failure.
Add a check to see if CP property is CP_DESIRED and if so give it time
to reauthenticate and fail only if this reauthentication does not
happen.

--v2
-Add debug statement [Santhosh]
-Add closes tag [Santhosh]

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3508
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 59dca54df..04dff7a05 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -376,9 +376,17 @@ static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
 static void test_cp_lic(igt_output_t *output)
 {
 	bool ret;
+	uint64_t val;
 
 	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
 	ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
+	val = igt_output_get_prop(output,
+				  IGT_CONNECTOR_CONTENT_PROTECTION);
+	if (val == CP_DESIRED) {
+		igt_debug("Link Integrity Check failed, waiting for reauthentication\n");
+		ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
+	}
+
 	igt_assert_f(!ret, "Content Protection LIC Failed\n");
 }
 
-- 
2.34.1

