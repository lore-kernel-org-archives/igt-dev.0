Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C5DC2D0CD
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 07:23:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B03810E68D;
	Wed, 21 May 2025 07:23:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jh3j0kwA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF9310E118
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 07:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747812189; x=1779348189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a2FCAcHh+YctKG3/DZVXZ6orDh7WkxPfeMUFOX9WEK4=;
 b=Jh3j0kwAk9Q1HcRXj46j/Tcu/B3/Sl2tp52cIwG5aMk2zRJpsmZyVelE
 kLsl2urn8c0GqEAwM34PfIXjiPaKrqSkKcMn6ni3PhuSxs8jS8H95Cy/s
 fYE43t5iMMMtam21BuHmUAatdBoBshn33uNUGo8sHxsjGwsaEiQzDCbZc
 rTAVSyKjyyHMGORD3gsIczNroTfQa7Uj7i1DvEfAQ/0F5C/qL9nz9Yzhr
 sHc+oK6vX8WoJv+WF+YGxR1X9Yfs2rwckNhTVDGtYItpPNEfjU5ZPBjLf
 W7jQUw8r9DNg/UgJC5Qenc+s/kv19rq6lzKubls8IhOZCwNMQtC3T7VUT Q==;
X-CSE-ConnectionGUID: 8bklUlegQDWMF8P8eroSGg==
X-CSE-MsgGUID: rAYHoxz+SfCSakoSjCsJIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53571289"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="53571289"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:08 -0700
X-CSE-ConnectionGUID: /FfjVs6GSiGE+8Co0Bbt5A==
X-CSE-MsgGUID: wypd6qFlSdKHXFZjM8BXDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="170943765"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 00:23:07 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, imre.deak@intel.com,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/5] Add DSC compressed BPP subtest
Date: Wed, 21 May 2025 12:58:31 +0530
Message-Id: <20250521072836.1400749-1-swati2.sharma@intel.com>
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

Add DSC compressed BPP subtest.

Swati Sharma (5):
  tests/intel/kms_dsc: Store valid DSC outputs
  lib/dsc: Add igt_force_dsc_enable_compressed_bpp()
  tests/intel/kms_dsc_helper: Add helper to force compressed BPP
  lib/dsc: Add igt_get_dsc_sink_compressed_bpp()
  tests/intel/kms_dsc: Add dsc-compressed-bpp subtest

 lib/igt_dsc.c                |  55 ++++++++++++++++
 lib/igt_dsc.h                |   2 +
 tests/intel/kms_dsc.c        | 121 ++++++++++++++++++++++++++++++-----
 tests/intel/kms_dsc_helper.c |  10 +++
 tests/intel/kms_dsc_helper.h |   1 +
 5 files changed, 172 insertions(+), 17 deletions(-)

-- 
2.25.1

