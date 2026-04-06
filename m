Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6C7EF4EC9
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 09:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DFF10E13B;
	Mon,  6 Apr 2026 09:54:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VRBRrAIZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E75910E13B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 09:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775469274; x=1807005274;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xDss9Dyq/UJkgGCY4UrmrbmeWsKYvF0R0wrwfMblsgg=;
 b=VRBRrAIZeQiME7rqhbxelVl28FucDlEz6wRAX3zYOagodLumwrwEnMmh
 Gl8xjkGGZBd+VX7er3wm/l/fF0pOsZHyP3meTpPKaWq2K/EAcEnGeK5ee
 Vf7Jp52xjl65+FkkxMZXkzYwcKU0pfR4Qv4jrnFYe8cD3GPmTsNaa2H/C
 4q8npotOFmaUoZ53a2LZB08uhED+apIHq6+MxefwutaTt1c3+IeIResD2
 ShEvLt9DvmIyCbSIi12prZsuiVP9lwcrJzUyhcjLV4JSFKzc9ldlRnmeP
 09FVbgKMZ9TwMUfgWmuECLnky4MKOnBPv/9uZ/6idWXWXBGoBLmPyipjo Q==;
X-CSE-ConnectionGUID: PMjwBJvmQpKueX82mBltrw==
X-CSE-MsgGUID: loq6T4b7QyWBfNsjKRHjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="79011519"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="79011519"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:34 -0700
X-CSE-ConnectionGUID: TKPZl892QoyrJOzpB2ArMw==
X-CSE-MsgGUID: tAemnSXHShKH4QbszA+t8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="231893885"
Received: from varungup-desk.iind.intel.com ([10.190.238.71])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 02:54:31 -0700
From: Arvind Yadav <arvind.yadav@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.brost@intel.com, himal.prasad.ghimiray@intel.com,
 thomas.hellstrom@linux.intel.com, nishit.sharma@intel.com,
 pravalika.gurram@intel.com
Subject: [i-g-t 0/3] tests/xe: Add IGT coverage for SVM madvise autoreset on
 unmap.
Date: Mon,  6 Apr 2026 15:24:05 +0530
Message-ID: <20260406095410.1274177-1-arvind.yadav@intel.com>
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

Cover full and partial unmap cases for both CPU-only and GPU-touched
VMAs, and verify that only unmapped regions are reset to default
attributes.

Test cases:

  1. multi-region-partial-unmap-no-gpu
     Set PAT=UC on 10 x 1MB VMAs, unmap 3 non-sequential regions
     without GPU access and verify remaining mapped regions retain PAT=UC.

  2. single-vma-full-unmap-no-gpu
     Set PAT=UC on a 1MB VMA, fully unmap it without GPU access, and
     verify the attribute resets to default.

  3. multi-region-partial-unmap
     Run GPU workload on all regions, then unmap 3 non-sequential
     regions and verify remaining mapped regions retain PAT=UC.

Arvind Yadav (3):
  tests/intel/xe_madvise: Add multi-region-partial-unmap-no-gpu subtest
  tests/intel/xe_madvise: Add single-vma-full-unmap-no-gpu subtest
  tests/intel/xe_madvise: Add multi-region-partial-unmap subtest

 tests/intel/xe_madvise.c | 412 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 412 insertions(+)

-- 
2.43.0

