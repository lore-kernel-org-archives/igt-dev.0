Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8FECFA452
	for <igt-dev@archiver.kernel.org>; Wed, 23 Oct 2024 16:45:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5343E10E17F;
	Wed, 23 Oct 2024 16:45:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bDj6qYQQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F50D10E17F
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Oct 2024 16:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729701949; x=1761237949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yH5sRaX4Z2Yy9Ha58rscH2nLyx3oh++mExcy6fZJQDc=;
 b=bDj6qYQQzAZSpkXRYpvvd8DM1hxUtP+JinXQ1m4MkepZVowWoD6yfbdV
 HUtxoDOX8FNclS5yb8r5glcl8AjAm/i/lASx0htNif7DoiDORBMUAUE37
 xwYzLATPTi00GBm0bFnTYLb0k5/9kBx+yCi+fV1/BsGzgZQ4QeMIE/kby
 6nlRh+n58v0kr8v7/oH/VcgD+AHksAGl3mzDczvXIIDk4bIeP3+Q1A3wL
 r7eemwYMHwIz0MGc+r3Ktaum/XFkb7I2ZwiNmEmaQvc1OEC8vTXo0oyMg
 IeO8QXveUYJKXf1/fDL4x5s6GPy0rmz8UcNZDUxNazDBmjWsLgrXciEal w==;
X-CSE-ConnectionGUID: svusqxX+QZCw9BJ5q1bGsw==
X-CSE-MsgGUID: BEi3EtgEQZejtuziZEOCOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40418218"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40418218"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:45:49 -0700
X-CSE-ConnectionGUID: oF7LDURLQSaBxoFmEgNf0w==
X-CSE-MsgGUID: tqZbxZN0TzOyn05lZSRDaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="117768087"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.27])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 09:45:47 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH i-g-t v2 0/2] rename drm_fdinfo into i915_fdinfo
Date: Wed, 23 Oct 2024 18:45:35 +0200
Message-ID: <20241023164537.83876-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
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

This test opens i915 drm card and will not work for other drivers.
Hence rename it to avoid confusion.

See also discussion at
https://patchwork.freedesktop.org/series/139451/
i915/drm_fdinfo: Quiesce GPU prior to running some tests

v2: corrected Tvrtko e-mail and corrected xe.blocklist

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>

Kamil Konieczny (2):
  tests/intel: rename drm_fdinfo into i915_fdinfo
  intel-ci/xe.blocklist: remove drm_fdinfo

 tests/intel-ci/xe.blocklist.txt             | 1 -
 tests/intel/{drm_fdinfo.c => i915_fdinfo.c} | 2 +-
 tests/meson.build                           | 8 ++++----
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename tests/intel/{drm_fdinfo.c => i915_fdinfo.c} (99%)

-- 
2.47.0

