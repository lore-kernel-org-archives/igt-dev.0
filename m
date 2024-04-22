Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8442FC04FF6
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 05:24:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B50112785;
	Mon, 22 Apr 2024 05:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTy8PHO9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E2D112783
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 05:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713763456; x=1745299456;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6klLX3Qqv7/at4X+2C0QK3pqWYWDbtpT5y1d68Wzeg=;
 b=aTy8PHO9w1ecr1TrTlj+eOj03oKc3Deou3RP6qNu0jzf4X4G9ndOqJ7G
 xuACqoqp8heDhGubYSnuVxxLDTRnUQm0ayymT7tptCvQ5pLKksxMxvSPW
 ns7M39hrz6OVhIwTV2y5LoIOEMVhuhsri43AtPxFmJOmJMFtRbffqAgQu
 jZgwSzHEnNanMJVx9hOEgLtY9neFIyooto0a3n8PxSwmjZ88g55kwfs7l
 N4TKAIsshD0wTxIS8jamNDRtMk3gYqqGWworUAAaxtQVWGYQmnsbRC2kO
 +rZh+7HM7hnqz3S6HBnpwC1Xl9A0sQWmQoztZ7i3/yjNMF0zU4RhQayTW w==;
X-CSE-ConnectionGUID: ERXe5cvcQmaUPKPcXSZAQg==
X-CSE-MsgGUID: QKymsbpxSQ+NodAvNiTldw==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9113804"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9113804"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 22:24:16 -0700
X-CSE-ConnectionGUID: 5prbVCcBQ3WcThc7zuqmSw==
X-CSE-MsgGUID: iyOUXW9xRtulrNV2VLlSRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; d="scan'208";a="23981168"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:24:15 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 7/7] HAX: Do not merge
Date: Mon, 22 Apr 2024 11:04:54 +0530
Message-Id: <20240422053454.2523989-8-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422053454.2523989-1-kunal1.joshi@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
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

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/fast-feedback.testlist | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..0fc41236f 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,9 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
-
+igt@kms_big_joiner@basic
+igt@kms_big_joiner@invalid-modeset
+igt@kms_big_joiner@basic-force-joiner
+igt@kms_big_joiner@invalid-modeset-force-joiner
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
-- 
2.25.1

