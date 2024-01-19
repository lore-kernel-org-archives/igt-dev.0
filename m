Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91347C4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 14:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E82110EA08;
	Fri, 19 Jan 2024 14:28:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAAF10E9F9
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 14:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705674520; x=1737210520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzSMT51aT34HKMjZ9P0ahy78fvZzWd3/6ZiIAXCJhwo=;
 b=HiFjeP17Gb0zYbTFRlaESngQ6RAD9EwycS82qDvCc/4GZMaW4d0ucAsp
 XbugoKaDs1T0PHwU34tmBRoE6xehbxPm+oGd/Hv+gU4lT2tNzfPksYRdx
 xqGH2ok1WC+LQ36DLCgVmDry2kccMw3NtoVFpuDvvx43qPAT/KfUMVnjX
 2+IwGBrjRPDzUSCnnk94zFRa0talFR7FlFWUa0UmhfQZqTg/f4Iy+3hj3
 B00wxd/lxUEtcHbjiayYDuUzLV5xHpmX6tqTbj+cSMz6dbLs/DO1mblAF
 1lQpDXHSP5z5akn0R6eCRtbYOLmTQTHpI+ewe3ONvJ+sglxJcyvt7hJyN Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14278431"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14278431"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:28:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1031963556"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="1031963556"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:28:38 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 4/4] HAX: Add d3-mmap to xe-fast-feedback
Date: Fri, 19 Jan 2024 19:58:23 +0530
Message-Id: <20240119142823.1711688-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119142823.1711688-1-anshuman.gupta@intel.com>
References: <20240119142823.1711688-1-anshuman.gupta@intel.com>
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

