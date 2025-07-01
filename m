Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B56C8302F
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 11:01:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EB5110E588;
	Tue,  1 Jul 2025 11:01:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYy+8UOo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0406610E588
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751367716; x=1782903716;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KxHkFcBI5eqFfcmg4+A1omkKToCriZ7WoLt0JmvQvQs=;
 b=QYy+8UOoXx6x5FxFl+RlBBS6XrU4Gplvnz+i8CVKbOKA+iBSHP6LpeHl
 SbxM1T1A54wCXXhdiHD6znlue31aM6rkSqhgICx/7xDbXKsDiV93CzLec
 JH65VOSj8iiyu5icE98hJ8mIoQShmLiXAxX/uSN7ZivLG9xYWWWrexAAY
 GV1RSSjeDLaQBr366N1WGQTWvkMCEpIyAbpHiV44srCc0WROvNhKOUVzX
 o+vWm2BjAZkcwsgNZoGkQiqEMxvJfyca5CcYSmZ6lzVN4ahWwp+j64AL+
 o4XveJ3/6oyzz2ThjgYHnXB+UE8e0clUkGKfjnax4AMEK38/uMqy78ukQ w==;
X-CSE-ConnectionGUID: ob9aK2tjRqeW6uimhMDtQw==
X-CSE-MsgGUID: qcCsmKACRby+xWm/ecswAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53751021"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53751021"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:01:56 -0700
X-CSE-ConnectionGUID: wDF6jQGlTGOe+apji2kHeQ==
X-CSE-MsgGUID: blTaLRUuSrSlL6clMVLOVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="184785785"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 04:01:54 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, uma.shankar@intel.com,
 mitulkumar.ajitkumar.golani@intel.com, arun.r.murthy@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Relax link reset and frame rate checks
Date: Tue,  1 Jul 2025 16:31:47 +0530
Message-ID: <20250701110149.395301-1-ramanaidu.naladala@intel.com>
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

Improves test stability by adjusting pass rate to frame rate and
removing link reset assert to avoid false failures.

Naladala Ramanaidu (2):
  tests/kms_flip: Adjust pass rate threshold based on frame rate
  tests/kms_flip: Remove assertion dependency on link reset retry
    condition

 tests/kms_flip.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
2.43.0

