Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329FBE67A65
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 04:38:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B338A10E0C7;
	Tue,  3 Mar 2026 04:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VlCVeBPM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CBF10E0C7
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 04:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772512736; x=1804048736;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HjMDYcGEFP15KJG4mgR+b4u4ECTD8jdzp2FL4i3c6q8=;
 b=VlCVeBPMhMb1Sj7Q38/GEMAfNX2RqWe6smlq05/ZqKHU1u4MfcwWMt4B
 KusqFZeMIx4nRFbHt5HeK/BBCM01Q6kXagRMEGhUXzdWN0F5leRXhB0+5
 niaGHxztHYMe9hrsiT2DqQfPig0ZUTOJ7OJ4KlQO70BgJ3q+LjtuLCRTY
 bb5+0vYuSm4VmsuiEKcva0HqcgWbHOCX1rEsu2cFL5kO8yrPCOhFJIMAm
 PTCGpTfM+RM4koLifEKcNFmDtyVWISLtK8uBJWuCzQd9HFqHqygCido2s
 CUB/cGB3j//+ZLLSFa9w21BhETdRdwogV6f+f3HaC9yBBw2DSG94AVxgR w==;
X-CSE-ConnectionGUID: KKcN9EBFR9WwWUQqyMd/vg==
X-CSE-MsgGUID: HEK1OMR3QY6OjdwGkNjKEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="96148667"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="96148667"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 20:38:56 -0800
X-CSE-ConnectionGUID: Acxny5ITTBi6wowtzMTMmg==
X-CSE-MsgGUID: pzJdKIxWSQKmFelgW1wKiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; d="scan'208";a="244805079"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa001.fm.intel.com with ESMTP; 02 Mar 2026 20:38:54 -0800
From: priyanka.dandamudi@intel.com
To: zbigniew.kempczynski@intel.com, matthew.auld@intel.com,
 igt-dev@lists.freedesktop.org, priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 0/5] Add false sharing and XA app transient tests
Date: Tue,  3 Mar 2026 10:08:48 +0530
Message-ID: <20260303043853.1656156-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Add tests to validate XA app transient and false sharing.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Priyanka Dandamudi (3):
  tests/xe_pat: Add pat indices for XA App Transient in false-sharing
    test
  tests/intel/xe_pat: Use intel_get_defer_to_pat_mocs_index() to
    exercise coherency
  tests/intel/xe_pat: Validate XA App Transient feature

Zbigniew Kempczyński (2):
  tests/xe_pat: Add false-sharing subtest
  tests/xe_pat: Handle false-sharing on Xe3

 tests/intel/xe_pat.c | 341 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 335 insertions(+), 6 deletions(-)

-- 
2.43.0

