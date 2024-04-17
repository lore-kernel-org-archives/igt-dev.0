Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FA3C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF0F1135C3;
	Wed, 17 Apr 2024 14:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y/bATROn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D840B1135C4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713364782; x=1744900782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jZryLln9k7277dHy6DQMDi/xfFsBYV6UyIZDFSW9FN0=;
 b=Y/bATROn3jw2EDTNlZuUWdKh2kRT63xd9HAbPy68qFZ40YZEuATrpuN7
 m4LocSk9XOZGsupdigFI0qIHxT1GUYoTFdXhxiDd7kxNobLKJY+P45bj2
 vFL1zvs9rj1DKNkcDRUL5tqak0T1JKjc9lq88+HvcOtllot1kKO6JYW3y
 Z2WK6kNA1Lg2+SuJGDgvCZXleIAEhvVFZkRoPoq17p2pKzlHD3HwSH4vY
 Uxy3Uh4zDW/zMBfA6A16UPATHTWXkH1GUumeKzsQIMVzCxV0Ilm2en2XO
 tbaQUU2IZI1iji2tsyXvV5BYa3WDM+o/kwuudn8ghzRLJyo8Qj5upJxqe g==;
X-CSE-ConnectionGUID: EGas2t1iTiuXyIdn/eXoCg==
X-CSE-MsgGUID: 12uQRsJcTdiKvRTplAwTvQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9083657"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9083657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:42 -0700
X-CSE-ConnectionGUID: a3dFk8m9R3aHoV5N4UVIfQ==
X-CSE-MsgGUID: MvgfHGs/S2elssDiiCJYyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53859890"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:40 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 3/6] tests/intel/kms_pm_lpsp: Force joiner support in
 bigjoiner checks
Date: Wed, 17 Apr 2024 20:03:22 +0530
Message-ID: <20240417143325.720515-4-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
References: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
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

As we recently introduced the option (through debugfs) to
force the bigjoiner, needs to extend the support in bigjoiner
checks to handle the force joiner.

Cc: Kunal Joshi <kunal1.joshi@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index a76b423f4..f9ac508fb 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -163,6 +163,9 @@ static bool test_constraint(data_t *data)
 	mode = igt_output_get_mode(data->output);
 
 	/* For LPSP avoid Bigjoiner. */
+	if (igt_check_force_joiner_status(data->drm_fd, data->output->name))
+		return false;
+
 	if (igt_bigjoiner_possible(mode, max_dotclock)) {
 		for_each_connector_mode(data->output) {
 			mode = &data->output->config.connector->modes[j__];
-- 
2.43.2

