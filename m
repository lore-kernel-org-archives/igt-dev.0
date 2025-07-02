Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B71C83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 13:30:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 159F610EA43;
	Fri,  4 Jul 2025 13:30:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BM33QmVa";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416A610E764
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:03:20 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 562EFZKi025382
 for <igt-dev@lists.freedesktop.org>; Wed, 2 Jul 2025 19:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=0/uiwiGylGbdHG4khEzUQ8hS96SResBuOFv
 us9BDibs=; b=BM33QmVaztOEgCmdiz7tuhibFOmZS31wRRdvbnJii1E6LSyjC4m
 daDrp5U12kDNg5ukPWwAaaPpUd72qXhFSPhf7Xn3lKZTrrDJGq9tTrUb0UuAvmT5
 6eBP3i9tGYmU+4Ceky+OE8PhemGaK/EF4Lw+SLXZUI1Hbun+489CjmP6plowQIko
 SzZpA529KcPgnod73DN7zYS7oG3eBxUOPT5tkUD88EWGBlultARIBfF5oPGmqY4g
 GOcsL0mrWZdfA/pn0hDfbUlBEaXPCTRczfWORLvmQUFzrU96qBj31BRZogCXM+7a
 CZskiarmK4vP3q+jgz1cfXxlk03okvesheA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64twj8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 19:03:19 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so5847193a12.3
 for <igt-dev@lists.freedesktop.org>; Wed, 02 Jul 2025 12:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751482998; x=1752087798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0/uiwiGylGbdHG4khEzUQ8hS96SResBuOFvus9BDibs=;
 b=W1C0umahM+c055gWtLIlYR4/eTHEzctiUszljCq6nIQMsOWKnCjcAiFLm/DUEtKnLe
 GRdJzJ4ES6+1wQy2j2+dDMVXySU5c87jRvoAcQWZ5yBmM/s5QGVFsWRK9G+re3wxMNMT
 S6Pg2KxSAqQTcFP+LLngY7EnMaGy+/rEcvpwX9E5RqbxZnQqB9S5P4wvgo+5xyZwq2qO
 BrvXtNOXIs0pQC7ARu1intKIJKwLVh0KiA7ayV1Q+01GsmJPCyeU9wxLeP2kRvYqeGzJ
 E4yutPPCScVqLBr4/2FU5C/7tPcymQs2uDwR+H4JP5VITuhthHh9+1/jN4CFrwBA6WzF
 /HXw==
X-Gm-Message-State: AOJu0YwUJ9dYAUjQQ5w3VZAarrUdFPfs1UWX1iuvpmALW9UArgZc3ikq
 BRbXa4lT0p1ZrX/QHu62aLkONEctmNhUpzb5DSE4YE9FiNY2Vay7CLl0+eTg+SXY6v8xwf6dzvb
 MVkxMqvNAJwXwJzfm4FZF1/X1q75IpKUpncxf2Vh1V3HHhG6klvxHxnw0BNlFEgKBN23Pb2r4ni
 Ny
X-Gm-Gg: ASbGncvJ5/YmMjVYjzJVwBUlm5tZ9KEpIKf/aKQizn8hK79EpxWpWBIwb84/6uEJmMp
 WAeAk8Rk3+bHlfXw0O2ZSUw8cyrW8wfnQzIasOaYDe6CZUthzG/U6gGQ34HYGUykTRJdruNnJGM
 0zBT2V1pFXeIIqvML7XXURghwDHV0VOe9bMMo2uQ5DqbNgFGJkKG6DG/0ZbS16p5uM0h2tDapBa
 H1PL5c26hJGmKO6Pxzm5oKHggokFms2qDCe2OlsVLN/VL62En2UjKzXvVBZUaOkv+eqjEfvFV+y
 M/tVls9ZNH+Szcm4LjhF7ohOkgCwki6TbA==
X-Received: by 2002:a17:903:1a84:b0:234:be9b:539a with SMTP id
 d9443c01a7336-23c6e5b0f24mr55528115ad.40.1751482997967; 
 Wed, 02 Jul 2025 12:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9tsuRLtrQ2uRtOQ0/LPPD9ZdhX4zl87JWXmSBvbvVQUC6Y83LHsDKAMTKR2oEPIpwyo9+tQ==
X-Received: by 2002:a17:903:1a84:b0:234:be9b:539a with SMTP id
 d9443c01a7336-23c6e5b0f24mr55527815ad.40.1751482997550; 
 Wed, 02 Jul 2025 12:03:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3acc00sm131125835ad.142.2025.07.02.12.03.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 12:03:17 -0700 (PDT)
From: Rob Clark <rob.clark@oss.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Rob Clark <rob.clark@oss.qualcomm.com>
Subject: [PATCH i-g-t v2 0/9] msm: recovery and mapping updates
Date: Wed,  2 Jul 2025 12:02:40 -0700
Message-ID: <20250702190249.376313-1-rob.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68658277 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=BuRRKxK7vx0tYKGPvLAA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDE1NiBTYWx0ZWRfX0cywlseCgxZI
 QXuQVB3yKU5zWWuypb8Lu1U4XTiz6LR29P//F2ERRH/YHHKS355jq2ubD12bxO1lIjhm5tw6l/W
 YRkt3Ajf2LQr7Q04wdWHyFHq3Ncrq38ml43vu5dIUbsEFodUN4nwpa6oWePGsyhRqAVJNbfq5va
 lnW2N2jliuq8ydW8SpmIa/gpgXjXeUSI5dc2gfAGmL525d6oY069W/3UHCeuCe9cZRUjWsErWAh
 e4ZURW8wGqWd3fw7KGuDmExY6Vf/94LBTxHRwkJKq7W0CbaJ+fHJ/lRi81M6bpudb4d/ovINI9C
 ni8GI+yUxE+V5lnsi6nNtvcQHqBRD7WOuG/TKuhyh/9GrdOw45rlbnty7zKuDGzl/JFbuGw+mDf
 wFORwcW6Ylh0s31hScjitnoi4orMva2WtSJmvbgoH99gEnc6d1wVCkp6MZC7hufcvJ48wlZn
X-Proofpoint-GUID: Rg1ne6zInqTySBDHVg5bVC9zcPR9jNQo
X-Proofpoint-ORIG-GUID: Rg1ne6zInqTySBDHVg5bVC9zcPR9jNQo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020156
X-Mailman-Approved-At: Fri, 04 Jul 2025 13:30:46 +0000
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

Mostly updates to address flakes, and updates related to newer kernels.
Plus a few additional sub-tests.

Rob Clark (9):
  tests/msm/msm_mapping: Fix memory leak
  tests/msm/msm_recovery: Wait for devcore
  tests/msm/msm_recovery: add iova-fault-stress test
  tests/msm/msm_mapping: update for sparse
  tests/msm/msm_mapping: Handle BO names with spaces
  tests/msm/msm_mapping: Add additional subtests
  tests/msm/msm_mapping: Wait for devcore
  tests/msm/msm_mapping: Handle larger gmem file size
  tests/msm/msm_mapping: Add wait for stall-on-fault to re-arm

 tests/msm/msm_mapping.c  | 93 +++++++++++++++++++++++++++++++++++-----
 tests/msm/msm_recovery.c | 38 +++++++++++-----
 2 files changed, 110 insertions(+), 21 deletions(-)

-- 
2.50.0

