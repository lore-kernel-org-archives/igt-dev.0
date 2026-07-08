Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B70AC43458
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jul 2026 16:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E339310F183;
	Wed,  8 Jul 2026 16:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSMWIvQb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCCPoPBj";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9192110F1BB
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jul 2026 16:12:32 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 668G33P73213245
 for <igt-dev@lists.freedesktop.org>; Wed, 8 Jul 2026 16:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Wqs+8YbqkvRcq4HCqQ5wAXXwbA5CZfg1L6a
 bLA9qIwI=; b=RSMWIvQbO6+J+TAgCvvNsWD9T6KV4a1Kjmh2wWl2H7mE60BUa98
 dV9VCgHzjWrBnBdVKdrOxvCFh05kpjNuAqIsBCzAAueIYM13eZ6h/y4To2qE1pqO
 LEKxRBy3RNgsAiZGraxU5T744NLHTrNYhTvModog75SS3YBrEGlx26+qvnWfMKUB
 WDYqmtcpPdKhtbyKQbhV9V/wug9bIEuHRNsED5stj3P+kuF0nYN+piUJMcy97Jj4
 P0twZ2PKvMVi3ixMHuK3HW6WkTwZW2KKXpevISzBYaRsSy3W1JU8GkrxjkSOuVHI
 /CqNQH9K9EoKePqH5m1ju7rfOr3LjBOBT1w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqw81qg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 16:12:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-847a00bcbd0so1142444b3a.0
 for <igt-dev@lists.freedesktop.org>; Wed, 08 Jul 2026 09:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1783527150; x=1784131950;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Wqs+8YbqkvRcq4HCqQ5wAXXwbA5CZfg1L6abLA9qIwI=;
 b=fCCPoPBjLHoBDWJuZENqsvm+X4Q79RjyNWpPQThnzbAi7b0nujT3hHPfoi+omxhxkw
 eCEIm94u1BnPsbMBtyRJ30343UR6DOjmGKo8VX+3eSPOHfa/yc7JkX+2slw9Fqdrp2yg
 efA9rzvEjDLXQL3WVoscypx1X4mcil2clUfhzMprdQAdO8V3TERRYM4m34oAecH37mwC
 sqNLmhwSoTmZ10lKw5iQUSBtU4bsWr5qA20FODHbWeyp9nSyk2BKW0Xjf+Vqra0grJFe
 O6XzWkMT4onbfbQ9YCcemIbNF6PTPM4Uvdlon4KCIaYoSUUYGgklG030X6c5qChI9NcA
 h8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783527150; x=1784131950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Wqs+8YbqkvRcq4HCqQ5wAXXwbA5CZfg1L6abLA9qIwI=;
 b=a+TF4iELoeLq+Yu4a4/pZwJdg5u0JLc/+O/mWe5HpSvl46TNodnqnDH6WCdGMWUfPK
 zHOHw6OsbCMhNNyq1ZU6+0DbcMki5nXT3/wXpmWhkxMu83EnlN/EvtLMsjHuhs93aRM/
 epqbxIgefQscTyf1/RP9XmfWiwGGNz4x/1k78mnAlH7LGpig9o45RWIe5SshMJVkyd9x
 D/tHu/m9LesKsGK0q4ANTmLZ1D6mwdYgWKQACjPg8gdtBWSmKBia7gmcdSzUP+rBC9cE
 kNNBqtgkFPcfsMVqt+A0rJTAqkh+t3ayArhDpqeSWLXlt1+3420fVA/XWKGKF/fafBGU
 Fj5Q==
X-Gm-Message-State: AOJu0YwUHYfhn4mzqyJLWioW4V3Jv2wvfPCDJ6FtZKhsJ1S8j07+Oa9H
 5Qu2C+OMVl+sEPp5VVquMP6W5HZKCGGvPn8U/54+9h5gOeMAI+r3uDxMK9uwre/Oj4PXrO+OzzY
 xFHwZLPtIEsvaav0Xziox5jxavyBBosxKl2UvZhSt7Tn150xQtZk/dCBYzrQUqT+aRRfZrp3Rwr
 rp
X-Gm-Gg: AfdE7ckncmpnoVWUfvRFLxvmRbo+Go55TK/1jKeoVXr1yA8nI1lB7HCJdZ7C8HK/UF8
 KKf4R/VPbK9P9QBGA0LpwWgbxT2EgneEKBRsxQnj+pkguZf3ucg64Viy/MJaPa9Q6HkJpkWkNqI
 2VvtlzZDqhRL6CT9EcQ0K5Xy/AKWvh2p14uOeuL2+1BiyrxnZitAIptoRB7QQF2mBtUNBKFinAF
 XZmCO2Au40LWky6Jh7BTwjzKAegdp1bWN47E6paBznOjoJg51hRvLkoa4LWzbxz6fKR6TkQECNN
 b5Up0TNJtoSdHGLLMbWrAvy5QlDWhwiZLtBVnQDlUtWuO8DGuGUEgrQ7PfoS3k0Wr5+ucNmA0JT
 4SXtPKCHFfdxZORTFY3LYuVgc7kvIz4Fln4Wam0+y+rqfn3br1jL0i4AKaw==
X-Received: by 2002:a05:6a00:18aa:b0:842:57e8:1bdb with SMTP id
 d2e1a72fcca58-84842f2af0cmr3368352b3a.20.1783527150231; 
 Wed, 08 Jul 2026 09:12:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:18aa:b0:842:57e8:1bdb with SMTP id
 d2e1a72fcca58-84842f2af0cmr3368315b3a.20.1783527149663; 
 Wed, 08 Jul 2026 09:12:29 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3a2e420sm2600974a12.29.2026.07.08.09.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 09:12:29 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH v2 0/2] tests/msm: Add PERFCNTR_CONFIG ioctl
Date: Wed,  8 Jul 2026 09:12:22 -0700
Message-ID: <20260708161224.507091-1-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfX4nTWGUlbyXRX
 qMhRImOIcWq46YbP750EmIWrq4sBOuX2loxF8D13LSVOgYjlSqlgYqYixG5rekdh9kROvCWGnAM
 C8B1d9IJMntX9SJM4Z20OjrVgLl8xb4EJMqmPqkZLxPUowWH88jGdXX9gniIXmN+GWKKji9xz9C
 wF0NYaFaljmMiFpgSE02iP9DmMf+piwp8ZhgSoLL0Nj4O+nPKy1x0gnkNyoQLTtwg9RNPCyt1oy
 no4XZeyhTPt9x/1mw/FgA95jqG4lft4jnJD70Du7dVVcpBQtOfsIoDyPXWb9WjNKjn1UU793bHD
 tPq4ts+0qtvF/lcIUQSfoNfMHFt5bpQWpylrT6GTEuH+jdAHzOA5fo53A5weKtWpjPamX5tLCVP
 MGYI8q35OyErOgejKbZOV4idzmIlg0PNgUjlqq4dutV44i79elqfZkTz6sqgLhGol68E4dtLIVr
 I6Vq98BDEM2lBk3C/RQ==
X-Proofpoint-GUID: F-pzJeXDKO7yM_c2lNv0kia7y11mO5xt
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4e76ef cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=ojyeN04l4yA0XdsW6-wA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: F-pzJeXDKO7yM_c2lNv0kia7y11mO5xt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1OCBTYWx0ZWRfXxrFfRM8aK2oz
 QMMtzyy0VZQ6evTUNAq5SBWdwyh/+fzh+yQ6GggM3D3VcIHsVcDhvuE2T6Bdgc+gVv7UNBI3LHV
 hrtpye0Ra4IUwp4PcNNkwpkBkNzUHGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080158
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
 tests/msm/msm_perfcntrs.c  | 196 +++++++++++++++++++++++++++++++++++
 3 files changed, 385 insertions(+), 16 deletions(-)
 create mode 100644 tests/msm/msm_perfcntrs.c

-- 
2.55.0

