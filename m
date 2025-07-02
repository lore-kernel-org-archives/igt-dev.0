Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C32AC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D572310EA4B;
	Fri,  4 Jul 2025 13:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnDYSZxw";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2172510E772
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562AswxA020939
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=oFZ0e9I9l0t
 NVIRHzSo7wHujKF9M6yQvGWfgYyp1e7Q=; b=cnDYSZxwnYsI/ZGI0ANfd4rQz/M
 VJRkZGNcBucyZsALXx28yI1ti16ptktOJ1RqotD7lu+1uzjhcSoJywJ8hlImLR/2
 CemD+nu0vzxHPHVGQySbmsOMRorJEKZ6Pbcx4bHSZJZgkXn3AznqjFHbfH7qEXnQ
 14fDqLmQxDdOGscWZLYfY1UjgtrqskjZRausy/7EMsOHJV6jfrrlzh8r1zRs/YBB
 /roO9NakxlUuXXs1UljE9RhUJCi51MqxgGRzzrTt9kHra90hOvg2Gr3vo4rFy6bj
 WQfI4/Mfcn/NinBndqG7vkShvQeQgMQThFmkYPmGL+HE2OT4gZYTvAfJd7g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn4dw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2382607509fso43506475ad.3
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751483003; x=1752087803;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oFZ0e9I9l0tNVIRHzSo7wHujKF9M6yQvGWfgYyp1e7Q=;
 b=EmOMBW0YK5eeKD0Ol/iS2vEJ5YfFfEp5exXpdXaysg7J6gIZqQDqbOUYpbfb0oUzXt
 gPc5u24czLYHUM91Ku6gT+IQpj+N/NdaU1kffaOKHHHsCHaFgF9WK3juej0ofZx/MrRW
 DkGXgjZ0YU6AOeOxGRTk/k0TLF5Cxt+Z69lU58J15MstoI96lQ1B/tkcqwwQ9wq+IHt9
 Br7Y4oHMBuQV4mOMcluEJUczU6PGf1FxgVj+E2KRCZCD1SMuNQBqdTeD3Qf7vMRlB2Ki
 3i3MuUP1zpxIL4awVR7h5kyXq4B8edXY9x1MYrZm73p755PUhYqw0ESCtODD7NtLbNtH
 p3bw==
X-Gm-Message-State: AOJu0YzCrgoWbtjoJV1azKjqNmSDtgJNV4Nmg60C9Sn/FYhLO12DzmoW
 FkA/rP5Sybg7yZagA+fw1oNjlTU3yayw7sBOnI/wKVIN7vTe/1159A06MbvyXZXKNJVNLrQOzpw
 1AvUj4dpxEKbJJYlAxv4U5XCqgUGB/TMKf/h0+6Npx0P2tAqkFSS3eDuhvfebDhU1fnunGw2i5X
 CW
X-Gm-Gg: ASbGncsMH0qSCDA+UVp31vouyZOi09S1WvYmNv1SimX8jS1v77UUkIvTWFtlOwb7y7V
 94FmaGS2FbVgNzSonFKRUrtaWK2AXXDC1ZC4zNs9wZXIi5b3ZncGumCpQ9uZW/h4HVUSZz6PzRo
 Ugki+NYi6cnRk/UFbFeq+5DmCdILEf2sNMfEgIphun9rUmVmf29czgmOUkO7YQQkAnTXM1ja5XG
 FTuoEOEVh1p+tqB+tNKaDKiSREhPDhogrs7gaJVP8FFfbuVEY7aJhHsd3drhOyTW8VGPbOVAqQ0
 thyON5Mi9sHe0rcCg/A4nkbyGtnGonuMZQ==
X-Received: by 2002:a17:903:1a8f:b0:220:c4e8:3b9f with SMTP id
 d9443c01a7336-23c6e4051c7mr62847665ad.0.1751483002668; 
 Wed, 02 Jul 2025 12:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6AnmmjH4JuAeHzEqK6aI/ZJbdxNMxlvR27URXslsBtCrTacvprNg0CZaAQwg3HXWdYa8zSQ==
X-Received: by 2002:a17:903:1a8f:b0:220:c4e8:3b9f with SMTP id
 d9443c01a7336-23c6e4051c7mr62847385ad.0.1751483002244; 
 Wed, 02 Jul 2025 12:03:22 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3641bb0765sm1684368a12.60.2025.07.02.12.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:21 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 4/9] tests/msm/msm_mapping: update for sparse
Date: Wed,  2 Jul 2025 12:02:44 -0700
Message-ID: <20250702190249.376313-5-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
References: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX0PR0YhrEUqZ/
 AnqFOk5Wp2AveWR6gN9AvgKny7gTlfclBEGs+rv/MRDbSQFoz7t2zWAiJwPjPpWp/ZiUoyDly4M
 e8udowhUpPXb1XnFcxpBEWnpm9WVE3wxmP7KaZ8iCsJtQX462jXGD6WyzLl8AVZFV3TsVP5cxIp
 gfacK4AtUqNZ7Y+R/+5FCug2n7sewNoXjdjBL5CB7rWntTQxb6a8i2Avdbi9FcUa5eYGYZhgOm4
 97VsfBA2Clc3mfSJB/TPUDIpy+91NblRj5Y73r49/Cq5gpqQoZeZx50YulImgF9S23dS9pqJMVA
 9M/BBk3E/p/1akOyPt/BDs2V0UINBwZrALHpHjrVEsxYMuqX45MRvr7LuPaWENmPCIo27XV1vDI
 4zY4Dv4OQNLWYzZh4+hcGnKuMTQjaiIMJSsJZGz9+fmRbE5DhgSRoneoSPTRuD2Dwb599z7C
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=6865827c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=Tx2W04geZ2YvJpcLXekA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: rkIsfiLr_JMkh07bGZssDi0drJ_pqdC5
X-Proofpoint-GUID: rkIsfiLr_JMkh07bGZssDi0drJ_pqdC5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=852 lowpriorityscore=0
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

The debugfs format changes a bit.  Update the igt test to handle both
cases.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 1749a670e70d..64dc62c3cda6 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -147,7 +147,11 @@ get_bo_addr(int drm_fd, const char *name)
 			igt_fail_on(!line);
 
 			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
-					&dummy, &addr);
+				     &dummy, &addr);
+			if (ret != 2) {
+				ret = sscanf(line, "      vmas: [gpu: vm=%"PRIx64", %"PRIx64", mapped]",
+					     &dummy, &addr);
+			}
 			igt_fail_on(ret != 2);
 
 			return addr;
-- 
2.50.0

