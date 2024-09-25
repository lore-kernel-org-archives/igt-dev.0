Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F6BCCF9EE
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 20:37:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F8610E879;
	Wed, 25 Sep 2024 20:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="PQFuBuyL";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A29010E71F
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 20:37:55 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5F6e008332;
 Wed, 25 Sep 2024 20:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=t6QVB6pNMRVf/oW4uAar2L
 /yuJiqSkMfFq6dX6ispe4=; b=PQFuBuyLdz4s7xXpLc3vtDKCcp21kAi0CEaOIp
 P1KZc703T4dtUUPvMUgKnTtir5uqyFdDoGqlb082h1AMSEG5fEDS1nOduP4Skg9n
 vKikLZkx9gZK+KPMQytRMs2ho7t8U+0CqmOfDvlVtlKGRgbFhm/QeVgIympwekq6
 jScHZzF2yRBXO6dQuvpmEG3WZuDJ+oVn03dsE2eUs80xFNOMMrhuwBd9AHl9g1CD
 3V9EEznfALgRZXDqVR0wBBPwgsMnqqLUcbHCPUOpdiNdQBBE/0RfCOao64FdBfpy
 QU1yW+0iMXXX75jynuoCKvoyYvMg5UBl/B/TGb0V/t34FWcg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skuewdj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:37:45 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PKbiBZ031897
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:37:44 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Sep 2024 13:37:43 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH i-g-t v4 0/4] tests/kms_writeback: Add clone mode subtest
Date: Wed, 25 Sep 2024 13:37:17 -0700
Message-ID: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH109GYC/3WPQQ6CMBBFr0K6toZOCwVX3sOwKKWFWQjaYtUQ7
 m4DRmKMy/9n3kv+RLxxaDw5JBNxJqDHoY9B7BKiO9W3hmITM4EURFqApNiOVN9rCtw2BWu4kkq
 Q+H1xxuJjMZ0I0paOpIp1h34c3HPxB7Yc36riowqMplQUyhgBzOpSHq831NjrvR7OiyXAHxIiK
 WvIMi15qrPsl+QbWbJyI3kkoa45y5lltsy/yXld5ExsPY7rrGqeXxeTI0YwAQAA
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <igt-dev@lists.freedesktop.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Esha Bharadwaj <quic_ebharadw@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727296663; l=2398;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=U1uK/8TeXQXrKoiUZj2uYmciR+at9w6Nzz20hd+jSzE=;
 b=Y28Y4EitQjp/RVzIKcbsS5vOW9TzVCeZLNJnJvZy4XgzQs9YJGei3OajriQxB8D7GqoOoHdd5
 MGhdZ0yaf0rADGKUj02yHnJuJpp1fXBfVewD8ctu+8Ga+V87MmsFd/q
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: xwUTfXOtKxcH6NL9pDTRJ3WQyaLLHTZq
X-Proofpoint-ORIG-GUID: xwUTfXOtKxcH6NL9pDTRJ3WQyaLLHTZq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=814 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250146
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
      tests/kms_writeback: Add dump for valid clone mode

Jessica Zhang (1):
      tests/kms_writeback: clear writeback properties in teardown path

 lib/igt_kms.c         |  57 +++++++++++++++++++++++-----
 lib/igt_kms.h         |   2 +
 tests/kms_setmode.c   |  14 +------
 tests/kms_writeback.c | 100 +++++++++++++++++++++++++++++++++++++++++++-------
 4 files changed, 139 insertions(+), 34 deletions(-)
---
base-commit: 52b3f11e13a18b5dc17d1ac647ac380b9b1ea764
change-id: 20240827-igt-cwb-23fd81d3a7a4

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

