Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9747FD339AD
	for <igt-dev@archiver.kernel.org>; Mon, 28 Oct 2024 17:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D498910E242;
	Mon, 28 Oct 2024 17:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E6IFgLid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0879910E242
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Oct 2024 17:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730137606; x=1761673606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kon9FMP0EKzKzxYgziBPrg+1PeIAu9BqyjxXRbsRfog=;
 b=E6IFgLidk6Nq0yCK6VZZtyHQv17ZXic6/FdglgB8+B9R89V12GVFyuP0
 v4RRBtSO8b0TRKBQFXbDP3KYKXLKheqvaYALAio8jFXpq7qgwgVDi7hd/
 4jjEYdgTywFMsfRRdNMQPao7fiVXSjVT+Si8PtbZoAw7JY6E7PsqunO2m
 Dj8a3vgT58VNlMW+3roSSv3bF/zvJ1TysRsTIZKYyFGVT7NfykDsx9jaI
 jeTl9oLeyjNaD0MCWBqdxvlWu6b/23MdwU/Nc2pn7J1iOqMOx0k8VyYav
 T+mDnKghGe4xQ3MFnpjZoCKp6NCi2ZnpxBXdkI7CpXbvSKsOKldXfu58k w==;
X-CSE-ConnectionGUID: tYoki3WbTDi1eUpryt93PQ==
X-CSE-MsgGUID: eyKd0/t/Rn+htlXqyGQX0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40846199"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="40846199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 10:46:45 -0700
X-CSE-ConnectionGUID: 63IIgjeFRSOx/sQp/OfcmA==
X-CSE-MsgGUID: YM945EARRl+iYj7K4f7YAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; d="scan'208";a="81584157"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2024 10:46:42 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 0/2] rename drm_fdinfo into i915_fdinfo
Date: Mon, 28 Oct 2024 18:46:35 +0100
Message-ID: <20241028174636.142662-1-kamil.konieczny@linux.intel.com>
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
v3: squashed patch 2 into 1, resulting in removing i915_drminfo
  from xe.blocklist, added r-b (Lucas)

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Kamil Konieczny (1):
  tests/intel: rename drm_fdinfo into i915_fdinfo

 tests/intel-ci/xe.blocklist.txt             | 1 -
 tests/intel/{drm_fdinfo.c => i915_fdinfo.c} | 2 +-
 tests/meson.build                           | 8 ++++----
 3 files changed, 5 insertions(+), 6 deletions(-)
 rename tests/intel/{drm_fdinfo.c => i915_fdinfo.c} (99%)

-- 
2.47.0
