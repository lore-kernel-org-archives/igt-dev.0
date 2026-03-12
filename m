Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B51D1067042
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 15:12:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B413010EA35;
	Thu, 12 Mar 2026 15:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwS3SXTW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DAD10EA42
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 15:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773328317; x=1804864317;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0W3rCRr3pXzGkWQ7i4iGpHJ5X3h0uuafiV10FVaUrpQ=;
 b=nwS3SXTWs+NDzurv4qbL6KGpdPveB32dWCOm+h5IBYbRuQPnWQTjDnLd
 bHzZ1MMiqZ8QpfEU7UWA2rCbPEt3sgq9IOYfaicdLN7AaFwizIXhoZR5J
 eID1xBpCPQIDpekcLVt5Ui6YjDK1PPxZWB/8vJplwZ6xp3kVNlNxdWPWP
 n/t4sJ03DvSPXorHgn1UzFLES23W2trnCIrLXh+lTZMQEfE94Y4uf54W0
 XOAmWV4sNN3qLMdXVghrpSt0Q9QQWLmKxAJ5bTvaSPUyG55gXW4Bn5yXQ
 0yA7xtxMxUaqNTsN/1slVjdg3UirDUeno+LeQTng3uhzOqD05tzHq2bQz A==;
X-CSE-ConnectionGUID: U5O9SJYNQ/m97cWiadHHnA==
X-CSE-MsgGUID: tI7RzN+CQTeEKr9WKYDEYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="61997654"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="61997654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:56 -0700
X-CSE-ConnectionGUID: dXusCpX+Ra+5qtLvTgyuhw==
X-CSE-MsgGUID: ELlLNfckSLChcKaAgdFTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="258772032"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 08:11:55 -0700
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 5/5] intel-ci: Enable hdmi 4k resolution test in chamelium
 testlist
Date: Thu, 12 Mar 2026 20:39:01 +0530
Message-ID: <20260312150901.3272265-6-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260312150901.3272265-1-mohammed.bilal@intel.com>
References: <20260312150901.3272265-1-mohammed.bilal@intel.com>
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

Remove inline comment and enable the test in the testlist as the
exclusion is already handled via i915 and Xe blocklists.
---
 tests/intel-ci/chamelium-only.testlist | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index b66788bac..711fb8422 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -18,10 +18,7 @@ igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
 igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@dp-mode-timings
 igt@kms_chamelium_edid@hdmi-edid-read
-# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
-# removed test as its having a mode 4k@60 resulting 
-# TMDS config errors on v1 board
-#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@hdmi-mode-timings
 igt@kms_chamelium_edid@vga-edid-read
-- 
2.48.1

