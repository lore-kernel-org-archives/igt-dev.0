Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171AECA0EFA
	for <igt-dev@archiver.kernel.org>; Mon, 25 Aug 2025 16:11:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB4C10E22D;
	Mon, 25 Aug 2025 16:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zj9SNP7N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4810E22D
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Aug 2025 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756138288; x=1787674288;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A4qURizgtdMA9HnheelADeRn1Ol1kU7iUR7JefafFZI=;
 b=Zj9SNP7Nvak5AZqDiVJBUV9kTdpZXrrhBXih0TRM/hx44WCZLM5EyZeo
 27SXRuE7Hfk2PpyeNCXZ6P6ljIy/TA44bXUp/9goGjT9bqi64cmJOEwzH
 k+TC5sFLtWr8QucAKfcaSrljQoIxR/varaTKRhX1KQuH28s4fC6+Mwe60
 PuUKAjMRWLW32CZzV0i887dL0U85FqyvCAUfwmzL53aXWZzPEjMdbfpIg
 90nYpzFJevxSd8lSFGsZYXNEr0UMXGICi+sFEIlvOr127/DfZcDmI+/MI
 3r2w5apdJgKsH6JHAN0XzTOKFKAB8Yh93Nk9s0tlXt20Jy8F9LMi6tibZ Q==;
X-CSE-ConnectionGUID: 6tigreAIQgmkxILs5SZS6A==
X-CSE-MsgGUID: bHhTu+AHRN6AjCaew+a2Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="58424902"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="58424902"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:11:27 -0700
X-CSE-ConnectionGUID: EJVNZ3qDSGe4/zh4ioa7OA==
X-CSE-MsgGUID: eEw/lFLJS9K6M/PTwhy/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; d="scan'208";a="168939548"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2025 09:11:27 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Subject: [PATCH i-g-t 0/2] Update SR-IOV blocklists and testlists
Date: Mon, 25 Aug 2025 16:53:44 +0000
Message-Id: <20250825165346.504290-1-jakub1.kolakowski@intel.com>
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

Extend SR-IOV VF and VM blocklists with tests that are expected to skip
in VF mode and update xe_test_config.json file to genereate SR-IOV-specific
testlists to be used in CI runs.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

Jakub Kolakowski (2):
  tests/intel-ci/: Extend VF and VM blocklists
  tests/intel/xe_test_config.json: Add SR-IOV testlists

 tests/intel-ci/xe-sriov-vf.blocklist.txt | 54 +++++++++++++++++++++++-
 tests/intel-ci/xe-sriov-vm.blocklist.txt | 52 +++++++++++++++++++++++
 tests/intel/xe_test_config.json          |  8 ++--
 3 files changed, 110 insertions(+), 4 deletions(-)

-- 
2.25.1

