Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE52E7719F
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jan 2025 06:32:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E25DF10E164;
	Mon, 13 Jan 2025 06:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoOH10oV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD2510E164
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2025 06:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736749920; x=1768285920;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ThVkdcRzoDHEOpr6dDIt0G4Grt9meP0gBPUTvO6KXgM=;
 b=CoOH10oV49T42zZjGXj1mCs/lk0jfiXuV4G018MnYY7b8sd94MURiJtr
 Raf/d2KLa6FdSFNErZKeDvlnVSnxArXrO16n/ViUmO7eY+io5D1Gpbqly
 kmz2ck9YXEArksDA11gMDKIQZtS9AB/yTln3QuX/evrOwAHE7oXJP8Mz+
 sPC2Ta1jb2XGiHdEkgefQdNYWNL4bvmbLFwY9wyKQVd93U5BTVoqKo3tR
 PjmjzcGADYVSHDn60tOreH8V2l2xpcOJPU9JiEO6YcpPYdBHJruiRqqTu
 Z2dzyX1+MepvFUMGl1dBcjhb1IySmMAh2Jswcj9qiHy511PtKHqBS2MGe g==;
X-CSE-ConnectionGUID: 6V1Sr5G3S22CtE8wcWNUEQ==
X-CSE-MsgGUID: FshLvRW/Tzq4BOJkmwDeTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="48411411"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="48411411"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:31:59 -0800
X-CSE-ConnectionGUID: PrMQ/jl/SXWnsID/0niRnA==
X-CSE-MsgGUID: 4ZVhg/TfT6O9hFAvRh/5GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="135260556"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2025 22:31:58 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t v3 2/3] tests/intel/xe_oa: Reduce the number of mmap
 reports checked
Date: Mon, 13 Jan 2025 11:49:48 +0530
Message-Id: <20250113061949.753864-3-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113061949.753864-1-sai.teja.pottumuttu@intel.com>
References: <20250113061949.753864-1-sai.teja.pottumuttu@intel.com>
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

Currently, 20 mmap periodic reports are checked which seems unnecessary,
reduce it to 10.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index ad3526406..cd081ecff 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4378,7 +4378,7 @@ static void check_reports(void *oa_vaddr, uint32_t oa_size,
 	uint32_t timer_reports = 0;
 
 	for (reports = (uint32_t *)oa_vaddr;
-	     timer_reports < 20 && reports[0] && oa_timestamp(reports, fmt);
+	     timer_reports < 10 && reports[0] && oa_timestamp(reports, fmt);
 	     reports += report_words) {
 		if (!oa_report_is_periodic(reports))
 			continue;
-- 
2.34.1

