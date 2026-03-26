Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF12A109E54B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:21:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2AB10E1F8;
	Thu, 26 Mar 2026 06:21:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dum8/sd4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0624710E1F8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774506061; x=1806042061;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YWqWYPOR86Lzofjhj2YOLoWxzL2975FPbgZdMcfqV04=;
 b=Dum8/sd4RLY0AXW0HSr0ztXEviGoiZKHXkrBrEcklwGXVKs0KsmTO6Rc
 kN3gwWt2S2FY7cajYtg3UNBHnTENFpT5VeFKTk151nzvUcjk/g4L/TsM9
 oZvTUbXj7ISLJxBmmIVXBUU7UfAUZknhb6ejCXdsljeDKjsnrdG7L3GfE
 QivWFz40aVSeRZXx7+cgioverj7FF/FFhgoVG8gB7FXcpYp/4BldxX+7b
 TbS9sXl9jN6cyvZWA9WwtO1wlRKIJ+9k/UKnBmOdjw8y4f3GKPhTHvnox
 jh7ZdsBwucRG35HOztwlMpbvsrxHBXjkNbhQxT6omCTduTPNwuaitJqMa w==;
X-CSE-ConnectionGUID: DtkdyZpzTV+nQ1mUpbgj+w==
X-CSE-MsgGUID: sNbG3sgjSGSTR6F3kfqIGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="98175227"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="98175227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:00 -0700
X-CSE-ConnectionGUID: 89V+MKr0T/CsZlInk1J+9A==
X-CSE-MsgGUID: 4tCjq1gUSKuI3NA7u2fPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224935934"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:20:59 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 0/4] intel-ci: Add Xe FULL chamelium run type and
 testlist improvements 
Date: Thu, 26 Mar 2026 12:11:57 +0530
Message-ID: <20260326064201.783311-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds Xe driver support for FULL chamelium CI runs by
introducing the Xe FULL chamelium run type in kms_test_config.json,
sharing the existing chamelium-only.testlist between i915 and Xe,
and using driver-specific blocklists to handle platform differences.

Additionally, it improves testlist reliability by moving suspend/resume
tests to the end to avoid system hangs affecting main test execution,
migrating inline test exclusions to blocklists for consistent filtering,
and adding non-deterministic random-plane tests to xe blocklist.

v2:
-Update commit message

v3:
-Sort tests alphabetically (Kamil)

v4:
-Add detailed comment (Swati)

Mohammed Bilal (4):
  intel-ci: Move suspend/resume chamelium tests to end
  intel: Add Xe FULL chamelium run type to kms_test_config
  intel-ci: Add VGA chamelium exclusion to Xe blocklist
  intel-ci: Enable hdmi 4k resolution test in chamelium testlist

 tests/intel-ci/chamelium-only.testlist | 22 ++++++++++++----------
 tests/intel-ci/xe.blocklist.txt        |  4 ++++
 tests/intel/kms_test_config.json       |  9 +++++----
 3 files changed, 21 insertions(+), 14 deletions(-)

-- 
2.48.1

