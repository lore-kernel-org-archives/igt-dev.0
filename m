Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8302C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 07:50:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C10D10F486;
	Fri, 17 Jul 2026 07:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ex7rJEFs";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A34310F486
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 07:49:13 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7GWLF2965623
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=b
 5rVuoLOeRPPr23UjVpaXuQEfTzV+bo421stsVlYReU=; b=ex7rJEFs2u7HQnX2L
 G87XKxh6XLEdqdHPjfDVMI3K0GTydAvhOkxi8DqNPMKb9sreYiRHEpeo0F7MKzUF
 Tl+/rxRj7zNhV5aWbLbmzz2fmJMe7V44e3Wx9SYDJt6HP2sP123uH85puLh4MCHl
 vOxvfAT/+pVUG1QNSXsehV1idxXDcn2ThxKqL0MdpT+7xyhcWOD0QD4xHLVli+06
 OxEM3PDV5PeLJzR8ra0YoniY5StrzYj5kzUWagLYRy3NiK4smEc8BtyURD9Gedp1
 lhcvYpKUPy1DXbhY73Fmcr262TUnkJGrokLcRNln9tl2uyw3vgyic/SgjvPz07dG
 1/CGA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7cwrj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:11 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:11 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 09:48:13 +0200
Subject: [PATCH i-g-t 06/10] tests/imagination: Add DEV_QUERY static data
 area tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v1-6-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=3226;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=rU1WyAAlWc21h+z9KNnY6j8GiolzUNoc/p8x29M4X+c=;
 b=O3kk5sE1RVRSY12PVPEoOZrJZnY9hdysnnpHPqpO8XS+az7kIzZGH046+quyTsgjh/xUN1bO9
 mTo2V/pf2oiAnV0LAiXIEjAqdM2lmjJ+L6nVPgned0JB+l4CQ0Sv9Jz
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX+gdgf7HfzB3J
 YAGo1xpOoMc29F8NMAPgo8xrvMIKFTl5rXdFmqTMs5wdFBxuX0YTed0WDeBjbWIrt2sv7AvE/du
 xEvjUW434RE3cBZZ6HbhP5I2srZPEwo=
X-Proofpoint-GUID: 8pHTcg0-rSEmJBqUTTEnFUC_Rpy03_qu
X-Proofpoint-ORIG-GUID: 8pHTcg0-rSEmJBqUTTEnFUC_Rpy03_qu
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a59de77 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=NDabtZqKMSvLAD6k1PcA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX99Emw8ilT50s
 zVc0l5QKCjyTSJNsjBrNoonPmxX3Dx8c+42oOO7UFo2ndQoQ1F79tNKoCsNOFuC884wAgoi0m35
 pfPHH5CvrOwNQofQIwo9Wa5Hzs04mCYUa0kqvdlxXxr6e9L7jNoBWsjB0TXWk/QDdEl+EGj8alV
 IP5bmIR1eI51RHfqZMiPNc/GsdiNZjKzKTYTRo/ubPJ/uL0xXCr8oeBf2rShkIKf4RcApIHoEWF
 54sxn5EGqMer9WhExVvEwavs7MmQJOplT4VkLkVQ2L261LTE92NXVUC5bu7OCXIa1LJ6feIL6uk
 D7N5QyjVJPh8m4OA9uW6yMGFzxGh0/SIexvR3D5Q/g+b0X3ZwlIxGV6O8EBDFcEGIMzP0+oTP3M
 oe5ed0IrOiSVoHkyasYfuoMdcR5n/+gOpNGPmdtKMbwLBBxkMBvzag2g/5/QtyfV2ohhuTaBhPF
 b6WktS1jLBwVPNdJsAw==
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

From: Donald Robson <donald.robson@imgtec.com>

Add subtest validating static data areas returned by DEV_QUERY.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 lib/igt_pvr.c                     | 19 +++++++++++++++++++
 lib/igt_pvr.h                     |  2 ++
 tests/imagination/pvr_heap_info.c | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index a190cd67b..437362dbc 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -94,3 +94,22 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out)
 	return heaps;
 }
 
+struct drm_pvr_static_data_area *
+igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out)
+{
+	struct drm_pvr_static_data_area *sdas =
+		calloc(DRM_PVR_STATIC_DATA_AREA_YUV_CSC + 1, sizeof(*sdas));
+	struct drm_pvr_dev_query_static_data_areas sdas_get = {
+		.static_data_areas =
+			DRM_PVR_OBJ_ARRAY(DRM_PVR_STATIC_DATA_AREA_YUV_CSC + 1,
+					  sdas),
+	};
+
+	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+				sizeof(sdas_get), &sdas_get, 0);
+
+	if (array_len_out)
+		*array_len_out = sdas_get.static_data_areas.count;
+
+	return sdas;
+}
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
index 181a0e843..e7fbdc82f 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -19,5 +19,7 @@ igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
 			void *pointer, int expect_err);
 struct drm_pvr_heap *
 igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
+struct drm_pvr_static_data_area *
+igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out);
 
 #endif /* IGT_PVR_H */
diff --git a/tests/imagination/pvr_heap_info.c b/tests/imagination/pvr_heap_info.c
index b498214d9..590e4ac87 100644
--- a/tests/imagination/pvr_heap_info.c
+++ b/tests/imagination/pvr_heap_info.c
@@ -123,6 +123,45 @@ int igt_main()
 		free(heaps);
 	}
 
+	igt_describe("Test validity of static data areas");
+	igt_subtest("heap-info-static-data-areas-valid")
+	{
+		uint32_t heaps_count = 0;
+		struct drm_pvr_heap *heaps =
+			igt_pvr_get_heap_info(fd, &heaps_count);
+
+		uint32_t sda_count = 0;
+		struct drm_pvr_static_data_area *static_data_areas =
+			igt_pvr_get_static_data_areas(fd, &sda_count);
+
+		igt_assert(heaps);
+		igt_assert(static_data_areas);
+
+		for (uint32_t i = 0; i < sda_count; i++) {
+			const uint64_t start_offset = static_data_areas[i].offset;
+			const uint64_t end_offset =
+				start_offset + static_data_areas[i].size;
+			const struct drm_pvr_heap *const heap =
+				&heaps[static_data_areas[i].location_heap_id];
+
+			igt_assert_lte(static_data_areas[i].area_usage,
+				       DRM_PVR_STATIC_DATA_AREA_YUV_CSC);
+			igt_assert_lt(static_data_areas[i].location_heap_id,
+				      DRM_PVR_HEAP_COUNT);
+
+			if (!static_data_areas[i].size)
+				/* Not present for device. */
+				continue;
+
+			/* Ensure reported range is inside the heap. */
+			igt_assert_lte_u64(start_offset, heap->size);
+			igt_assert_lte_u64(end_offset, heap->size);
+		}
+
+		free(heaps);
+		free(static_data_areas);
+	}
+
 	igt_fixture()
 	{
 		close(fd);

-- 
2.43.0

