Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51ED10E812
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Apr 2022 19:29:20 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bn33so8752079ljb.6
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Apr 2022 12:29:20 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Apr 2022 22:28:56 +0300
Message-Id: <20220407192856.15813-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/kms_flip_scaled_crc: Fix error
 message
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

There was newline missing from skipping message which caused skips
to show as incomplete.

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/i915/kms_flip_scaled_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
index 67ccef31d..9740715f0 100644
--- a/tests/i915/kms_flip_scaled_crc.c
+++ b/tests/i915/kms_flip_scaled_crc.c
@@ -398,7 +398,7 @@ igt_main
 				if (rval == NOREQUESTEDFORMATONPIPE)
 					igt_debug("No requested format/modifier on pipe %s\n", kmstest_pipe_name(pipe));
 			}
-			igt_require_f(validtests > 0, "No valid pipe/connector/format/mod combination found");
+			igt_require_f(validtests > 0, "No valid pipe/connector/format/mod combination found\n");
 		}
 	}
 	igt_fixture {
-- 
2.28.0
