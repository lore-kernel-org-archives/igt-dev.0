Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8978C83029
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81DD310E4B8;
	Mon, 30 Jun 2025 18:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="omsmwrcJ";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1D910E4B6
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG2eDn008169
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=+lRr3gI/KD/
 sDiUpT3STEHoC0WFSv9i9T/J/yu1bztI=; b=omsmwrcJrXdIln5amOugIOsfUNE
 KZMMy1xv0xpvtpQZc/3EKS2GfBLA8n3ruxkdMvUgsOoGN7vX/ST+Sozp2eBuYuIp
 ajwshwD3dqzb2Ho5qaLrnVe0LbnB4w5j0NPg8D6QAHAME6sEiNbZsCodoWyCew1L
 +nUmNjdXU2noJeeCYBvLZvVMAy1X9IlNVmiCpf1ObvI2i9LzYxKSp2VQ4eE68vSj
 ZaD6mVbd7+B9nwXtaU0T1US36uo3Wcp0/L04PNpM/actHYaB17iVsgD9fa2R6PRB
 d2JWWVhDOae+PsgCilQMrQOasByJzPSbH39B47WL5M+eVSKQQnV8j/+3+PA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmte1f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7491814d6f2so5295634b3a.3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306981; x=1751911781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+lRr3gI/KD/sDiUpT3STEHoC0WFSv9i9T/J/yu1bztI=;
 b=JE4EEKLplH+R0vbjg54csuvYeMmkuTMsUuv4OWiSL1WWiCQhyxXdnN20eZIvJNa5bq
 zZSyGn76VtoKZJD1XJYP8NYPQd3zWexBNKueEk7GNQZyPRzDYH258l5zgUD/DtK6nLmp
 FMSdbV3kO1yLWvzSGAXX35qmwoI1kksLclu7vPywN0S6EXq9zzcmaRJbj8qnVI46O7Xz
 ArZB4TdKemOyBGG6HF5DMy24h7OStScoRrnz6vm+f5D4+r4ZzMYJMWkT24u6pyyXrkU6
 cXq6KrArwoJdp7hY3dC2SaBM4h3yYA2kjBf1AnIfhLl28YxqvyS3SxNfj5UyIgx/yiSM
 t4/w==
X-Gm-Message-State: AOJu0Yz/iQ09UVV0eOGm8AAi71jof4szJLUoIq0OOXgAj3dJ2UdoDlbw
 G2u9aqwJmwMNBSrwgezQNHQLMzb8z2wTlUf8dUy7ntPYkp/SwEXa83Ass2+JxYW+8m9VlMOEk/l
 qZPBmHcYyL2+q5r1q+aCyLnKwpnWXxhMtLDKyB3aTC7gmO02kJC01flKypw/9u/mZaZOJHzLaxk
 8P
X-Gm-Gg: ASbGncuNdp8LsHpsZnbMaa1beV0v+IEjJGI7OF3eK9Az+u9uT66fLQcwhgg/xbpTiii
 Oh4vwTKscI8P5SNGRJdpKdbJEb8MrMxgBh42QovAptdFkMRojzLsmxuVt5rGCy3SUFQttUIGrtK
 IjfyiJ5FZKmDj/O8mT6tfRdQ3qmUiOkBG0q1Khn+PvymV+dYGyA4Tqpkw97Vs5VNCHIbtgsu3Lu
 8NO/1hJMb/LG4GiNbfeQVrmEzux1IlOpoRyz7Y92Gvz97+CKrqr3TONmgcfefeINgVGTz2EILqw
 Pt/2FPc0W8ZZars/O0HwEwVOs4A3z0wQVw==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f406:b09 with SMTP id
 d2e1a72fcca58-74af6fca3d4mr23163231b3a.23.1751306981533; 
 Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7CND6tKFO5hUMumYDZaZW9zhAXvptM83/cyBuGl+RUxf6hGSdNgBe57l5cuijhzysQkCevg==
X-Received: by 2002:a05:6a00:1a8f:b0:748:f406:b09 with SMTP id
 d2e1a72fcca58-74af6fca3d4mr23163193b3a.23.1751306980981; 
 Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af56cffe4sm9288372b3a.138.2025.06.30.11.09.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:40 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 7/9] msm/mapping: Handle larger gmem file size
Date: Mon, 30 Jun 2025 11:09:01 -0700
Message-ID: <20250630180903.77990-8-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: c-pw1VGC1iQTP7QUOUtkpYjKG4k2KNwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX6FKCYtutkYlt
 /IMBcROuQAGNsH6I4fXcpik+lngFokaU2z3/UlxVRDoIBbH5DP8D4nD/wCTJvGfc8cAnfQ39Khx
 dLboAFG0ibWNzTmF0V2hpokInMk6qFwnoqIUZV0XM82gnw2G8g4w2ABZNoQ0ya1rmJEfX00MlsH
 uxseeer95LIPV7kS7fW0KoSo04wzqftxUncMia61nLeNAhsBDjlBdFOdBglSRuTajh2HJFYPY4H
 ubnA6xo7DFrY8Pz6kMPBYw9iJs48XqZhF5w9E/ZS2oiHD7GRT9/jMivrtjNd87m/49798t43qTz
 ocVrPsrwE4zBeAgtN4igzwqI5pFjqklQ/bvEVtgd2m7TFMObYO+0CiqcRYa2Hjx3CpsiXvlRWHw
 PFF4XB1hriC7Js+nUZighqihbt0c46X40owigVeBHgRhQM+v9hkNiQtOsj5jJqrmdRKejcJm
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6862d2e6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=vubaehVBMwJoC4cWCuwA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: c-pw1VGC1iQTP7QUOUtkpYjKG4k2KNwL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=886
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

If running on a system with full desktop environment, the file will be
much larger than 0x4000 bytes.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 03a9e814c931..978ea18375dd 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -122,7 +122,7 @@ endswith(const char *str, const char *end)
 static uint64_t
 get_bo_addr(int drm_fd, const char *name)
 {
-	char buf[0x4000];
+	char buf[0x80000];
 	char *p = buf;
 
 	igt_debugfs_read(drm_fd, "gem", buf);
-- 
2.50.0

