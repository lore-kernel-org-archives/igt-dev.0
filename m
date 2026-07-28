Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B958C54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:22:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D310610E533;
	Tue, 28 Jul 2026 07:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="RRRIdnyP";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF6710E540
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:20 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6r4f81820224; Tue, 28 Jul 2026 08:19:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=4
 YwaGs5GzOBLBpYotfPmvA3Ewrz3NxDuHHvkpIcmttU=; b=RRRIdnyP/S3rMtYRU
 W9si+M1vSwbslDMH29APw+ZH6Txpxf98+ZTpij8jN6tJ6esskJlW51VZtWEcSa9l
 ziEH25UNL5cH6hFH1wAces07sh8WYu0l0SSfINpS7+WTbk+bfJUZ843rCsgmIEqU
 jWqPbEQdTsLVIrOWI9vKmCZu5W6FB8Jryw9PKxyv8Wq+gjpuwOw6FN30QekFUcCh
 fnexn1B8Nbz92xyd8L7qmwe91RUSMlRNSzn8agsCVI8X3WxcWGGguzCCriTg3FoC
 a0CFuyGrDiZZeiptJloXCPu5bBu7F5YU5dhIy7ig27mTzX/VWl8+TR7zpdt9+qiX
 sZwMA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 08:19:16 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:14 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:18:57 +0200
Subject: [PATCH i-g-t v5 02/10] tests/imagination: Add GEM mmap tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-2-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=1904;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=NeKKJhaRkKHlcfkumf7SKAOtQhsdPb8ZuAVbUW4DZ/E=;
 b=0lYUQ71KS5dCqkI1aPWtbPk+IhM2KuE1F21Caw6yM8BHBxHFlm5zzRY9o1pLKLOEbt+WvPxuE
 bY2GP/XLXg+AnwUF7M1+t0Amh4P8JYubRtT6JJ/gcvFoKzzoS4fYNwN
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX6j+zjyB47+na
 ErOyBDK9wMgk8LSiGpz9LgzAyZaGUTejsSpImlIIbdGY15sp82cj7GIEPW0dr7BS2Z8NL5oH+Xa
 jon37XvyxWx+vvM7HgQyWY7kWozpryk=
X-Proofpoint-GUID: xMh4nS19_OrNpwqO5WT5vfc94DNvh_oZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX+kipMNtgEHAG
 cVXHEkMYJfE2QaKOreTYz+lRHOEYNzs5hv1Vq+87UayAl5O1VknLHkTzU81/70onpbPR/RBaW6p
 fZnpe8H9T9Yuz8hkOIkUYBp7m+Hip+z7xkUsXpEUpaPYNTLejJV0H6p38Hgf9nYrwbBIarrwFa2
 zpMMZt0a6PtupHJInNmInMRn3IyrdZtagiMU8UmgnZCBOA+QJQqpZr+pJMRCA2IO6E5xzFd3IRW
 rI9plkWWyqsiMprkfy/zgObJ216FA458WQ8Xh5cZ/reariUtwyvkV8W9x2teGSduQBC/AofVUWb
 QEcc6glJIY5tnaU0lQFjsrhS6O7DVnetyssSCTWSTIKGNI3N4TaABNldK5UM+Frvk2yrltei4iN
 BLXLn1HZKDc+7FqQgdRjVdDKpAyVQQ9+PTINLVHVG9k9fmlpcDeJ4uNjZ1PVbf+ObqOKbJUwCIs
 8ZuaGLlBPWzS6t9oMYg==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=TGuEv08zWsqiZ48y0AwA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: xMh4nS19_OrNpwqO5WT5vfc94DNvh_oZ
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

From: Matt Coster <matt.coster@imgtec.com>

Add subtests for mmap operations on GEM buffer objects.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/imagination/pvr_gem.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/imagination/pvr_gem.c b/tests/imagination/pvr_gem.c
index 273f4d56f..74bfd4eee 100644
--- a/tests/imagination/pvr_gem.c
+++ b/tests/imagination/pvr_gem.c
@@ -59,6 +59,50 @@ int igt_main()
 		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
 	}
 
+	igt_describe("Test valid buffer object mapping");
+	igt_subtest("mmap-bo-4096")
+	{
+		size_t size = 4096;
+		uint32_t handle = igt_pvr_ioctl_create_bo(fd, &size);
+
+		off_t offset = igt_pvr_ioctl_get_bo_mmap_offset(fd, handle);
+
+		char *mapped = mmap(NULL, size, PROT_WRITE, MAP_SHARED,
+				    fd, offset);
+		igt_assert(mapped != MAP_FAILED);
+
+		/* Test writing to beginning and end of mapped range. */
+		mapped[0] = 0xff;
+		mapped[size - 1] = 0xff;
+
+		munmap(mapped, size);
+		gem_close(fd, handle);
+	}
+
+	igt_describe("Test buffer object mapping with bad handle");
+	igt_subtest("mmap-bo-bad-handle")
+	{
+		struct drm_pvr_ioctl_get_bo_mmap_offset_args arg = {
+			.handle = 0xbad6bad6,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET, &arg, ENOENT);
+	}
+
+	igt_describe("Test buffer object mapping with bad padding");
+	igt_subtest("mmap-bo-bad-padding")
+	{
+		size_t size = 4096;
+		uint32_t handle = igt_pvr_ioctl_create_bo(fd, &size);
+
+		struct drm_pvr_ioctl_get_bo_mmap_offset_args arg = {
+			.handle = handle,
+			._padding_4 = 0xbad6bad6,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET, &arg, EINVAL);
+	}
+
 	igt_fixture()
 	{
 		drm_close_driver(fd);

-- 
2.43.0

