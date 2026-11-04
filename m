Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA6606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BZ66n3u1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97AC310E83C;
	Wed,  4 Nov 2026 07:30:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD09010E858
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793777363; x=1825313363;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dm3y5bSvhz9JC8YsiUPKGvL6nZ7X4gnzYW1MG1KXO7c=;
 b=BZ66n3u1shHF3+Cdw0ugkou6cfcEnJY1l0YtAuSIX5HYQR18CpdVex4Q
 rfGzyNZ7fhckkFgmV0T6fAS9PZ4m343E9Z0VFujoqTS/DvGl5qPhcaJ1Z
 u1Py5j+pGb+Awj9/Rvxoh70txuhg0HH2NjQ+LH95A4auTCrKdQBUK+TlO
 Z80xItU34mC7dlcaXu+EsxnnxZAP6MrMYNNcqBWXILURWuOro1C3RRvjU
 TdidWRtdD+b6TFY1+BmB+PO2cM+aofqdNxbRcZVW+YSPkhhg15Ewlxms7
 9oRouLj7UJ65akTCGyQ/qW6iRFTidgi4Aun/+qkI0RLTYYJtTBvM8mqKx Q==;
X-CSE-ConnectionGUID: JjKo7ywcRxys8o85q0rPXA==
X-CSE-MsgGUID: EEuDeikkRiWsYaF45VJ6IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2400921"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2400921"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 23:29:06 -0800
X-CSE-ConnectionGUID: L4YcnV5RQzuwC2UYMRDKYw==
X-CSE-MsgGUID: +SwSjIy4TEu0AEb2AbKMzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8422313"
Received: from dut1105bmgfrd.igk.intel.com ([10.211.177.74])
 by fmviesa011.fm.intel.com with ESMTP; 03 Nov 2026 23:29:03 -0800
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: karthik.poosa@intel.com, ramadevi.gandi@intel.com,
	badal.nilawar@intel.com, peter.senna@intel.com,
	"Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>,
	Patil@freedesktop.org
Subject: [PATCH v1 2/2] tests/intel-ci: blocklist unsupported core_sysfs sysfs
 tests on iGPU
Date: Wed,  4 Nov 2026 07:28:50 +0000
Message-ID: <20261104072850.18413-3-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104072850.18413-1-shivtej.eknath.patil@intel.com>
References: <20261104072850.18413-1-shivtej.eknath.patil@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Patil, Shivtej Eknath" <shivtej.eknath.patil@intel.com>

Some core_sysfs subtests exercise xe_device_sysfs attributes
that are not exposed on iGPU platforms.

As a result, the following subtests generate expected skips
on iGPU platforms:

- auto-link-downgrade-capable-show
- auto-link-downgrade-status-show
- lb-fan-control-version-show
- lb-voltage-regulator-version-show
- vram-d3cold-threshold-show
- vram-d3cold-threshold-store

Add blocklist entries for these subtests on affected
platforms to avoid reporting expected skips as CI failures.

Signed-off-by: Patil, Shivtej Eknath <shivtej.eknath.patil@intel.com>
---
 tests/intel-ci/xe.lnl.core.blocklist.txt | 7 +++++++
 tests/intel-ci/xe.nvl.core.blocklist.txt | 7 +++++++
 tests/intel-ci/xe.ptl.core.blocklist.txt | 7 +++++++
 3 files changed, 21 insertions(+)

diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 88115ec22..0ca64b10f 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -106,3 +106,10 @@ igt@xe_pm@d3hot-i2c
 ##################################################################
 igt@.*multi.queue.*
 ##################################################################
+# Expected skips on iGPU platforms where the corresponding sysfs
+# entries are not exposed
+##################################################################
+igt@core_sysfs@auto-link-downgrade-.*
+igt@core_sysfs@lb-.*
+igt@core_sysfs@vram-d3cold-threshold-.*
+##################################################################
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..1e150783c 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -107,3 +107,10 @@ igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
 ##################################################################
+# Expected skips on iGPU platforms where the corresponding sysfs
+# entries are not exposed
+##################################################################
+igt@core_sysfs@auto-link-downgrade-.*
+igt@core_sysfs@lb-.*
+igt@core_sysfs@vram-d3cold-threshold-.*
+##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 9716e6071..93c8d32ed 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -86,3 +86,10 @@ igt@.*survivability.*
 ##################################################################
 igt@.*multi.queue.*
 ##################################################################
+# Expected skips on iGPU platforms where the corresponding sysfs
+# entries are not exposed
+##################################################################
+igt@core_sysfs@auto-link-downgrade-.*
+igt@core_sysfs@lb-.*
+igt@core_sysfs@vram-d3cold-threshold-.*
+##################################################################
-- 
2.34.1

