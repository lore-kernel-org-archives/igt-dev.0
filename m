Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE88D74945
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 22:17:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7019B10E3B5;
	Tue, 29 Oct 2024 22:17:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZPgW/myZ";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A15BD10E3B5
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 22:17:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GEm0/9SCSxepnY1X/aGzxEi01aN9iJQlihDpRdytnk1K7uHC1iqHTpd3t07woSVMvqzhct/Vyi5VGUWkGZWg6dBjV477Ok6pxnd8a57BsGkb5QLsAyYkdqB7YxvtWQrjlZf58UFHANLXWXb9XMp3k+JYBQoqPGZPKXsACieWdhSbyBhjU2C2h+9O4txAMzkCaLlYzo9ZPqZhjhcQZdbjVkoNGzekKguaZuw4ux4rRCJuImJUYzwoxg9wPzGqeHlF8nEqU9RkfQn/Ay1SgVczrACSnULEmQS/5VtBRIrosGKOFABu46BuBrC806fQ5en1bbFE8m2A2jlTQMEJsOSB9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Tt5EMpr9Z3lLMEl7Y4vQpRUItf36Q+jSr7tBuvgm9Q=;
 b=RkmBm+kFQcTTelQSFHWfPIbiDrMKvXDiuJip3EYu8ve5HoPjCXBQDT+jz6JQ+E9NasK/rAEvhTwt1mK9Heqeh309y8VLE+0Rq+czwDGUCAqyz5lVZE/9PAPIOK/51/1qNfw0Z/3pelRxx2kfijlOplcAvKyZL9v99EE1b8RWWyI7ZUBOq/cwWg9htS/vWwdJNG/2toRE+QJ+lOz7E7DeB8dAPwi3pwUXDOZ8WdJbB13gwAk0Y6LP5YMZggONVSvwtzFMYSmjNaT7AZv9tbTDfdt+FNmY1/sprE1rCwgVrafvSJO7ASt9c3IBtQT0GsNKp0+Sl13nBGe8BN/zPIeEIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Tt5EMpr9Z3lLMEl7Y4vQpRUItf36Q+jSr7tBuvgm9Q=;
 b=ZPgW/myZCLmsYH6Fh2B3z9TqetmvApuzDZNChURtbyKi3dFeghD0ERVoyUznwQ6KmDVc32w+XK5GofJ/2fw6nQn2Irh9rJNZaYqq3W78oMu+o85IlM/dHnoTGPpFFLWs2s5m9w1ZgWykhvWnX3NlYtA3w70S3vrF3DAvEMlVLj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by CH2PR12MB4312.namprd12.prod.outlook.com (2603:10b6:610:af::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 22:17:06 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%4]) with mapi id 15.20.8093.021; Tue, 29 Oct 2024
 22:17:06 +0000
Message-ID: <95e646ef-8d86-4bda-8a88-b473aa219400@amd.com>
Date: Tue, 29 Oct 2024 16:17:02 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3][V2] tools/amd_hdmi_compliance: Additional
 functionalities
Content-Language: en-US
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
Cc: harry.wentland@amd.com, mark.broadworth@amd.com, sunpeng.li@amd.com
References: <20241029170349.1388428-1-alex.hung@amd.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241029170349.1388428-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::11) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|CH2PR12MB4312:EE_
X-MS-Office365-Filtering-Correlation-Id: b69b64bf-f08d-424a-93bf-08dcf8676c12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3UyZXRQcFZxSTRGUW9pVUhwNFRXR3ZTVGxudG5WY2RRTTQzL25hK3lTcnEr?=
 =?utf-8?B?bW03WWRtam9SNzZqZ1k0WXovQ1F4QmJMRHJVODBpTWFWa0wvMC9RZ0FFZDJ2?=
 =?utf-8?B?eW5XclNpNVpjdUFsU2xwckt6QXdLaHFKU2xjVzBxak1tdDJPelRyS0pKOUpH?=
 =?utf-8?B?NHJFVko3MHNzZVRRMmNEemRDeGZtR0ZwSlZHbE9aVnVObnYwMkVQREYwQmtu?=
 =?utf-8?B?SkJObGNSUjVMUXp0d2s3MWlnYUtkcG1uTVNKMGtOOFZubWJuWStQV1RWZC9C?=
 =?utf-8?B?RVhSWmhXTW5qVzhKRWtqUlU1RFJXMEVwYUdadlUrdTZQZzRWaXZkRng2Y3ZP?=
 =?utf-8?B?QmIzT0VMYXIzb0JxanNJSTNONHNzcDd5eTFyN3p6ckovWEhWTHR5TkxWTjRk?=
 =?utf-8?B?NVZka2NiTk9SWnptQlNVOFhIMHVINTQrQTk1L2Eyc1ZXM1FDQjh4Nm1MWlFl?=
 =?utf-8?B?UE5YangvbnVoRkFTdTVzVG5kcmxGTFp3SGY4MFQwb3J6WEwzcUdUb0hGaU9o?=
 =?utf-8?B?SFgrNkt2TjJvTXFyYTlxSjgxQ3FNSFYvQnUvWUQ2OWN1MmEzSlZhYnZHbWVp?=
 =?utf-8?B?T2xkWkQxOGc1b3VMekFFRXd0dGFqVER4OXJ5bHF2S1dSbVlSb0tJQmx6bmo1?=
 =?utf-8?B?NkVMcG1ONUZTbEtTUG9IbDR5TFNuZEhBNllDQXBOYlVIbFlnTHF2T3Y5WWpx?=
 =?utf-8?B?aWZmdnErOWgzRTNFcEpCTE96WnBSaGpSK3NzZlgwK1B3UEdMcVBmM3VnVWxV?=
 =?utf-8?B?TmRJbTkzcEprZk8rc3E1YkJlZEpLakd6QVFuMFU4OE50dmpyWk4xZmV0R0Fp?=
 =?utf-8?B?SkZzclVZYkNiWlVHb3MrUVJGeUc3VVVFbDQzMEV6dlJ1L3FJZEdJaW40VnV6?=
 =?utf-8?B?OEJnYnBnYThLOEFpRHMvaGNmdzR1a1M5NzhGTUo2Wm5hcHhGUWM1WmhWUG5v?=
 =?utf-8?B?dWNNRDhaUStBRGExRW1ESk1RSVloK04rUVRTR1FDa242UWM1YW44TlNMYllH?=
 =?utf-8?B?dEVLRWRQdmNSZG0xM1RsdlhwS3N5eUpUZnJwdm5FVlFoa2RYanFtOWk1aFVK?=
 =?utf-8?B?ZkV4NDB2eU9ZeUczTVJTMXhZY3hLZ2o0R2NuUkRROTVDNTJYOU9OV1pnSFlG?=
 =?utf-8?B?TXFQSUlzWi9WY0w3TTM5WnFVdDkvUm40Z0VxMC9uNitLeXV6bVBFSGlGNlBE?=
 =?utf-8?B?K0hOL3pQOHRXTGJVQnRDbzJaNWVQMGs3RDMxRHNNWW1URGZPRzVnd2kyT3E0?=
 =?utf-8?B?d25JT3pPaWx4N0hjbWRXVkJ2cWdwQTRSL0daQkREcWcvTmNkMmRnNGN5aUd6?=
 =?utf-8?B?SHVJdEhvZWtZVHo3eUlPanFJbjEvcUNFL2I0L2pQSzd2aGN1cFV6b2hnV25M?=
 =?utf-8?B?TWlnOEk0SDQwUk1QQzl5N2NQdXlXMklDTUF2WnFvQWUxMUduWmI2UHlxVVVl?=
 =?utf-8?B?eExJdWZmWFplbU1HeWRGSlF1b2k4N0ErQ1p1ZjZEREtsTENOV2o1dUFUUkpq?=
 =?utf-8?B?Zjg5aDZtcGVuNEVScHdua2d2UUcxWG1UR1U0TjJWR041d2ZEWTVSWW41a1V2?=
 =?utf-8?B?MVlXcjRCV3pDVnJYN0hVRk1TMCt1RFp1d3E1N1NQeUg2TzVGSDFtWVh0cm5k?=
 =?utf-8?B?NlhEV3BKdWxjdTlDN3VrRDIzT2U2ZGgyOG9wQ0tpQ09kZ2NPaVREWTJQRzlH?=
 =?utf-8?B?dDZiS2pmak9pRm50ZHp3Q1RTVGk5ODVWSWN6V0ZOV3FSbTZhNlRIRGhvRTEz?=
 =?utf-8?Q?K6sLdu+dtEwYS1A+8FgWTZmGZxl+UIqakHsifLR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFlndjlXR3UySGRiN1IwSi8rQWRia2prc0dxU3N3VWZnbjdOWlVQRDZObVpk?=
 =?utf-8?B?eXg1WlBOYXlXS1FsYUJoeDg3c29Ta0Z3WXRVcjVtMGNhMlhZNlBFRXJhcjZn?=
 =?utf-8?B?amdTMEdReHgwOTd3SUJqMzVTYnRmMXk2SlIvbExPSHFLOGdXR3MzVG1YdE1y?=
 =?utf-8?B?T2VDdXA0N1pXRXJQQ3dpNzhZL3A2cXd2eDV1dkp1WUE5THJOeW1ORUE1d3NL?=
 =?utf-8?B?WXZjaGlEdzhVNDR2cVgvcTAxdGpLaDBmU2RvUE5GU0lGS1VUWTBiSVpRcHlr?=
 =?utf-8?B?NzZRQzVkdWdoeFZZNlAxWURkU2dlRUlyK0NXTkhySnMwWklhOXY5UjIzNnhQ?=
 =?utf-8?B?aHNRRjJmMUVnZDFTSTFESlF0WGMzY2lZZ0E2STBkbldNZ2piOXZSMW53MU5K?=
 =?utf-8?B?c0dSYytxM3N4eWhBQ2dTYU1FcVg1bzBYaXNNb0pmUFNDMktJZkFPV29BMEd0?=
 =?utf-8?B?d0ljb3NRS1doemxid0d6cGRaY05qL28yaDZOdmZmbHBXRmVCc21FNWVZd2FC?=
 =?utf-8?B?N29zcURoTzc5Z0UyMEZFaFB6NmxlSm5zUS9oekVobCttQ3dRSWR0VjlMcGdN?=
 =?utf-8?B?ajkvZ2Y5M293QTJ4eVIwZDZTVFBGV0IyRHN1dFM3bHV6VDN5amdoWkV6UzNS?=
 =?utf-8?B?NGJCSnVTU056NVdySXE3ZGluNEZqM2hZbFBJYzF0VGwrN3FrYjRINWNDcTRM?=
 =?utf-8?B?MVpwMFRKd1MvY0luTy9oYXFJbmxJZ1ltY21LWTB0RUNHcVNrQ2JEVkpMMFNV?=
 =?utf-8?B?UTRrOHBTUVVEclhoTFJtcXdCZlVxL1h0OGNyejNNYkhlbzd4TzZOeDB4MEdS?=
 =?utf-8?B?cXp4WUUxSmtIRTNQSGNXeklXUTAyWTFlZmVucGlUV0ZDNWhvNkgySkYvOHpU?=
 =?utf-8?B?RHJTYVBKMktLZ2NTYngxWFFLU0dGdzV2ai9XWEJCUWR4cTIrU3ZqNWM5RDBl?=
 =?utf-8?B?ZE1zWEFFNTJVeG9TbHZBdmhCUGZ3TlZVajFkL09PMnhjSVJPQVFDcFErYk1U?=
 =?utf-8?B?V25PNE1CeXdsNS9ndVVyNjJYMXVaa3F1TnRiTXlMS1FyRDNXb3dQS042dzJx?=
 =?utf-8?B?TVZFYXBqY3JTRUNHZjFicVE0dmcxcFBaK2xCZzdKa0tld29ia0pUYU5HRmJB?=
 =?utf-8?B?U1l0UHVheC8wODhTYXVsb0lXN3BwamM2RG05c0ZERnd4ajgwVjkyamN0QUxk?=
 =?utf-8?B?Y2k5UTQ2UFp4Z1Z5WkZ5Qys2ZHFSUXc0d3E5ZjVwK1B2akZvU1VRRUZyWUF1?=
 =?utf-8?B?RXhMbmE0aGJqN0JRUXo5UzQ3azRvWVAvUEJZTFZuL1VPckJvd2U4SG5XZHdr?=
 =?utf-8?B?SDg1Y0lreHlxa0o1VXRsTXFYN05qUTVGc21pdUh6MDM4SHBXK1R2NUorZmUx?=
 =?utf-8?B?dml1aW52Tjl1VzZsNVl0UkJnM1V3VDRRcU1oNGFndDV6K09LTjRiV3VtaUNH?=
 =?utf-8?B?bG1jQXB5SEE0NHNrcVQxdTYza0YwTlpSNFhqeFE1a0ZnK0xSbHRWbmt0MWVT?=
 =?utf-8?B?aFAxc21MZXBSbkRhMlZQVGxWRzJpdkVnQU5UZnJ2cFBpYys0RVdVeHVNdEQ0?=
 =?utf-8?B?bGpyeldWSE5ERXh6dEE5TXdTUzNMalg5TmdnRXJzYXdIbjlYUGJ2QkJkWnlV?=
 =?utf-8?B?UzNCWG5RcGNqWWpLVHNZU0sxS0dXS24vNWdJZmEyMEZ1eUpqV2dPRW0zbm9Z?=
 =?utf-8?B?T0llcUF0ZXNSWWNkbUVTaG1tS056OCtUS2krTUx3SS8wKzRQUkJQYjlXNlJX?=
 =?utf-8?B?dzErbHFCT1lCT3RRWCtCemppK2EyNktJclRUQTFseTBBSktIYlpEc1pWVVlv?=
 =?utf-8?B?TVZtZkl2bDRjQlAwVWlSOVBuUFhGZmFUVXB6bDJjZUIxVDUxZm50WTZhVUlM?=
 =?utf-8?B?NFdHcXUzVk9NUFB5OEtLYWh0czhRVEtmbkNIMUs0YmFPM1JKeU1TeHE0MjJW?=
 =?utf-8?B?Z2dhd0l3TjN4RE10RzU5U0hnZXNwOUgxcVE3RTY1VzBvbDJTN2V0dFVuaUkz?=
 =?utf-8?B?OVVrcUpIS00vam5qMUZjV1hkazJOc0hLTUQvcVJ3TzNGeGJIM1BOYVJLUkI5?=
 =?utf-8?B?K29wOWpRSVZuTS9oOUpQS3J4TVhlYnpObDVpdmxUWlprdm9EcXVtdGVYSWVZ?=
 =?utf-8?Q?Eeq/tBYpxtS5ILUFKhZI7BeqC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b69b64bf-f08d-424a-93bf-08dcf8676c12
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 22:17:05.9766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aqAMFqpjGL0Qbrp2oOxDEPM/bWRozQ3IYtijkLnFFmMXYdFbyWBhBM/OMVv+/mYcp5hoDoTTWDNGCZVrXHy+0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4312
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



On 10/29/24 11:03 AM, Alex Hung wrote:
> From: Wayne Lin <Wayne.Lin@amd.com>
> 
> It needs different timings, pixel format and color depth combination
> to pass CTS under different HDMI versions. As the result, we extend
> this to:
> 
> - Add additional timings and info. Especially aspect ratio which
>    will impact the VIC code.
> - Can specify the connector to display the test pattern.
> - Set connector property "max bpc" to force bpc.
> - Set connector debugfs entry "force_yuv420_output" to enable
>    using yuv420 pixel format.
> 
> Signed-off-by: Wayne Lin <wayne.lin@amd.com>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 432 ++++++++++++++++++++++++++++++++----
>   1 file changed, 390 insertions(+), 42 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index 1a7592995..d80ebeba7 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -21,6 +21,8 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_sysfs.h"
> +#include <fcntl.h>
>   
>   /* Common test data */
>   typedef struct data {
> @@ -36,52 +38,340 @@ typedef struct data {
>   
>   /* Video modes indexed by VIC */
>   static drmModeModeInfo test_modes[] = {
> -	[1] = { 25175,
> +	[0] = { 25175,
>   		640, 656, 752, 800, 0,
>   		480, 489, 492, 525, 0,
> -		60, 0xa, 0x40,
> -		"640x480",	/* VIC 1 */
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "640x480",	/* VIC 0 */
> +	},
> +	[1] = { 25175,
> +		640, 656, 752, 800, 0,
> +		480, 490, 492, 525, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "640x480",	/* VIC 1 */
> +	},
> +	[2] = { 27000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x480",	/* VIC 2 */
> +	},
> +	[3] = { 27000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x480",	/* VIC 3 */
> +	},
> +	[4] = { 74250,
> +		1280, 1390, 1430, 1650, 0,
> +		720, 725, 730, 750, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 4 */
> +	},
> +	[16] = { 148500,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 16 */
> +	},
> +	[17] = { 27000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x576",	/* VIC 17 */
> +	},
> +	[18] = { 27000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x576",	/* VIC 18 */
> +	},
> +	[19] = { 74250,
> +		1280, 1720, 1760, 1980, 0,
> +		720, 725, 730, 750, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 19 */
> +	},
> +	[31] = { 148500,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 31 */
> +	},
> +	[63] = { 297000,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 63 */
> +	},
> +	[64] = { 297000,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 64 */
> +	},
> +	[65] = { 59400,
> +		1280, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 65 */
> +	},
> +	[66] = { 74250,
> +		1280, 3700, 3740, 3960, 0,
> +		720, 725, 730, 750, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 66 */
> +	},
> +	[67] = { 74250,
> +		1280, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 67 */
> +	},
> +	[68] = { 74250,
> +		1280, 1720, 1760, 1980, 0,
> +		720, 725, 730, 750, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 68 */
> +	},
> +	[69] = { 74250,
> +		1280, 1390, 1430, 1650, 0,
> +		720, 725, 730, 750, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 69 */
> +	},
> +	[70] = { 148500,
> +		1280, 1720, 1760, 1980, 0,
> +		720, 725, 730, 750, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 70 */
> +	},
> +	[71] = { 148500,
> +		1280, 1390, 1430, 1650, 0,
> +		720, 725, 730, 750, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1280x720",	/* VIC 71 */
> +	},
> +	[72] = { 74250,
> +		1920, 2558, 2602, 2750, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 72 */
> +	},
> +	[73] = { 74250,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 74 */
> +	},
> +	[74] = { 74250,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 74 */
> +	},
> +	[75] = { 148500,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 75 */
> +	},
> +	[76] = { 148500,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 76 */
> +	},
> +	[77] = { 297000,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 77 */
> +	},
> +	[78] = { 297000,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1920x1080",	/* VIC 78 */
> +	},
> +	[79] = { 59400,
> +		1680, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 79 */
> +	},
> +	[80] = { 59400,
> +		1680, 2908, 2948, 3168, 0,
> +		720, 725, 730, 750, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 80 */
> +	},
> +	[81] = { 59400,
> +		1680, 2380, 2420, 2640, 0,
> +		720, 725, 730, 750, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 81 */
> +	},
> +	[82] = { 82500,
> +		1680, 1940, 1980, 2200, 0,
> +		720, 725, 730, 750, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 82 */
> +	},
> +	[83] = { 99000,
> +		1680, 1940, 1980, 2200, 0,
> +		720, 725, 730, 750, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 83 */
> +	},
> +	[84] = { 165000,
> +		1680, 1740, 1780, 2000, 0,
> +		720, 725, 730, 825, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 84 */
> +	},
> +	[85] = { 198000,
> +		1680, 1740, 1780, 2000, 0,
> +		720, 725, 730, 825, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "1680x720",	/* VIC 85 */
> +	},
> +	[86] = { 99000,
> +		2560, 3558, 3602, 3750, 0,
> +		1080, 1084, 1089, 1100, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 86 */
> +	},
> +	[87] = { 90000,
> +		2560, 3008, 3052, 3200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 87 */
> +	},
> +	[88] = { 118800,
> +		2560, 3328, 3372, 3520, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 88 */
> +	},
> +	[89] = { 185625,
> +		2560, 3108, 3152, 3300, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 89 */
> +	},
> +	[90] = { 198000,
> +		2560, 2808, 2852, 3000, 0,
> +		1080, 1084, 1089, 1100, 0,
> +		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 90 */
> +	},
> +	[91] = { 371250,
> +		2560, 2778, 2822, 2970, 0,
> +		1080, 1084, 1089, 1250, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 91 */
> +	},
> +	[92] = { 495000,
> +		2560, 3108, 3152, 3300, 0,
> +		1080, 1084, 1089, 1250, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		0x40, "2560x1080",	/* VIC 92 */
> +	},
> +	[93] = { 297000,
> +		3840, 5116, 5204, 5500, 0,
> +		2160, 2168, 2178, 2250, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "4096x2160",	/* VIC 93 */
> +	},
> +	[94] = { 297000,
> +		3840, 4896, 4984, 5280, 0,
> +		2160, 2168, 2178, 2250, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "3840x2160",	/* VIC 94 */
> +	},
> +	[95] = { 297000,
> +		3840, 4016, 4104, 4400, 0,
> +		2160, 2168, 2178, 2250, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "3840x2160",	/* VIC 95 */
>   	},
>   	[96] = { 594000,
>   		 3840, 4896, 4984, 5280, 0,
>   		 2160, 2168, 2178, 2250, 0,
> -		 50, 0x5|DRM_MODE_FLAG_PIC_AR_16_9, 0x40,
> -		 "3840x2160",	/* VIC 96 */
> +		 50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		 0x40, "3840x2160",	/* VIC 96 */
>   	},
>   	[97] = { 594000,
>   		 3840, 4016, 4104, 4400, 0,
>   		 2160, 2168, 2178, 2250, 0,
> -		 60, 0x5|DRM_MODE_FLAG_PIC_AR_16_9, 0x40,
> -		 "3840x2160",	/* VIC 97 */
> +		 60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		 0x40, "3840x2160",	/* VIC 97 */
> +	},
> +	[98] = { 297000,
> +		 4096, 5116, 5204, 5500, 0,
> +		 2160, 2168, 2178, 2250, 0,
> +		 24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		 0x40, "4096x2160",	/* VIC 98 */
> +	},
> +	[99] = { 297000,
> +		 4096, 5064, 5152, 5280, 0,
> +		 2160, 2168, 2178, 2250, 0,
> +		 25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		 0x40, "4096x2160",	/* VIC 99 */
> +	},
> +	[100] = { 297000,
> +		 4096, 4184, 4272, 4400, 0,
> +		 2160, 2168, 2178, 2250, 0,
> +		 30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		 0x40, "4096x2160",	/* VIC 100 */
>   	},
>   	[101] = { 594000,
>   		  4096, 5064, 5152, 5280, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  50, 0x5|DRM_MODE_FLAG_PIC_AR_256_135, 0x40,
> -		  "4096x2160",	/* VIC 101 */
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "4096x2160",	/* VIC 101 */
>   	},
>   	[102] = { 594000,
>   		  4096, 4184, 4272, 4400, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  60, 0x5|DRM_MODE_FLAG_PIC_AR_256_135, 0x40,
> -		  "4096x2160",	/* VIC 102 */
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "4096x2160",	/* VIC 102 */
> +	},
> +	[103] = { 297000,
> +		  3840, 5116, 5204, 5500, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "4096x2160",	/* VIC 103 */
> +	},
> +	[104] = { 297000,
> +		  3840, 4896, 4984, 5280, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 104 */
> +	},
> +	[105] = { 297000,
> +		  3840, 4016, 4104, 4400, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 105 */
>   	},
>   	[106] = { 594000,
>   		  3840, 4896, 4984, 5280, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  50, 0x5|DRM_MODE_FLAG_PIC_AR_64_27, 0x40,
> -		  "3840x2160",	/* VIC 106 */
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 106 */
>   	},
>   	[107] = { 594000,
>   		  3840, 4016, 4104, 4400, 0,
>   		  2160, 2168, 2178, 2250, 0,
> -		  60, 0x5|DRM_MODE_FLAG_PIC_AR_64_27, 0x40,
> -		  "3840x2160",	/* VIC 107 */
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 107 */
>   	},
>   };
>   
>   /* Common test setup. */
> -static void test_init(data_t *data)
> +static void test_init(data_t *data, int conn_id)
>   {
>   	igt_display_t *display = &data->display;
>   
> @@ -90,19 +380,22 @@ static void test_init(data_t *data)
>   
>   	igt_display_reset(display);
>   
> -	/* find a connected HDMI output */
> +	/* find a connected output */
>   	data->output = NULL;
>   	for (int i=0; i < data->display.n_outputs; ++i) {
> -		drmModeConnector *connector = data->display.outputs[i].config.connector;
> -		if (connector->connection == DRM_MODE_CONNECTED &&
> -				(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
> -				 (data->use_virtual_connector &&
> -				  connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL))) {
> +		drmModeConnector *conn = data->display.outputs[i].config.connector;
> +
> +		if ((data->use_virtual_connector &&
> +		     conn->connector_type == DRM_MODE_CONNECTOR_VIRTUAL) ||
> +		    (conn->connector_type == DRM_MODE_CONNECTOR_HDMIA &&
> +		     conn->connection == DRM_MODE_CONNECTED &&
> +		     (conn_id == 0 || conn->connector_id == conn_id))) {
>   			data->output = &data->display.outputs[i];
> +			break;
>   		}
>   	}
>   
> -	igt_require(data->output);
> +	igt_require_f(data->output, "No valid connectors found\n");
>   
>   	data->primary =
>   		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
> @@ -123,22 +416,57 @@ static void wait_for_keypress(void)
>   		;
>   }
>   
> -static void test_vic_mode(data_t *data, int vic)
> +/* Write 0 or 1 to debugfs entry "force_yuv420_output" of connector */
> +static void set_force_yuv420(data_t *data, int force, int conn_id)
> +{
> +	int fd, res;
> +
> +	test_init(data, conn_id);
> +
> +	igt_info("Setting force_yuv420_output to %d on connector id %d\n",
> +		 force ? 1 : 0, data->output->config.connector->connector_id);
> +
> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
> +	res = igt_sysfs_write(fd, "force_yuv420_output", force ? "1" : "0", 2);
> +	igt_require(res > 0);
> +
> +	close(fd);
> +	test_fini(data);
> +}
> +
> +/* Set "max bpc" property of connector */
> +static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
> +{
> +	igt_display_t *display = &data->display;
> +
> +	test_init(data, conn_id);
> +
> +	igt_info("Setting max bpc to %d on connector id %d\n",
> +		 max_bpc, data->output->config.connector->connector_id);
> +	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
> +	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
> +	test_fini(data);
> +}
> +
> +/* Override video mode with specified VIC. */
> +static void test_vic_mode(data_t *data, int vic, int conn_id)
>   {
>   	igt_display_t *display = &data->display;
>   	drmModeModeInfo *mode;
>   	igt_fb_t afb;
>   
> -	test_init(data);
> +	test_init(data, conn_id);
>   
>   	mode = &test_modes[vic];
>   
> +	igt_info("Setting mode %s on connector id %d\n",
> +		 mode->name, data->output->config.connector->connector_id);
>   	igt_output_override_mode(data->output, mode);
> -
>   	igt_create_pattern_fb(data->fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888, 0, &afb);
> -
>   	igt_plane_set_fb(data->primary, &afb);
> -
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
>   	igt_info("Press [Enter] to finish\n");
> @@ -147,20 +475,27 @@ static void test_vic_mode(data_t *data, int vic)
>   	test_fini(data);
>   }
>   
> -const char *optstr = "hvt:";
> +const char *optstr = "hvt:i:b:y:";
>   static void usage(const char *name)
>   {
> -	igt_info("Usage: %s [options]\n", name);
> -	igt_info("-h      Show help\n");
> -	igt_info("-t vic  Select video mode based on VIC\n");
> -	igt_info("-v      Test on 'Virtual' connector as well, for debugging.\n");
> +	igt_info("Usage: %s options\n", name);
> +	igt_info("-h		Show help\n");
> +	igt_info("-t vic	Select video mode based on VIC\n");
> +	igt_info("-v		Test on 'Virtual' connector as well, for debugging.\n");
> +	igt_info("-i conn_id	Use connector by ID\n");
> +	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
> +	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
> +	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
>   }
>   
>   int main(int argc, char **argv)
>   {
>   	data_t data;
>   	int c;
> -	int vic = 1; /* default to VIC 1 (640x480) */
> +	int vic = 0;
> +	int conn_id = 0;
> +	int max_bpc = 0;
> +	int force_yuv_420 = -1;
>   
>   	memset(&data, 0, sizeof(data));
>   
> @@ -169,9 +504,18 @@ int main(int argc, char **argv)
>   		case 't':
>   			vic = atoi(optarg);
>   			break;
> +		case 'i':
> +			conn_id = atoi(optarg);
> +			break;
>   		case 'v':
>   			data.use_virtual_connector = true;
>   			break;
> +		case 'b':
> +			max_bpc = atoi(optarg);
> +			break;
> +		case 'y':
> +			force_yuv_420 = atoi(optarg);
> +			break;
>   		default:
>   		case 'h':
>   			usage(argv[0]);
> @@ -179,13 +523,6 @@ int main(int argc, char **argv)
>   		}
>   	}
>   
> -	if (vic < 1 ||
> -		vic > ARRAY_SIZE(test_modes) ||
> -		!test_modes[vic].name[0]) {
> -		igt_warn("VIC %d is not supported\n", vic);
> -		exit(EXIT_FAILURE);
> -	}
> -
>   	data.fd = drm_open_driver_master(DRIVER_ANY);
>   	kmstest_set_vt_graphics_mode();
>   
> @@ -193,7 +530,18 @@ int main(int argc, char **argv)
>   	igt_require(data.display.is_atomic);
>   	igt_display_require_output(&data.display);
>   
> -	test_vic_mode(&data, vic);
> +	if (force_yuv_420 >= 0)
> +		set_force_yuv420(&data, force_yuv_420, conn_id);
> +
> +	if (max_bpc)
> +		set_max_bpc(&data, max_bpc, conn_id);
> +
> +	if (vic >= 0) {
> +		if (vic > ARRAY_SIZE(test_modes) || !test_modes[vic].name[0])
> +			igt_warn("VIC %d is not supported\n", vic);
> +		else
> +			test_vic_mode(&data, vic, conn_id);
> +	}
>   
>   	igt_display_fini(&data.display);
>   }

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

