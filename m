Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB1096E094
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jan 2021 08:26:25 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id lb18so1252298pjb.5
 for <igt-dev@lists.freedesktop.org>; Tue, 05 Jan 2021 00:26:25 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue,  5 Jan 2021 10:25:45 +0200
Message-Id: <20210105082545.6417-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
References: <20210105082545.6417-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX remove rotation tests from blacklist
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
List-ID: <igt-dev@lists.freedesktop.org>

HAX remove rotation tests from blacklist
---
 tests/intel-ci/blacklist-pre-merge.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/blacklist-pre-merge.txt
index cddb77c1f..b46c7d050 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -17,7 +17,7 @@
 #
 # Data acquired on 2020-02-19 by Martin Peres
 ###############################################################################
-igt@kms_rotation_crc@.*
+#igt@kms_rotation_crc@.*
 
 
 ###############################################################################
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
