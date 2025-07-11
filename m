Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EE9C8303C
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 09:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C67D10E0B8;
	Fri, 11 Jul 2025 09:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/WQkCQh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CDB10E0B8
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752225650; x=1783761650;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ch0Wq4kXT/o+0ChZp7ZQXm5RGvXuVurlUHNy0aVTAZY=;
 b=l/WQkCQhW023thfs6jyUFtgY0ss+afe6fBD3zrZN+m41lgr0KmpSOK1/
 hbfewRVgKhwT7A0+D4hBcqyDRy6wvGLQoEuYyidiSnxIemgy01oLqoecs
 d2ktAqeOs+LhVVxM2IXubSvV/JORYVjsGYf3AH78lFFpKV3Vfb9b7SSO3
 0NpHYEOD4vDIzD1V22SwrHppIMzES1Yt7zgChL3ux9A0kjsLtB0FofQ3Q
 QRCgNk1zg+lTMkFLxV0Mzn7ha9MB05X7EFkDqxVXJdmPTZ7rR8Y4EyD6V
 zY8+BdkJwiDOd9Ag31WeWZRiTtq5kzWMkl2UOCob1PXloqmRgd1oxiAbT A==;
X-CSE-ConnectionGUID: LKrMgd8sTJS+sJ9a8CruMg==
X-CSE-MsgGUID: 03Pa6RtOSzyRJivJ6F8zdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="57133576"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="57133576"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 02:20:49 -0700
X-CSE-ConnectionGUID: 95x7+eiYT3GafLhbbAB6+A==
X-CSE-MsgGUID: et+xGgJtQvmZe7nn8jlcvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="155954729"
Received: from unknown (HELO jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com)
 ([10.227.90.91])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 02:20:48 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pipe_stress: Skip invalid pipe-output
 combinations
Date: Fri, 11 Jul 2025 14:50:40 +0530
Message-ID: <20250711092040.193732-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add intel_pipe_output_combo_valid check to skip invalid pipe-output
combinations which are not valid.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pipe_stress.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 296c93b58..a896c830b 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -578,6 +578,11 @@ static void stress_pipes(struct data *data, struct timespec *start,
 		if (!data->highest_mode[pipe])
 			continue;
 
+		if (!intel_pipe_output_combo_valid(&data->display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
+
 		igt_assert_f(data->display.pipes[pipe].n_planes < MAX_PLANES,
 			    "Currently we don't support more than %d planes!",
 			     MAX_PLANES);
-- 
2.43.0

