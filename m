Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A3FCF3962
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 19:32:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B830B10E1B8;
	Thu, 19 Sep 2024 19:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+sd54wD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 868A210E1B8
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 19:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726774372; x=1758310372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7QulvC+eNILMKZQfGse+SMSWY88GW1x5iVDiteQ+/cw=;
 b=H+sd54wDHEg52YYHi/qtIe6iD7jkZSiTkEJI75YIMO0oL6GnXswyMFff
 5uZ52xoWbYzbC/DEfRT/1nXGre5UgnC3qHfiApwK+KCwB6CsQIN8W10GX
 vGtet0jZGdTTgCpj+snTXsNdSjooK2oB/mvnZ/MmwoghhUp5gay7EtUPd
 V3QlcKHlee6KZoXMd21E1oEjg2O8fR6Lm/Qm7JCdykV0tPHjV7lx8eKyK
 VQqH4vqrxXDqkd3d+kk1JfM7Wk/9D1cRf7+FXHvEDpP3ImvEF4xO2l3te
 PfTrLgBjibDi3CNs5bXtc2/5j4IG015mvl2Yf/VPapMYIotHTw0yyjmU0 Q==;
X-CSE-ConnectionGUID: oSAY8ipkQb6drBhsvuC2Hg==
X-CSE-MsgGUID: Hl2Gx3LNTzaVmCglMhy8WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="43279659"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="43279659"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:32:52 -0700
X-CSE-ConnectionGUID: Jd0aB7tXTqm40OR5Yi1tqQ==
X-CSE-MsgGUID: JQspw/cmQjyfdWrxLClVww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="93327814"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 12:32:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel-ci/xe: Remove kms_rmfb@close-fd from
 blocklist
Date: Thu, 19 Sep 2024 12:32:50 -0700
Message-ID: <20240919193250.1439745-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240919193250.1439745-1-lucas.demarchi@intel.com>
References: <20240919193250.1439745-1-lucas.demarchi@intel.com>
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

Now it should be working, remove test from blocklist.

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index 4ee8fb0d4..f9ef612c4 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -78,10 +78,6 @@ igt@kms_frontbuffer_tracking@(fbcpsrdrrs|psrdrrs).*
 # KMS: Yet to add/missing XE support
 ##################################################################
 igt@kms_prime@.*
-
-# Expected failure on XE:
-# https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/294
-igt@kms_rmfb@close-fd
 ##################################################################
 # KMS: Non-Intel tests
 ##################################################################
-- 
2.46.1

