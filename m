Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D3D606A320
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=IbHaRsuT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CA8C10E2ED;
	Wed, 11 Nov 2026 05:06:10 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF1D10E997
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:38 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AB4tbLW2806102
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=S
 9uMfbpHhy9sRhy/S++XhBr2bwHLGHT/zYUzMYITMIQ=; b=IbHaRsuTgXhyXWWbn
 Xy7srJhz1YihT00yg6kAV7dmAXs1vqdK0u9d3XZZWFvuof8vIUdwXBPBLlmSRtnO
 BHq9y/fhEXp1JmzH+N4eq+SmTddMKS7KGTB0gXgMCnn83eQn5gtZFSCwrLcmn1sN
 kygQLWu7NRS5KF4G+qrBaorWNulXWgRJa59QlEAt7GagA9MwjBRcUp26mhGOjMIA
 my5qf/xQUVzcHO/VbFbKtxeDcvhQeKCIJtsDyVTQH/aZ8wKJQCtdMZuyYc274xXL
 vT765qzhzRsroHtlTuIpaPfkLMWZgXrMoSYvTUgW46Ek05QMwcnLD3QSbrSBpjzF
 vGbGQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hsvxx2xc5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:02:37 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 05:02:35 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Wed, 11 Nov 2026 10:32:23 +0530
Subject: [PATCH i-g-t v3 3/3] lib/igt_pvr: Pass DRM_PVR_BO_PM_FW_PROTECT
 flag for PM MList allocation
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-b4-render_update-v3-3-979dcf01ff43@imgtec.com>
References: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
In-Reply-To: <20261111-b4-render_update-v3-0-979dcf01ff43@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=924;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=r9BgkWrCfbRhgRy3RdE0UovF8W9zYtms04Hk79l69Cc=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq8/bm+8nz01cXZvEbVfeQYy3pKggcQrjCjFS7s
 C4g3t7p/R+JAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavP25gAKCRDQJndZfgLx
 cJPCD/9U/bZ3VcZWbV7RTfCPwQzb6qBzQ7CEo9iGgXh16YbyWHLObs5wUvdEV9mTC7Jj1QHM+Vp
 2ohB9b+CB1ReqsetnsBWjjlFABB4EicChan8if5FsJZIyEOGTVY38sSO1kKHoHjab8ANiWqozqX
 xiaQIYp0YgAW+gJD0Di7KnnRlABi33YQzqq2PkDdhJHq2S/0gT9UyzdQw2oDv/ECR3QdqPLZPrQ
 MJ/d2LkFeZyamr8ewbYaN0hF9JGxrYyzNi9FejsxqDmWQQ/6nBB822KDkZqnIUWRJWuju7Go3/Q
 ah+C3oMjkpdKdYttQMbGdHOJRsHcM6fX10GPJAdTqSEL/9B+3XbTXms/4Yys4uRPvVqxUBIKqO6
 qMFJPIuANEwmLZfOHetoodN5zEsKY+8QT4afHZcWkokBjYCWdA9cfHEdSnadacePWNFQQ1nC0f4
 DR5BhMlE0byCT/492grHjn4V8a2xcojl2+sFD+ii/gNFhLClaXj5BtDNUdbnAFHpiZx1cnT+bls
 Vr19lPsAwdmobJmB48cygT4TbsaPkU61LNA/MsQjzkOtzTSO0NH0yFdA4/lVttI4Pb+tQox46mh
 zwkT9mIsq4rqqnkb0KH/+G1wYjqa/BHIXgBs/qI1j1dPIwWvwBpYoKPT6SVSlzfLxdEW43LEJ6M
 nejpsl7XjH0cmzA==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX0FjbtF5DjAYl
 UVR6XwQKzIRV76W2N2qobpkDUsZItp039TJDlvt/+yZOM0JlsiFV8Bzg+N1E2QQEaqSkoBF5wAe
 tiHFac6C3N/oAiyIO8eSoAt5+ySszcM=
X-Proofpoint-ORIG-GUID: CC5jdlagBfS0xy_Kib5VKsIqETeamuB3
X-Authority-Analysis: v=2.4 cv=H+JOUOYi c=1 sm=1 tr=0 ts=6af3f6ed cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=orU94MdlTBgBgQKew8cA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX6bTQs52SwzhX
 Dq12uJCHGCthSkxB8FgTdxWwFLSe3y+QZ1GL0L6DKETJo1bQlDnF18c5cmKVKqGp6hn6K3g8iwu
 0I5OwgMBwXazT38OatoarRqeKWc2ceyXptiIgiliVrM3zCA0BjrmxHx9Jsmegmc9WBmMWRDmNWU
 6dTGq8XtEvs+qud8MvcHBYyjfl7jnGCghPoeh73PX0+89MFHyK9o/g6Wx/XmK5hcPAwHIcwpGZ2
 NN+fEMYDp9+koFmmT0BLrN7r7EM9b+JvYh1AXGlanouBMx7hrZxsHQMA13gR6KrAV/3/hVaTcpz
 8MEc8It7Sjn6TBCjjLNyA2at85D4jyrnSJb9DoAD8UtbTi/AzDCFAMzaGmbZuWPCHonrNNEIJqz
 BfxyLWRoNg0GUlreA8q77ayxXqnMQuc2kuk6W0wyaUQ0FhzWUH2oQh3LgU+ue2FfPlInmF6MTzc
 yBo39ABl8qOm68M294A==
X-Proofpoint-GUID: CC5jdlagBfS0xy_Kib5VKsIqETeamuB3
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

Pass DRM_PVR_BO_PM_FW_PROTECT flag for PM MList allocation to indicate
only PM/FW allowed to access the memory.

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 lib/igt_pvr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 9e88b2e41..36846d7d6 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -842,7 +842,8 @@ static void igt_pvr_create_hwrt_rt_data_args(int fd, uint32_t vm_ctx,
 {
 	rt_data_args->pm_mlist_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
-							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));
+							      DRM_PVR_BO_BYPASS_DEVICE_CACHE |
+							      DRM_PVR_BO_PM_FW_PROTECT));
 	rt_data_args->macrotile_array_dev_addr =
 		igt_pvr_get_gpu_addr(igt_pvr_allocate_general(fd, vm_ctx, POWERVR_GPU_PAGE_SIZE,
 							      DRM_PVR_BO_BYPASS_DEVICE_CACHE));

-- 
2.43.0

