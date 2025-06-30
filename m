Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80DBC8302D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A588A10E4A8;
	Mon, 30 Jun 2025 18:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XJkE7tew";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A19B10E4A8
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFB3Sf008172
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=IJWy2YzEJyY
 s9EZMMf+CwoyQREsppkk7QGGbGrM/qFc=; b=XJkE7tewXXRhXyHfiZGAANv3t4J
 nadCBC5F5QDRXMcV29Ye0Vvxc2sTsiAwJfl0l/kFPGdjcd/FbZT6RQywEHVj3jHK
 FIt/98/j81qsf9p74xmtv5aaUNxZGvbK8vKiOhfNVGBJMha9ajknn3PJMR5G5G5z
 FHrEaK2YwI16e48YrIdu3pTwDnStMax7Y7ehl1/P/Um2J+4rcZjfmEAqs8eL/83w
 rtKKd3x8s3gjXWNl3oK5+LhaR7KuKP+oTF0ZV9ZnDvuERXXgCCGnoteaszz4o/1Y
 HouTmZ0BGgjR/wqfUg/nLud53unck7cpVLt3KY8QOpolXHb973rOi1OryTA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmte17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-235089528a0so46051505ad.1
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306977; x=1751911777;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IJWy2YzEJyYs9EZMMf+CwoyQREsppkk7QGGbGrM/qFc=;
 b=Agv5RdrU32JQPqMVa91tKdfDApNXdmBkSuIFnsigUkaCvSgpadReuvonPhy2y0FVav
 hCOfL/gV95SpNA0+LmSeRErihCtPaDPbqGtAKUaGYKSNDTcMrjymGOvluAoyy1d5ua1l
 k4wp6tCR3V1kgS96Tgv93xhba1T37mKe72BL7Zxc+ZbTZhziMLtQjLJzS9TVfDnpib5m
 ThznVrGVhdx9/3D768I15Rese0r8yjbyrqBKvlRGzkhpezlIxHK6/7mZtOyviBEGUyzX
 g1XL8fYvF5ynIRBl61putFZSnHawMVxa+Zj3mhhvyCrTiVG8zMRut+h/BLW+GqR04or/
 WGDA==
X-Gm-Message-State: AOJu0Yxi8QTGGQzcyG2xjuBEZ80s0rA834dhcecaHWMeI9DQblXHrdFl
 DP60SjD6breYHEvM0/jsEBsXYkEwUqAP/wWy8vvNK7IpoxGIgUyj8gQsgZZ/+OB2J6bZs8skTqa
 1teufaB/DStQfB/NdUlBdEM/JO2vK2FEPQgVZNvdVs0KMZCIoO2C+hI3pd/itiZv2v2hM1D+LKu
 iA
X-Gm-Gg: ASbGncuJR1PXaG7Dq0WKRPaxfUgOhHPwxNVJ1A2LMfKOgXOeEjXLQABlyFzV/VDdEJq
 DFJZl4Vjz9MkG7uCRCVSxJtrIgWkFp78k/b13uCm2Go5gnolCL+LfpR6DBVTwOyajfYmaZefQLr
 ncngtzQ8IqTe8X3cxMzFq1gt/FOUhqoubS1nPg9Ek8cDSAeXwfjlTHs/WPnCXpBlL1qj1ap1mMU
 b1KBCED+C0BNYziN2c+SyGC+PP+hF5jqUthoho/W+6JZu0JrmbYg+NCuDSigjKpQxxbU535A4aG
 9YQA9fCvHTCdZyDxkfVzUYgxd2uUnfEyxw==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id
 d9443c01a7336-23b35545a17mr7446105ad.26.1751306976891; 
 Mon, 30 Jun 2025 11:09:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ+Qty+kDBWOA1YlE9PCYg9YlN5CgMFJljWFv1gfYcNh/SM7Zo85y3IlX9e/eOEDwLKBfETA==
X-Received: by 2002:a17:903:1745:b0:236:10b1:50cb with SMTP id
 d9443c01a7336-23b35545a17mr7445875ad.26.1751306976502; 
 Mon, 30 Jun 2025 11:09:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39b9fdsm91560265ad.108.2025.06.30.11.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:35 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 3/9] msm/mapping: update for sparse
Date: Mon, 30 Jun 2025 11:08:57 -0700
Message-ID: <20250630180903.77990-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0QK4zaIso2VHvOetqi4oess3DeUoDaMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfX2gXeqwi7ea9G
 fYvcWkbpSoIUveZmCALq3n9WmjTxQkl4JDmKKH9XlHdGTDl/C9z30LP5qUANW3MrV+J6iuoJ6Vo
 bm2B8TpOnAYsqMT4lVGm6o6c6cTiQ8+D6yW2SbKsiqPAImXKpc7+Hyb6B6Uge01FNRFTT4CLR+A
 abobYZwgtdwh/7dJ6BHL6oV7B8vvfATRvGXv6kOGbsftbrlKN8gbdYWF23O3wgShDh8uQxcqkGF
 kL7GpZh/aJoGKV1uz5mOqTZvAFhvnjYx7k4ObQNtdMdHdY8JPsWr4jxuGMM/0puCKgzfM+qToPa
 bOj7a9dyHQWSreRqYcCf2iskpb0/6rjGnLdNPvq7MUdluSulUybGOLF2aKpiq2d31qHtGVKwvpF
 ySVYsRy86ef+OefCbhb1eVzIGY4xOk6DvY05gGleu/bqwWltsg3ux3boralKL4SW8F4G0zQJ
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6862d2e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8 a=Gj4tO84-8EQ2_5EzKZ0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0QK4zaIso2VHvOetqi4oess3DeUoDaMy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=883
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300147
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

From: Rob Clark <robdclark@chromium.org>

The debugfs format changes a bit.  Update the igt test to handle both
cases.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index ac20ca91d613..f536db82aba2 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -148,6 +148,10 @@ get_bo_addr(int drm_fd, const char *name)
 
 			ret = sscanf(line, "      vmas: [gpu: aspace=%"PRIx64", %"PRIx64",mapped,inuse=1]",
 					&dummy, &addr);
+			if (ret != 2) {
+				ret = sscanf(line, "      vmas: [gpu: vm=%"PRIx64", %"PRIx64", mapped]",
+						&dummy, &addr);
+			}
 			igt_fail_on(ret != 2);
 
 			return addr;
-- 
2.50.0

