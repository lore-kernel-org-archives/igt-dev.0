Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09123C83033
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 18:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A953610E4B7;
	Mon, 30 Jun 2025 18:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="h3bClsUy";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4C010E4B5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFTFnl008301
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=5wlg2bP4UTd
 5crkAsljjdslZD3qUqKVHgYw0X3XIpDo=; b=h3bClsUy2IVYXIngSMg0NsUB1g7
 9p6bGLTz/BF58W7+fotckQgfS8Zq/amgpcB16H/6Hqh3DwHKzrVAehzNY1x3U51w
 eyHBe5mw+5F08y7tuEPdFznq3mPnqSXk4Fjks2cIUR1KBmAWLPXuIb3kVbyEARuR
 /tQmNMUaW4ExG9vwfikcfnb/O6O1ao8+6BIeGPRj8P0hnCGZ9iqZ/1J5egjm4hBH
 nI1S44BBRCp2EqECuqNabiAc3rdjUHEZVfel4sPrZpWUCrY1+XEg0iu6Izss48Gb
 4NHbqRPV43sr205LrXUdoxS2ln/goEc98bgetN/g2mXnazcwaMPhpNdWaTQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kkfmte1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 18:09:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-234f1acc707so17393695ad.3
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 11:09:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751306982; x=1751911782;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wlg2bP4UTd5crkAsljjdslZD3qUqKVHgYw0X3XIpDo=;
 b=FQ91fQe54BoNsw36+isBa/ZMePSAi59+5aA/YjAAkd0k0EBDDfuKpYxyjb43I9A7OA
 TDXwnlX7jgYCGnSZK7rzDUSvRclGXlhUSKILL5mlpCf3YdcnkteoxZHjs/rDeuivUjK8
 ZlM2SA75nmkcHM86reGdzM999oTTovz0Til4FjxswrrfNQDBHJnQhaIzPNtYSBtHvDbT
 rn1+3Kc2i5fLp0QwpICzIQJZ7hQbktngXh0csnLhhJv/sxIpcdBW9no6eQwyu1DKuUFy
 OYTJ7+lpWVymiLt86M82aji6sYc6iKKK5HVYX5aL3KIVgD7zGlXeFfGpNsWAHGQDIKWL
 Ecmw==
X-Gm-Message-State: AOJu0YxUZztdGX5pNvhJ4LKoXNlWhPG7+OLosLQbAekAQJlK+y21YHnW
 hM9DIWbO+xs2LuBsvUMEuH9qrcYWJs7PsHfsU4TQBmHQR1QJ0wUIj0w9Skmv7sH93moWWaIqqyG
 hkq8MR4/VHW1Oq3Ghn95QsJ4KLwtagANFec1pC+9dDVZ1vzQCo0VQNZdV8fyj/P7ntQJn19BvSO
 s/
X-Gm-Gg: ASbGnctAwtQ18fUtecSBqzE8OBN6c+GpiO5srIpGCDTNqvUVYn31ClPTzTmM3SASTY0
 OH7G1+nRpskhKotjp09L+PA3BVmViGkj2V+cTguitW6UaYE/YhAGV9h93s9LR+1GNESETyimOvf
 HjLHzGSLb+3mf0icaDo78jHnPn/R+iGqHAkpQfB8zODfoKyvEEmoeAPWgBz3UrJbumkOJ+TnEB7
 +vMnuIvxQoiAmdO4sMKuMwUUvQhZGtfrjDakPo3a987hTdqbCQhVqSc1tKNGwIwLHacs/S/xs1d
 drW/c1ZlEzynva0q8G1Vzg34s/kd6k83FA==
X-Received: by 2002:a17:902:d2c6:b0:237:d192:ac4a with SMTP id
 d9443c01a7336-23ac4637a94mr195028655ad.51.1751306982358; 
 Mon, 30 Jun 2025 11:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ3AQ5YxttXQ7WbGoYp2DJpMJ69NA0wnJKUJE+75TdfXbr07IuQB365nFkgY6WdnBYUOMXVA==
X-Received: by 2002:a17:902:d2c6:b0:237:d192:ac4a with SMTP id
 d9443c01a7336-23ac4637a94mr195028355ad.51.1751306981954; 
 Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39bf32sm88001485ad.94.2025.06.30.11.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 11:09:41 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH igt 8/9] msm/mapping: Add wait for stall-on-fault to re-arm
Date: Mon, 30 Jun 2025 11:09:02 -0700
Message-ID: <20250630180903.77990-9-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
References: <20250630180903.77990-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: qWtnr0QIV2qaZy5nMu1aorhbqEbH4q_p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDE0NyBTYWx0ZWRfXzXN+7pS2h+sE
 lBorcd6Msi/dRHychfwFsjYevHaBR3PNRpFK/OALaTX2rQvSrHyJvti3OupYS11ePU+Ojhv8gMv
 l5LCroPCGuqabbvyytEx9/rIWjYwh9kd5zKZsc/eDXBzreVGWFga52xNL0pg5JFMIncI8HiZJLb
 6iXnrxrJ/yy+tyDIWpYgecUQb5vJyHJ8W46mj4nfL858ltQ6QCns7NiMFoV3Cz05pKP4ARrmnKy
 0ToRuckrqXg5Xyq0zDnrDfbPaXiBaO1lpwW4OUm+t9fqO88iA/fDce7ar4qzXQ/fStmyNZsDEiO
 ctpC+jLKrWzEGWHRovVMDVobyHG66EJf94Pd0JfF4Bz4ja0dXhkPSmthsAeGwd/wSjAircLWH0U
 NTEfZiKQEerQETq2MyRa6aPKM+1vkI0gyCoJbFU8czj8dInQhH9l3I1kt/z5Y4bEe/UKTZvn
X-Authority-Analysis: v=2.4 cv=L9sdQ/T8 c=1 sm=1 tr=0 ts=6862d2e7 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=ZbXLqgdrMctJ-p1oMuQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: qWtnr0QIV2qaZy5nMu1aorhbqEbH4q_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_04,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
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

From: Rob Clark <rob.clark@oss.qualcomm.com>

Newer kernels disable stall-on-fault for a grace period, to avoid a
flood of faults causing instability with memory translations that
the hw attempts with the translation stalled.  Fortunately it adds a
debugfs file so we can know how long we need to wait for stall-on-
fault to be re-enabled.

Signed-off-by: Rob Clark <rob.clark@oss.qualcomm.com>
---
 tests/msm/msm_mapping.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/msm/msm_mapping.c b/tests/msm/msm_mapping.c
index 978ea18375dd..7e2f5c7eadc8 100644
--- a/tests/msm/msm_mapping.c
+++ b/tests/msm/msm_mapping.c
@@ -74,6 +74,30 @@ get_and_clear_devcore(int timeout_ms)
 	return buf;
 }
 
+static void
+wait_for_stall_on_fault(int drm_fd)
+{
+	char buf[64] = "\0";
+
+	do {
+		int us;
+
+		igt_debugfs_read(drm_fd, "stall_reenable_time_us", buf);
+		if (!strlen(buf)) {
+			/* Not supported on older kernels: */
+			return;
+		}
+
+		us = atoi(buf);
+		if (!us) {
+			/* Done waiting: */
+			return;
+		}
+
+		usleep(us);
+	} while (true);
+}
+
 /*
  * Helper to find named buffer address
  */
@@ -224,6 +248,11 @@ do_mapping_test(struct msm_pipe *pipe, const char *buffername, bool write)
 	ret = sscanf(s, "  - iova=%"PRIx64, &fault_addr);
 	igt_fail_on(ret != 1);
 	igt_fail_on(addr != fault_addr);
+
+	/* Wait for stall-on-fault to re-enable, otherwise the next sub-test
+	 * would not generate a devcore:
+	 */
+	wait_for_stall_on_fault(pipe->dev->fd);
 }
 
 /*
-- 
2.50.0

