Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D949BCD343F
	for <igt-dev@archiver.kernel.org>; Thu,  7 May 2026 12:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F48810F092;
	Thu,  7 May 2026 12:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dJbzsg9C";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C039B10F03A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 May 2026 12:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778157347; x=1809693347;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=gDvtVWTltl11vGWqPJWhtsm6oi4HKauzk2myGHD/GDs=;
 b=dJbzsg9C+mrsM00GBWPtnaUMFu8yymM1J5NIVaqJnrNwi1n7fj7fMBYv
 bfW7KM1vdkv1lloodKSl+H2VIl8BjPI8dAwIohKr0qH68Iic7SG7eO2Fk
 2DEtFy1TGSPp2DvgRtUrKKrq5PVsGmzsO/r7n7ZLb7waFPZ8hP/2GSmuy
 7+zyB3Gov3AhDsqHYlYNuQR5w/iLOrTonvYjuomi5PNBZyUBwq10126iV
 34hTPknSaxFtODIavQve12MwlYkLRRZmk6RaxOTfrjyVWHiIted3vgmvc
 +ttiY0PfD3nvLL74DkZ+3OyaSY442CAY6yWmHQpvDbSchlKijUbUipB2y w==;
X-CSE-ConnectionGUID: zDph2oLoTOiGDPkwKlj8YA==
X-CSE-MsgGUID: h7aGs59NSoS9AbtAqVXm6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="81674969"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="81674969"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:47 -0700
X-CSE-ConnectionGUID: oehK+ECvQLilqLzLp5h37g==
X-CSE-MsgGUID: IIFbC9XhRtmIK1qVLsDURg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; d="scan'208";a="236716832"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 05:35:45 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 07 May 2026 14:34:18 +0200
Subject: [PATCH v2 2/3] lib/igt_sysfs: protect errno from being overwritten
 in igt_debug_on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-add_timestamps_to_logs-v2-2-9591e90e0a6a@intel.com>
References: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
In-Reply-To: <20260507-add_timestamps_to_logs-v2-0-9591e90e0a6a@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Ryszard Knop <ryszard.knop@intel.com>, 
 Stuart Summers <stuart.summers@intel.com>, 
 Jari Tahvanainen <jari.tahvanainen@intel.com>, 
 Mateusz Grabski <mateusz.grabski@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1636;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=gDvtVWTltl11vGWqPJWhtsm6oi4HKauzk2myGHD/GDs=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBp/IbUxZCCTC1FKegjlIpPNtdXKsewMwM6loDsM
 78mITcqh1aJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCafyG1AAKCRAjYrKT3hD9
 149hC/42cDoX97s71GEWSia2XqGi1BtYjg0sODLnEusXmtTs1WgnbeYGSM96RT5EovUk8lxfKov
 w1Vig707udPfgV82Hl8lqKbM4rKWzFuGjfmR5Fawuq31tpDFVWhyTwmMqkRxjwtEs2TaaEdT93H
 TZXizUEGRzGUWZBSahGSouTA69bwNv6sZXcFxe7HiP6TxUtkLQVjmQ3omE4p5auaLbf/xkZtfJW
 NrcqoV0ffENRkmZd3LWZ026MmE0KK0yD7E1Chl/s32EfAjqL8upGM9JSDShqy7YH94a3b4XeiPt
 7CJg5MlWErB+Lm4Bmt+1xkoBGlAzdtu95fFURU9e30wD9MVYKvwAUebTWXL0cjMNF3wiAsH4SBB
 +w+1OgpW+7WA0to4oiwo6P01+WXJm/ykhMoNq7LJ1cXVuERVIL9tXcGp8nj+qyS7otPHhQ0f4l4
 42x3DOFOPKS+JlYdr8aDW4Ln/GGkKFdH+tOM3QF3zjq0uHBasAkxdHjzmtOVcQ4N2QZUU=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

If openat returns error errno should be checked immediately, otherwise it
can be overwritten by subsequent call.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/igt_sysfs.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 3646dbacb6cb..1ea77b01cce6 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -542,6 +542,11 @@ void update_debug_mask_if_ci(unsigned int debug_mask_if_ci)
 	}
 }
 
+static int wrap_errno(int ret)
+{
+	return ret >= 0 ? ret : -errno;
+}
+
 /**
  * igt_sysfs_write:
  * @dir: sysfs directory
@@ -561,9 +566,9 @@ int igt_sysfs_write(int dir, const char *attr, const void *data, int len)
 {
 	int fd;
 
-	fd = openat(dir, attr, O_WRONLY);
+	fd = wrap_errno(openat(dir, attr, O_WRONLY));
 	if (igt_debug_on(fd < 0))
-		return -errno;
+		return fd;
 
 	len = igt_writen(fd, data, len);
 	close(fd);
@@ -587,9 +592,9 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
 {
 	int fd;
 
-	fd = openat(dir, attr, O_RDONLY);
+	fd = wrap_errno(openat(dir, attr, O_RDONLY));
 	if (igt_debug_on(fd < 0))
-		return -errno;
+		return fd;
 
 	len = igt_readn(fd, data, len);
 	close(fd);
@@ -720,9 +725,9 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 	va_list tmp;
 	int ret, fd, len;
 
-	fd = openat(dir, attr, O_WRONLY);
+	fd = wrap_errno(openat(dir, attr, O_WRONLY));
 	if (igt_debug_on(fd < 0))
-		return -errno;
+		return fd;
 
 	va_copy(tmp, ap);
 	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);

-- 
2.54.0

