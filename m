Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77658CCA464
	for <igt-dev@archiver.kernel.org>; Fri, 16 Oct 2026 11:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A1D810E269;
	Fri, 16 Oct 2026 11:54:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E93F410E1C0
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Oct 2026 11:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792151624; x=1823687624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=weimjY8Ios0j0nleLBxx8hFycVL4RuwMWPCxfLV+isA=;
 b=nM9t0VX9ouc0TxO5uecTlFe3HBdHTOdQFtHRZqWZVLvjmLW2GtNCx+D1
 DoLdNzM/bHeOjxv8oHWJ4RhhFMyTpPqVjGS1YvbFICail3sDkFgpNHxbJ
 nXjuiNTDJ0baRlweXekFY0E+Hxhkt+Rl1+xhxRcrPjZwCOkJQqNnkzqCD
 S7m9lQl8TvrMwpHke9nnUH7rhF+SgugKxnw1SRjEm3RUHd9nvFFPn1FST
 neME+9DvZBkSR0Rz502ZLV1nLixeAVwxvkUQJ5KKkg/3y08qpicik+1vU
 qvBipsYKRK5135AGI5XO6kZ/CUk1W5/mmpfc/gF+6tKAe5glOJwaTmBLN w==;
X-CSE-ConnectionGUID: Ylx9F/5lSuWaNB7z8jovtA==
X-CSE-MsgGUID: TO5EP2ANTA6s9uk+YcelKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="837952"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="837952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 04:53:44 -0700
X-CSE-ConnectionGUID: ti0vOXwuS8SWZaQ6SMOFTw==
X-CSE-MsgGUID: RTKsTslhR+WfWdmuehI+Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="1901943"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 04:53:42 -0700
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Subject: [i-g-t v1 0/1] Ignore AER error and recovery messages in dmesg
Date: Fri, 16 Oct 2026 17:23:19 +0530
Message-Id: <20261016115320.920094-1-ravi.kishore.koppuravuri@intel.com>
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

Error injection tests in xe_err_injection intentionally trigger AER
(Advanced Error Reporting) errors, which leads to PCIe device recovery.
Corresponding logs are recorded in dmesg.

This series adds a regex to inform igt_runner that these AER error and
recovery messages are expected and should not be treated as failures.

Example dmesg output that will be ignored by the added regex:
```
[ 1177.150094] pcieport 0000:00:06.0: AER: Uncorrectable (Non-Fatal) error message received from 0000:02:00.0
[ 1177.150105] pcieport 0000:02:00.0: PCIe Bus Error: severity=Uncorrectable (Non-Fatal), type=Transaction Layer, (Receiver ID)
[ 1177.161455] pcieport 0000:02:00.0:   device [8086:676b] error status/mask=00400000/00000000
[ 1177.169882] pcieport 0000:02:00.0:    [22] UncorrIntErr           (First)
[ 1177.200971] xe 0000:04:00.0: Xe Pci error recovery: error detected state 1
[ 1177.207965] mei_csc 0000:05:00.0: error recovery: error detected. state 1
[ 1177.209324] xe 0000:04:00.0: Xe Pci error recovery: MMIO enabled
[ 1179.875612] pcieport 0000:00:06.0: AER: Root Port link has been reset (0)
[ 1179.875772] xe 0000:04:00.0: Xe Pci error recovery: Slot reset
[ 1196.217239] xe 0000:04:00.0: Xe Pci error recovery: Recovered
[ 1196.217273] mei_csc 0000:05:00.0: error recovery: resume
[ 1196.703850] pcieport 0000:00:06.0: AER: device recovery successful
```

Ravi Kishore Koppuravuri (1):
  tests/intel/xe_err_injection: regex to ignore AER messages in dmesg

 tests/intel/xe_err_injection.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

-- 
2.34.1

