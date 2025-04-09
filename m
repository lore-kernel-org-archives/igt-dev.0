Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AB8C369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 12:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14C910E128;
	Wed,  9 Apr 2025 12:56:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBWBtXtO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F8D10E128
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 12:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744203361; x=1775739361;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ff+b/j2vdJOX3G9LTjA0rQ9ZBEeASql+J9+mwo5Qdpw=;
 b=oBWBtXtOSfHbnBWcCIrchEYx5FFCrlbRvHpdNNWPcp8kLT9wXwvEWe+U
 Spiwne4z90bMC8BbvRwEFovCsU7xABYabPJK06DjHenY7oThAJBsfHG6X
 mRrP1r9EdVV9tu4aMFUhHHGrZszUNGhk8ouD5TkU+lizPclMFq3J7+6F0
 VxrNDf0eyaSI7pumSPPZMfNuiHPLLNX6fo70mWjXN9w7P7fb8VYkjTKFb
 OqlgGTv3kO1PN0QIYEy17F+EYe4D581Isql6OVaiG6sffLHJUowU3kK8c
 M9V23s/oH1egvD++fFEA9mjsypBZK9DBjhKdmJdUvtwSg0zJzCOL1lQ/s g==;
X-CSE-ConnectionGUID: wtVRHXWzQqmvWy48BCQclw==
X-CSE-MsgGUID: vPtiPXokQs2jc6X7KNvSog==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="57046640"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="57046640"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 05:56:01 -0700
X-CSE-ConnectionGUID: yDvKIuDOTCipxB4DKO95rA==
X-CSE-MsgGUID: KTqmFBQHQsu7Fb2IShOpfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; d="scan'208";a="133288816"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.238])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2025 05:56:00 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t 1/1] runner/executor: sync outputs after tests end
Date: Wed,  9 Apr 2025 14:55:43 +0200
Message-ID: <20250409125543.49920-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409125543.49920-1-kamil.konieczny@linux.intel.com>
References: <20250409125543.49920-1-kamil.konieczny@linux.intel.com>
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

We observe that sometimes tests are reported as incomplete after
a crash and there are more such incompletes before a one that
caused actual crash. It turns out that there were missing ends
of tests dmesg logs gathered in a test subdirectory. After cross
checks with a global dmesg log saved outside of igt_runner, it
seems that all tests before crushed one properly reported its end
to kernel kmsg.

  Try to remediate this and create additional syncs for logs just
after end of execution, with additional syncs for directories.

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index 30e2420af..69227a5f2 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -615,6 +615,16 @@ void close_outputs(int *fds)
 	}
 }
 
+void fsync_outputs(int *fds)
+{
+	int i;
+
+	for (i = 0; i < _F_LAST; i++) {
+		if (fds[i] >= 0)
+			fsync(fds[i]);
+	}
+}
+
 const char *get_out_filename(int fid)
 {
 	if (fid >= 0 && fid < _F_LAST)
@@ -1871,14 +1881,19 @@ static int execute_next_entry(struct execute_state *state,
 out_kmsgfd:
 	close(kmsgfd);
 out_pipe:
-	close_outputs(outputs);
 	close(outpipe[0]);
 	close(outpipe[1]);
 	close(errpipe[0]);
 	close(errpipe[1]);
+	if (settings->sync)
+		fsync_outputs(outputs);
 	close_outputs(outputs);
 out_dirfd:
+	if (settings->sync)
+		fsync(dirfd);
 	close(dirfd);
+	if (settings->sync)
+		fsync(resdirfd);
 
 	return result;
 }
-- 
2.49.0

