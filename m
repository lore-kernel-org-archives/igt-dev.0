Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CF3CCF9E7
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 17:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8FC10E24E;
	Wed, 25 Sep 2024 17:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kARCoaxN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7160410E24E
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727284274; x=1758820274;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iOmVIBz+eW0bVFjecGPQoQFbvr7LRzCRf3/9fcdfqy8=;
 b=kARCoaxNZGDkBU1knw5qdCNWMgGlUnVhyfb4ogrOD1FNMARl4ZXLq0K8
 pRL4M7BS+OE8Pni97v14k3U8fPrcn65HcbUNCBNmYxlN/1cY+jOpp8Lzz
 7pfQAXFNE3aYIWEl4vDVWj+BHwjTm0tATAd6EheIdNIkXH+kZW92eUzEr
 2URtS6KBdGdGHcC5qMKAfGp2+4tU8gee020omxUk3m/OD6sFjV4bbuwT4
 3FQPRA+0GC9YI+8zdAs1UKnmqKqhmmATfs7BNMnZcAvwf8j5Z8TkFdydW
 BI6KoOS344VZrwYsax3vZcRxfqiI3YzWsmdmyxR5Nh25PMPVwRd1d1B9X A==;
X-CSE-ConnectionGUID: RKmG0/6/SZ6dZtGbJTjanQ==
X-CSE-MsgGUID: 7iEFFZUuT5GAIVgp2xRy6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26502175"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="26502175"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 10:11:13 -0700
X-CSE-ConnectionGUID: 2wESlQ8wSIKDJTgCbSltsA==
X-CSE-MsgGUID: 6aqcKIojTn2lLOuOuKISCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="102672585"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 10:11:11 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v4 0/2] Async Flips with atomic commit
Date: Wed, 25 Sep 2024 22:40:35 +0530
Message-Id: <20240925171037.785305-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
References: <20240827061111.472460-1-santhosh.reddy.guddati@intel.com>
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

This introduces new subtests to validate async flips with atomic commit.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: subtests to validate async flips on atomic path
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 183 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 289 +----------------------
 tests/kms_async_flips.c                  | 143 +++++++++--
 3 files changed, 148 insertions(+), 467 deletions(-)

-- 
2.34.1

