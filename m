Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E629C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 15:52:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5144510E0FF;
	Tue, 25 Feb 2025 15:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UsBoAkBX";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99AE10E0FF
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 15:52:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7E19oSS7JOIhkAPQ+Q+mhFjGVQTA9OSyBl5BLhQ12l/bswqD7YW6BNSgSPPivWR/IBbQRb0sflE5xaVhm7L159Bed2jvfcyfRQDgf2iqCbncLCsWTS85sK+vK1Bq+ZoseIBDkCIAsFv4qYIRtDQwh4WmaHvldJA4hgzXe6j63QAZiMJZKxbhxGvp5sp0qlg8CoDxiCAxOP1foM3sdRMK6zQj1eQ4M3ELKM6iMogxc3PHhuAzsVNEW86KITszwPyFHvXGhljnmkHB3g7WbLWYavAgOffc+2k++msJKK3/zcpO9WGuh2EfgUJvBWXlHxxQxpVmzVAxV697I/5amVEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BvQU0hQKl/sz73XfrgedceN2XbHN1TZbEfKLeZOVjII=;
 b=DrYf0wOjjtj69vhalpD5c87e7zBocjN31Iu/xrtVBRl5xGUsbYSaf0K5nyVvS/9BPWVIiWNq8/pxl16/uOCfdWoFBrl1/EeiifKn0e5qZdNd2nG4Xd2Myb1ZI5pFgk+T9Bbo8YlpImS0eAAeSOTIYQBqvHbOyoPInlLi4O49HxI8/TyKxXwuyzXUCZPEEQodMDqt8IBlUqk/jCsAKWn3F7nkHg7EzwEQwJvbBzMGu2HoAc2ES2E0/zBRMOr3vwEeLB84YrTQLXIpbVNcpCzZNTf90JRhVtYzPqcB6OHQCql6IhtFtg3GW5tTKDYwnmUkNVGFsl92nA6WOm+fK5fBnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BvQU0hQKl/sz73XfrgedceN2XbHN1TZbEfKLeZOVjII=;
 b=UsBoAkBXzBSfX+3Z3XvMxUs2lHeutuu9nbNEmxkebVjAOOFrDMW3j2Z7i2FASmmRPjqVOoaoGPL+CW3I9p1NwBzkQqH0OwfspvrGKmMqIl+r9KQRYNay53FQ+wlOu8DM3Pg911uJXQyGFIrhnJsS0d0HSegYlZ9/D6MftHe59BU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB9102.namprd12.prod.outlook.com (2603:10b6:510:2f8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 15:52:01 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8489.018; Tue, 25 Feb 2025
 15:52:00 +0000
Message-ID: <a8fc5cef-5ccf-486d-b401-f587e500746d@amd.com>
Date: Tue, 25 Feb 2025 10:51:56 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] tests/kms_async_flips: Create subtest for overlay
 planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Jeevan B <jeevan.b@intel.com>, kernel-dev@igalia.com,
 "Hung, Alex" <Alex.Hung@amd.com>, Harry Wentland <harry.wentland@amd.com>
References: <20241216202427.76168-1-andrealmeid@igalia.com>
 <20250219103703.2hbadorsyh5ezd3e@kamilkon-desk.igk.intel.com>
 <5b88ea25-c9a6-4025-8f9b-34e1b213e258@amd.com>
 <78c0bb06-fb95-443c-a16c-9478daa11562@igalia.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <78c0bb06-fb95-443c-a16c-9478daa11562@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0243.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::24) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB9102:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bee3048-2ab6-40e4-1675-08dd55b45767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0JiaUppUXNFVElXQmtjOE15MHFJb2tKL2hRaGdoMmRyckFLQmdtZVBvcVlW?=
 =?utf-8?B?RldLTEE5UWpTTWhubkZpVkdxbVgyUXpTb0QyQjhkOTc1TFU5eVA4OSt5bG1X?=
 =?utf-8?B?aklxUWFROWdlcmowendOT2JyZ2Q0WWFLeCs0Z3hkbDNHZ1o1N0RJWFhlSVh0?=
 =?utf-8?B?V1c2QS9Bai9ySFppZjdobGk1VEZqWTMwWEkzNGxZNE00UVluMTFHQm9uLzRZ?=
 =?utf-8?B?MytDcnNkbkVvUEZVWFhaTElGaDAxcktTYzRiZEIyRmRPL3o3SGtzbC93S2U5?=
 =?utf-8?B?cnQvRzQzSTdLKytIdUI2Umx1dXNDMFo4VVVBelVNUlQrcFFZUDU2RUUydTY1?=
 =?utf-8?B?TmpjN1BNbVkraGhRa2Q0V1ZsV0NzM05DSjFWSGk3V3hES2Z5L3EyUU5jWlk4?=
 =?utf-8?B?YUtjMUMra3o1RFNTMkdlOG84L0F6T21JY3hsbVNTMFFCbDVwcFB6MjFWY0ZZ?=
 =?utf-8?B?d0xweERuSnNPYzNaUERDTXdJUFdycmR6bzVlR3VnbTNud2F5WE9WQ29taURU?=
 =?utf-8?B?ZmZzaFhNNnE2dzdESHpnLzJkRzFvZCtjNUNBd0Z3NXAzNHRMUU5CQ1VzZ3Zy?=
 =?utf-8?B?UVo4Nkh3QmFoL3g5R3BvdzdvZk9QRTFJNCtjd3dGQ1ZjdFR2TDBBVHJkSlhr?=
 =?utf-8?B?SUdjRE9SSVR3cDliRTlGeVZpaWxsVkFqbGt1VU00TDFFZmxOWDZZMm05OWRk?=
 =?utf-8?B?anB3QjB2Sk81Sy9OQU55elZ6YkY0YnErWjhTL01YV2dxMzhuMkg4MU1rU3JV?=
 =?utf-8?B?S2cyZWpLdENqMzNha0VhaWN2NzBEU1BpL1FRK005aGtUNGFOakQwWVN1d08v?=
 =?utf-8?B?d3FGcXprNjZwQUJhMHlhaGpPSHplcWUzemFUSjBPeTFyLzJlNXp3Q3RscG5p?=
 =?utf-8?B?eFFhMHlESVNHQUl2V3BlVmNiOGZQRTNPUlRFdlFKSFp5MVowenEyS2Nwak9Z?=
 =?utf-8?B?R3pLU1ZEOFdTK2FhbjNJNVdpZkMvYkZqRVpRVDJvWjNnd2ZYdFUyWGM1NTZ6?=
 =?utf-8?B?YUxuWUt0MVlwN1Iyc2YxR3BZYUN6eUdRaWlGN3BaZEdXSm5KUzlFL3hIcmg5?=
 =?utf-8?B?K0Zic2dMNnBLWE5TaWFhK0J3WmhlYUtqRVlVbS9kYXBXNTBPZkJFOTRUaVhM?=
 =?utf-8?B?MVZ5Qk01VElJUDNwUnBkaGI3ajkyQ0U3Mkl2SGkxUFUzM1AwbzUwZXJrYkg3?=
 =?utf-8?B?S2FLUlMwOUFwcHUyZGxiOWs5SEFZdE11dFlUK01lY29lNEVvMi9GNklLbS94?=
 =?utf-8?B?TVgvZng3TC9ReWl6UlJ0a25XL1N6OE1yYnd6VlM1V1dRRGNNcUdudDVZM3hZ?=
 =?utf-8?B?SHpXRnd0dGp0Yit2b241M3pIL212SlZIYytaVk5udTNnUzliT1VnZFFVYm9n?=
 =?utf-8?B?S3RSUDlKZkhZY1I1dXJhaGVtOVNhd1R0YzhPWjFRN2ltM2g4ekt4K21wciti?=
 =?utf-8?B?TnpvMENaeWlRd3pXbFByK1kwSEg0bkk0bUhBWi9aUzdXQ3VhS2NkWDN3WVNr?=
 =?utf-8?B?aUwwNmNRZnFrejk4QkwwUXlQTWpEL1ZXUCtmZE5HZFl4QzM3ZWsvbHhpZTE2?=
 =?utf-8?B?c0szMnFGWEJpTnFpWkhTdEFGNll3VVlpUlFmTThpNGxEaFRScFprOStyVCtC?=
 =?utf-8?B?OG9NRXB4dDhWQ0J2TjhYNisrdUVCeWh1ME5EajJaTmhRVzNwdEgxS0FQY3c1?=
 =?utf-8?B?WERkQ1VGOTNhZWlxMjRnZ016SmRpZURURG9NTHFIWUd5NkMwRUFITGJVdFFB?=
 =?utf-8?B?M0JzK0hJNWJOc0VES1JVVVBOUk95UlBTc2JFdGdtK0tLb2hxc1NCWCtDQTA0?=
 =?utf-8?B?UG5MTlRNWUw5R3JyVVh3THJXTm8xVDg5ZnJ0VDBrS01IdnNjcjFpRENxVXg1?=
 =?utf-8?Q?myX/cRA1dan7H?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTN2VE50Z21kK1IzWERNZ25iL1JDaHJRZXBRYVo0aVAwVnF1OStWYnBueHV6?=
 =?utf-8?B?bTZrZ2p0MVJYU1ZLSVUxZnNvY3o2eit0R29Cc1NVaThxd2tCc3IyWlljVy94?=
 =?utf-8?B?QVkxVUFwSk5GNHE3YTY1RENCRHhYdXNYWVFNd0lNb2d2OFFsSVdSTFR0V2xT?=
 =?utf-8?B?RVE3Sjk0YmYwb2p6MTR0dm1aNU9wd0JhUG04blMxL0ZPNGs3Mm1vK2hpWUVo?=
 =?utf-8?B?TDdLbFp6LzRDMVcrME9HeCtESE0wRmltalBLb08yUUlxZ1ZmSGsyRTR4TXdx?=
 =?utf-8?B?TG5rNjQxL2M1QTBPTkhVR0VZQkJrbGM5UkhDSzkzT1I3UGRjTW80a2pnNGw3?=
 =?utf-8?B?OTNkT2V1TEJOcmxtZmg1U29jbU5kLzdncEtyMUNqL2JTVVZteTRrODBkNVZV?=
 =?utf-8?B?amxJSmZLeFFZUjJXMnV6WHo1KzBNYlp2QkN2cjZlblJMRm1Dd0xWQzlnVjRz?=
 =?utf-8?B?MDFoN1BSYnZqTXIrelBsQmthUVFid25pOXdPUTdZRnI4blV5bmxDei9ndWJF?=
 =?utf-8?B?S0tEZS9NWmtFSWRFWHo5RHk5SWcveW5zZjFySHc1aS9oa1FoZktURkRqSkZl?=
 =?utf-8?B?UXJzb3JrTzBxNWM4TkF3cm5PWkIvT3hwbzFhaWlnUWhTNjQ4TGVvMjU2L3FF?=
 =?utf-8?B?MmxQMWF0RmJ2TXFZQ2hwKy91UDdHeWRjSDEvNWVqdk9kMnhVQU5KQmJXT1RD?=
 =?utf-8?B?blFmT1ZOcFl3Um10cUJxaVZpay9MRFhzWk1ERHhPVWpJT1hmeWNPb21TR1A4?=
 =?utf-8?B?STZFY1ZVWHlpdkplVGw4Z3UyZHAyMlV4a0x0b0xpWFNySTVZRjR3bW5tUVVn?=
 =?utf-8?B?dDVVT3dIajRoeFh6eTNsSDRMWDRLczZvYXYvb0R5MVdTWU1UV09mRnAzM3Jq?=
 =?utf-8?B?eHJmSG13T1pNKzlybXBOQjZ1dHMrWmNQMjk1Z0xrczJ6Tk1LSGdpTk5RclEz?=
 =?utf-8?B?RE5BMC9jK1lMdU05S3M1ay9NQWRWcmxQSG14elB6cm1tY0F0WmM3U3ZBQXZ2?=
 =?utf-8?B?VllZOE5DYVpUUURqS1pBZDR1SXNEb2UrMWdybDN1S2FvSGJQbDZ6WVMyaW1n?=
 =?utf-8?B?RENPS053T0tldUp0VDliazBxTUVyaXlTTk9Xd3lRSGNLdm1ZL3J1SFgyaDJt?=
 =?utf-8?B?ZmZsM0tZL1k2akJrVzRMcEhKQnRxQVo0aGxRTXlNLytlWWo5aWV0YUpud2pT?=
 =?utf-8?B?ODRQWWJXbnpFS1dUUWpJSFR3MGIxajlxZHRoM1BuVFBETVpSMU52NktJRXU5?=
 =?utf-8?B?V0FLS0V3ekJEWDIrRDA5UGV0TmhEMUdkcUhWUTUzQTFUZHVaQVc4aHNPOFJZ?=
 =?utf-8?B?SzlQRnYra3Y1UkRIN0NnSE5tUGtWODg2bGkybndpQmlONFNhV21aaGRvajBl?=
 =?utf-8?B?TTlkajg0dUJEclN4YTk1dmN4TjV3R3lrVm5OWS9nWGR5QVlqVDRCQUdldmhk?=
 =?utf-8?B?RDhLMUpvbUM5SFVnR2xxTGtWVkRMeWVwaW81OC9DeWRYNk9McGgwazJOREM4?=
 =?utf-8?B?YXQ1WlBUbkM3WmM3cjdBYk9sWjlFbHRNaGZEdW0vN1ZtZ0NvYkljYm9DZ0Rz?=
 =?utf-8?B?RDRESHg2WGlsdnJKNEpUTDJxNk5WU25Db0ZKZTlhWmhrSEpkUUNOayswYXkz?=
 =?utf-8?B?SUpKM3g5WXduUGlyQVlkOU9Fa1RVVlZBYmxZZHZDanF5OUJsVUlKRExtalZ6?=
 =?utf-8?B?NkNlcjNqQmd2dDQwV0RqeSt2YkhrV3lmQ1YyUFJ6cGlsZHdITnQwZzVMMGpP?=
 =?utf-8?B?UWR1eDgxQ0ZMeThUV0I3ZWpBdGZ0WE1CSFBuaks0QWtENjRKcTlCT0JaZGRs?=
 =?utf-8?B?L3k2N3F6ejVrbTRPWnVEMW95VXFmc0pWS2NFcEhlNDJENnpISENzYWh2Nm9n?=
 =?utf-8?B?SEV1dVhNSGsySlp0VXdVaVZuTHFLUXZNS3R3dWZYQmMvclliSU50WFpFQXda?=
 =?utf-8?B?U0oxR2NSV0dzeFMvWXRPR3B1QlJSQjdWV0k4NGJuT29SNGx3VHY5MU9LejB4?=
 =?utf-8?B?QlFiSU81bjZFOEo3MFJuam5IQmtsS2NIaG9qV2Z6V0Yza0dHN2JvemlZcXMv?=
 =?utf-8?B?cnQvc1hIUTVYd3dSRVlEenh6UzV4eWsxUnVhdzlqVkFNUG0yc3A1enB2bUxn?=
 =?utf-8?Q?eGX6TtHUHhTOHzt+GT0O7snVk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bee3048-2ab6-40e4-1675-08dd55b45767
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 15:52:00.6962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: liLGLQDOvtX7fBYvr49gW2gHdyvx6eZZH0nLQ0ySUBVm9SPWX5IyTvi0SyGcasNSVCp241rcow7WP+5jC513Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9102
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

Hi Andre,

Apologies for the delay.

On 2025-02-25 10:42, André Almeida wrote:
> Hey Vitaly,
>
> Em 19/02/2025 15:06, vitaly prosyak escreveu:
>> Added Harry and Alex
>>
>> Hi Kamll
>>
>> Thanks for the letting us know.
>>
>> On 2025-02-19 05:37, Kamil Konieczny wrote:
>>> Hi André,
>>> On 2024-12-16 at 17:24:27 -0300, André Almeida wrote:
>>>> amdgpu can perform async flips in overlay planes as well, so create a
>>>> test for that.
>>>>
>>> Vitaly could you find someone from AMD who could help with
>>> review and testing? Thanks!
>> Alex,
>>
>> Can you help with DAL CI to run this patch ?
>> Thanks in advance
>>
> Did you managed to get this running in the CI?
I currently don't have access to DAL CI.

I've reached out to Alex again via Teams and will keep you updated.

Thanks, Vitaly

>
> Thanks!
>
>> Vitaly
>>
>>> Please add to Cc Vitaly from AMD:
>>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>>>
>>> Also add Jeevan here:
>>> Cc: Jeevan B <jeevan.b@intel.com>
>>>
>>> Regards,
>>> Kamil
>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>> ---
>>>> v2: Add test description for GitLab compilation
>>>> ---
>>>>   tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++----
>>>>   1 file changed, 41 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>>>> index 4a72be7b5..dd0907d50 100644
>>>> --- a/tests/kms_async_flips.c
>>>> +++ b/tests/kms_async_flips.c
>>>> @@ -89,6 +89,9 @@
>>>>    *
>>>>    * SUBTEST: async-flip-suspend-resume
>>>>    * Description: Verify the async flip functionality with suspend and resume cycle
>>>> + *
>>>> + * SUBTEST: overlay-atomic
>>>> + * Description: Verify overlay planes with async flips in atomic API
>>>>    */
>>>>   
>>>>   #define CURSOR_POS 128
>>>> @@ -109,12 +112,14 @@ typedef struct {
>>>>   	uint32_t crtc_id;
>>>>   	uint32_t refresh_rate;
>>>>   	struct igt_fb bufs[NUM_FBS];
>>>> +	struct igt_fb bufs_overlay[NUM_FBS];
>>>>   	igt_display_t display;
>>>>   	igt_output_t *output;
>>>>   	unsigned long flip_timestamp_us;
>>>>   	double flip_interval;
>>>>   	uint64_t modifier;
>>>>   	igt_plane_t *plane;
>>>> +	igt_plane_t *overlay_plane;
>>>>   	igt_pipe_crc_t *pipe_crc;
>>>>   	igt_crc_t ref_crc;
>>>>   	int flip_count;
>>>> @@ -126,6 +131,7 @@ typedef struct {
>>>>   	bool allow_fail;
>>>>   	struct buf_ops *bops;
>>>>   	bool atomic_path;
>>>> +	bool overlay_path;
>>>>   } data_t;
>>>>   
>>>>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>>>> @@ -226,6 +232,8 @@ static void test_init(data_t *data)
>>>>   	igt_output_set_pipe(data->output, data->pipe);
>>>>   
>>>>   	data->plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_PRIMARY);
>>>> +	if (data->overlay_path)
>>>> +		data->overlay_plane = igt_output_get_plane_type(data->output, DRM_PLANE_TYPE_OVERLAY);
>>>>   }
>>>>   
>>>>   static void test_init_fbs(data_t *data)
>>>> @@ -246,16 +254,27 @@ static void test_init_fbs(data_t *data)
>>>>   		prev_modifier = data->modifier;
>>>>   
>>>>   		if (data->bufs[0].fb_id) {
>>>> -			for (i = 0; i < NUM_FBS; i++)
>>>> +			for (i = 0; i < NUM_FBS; i++) {
>>>>   				igt_remove_fb(data->drm_fd, &data->bufs[i]);
>>>> +				if (data->overlay_path)
>>>> +					igt_remove_fb(data->drm_fd, &data->bufs_overlay[i]);
>>>> +			}
>>>>   		}
>>>>   
>>>> -		for (i = 0; i < NUM_FBS; i++)
>>>> +		for (i = 0; i < NUM_FBS; i++) {
>>>>   			make_fb(data, &data->bufs[i], width, height, i);
>>>> +			if (data->overlay_path)
>>>> +				make_fb(data, &data->bufs_overlay[i], width, height, i);
>>>> +		}
>>>>   	}
>>>>   
>>>>   	igt_plane_set_fb(data->plane, &data->bufs[0]);
>>>>   	igt_plane_set_size(data->plane, width, height);
>>>> +
>>>> +	if (data->overlay_path) {
>>>> +		igt_plane_set_fb(data->overlay_plane, &data->bufs[0]);
>>>> +		igt_plane_set_size(data->overlay_plane, width, height);
>>>> +	}
>>>>   }
>>>>   
>>>>   static bool async_flip_needs_extra_frame(data_t *data)
>>>> @@ -283,12 +302,17 @@ static bool async_flip_needs_extra_frame(data_t *data)
>>>>   static int perform_flip(data_t *data, int frame, int flags)
>>>>   {
>>>>   	int ret;
>>>> +	igt_plane_t *plane;
>>>> +	struct igt_fb *bufs;
>>>> +
>>>> +	plane = data->overlay_path ? data->overlay_plane : data->plane;
>>>> +	bufs = data->overlay_path ? data->bufs_overlay : data->bufs;
>>>>   
>>>>   	if (!data->atomic_path) {
>>>>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>>>> -				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>>>> +				     bufs[frame % NUM_FBS].fb_id, flags, data);
>>>>   	} else {
>>>> -		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
>>>> +		igt_plane_set_fb(plane, &data->bufs[frame % NUM_FBS]);
>>>>   		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>>>>   	}
>>>>   
>>>> @@ -772,6 +796,7 @@ igt_main
>>>>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>>>>   			data.alternate_sync_async = false;
>>>>   			data.atomic_path = false;
>>>> +			data.overlay_path = false;
>>>>   			if (is_intel_device(data.drm_fd))
>>>>   				run_test_with_modifiers(&data, test_async_flip);
>>>>   			else
>>>> @@ -783,6 +808,7 @@ igt_main
>>>>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>>>>   			data.alternate_sync_async = false;
>>>>   			data.atomic_path = true;
>>>> +			data.overlay_path = false;
>>>>   			if (is_intel_device(data.drm_fd))
>>>>   				run_test_with_modifiers(&data, test_async_flip);
>>>>   			else
>>>> @@ -793,6 +819,7 @@ igt_main
>>>>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>>>   			data.alternate_sync_async = true;
>>>>   			data.atomic_path = false;
>>>> +			data.overlay_path = false;
>>>>   			run_test(&data, test_async_flip);
>>>>   		}
>>>>   
>>>> @@ -800,7 +827,17 @@ igt_main
>>>>   		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>>>>   			data.alternate_sync_async = true;
>>>>   			data.atomic_path = true;
>>>> +			data.overlay_path = false;
>>>> +			run_test(&data, test_async_flip);
>>>> +		}
>>>> +
>>>> +		igt_describe("Verify overlay planes with async flips in atomic API");
>>>> +		igt_subtest_with_dynamic("overlay-atomic") {
>>>> +			igt_require(is_amdgpu_device(data.drm_fd));
>>>> +			data.atomic_path = true;
>>>> +			data.overlay_path = true;
>>>>   			run_test(&data, test_async_flip);
>>>> +			data.overlay_path = false;
>>>>   		}
>>>>   
>>>>   		igt_describe("Verify that the async flip timestamp does not "
>>>> -- 
>>>> 2.47.1
>>>>
