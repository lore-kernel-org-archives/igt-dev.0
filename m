Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F9ECCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E7D10E2F8;
	Mon, 10 Nov 2025 19:25:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Om1PSEfg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4AC10E489
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802717; x=1794338717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eZcrZWnvZgZ5JMIIGSnnjxkmIajjGUl9IOj5BV4/AJo=;
 b=Om1PSEfg8EJTOWIS5NavlnJdkACB+MskriLznap5cPgy+ycX9rLYJwcO
 46QUz+Uucm8q/PfgVgKISbvVugZKLd8Xqbx5WtfbMVKxI2M3XjxjNcDMN
 fQZoQYFccS6NZ0H2wfmlY8CQHEAM2uBd7WM/eJCCmV67eoAgFS4OhC8/S
 6rURKodowkcLJ5e8T9IU25JxZ9w2B2XuG6O+QndxvbZ6HGcFgu5dl2w0k
 nIeyTpYevG7lmQcwfP2RXApOvYN7Rv1S/aoMK1L4fCY7URQJsvjQytsrw
 yKoBFxqFIwB6XDXWM9Sr+JgqOa2suXyw5P/r6dsPXPozd5p+Tj9YpneCD Q==;
X-CSE-ConnectionGUID: nfp9zVNxTb2LBfcRqsOhPQ==
X-CSE-MsgGUID: TFGfgkrHTpyLLZ5/CcVh2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900266"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900266"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:17 -0800
X-CSE-ConnectionGUID: 2Y/xWx+DTnm/mM2skTZ0Xw==
X-CSE-MsgGUID: Csg9aKkNQIGdVKskFugKWg==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:15 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 7/8] tests/intel/kms_psr: Skip FBC tests on BMG platform
Date: Tue, 11 Nov 2025 00:54:53 +0530
Message-ID: <20251110192454.44385-8-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110192454.44385-1-mohammed.thasleem@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
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

Skip FBC tests on Battlemage platform as the feature is not supported
on this hardware.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_psr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index f062d184a..105104be7 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -719,6 +719,11 @@ static void test_setup(data_t *data)
 
 	igt_require_f(data->output,
 		      "No available output found\n");
+
+
+	igt_skip_on_f(IS_BATTLEMAGE(data->devid) && data->op_fbc_mode == FBC_ENABLED,
+		      "FBC isn't supported on BMG\n");
+
 	if (data->op_fbc_mode == FBC_ENABLED)
 		igt_require_f(data->fbc_flag,
 			      "Can't test FBC with PSR\n");
-- 
2.48.1

