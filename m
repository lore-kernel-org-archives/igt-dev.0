Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256DCC0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 12:22:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B255010E6A9;
	Tue, 11 Feb 2025 12:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hRM/HLTo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3421A10E0BA
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 12:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739276550; x=1770812550;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jjQmhxS1vc4UXtu6XkkBIbrRgsdVhOpy/8IL74mMtvk=;
 b=hRM/HLTopx0AC3UEc4tkwCZoumfgakINO15pc0HHg8FF26byMq5uGSWP
 UrNCt4/0p79maA0cI+L6TGEzR/xOUQl8S+jfCdgxIkPVIIMuNIlKhsOoG
 FMckrAzP3x+o9ri/P7mcg3lDND91HC3HDwHG4BUK+3STmsr14nVDCS4vy
 a57woHd7t5m7RiwKSMtO+buSMSjpEtuxqokCP5hyikALUPpIx5Zb7nECd
 0ZMv3t4Ol38UYA84SDPhleXJixBJV1jJ7CGlcXCEz/e5zUn+T067KE5Wr
 Ds0tBzAbK0iHx0y9kVhhZImcjViNpR52vofOK/ZosbdptifGxh15ldg9E Q==;
X-CSE-ConnectionGUID: +k9J/hSYT12Bt45uStZGuQ==
X-CSE-MsgGUID: H0kC95eWTzawWDPqdavM5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="57429341"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="57429341"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:30 -0800
X-CSE-ConnectionGUID: OM8FuZNKTAW4LIHj2RkYDQ==
X-CSE-MsgGUID: Xg+VB3wYQnuFMh83Awge3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112350944"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 04:22:29 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Add XE support for i915_pipe_stress
Date: Tue, 11 Feb 2025 17:57:40 +0530
Message-Id: <20250211122743.329838-1-swati2.sharma@intel.com>
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

Add XE support for i915_pipe_stress.

Swati Sharma (3):
  tests/intel/i915_pipe_stress: Add XE support
  tests/intel/i915_pipe_stress: s/i915_pipe_stress/kms_pipe_stress
  tests/intel/kms_pipe_stress: Fix testplan documentation

 .../{i915_pipe_stress.c => kms_pipe_stress.c}  | 18 ++++++++++++------
 tests/meson.build                              |  2 +-
 2 files changed, 13 insertions(+), 7 deletions(-)
 rename tests/intel/{i915_pipe_stress.c => kms_pipe_stress.c} (98%)

-- 
2.25.1

