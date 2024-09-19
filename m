Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17773CF395D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 17:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71CC10E012;
	Thu, 19 Sep 2024 17:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="i93zK8kN";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEAE710E012
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 17:27:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JAivdC031540;
 Thu, 19 Sep 2024 17:27:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=R7NFDOQ/pinBnlWPuYZA+/
 ILNNAWt7bcBQOpYIwY71M=; b=i93zK8kNG8eArqItT23QkjIBbU/xMgPFx2XNx5
 5Thpir2X39FBDSmZK7VLXr44f8EGtx0wZVALck5icoq+Dbz7g0reqfCvRZzcIi4j
 i9qAGPzxXYEN6z0LxALo7Y++H8+q/43Ccxj8wyprIDgOR3r2TRuU4W9SiQ0HzWsV
 p9BGqs5mdqelZaurokbJaXEz/bSq3iMfAH7+GlXuUFAXHOEQAKfYFgLjx52HVHse
 g/0fDn+zdHvIZvUpscHY4O/Soxwm+1qxVg9vutQAtYecpzvUBdH5pD8WZzU2EIDn
 gJUdVSvqhGnCQSqQlG+dhbcmx/E3mrZ5tDOg26VmL0vPJExQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4j6x9bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 17:27:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48JHR4qg004118
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Sep 2024 17:27:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Sep 2024 10:27:04 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t v3 0/3] tests/kms_writeback: Add clone mode subtest
Date: Thu, 19 Sep 2024 10:26:49 -0700
Message-ID: <20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANle7GYC/3WMOQ7CMBBFr4JcM8irbKi4B6JwJk4yBQnYwYCi3
 B3LQkgUlH95b2EpRAqJHTYLiyFTomksQW03DAc/9gGoLZlJLjV30gL1M+CjAam61olWees1K+9
 rDB09q+nECHqY2bnUA6V5iq/qz6KOH5X7qrIADtr5ELQUHe7t8XYnpBF3OF2qJcs/pCykbaQxa
 BVHY37JdV3fXMCCi+EAAAA=
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726766824; l=2092;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=H4VN2nhx96UQwWLWvHnvPtTNbBvL3jo/56SzVDaYBwc=;
 b=IGJT2Yc1/axkLIi2lsZ/GlhdjAmvpmBEpshyHcCfeu8k54IDwOmyrLbcrV/mlko62vWyU4HNs
 0lS73Xyk/qGCUVBMFMrW+mZELLrnjbspMOy+trcLTL09gsg1sBRTYvf
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 2LnrNbwSq6o8hW8L26sIsuwQ7CHae_S3
X-Proofpoint-GUID: 2LnrNbwSq6o8hW8L26sIsuwQ7CHae_S3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=768
 mlxscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190115
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

Add a subtest that will iterate through all pairs of
non-writeback and writeback cloned outputs and dump the writeback
framebuffer for each pair.

This series includes:

- Fixes for properly cleaning up the kms_writeback state
- Adjust the duplicate pipe check in igt_display_refresh() to allow for
  combinations of valid clones
- Moving the writeback dump to its own subtest
- Adding a subtest to dump all writeback+non-writeback cloned pairs

This series depends on this DRM framework change [1] to avoid issues
where modeset isn't happening when the writeback and primary display
outputs have the same mode.

[1] https://patchwork.freedesktop.org/series/138284/

To dump the clone mode buffer, run the following command:

IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
	./build/tests/kms_writeback [--run-subtest dump-valid-clones] -d

This will output a file named <file name>-encoder<writeback encoder
id>-encoder<primary display encoder id>

---
Changes in v3:
- Dropped change to force a modeset after igt_display_require()
- Fixed incorrect author name
- Grab the primary display mode as part of the clone mode subtest
  (instead of requiring user to specify the mode)
- Link to v2: https://lore.kernel.org/r/20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com

Changes in v2:
- Corrected author email
- Link to v1: https://lore.kernel.org/r/20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com

---
Esha Bharadwaj (2):
      lib/igt_kms: Add helper to get encoder index
      tests/kms_writeback: Add dump for valid clone mode

Jessica Zhang (1):
      tests/kms_writeback: clear writeback properties in teardown path

 lib/igt_kms.c         | 15 ++++++++
 lib/igt_kms.h         |  1 +
 tests/kms_setmode.c   | 14 ++------
 tests/kms_writeback.c | 97 ++++++++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 102 insertions(+), 25 deletions(-)
---
base-commit: c459544b7af00e4599e1ad010e9f773086cb0c19
change-id: 20240827-igt-cwb-23fd81d3a7a4

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

