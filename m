Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234D9606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=GttAsepu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B259F10E17D;
	Wed, 11 Nov 2026 05:33:00 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A215410E17D
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:01 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AB4tbM02806102
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=5Hy3ilFZKT+e7v9wLvIDGH+
 mi/4ZRw10r/1bOHNVJSs=; b=GttAsepuudoIdM+rFLrNPMP1MtrDy06SW54zA3/
 UmFwd28/Cu/bG2/qmc9l5/oWYJ51VvfcX28U0AOWpyEKPYBIJZq/3Wbe1awbannW
 RkLKlK3iydc7/Gi4UBKDYl2FYAhiTwr9oZrtEcH3OTy9q+m/Upd2G0JkwQc9Rd7m
 miAflGpfb+qpw1ems2KVHmKRA0lnrwkWwrzOHbK3c9qkhqAO8eQdDkakjFPHU6ZT
 93hGnH7Jk645LZXIMm0LSWk4fmV9CBfCw/DdSIObyLaUId/k9yHbEWlnazQxpXF1
 JgYzVKGqgfILq+EknJ9DNzNvQ+K+HVoHvNP5XEnaF1vXOiw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hsvxx2xtm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:31:59 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 05:31:57 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: [PATCH i-g-t v2 0/2] imagination: Add Firmware information query test
Date: Wed, 11 Nov 2026 11:01:49 +0530
Message-ID: <20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMX982oC/22NwQ7CIBAFf6XZsxigDQ2e/A/TmBaXdk0KBhA1T
 f/dUq8eJ5k3b4GIgTDCqVogYKZI3m0gDxWYqXcjMrptDJJLJbjUbGiYfV3JWc+k0n3bCKHqtoF
 t8Aho6b3HLt2P43O4o0mlUIyJYvLhs79lUby/4SyYYByH2nBdPuyZ5jGhORo/Q7eu6xd0KLtut
 wAAAA==
X-Change-ID: 20261029-b4-fw_info-269a74116374
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=upOODtMGVOtn6CTNYOyQrIxxln7NcsdJ+Lz5+7ubYYg=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq8/3MkZVLdWU2mCvb/lChaMcsGZdL6d5yq9JL7
 yOy+8gBqSuJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavP9zAAKCRDQJndZfgLx
 cK17EACFoplzBVXQr4lSsfvl3KHaBk5ytc5dKQsRV5Dh4xibOlei9TAIpAayd/TsrVjSZGR9ue3
 Bue3KmYrUfx0UZ7gy/7vFsYNeVEa4WSQYNYFQGn+pIKX4qtlgRuN07kYCvlIv476FGQdqIO65zT
 2o+UFEfcYHnoWg+nAHAiZiCXk2vmT1tmneuI27Sx524jQl5NV7z2VXGFw+mapoYfvthhA7NJWbh
 8+YBxh0aGkZjgj61DXIPiT0p9ZCTuijFpD2RCGughqUGkRBsIKOzp7VYn2Gg5cUdqls0NpfPlEO
 vOfC4K+osYW0/FQ0Yz4L0wZNOfRZxkMM6VkqT3eG5VXHA++PXB4wsGGfggCnZlrgBvhFYyLYVcE
 3ec+GMuyULEwbho3unSUvk0e8+iXOw7s2H1mVrMriv9nahE2qR2LD8DGEW6MlsZB+4dxBCIB+tZ
 VBDfZMUPvX90HaYYs5yZPRyx5PcumqXGswK8zB6R3/jzHz37/eY88WHKCQevw4kUZOj9GkEV3Bb
 iewSz9XU3kG6xkfHvQjoARxABJTUFY1sRF9iD+Kv4LfYDCUde0lvC7zB4bXP3ckIbgECFgc4fBL
 vLr+G+4l+ipmdX2PATaMhL5v9oYQeo9pRBlfdI5tQbIzvCc1hXOghlXkomgSbFgBBQeDbty8pdB
 85h9XHzQuZ07c6w==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyMSBTYWx0ZWRfX++qZUdNKT4Sg
 ncLc+ojiAs11+FDWwdwcF8Y3n5Uzso7kVpVRu+z+Wi50vTYg3W6sgROdNS4gqX8VXe9k966rtEz
 avGEqTngk6xuWV4CDHlYHkUapgvxjgg=
X-Proofpoint-ORIG-GUID: SwUJOVgbk0KNJRSxvu7d3POOHDlOrAY1
X-Authority-Analysis: v=2.4 cv=H+JOUOYi c=1 sm=1 tr=0 ts=6af3fdcf cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=e5mUnYsNAAAA:8 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=eHYVm4iWdcWmjzoldm4A:9
 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyMSBTYWx0ZWRfXxuwBwzChMr3y
 C5hJQVt7g8xRN4ZMcRS29qTM+tLz4Ib1eYKmg8pmOz00Gjc6geFypjO0SNK3Epbe9Zuev8AL6X9
 Butr9XsW8f3l0nz+mF4cEP+LhEvPnHV0n6hAfZ5b0DsxNYRAgA6xMSCMrYGBTQVL2a4DPCTw77n
 1Qb0bXDcXTx20XSr2T5uhcKh8h/rRQNBbY2Q0aPu6G/6HhwKRgzd2c/bdKw/+qgV7LBxKcLGHwP
 JYDn7lh9XVH0ZmB11anPY+Cs/DL+n+w1DjVwqVWA/9zmQYJ3TdY+pW8H6uFkFh5uwKA+57Nn3y1
 EvxMs0iDg9hh+IYfqhA4CRlyPcWvO5k+yO6d/o5DpyjyE20ZRjvTTwW7UWCBRRdQf/0KYknYp3w
 Bll3NBqRnGGUZ/RKFaRic7+Innnd6Egvy4UxxyqmUykxGjzv88RhhrSiEae3E2BnkORcZZ0xhEa
 7uucN8pkmzb+dmQZTOw==
X-Proofpoint-GUID: SwUJOVgbk0KNJRSxvu7d3POOHDlOrAY1
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
Changes in v2:
- Moved the test and UAPI header update into different commits as suggested by Kamil.
- UAPI header patch description updated with relevant drm-next commit ID.
- Link to v1: https://patch.msgid.link/20261029-b4-fw_info-v1-1-0eb3c0969a7f@imgtec.com

---
Brajesh Gupta (2):
      tests/imagination: Add query Firmware information test
      drm_uapi/imagination: Sync with drm-next

 include/drm-uapi/pvr_drm.h        | 21 +++++++++++++++++++++
 tests/imagination/pvr_dev_query.c | 28 +++++++++++++++++++++++++---
 2 files changed, 46 insertions(+), 3 deletions(-)
---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261029-b4-fw_info-269a74116374

Best regards,
--  
Brajesh Gupta <brajesh.gupta@imgtec.com>

