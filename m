Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B5CC02185
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 08:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA7810E360;
	Mon, 20 Jan 2025 08:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WZSv8OAm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39F410E360
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737361137; x=1768897137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2VoZKmY+SeKULWuVVVwMGfXcqvbBIE1APRYoUM7BA0c=;
 b=WZSv8OAmiAesoUMtddjtdfr5NuWbDv4lTk9VWQsbFhNvPxaB9heVhqAi
 PY3GcBXBUSbEga2FYfty39AXGmMH9zNw7iYoEYWGUPDMOnyMSoC36Hbi0
 V8bEaRy+tWCcNMchTXRs4a94njQjMaRNfAta7ZD9gsQ2jBwixObAhQXXq
 Ci0txIl/WgrTyxzpJPaqSWfaGWsivdnSaPzy+Ou4xKStB6ednSqIu7Jq/
 LwnaT0KK1TJsY/wQD8D3qLTRatJso/C7jRBYWMMgOyp6LAQhgrmMO5fjg
 JQ8Yi2IMbS1T3k3OAAlO1Ew0OnXA5I7sXufi+PE1hguPoNYhCgZ1zeE8R w==;
X-CSE-ConnectionGUID: 8Xq2BwqOSe+aV/608BoheQ==
X-CSE-MsgGUID: Fts2OfgtR8GZMQc7jTWl0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="36946154"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="36946154"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 00:18:57 -0800
X-CSE-ConnectionGUID: yP/luw7fQyK/Crk//Xp5qQ==
X-CSE-MsgGUID: Md6bexlCRuilp4/P0xpn1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="106238084"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by orviesa009.jf.intel.com with ESMTP; 20 Jan 2025 00:18:55 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v2 0/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv
Date: Mon, 20 Jan 2025 14:04:08 +0530
Message-Id: <20250120083410.26904-1-satyanarayana.k.v.p@intel.com>
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
igt@xe_fault_injection@inject-fault-probe-function-xe_guc_mmio_send_recv
igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv

Satyanarayana K V P (2):
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_mmio_send_recv
  tests/intel/xe_fault_injection: Inject errors during
    xe_guc_ct_send_recv

 tests/intel/xe_fault_injection.c | 65 ++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
-- 
2.35.3

