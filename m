Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE811C5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 08:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5F710EB16;
	Fri,  1 Mar 2024 08:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UQFMXDYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCD710EB16
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 08:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709280935; x=1740816935;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=85TPAaRQux97CwHJrcDfMo0rKEJxTDQiwIvl9AboX8Y=;
 b=UQFMXDYDp8tueQexxpKZ6lUK+mnHhmnU8OiuPirgb7ibBZUj0YlqdD+A
 xEaby8T3XAUQsaPBU59KAzoDZ52hZMuKh8Wx/qVv33q+yGtERE9zYobnk
 CuFMQBpxmC4s1FxNU87z8rteK3FVKck+5NjvF7EONmCCkOkrygXFqES6Z
 B5iDphIzLN/rcyWG1WDZ3JDjLQC+4p154/HIHkK9u0JcAvPWx1ocj9Mam
 9NaR7fgsxTHit+zxNW3ILvGoYYn2ZlrTexhuneXghyI4Bs8uCFb12Uayy
 6HO9/ZkcKJEdmnTBP6m3OzGelQwTB998qojeJ2DiWUFuTa9IE4IwdcoGc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="7620772"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="7620772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 00:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="12812201"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 00:15:32 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 0/4] revamp big joiner test
Date: Fri,  1 Mar 2024 13:55:58 +0530
Message-Id: <20240301082602.199510-1-kunal1.joshi@intel.com>
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

big joiner outputs are statically assigned to pipe,
assign dynamically also add support for forcing
joiner, support for forcing joiner was introduced with
below kmd patch

drm/i915: Add bigjoiner force enable option to debugfs

Kunal Joshi (3):
  lib/igt_kms: move bigjoiner_mode_found to lib
  lib/igt_kms: add helpers to enable/disable force joiner
  tests/intel/kms_big_joiner: revamp kms_big_joiner
  tests/intel-ci/fast-feedback: HAX PATCH DO NOT MERGE

 lib/igt_kms.c                         |  73 ++++
 lib/igt_kms.h                         |   4 +
 tests/intel-ci/fast-feedback.testlist |   5 +
 tests/intel/kms_big_joiner.c          | 507 ++++++++++++++------------
 4 files changed, 355 insertions(+), 234 deletions(-)

-- 
2.25.1

