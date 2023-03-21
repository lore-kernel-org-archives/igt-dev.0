Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20605.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::605])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F3610E0D0
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Mar 2023 02:49:02 +0000 (UTC)
From: Jasber Chen <yipeng.chen@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 21 Mar 2023 10:48:26 +0800
Message-ID: <20230321024826.1722421-1-yipeng.chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] correct validating config on enconder mask. Then
 mode setting can be run through with multiple displays.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: yipeng.chen@amd.com, Jasber Chen <yipeng.chen@amd.corp-partner.google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Jasber Chen <yipeng.chen@amd.corp-partner.google.com>

Signed-off-by: yipeng.chen@amd.com
---
 tests/kms_setmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index bfa10891..4e59f2aa 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -331,7 +331,7 @@ static void setup_crtcs(const struct test_config *tconf,
 
 			encoder_mask |= 1 << get_encoder_idx(resources,
 							     encoder);
-			config_valid &= !(encoder_mask &
+			config_valid &= !!(encoder_mask &
 					  ~encoder->possible_clones);
 
 			drmModeFreeEncoder(encoder);
-- 
2.25.1
