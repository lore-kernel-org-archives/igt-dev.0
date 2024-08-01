Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75A9C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 14:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881BB10E995;
	Thu,  1 Aug 2024 14:39:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CMzYd7fV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFDB10E995
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 14:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722523149; x=1754059149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nmtzlg10Uy3g+mM02Veaim9IktPRelEdA54pToRWKGk=;
 b=CMzYd7fVRL//dFsOkV4PATro1IwpLvkGpGpfpGYC56KlIQeX+kLdQpCd
 XuOck7H4VqvvJalP0beQc0G34Iw7UCqiv4FFWeR/vydgkECECHtqdUJEf
 wDOOHV/bYzKibaLiDf03Ptv8v/doQJzHyfIESUZJj2gqD72Ypg6L9xQnL
 Qeb3giYbd4aXLyyqzqDito6xRSQQvm3/qQzy7PzaBv8OSIZAv6nayCERJ
 CHM+iZODgyQ2fX3TDcMOqHm2VpWKKxWfUxMZs5VGa2YkovzbaHIjLYTki
 r7TsjfTzJWbL0XSjL0J+A9gzaycB9kjTgDuhdKxWayvH8CVhWfSwZkrG7 g==;
X-CSE-ConnectionGUID: okRm4u8IQVuvtsCzPWLR8g==
X-CSE-MsgGUID: jamX9x7OT9iTGRD+txfJEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24343743"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24343743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:39:08 -0700
X-CSE-ConnectionGUID: pk9i9VNNRRuVf2m5JLUL/g==
X-CSE-MsgGUID: Xotdy2bQShuTZp2Jg+X6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59872780"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:39:06 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 2/3] tests/intel/xe_gt_freq: Skip test if 'freq0'
 node is missing
Date: Thu,  1 Aug 2024 16:38:47 +0200
Message-Id: <20240801143848.509164-3-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
References: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
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
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
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

