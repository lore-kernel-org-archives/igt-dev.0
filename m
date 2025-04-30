Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9F6C3ABA9
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 16:34:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3277F10E7F4;
	Wed, 30 Apr 2025 16:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXfuTdE7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162F910E7F4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 16:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746030845; x=1777566845;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cSAO4sJUNb6IYbhPghuLJ/Fx9bulnZ9C462ezMtLLEg=;
 b=jXfuTdE73LhiAYaKKIxjgrB/lwQuo1QSTZzmoDqLPoKSM3qk41GCE33L
 2KJoY948PHui3NTnxMKhvwS8XpBOmU5k17u4uHxARSI2Epxc7Dk+GDnSK
 lqSHuoFT7Lys2tLGRncxrh0hJY3ujQgNWCLDkvbCJZPamGdnAb1dKAkFW
 b9al1b0GdCGC3VFk9xLLCC0gxFOIXlB/ymA5Yygm6Cv8Ymprv7vkkjcCZ
 OVJYW9ABiMXLq58hq8hAVGv0cLCDCFG7+LsoB2anOrI+nFhYY9kCy0869
 K2QiNGTsTaMbIZe7m5WOOYN9v2feNwqKSzaFnG8LUmSpTWodDdo1Oe+8C Q==;
X-CSE-ConnectionGUID: zxmvFzVxRSGRnpvLM2HIPg==
X-CSE-MsgGUID: 67UFajoDQ0KRFdnWCTaZXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="46814628"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="46814628"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:04 -0700
X-CSE-ConnectionGUID: tC8gFBvmQHmJB6WwfXNhhQ==
X-CSE-MsgGUID: dxxDfQcGTpqTxF9Re/M89A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; d="scan'208";a="134471417"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.245.106])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2025 09:34:01 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, ihf@google.com,
 markyacoub@google.com, thomas.petazzoni@bootlin.com,
 jeremie.dautheribes@bootlin.com, Louis Chauvet <louis.chauvet@bootlin.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Ryszard Knop <dragoon@dragonic.eu>, Ryszard Knop <ryszard.knop@intel.com>,
 Ryszard Knop <ryszard.knop@linux.intel.com>
Subject: [PATCH i-g-t v1 0/2] Allow running gitlab-ci pipe locally
Date: Wed, 30 Apr 2025 18:33:52 +0200
Message-ID: <20250430163354.178254-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
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

This is a followup from https://patchwork.freedesktop.org/series/135941/
(".gitlab-ci: Add explaination to run CI locally")
with an improvement by Ryszard in local file size so it is not as big
and reuses existing .gitlab-ci.yml

Louis Chauvet (1):
  CONTRIBUTING: Add explanation how to run CI locally

Ryszard Knop (1):
  gitlab-ci: Enable gitlab-ci-local runs from the primary CI definition
    file

 .gitlab-ci-local.yml |  2 ++
 .gitlab-ci.yml       | 30 ++++++++++++++++++++++++++++++
 CONTRIBUTING.md      | 17 +++++++++++++++++
 3 files changed, 49 insertions(+)
 create mode 100644 .gitlab-ci-local.yml

-- 
2.49.0

