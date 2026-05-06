Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C6CD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 15:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591D910EE02;
	Wed,  6 May 2026 15:40:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2Dj6jLAO";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011019.outbound.protection.outlook.com [52.101.57.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A113C10EDEA
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 15:40:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUBAKICL4vXsbqguA5iaFt+utHsz76uoKYKRx+XJZFyDbY/dOnV4xJD+KZsWt4WRUatoVyUWrAbDAV8Zj9fWTp64TFHDgzIvxBsnJYtRd3mm3IftI8rSQ6XC7qdVG9rOuZsUa4dwUFPO7nl+WDDIpWHflqbBe3BDisMcfE+FLrjUvSZnDu2GAI0XV28mXu1JfZlztrTeJTU4MFQCIoB3l14hMuFaqqzAbxQOXOsyY6C0odgFpcL8IFOW1zqVjFHFjIT1hu5CalvEXkvodUXjSCX06Yh15dg34iJjZ2WHCPfYO4C1Ul2ffaDMqJfy9HZROR6G4uNgu+V4if+lEobfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+a+zg4vzBVROMiZ4JL+616anK+j/O69eqerdfsVNdUc=;
 b=njOuV26wCbfte9eoouOCmqhKRx/IE7llD926qXzNYbxOy7HxxfzNKMWap1Ne+uL67/laOMXmRCwc6Pmzyn+RuFmzMqbgMk9Jb1GHVxjWouEuQASrSF3I1x5mAE+Sk883T5plNfNyuwAOiCnbvmPG5dQRC6jMapu+el11Ua3AeN7tJQGeDOrCWYl+6ckDuako5eoEA/wC6hA9v1GDgSPyn04mBZ05nCUt/Qe8vIVLS2IdpvzU3rxlMFYySjrji9hvcBJHyPoKIwCIqZD2uezXSTr3qJqsm2S1fSHyYn0D08Ho9ht9bc9066/WDN3RESUCF3+TCpjvDEu16GQujWL0rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+a+zg4vzBVROMiZ4JL+616anK+j/O69eqerdfsVNdUc=;
 b=2Dj6jLAOQzUru9lRQ9K32Y9ECHJlWPWGFD6pbZmf0ar1l0qgZYrSb1wCHzC09OOJ50TB6UUfA52Oc+3SHno4ah/7/hJKhRqqexqA1sLT1kfDoFTkaeQ328tzJRY606wns6eiAXVYHyFQmzFMFQhimyQXoc25EHvki8c1SfNKnYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by CH3PR12MB8234.namprd12.prod.outlook.com (2603:10b6:610:125::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.16; Wed, 6 May
 2026 15:40:32 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%7]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 15:40:32 +0000
Message-ID: <199a3ae5-812f-4286-8546-2347dbf8ee9c@amd.com>
Date: Wed, 6 May 2026 09:40:30 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t][V2] tests/amdgpu: Add amd_hdr_visual for manual HDR
 verification
To: "Sharma, Swati2" <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Mark.Broadworth@amd.com, vitaly.prosyak@amd.com,
 kamil.konieczny@linux.intel.com, jani.nikula@intel.com,
 Wayne Lin <wayne.lin@amd.com>
References: <20260505205743.1839944-1-alex.hung@amd.com>
 <17d2434d-90e6-4824-87b6-bf9a3644a275@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <17d2434d-90e6-4824-87b6-bf9a3644a275@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:303:2b::11) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|CH3PR12MB8234:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bcd6116-43b7-44a6-5d3b-08deab85cef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: vL2cjvkDOFLdvPnEi7DJpgzW3BhkFckOJjlqtwiDXDidnceO5chrpUCNqMXMyznrbrTJUUPg1MAAlaMSsHl9kqMpkhXQyrQ835H/DJ9z4E2QJ4z/js+FVAAIrTCuYX+n0DjHSVvGru7LoC+is5/CgvJn5HFNC0snLdWv0A32jhcRdLSPH7653wOS5cLiOVqgI6ECpV3jS/nXth9MVS2dC/Oj4+ws3klnuMkxjyprW4lWExASF2ozuBdICXz3CP7PD/AVGGkpHvJOZijvrhmWMIa7e7cpgPGmyo9TYVOTLoEkV+LJSB1+EtSnC/Nrd/x4TVbTePO/bPjeL88EUHY5NMCzwxo7ATauLzWEru5w1euwGTo0921ewUv6fr19q6UWDmLL4cpOWXhzAvcivVRd9spcgl1f6WPbziK87AC7yh6vPLrxwUSYB4qx6IdVmiuatvVE/ppWO5qTDGgz6bhM/5EZqWPyfe3/tPbq1xt5W3Irwl+eJr7vuph+lhbdLapnhap4aVWil9C8JKyVlI+AMudwukes1nAHJxRMUve1C0NlDPspjMtkJMf9XvbsPT6s6CocvHcowpKizCVJSC6WnmxG/dYYgifcfPypb1+OuzcjpPhKMQLy1Ke06i0nmZ9peM12/DxftzAGZtGgjnSDOGQY1EaUjhMEiWJfTUmd+KCcQjhg9GvhWcpQQ9CfMiog
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUttT3dGU0c0L1JhZ2Z0SHdIUkVYTFhXNVhZcmpaN3dVZE8xdG03cHRPaFZ2?=
 =?utf-8?B?SExvbGZUYzhtS2RVWTVGMzFRZUd6NkE5QkcrZUJMRTdSQTkvWEx2VUxrVDVr?=
 =?utf-8?B?S2REVU9pT0hRM1hzR0poYVgrYlFybWR3NnQ2aElUWDFaeWtyY3VXS2tqRFly?=
 =?utf-8?B?ZVN2bkk4K1JieSttK3lHZCtzd3krdUUyV0Z2T2d6MVdtcDNXL1lpcHlpa1JN?=
 =?utf-8?B?emd5dHozRFQ1RGxjZjhCQWV3WmpXU3ZWRU1OelQwRGpybGZ3K3FPRkhDVkU1?=
 =?utf-8?B?KzlMc2NaUU5yeEp6RUxMNDNrRENJNms3SWJnamdiTnJndGJHcGZxZ0Fpejlr?=
 =?utf-8?B?NDJtNDBhck5wNmxwL3RHY2E1amNqN255OHBSVjZJcXVkSjRkOWdyQWNTTXIv?=
 =?utf-8?B?Q2d3Uy9RNllqb09pR01COG5IT09XOUxLemtxR0xzcDhEMmF3Vk8xMktDb0tp?=
 =?utf-8?B?bkhJekphRXdabi9rUS9leHVUV3VOZU1RTURQMkFZUXFkenF6dTNxejBUd09v?=
 =?utf-8?B?RjdIdW0yYWVBM05abFArQ2x1R25teW15ejNhcVFYWVp2amNKcmpRSk5HNDRF?=
 =?utf-8?B?Sm1zaFhCNG9xWEVJWHNOazJMSHNiTEdzNHVNZkpYVDRjK0MvdHNSc3N3bkg2?=
 =?utf-8?B?RXRkbzRUMlFDREo4R3FUU3RnNnJYNEJpM2Q1Zkl3MFRsSStZSDdRWmRhelRV?=
 =?utf-8?B?K2lmektVR2duME9idkJFWFFBODNGRXNyTElQR202T2d6MmhvcTE4cDJweEV4?=
 =?utf-8?B?eEhEbDdKWHdxd1E3K3RtRDJoUXJNbUZERUxHcE1nVXhnSUt4UDlqdG1SZFRY?=
 =?utf-8?B?aXBBL2w5RmFnWktxUTh6U3hpeXExcEhIYXZVUEU4ZTVYc3RmT0JYTTN3bEFO?=
 =?utf-8?B?QWdBM2pwVlIreVc4cnBQQjI1T3FuQm1EZFZUeGNrMWhKTVlZLzVWb0h4YzM2?=
 =?utf-8?B?Z0FTdDZDaHhoTUhudDhpMU82L3JwQ09IQ3VDRVFBV3NGYVhFSkRBdE9ReDMv?=
 =?utf-8?B?NCsvRkVsSEZYdXFDRDl6TGd4b3ZONUtBcU5zakExNlJtajdyOUVHbnkyRTdr?=
 =?utf-8?B?a21uSnFZZ2U3OURBS21DekE0MWtSbmM1bXFlMXBGT2Y3NVhCWDFDd3ZyRHBv?=
 =?utf-8?B?TmtJR2lubnIxTW0vUk1FUldEWlBjOWdRWG1kaXZpNEpuMGFEZGVnc2o0S3Iv?=
 =?utf-8?B?OVg2WlRnQkpaSzFCZVp6T3A1N1hUc29aeHJPMTFCK040YWFGNkZ5KzJsMGFo?=
 =?utf-8?B?NU84RmZrU2dhWFMwc0NCMHk1UEtRMGRobkdBZFdrYXpITDJYR2Z6dmRXZWZh?=
 =?utf-8?B?QTZLRkx4TUMzWTdNU29kaGJEdXVOZzhNY1ZZRFh1Zm5hMDBpMEg4aFl5Tjdt?=
 =?utf-8?B?TXJmdzM4em1vREwxNXM1aWsvZkRIaXZWMXM4bjQ4TENGc3huZVpGcVU3b2pY?=
 =?utf-8?B?OUNVZDlJdXFKdElOYU5GMmhIem1QUkJlZStJOVFGUHBBSkY3ZkpTdXR6SGQx?=
 =?utf-8?B?REtWRUt0MzBDUXZrZHdJZmtNRjNVd21JRnVlV0tWa3FWMjNvNll0WGRQODJm?=
 =?utf-8?B?NjV4MUhFZDN0YlpOSEpVcUlkbGNmZFJkTU5iblBQV3hBcWpWUmVYNS9ISVdQ?=
 =?utf-8?B?WkhhT3NXbDQ4dFRUUE1lQUlmR08wRGN0Ym4yTGl4cG1ma2IybG1PdkhRUkZX?=
 =?utf-8?B?WDBORGQ1M0JiUzRaZmdDVG8rQi9yTnV6dU5QMU9LR1d1aUdQMzBZc2c0aGJL?=
 =?utf-8?B?RmFWYVkrWFdPV2kzT1NjbXphODBBeUNsazZ2RDB1cjRGbnRxYk1adkZsUUpE?=
 =?utf-8?B?Q0kvZVM0cWhqOXVSQjNlUmJBTWtNSVhPQmhoY3cxZ1YxMWZTVEQwQjN1SUpw?=
 =?utf-8?B?bHdZSnQxbDM0TDkxSGdUZC9ITUdUcFo3eTI4Q1VOSS96OWRXdkVKNmRVSC80?=
 =?utf-8?B?ZGYwOTFsM0ZqdTZOejQrRFY0bWZoUWMwMjdqZ2RhcXhhMUgxSkRFZCtMSkUy?=
 =?utf-8?B?S2tjd0VXSzlrbXVGSUhVQnRVam04U2ZWVmdqMEZvZlc3dkRVUFkwSDY4TFdU?=
 =?utf-8?B?K1RuTTY3Mkh3WTlhbStyNUQ5ektidU1PSklxRFZvQTVXRGplanZEaVo3UGlP?=
 =?utf-8?B?ckZmMmR0Ujl3bmh6WUd2RXgzTW1yeS8yZHpGNTVYOHpTdFl3U2dueVIxSmpC?=
 =?utf-8?B?Uitpd3JuTHV3TVVRNHJCcWt3SzdDeU5WK1B1TVd0ZGNLNkdYS3I3ejRkaW1i?=
 =?utf-8?B?dXlNdXF0R2Q4Y0VESUxqR1Q4ZEwyeC9MQVVMQkI3RGdKVk9STUNCajZkeS9P?=
 =?utf-8?B?ZG5Lc3RvczJtWE90VUxXeTl5emR1alh4bWlMdmFSN21vem1LaXBzQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bcd6116-43b7-44a6-5d3b-08deab85cef9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 15:40:32.6791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s2LKYVRBP0T/XFpikOK6TBnaK0MIUTBHoAqvT2II9ZNe3XlFO/uaSGmJAdOCcz8C6crl63Y77vZtJnWAuhPV+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8234
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



On 5/6/26 05:43, Sharma, Swati2 wrote:
> Hi Alex
> 
> Can't this be part of kms_hdr?

Hi Swati,

I thought about it but it may not suitable for kms_hdr for two reasons:

1. it now checks amd driver and it has never been tested on non-AMD 
devices. I'd be happy to remove AMD dependency if it works on non-AMD 
devices.

2. This test is for manual verification. It pauses for a key press to 
continue, so it can interrupt kms_hdr workflow.

> 
> On 06-05-2026 02:27 am, Alex Hung wrote:
>> From: Wayne Lin <wayne.lin@amd.com>
>>
>> Add a visual verification test for AMD HDR display output. This test
>> displays HDR test patterns with different metadata types and waits for
>> user confirmation, enabling manual inspection of HDR output quality.
>>
>> Subtests:
>> - static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
>> - static-swap-traditional-sdr: Display with traditional SDR gamma 
>> metadata
>>
>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
>> ---
>>   tests/amdgpu/amd_hdr_visual.c | 176 ++++++++++++++++++++++++++++++++++
>>   tests/amdgpu/meson.build      |   7 ++
>>   2 files changed, 183 insertions(+)
>>   create mode 100644 tests/amdgpu/amd_hdr_visual.c
>>
>> diff --git a/tests/amdgpu/amd_hdr_visual.c b/tests/amdgpu/ 
>> amd_hdr_visual.c
>> new file mode 100644
>> index 000000000..63eed937c
>> --- /dev/null
>> +++ b/tests/amdgpu/amd_hdr_visual.c
>> @@ -0,0 +1,176 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright 2026 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include "igt.h"
>> +#include "igt_hdr.h"
>> +
>> +/**
>> + * TEST: AMD manual HDR visual tests
>> + * Description: Test HDR metadata interfaces by showing visual HDR 
>> patterns
>> + * Driver requirement: amdgpu
>> + * Mega-feature: Display
>> + * Sub-category: HDR
>> + *
>> + * SUBTEST: static-swap-smpte2084
>> + * Description: Show a visual HDR pattern with SMPTE ST2084 metadata and
>> + * require user confirmation.
>> + *
>> + * SUBTEST: static-swap-traditional-sdr
>> + * Description: Show a visual HDR pattern with traditional SDR gamma 
>> metadata
>> + * and require user confirmation.
>> + */
>> +IGT_TEST_DESCRIPTION("Test HDR output metadata visual verification");
>> +
>> +/* Common test data. */
>> +typedef struct data {
>> +    igt_display_t display;
>> +    igt_plane_t *primary;
>> +    igt_output_t *output;
>> +    igt_crtc_t *crtc;
>> +    drmModeModeInfo *mode;
>> +    int fd;
>> +    int w;
>> +    int h;
>> +} data_t;
>> +
>> +/* Fills the FB with a test HDR pattern. */
>> +static void draw_hdr_pattern(igt_fb_t *fb)
>> +{
>> +    cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
>> +
>> +    igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
>> +    igt_paint_test_pattern(cr, fb->width, fb->height);
>> +
>> +    igt_put_cairo_ctx(cr);
>> +}
>> +
>> +/* Prepare test data. */
>> +static void prepare_test(data_t *data, igt_output_t *output, 
>> igt_crtc_t *crtc)
>> +{
>> +    igt_display_t *display = &data->display;
>> +
>> +    data->crtc = crtc;
>> +    igt_assert(data->crtc);
>> +
>> +    igt_display_reset(display);
>> +
>> +    data->output = output;
>> +    igt_assert(data->output);
>> +
>> +    data->mode = igt_output_get_mode(data->output);
>> +    igt_assert(data->mode);
>> +
>> +    data->primary =
>> +        igt_crtc_get_plane_type(data->crtc, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +    igt_output_set_crtc(data->output, crtc);
>> +
>> +    data->w = data->mode->hdisplay;
>> +    data->h = data->mode->vdisplay;
>> +}
>> +
>> +/* Returns true if an output supports max bpc property. */
>> +static bool has_max_bpc(igt_output_t *output)
>> +{
>> +    return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>> +           igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>> +}
>> +
>> +static void test_static_swap(data_t *data,
>> +                 void (*fill_metadata)(struct hdr_output_metadata *),
>> +                 const char *mode_name)
>> +{
>> +    igt_display_t *display = &data->display;
>> +    igt_output_t *output;
>> +    igt_crtc_t *crtc;
>> +    igt_fb_t afb;
>> +    int afb_id;
>> +    bool found = false;
>> +    struct hdr_output_metadata hdr;
>> +
>> +    for_each_connected_output(display, output) {
>> +        if (!has_max_bpc(output) || !igt_output_supports_hdr(output)) {
>> +            igt_info("%s connector not found with HDR metadata/ 
>> max_bpc connector property\n", output->name);
>> +            continue;
>> +        }
>> +
>> +        if (!igt_is_panel_hdr(data->fd, output)) {
>> +            igt_info("Panel attached via %s connector is non-HDR\n", 
>> output->name);
>> +            continue;
>> +        }
>> +
>> +        for_each_crtc(display, crtc) {
>> +            if (!igt_crtc_connector_valid(crtc, output))
>> +                continue;
>> +
>> +            prepare_test(data, output, crtc);
>> +
>> +            /* 10-bit formats are slow, so limit the size. */
>> +            afb_id = igt_create_fb(data->fd, 512, 512,
>> +                           DRM_FORMAT_XRGB2101010, 0, &afb);
>> +            igt_assert(afb_id);
>> +
>> +            draw_hdr_pattern(&afb);
>> +
>> +            /* Start in the specified HDR mode. */
>> +            igt_plane_set_fb(data->primary, &afb);
>> +            igt_plane_set_size(data->primary, data->w, data->h);
>> +            fill_metadata(&hdr);
>> +            igt_hdr_set_metadata(data->output, &hdr);
>> +            igt_output_set_prop_value(data->output,
>> +                          IGT_CONNECTOR_MAX_BPC, 10);
>> +            igt_display_commit_atomic(display,
>> +                          DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                          NULL);
>> +
>> +            igt_info("wait %s!\n", mode_name);
>> +            igt_debug_wait_for_keypress(mode_name);
>> +
>> +            /* Exit HDR mode and enter 8bpc, cleanup. */
>> +            igt_hdr_set_metadata(data->output, NULL);
>> +            igt_output_set_prop_value(data->output,
>> +                          IGT_CONNECTOR_MAX_BPC, 8);
>> +            igt_display_commit_atomic(display,
>> +                          DRM_MODE_ATOMIC_ALLOW_MODESET,
>> +                          NULL);
>> +
>> +            igt_display_reset(display);
>> +            igt_remove_fb(data->fd, &afb);
>> +
>> +            found = true;
>> +            break;
>> +        }
>> +    }
>> +
>> +    igt_require_f(found, "No connector found with HDR metadata/ 
>> max_bpc connector property (or) panel is non-HDR\n");
>> +}
>> +
>> +int igt_main()
>> +{
>> +    data_t data = { 0 };
>> +
>> +    igt_fixture() {
>> +        data.fd = drm_open_driver_master(DRIVER_AMDGPU);
>> +
>> +        kmstest_set_vt_graphics_mode();
>> +
>> +        igt_display_require(&data.display, data.fd);
>> +        igt_require(data.display.is_atomic);
>> +
>> +        igt_display_require_output(&data.display);
>> +    }
>> +
>> +    igt_describe("Tests swapping to SMPTE ST2084 HDR metadata");
>> +    igt_subtest("static-swap-smpte2084")
>> +        test_static_swap(&data, igt_hdr_fill_st2084, "smpte2084");
>> +
>> +    igt_describe("Tests swapping to traditional SDR gamma HDR 
>> metadata");
>> +    igt_subtest("static-swap-traditional-sdr")
>> +        test_static_swap(&data, igt_hdr_fill_sdr, "traditional-sdr");
>> +
>> +    igt_fixture() {
>> +        igt_display_fini(&data.display);
>> +    }
>> +}
>> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
>> index d5a4820e3..7db1e2d9e 100644
>> --- a/tests/amdgpu/meson.build
>> +++ b/tests/amdgpu/meson.build
>> @@ -90,3 +90,10 @@ foreach prog : amdgpu_progs
>>                          install : true)
>>       test_list += join_paths('amdgpu', prog)
>>   endforeach
>> +
>> +test_executables += executable('amd_hdr_visual', 'amd_hdr_visual.c',
>> +                   dependencies : test_deps,
>> +                   install_dir : amdgpudir,
>> +                   install_rpath : amdgpudir_rpathdir,
>> +                   install : true)
>> +test_list += join_paths('amdgpu', 'amd_hdr_visual')
>> -- 
>> 2.43.0
>>

