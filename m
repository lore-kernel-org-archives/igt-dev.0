Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2704C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 06:54:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E53610E41C;
	Tue, 22 Sep 2026 06:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b7WbEBQJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F2510E41C
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 06:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790059952; x=1821595952;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfBDLZCp3R1Ung0CDYfK0m659hsg9AjKY3uMGnrKops=;
 b=b7WbEBQJEUxublr6VMtpuG33zsEvtR1j5tlrLWogJfFThHsfNWKe0A9B
 S28GXeCadgrZcf+IQDzConMg1olVmN95G9xm8nlUHy4tl/BhKQsSytkOJ
 2WRamtfRSxRICZiMGRrg+EqMcApe6zbvksB2uGLQ0SxgFgc+u0TqCgocO
 e7LyZms65GWTVHD1KVe2VKrjqN36iXOcF4NmW8+LT5dnCcPH/8e0uqLbL
 GBgBDiTojgOj/1EwssHAZcdE0EyR5a4nsoO2F/vJTJpd1IEQMc5H5so7z
 WYemsg3mlY2GCnYSoPLe/cYBIx/T5qfnbaT0w99tPagtWWPO/QvtZST3N w==;
X-CSE-ConnectionGUID: irsWiH4tSLu3T/HVKAjTeg==
X-CSE-MsgGUID: yqSsdNmhRRKvPebTTg9DBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="1137397"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1137397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 23:52:32 -0700
X-CSE-ConnectionGUID: vrP6jgPaSwKuRT9AjE3+sg==
X-CSE-MsgGUID: uaz+Lht5TFKfPAP+ejfjgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="299239658"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 23:52:31 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v3 3/3] intel-ci: Block igt@xe_sriov_mmio_regs.*
Date: Tue, 22 Sep 2026 08:52:11 +0200
Message-ID: <20260922065211.3004767-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922065211.3004767-1-lukasz.laguna@intel.com>
References: <20260922065211.3004767-1-lukasz.laguna@intel.com>
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

This test is dedicated for HW checkout and it's not suited for recurring
CI runs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index d0a2bf87d..116b0b93a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -117,6 +117,7 @@ igt@sriov_basic@bind-unbind-vf$
 # SR-IOV tests for HW checkout, not suited for recurring CI runs
 ##################################################################
 igt@xe_sriov_ggtt.*
+igt@xe_sriov_mmio_regs.*
 ##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
 # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
-- 
2.43.0

