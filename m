Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04425F531CA
	for <igt-dev@archiver.kernel.org>; Mon, 13 Apr 2026 20:18:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B035D10E530;
	Mon, 13 Apr 2026 20:18:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f67DM/AH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C018410E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Apr 2026 20:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776111473; x=1807647473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GQkhHjcqKH/TtCHgMBnx9aMyAL86qEy7gzx1sonh7RQ=;
 b=f67DM/AHgiXg+QQijAeA1K0ictK1BErc94zNHBeX2ifsPO3obIiN4Lu1
 v6ULqyoNiQ98++20XzGUnpTevaNaTZ5wNT0hvPDHevQjjaUivQbaniEBj
 UDtHqlkSASu4aX0nqfD7wZ8nVFu3kpgEOdF9q+8O4dHMazfAh01nC60dI
 UE5yOUCVyL8oSznA1MkZucIy6m9S9GcvT9kkQHwNoq6tut4OfwvVWtcMw
 iCDfJXLOxF7T2mrTpPJfz56CQgk0TTN0mPnT9t7ww8ryNFimT/4+zH9pA
 Nysf6HnWyhgq8fZ8qWEu2bKHIhfIe+WM46KnFof0JmkZNfEmBSjajKLS9 g==;
X-CSE-ConnectionGUID: c17eSJgwR1CsmaBGfXmEeA==
X-CSE-MsgGUID: MUwo/6jHQ6WBUS6NZcj85w==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80918927"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="80918927"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:53 -0700
X-CSE-ConnectionGUID: P+SnnngNRQ+xsGsUzCvpAg==
X-CSE-MsgGUID: PAWzugqgTN+bUdMwYnKogQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; d="scan'208";a="229816450"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.10])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2026 13:17:53 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH i-g-t v3 4/5] runner/resultgen: Add json array create/get
 helper
Date: Mon, 13 Apr 2026 22:17:27 +0200
Message-ID: <20260413201722.808673-11-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
References: <20260413201722.808673-7-zbigniew.kempczynski@intel.com>
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

Upcoming patch which extends results.json to contain attachments
is going to put file list in the array instead of key=value pair.
Add helper which creates/finds array object in json structure.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
---
 runner/resultgen.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 29fc5cbb15..f8459385c3 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -271,6 +271,20 @@ static struct json_t *get_or_create_json_object(struct json_t *base, const char
 	return ret;
 }
 
+static struct json_t *get_or_create_json_array(struct json_t *base, const char *key)
+{
+	struct json_t *ret = json_object_get(base, key);
+
+	if (ret)
+		return ret;
+
+	ret = json_array();
+	json_object_set_new(base, key, ret);
+
+	return ret;
+}
+
+
 static void set_result(struct json_t *obj, const char *result)
 {
 	if (!result)
-- 
2.43.0

