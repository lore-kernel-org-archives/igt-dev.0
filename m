Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28562606A321
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L3YA3V8t
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF7910E169;
	Mon, 19 Oct 2026 17:03:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A2510E169
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792429350; x=1823965350;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KXwDSyU5qEk8GIom6tffhnPcSDD1FoMbjlyxZejvKBk=;
 b=L3YA3V8t4vaGOyQgz9HlM5nfACOo5jndWaMPz+O4gN2Imyi9MjJ4nzNE
 0AzhXCZbcJc9HPAlhwcQUTrHR6SaiUwVYxMqMp9bc4VJrjoQ8xrPrPLWD
 FO3Q2MkxoVQk1S8XXN3BmWxoP/g8Cd5sEOiXKIFghvmG+aKBg8GVzjBd6
 yqBEA5kquU6+jaENGONVEypFirkax942j8KTWfhjW6EDgmHxT7o30cVMO
 +gKMmqEIti35ZGMIKgHqTDaCHZOD9hqUkL+Y3fLlAqe7RvcnsU5fjdOe+
 va8y1c7kapauZ7MK6UX7WuKbS6VfgWdxTbBv9BHpnywLsn7iKQcrdemyt w==;
X-CSE-ConnectionGUID: 04cALJRMTlCiAvUvEf+C8g==
X-CSE-MsgGUID: 2yK+Zmb7QNy0M8nL+WXq4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="985930"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="985930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:02:30 -0700
X-CSE-ConnectionGUID: HmKypKO1T/2ckSehUUh79g==
X-CSE-MsgGUID: eqJV2tkRRSK46rtkOPVmUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2560341"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.31])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2026 10:02:28 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>, Ryszard Knop <rk@dragonic.eu>
Subject: [PATCH i-g-t v1 0/2] runner: create new option --max-reported-warns
 for dmeg parsing
Date: Mon, 19 Oct 2026 19:01:50 +0200
Message-ID: <20261019170152.139409-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When parsing dmesg for warns or fails, report only first seen
ones up to given number, as usually the relevant ones are
only those at beginning. Also, it makes report smaller and
more readable.

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Ryszard Knop <rk@dragonic.eu>

Kamil Konieczny (2):
  runner: Create new option --max-reported-warns
  runner/resultgen: Report limited number of dmesg warns/fails

 runner/resultgen.c | 11 +++++++++--
 runner/settings.c  | 13 +++++++++++++
 runner/settings.h  |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

-- 
2.55.0

