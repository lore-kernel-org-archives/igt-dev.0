Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EFBCAC58F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 07:40:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640A510E2BF;
	Mon, 15 Sep 2025 07:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8pS9P+s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FCF10E2BF
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 07:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757922047; x=1789458047;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SYCPFSxek6b2L6os4kedFK88gJt4gAIvinwnosNC/cA=;
 b=l8pS9P+sIqhFxJnNmipp8ur53yAhYSztFQVnMPa8oYgSVv0O+PTavBSj
 Q9lgLcnY2/t9zi6F50UE5Y6QD2HNOtaM5HQ8gMfxO5JLKZw5d1WS3aHst
 Jy+oudFi2Ob5k/qPw0r9J1PHA3RHblMfQ105p9xLNi6fmwvrEx5l8UBU+
 B2phkmI6uHNZ+opQ6PqrnN5zabiBHs+04IYQnANyK7ECTS8Ox4qCc04La
 8RBYZfmfMiFW2i5LMbNFF00FsETIhwKpnMumys4Nd3HXlEhXBZfNAF2Kt
 6OYQ3qVahFJyL5RFmADYthO8No0Z1P6yojOyS0cmcj9PrchRRQaam/zX2 g==;
X-CSE-ConnectionGUID: Xw3H+PwkSb+rEvk3R+WSyw==
X-CSE-MsgGUID: zJtPaLt6SUGCIkEXPIjK7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60233862"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="60233862"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2025 00:40:46 -0700
X-CSE-ConnectionGUID: w6NsHNYdQ1yQhmH6sVFW4w==
X-CSE-MsgGUID: ZJ2OMnW1REqKgR+ZOFslOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="173687262"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by orviesa006.jf.intel.com with ESMTP; 15 Sep 2025 00:40:46 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH i-g-t v2 0/1] tests/kms_concurrent: Check for SYSVIPC 
Date: Mon, 15 Sep 2025 13:02:30 +0530
Message-Id: <20250915073231.2093842-1-s.sebinraj@intel.com>
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

Check for System V IPC support in kms_concurrent test to handle
targets that don't have it enabled in their kernel.

Without this the test fails in systems that run Android or the
ones which doesn't have SYSVIPC support.

Snapshot of the error:
CRITICAL: Test assertion failure function msgqueue_init, 
	  file external/igt-gpu-tools/lib/intel_allocator_msgchannel.c:66:
CRITICAL: Failed assertion: msgctl(queue, IPC_STAT, &qstat) == 0
CRITICAL: Last errno: 38, Function not implemented

S Sebinraj (1):
  tests/kms_concurrent: Add SYSVIPC support check

 lib/igt_core.h         |  2 ++
 tests/kms_concurrent.c | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

-- 
2.34.1

