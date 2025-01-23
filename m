Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297BBC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 17:34:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D47810E1F1;
	Thu, 23 Jan 2025 17:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koDm9687";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7BA10E1F1
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 17:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737653688; x=1769189688;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ULxO+7GbySLrrkPSagjp+snqVNcDBUtegMILJFg4PYM=;
 b=koDm9687BOEWjZmJxOUHfX1Dt8x95c8ef593C1h132rsXaSx8SXtqWZo
 VHta79jNuP4ihYr/T8xoJo6l6zigJLZ6XHAW2bEgGW4AAVqHJHC5K4vMU
 1sBtFIzdmpNa2yJPZNVTxTBN4RfyZU/2UNndr1LbjpeSn71b+BajcXxGv
 BDovx0J5ESaaEyC9iD4VAGPn8AYLQrwGaoA0UmAGc6b7AFDKcmldpADI7
 8+CNtyOGAwmGv7ZBvR7i8kjzST9XqtaHR9S3R4cXo6hZneDPv+zDTWWZH
 DtCSORV24Cyg6lW8SFdm2Kk0oaCSwjYBYxlOJyCUuRa+2q64ZzWEtpJfO w==;
X-CSE-ConnectionGUID: 13ovmRCMSjeszRIipqWKRw==
X-CSE-MsgGUID: 92/7tOqcSAiYmjWWswRVTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48758789"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; d="scan'208";a="48758789"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:34:45 -0800
X-CSE-ConnectionGUID: fJtOQ6GHQ9OksvEtxYJd9Q==
X-CSE-MsgGUID: vYZkmIj/QLS7Q9IjON/G8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107955120"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2)
 ([10.125.110.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 09:34:43 -0800
Date: Thu, 23 Jan 2025 11:34:36 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/xe_intel_bb: check multithreading
 rescans won't segfault
Message-ID: <vxlfzulhelvgvdwk4k42faads3imojdsj5vtka2sxu6qdoghqd@v5y7efkybzbj>
References: <20250123092210.48249-1-zbigniew.kempczynski@intel.com>
 <20250123092210.48249-4-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250123092210.48249-4-zbigniew.kempczynski@intel.com>
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

On Thu, Jan 23, 2025 at 10:22:10AM +0100, Zbigniew Kempczyński wrote:
>This test is likely only for checking purposes, it doesn't makes
>sense to merge it after series review.
>
>Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>---
> tests/intel-ci/xe-fast-feedback.testlist |  1 +
> tests/intel/xe_intel_bb.c                | 47 ++++++++++++++++++++++++
> 2 files changed, 48 insertions(+)
>
>diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
>index 0234d3e72d..7adb9a3436 100644
>--- a/tests/intel-ci/xe-fast-feedback.testlist
>+++ b/tests/intel-ci/xe-fast-feedback.testlist
>@@ -7,6 +7,7 @@ igt@fbdev@nullptr
> igt@fbdev@read
> igt@fbdev@write
>
>+igt@xe_intel_bb@multithread-open
> igt@kms_addfb_basic@addfb25-4-tiled
> igt@kms_addfb_basic@addfb25-bad-modifier
> igt@kms_addfb_basic@addfb25-modifier-no-flag
>diff --git a/tests/intel/xe_intel_bb.c b/tests/intel/xe_intel_bb.c
>index 845052bf26..5df009f9ed 100644
>--- a/tests/intel/xe_intel_bb.c
>+++ b/tests/intel/xe_intel_bb.c
>@@ -18,6 +18,7 @@
>
> #include "igt.h"
> #include "igt_crc.h"
>+#include "igt_device_scan.h"
> #include "intel_blt.h"
> #include "intel_bufops.h"
> #include "intel_mocs.h"
>@@ -950,6 +951,49 @@ static int render(struct buf_ops *bops, uint32_t tiling,
> 	return fails;
> }
>
>+/**
>+ * SUBTEST: multithread-open
>+ * Description: check device scanning when multiple threads are involved
>+ */
>+static void *__single_open(void *data)
>+{
>+	struct igt_device_card card;
>+	int fd;
>+
>+	igt_info("Thread: %d\n", (int)to_user_pointer(data));
>+
>+	for (int i = 0; i < 5; i++)
>+		igt_devices_scan();
>+
>+	igt_assert_eq(igt_device_card_match("pci:vendor=intel", &card), true);
>+	igt_info("Device detail: %s, %s, %s\n", card.subsystem, card.card, card.render);
>+
>+	fd = igt_open_card(&card);

can you point what test needs this? In this scenario, don't we usually
use igt_fork() for the tests?

Lucas De Marchi

>+	igt_info("Fd: %d\n", fd);
>+	igt_assert(fd >= 0);
>+	close(fd);
>+
>+	return NULL;
>+}
>+
>+#define NUM_THREADS 100
>+static void multithread_open(void)
>+{
>+	pthread_t pth[NUM_THREADS];
>+	int i, ret;
>+
>+	for (i = 0; i < NUM_THREADS; i++) {
>+		ret = pthread_create(&pth[i], NULL, __single_open,
>+				     from_user_pointer(i));
>+		igt_assert_eq(ret, 0);
>+	}
>+
>+	for (i = 0; i < NUM_THREADS; i++) {
>+		ret = pthread_join(pth[i], NULL);
>+		igt_assert_eq(ret, 0);
>+	}
>+}
>+
> static int opt_handler(int opt, int opt_index, void *data)
> {
> 	switch (opt) {
>@@ -1063,6 +1107,9 @@ igt_main_args("dpib", NULL, help_str, opt_handler, NULL)
> 		}
> 	}
>
>+	igt_subtest("multithread-open")
>+		multithread_open();
>+
> 	igt_fixture {
> 		buf_ops_destroy(bops);
> 		drm_close_driver(xe);
>-- 
>2.34.1
>
