Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E581CA5FDD
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 19:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4413F10F971;
	Fri,  2 Oct 2026 19:14:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cQS9ZEQe";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZFaUdyi9";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60B010F971
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 19:14:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 692H6F2q1880905
 for <igt-dev@lists.freedesktop.org>; Fri, 2 Oct 2026 19:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=ykft+1478k49OtqS3M0FpfpiYxj6hUL7pzr
 E0LzS55o=; b=cQS9ZEQeaTn18Mk2ENKa1M6HgVY4xxwi3K/QV7K2uvj2WmYj9Ed
 JR+kbXIHw5XHLf3XOfApA6tXakenT+RMVUkdy1mSkWN3kczOetapUNUGJCMiyHPf
 XSyqsxg0qHwvJiy+5KBsXaC14r9vaGChABVJNUm7vRUlUKzbvDrJobQ1FTfEIrAw
 0/s+r0ENJjHgxWu7wnUQE3UCrTk7Pz3nZsCXtpVwtOIaqlT6SktrzduBGsdkmakI
 JCS/cqPfQGfwu6BB60h/tx2o85Glr8szWiiYAP5bFJKH5Yth3CFNC7DqjQRRQac4
 L56A8FjdCO4novUluzQWpeY5U03dqdQtOSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ec9973s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Oct 2026 19:14:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93ca4a2b9c4so642594085a.0
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Oct 2026 12:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790968444; x=1791573244;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ykft+1478k49OtqS3M0FpfpiYxj6hUL7pzrE0LzS55o=;
 b=ZFaUdyi9tkGKh4EWOfpE+HYb8NdBhlHc8arLT3OsmsSHufOtCyyN29waiEEYhA14Pc
 ILuGpGJWT3ZLVMt+IbszwV8Rb5bUNBqzmdLUJAe8d5T8vx2RrgqmLGEObI6MC1HqXiRS
 2ait4zfF0vKDkNYBuhQTZ77Eay3tOTMCm+jm5Cub1cfxlLiMOJMyK4L1bK87b2L6EwdG
 51yP6coCNPTZdkpFrv6rjLNn9NXu1WW7JUFuTWjxbERp2TlVfrrV0wuEE5qVGiFECuoa
 iBrZex82Gi2xqMgIN24rqGTK2rICgrg+EJQ3prt87fNhcqv7mAbBM1xa9HrZZ2v5BJj2
 sQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790968444; x=1791573244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ykft+1478k49OtqS3M0FpfpiYxj6hUL7pzrE0LzS55o=;
 b=Bknj2urkx9rxP7iDjB/sQm4ZPQju5oxFhKLGCe/HQore2nUoMN4khAo+0YyAfILXNg
 0njgv+8wqIqeKs0IqGF3ulL4YdHRa/Sn5MborlnLZB/JXXD93tvpWf98rLa0fkryJpxQ
 KqT5YDNV6PJlu1d14aIG6h8TdwGsPU/3BXeQTFaCo3z6RZdZgiEnXlmml4uqkPznPWgQ
 We61dc0CqVgPAh3XhByO4MojyNy4yx07Qx1zis1DRaKEQ1GLT6qkVqPT6jnoVaqwFUoK
 b4mm4EvjbNdffIiwJFCSCm8vARorU7uqJF7TbKd0bkOYtmI/bzP4hLtSVSgXETLPj/CF
 lp7g==
X-Gm-Message-State: AFuF++mHJjN55Txw8vIDRlPlI3wZpXsm7NCh8X8voNrXcuoMDyfjexHV
 g0EQAhW/2EhN8oEOxKwiC/I4yb0MSIZLLyO/2VN04ksvWL61dRk5V6cPc+gWLYeDQGft3db87zy
 B+jNRTEi7RMmaGLACbJSTWpFyGttTmuh05+qm6EH0ihb13cqa2YXdZO8ANlZnKyi2yhf5Bm0lSz
 C8
X-Gm-Gg: AYBFou1/ZdTRxRfgPOktefroBAr4lsjsCxHUM5YZ6avou5Om7hSDLzRYQC6ggOw5o1S
 0lpjyKFt6a8a6YvMsfWUkLoKxVA5+l3ovZU/Ehh9JH9pzo6K0WuKYEBr7CMSoxG11GtQOeErUxA
 XkhtjeJMA4sf+2zs7KuSl1YCDQcbRvYgvhLE5EJE2LIId+h55zKJWboKItODOFka2omNV+Al6j1
 PoB9Vil9sKCgRrObIPB4AJ3zETSW1fYuEpD7mhc0N26by2ErBXcHmBe+sXDYlMmFHB3PCUtHkkf
 Jg7E1K9v5HNIeJWj17gtYSdoVMYh7uCe+fY1JgnpChvfFhCyMN3Rgeo5WkIL9oXwW6buqp+3ZIt
 ATy10d1ZkN9CaijguvbPOxPKi19nSZO+HzczNlwVCNq3hnZqvdRw3rCI=
X-Received: by 2002:a05:620a:6f06:b0:93c:2c15:e508 with SMTP id
 af79cd13be357-93e51048361mr56341685a.45.1790968443625; 
 Fri, 02 Oct 2026 12:14:03 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:93c:2c15:e508 with SMTP id
 af79cd13be357-93e51048361mr56337385a.45.1790968443066; 
 Fri, 02 Oct 2026 12:14:03 -0700 (PDT)
Received: from rohan.home (91-155-188-102.elisa-laajakaista.fi.
 [91.155.188.102]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a87e31035esm12283451fa.30.2026.10.02.12.14.01
 for <igt-dev@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 12:14:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] tests/amdgpu: insert pause mnemonic only on x86 /
 x86_64 platforms
Date: Fri,  2 Oct 2026 22:14:01 +0300
Message-ID: <20261002191401.469214-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kZLhkqr4IhSR2ZYUdF_oTI8x6mgt_uuw
X-Authority-Analysis: v=2.4 cv=Ie8Symqa c=1 sm=1 tr=0 ts=6ac0027c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=jvhYrn/qE0q/JJxEcKsfTA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=ALo7Vrfhy5gUHL6t6tMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX2/ass5zNvKiU
 o0W4nKm4J1ZDl2RQPc2IrSwKzEzyqFkzk+I8VEPqA9e035ieJAVNvJbj+/G8vKWyv4+MZ++qlUA
 RlWDs9cS9u2ELzYbA7Rnn2VMQgDHOPU=
X-Proofpoint-ORIG-GUID: kZLhkqr4IhSR2ZYUdF_oTI8x6mgt_uuw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NiBTYWx0ZWRfX/WZDmZukdsWc
 bSbWjZOZHa5ZVSF6MhXwEo4MQ4u/hVoCLGtDAYgV93bT/SgqglMU6W+mOlHa5BI9BSUHFupcVV5
 sqkbQqI7OLc81AgldZw9tjaJuHB9dNatO/rqTgPG4j+7Hv5f386xu8kvF6L47JZUEbsd6f/WiTC
 y3tytvIWzTVFiqm8sTbOQUjRv1fLZHp4PrH8X3xbIpVS3OnfaZe+znJYCXzcoi95Zf7OTuXcQYT
 YwLhjO6FU/ixx6swfEHm9/VyfLexdmaihrLtSW4wHwpqOO7dvzpcPfn6G1Ds5k2Xwnk/X2Yq/WG
 3mS1rAL/QKWDigNwAi33HQ3Qu5OWagWSBUaJDMAPk6lza9XaReB+MDPXSuufuzR7CQC51N21nKt
 gvG9rkYo87PezeNg6tA/2nxnJ5SFj28ys4npzijkn/gXN9PQwpBk8hhPGuNg3vkPk0OfYVf0aUg
 nRk4pBL0TNH88IT52Zg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020076
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

The "pause" assembly mnemonic is only available on IA-32 platforms,
breaking e.g. debug IGT builds on ARM / AArch64. The issue manifests
only with -O1 or -O0, the default -O2 seems to optimize the condition
away.

Guard this inline assembly with the preprocessor checks, making sure
that other platforms don't see the invalid assembly.

FAILED: [code=1] tests/amdgpu/amd_basic.p/amd_basic.c.o
Assembler messages:
{standard input}:3702: Error: unknown mnemonic `pause' -- `pause'

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 tests/amdgpu/amd_basic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 418db286f81f..494934c1c321 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -705,8 +705,10 @@ static int wait_for_value64(volatile uint64_t *ptr, uint64_t expected,
 		/* Sleep if interval specified, otherwise tight loop */
 		if (check_interval_ns > 0)
 			nanosleep(&sleep_time, NULL);
+#if defined(x86_64) || defined(i386)
 		else
 			__asm__ __volatile__("pause" ::: "memory"); /* CPU hint for spin-wait */
+#endif
 	}
 }
 
-- 
2.53.0

