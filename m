Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F012C83033
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA8E110E4BC;
	Mon, 30 Jun 2025 18:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHzydmNQ";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DB110E4B5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFSsxa007218
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ledPMpTWELS
 QJRePU6zVKWClM+7ulZ3H+KHRTzRaaUA=; b=bHzydmNQh8C4XTMLZGVr3vn/p6s
 uVOXLE4hIbkGlEKDRBWgJaLWcfkbE3aS3tKMMeF96OcYJGGgbhUb7qMVjI4cedWk
 D+d0HpRABBdVuPk60E5gqQ2PLqJzPiVrlrG/doLR2qwb3QWUTHjlRCTCofwIDOtA
 Sjb31c7iUVrKXRv5LaImKEPSkjS2/UuCKQ1vMZ3BFFm4I0iV37Dr3mQg7s1Iqa8o
 rqkKyf14hhk+ceW03nbzvsN3WlHxjsKKI8wM2Fx3FKyzXJvEQLYI8dxB3K/46ZpB
 WoSt6h+GUfdoRO2odfUueoWT5zdVZWxXjqpCudYQjOlGOIKjrdvGLK2Ah2g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5ja5qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2fa1a84566so1760211a12.1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306983; x=1751911783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ledPMpTWELSQJRePU6zVKWClM+7ulZ3H+KHRTzRaaUA=;
 b=Hx9dpBuWXWF1y0s2+AzlA+8ZbUUY67vD1j/qqDoHWQSkzhCGDbRejO6EpxuYC1xTzI
 f4zt0gQHO7obTyqVGVt3ljeBS6uHTJgCd814UGvrxzl08Icqt7o+frExuVyX04GHRJxF
 0eqWT2IfKVlolfxtIGEFAE71kVMI/jlre+JPfAO4fp1WzCjtUR7agLrXA6YLku7twMCY
 Q3GnHnymhcPigq7V13XQJG5R/TFjHytX7oR1AWsRzkVONXNcLwkXv0ZcClWAP95p8bRX
 +W7sfbFjqkubpbV0Z3lrsN5P2BLOZdnv+MYpiJ2+aebqAHXmboj2iCo3g5OCBou6Jhhc
 ERuA==
X-Gm-Message-State: AOJu0YzPf/tzeJYOfCumLChhKAtyqjisMWaFehVo1Ndk8+KnQ2FA83fK
 lvDXWe4O9UQ+I9TGTrsVVoDnJ+jfIKk8o6y1ytv0xzZmzEkrSN86PG+KVILVwpW2ZRoAZ5YiiVB
 GYaqblkV/AaKIGczsFOdJiW6aphTRqPCZF3yWnZtfjEXd1rygvtYa7Ei2WjlzOsyqD28h7KB/tP
 /C
X-Gm-Gg: ASbGncstOIv9unTar6KTBIDis7PnL3jX+YwJSrOKIM1P+9jDb9aeGJ1w0ngIhq9OdpH
 bLDL2rSsNcKZcv9cRVjFeKJOEtkyAeMISRF7m1m2FOjAwdBbZ9ghVaX+BgCwXDBepj+MqJLw8+h
 Ryk9+ABs5U1lRjbNcbwqb1XrrcgVXL7rub6NoV5pR3ZmHf5dEtqz2oGoDQHLytZCOAaObq7ZkKf
 v4Z4w22qEqqce0s5iIOUHNg/FKVuFewzBz4rjeOuYpW+JpFQCDLjvseJ1sjAzmuZGw1HdgAypUp
 sPybF+x6cH2ULeIUBwgV/pofCKZ+UxksHA==
X-Received: by 2002:a05:6a21:6d91:b0:220:10f9:c99f with SMTP id
 adf61e73a8af0-220a16ebb23mr23391259637.25.1751306983562; 
 Mon, 30 Jun 2025 11:09:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHxgDA/2hdrci7CdwulDX+7LZwb8o0NSAmSWgKVJFE5PGUtcgCs/T/JwBf1IB9rohUfQMu+w==
X-Received: by 2002:a05:6a21:6d91:b0:220:10f9:c99f with SMTP id
 adf61e73a8af0-220a16ebb23mr23391223637.25.1751306983143; 
 Mon, 30 Jun 2025 11:09:43 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31bea0bsm8558468a12.41.2025.06.30.11.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 9/9] msm/mapping: Free devcore
Date: Mon, 30 Jun 2025 11:09:03 -0700
Message-ID: <20250630180903.77990-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6862d2e8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=YG-Ktf8kLO1V0yi116gA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: bFz0HHzeZADTmhDU0_GHHTDEfFsKLblV
X-Proofpoint-GUID: bFz0HHzeZADTmhDU0_GHHTDEfFsKLblV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX3S3DRFpDIMXy
 QdnbK1ocAcJm2Hj2iubNRkWRB+BuyUbPbAMrpm2faGMGG2uHiTQSZvjcui5/jAIf/3VT0FBdCXL
 5nfHMad2Sz21gvl1ROF9FGcI9oApz2rCS+cf1oHUEC+QKkT8/tOtHIgI/HceeSxZq4dRd+YV3FW
 1tu2R2RNH4uUhcOjAwLSxk2vsrdHCJ7z/Qfn/TG+gL4vATlWyeGHbc9F3yiHXGUBvlSH4wLTMkV
 ntINLNm9zT6qGR9FA3mpMorRX5rrFYvDyjk9klJsHdTj6xHlEZUs+L/OEGw6QmZd0SVe2LU0KSk
 0NNbLfCI5kP6mtKY8cmpA1JuA3z8j9ez6ubv7fHVA/FRtpigf/lCHNOixHZBreqDoYUorkMKjK+
 6E18VU5KVKLPWqEy8n3cVnB9tewhJdf8tiVL/GClj5ZNrDalwdVGrhlnTu5K/og0KwK+Gcep
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300147
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

From: Rob Clark <rob.clark@oss.qualcomm.com>

We shouldn't leak the devcore.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 7e2f5c7eadc8..b735d5f014c3 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -249,6 +249,8 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	igt_fail_on(ret != 1);
 	igt_fail_on(addr != fault_addr);
 
+	free(devcore);
+
 	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
 	 * would not generate a devcore:
 	 */
-- 
2.50.0

