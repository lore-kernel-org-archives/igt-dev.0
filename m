Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7CCEE49BD
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 05:55:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4550810E83B;
	Wed, 31 Dec 2025 05:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="It9BXd9x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D748810E8FD
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767160530; x=1798696530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o0BWhhF+GCxChDALz+DTrRNPrO+Byy4RDAyq+fxturo=;
 b=It9BXd9x4MMwVoHmJPpQ5K6qxquTk6lHOhmgcwq+NfmyKdE7Vrb5zn8r
 GBkDqVirjBkVzcN/622GCewneiCbjV/0NT5wk3kLQCEy0azGKvigTvK27
 9LffYy1kmgiVKzTqPrgRaAkFx8JM/lkmRp70BcPL3l8+DdDufWrbNIMwZ
 PITKzF0UPZUebzNgPUxC9uZI+FfQZfVS79t2Wm+FSlxCCwutKdFrqD4nr
 WJmAaQf85yDtBihhJnCkedtNYdjE33EfA7j73Xlj0TAyv9VLtCkPJ/ITF
 yH+z5KimgWJjZ61pGQCgsU7HKOL4chV5n+EFXCjvHYinrhqpvxdt//ogA A==;
X-CSE-ConnectionGUID: owcAIMEaSLKncdF3pmSGVw==
X-CSE-MsgGUID: i3WKVk/1RoGzjSGAmYEjBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72590003"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="72590003"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 21:55:29 -0800
X-CSE-ConnectionGUID: f7+lZVm7Te6Cfv354aHmCw==
X-CSE-MsgGUID: PpT8Im4NScue87NdV033Ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="201119716"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 21:55:29 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>
Subject: [PATCH v9 5/5] intel-ci: add xe_pat pat-sanity
Date: Wed, 31 Dec 2025 05:55:25 +0000
Message-ID: <20251231055525.51524-6-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231055525.51524-1-x.wang@intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
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

