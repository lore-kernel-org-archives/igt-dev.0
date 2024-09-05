Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC2FCE7A9D
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 20:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302F710E083;
	Thu,  5 Sep 2024 20:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4aWQhGAX";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0697910E083
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 20:45:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nfy45alSc5NAIbMyvYwGS1HyQv87hSdP9Uhen6nqa66sV7wqCxE7Y2tzRFJxKtx9dET5QIABZK39BsufGTtkZ9YrnZxRYcQ+yImUgyfwdzTUEBLFSZh3vcn613YG1yYWUAgEfPf3nq8R7Z1iCvLGIG4yzNVVK+HADZkd9aKUjDIYvKRp3P4dT6KPRIgN5iZzihfGZmGMrZTRCIPayY8PyaEBHHrtOGADhJe95Mu9v8ds7yZUyb76QGHCNRuJBa/4SYMvf+YjUbwnsBxGbhMlkiGvnPCZsetjJ3K3GNvpUUayzKrq1Per4O6y9DVstoPyTsDCpnEYmZJo3fLthj/E1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6fOs73qeRQH+8zpGH9X45VT9NESsyf7DuZfBnXmJ94=;
 b=rh9l1Gu4YqnlGp/rDOqg0Fz13iEUZGl1FDCh85fghqWfDrOZJn/Fzb68NLpgsY//jn/M7X5jNIXiHlCDdDa2KyhPtWPBqMZwlBfpSvPfLYKWv70KAW8+z9WfdKAefemgtTxyHnp/oITRtYClNC8wrcg0kfcXzinGjBaAeRce8LCG2QJkeh6VMq13NE/i+X3zixaFPvT/sf1P4UOkppQ8DwIuauAxNfVqG+mvotfL6BNbdFHaUD8mAG3VuBD4XqD+rysMUt5NxcIEuDJD/7LV9mlE7RrSfkvxt6BWcB0hkJwSc2Egg/XH1X4Oeiu9qjM4jOF+Kkly9E1rlbYFG6Ypvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t6fOs73qeRQH+8zpGH9X45VT9NESsyf7DuZfBnXmJ94=;
 b=4aWQhGAXhKCzySfnBgwzpr+Zvv5dSfXCPbyEq5RceW3S0dnVIS9TKdJHjyIrgSnsTuoxlGUhUDkz33//7/wWiVukpUKDpzJRtUgSvJwIzqJfn/2N+CJFyhVlHVe9rElQazx/pu6hJN3WDtrynu0Vy9lpixPtrOpinJEcJ9TUGYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA1PR12MB8520.namprd12.prod.outlook.com (2603:10b6:208:44d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Thu, 5 Sep
 2024 20:45:03 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 20:45:03 +0000
Message-ID: <daa91358-f95d-4807-a028-116da526c667@amd.com>
Date: Thu, 5 Sep 2024 16:45:00 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: fix concurrent queue test issue
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20240905082027.1052054-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20240905082027.1052054-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0193.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ad::25) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA1PR12MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 575ad797-7bb9-4d0b-cf88-08dccdeb9dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y3FFZXdiMDRmMVFPUzd1RStVVEEvMUZOM3BYZHFxUkg2WkhLeDZkNXJRNGVW?=
 =?utf-8?B?bXpkZkl2emVLT3AvMmpkUXVyd1Y4RDhqa3pmSThkWGpoNHZma0puQ0dSQTVL?=
 =?utf-8?B?NEJlMUJmU2tvUHFWVW9uOU83bU9uTUVLRGpTNjVMMHpkcGR4YUJXcUgwUGZZ?=
 =?utf-8?B?V0F6cURtKzlJSlpxQ0VGQ3FjMFR1TkViU2wzLzJEZXpjMjdTUGEzdndHTTFu?=
 =?utf-8?B?d2RtTytoVmt2U0JLUTNBd3crOHN5ZGl4Z1ZaM1c4RlFoS0pIMXVRSDgrZUcr?=
 =?utf-8?B?WXNuZGZZSzZGR2dUNVprdDE4V0tmU0hLVHlEbmhYM21TalQ2U3J5aW5WUkJa?=
 =?utf-8?B?ZFp2MHBOalNrZHYzOURxZnhLZnQ4NWJaUG9SWHo3SHNWREpaa2Z6RjAyMW1q?=
 =?utf-8?B?WitsRnFGbnNHbEZLdTRKL1hMUm1zNmFPZGRxbVhqaWRJd0U2Q05xTE4zZFN3?=
 =?utf-8?B?ZFpydE80Y3BXekJxQVZFdkFLWTNyUmVQTU53d1pwY3lGWFdkZVpyaDZuWTBl?=
 =?utf-8?B?eGxrZlJVNDdUTWFhZEdXR0ZWQ1ppNW4xaVZJdlA5Ylh1eDN6U0ovOFhrTWww?=
 =?utf-8?B?cXB2cTY2TDNjc0JUZDhOK2hLOWMvYzhIeXJXc05tbEpBcjk5TUgrR2dBcTMy?=
 =?utf-8?B?TWU3S2N2cWN5eUZMTW9hLzduWWNjdFpRenZoMkJoeDJBTVVaRXVlOWhaTnlB?=
 =?utf-8?B?QlAwcXZIOGdON1BXSUIveGNvZ2FQVEZ2WjZOcFR0UHJNamVGZXoyODVPUHhh?=
 =?utf-8?B?WG9vMmMyUkMzQ2NBTEg3M2RocG1RT2ZzZ2NCbmZBdUF6UVg4T1dvRk1Lamwv?=
 =?utf-8?B?RW9xOXpuWUlTaU1UdWg1S3pnY0l2cGxXKzIrTXRMTzlOTVhZNFRicHJBUzhJ?=
 =?utf-8?B?ZXFyM1doS1FGSjlOa0Npa2kyS3RnaFVVVEdlNzFDT0VIaUs1SzBSSTIvcDJD?=
 =?utf-8?B?cVJNZDY1SG90SkVZaGNBbXoyL1R1NnN1blpwVHBNSXN4aUNLd21KbFpnNmZl?=
 =?utf-8?B?cUU3YUZpNEx4MEwyTjVTZWhkZDlpQ3VTemVpdlovanhwcXR6Z0ZrMXNRaGFo?=
 =?utf-8?B?QlgyWmdsYUJRWWlxOVpsemhUUkhBTnNTUU5nNVdyT0w4dm5jRDB3cDlFSmJt?=
 =?utf-8?B?MGJ4V1B4QlM5YnF3TUxJM2FybXlKS1pnNGhLQWZCbFkvTEo0eVlZZzJEMkVa?=
 =?utf-8?B?VHdQY0NmVWI4eHkzYVFXSHFqRlMyZlVGMVFkUFZkQmtGNFB0Snhzbml3Q2lZ?=
 =?utf-8?B?b21mRkYyNndQQTV5TnZIS3pjQk83NUlkdHVnM2g1dmI2NGpObWVubFRjZm5r?=
 =?utf-8?B?cnloMXFKMWNoMy9XZHZITlB1RWJkK2VMY1dEL1JhRWFSUVdoWUdWZjVPVVg2?=
 =?utf-8?B?QThocGNGLzRXb3hKZVJYR3FXMHBGb0ZoUXRtc0xldXRCRzM3djFnbm9oZklD?=
 =?utf-8?B?ekV1WkQ2b0pWL0ZteWlNQWlXU2pHUjJ2NFo4WVpsT1R5YWpOVm9RMm4vMlo3?=
 =?utf-8?B?MXRoTVFVOWwwV0REK0Ywa0JuSDJhMWhkdHc0WklvV25GM2FOQlJ1NmZaaUxQ?=
 =?utf-8?B?M3ZyZm4zVlZzRXlBeEN3cmsrSk1oVVV3ckg2Z3lyRUtxZHd6YWhUOFV4aVRp?=
 =?utf-8?B?WEYzc0dNWS91ZnVsWUlxWDZGVFNQeHNMYTYyZ01YOEEwYVh3emxBbjJ0SGt3?=
 =?utf-8?B?WmFWa083VG9wSEZ3Z3BZRUJyT0FQQ1B6RllvN0hEOUh6ejZaR2s3a1RCeHd3?=
 =?utf-8?B?YmJqbFZQVlZDMDQ4SzUrSFF1cnNkYXFuRjF6aUVONzd0NlNDRnJIWW8yVVMw?=
 =?utf-8?B?Y2xVZkUyYmdaamtLWGFYdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnFlekpwMnAvWktvRDhIRVphMExRNDNqcVJaNGk5L2Z2WU1GMU1iekQxeUFU?=
 =?utf-8?B?K29qSXpTVytoZ0Z5VW93R09XbG1kdUN4eUtTbjhDTUhRbVN0Nk1Jb0Q4eEY0?=
 =?utf-8?B?Tk1mcnQyNWtYL2poTm5xSDlZZ1Vvb3crdVJQQkdUUkl1U3FGY2ZoR2NRWkdu?=
 =?utf-8?B?cXlDZHVtT25sd1ZlcVVDVXdvMmQwc2hFMlh3TmsrTDU2ZmVVUE5HR3hSWkUx?=
 =?utf-8?B?V09tNG1aeDNKNzlSRU5paDBUaXlhdHRqaFlwRnhVaEFyQjBNZ0VMUFh0NU5D?=
 =?utf-8?B?dmp1a0F3QVpJSjZUalJtby9NakE2SDhNWTJPRU9KTHNwa0kzL2N5c2tWaXFJ?=
 =?utf-8?B?SXZydUhTazdyMVFyZWZpQWc1UDJyblhWNEFCbktQQ0xwaTkwUHAzT1JCaG5D?=
 =?utf-8?B?dno5S0k1eHM2b3h2N1Jwbi9LNUlYOVB4aTF6eVNxeEVYUTFWSXpqTG9vY3dS?=
 =?utf-8?B?cnBTS0Q3T083bHpCQklLTld2aFpabzRwTnRaWDd2NlJ2cm4wcjlQUHQvU2hn?=
 =?utf-8?B?bm5acEtCRjg1WnJNRk9RNmJmbmNzOFVBNDk4TXJvak9oZ2ExVHRrYTdLa2tw?=
 =?utf-8?B?emJyNTE3TVZyL2gyZDUxUjRlY1lJcTBGMnZqNGpXYUswMEUxcUhoTDJ1V3ZM?=
 =?utf-8?B?OWVRZlV0emo3Y3BOQkpBd2JPRXRwTkVoMitFWk9pS2EzZTA0UUt1eGlUcEhS?=
 =?utf-8?B?U0gwaW5lMmUvM3hyQ3FGRzRaRkRtanRlcmNqRXUzTmJRZm95UWRNZ3FadHZi?=
 =?utf-8?B?dFppYUhUZk9CZENxcnRFQ0FXRFJHcGZpSWlGNGt0YUxkcDVwSlQwaEN4OHVV?=
 =?utf-8?B?TGlMTStrOU1rVjJKQWRkeWlLcVFYMnJ6clRDM2xSVExXODFzWHpOZEJTanRr?=
 =?utf-8?B?Y3BzZHRJYS8xMDRSYVArcDZCUlA3RUZlb29NV2Nhb0haWlFEL2c0WVl6RkJk?=
 =?utf-8?B?OXZjUkoxSDIvV3J4ZzJNWmNhQ0F1bU91ejRla2IwVFZ0L2xuRjhIVEZzWGE1?=
 =?utf-8?B?RUY2dG52VTBJZC9PTXFmNEV1WVVIOGY3eHh3WDN0d2I4N0poM3RVK1YxUVlQ?=
 =?utf-8?B?aURzZjRnL2JMN1MyWk9VenN6UWlBb0padGVybmNQczJ5VElFc0JQL1RjRTRs?=
 =?utf-8?B?a1IzNGw2TGE0WXNQblFKbjJFSGIvVTEwQjJZK0w0L1JvbzljQjN4ZHgrZGxH?=
 =?utf-8?B?dUNudEhQSjNxSENtWHNhbkFLdnJwc3N1YXNLZDE4TThyeGlCbWJjZXFpV2pV?=
 =?utf-8?B?QVphYmt0NWpGcHo2QzA2NHpCenduVU83MnA4cU5nL05lbXR5UnZNSmJieE43?=
 =?utf-8?B?MmRNK2s3QXd2cDFzY3ZrVzNHcmp1eGtpWFlYanVJR1ZJcXNIMmd1aHgvNk02?=
 =?utf-8?B?SXA0TGNTcXA2WEVyaVJ2Y1RkU0VUa3NxN1lNUitKVHNKa1grWHgzR0Rzei9C?=
 =?utf-8?B?N1BGbHRLeHlzamNKamtkeW56TkV3WFRFZ0UvWHpZUTJPYy9VYnFOYlB0R1ls?=
 =?utf-8?B?SVI5MmszMzh6eVNLV0wzbjh1bGVNQmVHeE85QVlhTkdyUzdDUmc2Ky90Q3hO?=
 =?utf-8?B?b3JCTndCcmFjTFJ5RXg5OG5DWGNTMWI5RGovSyszOHVFc0tteDNvM3A3UFlZ?=
 =?utf-8?B?VkY5RTEvYUV3VmhHQjdobzNRVzh0OWp2ampvYk9tMEt3V0lnMFZuUm5yK1Za?=
 =?utf-8?B?LzRLWmsxVDNYdFlHdnRYWU85WFNZODZNNXo4Y2t1T0U2MkdpN3ZENE1jaENY?=
 =?utf-8?B?Ly95NzNkSEVTV2FvV1RWMzNhQ3ZHS2NJVmJFRElOWVZtWlMxcmh6aTFpMTRM?=
 =?utf-8?B?QnptZ1NSNHVGT2pUUDR0Nm1MWWNrS2M1MUlrUWJUcC9aSGM2Vy9BbFBDTVJr?=
 =?utf-8?B?YmNCOE9GMHBvNlc2cE1DZjdyRmpKanl5emxURjJENVZlQnhMYVdnMURnWHFo?=
 =?utf-8?B?YVJyMzE2by9hR0l0S0pTTDkzNHZWUURWajV5QjV5RnE1MzFQa3l1bndpSHZr?=
 =?utf-8?B?OE5qUzlhdCtkV0tOQ0ZFbEovVTBHODJSd2d4ME5rQTdNUWZmYUVBZXJNTU4z?=
 =?utf-8?B?OWxhNTc4cXdwWjdXTmM0N3lzVlZYeXZQc1M5TWsrVGNQYUdtcjZITWhTMFMr?=
 =?utf-8?Q?uJcBeCKwYbTx/VQk0O45Kp2NG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575ad797-7bb9-4d0b-cf88-08dccdeb9dcf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 20:45:03.1014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHYMrL6vmUf4t7oGsTbOE5Tf6wT0fbkAehdfHTR/fWoAKIjONce75waPnqPZTBK/1/uytWweRCT3NywRGj48JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8520
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

The change looks good to me

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-09-05 04:20, Jesse.zhang@amd.com wrote:
> When running with parameter --device on multiple cards simultaneously.
> All queue test processes will share "/queue_reset_shm",which will create conflicts.
> such as:
> sudo ./tests/amdgpu/amd_queue_reset --device drm:/dev/dri/card0
> sudo ./tests/amdgpu/amd_queue_reset --device drm:/dev/dri/card1
>
> To solve this problem. It should open a unique shared memory for different devices.
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  tests/amdgpu/amd_queue_reset.c | 44 +++++++++++++++++++++++++++-------
>  1 file changed, 35 insertions(+), 9 deletions(-)
>
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index b257ec3c0..4b26b86dc 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -32,7 +32,6 @@
>  
>  #define SHARED_CHILD_DESCRIPTOR 3
>  
> -#define SHARED_MEM_NAME  "/queue_reset_shm"
>  #define TEST_TIMEOUT 100 //100 seconds
>  
>  enum  process_type {
> @@ -349,7 +348,7 @@ static void set_next_test_to_skip(struct shmbuf *sh_mem)
>  }
>  
>  static int
> -shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
> +shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap, char shm_name[256])
>  {
>  	int ret = 0;
>  
> @@ -363,20 +362,20 @@ shared_mem_destroy(struct shmbuf *shmp, int shm_fd, bool unmap)
>  	if (shm_fd > 0)
>  		close(shm_fd);
>  
> -	shm_unlink(SHARED_MEM_NAME);
> +	shm_unlink(shm_name);
>  
>  	return ret;
>  }
>  
>  static int
> -shared_mem_create(struct shmbuf **ppbuf)
> +shared_mem_create(struct shmbuf **ppbuf, char shm_name[256])
>  {
>  	int shm_fd = -1;
>  	struct shmbuf *shmp = NULL;
>  	bool unmap = false;
>  
>  	// Create a shared memory object
> -	shm_fd = shm_open(SHARED_MEM_NAME, O_CREAT | O_RDWR, 0666);
> +	shm_fd = shm_open(shm_name, O_CREAT | O_RDWR, 0666);
>  	if (shm_fd == -1)
>  		goto error;
>  
> @@ -414,7 +413,7 @@ shared_mem_create(struct shmbuf **ppbuf)
>  	return shm_fd;
>  
>  error:
> -	shared_mem_destroy(shmp,  shm_fd,  unmap);
> +	shared_mem_destroy(shmp,  shm_fd,  unmap, shm_name);
>  	return shm_fd;
>  }
>  
> @@ -877,6 +876,29 @@ is_run_subtest_parameter_found(int argc, char **argv)
>  	return ret;
>  }
>  
> +#define ONDEVICE	"--device"
> +static int
> +is_run_device_parameter_found(int argc, char **argv)
> +{
> +	int i;
> +	int res = 0;
> +	char *p = NULL;
> +
> +	for (i = 1; i < argc; i++) {
> +		if (strcmp(ONDEVICE, argv[i]) == 0) {
> +			/* Get the sum for a specific device as a unique identifier */
> +			p = argv[i+1];
> +			while(*p){
> +			  res += *p;
> +			  p++;
> +			}
> +			break;
> +		}
> +	}
> +
> +	return res;
> +}
> +
>  
>  static bool
>  add_background_parameter(int *pargc, char **argv)
> @@ -1057,6 +1079,7 @@ igt_main
>  	struct shmbuf *sh_mem = NULL;
>  
>  	int r;
> +	char shm_name[256] = {0};
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	unsigned int ring_id_good;
>  	unsigned int ring_id_bad;
> @@ -1116,8 +1139,11 @@ igt_main
>  			const_num_of_tests = 1;
>  		else
>  			const_num_of_tests =  get_num_of_tests(&arr_err[0], &ip_tests[0], ARRAY_SIZE(ip_tests));
> -		fd = drm_open_driver(DRIVER_AMDGPU);
>  
> +		r = is_run_device_parameter_found(argc, argv);
> +		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
>  		err = amdgpu_device_initialize(fd, &major, &minor, &device);
>  		igt_require(err == 0);
>  
> @@ -1137,7 +1163,7 @@ igt_main
>  
>  		if (!is_background_parameter_found(argc, argv)) {
>  			add_background_parameter(&argc, argv);
> -			fd_shm = shared_mem_create(&sh_mem);
> +			fd_shm = shared_mem_create(&sh_mem, shm_name);
>  			igt_require(fd_shm != -1);
>  			launch_background_process(argc, argv, path, &pid_background, fd_shm);
>  			process = PROCESS_TEST;
> @@ -1190,7 +1216,7 @@ igt_main
>  		free_contexts(device, arr_context_handle, const_num_of_tests);
>  		amdgpu_device_deinitialize(device);
>  		drm_close_driver(fd);
> -		shared_mem_destroy(sh_mem, fd_shm, true);
> +		shared_mem_destroy(sh_mem, fd_shm, true, shm_name);
>  		posix_spawn_file_actions_destroy(&action);
>  
>  		free_command_line(argc, argv, path);
