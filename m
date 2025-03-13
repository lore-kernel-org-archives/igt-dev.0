Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDD6C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 16:51:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5485010E8F6;
	Thu, 13 Mar 2025 16:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k13mEEU7";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 387BD10E8F3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 16:51:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYD23T/JBXxExIiNfRfSsVUSOoFo3S+nX/zPtRQKJUgNQ5uLB0Nu1fw/c8rf7MoIoKhw+6eUhW4j2TqbHMgGdkMsJLzWd8Y9dIzcWMEeJt3Hs9nX0mGVhDapJzx4mJbQqywYJ3DOQceUmOedib0/AbfF0wxBR+3mdUC+5eF+dkQQQB5DoIHcIEWSVn9V3WZ4OtcYXVlWUHHyVp9YLTFbw6ORYZHMK0ziJgdrcatkb+7ZXcuf/8Pt6gOiGmOnpiWBPpC8vP3hQVZCqNFfAHsZcUDP5/0oH8e7WEdp6q2EpvGIicLoYLSLt3bUOndTaCO04+Md3jiET647ECE1PvPovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwZjsapMzfjwvlv+0q3Dge52+Ik0WhknODhz0mJ40Js=;
 b=Mf4dvBWa8LFPnKoLWoqGgsW49dbLgB6BZuF1SedDWcalgVKPh617r+a+OXOcl/Zf5DxPERQ6xAWrpPB9v0JFlQ9Xy/XFCWooeYYMr+f/JPxVhZ752BjIgF9YCa/WB4pvbwrMMdyXb16HX7zasmnJ2G+0O9UAio+gExJSGQbRu8aID1S1VCXweyxMhdCQ3CNYotRrXaC1FYD+bR7VnCb0uPFlz68+vSL+Uhy/A90l3wJD8Jucki5e3yoTF70zSv/9eZjUtK8YNWkEn8TMLoB49wrgn2BnKoi51R09FfcoMX3EzF4wLw6tAGHK8Zfg3SVh1WKXJ4MUvnCIAXyJuP5CeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwZjsapMzfjwvlv+0q3Dge52+Ik0WhknODhz0mJ40Js=;
 b=k13mEEU7skPKtbErMgs3foODjappxMpKmlCWwpwYRHG7wYp605O9YrxpDQ5/kveQiIDTV0f7hqLzZHWLlCLKjMCR5gO3US4wJlBCi56s4DOaRz++PChzlcWlYPjFWSNdzaIx9cK7UA3/gZ8UWrrp+AIuCsaJRPRA7hmyla+IAyA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4cb::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 16:50:51 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 16:50:51 +0000
Message-ID: <cb076a48-355e-4838-9769-2d62d6129982@amd.com>
Date: Thu, 13 Mar 2025 10:50:48 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v2] tests/amdgpu/amd_hotplug: Check the suspend
 state after resume
To: Tom Chung <chiahsuan.chung@amd.com>, igt-dev@lists.freedesktop.org
Cc: sunpeng.li@amd.com
References: <20250311081457.2396-1-chiahsuan.chung@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250311081457.2396-1-chiahsuan.chung@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBP288CA0006.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::16) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: d46b9c64-b120-4814-8963-08dd624f367c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnRDU0FEQW5FbTdiN0ptMnlablZDSStRN1FzMkNhcG42Q2NvYXFXVWJLVnJh?=
 =?utf-8?B?dDQ5UGRPZythWkkzNmFMSkF3UWJ5blVVcDJRK1ZLNW05NTBtdzg3SkttZ053?=
 =?utf-8?B?RCtNRlFNS1lPMmp4bGNRajNodmd6VlRkU3RRNlF3eXdVZzBkcStaK3FaQVF6?=
 =?utf-8?B?LzlKV2dwSG81QjVHME9PL3FhN3lFMUpwUkZDL0tMckxOS0FZRlRYK1hYUGlk?=
 =?utf-8?B?aUg4RENzVEZrd2piZDRNQ0hrMGJJU3pHdXBQNzZZaVB0VkJYWStYTUp6TDF6?=
 =?utf-8?B?R3Fqb1UvVjZHWXlmS2lYYnZ6TVFpUURjL1Y1WTFIbGhtbVYrcmlIWHdoNkJ4?=
 =?utf-8?B?aXBXZnU3b2Q0ajVRcDlQK0RsMlpFdGNEYldvYWduT1NUTGtzRzErbnlwaFcz?=
 =?utf-8?B?U1UxekF0R0pCNDczTm54cEZMUXlacHNoR0NsZnIwZllOL21MRlRXREx3L0lG?=
 =?utf-8?B?OVhudXJVUW9zRlU5V2drYVpuVnZzVndHYnhNNWZ0QTZhQ2x2eWxVYTdGZXpG?=
 =?utf-8?B?R1VkalN0M3o4SDQ3VnpQZERVelBsNmkvVmJmcG5vbE4zSFBkem51clhsNGI0?=
 =?utf-8?B?Y0V6S3g0Y1lKRFJ3ZVNGbjBGVnlPUStCNUExZXNMT2R4UGI5aUIydEZ1ejZj?=
 =?utf-8?B?MHRPb0NUcUYrZnVoMHJ3bkFZV2JSSTZtYzc3OTFwTHVsL2lHSm5tSjBQRWZw?=
 =?utf-8?B?TnNhcktqSWgzT013eDBVcklyMUdtdFFPRFpOYkx3N2lZaWRFa2dsSmFxb2JT?=
 =?utf-8?B?bXpJcVZXZmVYOTBSZXY0WisyMXZJS1dadUdQdU51MjBlb2MyYWUrN2xUbmY5?=
 =?utf-8?B?WXZxM21lSkZtaVNwT290dHVMODMzY2t6bmk1S1dzT0pFTC92VVBqbkcwOEw5?=
 =?utf-8?B?UzkrUzhzRHJVRXl4dldvZU5sRmMyMi9jTTIzc3hTdlZZOWRia3ZPZUZHUE5y?=
 =?utf-8?B?YUFqNnV6bU15NWVJVlFtY0MyMktLT0lKeHQrZDVMcGZhWTgxYnp4dHV6RXh1?=
 =?utf-8?B?WTQyaEFCNktpQ3FJdk1DYVVDcDEyNXhQKzRBeElGSG0xdVdEOUlpU1gzbFJi?=
 =?utf-8?B?YzAvS0hKRW1CUXo4LzJMaTAwc2czazlSWjBland3RFF3RFZWMlhRdTJpQ09O?=
 =?utf-8?B?dEJwSFNxS1NwVklZQmRiMVM0MjZHTkN6UU11cjlYQkFscHQ0NWs1NXA3U3Bm?=
 =?utf-8?B?enZEeEFtMWVma1Y5SXhLV0JUN3NsSmxLVmZ3T0dZQ0JvY1FRd2laREVLYXov?=
 =?utf-8?B?TWcyc2NKUE9RSXlCTy9jb1kzRndMbmF3dm9weFkzM3RnbzBZcVYwNnhLQlhX?=
 =?utf-8?B?TFcxalpyV0lRZ3BWMUhKRW1FL09vMVFHT2Z1M0IyVFQxb1pjRlhCYTFaMVY0?=
 =?utf-8?B?RDcrTWR5V25XdEMvV3dXK2U0MThVNStqcDdhdzlpcE5IekVCOXY1NGhDdU5Z?=
 =?utf-8?B?UXJvS0lXTmt2b1U3MndKR0FUei83cWhINmNNZWlTV0c4VEl2Z1RhcDFyUXF1?=
 =?utf-8?B?TGZTQldBcHJaZ293c3NDcmhZRVhibEZ0dGR6eVdRaEczb3RxK3RXc2FOOGR4?=
 =?utf-8?B?ejhDekY4cU5Wemo5R2lMSlV3UEtLK2lBNGlhb1AwMWZnZ2RyV0kxTWcyUUND?=
 =?utf-8?B?YzBWd3hZSHltTGNxeUF2NEhURVBEMUQ4KzErZTVwWWxjV0tRNWZlZ0tVbnBt?=
 =?utf-8?B?M1daMWZZTytCN2VBd014c3pBT0dXVFNUNGhrOGU3c0tSMkJZbVdQR3NDd0l0?=
 =?utf-8?B?TGlSTzBrQ2VEdDlISUZvM0xqc05OcThtNkRSSGZPTWxUVFRkVFZ6dk40cW1t?=
 =?utf-8?B?UitFWEtVZytzUUhXUTFsNStOTytZREpEVTJIQWJQWVNQMFo2REpBWkhrdmJP?=
 =?utf-8?Q?fkzoE2bCVYua5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTJ1UlcrR2MwTytZcEFLYWh3YmFUck9oTXgrRlo5ZUhCd3JOMTE4SHZ4ekh1?=
 =?utf-8?B?NjgrR2JyWXpuMFJVZ24vdnB3b0wxcnZ5amRpU0pDN3JCTnlIQTZsZHdPS0FF?=
 =?utf-8?B?RHdnQ2E1NXZyTHJMM2JXUmFJaEVtY3RIa3Q2Y2JBRXQ1MjVyU0EybitSVGZL?=
 =?utf-8?B?VEtLbUdLRFVrZmZ5Y2p0SCthbHZCNDE4bVlKU3VXQnJNU280ZkxVc01hYVkv?=
 =?utf-8?B?VTFPVDRNOHFmNnFIdVpGa20wdWRMaEdGWXNMQjJzV3V6NjQ5WHNYdzF4ZmNt?=
 =?utf-8?B?TGtiYzdXUjVIeG9nL2p2VmVieGdFRnpYc2NDVWFtc1M4a29lZnQ5TDhWQ0k2?=
 =?utf-8?B?alkyNWdXQXNldWlTTFZKbE5mTzJkeDE3KzNHVXJWd0VXOXZPSjEzalZIdFlM?=
 =?utf-8?B?WG1Ic1dVRlpxUHZCbFBCcXk1dFR6NGNjdVNhMWY4RllTeFk5UHV6R3ZWbURY?=
 =?utf-8?B?NjRpclQ1RWRtNXFQY1NQNXRQcnJGOG4xWk9EUlgrY2lzdXZWNUNWbmtqYlFN?=
 =?utf-8?B?cis2NVRCemY2M3czd0twVkZCc2plc0R4TlpheGlUci9KbDhRV3RRb1MrNjRw?=
 =?utf-8?B?MUNNQncyRjJrUkY0WnA5QkVyNksrY29xQ2wxcy9tOHcyMUxaTk13SWNDakhZ?=
 =?utf-8?B?NTFmWTJpRmp4Y3VkaHhZYzRkL0QvRmhDVS9QQVovL3BLdEJrQnYzRG1IN2xG?=
 =?utf-8?B?MUNWR3hHVkQxMjFCNzl4bzQ4QVlzS0JabjRMNmgwaTRtY3hlUlVuak5VVmMz?=
 =?utf-8?B?aW9FeDhqSStUbjhSMHFjdUZwZkJZVlRpYjhmRzhYTTYyR0VhaWRMNGlUelVy?=
 =?utf-8?B?K3pibkhFUndWQjFzaTFqMTRqa1hTSDU2cEpBa2RWNVdKTjFXM01ISkh3UWda?=
 =?utf-8?B?R0h4dDAvSjBaUGFqV3h4a3habk5TaHVUYmh0RzRsNXhaTHZOVUpSeGNVSm5o?=
 =?utf-8?B?c1kvaEpXSis3WTZzK2E1enN2c1RwNWVmTTdBVUh3eVh2SXROdUVIRVFNWnNN?=
 =?utf-8?B?cHFnMnRFTmFnZzhOV2RMekhVT094TitFUlUzWDg3L0F1MkRKMlJYMHRmSVpp?=
 =?utf-8?B?bVczMFQwbTdJeGhMb0hyRGd2cGM2QXlBM3N0eStGa1lKeXhySWxJUWgxU09T?=
 =?utf-8?B?bFZVazl1Y25mRldUbTM4WWY2UzZxWWNNNGEvdGtOMnZnK1Uzc2lkNEMzYjdy?=
 =?utf-8?B?NzNHSlgrbnYxdlY1a0YxTWppWERTeUZjQWtmMWtBWjhrVnp2RTloV0tqKzlL?=
 =?utf-8?B?TitPV3phUldaMUk1Y2kvNHR4cS9ISTg5VXBpNHVRcis4azR1aTZoTTE3UHBP?=
 =?utf-8?B?eWovWWxaR0NCbU1QM3owbklLOWpNczBZWVI3aXBmZ09KNnpKdlNGSm96Vys2?=
 =?utf-8?B?WDBWQmsxeXdjOFVhN3hyUXorWk9rQU5XQTVSNkw5WG5GNUdtU3ZYTTJUaStt?=
 =?utf-8?B?WUJQU2tUNkt2TUMrK2xSOGhFVEZ6TlFNRVltVDNFZ09TUFdIV1dhb1h2UGVO?=
 =?utf-8?B?anVHRFBOZW0xbGhJUWFnM2p6OXJIT0N1RGxHMllCdzJmSVdmQzNDUXEyZm5O?=
 =?utf-8?B?bjUxM0oxK1ZvUzFrUHpVeXVQbUdzK1FWdXRHQ01hWGRlNHFDb2lUeUZWLy9L?=
 =?utf-8?B?dzV2cE5JL2ZPOEE3Sng5TC9DemY3KzRwOWlFVkhFVnJVd29ESUZMeUd4TFFx?=
 =?utf-8?B?TUhMb1phZnJvOUszRkxZYll0amFGNHJJTEovc1JKODBNWFlQUlpKc3V4RElt?=
 =?utf-8?B?NHc2TG5aRFdHQzVTYTFtanl2UkNYaEp1WVBCNHVRVGd6OWZNV1pSbnpJSld6?=
 =?utf-8?B?SEZBL0RHODMyTXZRMThkR0c0WThLK0hJZVptdjdUcm1pWTRkTEhtZEpmY21j?=
 =?utf-8?B?bkhzWXVPa1NjUWhTejdST2NMZWpOMXlTaVBOUGo4czhFZUZkLzhTclZ1K1Qz?=
 =?utf-8?B?bW4wVVJ6QTAyREppbmF0UW9LcmFhdU9SMjJ1RFhGVjVXQjMyT0Z3emNPbDFj?=
 =?utf-8?B?UHVqZis1aUJYRUc5UW1oNHlkU3dZVVJCaVRydlNxQnpORDhJa1ZFRlF4THl4?=
 =?utf-8?B?NksreE1lQVFHL1VnTXRyYkVoeEpJbm8vYm5LdEZ6amVjQVVQa1FLUVBVS212?=
 =?utf-8?Q?o6ByTR0FafQpWZSTlbrdoPddp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d46b9c64-b120-4814-8963-08dd624f367c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 16:50:51.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7nVNzjdlixY8LjFmjVMPN3EMEnzhr2UJbc/UmMnQKAwtKs3//+dwGy/RH9ZIGU0QzsczHgs97/C+4n9GHUpPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034
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

On 3/11/25 02:13, Tom Chung wrote:
> [Why & How]
> Check the last hardware sleep state after resume to make sure
> last suspend really reached hardware sleep state.
> 
> Make sure to enable the suspend related settings in kernel config
> 
> Linux Kernel Configuration
> └─>Power management and ACPI options
> Suspend to RAM and standby
> ACPI (Advanced Configuration and Power Interface) Support
> 
> Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
> ---
> v2: add kernel config note in commit messages
> 
>   tests/amdgpu/amd_hotplug.c | 47 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index c13bf49d3..ee3256c0b 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -27,6 +27,8 @@ IGT_TEST_DESCRIPTION("Test simulated hotplugging on connectors");
>   
>   /* Maximum pipes on any AMD ASIC. */
>   #define MAX_PIPES 6
> +#define LAST_HW_SLEEP_PATH "/sys/power/suspend_stats/last_hw_sleep"
> +#define MEM_SLEEP_PATH "/sys/power/mem_sleep"
>   
>   /* Common test data. */
>   typedef struct data {
> @@ -98,6 +100,46 @@ static void test_fini(data_t *data)
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
>   }
>   
> +/* Check if mem_sleep is s2idle */
> +static bool is_system_s2idle(void)
> +{
> +	int fd;
> +	char dst[64];
> +	int read_byte;
> +
> +	fd = open(MEM_SLEEP_PATH, O_RDONLY);
> +	if (fd == -1)
> +		igt_skip("Open %s file error\n", MEM_SLEEP_PATH);
> +
> +	read_byte = read(fd, dst, sizeof(dst));
> +	close(fd);
> +
> +	if (read_byte <= 0)
> +		igt_skip("Read %s file error\n", MEM_SLEEP_PATH);
> +
> +	return strstr(dst, "[s2idle]");
> +}
> +
> +/* return the last hw_sleep duration time */
> +static int get_last_hw_sleep_time(void)
> +{
> +	int fd;
> +	char dst[64];
> +	int read_byte;
> +
> +	fd = open(LAST_HW_SLEEP_PATH, O_RDONLY);
> +	if (fd == -1)
> +		igt_skip("Open HW sleep statistics file error\n");
> +
> +	read_byte = read(fd, dst, sizeof(dst));
> +	close(fd);
> +
> +	if (read_byte <= 0)
> +		igt_skip("Read HW sleep statistics file error\n");
> +
> +	return strtol(dst, NULL, 10);
> +}
> +
>   static void test_hotplug_basic(data_t *data, bool suspend)
>   {
>   	igt_output_t *output;
> @@ -131,8 +173,13 @@ static void test_hotplug_basic(data_t *data, bool suspend)
>   	}
>   
>   	if (suspend) {
> +		if (!is_system_s2idle())
> +			igt_skip("System is not configured for s2idle\n");
> +
>   		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>   					      SUSPEND_TEST_NONE);
> +		igt_assert_f(get_last_hw_sleep_time() > 0,
> +					  "Suspend did not reach hardware sleep state\n");
>   	}
>   
>   	/* Trigger hotplug and confirm reference image is the same. */

