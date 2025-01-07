Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344F2E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53F810E79B;
	Tue,  7 Jan 2025 20:56:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KnGfZ6aX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A04110E79B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736283375; x=1767819375;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=D5gkyu0XhvqIncnDc/fayNVxWsyqPM9GZGiCw9yCzu8=;
 b=KnGfZ6aXrleNZbHWi6woP4VxKA+D76IifsQhURqOxGzOw5GifJ9bUxIx
 TuJwJIAxvkKjWSuN9xOeWVQuj2SbTlHMgVNlpa9sg/jPt1Axwhgk6uSF2
 yeQzawylobrGgWbLo98EAuT7NIhC9I1shPDvXX93LDzDOG0WiTgR8sKu0
 fT05rbrx9dEKe+K0iD6B/RLm/VoBod4KJjvRUg7q6UpFOzAKIDpJZywW/
 7pb0NUkRvT3AeWknKMLHn/SChvcJAGjxrhAd1Av6FJIT97nN145xBZ9Me
 bhSXgI0DjVT6VcNDknA31QclzgLeNOjlxLOn5j7KavLCWgL1zEXzawbXv A==;
X-CSE-ConnectionGUID: cwn77aUOQS6khoG/Lra0bQ==
X-CSE-MsgGUID: Xqy27/jLRW2n3955SakCAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36707004"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36707004"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:56:14 -0800
X-CSE-ConnectionGUID: KFfv0OJ1RzGK5Sl/VvdGBg==
X-CSE-MsgGUID: afPvFOFjSyyApGk/GRC4JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103727718"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:56:13 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 0/3] Remove redundant hotplug detection assertion
Date: Wed,  8 Jan 2025 02:24:31 +0530
Message-ID: <20250107205434.969797-1-ramanaidu.naladala@intel.com>
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

Remove Hotplug assertion from chamelium edid test.

Naladala Ramanaidu (3):
  tests/chamelium/kms_chamelium_edid: Remove unnecessary hotplug
    detection in EDID test
  tests/chamelium/kms_chamelium_edid: Add connector check before plug
  HAX patch do not merge

 tests/chamelium/kms_chamelium_edid.c     |   6 +-
 tests/intel-ci/fast-feedback.testlist    | 171 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 276 +----------------------
 3 files changed, 12 insertions(+), 441 deletions(-)

-- 
2.43.0

