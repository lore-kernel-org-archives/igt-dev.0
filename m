Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49CA76E9BB
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jun 2021 18:31:15 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id f70so2458166qke.13
 for <igt-dev@lists.freedesktop.org>; Mon, 07 Jun 2021 11:31:15 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
Date: Mon,  7 Jun 2021 14:31:10 -0400
Message-Id: <20210607183110.259414-1-markyacoub@chromium.org>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_content_protection: Skip on
 hdcp_sink_capability is not found.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
In some configurations such as kernel 5.4 on Zork with no DP connected,
debugfs will not contain hdcp_sink_capability file.

[How]
Check for hdcp_sink_capability but skip the test if file is not found.

Tested on ChromeOS Zork Kernel 5.4
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_content_protection.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 1d1a439a..a0a136da 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -402,6 +402,7 @@ static void test_content_protection_on_output(igt_output_t *output,
 static void __debugfs_read(int fd, const char *param, char *buf, int len)
 {
 	len = igt_debugfs_simple_read(fd, param, buf, len);
+	igt_require(len != -ENOENT);
 	if (len < 0)
 		igt_assert_eq(len, -ENODEV);
 }
-- 
2.32.0.rc1.229.g3e70b5a671-goog

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
