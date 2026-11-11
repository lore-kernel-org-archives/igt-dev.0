Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37307606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 11 Nov 2026 05:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=dXKHoJPq
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C236510E17D;
	Wed, 11 Nov 2026 05:33:55 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FC710E2FD
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:03 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AB59RHh2831445
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=B
 HfclGkc15rODaGPKJb6RK8CZ/YBNFNhjh4PL9/Yig0=; b=dXKHoJPqFfsQxivOP
 lVmr+FU4D13VOwS+UVaZ1mWubpIyLdf0DTb+TGUhooRfNovZrWLCP/kdmmc8tyCr
 5xlyBYKrF8zB42roERH/2yRtzW4LYgel86V7rFJ4J/VYFP1PjlX2uDzHoTuTeFDf
 tgjxrzgg2UghKP+AUiu++LzVqtIGsthZk/+9fj+YA7EK3gJarvD4elIHhYR0vP30
 ltKjYxAqVYsIF2LvBSkBQtld5Pftu1jpDGDWMmuBrSJ2FKwhNZg368a32Su2u622
 l8TLwzASXQgsg8xneljRFhdG4Xmi1TtZd5f79903kYdOmjYawU8oWah4pB9+5jmc
 O/Uow==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hsvxx2xtn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Nov 2026 05:32:02 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 11 Nov
 2026 05:32:00 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Wed, 11 Nov 2026 11:01:51 +0530
Subject: [PATCH i-g-t v2 2/2] drm_uapi/imagination: Sync with drm-next
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261111-b4-fw_info-v2-2-4d771dde5775@imgtec.com>
References: <20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com>
In-Reply-To: <20261111-b4-fw_info-v2-0-4d771dde5775@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1480;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=EOFKeqxj6fOQJhF+EHKcz2/LtsCNahIe3WQqHFi+qlY=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq8/3NlUCku8A/QbOHXRWtXN0t+dkutAZiiyb+w
 1RqnoeloVGJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavP9zQAKCRDQJndZfgLx
 cOBjEAC/ySc/pgd3yfhN+7wTe4fZmrbqgoDJlELRAWjb2criLX6GvJ+iRor52WJcdHRQJ83Q0gN
 sqJERS3IjmxPQtMCPxQLdNmHLgia3S/vZwV3YVx9keedPIri0FlThyqK3kQJRB9lW2e045de8eX
 C9DLBqJ3WYumYsBOLF+XHyicnx35ffXBdZgy5nj9rig5qOJKKKK/vpPKwd7v3KY1VhTCKD97o55
 QnKtp3Lz1qNrhJs/3Nw8r0eOC/CxKMNNspyFyGypmVexakEUY9EyE5yXh3mrVKLXiY77BRXxzJP
 EMyL0x/0pxBlj2NImS0zM1++eXYaW+pzNlSzqXkNMAkDvyvBRuT1wkMcDSeXUBvu77aNDRhiGff
 009mK10LCqYViVPlPN3h/K1qzoAUUn1h9Pu9UOYIaItQj6tPLMsw7f4PeK5HK3ldXWDnDIkcz/+
 DrBX+YL4Kwww4o8xKLF6xLikR9qWDTrUmebl2ag1VECdTvp1FvlE5OBvah+ZbqvMc/JcvxCMXAv
 u7M6seksrB5LRGYS7KtsOjkPw+ahABti7XCnAshADrdYqCWUIKlOPFI851u87Y2J8gINosJbQly
 cQzTQbxberDDGU9uZSw2WcvGzbL3g3+hZAps6iV3J/Gicph8ANFFt/fBvfAXQBO8Z5lqf7s29R7
 ncBjH4hezbcRIvw==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyMSBTYWx0ZWRfXwnc+aof7B3sL
 vG2yU97b+UCOuCgThlfjcuqDecDXwCmZcJUvpqreIpfxyD18YxkZubK7fHcLeHsusJSxUVXgZIG
 /SMX9yIiiIajucI8oNG+9GaNAyZmk4M=
X-Proofpoint-ORIG-GUID: lb6s_Ssbcmtg0Q79i35tlgCICRNgj3g6
X-Authority-Analysis: v=2.4 cv=H+JOUOYi c=1 sm=1 tr=0 ts=6af3fdd2 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=j-_oiZHTh8UKO97drnMA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyMSBTYWx0ZWRfX/nPDPexEJUTf
 +xV5Md1URVZN27WiQVID1EVmOrc3j+L327Y2rbNg0tHQsB8NZlHSF1bfE9kJkpIiW0wpOkgcPJs
 VJPT2DfJgmellPToOyPNLP0r15KGBsHvNsNya9v4kDk/W0BBGqiCHKSFvAMMqtTfgbIf3hUMOq1
 ym1BPutJioTIWwZTg/TnpyzZdrdmThWvC2KanHr4sSdyOfIOlG32S6OIXdVaLKThu+mbxA0hZFd
 5i/H0kXGuV6dtvwGT/9X8oaoZWBXVzcEXNVWTsoxpiXw1e3POoz3nztDw9RX2b/qauY7Wc8lUvi
 3ylyflIkWp2/d5Jimqy/CzYRMplQDQh9pa1TBoN9pidpu40Zu8lbViCIbSz+tX8iu44HDvFy9A6
 fObKlxg2p21uyDN5j5A4mwvbB9WNo233f9/Y7FelvpZqvii9lR2VpMLHT+Y+GQLWAvoXHZz58L5
 WOS8gf/+NL/nY39lf6g==
X-Proofpoint-GUID: lb6s_Ssbcmtg0Q79i35tlgCICRNgj3g6
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

Sync imagination drm-uapi header with
drm-next commit ("de30740dccd882b8177f260e7d8e26ad60f7c677")

Signed-off-by: Brajesh Gupta <brajesh.gupta@imgtec.com>
---
 include/drm-uapi/pvr_drm.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm-uapi/pvr_drm.h b/include/drm-uapi/pvr_drm.h
index ccf6c2112..1179c1e7d 100644
--- a/include/drm-uapi/pvr_drm.h
+++ b/include/drm-uapi/pvr_drm.h
@@ -434,6 +434,21 @@ struct drm_pvr_dev_query_static_data_areas {
 	struct drm_pvr_obj_array static_data_areas;
 };
 
+/**
+ * struct drm_pvr_dev_query_fw_info - Container used to fetch information
+ * about the GPU Firmware like its version.
+ */
+struct drm_pvr_dev_query_fw_info {
+	/** @major_version: Major version of the Firmware. */
+	__u16 major_version;
+
+	/** @minor_version: Minor version of the Firmware. */
+	__u16 minor_version;
+
+	/** @_padding_4: Reserved. This field must be zeroed. */
+	__u32 _padding_4;
+};
+
 /**
  * enum drm_pvr_dev_query - For use with &drm_pvr_ioctl_dev_query_args.type to
  * indicate the type of the receiving container.
@@ -476,6 +491,12 @@ enum drm_pvr_dev_query {
 	 * a pointer to &struct drm_pvr_dev_query_static_data_areas.
 	 */
 	DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+
+	/**
+	 * @DRM_PVR_DEV_QUERY_FW_INFO_GET: The dev query args contain
+	 * a pointer to &struct drm_pvr_dev_query_fw_info.
+	 */
+	DRM_PVR_DEV_QUERY_FW_INFO_GET,
 };
 
 /**

-- 
2.43.0

