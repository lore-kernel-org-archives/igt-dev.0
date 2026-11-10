Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637C60A263C
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 08:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LDh02KHV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FD010E35A;
	Tue, 10 Nov 2026 08:29:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E67110E02F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 08:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794299331; x=1825835331;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zmNv2lK0ZmifnddQshz8oYe3l/EPiK/I4ggSMzm8FPw=;
 b=LDh02KHVTqeKcIhipZZ64YfHX5YQN19Vr6jiS6mG+/2hsQ+p5MP0wF5G
 RcNk9xj/5UOjoZ/5y0J1/m/qd4T4d+I1s/AM6xeX67kM6z2JWROEKgG3E
 xY3bDv3aqOhddsxEF/nfuWmJSr4coCGn7I0ebmpbbXunxxzvZNXNBrPti
 bfk6VCORcx2yIFkrJ0z0lKt3vGKiZ8Hp2SnrBko9PXy3rXM62GOD0Xx51
 UuGplq6Ql/8tx2rVvmgUdi0OYJOQmubk6AO/8Wo/CE+wfKj8R/2VPuSno
 6rGKsrKLaP1Gxjrx5F5ofOEhpsi+BDAAmT7VeRnEgLVR6k5/sWLPHPFGj A==;
X-CSE-ConnectionGUID: Pd1/r+HGRWOq2t5yIGQHIg==
X-CSE-MsgGUID: bMcRPmg1SouiSBJlZRZMNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2938155"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2938155"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 00:28:50 -0800
X-CSE-ConnectionGUID: H6fxGlhDR/K6eJmV7qrjiA==
X-CSE-MsgGUID: cmD+pCslTLKYOYFsTENhQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="9958926"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 00:28:50 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v4 0/3] tests/intel/xe_sriov_mmio_regs: Add tests to verify
 registers on VFs
Date: Tue, 10 Nov 2026 09:28:35 +0100
Message-ID: <20261110082838.2034264-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In case of SR-IOV, the VF has limited access to the registers. Let's add
tests to verify that the VF actually has access only to the allowed list
of registers, and verify that registers dedicated to VFs work properly.

Lukasz Laguna (2):
  lib/igt_sriov_device: Add helpers to get SR-IOV function name
  intel-ci: Block igt@xe_sriov_mmio_regs.*

Piotr Piórkowski (1):
  tests/intel/xe_sriov_mmio_regs: Add tests to verify registers on VFs

 lib/igt_sriov_device.c           |  53 +++-
 lib/igt_sriov_device.h           |   2 +
 tests/intel-ci/xe.blocklist.txt  |   1 +
 tests/intel/xe_sriov_mmio_regs.c | 408 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 5 files changed, 462 insertions(+), 3 deletions(-)
 create mode 100644 tests/intel/xe_sriov_mmio_regs.c

-- 
2.43.0

