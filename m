Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725DEC369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 10:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B8710E6FF;
	Tue, 15 Apr 2025 10:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MFcG9uyB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C8310E6FF
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 10:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744712115; x=1776248115;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Em0lw8RLxWjYK/Mf0UHlEwPENzUJ3DU4xArDkdkYQU=;
 b=MFcG9uyBwwRZCPt+GXI9/FgowHU59K3KvxOX0UAI4wybjk4OcVm5HfZP
 ifyQ9dsva6Ut8KV54xplPCEhjPuZkeEbz26R7QNAwEX6ITe2jmQnp2H7n
 UE3cUyNyowHr67l4cizfsJy8zJkdLgGq0BAtzVYUDI259LOzCNUg4PMXF
 TGzEAw3NwGMHrQXJI9K7GAvxTp2isZoXs9aOW9DUffjmYZaA6mA4+k/Ey
 Jpgq5aONW3DAarVWoKuT7iZwq9NrGLH9MdyretDd3fjmXBDRynl0Ceo4Z
 1iiLdQQGHReYaPnNzvHo2mU3QUKcRpE4xDKzYau4jWH1I/SF9TVxrpzCw g==;
X-CSE-ConnectionGUID: v6Fn8heMS/qbR06BfiSIVA==
X-CSE-MsgGUID: k54jwamGSF+3rRbdww9ESQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="45927043"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45927043"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:14 -0700
X-CSE-ConnectionGUID: Mq5WUXO+QcWRZjKw6s5p9w==
X-CSE-MsgGUID: xzSMwqKYQNOgqbCtvJbyWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="131059929"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO fdugast-desk.intel.com)
 ([10.245.246.8])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 03:15:14 -0700
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t,
 v3 00/11] Prepare lib/intel_compute for SVM/system allocator, part 2
Date: Tue, 15 Apr 2025 12:13:16 +0200
Message-ID: <20250415101457.141107-1-francois.dugast@intel.com>
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

This is a resend for CI because v3 was not picked by patchwork yesterday.

Francois Dugast (11):
  lib/intel_compute: Use common constant for surface state size
  lib/intel_compute: Use common constant for dynamic state size
  lib/intel_compute: Use common constant for indirect object size
  lib/intel_compute: Use common constant for binding table size
  lib/intel_compute: Use common constant for general state size
  lib/intel_compute: Use constant for binding table address
  lib/intel_compute: Compact memory map
  lib/intel_compute: Relocate input and output objects
  lib/intel_compute: Fix enqueued local size starting with xelpg
  lib/intel_compute: Use constants for thread groups and local work size
  lib/intel_compute: Make array size a dynamic parameter

 lib/intel_compute.c | 319 +++++++++++++++++++++++++++-----------------
 lib/intel_compute.h |   2 +
 2 files changed, 202 insertions(+), 119 deletions(-)

-- 
2.43.0

