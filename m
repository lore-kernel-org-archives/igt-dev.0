Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1E2CD4855
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 08:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFF510E41A;
	Tue, 12 May 2026 08:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kzPZH8t2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A3210E53B
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 13:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778506474; x=1810042474;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WA3Tf47ild4PpFkWOCz6eaY7azHokiUuJcNSiaTkn0Y=;
 b=kzPZH8t2ehTl0UcIhe8iUo+m1rUs/y4qQQf4a591MaggKKz/pluRG7fp
 xzTmedN5ChCsu4/Qpb/xZqxOY6pSG8U6+YL/Iogoge9rvSDIP3c0o+qH3
 SX8R7YDpKjMoUp7BXI8/2T/UjA0gCud+OXLf3qcpRACKPlJZOMrQ1vkS5
 2PdlcUDBlTwa5uJ6OYDjAeGLpZ9Ye/hUSkuLIn7vKWeTulnrXxh+rgTj6
 HV438ykgpTJ/OxD/h1QFtmAQyu9fHrXswGtWkeF/CggG1UvgZAwmNRpin
 lggAleH3lKjmkYtAxlY7R6JJoxkOiY1BrGcyw8DYbClmOXdx8vW57/tjQ w==;
X-CSE-ConnectionGUID: +rkC++bmSuO1EfZS9/Y23A==
X-CSE-MsgGUID: EIzMFDyfQTaSgq6UnmnqbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79573547"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="79573547"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 06:34:33 -0700
X-CSE-ConnectionGUID: Xx9S5YGyQeyMbkHeyE8EhA==
X-CSE-MsgGUID: +d5IjZw3TIWKDXjGtig4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="234787560"
Received: from dev-274.igk.intel.com ([10.211.136.198])
 by fmviesa008.fm.intel.com with ESMTP; 11 May 2026 06:34:31 -0700
From: Jakub Legowski <jakub.legowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, peter.senna@linux.intel.com,
 piotr.rudnicki@intel.com, mika.kuoppala@intel.com,
 Jakub Legowski <jakub.legowski@intel.com>
Subject: [PATCH v1 1/1] tests/intel/xe_exec_basic: skip test when no GTs
Date: Mon, 11 May 2026 15:33:59 +0200
Message-ID: <20260511133359.198762-1-jakub.legowski@intel.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 12 May 2026 08:55:32 +0000
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

Add igt_require_f() in the fixture to check that GT count
is non-zero, ensuring the test is properly skipped when
the device has no usable GTs.

Signed-off-by: Jakub Legowski <jakub.legowski@intel.com>
---
 tests/intel/xe_exec_basic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_basic.c b/tests/intel/xe_exec_basic.c
index 5335bffc4..70a0d999f 100644
--- a/tests/intel/xe_exec_basic.c
+++ b/tests/intel/xe_exec_basic.c
@@ -345,9 +345,12 @@ int igt_main()
 	};
 	int fd;
 
-	igt_fixture()
+	igt_fixture() {
 		fd = drm_open_driver(DRIVER_XE);
 
+		igt_require_f(xe_number_gt(fd) > 0, "No GTs available on device\n");
+	}
+
 	for (const struct section *s = sections; s->name; s++) {
 		igt_subtest_with_dynamic_f("once-%s", s->name)
 			xe_for_each_engine(fd, hwe)
-- 
2.48.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

