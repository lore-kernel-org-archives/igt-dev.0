Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D456606A31B
	for <igt-dev@archiver.kernel.org>; Wed, 21 Oct 2026 17:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ps6VBHUD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6B2410E313;
	Wed, 21 Oct 2026 17:41:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36D610E313
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Oct 2026 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792604441; x=1824140441;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GaXVCN+rAKx9pdGMSbdxH1tnDP1vw1auXG8u3eJSVkc=;
 b=Ps6VBHUDUSIpVGIQNaZNoxAd0NAk7Y03Awy81CTeEKpqD0sC4mh0GXIT
 CS5gE1aoyTMZo0gZOhFk171ZJJV8tWTRta34DCLYrdUfPQPzSqsMe0fxl
 KH6PPLfiAAvC0BoLTi6o6apbBV9EMbeV/3sHdSnzZ2S2PT+wmsR8VCwo5
 UfrJx/2vgM3PwcNAhQUQlzziDAjzjgOAvw2PES9BLrzbSmgQTd8uCFpB9
 sDj6lpvVBEUzs9qdCyBLLFoZOHOHHlXMpXzpiKVmhQeCa85olZfoPp8g/
 BDIZHJP74SLzGYhHJCg44fOoySf1XB16L2nvihgBOggnUwr7tXU3ZwUDj g==;
X-CSE-ConnectionGUID: hd01PQKqTQShBV1V2eteKQ==
X-CSE-MsgGUID: 1vQTLou2Q8mbqBlVi+fG0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1346944"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1346944"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:40 -0700
X-CSE-ConnectionGUID: 28z8R0uyREOVaWDeCIrIQg==
X-CSE-MsgGUID: qpgd/6JCQUOu36UHQnHRHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="4942635"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 10:40:40 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Cc: priyanka.dandamudi@intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v7 0/5] Add BO Allocation and VM Bind stress infra
Date: Wed, 21 Oct 2026 17:40:26 +0000
Message-ID: <20261021174032.18337-1-sobin.thomas@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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

 tests/intel/xe_bo_alloc.c | 1602 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1603 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.55.0

