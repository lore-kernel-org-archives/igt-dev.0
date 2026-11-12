Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D8D606A321
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 12:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C4BabbNO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50E7D11206C;
	Thu, 12 Nov 2026 12:11:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D47112074
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 12:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794485329; x=1826021329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yv7Wp2/Im81i26Q5gDFeYPmpW8A7w69q3g116zjPexw=;
 b=C4BabbNO3uq2M8CAZudO0n4YwK3GrgpZQkBJ5tYCLmaoTnBpbYqxeniZ
 acIaJm97N6+OlVYSgAEHA2C9KEaw1WSeeHeWSEFKr90FuTotPBs+6fyOW
 2hVSuJLxAZv/N65d9JIouup30Fm4t4q1Cokxp2qivHtBHwGlJiKpujKY5
 EExrgdSKd35O1lytO4BkDDDak8nZson6s929wCMQJCTIAtMa1JPw+FJX/
 zHmrwDVEDa1uvUq5B8IBmT6YNAvXzga/QaZPoJJCmw1qmrfvcB5SxLiDz
 W2DcHasz4sd3hN30/Bc/+G9LVUuN3KBy7cAAXY4f9ovCzDLLQr93nRLBu A==;
X-CSE-ConnectionGUID: ci1dJsIoQpqtsV82rTZfjg==
X-CSE-MsgGUID: vG8yuLulRNqlZkQXGO6B9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3164026"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3164026"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:08:49 -0800
X-CSE-ConnectionGUID: 9nqn3IseRPqM+uTi5c/m4A==
X-CSE-MsgGUID: w/wcH7DeSg+7TYz7j6dWkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8829207"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 04:08:47 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: soham.purkait@intel.com, riana.tauro@intel.com, anshuman.gupta@intel.com,
 raag.jadav@intel.com, mallesh.koujalagi@intel.com, sk.anirban@intel.com,
 kamil.konieczny@linux.intel.com,
 Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [PATCH v4 2/2] tests/intel/xe_err_injection: regex to ignore AER
 messages in dmesg
Date: Thu, 12 Nov 2026 17:38:21 +0530
Message-Id: <20261112120821.1456555-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112120821.1456555-1-ravi.kishore.koppuravuri@intel.com>
References: <20261112120821.1456555-1-ravi.kishore.koppuravuri@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Error injection tests deliberately triggers AER error, device recovery
messages and CORE_COMPUTE hardware error (SIGID=203) in dmesg. Add a
regex to ignore these messages and inform igt_runner that it should not
treat these expected error logs as failures.

Sample dmesg log is provided below
pcieport 0000:00:06.0: AER: Uncorrectable (Non-Fatal) error message received from 0000:02:00.0
pcieport 0000:02:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Receiver ID)
pcieport 0000:02:00.0:   device [8086:676b] error status/mask=00400000/00000000
pcieport 0000:02:00.0:    [22] UncorrIntErr           (First)
xe 0000:04:00.0: Xe Pci error recovery: error detected state 1
mei_csc 0000:05:00.0: error recovery: error detected. state 1
xe 0000:04:00.0: Xe Pci error recovery: MMIO enabled
pcieport 0000:00:06.0: AER: Root Port link has been reset (0)
xe 0000:04:00.0: Xe Pci error recovery: Slot reset
xe 0000:04:00.0: Xe Pci error recovery: Recovered
mei_csc 0000:05:00.0: error recovery: resume
pcieport 0000:00:06.0: AER: device recovery successful

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
v4: Rebased on top of the latest patch series of 171275
v3: Removed redundant strings and arranged the regex in alphabetical order (Kamil)
v2: simplified the regex and removed duplicate strings (Kamil)
---
 tests/intel/xe_err_injection.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 07a290ce6..5fc083892 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -274,6 +274,18 @@ static void print_aer_recovery_status(void)
 		igt_info("AER device recovery successful\n");
 }
 
+/* Dmesg regex to inform igt_runner not to treat the expected AER error messages as failures */
+static void ignore_aer_in_dmesg(void)
+{
+	char *aer_msg = "AER: device recovery successful"
+			"|AER: Root Port link has been reset"
+			"|AER: Uncorrectable .Non-Fatal. error"
+			"|error recovery"
+			"|PCIe Bus Error: severity=Uncorrectable .Non-Fatal"
+			"|SIGID=203";
+	igt_emit_ignore_dmesg_regex(aer_msg);
+}
+
 static bool uncorr_error_recovered;
 
 /**
@@ -312,6 +324,8 @@ static void test_inject_core_compute_uncorr_error(struct xe_mmio *mmio, int fd)
 		igt_assert_f(false, "Failed to read error counter before injection\n");
 	}
 
+	ignore_aer_in_dmesg();
+
 	if (!acquire_steering_semaphore(mmio)) {
 		release_forcewake(fw_handle);
 		igt_assert_f(false, "Timed out acquiring steering semaphore\n");
-- 
2.34.1

