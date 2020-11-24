Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27B66E43C
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2020 13:38:48 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id f17so8965893pge.6
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2020 05:38:48 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Tue, 24 Nov 2020 15:38:36 +0200
Message-Id: <20201124133836.30669-2-juhapekka.heikkila@gmail.com>
In-Reply-To: <20201124133836.30669-1-juhapekka.heikkila@gmail.com>
References: <20201124133836.30669-1-juhapekka.heikkila@gmail.com>
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
