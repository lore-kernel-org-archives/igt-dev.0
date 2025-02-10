Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B396C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 18:20:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5C4110E1E7;
	Mon, 10 Feb 2025 18:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwbynN6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B0C10E1E7
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 18:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739211636; x=1770747636;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tLp5eWOXTFVYDMB4rfMMJu53je5RcL7EzLVRYUVs0+A=;
 b=TwbynN6z5xcq0t8FyVJasGgTLUl2Ijc2qxZBkLMupqe0BdydSP4IuGui
 AeR7ehgjWrRG0ECxma4ohH79XqBofpN3/DCePbYpYkMi0XNrwPsgct6eg
 vdN2fO6QXuqj3OXLG9aXHVIG+GqZT17unvE9IMNaMedCn+7eatHessDUF
 dKTEjn6dRKYRQFZ8XMD4Md0WFRahNc8JyD+sjlSAuDvD0g3w8eC3R4hay
 /Ro9CJFFsAkmJBWnUl3h2NMJ3ctjRzl/oFpQc8UIZVNGR7mp/QqcY9l1c
 Voa/WAJNLYFmQnkBNkCFrrg+doZOD15hrBlfUj2ZWblBCs2YmYy+bmsFm w==;
X-CSE-ConnectionGUID: mXxOA4CKQUWFKGGiP4fP5A==
X-CSE-MsgGUID: xP+rNB3vQNeDviSEjLnS8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51236278"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="51236278"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 10:20:35 -0800
X-CSE-ConnectionGUID: kHWdaEt9TgSIOaBG2yCfRw==
X-CSE-MsgGUID: vWwyoNgfQ1K9tjfTLC22iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117288635"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 10:20:34 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/3] tests/intel/kms_joiner: Add a new test to validate
 non-joiner mode
Date: Tue, 11 Feb 2025 00:06:08 +0530
Message-Id: <20250210183611.1326980-1-jeevan.b@intel.com>
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
 tests/intel/kms_joiner.c | 58 ++++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)

-- 
2.25.1

