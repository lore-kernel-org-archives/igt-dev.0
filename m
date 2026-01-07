Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674C3CF6BF4
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 08:07:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1514410E21A;
	Wed,  7 Jan 2026 08:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXSjwgb7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7192F10E21A
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 08:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767773268; x=1799309268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mWx3iTnmtDI7f44NkBwz3NDOO6wVAjBDZ7nbFh8amqg=;
 b=nXSjwgb7hzUMSu+PfrFDMrsC4LCkgchjyrxtUf5nYlR5jEn/qqvJbHG1
 Iu+4vIgs5asIqY/ILQFA9Plr3QJ32V2qfL+tKIGDSEILJ/E+c8QZObIFS
 WfvedULydYjYUWvGm13fkS8w32iqSY1Szr3S1sBdWWV3mXnPqHHFCrpxH
 Rfckanp5R8aFCKRVej7IOIGO02+9mP0IsZ9A0y3A6wk6wZzvBbV3k7E0e
 V/UmcELuzuYr5OXUkibAdoESyUikqFgtfI3O4bWcxAbtVMQutvQG4N0Y1
 /G3qAFwieahBc0PxcZbz9rimCcWOldYVLead25gm/VRafeD+sXkwY1ZVB Q==;
X-CSE-ConnectionGUID: HR9i+7NxSsC4kx04wyAhpA==
X-CSE-MsgGUID: gttlV879TDaUQ67a43noVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68147399"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68147399"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 00:07:48 -0800
X-CSE-ConnectionGUID: I6/Ak4JYQWeOxvVyuUibGw==
X-CSE-MsgGUID: WcGXywthTBu8jQoR3h6Meg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="202766081"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 00:07:47 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] intel-ci: Update BMG display blocklist
Date: Wed,  7 Jan 2026 13:59:01 +0530
Message-Id: <20260107082901.594598-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

blocklist sharpness tests for BMG as
content adaptive sharpness capability is
limited to DISPLAY_VER >= 20

Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel-ci/xe.bmg.display.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
index 5a03dc9de..361da761e 100644
--- a/tests/intel-ci/xe.bmg.display.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -150,6 +150,7 @@ igt@kms_setmode@invalid-clone-exclusive-crtc
 # Valid skip :- For display ver < 20
 ##########################################
 igt@kms_frontbuffer_tracking@plane-fbc-rte
+igt@.*sharpness_filter.*
 #########################################
 # Valid skip :- Unsupported for platform with Wa_16023588340
 #########################################
-- 
2.25.1

