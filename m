Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCE3D5B873
	for <igt-dev@archiver.kernel.org>; Mon, 15 Dec 2025 22:36:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53DE10E545;
	Mon, 15 Dec 2025 22:36:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a1noEEQ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0560210E545
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Dec 2025 22:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765838207; x=1797374207;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j1c0h9+7EAwPUmo+qyUEu5wngeO5wrRYkGaUfn3WsEM=;
 b=a1noEEQ2+q1i+f6U+fuUrGBMk103mou7fPlWvsC2mFooeBju/uHfeaZT
 xgQvS+4IsqArH2TbflCzpHF6LzTxmQlhIusKCE3Av5lPzvg081D/XO3VP
 4RJFOmM/YmxTsF0R2c1CpP+gh/sDIlzij/3TynOgtkb3dEUEoB0lpwVdG
 NIZoyHkI5O8/lCmtr/OzIGHwV1lz+C8kH4Z8B48tamwfuvPb6u7WBABHD
 TSGlwe/uXhVvpZ7TObHk/pIw6JfHmLgXGyvjaLlSFVhTMab8Iz5Cr7Vrk
 5/NT3QD3FkjjQi09vIwEYkNi/450baBxxhsw2hYqhaVN2JdBEF2QPqarP A==;
X-CSE-ConnectionGUID: oc0xr3qORRykNq66Rs50fQ==
X-CSE-MsgGUID: c8FOTQiPQGG8NkTOeURTjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78389419"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="78389419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:45 -0800
X-CSE-ConnectionGUID: EuocFjdzStiVCEsojfl1Mg==
X-CSE-MsgGUID: mjE2iD2FRhO6aWhJBTilHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="197740269"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.94])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 14:36:45 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v1 1/4] tests/prime_udl: Fix opening
Date: Mon, 15 Dec 2025 23:36:36 +0100
Message-ID: <20251215223639.117028-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
References: <20251215223639.117028-1-kamil.konieczny@linux.intel.com>
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

Cards numbering can be non-squential so create a way to open them
in such case.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/prime_udl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/prime_udl.c b/tests/prime_udl.c
index 25950a09d..c3e92be1e 100644
--- a/tests/prime_udl.c
+++ b/tests/prime_udl.c
@@ -27,13 +27,13 @@ static int find_and_open_devices(void)
 	FILE *fl;
 	char vendor_id[8];
 	int venid;
-	for (i = 0; i < 9; i++) {
+	for (i = 0; i < 9 && intel_fd == -1 && udl_fd == -1; i++) {
 		sprintf(path, "/sys/class/drm/card%d/device/vendor", i);
 		if (stat(path, &buf)) {
 			/* look for usb dev */
 			sprintf(path, "/sys/class/drm/card%d/device/idVendor", i);
 			if (stat(path, &buf))
-				break;
+				continue;
 		}
 
 		fl = fopen(path, "r");
@@ -45,11 +45,11 @@ static int find_and_open_devices(void)
 
 		venid = strtoul(vendor_id, NULL, 16);
 		sprintf(path, "/dev/dri/card%d", i);
-		if (venid == 0x8086) {
+		if (venid == 0x8086 && intel_fd == -1) {
 			intel_fd = open(path, O_RDWR);
 			if (!intel_fd)
 				return -1;
-		} else if (venid == 0x17e9) {
+		} else if (venid == 0x17e9 && udl_fd == -1) {
 			udl_fd = open(path, O_RDWR);
 			if (!udl_fd)
 				return -1;
-- 
2.52.0

