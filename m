Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3342CC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50CD10E89B;
	Thu,  1 Aug 2024 06:05:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7prjqoO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9203810E89B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722492317; x=1754028317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qwe/X6ThX3yS/tWvQgxxHrb+R9tzdSKdjubm01kWCqI=;
 b=m7prjqoOfFhIfB2n/5KI2Wp2LZzmu4qQvpj2Tst3URDTGJQa4yTbPz0S
 nZyxI91IpD0oIgRPCh6BGzU51YSLlJJNyFENerKC/QP+e1w5n/YXBeRzQ
 DH1/LqtlJBowm5x58HVBBeTQpmMVR/ZzKW7mzBcJwPi8YB0JVs59VYl35
 iHJniXWr6roFr3SNK9cSWr9u38x5UsPfZDHdyldfRipAXtNTpm4wWzeoC
 +u5W+HkFAeDq5HxNvlNTxm/EC5oMXJP2xt3GKmHQPWdwAeu3QlnhwBVw/
 RIlTBa/mvFAvZ31iXsM4Y7s5E2J85FIoVW+nliKJY/1XR9UE4EeYQXciU g==;
X-CSE-ConnectionGUID: bpU80VPCSaO8C/MROjDwog==
X-CSE-MsgGUID: BHPOIMlLTMOHIlh3uYn6fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="31821077"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="31821077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:05:17 -0700
X-CSE-ConnectionGUID: t1YFRxSFTzi5SGyS3memBg==
X-CSE-MsgGUID: 9evx+VfVSfSkVfveM/gx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="85836476"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:05:15 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com, kunal1.joshi@intel.com,
 animesh.manna@intel.com, Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] New test to validate link-off between active
 regions (LOBF)
Date: Thu,  1 Aug 2024 11:46:05 +0530
Message-Id: <20240801061608.2983058-1-jeevan.b@intel.com>
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

Add debugfs entry to validate LOBF status and create a new
test to validate and fix grammar.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (3):
  lib/igt_kms: Added library functions for LOBF status
  tests/kms_vrr: Add new test to validate LOBF
  tests/kms_vrr: Grammatical correction in igt_describe

 lib/igt_kms.c   | 23 +++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 82 insertions(+), 3 deletions(-)

-- 
2.25.1

