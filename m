Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50ED2C4345F
	for <igt-dev@archiver.kernel.org>; Tue, 16 Apr 2024 15:54:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB5710F196;
	Tue, 16 Apr 2024 15:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EjXjfIq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32D2E112D2A
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Apr 2024 15:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713282855; x=1744818855;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JnzqH+Zd5yoKxLMSm54AXyCbHoa5cG/gEGYpozkE3OY=;
 b=EjXjfIq+SwIgicgLe4wjZb4BDSWVSK1OwcMEcznGj1YfR/hB7QUhxNfP
 veIBkllTlOsyyB6jOqGX9RkRBM3RCtPUPyfKJx0At1p+pEtrfbBZjH0CI
 9ZTl5umOCw3KuyY3J6Nc9p7l4knjU66aD3F+ltIEf/evofMsgLB+FSh96
 q0hZuhLR8XeVjEAFEloXHVS0Ja1klgpP72zvQzfqYzyRzOduEz5eheTnZ
 QCTB9j5eA90O0fmDdpt2yRVROENzEWRV0sijKa2WMDtUIoZFRYuYqc6r+
 NJUhm7lTWzwnVAK/7EMLMzRk4CxScheKIWprNVQDCSR4evPAR02sX8XYO Q==;
X-CSE-ConnectionGUID: dQbiumvWTVCFCXL52UC6mQ==
X-CSE-MsgGUID: GACRedXWS7657V8KqANPyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8858469"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8858469"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 08:54:14 -0700
X-CSE-ConnectionGUID: 1de8ojKIQquBIsig/AFm0A==
X-CSE-MsgGUID: 17BDe+/kQG+zjya4NzHOPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27099742"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 08:54:14 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v5 0/2] Update compression check based on platform
Date: Tue, 16 Apr 2024 20:52:05 -0700
Message-Id: <cover.1713325737.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In Xe2+ platforms, we need to run the xe_ccs test regardless of the status of
flat-ccs.
Check if the platform supports compression and has flat ccs enabled,
and if it doesn't, then update the check on compression
and proceed with the test.

Akshata Jahagirdar (2):
  lib/intel_blt: Add helper function to ensure platform has  flat-ccs
    enabled
  tests/xe_ccs: Update compression check based on flat-ccs  enablement

 lib/intel_blt.c      | 14 ++++++++++++++
 lib/intel_blt.h      |  1 +
 tests/intel/xe_ccs.c | 20 ++++++++++++++++----
 3 files changed, 31 insertions(+), 4 deletions(-)

-- 
2.34.1

