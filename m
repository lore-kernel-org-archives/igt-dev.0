Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1353606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=stFvxzta
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8956310E2ED;
	Wed, 11 Nov 2026 05:03:34 +0000 (UTC)
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0EB010E379
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:34 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AB4qSZ42867586
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=WgprOfnJStaoO4roU5Slb1+
 qUGF3f4g9OyD9aUIFPQM=; b=stFvxztap/eMvrqrIpHJxif8cCkVF1stFZJwQcv
 AzswOn/2quh757s+t4YbHYEplyg59AOTKyB3VYZFmVWA6kSrAsClRgMZfNnLD1C3
 YJylvHH5z1FbRuwCLGzLiF3J0S+YcfUB5LPYJKlvOOlSozJvoylLW+fztcHM516u
 QwiDn4gI7RT+cirMl6BngpsI1Jyg71shZHhVCC3iZ6vuHE/ok9v77XtRAirVa0UF
 mZZbuoHYeIfIF+eIz3yzCYvRvRZlcpDFMi9nk9uzJsQII3Exi7xwc607im4ZQD3K
 Yfx7lwR9oD4osPg1uLARy2P11AjJ7EUPHeUKDKZUcWBERmw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4hu8pn9faj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:32 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 05:02:31 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: [PATCH i-g-t v3 0/3] imagination: Update allocation flags for
 buffers in submit job
Date: Wed, 11 Nov 2026 10:32:20 +0530
Message-ID: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN3282oC/4XNywrCMBCF4VcpWRuZpLUXV76HiOQybSP0QpIGp
 fTdTerKjS5/OPPNShxag46cs5VYDMaZaYyRHzKiejF2SI2OTTjwkgFvqCyoxVGjvS+zFh5p1Wh
 QbQUoAUk8my225rmT19un3SIfqHxy0qI3zk/2tf8MLO1+8IFRoIVoOCrOQJfiYobOozqqaSDJD
 /yfwKMgc1afpMQaGvYlbNv2Bq1YQDgFAQAA
X-Change-ID: 20261029-b4-render_update-79d0cf70eb0e
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=qNbs/vQSeaBDBrgtnmTziuFdEZgSFUnX1k/iOGSh4uA=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq8/bl++mOa5aXvVnCGoPNYY3JSH0z091W/dQ+9
 9DSFujmqPmJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavP25QAKCRDQJndZfgLx
 cN3AD/44M2iGXZFbHKJbdadJ43vKQVWGjhQe4ptNyH4nXroiIC+qjTXKlLFgiGB/OKFNWGCIAH0
 px0A1GW8dJ94iXLnQ4LlLD1WEWRl+LGWxYm0Qbm/jZqn2Z+0YykKnw4/pMbdYTYTAoiGS0hUYAd
 hdreUO6bX6MIimFg66fmB30Ap9haUhN5rSFu5DP5IQM5ApJeYvw5NsuIdvx9ItYuhZJROFS6IST
 dhedwcI5SHeSqBTBGNsRGoRoCTfA3va18bjk7DxiQyuslnd1IFK7uFTy7cRR/QPGSlaFHqZEv4o
 Sy4hZu5Eo9ELjVPe1e+21JlVnikyrDtsvmGGh2EXSa/UHa10xS2VOqwgqglRnMbSWpOblm7dHK2
 kK2g/TdTDFB3CjFNM0v8OihXmvY3frmyJycwZ2k2g05FQMTBmCr2jfZQ+yvF6OncM2nN608Hxyh
 gghp6u44qqj+uRR5x6cVUUly4HttZy4irfhYN/5jPVRZqEmJ/J3gLK6YrQ7VmVNt8qLN0ReYoXN
 L4GtfIu/AYrB0bf8I+ArINQLPNn7pEga/c++xo6/en1i4ou4o/la0w6jC+MnLIMBUcKT8a7cDwM
 K4cUmKf0ZSXbFqSdBg1IkwaTgacrM6m/U2h4JhKcTSCfT8RBGiFacYF5qfxoT0IQ0eY2KdtbdBG
 3TZ4tb9Hpsg50mA==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Authority-Analysis: v=2.4 cv=P46vFSAu c=1 sm=1 tr=0 ts=6af3f6e8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=skxcUcCHE5kqbTfkDOAA:9 a=QEXdDO2ut3YA:10
 a=FO4_E8m0qiDe52t0p3_H:22 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfXzFR1jdWBLd9B
 GEsi9h7X/YkjN512h6VRi+przvzSCIDJdSSs9jtm0+SWxCmXupBjGVjzFZDjZqvN1sL9HpWAvlA
 GoZF9rTPJH0eZSh7Dd4lJzqycrRkquca6gtvymGlepsLlobVMdPTz9gnMjITc+SHLalT2I1RxAP
 mC8cWIOp1awf16LN9BrCS97Df9HQhKrN8k6mbZBJTE+VAGlggibIDfHR0qKPWD3lizoG/KMMRZo
 JYkAH1PlLNz9I+hAosS5r5vfGOlv98BhDw7qliludzWqKqexnjJ6UViY4t86/OVftZi5nIPoWMu
 rDLqAGCFVVus1gifmwrKUEd9ZgGitrShp8712LQsPW37fF5njsniiXiJY8fxw5+WsVD62kM28xt
 CjN/ERiTrmXLmDoczoYAs1Tm/aV7ALF0FRLnmIOfEVJshZl7QD5lREI1S2lHt/cVaJWb0f35gtv
 OAQHOs/tNluiXUwVziQ==
X-Proofpoint-ORIG-GUID: ktkoo-bAvEO9UHlicrCP32dADwz89qeD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX7mJcemTkLzXF
 2N/5sHtPcGWsRQn5697xBKXyVvglXxmVq/90/qjyxh3iHpLYgIyIEo7dPzyN52SmutlF338cbmq
 l9Pk4n39XVe8PSgKFKfzp4vWb490wzU=
X-Proofpoint-GUID: ktkoo-bAvEO9UHlicrCP32dADwz89qeD
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
Changes in v3:
- Fixed a formatting in Patch 1 as suggested by Luigi.
- Added RB tags for patch 1 and patch 2.
- Link to v2: https://patch.msgid.link/20261029-b4-render_update-v2-0-b3185bbe8091@imgtec.com

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

 lib/igt_pvr.c                       | 30 ++++++++++++++++++------------
 lib/igt_pvr.h                       |  3 ++-
 tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
 3 files changed, 30 insertions(+), 16 deletions(-)
---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261029-b4-render_update-79d0cf70eb0e

Best regards,
--  
Brajesh Gupta <brajesh.gupta@imgtec.com>

