Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770D606A31E
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m1SvwNg0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 675B910E859;
	Tue, 24 Nov 2026 12:18:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB83010F537
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 12:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795522492; x=1827058492;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=imYDmn3tnhXHKkzT/qPM+mpvyh7S4Onfk1jQU2OVlBU=;
 b=m1SvwNg03syFQpuftiOW03xUDL1r9bufHTp0Ia96X7C5dKxLujgeMJXf
 Q95uxNRieLcxVNY2tuGZ6DqNr1y7miasetfBTQUzGQ07AZoa5h88h5npX
 psOoR513E+8SUvSbB7eVsS2cpjdUqS508AfmREZ4IhRuWlCtmLDqMs2zG
 uFTS6T3TayiJTj3AZRYjkWVCuVpUEzQtO4DBIkcXFdNdOgIC4FgXllwyt
 ejibI5P2hIa3tgp6P16l5h7C2gEgUygUe9tAo05VwV4auSkvyMvSX5s2V
 c/0Ykdi7gFya7vCsEG7dYZCEVb+2EpOkjGQbl/fLHqMZV2nTeTMq7DJuH A==;
X-CSE-ConnectionGUID: smMtlWNNSxmdkc4J7J/gUA==
X-CSE-MsgGUID: nFSopuhNRwqRjP5vWiDSMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4252818"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4252818"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 04:12:05 -0800
X-CSE-ConnectionGUID: HUB1vaJzTTmgKEyvYZb0Og==
X-CSE-MsgGUID: 4OK3zafDRjmC0dCDLpnzKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11850092"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2026 04:12:04 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v8 0/5] Add BO Allocation and VM Bind stress infra
Date: Tue, 24 Nov 2026 12:11:58 +0000
Message-ID: <20261124121203.592758-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.55.0
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

This series adds the base BO allocation infra for excercising Xe VM
Bind/Unbind with varying BO Sizes and execution workloads

This infra supports individual and array VM binds, random sized BO
allocation , threaded execution across engines, unaligned VA access and
leak/eviction scenarios

Sobin Thomas (5):
  tests/intel: Add BO allocation stress coverage
  tests/intel: Add random-size BO leak tests
  tests/intel: Add array-of-binds random-size allocation tests
  tests/intel: Add threaded random-size allocation stress tests
  tests/intel: Add oversubscribe concurrent bind stress subtest

 tests/intel/xe_bo_alloc.c | 1613 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1614 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.55.0

