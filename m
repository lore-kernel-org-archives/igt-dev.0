Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6DAC54E4A
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 20:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B671A10EB61;
	Fri,  1 Mar 2024 20:48:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="AZlCbRR4";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0342E10ECDC
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 20:48:10 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 421JuUMk002131; Fri, 1 Mar 2024 20:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding:to:cc; s=qcppdkim1; bh=XpsaU0ktJMqVKm
 i+XD1ViTQ/7FV8eLZHpzBSab9n+L4=; b=AZlCbRR4FT1xr+atHUZiCRZ31KYqcm
 QLRGYdaamIeGr0Ggdl1gX78dgIQxCTxQrmBzpjVSjqJTkITqJ/ljsot0hcAduQrh
 D05Gxe4DlDrmh1e1ZhkUgKSpPwhxjpKUG8RstM+wQa/MW1RGpmczu91c3DlaBWi7
 4NEYPvk/hfloKtiYMUULMEX+CzvIP24sKrM2/GzLWFirj8qHK6TvSytQe6uEKfpl
 /XAPwtMX7e+wg4Tsbm20rfOzFJ2nnBosSgNe+W86v7RdZQO2/0Ct+4hcFK/eyq7a
 BrYgMGesdUK7MD14ndEbSYfTelpSnoQ82TGetgxMZwMG+bUFjdBsqMaA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk9mf1xt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Mar 2024 20:47:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 421KlsWf001548
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 1 Mar 2024 20:47:54 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 12:47:54 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t v3 0/5] Add tests for solid fill planes
Date: Fri, 1 Mar 2024 12:47:29 -0800
Message-ID: <20240301-solid-fill-v3-0-8dff68a8a566@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOE+4mUC/1XMQQ7CIBCF4as0rMXAQK115T2MizqAnaQWBSWah
 rtLm5jY5XvJ/00s2kA2skM1sWATRfJjGWpTMey78Wo5mbIZCFBiLwWPfiDDHQ0Drzs07QWMBoe
 sBPdgHb0X7HQuu6f49OGz2EnO78JIkPU/kyQXXEKrwLVO12COjxchjbhFf2MzlOAXayFBrWIos
 bZoAF2za5xdxznnL9/h0gDjAAAA
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
CC: Simon Ser <contact@emersion.fr>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, <quic_abhinavk@quicinc.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709326073; l=1807;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=80KX8/+k/4q+dcyqR3Av5WQPEOreHUHvBpDwyvs9tyQ=;
 b=2QAsY8415dTIh5suFFeU43gxFH77SQpZiwBxwCL7Pu4QbrdkFCK5vN5HmjM1oCEScjUs08bdO
 GGUptwBLT4FDcDETA6zNlRmLzfK346+nigzhtp6ES1FEX7D7pBI7eb9
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 71topw4yoUVukALM8xwTbJIJaEo29zgg
X-Proofpoint-GUID: 71topw4yoUVukALM8xwTbJIJaEo29zgg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_21,2024-03-01_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0
 mlxscore=0 mlxlogscore=773 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2403010173
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

Add corresponding IGT tests for solid fill planes [1] in kms_atomic.

This series does the following:
- Fix a dangling pipe_crc_t object in the plane_immutable_zpos test
- Add solid_fill and pixel_source to IGT plane property enum
- Add solid fill drm-uapi struct
- Change IGT commit behavior to support solid fill planes
- Add dynamic subtests for solid fill planes in kms_atomic

[1] https://patchwork.freedesktop.org/series/110283/

---
Changes in v3:
- Reset solid_fill and pixel_source properties in igt_display_reset()
  (Bhanu)
- Added check for Cairo fb float->u8 conversion (Pekka)
- Dropped drm-uapi header update
- Link to v2: https://lore.kernel.org/r/20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com

Changes in v2:
- Updated drm-uapi headers
- Added documentation for new igt_kms public function (Kamil)
- Added documentation for new kms_atomic subtests (Kamil)
- Dropped stray newline (Kamil)
- Use pre-existing helpers to calculate rect height and width
- Add more test cases (Pekka)
- Fixed incorrect UNORM values (Pekka)

---
Jessica Zhang (5):
      tests/kms_atomic: Free pipe_crc object
      drm-uapi: Add drm_mode_solid_fill
      lib: Add support for solid_fill and pixel_source plane properties
      tests/kms_atomic: Add solid fill plane subtest
      tests/kms_atomic: Add subtest for solid fill cursor planes

 include/drm-uapi/drm_mode.h |  24 +++++
 lib/igt_kms.c               |  48 ++++++++-
 lib/igt_kms.h               |   4 +
 tests/kms_atomic.c          | 238 ++++++++++++++++++++++++++++++++++++++++----
 4 files changed, 293 insertions(+), 21 deletions(-)
---
base-commit: 40ed74461d8a44657a0f4799ade86116722d3ea2
change-id: 20230810-solid-fill-5acd9b2d42fc

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

