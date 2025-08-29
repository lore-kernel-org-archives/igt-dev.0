Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591E6CA0FF7
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 10:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B0410EB78;
	Fri, 29 Aug 2025 10:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ciTVGsMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5647310EB78
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756464045; x=1788000045;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iTFw46tMUx00qh2CcZEv6vlMEg/7OpvaMUs5AE4mgys=;
 b=ciTVGsMSZqGfjdB/gLYqR4b4L8HbkRg1J6CPiE5CEWx9Ydg8iIwdQjXO
 XooV7MhqaW8U9ZtvSlIR/MlETrxgFWmV3CK2UpgD5vJtI/TVNsHGVzYiD
 lWIHFAjbDwIKNjfbOow8uJSDB+WR6lgCW7GWt2Y3zuriO4ywh1btIBhsa
 omTQI8ddrDsxoou+parwRNJpmtKOa204IjgIxyN6aDCbyiXBQ0TErmZKs
 mm9b6nTAxWms9Ql1h5Ab0WdZFq6ltHvfjTjcp1xiOJ4/RImdxTCUSAJVf
 FrGxu8Colxn6FBkxbRw0KnTD7NcWhyv8MIhYE/fN7PbVxj1k685+GsXvg w==;
X-CSE-ConnectionGUID: NS6NWeqzR5q7mAIix+dJuQ==
X-CSE-MsgGUID: 3ycZ9ojETFW2/yfxj2RyMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="76200883"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="76200883"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:40:44 -0700
X-CSE-ConnectionGUID: xZt4dpjcRRKVDkVhUApQ3w==
X-CSE-MsgGUID: XGCNylp5S5GppFLhToP/lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="169917636"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.112.195])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 03:40:42 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t 0/2] xe_sriov_flr: Skip non-MAIN GTs when reading
 provisioning data
Date: Fri, 29 Aug 2025 12:40:35 +0200
Message-Id: <20250829104037.649426-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

Provisioning information (GGTT and LMEM) is exposed only on MAIN GTs.
Non-MAIN GTs (e.g., MEDIA) do not provide this data, which previously
caused spurious skips in subtests.

This series:
 - adds a generic xe_gt_type() accessor 
   and a convenience xe_is_main_gt() helper,
 - updates xe_sriov_flr to restrict GGTT and LMEM
   provisioning checks to MAIN GTs.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Marcin Bernatowicz (2):
  lib/xe/xe_query: Add xe_gt_type() and xe_is_main_gt() helpers
  tests/intel/xe_sriov_flr: Skip non-MAIN GTs when reading provisioning
    data

 lib/xe/xe_query.c          | 40 +++++++++++++++++++++++++++++---------
 lib/xe/xe_query.h          |  2 ++
 tests/intel/xe_sriov_flr.c |  8 ++++++--
 3 files changed, 39 insertions(+), 11 deletions(-)

-- 
2.31.1

