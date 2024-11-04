Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5091D132C0
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 13:20:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D5410E2CE;
	Mon,  4 Nov 2024 13:20:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="x4s45o6n";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA4310E2CE
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 13:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHk8lzSEhNQwrjg9bzAP3TWdrZwSAKcvia5E/uRtqMl7aFE0wJOCNKIhvtuFSeJIiXIaPHo9Sd7EbjNyWRUTksBlsCVVIn8bx4mEs95//oIKQf+Q+i7jIFmuW328THJ/hYH8XHC90GaKXzFGuzw0kzA8dL9sJGltECrBgzp3g2uSnA5Q2J1jMFMlYbXQwwVQviL55mvnQivXqb7Yk5tWUtROPgrY1rNtSOTaQH7hJpSgUi3ivVNM7jdG8SEZamCsG9IoRAVOW1VILxKmuU6CKSJ1Y/wI0jvqzAz50pZbc7MXQJS0H/EVM3G3CQhkF4gxpRH1TcR8Rlj8e2LJjVIEgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TC98BOLaseJr6zIIVONO3mAMit8EcFDSzfYO3YOr2/0=;
 b=wsVminhKzLzWgVcCY5A6an7ZgW8yFDcgRsUV7Dl22jgWQMx97hd7aZMcovSBfbFcFz9QcadaV03sgVKl65KJ+oSYZFCbIJJvEWerbFJHlIKQ9Sez9bPutKvckyKPpw3T/TAYUaP1bnWJeKy4spsbiyf/PTx+Z8uz64Rx5Db5NJLYikXqpNwD9qbmGaxPHt8dHworGipQ9gSnkeHKMcQ1VaBs6gOTvthcdFEiJS94yTcanWPT41ASFP7QEhsgXFUD1mSQOVlwiTJIvxYT/PWvRNvGnybI5vTk7bPoAtC+Zk3Pt+wlhH2urZwk++yfbULj9fwf6iSi1x/+hlrUfiPqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TC98BOLaseJr6zIIVONO3mAMit8EcFDSzfYO3YOr2/0=;
 b=x4s45o6n240blbOIX4CfyR6oAdJSKIjA0/yHYBaZD8QAbe4deX6ysThAOVEjCojQKcnVOHxt/GrZiXAYd+oXYoEBxF4K1dIq3QHwjUOis2cUDUoAKvsafIuG5zllrScvYuh71+C09p2A7qpm1ScnAVkh8Wtq/M2jgyiCecwuIr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5311.namprd12.prod.outlook.com (2603:10b6:5:39f::7) by
 IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.30; Mon, 4 Nov 2024 13:20:46 +0000
Received: from DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b]) by DM4PR12MB5311.namprd12.prod.outlook.com
 ([fe80::a846:49eb:e660:1b5b%4]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 13:20:46 +0000
Message-ID: <b1bbb169-354e-4449-a787-de63bb4d1970@amd.com>
Date: Mon, 4 Nov 2024 08:20:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v2] tests/amdgpu/amd_replay: Add some page flips
 before test start
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo.Siqueira@amd.com, alex.hung@amd.com
References: <20241030151714.2424-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20241030151714.2424-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0406.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:108::22) To DM4PR12MB5311.namprd12.prod.outlook.com
 (2603:10b6:5:39f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5311:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b573258-49a4-4faa-fdad-08dcfcd37daa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?STY5ZnhYRi9JejJqaVJvdVpGOEttcm1oWEFZTXM3c3NpK0ZnVlNUU3QvOHBN?=
 =?utf-8?B?dVBGWmhRMzRUMmVwWWdVUVZPcUcyMzNlcEtBSjg2UTJoaW1xbDU2YjRFS2ta?=
 =?utf-8?B?ZWwyQzZFaERhek1iWWNJVlRMTW5Kbmh0V0Y0cUtKb1VFQzFJQ2FHRzZLeUxE?=
 =?utf-8?B?V25nL1RoeHl6UXI3M1pOeUEwakRSK0dRRVl3NVBrcDJJMnE2cDM4TUVMWEtU?=
 =?utf-8?B?a3JHYlkzdldTUmpkRmM3Q0E3ZG5RY251NTd2YmJkckpYNU5EVjl1Rkx0TjdQ?=
 =?utf-8?B?Q0FndjNvWU11aXJVTjgzeVpEWjZNQit5SmNRUGQrY2x4MlBrVXBBWGVjQkFy?=
 =?utf-8?B?TUZ1cEdVRTlJWThUK281TkYxL244SnVhdlBGVkVDLzM4cFM1SXRlcG9walpD?=
 =?utf-8?B?NzN0U2VObStMckRDZWlwdTdNZU41Y3RWak1xQWpjd0hIbGp3YnZ4UWNuRkNi?=
 =?utf-8?B?Vkw1NDdTbzUreGhGT21ZWklKZ0FPbFJ6eXZMYlVWY1dWTGNsdWhlUW8rdGRj?=
 =?utf-8?B?TDlTdGFNcGowdVJuaEszNWFnNnpzelFrSjh4MEN4TzlQaGx2RXFqa0tHTFAy?=
 =?utf-8?B?NFU5MDM3QkoxYnFRRDBURjd5bW5ndU1YUVJ1ejBvcHJ1RGNwQ0ZHZkE3VmNL?=
 =?utf-8?B?SnBUd1dyTlQyWTl6cnpCSEpBMEtVcmNkZllEM1Ayd1NmN1FxcDF5Qm45ZGgr?=
 =?utf-8?B?dEQ0dGZnUWl1cys5cndLNTJhYis1UlJCMGc2bHBpaFZ6NzhOTzBYdEZUU1Z5?=
 =?utf-8?B?clYvYllGUjh0bkR6ZmZTTkVPV3dhd1JaRGZkQXdpTkhacTZDTWlMbUg5cVgz?=
 =?utf-8?B?YXEreEtZSW5sZzhEWUxaTy90VEYrMGdtaW1RMHZiZlBhVzdBN3BmajFlcldH?=
 =?utf-8?B?SGF1QlV5VlR3MzNGa2V5ZWo2YmpleWRLa1BlWGZPbk9sVmRic1JxSGRKVDJM?=
 =?utf-8?B?OXVENHJDUVZXOHI2Q1pZbzdOOW1iY2Iyd0FqbmlMWGd4VWlJOGhVeklGS096?=
 =?utf-8?B?ZHpLRGllMTBoU25sOGg3ZjMzUHNwTWRtQVNZQ3BrUUwrQnMwZEViUGFMV0VK?=
 =?utf-8?B?dmFoeE9yOG9xajRGYjJvb0kybHlWcWk3MnBhbE5IMnQ1YkNFTFRDL1NzYlZh?=
 =?utf-8?B?akZLNFhrYjhYRlRBeEIyV3E2REZTYURuQ25CcGRlRHlkNjh6Ui9wRzNBU084?=
 =?utf-8?B?WHR3VTJqa1RDT3ltM01lQVVLc0VhL3NWdEVJbllHTU1HdGd4MFY1dkR4Tm1z?=
 =?utf-8?B?WmdkVmFiRUE5d2Q3Z3ZtUTIxN243RUNyR2dwZ3NsamdyVFVSZ2tiTUpBYXQz?=
 =?utf-8?B?M3dsbWtUUVNwRHVSSExxVmx1OVgzcktzOU5UaGZ5K2t6M2VjbTIrWlhGOEdC?=
 =?utf-8?B?RGtCTEtWSHVycUszUzdMeXliR2RtRGp1VXlybkpGMXExL2FWbFRMZmJBZkFn?=
 =?utf-8?B?WldPZ3ZpS1gxUCtPY0RoZ0IzZ0dQa3cxVE1ndmxGSE9GTGFMVEpDQzZDVi9z?=
 =?utf-8?B?WmNDbjlhNHFlV0RtV1lYL2tZK3ptemwxK0NzdmdSeWdIUE0wTkt6TGQ0Vk9F?=
 =?utf-8?B?dDlrQXJHRUFpTXhsWEtvZzl0L3lpSmkvdko3MEpWbU0zZUF2Rk16V2Z5SDdo?=
 =?utf-8?B?V3RleFBLdmVLK1AzaHg2dmlVaFZwMjUvd1hxTlpOTm41d1pvelp4UmdYckZi?=
 =?utf-8?B?WXNwdG83UUpGYVVSVDRQRlVrZENseG5OQWRVVi9RakgvSDA0LzA0UTVCa3Z2?=
 =?utf-8?Q?IncTwqcrjhvlFdDyA74ylkeV3LqcBKrXQr2p76P?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5311.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDRQRWNyd3Qwa1Y0S3NEK1ZLYmhEUmliTkNvTmNKWjdQZXJJbmlrUUQyb1hW?=
 =?utf-8?B?YnhmZnIzZy8wNGR2RXBGVGk2ZElTd2dUaUY1OExLMU8vRnhmTk1SeUdKaUp2?=
 =?utf-8?B?dHdoeWVLampjQ2hhSWxRU1RtbktGRWNNNUZxRmFqb09mR09Odm5WZ0xSR1Jh?=
 =?utf-8?B?WCtBSjZiZXNjSlZuVzRnb3IzcGNJRlpRaVR0dGxMdG56ZDRuQ3pJVDZYamJx?=
 =?utf-8?B?dUFLTjMwTWRGUXFacFVmQmpHbmg2OHRVaWpUbGNKL0lFV0l0RHo5OExiYXRv?=
 =?utf-8?B?MVpRcWdWY29OSzJvT1Vhdm9weVJjd2hXT3ZPU05xTG1GbVhleG5adXl6QTN3?=
 =?utf-8?B?anJjQmJaV21Sc1hxQVZGazM2bUxRdU9oUkYxazZQTjRXaStlZGJaWFFKdUpi?=
 =?utf-8?B?SEkrTnFsbG1Ua3U3akJQU3dEdjIzWHZRQmtDSWJhVWMvYkUzQ1QxZ3hhU1Rt?=
 =?utf-8?B?YjZ4S2d3MmNvbmxBaDRJL3BWNzVsVFoxUENjUUFVc1VSOU1hWFl2VTBBZG92?=
 =?utf-8?B?bVV3RVpxbmVEQzNHQjVyYzR6Rm9hRlZTMlpKTUxMOFdrcTV1Y3VMc09xakNq?=
 =?utf-8?B?cGkvOUo0Rk9kTnhwNmllYUtCem9SY1RleldzRStvRXl3cXFuNW1FaklQT3ln?=
 =?utf-8?B?U0hSYlB2cXZaR0p0UlJUVUorU0lXQk1CcmRNUlV4MyswczFJM2tZVm44NU55?=
 =?utf-8?B?blhFU2xYL0RJd1ZYdzVHMncvbjZGSmtVK0hUVFM2enNmWTluaWdjRzBBaElx?=
 =?utf-8?B?RWdRaEhObU56TkdPWkdKSjZNV0lGUmZuc05IU1NmYVR5MW53enRMV2hVMXZH?=
 =?utf-8?B?Y1dHcWRUM1ZaaWZ1Q2ZhMUdXTjh4N1hsL1ZIQzZxdVlkTUFVZE5WcnF6b3Qr?=
 =?utf-8?B?WFp5dThCelJoM3Z6MjVqbHJDM0cyRFVKVEtLaUhZTmM1anRGVEpENk9OVENl?=
 =?utf-8?B?SXF1SW5UTW4xV2haVXlJbXQxaUJ1T3NCYzd5VkJMODQxU2JaTGJTRlRnblNK?=
 =?utf-8?B?aGNYRkZQdm9MWENRNkI2WjNMRzZXYjE3U2Iyd251aTF2aWxEZ09WL1dGcFNm?=
 =?utf-8?B?VGQvQmdoWHFiY2NIRFU0NnZQcUduaUtMYS8vYTgrUW5IaTlZc2QyZlhZZlZX?=
 =?utf-8?B?em5JanV3SkhXUGE0U1g1WHlpYkFJRnlhc3d2T3kybThiTWoxVW0vZDdxN2dL?=
 =?utf-8?B?SFFMcm9lazhiR05RbFJjWHNJK1Y5cjd6ZCt3eUNIRFBTODJ0UXpUWGxyWlov?=
 =?utf-8?B?TWlUTmlyMkEvR3BFbWh6SDdldU1kaDJtc3BxbHpHVzMvN09sYWNHMy9mMHNl?=
 =?utf-8?B?MGt6SVd0dUdQY0R6R3VtcXFHa1hGSWZtYzNJMmdBckhkeUNTYnBjdCtSL21U?=
 =?utf-8?B?aytkdnlKRDczWkJnUjFPaTA2UXZXRzhYSlF3ZjNybTRwZVAvY1RDVzdqUUhp?=
 =?utf-8?B?NVdXWFMwSzRJUkJQbHNaSHQzQjZmUmI3L1BHbWZpZ2xTYTg0d2dkR2dYSjlU?=
 =?utf-8?B?L2t0K1RVaEhqeDFsTTlBSmJ3Qnc0TmYyamFmdUdpVHRMY1VCV3B5Z1dFMVlK?=
 =?utf-8?B?MFNzMjFwTFZMZFZiTGxadE9MUzdIMWtETnpvNUE5RmYwZlFvQzBHcTZwVUV2?=
 =?utf-8?B?eXNZSlo1aDUwM0wxSEhPa3V6aFJsRWYxbnlCbUJmTk5ld0VlSTdNemxmZEhE?=
 =?utf-8?B?M3pQL3RZNmFVQmNDTUx3Wm82SkhqYkhLMkhCZ2x6Y1NUd0kyaGJIQ1lSS25S?=
 =?utf-8?B?UUVCVW1WRnpBVDhpR0dEWlpjcitGOVBJUjNGZFg3N3VNUlo3V1hXVDFxbFlv?=
 =?utf-8?B?NGp5Rm42U3dDQ0NpMHIwbll0a0J3SWZTZXBtR3lKbGV2QnlvVWJ0TnZ0L255?=
 =?utf-8?B?SmFLM3hYK2NwL3BRTzJHYTBpM0dnU01PVXJHOGVaYUVRbFp4TFF4R0tXN2h2?=
 =?utf-8?B?VGtDc0t3ZlEyWnE3b2JJVmNYd2VFQzlCalFCMjNMdGZWZlNCMlBXQWdwQkRl?=
 =?utf-8?B?T0pHRjVLRnlGUHNYMDNETGc2cnR1TnZwS2txNWRtSkdLbmt4YkFEZEwzWGVw?=
 =?utf-8?B?bERnT1grdVlaNG83OUQ5a2NJT1hQcExiWHRxR05nak1WYXlESDlGckoxRTAv?=
 =?utf-8?Q?LGIA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b573258-49a4-4faa-fdad-08dcfcd37daa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5311.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 13:20:46.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1saey8szhdok3T9lcWk//Pg/F4g/RQi49G0REScDkGbTvJcOeyhlgosVf+vp+5nf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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



On 2024-10-30 11:15, Tom Chung wrote:
> [Why]
> New panel replay driver behavior skip some atomic commits before
> enable the panel replay.
> 
> This is because a kms client needs to submit fb updates via kms
> in order for amdgpu to flush updates to the panel.
> 
> If a client updates the fb without going through kms (by directly
> blitting to it, for example), then any panel self-refresh feature
> needs to be disabled. Therefore, the driver vets the client by
> counting an adequate amount of atomic updates before enabling
> self-refresh features.
> 
> [How]
> Add some page flips before test to let the panel replay can be
> enabled first.
> (This change can be backward compatible with old driver)
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com

> ---
>   v2: Add some more information in the commit messages
> 
>   tests/amdgpu/amd_replay.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
> index b5bb10b34..db2ac2de9 100644
> --- a/tests/amdgpu/amd_replay.c
> +++ b/tests/amdgpu/amd_replay.c
> @@ -14,6 +14,7 @@
>   IGT_TEST_DESCRIPTION("Basic test for enabling Panel Replay for eDP displays");
>   
>   #define REPLAY_SETTLE_DELAY 10
> +#define FLIP_FRAME_BEFORE_TEST 60
>   
>   /* Common test data. */
>   struct test_data {
> @@ -50,6 +51,7 @@ enum test_mode {
>   	TEST_MODE_INTERMITTENT_LIVE,
>   	TEST_MODE_CONSTANT_LIVE,
>   	TEST_MODE_SUSPEND,
> +	TEST_MODE_FLIP_ONLY,
>   	TEST_MODE_COUNT
>   };
>   
> @@ -282,6 +284,9 @@ static void run_check_replay(struct test_data *data, enum test_mode test_mode)
>   			 data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
>   		kmstest_wait_for_pageflip(data->fd);
>   
> +		/* Do some page flips and let the replay enable */
> +		page_flip_test(data, output, TEST_MODE_FLIP_ONLY, FLIP_FRAME_BEFORE_TEST);
> +
>   		/* Panel Replay state takes some time to settle its value on static screen */
>   		sleep(REPLAY_SETTLE_DELAY);
>   
> @@ -366,7 +371,7 @@ static void run_check_replay_suspend(struct test_data *data)
>   		igt_system_suspend_autoresume(SUSPEND_STATE_MEM, SUSPEND_TEST_NONE);
>   
>   		/* Do some page flip and let the replay go into live mode */
> -		page_flip_test(data, output, TEST_MODE_SUSPEND, 10);
> +		page_flip_test(data, output, TEST_MODE_SUSPEND, FLIP_FRAME_BEFORE_TEST);
>   
>   		/* Panel Replay state takes some time to settle its value on static screen */
>   		sleep(REPLAY_SETTLE_DELAY);

