Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EB6E6FE4B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Sep 2024 22:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F6010EB0F;
	Fri,  6 Sep 2024 22:06:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="a/a4PyjK";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4D810EB0F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Sep 2024 22:06:46 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 486IcfJG027897;
 Fri, 6 Sep 2024 22:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 A5VushRVwNPP+HLnW2kbB1X/+SVsP1SHl2WAWK81Dn0=; b=a/a4PyjK8RVIaojR
 Saoc6YhvljxdggEF28HurOlMHKTB7phoRUWqa0dyhrpk377Zpd/pY0vgD1kM9j9H
 6e+f1y7bOGXof7lE1aXJkndBRXBpKAVMZ83RryYtz21shWaWX6uiHo64Xdl02wSH
 JhSn7Vjzt1Jwn5mWrpDpJ2nMqu5GuOOyh4XQxnqF4RouAQy/5a9O84MMHPaFI8at
 Eed5WGsAlRqkVPtTiXM2uFXKjslCr+/gc95JJ8EaHt5TfTm2iQZmt41KykQPeMWP
 FGh3zHJ/w34WgvKhVH6bAO/bS93u8OC+X7DA1ybs0cdVRuZQgIlxxT0uwxtiDn9b
 iOa8GA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhx1uj0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Sep 2024 22:06:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 486M6ZNp026255
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 6 Sep 2024 22:06:35 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Sep 2024
 15:06:35 -0700
Message-ID: <c2153f92-7cda-4af7-9e38-2710d4c28755@quicinc.com>
Date: Fri, 6 Sep 2024 15:06:29 -0700
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
 <77a149a4-ede3-496e-bee6-728f396199d9@quicinc.com>
 <19898311-7e6a-443e-94c3-42ecbd2d7c55@amd.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <19898311-7e6a-443e-94c3-42ecbd2d7c55@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: FOVcaUetBMJiDxsGQirByp4LA_YlPdtf
X-Proofpoint-GUID: FOVcaUetBMJiDxsGQirByp4LA_YlPdtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_07,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409060165
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



On 9/3/2024 4:33 PM, Alex Hung wrote:
> 
> 
> On 2024-08-30 12:32, Jessica Zhang wrote:
>>
>>
>> On 8/29/2024 1:28 PM, Alex Hung wrote:
>>> I ran a smoke test and Patch 4 (tests/kms_writeback: Disable all 
>>> outputs after igt_display_require()) is causing a regression on my 
>>> test platform:
>>>
>>>
>>> Starting subtest: writeback-check-output-XRGB2101010
>>> (kms_writeback:1973) CRITICAL: Test assertion failure function 
>>> get_and_wait_out_fence, file ../tests/kms_writeback.c:345:
>>> (kms_writeback:1973) CRITICAL: Failed assertion: ret == 0
>>> (kms_writeback:1973) CRITICAL: Last errno: 38, Function not implemented
>>> (kms_writeback:1973) CRITICAL: sync_fence_wait failed: Timer expired
>>> Stack trace:
>>>    #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>>>    #1 [get_and_wait_out_fence+0x8e]
>>>    #2 ../tests/kms_writeback.c:401 writeback_sequence()
>>>    #3 ../tests/kms_writeback.c:424 writeback_check_output()
>>>    #4 ../tests/kms_writeback.c:782 __igt_unique____real_main557()
>>>    #5 ../tests/kms_writeback.c:557 main()
>>>    #6 ../sysdeps/nptl/libc_start_call_main.h:58 __libc_start_call_main()
>>>    #7 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>>>    #8 [_start+0x25]
>>> Subtest writeback-check-output-XRGB2101010 failed.
>>
>> Hi Alex,
>>
>> Thanks for testing and reporting this.
>>
>> The overall goal of that patch was to force a modeset for cases where 
>> the primary display mode and the mode being used on writeback were the 
>> same. If the modes are the same between commits, the DRM framework 
>> won't perform a modeset on the encoder even if the connectors have 
>> been changed.
>>
>> To get around this, we thought it would be good to disable all the 
>> outputs and start from a clean state before doing the writeback 
>> connector setup.
>>
>> Is there anything in AMD's disable path that could cause the writeback 
>> connector/encoder to be in a bad state for the next commit?
>>
>> Thanks,
>>
>> Jessica Zhang
>>
> 
> I did a quick check but haven't found anything wrong in disable path yet.
> 
> If this is required specifically for your devices, maybe you can have 
> something similar to is_i915_device() or is_amdgpu_device() for time-being.

Abhinav has recently posted a patch [1] to directly address the issue 
instead of having the disable_all_outputs() as a workaround. Since his 
patch is also fixing the issue for me, I will drop the disable all 
outputs patch in this series.

[1] https://patchwork.freedesktop.org/series/138284/

> 
> 
>>>
>>>
>>>
>>> On 2024-08-28 21:05, Jessica Zhang wrote:
>>>> Add a subtest that will iterate through all pairs of
>>>> non-writeback and writeback cloned outputs and dump the writeback
>>>> framebuffer for each pair.
>>>>
>>>> This series includes:
>>>>
>>>> - Fixes for properly cleaning up the kms_writeback state and forcing a
>>>>    modeset after igt_display_require() to prevent commit failures when
>>>>    the writeback mode is the same as the primary display mode
>>>> - Adjust the duplicate pipe check in igt_display_refresh() to allow for
>>>>    combinations of valid clones
>>>> - Moving the writeback dump to its own subtest
>>>> - Adding a subtest to dump all writeback/non-writeback cloned pairs
>>>>
>>>> To dump the clone mode buffer, run the following command:
>>>>
>>>> IGT_FRAME_DUMP_PATH=<dump path> FRAME_PNG_FILE_NAME=<file name> \
>>>>     ./build/tests/kms_writeback [--run-subtest dump-valid-clones] \
>>>>     -dc <primary display mode>
>>>>
>>>> This will output a file named <file name>-encoder<writeback encoder
>>>> id>-encoder<primary display encoder id>
>>>>
>>>> ---
>>>> Changes in v2:
>>>> - Corrected author email
>>>> - Link to v1: 
>>>> https://lore.kernel.org/r/20240828-igt-cwb-v1-0-48aee421fc97@quicinc.com
>>>>
>>>> ---
>>>> Jessica Zhang (5):
>>>>        tests/kms_writeback: clear writeback properties in teardown path
>>>>        lib/igt_kms: Add helper to get encoder index
>>>>        lib/igt_kms: loosen duplicate check in igt_display_refresh
>>>>        tests/kms_writeback: Disable all outputs after 
>>>> igt_display_require()
>>>>        tests/kms_writeback: Add dump for valid clone mode
>>>>
>>>>   lib/igt_kms.c         | 57 +++++++++++++++++++++++++++++------
>>>>   lib/igt_kms.h         |  2 ++
>>>>   tests/kms_setmode.c   | 14 ++-------
>>>>   tests/kms_writeback.c | 83 
>>>> +++++++++++++++++++++++++++++++++++++++++++--------
>>>>   4 files changed, 122 insertions(+), 34 deletions(-)
>>>> ---
>>>> base-commit: 3b6b2d238e864ff1af9e33159d3bbf4b7f01d86d
>>>> change-id: 20240827-igt-cwb-23fd81d3a7a4
>>>>
>>>> Best regards,
