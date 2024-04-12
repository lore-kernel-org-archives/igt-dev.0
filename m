Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43632C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 14:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA0410EB98;
	Fri, 12 Apr 2024 14:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jwjqCcb3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AA8C10EB98
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 14:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712931741; x=1744467741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qO1mmTudFPecUeT/4g8oISUAP6zMn8H9cBtoOhrsKuw=;
 b=jwjqCcb33s2gCHeymcEOdYm15CE7SrqNdOiqd0rOBFqhKPIX2Zp/7W+T
 HrJl3TqrToBubqbhm+ZZitajdIUPkwucchtqWbXuClmbe5378o66Asj98
 HAWVDoxvUypmBrWd6V2cYwGhp5rhnUKans9PeNjqbE/hLVQ+ZNRaB4h0u
 URwE2hd0IQOzORoFBZKzIZxAhxuQxQckUBsb4wuBIZnKEGuXkdp7i4bdG
 XbvFWrRE7Lu/Zd5609NUkHqNi6u3eGJwKQq4UVQEUIKtwVFKspK/GaCBs
 59DDhduPXR89UeFUhz9psGiY7h7DcND4eV3pWx3hrCERRAUoMqmN0HmcH A==;
X-CSE-ConnectionGUID: 0HdmGrSvT6alnLWcxK+sQQ==
X-CSE-MsgGUID: hVZ7nX6JRNaHg823jo+FKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25840421"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25840421"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:22:20 -0700
X-CSE-ConnectionGUID: YizslvHQSH2NsKJgQcF2Lw==
X-CSE-MsgGUID: FdpWfT7BSZeNxiQiiauDFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21313801"
Received: from dovchinx-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.251.215.7])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 07:22:19 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,v2 0/3] Align Xe header and restore some uAPI flags
Date: Fri, 12 Apr 2024 14:21:56 +0000
Message-Id: <20240412142159.6-1-francois.dugast@intel.com>
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

The first 2 patches align the header to the current version in
drm-xe-next. The last one brings back some tests now that the flags
they depend on are also back. The matching kernel series is:
https://patchwork.freedesktop.org/series/131790/

Francois Dugast (3):
  drm-uapi/xe: Align header with drm-xe-next
  drm-uapi/xe: Define topology types as indexes rather than masks
  drm-uapi/xe: Restore flags VM_BIND_FLAG_READONLY and
    VM_BIND_FLAG_IMMEDIATE

 include/drm-uapi/xe_drm.h                | 27 +++-------
 tests/intel-ci/xe-fast-feedback.testlist | 10 ++++
 tests/intel/xe_exec_fault_mode.c         | 65 ++++++++++++++++++++----
 tests/intel/xe_vm.c                      | 16 ++++--
 4 files changed, 85 insertions(+), 33 deletions(-)

-- 
2.34.1

