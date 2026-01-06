Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14868CD0429
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 00:54:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB35310E1C5;
	Tue,  6 Jan 2026 00:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gcVwCmqw";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202FD10E1C5
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 00:54:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9PM920X7STnYmsDJ0E9dKGM6mjN0QxKcuQYN2n2+dAtAbo7qG8kSC+bM4Zk8H73ctQT0/Crn6E7CH/eisN3Lc29h6DQL0x+Ythh5J6CFRazSSeJI4/12f8eHrPf876wGgEbRnlM3veg0NUw7C153bI2mZ2+12BhB02nxJ4OdIA4CB6OAbwaSMV5s8YvpigTOrnUmo230VukyTPCO4FvZex3+E1lGTSGjZ4h5zL0WFyi/HiWZdB4OKfCWxSGoMlDq6uiH5+a1PSRfu4PuAnMngISWMEoXga9Z4V0CudrZI15Dgw3yDHlwU3RluBU2m8nNRMrOjs527rAxNOfQMKFog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVAxVkMOvT2fF5ukTJ3Q+AyfrAGAIV7BobOIskH+BPc=;
 b=Mc/6jOOTqkV7jCsABnzwM+QzkoNUY8HDPAx5YIIYelI27m3+tNcq8rHwWH+WqYOQpAuX++l1RV6cUC+nXMeiMXBv96pBcqAYkFhKcmxAGE5QHpdA7NDdxGeHSnPp1tNxxlvnd2I9F+cIVYedKAzZhUAv9F3kNl+1S5kywrVCPKK/wfkr8C8tYygTsNUEG1h48P01w3jxDN2+0AG2Hsa3ejQ1hBkB04DrsLT7LC/OfbrkYwbbVVIbnR2hm7Xa/N4JfdsdnpdRos/DCJn6c1zkp8+5jlbsX/E9q/VCB89XTZiLKZmm3NqtTmM63fc90UWo9Yy70b5TcVgaZlffhKyKvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVAxVkMOvT2fF5ukTJ3Q+AyfrAGAIV7BobOIskH+BPc=;
 b=gcVwCmqwW0ZD80NX/8tGIVMYyYLkqF2G3wh4mLBQHWgNHJwieAoAj87UbndIcfwxWbVIudzpjjddRB3PlaNkG1UwjuwGvlrUM+0ZemzRCHI6wYiltEHebKbaxs84zLRPuCWKsA9BS/GgIMgQiUA9TQTcABV8LVrOfJohh7gYyyk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 00:54:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 00:54:03 +0000
Message-ID: <07d2a581-008a-4a8a-83a7-d90b7b443f65@amd.com>
Date: Mon, 5 Jan 2026 17:54:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v9 2/5] tests/kms_colorop_helper: Add helpers to
 clear colorops data
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
References: <20260105210603.62170-1-swati2.sharma@intel.com>
 <20260105210603.62170-3-swati2.sharma@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260105210603.62170-3-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0311.namprd04.prod.outlook.com
 (2603:10b6:303:82::16) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f0f4818-3c11-458a-56fa-08de4cbe1605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjRRNXUvNm1tS3V3d0JmTVdLQ2x4d1BTOHBOV29uSDZNTVgzcWFXOWp6NWNl?=
 =?utf-8?B?d1cxellOajk2a2J4NTBQQjBCTnBXaW9tR1MwUkRJcmxnNC8xRGdTQkpEL09j?=
 =?utf-8?B?eGVuMjZQMWxpUDk4Y1dWOHBIZEFzdnl5NFFaYkNRSTdwaXptOWp0Zlp5VmNv?=
 =?utf-8?B?RW9vZjFjNHNERnA4djR1aFhIQUJnNS9KNXpHVzY0eks2Nk5PcGtkSDU4b0VH?=
 =?utf-8?B?ckJlRUJkd1hTUUdDU1lHWEdyaFpSQVkwZEd3WXhuWElBeVl5Wm5JcTdGR1dQ?=
 =?utf-8?B?blNwUWNlR0FIeEFxQTFETjJFUHRqazI2empWQk0yS3NNZTVDeGhQUFIzaDQ4?=
 =?utf-8?B?aWMySjFhTXNWMjJIbll4MTlIbHQ4YlVtS1ZPSzYwQnk4aVJBditmVjFpZDhQ?=
 =?utf-8?B?dGhpRXljeWVDbURyRzZrS3hOdnRmV2Z4U1VteEsrRnZOaDVDYVc1eUFnd0pQ?=
 =?utf-8?B?UXRheVZzTEwydGg3SUJUdDZJeXJHNHB0d21BQk93UkVGS01NT29vTHQvWEdM?=
 =?utf-8?B?cktlQ1lEcDFLSWJZbW56b1FvYnRSNDlnWWRQNEZMaVlQeEtrUWlEd2E3eS9m?=
 =?utf-8?B?Q1pTcVh2WmRBTlJvSUY2Q0dYVFJHWUpTMTVxTjZyU2Y0OHdGNEhidm1NUjZm?=
 =?utf-8?B?elZocVB2YVEvYktOdmNmWE4zdDBGd20yUzNjNkR3SENZN1J3cnIvNlNLTFNJ?=
 =?utf-8?B?ZmlvcGhwWmZEVHc3K2dEdzZRcVdzMXVEM0pYWGhVZkdyRy9mMHk2eFBwMVBx?=
 =?utf-8?B?YVFjNjVEME9XRVBrRWxtQ0VHdHJWWXcvNVprZXF0YndkWEs3b3VOUmNsamZK?=
 =?utf-8?B?RjNnYWRhRCtVcnlzSjUyR1J0bFp2OWRMUWJFUGVjTytHb2hpOUtmRy9KTitY?=
 =?utf-8?B?LzVlWm91SjYrYjhZZ3YrVWdIYXhVOTBSQXU0S2tuSzRHMlIzVS9udzhqbTV2?=
 =?utf-8?B?K2o1d0cwbVQ2Ykl4Wkg3VXJjWWhxZkw1VmVTTFZCMnpxTXd1eWdXTnRSWmZp?=
 =?utf-8?B?R1JhTnRqS3QrMFBuY09LeHpTR0RTUlg1R3BnZzFQU1FGVTdCWnZDMEpqVnp1?=
 =?utf-8?B?eHdZTW5xeTk5REN4ZUhmdGZ5L2FYTUNzSTFubTFRSU0xSEpxU1VNTm9HT25w?=
 =?utf-8?B?L1RpbnFvKzZjZ2V6aE8yR1JaR3I3bDI5TFBQSlV2eS9yVkhLL3UyU25jZytM?=
 =?utf-8?B?ZGpLanhodFc4dk4zaGNlU3lzV0RxY0Q0RXJmcWZTQllhdU9HSmZJN3FQSXlE?=
 =?utf-8?B?OVFuS3ZsRWVZT1V5eGlMaDBXVWtTYlNqeHpTZkpiTDZqbzh1QzZnVjUvL1Zy?=
 =?utf-8?B?cTVzQXdLeW9hVXN3Ty82Q09LRG15VDl5ejIwdGlsOWJjemIwUkpoUWdEZDVK?=
 =?utf-8?B?cDhVenRvQVlMVlVpekpZbEpQKzBqVXkvYmc2bHRSQU5vZDFRYmY4dkVwS3FS?=
 =?utf-8?B?YXFLNUJQV2JoOWxCTExrVFBNMnozSjJQVFFZeVd4eGtuR1ZQV29HTGtPQ3RG?=
 =?utf-8?B?Mm9mYlhiS2FMeTc3czBwRVBBM0xadWgzckJ3UDZSRjhpM3FlOWZlSFZtWjFI?=
 =?utf-8?B?bWdFd0FRVVFYbTlvQWpjVXRxUExoOWpkSUZJelZPWEpLU0paUlQvcm9KWHBW?=
 =?utf-8?B?QXNsNWl1TjJpRW1tRVovZmdiSWc1emFqK2ttUVIrdFdyS0VXZklibTVLb2dJ?=
 =?utf-8?B?MzJaNjVQNjdYQytzYU9SWGwydnNaRWI0TFRaY0lNeWFHbG5aWWo3M05VTStK?=
 =?utf-8?B?UEM4Z1ZPUEVvejY5UnFaVGwxZVFUUUpmbitlYXNaN1E3WlNaZjMzNExJcHI1?=
 =?utf-8?B?SWxabnVHOWlNK095Q2JGUHl6MEo5VWphR1dVVWlrb1Z4YklUSjRYNllUWTBY?=
 =?utf-8?B?Y1M1WStXb3gza0lEeHVyNmd2c1dZY1lxUWxUK21hZU1lZ0dZWmxWekh2VVFT?=
 =?utf-8?Q?Du1tYtnFPldKLwO0rBS+Xm3GgsQzgaGz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpINVg1WnYzMGdkakk4cjIzTGxnMWJiVVBkaWhqVUdNQnNKQ084eGJHcFFk?=
 =?utf-8?B?T25XbGdiSCt1aElVMGpobVUyK3RpU0RodXRQVkRsb09XK1lMYW4xTUs2RExu?=
 =?utf-8?B?eGprbGZEWFRMOTFNdkt5TFFPditEb2V5bUJuSVZIRmlPZUpzYm9VS3RoMkk5?=
 =?utf-8?B?SWM0Mllpb3Z0VVZoY3dhWHRtQUdJdFZRYStVYlBtbG5VdmJtd1M3c1d4RkJ3?=
 =?utf-8?B?UGI3aU9CZ3ljdzBPL0xPRklxOHJXd0JwM2lwTHkzV1dTSlBNdDhsc2NUNVN6?=
 =?utf-8?B?N1AxTDVCOEFwZmlpZnV6eDZucTk3UUdrQmt3RTcwT3BFMzdORDdlOXhHSlhD?=
 =?utf-8?B?SVhCblJNYnZ4STBEVjRvN29pdG4yaDlFejBmNkJ4a3UxV3N4VUFGQXpFdHVX?=
 =?utf-8?B?eHJmY040UlZZMkVZNDZKQUQ5UUtxSXZBcXpRT0RvdWdFTFRDc25nTGFwVGk4?=
 =?utf-8?B?RkhkQmJ0Zy9CZHdqZGFhdXRRWmxWVUlkZ3J1TFhrNnZ4OVNCQjJxL1BLaHRO?=
 =?utf-8?B?R3VYNVNqUUxtRm9FWlNMa01RTXNBZzRvc0xvMmlxRkxBMnlhZG9nWVgvTk81?=
 =?utf-8?B?NEhqZlEzakN5N1ZrUnJWZ1VuUkcwV3diR2pDMEJUcWhvUGpIdE83SUVrSDZN?=
 =?utf-8?B?SW81QTZncVpBMUdOQVMxNWhaRTdocEx0OXlJTnZzOTFOSFZIMkRNdk5KLzJS?=
 =?utf-8?B?OGJCQnY3b2MxL1kraU1DTC9XNXRjR3RkWm9jOGpRSUxuTzdMTElxWHUwTFA5?=
 =?utf-8?B?SUFxSmVpanBzRXowNzl4RnBNZHd1VWEyMWNQclgvWU84YUhrTFlZM2h3Ui94?=
 =?utf-8?B?QWkvekxoVzVsM0dCeHg0MVFKVzBIanNVbkVjMFp5VDJNeE5mUkI0UHFteDBy?=
 =?utf-8?B?QUlyamJHckQxekFXODN5dGw2S1VlZUltdDN1UXJBS3JPMUNScFU5WmM4Wkdv?=
 =?utf-8?B?MWtZTHVBb21xRFpyOWRpd0VxQXhCVWh1VTNGTy9ObEtqcVNTbjh0YkY1cGVn?=
 =?utf-8?B?enM1anVqWFd2dFl2a093ZUNZSGJGcGRyb3VPbWtZRmFNNm1PV2VOS2JPK29Z?=
 =?utf-8?B?ZGxCMytpYmZ2dTdnN0ZpVTZTZXBmem1IeXV4bmNCc0VzWjJKYnN6RVJDZzZs?=
 =?utf-8?B?TVVsYkRqZHBOZnBzaWt5UjhzMlprRUh0NVc2RStTKzUyZUhRYmM2cEJsMFlH?=
 =?utf-8?B?Ky9tS0NPWjUzbTAwZDVqVE5yWG9nREs1RlVhTStHYUlxMHdEaWx5K0ZoUTVa?=
 =?utf-8?B?bHNETEo2QVRBMUNmczhRYU52RW40S09EOHlHUU45ZC9XeHl1THRSMHBzY2pu?=
 =?utf-8?B?WTdFYldaSjEvSTUvazhENW40YWtsN3BJT2c0aDVUYUdGeDg3TCtaeXdwK0Mz?=
 =?utf-8?B?c0U2MC80ZHh0QjFCSDJQc01uWVQvMmY1T0hiWGFlN1FzVDZPbnZPMTdJYzFE?=
 =?utf-8?B?N25wZ1N1ZWZwOWErS3dnUGZhQW9zQy9ieWwyMVVLU2diVHk0V2dlOGRWWHZH?=
 =?utf-8?B?SjVQMk56eU9UYW50WCt0dlV4NTV6UmtnYmdJVHRhWnl2QisxU3h4TmY4R3Bi?=
 =?utf-8?B?SkVWNzFzazhFbzdTTkE2cWJRVzJQNnczMXRkS2pOUXRDSFdtVGZibksrSXBO?=
 =?utf-8?B?d1dmS2EzYVowZHBYTWRHWnJsYXN0ckpqZlJDNGY2aFhKVEplYlVTOUhzYWZF?=
 =?utf-8?B?bmhEbDNidVNucmtDRFpLbjE5b3lKaS9PLytpQ2JqOU1DZG9WZStWK2JCdm5Z?=
 =?utf-8?B?MExyNnhvdzcxUis0U2JrMlRRYUY0UEVwbE1oaWFMdW1ndUh5RS9qSWFMdTFu?=
 =?utf-8?B?bmVtL1JSeE5Sd1VaK2lndGNlYTZ0L0k1M29QSG5oK0JWVFFkQ1ZwR3BXNXQw?=
 =?utf-8?B?WTkyMlU5RVMxZi85KzBGcWd3R21leklDbU1ORS85a3dUeW5OQWxMRFRQdVRa?=
 =?utf-8?B?Z3piR2NzVUxsbk91S1ZLYmJRV1ZmdWIxT1Y5SkluT0JwNk84dEx5aXdkNWVi?=
 =?utf-8?B?ZmFiMi90Zm0yNmlTQ3VLOHJONnlUd0hML1o2OFdhSUlLOGhwRjJnaTNTaU8z?=
 =?utf-8?B?Zlo0RXRocmNFWlVkRjA5bnhtNVllRHRKT3lhNFNMeTRxK0Q4QVhjT3hQS0dT?=
 =?utf-8?B?NFRMNkRlZ25JRzRJWHVMOEVaQ0phVGsxQStGZmlDekI1SUVFcDF2L2xYajlj?=
 =?utf-8?B?bXlFdjZOSi9CYWJiVGhBUmJoa1QwRnVmRlF1bXZQNTI5TEEvS0dLa2dMdExq?=
 =?utf-8?B?blJmZjg0T2tuWFBHdmVFaEE4WUtBVFlVcnBRMlBweHR6L3NBL1VTS0dPV1g5?=
 =?utf-8?B?TS9zZVBiUlI0ZFl1VlRFMW8wT1VsaWdvRDdjUEx2Z3VzZFFnd0dQQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0f4818-3c11-458a-56fa-08de4cbe1605
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 00:54:03.1596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PuULdqecq7FyXCZ/k+i6GjQkRa6n+aWGy1HfBjWq75TLD6mI/sPeKjJgLGHyDdio6gxcGjU8ayj7buwH1jiPfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 1/5/26 14:06, Swati Sharma wrote:
> Add new helper function to reset color operations
> to their default/bypass state. These functions:
>   - Set the colorop to bypass mode.
>   - Clear associated data blobs for CTM, LUT1D, LUT3D.
>   - Reset multiplier values where applicable.
> 
> v2: -make internal helper static (Chaitanya)
>      -rename func() to clear_colorops() (Chaitanya)
> v3: -remove unused var (Chaitanya)
>      -rename func name to reset_colorops() (Chaitanya)
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>   tests/kms_colorop_helper.c | 28 ++++++++++++++++++++++++++++
>   tests/kms_colorop_helper.h |  1 +
>   2 files changed, 29 insertions(+)
> 
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 6869590f3..76728b47b 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -400,3 +400,31 @@ void set_color_pipeline_bypass(igt_plane_t *plane)
>   {
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
>   }
> +
> +static void reset_colorop(kms_colorop_t *colorop)
> +{
> +	igt_assert(colorop->colorop);
> +	igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_BYPASS, 1);
> +
> +	switch (colorop->type) {
> +	case KMS_COLOROP_CTM_3X4:
> +	case KMS_COLOROP_CUSTOM_LUT1D:
> +	case KMS_COLOROP_LUT3D:
> +		igt_colorop_replace_prop_blob(colorop->colorop, IGT_COLOROP_DATA, NULL, 0);
> +		break;
> +	case KMS_COLOROP_MULTIPLIER:
> +		igt_colorop_set_prop_value(colorop->colorop, IGT_COLOROP_MULTIPLIER, 1);
> +		break;
> +	case KMS_COLOROP_ENUMERATED_LUT1D:
> +	default:
> +		return;
> +	}
> +}
> +
> +void reset_colorops(kms_colorop_t *colorops[])
> +{
> +	int i;
> +
> +	for(i = 0; colorops[i]; i++)
> +		reset_colorop(colorops[i]);
> +}
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index b807f122d..2ded22c8f 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -102,5 +102,6 @@ void set_color_pipeline(igt_display_t *display,
>   			kms_colorop_t *colorops[],
>   			igt_colorop_t *color_pipeline);
>   void set_color_pipeline_bypass(igt_plane_t *plane);
> +void reset_colorops(kms_colorop_t *colorops[]);
>   
>   #endif /* __KMS_COLOROP_HELPER_H__ */

