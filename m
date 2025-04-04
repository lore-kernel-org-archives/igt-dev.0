Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA17C3600C
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 03:26:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C1510E090;
	Fri,  4 Apr 2025 03:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f4vKSqfT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515AD10E090
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 03:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743737171; x=1775273171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AK3Z59uqB4LEDV5qpXR8xaaO/ggLeC5mHuNmqZhfByE=;
 b=f4vKSqfTJkjTMQhZMvA3rC8AkICis0nqDKtBSuX86VA9vv5mVxs9f3FQ
 BzGPKGhL4VHbY8cC73Ge0k0T6Bd29QnD7dXnh73MVyb3UVNshV+SRv1me
 De+OcN1ygjiQaD+CYOTrvwpVga9sseKwGCmTUpOpUEnhItOdW3gkOm8qo
 61FRI3FL0UNF6S3dLboo9CaDH9z9K/6UL+8M4SMwDA76rJg8KOvOZ6bJK
 lylNyAOJLfbLN1nzsG4B1fIhFx/BN4T+mdGArSdcdyGXmMx9PmPP60ngH
 FIDwoqo8Ralx/bJPlDLvSFytUgDEt9gjhRi1nsos15lR/6K+GOh6yzEnV A==;
X-CSE-ConnectionGUID: R9Hmr1YeRcOL2lVcDP3QsA==
X-CSE-MsgGUID: aAOa8DPcRnKSR+LRwyKoFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="48965347"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="48965347"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 20:26:10 -0700
X-CSE-ConnectionGUID: jtW7ormHTF+hGig4cin3hw==
X-CSE-MsgGUID: PNS8r9MHSmm674pDfida2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="131904358"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 20:26:09 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH i-g-t 0/1] tests/intel/xe_fault_injection: Inject errors for
 xe_hw_engine_class_to_str
Date: Fri,  4 Apr 2025 03:10:51 +0000
Message-Id: <20250404031052.1848936-1-sobin.thomas@intel.com>
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

Use the fault injection infrastructure to make targeted fault injection in
functions xe_hw_engine_class_to_str and check the error handling in the
xe_hw_engine_class_sysfs_init() so that more code paths involving error
handling is tested.

Sobin Thomas (1):
  tests/intel/xe_fault_injection: Inject errors for
    xe_hw_engine_class_to_str

 tests/intel/xe_fault_injection.c | 2 ++
 1 file changed, 2 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
-- 
2.34.1

