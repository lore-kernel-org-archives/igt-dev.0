Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900DAC36010
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 02:38:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ACA10E7B8;
	Wed,  9 Apr 2025 02:38:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CGg4jw44";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D7710E7B8
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 02:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744166284; x=1775702284;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YdaE9jtQwXMbXML/W1MdOfqeg9S1/ed7U0HPI7IsOOo=;
 b=CGg4jw44R4WfVWafn1QR7L24GcKRLt/dnOB3I7mI0GTTt11W1N7bmUyQ
 3zhUgeLyr2fwl8bWFanYglBocnt2yABrk4pMNSghsh4Y4Z2LxKfhPj+7f
 tuTUL2+SsRA9D6goeQUk6ZajidrDybD8VnfjKSFqseaRkEH1hXXrUN//K
 O8dyNWk3yM/P/dCVlF8mJa16w84C7fADb5DFpB05Vh7BEoNSbkv9I4XBl
 LQDaaBQDW0BOCy3nfZgYqSP5AcJX7eLv1DzFhXe7HzRxxSR4CNi3o3bkQ
 vcATXW1yBuYyMMtfg33Ze2YQdHZxsPxULfMszLVm1kXe4VLIUWOfoa+Sb g==;
X-CSE-ConnectionGUID: d47iVnQrSZy3tJbMaLt9VQ==
X-CSE-MsgGUID: m09SEpedTzyUEf3AkvwWlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55807321"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="55807321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 19:38:00 -0700
X-CSE-ConnectionGUID: YBfbeV1USnKKiYvNXAFu6Q==
X-CSE-MsgGUID: RY8RDGfWQbmFhgJN07KTnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; d="scan'208";a="133653492"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 19:37:59 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH v5 i-g-t 0/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Date: Wed,  9 Apr 2025 02:22:16 +0000
Message-Id: <20250409022217.2292395-1-sobin.thomas@intel.com>
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

This test validates that invalid string inputs are correctly rejected
by engine sysfs write. It ensures that the property values remain
unchanged when invalid inputs are provided.

Sobin Thomas (1):
  tests/intel/xe_sysfs_scheduler: Add invalid string test for engine
    sysfs properties

 tests/intel/xe_sysfs_scheduler.c | 98 ++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
-- 
2.34.1

