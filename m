Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B48C54F52
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 19:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF4CA10E9F1;
	Tue, 28 Jul 2026 19:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="WW9JHM5R";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E98110E5E2
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 19:39:49 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66SInsti3113201; Tue, 28 Jul 2026 20:39:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=HYyGY/e4RtUMmZCvTxY67bB
 cMR4VR6agpYKVtugcRks=; b=WW9JHM5RD5Q0tildIHi+rNkAjcn5Ws07V9/d6Ah
 Rjk3ra6cRY/aL4ALpKfKlXlJyMVIEf+tQ8u6XxCQmzfQGZDdfg7hen8zFqcCgmpa
 OsUm1T4R4k4VaHZ0iiiaBwt1gZaxScj/YsgOCcRhvJMgfpGwDRyzeMJ0qDl2c/gE
 DiFfQkxH9L7ewfY9Eehq8BzpZxCVJRQNuiVqaSNQTeRWyDwW3BB/lEPyWQvvXRjz
 8V1J15DA6AAUnq7vibqEA+IkXUpJEu/JdHd/PPkCUPHYAFcNTSUsH8Ug90uOr8HS
 QJdCSQ7N1o/umcSRFcufXHOyJGuO5da6B4rMwCng0IwnOJA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s31s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 20:39:44 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 20:39:42 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t 0/2] tests/imagination: Additional DEV_QUERY tests
Date: Tue, 28 Jul 2026 21:39:32 +0200
Message-ID: <20260728-test-imagination-additional-dev_query-tests-v1-0-f361c7c2b513@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHQFaWoC/x2NUQrCMBAFr1L224U0xFq9ihRZkk1d0NhmY1FK7
 27s3xsY5q2gnIUVLs0KmRdReaUK7aEBf6c0MkqoDNbYzpxsj4W1oDxplESlykghyH/QAwMvt/n
 N+btbip2P/ti6s3F9hFqcMkf57G/XYdt+JnnjTX0AAAA=
X-Change-ID: 20260728-test-imagination-additional-dev_query-tests-6cfc5149048f
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785267582; l=976;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=1WQLEeGAz42M7/tw62572zj6o/+SCgfCLZljbnYrdHw=;
 b=fNBtP+7JHdcAevQUUlbvKDoiUWhd4QZxghlcijEuGHoTUQyUv4dxbV278jtWmNAoPvwpGlTy+
 Hs/NBBaQt0LDVa2Hz1IxC7OOocIMRbLOuFp+i5CbfrOq4l0D8AnOdOb
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE2OSBTYWx0ZWRfX/b0nMJ3Bnwx3
 DQrerwxqno1O9HuPaaCiCMsGmXqBbf9yyvH5TqER9XR67lFUaWmaeqWhg6r6jDe0Z18hcYUU5UH
 EQB5DbCQoNWyqU4rLhzvZbWYlrfK6Z8=
X-Proofpoint-GUID: XnY8YJF7QIjHI6lh2HPu3osd8iSV-Ma4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE2OSBTYWx0ZWRfXygUgdJUzEQKz
 PTPBTCZrn8Mo2aY7ATJbDOzVWoFWXDqR9kGNiYDttWY7ZHqMnjVq9RyRQVE1R0M/L+hC9ZBYpuq
 q0WYaC+CEcH6PMaTjGT9smAD7as5RPa/ahiccLVQGA8MlXhvn+rBqVnIeVYPYjq1OXNbmPJ7cXw
 Ef21Avz6+TeK/tReDgMX35zIzbqCnbMgoglXr7dMbnSlBRcoTCPFhpbNwqMdMLrxAVltOk8vYzZ
 pet9BV2wygF5L5h7kSZ+uaVrYoO4MNZTtZs3boy2aPa5LE0gDvDnEd0QV3DTcYi5NyS73CvXDlL
 omK/NkkeUBSYzmwACTiv7rLqz8h1odhOoBzc1GcYYI7caok4uk2VmqpxDIQ7gMFdSgVWHNi2WFJ
 92hnkTdfUPF7OBlE+r8DlR8Ls+31i5U47KzUyT3Qkbf0Rn21hp/E+dqZydt0Duqh8hIWj/72sMa
 VKl7UJDW+d85huaoKzw==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a690580 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=eqcnsUqq1yH32upTwJgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: XnY8YJF7QIjHI6lh2HPu3osd8iSV-Ma4
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

The series includes:
      - Runtime information tests
      - Quirks and enhancements query tests

This series contains updated versions of patches 9/10 and 10/10
from the previously submitted Imagination test coverage series.

Changes since the previous submission:
- Fix pointer assignment in pvr_quirks_enhancements.

Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
Donald Robson (2):
      tests/imagination: Add DEV_QUERY quirks and enhancements tests
      tests/imagination: Add DEV_QUERY runtime_info tests

 tests/imagination/meson.build               |   2 +
 tests/imagination/pvr_quirks_enhancements.c | 112 ++++++++++++++++++++++++++++
 tests/imagination/pvr_runtime_info.c        |  31 ++++++++
 3 files changed, 145 insertions(+)
---
base-commit: c736a0731493c06f9698ca200562a1b16431640f
change-id: 20260728-test-imagination-additional-dev_query-tests-6cfc5149048f

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>

