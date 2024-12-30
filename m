Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49157E77188
	for <igt-dev@archiver.kernel.org>; Mon, 30 Dec 2024 10:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E490510E121;
	Mon, 30 Dec 2024 10:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XA82X14g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0259510E121
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735554292; x=1767090292;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ET85YgMJKgrkIXidiTnVwRtLrzQz9OEty2pgE3NseMM=;
 b=XA82X14gHjug6ODcKCxxexKFu4zI5jR+e5EWLtJQ1mdpxjRFIJRrToW7
 J84bE8ZZJ5xijgjJOm5PtvYapF2k27DqpODbVHlE2FassEk4HpDQB7qhF
 78ICuV4p7qlsGppvbq1dgdPgzAtlgiP2dN0t/5LcToshQDmrAbfzmE96/
 5S+/CwnX/Z3+6fsd/jUyKwXJTcApwwvw1EiUCLsvdcaPII2IdpQugVxeY
 aHkn70IIouilOuUnVxbNAgXEuLCidTu1xRYUsoJqJl8P/dW7ee/D0XAyg
 M+GpjcMtj9j/ZD7jzoAuD9CYRApsao3fO0PGfkL+d1WNo7pef3+acM1Mm A==;
X-CSE-ConnectionGUID: mr2330S5TSqPBhHfEFPqqg==
X-CSE-MsgGUID: uVBuJkf7Tu6FFeFg0VUQgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="36061699"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="36061699"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 02:24:51 -0800
X-CSE-ConnectionGUID: 3X9cuYehSUyCROHEfm5LqQ==
X-CSE-MsgGUID: DszP8mTrR9+RdigRzzg0sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; d="scan'208";a="100516604"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa006.fm.intel.com with ESMTP; 30 Dec 2024 02:24:49 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv
Date: Mon, 30 Dec 2024 16:10:06 +0530
Message-Id: <20241230104008.25403-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use the kernel fault injection infrastructure to test error handling of xe
at probe time when executing xe_guc_mmio_send_recv() and at enabling of VFs
stage when executing xe_guc_ct_send_recv().

Error can be injected using:
    ./xe_fault_injection --run-subtest inject-fault-probe-function-xe_guc_mmio_send_recv
	./xe_fault_injection --run-subtest guc-fail-xe_guc_ct_send_recv

Satyanarayana K V P (2):
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_mmio_send_recv
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_ct_send_recv

 tests/intel/xe_fault_injection.c | 61 ++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

-- 
2.35.3

