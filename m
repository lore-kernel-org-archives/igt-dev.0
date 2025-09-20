Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A9DCAC5A0
	for <igt-dev@archiver.kernel.org>; Sat, 20 Sep 2025 04:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F90A10E286;
	Sat, 20 Sep 2025 04:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vpXyJcqL";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECD310E286
 for <igt-dev@lists.freedesktop.org>; Sat, 20 Sep 2025 04:55:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IkjU5jDTOcnCIqK1jcO8kuZ12VUiIf/HVwLpQf+KPjt3A8s4w090xeHhIVMUdB93eSyHk8pD1P63wJnf9eSBKVCSbDupw/G4MjpRQ6p2M8bxC8vgVtx62oz2UdgMhFf8CvBrmYt/an2g8ZpQBbnfnq2bdaWmJYIbgK6e29LxOmReQGYmlOdkJV8GMfAjVGg2wraBB3Rs3NQuREzZgy/ffm8RXhqn810YUl8HOdD4z+iIMgUwwX4l3L8NZmm/k3dBb4Hpg+lTOrO/OcoKil8CquUPJR1fRJtyT5URxtJoHLDmUFl4wtMs3lgmHh9oRT3r92JelQBY5pAfeGPlXYPDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/FCFK3jCkDVcP+Ubqxvld+YdYC/HED+T7eqBOiO59fc=;
 b=sOf4rWq3YKbC9Ekv2Zr68bCYQhY6m7A62qFz0zFuyxPiXfuuU1s570xUN9rfTElSy9EXbHGpuliATLolYMlEbKFsOXbR529cKMB86ZWI30mVI9hBfzd85O5hx010UZ2sinKFk9irb+q2zKQD4od9XT917HZGH0AGGjPT+RfKF44XxD+mkmIcDE9gaVDiQcNvON+44sVtiGmgXY03F20XUa0FiiqB24ESepdpxth9JBr/ALAQuGXLqEFUIgq0Pldzez8GGqi3kQ3MUyotnjCMfIsY/7aiwtmfKZDLuP9OiWwvHGQUSwB5bf/482jY51tuzCNx+bEl4Ih3SIONDAcabg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/FCFK3jCkDVcP+Ubqxvld+YdYC/HED+T7eqBOiO59fc=;
 b=vpXyJcqLr2BhmBWh0yin+IX/dhRM6g1iUzGT7XpGIu5uMao2sXs3PZQ+fb+ipIAMLhNSUA6L8rec/YRakm5oIV4oLIg08fpn1qCboQIHBbQlBfSSNJgEOC0Dept7FeF08OjgGL/af3SrLwKDfW8wisDdrjGImYuxRFIMdUjSBx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Sat, 20 Sep
 2025 04:55:34 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.9137.012; Sat, 20 Sep 2025
 04:55:33 +0000
Content-Type: multipart/alternative;
 boundary="------------CYLWO03WXuI70ib00rdkElke"
Message-ID: <55ffa49e-e69e-4e51-a4e4-d586a19d5549@amd.com>
Date: Sat, 20 Sep 2025 00:55:31 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] tests/amdgpu: Exercise MMIO_REMAP remap page
 (alloc/map + HDP flush)
To: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: igt-dev@lists.freedesktop.org, David Yat Sin <David.YatSin@amd.com>
References: <20250918084655.2192395-1-srinivasan.shanmugam@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250918084655.2192395-1-srinivasan.shanmugam@amd.com>
X-ClientProxiedBy: CH0PR13CA0030.namprd13.prod.outlook.com
 (2603:10b6:610:b1::35) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: 75a3ce99-4316-44e5-06a1-08ddf801ee6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TlplVEFVbUVheXpjVnB1V1Z1SkgrQXR5ejNJTUE5RGJTZzJjbTlQTkhUbGRu?=
 =?utf-8?B?NHVzN1lGek9JTXNzRmowT25IMURhcExucjErTWtLMDZiL2NiMVZJREtlUmVv?=
 =?utf-8?B?VWVFMDNzemJKVDdzdXBleFc0b3R4b0J4SkVPRzV3MGRVWWNicWI3SThTR2dv?=
 =?utf-8?B?MDdadzZLd1hGMkhDOTlkTTd3dllJa2ZaenA1ZVJkdkQya3BxbnVZa1U0eU92?=
 =?utf-8?B?RHVPU0JtS3hUM3Bzek5BTHdiN0V4Uk5SdTFna1VaMm10ZlZSdUFBR21INThw?=
 =?utf-8?B?VUZ4b0pjcE9PS2R5MUJWTVlzTUtxNHRUNFQyY1JwUSsyMUI5UTF0WVpBTGRp?=
 =?utf-8?B?Z2lOaEI0d1hHQStxWTZDeWxGTTMrRm53ZFVJQ2pxQU81dHlGbStOZ3R6MWto?=
 =?utf-8?B?aEJrRVJ6dml4RE1UWThlTVF3S09mOVhsNU5kNG54a3pGazRwWUtvdHNNNElt?=
 =?utf-8?B?czJPa0xDMG1lUVJZL205OXJ0UmN0QTFPdTlmTEk0R2thdzJxUFdKUUxMeTc4?=
 =?utf-8?B?TTl0WU9oQkFoenBjRi92WGgvN2RxYW04VFArelB3aWg0V0R5b0U4WW9KYkR4?=
 =?utf-8?B?T2haUzNTai9Ra1ovV2FySm5GcDNJWUNnWU82TmZTS2VZc1gyNkl5MEM5T2dv?=
 =?utf-8?B?UG1sZGQzU1NGN0VHWllaYWJUcm1yRzQwVXEvTlUybVhqOFd0bGE3UE13MWlK?=
 =?utf-8?B?aWk0RVFReTAwamJsQ091UmFJTXd5eEpBWFF4MGJwVi9rVGd1UGFWdE5leUg5?=
 =?utf-8?B?Z0lncnZ3MHdmWWlBWWdZcHFqaXhMRWlXbjM0bEpsb1hDN0cyZ2Z0RHNxSnlW?=
 =?utf-8?B?ajJmdUs4OHVnd1JBZlY2M2VKWXJkcFYybnM0WnF6MEkxVG0ySnM1WTY4YTBi?=
 =?utf-8?B?ZWhvN0Jnb3lSSDNoSEtsa29BQmhRU2pjQzZlWCs2T3VvaEhNSDR5NklXVGZQ?=
 =?utf-8?B?TndOL0MweDZPY2MxTnRac05LWUpPaHlRM24wWjI3UjZwand6YVFNWmFYdDBy?=
 =?utf-8?B?ejdBWGN6dTZNK2d5bEVUeWJVRHAxYnYyQWhnYVJjR0lZQ3k5MFdHMkk3VlZB?=
 =?utf-8?B?MXRQNkZ6TzRxY0J0TGc5dVF6amJNRXFpTFlueXJnWmhuODVLSHF5ZnVHR21D?=
 =?utf-8?B?a1Zoc2FQbkVNWjh2dUQxb1F3a2JGVGttVklmMS9yVWpLWlptR1JzbnZuQUFY?=
 =?utf-8?B?dVhxWXBnSm9iQ0N5Vk50Y3BhSmVrY0dTbUVNWjZpbnl4SDB0cXlYdlM1ajht?=
 =?utf-8?B?OXB0ajR0RVJYOTZqc1lMOURjYThLa0ZtMjREdUlqYVpBZW5vS1VTTjA5R1k1?=
 =?utf-8?B?SWVTeDRmMVlUZ0lZNnNPWmR3YVo1OXJZSXlsbnNIY1Z6SUpwS0JLNDFwQzRF?=
 =?utf-8?B?VU1uRllrUENFU3BrYzMvWGZVWk0zOVRJTUZHdEVXTFRrWkMwUlJ0VG5OajM4?=
 =?utf-8?B?M0VxQUFKMVZpc0JPclpsRXFHZVBmUXAvckd6UHg4UStWMTc4eVEwejh3SzBB?=
 =?utf-8?B?ZkQvRGI0bG82QTl4Y3lzYitOTmk5ZUc4VEpiUnp2YU9iRm9uL2M4Zmh0SllE?=
 =?utf-8?B?Q2M2aGlJM3dwakhCYjRmUjM1My8yeDRNb2xURHlLeVhCT3pUeUZNSDR2b0x0?=
 =?utf-8?B?WDJRMUN5Z3B1WkFpTkNGSWlpaDh1TlVtcHEvUXEvdFoyclBRR0djeis3MWJ2?=
 =?utf-8?B?eWRuMUJFUTNxYlA0My9FUEpKeG9tZnNoemQrSmNzeEo0bDFrZmZXQTI5NkVV?=
 =?utf-8?B?ZmZZMFc0MkQ0aE1YL1JKMzU0N1A1ZGQrSVUxSmRSZGxGcjFvVkU5WXJYUVc0?=
 =?utf-8?B?VnVLM1B5WGtxN0c1cWZRTG5hWk9YcWlFVUR1ckNHak9US0t6OHFpUDBYYXhL?=
 =?utf-8?Q?0rte9UIP+xVDa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZCs5bzBYVVpBd052VHdScjdwcUphbkFzZVB3L2FqcDBxdTF6aGg4dnlJUUtU?=
 =?utf-8?B?eTBCQzE3ekFPY1lIZ2JLYUtwU1RoWnV2NnFZUjhVQXdNaFFiMlA2b0x3ZFNE?=
 =?utf-8?B?M2djcVZMT2xmb0hOWnRFZllwZ1JWdGFaeXFUMmhuZnYrUEE2azlMbUJFT0Zh?=
 =?utf-8?B?QlNwaE9CMFN6U2JnZ3pwckRwekV3VXVYNGdjUE5GeVZmdnl5aytpMUttZEt6?=
 =?utf-8?B?SlF6ckdaM1lhbHVXVVhvVnY5R0VVVkhkakRrMFBxMWRNbXgyZkFudmN5dGtN?=
 =?utf-8?B?dnBrRU9XQktjN01abXZ2QSswdnVQNHpMR1BBU3dFUUdmWnVYK2NaSVlrTU5D?=
 =?utf-8?B?S2Y4blZrdkpaYXdJMVo4OEk1R2ZLdU44ZnMwd3VpN2dkbEg4Ni9CRytVdlJ6?=
 =?utf-8?B?c3I3ZDJ3eHlvbFA5MDQvZU9WOFlzaUdLMzF3TGRKdWpmMngrT3Nnc2VmUGtW?=
 =?utf-8?B?NjQvNUFzWmVCMjgyRUdVZFJBc2F0ejEyNGJSMElsc24wM3kvK0c1WURXVCs5?=
 =?utf-8?B?TWtWQ3ZTOTBLVURnYXhsTENxVWZsWmo0YWkxRS8xTUlndVZxOERxeXhvUmFo?=
 =?utf-8?B?cmg1cWxHdWxodSswWXk4bmdBb2U0SHpxVlZyTTVyTXVzY1lqRVRHNTdyNnlP?=
 =?utf-8?B?K1BvYm5XOTgvUEo0RTFHY0dvelRYS3VobFRVNHR3US9ybVNNZlV1d24vS211?=
 =?utf-8?B?NFdlSmRYd21CTlBHbTQvYWJzaEJKejQ1cEJMdlZwaElld3ZJYmpqeFRCK2lF?=
 =?utf-8?B?RGpNU001ZGIwVWljZ0FqRWJrbDhoWDcwVGpQTldONnVWLzR6SlFCRE9rK3Z2?=
 =?utf-8?B?dmlSTHA0Nm9zb1pmdVJrMEEydk5tcnprOElKRU91VDlhbUsrUXkrbDk5WEkv?=
 =?utf-8?B?aXd6dkN1QzFvMUoyeEVDT3k0cCt0TDU3a3R3dU9PR0tSWTdkb0NjT3lqaS9w?=
 =?utf-8?B?TXlQSkhOSnE4S1lQbFdnY0RUbjdSdG5aSWJXN0V6UDRDU0hZSUdFMVBuMnVy?=
 =?utf-8?B?bkVIVzhQQjZ5V3NRWUJGRENMcjlKU0g4OWZJcFpsYThOd3FYb01GNGh3NXg2?=
 =?utf-8?B?VGx5U0EzUEpSNjFSOVA0Q3RlWVo3c0VTU3RQZ2RURi9jaWMySlkxK3FtUXBM?=
 =?utf-8?B?dGpYZmMxSyt3cnN2QjJyUGM4bElLTkIxTnowU0xNRytaTlcrbGZkNUN5cUVw?=
 =?utf-8?B?SU1HUGR2Y0VtM1dPbjhrTDgyRTRVTW90d3hacW9hci84RVcyMzlkUnZKYUlk?=
 =?utf-8?B?NmptT0psNlNHZnVKVmlWUnI5aG82MlZXdzMwMXNoM1RaUjRSWFVvb1pNL2Z4?=
 =?utf-8?B?cWM3YkZNaGhLMEdGNVF6OGlPeDkvaVhWSjQvazhHc2NkS2JGNG5qdzE2eHVQ?=
 =?utf-8?B?d0IwZFpKMjQ3N0RGRjZrcUpjMlVaak1HNGt0eEdiK0NvaFRVOGo2VUloSDJh?=
 =?utf-8?B?cXMzWVI5M1dPUUNabW8vUURSMHJZU0QvZ2gxZUhIMTdYR3JoRjY0SWVOQnlQ?=
 =?utf-8?B?dTUrSit0R2EramY1NklvaTNUWkdabEFWcDUvUzVxUC9HWlRUQXRwR2ZFZWl3?=
 =?utf-8?B?c3dPL05kOTFmcGdsNUw3MXUyMDhmbk92NWJZT3BhWnhjTTZCRUYwY2FIVldX?=
 =?utf-8?B?T0tTYllsbEN6UkVoRFpqWi9NMklQTzlneXd2RzVKNE05dXpjQnpBbHE0aXYz?=
 =?utf-8?B?SW9xaWxRK25iN3Y3OUtBMlgzTXBMOHI4UGcwcTY0c2FsQnZidmpZSXdvR1ZF?=
 =?utf-8?B?TmdnNUVyOXduRUxjaVp3WENaTmExYVF1VVBIZEk2OHU0ek9jTm5TU01nQlJB?=
 =?utf-8?B?WTNsOHJhdHF0WXNpdFVDQktQckhYQnhIVnZZL2E5K0w3b3RBQXZUM1QwdDU2?=
 =?utf-8?B?by9GVnNHMG1ydkxVd3V0REtobjNMNkVpQm42Z2JjUk80S1ByOHM0WmRBaXdN?=
 =?utf-8?B?d0lpTll2eFY2V1Z4R3pyYkhSTWpRcXB5NnVTcTNET2tQbHJ4emsza05IZWhZ?=
 =?utf-8?B?aTBwcis1aGd6d2E5aVNqd1pGZ0xKNzF1RVV2eGVRRGJJRGdzVDkxTkN1L2xF?=
 =?utf-8?B?djIwc3BwUDduYUU4MHpKMWRleWQxeW1RMDlsY0s3UlZlbjE4NE5XbVJaWm5I?=
 =?utf-8?Q?j7hmVslWk1b+xnNYvDZN7v3pf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a3ce99-4316-44e5-06a1-08ddf801ee6f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2025 04:55:33.7993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yc5mc1sMBbav37PBVuXrFv63MjdhwucTBexMy/y9YHSa2d6ceOHfA7EvK2z5BKHY/ndRlfye80E/a3qW20RgXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688
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

--------------CYLWO03WXuI70ib00rdkElke
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both patches look good overall and provide valuable MMIO_REMAP subtests. 2 improvements are suggested:

1. Remove Excess Debug Logs for both patches except when igt_skip is called.
   Please reduce the verbosity by removing non-essential igt_info() calls, such as:
    igt_info("[mmio_remap] alloc request: size=%u align=%u domain=0x%x flags=0x%llx\n", ...)   etc..
 
 2. Ensure MMIO Write Posting (Patch 2/2)
   In the HDP flush subtest, please insert a memory barrier to ensure the MMIO write is posted before the read:
   mmio[flush_idx] = 0x1;
*  __sync_synchronize();  *
 (void)mmio[flush_idx];
This ensures correctness on platforms with weak memory ordering (e.g., ARM, RISC-V), where MMIO writes can be delayed or reordered.

Reviewed-by: Vitaly Prosyak vitaly.prosyak@amd.com


On 2025-09-18 04:46, Srinivasan Shanmugam wrote:
> This series adds two IGT subtests in amd_bo.c to exercise the MMIO_REMAP
> remap page:
>
>   1) mmio_remap_gem_create_close
>      - Allocates a 4 KiB, page-aligned BO in
>        AMDGPU_GEM_DOMAIN_MMIO_REMAP and immediately frees it. Skips
>        gracefully when the domain is not supported
>        (-EOPNOTSUPP/-ENODEV/-EINVAL) or system PAGE_SIZE > 4K.
>
>   2) mmio_remap_map_and_poke
>      - Allocates and CPU-maps the 4 KiB remap page, then write-1 to
>        HDP_MEM_FLUSH_CNTL (offset 0) twice, followed by a dummy read to
>        post the writes. Unmaps and frees on exit.
> 	   
> These tests help cover the basic KGD/KFD MMIO_REMAP path (allocation and
> BAR-mapped MMIO access).
>
> TODO: A kernel patch enabling this path is pending merge; once it lands,
> the Link below can serve as the stable reference.
>
> Link: https://patchwork.freedesktop.org/series/153209/#rev5
> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
> Cc: David Yat Sin <David.YatSin@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
>
> Srinivasan Shanmugam (2):
>   tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close subtest
>   tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP flush) subtest
>
>  tests/amdgpu/amd_bo.c | 144 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>
--------------CYLWO03WXuI70ib00rdkElke
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Both patches look good overall and provide valuable MMIO_REMAP
      subtests. 2 improvements are suggested:<br>
      <br>
      1. Remove Excess Debug Logs for both patches except when igt_skip
      is called.<br>
      &nbsp;&nbsp; Please reduce the verbosity by removing non-essential
      igt_info() calls, such as:<br>
      &nbsp;&nbsp;&nbsp; igt_info(&quot;[mmio_remap] alloc request: size=%u align=%u
      domain=0x%x flags=0x%llx\n&quot;, ...) &nbsp; etc..<br>
      &nbsp;<br>
      &nbsp;2. Ensure MMIO Write Posting (Patch 2/2)<br>
      &nbsp;&nbsp; In the HDP flush subtest, please insert a memory barrier to
      ensure the MMIO write is posted before the read:<br>
      &nbsp;&nbsp; mmio[flush_idx] = 0x1;<br>
      <b>&nbsp; __sync_synchronize();&nbsp; </b><br>
      &nbsp;(void)mmio[flush_idx]; <br>
      This ensures correctness on platforms with weak memory ordering
      (e.g., ARM, RISC-V), where MMIO writes can be delayed or
      reordered.<br>
      <br>
      Reviewed-by: Vitaly Prosyak <a class="moz-txt-link-abbreviated" href="mailto:vitaly.prosyak@amd.com">vitaly.prosyak@amd.com</a><br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2025-09-18 04:46, Srinivasan
      Shanmugam wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250918084655.2192395-1-srinivasan.shanmugam@amd.com">
      <pre wrap="" class="moz-quote-pre">This series adds two IGT subtests in amd_bo.c to exercise the MMIO_REMAP
remap page:

  1) mmio_remap_gem_create_close
     - Allocates a 4 KiB, page-aligned BO in
       AMDGPU_GEM_DOMAIN_MMIO_REMAP and immediately frees it. Skips
       gracefully when the domain is not supported
       (-EOPNOTSUPP/-ENODEV/-EINVAL) or system PAGE_SIZE &gt; 4K.

  2) mmio_remap_map_and_poke
     - Allocates and CPU-maps the 4 KiB remap page, then write-1 to
       HDP_MEM_FLUSH_CNTL (offset 0) twice, followed by a dummy read to
       post the writes. Unmaps and frees on exit.
	   
These tests help cover the basic KGD/KFD MMIO_REMAP path (allocation and
BAR-mapped MMIO access).

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/153209/#rev5">https://patchwork.freedesktop.org/series/153209/#rev5</a>
Cc: Vitaly Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a>
Cc: David Yat Sin <a class="moz-txt-link-rfc2396E" href="mailto:David.YatSin@amd.com">&lt;David.YatSin@amd.com&gt;</a>
Cc: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Cc: Alex Deucher <a class="moz-txt-link-rfc2396E" href="mailto:alexander.deucher@amd.com">&lt;alexander.deucher@amd.com&gt;</a>
Signed-off-by: Srinivasan Shanmugam <a class="moz-txt-link-rfc2396E" href="mailto:srinivasan.shanmugam@amd.com">&lt;srinivasan.shanmugam@amd.com&gt;</a>

Srinivasan Shanmugam (2):
  tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close subtest
  tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP flush) subtest

 tests/amdgpu/amd_bo.c | 144 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

</pre>
    </blockquote>
  </body>
</html>

--------------CYLWO03WXuI70ib00rdkElke--
