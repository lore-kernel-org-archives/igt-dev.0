Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06873606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MS7bubkf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7D0112963;
	Fri, 23 Oct 2026 05:27:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2967B112963
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 05:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792733211; x=1824269211;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+L4/Rg6QFpyK5GxOIq/iw7WcPHny5objo08R5a+UVWE=;
 b=MS7bubkfuHGQKA86P8EJK7VPX+4pJLu2Zy3LYMJ5qC+1l35o/3im7vpu
 75E6qyi7kyuUHRs5UnmabxxapO801ZNXvm147QwRzvNH2N65wA3aOnqKz
 b8AzQd6j4/YsW+28hptYm4EUfrDNe/cyqGfOAT9Zin0BYbxC2WKWoo79X
 apxF6PS/hMLcjkhHlc0PsNPWPej3LC67N2zN/RF0qquqFtTLPnOJvIQKD
 KmtmfsIV2WQ7W9f/mmjeRel2OK22PZHGNzQ2ML6NSiuUpegF9lyqpZm6X
 tj+cTaTMkirnkvZEXtWxoZap2csLKkQ/8+ISe30JQOneysZzxjIrQTE66 Q==;
X-CSE-ConnectionGUID: WPwWu/DZSl63VdFI71QY7g==
X-CSE-MsgGUID: eKSELcvhQeyZEN9j2BnkuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1379675"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1379675"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 22:26:51 -0700
X-CSE-ConnectionGUID: m0ilUPtzSra4gGANSuij5A==
X-CSE-MsgGUID: wNzbJ3ZOQwmd1Ha6/+XftA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3453973"
Received: from gkmtlh2654.igk.intel.com ([10.211.179.188])
 by orviesa003.jf.intel.com with ESMTP; 22 Oct 2026 22:26:49 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com,
 priyanka.dandamudi@intel.com
Cc: daniele.ceraolospurio@intel.com,
 Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v3 0/1] add coverage for xe_pxp_debugfs
Date: Fri, 23 Oct 2026 05:26:43 +0000
Message-ID: <20261023052644.192314-1-shivtej.eknath.patil@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Changes since v2:
- Fix subject prefix and formatting
- Remove unrelated whitespace changes
- Drop xe.fast-feedback.testlist update
- Clarify commit message with coverage analysis results

Shivtej Patil (1):
  tests/intel/xe_pxp: add coverage for xe_pxp_debugfs

 tests/intel/xe_pxp.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.43.0

