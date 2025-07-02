Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6A5C83F09
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A0B10EA4F;
	Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Yb/shqHF";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5CF10E772
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DhZew000442
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=LugcnasxnrE
 5DjEWFlon6r+QRV3BHdeB4TczQqxOcnw=; b=Yb/shqHFNX1bJWDYg9+bVPGYg44
 9rBGAeUxIcErPAObiShH+Jeh+VpxD8RonCAQQuMoITb5YSH+8BiyjDh4LlJLiQR/
 mVa2A9XWB1a+X3KCKB9uyR1nGwBa+lttZoUiYkX0j7br67ey55MmkvUmbrIU3dnn
 j9yQpk79GIwkmzTB8CYFQtjUNCzFuT42kh6U0TL+v8VHOvmFw0IZ5/6l6WHllqYN
 2G3+mVLSRAI92cmCjbbmW2o/pGlbFhzUisO/2htob8W40PtBp+HPJX1NE8orDGmv
 xvGNb3lYHrmfktU2cNWA8EjNmGVH/Ymlfjn5YMatuP5oK0kqG7AjYsShkiw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmdnjh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:22 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b350d850677so2457698a12.2
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483001; x=1752087801;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LugcnasxnrE5DjEWFlon6r+QRV3BHdeB4TczQqxOcnw=;
 b=Ig6w9mHrgYuCchdO5Q+zThc1SFAt4daF1gQXqoUYeIkdiCr4rfG8WB6Pp1RWvnmHh8
 Rzz9dSi/smHa29UFNfy1LzgVTXUweReaMhOgDQLxki0rap/QZE97WWGZBruBVqQVQO/5
 XfZjn1e6qCbnuMqwKUZSoAGeGlNlilOaBFx/7ouK3JoOoJTwMBwBm/mvx1W+D89BPzrb
 t0j4ou74rbaE5N6BL4mR0SDjmy2Msx5KcHp9BNbSVry+ktnlnPZX+zi96o0eX1su7Qwh
 wVl5usO4lz/fNdJ66gtDIlVLr3WIT0Igwf+pCSQorlWajKrr/OIl+uhY9Kp0vFO6nLBY
 6fig==
X-Gm-Message-State: AOJu0Yxv7zvhWd6YClS6kp7tF7evrtQjNKkv9GUphRmC7BEysDq2eYgF
 wKXIncQUGObT8hXe1lRZ2pU9q86PTvuibgrjPmxdnF6u/ileackv83PehlfQFslMonVd6nbqAQk
 ihE88T2RW4Ixxr/bINVkhFeDKJ0hicqTsVXGnxONMbtzP69+dADfuCH+4axCF0NQBnOMJFo+WFd
 B6
X-Gm-Gg: ASbGncvbSD39mjfdOaB0sG/gzPAmK1txnQNvwjPB1p7l3GbVDnrM8YeVCtlG3kw/p2e
 HwimMsaXYxXjzuWSgWQDeLeNBzrV1izF+m3UaYt3o0jY6xFDwUSWzB4It1HvqlgIgp1ldZVZECt
 mSrbRwJCTXNyS3lqtp5FsmzL2XaBorH+pcItPd278KJwbvAoTH4cESH5/MjzoTVxU+65vKYnJfu
 YIE3RZWBUoAiHL2SpjMrJjVoLgAjSJlJ3yZr5TOjazwUemYodWRNiH50TcaM9fePd5O2VAEI381
 5ZPJF91oPy9szKngcPqUFlDwcOm1XZ7y+g==
X-Received: by 2002:a05:6a21:68f:b0:1f5:8de8:3b1a with SMTP id
 adf61e73a8af0-2240a6fe5dcmr1039392637.13.1751483001496; 
 Wed, 02 Jul 2025 12:03:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0YhGuPC3GZVC7Y63gQdnclTe5KNlyRw9QCw2qK9nNcCqPSiACQpIHLTo/uSJ8VFyMK5OOxA==
X-Received: by 2002:a05:6a21:68f:b0:1f5:8de8:3b1a with SMTP id
 adf61e73a8af0-2240a6fe5dcmr1039363637.13.1751483001038; 
 Wed, 02 Jul 2025 12:03:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e3013d8bsm13483174a12.15.2025.07.02.12.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:20 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 3/9] tests/msm/msm_recovery: add iova-fault-stress
 test
Date: Wed,  2 Jul 2025 12:02:43 -0700
Message-ID: <20250702190249.376313-4-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6865827b cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=WfHhPgbtyIMZGUekbm8A:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: dzdXSWQNBqAyG_SqEeWD__EdOCLsj8f8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXym9HZ+fsI7Hu
 V53sENgNseSjipyL3YJ7p29fyYWzEEOSxdpEr/3o42zOAnJrlE7ZkCtxTbzFgOPbnLOq0u2aZSU
 bVZzTJ3z/ft1t7OHkxm0h6qr6lfAKoyYuS7HyGzVPaXbPGimQY7IImJkUwmyqh5oIkmt5oz+k7n
 r5itOyxV7YYtnf2/1hR4PzN3/FK+BBS5YYHvfO9mxuttESVFLKQz74vMPsnxkDz5mCLh+9msixf
 dIu+GI59vZLxz2Aj2oScUTb+/r5t2scSNP4CLf8VYab8MRYgHBb4BiwTUJ9JsMh/Kux3JOpg7T5
 TuiqEnhk1FOmt3EJU8qgUwFsdnjkOnFpt4rW8SmAN2FEX37CudI1oT/UZpKyPsxuseiTEUf6Cwq
 Uky+6IUxNTTH2mtviIkWnQPJRwAVagtX/fEGlcOKMfL9YGCm07xAHaAtS/FfFSofUoZAL2Wn
X-Proofpoint-GUID: dzdXSWQNBqAyG_SqEeWD__EdOCLsj8f8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Add a test which triggers many faults to test robustness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_recovery.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/tests/msm/msm_recovery.c b/tests/msm/msm_recovery.c
index 433392079bd4..7b6e3d76e087 100644
--- a/tests/msm/msm_recovery.c
+++ b/tests/msm/msm_recovery.c
@@ -195,6 +195,22 @@ do_parallel_test(struct msm_pipe *pipe, int child)
 	igt_msm_cmd_free(cmd);
 }
 
+static void
+do_fault_test(struct msm_pipe *pipe, bool stress)
+{
+	struct msm_cmd *cmd = igt_msm_cmd_new(pipe, 0x10000);
+	unsigned int cnt = stress ? 0x10000 / 16 : 1;
+
+	for (unsigned int i = 0; i < cnt; i++) {
+		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
+		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
+		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
+		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	}
+
+	igt_wait_and_close(igt_msm_cmd_submit(cmd));
+}
+
 /*
  * Tests for drm/msm hangcheck, recovery, and fault handling
  */
@@ -242,18 +258,16 @@ igt_main
 
 	igt_describe("Test iova fault handling");
 	igt_subtest("iova-fault") {
-		struct msm_cmd *cmd;
-
 		igt_require(dev->gen >= 6);
 
-		cmd = igt_msm_cmd_new(pipe, 0x1000);
+		do_fault_test(pipe, false);
+	}
 
-		msm_cmd_pkt7(cmd, CP_MEM_WRITE, 3);
-		msm_cmd_emit(cmd, 0xdeaddead);           /* ADDR_LO */
-		msm_cmd_emit(cmd, 0x1);                  /* ADDR_HI */
-		msm_cmd_emit(cmd, 0x123);                /* VAL */
+	igt_describe("Test iova fault handling (stress)");
+	igt_subtest("iova-fault-stress") {
+		igt_require(dev->gen >= 6);
 
-		igt_wait_and_close(igt_msm_cmd_submit(cmd));
+		do_fault_test(pipe, true);
 	}
 
 	igt_fixture {
-- 
2.50.0

