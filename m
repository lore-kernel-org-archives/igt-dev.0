Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EC1E98E06
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 08:12:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1818E10E271;
	Mon, 23 Feb 2026 08:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OkoyR6OT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3FA910E26C
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771834333; x=1803370333;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wsO3V/lqQ6h5oa69fwbSQ7//9R+Z/fYGCSZPrzd4kFM=;
 b=OkoyR6OTzxQvGL03t2te7CZ1SOgsOfesHQziDY0qs5mkRD1ngNSaUREU
 zuK3kTqGptp7Q5+Q//s7+uoMpbNspEiNfZmQxF6mk28cOS1IS4G/RCLxi
 zGG2l3FFthbficPjPUEHvFfnL4jGyqPx4apGG8Q/sXOXs72RflHPixLyu
 EbzenngtnYy9tHP+aqMFPeDmidaQMl5CohWPowq4hVYnVIUdlabz0umc3
 ytz1pZT5OUFz0HzNcryNuCaCmQyWKM+9KSP9yi0c8X1m3DEctorpVzqKX
 oErLv/9SteeQyWwIM8JlMjFAxvAQhbkAbQB/gZVGcS9I2n4yNgusss0Ue g==;
X-CSE-ConnectionGUID: pvO4Vq2eSdiexIZgj2nWvA==
X-CSE-MsgGUID: ACIVQQmJRn+bMbdQ722B2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="75431406"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="75431406"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:12:12 -0800
X-CSE-ConnectionGUID: elH8NZL7R5iyIKCUbe/8Rw==
X-CSE-MsgGUID: wIztnzN8QXWLnodwDU1/1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215625111"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 00:12:11 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v2 0/2] Make pipe assignment joiner-aware
Date: Mon, 23 Feb 2026 14:02:57 +0530
Message-ID: <20260223083259.187783-1-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
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

        kms_pipe_stress assumed a 1:1 output-to-pipe mapping (pipe++),
which breaks on joiner configurations where one output may consume multiple
consecutive pipes.

This patch series switch assignment to igt_assign_pipes_for_outputs() and
map outputs by their driving CRTC/pipe. Skip outputs that cannot be
assigned and continue when at least one output is valid.

Store highest_mode as owned copies to avoid stale connector mode pointers
after output refresh. Iterate stress/setup by assigned pipe(output_by_pipe)
instead of connected-output order. Keep progressive modeset flow by
clearing temporary CRTC mappings after assignment.

Use min_t(int, ...) for source size calculations to start scaling from a
size guaranteed to fit in the FB.

Sowmiya S (2):
  tests/kms_pipe_stress: make pipe assignment joiner-aware
  tests/intel/kms_pipe_stress: Clamp the source size to the FB bounds

 tests/intel/kms_pipe_stress.c | 209 ++++++++++++++++++----------------
 tests/meson.build             |   1 +
 2 files changed, 110 insertions(+), 100 deletions(-)

-- 
2.43.0

