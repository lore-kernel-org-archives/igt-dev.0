Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB52C5DF97
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 15:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CADE10E2F6;
	Wed, 26 Aug 2026 15:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQRaTIp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA37210E2F6
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 15:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787759504; x=1819295504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C0sUVYu5mraPyM6P1CG/gduU9Fy5ubRDxCifchBXQLw=;
 b=nQRaTIp3ZMRlqWCRKUaW7lhwqT4ogGpqhSBuQk1uyOmT6mazZRJUfbbQ
 z81iVGsmN2b5Y+pxrweEyQQ6LKT3COg2139uB7uZl+YDvtTM8lEltSF3W
 9hUV9G24XvX4vspt829++D8FZ4ypbDRspCRYBH3rUsTqNDS21Q9Zb27rP
 Gpnp+CGGxFvxxBLT2rGWP6GcX3siYaMs+NrybNaZMlBeCzhAIcXtbJPkH
 8suOK3wrvkJapjCbvt04dRiAHmG6wXhF9c+sx35LgxxMkj4LL/KFztrLI
 VHzj/dvQ1UEEWocHLZW9JTzW2DQgIrjJZJGqDaiCwg+XfaQEw6/3ra1e/ Q==;
X-CSE-ConnectionGUID: nLYLhMFRQ9u/XetG132S2g==
X-CSE-MsgGUID: 8WcPnXA7T4eaoDB2F+VUkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105769246"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="105769246"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:51:43 -0700
X-CSE-ConnectionGUID: KSF22O7DRRqjagbDqYqNUg==
X-CSE-MsgGUID: boxqIOgoSH60eRFMS1l7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="266321815"
Received: from dut6245dg2frd.fm.intel.com ([10.36.24.131])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 08:51:43 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	matthew.brost@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v3 0/2] Add BO Allocation and VM Bind stress infra
Date: Wed, 26 Aug 2026 15:51:28 +0000
Message-ID: <20260826155132.1313570-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
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

This series adds the base BO allocation infra for excercising Xe VM
Bind/Unbind with varying BO Sizes and execution workloads 

This infra supports individual and array VM binds, random sized BO
allocation , threaded execution across engines, unaligned VA access and
leak/eviction scenarios

Sobin Thomas (2):
  tests/intel: add BO allocation stress coverage
  test/intel/xe_bo_alloc: Add oversubscribe concurrent bind stress
    subtest

 tests/intel/xe_bo_alloc.c | 1512 +++++++++++++++++++++++++++++++++++++
 tests/meson.build         |    1 +
 2 files changed, 1513 insertions(+)
 create mode 100644 tests/intel/xe_bo_alloc.c

-- 
2.52.0

