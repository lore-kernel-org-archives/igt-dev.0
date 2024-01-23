Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09EDAC47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jan 2024 23:29:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8864410EFD2;
	Tue, 23 Jan 2024 23:29:58 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22B610EFF1
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jan 2024 23:29:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 40NLLjCB017952; Tue, 23 Jan 2024 23:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 from:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding:to:cc; s=qcppdkim1; bh=ytX9HGBDWPaHQS
 A18xZuEBtuvvj/OMj4r3RI6dij8g4=; b=OsBaU9Y2qTHOZXUIQkv62P8SlaRM5L
 3PxPhhdnzbujzMZWc6JFOQr+LRE3UvR0v03hfsKyE0gXbMBOYO7G+TInGmFsToIe
 BTn2X64olUDXhLG1hjLAJ1OlnKobZ/XMiEDYfELVAVs51P8SJSENdiPT/FkM8Na9
 o8He0GdZwepESmqyXR/IU9VDpOiUhI/dmSB8qGPKgEe5myjYkz57iowCp5VY0HDl
 XoprU+sIAl6a8MwApvecbsHq9K8p2gnZRHkTzn3S5wim3hwNQzOqi2PcwQA1XY7/
 AAsPcGLjG48R/R7hgXecbutmyPL+XVXnOLn3sES9b14FExvNTsO4bJkw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vtmhr0a0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40NNTh5F014991
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Jan 2024 23:29:43 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 23 Jan 2024 15:29:42 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t v2 0/6] Add tests for solid fill planes
Date: Tue, 23 Jan 2024 15:28:53 -0800
Message-ID: <20240123-solid-fill-v2-0-4ecd2cf767fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALVLsGUC/03MSw7CIBSF4a00dywGbksijtyH6aDysDdBUFCia
 di7yMjhf5LzbZBtIpvhOGyQbKFMMbTA3QB6XcLVMjKtATmO/CA4y9GTYY68Z3LRRl3QTOg0tMM
 9WUfvjp3n1ivlZ0yfbhfxWzsjUMh/pgjGmUA1olNukmhOjxdpCnqv4w3mWusXtzlWnaYAAAA=
To: <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>
X-Mailer: b4 0.13-dev-f0463
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706052582; l=2336;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=9cEX4FX/XKt90wgiW5WjSe9F+kSpTrelM8gM6Vry0X8=;
 b=EQYRv7rQx11/g7OB0fmnkdSAK4dulibiO24FTqk1nVhJQ8fFmZJvN1OQcfOOxH6671st2fCyC
 i49dXS6Vc5JCBxRUAQLSXnwn+1uFzpzLBqFTOW8j6XZuImQFRqFQVAP
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 8IE4oz8sjuZG8tJIzz17N_ILlZEcc2VK
X-Proofpoint-GUID: 8IE4oz8sjuZG8tJIzz17N_ILlZEcc2VK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_13,2024-01-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 mlxlogscore=476 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401230175
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Simon Ser <contact@emersion.fr>, Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add corresponding IGT tests for solid fill planes [1] in kms_atomic.

This series does the following:
- Fix a dangling pipe_crc_t object in the plane_immutable_zpos test
- Add solid_fill and pixel_source to IGT plane property enum
- Update drm-uapi headers
- Change IGT commit behavior to support solid fill planes
- Add dynamic subtests for solid fill planes in kms_atomic

[1] https://patchwork.freedesktop.org/series/110283/

---
Changes in v2:
- Updated drm-uapi headers
- Added documentation for new igt_kms public function (Kamil)
- Added documentation for new kms_atomic subtests (Kamil)
- Dropped stray newline (Kamil)
- Use pre-existing helpers to calculate rect height and width
- Add more test cases (Pekka)
- Fixed incorrect UNORM values (Pekka)

---
Jessica Zhang (6):
      tests/kms_atomic: Free pipe_crc object
      drm-uapi: Sync with drm-next
      drm-uapi: Add drm_mode_solid_fill
      lib: Add support for solid_fill and pixel_source plane properties
      tests/kms_atomic: Add solid fill plane subtest
      tests/kms_atomic: Add subtest for solid fill cursor planes

 include/drm-uapi/drm.h              |   92 +-
 include/drm-uapi/drm_fourcc.h       |   12 +-
 include/drm-uapi/drm_mode.h         |   85 +-
 include/drm-uapi/habanalabs_accel.h | 2368 +++++++++++++++++++++++++++++++++++
 include/drm-uapi/i810_drm.h         |  292 -----
 include/drm-uapi/ivpu_accel.h       |  327 +++++
 include/drm-uapi/mga_drm.h          |  427 -------
 include/drm-uapi/msm_drm.h          |    3 +
 include/drm-uapi/pvr_drm.h          | 1295 +++++++++++++++++++
 include/drm-uapi/qaic_accel.h       |  410 ++++++
 include/drm-uapi/r128_drm.h         |  336 -----
 include/drm-uapi/savage_drm.h       |  220 ----
 include/drm-uapi/sis_drm.h          |   77 --
 include/drm-uapi/v3d_drm.h          |  245 +++-
 include/drm-uapi/via_drm.h          |  282 -----
 include/drm-uapi/virtgpu_drm.h      |    2 +
 lib/igt_kms.c                       |   46 +-
 lib/igt_kms.h                       |    4 +
 tests/kms_atomic.c                  |  208 ++-
 19 files changed, 5058 insertions(+), 1673 deletions(-)
---
base-commit: aa45298ff675abbe6bf8f04ae186e2388c35f03a
change-id: 20230810-solid-fill-5acd9b2d42fc

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

