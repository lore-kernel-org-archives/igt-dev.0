Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A50A606A31E
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 05:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=F/DD8Zqw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C091B112324;
	Thu, 22 Oct 2026 05:45:23 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3738112324
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 05:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792647868; x=1824183868;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qntmV7ypiYSdd3YcOAMSw8tyFLseD+rri7dtkNmj5uY=;
 b=F/DD8ZqwJZsTqmls72iDNrhEPOlKv3h99HunO5obMcEgpNzBPtQIZ+3u
 fYv/qmVWfuG60kXqzsP9sixjLZKqMEqPWB1ICmDOoh5Fl1RnbyeZsVAqB
 0fJpbTAB4wX9BEYU40HSEMbYQw6CI9MQGvnDCln7BMKT9xn5gTDDL5L51
 oK9LysgYY/RFrP2bY+8taQLFPm0A0TfgtbFy/M6+7EsMPdMBagFQkw1bi
 lcguYLTnbSX5lokBWk5JHfWQrDi/CxhI/u6SAtF81UxZT+M3kI6BvDw6b
 yYYgRIjuCW2v7F6GzSKponBaWU4Cb+8CESCeSRFai61dHE9jJH7FHoy2Y A==;
X-CSE-ConnectionGUID: HWwg/+C2R3imzSRWEYvUyA==
X-CSE-MsgGUID: Sw55++ETT9Sh4ziLw4ZR5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1285841"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1285841"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 22:44:28 -0700
X-CSE-ConnectionGUID: UhPA2KxuRoaSSuedneSbng==
X-CSE-MsgGUID: t2tIjX6PTFqKWRmHS1DBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3680073"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by fmviesa006.fm.intel.com with ESMTP; 21 Oct 2026 22:44:27 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com
Cc: daniele.ceraolospurio@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v2 0/2] add coverage for xe_pxp_debugfs
Date: Thu, 22 Oct 2026 05:44:18 +0000
Message-ID: <20261022054420.180035-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

This series adds test coverage for xe_pxp_debugfs reporting
and updates xe.fast-feedback.testlist accordingly.

Changes since v1:
- Close the debugfs directory file descriptor after use.
- Check for non-empty debugfs output (ret > 0).
- Print the debugfs information read from pxp/info.
- Move the subtest description to the test implementation as suggested.

Shivtej Patil (2):
  tests/xe_pxp:add coverage for xe_pxp_debugfs
  intel-ci: add xe_pxp coverage subtest

 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_pxp.c                     | 28 ++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.43.0

