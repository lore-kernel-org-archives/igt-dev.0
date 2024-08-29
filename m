Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBA3C7115D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 03:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD4210E333;
	Thu, 29 Aug 2024 03:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Af+qrauK";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF7810E333
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 03:01:42 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SJMNSd010962;
 Thu, 29 Aug 2024 03:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I6g6CL5a5CGUiecLRCW97/U1+Tnt7THW5y3hBBhn8O4=; b=Af+qrauKZObiSjy6
 yDiMT2r81qebxu3FPtedLYQXC2+kgEosMVkiRZitJ5cr9NEUNtz1TkkiNMZmfioA
 BAnh6dei054X6XsfhWEt7R0VRpiFYZMm6xMtU9OHCGbEory7lBcSyRnwDMOrbdLY
 8RUh+l8rMk0BU85zpWtJn6PjuG30Ws49ZZzw8nPTlw9NNyKWF8B1nlvRk4oSuifo
 alVALIJ28bzI0KJljn+w9cAVsKNemKShqCaLsIBWIgEWVP6a3xccayaeL/D3Zol5
 aJU8JiSn6QcU1g/IR11bGY1yBINKke3F+CZIholc9bkyDHSdLIZfbLBIkA7ZhFRN
 mz1mUQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv0ksfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 03:01:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47T31UOr027115
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Aug 2024 03:01:30 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 Aug
 2024 20:01:30 -0700
Message-ID: <5a7c3d47-453e-4f63-80de-670b0a6e8996@quicinc.com>
Date: Wed, 28 Aug 2024 20:01:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] tests/kms_writeback: Add clone mode subtest
To: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Alex Hung <alex.hung@amd.com>, <quic_abhinavk@quicinc.com>,
 <quic_ebharadw@quicinc.com>, <igt-dev@lists.freedesktop.org>, Jessica Zhang
 <jesszhan@quicinc.com>
References: <20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: nWMkt0hQGQ6b1dvAKWrDXS6K7iokGGxy
X-Proofpoint-ORIG-GUID: nWMkt0hQGQ6b1dvAKWrDXS6K7iokGGxy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=623 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290021
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

Please ignore this version -- will send a v2 with the correct author email

On 8/28/2024 7:58 PM, Jessica Zhang wrote:
> Add a subtest that will iterate through all pairs of
> non-writeback and writeback cloned outputs and dump the writeback
> framebuffer for each pair.
> 
> This series includes:
> 
> - Fixes for properly cleaning up the kms_writeback state and forcing a
>    modeset after igt_display_require() to prevent commit failures when
>    the writeback mode is the same as the primary display mode
> - Adjust the duplicate pipe check in igt_display_refresh() to allow for
>    combinations of valid clones
> - Moving the writeback dump to its own subtest
> - Adding a subtest to dump all writeback/non-writeback cloned pairs
> 
> To dump the clone mode buffer, run the following command:
> 
> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
> 	./build/tests/kms_writeback [--run-subtest dump-valid-clones] \
> 	-dc <primary display mode>
> 
> This will output a file named <file name>-encoder<writeback encoder
> id>-encoder<primary display encoder id>
> 
> ---
> Jessica Zhang (5):
>        tests/kms_writeback: clear writeback properties in teardown path
>        lib/igt_kms: Add helper to get encoder index
>        lib/igt_kms: loosen duplicate check in igt_display_refresh
>        tests/kms_writeback: Disable all outputs after igt_display_require()
>        tests/kms_writeback: Add dump for valid clone mode
> 
>   lib/igt_kms.c         | 57 +++++++++++++++++++++++++++++------
>   lib/igt_kms.h         |  2 ++
>   tests/kms_setmode.c   | 14 ++-------
>   tests/kms_writeback.c | 83 +++++++++++++++++++++++++++++++++++++++++++--------
>   4 files changed, 122 insertions(+), 34 deletions(-)
> ---
> base-commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d
> change-id: 20240827-igt-cwb-23fd81d3a7a4
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 
