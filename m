Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6DBC25B74
	for <igt-dev@archiver.kernel.org>; Tue, 21 May 2024 09:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2726B10E5B5;
	Tue, 21 May 2024 09:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jYW7l1mL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16B8410E5B5
 for <igt-dev@lists.freedesktop.org>; Tue, 21 May 2024 09:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716282190; x=1747818190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xUlNnnHXoBDo3L6Xb0fB5p5QOfHo9GcmpTEvyUo1wvY=;
 b=jYW7l1mLN577xWI7xu+iPsPBabiBzshpsjpdMsEX6sg1CcCelzfKHLyK
 DbPxfXK7JgX2p1+pZHdqYmmwPJCc5WojEt4pncROowPVaNArVtnf7JTGe
 35dzewCL0B+nLdh8ejV8VPp6oTAW6ToPxalgyilOL06cZmbrVQCY/80fZ
 qyZWCC0IVIsV23iVKZyLKfJSMZm5KLSO816DT1Kk/f8bPYQSVhmiDuMcx
 RrTD/ehy/KDL5yH2OBPPKFlk88wSOyf5N/Miqc8W1/LgVLzzqvLXU34rA
 pI13P86KTnDGK1UouYmKb2mO9sTzoxKBld1b5Xe93wxYlNuZgM3gcaYmA Q==;
X-CSE-ConnectionGUID: CvkM0FbBQIikQ5EMT6J3fg==
X-CSE-MsgGUID: kwIid54ZQmWtiUqGIQpZeA==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12327368"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12327368"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:55 -0700
X-CSE-ConnectionGUID: GtlDrpRCTT6rYO7STqLgzA==
X-CSE-MsgGUID: OIV003xyQW27X1HZchxPIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37804303"
Received: from mathiasj-mobl.amr.corp.intel.com (HELO
 jhogande-mobl1.intel.com) ([10.251.211.157])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 02:02:53 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t 4/4] tests/intel/kms_psr_stress_test: Provide output to
 psr_wait_entry
Date: Tue, 21 May 2024 12:02:33 +0300
Message-Id: <20240521090233.1998323-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521090233.1998323-1-jouni.hogander@intel.com>
References: <20240521090233.1998323-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Psr_wait_entry requires providing output if Panel Replay PSR modes are
used.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_psr_stress_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_psr_stress_test.c b/tests/intel/kms_psr_stress_test.c
index bca3bd513..d6e2340b8 100644
--- a/tests/intel/kms_psr_stress_test.c
+++ b/tests/intel/kms_psr_stress_test.c
@@ -232,7 +232,7 @@ static void prepare(data_t *data)
 
 	data->initial_state = psr_get_mode(data->debugfs_fd, NULL);
 	igt_require(data->initial_state != PSR_DISABLED);
-	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, NULL));
+	igt_require(psr_wait_entry(data->debugfs_fd, data->initial_state, data->output));
 }
 
 static void cleanup(data_t *data)
-- 
2.34.1

