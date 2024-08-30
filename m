Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44DDECA100C
	for <igt-dev@archiver.kernel.org>; Fri, 30 Aug 2024 18:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA2A10EAAD;
	Fri, 30 Aug 2024 18:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="KVRP0mVQ";
	dkim-atps=neutral
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1976A10EAAD
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Aug 2024 18:32:13 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47UHrCqi003943;
 Fri, 30 Aug 2024 18:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hR09yPGqvfl/RVqw2Kjz0plh60R7JJQ8o8kmjLr6to0=; b=KVRP0mVQDTbHJ0ol
 XhvG37jbku5ODTMGw4qSpT8pS2r4lp9dBshJ5ZhUqMFW3Rxa3CCQmq8DZLZUBMn1
 w+zuBfvZvsGWBFgiRHRbv99GnJu+R3SYMpbM9aWEHRPhN7fnwTds0XQBqBNRsaP2
 mcIQCa2GwEfUaEnfpD9lU5m6daqNNNZ5xji/WzbNhy80FhkPREWG7FIsgLILKWIG
 mGQpsV/V+yq33EuQbxfKRBJb7BRcgqb+DS5RWnupfNDp2Sx3oFhiu0RyY9u7H/P8
 z5CJnZPNFY1mgDg1FeastWbTZxboed2GyhPjb7uU+q+hfWKddVvFyEhfmvfn0aYU
 +UGOuw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419px5sqkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 18:32:03 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47UIW32x006224
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Aug 2024 18:32:03 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 30 Aug
 2024 11:32:02 -0700
Message-ID: <77a149a4-ede3-496e-bee6-728f396199d9@quicinc.com>
Date: Fri, 30 Aug 2024 11:32:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] tests/kms_writeback: Add clone mode subtest
To: Alex Hung <alex.hung@amd.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <quic_abhinavk@quicinc.com>, <quic_ebharadw@quicinc.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240828-igt-cwb-v2-0-7b255c730c55@quicinc.com>
 <4c40e28d-a8db-40ec-bde2-0081314a7e8e@amd.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <4c40e28d-a8db-40ec-bde2-0081314a7e8e@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: pVcIIDLxG1THeAhtlYykbHvJClnG7RKM
X-Proofpoint-GUID: pVcIIDLxG1THeAhtlYykbHvJClnG7RKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_10,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408300141
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



On 8/29/2024 1:28 PM, Alex Hung wrote:
> I ran a smoke test and Patch 4 (tests/kms_writeback: Disable all outputs 
> after igt_display_require()) is causing a regression on my test platform:
> 
> 
> Starting subtest: writeback-check-output-XRGB2101010
> (kms_writeback:1973) CRITICAL: Test assertion failure function 
> get_and_wait_out_fence, file ../tests/kms_writeback.c:345:
> (kms_writeback:1973) CRITICAL: Failed assertion: ret == 0
> (kms_writeback:1973) CRITICAL: Last errno: 38, Function not implemented
> (kms_writeback:1973) CRITICAL: sync_fence_wait failed: Timer expired
> Stack trace:
>    #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>    #1 [get_and_wait_out_fence+0x8e]
>    #2 ../tests/kms_writeback.c:401 writeback_sequence()
>    #3 ../tests/kms_writeback.c:424 writeback_check_output()
>    #4 ../tests/kms_writeback.c:782 __igt_unique____real_main557()
>    #5 ../tests/kms_writeback.c:557 main()
>    #6 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>    #7 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>    #8 [_start+0x25]
> Subtest writeback-check-output-XRGB2101010 failed.

Hi Alex,

Thanks for testing and reporting this.

The overall goal of that patch was to force a modeset for cases where 
the primary display mode and the mode being used on writeback were the 
same. If the modes are the same between commits, the DRM framework won't 
perform a modeset on the encoder even if the connectors have been changed.

To get around this, we thought it would be good to disable all the 
outputs and start from a clean state before doing the writeback 
connector setup.

Is there anything in AMD's disable path that could cause the writeback 
connector/encoder to be in a bad state for the next commit?

Thanks,

Jessica Zhang

> 
> 
> 
> On 2024-08-28 21:05, Jessica Zhang wrote:
>> Add a subtest that will iterate through all pairs of
>> non-writeback and writeback cloned outputs and dump the writeback
>> framebuffer for each pair.
>>
>> This series includes:
>>
>> - Fixes for properly cleaning up the kms_writeback state and forcing a
>>    modeset after igt_display_require() to prevent commit failures when
>>    the writeback mode is the same as the primary display mode
>> - Adjust the duplicate pipe check in igt_display_refresh() to allow for
>>    combinations of valid clones
>> - Moving the writeback dump to its own subtest
>> - Adding a subtest to dump all writeback/non-writeback cloned pairs
>>
>> To dump the clone mode buffer, run the following command:
>>
>> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
>>     ./build/tests/kms_writeback [--run-subtest dump-valid-clones] \
>>     -dc <primary display mode>
>>
>> This will output a file named <file name>-encoder<writeback encoder
>> id>-encoder<primary display encoder id>
>>
>> ---
>> Changes in v2:
>> - Corrected author email
>> - Link to v1: 
>> https://lore.kernel.org/r/20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com
>>
>> ---
>> Jessica Zhang (5):
>>        tests/kms_writeback: clear writeback properties in teardown path
>>        lib/igt_kms: Add helper to get encoder index
>>        lib/igt_kms: loosen duplicate check in igt_display_refresh
>>        tests/kms_writeback: Disable all outputs after 
>> igt_display_require()
>>        tests/kms_writeback: Add dump for valid clone mode
>>
>>   lib/igt_kms.c         | 57 +++++++++++++++++++++++++++++------
>>   lib/igt_kms.h         |  2 ++
>>   tests/kms_setmode.c   | 14 ++-------
>>   tests/kms_writeback.c | 83 
>> +++++++++++++++++++++++++++++++++++++++++++--------
>>   4 files changed, 122 insertions(+), 34 deletions(-)
>> ---
>> base-commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d
>> change-id: 20240827-igt-cwb-23fd81d3a7a4
>>
>> Best regards,
