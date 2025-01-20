Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11FFC02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 12:13:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782BB10E10D;
	Mon, 20 Jan 2025 12:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcVHlIUt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C1110E10D
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 12:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737375194; x=1768911194;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2VoZKmY+SeKULWuVVVwMGfXcqvbBIE1APRYoUM7BA0c=;
 b=BcVHlIUtnwQQ8awjX1c/LQmwKpz8HvfyZC7QQynYEu8NBs8/LYCQf9sM
 7MfcFgC1gl1sKldRDr09rNWQqlnRwzyxR2x1tqF/7/vOxQatUOnWvD6B+
 mbkW/+xuOv2gcGlTB8J7/N8PDFAt8Pi82RZ3TTm5WRir9PbrD2KPSUKXp
 FU25JG9opCnXn10ES65vO8kNubnQhS0YH1qP2wN8hcv+edBV1+rDgx4T3
 0sP2va8eQzSqAcLTPzEgX9V5SSsLlByMKCzeClk80OxEesJT8+ug8Cs6Y
 guQHvHEQDw+QA/AcDp8q81b9QhjzUgha4xotJER76LmwNzdw2KKl7DGgD A==;
X-CSE-ConnectionGUID: iSZaBE7GQxq0S7QezjNrow==
X-CSE-MsgGUID: JLeoKac7TReCiZLqbX1mxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37787224"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="37787224"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 04:13:13 -0800
X-CSE-ConnectionGUID: 1YgrFGqTQoSYNFcmfxgjAQ==
X-CSE-MsgGUID: hxCCk+5dSi2Qd0zfhesTFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129762993"
Received: from labhost1.iind.intel.com ([10.190.230.69])
 by fmviesa002.fm.intel.com with ESMTP; 20 Jan 2025 04:13:11 -0800
From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv
Date: Mon, 20 Jan 2025 17:58:33 +0530
Message-Id: <20250120122835.10511-1-satyanarayana.k.v.p@intel.com>
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

