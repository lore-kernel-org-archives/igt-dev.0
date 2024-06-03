Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AD2C25B76
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 07:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9F3510E2E4;
	Mon,  3 Jun 2024 07:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PXPeJaa4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAE510E2E4
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717400249; x=1748936249;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=zm2xMnchWoPuLcgPBe6rg92St+RWPuUm022Adbxu9/4=;
 b=PXPeJaa4wanCyy0evpk/a7WNxsn94gQtCF2NMEUbp8hFVJmM/XuiQwL0
 pbvdPlRPC7a+JBwUgYck+G32uDcHYv5UBPZcZ6KDFqN1UxiVU3WnY/8lN
 xJ7eaDq7H2VhcWnpgYwYhPb6/iSi5Hek556u+g1r6FdeC+eZvEtYGzUJZ
 g09fW3ZRe87wkyk9BsIovCMBgKKJjVjwzMLqXzNuIi+9nGEVhtuNqxv0E
 iR42zXB+FFCcWZhM/pJmd0l5adYUuFTOGwxm51PhY7UlGKLShfM1vfhp1
 iU4tbUwLnnVba0KD6JrHEhMKlQEBtmxko7rR0HiRi1KLaLRE339Kiqrdo Q==;
X-CSE-ConnectionGUID: 0Ojkkyy8StWNVtBfXCmNAg==
X-CSE-MsgGUID: 7jNWA6D8RbqAXCZ8jvFBVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24535136"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="24535136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 00:37:28 -0700
X-CSE-ConnectionGUID: ZbRM6yraQ9u3yK1tq8Blng==
X-CSE-MsgGUID: juYlI4KsQ024z7WFi5FJkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; d="scan'208";a="36694838"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by fmviesa007.fm.intel.com with ESMTP; 03 Jun 2024 00:37:26 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 Melanie Lobo <melanie.lobo@intel.com>
Subject: [PATCH 0/2] Support for RGB16161616_64B compressed formats
Date: Mon,  3 Jun 2024 13:19:56 +0530
Message-Id: <20240603074958.29586-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231010134540.28485-1-melanie.lobo@intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
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

Support XRGB16161616_64B and ARGB16161616_64B compressed formats

Melanie Lobo (2):
  lib/intel_aux_pgtable: Library to add support for RGB16161616_64B
    format
  tests/intel/kms_flip_scaled_crc: Add support for RGB16161616_64B
    compressed formats

 lib/intel_aux_pgtable.c           |  5 ++++
 tests/intel/kms_flip_scaled_crc.c | 42 +++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

-- 
2.17.1

