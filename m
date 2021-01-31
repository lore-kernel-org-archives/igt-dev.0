Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A306F6E16D
 for <igt-dev@lists.freedesktop.org>; Sun, 31 Jan 2021 03:28:46 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id l11so6567565qvt.1
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Jan 2021 19:28:46 -0800 (PST)
Received: from elite-desk-aura.lan (135-23-249-167.cpe.pppoe.ca.
 [135.23.249.167])
 by smtp.gmail.com with ESMTPSA id b21sm7611501qtt.56.2021.01.30.19.28.44
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 19:28:45 -0800 (PST)
From: Aurabindo Pillai <mail@aurabindo.in>
Date: Sat, 30 Jan 2021 22:28:42 -0500
Message-Id: <20210131032842.29033-2-mail@aurabindo.in>
In-Reply-To: <20210131032842.29033-1-mail@aurabindo.in>
References: <20210131032842.29033-1-mail@aurabindo.in>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/2] tests/kms_properties: Add test description
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

Add top level description for kms_properties

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 tests/kms_properties.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index b743f9d6..37844e32 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -29,6 +29,9 @@
 #include <string.h>
 #include <time.h>
 
+IGT_TEST_DESCRIPTION("Test setting properties on plane, crtc and connector"
+		     " including invalid properties that are fallible");
+
 struct additional_test {
 	const char *name;
 	uint32_t obj_type;
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
