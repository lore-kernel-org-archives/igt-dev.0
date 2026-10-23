Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64F8606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 17:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmwPlBsC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86935112C70;
	Fri, 23 Oct 2026 17:15:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF17112C70
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 17:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792775632; x=1824311632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e7cI5NdhI6OiaY0nbzXgDQiyO8WW/HEi8YzmD1EB7kc=;
 b=PmwPlBsCnZTOuElfgQbM1gtpTv7vwcW4Gdqfb/HweWkbZ2HM/XzST9bl
 WINJVFKaviCfQtSAGixZ0WE3HwhqWkypO3zFc+3Us3g5ZFxtaywcSgMkB
 h7E7Kah3FjXtqe+nZEHE60Urv5Jo5wTF8BJoR0/2AdsAyv8syc/cNL63D
 1N8n+kabcRvWbyWmjX39jkR/HaOLAmqUOdLm7vWOAiL9EyUHX7ZKpWyN/
 B+lTK+yn+wXvAA/pKjA5MpqduOEjxgcrGaWWtVXsg/rS0Su3Kf/uLQOO8
 OQWCK5oNNccnNEpnYvBFqe/jUwc2MX5CQz5a1A1EQvFdAqO7CTgg4NVOv w==;
X-CSE-ConnectionGUID: lA6ITsDPRh66x+V/0Y0RRQ==
X-CSE-MsgGUID: ZrT3W5DpRmO3hFxDF4a59A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1428219"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1428219"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 10:13:51 -0700
X-CSE-ConnectionGUID: df5JokdlRHS6Lr6XUZh/yQ==
X-CSE-MsgGUID: w/k0XThbScu7XG2HqCS2ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3755959"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 10:13:48 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH v2 2/2] tests/intel/xe_err_injection: regex to ignore AER
 messages in dmesg
Date: Fri, 23 Oct 2026 22:43:26 +0530
Message-Id: <20261023171326.982997-3-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023171326.982997-1-ravi.kishore.koppuravuri@intel.com>
References: <20261023171326.982997-1-ravi.kishore.koppuravuri@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Error injection tests deliberately triggers AER error, device recovery
messages and CORE_COMPUTE hardware error (SIGID=203) in dmesg. Add a
regex to ignore these messages and inform igt_runner that it should not
treat these expected error logs as failures.

Sample AER log is provided below

```
pcieport 0000:00:06.0: AER: Uncorrectable (Non-Fatal) error message received from 0000:02:00.0
pcieport 0000:02:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Receiver ID)
pcieport 0000:02:00.0:   device [8086:676b] error status/mask=00400000/00000000
pcieport 0000:02:00.0:    [22] UncorrIntErr (First)
xe 0000:04:00.0: Xe Pci error recovery: error detected state 1
mei_csc 0000:05:00.0: error recovery: error detected. state 1
xe 0000:04:00.0: Xe Pci error recovery: MMIO enabled
pcieport 0000:00:06.0: AER: Root Port link has been reset (0)
xe 0000:04:00.0: Xe Pci error recovery: Slot reset
xe 0000:04:00.0: Xe Pci error recovery: Recovered
mei_csc 0000:05:00.0: error recovery: resume
pcieport 0000:00:06.0: AER: device recovery successful
```

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Cc: Sk Anirban <sk.anirban@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
---
v2: simplified the regex and removed duplicate strings (Kamil)
---
 tests/intel/xe_err_injection.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 46d9f7f42..62d4258e1 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -260,6 +260,19 @@ static void print_aer_recovery_status(void)
 		igt_info("AER device recovery successful\n");
 }
 
+/* Dmesg regex to inform igt_runner not to treat the expected AER error messages as failures */
+static void ignore_aer_in_dmesg(void)
+{
+	char *aer_msg = "AER: Uncorrectable .Non-Fatal. error message received from"
+			"|PCIe Bus Error: severity=Uncorrectable .Non-Fatal."
+			"|Xe Pci error recovery"
+			"|error recovery"
+			"|AER: Root Port link has been reset"
+			"|AER: device recovery successful"
+			"|SIGID=203";
+	igt_emit_ignore_dmesg_regex(aer_msg);
+}
+
 static bool gt_uc_wkr_parity_recovered;
 
 /**
@@ -290,6 +303,8 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 		igt_assert_f(false, "Failed to read error counter before injection\n");
 	}
 
+	ignore_aer_in_dmesg();
+
 	acquire_steering_semaphore(mmio);
 	/* Arm the injection sequence. */
 	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
-- 
2.34.1

