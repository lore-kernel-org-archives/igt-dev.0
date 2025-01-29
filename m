Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D977C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 03:31:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089AD10E05C;
	Wed, 29 Jan 2025 03:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="mMWsjdG9";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D053110E73B
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 03:31:14 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T2gKDC025534;
 Wed, 29 Jan 2025 03:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=5A/1nXReeXT1gMkLRXfwel
 DdxXfAoN9i6I+flxkUY8Q=; b=mMWsjdG9uKuRj6zIUF+WnYEJp5G+6JoZLJuocr
 DeojZVSUKMeDevL9VESAgVrVOdcEsmj/oAu4sgpdhTvpuC0dmL38ys9E+kMgGCeA
 q403lye1Oz8wZfj4AG8KWeuR+ZoXK7YPdt2Ump0pTxyNKJw3HqJ60vS06UM2uGZ6
 OBXitvYcT2Njnw9La2e0vsFR5UxV1mvjl3lAtjOYiUS8oeALmWHg8L31d4UKwq54
 vjZQelyjT8QEZkBsAUizfkKdoBC1fVWoI1JAaPIgiq4ivxyN+8vRY806HZEBLBIb
 PTViWaR+s+zG8D+lnKFdkLLmnZFab29eNU/NvY9oSkIU5sHw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44f54dgsxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:31:05 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T3V4eQ012581
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jan 2025 03:31:04 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 28 Jan 2025 19:31:03 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t v5 0/3] tests/kms_writeback: Add clone mode subtest
Date: Tue, 28 Jan 2025 19:29:46 -0800
Message-ID: <20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKqgmWcC/3XQwU7DMAyA4VeZciaodpIm5cR7oB1a1+l8oIWkd
 ENT352oQxQ0cbST7z/4qjIn4ayeDleVeJEs01gG93BQdGrHgbX0ZVZYoa0Cei3DrOncaTSxD9C
 b1rdWld9viaNcttKLEj3oWR3L+iR5ntLn1l9ge/xOhZ/UArrSNrTMFiFS45/fP4RkpEeaXrfKg
 v9ILNJ36Bx5U5Fz99LssoFml6ZI7DoDNUSITX0v7S+Jbpe2SHZQUw8cQuC/cr3dInHZZplvBzm
 u6xe9yNa1agEAAA==
X-Change-ID: 20240827-igt-cwb-23fd81d3a7a4
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Alex Hung
 <alex.hung@amd.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738121463; l=3018;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=Ok6ciTn+GCvJWHjVs2z/UIj6VVQlvl/+DhfhRpqCSU8=;
 b=/Knvwq3We8ktUphygYo42eBYObYp+9ngljUypDDG4UbqlYA0P0vjvzcN78XZ/AbbdXyVfwMEn
 1phBqcj5HDHAJ/CjZvfxOmS8d7a+8xHBEXrcVZ2MbuKt0LfdvXVIm3M
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 3-vincr0Ftcd1Xfx8mDDFYblSuJ2WCof
X-Proofpoint-ORIG-GUID: 3-vincr0Ftcd1Xfx8mDDFYblSuJ2WCof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 clxscore=1011 phishscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290026
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
framebuffer for each pair. It also supports performing CRC validation on
each cloned WB pair.

This series includes:

- Adjust the duplicate pipe check in igt_display_refresh() to allow for
  combinations of valid clones
- Moving the writeback dump to its own subtest
- Adding a subtest to dump or perform CRC validation on all
  writeback+non-writeback cloned pairs

To validate the clone mode buffer via CRC, run the following command:

./build/tests/kms_writeback [--run-subtest check-valid-clones]

To dump the clone mode buffer, run the following command:

IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
	./build/tests/kms_writeback [--run-subtest check-valid-clones] -d

This will output a file named <file name>-encoder<writeback encoder
id>-encoder<primary display encoder id>

---
Changes in v6:
- igt_output_clone_invalid -> igt_output_is_valid_clone (for
  readability)
- Refresh output before checking if nonwb_output and writeback output
  are valid clones so that the check-valid-clones subtest doesn't fail
  for drivers where there are no clones
- Added num_clones counter to mark check-valid-clones subtest as skipped
  for drivers with no clones

Changes in v5:
- Added check for pipes in use back to igt_display_refresh (Abhinav)
- igt_output_clone_valid -> igt_output_clone_invalid (the check returns
  true if the encoder bit *isn't* in the possible_clones mask
- Added support for CRC validation of cloned WB output
- Link to v4: https://lore.kernel.org/r/20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com

Changes in v4:
- Fix compiler issues with igt_output_clone_valid()
- Add a NULL commit to clean up each non-writeback output
- Link to v3: https://lore.kernel.org/r/20240919-igt-cwb-v3-0-2bb3161f1f96@quicinc.com

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
Esha Bharadwaj (3):
      lib/igt_kms: Add helper to get encoder index
      lib/igt_kms: loosen duplicate check in igt_display_refresh
      tests/kms_writeback: Add subtest for valid clone mode

 lib/igt_kms.c         |  64 ++++++++++++++++++++++++++++++--
 lib/igt_kms.h         |   2 +
 tests/kms_setmode.c   |  14 +------
 tests/kms_writeback.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 162 insertions(+), 19 deletions(-)
---
base-commit: 76102a17560c6e6fc6528db29286b0266ccc48ef
change-id: 20240827-igt-cwb-23fd81d3a7a4

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

