Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E27C44500
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 11:05:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B222310E02A;
	Thu, 22 Jan 2026 11:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7cwOm8u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC08D10E02A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769079920; x=1800615920;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wy8lfNSCOaV5utwybu1lFnhvSQAktGpbhP+yzSIpDNE=;
 b=d7cwOm8uojRVixFCqLkdG/m4VIdzuXptFy8Okga6/zqtAt0d5PuPHmGD
 NHcvvOqMTZRUpXTnvHwnJZZHFKpHEEt4DU6owTfsNOXBa1Z+Wacidofzo
 veKrW48q3v4QckSX3tVA38qEvDIgSAw2IeJL/ARZsY1JSxw/b1OckGnNr
 R4eMlvoi+WvvCZ2WeUd6OT1bBxI6HSXlGCMoetC+QMpa+TE3plZ21SCUC
 1bgzdCOvFiGNmTW4SwLHNpNT5/NkUhEu1O+Masn+GuaaRDUZdh2S33ldA
 iiz6sLwwiUbYb7f8KIKw+7AjBihYhpmXbE4mhHZ78+uRrq9Fcu1ByZgJ0 A==;
X-CSE-ConnectionGUID: dFMPtDccQpW7l1RsqtRCBw==
X-CSE-MsgGUID: cJPCyb0DQYyyscAHglaAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87896080"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="87896080"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:20 -0800
X-CSE-ConnectionGUID: 7PbDSon8SvSgsy0nuHBvIQ==
X-CSE-MsgGUID: +sk6+wgASEmpVPlXObVF5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; d="scan'208";a="237375535"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2026 03:05:17 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 louis.chauvet@bootlin.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t v5 0/5] lib/igt_kms: Helpers for connector managment
Date: Thu, 22 Jan 2026 16:33:55 +0530
Message-ID: <20260122110400.330188-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

Changes in v5:
- Rebase on top of current master branch 
- Resolve merge conflicts in lib/igt_kms.c due to new writeback and lobf 
  debugfs functions added to the codebase
- Add necessary includes alongside existing headers

Louis Chauvet (5):
  lib/igt_kms: Add a detect timeout value
  lib/igt_kms: Add helper to wait for a specific status on a connector
  lib/igt_kms: Add function to list connected connectors
  lib/igt_kms: Add helper to obtain a connector by its name or MST path
  lib/igt_kms: Add function to get valid pipe for specific output

 lib/igt_core.c |   4 +
 lib/igt_kms.c  | 270 +++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  |  18 ++++
 3 files changed, 292 insertions(+)

-- 
2.48.1

