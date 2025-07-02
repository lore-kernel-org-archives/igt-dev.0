Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109F1C83F0D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B3210EA48;
	Fri,  4 Jul 2025 13:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="el4Q9pai";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44DC010E772
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:27 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AswxC020939
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3PtBraniMt
 5ty3O6M0zJCeao1OxUkgsqI1RcMenfG8=; b=el4Q9pai8vNMF6WBQlmfR1VkN9w
 WGHMUyh+jkaWOHNfnhQjagAiqtUucjBgdFUZt70QVd0D2o02jM44NH6dtCk4iVXj
 x0KnpGAr1lRd2cnHY+YAQU2tAFyT7G6JWPNMv1Jra7m8OzEEHmKkDni7bmU6dXTF
 ceuAsnnD11yaxXLF7FdiaEBwdkFkUReFqAS0G4Mkls4tlFhvuG9J/n0DUj2I0b2i
 gPcbpgYdWL/isdeTxCSM4eKi/Ht99JdHnKNqtNdz6UsOCbRC8ML1VcOgTY389yRS
 e/FVsqDMUotj/zvKf/5ZY+wQrosf96lXvliGKL+prSpd16TWMbTvOY3gsxw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn4dwm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:26 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b115fb801bcso8501926a12.3
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483005; x=1752087805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z3PtBraniMt5ty3O6M0zJCeao1OxUkgsqI1RcMenfG8=;
 b=FuRA3hJ1YD7q78OuyORtbR9S7q0U8iDabGwXFtvAfBsCrEd1bwdP/KGU0+pGy3lEgh
 ZK12Vp81jxGLcp9FbxE+Gz6hT4EHRekl5m5C+dOXbVlpGqfJolinD6utQZbwa2+FQxdf
 4aedt0sr46y8a5k9/9dIfn0RBvkSlo653Q/Fnq5tv+17SfJqFq3veBqBRe+0aXZ1n/Bc
 GAsXt621XAdRlK+FgCMMN7Jke2Gf3bK6t5qLXXy39NZrsYezcvNdWIHFQYbH3eY7PdwE
 rX0Al0jyn7girz7k5NkCwOjkFs2eNBaYVs07qBP49r2QDNdQ3ZmofbPj/Wi2vwPM1Nb6
 HJvw==
X-Gm-Message-State: AOJu0YwwHtzc3oTXpEuhIR1zaOixuWmaBAA25cJfPGUCAGJ3t/87IU8M
 nVTR2N2oa6cFT/DgqUnkh+Ec3vbqpYo97ZThbLQEwgKwiLkE+xDA+43JIGXKAPM/PqljrQscGZn
 PAHAPv79PYDyt/z6KRzaU6mISkDGd5nJQbFRQ9HZdX3u50jSpRdqVjmdEWEku8UkMEX+h59MmdS
 a1
X-Gm-Gg: ASbGncu+WnXbx+M9EGJy4PIuC+bIXqy93B18MDS004mKvfKLCuudkHOEpO4OcDNFyX2
 h25i1eXSCyI+ZAlbwF5EGjln0gFBvKUgu4m2IyBBOLqicg+MzUX/jn+6cvfz/ENgJz6WJw2Z6sJ
 ctFPKApq65V+lp71u5VxuEqdNmHkQphXQImca0JtH2b1bLYOldJBn50vmLzli5Wi3zrt+JAUk+S
 gCbaoxDxQEWq72MbCYYrctWpPgR8Zdk6S188dWLAIa4MZ659532Ztrz+3jMT+6V+gBAPMPfaDYy
 FA15HZhcL3XGpi8+8vOJWaExaYV9whaJzw==
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:79c4:5da6 with SMTP id
 adf61e73a8af0-222d7db4ffbmr5935065637.5.1751483005066; 
 Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRR+zKqm8Nvu+uFQJAoi0TrGyHLk0CLFtKdKtbIWBkF0qNH9y4KwsTkzhS4Jy/71vAzZ5z0g==
X-Received: by 2002:a05:6a20:7fa7:b0:1f5:79c4:5da6 with SMTP id
 adf61e73a8af0-222d7db4ffbmr5935041637.5.1751483004536; 
 Wed, 02 Jul 2025 12:03:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e3009154sm13528169a12.1.2025.07.02.12.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:24 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 6/9] tests/msm/msm_mapping: Add additional subtests
Date: Wed,  2 Jul 2025 12:02:46 -0700
Message-ID: <20250702190249.376313-7-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX/cqRq/DbqdVI
 RSTZhp8nOhx0U7ktsFOjPHAy1eVB7hD5cRotbmYQ2dZxIiIKQba61hJZZwnTsT9H1LBGUqyVdpf
 yAepja2FRuduYa/wZ88YZEdKvuXc1YX0GL41ndxHO+WzO95CLmEnyhvqA0JWY9UbLynkfqPJHb5
 4M7mjCkcOSyL5nDNt+7x2irXxt7SL0k5GyBe0W1DThIuDt/lutlR+S0ZfSKmOuBRMP5KMvBT96Z
 7B0BvKldfcB/jyAjrKsSVNtTa4gvgwQ6DFTdiNV4FsOgmqhk/HmQE6Vybaep05KS9XN2ObU6b2C
 GARXHOSj754Nr+8j1QxxAdVXv7oDgfFl8089gbrHBQOsGh1a0Y6oa9KEa/yk9j4S1xuOSj3VV6K
 Km7hv1PvZWQ2G/QgeQPIPI/POIff5UYTDPNbVSkAA6BKq6Qmf/ss46gcTxyH/0dKjxxEmrL2
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865827e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=uKBAPi6pz9e2o7ac47oA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Yk5saJd6kgGYf3__N8Zkwm148ekZWvDe
X-Proofpoint-GUID: Yk5saJd6kgGYf3__N8Zkwm148ekZWvDe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=798 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156
X-Mailman-Approved-At: Fri, 04 Jul 2025 13:30:47 +0000
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

Test a few additional buffers that userspace should not have access to.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 923bf8734bd2..95f5f5635881 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -256,6 +256,36 @@ igt_main
 		do_mapping_test(pipe, "shadow", false);
 	}
 
+	igt_describe("Test pwrup_reglist mapping, should be inaccessible");
+	igt_subtest("pwrup_reglist") {
+		do_mapping_test(pipe, "pwrup_reglist", true);
+		do_mapping_test(pipe, "pwrup_reglist", false);
+	}
+
+	igt_describe("Test memptrs mapping, should be inaccessible");
+	igt_subtest("memptrs") {
+		/*
+		 * This test will fail on older GPUs without HW_APRIV, but
+		 * there isn't a good way to test that from userspace, short
+		 * of maintaining a giant table.  Probably just easier to
+		 * list it in xfails or skips for those GPUs.
+		 */
+		do_mapping_test(pipe, "memptrs", true);
+		do_mapping_test(pipe, "memptrs", false);
+	}
+
+	igt_describe("Test 'preempt_record ring0' mapping, should be inaccessible");
+	igt_subtest("preempt_record_ring0") {
+		do_mapping_test(pipe, "preempt_record ring0", true);
+		do_mapping_test(pipe, "preempt_record ring0", false);
+	}
+
+	igt_describe("Test 'preempt_smmu_info ring0' mapping, should be inaccessible");
+	igt_subtest("preempt_smmu_info_ring0") {
+		do_mapping_test(pipe, "preempt_smmu_info ring0", true);
+		do_mapping_test(pipe, "preempt_smmu_info ring0", false);
+	}
+
 	igt_fixture {
 		igt_msm_pipe_close(pipe);
 		igt_msm_dev_close(dev);
-- 
2.50.0

