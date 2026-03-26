Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAD3106F2EB
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 07:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3B910E99E;
	Thu, 26 Mar 2026 07:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/3WUCEm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4203B10E9D6
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774511944; x=1806047944;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e0WOAGrM8SjmSAj3gyU/cl60R5dpDTpbVi0qk6vMzVo=;
 b=a/3WUCEmMP78lr/QKIa/Tp6Wem2Zgr0FCyefvF36n5CguWLS+psvAWeH
 ePzWCo/+I3LyTo5QRIUufn04htZTnP0NkLKDwNtJeW/N/6IQogNZctAT6
 WtOvSRRkeDf4bp7ygxxbpVvKm01wQGsDHZger+UYztz2OQ5foM8Wr/tHi
 Tbg63+yiaaMy6X+5M8skuoNerguQOIRrzTSSU2fWrTsZ6A9nEfqxFHMbp
 iwjxCBODfeMhn4Pt4HmgOT7xd+Zxlh5FtSeEIu40M1aoywzM2Y4wLXdJF
 ZXC+Sa+XSaRnq/+YgOWKjuPsIanom1zv5Ll6ZrmHA9DCyG7yexurBD/GS Q==;
X-CSE-ConnectionGUID: 0wQweEPzToGnCT93r37S/Q==
X-CSE-MsgGUID: nG1fqjsLSUKaGJpnC0cRKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75757715"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75757715"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:59:04 -0700
X-CSE-ConnectionGUID: 2bQHJRWvQXu5nDe/iDQMUw==
X-CSE-MsgGUID: tbfzTLAzRECZgChcCw7lTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="221623274"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 00:59:03 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 3/5] intel-ci: Add VGA chamelium exclusion to Xe
 blocklist
Date: Thu, 26 Mar 2026 13:49:55 +0530
Message-ID: <20260326081957.860183-4-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326081957.860183-1-sowmiya.s@intel.com>
References: <20260326081957.860183-1-sowmiya.s@intel.com>
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Remove VGA-related subtests from the Xe chamelium testlist as Xe
driver does not support VGA connector types.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index edc5039a9..80a0ee904 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -128,3 +128,7 @@ igt@xe_exec_compute_mode@non-blocking
 ##################################################################
 igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
 ##################################################################
+# Remove VGA-related subtests from the Xe chamelium testlist as Xe
+# driver does not support VGA connector types.
+##################################################################
+igt@kms_chamelium.*@.*vga.*
-- 
2.48.1

