Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC4C0C02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 07:20:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C4A10E7C4;
	Wed, 12 Feb 2025 07:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NsygpgBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462410E7C4
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 07:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739344828; x=1770880828;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TpXNuijw7Gp+c+t0hd6JSQ2epmQecq7K8ufZuS1peL8=;
 b=NsygpgBPoqb6JwDr4o5UxE7Gb3Q8HO+dz+RLGckCI2dJZIGN9N/iGKCp
 T5qEOQTWjPFIZrSaWVqFp0h9XdRAanECZRqovM9caah8AEd9arZ5X9voP
 bFe8nwZqgRzx43kBz3iDAigOerJ1T10gTD4bbERvPxsxrJMwjSunIm2bL
 iaQAj3I/RGMnyan9VgEqEII5DDYyIOpPSc8zG3Lp1GkmCa8OrU+iLCxdf
 DEPLJoqIlylfaLQi6SAvHo7OcCjOD+uzayFRA+qOnb5r00w22jwXAtaeB
 k51tijEIe7H8OwSzSKPH64YGEEZr34s69q7tyO7425xp9pcy1A1MG6ssj w==;
X-CSE-ConnectionGUID: Tlgjvs/+Rd+Cv6Eu3SL8Ag==
X-CSE-MsgGUID: oL1rGNnSR42Imv+e07qV5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27586578"
X-IronPort-AV: E=Sophos;i="6.13,279,1732608000"; d="scan'208";a="27586578"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 23:20:28 -0800
X-CSE-ConnectionGUID: tKkBLh8KQa+hH9jBc6eFhw==
X-CSE-MsgGUID: j7vMtryzTZqiE2rsoiXjwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="112596754"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 23:20:26 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Wed, 12 Feb 2025 13:06:01 +0530
Message-Id: <20250212073604.1580120-1-jeevan.b@intel.com>
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

Added new lib changes to find non_joiner_mode and updated test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  lib/igt_kms: Add lib changes to check if joiner is enabled for a pipe
  lib/igt_kms: Add support to check joiner mode limit
  tests/intel/kms_joiner: Add a new test to validate non-joiner mode

 lib/igt_kms.c            | 76 ++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h            |  3 ++
 tests/intel/kms_joiner.c | 65 ++++++++++++++++++++++++++++++++++
 3 files changed, 144 insertions(+)

-- 
2.25.1

