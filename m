Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC41AC48BF6
	for <igt-dev@archiver.kernel.org>; Mon,  4 Mar 2024 22:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC5F112666;
	Mon,  4 Mar 2024 22:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fSys+RrZ";
	dkim-atps=neutral
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B0D112666
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Mar 2024 22:18:05 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6098a20ab22so28601697b3.2
 for <igt-dev@lists.freedesktop.org>; Mon, 04 Mar 2024 14:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709590683; x=1710195483; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4vLe4I/9TmLLrVixFUNNfGRmJStweVQGKryzjRGPIEk=;
 b=fSys+RrZPhjb1zvz/6hPCUU4lCZSqj1gg2yngx0axHY40fC2K7YWJBkXLrzoXFKF9d
 yjxqH1zPMh22+ESwr2BiJ3suiM9kciLMLrO5U2Sw+D16ry3GRSrRMgcd4QTLJbg3NgBt
 x6KqWr9f7ei1K8BBO64tLiQ7U9v58YE5e7TypAn4bXo1PpYKqFoAC8MYBi6Pfj7kKlo4
 4uuos1L1290R+hJhteoY1X38NDdrkyuZo6aaPrY2H4AmLaqg8SiBebazJ1BWYf39LpsV
 LaXVLLxl6myPwORaKQLfwPg1WOp5JiApCCvTvdf6FjWrm7CGeaOVHeIq7OpJKEaVFdrf
 zMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709590683; x=1710195483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4vLe4I/9TmLLrVixFUNNfGRmJStweVQGKryzjRGPIEk=;
 b=mHMh6ocbT5Vd1crHKD6E1bblfAnFzlEvvpBYzWyHjZgEZNWMcv0JrK/DMcv2nqQ5K+
 sQnEC5hAp+DfawMh719+CMN+OB/LSpZxy7LMkkf0UtuyRu7/W+RYyTieQ6xDy6C2HKNO
 36Zw68bOnij7V6Ee4LqKjMtmUW0dl1hukIzJtjlsk5LYrl6JiXu8+n6hHPksopevJ4DH
 XnHvLz4ceUfTwwK8ylDw9AQaMvHhWmjJVUm6EJsjc9wo8eSxt47DFeQf+SDfWg4UyBAW
 SJeA97QKymjNhYCdhRNymZ0uCL9jj6SSe3ciY+j18l4YDD3KMTcPg1N3QjKx4fNKRrvy
 l04Q==
X-Gm-Message-State: AOJu0YzfqRCeVsNzKv8e02otFWWIGh8uRO0J4LH+qweGWccj/S3nqCN3
 oFtOUM930Pp5Vzu5I/VjfW+FnlglPhlhL/iTgo/34yMt/NWCWs3HTkVGJt+/
X-Google-Smtp-Source: AGHT+IHMDhrFlmACOjXxI9fuGUeRZoLUW3Z4dyla/L/YatkIlhBtNfjNgHUd8+GaRWoX2YrQeDM6BA==
X-Received: by 2002:a0d:df11:0:b0:609:69b6:e753 with SMTP id
 i17-20020a0ddf11000000b0060969b6e753mr9125062ywe.23.1709590682863; 
 Mon, 04 Mar 2024 14:18:02 -0800 (PST)
Received: from localhost ([162.208.5.36]) by smtp.gmail.com with ESMTPSA id
 ce11-20020a05690c098b00b006097165a70csm2733119ywb.19.2024.03.04.14.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Mar 2024 14:18:01 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Matt Turner <mattst88@gmail.com>
Subject: [PATCH i-g-t] lib: Inline igt_x86_features() into ifunc resolvers
Date: Mon,  4 Mar 2024 17:16:40 -0500
Message-ID: <20240304221800.1161896-1-mattst88@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Quoting https://sourceware.org/glibc/wiki/GNU_IFUNC

> When LD_BIND_NOW=1 or -Wl,z,now is in effect symbols must be
> immediately resolved at startup. In cases where an external function
> call depends needs to be made that may fail if such a call has not
> been initialized yet (PLT-based relocation which is processed later).
> For example calling strlen in an IFUNC resolver built with -Wl,z,now
> may lead to a segfault because the PLT is not yet resolved.

We cannot rely on function calls through the PLT in ifunc resolvers as
the PLT may not have been initialized yet.

In practice, this causes crashes when igt is linked with -Wl,-z,now or
when linked with the mold linker.

To avoid this problem, we do two things:
    1. move igt_x86_features() to igt_x86.h so its definition is
       available to compilation units that call the function.
    2. mark the ifunc resolvers with __attribute__((flatten)) to ensure
       igt_x86_features() is inlined.

Bug: https://bugs.gentoo.org/788625
Bug: https://bugs.gentoo.org/925348
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 lib/igt_halffloat.c |   2 +
 lib/igt_x86.c       | 116 +------------------------------------------
 lib/igt_x86.h       | 117 +++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 119 insertions(+), 116 deletions(-)

diff --git a/lib/igt_halffloat.c b/lib/igt_halffloat.c
index 5dbe08e01..67d26c225 100644
--- a/lib/igt_halffloat.c
+++ b/lib/igt_halffloat.c
@@ -194,6 +194,7 @@ static void half_to_float(const uint16_t *h, float *f, unsigned int num)
 		f[i] = _half_to_float(h[i]);
 }
 
+__attribute__((flatten))
 static void (*resolve_float_to_half(void))(const float *f, uint16_t *h, unsigned int num)
 {
 	if (igt_x86_features() & F16C)
@@ -205,6 +206,7 @@ static void (*resolve_float_to_half(void))(const float *f, uint16_t *h, unsigned
 void igt_float_to_half(const float *f, uint16_t *h, unsigned int num)
 	__attribute__((ifunc("resolve_float_to_half")));
 
+__attribute__((flatten))
 static void (*resolve_half_to_float(void))(const uint16_t *h, float *f, unsigned int num)
 {
 	if (igt_x86_features() & F16C)
diff --git a/lib/igt_x86.c b/lib/igt_x86.c
index 8c102fd13..f103b9820 100644
--- a/lib/igt_x86.c
+++ b/lib/igt_x86.c
@@ -27,14 +27,6 @@
 
 #include "config.h"
 
-#ifdef HAVE_CPUID_H
-#include <cpuid.h>
-#else
-#define __get_cpuid_max(x, y) 0
-#define __cpuid(level, a, b, c, d) a = b = c = d = 0
-#define __cpuid_count(level, count, a, b, c, d) a = b = c = d = 0
-#endif
-
 #include "igt_x86.h"
 #include "igt_aux.h"
 
@@ -49,114 +41,7 @@
  * @include: igt_x86.h
  */
 
-#define BASIC_CPUID 0x0
-#define EXTENDED_CPUID 0x80000000
-
-#ifndef bit_MMX
-#define bit_MMX		(1 << 23)
-#endif
-
-#ifndef bit_SSE
-#define bit_SSE		(1 << 25)
-#endif
-
-#ifndef bit_SSE2
-#define bit_SSE2	(1 << 26)
-#endif
-
-#ifndef bit_SSE3
-#define bit_SSE3	(1 << 0)
-#endif
-
-#ifndef bit_SSSE3
-#define bit_SSSE3	(1 << 9)
-#endif
-
-#ifndef bit_SSE4_1
-#define bit_SSE4_1	(1 << 19)
-#endif
-
-#ifndef bit_SSE4_2
-#define bit_SSE4_2	(1 << 20)
-#endif
-
-#ifndef bit_OSXSAVE
-#define bit_OSXSAVE	(1 << 27)
-#endif
-
-#ifndef bit_AVX
-#define bit_AVX		(1 << 28)
-#endif
-
-#ifndef bit_F16C
-#define bit_F16C	(1 << 29)
-#endif
-
-#ifndef bit_AVX2
-#define bit_AVX2	(1<<5)
-#endif
-
-#define xgetbv(index,eax,edx) \
-	__asm__ ("xgetbv" : "=a"(eax), "=d"(edx) : "c" (index))
-
-#define has_YMM 0x1
-
 #if defined(__x86_64__) || defined(__i386__)
-unsigned igt_x86_features(void)
-{
-	unsigned max = __get_cpuid_max(BASIC_CPUID, 0);
-	unsigned eax, ebx, ecx, edx;
-	unsigned features = 0;
-	unsigned extra = 0;
-
-	if (max >= 1) {
-		__cpuid(1, eax, ebx, ecx, edx);
-
-		if (ecx & bit_SSE3)
-			features |= SSE3;
-
-		if (ecx & bit_SSSE3)
-			features |= SSSE3;
-
-		if (ecx & bit_SSE4_1)
-			features |= SSE4_1;
-
-		if (ecx & bit_SSE4_2)
-			features |= SSE4_2;
-
-		if (ecx & bit_OSXSAVE) {
-			unsigned int bv_eax, bv_ecx;
-			xgetbv(0, bv_eax, bv_ecx);
-			if ((bv_eax & 6) == 6)
-				extra |= has_YMM;
-		}
-
-		if ((extra & has_YMM) && (ecx & bit_AVX))
-			features |= AVX;
-
-		if (edx & bit_MMX)
-			features |= MMX;
-
-		if (edx & bit_SSE)
-			features |= SSE;
-
-		if (edx & bit_SSE2)
-			features |= SSE2;
-
-		if (ecx & bit_F16C)
-			features |= F16C;
-	}
-
-	if (max >= 7) {
-		__cpuid_count(7, 0, eax, ebx, ecx, edx);
-
-		if ((extra & has_YMM) && (ebx & bit_AVX2))
-			features |= AVX2;
-	}
-
-	return features;
-}
-
 char *igt_x86_features_to_string(unsigned features, char *line)
 {
 	char *ret = line;
@@ -284,6 +169,7 @@ static void memcpy_from_wc(void *dst, const void *src, unsigned long len)
 	memcpy(dst, src, len);
 }
 
+__attribute__((flatten))
 static void (*resolve_memcpy_from_wc(void))(void *, const void *, unsigned long)
 {
 	if (igt_x86_features() & SSE4_1)
diff --git a/lib/igt_x86.h b/lib/igt_x86.h
index c7b84dec2..1e0195c4b 100644
--- a/lib/igt_x86.h
+++ b/lib/igt_x86.h
@@ -30,6 +30,14 @@
 #ifndef IGT_X86_H
 #define IGT_X86_H
 
+#ifdef HAVE_CPUID_H
+#include <cpuid.h>
+#else
+#define __get_cpuid_max(x, y) 0
+#define __cpuid(level, a, b, c, d) a = b = c = d = 0
+#define __cpuid_count(level, count, a, b, c, d) a = b = c = d = 0
+#endif
+
 #define MMX	0x1
 #define SSE	0x2
 #define SSE2	0x4
@@ -42,7 +50,114 @@
 #define F16C	0x200
 
 #if defined(__x86_64__) || defined(__i386__)
-unsigned igt_x86_features(void);
+
+#define BASIC_CPUID 0x0
+#define EXTENDED_CPUID 0x80000000
+
+#ifndef bit_MMX
+#define bit_MMX		(1 << 23)
+#endif
+
+#ifndef bit_SSE
+#define bit_SSE		(1 << 25)
+#endif
+
+#ifndef bit_SSE2
+#define bit_SSE2	(1 << 26)
+#endif
+
+#ifndef bit_SSE3
+#define bit_SSE3	(1 << 0)
+#endif
+
+#ifndef bit_SSSE3
+#define bit_SSSE3	(1 << 9)
+#endif
+
+#ifndef bit_SSE4_1
+#define bit_SSE4_1	(1 << 19)
+#endif
+
+#ifndef bit_SSE4_2
+#define bit_SSE4_2	(1 << 20)
+#endif
+
+#ifndef bit_OSXSAVE
+#define bit_OSXSAVE	(1 << 27)
+#endif
+
+#ifndef bit_AVX
+#define bit_AVX		(1 << 28)
+#endif
+
+#ifndef bit_F16C
+#define bit_F16C	(1 << 29)
+#endif
+
+#ifndef bit_AVX2
+#define bit_AVX2	(1<<5)
+#endif
+
+#define xgetbv(index,eax,edx) \
+	__asm__ ("xgetbv" : "=a"(eax), "=d"(edx) : "c" (index))
+
+#define has_YMM 0x1
+
+static inline unsigned igt_x86_features(void)
+{
+	unsigned max = __get_cpuid_max(BASIC_CPUID, 0);
+	unsigned eax, ebx, ecx, edx;
+	unsigned features = 0;
+	unsigned extra = 0;
+
+	if (max >= 1) {
+		__cpuid(1, eax, ebx, ecx, edx);
+
+		if (ecx & bit_SSE3)
+			features |= SSE3;
+
+		if (ecx & bit_SSSE3)
+			features |= SSSE3;
+
+		if (ecx & bit_SSE4_1)
+			features |= SSE4_1;
+
+		if (ecx & bit_SSE4_2)
+			features |= SSE4_2;
+
+		if (ecx & bit_OSXSAVE) {
+			unsigned int bv_eax, bv_ecx;
+			xgetbv(0, bv_eax, bv_ecx);
+			if ((bv_eax & 6) == 6)
+				extra |= has_YMM;
+		}
+
+		if ((extra & has_YMM) && (ecx & bit_AVX))
+			features |= AVX;
+
+		if (edx & bit_MMX)
+			features |= MMX;
+
+		if (edx & bit_SSE)
+			features |= SSE;
+
+		if (edx & bit_SSE2)
+			features |= SSE2;
+
+		if (ecx & bit_F16C)
+			features |= F16C;
+	}
+
+	if (max >= 7) {
+		__cpuid_count(7, 0, eax, ebx, ecx, edx);
+
+		if ((extra & has_YMM) && (ebx & bit_AVX2))
+			features |= AVX2;
+	}
+
+	return features;
+}
+
 char *igt_x86_features_to_string(unsigned features, char *line);
 #else
 static inline unsigned igt_x86_features(void)
-- 
2.43.0

