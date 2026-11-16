Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C5606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=XiXXknZ9
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 428EF10ED8B;
	Mon, 16 Nov 2026 09:52:57 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0FF910E1F9
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:57 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AG8XfYn3664688
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=XBcuRYTqyTMjfQKlU/QWY0f
 SS9npP/FFS5r7awoZA/c=; b=XiXXknZ9pXhKqahCMxci6VY907gVWOVBsI3K/1g
 SITWa8Okn3heEKpjzOkurb50sdhfKa6+nzGtDeSVNbzUtPNuTUZSINwncu1ZDXR0
 YHGwmB3i2nWumgxVEj2hGATNdj0+X8rL9pJbke+cCunVxsA9ycoX6xLvzK+uZ3i7
 CcomwvAvl/9FQ595ON7wZVyLSNv6VPRBDwTpFURYue9c89FqbsN/gWPTmp+nWMWr
 /BZQaDk6juPRRU7PsdA3ZaY18eDgvsyvyhqRYAlbKhKN2FqQ77g/SzbSZ3oXdUJE
 47AaM4V+Nfa3SQdna/6mTGIt9NUU7pYnum5f4kkNvoBBT7A==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hxgky1dys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 09:51:55 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.225) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 09:51:52 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Subject: [PATCH i-g-t v4 0/2] imagination: Update allocation flags for
 buffers in submit job
Date: Mon, 16 Nov 2026 15:21:36 +0530
Message-ID: <20261116-b4-render_update-v4-0-ace469e01c8a@imgtec.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjS+moC/4XPTQrCMBAF4KtI1kYmaWwbV95DRJpk0kboD0lbl
 NK7m9aFiKKze/DmG2YiAb3DQA6biXgcXXBtE4PYboiuiqZE6kzMhANPGXBJlaAeG4P+MnSm6JF
 m0oC2GaACJHGt82jdbSVP52cOg7qi7hdnaVQu9K2/rzdHtvR+8COjQEUhOWrOwKTF0dVlj3qn2
 5os/sj/CTwKKmH5XinMQbIPIXkJcb4ISRRkfFRbYNaK5E2Y5/kBzjph00cBAAA=
X-Change-ID: 20261029-b4-render_update-79d0cf70eb0e
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=zQamW1ncYJUGV9lcE6LZbU6ilUvQPvRaPKlpdTVE1kQ=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq+tI3b3Aawz5mYprLC6ow8oD2lDw9qACNV3tx3
 3R0ta7qisaJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavrSNwAKCRDQJndZfgLx
 cNQPD/0W5Ri+hX5uvXAovFnO2+cEHIxzmW2v07AAs3bd9WGXrAREDDzZACrYWohsOiZEryzuwEB
 TadKV1ZJrNQ6c/1SMYOO9gNYOgFps8QQPJIEMvdZHtDxo51JukqHPVnZCEfu2OSseIa6LDZ5vmP
 xvyhYr/ulFgUm+pk3NFbivygzo98uS+1839ag3Hrg77L9S0G6uYaLce8A0EGytev+gySFYEa/AP
 dvw9/D7gnrlRBu3mmhZkrHs7Ct0YmoJupbonYoNLIfNScF+xTJJByscpKGVd44wKXu39bBHbnHy
 rNbOINWvv9vtdSMBlOeeoLOzn+fVsOVQXdNZFvzzee8B7YS966l3Y9+WGVaHITX8t9nlN2nBAaJ
 aoexyPkbQ7lE+466PSITQ10NzEp+IiG3nsl9ivYT3NwcaTIwMLRu1FC4+vzpqC6ZdcUunz0FkX1
 VfKAQ+8AqV/jKhvbL/flire12I+ClmylM7hOWXSUMcbfUme9/3vsWIOF0Ifc6J4fu8rDb1W4GuA
 97cNx1A1H7mTvGgb6b/ChLJ1Z3rFE3C6+5zgVC0vu3wRf8BylFoX9nI9Bb4QlqDTV1+8o4YjTal
 YORyByqV9wKn/i5X3sppYsOM2B9DYHqVRmlabT/bXjGOC4s4AdiwhucGm+7hi8+md0GNbBJfpzX
 VMd3EaV9bg7yCRg==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfXwuSbcL8MaWG2
 mGjuqgbsWCZcSYAGx3MozVL8doJfg4E7r5AdxvdXHRBLOeMsCZX5259ZIFSEUaqT5W8CqikNrDH
 3zYNLILzORetY2llSoPDTL6oJc91+NfPFDRPbiz6dfUDOXw3gddCWjAiuHB2lpjFONcN8oqKxEH
 tTbowiM3jinor1HKBo9WCSiziemZggA4SRqyGSAxnlZmHaUEpvqJTceWeV3cDd3X/KnQSZNfc/s
 gjl/Kx91cqA8X7zf27GlmxP25Kz32uqTWbcWz9jXv4NcH+lWoo/viaIW9dSM6WzTEPvVDCJQhHH
 ZSH9jka8uVtZtfay4O6eAQj+NG0lNulB8Ow+67aZCErw6zVuV4cwnazL1eX2lbxNzOhOn0i4SB4
 3EosBxMJkAHHUsEobAdBTKOJ42SZTo2VQuoqv3PxrW0fVo5TvxJZvgXch+Uj57Gl6fcLq1dMNB+
 7dWGGU4JwQ7VIFq2wJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzOSBTYWx0ZWRfXzjilN5nAz4Px
 esCSSw5iOQagDwkYCoP2siNTfgu7AwYoTd4qvhyE9DS6BCkPiSaL0At3UUK66KvIWUCu7g746Em
 bnd+dyWYrNfpUWF4UyeqmF5Xjsk7mJk=
X-Proofpoint-ORIG-GUID: UcTGNRpVj7Mhe_xdLoPzUbUvm2vkiFnl
X-Proofpoint-GUID: UcTGNRpVj7Mhe_xdLoPzUbUvm2vkiFnl
X-Authority-Analysis: v=2.4 cv=TbsDJhQh c=1 sm=1 tr=0 ts=6afad23b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=HYrZrZQ_E1YA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=bC-a23v3AAAA:8 a=r_1tXGB3AAAA:8 a=skxcUcCHE5kqbTfkDOAA:9 a=QEXdDO2ut3YA:10
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

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
Changes in v4:
- Drop patch 3 for dropping DRM_PVR_BO_PM_FW_PROTECT for MList from v3.
- Link to v3: https://patch.msgid.link/20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com

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
Brajesh Gupta (2):
      lib/igt_pvr: Update general heap allocation interface to pass flags
      imagination: Skip CPU access flag for a few Render related allocations

 lib/igt_pvr.c                       | 29 +++++++++++++++++------------
 lib/igt_pvr.h                       |  3 ++-
 tests/imagination/pvr_submit_jobs.c | 13 ++++++++++---
 3 files changed, 29 insertions(+), 16 deletions(-)
---
base-commit: fc75d6d7ffcb79e8a3316e80c7085460568a7670
change-id: 20261029-b4-render_update-79d0cf70eb0e

Best regards,
--  
Brajesh Gupta <brajesh.gupta@imgtec.com>

