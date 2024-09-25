Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AD4CCF9F4
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 20:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E1F10E161;
	Wed, 25 Sep 2024 20:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="TX0+unmt";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B65A10E161
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 20:46:44 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5TQJ008702;
 Wed, 25 Sep 2024 20:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GISWvxWs3XU6ogTBZ0r8UOHiQj5g4OESCZEpSow15Ac=; b=TX0+unmt//TELGGk
 M1UpaIUa5C3Ih+lGZS6+654T96v9vxooONBFUUlBNyfD30N3K7v4YHkyqj9eLrNi
 C8nSeG+5lJtw4xszjxougEq4NU+mNtBovdudg3ISA9TuoKpnkdoF2/wc/v7IhuO8
 5C7OrIcR+e/TnigPpInTbKbKPUg3l4pXDSTWId8HJcJW3GiATbbSz9LMcCARpG0m
 /5/BgDmQQc5xAl5uz/VCwdZ7MzMVJiPbMniTLmvNqAnQPcVYJfncTHr5txI9oGC8
 BKm79kOADuITXV3pXQ4JLIGU100FTni0MhS9LQ6Cd9lX2r5D2vMu/Sy7IUiiadVv
 /hV5XA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfh5kqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:46:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PKkYv2022179
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 20:46:34 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 13:46:33 -0700
Message-ID: <6e23b2b9-0e1c-4789-8de3-4a17e2a1e0c6@quicinc.com>
Date: Wed, 25 Sep 2024 13:46:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/4] tests/kms_writeback: clear writeback
 properties in teardown path
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
References: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
 <20240925-igt-cwb-v4-1-e516cd1e888e@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240925-igt-cwb-v4-1-e516cd1e888e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nwJ2zUeXJAkzqR28TfSVWEKMsbN171z0
X-Proofpoint-GUID: nwJ2zUeXJAkzqR28TfSVWEKMsbN171z0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250147
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



On 9/25/2024 1:37 PM, Jessica Zhang wrote:
> Drop the WRITEBACK_FB_ID property check and refactor detach_crtc() so
> that it properly clears all writeback-related properties before calling
> a NULL commit.
> 
> The current WRITEBACK_FB_ID check in detach_crtc() will always return 0
> due to the return value being hardcoded to 0 in the framework [1].
> Because of this, detach_crtc() will never call the NULL commit to clean
> up the atomic state.
> 
> Since the NULL commit is failing for cases where the WRITEBACK_FB_ID and
> OUT_FENCE_PTR haven't been cleared by a non-NULL commit, let's
> explicitly clear these properties before calling the NULL commit.
> 
> [1] https://elixir.bootlin.com/linux/v6.10.6/source/drivers/gpu/drm/drm_atomic_uapi.c#L853
> 
> Fixes: 7c3ceb08b ("tests/kms_writeback: Add helper method to detach pipe from output when test finishes")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   tests/kms_writeback.c | 14 +++++---------
>   1 file changed, 5 insertions(+), 9 deletions(-)
> 


This fixes a long pending issue today where kms_writeback does not clear 
the crtc it was using. Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
