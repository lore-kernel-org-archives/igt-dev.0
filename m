Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949631077610
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 20:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498DE10E7A2;
	Wed, 18 Mar 2026 20:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="REhP8gFi";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012014.outbound.protection.outlook.com
 [40.93.195.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB20C10E7A5
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 20:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TRUm0rD84KdC5ZLB722nh6Z0ODwLYyOU53NCeZdv4mQU4CS21+Hidm2leu77x8MXQm+UGQAPN+3uZMwCA9+a9DgPT2a6vww2yXd+HiXRHpplqdBhaEg1pS/RoxRCGOoWYN4HRfiolrjTyl9wko9wVCKpmf79WF3TlLHTrXCTR1E/C/KMF1OQtOkQDr/3fc9/naufMuM59EuSS5ltGur5b0NhxZTvw0A48SBV+09p3vTLks0WGU7kQGhWJ7QlFQp68p1yZLAl2vMc3s23Ktqgfvj6slVk02dO+krUlW0fdJjGOlUroFW2OJp6/+jFMgQxFJzdLGp2IrRFOhDGRYz35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FEQ9OCGg/NFWlq7sPwMpmfYBXbnONh3J3RVl2PpkcZs=;
 b=invSYFfgqdwzsfUNFgUPiX+eWneJv0jBQKFq1VzFsRUD2YFRErRyvK49qLFLUE/tSEzTvAs8LgdvQ3hUWDgQl+N7atpUSbD1KONj7/9QWyyq83atmfEZbLsayox63lYlGJsHb7hXb7+bwW7Jr4DZMT6IcaPGHundUHBA6LIKlSfNeaoWUoQQ5X1EtWhMA3UyktZoxZNdiS2eb4LOkk3GNxrkdg3WwGrNDQyuqFUeYlNKbHAYNh7+tULZegnlruu5IYcUztC5ha+MyOVKmmnZTT8qzBl3EgrifFYHFlZvUhcHkiL8mxGklJQQFog9puKYx1rtK8F8lcxEC1pRe7JlUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FEQ9OCGg/NFWlq7sPwMpmfYBXbnONh3J3RVl2PpkcZs=;
 b=REhP8gFiL9R5sxew8HBVQujVtbRlJ59GSMyY3fYhKjVFdpjn+BUzS3iysLIcMFbx7gVFVhM1/swUjDb+4x00LxSoNMY5TPzNgaf7oGeX9lO9GZTRwHO0v6E5buQfTStWuSyl4Hg78IIaXIMt1+C5k0+HdQe9oSWSX2yrV0o2xwA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 20:13:42 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::715:65fb:c3fa:9c26%3]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 20:13:42 +0000
Message-ID: <2467d584-24ca-49a8-a561-bc19416e052d@amd.com>
Date: Wed, 18 Mar 2026 16:13:38 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] tools: Add amd_hdr_visual for manual HDR verification
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 wayne.lin@amd.com, Mark.Broadworth@amd.com,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260317175136.3754576-1-alex.hung@amd.com>
 <20260317175136.3754576-2-alex.hung@amd.com>
 <20260318095254.djw4zv52ppxvl6ny@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20260318095254.djw4zv52ppxvl6ny@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0482.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::20) To MW4PR12MB5667.namprd12.prod.outlook.com
 (2603:10b6:303:18a::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB5667:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e311db-d434-4b0e-158a-08de852ad9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: XL4XcbVJeP8K8+5CMWMWR189e5RHIgIZRBkl3yav1JZforT0sNL4xyPXJ5kzdYempciA8MO7g1qeSC9kXFNe/K3HfXuYWfZJ5u0ZOm8AUX5EO2aGYgujvA8ZsHoVV6pkJF1XTipQIh8JhZbQWByRqp/njdgPAQAkAlFneCmWZQXH7tIFz80gzYXTAqW9vfLADPUGaav4qLeLfjJso8TPOPLS8eR8c+zB23QkUnsYYEFXfn2bztOjrW6xQfIQVXZTXHIOybLk0bRTbZsf8z4eKzLuFmmfrFuOeVunOA6JbFLadIqSB+teQ2E6l8XlWrDI+DNbG14jG1NJUl8evcAFSBnHU5e3oIFHetkLOZFbT3y8Pibjhs495QR3zNW3kxZ2uibKcw90FIC/kiolZV5x9o5F2RtLbb5/JXHmZFqU2ly7znKjhxpCaaNvWQ5Eb8U9/Qu9ifI4zYs0GJQoVgGXvsIVeD/lIoijPWqAE+ijRzQB+b1C5VKwPjMQ4aPHnITbnTaXJ0foQeRHoxw8FgvG46HbhSHiwZnUyGbMzjWE9Lhl6FoPsETzt/wCkMhi61SMk2xNCKMkD6LLfTKKL/8RGQJZQa6kVoxPOfK4tS6RC80lL33PRWnKWSORuT2+Fk3zPT0XoCW+AKWSCXiluMQOqGyxLLL7zlIxlyGqWsJJF0r5ZbUm5oFAE6TU0eS/RSJifNQLuK8EEDFadNK64wQHPSIMqz8XWRxkL6F0saovL7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVI5dU5UOXZQZmVYREFDK2k3WEFqRDBiQ2lZSGhKRlF1RlJOK2h5dTZGbjJy?=
 =?utf-8?B?OXluWnhOOTJKMTZkeThOaW1Lb2xtNCtSVjd5T1hncnZNYm4yWnBsN3pPKzVz?=
 =?utf-8?B?M0hvSXR2dnd6bFI0WDBtVFpLZ2srNEZwemx2UUx5cTF4YXhWUDBYc3l5alJ2?=
 =?utf-8?B?MnBUTndpejVCL3lKWFY5bk9rYmNGc2gvdTRHRDJjaldObGtUNFFMZHVjMnph?=
 =?utf-8?B?QXB3c1REWk1WdC9TeTEvVnBJRDcyNlVzUGU4Z2RocFplemlTdHVjSHhOM2NG?=
 =?utf-8?B?TmVsZVBLeE9YWWtQd25FUEswZEdxWW9jeUxQRnZCcUtZN0NIRm1uZnVuWEdR?=
 =?utf-8?B?SGVXWmJmQ0dUbmdibUl0TlJ4dkFtc21NbFBtV1dnVFpHODFpUmFYT0tnRm41?=
 =?utf-8?B?YUtwRm15Y2xkckxIWExnRlROQUlPS0R1U3FIZGYyeE8yWEV4elkxaFVmcjdY?=
 =?utf-8?B?UXNWLzd6bmZ2dFQycCtoYllnZWNHK3hvNStpQUlDU1hzZW5LNSsvbVlXY09Z?=
 =?utf-8?B?b283K0hhc2VaSFNBTHorTUVkeURYTFpwd1VMZEtLMk5xNFZIbHFqQ1BpWlg5?=
 =?utf-8?B?YXBCakxjWEpNaFE5QlpDWHlUaFgzbXZJSERmMEpiVldUZFdYRkpCWVVPQm9L?=
 =?utf-8?B?SWZHb28vNjN6d2xTZ2hPdzhpbWtUeitjNWc4aElSenJVRDg3ZmVkWitxWWJC?=
 =?utf-8?B?b2RRRmhXT0w3YnFRZnpXb0ZQZUhETElFZWg3WkQ1Q2V3eHlTNjU2QWk5K2hI?=
 =?utf-8?B?VFRvVFAxZVF2emtLZTJNL1NvaGw3RHpaME5SWEs3cXlISTZudWc3ZEpNc3NW?=
 =?utf-8?B?OG9UZ2lwS05rbUJuK0htZyswcDZuREpSU1p2cEtQLzNWTFhZcUFUbVVkVkJ5?=
 =?utf-8?B?T1AxV0c0RlNJY3FvakQyVzVPYTBNZkxlbkdFbE40RUpUUlBSdS91U0pBRUQw?=
 =?utf-8?B?dHd2V293bEpGSmxEOXM1YzJWejJzbXF1K2UwcFlFUDU0ZjVTdEtPZm03ekdL?=
 =?utf-8?B?Q0VNN29odDZYT3pYNHV6VldnakFWVERCK291WGJMak5pNC9LRlk5UkdSZit4?=
 =?utf-8?B?TjBTU2NBcGdCOUNFZ1hrOFRvSFVIMXA3VStpNzkrUFhmQzN0Ymg3ZndQQWZj?=
 =?utf-8?B?ZzF1ZWV5K1JNOGxkclgyQ1duMjd1dmxGblJ6R2lySkxDMGs4dUdHNWcrczlk?=
 =?utf-8?B?Ly9YaUVtc2ROUDUyN05nUVNWanRYRUVYb0ZWSUNORVRiN2xWK29aV0dWcFNI?=
 =?utf-8?B?UkFqMXJhSUM1UkpDVGU5ejVXaHdkNXBZb24zSVNsNUs1MGkrelJUdWlwam5V?=
 =?utf-8?B?aGpZMk5VN1RuQzRmM1NPd3NrZDN6V2l3eDlSMXhYZXY4dGpPU3BhMVJyc21S?=
 =?utf-8?B?ZXkyNXlHWlQ1YkVsMzZqOUZXU3FqRFdBcm11UnJhZ1RlNFJrd1phNTJXSTR6?=
 =?utf-8?B?ZnFORlFwWTlxNEFWdUtjbzNhWm5VdTlTZFpLc2J3d2FxUW5iWTAvNUdERmRY?=
 =?utf-8?B?cW8wNlRkV1JtZnBLbk80aHMrNVc0c3l2N2VqVjFiaytQaE9CN3dwU3RCZnBl?=
 =?utf-8?B?SU4wZHVEZU5MdGhXK3M5czB4RWZYckJiSjdmbTViVVhnaG50dytYV3V0Sm14?=
 =?utf-8?B?ODBaNnR2Nzd0MW1SMU5RV1FUaXZtbkkwbmVtQTdpeVh3ZFFkeW5FZDFta1JU?=
 =?utf-8?B?Q3pHMzhDWXE0SG1TenkxYlBSMnNtUXNoU1RJeVczeWdPYVJlSVlOOEFFZkhq?=
 =?utf-8?B?QWFXUHBsSWJ5cFZ3aER6MWpYN3FtMm0rU2NLUldjaXVQMEpxTlUxdTRmVkZH?=
 =?utf-8?B?bkp1OGt2OUx3T3pxMURzQ09ldFZSdG1wL3NRZi9peGN1NDBpMUs3ZWxjWkVJ?=
 =?utf-8?B?VnhvS1pjNnk3bElJUlViMXdxVk5CQTNpVkpOdnpEWHJqeGdrR2xMREtUM3E2?=
 =?utf-8?B?TzBBNCtOUzNjTkRhL0M0d0MvODVqL1hjNHQ2UXYxbzZiM0NSZ2JHcm1jUXJ4?=
 =?utf-8?B?cksvNDhYMUorVDJ1YzZhaWRUZVQ1eXRRanBFZzA3bVhFTWZzMWFtN000ak5V?=
 =?utf-8?B?b0d2RUNHeWEyaGdZSE1GajdTYTJpN2M3VHJJaTNmKzJ4SDFqZEpoV0pwNTlo?=
 =?utf-8?B?bHQ4ek5kZTAySGRsYVdYeDZuMjZ5WHRndEl2aVVrTWMvVit6U0xjNWMzczQx?=
 =?utf-8?B?NHlNbWNKeUtPZ0xFR2RDZk8reVV0eWsvckJJa3pTMlMzMGw0Yi80UHhVVm9T?=
 =?utf-8?B?WG81bmZVSG5DUTM5a3c3N0RidlQyY1Jub281OWR3cGZUWFN6dXpIcmFpdzMx?=
 =?utf-8?B?QkJLZVVWVVBPSlYwV1haeFVXRjRnUWNwbnh4TTZ2bTFMTThCMlEwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e311db-d434-4b0e-158a-08de852ad9a2
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 20:13:42.1202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lPwPDlFVAPvdro75zN1FNioZqk+b6zRRTe/O+GVcghusBsaqv+Y3e5reyerASyZfCEn/JZidMaf+Z+ObQexL1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073
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


On 2026-03-18 05:52, Kamil Konieczny wrote:
> Hi Alex,
> On 2026-03-17 at 11:51:31 -0600, Alex Hung wrote:
>> From: Wayne Lin <wayne.lin@amd.com>
>>
>> Add a visual verification tool for AMD HDR display output. This tool
>> displays HDR test patterns with different metadata types and waits for
>> user confirmation, enabling manual inspection of HDR output quality.
>>
>> Subtests:
>> - static-swap-smpte2084: Display with SMPTE ST2084 (PQ) HDR metadata
>> - static-swap-traditional-sdr: Display with traditional SDR gamma metadata
>>
>> Co-developed-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Alex Hung <alex.hung@amd.com>
>> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
>> ---
>>  tools/amd_hdr_visual.c | 372 +++++++++++++++++++++++++++++++++++++++++
>>  tools/meson.build      |   5 +
>>  2 files changed, 377 insertions(+)
>>  create mode 100644 tools/amd_hdr_visual.c
>>
>> diff --git a/tools/amd_hdr_visual.c b/tools/amd_hdr_visual.c
>> new file mode 100644
>> index 000000000..58decb356
>> --- /dev/null
>> +++ b/tools/amd_hdr_visual.c
>> @@ -0,0 +1,372 @@
>> +/*
> Add SPDX here, look into other C files and use Linux script
> checkpatch.pl for verifing.
>
>> + * Copyright 2026 Advanced Micro Devices, Inc.
>> + *
>> + * Permission is hereby granted, free of charge, to any person obtaining a
> Remove this text, it is replaced by SPDX.
>
>> + * copy of this software and associated documentation files (the "Software"),
>> + * to deal in the Software without restriction, including without limitation
>> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
>> + * and/or sell copies of the Software, and to permit persons to whom the
>> + * Software is furnished to do so, subject to the following conditions:
>> + *
>> + * The above copyright notice and this permission notice shall be included in
>> + * all copies or substantial portions of the Software.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
>> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
>> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
>> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + * OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +#include "igt.h"
> Why igt.h here? It should be after system headers but also
> try to decouple it from big test libs. Tools should at least 
> try to be tools, not tests.
>
>> +#include <fcntl.h>
>> +#include <termios.h>
>> +#include <unistd.h>
> Add newline here.
>
>> +#include "igt_edid.h"
>> +#include "igt_hdr.h"
>> +
>> +IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
> Not needed in tools, remove it. Or did you mean a test, not a tool?
> +cc Vitaly
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>
> Regards,
> Kamil
>
>> +
>> +/* Test flags. */
>> +enum {
>> +	TEST_NONE = 1 << 0,
>> +	TEST_DPMS = 1 << 1,
>> +	TEST_SUSPEND = 1 << 2,
>> +	TEST_SWAP = 1 << 3,
>> +};
>> +
>> +/* BPC connector state. */
>> +typedef struct output_bpc {
>> +	unsigned int current;
>> +	unsigned int maximum;
>> +} output_bpc_t;
>> +
>> +/* Common test data. */
>> +typedef struct data {
>> +	igt_display_t display;
>> +	igt_plane_t *primary;
>> +	igt_output_t *output;
>> +	igt_crtc_t *pipe;
>> +	igt_pipe_crc_t *pipe_crc;
>> +	drmModeModeInfo *mode;
>> +	enum pipe pipe_id;
>> +	int fd;
>> +	int w;
>> +	int h;
>> +} data_t;
>> +
>> +/* Common test cleanup. */
>> +static void test_fini(data_t *data)
>> +{
>> +	igt_pipe_crc_free(data->pipe_crc);
>> +	igt_display_reset(&data->display);
>> +}
>> +
>> +static void test_cycle_flags(data_t *data, uint32_t test_flags)
>> +{
>> +	if (test_flags & TEST_DPMS) {
>> +		kmstest_set_connector_dpms(data->fd,
>> +					   data->output->config.connector,
>> +					   DRM_MODE_DPMS_OFF);
>> +		kmstest_set_connector_dpms(data->fd,
>> +					   data->output->config.connector,
>> +					   DRM_MODE_DPMS_ON);
>> +	}
>> +
>> +	if (test_flags & TEST_SUSPEND)
>> +		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>> +					      SUSPEND_TEST_NONE);
>> +}
>> +
>> +/* Returns the current and maximum bpc from the connector debugfs. */
>> +static output_bpc_t get_output_bpc(data_t *data)
>> +{
>> +	char buf[256];
>> +	char *start_loc;
>> +	int fd, res;
>> +	output_bpc_t info;
>> +
>> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
>> +	igt_assert(fd >= 0);
>> +
>> +	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
>> +
>> +	igt_require(res > 0);
>> +
>> +	close(fd);
>> +
>> +	igt_assert(start_loc = strstr(buf, "Current: "));
>> +	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
>> +
>> +	igt_assert(start_loc = strstr(buf, "Maximum: "));
>> +	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
>> +
>> +	return info;
>> +}
>> +
>> +/* Verifies that connector has the correct output bpc. */
>> +static void assert_output_bpc(data_t *data, unsigned int bpc)
>> +{
>> +	output_bpc_t info = get_output_bpc(data);
>> +
>> +	igt_require_f(info.maximum >= bpc,
>> +		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
>> +		      info.maximum);
>> +
>> +	igt_assert_eq(info.current, bpc);
>> +}
>> +
>> +/* Fills the FB with a test HDR pattern. */
>> +static void draw_hdr_pattern(igt_fb_t *fb)
>> +{
>> +	cairo_t *cr = igt_get_cairo_ctx(fb->fd, fb);
>> +
>> +	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
>> +	igt_paint_test_pattern(cr, fb->width, fb->height);
>> +
>> +	igt_put_cairo_ctx(cr);
>> +}
>> +
>> +/* Prepare test data. */
>> +static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>> +{
>> +	igt_display_t *display = &data->display;
>> +
>> +	data->pipe_id = pipe;
>> +	data->pipe = &data->display.crtcs[data->pipe_id];
>> +	igt_assert(data->pipe);
>> +
>> +	igt_display_reset(display);
>> +
>> +	data->output = output;
>> +	igt_assert(data->output);
>> +
>> +	data->mode = igt_output_get_mode(data->output);
>> +	igt_assert(data->mode);
>> +
>> +	data->primary =
>> +		igt_crtc_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +	data->pipe_crc = igt_pipe_crc_new(data->fd, data->pipe_id,
>> +					  IGT_PIPE_CRC_SOURCE_AUTO);
>> +
>> +	igt_output_set_crtc(data->output, igt_crtc_for_pipe(display, data->pipe_id));
>> +
>> +	data->w = data->mode->hdisplay;
>> +	data->h = data->mode->vdisplay;
>> +}
>> +
>> +static bool igt_crtc_is_free(igt_display_t *display, igt_crtc_t *crtc)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < display->n_outputs; i++)
>> +		if (display->outputs[i].pending_crtc == crtc)
>> +			return false;
>> +
>> +	return true;
>> +}
>> +
>> +/* Returns true if an output supports max bpc property. */
>> +static bool has_max_bpc(igt_output_t *output)
>> +{
>> +	return igt_output_has_prop(output, IGT_CONNECTOR_MAX_BPC) &&
>> +	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>> +}
>> +
>> +
>> +
>> +/* Sets the HDR output metadata prop. */
>> +static void set_hdr_output_metadata(data_t *data,
>> +				    struct hdr_output_metadata const *meta)
>> +{
>> +	igt_output_replace_prop_blob(data->output,
>> +				     IGT_CONNECTOR_HDR_OUTPUT_METADATA, meta,
>> +				     meta ? sizeof(*meta) : 0);
>> +}
>> +
>> +
>> +
>> +static void test_static_toggle(data_t *data, igt_output_t *output,
>> +			       uint32_t flags)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	struct hdr_output_metadata hdr;
>> +	igt_crc_t ref_crc, new_crc;
>> +	igt_crtc_t *crtc;
>> +	igt_fb_t afb;
>> +	int afb_id;
>> +
>> +	for_each_crtc(display, crtc) {
>> +		if (!igt_crtc_connector_valid(crtc, output))
>> +			continue;
>> +
>> +		if (!igt_crtc_is_free(display, crtc))
>> +			continue;
>> +
>> +		prepare_test(data, output, crtc->pipe);
>> +
>> +		/* 10-bit formats are slow, so limit the size. */
>> +		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
>> +		igt_assert(afb_id);
>> +
>> +		draw_hdr_pattern(&afb);
>> +
>> +		igt_hdr_fill_output_metadata_st2084(&hdr);
>> +
>> +		/* Start with no metadata. */
>> +		igt_plane_set_fb(data->primary, &afb);
>> +		igt_plane_set_size(data->primary, data->w, data->h);
>> +		set_hdr_output_metadata(data, NULL);
>> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +		if (is_amdgpu_device(data->fd))
>> +			assert_output_bpc(data, 8);
>> +
>> +		/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
>> +		set_hdr_output_metadata(data, &hdr);
>> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +		if (is_amdgpu_device(data->fd))
>> +			assert_output_bpc(data, 10);
>> +
>> +		/* Verify that the CRC are equal after DPMS or suspend. */
>> +		igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
>> +		test_cycle_flags(data, flags);
>> +		igt_pipe_crc_collect_crc(data->pipe_crc, &new_crc);
>> +
>> +		/* Disable HDR metadata and drop back to 8bpc. We expect a modeset for exiting. */
>> +		set_hdr_output_metadata(data, NULL);
>> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +		if (is_amdgpu_device(data->fd))
>> +			assert_output_bpc(data, 8);
>> +
>> +		igt_assert_crc_equal(&ref_crc, &new_crc);
>> +
>> +		test_fini(data);
>> +		igt_remove_fb(data->fd, &afb);
>> +
>> +		break;
>> +	}
>> +}
>> +
>> +static void test_static_swap(data_t *data, igt_output_t *output,
>> +			     void (*fill_metadata)(struct hdr_output_metadata *),
>> +			     const char *mode_name)
>> +{
>> +	igt_display_t *display = &data->display;
>> +	igt_crtc_t *crtc;
>> +	igt_fb_t afb;
>> +	int afb_id;
>> +	struct hdr_output_metadata hdr;
>> +
>> +	for_each_crtc(display, crtc) {
>> +		if (!igt_crtc_connector_valid(crtc, output))
>> +			continue;
>> +
>> +		if (!igt_crtc_is_free(display, crtc))
>> +			continue;
>> +
>> +		prepare_test(data, output, crtc->pipe);
>> +
>> +		/* 10-bit formats are slow, so limit the size. */
>> +		afb_id = igt_create_fb(data->fd, 512, 512, DRM_FORMAT_XRGB2101010, 0, &afb);
>> +		igt_assert(afb_id);
>> +
>> +		draw_hdr_pattern(&afb);
>> +
>> +		/* Start in the specified HDR mode. */
>> +		igt_plane_set_fb(data->primary, &afb);
>> +		igt_plane_set_size(data->primary, data->w, data->h);
>> +		fill_metadata(&hdr);
>> +		set_hdr_output_metadata(data, &hdr);
>> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +
>> +		igt_info("wait %s!\n", mode_name);
>> +		igt_debug_wait_for_keypress(mode_name);
>> +
>> +		/* Exit HDR mode and enter 8bpc, cleanup. */
>> +		set_hdr_output_metadata(data, NULL);
>> +		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
>> +		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>> +
>> +		test_fini(data);
>> +		igt_remove_fb(data->fd, &afb);
>> +
>> +		break;
>> +	}
>> +}
>> +
>> +/* Returns true if an output supports HDR metadata property. */
>> +static bool has_hdr(igt_output_t *output)
>> +{
>> +	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>> +}
>> +
>> +static void test_hdr(data_t *data, const char *test_name, uint32_t flags,
>> +		    void (*fill_metadata)(struct hdr_output_metadata *),
>> +		    const char *mode_name)
>> +{
>> +	igt_output_t *output;
>> +	int valid_tests = 0;
>> +
>> +	for_each_connected_output(&data->display, output) {
>> +		/* To test HDR, 10 bpc is required, so we need to
>> +		 * set MAX_BPC property to 10bpc prior to setting
>> +		 * HDR metadata property. Therefore, checking.
>> +		 */
>> +		if (!has_max_bpc(output) || !has_hdr(output)) {
>> +			igt_info("%s connector not found with HDR metadata/max_bpc connector property\n", output->name);
>> +			continue;
>> +		}
>> +
>> +		if (!igt_hdr_is_panel_hdr(data->fd, output->id)) {
>> +			igt_info("Panel attached via %s connector is non-HDR\n", output->name);
>> +			continue;
>> +		}
>> +
>> +		igt_info("HDR %s test execution on %s\n", test_name, output->name);
>> +		if (flags & TEST_NONE || flags & TEST_DPMS || flags & TEST_SUSPEND)
>> +			test_static_toggle(data, output, flags);
>> +		if (flags & TEST_SWAP)
>> +			test_static_swap(data, output, fill_metadata, mode_name);
>> +
>> +		valid_tests++;
>> +	}
>> +
>> +	igt_require_f(valid_tests, "No connector found with HDR metadata/max_bpc connector property (or) panel is non-HDR\n");
>> +}
>> +
   The file uses igt_main(), igt_fixture(), igt_subtest(), IGT_TEST_DESCRIPTION(),
   and igt_assert*() -- this is a test, not a tool. IGT tools (e.g., intel_gpu_top,
   amd_hdmi_compliance) typically have a regular main() with argument parsing. If
   this is intentionally a test that requires manual visual confirmation, it should
   go in tests/ (perhaps tests/amdgpu/), not tools/. If it must be a tool, decouple
   it from the test framework.

   Alternatively, if the intent is to keep the igt_main() pattern (as
   amd_hdmi_compliance.c does), then IGT_TEST_DESCRIPTION() is acceptable but the
   patch description should clarify this is a manual-verification test binary placed
   in tools/ because it requires human interaction and shouldn't run in CI.
>> +int igt_main()
>> +{
>> +	data_t data = { 0 };
>> +
>> +	igt_fixture() {
>> +		data.fd = drm_open_driver_master(DRIVER_AMDGPU);
>> +
>> +		kmstest_set_vt_graphics_mode();
>> +
>> +		igt_display_require(&data.display, data.fd);
>> +		igt_require(data.display.is_atomic);
>> +
>> +		igt_display_require_output(&data.display);
>> +	}
>> +
>> +	igt_describe("Tests swapping to SMPTE ST2084 HDR metadata");
>> +	igt_subtest("static-swap-smpte2084")
>> +		test_hdr(&data, "static-swap-smpte2084", TEST_SWAP,
>> +			 igt_hdr_fill_output_metadata_st2084, "smpte2084");
>> +
>> +	igt_describe("Tests swapping to traditional SDR gamma HDR metadata");
>> +	igt_subtest("static-swap-traditional-sdr")
>> +		test_hdr(&data, "static-swap-traditional-sdr", TEST_SWAP,
>> +			 igt_hdr_fill_output_metadata_sdr, "traditional-sdr");
>> +
>> +	igt_fixture() {
>> +		igt_display_fini(&data.display);
>> +	}
>> +}
>> diff --git a/tools/meson.build b/tools/meson.build
>> index 8185ba160..9612acd83 100644
>> --- a/tools/meson.build
>> +++ b/tools/meson.build
>> @@ -104,6 +104,11 @@ executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
>>  	   install_rpath : bindir_rpathdir,
>>  	   install : true)
>>  
>> +executable('amd_hdr_visual', 'amd_hdr_visual.c',
>> +	   dependencies : [tool_deps],
>> +	   install_rpath : bindir_rpathdir,
>> +	   install : true)
>> +
>>  if libudev.found()
>>  	msm_dp_compliance_src = [
>>  		'msm_dp_compliance.c',
>> -- 
>> 2.43.0
>>
