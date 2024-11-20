Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A19D743EA
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 22:29:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A191210E114;
	Wed, 20 Nov 2024 22:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fc1ccvvr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FD310E114
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 22:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732141747; x=1763677747;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+mOp7UecEDb4qrDNtOIeDvTXSJO7D5meTlMsEtbc/Cg=;
 b=fc1ccvvrrLd93ffHoRrYXp57jNC4+rhfTbPzol+aE0GtEjzDxz19ni/N
 aK9nTSfC2ThdcI6+tLPkA5YHOsxqfkRR9atRB/FiMkBdehiMEWVbf3Sz6
 9gJ7lCEaRQ7FHNVzPgQIJZGGYzzsHbEG0cJUQ1SqGyjzGIwXEQ/KR5jmE
 ucgLEipVuNANiGgBd/48Thaibg/Acdkrl84XoolEeX7KOAdu142LjzGyq
 1QitlinDtuzL6yJXQny6rJPcMJDul24CgKJqNREFEOkBBhzKUOXpyaQKV
 gtRWxXAxL65yIZDi7o/sNxx5LtcfWJ39rPbSjyj65ncO79VVsqDo2bdkI g==;
X-CSE-ConnectionGUID: aA8wLRT+TyiFA8/LUWVNgQ==
X-CSE-MsgGUID: +V4j669PQ+SI7qwQ3imGpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="54727914"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="54727914"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:29:07 -0800
X-CSE-ConnectionGUID: oZw7M1F+QxOMaosPcP0V5w==
X-CSE-MsgGUID: XfJvrHUjRYC4sANfVe+3oQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="89850270"
Received: from art-dev-395.igk.intel.com ([10.102.138.231])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 14:29:05 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.grzegorzek@intel.com, jonathan.cavitt@intel.com,
 matthew.d.roper@intel.com, Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/3] tests/xe_eudebug_online: update thread count handling in
 query_attention_bitmask_size()
Date: Wed, 20 Nov 2024 22:28:47 +0000
Message-Id: <20241120222850.1497784-1-jan.maslak@intel.com>
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

This patch series adds a helper function to lib/xe/xe_query for looking up 
the values of hwconfig attributes and updates the thread count handling in
the query_attention_bitmask_size().

v2: Added hwconfig to xe_device, so that its value will only be queried once,
    cached and later used by the helper function.
    Added proper commit messages.
    Fixed stylistic issues in the code.

Jan Maslak (3):
  lib/xe_query: add hwconfig to xe_device
  lib/xe_query: add xe_hwconfig_lookup_value() helper
  tests/xe_eudebug_online: update thread count handling in
    query_attention_bitmask_size()

 lib/xe/xe_query.c               | 72 +++++++++++++++++++++++++++++++++
 lib/xe/xe_query.h               |  8 ++++
 tests/intel/xe_eudebug_online.c | 12 +++++-
 3 files changed, 90 insertions(+), 2 deletions(-)

-- 
2.34.1

