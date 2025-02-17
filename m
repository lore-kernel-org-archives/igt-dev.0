Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A17C021A9
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 13:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB4D10E264;
	Mon, 17 Feb 2025 13:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYommIzV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5899C10E264
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 13:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739800771; x=1771336771;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VlYg/YfNtUWv+hHNGDnA9Te4GjJUPruv0EyLoGph39M=;
 b=LYommIzV2CjEtDi6TyMLr7EzqjTYKx3e/J9wnY2T+0qlrcXeRijtrGD7
 Ztvp5qiuv9whxsUXXzXtCnpXpscGeI8D1XKDDc0VV1CA0Jt+ooy1BuBfS
 h1dVY1ztz7e8vLKJ9I9GoBcAHIQy5ZVBMxKyBmH+ORYtt5p5xTTpAVtph
 sxVJyj1UbsGy7ooOnWrmJoubXeIU+1vacmtBLkbDC5N6SnNBDXvnY8xxy
 CjayGwaT3U4k3VS+PjrRGt7toKOl8z56uWhBB3c9SmiO+QHccwQeOSXan
 dDxK+5VlspBYYmsI2t0CvkyE8Hpe+ebe9XlNTXuZo5WsYqo9WFM0HCgnz A==;
X-CSE-ConnectionGUID: oWoqJb+YT/mRk1aImIC1oA==
X-CSE-MsgGUID: g8ZuelG/Rhej1G38TdAlbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="65836652"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="65836652"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:31 -0800
X-CSE-ConnectionGUID: 3ViLqKJmRseNoP53+Kc8kQ==
X-CSE-MsgGUID: Vslo52YnTG+a8v6bw6x8cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; d="scan'208";a="119128061"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 05:59:29 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@linux.intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 0/3] Add PMU tests to validate engine activity
Date: Mon, 17 Feb 2025 19:50:15 +0530
Message-ID: <20250217142021.951467-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. When querying engine activity
user must group these 2 counters using the perf_event
group mechanism to ensure both counters are sampled together.

Add tests to validate engine activity

engine-activity-idle
engine-activity-load-idle
engine-activity-load

KMD Patch: https://patchwork.freedesktop.org/series/144408/

Riana Tauro (2):
  tests/intel/xe_pmu: Add PMU test to validate engine activity stats
  tests/intel/xe_pmu: Add idle engine activity tests

Vinay Belgaumkar (1):
  lib/igt_perf: Add utils to extract PMU event info

 lib/igt_perf.c       |  72 +++++++++++++++++
 lib/igt_perf.h       |   2 +
 tests/intel/xe_pmu.c | 184 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 4 files changed, 259 insertions(+)
 create mode 100644 tests/intel/xe_pmu.c

-- 
2.47.1

