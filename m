Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E454ECF856D
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 08:45:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A239210E7D1;
	Thu,  3 Oct 2024 08:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gNWQNGOg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A4710E7D1
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 08:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727945127; x=1759481127;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IeMU4NhbeE5FbKB46l4ZF5oe5pw13wk033Pjv5TI2PA=;
 b=gNWQNGOgzKz1IcRrwMB4cHWHV1AMzTJh2laQ9IKtLMzjOSPHetRWb3hw
 q9JdeaWo/pkTmzfvWgvoztewjTz10qitP/8B8+LFpcUsnxAYwCmFs7wOB
 waDfAauqgzl7jj8/NQf3dIvtvPuA+I51+744XASodIq9gJurhdqCrQfNe
 E8SK1uZwlfN3Ox2iBRJuhPu3UgzMoiuJQ86sFXupPZAqGgC2uOG/OexSe
 dHGKcE8KbAJOcDR+WqSXZ+eDf7ele9Jrw7DdaEcb6OV5utgpX7Cj48IfR
 pyHDaUzEug2avpuF5HOghSY6GUxV7D8Eqv5gZLQf02A7r6AokkxsRlx3/ w==;
X-CSE-ConnectionGUID: 9kKcSjrhQryXtxJB/BoK0w==
X-CSE-MsgGUID: uvcgWCkVTeK1nHX0+jD3xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="38489068"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="38489068"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 01:45:27 -0700
X-CSE-ConnectionGUID: 097HPHtjTO2lXuq5Z3kAWg==
X-CSE-MsgGUID: DGWcKZFRSGaD+h4akLQ/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; d="scan'208";a="78828274"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 01:45:24 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com, arun.r.murthy@intel.com,
 vandita.kulkarni@intel.com, karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] RFC Use the list of async modifiers using
Date: Thu,  3 Oct 2024 14:14:18 +0530
Message-Id: <20241003084420.2547152-1-santhosh.reddy.guddati@intel.com>
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

The new rfc igt changes are wrt the below RFC implementation in KMD.
https://patchwork.freedesktop.org/series/135884/

The idea is to consume the new property exposed to user space and get
the list of supported async modifiers.

Santhosh Reddy Guddati (2):
  lib/igt_kms: Add support to get list of async modifiers
  tests/kms_async_flips: use in_formats_async to get async modifiers
    list

 lib/igt_kms.c           | 38 +++++++++++++++++++++++++++++++++++++-
 lib/igt_kms.h           |  9 ++++++++-
 tests/kms_async_flips.c |  4 ++--
 3 files changed, 47 insertions(+), 4 deletions(-)

-- 
2.34.1

