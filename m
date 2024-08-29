Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C28C54FC6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 02:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ADE10E177;
	Thu, 29 Aug 2024 02:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Km6httgi";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4615210E177
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 02:59:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJM3j6019321;
 Thu, 29 Aug 2024 02:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=aRscovzign8dgAXW6wXByM
 BNduMZkONXipJollBt4A8=; b=Km6httgi8b6e/mepxixyYfoaANhBcaG02iwcnc
 bbi80mXxyfVGP9tg7BY454VR4lF1BsWQhHoVHoxxNTvBmdWZtin3FFBmOOdMBhn6
 BhJO8Hv8T0tO7RCTcgZ37S4LPzQX/EmSDPrsfWl1LkLe4cvagwpBJJeEveDE9f96
 ju0v+llIQicgoymYA56MXgNHfNojqmlsGyJxVqEvU/UAH+LM6V2uiJfJzWGXVuYH
 bZrUDzsIEn1u1o3GO1kMXe8+1Nuta1o2yGvG5au4hWj2aUTg3faj+x0zWYwDOL4r
 Op5VPOjIDLQKl8YjPOcr/U3nGeP0jQmcnykRNDqLq07nYMTA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putkscf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 02:59:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T2x8rg021947
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 02:59:08 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 19:59:07 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH 0/5] tests/kms_writeback: Add clone mode subtest
Date: Wed, 28 Aug 2024 19:58:46 -0700
Message-ID: <20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAObjz2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyNz3cz0Et3k8iRdI+O0FAvDFONE80QTJaDqgqLUtMwKsEnRsbW1AOL
 0TI1ZAAAA
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Jessica Zhang <jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724900347; l=1731;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=tzd6NAaMsUoreTBqiHgse6Z7iMWyzeB8QRndsc2IqMM=;
 b=HcbDTg21SGXdpiPx+fv6KVx9FrumOLi6Hml1pdHyayvKhbK40ASoWLiE8y98dJaQU72ugBimo
 5ahkgiNest3DnoTX3rzXgkvkDLyyUBFD4lSCH9FlWKa0UYHpLoi9wFC
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: mcpr7lQIyWje3exi4KWfuTzuducJjQa9
X-Proofpoint-ORIG-GUID: mcpr7lQIyWje3exi4KWfuTzuducJjQa9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=400 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290021
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

- Fixes for properly cleaning up the kms_writeback state and forcing a
  modeset after igt_display_require() to prevent commit failures when
  the writeback mode is the same as the primary display mode
- Adjust the duplicate pipe check in igt_display_refresh() to allow for
  combinations of valid clones
- Moving the writeback dump to its own subtest
- Adding a subtest to dump all writeback/non-writeback cloned pairs

To dump the clone mode buffer, run the following command:

IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
	./build/tests/kms_writeback [--run-subtest dump-valid-clones] \
	-dc <primary display mode>

This will output a file named <file name>-encoder<writeback encoder
id>-encoder<primary display encoder id>

---
Jessica Zhang (5):
      tests/kms_writeback: clear writeback properties in teardown path
      lib/igt_kms: Add helper to get encoder index
      lib/igt_kms: loosen duplicate check in igt_display_refresh
      tests/kms_writeback: Disable all outputs after igt_display_require()
      tests/kms_writeback: Add dump for valid clone mode

 lib/igt_kms.c         | 57 +++++++++++++++++++++++++++++------
 lib/igt_kms.h         |  2 ++
 tests/kms_setmode.c   | 14 ++-------
 tests/kms_writeback.c | 83 +++++++++++++++++++++++++++++++++++++++++++--------
 4 files changed, 122 insertions(+), 34 deletions(-)
---
base-commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d
change-id: 20240827-igt-cwb-23fd81d3a7a4

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>

