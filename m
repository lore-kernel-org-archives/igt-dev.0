Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034CCC48BC4
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 08:53:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920B310E61E;
	Wed, 14 Feb 2024 08:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SN+QxSf7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EFD10E61E
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 08:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707900799; x=1739436799;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fBHt3zOClR+AJIhcHzw+mtaEXQi9pgp2Uypa9FXjKxY=;
 b=SN+QxSf7wgt1zYyg1UXFqLsyZFMrVcj+1ujs2BuQlD7mzWcgP9QZL8xg
 VZqLRDuTLTvZIJFoXOzvt8FvFxX9+IzwrsSR3kK/6aZ53KwZElVKSsIwU
 5WDpf0dvOHM9xnBs/J0dDlVQih4iAbXZMggLjfrCC0fm8183w0kO+RDAt
 /was7y/IIA3F2sMxXMtkOJDg+Hfu4U3J9mZhgSipK+DU4/dTP2V7l4uKj
 htpFMB71U1Fg4XbXuzCFuVN5xz4gKgNSrDM4przQ2dROL+k31KwmdgfIh
 +5XGaf7RUeVPEitoc7866t5qsKTeD6RTLCweyv5mhyppoOwul87+S+fZO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="27382374"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="27382374"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 00:53:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="912053967"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="912053967"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmsmga002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 00:53:15 -0800
From: "Samala, Pranay" <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	jeevan.b@intel.com,
	pranay.samala@intel.com
Subject: [PATCH v2 0/1] tests/kms_plane: Reducing the execution time in
 simulation
Date: Wed, 14 Feb 2024 14:23:27 +0530
Message-Id: <20240214085328.2024-1-pranay.samala@intel.com>
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

Samala, Pranay (1):
  tests/kms_plane: Restricting number of pixel formats for simulation

 tests/kms_plane.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.34.1

