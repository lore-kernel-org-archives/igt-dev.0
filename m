Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4834C54E5D
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 14:16:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE1B112E60;
	Tue, 12 Mar 2024 14:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQgvMBz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE181112E60
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 14:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710252969; x=1741788969;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NhaZheHfCyz1/PgBULxh+DVWoGfYV8DClKYswM1fuJI=;
 b=GQgvMBz7vpWf7cYW+TFQjNJCKy9EvXTd1mUAaR/FbOZN9b0vgbbECPMO
 OT6vhY7GGgJtWIITO97TXla5ieWOO0/RNWeFFZdA3kL3H5DuGeRkGzZpY
 gq725JwZJcwEY8FeawmnyvSOIG1hxs/TKYkGty2AO6Q2C4sz9ZKskXbno
 Nl7lsklqK3h5FvvDMRvWhXB34GGG2tU81yag1kJ1mpkJIKYJpxsOrQfGW
 iApWpuv/ojvtBbqNRk7Vc+2K1mPhLPRzahIcpou7XN+XgihUgVgMWLNJL
 tsL/OlQcHm4oQW4NLqoAMVzgqDtNZH1PQM8xCSV92iOz4c9qoya7D9mhW w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="5133461"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5133461"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; d="scan'208";a="11522087"
Received: from kdec5-desk.igk.intel.com (HELO localhost) ([10.102.138.203])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 07:16:01 -0700
From: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v3 10/25] tests/intel: Introduce Flat-ccs subcategory
Date: Tue, 12 Mar 2024 14:14:04 +0000
Message-Id: <20240312141419.1277931-11-katarzyna.piecielska@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
References: <20240312141419.1277931-1-katarzyna.piecielska@intel.com>
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

Let's introduce flat-ccs subcategory.

Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
---
 tests/intel/gem_ccs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 3442ecfd3..e6257aeac 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -20,6 +20,9 @@
  * TEST: gem ccs
  * Description: Exercise gen12 blitter with and without flatccs compression
  * Feature: flat_ccs_mapping
+ * Sub-category: Flat-ccs
+ * Category: Desktop \ Server
+ * Functionality: block-copy
  * Run type: FULL
  *
  * SUBTEST: block-copy-compressed
-- 
2.34.1

