Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EFCD116E2
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 16:18:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B47710E17F;
	Fri, 28 Nov 2025 16:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Acmcl+an";
	dkim-atps=neutral
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA3410E17F
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 16:18:42 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-640aaa89697so3063220a12.3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 08:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764346720; x=1764951520; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9s+ZSLHB65pXCtcSspXfLMJ5pRhBNBeGJmZJzOyxWHk=;
 b=Acmcl+anfI9ErzLq31N3bTIw9k/XKiAHUlbTT4iRPLNqc2EDkz9Hkm7NO5nkTHB8V/
 NQptqFABXy2tNuzsE6ldwhckHwLAFRbf5tlhhIlpIxPk5hGaK3qurUYoXfG2TWsH9hD9
 aLrcs86ovt1KDaU83TA4eJSrv14PplxqGLMsK9Vaiaousy5gCgrqdOilc0HKAwdZQbkj
 hqPoivLL+bFFxEDFPM98yyjMRFAUTpWKDscuIcPSqPsFRl8XhHW/UnUuuD6rI3aQQSRq
 OKbi26Fbk9iVW9JsZl0+GVE2vp12yi2oRbMyi2ssJ8MgLeNdpMiofeXcaTBdouT3G4vD
 K3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764346720; x=1764951520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9s+ZSLHB65pXCtcSspXfLMJ5pRhBNBeGJmZJzOyxWHk=;
 b=HQDYYjhwUB+RwXI7j83Hp+b39sAIPvZz2DuM88JRjo/ZkvKatKvU680R5KdYzIhm6R
 qJTjrSU3JbpvTk+5UkIabke2A15m5KxxLPTIGhijAoA+fYktmRTGBhFRD0QMwpsvB3Xv
 kVT+3otcMtbxpPfXHu5GJ0IEd5h9Vu4EMYYq4dDjLV5bMq0tzadBRYp7D05YWHgRYbV8
 3QONih1n06O6N7q2pWoUOsSU4iJexKdZdFnawXI5C4Z/e5MP2gj72V1uo7c1E/B/Vmfy
 VwdZ1eOcvIfN65eD/SxRYikrPlobu5RJowZOzloXVsLA3rJiqK86YlFAoCkeAz+z6RKg
 w4vA==
X-Gm-Message-State: AOJu0YyPIUs3Zyqsns+cA1bPA5DJso4UMWiO+WgQs3trDMyCIUEKJN/k
 oMuwZqOZ43kjold4e1oEA/VVvkuscBaDepSA7gRVPbd3b0r6Am1d2+fj9sRikCfnf2c=
X-Gm-Gg: ASbGncvDWdqa9IguHh3enX0LBIu6RY1t8Ppr/UUaBfvWsN0M8UiW5Oq8EdFJWHZF/nP
 F2GQ/cAwuFdISYlbAkaLkUH3MOrCRSbWb1OmWP9NeDoq0BXinZfU3DKBdVKz5rPkI5oG+pCmgS7
 T6n1w7eEOz1PImzCGHgLLvyssqN+QAwztyhWbf2t9RwBoaqonvu/FM1sE3HGvPN1bvqt2+VPwMQ
 o0MPadcwF+idPXShUuHEQvQX0o216MGX+qxZoAsnmZFSPTNJxfucBhVUgU5HvbasrnTWRrAx98l
 qAiPNKg+aKHaZAP2lm8s1xElgTk3Vvx5G//08T8CDvrWFde6bVduw20+i8RNyuIKFM6iy5GxqCF
 wA2VA9Hs1/FzcqezGB2eUby20A89HhqwUb47SELKhTJEi24XZnY/+vQZi2C9xmvJ+yst8VJsNRm
 sjmLx31NSluJLnWSTl1X9Oa6AqG+duS3FLTqFhix0Jww==
X-Google-Smtp-Source: AGHT+IH8vsJ2tFB299wSGogzbUQOcr6++TCoi4D5+JwK8GAEp3dgi4LOOzsY+nVOFXuzGhyLKyLcvQ==
X-Received: by 2002:a17:906:b4a:b0:b73:53ab:cfa1 with SMTP id
 a640c23a62f3a-b76715ab9ebmr2327198066b.17.1764346719904; 
 Fri, 28 Nov 2025 08:18:39 -0800 (PST)
Received: from localhost (84-40-238-204.cgnat.inetia.pl. [84.40.238.204])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a4b926sm480853566b.68.2025.11.28.08.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 08:18:39 -0800 (PST)
From: Kostiantyn Naddur <kostianaddur@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Pawel Sikora <pawel.sikora@linux.intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Kostiantyn Naddur <kostianaddur@gmail.com>
Subject: [PATH i-g-t v1 1/1] tools/intel_gpu_frequency: prevent failure w/o
 root by properly specifying the write mode
Date: Fri, 28 Nov 2025 17:18:25 +0100
Message-ID: <20251128161832.24515-2-kostianaddur@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251128161832.24515-1-kostianaddur@gmail.com>
References: <20251128161832.24515-1-kostianaddur@gmail.com>
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

Running intel_gpu_frequency without properly specified write
modes leads to core dump.

printf("%s %s\n", freq_info->path, freq_info->mode) was used in
initialize_freq_info() to understand what was going on.

To fix core dump while keeping the workability of read-only functions,
the verify_write_cond() was added, which checks whether the program is
running with root and what write mode the functions are using, and then
changes the "min" and "max" modes to "rb+".

Fixes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/184

Signed-off-by: Kostiantyn Naddur <kostianaddur@gmail.com>
---
 tools/intel_gpu_frequency.c | 38 +++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tools/intel_gpu_frequency.c b/tools/intel_gpu_frequency.c
index 8c3c91313..8f5719265 100644
--- a/tools/intel_gpu_frequency.c
+++ b/tools/intel_gpu_frequency.c
@@ -24,6 +24,7 @@
 #include <assert.h>
 #include <getopt.h>
 #include <stdio.h>
+#include <stdlib.h>
 #include <time.h>
 #include <unistd.h>
 
@@ -52,10 +53,10 @@ struct freq_info {
 };
 
 static struct freq_info info[] = {
-	{ "cur", "r"  },
-	{ "min", "rb+" },
+	{ "cur", "r" },
+	{ "min", "r" },
 	{ "RP1", "r" },
-	{ "max", "rb+" },
+	{ "max", "r" },
 	{ "RP0", "r" },
 	{ "RPn", "r" }
 };
@@ -117,6 +118,21 @@ static int get_frequency(struct freq_info *freq_info)
 	return val;
 }
 
+static void verify_write_cond(bool write)
+{
+	if (getuid() != 0) {
+		fprintf(stderr, "Failed to initialize! (Permission denied)\n");
+		exit(EXIT_FAILURE);
+	}
+
+	if (write == true) {
+		if (strcmp(info[1].mode, "r") == 0)
+			info[1].mode = "rb+";
+		if (strcmp(info[3].mode, "r") == 0)
+			info[3].mode = "rb+";
+	}
+}
+
 static void __attribute__((noreturn))
 usage(const char *prog, int err)
 {
@@ -225,6 +241,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			}
 
 			write = true;
+			verify_write_cond(write);
 			act_upon[MIN] = true;
 			act_upon[MAX] = true;
 			sscanf(optarg, "%d", &new_freq[MAX]);
@@ -240,6 +257,7 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 			}
 
 			write = true;
+			verify_write_cond(write);
 
 			if (!strncmp("min=", optarg, 4)) {
 				act_upon[MIN] = true;
@@ -259,35 +277,39 @@ parse(int argc, char *argv[], bool *act_upon, size_t act_upon_n, int *new_freq)
 					"FIXME: Warning efficient frequency information is incorrect.\n");
 				exit(EXIT_FAILURE);
 			}
+			write = true;
+			verify_write_cond(write);
 			tmp = get_frequency(&info[EFF]);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
 			act_upon[MAX] = true;
-			write = true;
 			break;
 		case 'i': /* mIn */
+			write = true;
+			verify_write_cond(write);
 			tmp = get_frequency(&info[RPn]);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
 			act_upon[MAX] = true;
-			write = true;
 			break;
 		case 'm': /* max */
+			write = true;
+			verify_write_cond(write);
 			tmp = get_frequency(&info[RP0]);
 			new_freq[MIN] = tmp;
 			new_freq[MAX] = tmp;
 			act_upon[MIN] = true;
 			act_upon[MAX] = true;
-			write = true;
 			break;
 		case 'd': /* defaults */
+			write = true;
+			verify_write_cond(write);
 			new_freq[MIN] = get_frequency(&info[RPn]);
 			new_freq[MAX] = get_frequency(&info[RP0]);
 			act_upon[MIN] = true;
 			act_upon[MAX] = true;
-			write = true;
 			break;
 		default:
 			fprintf(stderr, "Error: unknown option\n");
@@ -301,7 +323,6 @@ done:
 
 int main(int argc, char *argv[])
 {
-
 	bool write, fail, targets[MAX+1] = {false};
 	int i, fd, try = 1, set_freq[MAX+1] = {0};
 
@@ -334,6 +355,7 @@ again:
 			continue;
 
 		if (write) {
+			verify_write_cond(write);
 			set_frequency(&info[i], set_freq[i]);
 			if (get_frequency(&info[i]) != set_freq[i])
 				fail = true;
-- 
2.52.0

