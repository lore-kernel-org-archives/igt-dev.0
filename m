Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37288C3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 14:38:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1A510E37C;
	Mon,  8 Jul 2024 14:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1/X4aoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E164310E37C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 14:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720449517; x=1751985517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Z7ANN43nWEBBYsQLdZitFK9rNeLcZ2WWYkCc4FloQmg=;
 b=U1/X4aoAmG0+l4ti2pDPqk2oWyB1wRJcQqOSBPPpwr1dhxKhvRYU4EL+
 ybDJpKtRCHSDv2+A7uNVMSS+i9gdFk01o7vrwzPO/O+AcX8s9ZxnUkd0N
 R/T0+xHApzwsmwPWLp0wWjWMt3+eGXsVBP6wP5SREmvs0iRP/3p+ufU97
 gg5ISU+cDAL8jmK1dj14c9EHIm8YEj/gMcmsuqoJw4tjSh4JRetV9kNGH
 CdiEi56Bcd7JygocD8EaCu3xLiZV9yhd0luo6MIwtLrXSEqT1jfIogy8i
 hutOXWF+zN2hB7jdfnrfDAHiqmPAzZCNBU7SEPIBwWRJLKsXCC5Zr7qnG g==;
X-CSE-ConnectionGUID: X3KU85TMSm6EtS95E4SJCg==
X-CSE-MsgGUID: Aj//WFh7T+20Ref1YVxIYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="21465603"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="21465603"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:37 -0700
X-CSE-ConnectionGUID: AntWlqVGROyOgo2Y435oQQ==
X-CSE-MsgGUID: +buiKWoETOmz2Zghz447yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; d="scan'208";a="47491447"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 07:38:35 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, janga.rahul.kumar@intel.com,
 kamil.konieczny@linux.intel.com, riana.tauro@intel.com
Subject: [PATCH i-g-t v2 3/3] HAX: Add s*/d3*-mocs tests to fast feedback list
Date: Mon,  8 Jul 2024 20:26:07 +0530
Message-Id: <20240708145607.272869-4-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240708145607.272869-1-badal.nilawar@intel.com>
References: <20240708145607.272869-1-badal.nilawar@intel.com>
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

Add mocs suspend resume tests to xe-fast-feedback

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e6..23247940b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -65,6 +65,11 @@ igt@kms_prop_blob@basic
 igt@kms_psr@psr-primary-page-flip
 igt@kms_psr@psr-cursor-plane-move
 igt@kms_psr@psr-sprite-plane-onoff
+igt@xe_pm@d3hot-mocs
+igt@xe_pm@d3cold-mocs
+igt@xe_pm@s2idle-mocs
+igt@xe_pm@s3-mocs
+igt@xe_pm@s4-mocs
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
-- 
2.34.1

