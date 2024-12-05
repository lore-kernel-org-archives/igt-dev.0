Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CC9E7716D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 14:04:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2311F10EE7F;
	Thu,  5 Dec 2024 14:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jqa5fhZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 077E610EE7F
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 14:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733407461; x=1764943461;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G12JP387nuqhJi+yf0x7yI4vknYeW/R6oqEAa6R7xD4=;
 b=jqa5fhZY7CkLd69UdbfXoKeHVxcyE35Gpg8i0TJXWNgV2MznNQeBrblL
 ZMoRvyDvpqwPPp9/dhMpfokcHk4f0GXFIONZu3zrZ1urG5tkgdHxc5VxN
 qk2u5HFDWWy9AMNfzC84g9kaEr8BbbNUhuws2yakTD/d4h7PGJwbx1C4t
 4flavn6F6ZCG2iH7MeCp7jnoABHccj7x0HKEXAMgfl1f5Z01C91yJ5z1E
 XswrZ+qYDMfbR0pAok9nEaLF3Eklvu2ZVKW+IY9v0vBGiOQVHTp2y6Y6C
 Olcre/rS5wgr77m++bgw3v03NAZSREn40hPBGRWLXXWXmHi3ybaPjI3vE g==;
X-CSE-ConnectionGUID: +5Lh4fP5QRWaLW3AkmhHug==
X-CSE-MsgGUID: DIhQLmNgT+m2v8Cq+DrftA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="36559551"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="36559551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:04:19 -0800
X-CSE-ConnectionGUID: Yf48lEp7RV6xvPCoRb7MFw==
X-CSE-MsgGUID: ogLJQXICTxa+MW7UFUtAGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="94179450"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.20])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 06:04:17 -0800
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mika.kuoppala@linux.intel.com,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_eudebug_online: Improve
 writes-caching-* tests
Date: Thu,  5 Dec 2024 15:03:51 +0100
Message-Id: <20241205140352.16822-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
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

- Remove repeated calls to caching_get_instruction_count
- Limit surface checking to each breakpoint that is after write
  instruction
- Fix the issue with sync between workload lifetime vs resume

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>

Dominik Karol Piątkowski (1):
  tests/intel/xe_eudebug_online: Improve writes-caching-* tests

 tests/intel/xe_eudebug_online.c | 39 +++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 11 deletions(-)

-- 
2.34.1

