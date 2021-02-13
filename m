Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03EC6E89A
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Feb 2021 21:53:06 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id d24so4744098lfs.8
 for <igt-dev@lists.freedesktop.org>; Sat, 13 Feb 2021 13:53:06 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Sat, 13 Feb 2021 23:53:00 +0200
Message-Id: <20210213215300.20382-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210213215300.20382-1-juhapekka.heikkila@gmail.com>
References: <20210213215300.20382-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX remove rotation test from blacklist
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
