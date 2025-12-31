Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8A4EEB570
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 20:20:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4940410E8D3;
	Wed, 31 Dec 2025 20:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZHF1EWl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5805510E412
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767212413; x=1798748413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GWNiPPa5iUvLbcB/KqIgZRVqVrhCx5FzQF7wg17m968=;
 b=NZHF1EWlyBqfgOfDXpr1tWfKZVpVSGAZr58mH8+rMakSn6HWWOeAP8H5
 WaQaM7BRpYGsyCKhLb5n/8TPA/aeEcshqSAgNji2DhXapB2dXzOUVQqDR
 hHkMk41Xx7n54DIaVYaZUBN2Ro1vMEUBUzSwjh4JV0L8Qq/A3gDx3Axsj
 y7nB9MYGC25U3vmRKHWV1N+ozmHXPxOfmu0LCBrEjV7dyOFIACwO/kx5y
 CDCUXZ4eHeC8PsEJ0lj/oPVqGEEeC+9qqcHsiqFwXBpao9qPacC+bWO2m
 l5RUE5dSZdR6DYU/2TSEth0mkcEdIQeAVEBsr7HWpm9l13qgVuD31K2zV w==;
X-CSE-ConnectionGUID: ORX9TgHpRnK7LytrOyQ3iQ==
X-CSE-MsgGUID: jLsB+UReQoKQAGkvH89rHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68844913"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68844913"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 12:20:13 -0800
X-CSE-ConnectionGUID: ArFHdotSQ8C8V30hatvUPQ==
X-CSE-MsgGUID: 0knneL4rSASMYV4+SFdtnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="224998665"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa002.fm.intel.com with ESMTP; 31 Dec 2025 12:20:12 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH v10 5/5] intel-ci: add xe_pat pat-sanity
Date: Wed, 31 Dec 2025 20:20:10 +0000
Message-ID: <20251231202010.115619-6-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231202010.115619-1-x.wang@intel.com>
References: <20251231202010.115619-1-x.wang@intel.com>
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

Add the new igt@xe_pat@pat-sanity subtest to the Xe fast-feedback
testlist so PAT configuration sanity checks are exercised in CI.

Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index 15fce6a42..acff025fa 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -202,6 +202,7 @@ igt@xe_vm@munmap-style-unbind-userptr-end
 igt@xe_vm@munmap-style-unbind-userptr-front
 igt@xe_vm@munmap-style-unbind-userptr-inval-end
 igt@xe_vm@munmap-style-unbind-userptr-inval-front
+igt@xe_pat@pat-sanity
 igt@xe_pat@userptr-coh-none
 igt@xe_pat@prime-self-import-coh
 igt@xe_pat@prime-external-import-coh
-- 
2.43.0

