Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEAACA0EDC
	for <igt-dev@archiver.kernel.org>; Thu, 14 Aug 2025 12:49:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AFF10E883;
	Thu, 14 Aug 2025 12:49:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aD0WFoNk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B38A010E883
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Aug 2025 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755175752; x=1786711752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FgmbtqguvdNcH6TK+KUeXm2c1MfQMomARIJshULyhAQ=;
 b=aD0WFoNkiG0uVHjsXdxeTcuDWDRQhuTxUJolX8JESrsQipKjgYSbMPaQ
 BcjesnSnqR5HYc5hKQAaVWjRfykQZ0YNyB9TImj9q2z1MmXTDaXFSGkIX
 pVvJkzbsZ3Pq1bJswl8lZCxY1aj3FnR1EO7INVwU3lroSYTAOIVwKojfM
 E5/iTcu7+cd0K+/477dOGrOmjOjNnw4vcjJuqUx3DgNY22WNRxAFdUVRQ
 QtYEqivrVPzRsmZBvnqUw9IaIzJYrhJ/Msn2zDY5k6z9VCgWL9LxtjJZu
 EVz8Y7KQdU+gRT7b+qAhYhxyniO80RrCXexOlpM5lkz3Su9GuingvY63x A==;
X-CSE-ConnectionGUID: A5YdqnBjQAOY6U8r+K315g==
X-CSE-MsgGUID: e1lmnSlJT8yA35uiu7oYPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56697198"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="56697198"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 05:49:11 -0700
X-CSE-ConnectionGUID: 9YwPLE7vTsWnsv6gWMrIEw==
X-CSE-MsgGUID: uKkUL4xBS9eOy5yslipodg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; d="scan'208";a="197606002"
Received: from mwiniars-desk2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.100])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2025 05:49:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 0/5] tools/intel_vbt_decode: more updates to VBT
 definitions
Date: Thu, 14 Aug 2025 15:48:51 +0300
Message-ID: <cover.1755175663.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Bring in the kernel intel_dsi_vbt_defs.h instead of having a locally
maintained duplicate with almost but not quite the same contents.

Jani Nikula (5):
  tools/intel_vbt_decode: Split up DSI VBT defs to a separate file
  tools/intel_vbt_decode: Remove intel_bios.h
  tools/intel_vbt_decode: Add anonymous structs to group DSI VBT defs
  tools/intel_vbt_decode: Flip bta_enabled to bta_disable
  tools/intel_vbt_decode: Add missing DSI VBT defs

 tools/intel_bios.h         | 200 -------------------------------------
 tools/intel_dsi_vbt_defs.h | 197 ++++++++++++++++++++++++++++++++++++
 tools/intel_vbt_decode.c   |  40 +++++---
 tools/intel_vbt_defs.h     |   2 +-
 4 files changed, 223 insertions(+), 216 deletions(-)
 delete mode 100644 tools/intel_bios.h
 create mode 100644 tools/intel_dsi_vbt_defs.h

-- 
2.47.2

