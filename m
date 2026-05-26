Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4005CD5BB1
	for <igt-dev@archiver.kernel.org>; Tue, 26 May 2026 14:31:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9519110E653;
	Tue, 26 May 2026 14:31:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoNQnLP0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41AAB10E4EB
 for <igt-dev@lists.freedesktop.org>; Tue, 26 May 2026 14:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779805897; x=1811341897;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=CXVa+Yn5C4hpOmf2Y97lYtMKbWFB47tUXAFQ5rkEnFM=;
 b=hoNQnLP04rrmYr5ORzlJ7oAs/ylg6oubsQCNK9YqR1tD72bcYQvh82Fw
 7HrYfRNAHJzFLgZS1/tnaMEZIC9GcLyv58UdwcfX1tr2W1AeIaSJ8ztNO
 eIL+MUMn0Y6fjAtSZ3u7bDLXr4cf0V/P1dj3oQTD5rG10hzkGqVekeFcR
 RDMrhdQo8XZESGpb2S8WbVHDR/+a1NksJ/j8Ovqg791NB/AVBsZYrTTp6
 7Dg4CJVxdsIPbJF26uOH/L16BFsfUuL9hqGyPlbfXT54g7BKOWmYk7EA7
 GghNWg5J7pTJfoFF1jAVRQeDv2bthJfoFGjZDuHSX71PtZLGdYdIdDApi Q==;
X-CSE-ConnectionGUID: eo1JSd6dSmW8UjhYCu6Wpw==
X-CSE-MsgGUID: DTGolcoXSDSJRSu8wu9ieA==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="98196040"
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="98196040"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 07:31:37 -0700
X-CSE-ConnectionGUID: flbXioSRQkStGy1EwA67hQ==
X-CSE-MsgGUID: 6B9GcBPxRoCR55loRpLktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,169,1774335600"; d="scan'208";a="246197981"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by orviesa004.jf.intel.com with ESMTP; 26 May 2026 07:31:36 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 0/3] Negative tests for VM_BIND decompression
Date: Tue, 26 May 2026 20:06:34 +0530
Message-ID: <20260526143637.2143899-1-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND DECOMPRESS flows in
xe_ccs.

Patch 1 introduces resource management structures, helper utilities,
and a negative uAPI parameter validation test for VM_BIND DECOMPRESS flows.

Patch 2 adds a helper for fault-mode handling along with a
negative test to validate VM_BIND DECOMPRESS uAPI parameters under fault-mode conditions.

Patch 3 adds negative test coverage for VM_BIND DECOMPRESS
with CCS corruption, including suspend-resume scenarios.

Changes since v2:

Reworked test split and helper organization
Previous version:
https://patchwork.freedesktop.org/series/162838/


Smitha Balasubramanyam (3):
  tests/intel/xe_ccs : Add helpers and Negative test for VM_Bind Decomp
  tests/intel/xe_ccs: Add fault-mode helper and VM_BIND decomp neg test
  tests/intel/xe_ccs : Add CCS corruption neg test for VM_BIND decomp

 tests/intel/xe_ccs.c | 1184 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 1184 insertions(+)

-- 
2.43.0

