Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3581125854
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 17:04:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C92210E906;
	Wed, 11 Mar 2026 17:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ExnJX7WM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D49110E088
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 17:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773248638; x=1804784638;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXg5dXdNf6x33KwUdKRg3Oh6TscNxytDgxI9khtqKvk=;
 b=ExnJX7WMUOD3ph2o+jFz8/JUJ1B6BUDvd/yKKbgf0AQQcV91l03eSe+C
 HLUW9/vIBu10LysZnkbhkg4i+N1xBo0Rbwro9U+Tp8hoEkj4n5TKRUKhm
 sPDN9iiz4n/zfDchN0eSC+8TlYaO1oBZbNqHyHf0iLXQ3lOcaX/DEQBZY
 tb6axhQNq8xmk+7Uyrve1d0ipKLMFPFGtAG45VzVTR2g/f00sUVf4So8H
 wulqVOG7ETIPaurVK1K71R0q7V+2HmhaM+OYSkX17hd2oZ2HLaJoFr7gS
 wXXQfAwXAtHeUvLOqAu/wX0x0nhU7yn3YGvic5nc8wJ7WrEgYMk2CPvxE w==;
X-CSE-ConnectionGUID: ITYsWS2kQxmo1/mp9LqQyg==
X-CSE-MsgGUID: ptWydSOWT02j2iHnPVi0rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61903501"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="61903501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 10:03:56 -0700
X-CSE-ConnectionGUID: xTTjgcUFTP+ugEweKZzJ2g==
X-CSE-MsgGUID: PdYoH7uqQh+gmAZyGG2uKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="218018113"
Received: from dut2084bmgfrd.iind.intel.com ([10.223.34.11])
 by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 10:03:55 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Subject: [PATCH i-g-t 0/2] Unify Batch Buffer Alignment and Introduce Aligned
 Buffer Mapping
Date: Wed, 11 Mar 2026 17:03:52 +0000
Message-Id: <20260311170354.475828-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series refactors the SVM userptr copy test and batch buffer
setup in test suite to use a new aligned buffer mapping API.

The first patch introduces an interface for mapping buffer objects with
platform-required alignment, improving cross-platform compatibility and
simplifying batch buffer setup.

The second patch updates the SVM userptr copy test to leverage this API,
unifying batch buffer alignment logic and eliminating platform-specific
address assignment and conditional code paths.

Nishit Sharma (2):
  lib/xe: Introduce aligned buffer mapping
  tests/intel/xe_svm_usrptr_madvise: Unify batch buffer alignment

 lib/xe/xe_ioctl.c                   | 40 +++++++++++++++++++++++++++++
 lib/xe/xe_ioctl.h                   |  1 +
 tests/intel/xe_svm_usrptr_madvise.c | 11 ++++----
 3 files changed, 47 insertions(+), 5 deletions(-)

-- 
2.34.1

