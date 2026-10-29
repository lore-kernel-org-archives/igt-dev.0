Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12D0606A31A
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 12:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=yKX/6jIB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8136A10E11B;
	Thu, 29 Oct 2026 12:35:17 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7689112262
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:19 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T8uPBI2231093
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=UCC0HwTf1XtanbRWQclaOfO
 ZPhdrDDCeRvL4mnQC8Z0=; b=yKX/6jIBxnOkBLduVF9BbL+iZDMixd12kT5RdVn
 MdXhnsHD1a6mkG4rx8JCTsxOBCKjTp5R8/r20HwOSord86+Bapy6sniXXaiNbtw6
 R8kX8kJX3W9hF1I47apY9k63L1V6Vu7Ba6+uMNggso+9Xy+9Ckk+LcijScUuvfsl
 /PH/Uz0XuO4G4KpN3aoFQY4qpAkq0FIzJNaEeGvriE056k3oTN1KUa6LDbP+swCi
 ghtOPDm5aNx+djpYZePGFi1DDM0xkQ8KMNMko+cYpqZcNGAgDcERLgmsAobhDJyA
 25j3RzccCd2+uRKIHYl4sthgsrrVZn4xP1w4dHR/c2y5uKw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvbj8efa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 12:34:17 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 12:34:16 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: [PATCH i-g-t v2 0/3] imagination: Update allocation flags for
 buffers in submit job
Date: Thu, 29 Oct 2026 18:03:48 +0530
Message-ID: <20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACw942oC/32NywqDMBBFf0Vm3ZRJECVd9T+KlJiMOgUfJFFaJ
 P/eaPddHjj33B0CeaYAt2IHTxsHnqcM6lKAHczUk2CXGRSqSqLSoi2Fp8mRf66LM5FErR3arkZ
 qkSDPFk8dv8/ko/lxWNsX2Xh0DmPgEGf/OT83eXh/8psUKEqjFVkl0VXmzmMfyV7tPEKTUvoCk
 15vmMMAAAA=
X-Change-ID: 20261029-b4-render_update-79d0cf70eb0e
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1187;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=okvtYBVow2F67CQtzE4xuiDAPp/alyfIvyqT0/ojDu4=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4z1BRaYlkhAwdoOq46Ax5e8dLohNJ8b4uLBiO
 ZbToXVsm82JAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauM9QQAKCRDQJndZfgLx
 cPmlEACDZILEf3Q6BwIFqySbS90FLEdK4jVGoYtxBfaWzi5XJQKq+XOBR4IlVnCAVPQy2oOWfo2
 ZEr0O0CCRf23g1okvwHjQxkFL36hWE20ba7ey4zVTejeh5Oj+AI+kMTiPOlfE37/8vJky8R8JSH
 bcoI8KYumzl8EVQlAbpDtdpYRMVOaVnim4eHJDnHwgEjbtE1zDcymMCyoSDZZeC4XnGTdnCVS4H
 LFyvcRDp7ISCZBlg0B1maiz8Y6mqCT4m4rJ9lTC2SG5ydkBRzFY3MidmjghW+GkGiGAPuV906eM
 DRGt6zySaIXGFeEYBN7SxfFKXsr0GYaROvkJqJivHqTARYZUoYC/f28GEOa9VX8UPi+tkN4RHJ/
 XyI+MdolUgEgo9MdpK3Vf8VuqEjJrdOvD06xrZ+hRr4uGCerWz9eoOLScNG5JksV4sOtLQKCEPX
 wO+uHaRvW5JsZVKy/4sesqHCMkgKC1I4yAz9iYXqhNupXZ3z+P4qOvQeYklpsTp2M8Rzheiyoat
 CDnL7gjZUgTh2EQm5lrJktKs5iLgvHxwPYhMhXheBhcWLoQl/T34lXum716XCgoFSJ38UtY8aZd
 kjC9EQdxD98aohKGu5NePnUTzbKcl9+epKKVIxi2ProRECiPALS/1wsp54wCVJnaduJ9R2SDCO1
 MUlqpK/xjoSramA==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-ORIG-GUID: XJgNA8s2XA09Sf92M10CB2h8lA2GIlGb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX1RNPVui1Fb/k
 GW62yX9VAFTX9BUYeX7FwNEHfRwnWHGL746pu/8kIcF3j2bvH90VAANVT48pspeBFcrg2xLLOy6
 GSxaCssNeYJ4dFBGjMwkbhnYiKi6yXRl16R0bRJM6q6f9TeuHtiGhcXuaJjZrCmerLbHLQamyd0
 E2xNyz5v75j2VVVQO3EWz5elgMgIggG6hUv+KUboVCJiFSrTrFuu4+hke3OagijWR2FeeNl0Moh
 GQuI2y8HG9q3BY4PYWZoJdRFQwrOdCzKlyGqNKaCN5zkoZ9T0PXKA/3SnqABteK6CGkkx8FJDQp
 y851AJ6FQYVp2iGczvmvI1rFv4CoYKp9SCamY7hTBnUHil/AC7Pee9zWEe7ZVwmVxOf2LPrZfv/
 AotR67hJu3J5cckZtGhbVdYJSTcATpdZxV+QM6gJwriy+pt2idLfeKhRUkUn5MrTshpPUdjJC2j
 HjfY0ezF/2m6ek3HCIw==
X-Proofpoint-GUID: XJgNA8s2XA09Sf92M10CB2h8lA2GIlGb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OCBTYWx0ZWRfX6pR0LmNUamZ6
 eV7qkf12ZugnT8ZOy+f3bYp0B2E+LPdx+ykqwp1jbHyJcXkw55khDC6i6SnulZ74D0ppuC+kA8t
 zqfPffJBhiSW7AENjrgBLytIwIBay1k=
X-Authority-Analysis: v=2.4 cv=NvdE4MdJ c=1 sm=1 tr=0 ts=6ae33d49 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=_Uq_1VLlfM_DBxuO6DYA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
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

Update BO allocation flags to match expectation:
- Remove the CPU_ACCESS flag from BOs that are not host-accessed.
- Use DRM_PVR_BO_PM_FW_PROTECT for MList allocations.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
Changes in v2:
- Update as per Kamil's feedback.
- Updated description to map commits are specific to Imagination.
- Spilt lib/igt change to two: Interface update and flags update.
- Link to v1: https://patch.msgid.link/20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com

---
Brajesh Gupta (3):
      lib/igt_pvr: Update general heap allocation interface to pass flags
      imagination: Skip CPU access flag for a few Render related allocations
      lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList allocation

 lib/igt_pvr.c                       | 33 +++++++++++++++++++--------------
 lib/igt_pvr.h                       |  3 ++-
 tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
 3 files changed, 31 insertions(+), 18 deletions(-)
---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261029-b4-render_update-79d0cf70eb0e

Best regards,
--  
Brajesh Gupta <brajesh.gupta@imgtec.com>

