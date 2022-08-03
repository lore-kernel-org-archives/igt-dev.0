Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F2FF10E105
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Aug 2022 05:27:20 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id j2so10288039vsp.1
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Aug 2022 22:27:20 -0700 (PDT)
From: Tales Aparecida <tales.aparecida@gmail.com>
To: igt-dev@lists.freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  3 Aug 2022 02:26:53 -0300
Message-Id: <20220803052654.98827-4-tales.aparecida@gmail.com>
In-Reply-To: <20220803052654.98827-1-tales.aparecida@gmail.com>
References: <20220803052654.98827-1-tales.aparecida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/4] lib/kselftests: return non-zero on
 open(kmsg) failure
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: siqueirajordao@riseup.net, magalilemes00@gmail.com,
 tales.aparecida@gmail.com, Isabella Basso <isabbasso@riseup.net>,
 andrealmeid@riseup.net, Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Previously igt_kselftest_begin() always returned 0.
Return non-zero if failed to open kmsg, instead.

Signed-off-by: Tales Aparecida <tales.aparecida@gmail.com>
---
 lib/igt_kmod.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index bde0461a..63636243 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -933,6 +933,8 @@ int igt_kselftest_begin(struct igt_kselftest *tst)
 	igt_require(err == 0 || err == -ENOENT);
 
 	tst->kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+	if (tst->kmsg < 0)
+		return 1;
 
 	return 0;
 }
-- 
2.37.0
