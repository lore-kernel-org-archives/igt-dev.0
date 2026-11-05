Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30431606A329
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=AOlthvhc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D9510E147;
	Thu,  5 Nov 2026 15:43:06 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAD010E147
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 15:42:04 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A5EQNKR4087401
 for <igt-dev@lists.freedesktop.org>; Thu, 5 Nov 2026 15:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=Aq79+nImZWV/uC4kd/ZwtcC
 tL9OV6JVRNq1/+AcFK14=; b=AOlthvhcgk6GkorNwy7mc8wEGiWlPeJmn2a/h9N
 yzIzC55Z4yMmmEm6ygYTd/gkf/xFQ4wrPtb+hYL3csjt5j0LAmUovmsg5GKW+AXV
 DIs1Gh4Jo2dPmzSeT8Hj6JaxyHlpQNJVZEHzBv6yjwyA9z4PNa96fPgZUMvuB91c
 JwWDeG1Jqg5q3z+UkuP1JJlXVqFy50tSCVIPJXLKD/Ku7Xa2BkWbubR0zHhhrmyb
 77f5J0hx+IEc2FATmm/+4rr2m8UR+7umF3Na2db3jOjjdq4aOGxtmIRZDs5fp0KE
 Yx9kWCqoKL+FaZu+M/aZyKyE+xCGgYmsBzxYfROrtyxjgJg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hn99wmfh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Thu, 05 Nov 2026 15:42:02 +0000 (GMT)
Received: from [127.0.1.1] (172.25.6.177) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 5 Nov
 2026 15:41:56 +0000
From: Luigi Santivetti <luigi.santivetti@imgtec.com>
Date: Thu, 5 Nov 2026 15:41:22 +0000
Subject: [PATCH i-g-t] tests/imagination: add more heap info and static
 areas query tests
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261105-b4-heap-static-area-info-get-v1-1-8d5aa15a5e30@imgtec.com>
X-B4-Tracking: v=1; b=H4sIAKGj7GoC/yXMMQ7DIAwAwK9EnmsJUGDoV6oOhprEHUiEaRUpy
 t9L0vGW20G5Civchx0qf0VlKR32NkCaqUyM8uoGZ1yw1niMI85MK2qjJgmpMqGUvODEDWN0xvs
 wmpAd9GKtnGW7+sfzb/3EN6d2nnAcP3T3XSmAAAAA
X-Change-ID: 20261105-b4-heap-static-area-info-get-bb20556406f2
To: <igt-dev@lists.freedesktop.org>
CC: <alessio.belle@imgtec.com>, <brajesh.gupta@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793893316; l=22714;
 i=luigi.santivetti@imgtec.com; s=20261105; h=from:subject:message-id;
 bh=zrkUhaYbmQYJk5XSkxPKIyUzC6djm6TC6SY6FXtk5QU=;
 b=YZSVrr6GrYjAJ+9xBgegfOHB/ta/N59DG9kfP0Uib9I43Rr/OFlkf5O+1TECeBLQycpikJ29P
 ROfhPb+xAXHA99FwA6Nl0YwMRGZD2E4yXLiCsnUuoqgCOKeElyDxh9d
X-Developer-Key: i=luigi.santivetti@imgtec.com; a=ed25519;
 pk=sMsTKDNJBkwKmfYlaKvcp7AS6G2k9adXmXxmK4dwtNg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX5xzpJr1Xe5EW
 s3fP8nfCKZJKxS7gvrjGZAso+8W8eCKb2Wy+Hr1mvSLsxHVY2m2a5cXWVZuVHw/l5iKkKjlLymx
 DAsRsrC0DwEWlfXogQiW4xDg/4IOuKsExx3SrNmEfLcLctlO+6Iypa7ZWWvI35JnWNN14Qgc/Hn
 Vpo6Z1nSgVP4uw/xnXUHD8lpLTZtaay/nQWA9ATbL3O9alX0fSyoC+WMyyaHdBtinyhPxcXCeh5
 6NkW0xkFSu5EjO90rsLuUD578yT5GUayoP7jFY11OSb6MLzD1eHCIoxrQ/m795GUZOPAinux71P
 XxADakTNbuPxhB9+RkiOyuIqRCXBwhHkGQtEcs7I1w5AvYCvYhcD2OwiQ/993xv0VVBF6AQFI/4
 jfWXPnhadvZMss2JteJ/FJxAHDmx+GWJnRKU9whyZ1kj2rjjaHRc7F/o5Tw7xTJl065rZjm+iJy
 mHlVgzNj6xc8MtNweKw==
X-Proofpoint-ORIG-GUID: rj4W86IyJ0boLnVhpX1daE80OzmJKBOP
X-Proofpoint-GUID: rj4W86IyJ0boLnVhpX1daE80OzmJKBOP
X-Authority-Analysis: v=2.4 cv=BZlNQbt2 c=1 sm=1 tr=0 ts=6aeca3ca cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=2JH569OHYJkA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=ILvtnK42Qjb62hDhzoMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA2MiBTYWx0ZWRfX3XINJTxxk43H
 sc6dsbRegAW/S5P6U15O+7y5AmKbLjudLXHFPjj3Ryq8tq2jq0OfcF1pzev+qVgJ203595dgyzi
 7a1ErZhiaDOWyFCP7+iUA5EeCdaKLR8=
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

Test the following combination of properties:

  P01. Make 1 ioctl call to query either heaps or static data
  P02. Make 2 ioctl calls to query either heaps or static data
  P03. UMD(stride) > KMD(stride)
  P04. UMD(count) > KMD(count)
  P05. UMD(count) < KMD(count)
  P06. count is zero
  P07. stride is too small
  P08. retrieve the legacy value of KMD(stride)
  P09. retrieve the legacy value of KMD(count)
  P10. retrieve the value of KMD(stride)
  P11. retrieve the value of KMD(count), where count is:
       - for heaps, defined in the UAPI as DRM_PVR_HEAP_COUNT
       - for static data areas, only known to the kernel
  P12. count is UMD(DRM_PVR_HEAP_COUNT)

DRM_PVR_DEV_QUERY_HEAP_INFO_GET:

       |P01|P02|P03|P04|P05|P06|P07|P08|P09|P10|P11|P12|
   T1  |  X|   |   |   |   |  X|   |   |   |   |   |   |
   T2  |  X|   |   |   |   |   |  X|   |   |   |   |   |
   T3  |  X|   |   |   |   |   |   |   |   |   |   |  X|
   T4  |  X|   |   |   |   |   |   |  X|  X|   |   |   |
   T5  |   |  X|   |   |   |   |   |   |   |  X|  X|   |
   T6  |   |  X|   |   |   |   |   |  X|  X|   |   |   |
   T7  |   |  X|   |   |  X|   |   |   |   |   |   |   |
   T8  |   |  X|   |  X|   |   |   |   |   |   |   |   |
   T9  |   |  X|  X|   |   |   |   |   |   |   |   |   |

DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET:

       |P01|P02|P03|P04|P05|P06|P07|P08|P09|P10|P11|P12|
   T1  |  X|   |   |   |   |  X|   |   |   |   |   |   |
   T2  |  X|   |   |   |   |   |  X|   |   |   |   |   |
   T3  | -------------------- N/A -------------------- |
   T4  |  X|   |   |   |   |   |   |  X|  X|   |   |   |
   T5  |   |  X|   |   |   |   |   |   |   |  X|  X|   |
   T6  |   |  X|   |   |   |   |   |  X|  X|   |   |   |
   T7  |   |  X|   |   |  X|   |   |   |   |   |   |   |
   T8  |   |  X|   |  X|   |   |   |   |   |   |   |   |
   T9  |   |  X|  X|   |   |   |   |   |   |   |   |   |

Signed-off-by: Luigi Santivetti <luigi.santivetti@imgtec.com>
---
This patch depends on one kernel series that is not yet merged:

  https://lore.kernel.org/all/20261104-ioctl-query-count-stride-fixes-v1-0-2bf86dd7cf29@imgtec.com/
---
 tests/imagination/pvr_heap_info.c | 585 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 585 insertions(+)

diff --git a/tests/imagination/pvr_heap_info.c b/tests/imagination/pvr_heap_info.c
index fa8591a97..e2547cbd8 100644
--- a/tests/imagination/pvr_heap_info.c
+++ b/tests/imagination/pvr_heap_info.c
@@ -28,6 +28,10 @@ int igt_main()
 		fd = drm_open_driver(DRIVER_POWERVR);
 	}
 
+	/***********************************************************************
+	   DRM_PVR_DEV_QUERY_HEAP_INFO_GET
+	 ***********************************************************************/
+
 	igt_describe("Test getting the size of an array from the kernel");
 	igt_subtest("heap-info-get-size")
 	{
@@ -123,6 +127,309 @@ int igt_main()
 		free(heaps);
 	}
 
+/* Value of stride and count as defined in the first released version of the UAPI. */
+#define LEGACY_STRIDE (offsetof(struct drm_pvr_heap, page_size_log2) + sizeof(heaps->page_size_log2))
+#define LEGACY_COUNT (DRM_PVR_HEAP_TRANSFER_FRAG + 1)
+
+	igt_describe("Query, with one ioctl call, zero DRM PVR heaps");
+	igt_subtest("heap-info-get-1-count-zero")
+	{
+		struct drm_pvr_heap heaps = { 0 };
+		struct drm_pvr_dev_query_heap_info query = {
+			.heaps = DRM_PVR_OBJ_ARRAY(0, &heaps),
+		};
+
+		igt_assert(!query.heaps.count &&
+			   query.heaps.stride &&
+			   query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count ||
+			    query.heaps.stride != sizeof(heaps) ||
+			    query.heaps.array != (uintptr_t)&heaps);
+	}
+
+	igt_describe("Query, with one ioctl call, one heap using an invalid stride");
+	igt_subtest("heap-info-get-1-stride-too-small")
+	{
+		struct drm_pvr_heap heaps = { 0 };
+		struct drm_pvr_dev_query_heap_info query = {
+			.heaps = DRM_PVR_OBJ_ARRAY(1, &heaps),
+		};
+
+		query.heaps.stride = 1;
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride &&
+			   query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, EINVAL);
+	}
+
+	igt_describe("Query, with one ioctl call, all heaps known to userspace");
+	igt_subtest("heap-info-get-1")
+	{
+		struct drm_pvr_heap heaps[DRM_PVR_HEAP_COUNT] = { 0 };
+		struct drm_pvr_dev_query_heap_info query = {
+			.heaps = DRM_PVR_OBJ_ARRAY(ARRAY_SIZE(heaps), heaps),
+		};
+
+		igt_assert(DRM_PVR_HEAP_COUNT == ARRAY_SIZE(heaps));
+		igt_assert(query.heaps.count == DRM_PVR_HEAP_COUNT &&
+			   query.heaps.stride == sizeof(*heaps) &&
+			   query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count > DRM_PVR_HEAP_COUNT ||
+			    query.heaps.stride != sizeof(*heaps) ||
+			    query.heaps.array != (uintptr_t)heaps);
+	}
+
+	igt_describe("Query, with one ioctl call, the legacy value of stride and count");
+	igt_subtest("heap-info-get-1-legacy")
+	{
+		struct drm_pvr_dev_query_heap_info query = { 0 };
+		struct drm_pvr_heap *heaps = NULL;
+
+		igt_assert(!query.heaps.count &&
+			   !query.heaps.stride &&
+			   !query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count != LEGACY_COUNT ||
+			    query.heaps.stride != LEGACY_STRIDE ||
+			    query.heaps.array);
+	}
+
+	igt_describe("Query, with two ioctl calls, all heaps known to the kernel");
+	igt_subtest("heap-info-get-2")
+	{
+		struct drm_pvr_dev_query_heap_info query = {
+			.heaps = { .stride = ~0U, .count = ~0U, },
+		};
+		uint32_t ioctl1_count = ~0U, ioctl1_stride = ~0U;
+		struct drm_pvr_heap *heaps = NULL;
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride &&
+			   !query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count == ~0U ||
+			    query.heaps.stride == ~0U ||
+			    query.heaps.array);
+
+		ioctl1_stride = query.heaps.stride;
+		ioctl1_count = query.heaps.count;
+
+		heaps = calloc(ioctl1_count, ioctl1_stride);
+		igt_fail_on(!heaps);
+
+		query.heaps = (struct drm_pvr_obj_array)
+			DRM_PVR_OBJ_ARRAY(query.heaps.count, heaps);
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride &&
+			   query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count != ioctl1_count ||
+			    query.heaps.stride != ioctl1_stride ||
+			    query.heaps.array != (uintptr_t)heaps);
+
+		free(heaps);
+	}
+
+	igt_describe("Query, with two ioctl calls, the legacy value of stride and count");
+	igt_subtest("heap-info-get-2-legacy")
+	{
+		struct drm_pvr_dev_query_heap_info query = { 0 };
+		struct drm_pvr_heap *heaps = NULL;
+
+		igt_assert(!query.heaps.count &&
+			   !query.heaps.stride &&
+			   !query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count != LEGACY_COUNT ||
+			    query.heaps.stride != LEGACY_STRIDE ||
+			    query.heaps.array);
+
+		heaps = calloc(query.heaps.count, sizeof(*heaps));
+		igt_fail_on(!heaps);
+
+		query.heaps = (struct drm_pvr_obj_array)
+			DRM_PVR_OBJ_ARRAY(query.heaps.count, heaps);
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride &&
+			   query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count != LEGACY_COUNT ||
+			    query.heaps.stride != LEGACY_STRIDE ||
+			    query.heaps.array != (uintptr_t)heaps);
+
+		free(heaps);
+	}
+
+	igt_describe("Query, with two ioctl calls, heaps where UMD(count) < KMD(count)");
+	igt_subtest("heap-info-get-2-count-umd-lt-kmd")
+	{
+		struct drm_pvr_dev_query_heap_info query = {
+			.heaps = { .stride = ~0U, .count = ~0U, },
+		};
+		uint32_t umd_count, kmd_count;
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride &&
+			   !query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count == ~0U ||
+			    query.heaps.stride == ~0U ||
+			    query.heaps.array);
+
+		kmd_count = query.heaps.count;
+		umd_count = kmd_count - 1;
+
+		igt_assert(kmd_count && umd_count < kmd_count);
+
+		for (uint32_t count = umd_count; count; count--) {
+			struct drm_pvr_heap *heaps = calloc(count, sizeof(*heaps));
+			query = (struct drm_pvr_dev_query_heap_info){
+				.heaps = DRM_PVR_OBJ_ARRAY(count, heaps),
+			};
+
+			igt_assert(query.heaps.count < kmd_count &&
+				   query.heaps.stride &&
+				   query.heaps.array);
+
+			igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+						sizeof(query), &query, 0);
+
+			igt_fail_on(query.heaps.count != count ||
+				    query.heaps.stride != sizeof(*heaps) ||
+				    query.heaps.array != (uintptr_t)heaps);
+
+			free(heaps);
+		}
+	}
+
+	igt_describe("Query, with two ioctl calls, heaps where UMD(count) > KMD(count)");
+	igt_subtest("heap-info-get-2-count-umd-gt-kmd")
+	{
+		struct drm_pvr_dev_query_heap_info query = {
+			.heaps = { .stride = ~0U, .count = ~0U, },
+		};
+		uint32_t umd_count, kmd_count;
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride &&
+			   !query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count == ~0U ||
+			    query.heaps.stride == ~0U ||
+			    query.heaps.array);
+
+		kmd_count = query.heaps.count;
+		umd_count = kmd_count * 2;
+
+		igt_assert(kmd_count && umd_count > kmd_count);
+
+		for (uint32_t count = umd_count; count > kmd_count; count--) {
+			struct drm_pvr_heap *heaps = calloc(count, sizeof(*heaps));
+			query = (struct drm_pvr_dev_query_heap_info){
+				.heaps = DRM_PVR_OBJ_ARRAY(count, heaps),
+			};
+
+			igt_assert(query.heaps.count > kmd_count &&
+				   query.heaps.stride &&
+				   query.heaps.array);
+
+			igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+						sizeof(query), &query, 0);
+
+			igt_fail_on(query.heaps.count != kmd_count ||
+				    query.heaps.stride != sizeof(*heaps) ||
+				    query.heaps.array != (uintptr_t)heaps);
+
+			free(heaps);
+		}
+	}
+
+	igt_describe("Query, with two ioctl calls, heaps where UMD(stride) > KMD(stride)");
+	igt_subtest("heap-info-get-2-stride-umd-gt-kmd")
+	{
+		struct drm_pvr_dev_query_heap_info query = {
+			.heaps = { .stride = ~0U, .count = ~0U, },
+		};
+		struct drm_pvr_heap heaps = { 0 };
+		uint32_t umd_stride, kmd_stride;
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride &&
+			   !query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count == ~0U ||
+			    query.heaps.stride == ~0U ||
+			    query.heaps.array);
+
+		kmd_stride = query.heaps.stride;
+		umd_stride = ALIGN(kmd_stride + 1, sizeof(uint64_t));
+
+		igt_assert(kmd_stride && umd_stride > kmd_stride);
+
+		query = (struct drm_pvr_dev_query_heap_info){
+			.heaps = {
+				.count = 1,
+				.stride = umd_stride,
+				.array = (uintptr_t)&heaps,
+			},
+		};
+
+		igt_assert(query.heaps.count &&
+			   query.heaps.stride > kmd_stride &&
+			   query.heaps.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.heaps.count != 1 ||
+			    query.heaps.stride != umd_stride ||
+			    query.heaps.array != (uintptr_t)&heaps);
+	}
+
+#undef LEGACY_STRIDE
+#undef LEGACY_COUNT
+
+	/***********************************************************************
+	   DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET
+	 ***********************************************************************/
+
 	igt_describe("Test validity of static data areas");
 	igt_subtest("heap-info-static-data-areas-valid")
 	{
@@ -162,6 +469,284 @@ int igt_main()
 		free(static_data_areas);
 	}
 
+/* Value of stride and count as defined in the first released version of the UAPI. */
+#define LEGACY_STRIDE (offsetof(struct drm_pvr_static_data_area, offset) + sizeof(areas->offset))
+#define LEGACY_COUNT (5U)
+
+	igt_describe("Query, with one ioctl call, zero static areas");
+	igt_subtest("heap-info-static-data-areas-get-1-count-zero")
+	{
+		struct drm_pvr_static_data_area areas = { 0 };
+		struct drm_pvr_dev_query_static_data_areas query = {
+			.static_data_areas = DRM_PVR_OBJ_ARRAY(0, &areas),
+		};
+
+		igt_assert(!query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count ||
+			    query.static_data_areas.stride != sizeof(areas) ||
+			    query.static_data_areas.array != (uintptr_t)&areas);
+	}
+
+	igt_describe("Query, with one ioctl call, one static area using an invalid stride");
+	igt_subtest("heap-info-static-data-areas-get-1-stride-too-small")
+	{
+		struct drm_pvr_static_data_area areas = { 0 };
+		struct drm_pvr_dev_query_static_data_areas query = {
+			.static_data_areas = DRM_PVR_OBJ_ARRAY(1, &areas),
+		};
+
+		query.static_data_areas.stride = 1;
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, EINVAL);
+	}
+
+	igt_describe("Query, with one ioctl call, the legacy value of stride and count");
+	igt_subtest("heap-info-static-data-areas-get-1-legacy")
+	{
+		struct drm_pvr_dev_query_static_data_areas query = { 0 };
+		struct drm_pvr_static_data_area *areas = NULL;
+
+		igt_assert(!query.static_data_areas.count &&
+			   !query.static_data_areas.stride &&
+			   !query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count != LEGACY_COUNT ||
+			    query.static_data_areas.stride != LEGACY_STRIDE ||
+			    query.static_data_areas.array);
+	}
+
+	igt_describe("Query, with two ioctl calls, all static areas known to the kernel");
+	igt_subtest("heap-info-static-data-areas-get-2")
+	{
+		struct drm_pvr_dev_query_static_data_areas query = {
+			.static_data_areas = { .stride = ~0U, .count = ~0U, },
+		};
+		uint32_t ioctl1_count = ~0U, ioctl1_stride = ~0U;
+		struct drm_pvr_static_data_area *areas = NULL;
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   !query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.stride == ~0U ||
+			    query.static_data_areas.count == ~0U ||
+			    query.static_data_areas.array);
+
+		ioctl1_stride = query.static_data_areas.stride;
+		ioctl1_count = query.static_data_areas.count;
+
+		areas = calloc(ioctl1_count, ioctl1_stride);
+		igt_fail_on(!areas);
+
+		query.static_data_areas = (struct drm_pvr_obj_array)
+			DRM_PVR_OBJ_ARRAY(query.static_data_areas.count, areas);
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count != ioctl1_count ||
+			    query.static_data_areas.stride != ioctl1_stride ||
+			    query.static_data_areas.array != (uintptr_t)areas);
+
+		free(areas);
+	}
+
+	igt_describe("Query, with two ioctl calls, the legacy value of stride and count");
+	igt_subtest("heap-info-static-data-areas-get-2-legacy")
+	{
+		struct drm_pvr_dev_query_static_data_areas query = { 0 };
+		struct drm_pvr_static_data_area *areas = NULL;
+
+		igt_assert(!query.static_data_areas.count &&
+			   !query.static_data_areas.stride &&
+			   !query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count != LEGACY_COUNT ||
+			    query.static_data_areas.stride != LEGACY_STRIDE ||
+			    query.static_data_areas.array);
+
+		areas = calloc(query.static_data_areas.count, sizeof(*areas));
+		igt_fail_on(!areas);
+
+		query.static_data_areas = (struct drm_pvr_obj_array)
+			DRM_PVR_OBJ_ARRAY(query.static_data_areas.count, areas);
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count != LEGACY_COUNT ||
+			    query.static_data_areas.stride != LEGACY_STRIDE ||
+			    query.static_data_areas.array != (uintptr_t)areas);
+
+		free(areas);
+	}
+
+	igt_describe("Query, with two ioctl calls, static areas where UMD(count) < KMD(count)");
+	igt_subtest("heap-info-static-data-areas-get-2-count-umd-gt-kmd")
+	{
+		struct drm_pvr_dev_query_static_data_areas query = {
+			.static_data_areas = { .stride = ~0U, .count = ~0U, },
+		};
+		uint32_t umd_count, kmd_count;
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   !query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count == ~0U ||
+			    query.static_data_areas.stride == ~0U ||
+			    query.static_data_areas.array);
+
+		kmd_count = query.static_data_areas.count;
+		umd_count = kmd_count - 1;
+
+		igt_assert(kmd_count && umd_count < kmd_count);
+
+		for (uint32_t count = umd_count; count; count--) {
+			struct drm_pvr_static_data_area *areas = calloc(count, sizeof(*areas));
+			query = (struct drm_pvr_dev_query_static_data_areas){
+				.static_data_areas = DRM_PVR_OBJ_ARRAY(count, areas),
+			};
+
+			igt_assert(query.static_data_areas.count < kmd_count &&
+				   query.static_data_areas.stride &&
+				   query.static_data_areas.array);
+
+			igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+						sizeof(query), &query, 0);
+
+			igt_fail_on(query.static_data_areas.count != count ||
+				    query.static_data_areas.stride != sizeof(*areas) ||
+				    query.static_data_areas.array != (uintptr_t)areas);
+
+			free(areas);
+		}
+	}
+
+	igt_describe("Query, with two ioctl calls, static areas where UMD(count) > KMD(count)");
+	igt_subtest("heap-info-static-data-areas-get-2-count-umd-gt-kmd")
+	{
+		struct drm_pvr_dev_query_static_data_areas query = {
+			.static_data_areas = { .stride = ~0U, .count = ~0U, },
+		};
+		uint32_t umd_count, kmd_count;
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   !query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count == ~0U ||
+			    query.static_data_areas.stride == ~0U ||
+			    query.static_data_areas.array);
+
+		kmd_count = query.static_data_areas.count;
+		umd_count = kmd_count * 2;
+
+		igt_assert(kmd_count && umd_count > kmd_count);
+
+		for (uint32_t count = umd_count; count > kmd_count; count--) {
+			struct drm_pvr_static_data_area *areas = calloc(count, sizeof(*areas));
+			query = (struct drm_pvr_dev_query_static_data_areas){
+				.static_data_areas = DRM_PVR_OBJ_ARRAY(count, areas),
+			};
+
+			igt_assert(query.static_data_areas.count > kmd_count &&
+				   query.static_data_areas.stride &&
+				   query.static_data_areas.array);
+
+			igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+						sizeof(query), &query, 0);
+
+			igt_fail_on(query.static_data_areas.count != kmd_count ||
+				    query.static_data_areas.stride != sizeof(*areas) ||
+				    query.static_data_areas.array != (uintptr_t)areas);
+
+			free(areas);
+		}
+	}
+
+	igt_describe("Query, with two ioctl calls, static areas where UMD(stride) > KMD(stride)");
+	igt_subtest("heap-info-static-data-areas-get-2-stride-umd-gt-kmd")
+	{
+		struct drm_pvr_dev_query_static_data_areas query = {
+			.static_data_areas = { .stride = ~0U, .count = ~0U, },
+		};
+		struct drm_pvr_static_data_area areas = { 0 };
+		uint32_t umd_stride, kmd_stride;
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride &&
+			   !query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count == ~0U ||
+			    query.static_data_areas.stride == ~0U ||
+			    query.static_data_areas.array);
+
+		kmd_stride = query.static_data_areas.stride;
+		umd_stride = ALIGN(kmd_stride + 1, sizeof(uint64_t));
+
+		igt_assert(kmd_stride && umd_stride > kmd_stride);
+
+		query = (struct drm_pvr_dev_query_static_data_areas){
+			.static_data_areas = {
+				.count = 1,
+				.stride = umd_stride,
+				.array = (uintptr_t)&areas,
+			},
+		};
+
+		igt_assert(query.static_data_areas.count &&
+			   query.static_data_areas.stride > kmd_stride &&
+			   query.static_data_areas.array);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+					sizeof(query), &query, 0);
+
+		igt_fail_on(query.static_data_areas.count != 1 ||
+			    query.static_data_areas.stride != umd_stride ||
+			    query.static_data_areas.array != (uintptr_t)&areas);
+	}
+
+#undef LEGACY_STRIDE
+#undef LEGACY_COUNT
+
 	igt_fixture()
 	{
 		drm_close_driver(fd);

---
base-commit: a946c7a2536db43501127e3dc6339e68bd1d6112
change-id: 20261105-b4-heap-static-area-info-get-bb20556406f2

Best regards,
--  
Luigi Santivetti <luigi.santivetti@imgtec.com>

