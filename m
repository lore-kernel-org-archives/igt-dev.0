Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA14CCCFA13
	for <igt-dev@archiver.kernel.org>; Thu,  6 Nov 2025 04:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DA610E805;
	Thu,  6 Nov 2025 04:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UV9yeGrg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E4110E0FA
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Nov 2025 04:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762404085; x=1793940085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uvSKW8V9q8OBJmBo2HClq6TKBwJtx0Osfd4nTAMZcC4=;
 b=UV9yeGrgNqR1BFUjJw6jPvHC4fGfpnqS09moYjQ1T5JOK0B7sMdOY0WZ
 S+T9vRlcwDxGlp5hiO3q5nZhp8xsaTFloYoCOikcsOLIoMShVVkiZ5fqJ
 NSRUIOAgsjru6531E/1CzMiOjflL08EtKx0Dspa9EIstxAgxHhxmp3h7L
 io93Yvl9tgvEF01yiXtWXv/fI+Xtebbyp9X9Jv6v5fbx83kZVA/jHcxMU
 YP5YXHPxaneVM3G/rQGRnLc8Mu0JspnpCvFxFUPjlVW7UoGTSFEgDBHfy
 iyetK6XTDJvFvXpsMzq+KqcYdJ+SYoD2oUT5MCnKMy7/RvTU40iXIZqc9 A==;
X-CSE-ConnectionGUID: 2Iu/7JVZSvWsuUJ1QkBe0Q==
X-CSE-MsgGUID: v+7tAqVkSzmO+2efkl1vgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="87161589"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="87161589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 20:41:25 -0800
X-CSE-ConnectionGUID: U8Xi3Ms5Sk+iU09+PhrkSw==
X-CSE-MsgGUID: ncVyTqakQoeHGhB833ir9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; d="scan'208";a="191750378"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:41:24 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/2] LRR test to start above midpoint for multi-mode
 panels
Date: Thu,  6 Nov 2025 10:11:01 +0530
Message-ID: <20251106044103.1502264-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251106044103.1502264-1-ramanaidu.naladala@intel.com>
References: <20251106044103.1502264-1-ramanaidu.naladala@intel.com>
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

Update the seamless virtual RR test to begin from above the midpoint
of the VRR range when multiple modes are available. This avoids
fallback to lower physical modes near the LRR boundary, preventing
unintended clock changes and ensuring stable VRR behavior.

Naladala Ramanaidu (2):
  tests/kms_vrr: Start virtual RR test above midpoint to avoid mode
    fallback
  HAX patch do not merge

 tests/intel-ci/i915.fast-feedback.testlist | 183 +------------
 tests/intel-ci/xe-fast-feedback.testlist   | 288 +--------------------
 tests/kms_vrr.c                            |  11 +-
 3 files changed, 34 insertions(+), 448 deletions(-)

-- 
2.43.0

