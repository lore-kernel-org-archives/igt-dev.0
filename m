Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7051C3DA41
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 13:59:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7862710E188;
	Thu, 11 Jul 2024 13:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Me8sdKGP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 375CB10E188
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 13:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720706352; x=1752242352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FaFZiTiN5Q8DefAi3WCkqNr59j3voV93oq+WACwtmvM=;
 b=Me8sdKGPKGTkSFKBfPQEwOvhLwZ8F+i3VnQmWbBCECGlD2IpWMzmjzRz
 Kc8LGkFrrGTuWRe8nEeij+gA3UO1yy0TSF/4H4o/PpzWmDAtd3teb/rov
 LhiEn0YbvX+z5cV1k8fWNuz0p0zpHpnq31j8EdnqPcI0r0NlhkUf56CQm
 moDpspJR2+Yg56U5dmepqF0XaYLL73aKnLGxBr0UB25OaKFmUM1eIrfz/
 e3z2eVzvLqrCwln7uLcs3IoGaHKQHSbiBiBE6WHVgDwWliCY3Eh8nywtU
 Lq0kyZUMAMuC8fMddb49CZAxSDoKd4wN5KueLQO7Dxl/evM96M4QZmkbu A==;
X-CSE-ConnectionGUID: FFRtrzkSSjurLVA6P0ff2g==
X-CSE-MsgGUID: NcdIVuSuQrmry1ee1EMGgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18222377"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="18222377"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:59:12 -0700
X-CSE-ConnectionGUID: b76JrfwrRx6XuvMyPP2k7Q==
X-CSE-MsgGUID: KyjFuiPjStuRhSTA7/aKGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; d="scan'208";a="53389458"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.84.149])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 06:59:10 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Subject: [PATCH v2 i-g-t 1/2] tests/intel-ci/xe.blocklist: Blocklist SR-IOV
 stress tests
Date: Thu, 11 Jul 2024 15:58:57 +0200
Message-Id: <20240711135858.975304-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
References: <20240711135858.975304-1-marcin.bernatowicz@linux.intel.com>
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

Blocklist certain sriov_basic tests identified as overly stressful or
time-consuming to be executed with all dynamic subtests at once.
However, these dynamic subtests can still be executed via testlists
(refer to the BAT example below).

Included in the blocklist to prevent simultaneous execution of all
dynamic subtests:
 igt@sriov_basic@enable-vfs-autoprobe-on
 igt@sriov_basic@enable-vfs-bind-unbind-each
 igt@sriov_basic@bind-unbind-vf

Tests retained for execution:

BAT:
 igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
 igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1

FULL:
 igt@sriov_basic@enable-vfs-autoprobe-off
 igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 828baf324..f9ef612c4 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -83,3 +83,10 @@ igt@kms_prime@.*
 ##################################################################
 igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
 ##################################################################
+# SR-IOV tests too stressful or time-consuming
+# to execute all dynamic subtests at once.
+##################################################################
+igt@sriov_basic@enable-vfs-autoprobe-on$
+igt@sriov_basic@enable-vfs-bind-unbind-each$
+igt@sriov_basic@bind-unbind-vf$
+##################################################################
-- 
2.31.1

