Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526C6C3ABC9
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBA610E5DC;
	Tue, 13 May 2025 18:44:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P7C4/sDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E57D10E5DB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747161839; x=1778697839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rRVUcbuJKDzK17TUCH62B/ULMCHq6bHrO7KWxaz1sIc=;
 b=P7C4/sDdhf5OC6sKKSMcyuswLyVIQmDy/2Vm4G6PTJHl4vssj7NfSZCU
 +XKJzxFjvB86yTjLy02o4MZlRxMJJSx6mdOWAOPexudBG2v/hUUqm7hvM
 id62D13yUVdIwBjmjGkjl2S1301raI8+5x/spl0Uepd3MQ4qlLuTFcUZJ
 /rA/EGhLrUzWt5o/rd3Zy00way1ytX11WdG8/JZt+T83dqPt563X0DP70
 wb9jwWH/GVNw4HUMlE0gGZsPcy+CoDMlFMe4Iz0LsUq+lW1MaO9FUQqU5
 DJz+25b6dmYS0kqnpVmlE+uCUkRco8HVGLLWBCYkdfem/r1lz19ogIzk8 A==;
X-CSE-ConnectionGUID: 8Lc5ZOwPRZmfS8Ye0WLxig==
X-CSE-MsgGUID: 7skn5qz0Rq6oxeJF6H6laQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="36655571"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="36655571"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:43:57 -0700
X-CSE-ConnectionGUID: rlMQHs+tSj+4Za9pKnFpBg==
X-CSE-MsgGUID: YVYYD4whT0G0QnM6KAXUQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137836055"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:43:55 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,
 0/2] tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
Date: Wed, 14 May 2025 00:07:24 +0530
Message-Id: <20250513183726.2118105-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Leverage IGT spinner to trigger frequency scaling and
set RPS minimum frequency to RP0 for achieving peak frequency.
This method replaces the existing waitboost mechanism used
to reach maximum frequency.

v2:
 - Disable power consumption check for dgfx

v3:
 - Implement igt exit handler

v4:
 - Cosmetic changes (Riana)

v5:
 - Limit the power consumption test to GT0 only

v6:
 - Fix frequency restoration (Riana)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>


Sk Anirban (2):
  tests/i915/pm_rc6_residency: Use sysfs to achieve peak frequency
  HAX: Add rc6-idle tests to fast feedback list

 tests/intel-ci/fast-feedback.testlist |   1 +
 tests/intel/i915_pm_rc6_residency.c   | 136 +++++++++++++++++---------
 2 files changed, 92 insertions(+), 45 deletions(-)

-- 
2.34.1

