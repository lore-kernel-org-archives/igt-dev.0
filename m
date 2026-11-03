Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2DF606A339
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 17:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=okqJlviD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FCF10E191;
	Tue,  3 Nov 2026 17:23:50 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F89810F733
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 17:22:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3F7FCY3204548; Tue, 3 Nov 2026 17:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=0nGEmg1OPM/
 WyOG6YigHJimual1af5j70uYICwtRxgQ=; b=okqJlviDuJ0jqz0WBIRfeqDtas+
 Kub7vqzLS1D+1SM6RZJBZ2Y2vkTQG+RCNP3iPWStTCu+ApDVocM3rr1efDCQRC7e
 78HiMYxnZV9q9MdNP7TWwOQ6pM5oR+pn2kN+C7fVX3GDc9OkBoVygU4E9RoQC26a
 vzVlRlULIv6n1vmL0SRY4/VebXhyZZtjOWhNH2oBIiliTbWuLfHqR0q6b6X/Us2u
 EUllrMG2+gB9mLWSBxsEhHJ/ekkSL0QAtfAiX650AKO6J2kk9KoL7VAKQbxybQmC
 9WtupA7kPCRpkAJcktanhqtK3CsM87MUhxWmc8+KqOAkmp2a5SEwO4t1VzA==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhypgq11-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2026 17:22:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 6A3HDRrV1125502; Tue, 3 Nov 2026 17:13:27 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6A3HDQOb1125497
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 03 Nov 2026 17:13:27 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id E9CF8A25; Tue,  3 Nov 2026 22:43:25 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: robclark@qti.qualcomm.com, akhilpo@qti.qualcomm.com,
 kamil.konieczny@linux.intel.com, spatraya@qti.qualcomm.com,
 Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH i-g-t v2 1/2] tests/msm/msm_bo: Add buffer mapping tests
Date: Tue,  3 Nov 2026 22:43:21 +0530
Message-Id: <20261103171322.2729929-2-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
References: <20261103171322.2729929-1-jvignan@qti.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfXwXncxZ9TRIWT
 OXab2qvhfNbSrX1pWSnKjNpJUI6dyq6auHYOFSJeUJQFvHwJEjZNSNJmAV3Wc1Mm5JGbslUKB4H
 6YOt7jjt9NfFYy8XcCcfjRTMuMlmrdc=
X-Proofpoint-ORIG-GUID: QtoJk59Zqun4ucBVpRrK4VSNQ0UIqN1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2OSBTYWx0ZWRfX5T9c2hx5ivo2
 k37HqQn3xJrEsNeCAyAHKZe3f5DM0whQWOoBEfZeeRhVIjpxWNl1JQ832UNTKZYEDo6Tg1i5rqI
 au6a0LjLd7dZIJfqxXHyNcx2w7DaPt0WOXNfnU/zo+guGt4S9+Pyd963s1cpAYVMAYaqEoy1xlK
 kmF02oRR4/qNMQKGFSwNldcRel1weq/wIdWWKvyuZ+BZgiBevB6ZNjZ2R6j2yrnns8rv2yJIziH
 C8Cu4SHqtWruMWuQ5IDug95P0b36wOEXCBygHmpifTVe4f2ONPvPudfYDwthaLhqpElykpW2Lp6
 QX7jjBuQFXNjH/Jb0qq04H9Y6JZtkGU4W+c3w3LgHjU1H3zy5NVd6ECHywNjDwGDpafGaMl1O4h
 nez9kevo87QqRmWQI/FPLh5hR0uCuOOw09pbZtigyJjoPX7ZwUcsRgo0CgZRbx14Rcuj9zAczeR
 y2YDCpncGWunDMsKcBg==
X-Proofpoint-GUID: QtoJk59Zqun4ucBVpRrK4VSNQ0UIqN1v
X-Authority-Analysis: v=2.4 cv=T94Z3PKQ c=1 sm=1 tr=0 ts=6aea1865 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=bXoCVvWqAAAA:8
 a=PPBLfUiZgeyZ7LlYLf8A:9 a=vOBCDEL6SLE-3mSS:21 a=xWGLF9RxxNN1Vkn1tT4a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030069
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add coverage for MSM buffer object mapping operations.

Exercise cached and write-combine mappings, repeated mappings,
unmap/remap behavior, different buffer sizes, CPU preparation,
mapping alignment, protection flags, large and partial mappings,
and invalid mapping requests.

Verify mapped buffer contents where applicable and check that invalid
mapping operations are rejected as expected.

Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Tested-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
---
 tests/msm/msm_bo.c | 420 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 420 insertions(+)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 906f801ef..67911aee3 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -652,6 +652,426 @@ int igt_main()
 		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOENT);
 	}
 
+	/* Buffer Mapping Tests - Positive Cases */
+	igt_describe("Basic mapping with read/write test");
+	igt_subtest("bo-map-basic") {
+		struct msm_bo *bo;
+		void *map;
+		uint32_t *ptr;
+		const uint32_t test_pattern = 0xDEADBEEF;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map buffer object\n");
+		igt_assert_f(map == bo->map, "Map pointer mismatch\n");
+
+		/* Write test pattern */
+		ptr = (uint32_t *)map;
+		ptr[0] = test_pattern;
+		ptr[1] = test_pattern + 1;
+		ptr[DEFAULT_BUFFER_SIZE / sizeof(uint32_t) - 1] = test_pattern + 2;
+
+		/* Read back and verify */
+		igt_assert_eq_u32(ptr[0], test_pattern);
+		igt_assert_eq_u32(ptr[1], test_pattern + 1);
+		igt_assert_eq_u32(ptr[DEFAULT_BUFFER_SIZE / sizeof(uint32_t) - 1],
+				  test_pattern + 2);
+
+		igt_info("Successfully mapped and verified read/write to BO\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Map cached buffer");
+	igt_subtest("bo-map-cached") {
+		struct msm_bo *bo;
+		void *map;
+		uint32_t *ptr;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_CACHED);
+		igt_assert_f(bo, "Failed to allocate cached buffer object\n");
+
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map cached buffer object\n");
+
+		/* Write and read test */
+		ptr = (uint32_t *)map;
+		for (int i = 0; i < 256; i++)
+			ptr[i] = 0x12340000 + i;
+
+		for (int i = 0; i < 256; i++)
+			igt_assert_eq_u32(ptr[i], 0x12340000 + i);
+
+		igt_info("Successfully mapped and verified cached BO\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Map write-combine buffer");
+	igt_subtest("bo-map-wc") {
+		struct msm_bo *bo;
+		void *map;
+		uint32_t *ptr;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate WC buffer object\n");
+
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map WC buffer object\n");
+
+		/* Write and read test */
+		ptr = (uint32_t *)map;
+		ptr[0] = 0xCAFEBABE;
+		ptr[100] = 0xFEEDFACE;
+
+		igt_assert_eq_u32(ptr[0], 0xCAFEBABE);
+		igt_assert_eq_u32(ptr[100], 0xFEEDFACE);
+
+		igt_info("Successfully mapped and verified WC BO\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Map same buffer twice");
+	igt_subtest("bo-double-map") {
+		struct msm_bo *bo;
+		void *map1, *map2;
+		uint32_t *ptr1, *ptr2;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* First map */
+		map1 = igt_msm_bo_map(bo);
+		igt_assert_f(map1, "First map failed\n");
+
+		/* Second map - should return same pointer */
+		map2 = igt_msm_bo_map(bo);
+		igt_assert_f(map2, "Second map failed\n");
+		igt_assert_f(map1 == map2, "Double map returned different pointers\n");
+
+		/* Verify both pointers work */
+		ptr1 = (uint32_t *)map1;
+		ptr2 = (uint32_t *)map2;
+
+		ptr1[0] = 0x11111111;
+		igt_assert_eq_u32(ptr2[0], 0x11111111);
+
+		ptr2[1] = 0x22222222;
+		igt_assert_eq_u32(ptr1[1], 0x22222222);
+
+		igt_info("Double map returned same pointer as expected\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Unmap and remap buffer");
+	igt_subtest("bo-remap") {
+		struct msm_bo *bo;
+		void *map1, *map2;
+		uint32_t *ptr;
+		const uint32_t test_value = 0xABCDEF01;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* First map and write */
+		map1 = igt_msm_bo_map(bo);
+		igt_assert_f(map1, "First map failed\n");
+
+		ptr = (uint32_t *)map1;
+		ptr[0] = test_value;
+
+		/* Manually unmap */
+		munmap(bo->map, bo->size);
+		bo->map = NULL;
+
+		/* Remap */
+		map2 = igt_msm_bo_map(bo);
+		igt_assert_f(map2, "Remap failed\n");
+
+		/* Verify data persists */
+		ptr = (uint32_t *)map2;
+		igt_assert_eq_u32(ptr[0], test_value);
+
+		igt_info("Successfully remapped BO and verified data persistence\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Map buffer, write data, unmap, remap, verify data persists");
+	igt_subtest("bo-map-write-read-consistency") {
+		struct msm_bo *bo;
+		void *map;
+		uint32_t *ptr;
+		const uint32_t test_data[] = { 0xAABBCCDD, 0x11223344, 0xDEADBEEF, 0xCAFEBABE };
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* First map and write */
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map buffer object\n");
+		ptr = (uint32_t *)map;
+		for (unsigned int i = 0; i < ARRAY_SIZE(test_data); i++)
+			ptr[i] = test_data[i];
+
+		/* Unmap */
+		munmap(bo->map, bo->size);
+		bo->map = NULL;
+
+		/* Remap and verify */
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to remap buffer object\n");
+		ptr = (uint32_t *)map;
+		for (unsigned int i = 0; i < ARRAY_SIZE(test_data); i++)
+			igt_assert_eq_u32(ptr[i], test_data[i]);
+
+		igt_info("Data integrity verified across map/unmap cycles\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Test mapping buffers of various sizes");
+	igt_subtest("bo-map-different-sizes") {
+		struct {
+			size_t size;
+			const char *name;
+		} test_cases[] = {
+			{ 4096, "4KB" },
+			{ 16384, "16KB" },
+			{ 65536, "64KB" },
+			{ 1048576, "1MB" },
+		};
+
+		for (unsigned int i = 0; i < ARRAY_SIZE(test_cases); i++) {
+			struct msm_bo *bo;
+			void *map;
+			uint32_t *ptr;
+			size_t last;
+
+			bo = igt_msm_bo_new(dev, test_cases[i].size, MSM_BO_WC);
+			igt_assert_f(bo, "Failed to allocate %s buffer\n", test_cases[i].name);
+
+			map = igt_msm_bo_map(bo);
+			igt_assert_f(map, "Failed to map %s buffer\n", test_cases[i].name);
+
+			/* Write and verify at start and end */
+			ptr = map;
+			last = test_cases[i].size / sizeof(*ptr) - 1;
+
+			ptr[0] = 0x12345678;
+			ptr[last] = 0x87654321;
+
+			igt_assert_eq_u32(ptr[0], 0x12345678);
+			igt_assert_eq_u32(ptr[last], 0x87654321);
+
+			igt_info("Successfully mapped and verified %s buffer\n",
+				 test_cases[i].name);
+
+			igt_msm_bo_free(bo);
+		}
+	}
+
+	igt_describe("Use DRM_IOCTL_MSM_GEM_CPU_PREP before mapping");
+	igt_subtest("bo-map-after-cpu-prep") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_cpu_prep prep_req = { 0 };
+		void *map;
+		uint32_t *ptr;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* CPU prep with zero timeout */
+		prep_req.handle = bo->handle;
+		prep_req.op = MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NOSYNC;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_CPU_PREP, &prep_req);
+		igt_assert_eq(ret, 0);
+
+		/* Now map and use the buffer */
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map buffer after CPU prep\n");
+
+		ptr = (uint32_t *)map;
+		ptr[0] = 0xABCDEF01;
+		igt_assert_eq_u32(ptr[0], 0xABCDEF01);
+
+		igt_info("Successfully mapped and used buffer after CPU prep\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Try to map using an invalid offset");
+	igt_subtest("bo-map-invalid-offset") {
+		void *map;
+
+		/* Try to map with invalid/bogus offset should fail */
+		map = mmap(0, DEFAULT_BUFFER_SIZE, PROT_READ | PROT_WRITE,
+			   MAP_SHARED, dev->fd, 0xDEADBEEF000);
+		igt_assert_f(map == MAP_FAILED, "Mapping with invalid offset should fail\n");
+
+		igt_info("Correctly rejected mapping with invalid offset\n");
+	}
+
+	igt_describe("Verify mapped addresses are properly aligned");
+	igt_subtest("bo-map-alignment-test") {
+		struct msm_bo *bo;
+		void *map;
+		uintptr_t addr;
+		long page_size = sysconf(_SC_PAGESIZE);
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map buffer object\n");
+
+		addr = (uintptr_t)map;
+		igt_assert_f((addr % page_size) == 0,
+			     "Mapped address 0x%lx is not page-aligned (page size: %ld)\n",
+			     addr, page_size);
+
+		igt_info("Mapped address 0x%lx is properly aligned to page size %ld\n",
+			 addr, page_size);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Test different mmap protection flags");
+	igt_subtest("bo-map-protection-flags") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		void *map_rw, *map_ro;
+		uint32_t *ptr_rw;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* Get offset for manual mapping */
+		req.handle = bo->handle;
+		req.info = MSM_INFO_GET_OFFSET;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+
+		/* Map with read-write */
+		map_rw = mmap(0, bo->size, PROT_READ | PROT_WRITE, MAP_SHARED,
+			      dev->fd, req.value);
+		igt_assert_f(map_rw != MAP_FAILED, "Failed to map buffer with RW\n");
+
+		/* Write some data */
+		ptr_rw = (uint32_t *)map_rw;
+		ptr_rw[0] = 0x12345678;
+
+		/* Map same buffer as read-only */
+		map_ro = mmap(0, bo->size, PROT_READ, MAP_SHARED,
+			      dev->fd, req.value);
+		igt_assert_f(map_ro != MAP_FAILED, "Failed to map buffer with RO\n");
+
+		/* Verify we can read the data through read-only mapping */
+		igt_assert_eq_u32(((uint32_t *)map_ro)[0], 0x12345678);
+
+		igt_info("Successfully tested different protection flags\n");
+
+		munmap(map_rw, bo->size);
+		munmap(map_ro, bo->size);
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Test mapping very large buffers");
+	igt_subtest("bo-map-large-buffer") {
+		struct msm_bo *bo;
+		void *map;
+		uint32_t *ptr;
+		size_t large_size = 64 * 1024 * 1024; /* 64MB */
+
+		bo = igt_msm_bo_new(dev, large_size, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate large buffer (64MB)\n");
+
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map large buffer\n");
+
+		/* Write and verify at various positions */
+		ptr = (uint32_t *)map;
+		ptr[0] = 0xAAAAAAAA;
+		ptr[1024] = 0xBBBBBBBB;
+		ptr[large_size / sizeof(uint32_t) / 2] = 0xCCCCCCCC;
+		ptr[large_size / sizeof(uint32_t) - 1] = 0xDDDDDDDD;
+
+		igt_assert_eq_u32(ptr[0], 0xAAAAAAAA);
+		igt_assert_eq_u32(ptr[1024], 0xBBBBBBBB);
+		igt_assert_eq_u32(ptr[large_size / sizeof(uint32_t) / 2], 0xCCCCCCCC);
+		igt_assert_eq_u32(ptr[large_size / sizeof(uint32_t) - 1], 0xDDDDDDDD);
+
+		igt_info("Successfully mapped and verified 64MB buffer\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Map less than full buffer size (partial mmap is valid)");
+	igt_subtest("bo-partial-map") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		void *map;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* Get the offset for mapping */
+		req.handle = bo->handle;
+		req.info = MSM_INFO_GET_OFFSET;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+
+		/* Try to map less than the full buffer size */
+		map = mmap(0, DEFAULT_BUFFER_SIZE / 2, PROT_READ | PROT_WRITE,
+			   MAP_SHARED, dev->fd, req.value);
+
+		igt_assert_f(map != MAP_FAILED, "Partial map unexpectedly failed\n");
+		igt_info("Partial map succeeded as expected\n");
+
+		munmap(map, DEFAULT_BUFFER_SIZE / 2);
+		igt_msm_bo_free(bo);
+	}
+
+	/* Buffer Mapping Tests - Negative Cases */
+	igt_describe("Map more than buffer size (expects EINVAL)");
+	igt_subtest("bo-overflow-map") {
+		struct msm_bo *bo;
+		struct drm_msm_gem_info req = { 0 };
+		void *map;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		/* Get the offset for mapping */
+		req.handle = bo->handle;
+		req.info = MSM_INFO_GET_OFFSET;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_INFO, &req);
+		igt_assert_eq(ret, 0);
+
+		/*
+		 * Try to map more than the buffer size. The fake offset node backing
+		 * this BO is sized to the full buffer, so a longer length must be
+		 * rejected.
+		 */
+		map = mmap(0, DEFAULT_BUFFER_SIZE * 2, PROT_READ | PROT_WRITE,
+			   MAP_SHARED, dev->fd, req.value);
+
+		igt_assert_f(map == MAP_FAILED, "Overflow map unexpectedly succeeded\n");
+		igt_assert_eq(errno, EINVAL);
+		igt_info("Correctly rejected overflow map with EINVAL\n");
+
+		igt_msm_bo_free(bo);
+	}
+
 	igt_fixture() {
 		igt_msm_dev_close(dev);
 	}
-- 
2.34.1

