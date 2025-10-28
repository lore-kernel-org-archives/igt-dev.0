Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D85CCF9E0
	for <igt-dev@archiver.kernel.org>; Tue, 28 Oct 2025 08:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8715510E5BE;
	Tue, 28 Oct 2025 08:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeD8o5OL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDC810E5BD
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Oct 2025 08:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761640414; x=1793176414;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nNKaHZFxJCmZZAfU81TafStUFHeaGayQJk8pCG0iHgA=;
 b=CeD8o5OLoVY/EbLRpVfQbSzgAOVJxfJs2vyd5vMYhMRZr7/wNe88+/KQ
 2jAJfXC16K45gBQJO/E3xwlntKQYKe+rWTsYfyU4SInzUigMPzI8GBAS4
 gEXgDWXvXdLN1rTlje7ZbUVB+LNy7BhNzy9hR6iSK1R6acl7xR5DKhCvF
 5OB4pMY+i9uZDmE9qYHnmsuxdsKw7DOlRp+fGmRxTp8kPiD8tcJBv67s8
 ap9IizD/vyGLzeJddcrlCRVW3fD60kmn9n1W3x6Za8Ksk9JlU/PEqIR9N
 7ZGm8ZXe0tXWFFY1ojfoTVaK/biRpDrGWCeltpNWUntN//OlYbMBJdFEL w==;
X-CSE-ConnectionGUID: IGvLQtaVS3CSB10LSDZqsQ==
X-CSE-MsgGUID: pi+PQ4WpTXahF82S154fIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89203688"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="89203688"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:33:34 -0700
X-CSE-ConnectionGUID: Ss08uGoxThqL9jyZdRT1gQ==
X-CSE-MsgGUID: ChL0z9oRQ46i94JZ/Loa2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="216165177"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:33:31 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,v7,3/3] HAX: Add xe_survivability tests to fast feedback list
Date: Tue, 28 Oct 2025 13:58:58 +0530
Message-ID: <20251028082856.3197023-8-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028082856.3197023-5-sk.anirban@intel.com>
References: <20251028082856.3197023-5-sk.anirban@intel.com>
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

Add xe_survivability to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5f27baafb..d18a44610 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -187,6 +187,8 @@ igt@xe_sysfs_scheduler@job_timeout_ms-invalid
 igt@xe_sysfs_scheduler@job_timeout_ms-min-max
 igt@xe_survivability@i2c-functionality
 igt@xe_survivability@runtime-survivability
+igt@xe_survivability@i2c-functionality
+igt@xe_survivability@runtime-survivability
 #igt@xe_vm@bind-once
 #igt@xe_vm@scratch
 igt@xe_vm@shared-pte-page
-- 
2.43.0

