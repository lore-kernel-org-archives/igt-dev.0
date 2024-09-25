Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4688CCF9F6
	for <igt-dev@archiver.kernel.org>; Wed, 25 Sep 2024 21:10:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9247910EA6A;
	Wed, 25 Sep 2024 21:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="f1e3ifEW";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3104B10EA6A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Sep 2024 21:10:13 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48PH5I1M012484;
 Wed, 25 Sep 2024 21:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 IB3W1KplqAXZ4tECzjSf9q2L5ZBaGWZ2r15bju6Ddc8=; b=f1e3ifEW0DOmAXhy
 reiRc1yIAcKZyXz/nGPEhTM7mhuvbxHbWRl7LXKzawOvT7dvNH83x4V5biIPOjFx
 8CGuXGo7W/Uq7sas3Fm8pQ763QdRs18Z3WMjh1IR8Y7n2CJ1GlpzixBUIYe/p5mB
 q7hwutwe+os1ZH3tf4/ceMlvHlKLFZPqwLv+idIn8El9rLB1Xa+CvMRV0ZkQjz/A
 MzB6fEMElBvqILREtmZ3NJZZvWI+ChgTtjGHyrF+DJ/kVI+FIovZRP0a40Q2PmB1
 Zc3HW0Wunm/GcE2skOWI7/HnJ9ZmFOh4B8MvR3J65UXdcEwBm0YY87BZ1TF4Ek9Y
 FGE3RA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41skgndwmr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 21:10:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48PLA1Eh006662
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 25 Sep 2024 21:10:01 GMT
Received: from [10.134.71.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 25 Sep
 2024 14:10:00 -0700
Message-ID: <be7bb479-bce5-4ce9-9e62-30ef4ba0c631@quicinc.com>
Date: Wed, 25 Sep 2024 14:10:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/4] lib/igt_kms: Add helper to get encoder index
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Petri Latvala
 <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>, "Esha
 Bharadwaj" <quic_ebharadw@quicinc.com>
References: <20240925-igt-cwb-v4-0-e516cd1e888e@quicinc.com>
 <20240925-igt-cwb-v4-2-e516cd1e888e@quicinc.com>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240925-igt-cwb-v4-2-e516cd1e888e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: H0t6sT96qBQQE4bOAcDKGWEy3nB3D3iu
X-Proofpoint-GUID: H0t6sT96qBQQE4bOAcDKGWEy3nB3D3iu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxlogscore=738 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 spamscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409250151
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
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Move the get_encoder_idx() helper within the kms_setmode test to
> lib/igt_kms
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   lib/igt_kms.c       | 15 +++++++++++++++
>   lib/igt_kms.h       |  1 +
>   tests/kms_setmode.c | 14 ++------------
>   3 files changed, 18 insertions(+), 12 deletions(-)
> 

Change LGTM, but will ack this once comments on (3) are addressed.
