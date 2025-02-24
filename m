Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4139BC021BC
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 19:32:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E947810E4ED;
	Mon, 24 Feb 2025 19:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wN0T3b8w";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7405E10E4ED
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 19:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnNy9wf5XYLYqriTSwu9EF8ewvaXpHvHDRf1njFR1MRKt2FRKuPY7Wxh8oiaWcls6goAnkD8Q1uloQgaBw8IPL3Y9Q6ZPAkcgD0ro/ANO6jVoAl1MbNqi/uYMZlj+BPIqwch2Bff5bCqygwltrE+f2it4DGAZRUEyYQuYzL7EfKYQUibtMKSbvaI6Zt1vlsnl7/CYlTkvI9mJmOIKORk6MZfxjF9hxgZU5aiMCeyQEx74Ov49P5CRGwTchFaQLj77bdeTBLS6U1QfYb4FNpntwX8R60k5K7qTvfcisx/52LPOhqxT1xjtwydYU832ufMnowQOa0/qlnBcCHfg/O+Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIZKolrQAmW/T56jMzngA7fWwZIwLCqgjgcbpqrELH8=;
 b=VGV5e5cP5bh3bmnC8ogtkx2xlpVbPzSvMCElNIxBreOs/hKsf7wilY6GuhX0x/4bNWvdP+n6PZbntu8FJ/iLcvSY3FhEncZ86fSpG7IyC6GTgmFaFzvBzkLvfZFRc7LDY9ol/9REqniLUJNDTiM0s691UqgX1csGhohk/8glo/YBPz2CzU8n+A2zcJH3vktFVPHlpIn6vnt7bgO/xg5DgPksh2ry/w4S0GCsAfohHkJhI5082oIzJQR7NfMGtZgo8DCxcJYaMxs6oCsWc74bW2IN67UxJW0JSj/7+yGsIsQPNlqJ4lfFfVBIqhaELfgpCox7tm+3b1LO/ZYN8IrRKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIZKolrQAmW/T56jMzngA7fWwZIwLCqgjgcbpqrELH8=;
 b=wN0T3b8wD/AC0zEP47Gw83E92pN309AfMgT71jQS1SSx83FGKhzJPg4awtLcp5fj0J5CZKUSV4tb80zsC9uHp9royz0eFls3sd/+bXn5B1n+wWBGnfeIxRenW5dbgtwhlmMo/EGjPvURp3hlHYEzs0JCcL+h6YL6V78NNeOmGME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS0PR12MB7748.namprd12.prod.outlook.com (2603:10b6:8:130::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Mon, 24 Feb
 2025 19:32:38 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 19:32:38 +0000
Message-ID: <7b271118-f3dc-40eb-814f-1a7f207dec13@amd.com>
Date: Mon, 24 Feb 2025 14:32:35 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: ad support for page queues in
 amd_deadlock
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250224072316.4117581-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250224072316.4117581-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0019.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::24) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS0PR12MB7748:EE_
X-MS-Office365-Filtering-Correlation-Id: 472773e5-8b41-4249-ffff-08dd5509ff51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFZaSkVNRlVUdjdOeUFUbUlMWmpkdWlKTDVxRHF4bkQ1amtyZnBpV0ZSU1I0?=
 =?utf-8?B?NzBDQTNQQmFFcnlEWWlyeUJsWG41SVZPUzh6dU8rVXlJSFNsQlNqQzk2U1By?=
 =?utf-8?B?UWtwQVpERUVuTjBlMi8xQmc1OTIraitlSkRhTXlqMW9xM1BKVTBzUmpoTGtm?=
 =?utf-8?B?NWNZZWdrbDZTRUN2NW1HVDBHbVoybHpQZkhsU1RlY0N6RzM3d09zSzhLUjFF?=
 =?utf-8?B?NGh3ZE54YXhUeksreWZMR3ZYeHBUVzFtMzZyZjJRT2FHMWNyeVV4bTZDRGhx?=
 =?utf-8?B?dzR2YTZCU1B2bDhGVDBsb29PN2x6QlpobGhGV1FzN0xwV0thcXkrelNrTkpW?=
 =?utf-8?B?NjdaK1o0b25CMkI5Y1VyakE4TzRXbnF6NmI4Y3luUGNaaGlOOEVCMkFNbWpH?=
 =?utf-8?B?MC8reVpXeGVhZWhoL2VIRWVtZ3VIV050bkwyWHVLNWNtNEdKOFBBVzZ0S2o2?=
 =?utf-8?B?OVFZMEZod1ZSUjZVRFU5Rk94VTZFZU5PNk0xdTVtK0g0RVVGcFZVc1JJQ004?=
 =?utf-8?B?RHJrMUtNNmUxVjh2NzNzK2xpQU9iNVR0dzhGOExWR0dlMGZaS1d4SXYyS1JV?=
 =?utf-8?B?NURxcUNlOTZCalV1UVJacmFzaTJqZnQrMUhOanltSDZPYVpSUm8rbGJyUE04?=
 =?utf-8?B?OHpNT1VyaWZIZzJPQXl4MUgrRXdYaFBReWRDRkRmQ1o4TkR1QW9mYmo1WFpH?=
 =?utf-8?B?cE9MbzEraWR4QmkvZUcrSDBNc2xOYjNBR3dvNWtlZ2FTdm1XUUFEUDMxbG5y?=
 =?utf-8?B?SG9xVGtaZ251RlkrZlp5aURQQnVRNm16Q2t4OE4wemtwbUo0QmhFODBzbDZW?=
 =?utf-8?B?Y2RqSGRsUWExM3VvbnlPYjhMdU9zMEpxNVNUYWlJNnpLWWlBbm4vSldYajVW?=
 =?utf-8?B?OVR6OWVwS2NYZ29FdjJrcEovc2tnWnpjZFc4UTdTSWt2aXFCL3NTUGk1MHFh?=
 =?utf-8?B?WWh6d05MQ210NTc4ZlV4VlUzZjFlL0RESml5RXNvQUlKVVF6d3dQOWlNYUx0?=
 =?utf-8?B?R1dqT2F1QUZPcmdPRG5aUUxROWI3ZEtUSVNiRGhqZy9UM3hRQUxmdTZtNUdj?=
 =?utf-8?B?N1lvSE5iV3ZwUlBWczJxYS90azkxeHRrdStnejdmUW5DdWlkZUJvc05mN3Jh?=
 =?utf-8?B?MlJRektqcEpicjk0MEU3MTRZNVMvaUhMSHdHbnl4UnJMejVRVjloVlFWTGpa?=
 =?utf-8?B?K3NIemJlZ2hmV2JraXN1TVlDT0VVajVzRzJNUnRhVUxZMlVHczRsOWZrTzdJ?=
 =?utf-8?B?VU5nRUVKL0dlaVBrRVRWQ1hZVWhvWDVLTHhud0E3aEkrMGI5SkI3R1ZhMHlW?=
 =?utf-8?B?Q2I0bnhoMmhQTFFCa3FHOGpTTGNmeU1qTlhxbGlzbFVZdERrYkg3MzJLNmYv?=
 =?utf-8?B?U1BuY29nLy94MWtUREoxNUNCK1RlOVkya2IzTnlvQUVIQ2xXZWxRY3U3M1V2?=
 =?utf-8?B?ZXl6ZUdPV1kwelhrdWp4RGkwSVJ1eFIwSWFEMTdiOGVnTjFqK24wL3l1YWo5?=
 =?utf-8?B?UE1Fd3BLdWUxbml5SGNHWmtFUFBUaUlleG4waThDWkplV3RjWFFqRUJ1clpH?=
 =?utf-8?B?UnBGQ3g4VmE3S3BXM2kyYUlFWTlkRE8xMzdtb21XM2gyRU5JY0laS25jaWdC?=
 =?utf-8?B?QUNIQkZpcEZtMmx0WUZIemc1UFVmSlBYa3gxWnBZcDVDUThSOVBZYWFwcFNm?=
 =?utf-8?B?aWcwSDlDcG5HcE9Ic2pZTVFQNERZM0llcTRUejdLUUt5UkVrei9ud21NMFVz?=
 =?utf-8?B?UTBDZWx1dFZsbjhkbUQ4VlBLaFlncm02UzhIaXFTSlRPWjBkeXg5cmFLOWQy?=
 =?utf-8?B?bys3WDVCTDZHMHYvNlNGYytEem9Ka1lIdWovL1lPMTVOUE8vMVdubG5ISEM3?=
 =?utf-8?Q?hMwdpwhmZkD7c?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEhpN0lZVk9Lc25KSWxneXBXbGN6WEVzdFMrSEgwOTJiQUlBeDRqckpTQ296?=
 =?utf-8?B?STJ4MkVGeTVsK2l3RmlZUHJuNDAvMk00OVBESUYwU2RMSG02Z1R5cG9Pbkoz?=
 =?utf-8?B?QWZ4MTdxMlRWalRIQ0hsazRCSFREQk4yMllxMTFDUDVRcG5UaStXcURYbVB2?=
 =?utf-8?B?L29HM205WjU5dHNtSnF6Yjl2WGpxNmUwd3ZhUzFKS2Z0REJDWVlpS3lWQ05O?=
 =?utf-8?B?WE5OKzdOL2Vldnpkd2JLSW9ZYUdTbzdYMCs3eGdyQVlQcUlMb1pRdlVyVW55?=
 =?utf-8?B?bllEcStKaFpDekhaZVJWVzlUT1JRTlhOOVpMZVBiZTZJQkVHQ3NZU245Q2Fk?=
 =?utf-8?B?aGlYOWhrTXV6UW1QdXo3L2xRNzVIN2VZVVZRbFgrYktwYzVsdWJJTDNNMmZG?=
 =?utf-8?B?b29VSmpoRkxUcWxsVXAvajQ2cnY1Um9Ud1JUdStyUmlIVDdUNUl4QVVTN1ow?=
 =?utf-8?B?UFRUb3RjS1pXaUZvcEhpUDVFWjh2em8zZTVzbVg1a3FabHIyUGFUVjVVbHFC?=
 =?utf-8?B?YzRmOVJHcmd5T3FRT1RaQUJvTUkrcFlsaDJwb1pCZDNiZndHK2huNW9CN0hm?=
 =?utf-8?B?SFlwMElYTlRYMU9EVUR0eWdZb2FzemwvVDFTMkhBcEhmNzN1bVY2ZjRndU1X?=
 =?utf-8?B?ZXlNeW5aR0R2M0xmSzRtc3dFVWp1bXF1UUpQb3lHQ0xGVm5WVG9BMDdLemt3?=
 =?utf-8?B?aUt4YUdPVVlibmVuVVhJUFd0QU9ucEJ4d3hUODVVZjZVWG9XR0JjREpMbys0?=
 =?utf-8?B?enJsOTBQS2RnNXlFNTdDSWMyMUNIUGk2RnBuWWx6RXliRFZzT040c3RDQUpq?=
 =?utf-8?B?SklCTEVMU1ZOZmR6d2dPcnVoZFpMN3hCYTgxR0FOMXJSWUlMRW1NZSt6RkFR?=
 =?utf-8?B?UmNFeVdneHErdVRjYU52Y0Q5Tk5KS1NSRnFucXErd001S3RBL2VGclNobVZo?=
 =?utf-8?B?aFBGTFgzRjBEelc5YnQxTFZHTC8rSEx2aTMxQmtjdDQzd09iWXlWc2FCcmw3?=
 =?utf-8?B?YzQyTXMrU2RNNHdqd1ZPbGpscmp3R01iOGpXbGljM3pDQ1FLMThHZ1hzNloz?=
 =?utf-8?B?UTgrRndRNThHdzBUZzFpWmJzUFd4N29ldEJpQU0ybjRhS05OQVRIMjFwdnB0?=
 =?utf-8?B?WERSNG9mMG5GYlI3dnNDZzU1UCtOVzFidk1MaFdEVmV0ZnRKV2hadnhwRlJG?=
 =?utf-8?B?TFVMOHV1UUNmQ0V5dEtMb21IWjVZb1NoSU5UeE1iMDlTaVRGNm4xczhNNW9G?=
 =?utf-8?B?bnhRY1ViTXV2VDlHOHJzME1yNEN1VGJNbWxZVW9wVWJyZVJEVy92cTZqT2I3?=
 =?utf-8?B?MW5hOGw0VzJkNm00Ymh2Mk1rZjJQdUc0a09QUkFtQlAraHlxTUVPTjdmUjBx?=
 =?utf-8?B?a2FEMHEvN3hOS1hSZzI0YzRURml4SVVtM0hDSDE5dFhsYWxKU3N5UVVpUGtB?=
 =?utf-8?B?WG9rYzJya1NlQS9XVnBIUU1uUXptOFRGM0dhODJSWXo1d0U3czFnR3BLOEo4?=
 =?utf-8?B?YjRHZ01Xc1hTaDFJT0FhNzFUV2QyY2YwU2hFQWQ5VTBuQnM0R0RGUEhFYk5H?=
 =?utf-8?B?Q055YWJINkdVbUNCcUJDeWNSblFlbEZhRERrcGFoakNPbXFZSDFJRlVGTlNa?=
 =?utf-8?B?M0NzZFBCcSt1ZWR6OHJSVGZtSVl3YlRrWndjdTNxVUM3Nk1nM1o5WjRTYUFx?=
 =?utf-8?B?U0lYMC8vamcrZTkvSVd0a3JNU3hQM0sxajVJNU5OQUpxWExYZjNNWU5lZG1R?=
 =?utf-8?B?Vi9Lbm5GUGoxbUJzajBTemgrODZzT3BjaTZub3drMWZTdTNMVkRobk1yWHFI?=
 =?utf-8?B?VmV0S0tTN2RxNk5CaUU2cG5CY1I1R09pczhTeFNMVzBRdE9JbGJQeXhTbDJS?=
 =?utf-8?B?dlhSbFFIaVVTcVlnampyUTRMeGw5cmtZNGV2OVdtaHV1YjRnNnV6eGIweE5y?=
 =?utf-8?B?bnRLRTNsVlFqeEdGQ2ZNQzJEMGNYQ1drRTFCcHlyYlFWUTlvakI1MzdiY3Bx?=
 =?utf-8?B?M3NlSytGTXI1NWsxTUNrVUxkbndVSXZQQTIwUkNHQjFyaU1ETmttU1pwMmx3?=
 =?utf-8?B?aFNKZGFWaEZvbHJmR0dxdkUzUGpOQytacVZsaHlUQnM1dnhaUGsweDErZFQv?=
 =?utf-8?Q?VwvDJQ1Cj6eF2f4lkS5ixOdI4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 472773e5-8b41-4249-ffff-08dd5509ff51
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 19:32:38.5391 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQ+vImBLUSpQ0MLmtPfeaPaqTDtpMZvSegfRQpsHw4zlQUsaWr7HR3bKw8tDJM//q0E3hKg4dhKvwR+kF3islg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7748
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

The change looks good to me with the following updates: move is_support_page_queue into the amd_ip_block file to allow other test cases to access this function, and fix some spelling errors.
Posted updated change.
Reviewed-by: Vitaly Prosyak <vitaly.prosyak.amd.com>

On 2025-02-24 02:23, Jesse.zhang@amd.com wrote:
> This commit introduces enhancements to the deadlock to handle
> page queues and modify the logic for enabling/disabling scheduling rings.
>
> - New Function `is_support_page_queue`:
>   - Checks if page queue files exist for a given IP block type and PCI address.
>
> - Modify `amdgpu_wait_memory_helper`:
>   - Updates the logic for enabling/disabling scheduling rings based on whether page queues are supported.
>   - Calls `is_support_page_queue` to check if page queues are supported.
>   - If page queues are supported, enables two rings (sdma gfx queue and page queue).
>
> - Similar Modifications in Other Functions:
>   - Applies similar logic to handle page queues in `bad_access_ring_helper` and `amdgpu_hang_sdma_ring_helper`.
>   - Ensures consistency across different helper functions, maintaining the same logic for handling page queues.
>
>  Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>  Cc: Christian Koenig <christian.koenig@amd.com>
>  Cc: Alexander Deucher <alexander.deucher@amd.com>
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 96 ++++++++++++++++++++++++++-----
>  1 file changed, 81 insertions(+), 15 deletions(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index d7bf0e111..3463653a7 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -10,6 +10,7 @@
>  #include <unistd.h>
>  #include <pthread.h>
>  #include <signal.h>
> +#include <glob.h>
>  #include "amd_memory.h"
>  #include "amd_deadlock_helpers.h"
>  #include "lib/amdgpu/amd_command_submission.h"
> @@ -26,6 +27,31 @@ struct thread_param {
>  static int
>  use_uc_mtype = 1;
>  
> +/* Function to check if page queue files exist for a given IP block type and PCI address */
> +static bool
> +is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci)
> +{
> +	glob_t glob_result;
> +	int ret;
> +	char search_pattern[1024];
> +
> +	/* If the IP type is not SDMA, return false */
> +	if (ip_type != AMD_IP_DMA)
> +		return false;
> +
> +	/* Construct the search pattern for the page queue files */
> +	snprintf(search_pattern, sizeof(search_pattern) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_ring_page*",
> +		pci->domain, pci->bus, pci->device, pci->function);
> +
> +	/* Use glob to find files matching the pattern */
> +	ret = glob(search_pattern, GLOB_NOSORT, NULL, &glob_result);
> +	/* Free the memory allocated by glob */
> +	globfree(&glob_result);
> +
> +	/* Return true if files matching the pattern were found, otherwise return false */
> +	return (ret == 0 && glob_result.gl_pathc > 0);
> +}
> +
>  static void*
>  write_mem_address(void *data)
>  {
> @@ -179,16 +205,19 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  	FILE *fp;
>  	char cmd[1024];
>  	char buffer[128];
> -	long sched_mask = 0;
> +	uint64_t sched_mask = 0, ring_id;
>  	struct drm_amdgpu_info_hw_ip info;
> -	uint32_t ring_id, prio;
> +	uint32_t  prio;
>  	char sysfs[125];
> +	bool support_page;
>  
>  	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
>  	igt_assert_eq(r, 0);
>  	if (!info.available_rings)
>  		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
>  
> +	support_page = is_support_page_queue(ip_type, pci);
> +
>  	if (ip_type == AMD_IP_GFX)
>  		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
>  			pci->domain, pci->bus, pci->device, pci->function);
> @@ -215,7 +244,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
>  	}
>  
> -	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
> +	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id += 1) {
>  		/* check sched is ready is on the ring. */
>  		if (!((1 << ring_id) & sched_mask))
>  			continue;
> @@ -239,9 +268,20 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
>  		}
>  
>  		if (sched_mask > 1) {
> -			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> -						0x1 << ring_id, sysfs);
> -			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
> +			/* If page queues are supported, run with
> +			 * multiple queues(sdma gfx queue + page queue)
> +			 */
> +			if (support_page) {
> +				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +							0x3 << ring_id, sysfs);
> +				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
> +				ring_id++;
> +
> +			} else {
> +				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +							0x1 << ring_id, sysfs);
> +				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
> +			}
>  			r = system(cmd);
>  			igt_assert_eq(r, 0);
>  		}
> @@ -411,16 +451,18 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  	FILE *fp;
>  	char cmd[1024];
>  	char buffer[128];
> -	long sched_mask = 0;
> +	uint64_t sched_mask = 0, ring_id;
>  	struct drm_amdgpu_info_hw_ip info;
> -	uint32_t ring_id, prio;
> +	uint32_t prio;
>  	char sysfs[125];
> +	bool support_page;
>  
>  	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
>  	igt_assert_eq(r, 0);
>  	if (!info.available_rings)
>  		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
>  
> +	support_page = is_support_page_queue(ip_type, pci);
>  	if (ip_type == AMD_IP_GFX)
>  		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
>  			pci->domain, pci->bus, pci->device, pci->function);
> @@ -447,7 +489,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
>  	}
>  
> -	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
> +	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id++) {
>  		/* check sched is ready is on the ring. */
>  		if (!((1 << ring_id) & sched_mask))
>  			continue;
> @@ -471,9 +513,20 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  		}
>  
>  		if (sched_mask > 1) {
> -			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +			/* If page queues are supported, run with
> +			 * multiple queues(sdma gfx queue + page queue)
> +			 */
> +			if (support_page) {
> +				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +						0x3 << ring_id, sysfs);
> +				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
> +				ring_id++;
> +			} else {
> +				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  						0x1 << ring_id, sysfs);
> -			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
> +				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
> +			}
> +
>  			r = system(cmd);
>  			igt_assert_eq(r, 0);
>  		}
> @@ -496,16 +549,17 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>  	FILE *fp;
>  	char cmd[1024];
>  	char buffer[128];
> -	long sched_mask = 0;
> +	uint64_t sched_mask = 0, ring_id;
>  	struct drm_amdgpu_info_hw_ip info;
> -	uint32_t ring_id;
>  	char sysfs[125];
> +	bool support_page;
>  
>  	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
>  	igt_assert_eq(r, 0);
>  	if (!info.available_rings)
>  		igt_info("SKIP ... as there's no ring for the sdma\n");
>  
> +	support_page = is_support_page_queue(AMDGPU_HW_IP_DMA, pci);
>  	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
>  			pci->domain, pci->bus, pci->device, pci->function);
>  	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
> @@ -522,14 +576,26 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
>  	} else
>  		sched_mask = 1;
>  
> -	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
> +	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id++) {
>  		/* check sched is ready is on the ring. */
>  		if (!((1 << ring_id) & sched_mask))
>  			continue;
>  
>  		if (sched_mask > 1) {
> -			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +			/* If page queues are supported, run with
> +			 * multiple queues(sdma gfx queue + page queue)
> +			 */
> +			if (support_page) {
> +				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +						0x3 << ring_id, sysfs);
> +				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
> +				ring_id++;
> +			} else {
> +				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
>  						0x1 << ring_id, sysfs);
> +				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
> +			}
> +
>  			r = system(cmd);
>  			igt_assert_eq(r, 0);
>  		}
