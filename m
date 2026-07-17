Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6729DC4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:27:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D09D10E479;
	Fri, 17 Jul 2026 14:27:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="FUoTIqm0";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C5310E462
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:11 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE3dBO3645753
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=J
 psJvBhWN8EBSrvlCKZofZg1ofo0SwbTkX+kS9GK8rU=; b=FUoTIqm0I9Cz1W949
 H3bVDr1Xh1ET2CbPfAblzhkPXmzjH9ck/ulGPu9fzGULfOEu4ebl5SX8JVpeIUh8
 Bl5jsbg2l71tkcMw5z1amEfp/fdzz+tIYDykKWkXJB1B/HKOvDjiScmB6WPtIIjV
 22JF41QsFlURgr0cOHUZt9pKuDAM+/UkZ6FhDAWGahVDQocJqZlG6YO2TQs9qa5V
 vSwYGyBBUNU0go0QtBYN/WYHeQvQZKG/MRKHBE0JBsqv9vOaAV88gbr4EV7Dmt9n
 CwgTS/5Aot+oZh6B7bVVO4UmuAAA1Q3CgEBbdQDUkqx3YVMH0si8OXFxwH4718Q2
 sU5HQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnsyc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:09 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:07 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:34 +0200
Subject: [PATCH i-g-t v3 02/10] tests/imagination: Add GEM mmap tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-2-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=1843;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=+IIOyLUnhkbJGI2knTtO7m0DKIOAAoi9wxjR9bfPRgM=;
 b=6dsA7A4BAFwxjqAx7dAuhY0jsev8jzc8UO3gOVTGQMB3k7Oq7/aK6ATMKTCrKyhjC9kfLFBP1
 L7zL5RMJe/eB36IByL2QGE477Ty/Shh5lnrOXgEuxgrypGQuadl5Qt0
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX/i625zY60I3k
 r2F1rbblSbcSZurNjYTGdfT7EV/mGUKQQiMZqoM/+lmxObK2W9FaTkzgBnLaJQxgZ7in7hDLq8m
 VUtgG23jmYo4Xm+YWxJ396wwId/l3ZC9/W5dfTd7+NyG/NNraBu4sQB+NS4eCXSx3Wg97PG7nw3
 RyJbc5Rt3D5nHWhNR1hWqzW0TjPcIw3yocWvMq2dPW7xdAeLSa1LzXSyO5FuDpca1qMVOkZBjyp
 wUASTGyB6kZA+WBmQ9k6WbqtI6PWcts/UdaytDeQm/RjVivLg62VQdV/lcBeQPjysLEXf2pTciT
 BYmRXxcaaXrohuuwMS64HCYyGteCH+OXf61xyUs4OWT3x5MHajR31TXL8Yes0zIK4KlPcBwr/By
 h+GkxN4MJyOu2rbhwRQsN6ft9ZL6HdbXGLaN4wYYBen/HQHzdT4XQ+I9pnXkRpW2HCjL17b8WsJ
 cEWh41CEowyxOG8EYEA==
X-Proofpoint-ORIG-GUID: 3T7EQzoQuLwfl7CcKmL2EkHQsQQXnd-W
X-Proofpoint-GUID: 3T7EQzoQuLwfl7CcKmL2EkHQsQQXnd-W
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX9vAFTbNdi06e
 3yiaSBuQ1zNyjVXHVmRj8HWxhmskNHBiL5mJxapss9rozcowC7JSbhpEw9X4hO78FO4OMykKX0p
 N5nnBbxG0FCRPBIEbhYzkfXlyEPR6qs=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a5a3a91 cx=c_pps
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

