Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD74606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 29 Oct 2026 02:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=d0yoqOcW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBE710E739;
	Thu, 29 Oct 2026 02:53:36 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B86D10E739
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:40 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69T29I4G1494350
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=8BQTMkCFyoLqqhSRxAQYdXU
 mHDo8oFcaMmwB2J4keUE=; b=d0yoqOcWhlaftqlGwgD2VgRkxg9PU0yJRX49e54
 7UUCFHQ6v1knp3WDxQlqEMzsBqz5mrnb59bVdlCd/sYfif967v2Ry+jyQFwWpDx3
 8SxP0v41pXUG1RgdXjQWy8V9jfx2uBLLUJH3lonZ3sLFhcF0GtY+2xr/JjXaCX2/
 56KueMH6HFf1YaqtpjbKFZ1/XvAor7A1XfSOjjc2rlypH16xRM152FqclVsZW9+r
 hibJYGmaAG+XmZVNORXXgoZ3zOTkXNFGcutelTXi7IqbnSnHRGDCbc+mRUx/EKuX
 cg+sVRwMEYhI7VK3tdTjv0UZTJJpi4lQ67bRho1aIqNuQ4w==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hkvbj81hg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Oct 2026 02:52:38 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 29 Oct
 2026 02:52:36 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: [PATCH i-g-t 0/2] EDITME: Update allocation flags for buffers in
 submit job
Date: Thu, 29 Oct 2026 08:22:25 +0530
Message-ID: <20261029-b4-render_update-v1-0-4a92ec210d6a@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOm04moC/yXMQQqDMBBG4avIrBsYQ1H0KqUUk/za6SLKRKUg3
 t2oy2/x3kYJKkjUFhspVkkyxozyUZD/dnGAkZBNlm1Vsm2MexpFDNDPMoVuhqmbwL6vGY5BOZs
 Uvfyv5et9Oy3uBz+fH9r3A3uypv10AAAA
X-Change-ID: 20261029-b4-render_update-79d0cf70eb0e
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=799;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=VS+I+/4G/qj0d4TOu4Sc4VmTCDtLNnrnvNcdpIe4P2s=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq4rTyMKEn8YVq4L8Av8KX3LLPR/3U8DNQVwFh2
 d58+ncHvYqJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCauK08gAKCRDQJndZfgLx
 cOzeEADApSc8bH6Oj4qaO7QYzsNyrwvDJev6GhDLn27FmRIrjv1yT4EAl0oJdj2b6IPN0+MrrFV
 VTV8414vcPyX+uGKS5JRVXeHaGhqDaNm5ZiE1x1ZjFRpux+XLktLX/58jmtp0Gv9QkTdGmApEtD
 QVeYlp3/dAmp3xjJCwx+LBKUUTOVYdkOqrF7TBTr4PDKtWi9QPswdw6TGAauIB6UUzGjmG+ttIo
 7YVCFwocrRS4cuvGYxycIK4sFvmdWyaNFX8kQ5zWAMYUf6snEcYXyLk7nRcOXBUek2lraXlyJE+
 x92h1nD7ta7Fhlv1zmQ9QLYgOjdzzzUD719wprOIRZZbL0BB+u8l/bp2sZul54bVx9Liq+pJHrI
 EM5HpP1rKNwz1ecCBs5zDibivuTTBjirfkDGvyxlFz1QnlPGzb+W8KteEejqO09NCubfnwGfXO6
 Fv/xjOIx5/xMGHTGTzpHSrxH7ogGFUZAy2V0qz3SUfI79RIpdHe7EP6c5RojBr1pkYBi6yAAtiN
 WdnSEogyC4qU8uv+dF9utEI3p4KTSSsf23+zcLZqOWfJcwzqqIY1VRBKGVxoTR+CN9j7LqnHt7R
 BR7OrzQ/c4sUyj6zk+N228Nz9AN8jIzH2c5QuzG40OfA2NRVm9K6mY87jLShZq3MIG12HJFcswd
 lLnuuUJaOcP+Z0A==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-ORIG-GUID: cbyhg5Gt0GfR34OGK2Lq47laZ3Aw7iBc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxMCBTYWx0ZWRfXxY0Rzild5ytJ
 acD1ldQbqWBfQOCgaHxE+RG3d/M2fSNnob9J9tMRHlXJizNvI+bhU7//iqA+OM6vUeo+9D/dZWw
 73SyQRbCht7FGr9Da0gt/CGYkDLdlOmSQawI0keZk16m90a9+ypuaKiEDNz1jW58ZV0bv6EMtG7
 +n8uiUOcXpJ9YwigpW/ESkLlTApnuFWl55XIOyXB7IOLpA9SN3C/+Aogeukkl38C6N327sucOhc
 bZ5DFkiyD/BF+3pgnBu39SsTSWVfjrQYmboFZFWNKkC22Phqxu4wCm6Qfqnbo1fXIyINAwh/AQf
 cKap3qab/bwcq8EzD4EntPIuAfTJnMa43Q0X/qfuri5lEftL6kHNRZd5p0rwwyGnKRtpnhxw0Ta
 WjkvRgB+tVV2fWvfBfzeAaWmOVORLlrhOSl7pp1S9si2khk4hcLC7JzuvMcxX7gXoD/dMzVq+1L
 sTFRSwNJVpQOK+MEVkQ==
X-Proofpoint-GUID: cbyhg5Gt0GfR34OGK2Lq47laZ3Aw7iBc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxMCBTYWx0ZWRfXz3zdd75DU6rc
 E29XbowvsFdYZiU2aQhr9HnfSk3wQoOMRxGTa/Tu9EutDQzmC7o755Mu4ap6ktIFlpb05ivqvBo
 8xUebnRk8aPBtc7j7ty78Ezii5+F78Q=
X-Authority-Analysis: v=2.4 cv=NvdE4MdJ c=1 sm=1 tr=0 ts=6ae2b4f6 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=XbwjtPCTpuV0PRI35ZwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
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

Update BO allocation flags to match expectation:
- Remove the CPU_ACCESS flag from BOs that are not host-accessed.
- Use DRM_PVR_BO_PM_FW_PROTECT for MList allocations.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
Brajesh Gupta (2):
      Drop CPU access flag for a few Render related allocations
      lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList allocation

 lib/igt_pvr.c                       | 24 ++++++++++++------------
 lib/igt_pvr.h                       |  3 ++-
 tests/imagination/pvr_submit_jobs.c |  9 ++++++---
 3 files changed, 20 insertions(+), 16 deletions(-)
---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261029-b4-render_update-79d0cf70eb0e

Best regards,
--  
Brajesh Gupta <brajesh.gupta@imgtec.com>

