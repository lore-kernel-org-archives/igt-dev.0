Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 786C6D149D6
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 17:12:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387A110EB41;
	Fri, 25 Oct 2024 17:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYs+ts2Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D575910EB2C
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 17:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729876377; x=1761412377;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bHPv7vE8qzKqBQ+lvzoDc/do0l82FEuOqTkhvJmWQjo=;
 b=GYs+ts2ZtCnd6N8pWyXja8FmSE32J+osNocKI2XbTHid+pmqgtstYRRG
 CqoWzVbDVqbBnbjhT/DIcWlbXEDp5Cfl6+aKg1kqES9BoEfRg30hw1BNs
 HnnyuNgUopic618AxCyRP+ed1Y1ocso6XXo7mC5+jYMHv38ffl/Bv27v4
 twxWT3d1wLAKYXPbhAW0Q6e/7obyPZqAJoo1k2wayXX1e+2vDJoAgxHOT
 M5cxF/ettZVSSFC42W0+OwlGahR2G37wGLKqHR5dOOnObERg20r30zMj9
 0pNHvErUtyf/NK46H8FhtZxbvKhYPLqkpaREGM1o5tbdrA+S8qdrjVOPz A==;
X-CSE-ConnectionGUID: lw0H6135QiW3CaN0qMN1OA==
X-CSE-MsgGUID: 04sp11tkReeZ/DTpklKrJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="33461177"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="33461177"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:12:57 -0700
X-CSE-ConnectionGUID: PW2sXTFyRxiVM8XYX9oeBQ==
X-CSE-MsgGUID: MYwnqInsTya0fzjBsu5qFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="80893631"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.153])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 10:12:55 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Jonathan-Cavitt <jonathan.cavitt@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v1 1/2] tests/intel/xe_wedged: Ignore more dmesg warnings
Date: Fri, 25 Oct 2024 19:12:39 +0200
Message-ID: <20241025171240.114267-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025171240.114267-1-kamil.konieczny@linux.intel.com>
References: <20241025171240.114267-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There are more warnings in dmesg which should be ignored,
one comes from driver, for example:

xe 0000:00:02.0: [drm] *ERROR* GT0: reset failed (-ECANCELED)

second from drm:

<4> [438.651441]  ? __pfx___drm_printfn_seq_file+0x10/0x10 [drm]
<4> [438.651476]  ? __pfx___drm_puts_seq_file+0x10/0x10 [drm]

so extend regex with them.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2919
Cc: Jonathan-Cavitt <jonathan.cavitt@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_wedged.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index 88e5d47f2..0e4c88ffe 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -29,7 +29,9 @@
 static void ignore_wedged_in_dmesg(void)
 {
 	/* this is needed for igt_runner so it will ignore it */
-	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged");
+	igt_emit_ignore_dmesg_regex("CRITICAL: Xe has declared device [0-9A-Fa-f:.]* as wedged|"
+				    "GT[0-9A-Fa-f]*: reset failed .-ECANCELED.|"
+				    "__pfx___drm_[a-z]*seq_file.*drm");
 }
 
 static void force_wedged(int fd)
-- 
2.47.0

