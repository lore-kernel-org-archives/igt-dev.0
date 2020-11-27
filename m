Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58CE6EEA0
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2020 21:58:47 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id f5so3255280plj.13
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2020 13:58:47 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Fri, 27 Nov 2020 23:58:18 +0200
Message-Id: <20201127215818.6464-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201127215818.6464-1-juhapekka.heikkila@gmail.com>
References: <20201127215818.6464-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] HAX remove pixel-format tests from
 blacklist
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
index cddb77c1f..f61cefb03 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/blacklist-pre-merge.txt
@@ -170,7 +170,7 @@ igt@gem_tiled_wc
 #
 # Data acquired on 2020-02-20 by Martin Peres
 ###############################################################################
-igt@kms_plane@pixel-format-pipe-[a-d]-planes(-source-clamping)?
+#igt@kms_plane@pixel-format-pipe-[a-d]-planes(-source-clamping)?
 
 
 ###############################################################################
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
