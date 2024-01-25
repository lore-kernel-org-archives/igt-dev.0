Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC9DC47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 15:41:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F78B10F92D;
	Thu, 25 Jan 2024 15:41:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C0910F92A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 15:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706197293; x=1737733293;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzSMT51aT34HKMjZ9P0ahy78fvZzWd3/6ZiIAXCJhwo=;
 b=ho1c5jN3Wn/b2g4zlDLOlOGBNPjMrbKuT9RErmoMgzcl3NO6t4HL/eg4
 PADz5/gqY8h/JNFlgv0GN+j5f9NOjX/DSnlz3d5zpyPlDmyXHn6T/cYMN
 RuV9RFTLObSptj/cs976R0ZPQ0TiwCaYAkF7zFfExJykSQp+IXB5fnTbc
 WsQSgi4vzvkH58WUxFnfB9hrJBC5MJ83FU+esX4ywAP7NgaM9b93vRHYh
 iJpFx6EXjiO5F+87i0ZpsoTR1u2AELYAwGmJGPQnpHJxAN/qFNyTjKAiP
 vCuQmSjzdtJE064ZTnM/AFfxVl9OujIUjd16hyZ0kXqq0a7rzi3CGWKVj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20743818"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20743818"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35137510"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:32 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 4/4] HAX/DO_NOT_MERGE: Add d3-mmap to xe-fast-feedback
Date: Thu, 25 Jan 2024 21:11:14 +0530
Message-Id: <20240125154114.2164080-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125154114.2164080-1-anshuman.gupta@intel.com>
References: <20240125154114.2164080-1-anshuman.gupta@intel.com>
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

Adding d3-mmap to xe-fast-feedback.

Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f297fe965..1d5ecb19d 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -115,6 +115,8 @@ igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm@d3-mmap-system
+igt@xe_pm@d3-mmap-vram
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.25.1

