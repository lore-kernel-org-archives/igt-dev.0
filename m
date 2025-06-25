Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A5EC7EE30
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 12:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D144810E104;
	Wed, 25 Jun 2025 12:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j2X1cOg9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8832110E104
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750853900; x=1782389900;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=azjYqaEWgwNjkSEnkAmFKfkbZz9eIbAzhYH6Ig0QnDg=;
 b=j2X1cOg9PNk6fw8e7lgckot9M6dH2Bh2e60xi2iiS+KSgGLqu4xQgifi
 eq5Ox0r29eg6RjspRgOvq8qmkIT/aT2ko7FWGvTULUU/1FdxGs62LMt2g
 o4kkRKr5ETE8r864hRKZqO9h8lCkMnx0RS0RAL+eIHU4IR0fitfl+FhHT
 WjAzsnUtTE3jkj+8iBZoSHwlYfoJ/8OWEx05chM0AqOv4TTDfXkmWRn9J
 5S9g8qTh9leaGJQIjMMFkf/5c8izUnHcHbi19W9km7cEj1MiD7rPgRbwj
 cF0rJjOwxiD8c48v/4NCrTBUMViIxZY5QUjulllViDXNU0wN0nGDBBivH g==;
X-CSE-ConnectionGUID: V4TmErUBS0ewCrEnnNxOMg==
X-CSE-MsgGUID: LgNT4u8WQiqSyB9j/YEBMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53260751"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53260751"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:18:19 -0700
X-CSE-ConnectionGUID: 7WkVF2czRlGzUARReK1O6g==
X-CSE-MsgGUID: nXzNW3KLQ6ayqfU7EATwqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151714778"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 05:18:18 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH 0/5] extend link training test cases for eDP connector
Date: Wed, 25 Jun 2025 18:03:57 +0530
Message-Id: <20250625123402.3929358-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

Rename kms_dp_linktrain_fallback -> kms_linktrain_fallback
and kms_dp_link_training -> kms_link_training.
Add support for eDP connector in both tests.

Note : On local testing eDP fallback is failing,
Seeing eDP/i915_dp_force_link_retrain as 1, so link isn't retrained
and fallback doesn't happen.

Kunal Joshi (5):
  tests/intel/kms_dp_link_training: rename to
    tests/intel/kms_link_training
  tests/intel/kms_dp_linktrain_fallback: rename to
    tests/intel/kms_linktrain_fallback
  tests/intel/kms_link_training: extend test for eDP connector
  tests/intel/kms_linktrain_fallback: extend test for eDP connector
  HAX: Do not merge

 tests/intel-ci/fast-feedback.testlist         |  6 +++
 tests/intel-ci/xe-fast-feedback.testlist      |  6 +++
 ...dp_link_training.c => kms_link_training.c} |  8 +++-
 ...in_fallback.c => kms_linktrain_fallback.c} | 43 +++++++++++++------
 tests/meson.build                             | 16 +++----
 5 files changed, 55 insertions(+), 24 deletions(-)
 rename tests/intel/{kms_dp_link_training.c => kms_link_training.c} (97%)
 rename tests/intel/{kms_dp_linktrain_fallback.c => kms_linktrain_fallback.c} (93%)

-- 
2.25.1

