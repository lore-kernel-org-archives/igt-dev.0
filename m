Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E00C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 08:05:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53511138DA;
	Wed, 24 Apr 2024 08:05:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZKlKYquQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5695C1138DA
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713945944; x=1745481944;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qzwQpH6shgjKtUt0QH5O6fLNok/UOj+IR2JVsD/Mi64=;
 b=ZKlKYquQAZEYPFFnT9yK9eS2LvQjxlhA460uyNhlUL9/wpKf7uchmlVf
 l1pxvaqJNjiO5H/2dgqOix2FQTSdYssgXZ9uDB7BSxbAfQ9Hin2JUXxD5
 Cr8qpjOoOfWd2iGZJI/A5yK0u68+qvBGP2pXwvp0GaKgDvk6Q9ddpZD17
 H2A/whZF4OJZV+GDM8ARhr7iQi4/9armEB2OA7kJjqUW9N+6H5YJcr/id
 ZADb9aS2VF+rwVwn3a8mcNNzlWvATn5YLROoMCUfXsv5qMDKFR8z5Npdv
 1ibRyGcycVZfosqhMqVw/2MhAN9UCGGVHKNjHua02ENSjhJ9IYO82y1cm g==;
X-CSE-ConnectionGUID: 4Gy95nB5Q9GgRgQJB4tjng==
X-CSE-MsgGUID: mlJZwQ8LT9i7eYAxyXHhVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="9727082"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="9727082"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:05:43 -0700
X-CSE-ConnectionGUID: zxL/jxu6RMC/1Y10fSHqSQ==
X-CSE-MsgGUID: 2Wy0wkh5QuCG9+jYqQK2AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; d="scan'208";a="29096594"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 01:05:41 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Kamil Konieczny <kamil.konieczny@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Subject: [PATCH i-g-t v3 0/3] Put "Run type" highest in documentation hierarchy
Date: Wed, 24 Apr 2024 08:05:30 +0000
Message-Id: <20240424080533.3611723-1-katarzyna.piecielska@intel.com>
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

Let's put "Run type" at highest place in documentation hierarchy. It
will be reflected in html generated documentation.

v2: Make that change in Xe, i915 and KMS (Mauro)
v3: move only required fields under 'Run type'

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>

Katarzyna Piecielska (3):
  tests/intel: Put "Run type" highest in Xe documentation hierarchy
  tests/intel: Put "Run type" highest in KMS documentation hierarchy
  tests/intel: Put "Run type" highest in i915 documentation hierarchy

 tests/intel/i915_test_config.json | 66 +++++++++++++++----------------
 tests/intel/kms_test_config.json  | 56 +++++++++++++-------------
 tests/intel/xe_test_config.json   | 66 +++++++++++++++----------------
 3 files changed, 94 insertions(+), 94 deletions(-)

-- 
2.34.1

