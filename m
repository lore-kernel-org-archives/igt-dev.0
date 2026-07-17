Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEBE1C44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:20:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EA410F4C6;
	Fri, 17 Jul 2026 09:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Rye/wccm";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAF4D10F4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:18:52 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7I4pS2913452
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=x
 fX1b7XFlX9ivlao4k61NGZD4Cpfl0tT4OiAdSTZMWo=; b=Rye/wccmSgHuXr76W
 zN/X1JYpmRwZ5JCLf7lJegOillpc10/Gnd0l6rrxxVdvi2C64H4qFFiijUUrCyPo
 ZCroD1JSrZlA2mmyoD8Br/mRBUYFaCbGRPvUYNjzcaDxd9LAhQoVFQH/J9o1H/x3
 WR7/+jhNBBcEOI9Rk6ovTDKL94aQyRt/96rLixDCMUTDuGrx1O57ZIf9o87fnQN2
 G4FBJHPogjc7TZRy7ieofYa32OoVMnPLOvJYw6Bi9kmYacKdzX5IhCv15nXSc7kL
 BHxGi8k1YT2Zr8t1JYh+O5FAA0Dye54t1gKwUgfaOVtqKTvH/dqfqa75F9hLC0pS
 fIyow==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnk0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:51 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:18:50 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 11:18:15 +0200
Subject: [PATCH i-g-t v2 02/10] tests/imagination: Add GEM mmap tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v2-2-e1bf415adcee@imgtec.com>
References: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784279928; l=1832;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=Xe/Hh6ZCWAOcaQaupRy7GfHMUqrVptFz2/Xqdg0erAA=;
 b=NULgmF2UM9aGNdrn4rz2+keoRQpiP7b9gfwtkf/9s+51F9TiJQw4rcGPbCEbtKAhCz4eM+TVE
 r14KLo0kxTsAcftyQp3CRU4FXwC2T6GZDFzLT0xhwwt5W3FDH6sY7za
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX9EwUqDnHEMGx
 d7BfPFfTMbjSajYK2PAGtTy7+P8m1XmlDN4ReLpkTbrtTkf4cqfKFGAPIRzZaW8eUAw+tYstz5p
 LU82SdFS4E6YcMxZDgW3uVL6HOTjO+R2K/NlE+aySWbaY4BCaXm2atPwYbu4Gi3erJILG984n0T
 yGBx8poBi/SlEiryxmf795+nuGocBxsK9gw7/zGTjesbOrPjKcDmKAzvyHiRGjP61TBE3meC8zb
 ujTs0qBn0upDRqKjmpOedZeL7nWaowHcD+vmKxD58hug7mpAx2vG14DrZkkhRFalFxpdBfeG+3f
 5RwnVdIccrIKXrWTii33ji79l1ihRq1uZ5v21+3iQqdXFc1+vZbTOON9/lZysjnYvMboikXseRT
 y5VSme6oGW2jbdZQRKT+jiaEvJxbX5yClV8gMKJBsFAVTbGyUcRe4/xpLQRj3nQFQDHtFCVsreF
 HeI9bUo/letSovKtIUw==
X-Proofpoint-ORIG-GUID: K2gJ-4hjA6nNllzLA3d51Q2g6VUm6BH_
X-Proofpoint-GUID: K2gJ-4hjA6nNllzLA3d51Q2g6VUm6BH_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX4rcwgHH+swS8
 DY/MFzeMioI2csGR7WaotKMKI5bTgv7+mJyEEAImQQWxQGJRzomld/6jtNx4rPNthJ0uQFNz9Gj
 85fURhmbKeluNvylnZVL8Yrtq28Q1v0=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59f37b cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=L8LdILqEO6YnCbYE5soA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
---
 tests/imagination/pvr_gem.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/imagination/pvr_gem.c b/tests/imagination/pvr_gem.c
index b80d202a2..fec98a1f2 100644
--- a/tests/imagination/pvr_gem.c
+++ b/tests/imagination/pvr_gem.c
@@ -60,6 +60,50 @@ int igt_main()
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
 		close(fd);

-- 
2.43.0

