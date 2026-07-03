Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00D4C43458
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:44:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED2610F82D;
	Fri,  3 Jul 2026 14:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+r853IK";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j58R+ONu";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11AB10E4D9
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:39:58 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 663BcdAt3136093
 for <igt-dev@lists.freedesktop.org>; Fri, 3 Jul 2026 14:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=vRAqoogWwyVUQAkLHoEYtYYykmYYdEn0HCD
 bMZpx47g=; b=T+r853IKAE1AT0rxnuR/trLRXsING8hSeseRu8kl+FzpcCbGh87
 wNQBblf4od8REdHJXqQcXtPD+wZiCjHvMBzKJ++KFu/qj7mv42a3ioV/NPz2uhQo
 0Bb3QtvusTQbi2edjXgAn99tYu5toapufsIb3Nm3asmOeS35mNCt3ciOGZNmp9wH
 NgIonySLXvwwSFLdTh2BEOGoxz38uPC2c410RwJpta09GeKLkpcCL+3siZygh0IH
 JLl2yWRcBtffahhz7z7btuelEdkTe8zPksHoLeEwF2xaYSrRcZ/NnVMm3iuCI6Jh
 9F2N2mRjVZEqkgxTrJH881xPmi6b/k2im2Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b5armw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Jul 2026 14:39:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-847ad67cc51so708593b3a.3
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Jul 2026 07:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783089597; x=1783694397;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vRAqoogWwyVUQAkLHoEYtYYykmYYdEn0HCDbMZpx47g=;
 b=j58R+ONu4j9POzIaKbikqWZzGnSUJWl8kBhiiylHmwB+bZytDWcj1gZuUq0G6GBKNx
 A6fArbW6TeIh3+BFw2SHDoSKW7t70zDMQvbF73z7Je1FflK1SJH6pTJAUlqSNM6tFE2O
 cW/zqRigoE7inHD0UvJ4OXtocizgMGT/cUChBeqPrEe3BGFSAyIH/uPpjUmotN2d/YgO
 q+gJSPyJJGdhqlllcy+xzKAwTJLOtmoJMphF0b8RU+Yosw9anRrgPU8XdAUkwWGcIqIV
 4BO/QCd1N7h9GD+rR2q5t0f4XXduBvw4IzNnCNdnXzZiJVkYAVrJjEnZcC6r+X92vIl7
 OujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089597; x=1783694397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vRAqoogWwyVUQAkLHoEYtYYykmYYdEn0HCDbMZpx47g=;
 b=cQBmb79lNQGiT4QU5kaK/OHYmfFFhM7MBvWIi1XFswWpTWaDGthyxHjC20p49ft23M
 6gU3SNIQ7rN0PDyHzvPpvUAyjnonKiVrQ3ns11Da/PYhTmkKIU33aVVaHmZcpw3IsZla
 qERZTDwNhCpf42FWZIRdnO4RBo26CS5NBNVJ+g/BagpHtb2+908h96zGkw+psXcHCQ7L
 BhjmXQgMkbQnKrl1vUZJdVy1me3MnNdTMpvhn9rC7lSFLm3bw2yH/mVDyWucZJNDgbZV
 CC3ieqe7WQ8zMcPJ1uxdKtknryxFoNc2bYw7CZiOpAToWMaFQHZCsINod+PlB4Pnr1B6
 JYQg==
X-Gm-Message-State: AOJu0YwQs3iDeYeebG5gnHdY1QngORUFU9qFqwklQ5KdNxa63bH33k3Z
 QKDSrrlEYfapseGKCp42bzF99mdQU0ymJ1+LSMP3qrlBCoyCGwHiy7401j7FMFyTek1nFQSSVBL
 IKHD93+oCIzl6S6ntIrgx1eJhBDL4fWHYVuIjlJfn0Dav5XLmYeWeMYJ6jzwMAh1EYZqsYevCmN
 +z
X-Gm-Gg: AfdE7ckVCXzkh7+PlOuqzZw3V1e45tQdVA2HEbimtONEtQnroI0LMDVDwkMhkxIE+n+
 cMQprpv5yRjD6DMv22Q9tczn2xdbT7R2gEJMsSoTNSUfYQGjlPn9VYtA71UiuEaPSBgTdy/M115
 Ymgks70GUrZNpnfXs83LEv827d1R5zBqSmjiglDQnkY4csdpK/bhxEGTPireJo0PZGhGkJyaw6g
 VODYOqS+sBLvtFRGVRv431XeLzDlEGJYZT5NbQZKCImxd7aePQdyFFTTpgvhpu+BYeMYPEyxMCF
 VFYjf0UTt5+5GK4rAvFnQpKg9R/kACloVfLrziD++wjZavSuw33iWjCVZYX3qe5t2+SL5xedJFc
 DWpHAsL8E+Xl56dgxBLhYuT+wumEaF9RmZxM5bVxWPrJUR7uC/7q8whkiCg==
X-Received: by 2002:a05:6a00:951b:b0:847:770f:da4c with SMTP id
 d2e1a72fcca58-847c072cc05mr10666212b3a.16.1783089597297; 
 Fri, 03 Jul 2026 07:39:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:951b:b0:847:770f:da4c with SMTP id
 d2e1a72fcca58-847c072cc05mr10666182b3a.16.1783089596707; 
 Fri, 03 Jul 2026 07:39:56 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847cb77559asm2981542b3a.22.2026.07.03.07.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:39:56 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH 0/2] tests/msm: Add PERFCNTR_CONFIG ioctl
Date: Fri,  3 Jul 2026 07:39:47 -0700
Message-ID: <20260703143949.280272-1-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX/EZpIEeOWwHi
 iIjqWIXg0Z1ZW0jjce1EMipW+Bl/ChDFgTkmFjU/KXjEJD5LPjBUZ6z1s5Eus/Pvy0Ws2TmHsXk
 rxNjuz11DqoT/Wq03fId9VtIdE5JygY=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a47c9be cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ojyeN04l4yA0XdsW6-wA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5Qb-LzeB1hdHarpcLsx-kRA8PArWSjZM
X-Proofpoint-GUID: 5Qb-LzeB1hdHarpcLsx-kRA8PArWSjZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE0NCBTYWx0ZWRfX/B5F174phJOD
 zDMLJ7JCaYd29BG5UHD+dW+14sscE6u3tpPK976rTZ6KcOjow33m6sSxPHhPH1foKh1pLb30NpV
 diOhq8+SyJGyeZYPQ7DyCJe+OzzX8/QlthPEjXutSXBw+7y6xes0rtEm2H3UQS9OIlv8lp/i8Tr
 5Ke/OsozPifH4R87opBJ5g6LibQXgW7VOgNFbbt+vMJLylvPYxHCsqbfsrtWtvRze3JbKzrMUX9
 sipRVObx7WFAs6Dyv1sZC3nUEmz5dkLmtMUz6ZjukPQHjOZNzVgoP56H2VFNqV/lnIaS62eT9Zr
 NAUdMFeImEe7OUOfhYL7/7xyzwt4AMTAcbvFXrQ96Upq4mrGLdKXRtR3inBQdOeM42iiFbouSTz
 UErmUmqGHSMsazEYr72euGi07gptVKlB7on2afmn7Wkez1TRDe6UDE+rDPoDZRvL3KwsJIMKxgL
 yxr1nvtCyuaFA6l6eaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030144
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

Now that the new UABI is merged for v7.2, here are tests.

Rob Clark (2):
  drm-uapi: Sync msm_drm.h
  tests/msm: Add perfcntrs test

 include/drm-uapi/msm_drm.h | 204 ++++++++++++++++++++++++++++++++++---
 tests/msm/meson.build      |   1 +
 tests/msm/msm_perfcntrs.c  | 194 +++++++++++++++++++++++++++++++++++
 3 files changed, 383 insertions(+), 16 deletions(-)
 create mode 100644 tests/msm/msm_perfcntrs.c

-- 
2.54.0

