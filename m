Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2652AC8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD7310E4BA;
	Mon, 30 Jun 2025 18:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyCU05It";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B1710E4B3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:41 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UGG3Pd001184
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=55DQSDgU9XN
 WkZSlf7911sVDtNc0BKCuuJITO8Sc7fo=; b=QyCU05ItWiAZAZNy1fGrl97gOkx
 SwAUgVexeb8JttYAYuMFiKR4md1DQ/VmlQUT2Q3l9ruhhUNv/7TjpX8hiEMzIq42
 lVmgRXaBZAU0NhGyUUIS3Y22d7/wRt5HTkL2tOn1HXUzWjpuSSfCg5epJNMql9OQ
 LiQJ7LrcJa3iCg/FkwEe4NlCA+o1PQ0vBNikoaobwj+iD2Y+ha39jTyenywrriwj
 7YOKmmHFeaElancx54uPREK9gRWUIPzy9QZQ4ZLgmAjjsc+phD7bu8sv5a9w2QIu
 JdheTtX3xgVv9qbR7oZswboaSc9IhdH2yWiEzttEjawKJ/TEioBATi2lABA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm5rak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-237f8d64263so38816675ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306979; x=1751911779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=55DQSDgU9XNWkZSlf7911sVDtNc0BKCuuJITO8Sc7fo=;
 b=Hyi1aTCNXqYDbIvrNrDgURE++VBYf/2QsMMG+pAH2l1BtmPjw3i7L+mX5MEFjhQdeR
 4aWMPwwyZYiQt+kZblSvp56lBb4Z7wF0lDTcModbNvpAeMBsTlKAJF88c4oRoHEk3eDH
 Oz5Hjyse/oAiW9A/GeA01L9+HEhbJJflRWkb2vf267Zb98I18CbI+IkMytnM/Zmc6rj1
 /Cx5nq0acets+NNWUn/GO4Sdh+HGYGp9oqAP9KPhs68m+6TpEsCY30/hTxa3DuMI7s32
 2O9YvGzITfRE0ImjyqAlw07UBrDE96TYQK2DB1UR01bhegvr+q6k7Uk5uwF9mqV7dB42
 j3Cw==
X-Gm-Message-State: AOJu0YxHxUtXPMOuEUMGYcVM9V1AmIeMslWDseq7by0DheCIFhukZi4p
 oBB0I5y2+TCdRl83/G/CkUhNmhKj5SyAOSXFy9cWpsaz/WXmL9wUAOx2pLxoKUOTEooKdcaiFt/
 w/43c5nHbTAUx1YVRuXz0fTz8y5AHo1wiphRuh9tZ8d3AX+VBb92Qv4ayAt0xuZutdhM570/cgu
 LM
X-Gm-Gg: ASbGncuycU9HXDHwQmuYx/4YaDlE3wPQ9gayU7JtXb25pxwIz55dJWooKLhORjN1z3P
 K0jiamt+WCeM5vF83hCUKot4gB+OOpkmJo23/YgZygsKPlQSbBOkm+4BeVdbo6dvgfEAkW4Yzi1
 +I8PkNA/wPNyHPJJY98NT4fuOPDcqStKa3gkrS9Xr8n9/0GLZ1axRmpQg1v59E5Z+o5dH3XTn8c
 Ul9ulYsXTwNj9ff0Zx1t2aggflpIZlQgfRRhrIUTZTyB9uArA2xnhW7RV6hhhfrv7yLBShK6WRF
 fAOV0KxHlgDHApgAzsHT2js6WrxDCETGrA==
X-Received: by 2002:a17:903:3d0e:b0:235:f45f:ed53 with SMTP id
 d9443c01a7336-23ac45e376amr211248865ad.33.1751306979038; 
 Mon, 30 Jun 2025 11:09:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEimgSP5MOd1GlXXxOYUtftx/nDjse1hzrKVUKPUaxykf/eRNnjnuj1oXkCdn8EmNGh/YHSYA==
X-Received: by 2002:a17:903:3d0e:b0:235:f45f:ed53 with SMTP id
 d9443c01a7336-23ac45e376amr211248575ad.33.1751306978638; 
 Mon, 30 Jun 2025 11:09:38 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3b8ec2sm86706595ad.183.2025.06.30.11.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:38 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 5/9] msm/mapping: Add additional subtests
Date: Mon, 30 Jun 2025 11:08:59 -0700
Message-ID: <20250630180903.77990-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6862d2e4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=uKBAPi6pz9e2o7ac47oA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: wI8V6mk_x4qXuEbWJoLdWrdkNSmUfYBz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NiBTYWx0ZWRfX79+8iYSJC6PX
 NrONMM9h4A5d+m9qgXnIR4moDQy/7OUI8ND/SGRLvgROgM6+2+TUKnSIQV3D5rsGB9Le6/H/t9c
 0yrXZCnY2zA9HFknrqNJxj8GPnaUepdlQCpv8wpPk88IySo0uglgRmBpseaWNgKFP1CLjGCdv5G
 XC+VF5L5gVr8Rufa4e2HhnZ4kgpJSmeetAPzWDMI0FSurzrD/tnMzWPpN2prp4Uj0RhJpaOFSPu
 RSQbXRvcUzp5Dfzbk/EDJ/hTdnc6IlHUvZNTWJ5d2yex8FYf2Ov2m97j+tTAbWmPr6GoRMI0Coh
 ZgNpy0+qawRX547bA5c94ntyedOjvJiq+1dH8rcsAimN4aYqM9V6HJ8pgRYAgqlNb90450k+93m
 Iv6/xLJvwp/6J670QGDvrxHw/cVaVE4ZFrc9L7E61CnAdvwseApFs6j5JXogVWAeuUiahr0Y
X-Proofpoint-GUID: wI8V6mk_x4qXuEbWJoLdWrdkNSmUfYBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=788
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300146
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

From: Rob Clark <robdclark@chromium.org>

Test a few additional buffers that userspace should not have access to.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 5afbcd081fc7..846385bb5206 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -253,6 +253,36 @@ igt_main
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

