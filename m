Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58695C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 07:51:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0363F10F489;
	Fri, 17 Jul 2026 07:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="y7bVfSKo";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E71610F485
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 07:49:10 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7A2d52952494
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=x
 fX1b7XFlX9ivlao4k61NGZD4Cpfl0tT4OiAdSTZMWo=; b=y7bVfSKo9HKhLFo5h
 Shi9pjhfBDb6fZqS2BJibU7Gwmrn1XKoaHSsWhQP+eYQYVv0XumnEhmD2JdcHIAN
 hfnxXsqELf36KgYOXBVPG25YHCuhrHyBD8lLpz5lr6xkGjUWavzsmbh9UibpBJv3
 BA6YRr2jYW5f/Cu8dYeG0326U3djuab0IHKgizKKmIBLEMj7fqqbdrNZmQDREHOG
 L96bu5wogLpHV+ZT9X1ojOb1UCri42hE5jGHHsn7bJFJf78S6l1QN5+I0khJmV8F
 ts5aQqNwqzXeoa+kSUKXHEgHyf71v9gn3adN6uJ3GM1/86etlpxRKM/d/54BQEW7
 3aZyw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7cwrh-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:09 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:08 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 09:48:09 +0200
Subject: [PATCH i-g-t 02/10] tests/imagination: Add GEM mmap tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v1-2-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=1832;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=Xe/Hh6ZCWAOcaQaupRy7GfHMUqrVptFz2/Xqdg0erAA=;
 b=BWg/uvOcfof7Nlh36SJGGwNwvh4JJgTn2ZsX4lNePRvAHhHZykO08Xvtd/NKrIUaDd5gAFnBa
 I8A/buqdDbsB5c9FNHuZWvnd1m0gP78f8vDjqJ28AbPy3+hw/zkNze7
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXw/xws17tGweF
 D/fqLeAASsK6rXW49lTdjZJ/LGGLoAXivmWD0tetoXJjiRq1x01oRdihZ2J4w9khjkYg3562jdt
 vZ0CntVKGsHNRmmYPLWFu8qSkBEY+4o=
X-Proofpoint-GUID: zMlPx8KEiJEIj0DOzSIW94vgKNJYiBuv
X-Proofpoint-ORIG-GUID: zMlPx8KEiJEIj0DOzSIW94vgKNJYiBuv
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a59de75 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=L8LdILqEO6YnCbYE5soA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX8LC/EzB71dSu
 0ok+DKXzsLY7sRf7SPnA7xrcrOQjr8VtDedvQ09EH5Izr1FNsaDRoj+hgpieoK+Gr2glwQXAd9c
 gImyiiBB2N5tsaA9YOwGqyVUiPZmUs+VI4jB5cBXhspG5/NmATFDvvU9jXdQbwDiD++0q58Xf/X
 XlXUj752+t9OMSyF/XbGTuQyA18MypFi5p7T5031kPzWI7/cwEiNfgV1mBMYc9dJK64St242tnY
 dFiuAWiRaU0rJmzQsjwduJ+fCeAMecEtbrlVJQLwtVWPN3jeyy4SLvTedZcV442shBKVJRoicQz
 WXgHAcnH21K+TrdZkyUbqK1UVqgAIpLDz+8FZCaI3HDn5rwGGGgGYvrIixlDsmhqGZXrhsS53EF
 eR81BJDjNraHBVAnts1FxODMM2tghSeI0HP6lk/8jK9rpWL6Qv9W6maf//LVRi4CF74DbWqQ5Cw
 9Vut3t91lJTZKlL/7dw==
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

