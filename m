Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23380C02198
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 00:17:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D651410E03B;
	Sat, 15 Feb 2025 00:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Jh7BnzOf";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F065410E03B
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 00:16:57 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EDVZNA008646;
 Sat, 15 Feb 2025 00:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=HhSkJeXcvZCD40Oa1ukVOb
 5oEGL0Nvfn0WECji3sajQ=; b=Jh7BnzOfP8ZYfxUQ852fVYBcEmhi4bqUiu/bCA
 /Kwyuo0BXCeQnZK5H9oX7djo6vfcKBfMF0+HUNMFJHD/po9WqlkOIr04hyyKbn4r
 0BRthpRNzcYkFLdZHwxra/x9EBc1JNMCGllnQ4m6ewH2dRBXbzBt9iSv66zMF7xO
 Ac7mDYTXq8u8yI4V8KfFwwfmexW91tdFjSgYwW8HBitof1WhcVvku5WpaXN/4+cu
 Ixy8X0eWDOua9tQ3vu7vV3InNXbaKgXJ3DoGxj1TYhoM1XUw6vv9KX1N4KVlvhf+
 AGRKg+QKtdfsPE6AjxocCiWOKUCs/bahJvf9FApKvss6pTKA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewhfjr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:16:49 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51F0Gm7I018961
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 15 Feb 2025 00:16:48 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 14 Feb 2025 16:16:48 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t v7 0/3] tests/kms_writeback: Add clone mode subtest
Date: Fri, 14 Feb 2025 16:15:50 -0800
Message-ID: <20250214-igt-cwb-v7-0-66cac72d0c38@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALfcr2cC/3XQzU7DMAwH8FeZciaodpIm4cR7oB1a1+l8oIW2d
 ENT352oAzpUcfTH7y/LVzXyIDyqp8NVDTzLKH2XC/9wUHSqupa1NLlWWKAtAnot7aTpXGs0qQn
 QmMpXVuXtt4GTXNakFyW61ZM65vZJxqkfPtf8Gdbhd1T4jZpBF9qGitkiJIr++f1DSDp6pP51T
 ZnxH4lZ+hqdI28Kcm4vzSYjxE2aLLGuDZSQIMVyL+2dRLdJmyU7KKkBDiHwXrof6Qq4v9ZlGbB
 0SEwYK/NXLrcvDpy7o0y3Vx6X5Qt3VuMzpAEAAA==
X-Change-ID: 20240827-igt-cwb-23fd81d3a7a4
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@gmail.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <igt-dev@lists.freedesktop.org>, Alex Hung
 <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Esha Bharadwaj <quic_ebharadw@quicinc.com>,
 "Jessica Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-f0f05
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739578608; l=3404;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=08ecsDuecxQqMBG0aBK91f7sgjP+S/Dg+wOm3z6zdR0=;
 b=0gKeulj0QUZhn0r2rATe4Jr1LpB1Em7fa0msZXT3ieM504I78JK6zPiaz2YXFKmajKCiBCLWa
 zziP+Vqvgx1AGERf0iKMMLD8yVVnk4NPms+XLJ0HvaEqlA3Q0Et3Ztb
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: E5mlYY4tF-aWSkYE0YEzeuQ_S8oYOJ10
X-Proofpoint-GUID: E5mlYY4tF-aWSkYE0YEzeuQ_S8oYOJ10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_10,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502150000
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
Changes in v7:
- Added comment docs for new igt_output_is_valid_clone() library
  function (Kamil)
- Fixed incorrect indentation (Swati)
- Added error message to kmstest_get_encoder_idx() (Kamil)
- Corrected Bhanu's email address (Kamil)
- Corrected revision number in email header
- Link to v6: https://lore.kernel.org/r/20250128-igt-cwb-v5-0-82652cec29a3@quicinc.com

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

 lib/igt_kms.c         |  78 ++++++++++++++++++++++++++++++++++++--
 lib/igt_kms.h         |   2 +
 tests/kms_setmode.c   |  16 ++------
 tests/kms_writeback.c | 101 ++++++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 177 insertions(+), 20 deletions(-)
---
base-commit: 7187a77fa2c4f1e0ea355cbc719dcd1f270148a8
change-id: 20240827-igt-cwb-23fd81d3a7a4

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

