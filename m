Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41891C47E49
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 11:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5902C10EF7B;
	Wed, 24 Jan 2024 11:50:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FCE10F185
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 11:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706097039; x=1737633039;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WzSMT51aT34HKMjZ9P0ahy78fvZzWd3/6ZiIAXCJhwo=;
 b=m2GwYIk642KjOzZUMfJWwasF7MhX3vdFVW4L9uNYL8U2YvF7j0i7shFO
 SRiR/40Z7G2/r8OvydwStcKZa2XvxGaksF7Gq3tpC2y748Ic9MAGK0jRu
 viQV+VButejltOg/OrT6r/MEU80wWB0PopkxWndM018iety2HRUBuNMEZ
 WIW81nIEGh1mjQlvpyi1GbS1toADXd8zoH6KLM+Rj7tmtKticRjOtlb8h
 N+aWDVZJORJHYuZKk1q6O2WMhUDAZpHieR6ey/ZVZlHCpE8IV9DjlEZvA
 ECj2ClZ29pHTExuWb/oDtIeriHIWFWBjD5m6KcGA5KW9YRyh3ZKZvRF+v Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="398978612"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="398978612"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 03:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959483587"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="959483587"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 03:50:37 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v6 4/4] HAX: Add d3-mmap to xe-fast-feedback
Date: Wed, 24 Jan 2024 17:20:19 +0530
Message-Id: <20240124115019.2067089-5-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124115019.2067089-1-anshuman.gupta@intel.com>
References: <20240124115019.2067089-1-anshuman.gupta@intel.com>
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

