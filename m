Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC2ACCA464
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 11:55:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E617610E269;
	Fri, 16 Oct 2026 11:55:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4547C10E1C0
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 11:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792151632; x=1823687632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mxpoV2WjRdlUnmrDR2ZGAfPsMbgp0ncn345uj0uR/ns=;
 b=PS/g1JxGP33RgsmG8pezH1TQfNp7KbnheSoiObq1oc+xv/JKozFzayxk
 EHSzBAtDaKaAmePrauVsburrNYgMBM85B+/l2unk3NweeqxPUhlAHsTho
 Ceff5pxJOvfLp/NmxoyG4FyKPYK1oH+6hluRB17lJsSyir1BEFcsJhUKT
 ujkYefgLKJkQ7kfpyU2kT/qoi2dV4m4VVk4L70vFQ5a0OMIihe+KlyAMg
 4ntW2hn2LHG8E6sPgotWLJBvE8+ZdgrB2fqv4xmS8eJNis+/g03uQxoAV
 N8JFmibEmve3dA6s1JaSJh4l3BEukfZEQuKKS9VYDffNJ9tdX84W+qp63 w==;
X-CSE-ConnectionGUID: zefPOvuASVGBwzWQSlZpWA==
X-CSE-MsgGUID: xwnT0ctoSY6ojBYz8kXCsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="837956"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="837956"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 04:53:52 -0700
X-CSE-ConnectionGUID: rP9a6LIYRhy7i4zk/tagNw==
X-CSE-MsgGUID: ffxfP56iQQGQC0vTqb3KQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1901983"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 04:53:49 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Sk Anirban <sk.anirban@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Raag Jadav <raag.jadav@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [i-g-t v1 1/1] tests/intel/xe_err_injection: regex to ignore AER
 messages in dmesg
Date: Fri, 16 Oct 2026 17:23:20 +0530
Message-Id: <20261016115320.920094-2-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016115320.920094-1-ravi.kishore.koppuravuri@intel.com>
References: <20261016115320.920094-1-ravi.kishore.koppuravuri@intel.com>
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

Error injection tests deliberately triggers AER error, device recovery
messages and CORE_COMPUTE hardware error (SIGID=203) in dmesg. Add a
regex to ignore these messages and inform igt_runner that it should not
treat these expected error logs as failures

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
 tests/intel/xe_err_injection.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tests/intel/xe_err_injection.c b/tests/intel/xe_err_injection.c
index 46d9f7f42..c7e73d105 100644
--- a/tests/intel/xe_err_injection.c
+++ b/tests/intel/xe_err_injection.c
@@ -260,6 +260,36 @@ static void print_aer_recovery_status(void)
 		igt_info("AER device recovery successful\n");
 }
 
+/* Dmesg regex to inform igt_runner not to treat the expected AER error messages as failures */
+static void ignore_aer_in_dmesg(void)
+{
+	igt_emit_ignore_dmesg_regex("pcieport [0-9A-Fa-f:.]*: AER: Uncorrectable "
+				    "\\(Non-Fatal\\) error message received from "
+				    "[0-9A-Fa-f:.]*"
+				    "|pcieport [0-9A-Fa-f:.]*: PCIe Bus Error: "
+				    "severity=Uncorrectable \\(Non-Fatal\\)"
+				    "|pcieport [0-9A-Fa-f:.]*:\\s+device "
+				    "\\[[0-9A-Fa-f]+:[0-9A-Fa-f]+\\] error "
+				    "status/mask=[0-9A-Fa-f]+/[0-9A-Fa-f]+"
+				    "|pcieport [0-9A-Fa-f:.]*:\\s+\\[[0-9A-Fa-f]+\\] "
+				    "UncorrIntErr"
+				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: error "
+				    "detected state [0-9]+"
+				    "|mei_csc [0-9A-Fa-f:.]*: error recovery: error "
+				    "detected. state [0-9]+"
+				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: MMIO "
+				    "enabled"
+				    "|pcieport [0-9A-Fa-f:.]*: AER: Root Port link has "
+				    "been reset \\([0-9]+\\)"
+				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: Slot "
+				    "reset"
+				    "|xe [0-9A-Fa-f:.]*: Xe Pci error recovery: Recovered"
+				    "|mei_csc [0-9A-Fa-f:.]*: error recovery: resume"
+				    "|pcieport [0-9A-Fa-f:.]*: AER: device recovery "
+				    "successful"
+				    "|SIGID=203");
+}
+
 static bool gt_uc_wkr_parity_recovered;
 
 /**
@@ -290,6 +320,8 @@ static void wkr_cmd_parity_err_injection(struct xe_mmio *mmio, int fd)
 		igt_assert_f(false, "Failed to read error counter before injection\n");
 	}
 
+	ignore_aer_in_dmesg();
+
 	acquire_steering_semaphore(mmio);
 	/* Arm the injection sequence. */
 	xe_mmio_write32(mmio, XE_MC_PKT_CTRL_MGSR_3D_ADDRESS, 0x0);
-- 
2.34.1

