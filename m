Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513E0C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 19:00:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19D010E044;
	Thu, 27 Mar 2025 19:00:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Z5hX6Qvm";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4A910E044
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 19:00:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb6ooMYbb7PhaOYzQODYztTf6Tv00mISBjKzIJOMIjL1tKUMGJ/je55/hP+Sk+EXKimU86NdiTitlCP6MI4G01NDSyMeq4CZG0BVg79i+LXXmQ6pkRskpUAxBs+5x8FTU3rTbWRD4NiVVaT6chXVz5x/VpPt4LEHkuuF0eD3o5Dz1qLQuOABL4rfEewp7j1i2c3mmKZCz7h3n1AuLA7ShW+zPTFtYWihVwnfVhOnR42jrr1+67DHOk3mNukx28dl56UMziPQTVUMr1i9VRV4ZxW+tS7x+cXX3LwVyB7tM7JREuS+LlzN2ozSX76e6Ct8kq4C4H4z6buChaUmsMcwoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDPcn64QLdHuvUfs7VdbzkrD2L738hgyeCZ8+4pvXHQ=;
 b=dNKu91jWtx2afKsugLcguLHdwUXXi3QDqgw5ZzKuw2V20ZSUuLbW/CzvZAQ6RiwabuHGGkua8KcGDLpmLBVHNC4a3xC4G1DFmZAU+7jzeHhR7J6Wup47rHHWDc5U+GWVQwree0PKyhgujr2ezdK5O1ldphYNZWi7xK0+Lg80vOGoqCmfpGHvWd6mZv3pK3aI4EGkAt5wj5FQ/yLdE/OAxLXAMz3KrG2Ei31xUv8IDBfhsnSNgz8GoOF5J0Lgnur4LBGNZWIFYvz21OkbojQo1+s4qp4nOQ5rhZbQYf63XhCTOwHIemy+2+5siwimFBmnh6vI0sO2HPn++0XjNT9FGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kDPcn64QLdHuvUfs7VdbzkrD2L738hgyeCZ8+4pvXHQ=;
 b=Z5hX6QvmF4xyb3yLQICAi9F9YJ8uQtpLdKLc43tW+qdhR6s7mOsOVe1Zw3pqU614QNbGSIDeRedSmzYq7k9kjXPZCGv3fdHSY+aOwePdkko2DKVq8gsP+8weg3jr4nFcIkwmvEobP72xKGaAJzXq+y/8dD6tqR/3V6DTNZkjVAM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 19:00:05 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 19:00:05 +0000
Message-ID: <08b7f175-3589-4d4b-a0c6-bf40da3a63bf@amd.com>
Date: Thu, 27 Mar 2025 15:00:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/amdgpu: add user queue test
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
References: <20250327071744.412284-1-jesse.zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250327071744.412284-1-jesse.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0217.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::22) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 9611c2c1-3e9f-4e2b-6615-08dd6d619591
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlNlQWVheDdnREpaTEZxQ0daejdhVmhJS1Y3alU5cnhlY3hsMjhnZERra3c0?=
 =?utf-8?B?dFlmSXBuaENSWGpaS2RWUGlDaTh4NU9TNjlUU3RxdWNPRjhya3crY2JoaHVu?=
 =?utf-8?B?Y0xqVzllWGZtODh6MmNRSCthOWJmMWpIRnZINEZCMWgrOUFBOE9URDRIZkN2?=
 =?utf-8?B?bjR5UnN6K0VHNEE3blU5eWhrKzNYOThtZXFQVE5FdzVEMmlTcFd3T0VoQkdM?=
 =?utf-8?B?b0dMbnJwRDJZUTVwUjZudFIzV20zK3BsbXNwUklCQVYxNU9sUk91TEVkMDhh?=
 =?utf-8?B?K2ZQNnZIZk1OdWRrQ0hVd3RHWWNNMjFrZEN1eGgweU9sVHhCWDFWeVpIVWI5?=
 =?utf-8?B?Zm05Nk1ERTE0aE9zSm01N3czMnQzMUFhckdHeGphWFRLWFcvWDRiazJ6YjNF?=
 =?utf-8?B?alNlK3VBTkk0M05GR3pzUXY4RmdGWjhFZU9zNjRicmhxcXFZRUlDb1ZjYnZY?=
 =?utf-8?B?Z1dsaktvU0l6bVdtbnNzaFhyN1hTdE1RSUNTem1sNXRtNWtZWVFXZUhHNG1p?=
 =?utf-8?B?RHQ3NDRlV3RUNy9PQ0FKNWQ2NnQ3K09YY25GMGtPZFk2eFdDQzlnbGFuWjdO?=
 =?utf-8?B?MmNXSEpUYWxBSnBPOW9rVEUreUN4Z0dsV1ZsNEhSM1FKcTdLKy9BcEt0dmlj?=
 =?utf-8?B?UzFuRG5ueURNUGo5cHdSY2RmbDVLYlRIelhkL21kcFo4dHRpQjNXdVlnY05R?=
 =?utf-8?B?czZFb3hxWm04M1ZKcW9OajR5Q1QvQUhzMnRYdlVIR2xHa1FaTlBWY0w2aytP?=
 =?utf-8?B?anQ1NHNRYU1CN0x6ZGRTTEZLZHV2UFpOdWZPdDZDMXgxTkZGc3N5TlJzcWtO?=
 =?utf-8?B?eVpMK0EzOHh2RFluR0VSOFhUZjg5NXlyWFZTS25LTlpaZ25MeFFaYUdCcEVT?=
 =?utf-8?B?cS9HRDJOdXlBa3habTlSYUJQS28wR3l0U1AvWXFEKzdLNHRka29Xd2pGTmVO?=
 =?utf-8?B?QVAwZi9XaFhBNWJJR3NKeThOSWk1V2ZNNXZ3STQrNmttS1cwSWhSeVZCWjRF?=
 =?utf-8?B?Yi9HSHNJcjZldk41OHNwTW40UlFiWFYrcGtoR1ZkVTVjYXFnLzQrRHJaTndP?=
 =?utf-8?B?MEV6SWpGME8rV282clBYc0RCaGRXYUFyenE4bFZUczRLSmovdS9pbHZyQk1T?=
 =?utf-8?B?ZDdQSVdNTVg4M0pzMHd1QnN5dVR4NEJBb1hIcUw3RXR2eFJpcVJhS0ZMQkdM?=
 =?utf-8?B?Mjh2RC9tVm55eVFpVE1wOXhueVZ3SXI4bEp3QmNlL01jUVR5bDBGVGJpalh1?=
 =?utf-8?B?UkxkYVMya0c0MUw3R294ZVZ6aFpkeUNwV2JXYjN5N1ZicGtHRmxuYUxwSEpk?=
 =?utf-8?B?RmFiajhPS0RvT09QcEtQb0hieXNsWVg0VXJGdUU2eEs3OXJUK0ZualNIcHR0?=
 =?utf-8?B?VmovRzVHSWlGclBCSmZHYXgvK24vRTZZN3hWNUs2d0hIOGpxNndnMHdsdjRs?=
 =?utf-8?B?TmlhMmpZU0h6STdKRUtRakh2a3c0bTkrandMY2RidW1XM1UrNThlQlhIeGlx?=
 =?utf-8?B?QUd5MFpxYncrWjhNOEJQdEhvRUUwZ3VkNzJWbGNUVTZmN2o1OVo3V2NCVC9Z?=
 =?utf-8?B?d0l3Z01nZzVSejJrVkNXS2JHcTQ5OG1xclhPUXJIMjBjWHgwQll6MksrQ0FC?=
 =?utf-8?B?ZEtDTCthMUk4Q1IwRjcvRE92V09PdDl2cHEzMWZtckVhc1JwTVdWUVRjME1P?=
 =?utf-8?B?VlNNK0hLZkN1bTYwb3o5UUdwUFJVRVhaSEkvejFaR2p6cmJyK0hUY2Z5b1g3?=
 =?utf-8?B?Tmh1RTRYVHBqcm5CNGhLamJXOUtveUUxRW5xc0tVK1QrdWVHOGliOEduNnRy?=
 =?utf-8?B?MGFBN3QvdzFPSDBzeGZHcWVBSU9Oa0VaNXVBdkJsUHd6TFJZQ2xLNExWa0t6?=
 =?utf-8?B?cC9wV3l4Mkkzdnp5eS9nSElqTXNsdSttRVBYTStGTUFXNlJtSXZCbHk2V0Fz?=
 =?utf-8?Q?xJNsvARdCm8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDNvZ2M1cGN5VnJpS2dkeFpQSTE3cTZEc3hMS0ZYcHpub3F2S0dZYlVlRHhP?=
 =?utf-8?B?b1NOM0NxVXM0Nm1LNkZYKy9JUjdRM2tVcUN1Q0VLOGtYa0ZBcEtsT1ZZYjFG?=
 =?utf-8?B?YVU1N3UzUDgrQndwZlh2YzcyN0hNdEdCWHBGNWxjcE5xOVhHZDg3bUZyZVI0?=
 =?utf-8?B?M0tZR3h5c3VlSEdJclBOTk5wWEMyRmhxM1d1MStsQlVlM0FHUnlXb25YVlNE?=
 =?utf-8?B?K1RNOGxlU00vVHEvRzlxdDhBWkpESGQ5TGNKVmM4SzcrSmlwTDJCbmo5K3lx?=
 =?utf-8?B?NmNsNmpMSFVSSlU3RVIxS0o2MmVkWCttTzU1TmhhNm9PL0lDVnFrekdWZWsw?=
 =?utf-8?B?akhlRm5SMmxaQ0J2K2VjRG5LYW02NjNNTXM3ckllQWJsMGtkUW9GZ0ZsVExM?=
 =?utf-8?B?MFlUNFFLeDVrdFRJYnBqcnI3VHFzTml3WnNvd0xySFBZT3hYY01rZE11Y3NX?=
 =?utf-8?B?V3M1ZWc3VlZZSmpzQWN0V1JNZVF0WUlOcVcxYzJ1RDBaYWUwdCtOMU5OQ1VW?=
 =?utf-8?B?OHpidzJaLy9tbFpyT28rbElLUGxSb1cvTzk5cE5CWDN1S01tbWxiKzdIZ1N6?=
 =?utf-8?B?c1hoTlhzeCtZdzVLT0R6MGs2bm5kY1ZaWjc4RGtBbkU4MzZSZ20vU0NHM1Bm?=
 =?utf-8?B?NGY0WkpldEdxRnV0OVRUT2FuT0p0QWhqZlVSRnFWUEw0cVlyenpsN1U4bmI2?=
 =?utf-8?B?MUJOa0xzc0MrcHJLM2cvRTZ5dWFZbTNxT1BTOUtNbHNROHpDeEJqRVBBNlJy?=
 =?utf-8?B?ck1ORU9mQXdhS2NsN00zc1ZRc0RubWhlTG16R1NJQy9XZTArUkhRNHhqTGUx?=
 =?utf-8?B?TUUrMllrenVweG0yM3YzUC9ENFRwS01OMjh5WjE3amxSRjRFaU5qamlEbEti?=
 =?utf-8?B?dE0vb3Ruek0rZ2lLbFJVV3V5RWNTamk0UkhINVRYdERYUmViZGRBbG5adE42?=
 =?utf-8?B?NC8raXh4b0dSYkhXcFFuUTQ0cFpLWkg1S3V4ZXkwZUE4NjBNSWlLUitIc2dQ?=
 =?utf-8?B?QVFuOHhnbldhUEVNMWF6eGpGckltRkM3T0ZFQWk3WHlCOUZJVU9ybGZBL3hJ?=
 =?utf-8?B?aWc0ZVIzNnY5NkI2TkZDS0NiMDRCRmpTQndMVVdzdWFiaXorbVA4T2pKZTRu?=
 =?utf-8?B?YkpneWMwbkdYRkNIbUZua3ZNVzYrcitySW16cEJPNmRmektST1h6ZSsxL3Uv?=
 =?utf-8?B?TisweGZ4aFM5Q1BURGlYU0VVU1JwVENvNkJTQm1Rc3RKdE1RRnZZNnVsU2Zy?=
 =?utf-8?B?dEJOU3B1MVk5TVZvVGprRkQxRmVuckkrMVlMdDZsR3B0Umhja2hKMTVPcGIw?=
 =?utf-8?B?cWp3VG1xRkZXdmZNN0RtdTFFbjNmRmpyT3BkZS9rc2NnUXdnSC8xcklnR1Yw?=
 =?utf-8?B?VkQvL1N1Q1BjNkFOOXBKQ3J1WUxOcStoOUFnRW9LM1FJQ0tkdmM4blY4OVor?=
 =?utf-8?B?WkhZYSt1eW1BaTFkME5PNzJ3ejI5WW5DV3lGYitaUE9XMUtEZXBBbG1JTVYr?=
 =?utf-8?B?VmNlSFZoOVRLc1NLYlBuaUZxWVpvSG5FWjNGQ0h4Nkp4UVNxZ2ptYmpFQmJF?=
 =?utf-8?B?TmVvUm03T0p5MFV4c0RoalZPUUtPRlZPcTl0NGlyeHlGcFZiOVVEY0gvZFpU?=
 =?utf-8?B?cEJSbXlSWkhtRmMzaWl5RzhiUm1QeVB2T2dCZW14YnU5c0Z0VGczSHNtcTgw?=
 =?utf-8?B?aTdKeGd3WE0xYkkwMzcwZ3ZELzNKOFdKQmcycGRhY2tsUTZKOVJ5L29YaHpj?=
 =?utf-8?B?WHM4Z3ZiMk9KN2cyakhwZ3Uxd0pIUTFxMmZDbUtIa0xDai9HVzBVdzBxYjM2?=
 =?utf-8?B?S2MzbG8xMUsvNXZieklPVmF1aGhrSktSeEFlQSsxYzljL0tjUnVPM000RUdS?=
 =?utf-8?B?bUkxZ1hreDNFdE1zaXMzM05KbHcwdmNJbHZCVnhiREE2TFZJcTAyNWFSbXcw?=
 =?utf-8?B?UnZYWGtPamVUakVtL3MwSnZtbVpmZU1yZEdZMmhyR0lyUkpJa2RweEJUWWRi?=
 =?utf-8?B?c0xRK0NINHQwYUdqR2FWL3dLdlIyUUpLUkt4Zk1DUzMzR0JwRVNibWdodTM1?=
 =?utf-8?B?VXZmbFpUdkZ1MTkxUlV2cjlxMHpPSWdpeThtd2RETS8vZzNsOGllcEVOTXJF?=
 =?utf-8?Q?N80nuUv7p2tIXr4NL6euxXmU5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9611c2c1-3e9f-4e2b-6615-08dd6d619591
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 19:00:04.9466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4JD6mKkuomF34jxc96dM6bLd2zeVSkkB4o4QEpMfXFzIXwdKuu37dVaUcvJDNuIjfIKcJ0UoEhw17+rjgkdRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051
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

Hi Jesse, please note that several improvements are required, as outlined below.

Thanks, Vitaly

On 2025-03-27 03:17, Jesse.zhang@amd.com wrote:
> From: "Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>"
>
> This patch introduces a new test for AMDGPU user queues, which provides
> functionality for userspace to manage GPU queues directly. The test covers:
>
> 1. Basic user queue operations for GFX, COMPUTE and SDMA IP blocks
> 2. Synchronization between user queues using syncobjs
> 3. Timeline-based synchronization
> 4. Multi-threaded signaling and waiting scenarios
>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> Signed-off-by: Jesse.zhang <Jesse.zhang@amd.com>
> ---
>  include/drm-uapi/amdgpu_drm.h  |  254 +++++
>  tests/amdgpu/amd_userq_basic.c | 1706 ++++++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build       |    8 +-
>  3 files changed, 1967 insertions(+), 1 deletion(-)
>  create mode 100644 tests/amdgpu/amd_userq_basic.c
>
> diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
> index efe5de6ce..d83216a59 100644
> --- a/include/drm-uapi/amdgpu_drm.h
> +++ b/include/drm-uapi/amdgpu_drm.h
> @@ -54,6 +54,9 @@ extern "C" {
>  #define DRM_AMDGPU_VM			0x13
>  #define DRM_AMDGPU_FENCE_TO_HANDLE	0x14
>  #define DRM_AMDGPU_SCHED		0x15
> +#define DRM_AMDGPU_USERQ		0x16
> +#define DRM_AMDGPU_USERQ_SIGNAL		0x17
> +#define DRM_AMDGPU_USERQ_WAIT		0x18
>  
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -71,6 +74,9 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_VM		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>  #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>  #define DRM_IOCTL_AMDGPU_SCHED		DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
> +#define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
> +#define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
> +#define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
>  
>  /**
>   * DOC: memory domains
> @@ -319,6 +325,241 @@ union drm_amdgpu_ctx {
>  	union drm_amdgpu_ctx_out out;
>  };
>  
> +/* user queue IOCTL operations */
> +#define AMDGPU_USERQ_OP_CREATE	1
> +#define AMDGPU_USERQ_OP_FREE	2
> +
> +/*
> + * This structure is a container to pass input configuration
> + * info for all supported userqueue related operations.
> + * For operation AMDGPU_USERQ_OP_CREATE: user is expected
> + *  to set all fields, excep the parameter 'queue_id'.
> + * For operation AMDGPU_USERQ_OP_FREE: the only input parameter expected
> + *  to be set is 'queue_id', eveything else is ignored.
> + */
> +struct drm_amdgpu_userq_in {
> +	/** AMDGPU_USERQ_OP_* */
> +	__u32	op;
> +	/** Queue id passed for operation USERQ_OP_FREE */
> +	__u32	queue_id;
> +	/** the target GPU engine to execute workload (AMDGPU_HW_IP_*) */
> +	__u32   ip_type;
> +	/**
> +	 * @doorbell_handle: the handle of doorbell GEM object
> +	 * associated to this userqueue client.
> +	 */
> +	__u32   doorbell_handle;
> +	/**
> +	 * @doorbell_offset: 32-bit offset of the doorbell in the doorbell bo.
> +	 * Kernel will generate absolute doorbell offset using doorbell_handle
> +	 * and doorbell_offset in the doorbell bo.
> +	 */
> +	__u32   doorbell_offset;
> +	__u32   _pad;
> +	/**
> +	 * @queue_va: Virtual address of the GPU memory which holds the queue
> +	 * object. The queue holds the workload packets.
> +	 */
> +	__u64   queue_va;
> +	/**
> +	 * @queue_size: Size of the queue in bytes, this needs to be 256-byte
> +	 * aligned.
> +	 */
> +	__u64   queue_size;
> +	/**
> +	 * @rptr_va : Virtual address of the GPU memory which holds the ring RPTR.
> +	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
> +	 */
> +	__u64   rptr_va;
> +	/**
> +	 * @wptr_va : Virtual address of the GPU memory which holds the ring WPTR.
> +	 * This object must be at least 8 byte in size and aligned to 8-byte offset.
> +	 *
> +	 * Queue, RPTR and WPTR can come from the same object, as long as the size
> +	 * and alignment related requirements are met.
> +	 */
> +	__u64   wptr_va;
> +	/**
> +	 * @mqd: MQD (memory queue descriptor) is a set of parameters which allow
> +	 * the GPU to uniquely define and identify a usermode queue.
> +	 *
> +	 * MQD data can be of different size for different GPU IP/engine and
> +	 * their respective versions/revisions, so this points to a __u64 *
> +	 * which holds IP specific MQD of this usermode queue.
> +	 */
> +	__u64 mqd;
> +	/**
> +	 * @size: size of MQD data in bytes, it must match the MQD structure
> +	 * size of the respective engine/revision defined in UAPI for ex, for
> +	 * gfx11 workloads, size = sizeof(drm_amdgpu_userq_mqd_gfx11).
> +	 */
> +	__u64 mqd_size;
> +};
> +
> +/* The structure to carry output of userqueue ops */
> +struct drm_amdgpu_userq_out {
> +	/**
> +	 * For operation AMDGPU_USERQ_OP_CREATE: This field contains a unique
> +	 * queue ID to represent the newly created userqueue in the system, otherwise
> +	 * it should be ignored.
> +	 */
> +	__u32	queue_id;
> +	__u32	_pad;
> +};
> +
> +union drm_amdgpu_userq {
> +	struct drm_amdgpu_userq_in in;
> +	struct drm_amdgpu_userq_out out;
> +};
> +
> +/* GFX V11 IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_gfx11 {
> +	/**
> +	 * @shadow_va: Virtual address of the GPU memory to hold the shadow buffer.
> +	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
> +	 */
> +	__u64   shadow_va;
> +	/**
> +	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
> +	 * Use AMDGPU_INFO_IOCTL to find the exact size of the object.
> +	 */
> +	__u64   csa_va;
> +};
> +
> +/* GFX V11 SDMA IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_sdma_gfx11 {
> +	/**
> +	 * @csa_va: Virtual address of the GPU memory to hold the CSA buffer.
> +	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
> +	 * to get the size.
> +	 */
> +	__u64   csa_va;
> +};
> +
> +/* GFX V11 Compute IP specific MQD parameters */
> +struct drm_amdgpu_userq_mqd_compute_gfx11 {
> +	/**
> +	 * @eop_va: Virtual address of the GPU memory to hold the EOP buffer.
> +	 * This must be a from a separate GPU object, and use AMDGPU_INFO IOCTL
> +	 * to get the size.
> +	 */
> +	__u64   eop_va;
> +};
> +
> +/* userq signal/wait ioctl */
> +struct drm_amdgpu_userq_signal {
> +	/**
> +	 * @queue_id: Queue handle used by the userq fence creation function
> +	 * to retrieve the WPTR.
> +	 */
> +	__u32	queue_id;
> +	__u32	pad;
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to be signaled.
> +	 */
> +	__u64	syncobj_handles;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u64	num_syncobj_handles;
> +	/**
> +	 * @bo_read_handles: The list of BO handles that the submitted user queue job
> +	 * is using for read only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of BO handles that the submitted user queue job
> +	 * is using for write only. This will update BO fences in the kernel.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +
> +};
> +
> +struct drm_amdgpu_userq_fence_info {
> +	/**
> +	 * @va: A gpu address allocated for each queue which stores the
> +	 * read pointer (RPTR) value.
> +	 */
> +	__u64	va;
> +	/**
> +	 * @value: A 64 bit value represents the write pointer (WPTR) of the
> +	 * queue commands which compared with the RPTR value to signal the
> +	 * fences.
> +	 */
> +	__u64	value;
> +};
> +
> +struct drm_amdgpu_userq_wait {
> +	/**
> +	 * @syncobj_handles: The list of syncobj handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	syncobj_handles;
> +	/**
> +	 * @syncobj_timeline_handles: The list of timeline syncobj handles submitted by
> +	 * the user queue job to get the va/value pairs at given @syncobj_timeline_points.
> +	 */
> +	__u64	syncobj_timeline_handles;
> +	/**
> +	 * @syncobj_timeline_points: The list of timeline syncobj points submitted by the
> +	 * user queue job for the corresponding @syncobj_timeline_handles.
> +	 */
> +	__u64	syncobj_timeline_points;
> +	/**
> +	 * @bo_read_handles: The list of read BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_read_handles;
> +	/**
> +	 * @bo_write_handles: The list of write BO handles submitted by the user queue
> +	 * job to get the va/value pairs.
> +	 */
> +	__u64	bo_write_handles;
> +	/**
> +	 * @num_syncobj_timeline_handles: A count that represents the number of timeline
> +	 * syncobj handles in @syncobj_timeline_handles.
> +	 */
> +	__u16	num_syncobj_timeline_handles;
> +	/**
> +	 * @num_fences: This field can be used both as input and output. As input it defines
> +	 * the maximum number of fences that can be returned and as output it will specify
> +	 * how many fences were actually returned from the ioctl.
> +	 */
> +	__u16	num_fences;
> +	/**
> +	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
> +	 * @syncobj_handles.
> +	 */
> +	__u32	num_syncobj_handles;
> +	/**
> +	 * @num_bo_read_handles: A count that represents the number of read BO handles in
> +	 * @bo_read_handles.
> +	 */
> +	__u32	num_bo_read_handles;
> +	/**
> +	 * @num_bo_write_handles: A count that represents the number of write BO handles in
> +	 * @bo_write_handles.
> +	 */
> +	__u32	num_bo_write_handles;
> +	/**
> +	 * @out_fences: The field is a return value from the ioctl containing the list of
> +	 * address/value pairs to wait for.
> +	 */
> +	__u64	out_fences;
> +};
> +
>  /* vm ioctl */
>  #define AMDGPU_VM_OP_RESERVE_VMID	1
>  #define AMDGPU_VM_OP_UNRESERVE_VMID	2
> @@ -592,6 +833,19 @@ struct drm_amdgpu_gem_va {
>  	__u64 offset_in_bo;
>  	/** Specify mapping size. Must be correctly aligned. */
>  	__u64 map_size;
> +	/**
> +	 * vm_timeline_point is a sequence number used to add new timeline point.
> +	 */
> +	__u64 vm_timeline_point;
> +	/**
> +	 * The vm page table update fence is installed in given vm_timeline_syncobj_out
> +	 * at vm_timeline_point.
> +	 */
> +	__u32 vm_timeline_syncobj_out;
> +	/** the number of syncobj handles in @input_fence_syncobj_handles */
> +	__u32 num_syncobj_handles;
> +	/** Array of sync object handle to wait for given input fences */
> +	__u64 input_fence_syncobj_handles;
>  };
>  
>  #define AMDGPU_HW_IP_GFX          0
> diff --git a/tests/amdgpu/amd_userq_basic.c b/tests/amdgpu/amd_userq_basic.c
> new file mode 100644
> index 000000000..b010fed7a
> --- /dev/null
> +++ b/tests/amdgpu/amd_userq_basic.c
> @@ -0,0 +1,1706 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2014 Advanced Micro Devices, Inc.
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> + #include <pthread.h>
> + #include <time.h>
> + #include "lib/amdgpu/amd_memory.h"
> + #include "lib/amdgpu/amd_sdma.h"
> + #include "lib/amdgpu/amd_PM4.h"
> + #include "lib/amdgpu/amd_command_submission.h"
> + #include "lib/amdgpu/amd_compute.h"
> + #include "lib/amdgpu/amd_gfx.h"
> + #include "lib/amdgpu/amd_shaders.h"
> + #include "lib/amdgpu/amd_dispatch.h"
> + #include "include/drm-uapi/amdgpu_drm.h"
> + #include "lib/amdgpu/amd_cs_radv.h"
> +
> + #define BUFFER_SIZE (8 * 1024)
> +
> +/* Flag to indicate secure buffer related workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_SECURE   (1 << 0)
> +/* Flag to indicate AQL workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_AQL      (1 << 1)
> +

Please move all these defines to the appropriate header files (e.g., amd_PM4.h, amd_sdma.h). Many of these definitions are already declared in the corresponding headers, so merge them to avoid redundancy.

We cannot support multiple declarations of the same identifier across different tests.

> + #define PACKET_TYPE3			3
> + #define PACKET3(op, n)			((PACKET_TYPE3 << 30) |  \
> +					(((op) & 0xFF) << 8)  |  \
> +					((n) & 0x3FFF) << 16)
> +
> + #define PACKET3_NOP			0x10
> + #define PACKET3_PROTECTED_FENCE_SIGNAL	0xd0
> + #define PACKET3_FENCE_WAIT_MULTI	0xd1
> + #define PACKET3_WRITE_DATA		0x37
> +
> + #define PACKET3_WAIT_REG_MEM		0x3C
> + #define WAIT_REG_MEM_FUNCTION(x)	((x) << 0)
> + #define WAIT_REG_MEM_MEM_SPACE(x)	((x) << 4)
> + #define WAIT_REG_MEM_OPERATION(x)	((x) << 6)
> + #define WAIT_REG_MEM_ENGINE(x)		((x) << 8)
> +
> + #define WR_CONFIRM			(1 << 20)
> + #define WRITE_DATA_DST_SEL(x)		((x) << 8)
> + #define WRITE_DATA_ENGINE_SEL(x)	((x) << 30)
> + #define WRITE_DATA_CACHE_POLICY(x)	((x) << 25)
> + #define WAIT_MEM_ENGINE_SEL(x)		((x) << 0)
> + #define WAIT_MEM_WAIT_PREEMPTABLE(x)	((x) << 1)
> + #define WAIT_MEM_CACHE_POLICY(x)	((x) << 2)
> + #define WAIT_MEM_POLL_INTERVAL(x)	((x) << 16)
> +
> + #define DOORBELL_INDEX			4
> + #define AMDGPU_USERQ_BO_WRITE		1
> +
> + #define	PACKET3_RELEASE_MEM				0x49
> + #define		PACKET3_RELEASE_MEM_CACHE_POLICY(x)	((x) << 25)
> + #define		PACKET3_RELEASE_MEM_DATA_SEL(x)		((x) << 29)
> + #define		PACKET3_RELEASE_MEM_INT_SEL(x)		((x) << 24)
> + #define		CACHE_FLUSH_AND_INV_TS_EVENT		0x00000014
> +
> + #define		PACKET3_RELEASE_MEM_EVENT_TYPE(x)	((x) << 0)
> + #define		PACKET3_RELEASE_MEM_EVENT_INDEX(x)	((x) << 8)
> + #define		PACKET3_RELEASE_MEM_GCR_GLM_WB		(1 << 12)
> + #define		PACKET3_RELEASE_MEM_GCR_GLM_INV		(1 << 13)
> + #define		PACKET3_RELEASE_MEM_GCR_GLV_INV		(1 << 14)
> + #define		PACKET3_RELEASE_MEM_GCR_GL1_INV		(1 << 15)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_US		(1 << 16)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_RANGE	(1 << 17)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_DISCARD	(1 << 19)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_INV		(1 << 20)
> + #define		PACKET3_RELEASE_MEM_GCR_GL2_WB		(1 << 21)
> + #define		PACKET3_RELEASE_MEM_GCR_SEQ		(1 << 22)
> +
> +//SDMA related
> + #define SDMA_OPCODE_COPY		1
> + #define SDMA_OPCODE_WRITE		2
> + #define SDMA_COPY_SUB_OPCODE_LINEAR	0
> + #define SDMA_PACKET(op, sub_op, e)      ((((e) & 0xFFFF) << 16) |       \
> +					(((sub_op) & 0xFF) << 8) |      \
> +					(((op) & 0xFF) << 0))
The macro "upper_32_bits"  is already defined elsewhere...
> + #define upper_32_bits(n) ((uint32_t)(((n) >> 16) >> 16))
> + #define lower_32_bits(n) ((uint32_t)((n) & 0xfffffffc))
> +
> +/* user queue IOCTL */
> + #define AMDGPU_USERQ_OP_CREATE  1
> + #define AMDGPU_USERQ_OP_FREE    2
> +
> +/* Flag to indicate secure buffer related workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_SECURE   (1 << 0)
> +/* Flag to indicate AQL workload, unused for now */
> + #define AMDGPU_USERQ_MQD_FLAGS_AQL      (1 << 1)
> +
> +//#define WORKLOAD_COUNT				7
> + #define WORKLOAD_COUNT				1
> + #define DEBUG_USERQUEUE				1
> +
> + #define PAGE_SIZE			4096
> + #define USERMODE_QUEUE_SIZE		(PAGE_SIZE * 256)
> + #define ALIGNMENT			4096
> +
> +struct amdgpu_userq_bo {
> +	amdgpu_bo_handle handle;
> +	amdgpu_va_handle va_handle;
> +	uint64_t mc_addr;
> +	uint64_t size;
> +	void *ptr;
> +};
> +
Also, avoid using global variables for maintenance reasons. They can cause issues when helper functions are called from different processes or threads. Our queue_reset test benefits from the absence of global variables, making it easier to assemble new tests.
> +static struct amdgpu_userq_bo shared_userq_bo;
> +static int shared_syncobj_fd1;
> +static int shared_syncobj_fd2;
> +
> +pthread_cond_t cond = PTHREAD_COND_INITIALIZER;
> +pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
> +
Additionally, the DEBUG_USERQUEUE flag should be removed or commented out.
> + #if DEBUG_USERQUEUE
> +static void packet_dump(uint32_t *ptr, int start, int end)
> +{
> +	int i;
> +
> +	igt_info("\n============PACKET==============\n");
> +	for (i = start; i < end; i++)
> +		igt_info("pkt[%d] = 0x%x\n", i - start, ptr[i]);
> +
> +	igt_info("=================================\n");
> +}
> + #endif
> +

The function validation is intended solely for debugging purposes, as we cannot reliably wait for a redefined value in memory for a fixed amount of time before breaking the test. Please wrap this validation within a debug conditional (ifdef).

We have comparison functions in hook , for example :

    int (*compare)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);
    int (*compare_pattern)(const struct amdgpu_ip_funcs *func, const struct amdgpu_ring_context *context, int div);

> +static void validation(uint32_t *workload)
> +{
> +	int i = 0;
> +
> +	while (workload[0] != 0xdeadbeaf) {
> +		if (i++ > 100)
> +			break;
> +		usleep(100);
> +	}
> +
> +	igt_info("\n========OUTPUT==========\n");
> +	for (i = 0; i < 5; i++)
> +		igt_info("worklod[%d] = %x\n", i, workload[i]);
> +
> +	igt_info("===========================\n");
> +}
> +

 Packet assembly is an ASIC-specific operation and should be implemented in amd_ip_blocks.c. A separate hook may be required depending on the context.

Please ensure this is applied consistently across all relevant areas.

> +static void create_relmem_workload(uint32_t *ptr, int *npkt, int data,
> +			    uint64_t *wptr_cpu, uint64_t *doorbell_ptr,
> +			    uint32_t q_id, uint64_t addr)
> +{
> +	ptr[(*npkt)++] = (PACKET3(PACKET3_RELEASE_MEM, 6));
> +	ptr[(*npkt)++] = 0x0030e514;
> +	ptr[(*npkt)++] = 0x23010000;
> +	ptr[(*npkt)++] = lower_32_bits(addr);
> +	ptr[(*npkt)++] = upper_32_bits(addr);
> +	ptr[(*npkt)++] = 0xffffffff & data;
> +	ptr[(*npkt)++] = 0;
> +	ptr[(*npkt)++] = q_id;
> +	*wptr_cpu = *npkt;
> +	doorbell_ptr[DOORBELL_INDEX] = *npkt;
> +}
> +
> +static int create_submit_workload(uint32_t *ptr, int *npkt, uint32_t data,
> +			   uint64_t *wptr_cpu, uint64_t *doorbell_ptr,
> +			   uint32_t q_id, struct amdgpu_userq_bo *dstptr)
> +{
> + #if DEBUG_USERQUEUE
> +	int start = *npkt;
> + #endif
> +	ptr[(*npkt)++] = PACKET3(PACKET3_WRITE_DATA, 7);
> +	ptr[(*npkt)++] =
> +	    WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3);
> +
> +	ptr[(*npkt)++] = 0xfffffffc & (dstptr->mc_addr);
> +	ptr[(*npkt)++] = (0xffffffff00000000 & (dstptr->mc_addr)) >> 32;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	ptr[(*npkt)++] = data;
> +	create_relmem_workload(ptr, npkt, 0xdeadbeaf, wptr_cpu,
> +			       doorbell_ptr, q_id, dstptr->mc_addr);
> + #if DEBUG_USERQUEUE
> +	packet_dump(ptr, start, *npkt);
> + #endif
> +	return 0;
> +}
> +
> +static void alloc_doorbell(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *doorbell_bo,
> +			   unsigned int size, unsigned int domain)
> +{
> +	struct amdgpu_bo_alloc_request req = {0};
> +	amdgpu_bo_handle buf_handle;
> +	int r;
> +
> +	req.alloc_size = ALIGN(size, PAGE_SIZE);
> +	req.preferred_heap = domain;
> +
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
> +static int timeline_syncobj_wait(amdgpu_device_handle device_handle, uint32_t timeline_syncobj_handle)
> +{
> +	uint64_t point, signaled_point;
> +	uint64_t timeout;
> +	struct timespec tp;
> +	uint32_t flags = DRM_SYNCOBJ_QUERY_FLAGS_LAST_SUBMITTED;
> +	int r;
> +
> +	do {
> +		r = amdgpu_cs_syncobj_query2(device_handle, &timeline_syncobj_handle,
> +					     (uint64_t *)&point, 1, flags);
> +		if (r)
> +			return r;
> +
> +		timeout = 0;
> +		clock_gettime(CLOCK_MONOTONIC, &tp);
> +		timeout = tp.tv_sec * 1000000000ULL + tp.tv_nsec;
> +		timeout += 100000000; //100 millisec
> +		r = amdgpu_cs_syncobj_timeline_wait(device_handle, &timeline_syncobj_handle,
> +						    (uint64_t *)&point, 1, timeout,
> +						    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL |
> +						    DRM_SYNCOBJ_WAIT_FLAGS_WAIT_FOR_SUBMIT,
> +						    NULL);
> +		if (r)
> +			return r;
> +
> +		r = amdgpu_cs_syncobj_query(device_handle, &timeline_syncobj_handle, &signaled_point, 1);
> +		if (r)
> +			return r;
> +	} while (point != signaled_point);
> +
> +	return r;
> +}
> +
> +static int
> +amdgpu_bo_unmap_and_free_uq(amdgpu_device_handle dev, amdgpu_bo_handle bo,
> +			    amdgpu_va_handle va_handle, uint64_t mc_addr, uint64_t size,
> +			    uint32_t timeline_syncobj_handle, uint16_t point)
> +{
> +	amdgpu_bo_cpu_unmap(bo);
> +	amdgpu_bo_va_op_raw2(dev, bo, 0, size, mc_addr, 0, AMDGPU_VA_OP_UNMAP, timeline_syncobj_handle, point, 0, 0);
> +
> +	amdgpu_va_range_free(va_handle);
> +	amdgpu_bo_free(bo);
> +
> +	return 0;
> +}
> +
> +static int amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle dev,
> +					      uint64_t size,
> +					      uint64_t alignment,
> +					      uint64_t heap,
> +					      uint64_t alloc_flags,
> +					      uint64_t mapping_flags,
> +					      amdgpu_bo_handle *bo,
> +					      void **cpu,
> +					      uint64_t *mc_address,
> +					      amdgpu_va_handle *va_handle,
> +					      uint32_t timeline_syncobj_handle,
> +					      uint64_t point)
> +{
> +	struct amdgpu_bo_alloc_request request = {};
> +	amdgpu_bo_handle buf_handle;
> +	amdgpu_va_handle handle;
> +	uint64_t vmc_addr;
> +	int r;
> +
> +	request.alloc_size = size;
> +	request.phys_alignment = alignment;
> +	request.preferred_heap = heap;
> +	request.flags = alloc_flags;
> +
> +	r = amdgpu_bo_alloc(dev, &request, &buf_handle);
> +	if (r)
> +		return r;
> +
> +	r = amdgpu_va_range_alloc(dev,
> +				  amdgpu_gpu_va_range_general,
> +				  size, alignment, 0, &vmc_addr,
> +				  &handle, 0);
> +	if (r)
> +		goto error_va_alloc;
> +
> +	r = amdgpu_bo_va_op_raw2(dev, buf_handle, 0,  ALIGN(size, getpagesize()), vmc_addr,
> +				   AMDGPU_VM_PAGE_READABLE |
> +				   AMDGPU_VM_PAGE_WRITEABLE |
> +				   AMDGPU_VM_PAGE_EXECUTABLE |
> +				   mapping_flags,
> +				   AMDGPU_VA_OP_MAP,
> +				   timeline_syncobj_handle,
> +				   point, 0, 0);
> +	if (r) {
> +		goto error_va_map;
> +	}
> +
> +	r = amdgpu_bo_cpu_map(buf_handle, cpu);
> +	if (r)
> +		goto error_cpu_map;
> +
> +	*bo = buf_handle;
> +	*mc_address = vmc_addr;
> +	*va_handle = handle;
> +
> +	return 0;
> +
> + error_cpu_map:
> +	amdgpu_bo_cpu_unmap(buf_handle);
> + error_va_map:
> +	amdgpu_bo_va_op(buf_handle, 0, size, vmc_addr, 0, AMDGPU_VA_OP_UNMAP);
> + error_va_alloc:
> +	amdgpu_bo_free(buf_handle);
> +	return r;
> +}
> +
> +static void free_workload(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *dstptr,
> +		   uint32_t timeline_syncobj_handle, uint64_t point,
> +		   uint64_t syncobj_handles_array, uint32_t num_syncobj_handles)
> +{
> +	int r;
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device_handle, dstptr->handle, dstptr->va_handle,
> +				     dstptr->mc_addr, PAGE_SIZE,
> +				     timeline_syncobj_handle, point);
> +	igt_assert_eq(r, 0);
> +}
> +
> +static int allocate_workload(amdgpu_device_handle device_handle, struct amdgpu_userq_bo *dstptr,
> +		      uint32_t timeline_syncobj_handle, uint64_t point)
> +{
> +
> +	uint64_t gtt_flags = AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> +
> +	int r;
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device_handle, PAGE_SIZE,
> +				       PAGE_SIZE,
> +				       AMDGPU_GEM_DOMAIN_VRAM,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &dstptr->handle, &dstptr->ptr,
> +				       &dstptr->mc_addr, &dstptr->va_handle,
> +				       timeline_syncobj_handle, point);
> +	memset(&dstptr->ptr, 0x0, sizeof(*dstptr->ptr));
> +	return r;
> +}
> +
> +static int create_sync_objects(int fd, uint32_t *timeline_syncobj_handle,
> +			       uint32_t *timeline_syncobj_handle2)
> +{
> +	int r;
> +
> +	r = drmSyncobjCreate(fd, 0, timeline_syncobj_handle);
> +	if (r)
> +		return r;
> +
> +	r = drmSyncobjCreate(fd, 0, timeline_syncobj_handle2);
> +
> +	return r;
> +}
> +
> +static void *userq_signal(void *data)
> +{
> +	struct  amdgpu_userq_bo queue, shadow, doorbell, wptr_bo, rptr;
> +	uint32_t q_id, syncobj_handle, syncobj_handle1, db_handle;
> +	uint64_t gtt_flags = 0, *doorbell_ptr, *wptr;
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	struct  amdgpu_userq_bo gds, csa;
> +	uint32_t syncarray[2];
> +	uint32_t *ptr;
> +	int r, i;
> +	uint32_t timeline_syncobj_handle;
> +	uint64_t point = 0;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t point2 = 0;
> +	struct drm_amdgpu_userq_signal signal_data;
> +	uint32_t bo_read_handles[1], bo_write_handles[1];
> +	uint32_t read_handle, write_handle;
> +
> +
> +	amdgpu_device_handle device = (amdgpu_device_handle)data;
> +
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +				ALIGNMENT,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&queue.handle, &queue.ptr,
> +				&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&wptr_bo.handle, &wptr_bo.ptr,
> +				&wptr_bo.mc_addr, &wptr_bo.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&rptr.handle, &rptr.ptr,
> +				&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&shadow.handle, &shadow.ptr,
> +				&shadow.mc_addr, &shadow.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&gds.handle, &gds.ptr,
> +				&gds.mc_addr, &gds.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&csa.handle, &csa.ptr,
> +				&csa.mc_addr, &csa.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	//mqd.gds_va = gds.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *)doorbell.ptr;
> +
> +	ptr = (uint32_t *)queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	wptr = (uint64_t *)wptr_bo.ptr;
> +	memset(wptr, 0, sizeof(*wptr));
> +
> +	//amdgpu_userqueue_get_bo_handle(doorbell.handle, &db_handle);
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr_bo.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	r = drmSyncobjCreate(fd, 0, &syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &syncobj_handle1);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjHandleToFD(fd, syncobj_handle, &shared_syncobj_fd2);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjHandleToFD(fd, syncobj_handle1, &shared_syncobj_fd1);
> +	igt_assert_eq(r, 0);
> +
> +	syncarray[0] = syncobj_handle;
> +	syncarray[1] = syncobj_handle1;
> +
> +	ptr[0] = PACKET3(PACKET3_WRITE_DATA, 7);
> +	ptr[1] = WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3);
> +	ptr[2] = 0xfffffffc & (shared_userq_bo.mc_addr);
> +	ptr[3] = (0xffffffff00000000 & (shared_userq_bo.mc_addr)) >> 32;
> +	ptr[4] = 0xdeadbeaf;
> +	ptr[5] = 0xdeadbeaf;
> +	ptr[6] = 0xdeadbeaf;
> +	ptr[7] = 0xdeadbeaf;
> +	ptr[8] = 0xdeadbeaf;
> +
> +	for (i = 9; i <= 60; i++)
> +		ptr[i] = PACKET3(PACKET3_NOP, 0x3fff);
> +
> +	ptr[i++] = PACKET3(PACKET3_PROTECTED_FENCE_SIGNAL, 0);
> +
> +	*wptr = ++i;
> +	r = amdgpu_bo_export(queue.handle, amdgpu_bo_handle_type_kms, &read_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_export(shadow.handle, amdgpu_bo_handle_type_kms, &write_handle);
> +	igt_assert_eq(r, 0);
> +	// Assign the exported handles to the arrays
> +	bo_read_handles[0] = read_handle;
> +	bo_write_handles[0] = write_handle;
> +
> +	signal_data.queue_id = q_id;
> +	signal_data.syncobj_handles = (uint64_t)&syncarray;
> +	signal_data.num_syncobj_handles = 2;
> +	signal_data.bo_write_handles = (uint64_t)bo_write_handles;
> +	signal_data.num_bo_write_handles = 1;
> +	signal_data.bo_read_handles = (uint64_t)bo_read_handles;
> +	signal_data.num_bo_read_handles = 1;
> +
> +	r = amdgpu_userq_signal(device, &signal_data);
> +	igt_assert_eq(r, 0);
> +
> +	doorbell_ptr[DOORBELL_INDEX]  = i;
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +	if (!r)
> +		pthread_cond_signal(&cond);
> +
> +err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					csa.va_handle,
> +					csa.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					gds.va_handle,
> +					gds.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					shadow.va_handle,
> +					shadow.mc_addr, PAGE_SIZE * 4,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle,
> +				     rptr.mc_addr, PAGE_SIZE);
> +
> +	amdgpu_bo_unmap_and_free(wptr_bo.handle, wptr_bo.va_handle,
> +				     wptr_bo.mc_addr, PAGE_SIZE);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				     queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +
> +	return (void *)(long)r;
> +}
> +
> +static void *userq_wait(void *data)
> +{
> +	struct  amdgpu_userq_bo queue, shadow, doorbell, wptr_bo, rptr;
> +	struct  amdgpu_userq_bo gds, csa;
> +	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
> +	uint32_t syncobj_handle, syncobj_handle1, db_handle;
> +	uint64_t num_fences;
> +	uint64_t gtt_flags = 0, *doorbell_ptr, *wptr;
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	uint64_t gpu_addr, reference_val;
> +	uint32_t *ptr;
> +	uint32_t q_id;
> +	int i, r, fd;
> +	uint32_t timeline_syncobj_handle;
> +	uint64_t point = 0;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t point2 = 0;
> +	struct drm_amdgpu_userq_wait wait_data;
> +	uint32_t bo_read_handles[1], bo_write_handles[1];
> +	uint32_t read_handle, write_handle;
> +	uint32_t syncarray[3], points[3];
> +	amdgpu_device_handle device;
> +
> +	pthread_mutex_lock(&lock);
> +	pthread_cond_wait(&cond, &lock);
> +	pthread_mutex_unlock(&lock);
> +
> +	device = (amdgpu_device_handle)data;
> +	fd = amdgpu_device_get_fd(device);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +				ALIGNMENT,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&queue.handle, &queue.ptr,
> +				&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&wptr_bo.handle, &wptr_bo.ptr,
> +				&wptr_bo.mc_addr, &wptr_bo.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_raw(device, PAGE_SIZE,
> +				PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&rptr.handle, &rptr.ptr,
> +				&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&shadow.handle, &shadow.ptr,
> +				&shadow.mc_addr, &shadow.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&gds.handle, &gds.ptr,
> +				&gds.mc_addr, &gds.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&csa.handle, &csa.ptr,
> +				&csa.mc_addr, &csa.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *)doorbell.ptr;
> +
> +	ptr = (uint32_t *)queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	wptr = (uint64_t *)wptr_bo.ptr;
> +	memset(wptr, 0, sizeof(*wptr));
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr_bo.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	r = drmSyncobjFDToHandle(fd, shared_syncobj_fd1, &syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjFDToHandle(fd, shared_syncobj_fd2, &syncobj_handle1);
> +	igt_assert_eq(r, 0);
> +
> +	syncarray[0] = syncobj_handle;
> +	syncarray[1] = syncobj_handle1;
> +
> +	points[0] = 0;
> +	points[1] = 0;
> +	num_fences = 0;
> +	 r = amdgpu_bo_export(queue.handle, amdgpu_bo_handle_type_kms, &read_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_export(shadow.handle, amdgpu_bo_handle_type_kms, &write_handle);
> +	igt_assert_eq(r, 0);
> +
> +	// Assign the exported handles to the arrays
> +	bo_read_handles[0] = read_handle;
> +	bo_write_handles[0] = write_handle;
> +
> +	wait_data.syncobj_handles = (uint64_t)syncarray;
> +	wait_data.num_syncobj_handles = 2;
> +	wait_data.syncobj_timeline_handles = (uint64_t)syncarray;
> +	wait_data.syncobj_timeline_points = (uint64_t)points;
> +	wait_data.num_syncobj_timeline_handles = 2;
> +	wait_data.bo_read_handles =  (uint64_t)bo_read_handles;
> +	wait_data.num_bo_read_handles = 1;
> +	wait_data.bo_write_handles = (uint64_t)bo_write_handles;
> +	wait_data.num_bo_write_handles = 1;
> +	wait_data.out_fences = (uint64_t)fence_info;
> +	wait_data.num_fences = num_fences;
> +
> +	igt_assert_eq(r, 0);
> +
> +	num_fences = wait_data.num_fences;
> +	fence_info = malloc(num_fences * sizeof(struct drm_amdgpu_userq_fence_info));
> +	if (!fence_info)
> +		goto err_free_queue;
> +	memset(fence_info, 0, num_fences * sizeof(struct drm_amdgpu_userq_fence_info));
> +	wait_data.out_fences = (uint64_t)fence_info;
> +	r = amdgpu_userq_wait(device, &wait_data);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < num_fences; i++) {
> +		igt_info("num_fences = %lu fence_info.va=0x%llx fence_info.value=%llu\n",
> +			num_fences, (fence_info + i)->va, (fence_info + i)->value);
> +
> +		gpu_addr = (fence_info + i)->va;
> +		reference_val = (fence_info + i)->value;
> +		ptr[0] = PACKET3(PACKET3_FENCE_WAIT_MULTI, 4);
> +		ptr[1] = WAIT_MEM_ENGINE_SEL(1) | WAIT_MEM_WAIT_PREEMPTABLE(0) | WAIT_MEM_CACHE_POLICY(3) | WAIT_MEM_POLL_INTERVAL(2);
> +		ptr[2] = 0xffffffff & (gpu_addr);
> +		ptr[3] = (0xffffffff00000000 & (gpu_addr)) >> 16;
> +		ptr[4] = 0xffffffff & (reference_val);
> +		ptr[5] = (0xffffffff00000000 & (reference_val)) >> 32;
> +		*wptr = 6;
> +		doorbell_ptr[DOORBELL_INDEX]  = 6;
> +	}
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					csa.va_handle,
> +					csa.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					gds.va_handle,
> +					gds.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					shadow.va_handle,
> +					shadow.mc_addr, PAGE_SIZE * 4,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle,
> +				     rptr.mc_addr, PAGE_SIZE);
Please remove this line wherever applicable.
 *     //igt_assert_eq(r, 0);
> +	//igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(wptr_bo.handle, wptr_bo.va_handle,
> +				     wptr_bo.mc_addr, PAGE_SIZE);
> +	//igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				     queue.mc_addr, USERMODE_QUEUE_SIZE);
> +	//igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, syncobj_handle1);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +	free(fence_info);
> +	return (void *)(long)r;
> +}
> +
> +static void amdgpu_command_submission_umq_synchronize_test(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r;
> +	static pthread_t signal_thread, wait_thread;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +
> +
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_GTT,
> +				       gtt_flags,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &shared_userq_bo.handle, &shared_userq_bo.ptr,
> +				       &shared_userq_bo.mc_addr, &shared_userq_bo.va_handle,
> +				       timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_create(&signal_thread, NULL, userq_signal, device);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_create(&wait_thread, NULL, userq_wait, device);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_join(signal_thread, NULL);
> +	igt_assert_eq(r, 0);
> +
> +	r = pthread_join(wait_thread, NULL);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free_uq(device, shared_userq_bo.handle,
> +				    shared_userq_bo.va_handle,
> +				    shared_userq_bo.mc_addr,
> +				    PAGE_SIZE, timeline_syncobj_handle2,
> +				    ++point2);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +}
> +
> +static void amdgpu_command_submission_umq_timeline_test(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	struct  amdgpu_userq_bo queue, shadow, doorbell, wptr, rptr;
> +	struct  amdgpu_userq_bo gds, csa;
> +	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
> +	uint64_t num_fences;
> +	uint64_t gtt_flags = 0, *doorbell_ptr, *wptr_cpu;
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	struct  amdgpu_userq_bo dstptrs[WORKLOAD_COUNT];
> +	uint32_t q_id, db_handle, *ptr;
> +	uint32_t timeline_syncobj_handle;
> +	uint64_t point = 0;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t point2 = 0;
> +	uint32_t syncarray[3], points[3];
> +	uint32_t test_timeline_syncobj_handle;
> +	uint32_t test_timeline_syncobj_handle2;
> +	uint64_t signal_point, payload;
> +	struct drm_amdgpu_userq_wait wait_data;
> +	int i, r, npkt = 0;
> +	uint32_t bo_read_handles[1], bo_write_handles[1];
> +	uint32_t read_handle, write_handle;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &test_timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjCreate(fd, 0, &test_timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r =  amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_GTT,
> +				gtt_flags,
> +				AMDGPU_VM_MTYPE_UC,
> +				&shadow.handle, &shadow.ptr,
> +				&shadow.mc_addr, &shadow.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&gds.handle, &gds.ptr,
> +				&gds.mc_addr, &gds.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE, PAGE_SIZE,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				gtt_flags,
> +				0,
> +				&csa.handle, &csa.ptr,
> +				&csa.mc_addr, &csa.va_handle,
> +				timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	ptr = (uint32_t *)queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	wptr_cpu = (uint64_t *)wptr.ptr;
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle, ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111*(i+1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *)dstptrs[i].ptr);
> +	signal_point = 5;
> +	r = amdgpu_cs_syncobj_timeline_signal(device, &test_timeline_syncobj_handle,
> +					      &signal_point, 1);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_cs_syncobj_query(device, &test_timeline_syncobj_handle,
> +				    &payload, 1);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(payload, 5);
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle, ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111*(i+1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *)dstptrs[i].ptr);
> +
> +	signal_point = 10;
> +	r = amdgpu_cs_syncobj_timeline_signal(device, &test_timeline_syncobj_handle,
> +					      &signal_point, 1);
> +	igt_assert_eq(r, 0);
> +	r = amdgpu_cs_syncobj_query(device, &test_timeline_syncobj_handle,
> +				    &payload, 1);
> +	igt_assert_eq(r, 0);
> +	igt_assert_eq(payload, 10);
> +
> +	syncarray[0] = test_timeline_syncobj_handle;
> +	syncarray[1] = test_timeline_syncobj_handle;
> +
> +	points[0] = 5;
> +	points[1] = 10;
> +
> +	num_fences = 0;
> +
> +	// Export the buffer object handles
> +	r = amdgpu_bo_export(queue.handle, amdgpu_bo_handle_type_kms, &read_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_export(shadow.handle, amdgpu_bo_handle_type_kms, &write_handle);
> +	igt_assert_eq(r, 0);
> +
> +	// Assign the exported handles to the arrays
> +	bo_read_handles[0] = read_handle;
> +	bo_write_handles[0] = write_handle;
> +
> +	wait_data.syncobj_handles = (uint64_t)syncarray;
> +	wait_data.num_syncobj_handles = 2;
> +	wait_data.syncobj_timeline_handles = (uint64_t)syncarray;
> +	wait_data.syncobj_timeline_points = (uint64_t)points;
> +	wait_data.num_syncobj_timeline_handles = 2;
> +	wait_data.bo_read_handles =  (uint64_t)bo_read_handles;
> +	wait_data.num_bo_read_handles = 1;
> +	wait_data.bo_write_handles = (uint64_t)bo_write_handles;
> +	wait_data.num_bo_write_handles = 1;
> +	wait_data.out_fences = (uint64_t)fence_info;
> +	wait_data.num_fences = num_fences;
> +	r = amdgpu_userq_wait(device, &wait_data);
> +	igt_assert_eq(r, 0);
> +
> +	fence_info = malloc(num_fences * sizeof(struct drm_amdgpu_userq_fence_info));
> +	r = amdgpu_userq_wait(device, &wait_data);
> +	igt_assert_eq(r, 0);
> +
> +	for (i = 0; i < num_fences; i++)
> +		igt_info("num_fences = %lu fence_info.va=0x%llx fence_info.value=%llu\n",
> +			num_fences, (fence_info + i)->va, (fence_info + i)->value);
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +	/* Free workload*/
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		free_workload(device, &dstptrs[i], timeline_syncobj_handle2, ++point2,
> +			      0, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					csa.va_handle,
> +					csa.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					gds.va_handle,
> +					gds.mc_addr, PAGE_SIZE,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					shadow.va_handle,
> +					shadow.mc_addr, PAGE_SIZE * 4,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle,
> +				     rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle,
> +				     wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				     queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, test_timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = drmSyncobjDestroy(fd, test_timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +}
> +
> +/**
> + * AMDGPU_HW_IP_DMA
> + * @param device
> + */
> +static void amdgpu_command_submission_umq_sdma(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r, i = 0, j = 0;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t *ptr, *dstptr;
> +	uint32_t q_id, db_handle;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t *doorbell_ptr, *wptr_cpu;
> +	const int sdma_write_length = WORKLOAD_COUNT;
> +	struct drm_amdgpu_userq_mqd_sdma_gfx11 mqd;
> +	struct amdgpu_userq_bo queue, doorbell, rptr, wptr, dst;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 10,
> +				       ALIGNMENT,
> +				       AMDGPU_GEM_DOMAIN_VRAM,
> +				       gtt_flags | AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
> +				       AMDGPU_VM_MTYPE_UC,
> +				       &dst.handle, &dst.ptr,
> +				       &dst.mc_addr, &dst.va_handle,
> +				       timeline_syncobj_handle, ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE * 2, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	wptr_cpu = (uint64_t *) wptr.ptr;
> +
> +	ptr = (uint32_t *) queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	dstptr = (uint32_t *)dst.ptr;
> +	memset(dstptr, 0, sizeof(*dstptr) * sdma_write_length);
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_DMA,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	ptr[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE, 0, 0);
> +	ptr[i++] = lower_32_bits(dst.mc_addr);
> +	ptr[i++] = upper_32_bits(dst.mc_addr);
> +	ptr[i++] = sdma_write_length - 1;
> +	while (j++ < sdma_write_length)
> +		ptr[i++] = 0xdeadbeaf;
> +
> +	*wptr_cpu = i << 2;
> +
> +	doorbell_ptr[DOORBELL_INDEX] = i << 2;
> +
> +	i = 0;
> +	while (dstptr[0] != 0xdeadbeaf) {
> +		if (i++ > 100)
> +			break;
> +		usleep(100);
> +	}
> +
> +	for (int k = 0; k < sdma_write_length; k++) {
> +		igt_assert_eq(dstptr[k], 0xdeadbeaf);
> +	}
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +
> + err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, dst.handle,
> +					dst.va_handle, dst.mc_addr,
> +					PAGE_SIZE * 10,
> +					timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle, rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle, wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				 queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +}
> +
> +/**
> + * AMDGPU_HW_IP_COMPUTE
> + * @param device
> + */
> +static void amdgpu_command_submission_umq_compute(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r, i = 0, npkt = 0;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t *ptr;
> +	uint32_t q_id, db_handle;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t *doorbell_ptr, *wptr_cpu;
> +	struct amdgpu_userq_bo dstptrs[WORKLOAD_COUNT];
> +	struct drm_amdgpu_userq_mqd_compute_gfx11 mqd;
> +	struct amdgpu_userq_bo queue, doorbell, rptr, wptr, eop;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, 256,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &eop.handle, &eop.ptr,
> +					       &eop.mc_addr, &eop.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.eop_va = eop.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	wptr_cpu = (uint64_t *) wptr.ptr;
> +
> +	ptr = (uint32_t *) queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_COMPUTE,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	/* allocate workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle,
> +				      ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* create workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111 * (i + 1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* validation 0f workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *) dstptrs[i].ptr);
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +	/* Free workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		free_workload(device, &dstptrs[i], timeline_syncobj_handle2, ++point2,
> +			      0, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +
> + err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, eop.handle,
> +					     eop.va_handle, eop.mc_addr,
> +					     256,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle, rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle, wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				 queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +}
> +
> +/**
> + * AMDGPU_HW_IP_GFX
> + * @param device
> + */
> +static void amdgpu_command_submission_umq_gfx(amdgpu_device_handle device,
> +					      bool ce_avails)
> +{
> +	int r, i = 0, npkt = 0;
> +	uint64_t gtt_flags = 0;
> +	uint16_t point = 0;
> +	uint16_t point2 = 0;
> +	uint32_t *ptr;
> +	uint32_t q_id, db_handle;
> +	uint32_t timeline_syncobj_handle;
> +	uint32_t timeline_syncobj_handle2;
> +	uint64_t *doorbell_ptr, *wptr_cpu;
> +	struct amdgpu_userq_bo dstptrs[WORKLOAD_COUNT];
> +	struct drm_amdgpu_userq_mqd_gfx11 mqd;
> +	struct amdgpu_userq_bo queue, shadow, doorbell, rptr, wptr, gds, csa;
> +	int fd = amdgpu_device_get_fd(device);
> +
> +	r = create_sync_objects(fd, &timeline_syncobj_handle,
> +				&timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, USERMODE_QUEUE_SIZE,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&queue.handle, &queue.ptr,
> +					&queue.mc_addr, &queue.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&wptr.handle, &wptr.ptr,
> +					&wptr.mc_addr, &wptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_raw(device, 8,
> +					ALIGNMENT,
> +					AMDGPU_GEM_DOMAIN_GTT,
> +					gtt_flags,
> +					AMDGPU_VM_MTYPE_UC,
> +					&rptr.handle, &rptr.ptr,
> +					&rptr.mc_addr, &rptr.va_handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 18,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &shadow.handle, &shadow.ptr,
> +					       &shadow.mc_addr,
> +					       &shadow.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 4,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &gds.handle, &gds.ptr,
> +					       &gds.mc_addr, &gds.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_alloc_and_map_uq(device, PAGE_SIZE * 20,
> +					       PAGE_SIZE, AMDGPU_GEM_DOMAIN_GTT,
> +					       gtt_flags, AMDGPU_VM_MTYPE_UC,
> +					       &csa.handle, &csa.ptr,
> +					       &csa.mc_addr, &csa.va_handle,
> +					       timeline_syncobj_handle,
> +					       ++point);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	alloc_doorbell(device, &doorbell, PAGE_SIZE, AMDGPU_GEM_DOMAIN_DOORBELL);
> +
> +	mqd.shadow_va = shadow.mc_addr;
> +	mqd.csa_va = csa.mc_addr;
> +
> +	doorbell_ptr = (uint64_t *) doorbell.ptr;
> +
> +	wptr_cpu = (uint64_t *) wptr.ptr;
> +
> +	ptr = (uint32_t *) queue.ptr;
> +	memset(ptr, 0, sizeof(*ptr));
> +
> +	amdgpu_bo_export(doorbell.handle, amdgpu_bo_handle_type_kms, &db_handle);
> +
> +
> +	/* Create the Usermode Queue */
> +	r = amdgpu_create_userqueue(device, AMDGPU_HW_IP_GFX,
> +				    db_handle, DOORBELL_INDEX,
> +				    queue.mc_addr, USERMODE_QUEUE_SIZE,
> +				    wptr.mc_addr, rptr.mc_addr, &mqd, &q_id);
> +	igt_assert_eq(r, 0);
> +	if (r)
> +		goto err_free_queue;
> +
> +	/* allocate workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = allocate_workload(device, &dstptrs[i], timeline_syncobj_handle,
> +				      ++point);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* wait */
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle);
> +	igt_assert_eq(r, 0);
> +
> +	/* create workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++) {
> +		r = create_submit_workload(ptr, &npkt, 0x1111 * (i + 1),
> +					   wptr_cpu, doorbell_ptr, q_id,
> +					   &dstptrs[i]);
> +		igt_assert_eq(r, 0);
> +	}
> +
> +	/* validation 0f workload pkt */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		validation((uint32_t *) dstptrs[i].ptr);
> +
> +	/* Free the Usermode Queue */
> +	r = amdgpu_free_userqueue(device, q_id);
> +	igt_assert_eq(r, 0);
> +
> +	/* Free workload */
> +	for (i = 0; i < WORKLOAD_COUNT; i++)
> +		free_workload(device, &dstptrs[i], timeline_syncobj_handle2, ++point2,
> +			      0, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +
> + err_free_queue:
> +	r = amdgpu_bo_unmap_and_free_uq(device, csa.handle,
> +					     csa.va_handle, csa.mc_addr,
> +					     PAGE_SIZE,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, gds.handle,
> +					     gds.va_handle, gds.mc_addr, PAGE_SIZE,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_unmap_and_free_uq(device, shadow.handle,
> +					     shadow.va_handle, shadow.mc_addr,
> +					     PAGE_SIZE * 4,
> +					     timeline_syncobj_handle2, ++point2);
> +	igt_assert_eq(r, 0);
> +
> +	r = timeline_syncobj_wait(device, timeline_syncobj_handle2);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_cpu_unmap(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	r = amdgpu_bo_free(doorbell.handle);
> +	igt_assert_eq(r, 0);
> +
> +	amdgpu_bo_unmap_and_free(rptr.handle, rptr.va_handle, rptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(wptr.handle, wptr.va_handle, wptr.mc_addr, 8);
> +
> +	amdgpu_bo_unmap_and_free(queue.handle, queue.va_handle,
> +				 queue.mc_addr, USERMODE_QUEUE_SIZE);
> +
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle);
> +	drmSyncobjDestroy(fd, timeline_syncobj_handle2);
> +}
> +
> +igt_main
> +{
> +	amdgpu_device_handle device;
> +	struct amdgpu_gpu_info gpu_info = {0};
> +	struct drm_amdgpu_info_hw_ip info = {0};
> +	int fd = -1;
> +	int r;
> +	bool arr_cap[AMD_IP_MAX] = {0};
> +
> +	igt_fixture {
> +		uint32_t major, minor;
> +		int err;
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +		r = amdgpu_query_gpu_info(device, &gpu_info);
> +		igt_assert_eq(r, 0);
> +		r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> +		igt_assert_eq(r, 0);
> +		r = setup_amdgpu_ip_blocks(major, minor,  &gpu_info, device);
> +		igt_assert_eq(r, 0);
> +		asic_rings_readness(device, 1, arr_cap);
> +	}
> +
> +	igt_describe("Check-GFX-UMQ-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("umq-gfx-with-IP-GFX") {
> +		if (arr_cap[AMD_IP_GFX]) {
> +			igt_dynamic_f("umq-gfx")
> +			    amdgpu_command_submission_umq_gfx(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-COMPUTE-UMQ-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("umq-gfx-with-IP-COMPUTE") {
> +		if (arr_cap[AMD_IP_COMPUTE]) {
> +			igt_dynamic_f("umq-compute")
> +			    amdgpu_command_submission_umq_compute(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-SDMA-UMQ-for-every-available-ring-works-for-write-const-fill-and-copy-operation-using-more-than-one-IB-and-shared-IB");
> +	igt_subtest_with_dynamic("umq-gfx-with-IP-SDMA") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("umq-sdma")
> +			    amdgpu_command_submission_umq_sdma(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-amdgpu_command_submission_umq_timeline_test");
> +	igt_subtest_with_dynamic("umq-Syncobj-timeline") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("umq_timeline")
> +			    amdgpu_command_submission_umq_timeline_test(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_describe("Check-amdgpu_command_submission_umq_synchronize_test");
> +	igt_subtest_with_dynamic("umq-Synchronize") {
> +		if (arr_cap[AMD_IP_DMA]) {
> +			igt_dynamic_f("umq_synchronize")
> +			    amdgpu_command_submission_umq_synchronize_test(device,
> +							      info.
> +							      hw_ip_version_major
> +							      < 11);
> +		}
> +	}
> +
> +	igt_fixture {
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index 7d40f788b..a15a3884c 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -63,7 +63,13 @@ if libdrm_amdgpu.found()
>  	else
>  		warning('libdrm <= 2.4.104 found, amd_queue_reset test not applicable')
>  	endif
> -	amdgpu_deps += libdrm_amdgpu
> +	 # Check for amdgpu_create_userqueue function
> +        if cc.has_function('amdgpu_create_userqueue', dependencies: libdrm_amdgpu)
> +                amdgpu_progs += [ 'amd_userq_basic' ]
> +        else
> +                warning('amdgpu_create_userqueue not found in libdrm_amdgpu, skipping amd userq test')
> +        endif
> +        amdgpu_deps += libdrm_amdgpu
>  endif
>  
>  foreach prog : amdgpu_progs
