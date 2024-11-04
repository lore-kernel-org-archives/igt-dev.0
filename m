Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13595D1CA09
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 23:22:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C721310E4E7;
	Mon,  4 Nov 2024 23:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G8WpQKFX";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5440210E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 23:22:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K/MScIjp7CsCRZtasHkbIWSv9SHVOtCr0lY1bDgWyXAdnokQ3LXc29FSOAqJBfaNxhRf+bO6y985WvMVMDscLB/D0Bp4BWdSSVOqpF52SdpSYziiJRnqDlt4WVXe9rjDG1fkVzAcZLiE4zS4mda8/KDQ+mOyfTmX8T42oYQG/2qReSAgvJGAciVm6QTvuePMjghnbPAWCKYf4Yi4Sae7NKghpsXFen5+khk97Er/YL6edpybaznA51A7aO1s21n+kwbpgsJsVL9h0lgFGwbc3Qogc+3rizrC5Wan9x0iLqoJ7rasdAWPZ1bjvruJTr6+ngzui+qS3yogCk3MYzhxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICFadkydgVk+1XIYa/17usmS40+rUMkKN9T0YZOHxNo=;
 b=Ug2kRTUHn5iWgkRx3I+tCH/6N9tbGl/DNRFqOumutF5ZT/4aey3/pudL/YWAgDp4jOYbs4Z3787a6wWbI3uNJHc/ki5IYHYA+xnJuNqGchruYb0eK9hAxExLZpO/JSWjgoRroGTGDRMFpfv3JaR7SoWUN0R4Cy9wvEsaF0TptSGbQLkgoCqW91WWJCh/mZaZ8M4SmMRewveQYWN1d4SRYQjvXoLSzgcQnADGX+qTs9S3SXMAZmotqPzoEUaHEWUzr8aoU31IH5023NAjITczGu9yCW00O6qHNP5rJoHiRV4DQETv4SJv0zSNgN8MWjEvkbRTB0ulGfuOPFTolHTJeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICFadkydgVk+1XIYa/17usmS40+rUMkKN9T0YZOHxNo=;
 b=G8WpQKFXtnLtpnb0V7LdvKVQBO0tnQZ6DF0Qxfufu1XxjYp4MLM8vE+51uq6LyNH/Qkt8FEDK74IHQ5BHbKfypnArbYuMwWyZb8DPR5zXyw4ekkPPngQl8P58u1k77AarSBVjeD2N7ByW4o93XTctpNasg8JcTkmPOuHpptAze8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SN7PR12MB6888.namprd12.prod.outlook.com (2603:10b6:806:260::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 23:21:56 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 23:21:55 +0000
Message-ID: <8ea6b305-18dd-4186-964a-def1ea5be49f@amd.com>
Date: Mon, 4 Nov 2024 18:21:52 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/amdgpu: fix ring schedule issue
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20241104065710.4114957-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20241104065710.4114957-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::21) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SN7PR12MB6888:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b30c91-ccdf-449b-a4d8-08dcfd2778e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YWxCNGs4VnBKYS8yYnF6RUtsbHF6TWx1MFBJMXpuMm5WL1Y0ajRISi8wY2F1?=
 =?utf-8?B?ay9zZStsbWNDSTlRVldqWFc5ZEFDN2FCL0VMWVZMdU10dW1oNHVrcC9hdEZi?=
 =?utf-8?B?YXNtWklDZks5anFpaUUvdDlQN0pPUXNiMHVXWmRNdFZCcUEvcmJoSzg1L09C?=
 =?utf-8?B?OXZQREt3QW9wT3pDNkJCM2RIaS9LQ0JHTG9uV2xONmFXREphNkw2WWphb2l4?=
 =?utf-8?B?OUpZVFl3dThiQmZHSzViOEUvZ2xKb1BqcnhnYlNyaXlJTWM4WWkrTkZCTUZX?=
 =?utf-8?B?NVRlcjByaVNndzFRdXZ3aGlZWjc0Z0pUYmwyWHJLSGpHa2tMc05QTUl6YTAr?=
 =?utf-8?B?a2lWMFdOQ0JURmdjUWdmVU5WTm1sSE9tWk1ib0FQZEhsbzBoZjZjWVpsOFFV?=
 =?utf-8?B?SUE4b1BYbUl2QklkRUh1YUZ4ZVhDV05SQmE1bkNBVFp0RUNZVERTSDNVZ2tp?=
 =?utf-8?B?TzhpV0lsbS9MS1JaMEdvcnNLV25yRnpvSVRYdHZibFoxUFVBaDFCT0ZNem1M?=
 =?utf-8?B?VitRK2U5Y05teEtGWTczaDBVV0piVDd5bUN0M29VVWY3aGI4NlVtVmh1S2R5?=
 =?utf-8?B?bVE5NHd0eWNxemlUUEFyb0t3SWt0aG5tNlJhNFRBOGI3Q2x1WHhYUncyeEVi?=
 =?utf-8?B?dVdyOEp5SnQvTXZQTVJWUGY5R1NSRUpYczFVRmZwOGp6cGNxS3ZSM2EzNUly?=
 =?utf-8?B?blJOdXNsd0Iyck1Yd1ZaclFsK0E4aG5YS0h4Qk5wM3NWMUJoNzMza2gvZndG?=
 =?utf-8?B?YXlLSkZkRWwyRldwQXpEM3oyaG5DM2ZYem5IWWZkZ0VEd21aSFVvVWNqN1Zr?=
 =?utf-8?B?SjhGT2VsRVJGNHY1c2Y1WjJVZVBZN3daQzU3NXFoR0pSYmVSTnQ2T3VIeXpG?=
 =?utf-8?B?ejlUUjlaT3BhNUZoazlvNXNqL0tnOTZRa2xZdjgwRjZDMm45S29ENFpldG1v?=
 =?utf-8?B?a0ZHaU9nOHpqNkxjZ0tGMC82STN2WURpZVl1WTVuK2hCWHgzdzRoSmlOWHR4?=
 =?utf-8?B?WGxIYWJRdXJGSy90V2pvQVUrcnRld3BIWWhqMlhycFV3Ylc0OUtvWno1ZzBu?=
 =?utf-8?B?RzZFN1Q4N0w5aGZvVVhwS1B0eTh6bmxTSWJmM2VXWUdtL3VrYzZKOStOdk5i?=
 =?utf-8?B?ZFpQb1FHejZReDNISmcrU3YvTyt3LzJHR0JVbVBucXVxK3VlM3A4dUpubXVT?=
 =?utf-8?B?bzhpWGZGRy9MSkU3Rk5YRlNkaTdoSDZXbUw1RTl2RnlNTFRFRG5sWHZLOEJa?=
 =?utf-8?B?bnlhVnlreTFYbzA1OGJxVjJWK0s2T2tDbk54ZFF3c0U0a2F4YWxEdVRSLy8z?=
 =?utf-8?B?WFd2YWFVQkVsdHpBOFBrVk1KRXVJTUp1anRYRVVzcldkNUx0MlowNlhJajBr?=
 =?utf-8?B?YXhlaVFWemQrNGdJam8vSFhDZ1JDYlpvejFmSHV2YnNMQWwvNzlma1AzaENI?=
 =?utf-8?B?TndISUxpUXpTOXhBS0hwS0VoUW9BVFNlOFA4dmVFcHhKKy9VMnMwbVJBMXJF?=
 =?utf-8?B?REVCamRlazBDSy9tZzd1emNOeGJGVVpkMlQ0MDIrQUgybzM0NWxwUlBwUElT?=
 =?utf-8?B?OXJBN3pPOThnWFdnc2JsZW5QL2Q0RnhKZ0tqRTZXODlwNkNUYk1EbzR5WGxK?=
 =?utf-8?B?MlVwQWJuSTFHd254SFljMHRQZ3VHTHJ2VDgrdGs2anFoZ1oxWWRySmdwUGFM?=
 =?utf-8?B?WE1BcUZINnVpVmpaNEVFUUttRmQ5elhXaHpmRFUxNm1yS1ZVQnlBYTFiV2dB?=
 =?utf-8?Q?VrQSYeqVJkXuBC4oG1Rv2t+U7bT8xRYYTvUKZmn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0ttY3B3elRBZVJQYm4zSDJTV0xRY2xWUlhhelNnV2xNQU9wT056KzFqQWtT?=
 =?utf-8?B?UXROOWpScHdlS0pJbTM0UGtId0pXa1RhbHV6RysyQzdXbHRyZTdnQUdMUzRw?=
 =?utf-8?B?Ty80b01IWkRJUDN2aHM5WUpDS3UxZ2FxeXFtT2tvVTV4bXRqNk4yZmNiTjZ4?=
 =?utf-8?B?WEZuYXJMMHc2d1ZpVHJEYXdYV2JYUzhPSXcrYTh5WHhyMndZeUlYdUlkVFZM?=
 =?utf-8?B?bWlHM0Vyby80dEF6cE9oTE55aFlVZ1ZRc3htdG9SajJUVEZqQU9YZHBPMHp3?=
 =?utf-8?B?RFZoc1RlOS9HVDVCL2FnK05kbk9NWHBXRWQvRVJuUTI5QTFReDQrdmNjWGtT?=
 =?utf-8?B?aE1xa1ZmV3NEWi9zblIvNlpWN0dvUkVvWWs5aTJud3pILzNyQWQ3SWxpaDNR?=
 =?utf-8?B?UjExTTlaWEZWRDBxQjJoNEorV3RIRlRvMFE0UHZuVHFNdmNidVJXb0xOMDFp?=
 =?utf-8?B?M3p0dTZTUGEralM4QlZJVHlrWkUrMjBCTXZjOWJRd2hEZTlJa0dwdGlqMSs0?=
 =?utf-8?B?Y1hqcE03NGlOVjFDQ1RpWGNPT05WWWVuWXJ6UEF6d0tJVVgvZks5ZWNpWE15?=
 =?utf-8?B?V1dMZ3dCTitzUW5yT2NCMEwzTmRuNEZSOUp0WnlQbWJFZ0s2S1BvbERxWlJM?=
 =?utf-8?B?b2x6SmFaUndEeWxHcnREenFLSHlrSGkvNjZrK3FUOWtnSnBzeUIwbEc4VzBv?=
 =?utf-8?B?ak81SmZHam53U3ZNdk1vTVBLR2hQTVE0NDAzekRuUThVTnNSRUwyZmJSSFlL?=
 =?utf-8?B?WmJrWWxaM2FFOWxLYkJ3ekl6ZC9YeWxQY2tWR3E2WGVHTFBFZVpVem9PeDdE?=
 =?utf-8?B?dm9IWXE3V0xTRXl6M1dnVHhrT1M3YkVNTTR5bWV3SGRGNlJEdzl1cnpiZnk4?=
 =?utf-8?B?eXJla29jTStaaXFaZUd4YWw4TWtsdE5adVRhNFRORERhVUpaM0F1M21EVmpR?=
 =?utf-8?B?R1hUWk1PN055L1JRekxlWGI0ZUNSRnY0L1JWRkRPZnNuazE1M1lNOEhGZEw3?=
 =?utf-8?B?VXZmS2lZYlUyWHQ5MHQ4Yk1iQ1kwdnBGL2tiNUtsQjNCWGFFU245Z01aTFZH?=
 =?utf-8?B?aTA3bS9MZ1RwWDNCQ1FtaEUrRm95cnFGclI3Sno2dThTVDB1NFNLUlZZcUtT?=
 =?utf-8?B?OWM1dk02eitRN09TOUxuZFdacDU1MS9Fb09pVk8vUXNNVE1keWZHeVpiSWxn?=
 =?utf-8?B?UnU5REtFbmplSDlEMVdRQUJyY244dlU0Y2MvcUwvcUVKY0R0RWV2U3FISlRD?=
 =?utf-8?B?K1pscGZNRlBDR3BHYlQrVEFYS1NHdUdzbkJUUElCMlZDNnhqZ1NCdnc4WXpl?=
 =?utf-8?B?c05rMVBnUUZ3a1R0Wk51YS92T1NpdFRUQlREaWtHcE5keXhNMmFxK2tGRUhG?=
 =?utf-8?B?Zy8xTitmQm1iNlRiM3A4SEFmdXo2TUhWeFRKOWFaVGlZRmJwbk5wYkw3VjRJ?=
 =?utf-8?B?UDlsN1FoS1BzUytFckNLc0QxczF5dEl4UWM1R3NWL0xkVTFtUmtFOWpvUU5x?=
 =?utf-8?B?eVpvejZhT3hCbW5VUlg1M1NNNWNmQjlTaWxhRjVhNWJyb29PZGd5OER4TFRh?=
 =?utf-8?B?eDFlaWtDcjcweHMxc3ViaDVGYVErY2tJMFhPTWU5ZHlSbUJyZUQyZVNPSHkv?=
 =?utf-8?B?Y2Nla1JrKzlKbi9HT09KMDNYRUFoOFVEYXB1QXV3ektVZ3E0b2xhSUxzcnhm?=
 =?utf-8?B?U2U2bU5rRlY4VGs1Z3FUOFRLOExjN1pTYXVLV044Tk1EZVMvT3hOZDFTdkY0?=
 =?utf-8?B?UlJPdTRDbkF1ejF3TGU1VFp5OUdqek80NTFyN2d1eGt4b3RkeDE4aFltRDdG?=
 =?utf-8?B?Qy9IUjZ5a1hSazRQRnpvdU4xV05XNEdsNUhIYkZmTnNvQUs3Qi9QamVNRjdl?=
 =?utf-8?B?KzF0eDNEUWhYTmQ2YitaN3ZxS3ZXUlpRdHBkV2o1WlFETG8xSzdpK3o1WHRj?=
 =?utf-8?B?L0JyL2N0K3VuZFYydTlFVEZ2YWtTeW16SURMdlJPWlFZWWhvYnJrQTh2eWUy?=
 =?utf-8?B?MlRaa0ZnQ2NHR2E2VkRhZ2RReDZCd0VVNjVrWmZ5K2hxZzFmbGYxWVlqcU41?=
 =?utf-8?B?N0pZNnhNYkpKbHAxVU9VU3pFU0g1TUpHemxpU3ZuR0FzTnE1QTNyVWVDOWJ0?=
 =?utf-8?Q?/Br4J3eEJi+PYCZI4UVaVXJiA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b30c91-ccdf-449b-a4d8-08dcfd2778e2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 23:21:55.5482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5C/qk+kb7VXlDYDrwcfAvmBuwK20urwEFihrWCMenRrudw1UrXouCMLGgvBjtdJIaQ9tSYdAkD9+I5PsbLxHzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6888
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

The change looks good to me.

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2024-11-04 01:57, Jesse.zhang@amd.com wrote:
> Because drm schedule no longer uses the parameter ring_id for scheduling.
> Instead, it selects the ring with less load to schedule the job. See the kernel
> function drm_sched_job_arm. Therefore, in order to verify each available ring on
> a certain IP, it can use the schedule debugfs interface.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_deadlock_helpers.c | 148 +++++++++++++++++++++----
>  lib/amdgpu/amd_dispatch.c         | 173 +++++++++++++++++++++++++-----
>  lib/amdgpu/amd_dispatch.h         |   1 +
>  tests/amdgpu/amd_queue_reset.c    |   2 +-
>  4 files changed, 276 insertions(+), 48 deletions(-)
>
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 39641ce23..e8b731489 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -170,7 +170,8 @@ amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_ty
>  }
>  
>  static void
> -bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, unsigned int ring_id)
> +bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
> +			unsigned int ip_type, uint32_t priority)
>  {
>  
>  	const struct amdgpu_ip_block_version *ip_block = NULL;
> @@ -182,7 +183,11 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
>  
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
> -	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
> +
> +	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
> +		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
> +	else
> +		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
>  	igt_assert_eq(r, 0);
>  
>  	/* setup parameters */
> @@ -190,7 +195,7 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
>  	ring_context->pm4 = calloc(pm4_dw, sizeof(*ring_context->pm4));
>  	ring_context->pm4_size = pm4_dw;
>  	ring_context->res_cnt = 1;
> -	ring_context->ring_id = ring_id;
> +	ring_context->ring_id = 0;
>  	igt_assert(ring_context->pm4);
>  	ip_block = get_ip_block(device_handle, ip_type);
>  	r = amdgpu_bo_alloc_and_map(device_handle,
> @@ -216,27 +221,11 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, un
>  	free(ring_context);
>  }
>  
> -void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
> -{
> -	int r;
> -	struct drm_amdgpu_info_hw_ip info;
> -	uint32_t ring_id;
> -
> -	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
> -	igt_assert_eq(r, 0);
> -	if (!info.available_rings)
> -		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
> -
> -	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
> -		bad_access_helper(device_handle, cmd_error, ip_type, ring_id);
> -	}
> -}
> -
>  #define MAX_DMABUF_COUNT 0x20000
>  #define MAX_DWORD_COUNT 256
>  
>  static void
> -amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, unsigned int ring_id)
> +amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
>  {
>  	int j, r;
>  	uint32_t *ptr, offset;
> @@ -256,7 +245,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, u
>  	}
>  	ring_context->secure = false;
>  	ring_context->res_cnt = 2;
> -	ring_context->ring_id = ring_id;
> +	ring_context->ring_id = 0;
>  	igt_assert(ring_context->pm4);
>  
>  	r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
> @@ -327,18 +316,131 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type, u
>  	free_cmd_base(base_cmd);
>  }
>  
> +void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type)
> +{
> +	int r;
> +	FILE *fp;
> +	char cmd[1024];
> +	char buffer[128];
> +	long sched_mask = 0;
> +	struct drm_amdgpu_info_hw_ip info;
> +	uint32_t ring_id, prio;
> +	char sysfs[125];
> +
> +	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
> +	igt_assert_eq(r, 0);
> +	if (!info.available_rings)
> +		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
> +
> +	if (ip_type == AMD_IP_GFX)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
> +	else if (ip_type == AMD_IP_COMPUTE)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
> +	else if (ip_type == AMD_IP_DMA)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
> +
> +	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
> +	r = access(sysfs, R_OK);
> +	if (!r) {
> +		fp = popen(cmd, "r");
> +		if (fp == NULL)
> +			igt_skip("read the sysfs failed: %s \n",sysfs);
> +
> +		if (fgets(buffer, 128, fp) != NULL)
> +			sched_mask = strtol(buffer, NULL, 16);
> +
> +		pclose(fp);
> +	} else {
> +		sched_mask = 1;
> +		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
> +	}
> +
> +	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
> +		/* check sched is ready is on the ring. */
> +		if (!((1 << ring_id) & sched_mask))
> +			continue;
> +
> +		/* for the gfx/compute multiple rings, the first queue
> +		 * is high priority. it need create a high ctx
> +		 */
> +		if ((sched_mask > 1) && (ring_id == 0) &&
> +			(ip_type == AMD_IP_COMPUTE ||
> +			 ip_type == AMD_IP_GFX)) {
> +			prio = AMDGPU_CTX_PRIORITY_HIGH;
> +		} else {
> +			prio = AMDGPU_CTX_PRIORITY_NORMAL;
> +		}
> +
> +		if (sched_mask > 1) {
> +			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +						0x1 << ring_id, sysfs);
> +			r = system(cmd);
> +			igt_assert_eq(r, 0);
> +		}
> +
> +		bad_access_helper(device_handle, cmd_error, ip_type, prio);
> +	}
> +
> +	/* recover the sched mask */
> +	if (sched_mask > 1) {
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
> +		r = system(cmd);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +}
> +
>  void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
>  {
>  	int r;
> +	FILE *fp;
> +	char cmd[1024];
> +	char buffer[128];
> +	long sched_mask = 0;
>  	struct drm_amdgpu_info_hw_ip info;
>  	uint32_t ring_id;
> +	char sysfs[125];
>  
>  	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
>  	igt_assert_eq(r, 0);
>  	if (!info.available_rings)
>  		igt_info("SKIP ... as there's no ring for the sdma\n");
>  
> -	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++)
> -		amdgpu_hang_sdma_helper(device_handle, hang_type, ring_id);
> +	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
> +	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
> +	r = access(sysfs, R_OK);
> +	if (!r) {
> +		fp = popen(cmd, "r");
> +		if (fp == NULL)
> +			igt_skip("read the sysfs failed: %s \n",sysfs);
> +
> +		if (fgets(buffer, 128, fp) != NULL)
> +			sched_mask = strtol(buffer, NULL, 16);
> +
> +		pclose(fp);
> +	} else
> +		sched_mask = 1;
> +
> +	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
> +		/* check sched is ready is on the ring. */
> +		if (!((1 << ring_id) & sched_mask))
> +			continue;
> +
> +		if (sched_mask > 1) {
> +			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +						0x1 << ring_id, sysfs);
> +			r = system(cmd);
> +			igt_assert_eq(r, 0);
> +		}
> +
> +		amdgpu_hang_sdma_helper(device_handle, hang_type);
> +	}
> +
> +	/* recover the sched mask */
> +	if (sched_mask > 1) {
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
> +		r = system(cmd);
> +		igt_assert_eq(r, 0);
> +	}
>  }
>  
> diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
> index 5b4698a83..d5b94e864 100644
> --- a/lib/amdgpu/amd_dispatch.c
> +++ b/lib/amdgpu/amd_dispatch.c
> @@ -14,7 +14,7 @@
>  
>  static void
>  amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
> -			    uint32_t ip_type, uint32_t ring,
> +			    uint32_t ip_type, uint32_t priority,
>  			    uint32_t version)
>  {
>  	amdgpu_context_handle context_handle;
> @@ -37,7 +37,11 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  
>  	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
>  
> -	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
> +		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
> +	else
> +		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +
>  	igt_assert_eq(r, 0);
>  
>  	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
> @@ -121,7 +125,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  	ib_info.ib_mc_address = mc_address_cmd;
>  	ib_info.size = base_cmd->cdw;
>  	ibs_request.ip_type = ip_type;
> -	ibs_request.ring = ring;
> +	ibs_request.ring = 0;
>  	ibs_request.resources = bo_list;
>  	ibs_request.number_of_ibs = 1;
>  	ibs_request.ibs = &ib_info;
> @@ -136,7 +140,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  
>  	fence_status.ip_type = ip_type;
>  	fence_status.ip_instance = 0;
> -	fence_status.ring = ring;
> +	fence_status.ring = 0;
>  	fence_status.context = context_handle;
>  	fence_status.fence = ibs_request.seq_no;
>  
> @@ -162,8 +166,8 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
>  int
>  amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  				amdgpu_context_handle context_handle_param,
> -				uint32_t ip_type, uint32_t ring, uint32_t version,
> -				enum cmd_error_type hang,
> +				uint32_t ip_type, uint32_t ring, uint32_t priority,
> +				uint32_t version, enum cmd_error_type hang,
>  				struct amdgpu_cs_err_codes *err_codes)
>  {
>  	amdgpu_context_handle context_handle_free = NULL;
> @@ -188,9 +192,15 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	struct amdgpu_cmd_base *base_cmd = get_cmd_base();
>  
>  	if (context_handle_param == NULL) {
> -		r = amdgpu_cs_ctx_create(device_handle, &context_handle_in_use);
> -		context_handle_free = context_handle_in_use;
> -		igt_assert_eq(r, 0);
> +		if( priority == AMDGPU_CTX_PRIORITY_HIGH) {
> +			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle_in_use);
> +			context_handle_free = context_handle_in_use;
> +			igt_assert_eq(r, 0);
> +		} else {
> +			r = amdgpu_cs_ctx_create(device_handle, &context_handle_in_use);
> +			context_handle_free = context_handle_in_use;
> +			igt_assert_eq(r, 0);
> +		}
>  	} else {
>  		context_handle_in_use = context_handle_param;
>  	}
> @@ -303,7 +313,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  	ib_info.ib_mc_address = mc_address_cmd;
>  	ib_info.size = base_cmd->cdw;
>  	ibs_request.ip_type = ip_type;
> -	ibs_request.ring = ring;
> +	ibs_request.ring = 0;
>  	ibs_request.resources = bo_list;
>  	ibs_request.number_of_ibs = 1;
>  	ibs_request.ibs = &ib_info;
> @@ -314,7 +324,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  
>  	fence_status.ip_type = ip_type;
>  	fence_status.ip_instance = 0;
> -	fence_status.ring = ring;
> +	fence_status.ring = 0;
>  	fence_status.context = context_handle_in_use;
>  	fence_status.fence = ibs_request.seq_no;
>  
> @@ -357,7 +367,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  
>  static void
>  amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
> -				      uint32_t ip_type, uint32_t ring,
> +				      uint32_t ip_type, uint32_t priority,
>  				      int version, uint32_t gpu_reset_status_equel)
>  {
>  	amdgpu_context_handle context_handle;
> @@ -386,7 +396,11 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  	r = amdgpu_query_gpu_info(device_handle, &gpu_info);
>  	igt_assert_eq(r, 0);
>  
> -	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	if( priority == AMDGPU_CTX_PRIORITY_HIGH)
> +		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &context_handle);
> +	else
> +		r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +
>  	igt_assert_eq(r, 0);
>  
>  	r = amdgpu_bo_alloc_and_map(device_handle, bo_cmd_size, 4096,
> @@ -487,7 +501,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  	ib_info.ib_mc_address = mc_address_cmd;
>  	ib_info.size = base_cmd->cdw;
>  	ibs_request.ip_type = ip_type;
> -	ibs_request.ring = ring;
> +	ibs_request.ring = 0;
>  	ibs_request.resources = bo_list;
>  	ibs_request.number_of_ibs = 1;
>  	ibs_request.ibs = &ib_info;
> @@ -497,7 +511,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
>  
>  	fence_status.ip_type = ip_type;
>  	fence_status.ip_instance = 0;
> -	fence_status.ring = ring;
> +	fence_status.ring = 0;
>  	fence_status.context = context_handle;
>  	fence_status.fence = ibs_request.seq_no;
>  
> @@ -538,8 +552,13 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  				 uint32_t ip_type)
>  {
>  	int r;
> +	FILE *fp;
> +	char cmd[1024];
> +	char buffer[128];
> +	long sched_mask = 0;
>  	struct drm_amdgpu_info_hw_ip info;
> -	uint32_t ring_id, version;
> +	uint32_t ring_id, version, prio;
> +	char sysfs[125];
>  
>  	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
>  	igt_assert_eq(r, 0);
> @@ -551,22 +570,78 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
>  		igt_info("SKIP ... unsupported gfx version %d\n", version);
>  		return;
>  	}
> -	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
> +
> +	if (ip_type == AMD_IP_GFX)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
> +	else if (ip_type == AMD_IP_COMPUTE)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
> +	else if (ip_type == AMD_IP_DMA)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
> +
> +	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
> +	r = access(sysfs, R_OK);
> +	if (!r) {
> +		fp = popen(cmd, "r");
> +		if (fp == NULL)
> +			igt_skip("read the sysfs failed: %s \n",sysfs);
> +
> +		if (fgets(buffer, 128, fp) != NULL)
> +			sched_mask = strtol(buffer, NULL, 16);
> +
> +		pclose(fp);
> +	} else
> +		sched_mask = 1;
> +
> +	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
> +		/* check sched is ready is on the ring. */
> +		if (!((1 << ring_id) & sched_mask))
> +			continue;
> +
> +		/* for the gfx/compute multiple rings, the first queue
> +		 * is high priority. it need create a high ctx
> +		 */
> +		if ((sched_mask > 1) && (ring_id == 0) &&
> +			(ip_type == AMD_IP_COMPUTE ||
> +			 ip_type == AMD_IP_GFX)) {
> +			prio = AMDGPU_CTX_PRIORITY_HIGH;
> +		} else {
> +			prio = AMDGPU_CTX_PRIORITY_NORMAL;
> +		}
> +
> +		if (sched_mask > 1) {
> +			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +						0x1 << ring_id, sysfs);
> +			r = system(cmd);
> +			igt_assert_eq(r, 0);
> +		}
> +
>  		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
> -					    ring_id,  version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
> +					    ring_id, prio, version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
>  		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
> -						      ring_id, version, AMDGPU_CTX_UNKNOWN_RESET);
> +						      prio, version, AMDGPU_CTX_UNKNOWN_RESET);
>  
> -		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id,
> +		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
>  					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL);
>  	}
> +
> +	/* recover the sched mask */
> +	if (sched_mask > 1) {
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
> +		r = system(cmd);
> +		igt_assert_eq(r, 0);
> +	}
>  }
>  
>  void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum cmd_error_type hang)
>  {
>  	int r;
> +	FILE *fp;
> +	char cmd[1024];
> +	char buffer[128];
> +	long sched_mask = 0;
>  	struct drm_amdgpu_info_hw_ip info;
> -	uint32_t ring_id, version;
> +	uint32_t ring_id, version, prio;
> +	char sysfs[125];
>  
>  	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
>  	igt_assert_eq(r, 0);
> @@ -581,11 +656,61 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
>  	if (version < 9)
>  		version = 9;
>  
> -	for (ring_id = 0; (1 << ring_id) & info.available_rings; ring_id++) {
> -		amdgpu_memset_dispatch_test(device_handle, ip_type, ring_id,
> +	if (ip_type == AMD_IP_GFX)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_gfx_sched_mask");
> +	else if (ip_type == AMD_IP_COMPUTE)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_compute_sched_mask");
> +	else if (ip_type == AMD_IP_DMA)
> +		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/0/amdgpu_sdma_sched_mask");
> +
> +	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
> +	r = access(sysfs, R_OK);
> +	if (!r) {
> +		fp = popen(cmd, "r");
> +		if (fp == NULL)
> +			igt_skip("read the sysfs failed: %s \n",sysfs);
> +
> +		if (fgets(buffer, 128, fp) != NULL)
> +			sched_mask = strtol(buffer, NULL, 16);
> +
> +		pclose(fp);
> +	} else
> +		sched_mask = 1;
> +
> +	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
> +		/* check sched is ready is on the ring. */
> +		if (!((1 << ring_id) & sched_mask))
> +			continue;
> +
> +		/* for the gfx/compute multiple rings, the first queue
> +		 * is high priority. it need create a high ctx
> +		 */
> +		if ((sched_mask > 1) && (ring_id == 0) &&
> +			(ip_type == AMD_IP_COMPUTE ||
> +			 ip_type == AMD_IP_GFX)) {
> +			prio = AMDGPU_CTX_PRIORITY_HIGH;
> +		} else {
> +			prio = AMDGPU_CTX_PRIORITY_NORMAL;
> +		}
> +
> +		if (sched_mask > 1) {
> +			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
> +						0x1 << ring_id, sysfs);
> +			igt_info("cmd: %s\n", cmd);
> +			r = system(cmd);
> +			igt_assert_eq(r, 0);
> +		}
> +		amdgpu_memset_dispatch_test(device_handle, ip_type, prio,
>  					    version);
> -		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id,
> +		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
>  					    version, hang, NULL);
>  	}
> +
> +	/* recover the sched mask */
> +	if (sched_mask > 1) {
> +		snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%lx > %s",sched_mask, sysfs);
> +		r = system(cmd);
> +		igt_assert_eq(r, 0);
> +	}
>  }
>  
> diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
> index 89c448a1f..8dbc4595b 100644
> --- a/lib/amdgpu/amd_dispatch.h
> +++ b/lib/amdgpu/amd_dispatch.h
> @@ -34,6 +34,7 @@ int amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
>  					amdgpu_context_handle context_handle,
>  					uint32_t ip_type,
>  					uint32_t ring,
> +					uint32_t priority,
>  					uint32_t version,
>  					enum cmd_error_type hang,
>  					struct amdgpu_cs_err_codes *err_codes);
> diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
> index de1550d3c..67570251d 100644
> --- a/tests/amdgpu/amd_queue_reset.c
> +++ b/tests/amdgpu/amd_queue_reset.c
> @@ -752,7 +752,7 @@ run_test_child(amdgpu_device_handle device, struct shmbuf *sh_mem,
>  		pthread_mutex_unlock(&param->local_mem.mutex);
>  
>  		if (is_dispatch) {
> -			ret = amdgpu_memcpy_dispatch_test(device, local_context, job.ip, job.ring_id, version,
> +			ret = amdgpu_memcpy_dispatch_test(device, local_context, job.ip, job.ring_id, 0,version,
>  					job.error, &err_codes);
>  		} else {
>  			ret = amdgpu_write_linear(device, local_context,
