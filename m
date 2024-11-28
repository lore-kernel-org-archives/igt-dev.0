Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822B3D690ED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Nov 2024 09:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DE410E327;
	Thu, 28 Nov 2024 09:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ma6KSoKc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0891D10E327
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2024 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732785283; x=1764321283;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hcKXIJ7JEIZA+RvG3XpXQIx1CxEI/RLu5ECg7YRxWAE=;
 b=Ma6KSoKcTk85lWTXr74qSGF76Tbrq9Fa5m7AdvYtv47+hE+jhO2+EEPT
 1OIrfSBwLqwUNml5zNXirmu0NEA4xGCf/rSb6ok5aRn/tY7CM4YTzjmBb
 JbW+tcwUHa92MCNCwqjek9nCGRwEUlHc6A9MvJKq72oaliWfRtRceuAmf
 dAVntxxEukEpIEDFIOP+AcgpBEy4++Zm0aSHG64+H32hCOvTj7j/BB7F0
 EdUw50cPNI+Jo35SIg5wUkfONTfHQk+5JvJq7s5rzf6ZgcORQOMZP6LuR
 uijUh7L0Es23Cy+R1qZjHl+JFWoz7yIMK+0jSV3xtVTmOsT0R1id7yA8E g==;
X-CSE-ConnectionGUID: PhMlIduRT0C7WlNH5Ol00A==
X-CSE-MsgGUID: 6Q/H1TihT5S5HkAjVv48DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33156683"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="33156683"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 01:14:42 -0800
X-CSE-ConnectionGUID: XdtEYBsLSj+R0/hajQ1AKA==
X-CSE-MsgGUID: PNOdiSWqTSC30yN+SysEfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="129684673"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa001.jf.intel.com with ESMTP; 28 Nov 2024 01:14:42 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t] test/kms_content_protection: Account for
 reauthetication in LIC
Date: Thu, 28 Nov 2024 14:44:26 +0530
Message-Id: <20241128091425.1794814-1-suraj.kandpal@intel.com>
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

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 59dca54df..aa88c6bc1 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -376,9 +376,15 @@ static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
 static void test_cp_lic(igt_output_t *output)
 {
 	bool ret;
+	uint64_t val;
 
 	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
 	ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
+	val = igt_output_get_prop(output,
+				  IGT_CONNECTOR_CONTENT_PROTECTION);
+	if (val == CP_DESIRED)
+		ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
+
 	igt_assert_f(!ret, "Content Protection LIC Failed\n");
 }
 
-- 
2.34.1

