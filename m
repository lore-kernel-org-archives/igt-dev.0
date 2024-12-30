Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496D4E77188
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 04:15:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C6810E1DD;
	Thu,  2 Jan 2025 04:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HDdSeP1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A187610E366
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Dec 2024 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735548421; x=1767084421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ET85YgMJKgrkIXidiTnVwRtLrzQz9OEty2pgE3NseMM=;
 b=HDdSeP1QMHfuu1yoLje+YhX5Qn/gE2cf9ZrnqhyVt52tv25VAKVCssjU
 c4T5sWNHxtlXa62TGk8HMQGzcejGFXLe/OihSm6ThrycT3ZBZcjVGeUIg
 K2mYxompx6KwzHP73Adw+YkLr7sGbZpxRyyvfuIu2wr4KHpCR7qFeAKdL
 OGicUAsr7jW/pq2VNHc2ln7pZvklmohdyaoTXeDRcPGrAfAc+bnXhetau
 OIeUVt2YcUvq7IUA35UjvUqMU1c4T8k6tlK6csAIoN2Epu1QfuaHPPQAo
 VNRl1j9b4Hbv5KgGAI8hqinc623mDyxb9c4Twa5yR7u/03kcZh/fp/7c2 Q==;
X-CSE-ConnectionGUID: 5IcDurqeTL2zDRPbJl8HXw==
X-CSE-MsgGUID: FO6o5JQgQpygFC2VCmzgMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35710857"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; d="scan'208";a="35710857"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2024 00:47:00 -0800
X-CSE-ConnectionGUID: MnbTe5uORFqBQrMABOju1g==
X-CSE-MsgGUID: i2tbgwbyQoOcdMBk2FT7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101587599"
Received: from unknown (HELO labhost1.iind.intel.com) ([10.190.230.69])
 by orviesa008.jf.intel.com with ESMTP; 30 Dec 2024 00:46:58 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 0/2] Inject errors during xe_guc_ct_send_recv &
 xe_guc_mmio_send_recv
Date: Mon, 30 Dec 2024 14:32:08 +0530
Message-Id: <20241230090210.17621-1-satyanarayana.k.v.p@intel.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 02 Jan 2025 04:15:54 +0000
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

