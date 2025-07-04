Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05283C8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 17:56:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6781210E09B;
	Fri,  4 Jul 2025 17:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DayscfQ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EEA610E09B
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 17:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751651815; x=1783187815;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zBEKoL3vSfsqsSzoB5yxXKgKXmx5iuoOrA2gV/NWq5A=;
 b=DayscfQ98c/G2fPRmNFISs51y5ZlZVA7LLhfPRGW7TU1fK3b5xPr+lB0
 Br4HxZjgz1rClvEGRZiIhAsxUm2Lsop7a+bIbwhrEDp582paYM5mSy8Jt
 oD4+8hyYUiTPPjlmBoh0RBWlCmToaqHwzgN0xOD25qzYklfTlYpdygYjM
 4Mkqsj2v5AdCKaZWSSWX7T6tJ9d568N6MY4pK4GfEoKedp8WcSsKzmj1b
 zxhFHBSG7EUBiG9UVJKAO5oPR4FbXb4ZL2d5tE3MVWjctUZT41FhnMw0Z
 LvVwJ8iOALqbLDFll9XeYAec5NlIGhoAcjXJ4/vIDO9ecHB8PriJWRuzx w==;
X-CSE-ConnectionGUID: 2BABOKuwQK+un+2MF7s/Vg==
X-CSE-MsgGUID: tdml/0s4RRmsZlWlWai+pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="53853238"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="53853238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 10:56:54 -0700
X-CSE-ConnectionGUID: 1rSTKbeNRhafkaqaevhpEw==
X-CSE-MsgGUID: QSfS0aHrS4STCh9N8KKZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="185644259"
Received: from unknown (HELO rvodapal-mobl.iind.intel.com) ([10.190.239.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 10:56:53 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>,
 Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: [PATCH v4] lib/pciids: Add one more PCI ID to BMG
Date: Fri,  4 Jul 2025 23:26:40 +0530
Message-Id: <20250704175640.101321-1-ravi.kumar.vodapalli@intel.com>
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

Align with kernel commit ccfb15b8158c ("drm/xe/bmg: Add one additional PCI ID")

It adds one more pci id to BMG.

v1:
 - Commit id of merged patch is to be specified under kernel commit (Jani Nikula)
v2:
 - Update with correct commit id of respective kernel patch.
 - update first alphabet of Add with lowercase (Dnyaneshwar)
v3:
 - Updated first letter of Add with lowercase
 - Missed specifying v3 version history in commit message. (Dnyaneshwar)
v4:
 - Added v3 version history in commit message.

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Reviewed-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
---
 lib/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/pciids.h b/lib/pciids.h
index 129c3172a..666265b5f 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -846,6 +846,7 @@
 /* BMG */
 #define INTEL_BMG_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-- 
2.34.1

