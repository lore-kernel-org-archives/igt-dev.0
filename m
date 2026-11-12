Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C6606A88A
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 06:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=u12kHW4K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C2410E522;
	Thu, 12 Nov 2026 06:25:41 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F6210E522
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:11 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AC67KmG1358801
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=PWWx3fcdtqC6P9dT352gcTL
 61ENRxHg9QUafL/L1zsE=; b=u12kHW4Kmg4XFo/kpmhtffnKgshnCPJ8O6Evqy7
 Mi10ozZCeqtJ+zJuq6/Aiv3d7BPYxKO114x6h6hqGyPEw7rUL6LWHJdzz9lCtAqc
 UbJlvhlDt9+B19dtWrLCeUFWoZ467wQRGoqL1DRfL6Kdg/Swzg5rKBx5aigY9BA3
 P8KRSRdRQkDbSs5M4py8gLVbcJ4dp3CzMEbJZYhRxi6FMPADuwNvn85T8qnQc3fM
 Lcb7LaD6ns6k1/FtWvMVcUhNVj23JREqMENd1FQH5mV4I+WXSwL4pB00TOCNsAMv
 +egqWQtOMRg4el367NnicDcdXdWzglJFfYQZUYBfjcLqSIQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hw484g45f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:09 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 06:24:07 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: [PATCH i-g-t v3 0/2] imagination: Add Firmware information query test
Date: Thu, 12 Nov 2026 11:53:49 +0530
Message-ID: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHVb9WoC/22N0QrCIBiFX2V4naHOTdZV7xERm/5uf9AMXVaMv
 Xu6LmLQuTtwvu/MJIBHCORQzMRDxIBuTKXcFUQP7dgDRZM6EUzUnImGdpLa5wVH66iom1ZJzut
 SSZKAuweLr1V2On97eHRX0FM25MWAYXL+vb5Fnnd/xZFTThl0pWZN/rBHvPUT6L12N5LNUfzYl
 A0rKKPSKMWNgUqpasMuy/IBFn3jBPMAAAA=
X-Change-ID: 20261029-b4-fw_info-269a74116374
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1237;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=xI253m5fR6+yGNzuVKm8DVMt6OuscKnbG/Z0qmW99XE=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq9VuCxq4R42z7gqjF8LnxFfkdwZj7+MkiFg8IL
 14VTk2uK1OJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavVbggAKCRDQJndZfgLx
 cAuIEACr1uxhwyIhEf39Oqv0Gs5siQrZQv4feL0by8IMCd9QIVKOL8HsBY35N0STB783UU0/4Bs
 BrPZyKx1x2k72gsNi73TPb+P6Cnrn4vTQS629EXuGHI1ClIoYEOneKOGgF8/jhNbMkE4MYi1giD
 BOrqYm82RTz8I8MXVNx5GxCMyoayAzRl797naZoLheH20myoFJngAYLgOBWh5mJGoFEMQjEr6si
 tLXS7MMu1jjxPxgA364Ycl/auu4EXhb1ZiRWUpKYvJyx7YN5I4/R9Nev6q7c9kbj+iCIdAbVHMW
 nQNlSH8F4zL1KuMSSap4d0UeAgIAZBetcdouV9oW74m+33NZWzs2AGDj48jvW5Gruq8KcOwO/S2
 gtJojADNqD4XgGNHgGp0TXoC/Wwmx1jTO/X7y3EzqJUGAzzQN30z8RhVng0M1vEwlCkkmf6Dgv8
 aiEC9OwSiVhUBUTOMSVgRx9/sxY5WWYKfupJIf8H2YSva8PvqkDuactVgSDhsbA/8TtLL3dRKFM
 nyt6CNuPqWIahg/uZ1B9/TbOba4SOFlG1s/BaDde6bJ7kWXh3t3CoiOHl8qrb6eWveFO8neKGrU
 voDwXpi2bsBBHvemU32h5iU4ee75NZyleT6m8RDv32pUfshHeFmCm9Ktgs+W9/7nhXB1PdMbA1i
 7/OySmx8O415Nqg==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfX/9dPgXpsG69G
 W9iyZIF/dIPF/GTlLlaGsDisIxNsJEDsr5CuxKbKLiGKznLS8/ucmLOxzpUXJH79nE3R/afFmPK
 QWHuzcJsBzaNspftoPEpEw3/6eo0d6hHE9EkyDblTvJcxt2cqWh1PIVBtU+yDJNxDRAoyV/raBm
 SH4F65AQVBbvpZWe7DYpb+XlEh3mbruATXxiSd7IDh9rEvEIav8kQKOyddNtGqxT3T2j2RP5ZwN
 nYnE9y4BJuWXzJr9ajP442UiXW9oyjjU4rAJtT2N8cfJ/zfR0hU4vCXzFJ9ZSgVaZ8Kz6Mzwcbv
 IPAZuFfx1cCdeeKM1n9Bl3mw3BriEgZKO5/f4w/OSgMpXH6vfMmmf/00ceAY9+y6K3od3JZSIeR
 wqEfrWieCsz7GNEOgDnte+b/xANBshqicdLCUEoBjVSkC3OSJimu8zk0ATRNnTa9BIv0QDKbJ7C
 KIjgTY6Um3iBTMFpXvQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfX/Xp3srmOVHKN
 uNSgp44nYNNqzq9Auuk9dfk315jjw2p1C9JRaJ0u3MPzPgnZW8cFTF4BFrfdO1KtpRRImzNrE9s
 4kgzGBgcfw1xBJHSDC3Ao+GgAv/6IP8=
X-Proofpoint-ORIG-GUID: RvQV1J-lRBKOaI7lNA6Uh3oO-g1daTjA
X-Proofpoint-GUID: RvQV1J-lRBKOaI7lNA6Uh3oO-g1daTjA
X-Authority-Analysis: v=2.4 cv=LP/z05W9 c=1 sm=1 tr=0 ts=6af55b89 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=e5mUnYsNAAAA:8 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=MMo_M2FA63SvMNqQ2K4A:9
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add test for new Firmware information query subtype added to DEV_QUERY
under upstream review https://patchwork.freedesktop.org/series/176800/.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
Changes in v3:
- Updated as per inputs from Alessio.
- Change commit order to have UAPI update followed by test using new header.
- Updated UPAI header commit description.
- Link to v2: https://patch.msgid.link/20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com

Changes in v2:
- Moved the test and UAPI header update into different commits as suggested by Kamil.
- UAPI header patch description updated with relevant drm-next commit ID.
- Link to v1: https://patch.msgid.link/20261029-b4-fw_info-v1-1-0eb3c0969a7f@imgtec.com

---
Brajesh Gupta (2):
      drm_uapi/imagination: Sync with drm-next
      tests/imagination: Add query Firmware information test

 include/drm-uapi/pvr_drm.h        | 21 +++++++++++++++++++++
 tests/imagination/pvr_dev_query.c | 28 +++++++++++++++++++++++++---
 2 files changed, 46 insertions(+), 3 deletions(-)
---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261029-b4-fw_info-269a74116374

Best regards,
--  
Brajesh Gupta <brajesh.gupta@imgtec.com>

