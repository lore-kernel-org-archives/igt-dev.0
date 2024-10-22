Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9659CD2CDFA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 16:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51CBF10E6C4;
	Tue, 22 Oct 2024 16:33:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JnWd8Eyr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A065410E6C6
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 16:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729614812; x=1761150812;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F73YVFkX28y/knukfa2a59jdAA3aNxJsccBGqmbJcq8=;
 b=JnWd8EyrrfgYtRSvaQ9ZkkqnbhQ4XwcO6VV1mQQytCUvqoSO2ZMDORzI
 oUElMLF8KnbRcOS37pbY3dDL8+MvuSrGFO06871tRzNgr8pNBL/AghNnT
 sLVJAoukzwTP8KKcZXA1mdD1aAE9P2VpohBvMv3ZS80F3IFKTdoeXVYBo
 OEFgrsFrGO7yhJ80BsuNZjorf8Db2Jq0YwDH9rNirmyPCuatFMNXb3zXA
 A1hls5xIKYHXF0aFK3FGypZCW48QHqUksd7I0kE9wY5ydGE/E4QX7gWyN
 QgaXal00pYs6AEb8XeC14ZY6iu6QX8vt5ksDhBo6vOHpCpU3qUYP/DDcD g==;
X-CSE-ConnectionGUID: DumRUf9USmaAqOyATfoqSw==
X-CSE-MsgGUID: ffktZIe+RVCwo+6QNfzK+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="40558844"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="40558844"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 09:33:32 -0700
X-CSE-ConnectionGUID: 1qG1bjkiR8qJKclIzc9PAQ==
X-CSE-MsgGUID: kTZWb/Y2R2KJV3pnzq/MPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79936236"
Received: from guc-pnp-dev-box-1.fm.intel.com ([10.1.27.7])
 by fmviesa009.fm.intel.com with ESMTP; 22 Oct 2024 09:33:27 -0700
From: Zhanjun Dong <zhanjun.dong@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Zhanjun Dong <zhanjun.dong@intel.com>,
 Peter Senna Tschudin <peter.senna@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t v4 0/1] tests/intel/xe_exec_capture: Add xe_exec_capture
 test
Date: Tue, 22 Oct 2024 09:33:23 -0700
Message-Id: <20241022163324.383145-1-zhanjun.dong@intel.com>
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
Cc: Peter Senna Tschudin <peter.senna@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>

Changes from prior revs:
 v4:-  Support runs on multiple GPU
       Load all devcoredump content to buffer
       Alloc line buffer dynamic vs static global memory
       Changed to igt_assert_f to provide more info if failed
 v3:-  Remove call to bash and awk
       Add regular express parse
       Detect devcoredump through card index
       Add devcoredump removal check
 v2:-  Fix CI.build error
       Add multiple GPU card support

Zhanjun Dong (1):
  tests/intel/xe_exec_capture: Add xe_exec_capture test

 tests/intel/xe_exec_capture.c | 365 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 366 insertions(+)
 create mode 100644 tests/intel/xe_exec_capture.c

-- 
2.34.1

