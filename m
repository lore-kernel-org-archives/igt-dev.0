Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3662C44520
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 16:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817BF10E9D0;
	Mon, 20 Jul 2026 16:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d02Zg/KN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E4FA10E9D0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 16:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784564131; x=1816100131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KqbUMs0GA+BGgxb+gq0YNMHgEkJgL7CUSNO3XP09dig=;
 b=d02Zg/KNyfz76Q24zRjIT9I2JOhRSqdcoW8TatzG3Xg+RFXU39m8iTHN
 KQ6cpJvlLL+oUHs7yyfv1QA3kvMxosmb4+zGFOlOnN3VQGiKzCRKKXZMq
 k87IAhK4BYnzxQTnzYtnh5OON6F1mlSNbNSjkvejU816dgP6FQeL8OXDg
 ySIqdPIAY46LKg1O/823ZmvRYM224kCSFKM9MQ/yYsMg3qzcwDqLd6kja
 mKVqHu4pLViQJQAy5XWWj9myVW7iuaA70aFiBZ/H/KAlVwIUuCn6sSF39
 OpiktZ+5FmoP7ir/WOm5pSSi4Nc8qw4botC7OXt0ze3mDz+yjhgX5cfeg A==;
X-CSE-ConnectionGUID: M8Un8p2mRkKPbz4eYwbkjw==
X-CSE-MsgGUID: fFvXWo3FSVqQoZlNiv54cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="95743138"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="95743138"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 09:15:31 -0700
X-CSE-ConnectionGUID: 41s5a0q0SeOsHbnuih3WLQ==
X-CSE-MsgGUID: 4ZGylrGjREWRPbkrHt+3kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="281975815"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.152])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 09:15:29 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ewelina Musial <ewelina.musial@intel.com>,
 Ryszard Knop <ryszard.knop@intel.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH i-g-t RFC v1 0/2] runner: create results incrementally
Date: Mon, 20 Jul 2026 18:15:24 +0200
Message-ID: <20260720161526.64709-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.54.0
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

Create results incementally during run, e.g. after each test end
its execution create results.json up to last one executed.

One caveat is that it will still not hold last one at which
sudden reboot happens, for example after a kernel panic.

In such cases there is still a need for calling igt_results to
collect all data.

Cc: Ewelina Musial <ewelina.musial@intel.com>
Cc: Ryszard Knop <ryszard.knop@intel.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Kamil Konieczny (2):
  runner: Create results after each tests end
  runner: Create new option for incremental results

 runner/executor.c  | 57 ++++++++++++++++++++++++++++++++++++++++++----
 runner/resultgen.c |  6 ++++-
 runner/settings.c  |  8 +++++++
 runner/settings.h  |  1 +
 4 files changed, 67 insertions(+), 5 deletions(-)

-- 
2.54.0

