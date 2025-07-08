Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18DBBC8303C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Jul 2025 23:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D95910E1E2;
	Tue,  8 Jul 2025 23:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XQ1MTdub";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D945F10E1E2
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jul 2025 23:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbDiU/eC/RrJtqky3fcRdpvQhhgEAB4YNxXHNbZSwktYFXBPmLSxRdvg3KRCZcRy1O9xw143IIP9yp9sREnA0S3sKGp6ePIizTt/rBY/8ms4zANDXfcvmdRunVFalLFQ1s36WOcxLVR5q18GReTD2ZQnHNCCXAf4l312t09mD1wUcvrNfXM/ADJmCQ7i0Ebq97fn0H8id1LnWqKGIMwWP43aOJzWlW/YaGWZwJAyWyiYW+OuyF7v0LbDocrru4oyFo8xIFxvw/Gn0i8SzPrEUeL40vDYSBj8a+VgiLwSKnHFT583ozwhvn9iQLCW4smLPZc24Dglvt6ubSbptNzALA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VeE7ZmY+GKUfQeyv2RVt9FLmQ6VbKxKAttA95ANNUsE=;
 b=lUrAdLaz7tK5K4Ly5w29j9YvmpvJoJVEL7T1aUxIchXKYae9IkpxZTzO3baMWOfyjbR0vARsPk+3t7Tj8xGE8Ytr0bOvfAotYD08qmX6hw2ZVv74PfnRW3TRkmcQpfR9yPGV8vwwdy7Ym9FmiuSiwvJPb4Qr4LhMUDYxBgziHWRWepj0xwWRg0aR48vsjyobFhCmTp9F7iikvhiTDbaTBEd9fTx5QU+jsjTwFZ29fhB2pcRX8jr1F8Z6KUi2V+JYPVSveQcD4YW39X56DJeXRqNXrYgmDDmzeCcZ6aEusNGxkVFLKNimtRvLkVn4hW3savhQPj/SZtPXaPRrr1/Jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VeE7ZmY+GKUfQeyv2RVt9FLmQ6VbKxKAttA95ANNUsE=;
 b=XQ1MTdubjuZAZiPOgl6f2JbAqjCdneVtECa1u9fzA1AXfag69PM8Jab2KHAZRB/HxVPN2kpxwik5x7gv4hWoQTa3TfaoR3uZxpbqxrCtgTPO4h7D8hgbFhFUVaXvmF9u+zccSV4IlJPoEiHHw9KaaMnKmCvVvYtZbx1ILzZ3mKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by SN7PR12MB7273.namprd12.prod.outlook.com (2603:10b6:806:2ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 23:18:20 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 23:18:20 +0000
Message-ID: <391812d1-5a0f-4eea-8894-ae4c4e7c4556@amd.com>
Date: Tue, 8 Jul 2025 19:18:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] lib/amdgpu: Use available_rings mask for user
 queues
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250708074819.624367-1-Jesse.Zhang@amd.com>
 <20250708074819.624367-4-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250708074819.624367-4-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0095.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::34) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|SN7PR12MB7273:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ffab816-bf5d-4559-05f0-08ddbe75ba0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGNXRFc5WmU5WGVYbWZXMjZ4SllsRlhzWGhhb1d3M1JGeHhWbVRZOFg0ZlZq?=
 =?utf-8?B?L1pFcFpyczNpZmE2MHBoU2FTM1U1dUZtdkV2b2xSbU5JcWRQUkZFZTUrcm4w?=
 =?utf-8?B?Uk03eVVTeEIvTzJ0bnB5QytYSEFOWk1BRWd3UzVPTWdPWUdwR0RKa0Zoa09W?=
 =?utf-8?B?akJ0ZUVXWUgvTEJYSjlMbVg0WFIrYjBaYkFRODloNkpIVVBpcE5IbVVBWFd3?=
 =?utf-8?B?N1NtUSs0K1NvSmg0OHkvVVFZeG5hbEkyWVJlTWtsL3QwekFmVUQ4TURsUElo?=
 =?utf-8?B?eU54dGw0RXF5QVAzSWg4ZjlYa3VLS0E4V1M4ekp5ZWJmSmk0UXZkd1ZQRjdx?=
 =?utf-8?B?NG9aVjhXMWJ3Mko4Q0RUSitITDFZZko2ejBhNXFIeDlaZUVJM0RMcGJ6dWdH?=
 =?utf-8?B?Y1FLN25CMm5WK0VOVkttTk1OcnVxUkF3eFRaRXlSZFFUak9sTzJWbWptREpK?=
 =?utf-8?B?ZWVYVW9pQW1EelVncG9MT0FMK0xTOHY3MG9kNXViU3ZQUXczVTdnL0VwRTUw?=
 =?utf-8?B?VjRWdDJ6YmxLNGRhbk9NV29tcjVOVVQ5UzdIRGtoeFVWSTlSSWw4bko0WXls?=
 =?utf-8?B?QlZvOEFFbkhJck4xR2VLdWZwM1I5WWREZUdiM0REYkJtQUtudGlQa3Bla0ZJ?=
 =?utf-8?B?SnYySFVsMFpwYmpubzg3RmhyTFR0VG1EYU1MSG43alAyMmN0VTB3VWwvUnFF?=
 =?utf-8?B?WGpvMkQ5Um42T25hWExjWFpTUnZNQmJHVis2K1p6WnUwM0F0M2VYcjBXR3Az?=
 =?utf-8?B?clBEZXdUMEQyRUJlSjJBNVlLVlhRd1JLOEhCWDZHS0pTd1FFQjNnb0Q2K0xk?=
 =?utf-8?B?UHFMbXlkR2JOM0QvbVY5OHk2SE5vbUtHdHdpNGZIVmx6VTF1MHdnOHVPREpP?=
 =?utf-8?B?QU1aWlp4cnp0eU1weFhWR0tBbnArbHMxSVV5ckJXci9jNDBhN2tyUVBVb1hU?=
 =?utf-8?B?STdZRjlUcWhwRGUwV2VCbmZJUmJYdEd0VFphNVJBSDh4L2JMUlJySUx3SWhB?=
 =?utf-8?B?Zk9xU29wUk5DYkRXVFJRM1JpL3JlbTVUTkk4a0RmUEZVb1hQWXNpRkxGczE4?=
 =?utf-8?B?eEl2M1VPWE8vdDBMUlpnTHZiOUl5ZVFrNW5CMzg1QzBSN2dKRjJndXFWRnFL?=
 =?utf-8?B?OGFJOWpRdGZvQ09pbmRxUWpDSVpLM3FNbXVvazJyZHBlYlRCcllEa3hOWFdK?=
 =?utf-8?B?MDVKczBCdjQzR3djMHpNeWxXdGluSGs4d3FHYytJNUU3citWSXBScE1Vd082?=
 =?utf-8?B?THBHd293dXhaU21GdnZCa3BmSmRwTzk5a1JEREtYRGplaUNFc2RGMXFqM1li?=
 =?utf-8?B?dG9reERJQmg2eWdUUkxKYUpNU3ZBajNvRko0aExKR1dVSnFwWmhkZlhUb0ls?=
 =?utf-8?B?Yk93MnNYZjJNRzBMdmg3TFNiRVhDaitEcmcxdUQ0NmRaRWd4T1BDclRFZkZr?=
 =?utf-8?B?bHRhbWh3WmE1ZTArc3RtYzRSZkIyQVU0REIzbUk1cm5leCtZcUY0aXAwc20v?=
 =?utf-8?B?QTJhcFpBRDVTVFhiOWdmb00ydlRDenZjc0ZFY1B1WnhDOHZNcmRsTFVxTHBr?=
 =?utf-8?B?WHlJRFlDQjRuSXV6SVA5M2h1T09BeVlGNzByZHBqU0tEZG10TnpuZ3RPYjdw?=
 =?utf-8?B?ZFlTRmtwQTNicElCLzM2bDhjSHdOMitEcHBTT283MjAreHlKaThncVlNdEJM?=
 =?utf-8?B?NnVadE1tVDVDS3I3bjgwMk80dThhWmV3QlZuOW5IdW9aNS9MYlQ5aWJyZWNl?=
 =?utf-8?B?LzJveWlNSHBUVWVTMjQ3aWJDdVhDZDc4QTNZcTZnd2pEZTNqNmpxaTdvT1Rw?=
 =?utf-8?B?dG5mQ2RFRG10R09QQWRpZXpDM0IrdURzQkdOeDNiRkJ3ZklHQnZ5bzY3ZEFh?=
 =?utf-8?B?WTdNcXdXRDhadS9ySU9IN3NWdTJOeEk5Q3ZKNHQ3YXIxN2JUNWpCWlRUWUMx?=
 =?utf-8?Q?cHvhPA9LCOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlBOWGNndXlHd01NMmU3enhJclNsbVJ5a3l5SktobjJWNWVSYkFjNmxOazFi?=
 =?utf-8?B?Q3c4cEQ2Z3hCSDBRRmViNGw5SldPaFNOOHNJcCtKckJEK3cxM0hycjlCVTI0?=
 =?utf-8?B?YXRzLzU0VXpWT3hwenhjTFdrSDZKV3hYMGxDRU5vdzJ3ODdzS0VBMk0rcU9B?=
 =?utf-8?B?T2w3OVd2OFFyQjlMWGNEZ1VNZW5vRk1pby9ONkJ1NWtBQittSS91NzQ0eXBU?=
 =?utf-8?B?RUYrVHhjbmdaSnFidHFsN3g4NDhUYVQvWlRuS2pkY2pZSVRXelFQUWRKM1RJ?=
 =?utf-8?B?RXpKeGF6eGxTaElqclFtZFdINTRicTIwSTJ5by9tWk12YU1BK3J3WVV2T3JL?=
 =?utf-8?B?Mnk3NHduN3d0eWdWdzRpZEpERGRBOWdxTW9KMUtPS09wcGMyaVFiWVhKR3ZZ?=
 =?utf-8?B?UE0wYkUvVlJkejVlQzE4QUlnaWFSMi9FLzdGdEFMdXRNQ2hQZGVGZkIwN2Y2?=
 =?utf-8?B?RHNiUVVLM29lQ0dLVHRwYnRYN3FoNWE2Z2JUSkE2QysrSEh3QTV4MHU4M29Z?=
 =?utf-8?B?Rkp4U1pXRFJnOGJMWUhKdjZoRHM0Q3F1cjZZY3JsT2l3ZkJJdnlWNEFFSk1J?=
 =?utf-8?B?REJKeU5udndjcVJTaW5pVytVYjYzbUlyZnlZVnc1K1NHcTlpdlBjREt1RHNT?=
 =?utf-8?B?M2VCSExIMmJ1QzUyQkRONVVpUkNTY1JwcGpVWmpjUG9BUGdIa0Z5ZTRaR3RC?=
 =?utf-8?B?SE1aQUl0NExyY2Ixa3RkY0NKQTlqZUdIOXFMb0xEL2VVUkkvT0VVSTJBaUc1?=
 =?utf-8?B?aXhGMjNnaTduKytNOXJBYklzelYxL0psVmJQQVVPREk5VmRNSmNQeVI2MEJ4?=
 =?utf-8?B?Z0hNd0hXWDlldnRqZ0hDT2ZBZmI5VlFQWnN5UllINXlZY2xkL082SHBMWWd3?=
 =?utf-8?B?S2hBWHZxZVQzUDh0YklCd2ozRUpEQ3ZJRnh1RGRqbS9TRk9yYUwwTFBwZjlv?=
 =?utf-8?B?eEdXRXk2clV5bGs3eGNwajV0ZC9VWStHWnYwdDdUNkI5TG03NFZpWmRSNVE5?=
 =?utf-8?B?bWVveFVsZ3JhbG43cFFRaUdkVXl3Z2dQSFAvclR1dVVob0tmcDFWdmUxcmJ6?=
 =?utf-8?B?NUhWNGw4TVIxQnhaRzhNbnZRMFJQSkhZa1ozUWlIR0lveDVqREY5aUo0RWxp?=
 =?utf-8?B?L0tJeS9GTS9CYU5aeTM2c2FqVDIwdWZwbjRrL3dnSHIzcGxMaGRnaEdmcmZx?=
 =?utf-8?B?WUs5MUs4UGlqeGo2aU1mTEdVbTU3MmFvSzlFRlFGQ1JDQjJCUlk4eGdCSnU2?=
 =?utf-8?B?dlB4bExZRjEyVURlSnN0MFFhdnZFaGF3QVFLMVlzbzVTUE8xTTZiQjdUS2Fj?=
 =?utf-8?B?c09LTyt2UmVIM1dXNGtKNHE1Vm9kWThaczJxR3o3dU9yQ1I4emw2R2RXQTBz?=
 =?utf-8?B?dGxVNTZHSG1lTTFsMGdEOG0vMDYzUDAxUEFSa0FUekpWQTJJOHJvVVF5UG9x?=
 =?utf-8?B?SDBTT3I3eDNNU1JrcTlxMncyM2RDYW8xcjR0WXpRT2Qza08rSy80RklnS0JZ?=
 =?utf-8?B?SXhRd3lSR2d3enFrMkp1VE9GUHNGLzVJaVEzbTZKMXJucDBCSXNsMGhKd1Ra?=
 =?utf-8?B?NkdvU0VkaU9kVFIweWZJcG1SZFFRM3RCWGh5TmRvcFlSZ0s2ZmxKcWNrRExY?=
 =?utf-8?B?TlhYb0FTRGJVODJ4dGs2ZzFNSTViTlQzeWRsSE5SUExNdTFvc2NpVWpsTVcx?=
 =?utf-8?B?Ri9XNlBFaWdDUkQ5eGhDK1A5MGkxaVFYeUI1WURWQlFhTVVNQlloOG9XWkRj?=
 =?utf-8?B?M2xBWVZyWDYyazVzeWt3WDA4c3F4ZFZaUFhGZkZOb1E0RVdaMFgwYWZGTDZL?=
 =?utf-8?B?RUZYQ2Q1Vk5oRzJaellhS3VLSnlzMDl6WUIzcTFYZlJOblVkU3pPM2lnQjBZ?=
 =?utf-8?B?RlVwdlhWblBYcCtudXkwOURaVU9NNGxicmYzTUFaYkc4MExoeUhIM25vc05I?=
 =?utf-8?B?dkloU2NMUk8vaXlhYmZDSllQNHZ0MzFwbXZYQjF5UGM0NFFHdjdJOUZIR2ZF?=
 =?utf-8?B?L21lWkFzNmNVSkNjWkdMbmFuTFZocUFZcE9Ka09sN2dna21JaGYvcUhvbjdy?=
 =?utf-8?B?VjJybVM2VG9OcEZ2cXVVT3JBUXUxQzRSVGRqeUdvVmNweHpaZTh5b2M0RG96?=
 =?utf-8?Q?+clEtZD4OvCPcAejvpdQmcKBR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ffab816-bf5d-4559-05f0-08ddbe75ba0d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 23:18:19.9795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nT1Qvq5kA8cj3mGnSPyNs7EbjMs79lGB3Ey32QKDn7AjTM2TNJY7tiSGyKl3ACoQBslWEFadgp16KWjcoBQvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7273
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

The full series of all four patches looks good to me—thanks for the improvements!

For the first patch that modifies drm-uapi/amdgpu_drm.h, could you please add a reference link and the commit SHA from the DRM branch for traceability?

Once that’s addressed:

Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com

On 2025-07-08 03:47, Jesse.Zhang wrote:
> This patch modifies ring selection logic to properly handle user queues by
> calculating an available_rings mask based on num_userq_slots when user_queue
> is true, otherwise falling back to hw_ip_info.available_rings.
>
> Changes include:
> - Added available_rings variable in all command submission helpers
> - Calculated mask as ((1 << num_userq_slots) - 1) for user queues
> - Used available_rings for ring iteration instead of direct hw_ip_info access
> - Applied consistent logic across:
>   * amd_command_submission_write_linear_helper
>   * amd_command_submission_const_fill_helper
>   * amd_command_submission_copy_linear_helper
>   * amd_compute.c (nop submission)
>   * amd_deadlock_helpers.c
>
> This ensures correct ring selection behavior for both kernel queue and user queue cases.
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 19 ++++++++++++-------
>  lib/amdgpu/amd_compute.c            |  7 +++++--
>  lib/amdgpu/amd_deadlock_helpers.c   |  6 ++++--
>  3 files changed, 21 insertions(+), 11 deletions(-)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 0279b22c8..8b7236383 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -353,6 +353,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  	int i, r, loop, ring_id;
>  
>  	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
> +	uint32_t available_rings = 0;
>  
>  	ring_context = calloc(1, sizeof(*ring_context));
>  	igt_assert(ring_context);
> @@ -368,7 +369,8 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
> -
> +	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
> +					ring_context->hw_ip_info.available_rings;
>  	for (i = 0; secure && (i < 2); i++)
>  		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
>  
> @@ -381,8 +383,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
>  
>  
>  
> -/* Dont need but check with vitaly if for KMS also we need ring id or not */
> -	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
> +	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
>  		loop = 0;
>  		ring_context->ring_id = ring_id;
>  		while (loop < 2) {
> @@ -481,7 +482,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  
>  	struct amdgpu_ring_context *ring_context;
>  	int r, loop, ring_id;
> -
> +	uint32_t available_rings = 0;
>  	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
>  
>  	ring_context = calloc(1, sizeof(*ring_context));
> @@ -495,6 +496,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  	igt_assert(ring_context->pm4);
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
> +	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
> +					ring_context->hw_ip_info.available_rings;
>  
>  	if (user_queue) {
>  		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
> @@ -503,7 +506,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
>  		igt_assert_eq(r, 0);
>  	}
>  
> -	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
> +	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
>  		/* prepare resource */
>  		loop = 0;
>  		ring_context->ring_id = ring_id;
> @@ -575,7 +578,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  
>  	struct amdgpu_ring_context *ring_context;
>  	int r, loop1, loop2, ring_id;
> -
> +	uint32_t available_rings = 0;
>  	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
>  
>  
> @@ -590,6 +593,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  	igt_assert(ring_context->pm4);
>  	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
> +	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
> +					ring_context->hw_ip_info.available_rings;
>  
>  
>  	if (user_queue) {
> @@ -599,7 +604,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  		igt_assert_eq(r, 0);
>  	}
>  
> -	for (ring_id = 0; (1 << ring_id) & ring_context->hw_ip_info.available_rings; ring_id++) {
> +	for (ring_id = 0; (1 << ring_id) & available_rings; ring_id++) {
>  		loop1 = loop2 = 0;
>  		ring_context->ring_id = ring_id;
>  	/* run 9 circle to test all mapping combination */
> diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
> index d92b99a76..bc9f77d34 100644
> --- a/lib/amdgpu/amd_compute.c
> +++ b/lib/amdgpu/amd_compute.c
> @@ -47,7 +47,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  	int r, instance;
>  	amdgpu_bo_list_handle bo_list;
>  	amdgpu_va_handle va_handle;
> -
> +	uint32_t available_rings = 0;
>  	struct amdgpu_ring_context *ring_context;
>  
>  	ip_block = get_ip_block(device, type);
> @@ -57,6 +57,9 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  	r = amdgpu_query_hw_ip_info(device, type, 0, &ring_context->hw_ip_info);
>  	igt_assert_eq(r, 0);
>  
> +	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
> +						ring_context->hw_ip_info.available_rings;
> +
>  	if (user_queue) {
>  		ip_block->funcs->userq_create(device, ring_context, type);
>  	} else {
> @@ -64,7 +67,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
>  		igt_assert_eq(r, 0);
>  	}
>  
> -	for (instance = 0; ring_context->hw_ip_info.available_rings & (1 << instance); instance++) {
> +	for (instance = 0; available_rings & (1 << instance); instance++) {
>  		r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
>  						 AMDGPU_GEM_DOMAIN_GTT, 0,
>  						 AMDGPU_VM_MTYPE_UC,
> diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
> index 1ed407332..49582b6c9 100644
> --- a/lib/amdgpu/amd_deadlock_helpers.c
> +++ b/lib/amdgpu/amd_deadlock_helpers.c
> @@ -457,10 +457,12 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
>  	uint32_t prio;
>  	char sysfs[125];
>  	bool support_page;
> -
> +	uint32_t available_rings = 0;
>  	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
>  	igt_assert_eq(r, 0);
> -	if (!info.available_rings)
> +
> +	available_rings = user_queue ? ((1 << info.num_userq_slots) -1) : info.available_rings;
> +	if (!available_rings)
>  		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
>  
>  	if (user_queue) {
