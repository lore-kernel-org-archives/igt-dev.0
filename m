Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6695C606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 30 Oct 2026 06:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qe2yZfqL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B5B10E535;
	Fri, 30 Oct 2026 06:07:47 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7692310E535
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 06:06:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69U5F6xp725207
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 06:06:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=taGmiwtjtS7IXD63KjaxfweFhabM3pO4etn
 R3UoLlwA=; b=Qe2yZfqLPcrZO/fJHHeQSp8SS9tULIr56P4PHxAIrDXlEJCx/qG
 LIbVX4+D5yzfZnkU+N9fevsoqB/RiptOaB+Fa+X+yMI68Mi45TPkjEYXHNHcnZof
 G9jb0AHzgnnjUeTN9mMP0DkCXoHoJh4iDwL38xUUl2OZkzR3rH1OLhg+dVTkONx4
 2rgDfL8o9K1MT++F6IAHs37sNX6uUXm5p1BKLNzDIOqd9hNyPyORH9zjP/t0wl5l
 Ri99WRzPqYihvuacuKwWp3/WJn4PcUmGrRXQg40hb3wMS9nmitV9rtdINiMzLAP3
 +c6d+HGBorXvZO1isIPrPGDOlLVB1HXPZgQ==
Received: from apblrppmta01.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6phen2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Oct 2026 06:06:43 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
 by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id
 69U66fXT750515; Fri, 30 Oct 2026 06:06:41 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-spatraya-hyd.qualcomm.com
 [10.213.108.244])
 by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 69U66fv8750506
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 30 Oct 2026 06:06:41 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4830552)
 id 3F2DA644; Fri, 30 Oct 2026 11:36:40 +0530 (+0530)
From: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: jvignan@qti.qualcomm.com, robclark@qti.qualcomm.com,
 akhilpo@qti.qualcomm.com, Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
Subject: [PATCH i-g-t] tests/msm/msm_bo: Add memory advice tests
Date: Fri, 30 Oct 2026 11:36:38 +0530
Message-Id: <20261030060638.2849895-1-spatraya@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfXzaB/mpeOghzf
 ZKe+j1svJtzL7PqGVv1ONdtA8Zmbr3VVgJ1Jr8PooReEeBNDa39Fzz6qXTgFXb4Kg4nwrXaax88
 fHYv7R9aQVC4/pc5gZ4qZcMZyYc+PHuw6R/wDUWhjN7kgutu+VPGtYfqlfnhw2BQ6KeWIuHgaGM
 V3GTuCfV1eRf38H7dz+bGsmIpoLpXuPyMSlRzdClja7RV6UBQqqftk6ba1ZY3qPeKWP7bPQEgS7
 b6JArKzPnXl46b12RymS+rpePe32E0sl/xyJoeHsmBmk99CbPNNNhHmZ85mhRG3mIQvYx6rSuX9
 iNv47TkmY/pIZq+TR22qRPqyisMBvk4NBhrgRPftf0hY0HzbSIVjEFDnu01guKws+ExT4LdOUme
 uSN3Gt79+re7hnCPm/h36pwmRN2BsGdCg93KQV8oysCqiGO2rGwkt6+RbPNAm2gIKvngkvHHiZl
 NcZBwXs8A0SrQtSOzvw==
X-Proofpoint-ORIG-GUID: raaK1ww4Px-pqWfq121DvJ2KV1MK3M31
X-Proofpoint-GUID: raaK1ww4Px-pqWfq121DvJ2KV1MK3M31
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae433f4 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=WglK9uJATtDPBe5JlcUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNCBTYWx0ZWRfX7GEHi82V5WUI
 2IHAQkz38E1yooASF0fVaMF7997rY4rpzn70IlwZO1AZlZuR+ycuqVaqFd7RMEK/rWVOaYBL9e2
 FCOoBN4gzupf8TDGtcfVZNtAy2RroUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300024
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

Add positive and negative coverage for MSM buffer object memory advice.

Exercise WILLNEED and DONTNEED advice across write-combine, cached,
mapped, large, and multiple buffer objects, including CPU access
transitions.

Verify invalid handles, invalid advice values, and advice requests
after buffer release are rejected as expected.

Signed-off-by: Sri Vidya Patrayani <spatraya@qti.qualcomm.com>
---
 tests/msm/msm_bo.c | 238 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
index 3257697f5..906f801ef 100644
--- a/tests/msm/msm_bo.c
+++ b/tests/msm/msm_bo.c
@@ -414,6 +414,244 @@ int igt_main()
 		igt_msm_bo_free(bo);
 	}
 
+	/* Memory Advice Tests - Positive Cases */
+	igt_describe("Set WILLNEED advice and verify that the buffer is retained");
+	igt_subtest("bo-madvise-willneed") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.madv = MSM_MADV_WILLNEED;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(req.retained, 1);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Set DONTNEED advice on a buffer object");
+	igt_subtest("bo-madvise-dontneed") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.madv = MSM_MADV_DONTNEED;
+
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+
+		igt_info("Buffer retained status after DONTNEED: %d\n", req.retained);
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Apply WILLNEED and DONTNEED advice to the same buffer");
+	igt_subtest("bo-madvise-multiple-calls") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.madv = MSM_MADV_WILLNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(req.retained, 1);
+
+		req.madv = MSM_MADV_DONTNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+
+		igt_info("Buffer retained status after DONTNEED: %d\n", req.retained);
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Apply DONTNEED advice to a mapped buffer object");
+	igt_subtest("bo-madvise-mapped-buffer") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo;
+		void *map;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map buffer object\n");
+
+		req.handle = bo->handle;
+		req.madv = MSM_MADV_DONTNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+
+		igt_info("Mapped buffer retained status: %d\n", req.retained);
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Apply WILLNEED advice to a cached buffer object");
+	igt_subtest("bo-madvise-cached-buffer") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_CACHED);
+		igt_assert_f(bo, "Failed to allocate cached buffer object\n");
+
+		req.handle = bo->handle;
+		req.madv = MSM_MADV_WILLNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(req.retained, 1);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Apply DONTNEED advice to a large buffer object");
+	igt_subtest("bo-madvise-large-buffer") {
+		struct drm_msm_gem_madvise req = { 0 };
+		const size_t large_size = 64 * 1024 * 1024;
+		struct msm_bo *bo;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, large_size, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate large buffer object\n");
+
+		req.handle = bo->handle;
+		req.madv = MSM_MADV_DONTNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+
+		igt_info("Large buffer retained status: %d\n", req.retained);
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Apply memory advice to multiple buffer objects");
+	igt_subtest("bo-madvise-multiple-buffers") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo1, *bo2;
+		int ret;
+
+		bo1 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		bo2 = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE * 2, MSM_BO_CACHED);
+		igt_assert_f(bo1 && bo2, "Failed to allocate buffer objects\n");
+
+		req.handle = bo1->handle;
+		req.madv = MSM_MADV_WILLNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(req.retained, 1);
+
+		req.handle = bo2->handle;
+		req.madv = MSM_MADV_DONTNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req);
+		igt_assert_eq(ret, 0);
+
+		igt_info("Second buffer retained status: %d\n", req.retained);
+		igt_msm_bo_free(bo1);
+		igt_msm_bo_free(bo2);
+	}
+
+	igt_describe("Apply DONTNEED advice after balanced CPU access");
+	igt_subtest("bo-madvise-after-cpu-prep") {
+		struct drm_msm_gem_cpu_prep prep_req = { 0 };
+		struct drm_msm_gem_cpu_fini fini_req = { 0 };
+		struct drm_msm_gem_madvise madv_req = { 0 };
+		struct msm_bo *bo;
+		uint32_t *ptr;
+		void *map;
+		int ret;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		map = igt_msm_bo_map(bo);
+		igt_assert_f(map, "Failed to map buffer object\n");
+		ptr = map;
+
+		prep_req.handle = bo->handle;
+		prep_req.op = MSM_PREP_READ | MSM_PREP_WRITE | MSM_PREP_NOSYNC;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_CPU_PREP, &prep_req);
+		igt_assert_eq(ret, 0);
+
+		ptr[0] = 0xDEADBEEF;
+
+		fini_req.handle = bo->handle;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_CPU_FINI, &fini_req);
+		igt_assert_eq(ret, 0);
+
+		madv_req.handle = bo->handle;
+		madv_req.madv = MSM_MADV_DONTNEED;
+		ret = igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &madv_req);
+		igt_assert_eq(ret, 0);
+
+		igt_info("Buffer retained status: %d\n", madv_req.retained);
+		igt_msm_bo_free(bo);
+	}
+
+	/* Memory Advice Tests - Negative Cases */
+	igt_describe("Reject memory advice for an invalid buffer handle");
+	igt_subtest("bo-madvise-invalid-bo") {
+		struct drm_msm_gem_madvise req = { 0 };
+
+		req.handle = 0xDEADBEEF;
+		req.madv = MSM_MADV_WILLNEED;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOENT);
+	}
+
+	igt_describe("Reject memory advice for handle zero");
+	igt_subtest("bo-madvise-zero-handle") {
+		struct drm_msm_gem_madvise req = { 0 };
+
+		req.handle = 0;
+		req.madv = MSM_MADV_WILLNEED;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOENT);
+	}
+
+	igt_describe("Reject an invalid memory advice value");
+	igt_subtest("bo-madvise-invalid-advice") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+
+		req.handle = bo->handle;
+		req.madv = 0xDEADBEEF;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, EINVAL);
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Reject memory advice after a buffer has been freed");
+	igt_subtest("bo-madvise-after-free") {
+		struct drm_msm_gem_madvise req = { 0 };
+		struct msm_bo *bo;
+		uint32_t handle;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+		handle = bo->handle;
+
+		igt_msm_bo_free(bo);
+
+		req.handle = handle;
+		req.madv = MSM_MADV_WILLNEED;
+
+		do_ioctl_err(dev->fd, DRM_IOCTL_MSM_GEM_MADVISE, &req, ENOENT);
+	}
+
 	igt_fixture() {
 		igt_msm_dev_close(dev);
 	}
-- 
2.34.1

