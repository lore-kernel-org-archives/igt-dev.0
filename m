Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31301606B9EB
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 08:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kyFuJAIb
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D301E10E35A;
	Tue, 10 Nov 2026 08:30:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89C1310E35A
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 08:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794299341; x=1825835341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RXNAZLRIYQDdWEp24v7YN5cjzjflaujdE/tOlqCAVYE=;
 b=kyFuJAIbk+maQA5Bp47xRIgaxYIWaZxaTRIlIrb/Cz7lPM11xpy7SfY4
 OHbEE2t/ccDqWrppyFoEC21ZEg/ZMbbbRfVl6hShWujQQUX4kCVh+4AF1
 wvFpj2NeoKhsHFIAswkyiBcUblZImOHZ7DZxHkZUHjn5wIHiKse/EtYS2
 dKso2G9bReRRC8coonk33UfSF6NXuCgxhgnIrFwJiyKWu2aZE34RC4eiQ
 8vpaLEBTiu2YU08SFvZume1KSNZa1tNwO3xbRi1pLeTXmjoZfDW/Gi+6k
 Mor1o19R01gFGAJr7icFpEAoATq8jp8ZG+e70PrpOhs09M7/END8L9EfA A==;
X-CSE-ConnectionGUID: Zg6eTsL6QmaeXO/RQhXz1Q==
X-CSE-MsgGUID: 1LzVPvinTpemNvQpzPmcbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2916446"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2916446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 00:29:01 -0800
X-CSE-ConnectionGUID: 6kKg249HSCqZNSut05XF6Q==
X-CSE-MsgGUID: N6iq9TAhQOyFyuY6RVWReg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7961909"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 00:29:01 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v4 3/3] intel-ci: Block igt@xe_sriov_mmio_regs.*
Date: Tue, 10 Nov 2026 09:28:38 +0100
Message-ID: <20261110082838.2034264-4-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110082838.2034264-1-lukasz.laguna@intel.com>
References: <20261110082838.2034264-1-lukasz.laguna@intel.com>
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This test is dedicated for HW checkout and it's not suited for recurring
CI runs.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel-ci/xe.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
index c1dd3c7a8..73c580e48 100644
--- a/tests/intel-ci/xe.blocklist.txt
+++ b/tests/intel-ci/xe.blocklist.txt
@@ -118,6 +118,7 @@ igt@sriov_basic@bind-unbind-vf$
 ##################################################################
 igt@sriov_pci_config.*
 igt@xe_sriov_ggtt.*
+igt@xe_sriov_mmio_regs.*
 ##################################################################
 # Chamelium V1 HDMI receiver supports a maximum resolution
 # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
-- 
2.43.0

