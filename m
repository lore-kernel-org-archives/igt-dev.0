Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AB2C3ABBF
	for <igt-dev@archiver.kernel.org>; Wed,  7 May 2025 16:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 023A910E85D;
	Wed,  7 May 2025 16:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I0mbiF30";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64E210E85D
 for <igt-dev@lists.freedesktop.org>; Wed,  7 May 2025 16:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746633889; x=1778169889;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NoWz9BTYEdGf1wrrp9tzdUrtz7v73NIO73RUVZbHncA=;
 b=I0mbiF30dQYvxiQSX6QiOYB2ujFz5zApwf3Jk0yoqDHPYe7iadmVZ+9B
 Ea0frsxZbIAXB9v4E64V0Hn9sY1LZYgupvyIJybhj4t7wgwZf5MyNh4YG
 4/m7Wx1aDe6931Wln7ZRpVqgLYLx2GcEPxtC+YV8Ei5BojRArkybo0CF6
 HKiCS9Y7dC4SQyDgF7IEfG4xmxvgfGuyCoSLiO4kVMCR8r3J89186CGDK
 md1hzncDycyD3mSAkrHcOg72P2IKh9+NKbFV3wFedgsF2fX87L8luXKBk
 sG0xGfju54DKf3a4oKMLOWYSxJjwXhqwpiu0zYuooc0qRfEYf0RSXDyzm g==;
X-CSE-ConnectionGUID: SpJj74KkTfqdop06FQe99A==
X-CSE-MsgGUID: b3xP1Y4XRnOoaRB6omdy3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48519308"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="48519308"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 09:03:47 -0700
X-CSE-ConnectionGUID: S2Gn7K8sRGOC3kUO0YAX1A==
X-CSE-MsgGUID: TbPGd2bYTUeaW9RxRmbvug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; d="scan'208";a="173200910"
Received: from unknown (HELO 0a83d5f6e242.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 07 May 2025 09:03:44 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Subject: [PATCH v4 06/15] tools/gputop: find program name from command line
Date: Wed,  7 May 2025 16:01:39 +0000
Message-ID: <20250507160148.53857-7-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
References: <20250507160148.53857-1-jeevaka.badrappan@intel.com>
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

program_invocation_short_name is global variable provided by glibc.

Inorder to get the igt built for Android(without glibc), find the
program from command line without using program_invocation_short_name.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
---
 tools/gputop.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/gputop.c b/tools/gputop.c
index 43b01f566..457a31969 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -335,15 +335,22 @@ struct gputop_args {
 	unsigned long delay_usec;
 };
 
-static void help(void)
+static void help(char* full_path)
 {
+	const char *short_program_name = strrchr(full_path, '/');
+	if (short_program_name) {
+		short_program_name++;
+	} else {
+		short_program_name = full_path;
+	}
+
 	printf("Usage:\n"
 	       "\t%s [options]\n\n"
 	       "Options:\n"
 	       "\t-h, --help                show this help\n"
 	       "\t-d, --delay =SEC[.TENTHS] iterative delay as SECS [.TENTHS]\n"
 	       "\t-n, --iterations =NUMBER  number of executions\n"
-	       , program_invocation_short_name);
+	       , short_program_name);
 }
 
 static int parse_args(int argc, char * const argv[], struct gputop_args *args)
@@ -384,7 +391,7 @@ static int parse_args(int argc, char * const argv[], struct gputop_args *args)
 			}
 			break;
 		case 'h':
-			help();
+			help(argv[0]);
 			return 0;
 		default:
 			fprintf(stderr, "Unkonwn option '%c'.\n", c);
-- 
2.34.1

