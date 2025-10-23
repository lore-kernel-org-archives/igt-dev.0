Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829CBCCD1BE
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 11:16:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A1410E3C4;
	Thu, 23 Oct 2025 11:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2Ja2yxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A61A10E3C4
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 11:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761218216; x=1792754216;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pBjz3BCz3EHdylr7Bcnk3UpnHp66NzMYsFZQ87oHVhk=;
 b=Z2Ja2yxHulnjR1QLinn7GDhmWZJLBMMzN4X9M3eM5JXenKAVxFaeyvwr
 cpAOoCWPxydaTeJRfYPhyY+u57NMHvgQL36SSvqSBGDvkpyEiWINVpFR2
 0ylEkTVhsaWvL4bmjxaqEHBK4xZCH2R3pwPeL1vPtzwNLVIQDJgM9NIMa
 GLJYg+aw7ngHk3h4rNmYrw6WCEJdUgrf1CsUrAxOp2xF8SkrCvsq9H+pd
 Y0j49lixfe7TXAFz7uox19YWlGt/LtFkf69XMkSoyqH9ZvmU0I8+GuhJg
 fHR7m7fwLUqdaRQgxzEOTPmmok43pfCb8hegxaaR3xWAnBjnsAWIoVGe2 A==;
X-CSE-ConnectionGUID: hhemoD3jSj20000OeCiDhQ==
X-CSE-MsgGUID: jcs9KxBnT4mVDkVvNAWj6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62593394"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="62593394"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:16:56 -0700
X-CSE-ConnectionGUID: PacZiqiYQw+INURt0n1XMA==
X-CSE-MsgGUID: UUo7aWQbR4W2/yiw2HpfPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="184200154"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 04:16:53 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, vinay.belgaumkar@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t, v2,
 0/2] tests/gem_ctx_freq: Fix frequency restoration in exit handler
Date: Thu, 23 Oct 2025 16:42:59 +0530
Message-ID: <20251023111258.2108907-4-sk.anirban@intel.com>
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

The exit handler was failing to restore frequencies as it was being called
after the driver was closed. Reopen the driver in the exit handler to
ensure proper frequency restoration.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>

Sk Anirban (2):
  tests/gem_ctx_freq: Fix frequency restoration in exit handler
  tests/gem_ctx_freq: Add null termination to sysfs frequency buffers

 tests/intel/gem_ctx_freq.c | 42 +++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

-- 
2.43.0

