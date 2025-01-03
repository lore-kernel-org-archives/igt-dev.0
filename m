Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B45E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 10:29:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A93CD10E86E;
	Fri,  3 Jan 2025 10:29:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKr0j/88";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF6610E86E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735900140; x=1767436140;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=F1k9zS8pq/HmjSD76K+GtK+LzZ4ygjEezMh2PXxdMdA=;
 b=SKr0j/88GRiC1zf4Xdz+ViozLH2mAKRZ2UZ6zQB6LscKcYIY+Y7/Etx/
 x1IqahIEJWqoRvqswxW3OOhY3h/8YfGIaSe6v25yOfauoUe4VHEloK8PD
 5oZvj0lUlB7eq9F6pH+1U2+BdmYinBu5RLuFfdIKur7nwhvpQvymc8/JQ
 V+P4kUONL6lgaV9pmwlhQKpaslWES0Kn/bruD7kTNnWOVDxLWf8ELQj75
 2j+BU09O62AfOeoxXuvWCg7Uwbrabjh/fmFI+aRG0r6ItcTd3ae8tknHW
 beI69nezqb3DEUAI+dCJRQP5m3T8M0kpHqs8uXqUCqkH7MJOS8rGHIAz5 A==;
X-CSE-ConnectionGUID: v214mN56R32ARKlGn0NgfQ==
X-CSE-MsgGUID: mssBsafWRPymjmGFp1N/7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="36027227"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="36027227"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 02:29:00 -0800
X-CSE-ConnectionGUID: Er8LI6OOQwePD7zOfV0M8Q==
X-CSE-MsgGUID: p+VDBBKIRROR7ebt5RYNYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="102240601"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Jan 2025 02:28:58 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_plane_scaling: Add logs to skips
Date: Fri,  3 Jan 2025 16:04:14 +0530
Message-Id: <20250103103414.10731-1-pranay.samala@intel.com>
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

Having some logs for test failures & skips would
make debugging much easier.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane_scaling.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index c8c9aee31..2a8867822 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1577,6 +1577,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 								       kmstest_pipe_name(pipe), igt_output_name(output))
 								intel_max_source_size_test(&data, pipe, output, mode,
 											   intel_paramtests[index].planesize);
+						} else {
+							igt_info("Unable to find the lowest " \
+								 "refresh rate mode\n");
 						}
 						continue;
 					}
-- 
2.34.1

