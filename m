Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D20CC83F0C
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B26C10EA46;
	Fri,  4 Jul 2025 13:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dG3Gyt6g";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E33B10E778
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:28 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562G1Rp2024893
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=RVieOWNeJ8M
 MdayS7WadzxA62ARSjnJLctXxysDjRjI=; b=dG3Gyt6gRioW1gmdTtRBFOsVFz1
 JPJ0aeIfI6zvDUQftDe9Uvk+AqgH0sp56HIyWavuRHUwOZv553jkSrtaE/Q/F4nF
 S08lJZmjXp+9HS0mS57eXMmjKVx5uv/R2mXMkZPSiqhhZPd2JYPek5BJneDNCDRq
 +wT/gi16jofFj+3hyRZUUCqmSduonzOEDez2ZkkivonorGMYX7soB74SJWxt2bJB
 quoQp3rEtDqzxSCIECydOfAvZRAlQkhJMHFOln5P0NhwfmEVkWrBbEbbyEmjn4sc
 ClM5gIay983NSy/cxYORXJiDLjaMD5aCJb7kNZZp/hBF6mEhPUe8pMdiAYg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8025jk0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-747ddba7c90so3957965b3a.0
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483006; x=1752087806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RVieOWNeJ8MMdayS7WadzxA62ARSjnJLctXxysDjRjI=;
 b=eYJnS1vfN6eSGZbv0zJ4iJq/mv63wBz2eHeI9VhsnIg2MDtNzCZE+bHgP1/wvlkyL9
 zabznJHQJyQebfB8fpD7G8kpoCQQcHc7iRxu3gvFjq0GHrKrh2SBD+lmQcp1MXuAia3l
 5FNn9ld22jqn4OAJqvAgVEZOkx7eu9IQEjxl3zW1Sty5Ab/2mxEe+oLsZ8fGMGdhphGZ
 7wvA4jTzIjm/PG/63G94Csp/VkAm3n+Vcp7Ci9FD1wWtr8+qZ7I3PA1IIoNPDkJ+OcMs
 Xi17TPECA3eOqjziJpEteybnWslFNOtak1vKagHhAMh4Kb1nqdEC/AW8jjAb6rh4CSnQ
 lJBg==
X-Gm-Message-State: AOJu0Yw5eJilIVbgvsrwIndY3Wm5hPGP0H4gmy9MfwE2t4HnmW3Uz3o1
 HUpxIHZELnK8Zi6hYPqmgB/aAuk/+Mt7yvpvLipGk+p5zCgBesqa2osvhQNQDfbCf4aOXolztN0
 8qAUaNh4aTGD6d37OP52blXbjNV+mP33I+HYVDE0RvTH8jIr4g5oQIt3TfkWebe2yJ8FJ0qdGLe
 VP
X-Gm-Gg: ASbGncs4Kca4EigVL/GdDzVdLbf7ZMw6+n3tmLdHR8nzsqpg2Lwb6+idgAEb96x85h8
 ycCjbZI7eoFhZC2lXZskysHaf8UrusfvgPJUNGJgwrGUNZWT5ehBF8OJPZ8kNoAcDo7Gq2lcGoo
 zf/tYdN6RFxe62Jhqi4AzVIhTw7h2BxxB9U2k0eEb4JiE6S1XwPSfyw7JFmB+Nw0vjgjeoNZrSD
 2slWwAlJ59jM26cjYh6kMq1lAES/g+XPRofzdl/26j2EPPjK3AlyqVOBHYEXW9MocHbYL3wXXFe
 hDLPM5aUUM16bFg/IpwA1dkQJEgKdOe8hw==
X-Received: by 2002:a05:6a21:32a8:b0:1f5:591b:4f7a with SMTP id
 adf61e73a8af0-2240c3afc6dmr897827637.38.1751483005883; 
 Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4JCxNMzkHFGamTgBRTgqFiDHwKuAeuy24Hr05yKIF4gb7mpEXVdg7LMk/xaDgCwibv25LMQ==
X-Received: by 2002:a05:6a21:32a8:b0:1f5:591b:4f7a with SMTP id
 adf61e73a8af0-2240c3afc6dmr897800637.38.1751483005486; 
 Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af57ee760sm14274269b3a.155.2025.07.02.12.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 7/9] tests/msm/msm_mapping: Wait for devcore
Date: Wed,  2 Jul 2025 12:02:47 -0700
Message-ID: <20250702190249.376313-8-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ZH7r4prOxeBRpBG0tnhd-NHFWFuJhvPQ
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6865827f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=wbXP5UgKaa9MPXhy6qkA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ZH7r4prOxeBRpBG0tnhd-NHFWFuJhvPQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfXwut6ZMY0INRJ
 99gfxhffd5PcsHrigPiUC9louMvglRLO5D0W3S6ODEE6mPqaZ15NckCHzysiYHT3Iz5S8Is3L1R
 aL/5kCtAMhqjaQKoz2gyouQweug5HIAxYczAOg0IFlLxoQJkur6BPOH/nDgWTLPCYZT9zqoHluJ
 U1vAcvX5AIp7RYIhLvi++tANXSaCL/t7+c6ZXQ2Vw5Eray3kJ1JIvmslT2k+6DkbEEu40C1o+C9
 T4j3hO+vTA17JTAjQFQfeTX0ZbwW+1VucMhGa0rls4Ege5IH2g+oLRCUlSl9T0yCqeLRa2s7Awp
 MaSnsjz11NgZhZF+bAqAizHwSCC2DkphfotDfkknWs7DUQWx/sOzEwnVyIfM1/BFMJUDVn8ZRbI
 WPAd9/jYrB+8CftSiSljrVLjZ7wUD2H9bjgEPbbiLtmXKBqsBQTQlCKrQXhLDLyz+73gH0Jn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020156
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

The devcore could take some time to show up, so add a igt_wait() with
timeout so we don't fail the test if the devcore is not immediately
available.

This addresses a source of flakeyness.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 95f5f5635881..1e166570787d 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -42,14 +42,18 @@
  */
 
 static char *
-get_and_clear_devcore(void)
+get_and_clear_devcore(int timeout_ms)
 {
 	glob_t glob_buf = {0};
 	char *buf = NULL;
-	int ret, fd;
+	int fd;
 
-	ret = glob("/sys/class/devcoredump/devcd*/data", GLOB_NOSORT, NULL, &glob_buf);
-	if ((ret == GLOB_NOMATCH) || !glob_buf.gl_pathc)
+	/* The devcore shows up asynchronously, so it might not be
+	 * immediately available:
+	 */
+	if (!igt_wait(glob("/sys/class/devcoredump/devcd*/data",
+			   GLOB_NOSORT, NULL, &glob_buf) != GLOB_NOMATCH,
+		      timeout_ms, 100))
 		return NULL;
 
 	fd = open(glob_buf.gl_pathv[0], O_RDWR);
@@ -176,7 +180,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	int fence_fd, ret;
 
 	/* Clear any existing devcore's: */
-	while ((devcore = get_and_clear_devcore())) {
+	while ((devcore = get_and_clear_devcore(0))) {
 		free(devcore);
 	}
 
@@ -209,7 +213,7 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	/* And now we should have gotten a devcore from the iova fault
 	 * triggered by the read or write:
 	 */
-	devcore = get_and_clear_devcore();
+	devcore = get_and_clear_devcore(1000);
 	igt_fail_on(!devcore);
 
 	/* Make sure the devcore is from iova fault: */
-- 
2.50.0

