Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E00C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:28:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B183D10E8F1;
	Thu,  1 Aug 2024 10:28:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S61Q948Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964A810E8F1
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722508086; x=1754044086;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jRCJlqGka18qZ2HJTUv45ArUW9le1QOZEVJUq/xMy9I=;
 b=S61Q948Zhj/3xmDl+7xN+WoZM0OWHlKZIqyfVC3qQFrhk3RrwB9w0J7u
 uCaR57U+iCSMyQWcM4hOMtDUdfsGIvIyqEEBOdW9NwAB7tWzaceuVq0FG
 4ed4GBN6/CGgooVr5eTcSCChWki1H1jgFbaKCmKXSe2AYB5EXojy/Nxtc
 w9yCiUNg0+RwDTHoJLQLpAqJd1gtOYqz8CGoWkfnRgD/puyF28RRLoKsW
 JLUZA5Janb6JmAg0eLCLI3G1xvuQMhedz4sgkZb9DySk4coKDuw/A31+F
 +48h5dG76Ezfx1Ow8CqOyEbXBoY69gwTp7pR8twKV1gOb2EYtz4VML1m6 w==;
X-CSE-ConnectionGUID: 8+s1iMRQQMuLD2/ut66Agg==
X-CSE-MsgGUID: FkJrIX8RRtuAwv7UKCwjAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24244537"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24244537"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:28:05 -0700
X-CSE-ConnectionGUID: bvkzB0bBSlWGTZjaIapwXQ==
X-CSE-MsgGUID: ZV3kXfdZTXG1ytJQbtoTEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54967075"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 03:28:03 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 2/3] tests/intel/xe_gt_freq: Skip test if 'freq0'
 node is missing
Date: Thu,  1 Aug 2024 12:27:47 +0200
Message-Id: <20240801102748.487160-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240801102748.487160-1-marcin.bernatowicz@linux.intel.com>
References: <20240730164232.286232-1-marcin.bernatowicz@linux.intel.com>
 <20240801102748.487160-1-marcin.bernatowicz@linux.intel.com>
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

Add igt_require check for 'freq0' node to skip frequency tests
on VF devices where this node is not present, preventing test
failure.

v2: Use "node" instead of "attribute" for more accuracy

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 tests/intel/xe_gt_freq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index c9d59508b..397007ebe 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -437,6 +437,7 @@ igt_main
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_XE);
 
+		igt_require(xe_sysfs_gt_has_node(fd, 0, "freq0"));
 		/* The defaults are the same. Stashing the gt0 is enough */
 		stash_min = get_freq(fd, 0, "min");
 		stash_max = get_freq(fd, 0, "max");
-- 
2.31.1

