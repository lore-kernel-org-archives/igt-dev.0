Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F43E9A04D
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 08:09:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1910E587;
	Wed, 18 Feb 2026 08:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buP8M8x3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F9610E587
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 08:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771402182; x=1802938182;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PjFC0BlFUFekwa+RaFpS3PCxzhYk0np4Q+zrdkwbsKE=;
 b=buP8M8x3OJZ+LCFxLNOvwYQUYOUmFK4KYoCxQpfdtMTghx75lYHz/BRD
 8aIRX/dO9vPRmmwqvft0DPGiBP1Z2uoGBXMGEPc9e7yECKTIuhAdW1INk
 rHP1gZryTOAZFneXuMVBQmfQeK0tqK9H+CTD4ZaglmKJpRaNZ4u+i+Qnj
 VtfYNItxoAun86th2kjhzp2iTkq/WRWAS9Bb985IQTkG0wXHAU/pkUOWZ
 TSbRiSRljrDotMjISR+DwoWE1Lyx3DmTilCPzy6RbBthECJGmIl4bQfHC
 8DRKrKLg73CV2fQytEggL1T566UO+0AEOKh5AYE5d9Rl/FfAmTWznkjhG A==;
X-CSE-ConnectionGUID: Jp0vlAfpQYOOXt3d1MtLKw==
X-CSE-MsgGUID: xCSD4ngrRzidGJFoz6uXew==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72385291"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72385291"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:09:42 -0800
X-CSE-ConnectionGUID: L8mn6+jiSj6gdZieNYisvA==
X-CSE-MsgGUID: F/46zIXrRce9B5cqSOGvtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237129373"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:09:39 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 sebastian.brzezinka@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 0/2] Add precondition checks for LOBF subtest
Date: Wed, 18 Feb 2026 13:34:33 +0530
Message-ID: <20260218080511.2534901-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch series restricts LOBF test execution based on the observed 
support behavior across eDP and DP 2.1 configurations.
From our analysis, LOBF is supported on both eDP and DP 2.1 
only when the display version is > 35. For display versions between 20-35, 
LOBF support is limited to eDP. Additionally, either Aux-less or Aux-wake 
mode must be enabled for LOBF execution.

LOBF support may also depend on the eDP version 
(e.g., valid only for eDP ≥ 1.5). Confirming this would require reading 
DPCD registers via IGT, which is not preferred at this stage. To avoid 
unintended failures and ensure proper skip behavior on unsupported 
connectors, the test is now restricted to execute only when Aux-less mode 
is enabled, preventing false negatives and improving stability.

Mohammed Bilal (2):
  tests/kms_vrr: Skip LOBF test when aux-less ALPM is not enabled
  tests/kms_vrr: Add connector type filtering for LOBF

 lib/igt_kms.c   | 28 ++++++++++++++++++++++++++++
 lib/igt_kms.h   |  1 +
 tests/kms_vrr.c | 30 ++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

-- 
2.48.1

