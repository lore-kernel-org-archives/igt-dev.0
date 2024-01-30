Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A5AC46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:28:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B3D11238B;
	Tue, 30 Jan 2024 05:28:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6552B11238B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706592504; x=1738128504;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=A4zvRdSTIMhs5XIngKGWejw2dhyJlDGrMKX5aqYKYsM=;
 b=g0wZ04RgbUloH1u4F+r4tIEJ0oBPq3ovGGvYKJgSDHP7qdmyY/GzceeX
 MJuAtymt807noJd1SREh4/YuUq+D3feNlBEzwVrGRio3FAm8cVsCUOjwo
 +eBoF5qD0q2hZwj+fCt5+Z53UV7xN5N7QZfxdUttMpxzZHxKGyn6eojTc
 yz52K8FDt0xypL5HKY5sVEluUkIGPEbRRH1P//NOgsp4QnZogRBmYCKc0
 64LFPh3w8aFOjNgrSznk2eyKj+8TTurDySxfCOpazvncAXxXOZ19H1OGp
 ZtbZ3kDAGqangMM0f0Q26hrP2zN1jkWevOQ0zf7YXX0KBDgwkbvycbHjA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="434351193"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="434351193"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:28:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="36382589"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:28:22 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] make display test dynamic
Date: Tue, 30 Jan 2024 11:07:54 +0530
Message-Id: <20240130053756.1478286-1-kunal1.joshi@intel.com>
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
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

currently kms_feature_discovery@display checks for number
of display from 1 to 4, make it dynamic to check from 1 to n
also reducing unwanted skips.

anyone who needs to check number of displays for a particular
config can check kms_feature_discovery@display test result.

Kunal Joshi (2):
  tests/kms_feature_discovery: make display test dynamic
  HAX: please do not merge

 tests/intel-ci/fast-feedback.testlist |  2 +-
 tests/kms_feature_discovery.c         | 36 ++++++---------------------
 2 files changed, 8 insertions(+), 30 deletions(-)

-- 
2.25.1

