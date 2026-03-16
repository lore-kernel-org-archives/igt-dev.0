Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F00F013CA
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 07:59:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4E810E250;
	Mon, 16 Mar 2026 07:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mex3mK4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA7A10E49E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 07:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773647954; x=1805183954;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mQGF6bnzUVVEaFwH5832mlndbgEXgwPatGeoUZI55O4=;
 b=Mex3mK4e3Hnb82GC11MEVTFivIe2dySD384W4XPdWz9TWeNjz0piiuCD
 BKddL16raV2xPZG9b0Zx2VFI3RSeVN5mvEZIvsyF9W1ZKXdhACUw/EC+E
 5d8plAraPgabbINFR6QWEezWJphozMpyGSatU9vnwpU4LxPX7NGi+PJDN
 fFLLloyJ5WG8wPrPk+GN7heTpiw/jpQ2VgNuMWSiamrDOO9ktrTI3YECo
 lVXbvnOMGa0HMWSI4aiLvr2E5WZQDj7BBIhdoG9gQPnohc344t5G+Xft6
 +gvz7KuC8migjMMViGX4TsTFNh9MMz43+mq0utEHUSVwdWm8pvU58Wxlj w==;
X-CSE-ConnectionGUID: 3/sYV090RziiFWgMOMohNQ==
X-CSE-MsgGUID: p+aLSWFJR6SBi5aKlQNwmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74541987"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="74541987"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:14 -0700
X-CSE-ConnectionGUID: fNF4twcTRky/B1NJoh8quw==
X-CSE-MsgGUID: eQQzE1CmScKl5xiQFhE/iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; d="scan'208";a="226826071"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 00:59:13 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, kamil.konieczny@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 4/5] intel-ci: Add *-planes-random chamelium test to Xe
 blocklist
Date: Mon, 16 Mar 2026 13:26:10 +0530
Message-ID: <20260316075611.3333142-5-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260316075611.3333142-1-mohammed.bilal@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
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

Tests are exhaustive and pick random configurations, results are
non-deterministic on each run.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 80a0ee904..80cc98608 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -132,3 +132,14 @@ igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 # driver does not support VGA connector types.
 ##################################################################
 igt@kms_chamelium.*@.*vga.*
+###############################################
+# Tends to generate invalid configurations
+# using CCS planes or configurations that
+# exceed HW capabilities resulting in sporadic
+# failure with -EINVAL.
+#
+# Maintaining extra constraints for Intel's HW
+# is too costly in comparison to the value
+# provided.
+###############################################
+igt@kms_chamelium_frames@hdmi-.*-planes-random
-- 
2.48.1

