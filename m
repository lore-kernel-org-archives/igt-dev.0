Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4958D5AE6B
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 07:02:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96E5C10E7B7;
	Thu,  7 Nov 2024 07:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsC2kGmM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBF710E7B7
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 07:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730962951; x=1762498951;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZUILzFipChsKZtC7xX+wkkTgGbM4+Nm3uXsuTTaPnZA=;
 b=fsC2kGmMgZP31cs20P/ndQN6vTqCLx8cs0xWQ+AFBx214XriErw3XJnT
 2doAvhzPhirtJ4bdgZ7bgn8lpn0rt6ODLqCIR8aUmmVNndTnO5aVhD4H6
 82VVXiksFk5sKFscICYhdMyKN+IeMHkk3nCgqN/+C6tTu0DIeY8u39Sd1
 bw6VP2rytt8QbGGq66JE6u7WIgQFB8JYiLroo71RVsfVcbYA1kfwIVUu9
 yDvjKgQuAT98ZmR07AKks/HyXqZFuhUplL7XO7QevDFF76HppYKnxC1LA
 K1BLBpl7epDnsjaQc6+rP3NiZlAf10dKlxGZv0fhFM4xrTC4x6rPZLRhZ g==;
X-CSE-ConnectionGUID: BedOyTcNTCm0zum9cyclkQ==
X-CSE-MsgGUID: NmVpF38SRBKTdjlZHwUWog==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="30910089"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="30910089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:02:31 -0800
X-CSE-ConnectionGUID: goTcclkhQVibuaQExM6fBg==
X-CSE-MsgGUID: HTOi4qcMQTKxwraBGsDPow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; d="scan'208";a="85071534"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2024 23:02:30 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_core: Free log_buffer entries on exit
Date: Wed,  6 Nov 2024 23:02:08 -0800
Message-ID: <20241107070208.3143050-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Make sure the buffer entries are released, otherwise valgrind output
becomes each used entry as still reachable on exit (up to 256).

Test:
	# valgrind --leak-check=full  ./build/tests/xe_live_ktest  --r xe_mocs

Before:
	==16082== LEAK SUMMARY:
	==16082==    definitely lost: 0 bytes in 0 blocks
	==16082==    indirectly lost: 0 bytes in 0 blocks
	==16082==      possibly lost: 0 bytes in 0 blocks
	==16082==    still reachable: 33,473 bytes in 59 blocks

After:
	==15992== LEAK SUMMARY:
	==15992==    definitely lost: 0 bytes in 0 blocks
	==15992==    indirectly lost: 0 bytes in 0 blocks
	==15992==      possibly lost: 0 bytes in 0 blocks
	==15992==    still reachable: 31,083 bytes in 42 blocks

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_core.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b551..879d1ecd8 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -469,11 +469,21 @@ static void _igt_log_buffer_append(char *line)
 	pthread_mutex_unlock(&log_buffer_mutex);
 }
 
+static void _igt_log_buffer_reset_locked(void)
+{
+	for (; log_buffer.start != log_buffer.end; log_buffer.start++) {
+		free(log_buffer.entries[log_buffer.start]);
+		log_buffer.entries[log_buffer.start] = NULL;
+	}
+
+	log_buffer.start = log_buffer.end = 0;
+}
+
 static void _igt_log_buffer_reset(void)
 {
 	pthread_mutex_lock(&log_buffer_mutex);
 
-	log_buffer.start = log_buffer.end = 0;
+	_igt_log_buffer_reset_locked();
 
 	pthread_mutex_unlock(&log_buffer_mutex);
 }
@@ -624,8 +634,7 @@ static void _igt_log_buffer_dump(void)
 		i++;
 	} while (i != log_buffer.start && i != log_buffer.end);
 
-	/* reset the buffer */
-	log_buffer.start = log_buffer.end = 0;
+	_igt_log_buffer_reset_locked();
 
 	_log_line_fprintf(stderr, "****  END  ****\n");
 	pthread_mutex_unlock(&log_buffer_mutex);
-- 
2.47.0

