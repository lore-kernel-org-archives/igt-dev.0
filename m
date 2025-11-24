Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA56CCFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 04:28:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5055210E05F;
	Mon, 24 Nov 2025 04:28:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GMtr5PxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC5C10E05F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 04:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763958513; x=1795494513;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=plMf01D5BxoLRyIjudN46nVqbRbUcpuQAu/UYRAvRCI=;
 b=GMtr5PxFQ4bDgRDeYYXK2XsncbcmjjIQj57/m2MRjdnm+k+FCZRQm6H/
 /vG6DNPR9TlkvZBIgaTKppnGeXevS7r9CzXQcWW4W3iiOaNoBQPHV3AFg
 uyESjRoOpgxiqi5x6tPckoFWiVaB9v/iPVk+dc6DEQV0uqFs64uRFAehh
 llF8d4UKvJqi7FwlY5MUcOqI6p/IE/YinH/aPqgNvqJap/GNFIihXG6mC
 fYDNoVHsnrkrDDz/UoJhgEJey3TfLwLb/mcxx62SjcUO6MarZimI9UQ6D
 n1d5QHha1GO5U8soTEn5lXvnWA7A+uuPaHrfGxybF0jQV0qLe2QIimzOl w==;
X-CSE-ConnectionGUID: 3IAbIvXtRbuBNdXZw3y8sQ==
X-CSE-MsgGUID: SWzn07NrTgik4Z9fHoCjpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76565267"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="76565267"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 20:28:32 -0800
X-CSE-ConnectionGUID: KejUm2cTR5W4Es53MtNBiA==
X-CSE-MsgGUID: V2qvZdT2TDaDoJ55nCULcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="191891396"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 20:28:32 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_exec_system_allocator: Added 64k
 alignment support
Date: Mon, 24 Nov 2025 04:28:20 +0000
Message-ID: <20251124042821.283623-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

The original test for madvise split vm only supported 4 KB alignment,
which failed certain hardware such as PVC that required 64 KB page
alignment. The test has been updated to include support for 64 KB
page alignment.

Sobin Thomas (1):
  tests/intel/xe_exec_system_allocator: Added 64k alignment support

 tests/intel/xe_exec_system_allocator.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

-- 
2.51.0

