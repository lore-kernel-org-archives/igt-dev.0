Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775DBC83F0B
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E6210EA44;
	Fri,  4 Jul 2025 13:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hnSl+EKf";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A7110E772
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:26 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562DQjdZ024817
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=mWEmiCDkWM/
 dyt4IuSaxnV9KdbWUyishGyxyF47FjlM=; b=hnSl+EKf/CXIEnKMPeI2GVE41Fi
 7hbeXiT3AiPbbp9nZI8DHEDCpIHyxkkEdF4VAHo9TQxxwI+A0zxbi87wfJYnjDqa
 yx4L5/QEvcnKZuz3NtoUtmi9MO/RJkj2ZG4aCrbyFCgP421+NjyBiASQ+c6yPkIU
 TRNTW9FJLl46VlMDlClru9rUY+C3eg16EL/tncOiQOaFJT3ZkJFnX7sL2bxBsoCI
 gbfs8ZOL0KtPsOlfV9btUGh4t3lBDdbIr325C/mwmUOxd6lON5O+50fpnI2Uyane
 xfGxkBnuXecttsVVEnKVm5F72bavOU/ixVXMq6lS4srL8qxYza9cwighikg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9nrw8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234fedd3e51so45907455ad.1
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483004; x=1752087804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mWEmiCDkWM/dyt4IuSaxnV9KdbWUyishGyxyF47FjlM=;
 b=cpKSZrPr1HhaxapyJBY4G2x0Hzr6EoOWo771KGy6gdSTYvTtq9Snapms8/SHn1JvoU
 zluqtrv25vN+Yl83C3shkYIltaVTIkYZjUIROVZ2AzvSDd6QPlz7X8zpNKQC0lkkir29
 CVxG8qIp4Zw4gj2Jtgf/SglF7umn3hALjXHtU51smozihR9alK4v8Ic1Iwvd/XW8rNYU
 06801uS9a/PeAhGCdMgkGd0sgpN6YkYwYpl6vDZM/tGv9RZQJWvbWwto/spdBcAsDcPl
 hWVxgoZr6plPnR+6am+A48nFWckSBGe/IJ9V++rqCvwBwU2S77ngiXiza4G2K+N9m1st
 6Egw==
X-Gm-Message-State: AOJu0Ywi/Px3i/jcdTaOFkGLi/be7v6EZnRYkFKYZ3M09Xz5d0gDLzOJ
 /NqJ2fIAfXHmDtuGbXSK8FUmHwCcFlSfJTF/4c/LT5JFCwMDMFbNDLWGxX09w3G24giNP8t5R80
 x1cISozgR3Haxt14uPBtn+jxqhECtoeavNBlo6MHuQ+Uqri5spwCx/ZUCqpSTHyGN61d4DeaMcm
 Ae
X-Gm-Gg: ASbGncsW2Cy7RkkbLriBzhFZPdvXqGPewyOcHoc+9WENBH/hgZ+sEHtcrHqIMDTjZm8
 SQ3n6GBHq616Zksr36uydWbUsxhB2PgO6PhVln2SuN9+VC7P9h8qq9p3qdkpSul0gdyQkWK0xxa
 goALZI5kARhNQZU+ZpLLx8W1+fa1409WaOEoZJrr3Z0y1I0cATtn10boXWtk1CW0t/YAwPckveJ
 PIyOWqUXE5oW4BlRtk7cg7cIGdJkkjLUIUD52w9LS+WaFi8ioS7e5RUrA27Z5DQmSmEGeJdyveF
 A3Afh/IXpKRFkupiHPIgTAiwoaSzADsSPw==
X-Received: by 2002:a17:902:cccc:b0:237:f7f8:7453 with SMTP id
 d9443c01a7336-23c797d1357mr5118145ad.51.1751483003812; 
 Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3xXyh/GdF446atAWsLKw/m8TCDkOAGDaWGBMDHaHcikjQQV9DawDYJih2h3x3oe1lvqBS9A==
X-Received: by 2002:a17:902:cccc:b0:237:f7f8:7453 with SMTP id
 d9443c01a7336-23c797d1357mr5117885ad.51.1751483003377; 
 Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e400fsm134594205ad.34.2025.07.02.12.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 5/9] tests/msm/msm_mapping: Handle BO names with
 spaces
Date: Wed,  2 Jul 2025 12:02:45 -0700
Message-ID: <20250702190249.376313-6-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6865827d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=LsNcMMtZqy-lO6dUSW4A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: TtQTOdab8xRO1wxT2jLrIE1dPvzvuF-t
X-Proofpoint-GUID: TtQTOdab8xRO1wxT2jLrIE1dPvzvuF-t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX6FifqYqgFjBQ
 /GkQGRE1bXNNfT10q4E4Rizb1A4h7zhdlJgBHDpA8cbDuRaJ6GzDW7xvvM65pUNLcBokKFQed7b
 SZ7n59HzJEJHjJOY7B9pY0Qxp5+vSrgAylTwc9BLs0kC3U/BhM7dPDNPvwNfB+6R1721FANmv2o
 0QFjnLx2Ddl5u46iBXyo3PNlhaVQpQBzNK3mo8LGzt9hfTvMMDd4MCLWrpkZ8Ja23M58JFOpFZQ
 TVROE/vu+ltbYr3pYbMnEtuj1M61O5Q4tDaMFCCS3lQLKYjvpZZzH2f3rFl9p7hhyfhorxxm074
 Us7VeRq1vIwtpbTf60qSTmka2ciKb6VFIA3szvmVVftEsc6QmZTqWvAJjVKbfoAmcYtXROWR3j4
 sauAHuiTLMe5pm3TfQnq3YmFPRyS+CoXEjR8TlgatsXDj+78sUIX4OrMB1otbLQIej5Z1sFJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=797
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
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

Instead of trimming at the first space, scan from the end of the string
until we reach the first non-space char.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 64dc62c3cda6..923bf8734bd2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -101,13 +101,15 @@ endswith(const char *str, const char *end)
 
 	/* Trim trailing whitespace: */
 	if (p) {
-		char *c = p;
-		while (c) {
+		char *c = p + strlen(p) - 1;
+
+		while (c > p) {
 			if (isspace(*c)) {
 				*c = '\0';
+			} else {
 				break;
 			}
-			c++;
+			c--;
 		}
 	}
 
-- 
2.50.0

