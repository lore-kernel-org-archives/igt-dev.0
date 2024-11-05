Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA39D1CA32
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 05:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC4610E513;
	Tue,  5 Nov 2024 05:53:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkzRuI1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BF610E12A
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 05:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730786005; x=1762322005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=URDPHP6fuhJhpzQTOj7Y1qLBxKbNqZWOW68ATxs69VI=;
 b=YkzRuI1SDA5M3ZmsBywdh3G7G8btVVavD3eLML35pOM+AgJxmu7Gghwb
 ncU2aD6sKTO7lb8p0N06ifDzHbg/Lynwycx+Y5rud3p4LVgj+/ww1YBAz
 c24yYWp0Wp7TGpglfYQsaRf2wLM/O31HI2VkCkWKOz0BUhNMng9ty4Hr8
 7CxMwJAUFgAGQrKZ0LZsR0/5QPe0alI+wV2Zf0n8qIYJszD4uDB+yHJSd
 91Kci2/1ZHZ6GB0wsJYOBbGBtgoHYWFJLN5nucGJHY57Kv4wGSyCI0cXE
 hl9cTYtcmxpfz9DqwhioFwBBtmX3c0jQPJpujqkLX9eGj1vggsU83jr0a Q==;
X-CSE-ConnectionGUID: NgvTVm9TQYC8MF/qRI9d3g==
X-CSE-MsgGUID: rFWr56TISmu4BTljUyjWPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33351544"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="33351544"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:53:25 -0800
X-CSE-ConnectionGUID: FfCVmdloROK6Tqg4MBYlTw==
X-CSE-MsgGUID: e66mvKLBR9WA3rqjd+hTQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="87815939"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 21:53:24 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] lib/igt_kmod: Stop handling _kunit suffix
Date: Mon,  4 Nov 2024 21:52:54 -0800
Message-ID: <20241105055255.2466236-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105055255.2466236-1-lucas.demarchi@intel.com>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
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

It's not used anywhere anymore. Remove it.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 4eeab79ec..58edac8fa 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -1189,7 +1189,7 @@ static void __igt_kunit(struct igt_ktest *tst,
  *	   if NULL then test cases from all test suites provided by the module
  *	   are executed as dynamic sub-subtests of one IGT subtest, which name
  *	   is derived from the module name by cutting off its optional trailing
- *	   _test or _kunit suffix
+ *	   _test suffix
  * @opts: options to load the module
  *
  * Loads the test module, parses its (k)tap dmesg output, then unloads it
@@ -1213,9 +1213,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
 		if (!igt_debug_on(!subtest)) {
 			char *suffix = strstr(subtest, "_test");
 
-			if (!suffix)
-				suffix = strstr(subtest, "_kunit");
-
 			if (suffix)
 				*suffix = '\0';
 		}
-- 
2.47.0

