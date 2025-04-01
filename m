Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1F8C36008
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 04:22:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8887910E24C;
	Tue,  1 Apr 2025 04:22:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NBSNSitb";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAB410E24C
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 04:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YOuHBQRHLtsaeyK0y7lgTqV8qv4d5IU6jjs23FV2FK1QwNDOXi9ivenvkJiw5vxwyV9GghMGMEMJy/EARLxYq+Drz6ExCyROALF0jFgUk759F74Kzj9itmt8VLm9EJXKqUE/9stikXcyyLsSvLzsYABZ2kH7v+1U8mP2v65k0whGShH6yDT8kV4O6cz1HVuJS/MeVLQhkXCiHih/Mz0vnXxRjP+3++sqMhck5X8J0vesHzzMOlTlnZpAZ2qaYKgciKCFw7odtVjOG5KpeEj0qZ32XpLlGHTn6tWg1XyVDoWvHykLsnTGOhz2wWzY/dOASf3c2SmMz9LsjSdKeuqnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fwzm2dD+M1qQQr3jTLlkXvLVEbhhFOGwigI5kdRsD60=;
 b=QUwQTjmJ+/zPMniSwC/RIOlyau2SpfmcJ7L5GbByKEKT0FJU1JujEew1IJHTC0bLG5WwxRLf9E8gg1u8qYx08JjacVTtOgMw+uYOPsZ4qvGu9NZVRUB/us7hpsj5D3W1PqqOi6TP5cUjfDstlLGc9w5jaUSlPtAjH18h5E4z1H72Shz3agDeLWvQLuorBcK11+a6ag78fhB/q3cnjVNS7FxCjIOm+clHpH8iXAJ8dayU0Py8/iX/fIotuSxRr0pue6nIT8hXyTuEDThX7XDjy3ZwYJ96APEUhaROYhQ/LIC5ERijabmuDf7MTRxpGGvw5wbGwevbqiFqLWBYUnWznA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fwzm2dD+M1qQQr3jTLlkXvLVEbhhFOGwigI5kdRsD60=;
 b=NBSNSitbIW4AR5lW6dwBQKQcM9b968Oyt2NvFa6x+mibfUSjTIbEsSRaj5ZHTlJpoWkuLbE82AxtM3HUPvLIPM/xm24BFiyzieR0wNAtrjYZah4qJWncG1ua+Af8obdAlPhJQpu/mCSapacdCfFQ4GwhyVlDFCaNR6Fpm/597Qs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by DS7PR12MB6334.namprd12.prod.outlook.com (2603:10b6:8:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 04:21:50 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 04:21:50 +0000
Message-ID: <5d4f05f3-5dea-4062-a609-71e932af7e9c@amd.com>
Date: Tue, 1 Apr 2025 00:21:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/19] lib/amdgpu: Add support of amd user queues
To: Sunil Khatri <sunil.khatri@amd.com>, igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20250328082416.1469810-1-sunil.khatri@amd.com>
 <20250328082416.1469810-4-sunil.khatri@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250328082416.1469810-4-sunil.khatri@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|DS7PR12MB6334:EE_
X-MS-Office365-Filtering-Correlation-Id: 339ee38d-a6a6-4220-eb33-08dd70d4b926
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NE9KclBZU1d5ZTZtUjdLakFCRzZPMTZML0p4SGxBZ0dsSkp5VC9pV1FldkxF?=
 =?utf-8?B?OG5vNU1tQWQyRTdjSmE5SHFpRFVobGplbkFpZXZTcnorNEtBOGNlYWZwVkIr?=
 =?utf-8?B?MzROblBFbHZ4MmQyRDhuMDVnS0FwN1IxbnFONnlBM0lNdDJHaG9KNDFmdEQw?=
 =?utf-8?B?ZUx2UGVyVGFIMmd1RjJlczhYME5WQXZUK0toWi8vNE5COVJOSkRJOWRMeDlo?=
 =?utf-8?B?dGt5cGVqd3o0cTZxMkRwMTQrZWk5KzJvUzM4VDJlTGlSVUpvS3djNVZHbXE0?=
 =?utf-8?B?UDdjWFhheFJOaFVaYldONWhTL2pKUzkxWnRaUVhLK0Y4T3JhTGprUFd0d1dl?=
 =?utf-8?B?T3BuaG9zRnFKb0pwK3JCdHppelA2bHF4K2xud0dVcGY1b21WNTB4eDlTbzRW?=
 =?utf-8?B?MDltNlJYYkxqL01xMzVydlV3ZDRRZ3JsVC9oQzhxbU5pZ0hkSk5JRTYrTEgy?=
 =?utf-8?B?VUFVaTVzWFVTRGRxa2lMNk1ETTZ0QTcwNmVqZFV5YW9UNFk5aXJKcHNLbWFw?=
 =?utf-8?B?TnNuTkpVbXY2cXRINC9Cd0MydDdmN3hMaEU5a2dIUXY4ZEFYU21ZTXVCdC9N?=
 =?utf-8?B?TnRXZ1E5cUVld0NCZFJrMmJQMitoWkRnZWZNWWxCUmU3TkZ1MmJhck56ekNo?=
 =?utf-8?B?Zi9KaXlLVTRaYktWNENOUUphTlI5Nmx6bk9RZlZ4MGwrNVQxVkFlclVpU2Fz?=
 =?utf-8?B?ZmpWZjJ2WnJ1aWVPbGdPVjlBZTRxaGFkaExjdmR3TENieDlrR0pRcmhyeDB5?=
 =?utf-8?B?eGxJemFaU0RXYTJva2RYaForUTYzck9ZMVlRZjEyOHNjSmR0Y0FTd0RDMkRP?=
 =?utf-8?B?RFBJbnZDNWoxODVoQ0MyTHAzOWdJRkRhd3pwaktaTTA0OHdLbUdDbGxVZENM?=
 =?utf-8?B?aHh6M2thdmdKbHd0T1ZtWE92K1cydWZkN2tTem52OFlzSG1kT0dMc0tMdXVx?=
 =?utf-8?B?bFQ4Q1dCUkxod1RoUy9Gd0UxMkNSM3c0QkwzMUZNTEpYZGFnOEk3NWRRdWU2?=
 =?utf-8?B?NVhGSXVmekplREYxME92WGlhNzQ5UHg5enk4aUdlaHg1OUVhYTJLTHFReE4y?=
 =?utf-8?B?bEVuZ0x2Y0RyT0Y1dlNwQWRSK2FlWjhjSzZqUnpsQWd5bDdFTUo3VlBHRHc0?=
 =?utf-8?B?LzBhby9FMzRLTlNyaWxNOFFkeEMvL0VmYXFsYnM1UDQ4d3dMdmtWWnRMbmhP?=
 =?utf-8?B?T3hlUzUzYmxPQXp4VGdKK0VORHJicEVOUXNybWlDdDRqM1hWNWl4bndXRC9W?=
 =?utf-8?B?dFBJNERhdG9LVTduWDZ5MG0vRTk2VHprU3VwTkU1MjUzd1p2aHhadWNWVUhk?=
 =?utf-8?B?MVZiTGdOcWNqRUpxZXJpa0NGcHhXREtwV0h0R2dod1lLdFBVREFNV0cxR3FM?=
 =?utf-8?B?UkxUV3AzYm1lbHFYblBxd1RHMXZRRG4xNDBlR2xvTVpkZys0TTBGcVdHaEtE?=
 =?utf-8?B?L28yZkk5czlQL2dLQmxuYmhBOFhPcnRkbjJnSUNtZ2Z6dEEveVFWWStnTU44?=
 =?utf-8?B?QTc4bFBSM0VSUDRMVE5QYjdLNDJTTFQwcDRPU2ZuQVNHWGNoTGdtcWF6TllO?=
 =?utf-8?B?a29WRXNwZGc1cDY3MjBGc0sxTHhQaitnNnIxQTBPalFOaUpXZFBFSHdxaU03?=
 =?utf-8?B?UUFtd1N5bXJNb3dFZUxua0dteWpUUWNDMlhnZ3EvL3hENFpJbmc1MnppQTJr?=
 =?utf-8?B?K0ZYajJEMVFGRnBoenE2Nk12RzRPS3V4b3VNdEVRenZ0bU94OHdSS0h5SmJL?=
 =?utf-8?B?WkdrVEdNM0dWaWRkeDdzdW1CTzRLNWhTK0FrR0xwaXROMlRvOHV6U3AxdVB3?=
 =?utf-8?B?OUdFQWZpdHJqaE5wWS9mR0hzODZKdWcxVmdpV0tPOTNHRXJNcVRKKzNWRWZn?=
 =?utf-8?Q?iP7cOf0uRzYXX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXpqdDhTQkFXYXpsaWMwNEwzc3R3NnROa2VkdXpKNFV1WTk0QjRMMkszWm1l?=
 =?utf-8?B?L3VNU1pybUNLQjNJbUZNaVBBNlFjdXdncGdDMmlKNlNuWHVoRmlSelRXSGQv?=
 =?utf-8?B?cS83TXNDLzJ4aWxCZXg5Uy9jRlhtUCtwWWNOYk9wdENsMHpkUXRWay8wckxw?=
 =?utf-8?B?eTRUejg1dkxmbE9ZNWxBN0p1Ym9Vc3VEMm85WEtNN2g0M2JOZzI3dUp0OTFy?=
 =?utf-8?B?Z2Z0VGV0SHU3cTNqcmZTTzhSckRQQkZzY3hQQm1IK1FJWTlyTXpMOHc4SzRu?=
 =?utf-8?B?K3BVMTc1TVY2bklHUy9rYkdjeDJpa0kwakJzeXFwdElLOTJrM1FBeFlYa0tJ?=
 =?utf-8?B?eFF3VWlrTGxRYTQ4QTNCMnl3UnBVTitZc2NVVXFCV0ZvSWlXc1dtMm9aUUFw?=
 =?utf-8?B?NnU0YmhVMTB4dnVnaVowc2xTbWppd3J4WjJPVTN0SGZlbVBQRlh0am0rdEh3?=
 =?utf-8?B?YnpES3RkRmxISGdDM042OUhOWTBlNzBBcjdYbms5YkxyWWM5VmU1OHBsT090?=
 =?utf-8?B?Tk8yd0M3TTFhWWhuckd0aUtSZjVqcStlRXc5NXVYN1FMdUNsdURTdWIwMEpW?=
 =?utf-8?B?RE5IbUlBcnhuM1lGYnR4SFAzZEhoa2djcXF6S3BBSzVkNDNPTUE5V3BaTG9p?=
 =?utf-8?B?aE0wVEpCQkcyN29OWldCUTZObGVMcUNtRk12T01SRHJyYnYwUTRXbEJEZm14?=
 =?utf-8?B?MmxKcHFieFRQdEVCcmhFVnB5bXhDSTlWZVQ3U1VTZDNBa1ZDRUVHUnJYRVVu?=
 =?utf-8?B?ZHBmNDVoWFFmdXR2WEtGRGxZVkluLzV6OVAzODRlMThzQUZ1Y1o1Tkt3Tm9o?=
 =?utf-8?B?bTdsR2JYN0o3dlI1eCtsbWkzSDR3SFl1bm9iUUo4cWV1bzR2Uk1QZkxkSEY4?=
 =?utf-8?B?Wk1qZXRPS1dUM09ydTd2NDN4SWdoM1JaVTlqa3VuZ0FoVGhhdGtVQnJVRUhE?=
 =?utf-8?B?WEdibmRkOG1OYkJHNS9OWmJkdGo2RVluVVk1ZHZNdGV3cC9OZ0hhUXgzaEhr?=
 =?utf-8?B?cm9GNTh2Qi9ON3duMGkrdWlaczZZdjczeXVTVy9VUFQrNDhjaVA4R2xGakZQ?=
 =?utf-8?B?SHZBcHl4cnVUVFBPL3llcStGNTNBblFpbUtwTjJYS1Rvd291dDFqbWFhUG1B?=
 =?utf-8?B?eFJKTHdtbEFGRUJtQXRha205T2VNZ0NCM1lVbzVhb3lnaUZ0TnNqb0h3bEYv?=
 =?utf-8?B?dEpNK3pLMENaWVljaExwRDRnaFBGZzVMNnhVQTUzWkU3ek5wKzZVSDBiVm4w?=
 =?utf-8?B?RjI4R3JqN1JnakRTbVlodEV4NU9kWkpEZ3FDZTVDemdxa0xWamxodnVCaGt1?=
 =?utf-8?B?d25VYTNRTmIwUk1lK1BNWloyWGowT01ycmRhc09IWlZTT2pSNEMyWi9MU1dt?=
 =?utf-8?B?MFFRTVlYMmdXRG1NQWhLOWt4WDZVTVFaU1VyaFg5OVc1T24xNmczdklHeWNl?=
 =?utf-8?B?NS9adFZHSGdwNjVnQ0JENmNiWVMrQUJYMGVBQ2NSUzhpaGVZUWFtVFNXS1d3?=
 =?utf-8?B?N0NXdFZvNjAzRUdzbmtTMDFkUnd3aHJDQ205NmRhVzNWTjBPem4yMjYvVjFp?=
 =?utf-8?B?M1MveUlqaEJTMUpFcG4venVhbEdjd0ZLQ0gzc2lZbHJ0QktEcmNnRFMvaWJi?=
 =?utf-8?B?VmFjMmVkWGNwZ1h6cHpNajRXQVIrbkxVWmN5TXArOUFUdElrdWVTbngyZmdR?=
 =?utf-8?B?d1BoK2RXTHBDNk9PaERCc0NiclV5R3dObElub2hDUUp0cEJENm8rMjltM1JX?=
 =?utf-8?B?Sk1mVng3d2plbjJjQk5zcE9Eek5iSm12SnY2blZraFJNSGRIT2NHM1Y2MWN3?=
 =?utf-8?B?RWhnNmpaZ2VGcDdCZXBBK3RKbGVHRThZZ1I0MFRVcFNzZFdNZjlpTHg0YnpS?=
 =?utf-8?B?WUMrMVlTNmZORFFTMWFVRllqSnNBOFhvZ3RoalpoeStFV2poQTIwK1EzV2xQ?=
 =?utf-8?B?M0hiNGI3Q3RuaHlmemIyU1BCSytJNE4vSWlHT2pIUHRDSGlDTkM2REg3WVh6?=
 =?utf-8?B?cDNDa0dNRUplYk5ZSCttU2FOWTZtaUZueExlNXpHekk3TGRteklVY3NnbU01?=
 =?utf-8?B?SXo2aVBUOXZzOGJDaE9VOFpKNzJrQTJkRlFQLzFrb1dWcnl1ZkhnZFM4RzVB?=
 =?utf-8?Q?wjJoR8BdQC6aRw0o5F1v4aOOb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 339ee38d-a6a6-4220-eb33-08dd70d4b926
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 04:21:49.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S6F3KXYj/0PcqB01hA/PXr8hHaMYBpgza/fSSiSlC9sIxzAyyOhpFxLH26112vnsRKy7HhgBmfHASf1hq/TsNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6334
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


On 2025-03-28 04:24, Sunil Khatri wrote:
> This is the first patch set to add support of
> UMQ(User mode queues) submission in IGT.
>
> UMQ allows users to directly create a user queue and
> submit workload to the GPU h/w to directly instead
> of sending the workload to kernel and then to GPU h/w.
>
> This will be used by test cases which will be testing
> the UMQ queues for gfx/compute and sdma to start with.
>
> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
> ---
>  lib/amdgpu/amd_PM4.h        |   3 +
>  lib/amdgpu/amd_ip_blocks.h  |   5 +
>  lib/amdgpu/amd_user_queue.c | 418 ++++++++++++++++++++++++++++++++++++
>  lib/amdgpu/amd_user_queue.h |  48 +++++
>  lib/meson.build             |   3 +-
>  5 files changed, 476 insertions(+), 1 deletion(-)
>  create mode 100644 lib/amdgpu/amd_user_queue.c
>  create mode 100644 lib/amdgpu/amd_user_queue.h
>
> diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
> index 5bc3cb783..8f59b4223 100644
> --- a/lib/amdgpu/amd_PM4.h
> +++ b/lib/amdgpu/amd_PM4.h
> @@ -192,6 +192,9 @@
>  		 * 1 - pfp
>  		 */
>  
> +#define PACKET3_INDIRECT_BUFFER                         0x3F
> +#define PACKET3_PROTECTED_FENCE_SIGNAL                  0xd0
> +
>  #define	PACKET3_WRITE_DATA				0x37
>  #define		WRITE_DATA_DST_SEL(x)                   ((x) << 8)
>  		/* 0 - register
> diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
> index 577b38387..85d69f5c6 100644
> --- a/lib/amdgpu/amd_ip_blocks.h
> +++ b/lib/amdgpu/amd_ip_blocks.h
> @@ -27,6 +27,11 @@
>  #define AMDGPU_RESET_TYPE_PER_QUEUE (1 << 2) /* per queue */
>  #define AMDGPU_RESET_TYPE_PER_PIPE (1 << 3) /* per pipe */
>  
> +/* User queue */
> +#define   S_3F3_INHERIT_VMID_MQD_GFX(x)        (((unsigned int)(x)&0x1) << 22)/* userqueue only */
> +#define   S_3F3_VALID_COMPUTE(x)		(((unsigned int)(x)&0x1) << 23)/* userqueue only */
> +#define   S_3F3_INHERIT_VMID_MQD_COMPUTE(x)	(((unsigned int)(x)&0x1) << 30)/* userqueue only */
> +
>  enum amd_ip_block_type {
>  	AMD_IP_GFX = 0,
>  	AMD_IP_COMPUTE,
> diff --git a/lib/amdgpu/amd_user_queue.c b/lib/amdgpu/amd_user_queue.c
> new file mode 100644
> index 000000000..9412a37e8
> --- /dev/null
> +++ b/lib/amdgpu/amd_user_queue.c
> @@ -0,0 +1,418 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include "amd_user_queue.h"
> +#include "amd_memory.h"
> +#include "amd_PM4.h"
> +#include "ioctl_wrappers.h"
> +
> +void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
> +			   unsigned int size, unsigned int domain)
> +{
> +	struct amdgpu_bo_alloc_request req = {0};
> +	amdgpu_bo_handle buf_handle;
> +	int r;
> +
> +	req.alloc_size = ALIGN(size, PAGE_SIZE);
> +	req.preferred_heap = domain;
> +	r = amdgpu_bo_alloc(device_handle, &req, &buf_handle);
> +	igt_assert_eq(r, 0);
> +
> +	doorbell_bo->handle = buf_handle;
> +	doorbell_bo->size = req.alloc_size;
> +
> +	r = amdgpu_bo_cpu_map(doorbell_bo->handle,
> +			      (void **)&doorbell_bo->ptr);
> +	igt_assert_eq(r, 0);
> +}
> +
> +int
> +amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> +			   unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> +			   uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> +			   uint64_t *mc_address, amdgpu_va_handle *va_handle,
> +			   uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +	struct amdgpu_bo_alloc_request request = {};
> +	amdgpu_bo_handle buf_handle;
> +	uint64_t vmc_addr;
> +	int r;
> +
> +	request.alloc_size = size;
> +	request.phys_alignment = alignment;
> +	request.preferred_heap = heap;
> +	request.flags = alloc_flags;
> +
> +	r = amdgpu_bo_alloc(device_handle, &request, &buf_handle);
> +	if (r)
> +		return r;
> +
> +	r = amdgpu_va_range_alloc(device_handle,
> +				  amdgpu_gpu_va_range_general,
> +				  size, alignment, 0, &vmc_addr,
> +				  va_handle, 0);
> +	if (r)
> +		goto error_va_alloc;
> +
> +	r = amdgpu_bo_va_op_raw2(device_handle, buf_handle, 0,
> +				 ALIGN(size, getpagesize()), vmc_addr,
> +				 AMDGPU_VM_PAGE_READABLE |
> +				 AMDGPU_VM_PAGE_WRITEABLE |
> +				 AMDGPU_VM_PAGE_EXECUTABLE |
> +				 mapping_flags,
> +				 AMDGPU_VA_OP_MAP,
> +				 timeline_syncobj_handle,
> +				 point, 0, 0);
> +	if (r)
> +		goto error_va_map;
> +
> +	if (cpu) {
> +		r = amdgpu_bo_cpu_map(buf_handle, cpu);
> +		if (r)
> +			goto error_cpu_map;
> +	}
> +
> +	*bo = buf_handle;
> +	*mc_address = vmc_addr;
> +
> +	return 0;
> +
> +error_cpu_map:
> +	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
> +error_va_map:
> +	amdgpu_va_range_free(*va_handle);
> +error_va_alloc:
> +	amdgpu_bo_free(buf_handle);
> +	return r;
> +}
> +
> +void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle, amdgpu_bo_handle bo,
> +			    amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
> +			    uint32_t timeline_syncobj_handle, uint64_t point,
> +			    uint64_t syncobj_handles_array, uint32_t num_syncobj_handles)
> +{
> +	amdgpu_bo_cpu_unmap(bo);
> +	amdgpu_bo_va_op_raw2(device_handle, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP,
> +				  timeline_syncobj_handle, point,
> +				  syncobj_handles_array, num_syncobj_handles);
> +	amdgpu_va_range_free(va_handle);
> +	amdgpu_bo_free(bo);
> +}
> +
> +int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> +				 uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
> +	int r;
> +
> +	r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
> +				     &point, 1, flags);
> +	if (r)
> +		return r;
> +
> +	r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
> +					    &point, 1, INT64_MAX,
> +					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +					    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +					    NULL);
> +	if (r)
> +		igt_warn("Timeline timed out\n");
> +	return r;
> +}
> +
> +void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> +			      unsigned int ip_type, uint64_t mc_address)
> +{
> +	int r;
> +	uint32_t *npkt = &ring_context->npkt;
> +	uint32_t *queue_cpu = ring_context->queue_cpu;
> +	uint32_t control = ring_context->pm4_dw;
> +	uint32_t syncarray[1];
> +
> +	struct drm_amdgpu_userq_signal signal_data;
> +
> +	/* Prepare the Indirect IB to submit the IB to user queue */
> +	queue_cpu[(*npkt)++] = PACKET3(PACKET3_INDIRECT_BUFFER, 2);
> +	queue_cpu[(*npkt)++] = lower_32_bits(mc_address);
> +	queue_cpu[(*npkt)++] = upper_32_bits(mc_address);
> +
> +	if (ip_type == AMD_IP_GFX)
> +		queue_cpu[(*npkt)++] = control | S_3F3_INHERIT_VMID_MQD_GFX(1);
> +	else
> +		queue_cpu[(*npkt)++] = control | S_3F3_VALID_COMPUTE(1)
> +					       | S_3F3_INHERIT_VMID_MQD_COMPUTE(1);
> +
> +	queue_cpu[(*npkt)++] = PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0);
> +	/* empty dword is needed for fence signal pm4 */
> +	++*npkt;
> +
> +	*ring_context->wptr_cpu = *npkt;
> +	ring_context->doorbell_cpu[DOORBELL_INDEX] = *npkt;
> +
> +	/* Add a fence packet for signal */
> +	syncarray[0] = ring_context->timeline_syncobj_handle;
> +	signal_data.queue_id = ring_context->queue_id;
> +	signal_data.syncobj_handles = (uintptr_t)syncarray;
> +	signal_data.num_syncobj_handles = 1;
> +	signal_data.bo_read_handles = 0;
> +	signal_data.bo_write_handles = 0;
> +	signal_data.num_bo_read_handles = 0;
> +	signal_data.num_bo_write_handles = 0;
> +
> +	r = amdgpu_userq_signal(device, &signal_data);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
> +				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
> +	igt_assert_eq(r, 0);
> +}
> +
> +void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +			       unsigned int type)
> +{
> +	int r;
> +
> +	if (type > AMD_IP_DMA) {
> +		igt_info("Invalid IP not supported for UMQ Submission\n");
> +		return;
> +	}
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device_handle, ctxt->queue_id);
> +	igt_assert_eq(r, 0);
> +
> +	switch (type) {
> +	case AMD_IP_GFX:
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
> +					    ctxt->csa.va_handle,
> +					    ctxt->csa.mc_addr, ctxt->dev_info.csa_size,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->shadow.handle,
> +					    ctxt->shadow.va_handle,
> +					    ctxt->shadow.mc_addr, ctxt->dev_info.shadow_size,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +						 ctxt->point);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_COMPUTE:
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->eop.handle,
> +					    ctxt->eop.va_handle,
> +					    ctxt->eop.mc_addr, 256,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +						 ctxt->point);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_DMA:
> +		amdgpu_bo_unmap_and_free_uq(device_handle, ctxt->csa.handle,
> +					    ctxt->csa.va_handle,
> +					    ctxt->csa.mc_addr, ctxt->dev_info.csa_size,
> +					    ctxt->timeline_syncobj_handle, ++ctxt->point,
> +					    0, 0);
> +
> +		r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +						 ctxt->point);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	default:
> +		igt_info("IP invalid for cleanup\n");
> +	}
> +
> +	r = amdgpu_cs_destroy_syncobj(device_handle, ctxt->timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* Clean up doorbell*/
> +	r = amdgpu_bo_cpu_unmap(ctxt->doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(ctxt->doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* Clean up rptr wptr queue */
> +	amdgpu_bo_unmap_and_free(ctxt->rptr.handle, ctxt->rptr.va_handle,
> +				 ctxt->rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(ctxt->wptr.handle, ctxt->wptr.va_handle,
> +				 ctxt->wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(ctxt->queue.handle, ctxt->queue.va_handle,
> +				 ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE);
> +}
> +
> +void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +			      unsigned int type)
> +{
> +	int r;
> +	uint64_t gtt_flags = 0;
> +	struct drm_amdgpu_userq_mqd_gfx11 gfx_mqd;
> +	struct drm_amdgpu_userq_mqd_sdma_gfx11 sdma_mqd;
> +	struct drm_amdgpu_userq_mqd_compute_gfx11 compute_mqd;
> +	void *mqd;
> +
> +	if (type > AMD_IP_DMA) {
> +		igt_info("Invalid IP not supported for UMQ Submission\n");
> +		return;
> +	}
> +
> +	r = amdgpu_query_info(device_handle, AMDGPU_INFO_DEV_INFO,
> +			      sizeof(ctxt->dev_info), &ctxt->dev_info);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_cs_create_syncobj2(device_handle, 0, &ctxt->timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, USERMODE_QUEUE_SIZE,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &ctxt->queue.handle, &ctxt->queue.ptr,
> +				       &ctxt->queue.mc_addr, &ctxt->queue.va_handle,
> +				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &ctxt->wptr.handle, &ctxt->wptr.ptr,
> +				       &ctxt->wptr.mc_addr, &ctxt->wptr.va_handle,
> +				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, 8,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &ctxt->rptr.handle, &ctxt->rptr.ptr,
> +				       &ctxt->rptr.mc_addr, &ctxt->rptr.va_handle,
> +				       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	switch (type) {
> +	case AMD_IP_GFX:
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.shadow_size,
> +					       ctxt->dev_info.shadow_alignment,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->shadow.handle, NULL,
> +					       &ctxt->shadow.mc_addr, &ctxt->shadow.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.csa_size,
> +					       ctxt->dev_info.csa_alignment,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->csa.handle, NULL,
> +					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +
> +		gfx_mqd.shadow_va = ctxt->shadow.mc_addr;
> +		gfx_mqd.csa_va = ctxt->csa.mc_addr;
> +		mqd = &gfx_mqd;
> +		break;
> +
> +	case AMD_IP_COMPUTE:
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, 256,
> +					       ALIGNMENT,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->eop.handle, NULL,
> +					       &ctxt->eop.mc_addr, &ctxt->eop.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +		compute_mqd.eop_va = ctxt->eop.mc_addr;
> +		mqd = &compute_mqd;
> +		break;
> +
> +	case AMD_IP_DMA:
> +		r = amdgpu_bo_alloc_and_map_uq(device_handle, ctxt->dev_info.csa_size,
> +					       ctxt->dev_info.csa_alignment,
> +					       AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags,
> +					       AMDGPU_VM_MTYPE_UC,
> +					       &ctxt->csa.handle, NULL,
> +					       &ctxt->csa.mc_addr, &ctxt->csa.va_handle,
> +					       ctxt->timeline_syncobj_handle, ++ctxt->point);
> +		igt_assert_eq(r, 0);
> +		sdma_mqd.csa_va = ctxt->csa.mc_addr;
> +		mqd = &sdma_mqd;
> +		break;
> +
> +	default:
> +		igt_info("Unsupported IP for UMQ submission\n");
> +		return;
> +
> +	}
> +
> +	r = amdgpu_timeline_syncobj_wait(device_handle, ctxt->timeline_syncobj_handle,
> +					 ctxt->point);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_alloc_doorbell(device_handle, &ctxt->doorbell, PAGE_SIZE,
> +			      AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	ctxt->doorbell_cpu = (uint64_t *)ctxt->doorbell.ptr;
> +
> +	ctxt->wptr_cpu = (uint64_t *)ctxt->wptr.ptr;
> +
> +	ctxt->queue_cpu = (uint32_t *)ctxt->queue.ptr;
> +	memset(ctxt->queue_cpu, 0, USERMODE_QUEUE_SIZE);
> +
> +	/* get db bo handle */
> +	amdgpu_bo_export(ctxt->doorbell.handle, amdgpu_bo_handle_type_kms, &ctxt->db_handle);
> +
> +	/* Create the Usermode Queue */
> +	switch (type) {
> +	case AMD_IP_GFX:
> +		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_GFX,
> +					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> +					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> +					    mqd, &ctxt->queue_id);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_COMPUTE:
> +		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_COMPUTE,
> +					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> +					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> +					    mqd, &ctxt->queue_id);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	case AMD_IP_DMA:
> +		r = amdgpu_create_userqueue(device_handle, AMDGPU_HW_IP_DMA,
> +					    ctxt->db_handle, DOORBELL_INDEX,
> +					    ctxt->queue.mc_addr, USERMODE_QUEUE_SIZE,
> +					    ctxt->wptr.mc_addr, ctxt->rptr.mc_addr,
> +					    mqd, &ctxt->queue_id);
> +		igt_assert_eq(r, 0);
> +		break;
> +
> +	default:
> +		igt_info("Unsupported IP, failed to create user queue\n");
> +		return;
> +
> +	}
> +}
> diff --git a/lib/amdgpu/amd_user_queue.h b/lib/amdgpu/amd_user_queue.h
> new file mode 100644
> index 000000000..355f16f19
> --- /dev/null
> +++ b/lib/amdgpu/amd_user_queue.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _AMD_USER_QUEUE_
> +#define _AMD_USER_QUEUE_
> +
> +#include <amdgpu_drm.h>
> +#include <amdgpu.h>
> +#include <time.h>
> +#include "amd_ip_blocks.h"
> +
> +
> +#ifndef PAGE_SIZE
> +#define PAGE_SIZE 4096
> +#endif
> +
> +#define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)   //In bytes
> +#define ALIGNMENT			4096
> +#define DOORBELL_INDEX			4
> +
> +void amdgpu_alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
> +			   unsigned int size, unsigned int domain);
> +
> +int amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
> +			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
> +			       uint64_t mapping_flags, amdgpu_bo_handle *bo, void **cpu,
> +			       uint64_t *mc_address, amdgpu_va_handle *va_handle,
> +			       uint32_t timeline_syncobj_handle, uint64_t point);
> +
> +void amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle device_handle, amdgpu_bo_handle bo,
> +				 amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
> +				 uint32_t timeline_syncobj_handle, uint64_t point,
> +				 uint64_t syncobj_handles_array, uint32_t num_syncobj_handles);
> +
> +int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
> +				 uint32_t timeline_syncobj_handle, uint64_t point);
> +
> +void amdgpu_user_queue_create(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +			      unsigned int ip_type);
> +
> +void amdgpu_user_queue_destroy(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt,
> +			       unsigned int ip_type);
> +
> +void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
> +			      unsigned int ip_type, uint64_t mc_address);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index d01c90df9..d7bb72c57 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -165,7 +165,8 @@ if libdrm_amdgpu.found()
>  		'amdgpu/xalloc.h',
>  		'amdgpu/amd_cp_dma.c',
>  		'amdgpu/amd_mem_leak.c',
> -		'amdgpu/amd_mmd_shared.c'
> +		'amdgpu/amd_mmd_shared.c',
The inclusion of this new file should be guarded by the libdrm version or a compiler check. Either way, it's great to have a separate file for better organization and maintenance.
> +		'amdgpu/amd_user_queue.c'
>  	]
>  	if libdrm_amdgpu.version().version_compare('> 2.4.99')
>  		lib_sources +=[ 'amdgpu/amd_dispatch.c',]
