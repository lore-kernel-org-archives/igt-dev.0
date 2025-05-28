Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A8C5AD49
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 14:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6E810E630;
	Wed, 28 May 2025 14:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5rnUi5i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0F710E62D
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 14:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748441698; x=1779977698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8+MjSM7LAn10y7ZHBBA3UKd47t3V0ARXPqHLDvrsKZw=;
 b=E5rnUi5iuIQVYGjR2T/J6uurXWwr7/07DkbyiQJBqXyusxhl7smEQQWb
 4HRKzw+/W1lRF0G+IiryFJOhnfF2DrCY6Q+jVffOiXfoIi2p7G1fWQ2cb
 59Igc/hjKWT1JyQvQX+9KTnHBvpsO/jt0xVe5yfPyPJPUs9qNCSk2dTfT
 GTwKesS9gUb/Ya+ZP71zAatuQ9bygY5hqqLck5cwEhyrvCda0P0eupKMz
 i4KYrEdKxfMSulRpS8HIK5lleucdyNJBHw2NZ0hE8qNVpUjYlXRAk12Ep
 H+M98WktnKKniF4KEbIu/w+YJWXeAPsGhYqGRBFfbq+2kcLymAa/fyWuv A==;
X-CSE-ConnectionGUID: JorxuktHQMKoFh8iwu3Kuw==
X-CSE-MsgGUID: rK0BneHcTo6MdAoomNgq0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61872163"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="61872163"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 07:14:57 -0700
X-CSE-ConnectionGUID: u8W/3RgeSMCodEzGyaf4ng==
X-CSE-MsgGUID: M50ohKn4RPu1JLzccj22eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148382796"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa004.fm.intel.com with ESMTP; 28 May 2025 07:14:56 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Fix typo error tab
Date: Wed, 28 May 2025 10:14:54 -0400
Message-Id: <20250528141454.2729293-1-zhanjun.dong@intel.com>
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

Fix typo error <Tab> to <Space>.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
---
 tests/intel/xe_fault_injection.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
index f9bd5c761..9fe6bfe35 100644
--- a/tests/intel/xe_fault_injection.c
+++ b/tests/intel/xe_fault_injection.c
@@ -83,8 +83,8 @@ static void ignore_faults_in_dmesg(const char function_name[])
 	if (function_is_part_of_guc(function_name)) {
 		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
 		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
-		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
+		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOMEM");
 	}
 
 	igt_emit_ignore_dmesg_regex(regex);
-- 
2.34.1

