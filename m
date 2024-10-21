Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF29D0E6D5
	for <igt-dev@archiver.kernel.org>; Mon, 21 Oct 2024 09:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0403B10E461;
	Mon, 21 Oct 2024 09:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OvQoSZUP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A425E10E461
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Oct 2024 09:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729501618; x=1761037618;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F35c3tM3oOE0KVDMGASOOKG7Eq56/R41etpRH/3CZno=;
 b=OvQoSZUPzrGdvKHcDxOo1AGPhKqUI4TCFncg2rZCs5xfH/lFfkUl1wiB
 eREE/W0sfrXL0RmE8Hpw6S7j1F8Gmd6iJn5qQ3blcLsxLsbpduqux239f
 oi9xYzmKpB+H8RLjb121lWYikHytPcWPzK7tQ+6RjeTB8tmOS9JLplQDL
 zvWhCVX87zdM+c87m2B4yyqrTvverGAlQNLBb2t/ZoOaginGn2QHk4TBp
 Sf+XWcIL8DxzNEwaw6qRJ6Rhcng0u0ULh6PyQHWeLGRRHhKrwk/f9V/Z5
 5gOq8ukO4TpGcNv6/0v36ZN7NF0VBrAXZJL2ZtJ0e2UYxG8pQrlleAUcE g==;
X-CSE-ConnectionGUID: uly+EuCESIqrTDasMCxluQ==
X-CSE-MsgGUID: 4KfOpLunQxWvYUo3zYXpKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51522023"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51522023"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:06:58 -0700
X-CSE-ConnectionGUID: EGdjyHCUQjeEwj6uxu68Fw==
X-CSE-MsgGUID: SivIju28TWinBua9oG17KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; d="scan'208";a="79421262"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2024 02:06:56 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v3,
 2/2] HAX: Add Coarse power gating tests to fast feedback list
Date: Mon, 21 Oct 2024 14:30:35 +0530
Message-Id: <20241021090035.2088446-3-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021090035.2088446-1-sk.anirban@intel.com>
References: <20241021090035.2088446-1-sk.anirban@intel.com>
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

Add cpg tests cpg-basic and toggle-gt-cpg to xe-fast-feedback

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 01b01dcf9..e9ae799cf 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -159,7 +159,9 @@ igt@xe_mmap@cpu-caching
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
+igt@xe_pm_residency@cpg-basic
 igt@xe_pm_residency@gt-c6-on-idle
+igt@xe_pm_residency@cpg-gt-toggle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
 #igt@xe_prime_self_import@basic-llseek-size
-- 
2.34.1

