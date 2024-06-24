Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3259C2BD09
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 22:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113E310E22B;
	Mon, 24 Jun 2024 22:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCQOd6tM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C75A10E22B
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 22:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719269140; x=1750805140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g6LGp2tR5onTgpvWRLPVgSmL+tzoXXjGxIvyLnIm2Ic=;
 b=DCQOd6tMuPlpCIm6vjeP3bDIGw+hf63GSm7yKrXdPg1YjDrZRbUrLtQ3
 NgxDSna9y8GgH5v9BU2Ex06mr/qs4FYLCD0kymT1VFL2nUc26b+GnB/ic
 PLcCpMLLwelBRf+9NjkNs3zIA75RKYlIwVeMdyFMEdrlAC/7oPyEx6D9s
 e9Rg2w3SSBwyYk6ud4PGmDU9y7n9c1t5xWCyCF0RxXFCNUANDtGz5LSAv
 mq5Q8N3wd8T8x9N0Okgsi/20+a9psMq1swWmVpHYz0PJGRSA0zSSGLxMJ
 QbVpmvpwu/6a6PuCD4kZMHsZ9xSzDVJcy1rbS5o4MNhDhJfu2Luyw/UV5 g==;
X-CSE-ConnectionGUID: cpCcV2YQSc2n1FsergE8AA==
X-CSE-MsgGUID: 6Y1Qnk3sRf6PPRXfOW1F3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16407082"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16407082"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 15:45:39 -0700
X-CSE-ConnectionGUID: 8hzv/NWaSmWVpCwrBqhv/g==
X-CSE-MsgGUID: ur39dx9sRvueCIz65dkIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="44099396"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by orviesa007.jf.intel.com with ESMTP; 24 Jun 2024 15:45:39 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH i-g-t v1 0/1] xe_exec_capture: Add xe_exec_capture test
Date: Mon, 24 Jun 2024 15:45:36 -0700
Message-Id: <20240624224537.3239118-1-zhanjun.dong@intel.com>
X-Mailer: git-send-email 2.34.1
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

Test with GuC reset, check if devcoredump register dump is within the
range.

Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>

Zhanjun Dong (1):
  xe_exec_capture: Add xe_exec_capture test

 tests/intel/xe_exec_capture.c | 206 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 207 insertions(+)
 create mode 100644 tests/intel/xe_exec_capture.c

-- 
2.34.1

