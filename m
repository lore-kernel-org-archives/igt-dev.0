Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2E3C25B7E
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 05:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B46DF10FF21;
	Tue, 28 May 2024 05:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gB0NQDM4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9461E10FF21
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 05:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716875391; x=1748411391;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=adwIIyN8/59BskwWI8w77ahXEQPJYKlFGnO1ZcX4e0g=;
 b=gB0NQDM4dUkPsB/nTu3e3yBS1npUFBAUGh6BsA8hIVdTdhDXuv2Yg3J4
 +BfMDILk1N/PZTQ4U7Q1cxCIf1skvn8pR8YTWUzxAFxeqOEdKveWXpibw
 1/wEeFwxNKrhx5JPI2JLYkqD4OOMVUyQT+WvsgSSdtMHDSS+6GubCr3na
 eAJFcf9DexzLQnVR4RUenmt+NaE+TXoOcIANvtn7SsWCFkb/f8ZhOxJUK
 L5Vs3ReulmCuQ4xC+MIM65MgH2AozySJFeFqp5Z4SE6Ngd68zxFlP5LbD
 2roBc0xVCHxvjQv1sbmQp2RY4ZohP5D0Sdus0LF4EKd1OQybRSveKyAjo w==;
X-CSE-ConnectionGUID: wRzEtzn5QA6XdvIHdimh2g==
X-CSE-MsgGUID: bErlIjfQT0OoJ3e+TZ367w==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24615878"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24615878"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:51 -0700
X-CSE-ConnectionGUID: a2oDJhilQ0i9ESWEWfhBrw==
X-CSE-MsgGUID: ceDMH4ITTCyPxRxprlHf8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="66165889"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:50 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 5/5] tests/intel-ci/xe: Add fbdev tests to XE BAT
Date: Tue, 28 May 2024 11:12:23 +0530
Message-ID: <20240528054223.2945356-6-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
References: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
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

Add few fbdev tests to XE BAT.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index c57706f25..aa98b37e6 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,12 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@fbdev@eof
+igt@fbdev@info
+igt@fbdev@nullptr
+igt@fbdev@read
+igt@fbdev@write
+
 igt@kms_addfb_basic@addfb25-4-tiled
 igt@kms_addfb_basic@addfb25-bad-modifier
 igt@kms_addfb_basic@addfb25-modifier-no-flag
-- 
2.43.2

