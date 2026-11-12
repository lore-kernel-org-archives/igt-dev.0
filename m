Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46573606A33D
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 06:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imgtec.com header.i=@imgtec.com header.a=rsa-sha256 header.s=dk201812 header.b=pO51gGza
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4CC610E522;
	Thu, 12 Nov 2026 06:26:36 +0000 (UTC)
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C58110EA42
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:12 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.12/8.18.1.12) with ESMTP id
 6AC5ZuvB1302569
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=z
 KFAA8EM58h9leB30Ytitoe7NZy4J6nyXIDx+JIYMnI=; b=pO51gGza4oMyUeebp
 TnIo95JVgxVbT2c/LB4NRpLZ2VxlXvMgycY5v+8vlV9+BeZnJmAScJEeOq3h0JWw
 v+WkgXq6AfGXr7VjBdqjS4nHu0FgDxUmwsSeW7mfp+Rjb7nxnSDkcAgfj2LoeYkh
 BhzkWZTy3taTh1oF5rdYfKd/GYngin7ycs8a0pEgm1em4Eo0BeEOf3E3SndCQaYc
 /c/5alxu8QjdSN8f1vaHWWlpvh8pjun66C6YBrgY7XAF/KNlUG75f0rKo7FHw+zD
 r12GLoVc97mTzbm5MpH69yM/fKkXBHeYqz++77aVT2/SG+XKDX2ox5UcK7ch3k4d
 rfZCQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4hw484g45h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT
 key_exchange=secp384r1)
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 06:24:10 +0000 (GMT)
Received: from [127.0.1.1] (172.25.128.158) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Thu, 12 Nov
 2026 06:24:09 +0000
From: Brajesh Gupta <brajesh.gupta@imgtec.com>
Date: Thu, 12 Nov 2026 11:53:50 +0530
Subject: [PATCH i-g-t v3 1/2] drm_uapi/imagination: Sync with drm-next
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261112-b4-fw_info-v3-1-70d20bd7bc28@imgtec.com>
References: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
In-Reply-To: <20261112-b4-fw_info-v3-0-70d20bd7bc28@imgtec.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=brajesh.gupta@imgtec.com; h=from:subject:message-id;
 bh=6w+DdD6kaieX6jwknBYGHJbFJ2Zp4MV+//0zZo0av0A=;
 b=owEBbQKS/ZANAwAKAdAmd1l+AvFwAcsmYgBq9VuE2bY/Dm8at+LeJCPCD9c2pRzmTyGu+qK2L
 0BYwOm0/OiJAjMEAAEKAB0WIQSQIkZAwD1cxcAsz3LQJndZfgLxcAUCavVbhAAKCRDQJndZfgLx
 cLSiD/9mdU0rgb7vCM7Ce6cwex4NHjCRNfEoavLPwBBp2FTODCZTYPD9UboR8UQ0honyoUvuJDg
 4vVPEGyYGOXeDx3TMiOIzf9CY+ROUiVablPHEPl/22q086nEmbbQ2vkgC9K5WP5Eip+pKHIUfpz
 zCsaxdettMu9ayMciXKSUZAWU2Lzhq61biM1wu8nieg59jQ9YHdOUnzChNhnFcYwR8J1lO0eF+K
 A0tuBtElHpe1SvNS0afVlcgbCrC/I+cp5Zl7uA5U5zUa1KmkZt4L3L+gtJyK5lY3sUr1xbLM2h6
 HN/CPFWVnqSEMZaR4cdFIKYP3C3+RCiAxmDLKFzv82GA7dJkJCZxDZRZVn/lfGccxBHib77enHK
 853sNfR9wVnzcjpVC4AE5iPn/JArP/KdDioHqLBFtWjlroEdxEHDxJUPMUhRoNSviohzls0Dmro
 KgDupOaHSWhWkHkD6gTJST3shqSOCxCceEVf/8jcdlJ64ZUb16tCOq9Wqu9Om0Izb5svp5zTDdw
 qjMcr2IIuPOhVxu2uOnLDsrj1whBTR7Cc6JqQ2ReoRM1N9bKOBRV9c8fLDdpCijqFQGFUt6dmwn
 T8k7xBU6247VTp5Ouy3dI8iPIu8Tz5u0CUyectFacxtRdenQdC4IchxR/gXsSy/l4hQ9FmLNpYg
 kQh1aby6HsYhlNA==
X-Developer-Key: i=brajesh.gupta@imgtec.com; a=openpgp;
 fpr=05BAA300FD5C580EFD3F8D2F073292BAD0D39671
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfXw7YQB99zNM9n
 z3sgftkA/VlRK56edhgcXGUwHbJVJMSdiZ6WPs3iHitk1CWEUVN2G7KgjT0T3c9QFNtKrhfC/gf
 tMLGQoDjkpq7nOrvasb9U7Mrs2YUKsT2+BSjGVslo0daxB8RIJiljVHwqGXc6RTKGzX+qU+gwMh
 GDWWWZkMrUnrglEFc5erFAjk5qOspgLZJGfBnX3pvRt2F///vIFIDZp4qJhykAgADo/sa3QrB5f
 7WE00+AE67zmuY9X8GfPVFHKk3zPt6wDZBW90/q+8AxrvuWelXFasbGUeRenyPTgizUV6SEbh5d
 1sOiJ5GGe8sWrQxMffy7+qjRPRMYV1Pwj7S0Tw6+ZwKuhOcGOcAYv4yx6WB4EGJ1zgbBNcnelkp
 tfqExDAHgzjoT9Tqesz+/fWArv76GPl+CZQL5uxw89BL3lQB0GjHnXzmLa73RqDr4+6AU9ppnvj
 RI0/fjelCalQdW5Oqhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyNSBTYWx0ZWRfX2ICvJ8Gwryjz
 x7kJRB/PwbmVsn22dfbzJklIubNmzhFYWNtMo0oNpsLbbXUKUjB1s3z0k43gpGYGbfhbe+I2g6W
 bBnNFGDsgC6xsy5CP+M9JdqFZXH65wM=
X-Proofpoint-ORIG-GUID: WmFs2G1zAWpeV_-XM4h0M90KZvL3QSHP
X-Proofpoint-GUID: WmFs2G1zAWpeV_-XM4h0M90KZvL3QSHP
X-Authority-Analysis: v=2.4 cv=LP/z05W9 c=1 sm=1 tr=0 ts=6af55b8a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=x1VBDH5lXswA:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=Owaha31PLAKAO9AjCKgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

Sync imagination drm-uapi header with drm-next
commit de30740dccd8 ("drm/imagination: Support
for querying Firmware information").

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

