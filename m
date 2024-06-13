Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911BCC27C4F
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 10:24:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7C9C10EA06;
	Thu, 13 Jun 2024 10:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ot4paQf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAC210EA04
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 10:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718274263; x=1749810263;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j9dBrtDUY9zL85yNFeaLJUKPzIRPch28Xz43kjnWJKU=;
 b=Ot4paQf8VFLXzUu4/CFEi8AasSdRoro5UrPaAPKnTFICbqQjzl+mW4qk
 hGtXMQ1zHCI70w4fQkCl9rOQ3gN4xsdyRrAz7J3lVrrPzsrAEreFj90cb
 LnSx1jmaTAbRy3RqAb8aaNlVqzL+ka5XNF8rUB5vMVFDjlYlvfPC67fjn
 siGqYcnJLhryytolwDY7Ld07Vxh7H6Y4F1VQPxNmzfe7G9o0g8cijrRT5
 mbsCAQjdjClPIveOGYWcNah0d+gs6hgDGOde2lth0zZLngstPvo0UqZ1f
 UMHNugX2C0nxqD0sHZG3ejnuSIGEL9+1uHSpQsGWelTUVzKY2D8wmjhlW A==;
X-CSE-ConnectionGUID: 4WrdC5WkSRKdjlgTVxmasw==
X-CSE-MsgGUID: QMF+Ig4eRy6kRZzN4Hpdvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18011144"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18011144"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:22 -0700
X-CSE-ConnectionGUID: gq8V7tm3TG29VUPznzNg6A==
X-CSE-MsgGUID: Q0FB556xQtaJYqX2+H9cfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40214980"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 03:24:21 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org,
	mitulkumar.ajitkumar.golani@intel.com
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t V2 0/4] VRR test cleanup
Date: Thu, 13 Jun 2024 15:46:29 +0530
Message-ID: <20240613101633.3804434-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Test cleanup in seamless-virtual subtest.

V2: Enable VRR in seamless-virtual subtest

Bhanuprakash Modem (4):
  tests/kms_vrr: Skip low RR mode check for seamless-virtual subtest
  tests/kms_vrr: Fix hardcoded step size
  tests/kms_vrr: Enable VRR in seamless-virtual subtest
  HAX: Run VRR subtests in BAT

 tests/intel-ci/fast-feedback.testlist    |  4 ++++
 tests/intel-ci/xe-fast-feedback.testlist |  4 ++++
 tests/kms_vrr.c                          | 12 ++++++++++--
 3 files changed, 18 insertions(+), 2 deletions(-)

-- 
2.43.2

