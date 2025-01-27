Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5947FC0218A
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 16:12:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBA2810E584;
	Mon, 27 Jan 2025 16:12:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdxvINWy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA8110E57F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737994329; x=1769530329;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uYZ5N4cr5MNUFyDS8OLkOshesU6NOIxaGDQ7fdyEqLA=;
 b=EdxvINWyowe/8Aaw4vgihVKjO+hCmnF6oFftyqDjoBA1geHlsmp++YPz
 3g4GOixes6rTQlR7lNQJYjcvWIqx4WlblcWpASMmrgnPcZPV9hKgNTvdk
 4c1ZpsUJ9mecRtwG/YjhR86n/Zz1QhRMSVUTkCXAxSCeM6Vu7pOIsx955
 u8SoQdpPPL6JWCAvtaHki1yXVrGKCc19Qer6gav60GMoJg6pwsaF/Y/0Z
 EnhroZeasnXAXbw8lD0Fx3MzRcDDWFmRhNBQd6GMQQfCiVygOD/z/smxt
 9ni1K8klPp/nJAGCjnkisOs7m9CWHmJ21jyN+5O422x6yL/mw5pbWAWqQ A==;
X-CSE-ConnectionGUID: k1yFF4/oTy2X68Bi/04Bng==
X-CSE-MsgGUID: d21I7gZ2Sdm7bwsJZHjb/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="41298878"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="41298878"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 08:12:09 -0800
X-CSE-ConnectionGUID: a13WviraRryRp8JDTL5Vog==
X-CSE-MsgGUID: 1Aajvr0SRPaQEKc7Rl0o5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108925880"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 08:12:07 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] intel-ci/xe.blocklist: add i915 specific tests
Date: Mon, 27 Jan 2025 21:57:36 +0530
Message-Id: <20250127162736.3451740-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250127162736.3451740-1-jeevan.b@intel.com>
References: <20250127162736.3451740-1-jeevan.b@intel.com>
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

Add i915 pm specific tests to blocklist.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index fc270198f..78df5393a 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -74,6 +74,8 @@ igt@kms_rotation_crc@exhaust-fences
 igt@kms_pm_lpsp@screens-disabled
 igt@kms_pm_rpm@(fences|fences-dpms|pm-caching|pm-tiling)
 igt@kms_pm_rpm@.*pc8-residency.*
+igt@kms_pm_rpm@cursor
+igt@kms_pm_rpm@cursor-dpms
 ##################################################################
 # KMS: Yet to add/missing XE support
 ##################################################################
-- 
2.25.1

