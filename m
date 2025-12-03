Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF1ED12689
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 00:45:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C7910E695;
	Wed,  3 Dec 2025 00:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yY60WveL";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC9E10E695
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 00:45:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7aRpVfvziVFzNbrp1rByDFnGmXoIUHKr6plJq2aIXCN4p210+fh6AzngccImB5ksOKoJzZDhX/NS0XxgO/LWedBljtubRvXvIoDxSpMBB0Sk/6t8iuPjOwJSNXQscGIU9/92fhfYyIEjBHw9xvKNY8wsMoPMz35lAMdgcWUCg+Y1oMy88DQFb5f40w9j8qFUlq+wVvKVC6VqHSPU5lV/W2D2FEOByBySaAQbzxbYrxQbq0fp48WGtJQmdiTFvHP76RhKzt+PFvE2T+wc1bXayM9O26QU2xza70HmEoKD9n1sps+J+I6KudjztJWHz2fRtBcz9MBEgf73fR52488BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0rjde11MrGe9bzxrgkq6JdKZsww6GB9OmcG0+hB1/o=;
 b=mG6ZlRPDryEO5QpFOpy+JI6BP/v+ltPFqCJjDBsgg46Xtar2HYI+oaon7ZOZ71TTLYZBQjDuiwiBJYiG8s52NRGRZuSYd0waR39pcv0pqgsIjAt61T4X2sj+E5TfVdh2hOjq8AuWLRM1UCFXI09ZGGSIP4lkJovv/5ETQocajF8yvSAta4rAnGLGyD0recR/tlghTL36hNshMoWFIu4X/lvCe3fKrwi+RFqfoFOpwv9TucLdj61cjFUR72sKwhS9y7JWy+lmYulrWzK0NCBcKWKcykhhunKpQWqOZGFs6t9ls1CDxO80rXCbwVPxOnz1yqpsdqUAVE1hKapvIO0ZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0rjde11MrGe9bzxrgkq6JdKZsww6GB9OmcG0+hB1/o=;
 b=yY60WveLD40dRDJ4k25soBQYekj/scEqazzoPv6JxKUN3sd6puJtUUMCa9H0eUpos5yqn//rVHWhgltotg3sBOdZF3pToH3N0AXceVwFDmaSVNIbjcU5jnxDCP+BtPfUbwZw9/1Dm92TTANnbiDbW2nddOwIdNluniS70Awx9MM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by PH7PR12MB6812.namprd12.prod.outlook.com (2603:10b6:510:1b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 00:45:13 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%5]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 00:45:13 +0000
Content-Type: multipart/alternative;
 boundary="------------JmoPtk9DUu1CSQk0pvE0xNTz"
Message-ID: <442ffff4-aeb5-4d52-b0ad-311364a44e75@amd.com>
Date: Tue, 2 Dec 2025 19:45:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/6] lib/amdgpu: Add flexible command context API
 with external BO support
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20251202020602.3823838-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20251202020602.3823838-1-Jesse.Zhang@amd.com>
X-ClientProxiedBy: YQZPR01CA0126.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::6) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|PH7PR12MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e8075a-999a-453e-ffa0-08de3205382c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXJkQVlDZFBBdGNZOFNyV2VPWFRwcW1KSElTWjl1Rk5mc0J3VzlMbTRsYkJn?=
 =?utf-8?B?MXNleTNaaStCLy8rRnlUUDlnL3NObEk2M2VjemtKS0V5ZDBIN1hVUUNjK1Q3?=
 =?utf-8?B?eG1mNVd5ZElBWFNUTjJuWWZkV1JmbUdJc2Vjd2crM2pUV2VjSjRnMHo2bERK?=
 =?utf-8?B?UzFXWTNEOGY0OEs0SW5Qb2FZWEdKYTdjY1Q2YUlpZ0FKUyttTDA3aVk1L0xz?=
 =?utf-8?B?am56a2dFOE5Kekk2a1hGQlhTOERCbDhkT2Z1d3J3V3RnYzZycDJ0VHlFN0Rq?=
 =?utf-8?B?SmlMdndCMmpwWCtGVW1tcURWaHZrbUk5Q3JjOHJLNDA5dVVocnArUHJ6Y0dk?=
 =?utf-8?B?dit6aE12SC8yY0VJOTZJL3AyR083eEhYdFRFR0JFMWI3M0NWbllMNmZrR29F?=
 =?utf-8?B?eFRPckFZR0FVa281dHVEc0x6QXBlaEkyMnd0bGoreTJMc2pLa24rcUI3Y1Yr?=
 =?utf-8?B?ZFVCRUJaVVd4VmNrd1UrREZuOWlEMThBSlptSndHODJHRGdtVVpYanJ5S2Jz?=
 =?utf-8?B?VFZlSUdMV2JRNGlOMzYwTkJmLzgrbDRtZEtZS2g1OS9yeUxxaGYydURDcnF3?=
 =?utf-8?B?TEpOY1dUT3BLZVhpNDdOeWVwY2FCcnJ1bnMwZWI4NlA5aGpYdjhyZUVmMjBL?=
 =?utf-8?B?MWk5dDZBaW9CQ3o5MGhGaFl0dHJnb0NXV3BTRis2OWhBYW1KOXJPSFJCa3dh?=
 =?utf-8?B?c0FtdXQ3clV4dU9JMEJIWmZCcWppRUlnSS90TkEyZStUNy9Cbnd4eUFtbC81?=
 =?utf-8?B?OXg2eThjcUJWS1p3ZEJIWHpnTkN5TEp1dEVCYi9sTnJoZ1VtRVBJQStQVVJK?=
 =?utf-8?B?MmEreVFOVmJvQ2Z0YjByM3JSd080VVh2U2ZUQVJFbFlQaSs2R0dxaXoyb0Jp?=
 =?utf-8?B?dWlLcU85TVJIMmZhb0JrY3pqeDBndXZJdExPbmVESzdwaWNoQ0ZxU2ZQemJN?=
 =?utf-8?B?K3RYWWZsc2VTWWFIRWZhUGN5RjhsRktoeUZteUVSbTBlcXExRG1aTnZ4M3Fj?=
 =?utf-8?B?TmIvNjZLcGFPdlB4cDBHcS9NNHpqeHpKZG1hSDVTOThLUGJmRm12SlJYb2gz?=
 =?utf-8?B?OXQ5dWJEY3NWNjl2bU42Ymh6MnRJeG1jV0JxNmRmWWJUZXVWNi9iUmVhWU9L?=
 =?utf-8?B?b1gyTGMxOG9qcmJtYmJSTUxrQzJ5UWJ4ZkFtcGhudUpnYk4waU5Neml1Wk5V?=
 =?utf-8?B?V09MMGxQODlvZ2xDMzIrYjBzSy9CNlQ3UCt2VDR1a1hEU0hPa2ZlZTJiREhF?=
 =?utf-8?B?OWFpbVk2d2RraUdMRkdxUytpditqbHdXb1lGUUNHd0s4Z3czRUJqRXc0aGRw?=
 =?utf-8?B?UTdET2k1Slo3UGFsOFFTcGErZjNzakpQUlc4SUhQL2lLL083WlZSNm1GeTRK?=
 =?utf-8?B?ejRZOVRzUVBZK3kvblo3RWZLeW5YZHBVam9xWmZ6c0N5bmN4Y0VOeVNzRXhh?=
 =?utf-8?B?ejZYLzlzQWNZUWVtOCswYWxaWkFYM0FwaXZtTnNzR0F1V0EyWnJGcUU5d2Yy?=
 =?utf-8?B?eEJxTjdJU01IVFBiSWNhVUI0OTMwQUUzUVc4c3VHTVo4Q1ZHZHBKNXRtWXMz?=
 =?utf-8?B?S01VOHBPQTNUSUZLaDMxdEFKaUJHRENTMjE3VXpHeS8vazNBSW1scEFsb3dx?=
 =?utf-8?B?dnN0N1ZGODRxMDNCbHdvell3ZUI2MmkyZHZCUTJkMnhVeEVhNTM5K1oxU3NE?=
 =?utf-8?B?Rlpkd0RjbU43RG5INjQ5Uk9NbEdIa0NIZURwd01VZWlOejg3Y1hRNHZMTENW?=
 =?utf-8?B?MW9uOWNnMkIwdUdBLzEweFo2b2Y4QjdJcTQxaDF0dHFYSDQreE1VU1hScTI2?=
 =?utf-8?B?UE8xaW9jQVlCQWZsa1d2aTFyTTlER25IalJmRWJVbW5uQVk1dzdXUlhDTHNk?=
 =?utf-8?B?Q1B2VmllNFZEVkpiUlV5TW5aOVZxL1hwbjNtREhQT2ZCQ01hTzNxOVo3VGQx?=
 =?utf-8?Q?Atl/RS7RjH7OV5bhm/+kLm6+2gjyEKlR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmM3TDdrREsxcEo1K3REazBMOFZoSjJZMFVFUXlaaE5sdjNyMEVBT01Xb2ky?=
 =?utf-8?B?bHNOSlBhRTVOeWh2OVdBTUE3cVNKdUo4R3hRbUxXazZmZ2tuVXlNZXF5dUdv?=
 =?utf-8?B?NUVid2d3bDMwQ2Mzc2pVMDV5bytCNHQybTl2ZmcyejQ1b3l1aFVGM3BhaDU3?=
 =?utf-8?B?eTNWL01pWVE0QTUzTG5Jay90RWZmbWlzeE1RQUVRQy81dzFheFBLb0N0cXBw?=
 =?utf-8?B?VTZTT1dQanNlL2twNE9oTTlhaUEwTmhhcVUrZ3lHNG1DcWR1M3JXS0dWLzAr?=
 =?utf-8?B?R2h6YTNCVm9Gc0pkOC9MYWNlS09Sc3JEMUV6bDM5cVUzVExJWUJNdkNUZW9u?=
 =?utf-8?B?Yk1RZ0VlSEhRUmxGOU9aZzJkKzJvbTFvbGl2dzc5N0g3S0JCSmR1Q01UUDNQ?=
 =?utf-8?B?TTUyTkxYMGZmV1M2bUV2QXVIZXZDQ2o1dGdqTFh1OWZFZVJOVk5SaTN6U1Er?=
 =?utf-8?B?VHFBbnQ5dER4azUzblRXdFlkRHpZbVRIcStTclFPcS8vVmRSVWVmWGtQREY3?=
 =?utf-8?B?VXZkNlZtcFU3ZTcyTi85ODRla3BuZnNnb1VtMjRqMjZLdEs3eC9MeUc0dkJH?=
 =?utf-8?B?alVCNUVLNTV1bVFRcGlidDBUWkdXMXM3SWVFdFgyMGU2QmlDRm1WaFFzY2Fo?=
 =?utf-8?B?cjNVUC9ORHh6cmtXYUFXME5ha0FlcHE5bU9WdjJxUjlZelhIRUV1R2hMM0Y4?=
 =?utf-8?B?RVRhbzRtWUNlRDJxcEMvU3U3Mjd3WFd3Y3lMWnFsK0ZLV21kOXBvVHdUVllB?=
 =?utf-8?B?OFZsZENWaFRuQjNjRmlxZjZaWmZGbkJxRGNkVDI0aEdHM3dyK05DNEpaenpk?=
 =?utf-8?B?a0N2T1ZRc2RDYXltaktER0VUQzJUSU5EUnFoaEdFTy9SQTB1MzhISTBqOXFr?=
 =?utf-8?B?U2xYNHY3cEJvb1JmR0pweTVVVnpCT2pXZXNuMFMyYnRLT3luUDBscEpCTmo1?=
 =?utf-8?B?dnMvZXNtVW5ZNnVWUVV0b20rMDM0eW5jYUVQTWxHYzRUNFF6dnRxbzlaTkZI?=
 =?utf-8?B?R2oyWjRWK0lCa0NiSzE3c3NZVGY4NzNYS1VUdkYrb1krMFFacG9EVmFFNVJ2?=
 =?utf-8?B?R3FnZHdyZHhlanRPMGNyUlJjMXpId0EvUmE3Qy9Ob2lUbm04MHl6dlhVTk81?=
 =?utf-8?B?WklGQXJsRGRPRlFYWVRtMVVKMmFaSzB2dC9OSGxpcWVHTHZIaWxkb0ZRTGFk?=
 =?utf-8?B?b1RucEZHb3NzRTF4VzI4amdPNHFWdTVxY25nOHdDREJzL3kwSnFibVkzTVpx?=
 =?utf-8?B?a2JLZjk3aU4xUzNjaFVBSXVxM0FaRXRyOEI3aC9iYnIrdXY3WWdLL3JUQjFw?=
 =?utf-8?B?RkRCd0R1YVFxM0xkNkZtdlM1NGRQeUVXUit0S255Z3oxK2J2RzZVeEZlWTVS?=
 =?utf-8?B?dGhJVkdaaXNqVTVOTXFjQXpwSURUU2JQT1JuNXJRekppSUhjYVk5c1BwQVh3?=
 =?utf-8?B?QUFWUmM5dHRkdmQ0dTVpK004M01uZVB3Q1pEaU5GOFErRDdvYTVIdHZmNmwr?=
 =?utf-8?B?WEY0R01wbC8xYjJsZlJZRFQ4dFRBSjRFQXVEZFVlcjRsc0lVUmdmc0tIM0gy?=
 =?utf-8?B?RksyTFcyUkRTQU5RTCtYY0lvNGtkZGR3bGtkb3N3TnFNZVhNclRmam0xWVpQ?=
 =?utf-8?B?dXF3cnJVZnovS2RtZ0NaMlh6ZVNPbkVmUm1ZUzhjL2QySkJlVmIxZUNiZTNo?=
 =?utf-8?B?MlFhVC8zcTU3cmJzek00aHN6N2pKWFpPYUFUL25aMkhteXFubnZTallSVC9x?=
 =?utf-8?B?a0V5N2czQXJGQ0M2VEpTQVlOeDFkQzd4RjFMaks4NGczODB2MFk3WC9kdmpX?=
 =?utf-8?B?ckpCK0FYUlNWSUF5Q3FlMzA0b0JzRWUxamtQd2xhZ2RNMjhYdUhJakZKVGdT?=
 =?utf-8?B?YUZSb0srZVFaMnVWSkY2Y0svQ1QyUnZXNVF1VHZ1Y29WdjIvVjFSMExBRnNF?=
 =?utf-8?B?WU4zTXArTmVNbW1QSUNFOHMrRjdzK1hQa1VUT1d1NDhqN0ZjbTY2anhDaHk0?=
 =?utf-8?B?VTd5RUsrQXpxWDZDWTNpQ2YyTXEwZmFyYTdMaFdVS0JMZjgwOHpCUEVpcUw5?=
 =?utf-8?B?M1JrODdXRVdGNVdNRkNNZUpEM09oR05GZTBoUEp3a0UybGZtRHlsYTdaYUJL?=
 =?utf-8?Q?KlneD6XiEKrIYJr1cNhyq3MaF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e8075a-999a-453e-ffa0-08de3205382c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 00:45:13.4577 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjef9/9zNYctoLbn6OeqrwlZKdycuZNndGz+8ntHwT3v8kltld2RYfh9qL3J/c/0Ck3bLZtf5IgiaIWpWWBlbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6812
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

--------------JmoPtk9DUu1CSQk0pvE0xNTz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


The series of 6 patches looks good to me. Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-12-01 21:05, Jesse.Zhang wrote:
> Implement a new command context management API that supports for command submission.
>
> Key changes:
> 1. Add `cmd_context_create()`: Supports external BO injection with GPU/CPU
>    address tracking, and maintains backward compatibility for internal BO
>    allocation.
> 2. Add `cmd_context_destroy()`: Conditional BO cleanup (preserve external
>    BOs unless explicitly requested to destroy).
> 3. Add `cmd_submit_packet()`: Use separate IB buffer for command submission
>    to avoid overwriting original BO data, and properly manage resource lists
>    including both user-provided and internal resources.
> 4. Add convenience functions: `cmd_submit_write_linear()`,
>    `cmd_submit_copy_linear()`, `cmd_submit_atomic()` for common operations.
> 5. Add utility functions: `cmd_ring_available()` and
>    `cmd_get_available_rings()` for ring validation.
> 6. Add `cmd_wait_completion()`: Unified waiting for both user queues
>    (timeline syncobj) and kernel queues (fence status query).
>
> Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
> ---
>  lib/amdgpu/amd_command_submission.c | 592 ++++++++++++++++++++++++++++
>  lib/amdgpu/amd_command_submission.h |  72 ++++
>  2 files changed, 664 insertions(+)
>
> diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
> index 4b59cdab0..f53f1b070 100644
> --- a/lib/amdgpu/amd_command_submission.c
> +++ b/lib/amdgpu/amd_command_submission.c
> @@ -852,3 +852,595 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>  	free_cmd_base(base);
>  }
>  
> +/**
> + * command context creation with optional external BO
> + *
> + * @param device AMDGPU device handle
> + * @param ip_type IP block type (GFX, DMA, etc.)
> + * @param ring_id Ring index to use
> + * @param user_queue Whether to use user queue mode
> + * @param write_length Size of write operations in DWORDs
> + * @param external_bo Optional external buffer object (NULL for internal allocation)
> + * @param external_bo_mc GPU MC address of external BO (required if external_bo provided)
> + * @param external_bo_cpu CPU mapping of external BO (required if external_bo provided)
> + * @return New command context, or NULL on failure
> + */
> +cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> +                                    enum amd_ip_block_type ip_type,
> +                                    uint32_t ring_id,
> +                                    bool user_queue,
> +                                    uint32_t write_length,
> +                                    amdgpu_bo_handle external_bo,
> +                                    uint64_t external_bo_mc,
> +                                    volatile uint32_t *external_bo_cpu)
> +{
> +    cmd_context_t *ctx;
> +    void *cpu_ptr = NULL;
> +    uint64_t bo_mc = 0;
> +    amdgpu_va_handle va_handle = NULL;
> +    int r;
> +
> +    if (!device)
> +        return NULL;
> +
> +    /* Check if the requested ring is available */
> +    if (!cmd_ring_available(device, ip_type, ring_id, user_queue))
> +        return NULL;
> +
> +    /* Allocate context structure */
> +    ctx = calloc(1, sizeof(cmd_context_t));
> +    if (!ctx)
> +        return NULL;
> +
> +    ctx->device = device;
> +    ctx->ip_type = ip_type;
> +    ctx->user_queue = user_queue;
> +    ctx->last_submit_seq = 0;
> +    ctx->uses_external_bo = (external_bo != NULL);  // Now this member exists
> +    ctx->initialized = false;
> +
> +    /* Get IP block for the specified IP type */
> +    ctx->ip_block = get_ip_block(device, (unsigned int)ip_type);
> +    if (!ctx->ip_block) {
> +        free(ctx);
> +        return NULL;
> +    }
> +
> +    /* Allocate ring context structure */
> +    ctx->ring_ctx = calloc(1, sizeof(struct amdgpu_ring_context));
> +    if (!ctx->ring_ctx) {
> +        free(ctx);
> +        return NULL;
> +    }
> +
> +    /* Setup ring context parameters */
> +    ctx->ring_ctx->write_length = write_length ? write_length : 128;
> +    ctx->ring_ctx->pm4_size = 256;
> +    ctx->ring_ctx->pm4 = calloc(ctx->ring_ctx->pm4_size, sizeof(uint32_t));
> +    if (!ctx->ring_ctx->pm4) {
> +        free(ctx->ring_ctx);
> +        free(ctx);
> +        return NULL;
> +    }
> +
> +    ctx->ring_ctx->res_cnt = 1;
> +    ctx->ring_ctx->ring_id = ring_id;
> +    ctx->ring_ctx->secure = false;
> +    ctx->ring_ctx->user_queue = user_queue;
> +    ctx->ring_ctx->time_out = 0;
> +
> +    if (user_queue) {
> +        /* Initialize user queue if requested */
> +        if (!ctx->ip_block->funcs->userq_create) {
> +            free(ctx->ring_ctx->pm4);
> +            free(ctx->ring_ctx);
> +            free(ctx);
> +            return NULL;
> +        }
> +        ctx->ip_block->funcs->userq_create(device, ctx->ring_ctx, (unsigned int)ip_type);
> +    } else {
> +        /* Create regular command submission context */
> +        r = amdgpu_cs_ctx_create(device, &ctx->ring_ctx->context_handle);
> +        if (r) {
> +            free(ctx->ring_ctx->pm4);
> +            free(ctx->ring_ctx);
> +            free(ctx);
> +            return NULL;
> +        }
> +    }
> +
> +    /* BO allocation strategy: use external BO if provided, otherwise allocate internally */
> +	if (external_bo) {
> +		/* Validate external BO arguments */
> +		if (!external_bo_cpu || !external_bo_mc) {
> +			igt_debug("Invalid external BO arguments (mc=0x%llx, cpu=%p)\n",
> +					  (unsigned long long)external_bo_mc, external_bo_cpu);
> +			free(ctx->ring_ctx->pm4);
> +			free(ctx->ring_ctx);
> +			free(ctx);
> +			return NULL;
> +		}
> +
> +		/* Use caller-provided external BO */
> +		ctx->ring_ctx->bo = external_bo;
> +		ctx->ring_ctx->bo_mc = external_bo_mc;
> +		ctx->ring_ctx->bo_cpu = external_bo_cpu;
> +		ctx->ring_ctx->va_handle = NULL;  // VA management is caller's responsibility
> +
> +		igt_info("Using external BO: GPU=0x%llx, CPU=%p\n",
> +				 (unsigned long long)external_bo_mc, external_bo_cpu);
> +    } else {
> +        /* Allocate internal BO for command operations */
> +        r = amdgpu_bo_alloc_and_map(device,
> +                                   ctx->ring_ctx->write_length * sizeof(uint32_t),
> +                                   4096,
> +                                   AMDGPU_GEM_DOMAIN_GTT,
> +                                   0,
> +                                   &ctx->ring_ctx->bo,
> +                                   &cpu_ptr,
> +                                   &bo_mc,
> +                                   &va_handle);
> +        if (r) {
> +            goto cleanup_error;
> +        }
> +
> +        ctx->ring_ctx->bo_mc = bo_mc;
> +        ctx->ring_ctx->bo_cpu = (volatile uint32_t *)cpu_ptr;
> +        ctx->ring_ctx->va_handle = va_handle;
> +
> +		igt_info("Allocated internal BO: GPU=0x%llx, CPU=%p\n",
> +			 (unsigned long long)bo_mc, cpu_ptr);
> +    }
> +
> +    /* Initialize resources array */
> +    ctx->ring_ctx->resources[0] = ctx->ring_ctx->bo;
> +    for (int i = 1; i < 4; i++) {
> +        ctx->ring_ctx->resources[i] = NULL;
> +    }
> +
> +    ctx->initialized = true;
> +    return ctx;
> +
> +cleanup_error:
> +    /* Cleanup resources in case of allocation failure */
> +    if (user_queue) {
> +        ctx->ip_block->funcs->userq_destroy(device, ctx->ring_ctx, (unsigned int)ip_type);
> +    } else {
> +        if (ctx->ring_ctx->context_handle)
> +            amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> +    }
> +    free(ctx->ring_ctx->pm4);
> +    free(ctx->ring_ctx);
> +    free(ctx);
> +    return NULL;
> +}
> +
> +/**
> + * context destruction function with external BO control
> + *
> + * @param ctx Command context to destroy
> + * @param destroy_external_bo Whether to destroy external BO (if used)
> + */
> +void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
> +{
> +    if (!ctx || !ctx->initialized)
> +        return;
> +
> +    if (ctx->ring_ctx) {
> +        /* Handle BO cleanup based on allocation type */
> +        if (ctx->ring_ctx->bo) {
> +            if (!ctx->uses_external_bo || destroy_external_bo) {
> +                /* Clean up internal BO or external BO if explicitly requested */
> +                if (ctx->ring_ctx->va_handle) {
> +                    /* Internal BO with VA handle - full cleanup */
> +                    amdgpu_bo_unmap_and_free(ctx->ring_ctx->bo, ctx->ring_ctx->va_handle,
> +                                           ctx->ring_ctx->bo_mc,
> +                                           ctx->ring_ctx->write_length * sizeof(uint32_t));
> +                } else if (destroy_external_bo) {
> +                    /* External BO without VA handle - just free the BO */
> +                    amdgpu_bo_free(ctx->ring_ctx->bo);
> +                }
> +            } else {
> +				/* External BO, preserve it as requested by caller */
> +				igt_info("Preserving external BO (GPU=0x%llx)\n",
> +						 (unsigned long long)ctx->ring_ctx->bo_mc);
> +            }
> +        }
> +
> +        /* Clean up command submission context */
> +        if (ctx->user_queue) {
> +            if (ctx->ip_block && ctx->ip_block->funcs->userq_destroy) {
> +                ctx->ip_block->funcs->userq_destroy(ctx->device, ctx->ring_ctx,
> +                                                  (unsigned int)ctx->ip_type);
> +            }
> +        } else {
> +            if (ctx->ring_ctx->context_handle) {
> +                amdgpu_cs_ctx_free(ctx->ring_ctx->context_handle);
> +            }
> +        }
> +
> +        /* Free PM4 command buffer */
> +        if (ctx->ring_ctx->pm4) {
> +            free(ctx->ring_ctx->pm4);
> +        }
> +
> +        free(ctx->ring_ctx);
> +    }
> +
> +    free(ctx);
> +}
> +
> +/**
> + * Submit command packet without waiting - Fixed submission logic
> + */
> +int cmd_submit_packet(cmd_context_t *ctx)
> +{
> +    amdgpu_bo_list_handle bo_list;
> +    int r;
> +    struct amdgpu_cs_request ibs_request;
> +    struct amdgpu_cs_ib_info ib_info;
> +    amdgpu_bo_handle ib_bo;
> +    void *ib_cpu;
> +    uint64_t ib_mc_address;
> +    amdgpu_va_handle ib_va_handle;
> +    amdgpu_bo_handle all_res[5] = {0};
> +    uint32_t res_count = 0;
> +    uint32_t i;
> +
> +    if (!ctx || !ctx->initialized || !ctx->ring_ctx) {
> +        igt_debug("Invalid context parameters\n");
> +        return -EINVAL;
> +    }
> +
> +    /* Check required parameters */
> +    if (ctx->ring_ctx->pm4_dw == 0 || ctx->ring_ctx->pm4_dw > 1024) {
> +        igt_debug("Invalid PM4 size: %u (must be 1-1024)\n", ctx->ring_ctx->pm4_dw);
> +        return -EINVAL;
> +    }
> +
> +    /* For user queues, use userq_submit */
> +    if (ctx->user_queue) {
> +        if (!ctx->ip_block || !ctx->ip_block->funcs->userq_submit) {
> +            igt_debug("User queue submission not supported\n");
> +            return -ENOTSUP;
> +        }
> +
> +        if (!ctx->ring_ctx->bo_mc) {
> +            igt_debug("Invalid BO MC address for user queue\n");
> +            return -EINVAL;
> +        }
> +
> +        ctx->ip_block->funcs->userq_submit(ctx->device, ctx->ring_ctx,
> +                      (unsigned int)ctx->ip_type,
> +                      ctx->ring_ctx->bo_mc);
> +        ctx->last_submit_seq = ctx->ring_ctx->point;
> +        igt_info("User queue submission successful, point=%lu\n", ctx->last_submit_seq);
> +        return 0;
> +    }
> +
> +    /* For regular queues, setup and submit CS */
> +    memset(&ibs_request, 0, sizeof(ibs_request));
> +    memset(&ib_info, 0, sizeof(ib_info));
> +
> +    /* Allocate separate IB buffer instead of reusing command buffer */
> +    r = amdgpu_bo_alloc_and_map(ctx->device,
> +                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t),
> +                               4096,
> +                               AMDGPU_GEM_DOMAIN_GTT,
> +                               0,
> +                               &ib_bo,
> +                               &ib_cpu,
> +                               &ib_mc_address,
> +                               &ib_va_handle);
> +    if (r) {
> +        igt_debug("Failed to allocate IB: %d\n", r);
> +        return r;
> +    }
> +
> +    /* Copy PM4 commands to IB */
> +    memcpy(ib_cpu, ctx->ring_ctx->pm4, ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +    /* Setup IB information */
> +    ib_info.ib_mc_address = ib_mc_address;
> +    ib_info.size = ctx->ring_ctx->pm4_dw;
> +    if (ctx->ring_ctx->secure)
> +        ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
> +
> +    /* Setup submission request */
> +    ibs_request.ip_type = (unsigned int)ctx->ip_type;
> +    ibs_request.ring = ctx->ring_ctx->ring_id;
> +    ibs_request.number_of_ibs = 1;
> +    ibs_request.ibs = &ib_info;
> +    ibs_request.fence_info.handle = NULL;
> +
> +    /* Create resource list containing both original resources and IB */
> +    /* Add original resources */
> +    for (i = 0; i < ctx->ring_ctx->res_cnt && i < 4; i++) {
> +        if (ctx->ring_ctx->resources[i]) {
> +            all_res[res_count++] = ctx->ring_ctx->resources[i];
> +        }
> +    }
> +
> +    /* Add IB as the last resource */
> +    all_res[res_count++] = ib_bo;
> +
> +    /* Create BO list */
> +    r = amdgpu_bo_list_create(ctx->device, res_count, all_res, NULL, &bo_list);
> +    if (r) {
> +        igt_debug("amdgpu_bo_list_create failed: %d\n", r);
> +        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> +                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +        return r;
> +    }
> +
> +    ibs_request.resources = bo_list;
> +
> +    /* Submit command - strict error checking */
> +    r = amdgpu_cs_submit(ctx->ring_ctx->context_handle, 0, &ibs_request, 1);
> +
> +    if (r != 0) {
> +        igt_debug("amdgpu_cs_submit failed: %d\n", r);
> +        amdgpu_bo_list_destroy(bo_list);
> +        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> +                               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +        return r;
> +    }
> +
> +    /* Record submission sequence number for waiting */
> +    ctx->last_submit_seq = ibs_request.seq_no;
> +    igt_debug("Command submitted successfully, seq_no=%lu\n", ctx->last_submit_seq);
> +
> +    /* Cleanup resources */
> +    amdgpu_bo_list_destroy(bo_list);
> +    amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
> +                           ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +    return 0;
> +}
> +
> +int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
> +{
> +    int result = -EINVAL;
> +
> +    if (!ctx || !ctx->initialized || !ctx->ip_block || !params)
> +	return -EINVAL;
> +
> +    if (!ctx->ring_ctx || !ctx->ring_ctx->bo_cpu)
> +	return -EINVAL;
> +
> +    /* Clear the buffer before operation */
> +    memset((void *)ctx->ring_ctx->bo_cpu, 0,
> +	   ctx->ring_ctx->write_length * sizeof(uint32_t));
> +
> +
> +    /* Build the command packet based on type */
> +    switch (params->type) {
> +	case CMD_PACKET_WRITE_LINEAR:
> +	    if (!ctx->ip_block->funcs->write_linear)
> +		    return -ENOTSUP;
> +
> +	    /* TODO: allow user set the dst and data */
> +	    //ctx->ring_ctx->bo_mc = params->dst_addr;
> +	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
> +
> +	    /* Build PM4 packet */
> +	    result = ctx->ip_block->funcs->write_linear(ctx->ip_block->funcs,
> +						       ctx->ring_ctx,
> +						       &ctx->ring_ctx->pm4_dw);
> +
> +	    /*  Copy PM4 packet to ring buffer */
> +	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> +	        memcpy((void *)ctx->ring_ctx->bo_cpu,
> +	               ctx->ring_ctx->pm4,
> +	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer\n",
> +	          //       ctx->ring_ctx->pm4_dw);
> +	    }
> +	    return result;
> +
> +	case CMD_PACKET_WRITE_ATOMIC:
> +	    if (!ctx->ip_block->funcs->write_linear_atomic)
> +		    return -ENOTSUP;
> +
> +	    /* TODO: allow user set the dst and data */
> +	    //ctx->ring_ctx->bo_mc = params->dst_addr;
> +	    ctx->ring_ctx->write_length = 1; /* Atomic operations typically work on single DWORD */
> +
> +	    result = ctx->ip_block->funcs->write_linear_atomic(ctx->ip_block->funcs,
> +							      ctx->ring_ctx,
> +							      &ctx->ring_ctx->pm4_dw);
> +
> +	    /*  Copy PM4 packet to ring buffer */
> +	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> +	        memcpy((void *)ctx->ring_ctx->bo_cpu,
> +	               ctx->ring_ctx->pm4,
> +	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer (atomic)\n",
> +	          //       ctx->ring_ctx->pm4_dw);
> +	    }
> +	    return result;
> +
> +	case CMD_PACKET_COPY_LINEAR:
> +	    if (!ctx->ip_block->funcs->copy_linear)
> +		    return -ENOTSUP;
> +
> +	    /* For copy operations, we need both source and destination addresses */
> +	    /* This would require extending the API to pass both addresses */
> +	    /* For now, use the internal buffer as source */
> +	    ctx->ring_ctx->write_length = params->size / sizeof(uint32_t);
> +
> +	    result = ctx->ip_block->funcs->copy_linear(ctx->ip_block->funcs,
> +						      ctx->ring_ctx,
> +						      &ctx->ring_ctx->pm4_dw);
> +
> +	    /* Copy PM4 packet to ring buffer */
> +	    if (result == 0 && ctx->ring_ctx->pm4_dw > 0) {
> +	        memcpy((void *)ctx->ring_ctx->bo_cpu,
> +	               ctx->ring_ctx->pm4,
> +	               ctx->ring_ctx->pm4_dw * sizeof(uint32_t));
> +
> +	        //igt_info("cmd_place_packet: Copied %u DWORDs to ring buffer (copy)\n",
> +	          //       ctx->ring_ctx->pm4_dw);
> +	    }
> +	    return result;
> +
> +	case CMD_PACKET_COPY_ATOMIC:
> +	    /* TODO: Implement atomic copy if supported */
> +	    igt_info("cmd_place_packet: ATOMIC_COPY not implemented\n");
> +	    return -ENOTSUP;
> +
> +	case CMD_PACKET_FENCE:
> +	    /* TODO: Implement fence operation */
> +	    igt_info("cmd_place_packet: FENCE not implemented\n");
> +	    return -ENOTSUP;
> +
> +	case CMD_PACKET_TIMESTAMP:
> +	    /* TODO: Implement timestamp operation */
> +	    igt_info("cmd_place_packet: TIMESTAMP not implemented\n");
> +	    return -ENOTSUP;
> +
> +	default:
> +	    igt_info("cmd_place_packet: Unknown packet type: %d\n", params->type);
> +	    return -EINVAL;
> +    }
> +}
> +
> +/**
> + * Build and submit packet in one operation
> + */
> +int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
> +{
> +    int r;
> +
> +    r = cmd_place_packet(ctx, params);
> +    if (r)
> +	return r;
> +
> +    return cmd_submit_packet(ctx);
> +}
> +
> +/**
> + * Convenience function for write linear
> + */
> +int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data)
> +{
> +    cmd_packet_params_t params = {
> +	.type = CMD_PACKET_WRITE_LINEAR,
> +	.dst_addr = dst_addr,
> +	.size = size,
> +	.data = data,
> +    };
> +
> +    return cmd_place_and_submit_packet(ctx, &params);
> +}
> +
> +/**
> + * Convenience function for copy linear
> + */
> +int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size)
> +{
> +    cmd_packet_params_t params = {
> +	.type = CMD_PACKET_COPY_LINEAR,
> +	.src_addr = src_addr,
> +	.dst_addr = dst_addr,
> +	.size = size,
> +    };
> +
> +    return cmd_place_and_submit_packet(ctx, &params);
> +}
> +
> +/**
> + * Convenience function for atomic operation
> + */
> +int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data)
> +{
> +    cmd_packet_params_t params = {
> +	.type = CMD_PACKET_WRITE_ATOMIC,
> +	.dst_addr = dst_addr,
> +	.data = data,
> +    };
> +
> +    return cmd_place_and_submit_packet(ctx, &params);
> +}
> +
> +/**
> + * Wait for all submitted packets to complete (equivalent to Wait4PacketConsumption)
> + */
> +int cmd_wait_completion(cmd_context_t *ctx)
> +{
> +    struct amdgpu_cs_fence fence_status = {0};
> +    uint32_t expired;
> +
> +    if (!ctx || !ctx->initialized)
> +	return -EINVAL;
> +
> +    /* For user queues, wait on timeline syncobj */
> +    if (ctx->user_queue) {
> +	if (!ctx->ring_ctx->timeline_syncobj_handle)
> +	return -EINVAL;
> +
> +	return amdgpu_timeline_syncobj_wait(ctx->device,
> +					   ctx->ring_ctx->timeline_syncobj_handle,
> +					   ctx->ring_ctx->point);
> +    }
> +
> +    /* For regular queues, wait on fence */
> +    fence_status.ip_type = (unsigned int)ctx->ip_type;
> +    fence_status.ip_instance = 0;
> +    fence_status.ring = ctx->ring_ctx->ring_id;
> +    fence_status.context = ctx->ring_ctx->context_handle;
> +    fence_status.fence = ctx->last_submit_seq;
> +
> +    return amdgpu_cs_query_fence_status(&fence_status,
> +				       AMDGPU_TIMEOUT_INFINITE,
> +				       0, &expired);
> +}
> +
> +/**
> + * Check if ring is available
> + */
> +bool cmd_ring_available(amdgpu_device_handle device,
> +			enum amd_ip_block_type ip_type,
> +		       uint32_t ring_id,
> +		       bool user_queue)
> +{
> +    struct drm_amdgpu_info_hw_ip hw_ip_info;
> +    int r;
> +
> +    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
> +    if (r)
> +	return false;
> +
> +    if (user_queue) {
> +	/* For user queues, check user queue slots */
> +	uint32_t userq_slots = hw_ip_info.num_userq_slots;
> +
> +	return (ring_id < userq_slots);
> +    } else {
> +	/* For regular queues, check available rings */
> +		return !!(hw_ip_info.available_rings & (1ULL << ring_id));
> +    }
> +}
> +
> +/**
> + * Get number of available rings
> + */
> +uint32_t cmd_get_available_rings(amdgpu_device_handle device,
> +				 enum amd_ip_block_type ip_type,
> +				bool user_queue)
> +{
> +    struct drm_amdgpu_info_hw_ip hw_ip_info;
> +    int r;
> +
> +    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &hw_ip_info);
> +    if (r)
> +	return 0;
> +
> +    if (user_queue) {
> +	return hw_ip_info.num_userq_slots;
> +    } else {
> +		return __builtin_popcountll(hw_ip_info.available_rings);
> +    }
> +}
> diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
> index 8b090359a..7826c2d0f 100644
> --- a/lib/amdgpu/amd_command_submission.h
> +++ b/lib/amdgpu/amd_command_submission.h
> @@ -28,6 +28,45 @@
>  
>  #include "amd_ip_blocks.h"
>  
> +/**
> + * Packet types supported by the command submission library
> + */
> +typedef enum {
> +    CMD_PACKET_WRITE_LINEAR,
> +    CMD_PACKET_WRITE_ATOMIC,
> +    CMD_PACKET_COPY_LINEAR,
> +    CMD_PACKET_COPY_ATOMIC,
> +    CMD_PACKET_FENCE,
> +    CMD_PACKET_TIMESTAMP,
> +} cmd_packet_type_t;
> +
> +/**
> + * Command submission context structure
> + */
> +typedef struct {
> +    amdgpu_device_handle device;
> +    struct amdgpu_ring_context *ring_ctx;
> +    const struct amdgpu_ip_block_version *ip_block;
> +    enum amd_ip_block_type ip_type;
> +    bool initialized;
> +    bool user_queue;
> +    bool uses_external_bo;
> +    uint64_t last_submit_seq; /* Last submission sequence number */
> +} cmd_context_t;
> +
> +/**
> + * Packet building parameters
> + */
> +typedef struct {
> +    cmd_packet_type_t type;
> +    uint64_t src_addr;
> +    uint64_t dst_addr;
> +    uint32_t size;
> +    uint32_t data;
> +    uint32_t *custom_data;
> +    uint32_t custom_data_size;
> +} cmd_packet_params_t;
> +
>  int amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
>  				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
>  				int expect);
> @@ -49,4 +88,37 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
>  
>  void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
>  					  amdgpu_context_handle ctx);
> +
> +cmd_context_t* cmd_context_create(amdgpu_device_handle device,
> +                                    enum amd_ip_block_type ip_type,
> +                                    uint32_t ring_id,
> +                                    bool user_queue,
> +                                    uint32_t write_length,
> +                                    amdgpu_bo_handle external_bo,
> +                                    uint64_t external_bo_mc,
> +                                    volatile uint32_t *external_bo_cpu);
> +void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
> +
> +int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
> +
> +int cmd_submit_packet(cmd_context_t *ctx);
> +
> +int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
> +
> +int cmd_wait_completion(cmd_context_t *ctx);
> +
> +int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data);
> +
> +int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size);
> +
> +int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data);
> +
> +bool cmd_ring_available(amdgpu_device_handle device,
> +                        enum amd_ip_block_type ip_type,
> +                       uint32_t ring_id,
> +                       bool user_queue);
> +
> +uint32_t cmd_get_available_rings(amdgpu_device_handle device,
> +                                 enum amd_ip_block_type ip_type,
> +                                bool user_queue);
>  #endif
--------------JmoPtk9DUu1CSQk0pvE0xNTz
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span><span class="ui-provider ed ft bhx bvj bvk bvl bvm bvn bvo bvp bvq bvr bvs bvt bvu bvv bvw bvx bvy bvz bwa bwb bwc bwd bwe bwf bwg bwh bwi bwj bwk bwl bwm bwn bwo" dir="ltr"><br>
          The series of 6 patches looks good to me. Reviewed-by: Vitaly
          Prosyak <a class="moz-txt-link-rfc2396E" href="mailto:vitaly.prosyak@amd.com">&lt;vitaly.prosyak@amd.com&gt;</a></span></span></p>
    <div class="moz-cite-prefix">On 2025-12-01 21:05, Jesse.Zhang wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251202020602.3823838-1-Jesse.Zhang@amd.com">
      <pre wrap="" class="moz-quote-pre">Implement a new command context management API that supports for command submission.

Key changes:
1. Add `cmd_context_create()`: Supports external BO injection with GPU/CPU
   address tracking, and maintains backward compatibility for internal BO
   allocation.
2. Add `cmd_context_destroy()`: Conditional BO cleanup (preserve external
   BOs unless explicitly requested to destroy).
3. Add `cmd_submit_packet()`: Use separate IB buffer for command submission
   to avoid overwriting original BO data, and properly manage resource lists
   including both user-provided and internal resources.
4. Add convenience functions: `cmd_submit_write_linear()`,
   `cmd_submit_copy_linear()`, `cmd_submit_atomic()` for common operations.
5. Add utility functions: `cmd_ring_available()` and
   `cmd_get_available_rings()` for ring validation.
6. Add `cmd_wait_completion()`: Unified waiting for both user queues
   (timeline syncobj) and kernel queues (fence status query).

Signed-off-by: Jesse Zhang <a class="moz-txt-link-rfc2396E" href="mailto:jesse.zhang@amd.com">&lt;jesse.zhang@amd.com&gt;</a>
---
 lib/amdgpu/amd_command_submission.c | 592 ++++++++++++++++++++++++++++
 lib/amdgpu/amd_command_submission.h |  72 ++++
 2 files changed, 664 insertions(+)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 4b59cdab0..f53f1b070 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -852,3 +852,595 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 	free_cmd_base(base);
 }
 
+/**
+ * command context creation with optional external BO
+ *
+ * @param device AMDGPU device handle
+ * @param ip_type IP block type (GFX, DMA, etc.)
+ * @param ring_id Ring index to use
+ * @param user_queue Whether to use user queue mode
+ * @param write_length Size of write operations in DWORDs
+ * @param external_bo Optional external buffer object (NULL for internal allocation)
+ * @param external_bo_mc GPU MC address of external BO (required if external_bo provided)
+ * @param external_bo_cpu CPU mapping of external BO (required if external_bo provided)
+ * @return New command context, or NULL on failure
+ */
+cmd_context_t* cmd_context_create(amdgpu_device_handle device,
+                                    enum amd_ip_block_type ip_type,
+                                    uint32_t ring_id,
+                                    bool user_queue,
+                                    uint32_t write_length,
+                                    amdgpu_bo_handle external_bo,
+                                    uint64_t external_bo_mc,
+                                    volatile uint32_t *external_bo_cpu)
+{
+    cmd_context_t *ctx;
+    void *cpu_ptr = NULL;
+    uint64_t bo_mc = 0;
+    amdgpu_va_handle va_handle = NULL;
+    int r;
+
+    if (!device)
+        return NULL;
+
+    /* Check if the requested ring is available */
+    if (!cmd_ring_available(device, ip_type, ring_id, user_queue))
+        return NULL;
+
+    /* Allocate context structure */
+    ctx = calloc(1, sizeof(cmd_context_t));
+    if (!ctx)
+        return NULL;
+
+    ctx-&gt;device = device;
+    ctx-&gt;ip_type = ip_type;
+    ctx-&gt;user_queue = user_queue;
+    ctx-&gt;last_submit_seq = 0;
+    ctx-&gt;uses_external_bo = (external_bo != NULL);  // Now this member exists
+    ctx-&gt;initialized = false;
+
+    /* Get IP block for the specified IP type */
+    ctx-&gt;ip_block = get_ip_block(device, (unsigned int)ip_type);
+    if (!ctx-&gt;ip_block) {
+        free(ctx);
+        return NULL;
+    }
+
+    /* Allocate ring context structure */
+    ctx-&gt;ring_ctx = calloc(1, sizeof(struct amdgpu_ring_context));
+    if (!ctx-&gt;ring_ctx) {
+        free(ctx);
+        return NULL;
+    }
+
+    /* Setup ring context parameters */
+    ctx-&gt;ring_ctx-&gt;write_length = write_length ? write_length : 128;
+    ctx-&gt;ring_ctx-&gt;pm4_size = 256;
+    ctx-&gt;ring_ctx-&gt;pm4 = calloc(ctx-&gt;ring_ctx-&gt;pm4_size, sizeof(uint32_t));
+    if (!ctx-&gt;ring_ctx-&gt;pm4) {
+        free(ctx-&gt;ring_ctx);
+        free(ctx);
+        return NULL;
+    }
+
+    ctx-&gt;ring_ctx-&gt;res_cnt = 1;
+    ctx-&gt;ring_ctx-&gt;ring_id = ring_id;
+    ctx-&gt;ring_ctx-&gt;secure = false;
+    ctx-&gt;ring_ctx-&gt;user_queue = user_queue;
+    ctx-&gt;ring_ctx-&gt;time_out = 0;
+
+    if (user_queue) {
+        /* Initialize user queue if requested */
+        if (!ctx-&gt;ip_block-&gt;funcs-&gt;userq_create) {
+            free(ctx-&gt;ring_ctx-&gt;pm4);
+            free(ctx-&gt;ring_ctx);
+            free(ctx);
+            return NULL;
+        }
+        ctx-&gt;ip_block-&gt;funcs-&gt;userq_create(device, ctx-&gt;ring_ctx, (unsigned int)ip_type);
+    } else {
+        /* Create regular command submission context */
+        r = amdgpu_cs_ctx_create(device, &amp;ctx-&gt;ring_ctx-&gt;context_handle);
+        if (r) {
+            free(ctx-&gt;ring_ctx-&gt;pm4);
+            free(ctx-&gt;ring_ctx);
+            free(ctx);
+            return NULL;
+        }
+    }
+
+    /* BO allocation strategy: use external BO if provided, otherwise allocate internally */
+	if (external_bo) {
+		/* Validate external BO arguments */
+		if (!external_bo_cpu || !external_bo_mc) {
+			igt_debug(&quot;Invalid external BO arguments (mc=0x%llx, cpu=%p)\n&quot;,
+					  (unsigned long long)external_bo_mc, external_bo_cpu);
+			free(ctx-&gt;ring_ctx-&gt;pm4);
+			free(ctx-&gt;ring_ctx);
+			free(ctx);
+			return NULL;
+		}
+
+		/* Use caller-provided external BO */
+		ctx-&gt;ring_ctx-&gt;bo = external_bo;
+		ctx-&gt;ring_ctx-&gt;bo_mc = external_bo_mc;
+		ctx-&gt;ring_ctx-&gt;bo_cpu = external_bo_cpu;
+		ctx-&gt;ring_ctx-&gt;va_handle = NULL;  // VA management is caller's responsibility
+
+		igt_info(&quot;Using external BO: GPU=0x%llx, CPU=%p\n&quot;,
+				 (unsigned long long)external_bo_mc, external_bo_cpu);
+    } else {
+        /* Allocate internal BO for command operations */
+        r = amdgpu_bo_alloc_and_map(device,
+                                   ctx-&gt;ring_ctx-&gt;write_length * sizeof(uint32_t),
+                                   4096,
+                                   AMDGPU_GEM_DOMAIN_GTT,
+                                   0,
+                                   &amp;ctx-&gt;ring_ctx-&gt;bo,
+                                   &amp;cpu_ptr,
+                                   &amp;bo_mc,
+                                   &amp;va_handle);
+        if (r) {
+            goto cleanup_error;
+        }
+
+        ctx-&gt;ring_ctx-&gt;bo_mc = bo_mc;
+        ctx-&gt;ring_ctx-&gt;bo_cpu = (volatile uint32_t *)cpu_ptr;
+        ctx-&gt;ring_ctx-&gt;va_handle = va_handle;
+
+		igt_info(&quot;Allocated internal BO: GPU=0x%llx, CPU=%p\n&quot;,
+			 (unsigned long long)bo_mc, cpu_ptr);
+    }
+
+    /* Initialize resources array */
+    ctx-&gt;ring_ctx-&gt;resources[0] = ctx-&gt;ring_ctx-&gt;bo;
+    for (int i = 1; i &lt; 4; i++) {
+        ctx-&gt;ring_ctx-&gt;resources[i] = NULL;
+    }
+
+    ctx-&gt;initialized = true;
+    return ctx;
+
+cleanup_error:
+    /* Cleanup resources in case of allocation failure */
+    if (user_queue) {
+        ctx-&gt;ip_block-&gt;funcs-&gt;userq_destroy(device, ctx-&gt;ring_ctx, (unsigned int)ip_type);
+    } else {
+        if (ctx-&gt;ring_ctx-&gt;context_handle)
+            amdgpu_cs_ctx_free(ctx-&gt;ring_ctx-&gt;context_handle);
+    }
+    free(ctx-&gt;ring_ctx-&gt;pm4);
+    free(ctx-&gt;ring_ctx);
+    free(ctx);
+    return NULL;
+}
+
+/**
+ * context destruction function with external BO control
+ *
+ * @param ctx Command context to destroy
+ * @param destroy_external_bo Whether to destroy external BO (if used)
+ */
+void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo)
+{
+    if (!ctx || !ctx-&gt;initialized)
+        return;
+
+    if (ctx-&gt;ring_ctx) {
+        /* Handle BO cleanup based on allocation type */
+        if (ctx-&gt;ring_ctx-&gt;bo) {
+            if (!ctx-&gt;uses_external_bo || destroy_external_bo) {
+                /* Clean up internal BO or external BO if explicitly requested */
+                if (ctx-&gt;ring_ctx-&gt;va_handle) {
+                    /* Internal BO with VA handle - full cleanup */
+                    amdgpu_bo_unmap_and_free(ctx-&gt;ring_ctx-&gt;bo, ctx-&gt;ring_ctx-&gt;va_handle,
+                                           ctx-&gt;ring_ctx-&gt;bo_mc,
+                                           ctx-&gt;ring_ctx-&gt;write_length * sizeof(uint32_t));
+                } else if (destroy_external_bo) {
+                    /* External BO without VA handle - just free the BO */
+                    amdgpu_bo_free(ctx-&gt;ring_ctx-&gt;bo);
+                }
+            } else {
+				/* External BO, preserve it as requested by caller */
+				igt_info(&quot;Preserving external BO (GPU=0x%llx)\n&quot;,
+						 (unsigned long long)ctx-&gt;ring_ctx-&gt;bo_mc);
+            }
+        }
+
+        /* Clean up command submission context */
+        if (ctx-&gt;user_queue) {
+            if (ctx-&gt;ip_block &amp;&amp; ctx-&gt;ip_block-&gt;funcs-&gt;userq_destroy) {
+                ctx-&gt;ip_block-&gt;funcs-&gt;userq_destroy(ctx-&gt;device, ctx-&gt;ring_ctx,
+                                                  (unsigned int)ctx-&gt;ip_type);
+            }
+        } else {
+            if (ctx-&gt;ring_ctx-&gt;context_handle) {
+                amdgpu_cs_ctx_free(ctx-&gt;ring_ctx-&gt;context_handle);
+            }
+        }
+
+        /* Free PM4 command buffer */
+        if (ctx-&gt;ring_ctx-&gt;pm4) {
+            free(ctx-&gt;ring_ctx-&gt;pm4);
+        }
+
+        free(ctx-&gt;ring_ctx);
+    }
+
+    free(ctx);
+}
+
+/**
+ * Submit command packet without waiting - Fixed submission logic
+ */
+int cmd_submit_packet(cmd_context_t *ctx)
+{
+    amdgpu_bo_list_handle bo_list;
+    int r;
+    struct amdgpu_cs_request ibs_request;
+    struct amdgpu_cs_ib_info ib_info;
+    amdgpu_bo_handle ib_bo;
+    void *ib_cpu;
+    uint64_t ib_mc_address;
+    amdgpu_va_handle ib_va_handle;
+    amdgpu_bo_handle all_res[5] = {0};
+    uint32_t res_count = 0;
+    uint32_t i;
+
+    if (!ctx || !ctx-&gt;initialized || !ctx-&gt;ring_ctx) {
+        igt_debug(&quot;Invalid context parameters\n&quot;);
+        return -EINVAL;
+    }
+
+    /* Check required parameters */
+    if (ctx-&gt;ring_ctx-&gt;pm4_dw == 0 || ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 1024) {
+        igt_debug(&quot;Invalid PM4 size: %u (must be 1-1024)\n&quot;, ctx-&gt;ring_ctx-&gt;pm4_dw);
+        return -EINVAL;
+    }
+
+    /* For user queues, use userq_submit */
+    if (ctx-&gt;user_queue) {
+        if (!ctx-&gt;ip_block || !ctx-&gt;ip_block-&gt;funcs-&gt;userq_submit) {
+            igt_debug(&quot;User queue submission not supported\n&quot;);
+            return -ENOTSUP;
+        }
+
+        if (!ctx-&gt;ring_ctx-&gt;bo_mc) {
+            igt_debug(&quot;Invalid BO MC address for user queue\n&quot;);
+            return -EINVAL;
+        }
+
+        ctx-&gt;ip_block-&gt;funcs-&gt;userq_submit(ctx-&gt;device, ctx-&gt;ring_ctx,
+                      (unsigned int)ctx-&gt;ip_type,
+                      ctx-&gt;ring_ctx-&gt;bo_mc);
+        ctx-&gt;last_submit_seq = ctx-&gt;ring_ctx-&gt;point;
+        igt_info(&quot;User queue submission successful, point=%lu\n&quot;, ctx-&gt;last_submit_seq);
+        return 0;
+    }
+
+    /* For regular queues, setup and submit CS */
+    memset(&amp;ibs_request, 0, sizeof(ibs_request));
+    memset(&amp;ib_info, 0, sizeof(ib_info));
+
+    /* Allocate separate IB buffer instead of reusing command buffer */
+    r = amdgpu_bo_alloc_and_map(ctx-&gt;device,
+                               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t),
+                               4096,
+                               AMDGPU_GEM_DOMAIN_GTT,
+                               0,
+                               &amp;ib_bo,
+                               &amp;ib_cpu,
+                               &amp;ib_mc_address,
+                               &amp;ib_va_handle);
+    if (r) {
+        igt_debug(&quot;Failed to allocate IB: %d\n&quot;, r);
+        return r;
+    }
+
+    /* Copy PM4 commands to IB */
+    memcpy(ib_cpu, ctx-&gt;ring_ctx-&gt;pm4, ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+    /* Setup IB information */
+    ib_info.ib_mc_address = ib_mc_address;
+    ib_info.size = ctx-&gt;ring_ctx-&gt;pm4_dw;
+    if (ctx-&gt;ring_ctx-&gt;secure)
+        ib_info.flags |= AMDGPU_IB_FLAGS_SECURE;
+
+    /* Setup submission request */
+    ibs_request.ip_type = (unsigned int)ctx-&gt;ip_type;
+    ibs_request.ring = ctx-&gt;ring_ctx-&gt;ring_id;
+    ibs_request.number_of_ibs = 1;
+    ibs_request.ibs = &amp;ib_info;
+    ibs_request.fence_info.handle = NULL;
+
+    /* Create resource list containing both original resources and IB */
+    /* Add original resources */
+    for (i = 0; i &lt; ctx-&gt;ring_ctx-&gt;res_cnt &amp;&amp; i &lt; 4; i++) {
+        if (ctx-&gt;ring_ctx-&gt;resources[i]) {
+            all_res[res_count++] = ctx-&gt;ring_ctx-&gt;resources[i];
+        }
+    }
+
+    /* Add IB as the last resource */
+    all_res[res_count++] = ib_bo;
+
+    /* Create BO list */
+    r = amdgpu_bo_list_create(ctx-&gt;device, res_count, all_res, NULL, &amp;bo_list);
+    if (r) {
+        igt_debug(&quot;amdgpu_bo_list_create failed: %d\n&quot;, r);
+        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+        return r;
+    }
+
+    ibs_request.resources = bo_list;
+
+    /* Submit command - strict error checking */
+    r = amdgpu_cs_submit(ctx-&gt;ring_ctx-&gt;context_handle, 0, &amp;ibs_request, 1);
+
+    if (r != 0) {
+        igt_debug(&quot;amdgpu_cs_submit failed: %d\n&quot;, r);
+        amdgpu_bo_list_destroy(bo_list);
+        amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+        return r;
+    }
+
+    /* Record submission sequence number for waiting */
+    ctx-&gt;last_submit_seq = ibs_request.seq_no;
+    igt_debug(&quot;Command submitted successfully, seq_no=%lu\n&quot;, ctx-&gt;last_submit_seq);
+
+    /* Cleanup resources */
+    amdgpu_bo_list_destroy(bo_list);
+    amdgpu_bo_unmap_and_free(ib_bo, ib_va_handle, ib_mc_address,
+                           ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+    return 0;
+}
+
+int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+    int result = -EINVAL;
+
+    if (!ctx || !ctx-&gt;initialized || !ctx-&gt;ip_block || !params)
+	return -EINVAL;
+
+    if (!ctx-&gt;ring_ctx || !ctx-&gt;ring_ctx-&gt;bo_cpu)
+	return -EINVAL;
+
+    /* Clear the buffer before operation */
+    memset((void *)ctx-&gt;ring_ctx-&gt;bo_cpu, 0,
+	   ctx-&gt;ring_ctx-&gt;write_length * sizeof(uint32_t));
+
+
+    /* Build the command packet based on type */
+    switch (params-&gt;type) {
+	case CMD_PACKET_WRITE_LINEAR:
+	    if (!ctx-&gt;ip_block-&gt;funcs-&gt;write_linear)
+		    return -ENOTSUP;
+
+	    /* TODO: allow user set the dst and data */
+	    //ctx-&gt;ring_ctx-&gt;bo_mc = params-&gt;dst_addr;
+	    ctx-&gt;ring_ctx-&gt;write_length = params-&gt;size / sizeof(uint32_t);
+
+	    /* Build PM4 packet */
+	    result = ctx-&gt;ip_block-&gt;funcs-&gt;write_linear(ctx-&gt;ip_block-&gt;funcs,
+						       ctx-&gt;ring_ctx,
+						       &amp;ctx-&gt;ring_ctx-&gt;pm4_dw);
+
+	    /*  Copy PM4 packet to ring buffer */
+	    if (result == 0 &amp;&amp; ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 0) {
+	        memcpy((void *)ctx-&gt;ring_ctx-&gt;bo_cpu,
+	               ctx-&gt;ring_ctx-&gt;pm4,
+	               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+	        //igt_info(&quot;cmd_place_packet: Copied %u DWORDs to ring buffer\n&quot;,
+	          //       ctx-&gt;ring_ctx-&gt;pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_WRITE_ATOMIC:
+	    if (!ctx-&gt;ip_block-&gt;funcs-&gt;write_linear_atomic)
+		    return -ENOTSUP;
+
+	    /* TODO: allow user set the dst and data */
+	    //ctx-&gt;ring_ctx-&gt;bo_mc = params-&gt;dst_addr;
+	    ctx-&gt;ring_ctx-&gt;write_length = 1; /* Atomic operations typically work on single DWORD */
+
+	    result = ctx-&gt;ip_block-&gt;funcs-&gt;write_linear_atomic(ctx-&gt;ip_block-&gt;funcs,
+							      ctx-&gt;ring_ctx,
+							      &amp;ctx-&gt;ring_ctx-&gt;pm4_dw);
+
+	    /*  Copy PM4 packet to ring buffer */
+	    if (result == 0 &amp;&amp; ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 0) {
+	        memcpy((void *)ctx-&gt;ring_ctx-&gt;bo_cpu,
+	               ctx-&gt;ring_ctx-&gt;pm4,
+	               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+	        //igt_info(&quot;cmd_place_packet: Copied %u DWORDs to ring buffer (atomic)\n&quot;,
+	          //       ctx-&gt;ring_ctx-&gt;pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_COPY_LINEAR:
+	    if (!ctx-&gt;ip_block-&gt;funcs-&gt;copy_linear)
+		    return -ENOTSUP;
+
+	    /* For copy operations, we need both source and destination addresses */
+	    /* This would require extending the API to pass both addresses */
+	    /* For now, use the internal buffer as source */
+	    ctx-&gt;ring_ctx-&gt;write_length = params-&gt;size / sizeof(uint32_t);
+
+	    result = ctx-&gt;ip_block-&gt;funcs-&gt;copy_linear(ctx-&gt;ip_block-&gt;funcs,
+						      ctx-&gt;ring_ctx,
+						      &amp;ctx-&gt;ring_ctx-&gt;pm4_dw);
+
+	    /* Copy PM4 packet to ring buffer */
+	    if (result == 0 &amp;&amp; ctx-&gt;ring_ctx-&gt;pm4_dw &gt; 0) {
+	        memcpy((void *)ctx-&gt;ring_ctx-&gt;bo_cpu,
+	               ctx-&gt;ring_ctx-&gt;pm4,
+	               ctx-&gt;ring_ctx-&gt;pm4_dw * sizeof(uint32_t));
+
+	        //igt_info(&quot;cmd_place_packet: Copied %u DWORDs to ring buffer (copy)\n&quot;,
+	          //       ctx-&gt;ring_ctx-&gt;pm4_dw);
+	    }
+	    return result;
+
+	case CMD_PACKET_COPY_ATOMIC:
+	    /* TODO: Implement atomic copy if supported */
+	    igt_info(&quot;cmd_place_packet: ATOMIC_COPY not implemented\n&quot;);
+	    return -ENOTSUP;
+
+	case CMD_PACKET_FENCE:
+	    /* TODO: Implement fence operation */
+	    igt_info(&quot;cmd_place_packet: FENCE not implemented\n&quot;);
+	    return -ENOTSUP;
+
+	case CMD_PACKET_TIMESTAMP:
+	    /* TODO: Implement timestamp operation */
+	    igt_info(&quot;cmd_place_packet: TIMESTAMP not implemented\n&quot;);
+	    return -ENOTSUP;
+
+	default:
+	    igt_info(&quot;cmd_place_packet: Unknown packet type: %d\n&quot;, params-&gt;type);
+	    return -EINVAL;
+    }
+}
+
+/**
+ * Build and submit packet in one operation
+ */
+int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params)
+{
+    int r;
+
+    r = cmd_place_packet(ctx, params);
+    if (r)
+	return r;
+
+    return cmd_submit_packet(ctx);
+}
+
+/**
+ * Convenience function for write linear
+ */
+int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_WRITE_LINEAR,
+	.dst_addr = dst_addr,
+	.size = size,
+	.data = data,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &amp;params);
+}
+
+/**
+ * Convenience function for copy linear
+ */
+int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_COPY_LINEAR,
+	.src_addr = src_addr,
+	.dst_addr = dst_addr,
+	.size = size,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &amp;params);
+}
+
+/**
+ * Convenience function for atomic operation
+ */
+int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data)
+{
+    cmd_packet_params_t params = {
+	.type = CMD_PACKET_WRITE_ATOMIC,
+	.dst_addr = dst_addr,
+	.data = data,
+    };
+
+    return cmd_place_and_submit_packet(ctx, &amp;params);
+}
+
+/**
+ * Wait for all submitted packets to complete (equivalent to Wait4PacketConsumption)
+ */
+int cmd_wait_completion(cmd_context_t *ctx)
+{
+    struct amdgpu_cs_fence fence_status = {0};
+    uint32_t expired;
+
+    if (!ctx || !ctx-&gt;initialized)
+	return -EINVAL;
+
+    /* For user queues, wait on timeline syncobj */
+    if (ctx-&gt;user_queue) {
+	if (!ctx-&gt;ring_ctx-&gt;timeline_syncobj_handle)
+	return -EINVAL;
+
+	return amdgpu_timeline_syncobj_wait(ctx-&gt;device,
+					   ctx-&gt;ring_ctx-&gt;timeline_syncobj_handle,
+					   ctx-&gt;ring_ctx-&gt;point);
+    }
+
+    /* For regular queues, wait on fence */
+    fence_status.ip_type = (unsigned int)ctx-&gt;ip_type;
+    fence_status.ip_instance = 0;
+    fence_status.ring = ctx-&gt;ring_ctx-&gt;ring_id;
+    fence_status.context = ctx-&gt;ring_ctx-&gt;context_handle;
+    fence_status.fence = ctx-&gt;last_submit_seq;
+
+    return amdgpu_cs_query_fence_status(&amp;fence_status,
+				       AMDGPU_TIMEOUT_INFINITE,
+				       0, &amp;expired);
+}
+
+/**
+ * Check if ring is available
+ */
+bool cmd_ring_available(amdgpu_device_handle device,
+			enum amd_ip_block_type ip_type,
+		       uint32_t ring_id,
+		       bool user_queue)
+{
+    struct drm_amdgpu_info_hw_ip hw_ip_info;
+    int r;
+
+    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &amp;hw_ip_info);
+    if (r)
+	return false;
+
+    if (user_queue) {
+	/* For user queues, check user queue slots */
+	uint32_t userq_slots = hw_ip_info.num_userq_slots;
+
+	return (ring_id &lt; userq_slots);
+    } else {
+	/* For regular queues, check available rings */
+		return !!(hw_ip_info.available_rings &amp; (1ULL &lt;&lt; ring_id));
+    }
+}
+
+/**
+ * Get number of available rings
+ */
+uint32_t cmd_get_available_rings(amdgpu_device_handle device,
+				 enum amd_ip_block_type ip_type,
+				bool user_queue)
+{
+    struct drm_amdgpu_info_hw_ip hw_ip_info;
+    int r;
+
+    r = amdgpu_query_hw_ip_info(device, (unsigned int)ip_type, 0, &amp;hw_ip_info);
+    if (r)
+	return 0;
+
+    if (user_queue) {
+	return hw_ip_info.num_userq_slots;
+    } else {
+		return __builtin_popcountll(hw_ip_info.available_rings);
+    }
+}
diff --git a/lib/amdgpu/amd_command_submission.h b/lib/amdgpu/amd_command_submission.h
index 8b090359a..7826c2d0f 100644
--- a/lib/amdgpu/amd_command_submission.h
+++ b/lib/amdgpu/amd_command_submission.h
@@ -28,6 +28,45 @@
 
 #include &quot;amd_ip_blocks.h&quot;
 
+/**
+ * Packet types supported by the command submission library
+ */
+typedef enum {
+    CMD_PACKET_WRITE_LINEAR,
+    CMD_PACKET_WRITE_ATOMIC,
+    CMD_PACKET_COPY_LINEAR,
+    CMD_PACKET_COPY_ATOMIC,
+    CMD_PACKET_FENCE,
+    CMD_PACKET_TIMESTAMP,
+} cmd_packet_type_t;
+
+/**
+ * Command submission context structure
+ */
+typedef struct {
+    amdgpu_device_handle device;
+    struct amdgpu_ring_context *ring_ctx;
+    const struct amdgpu_ip_block_version *ip_block;
+    enum amd_ip_block_type ip_type;
+    bool initialized;
+    bool user_queue;
+    bool uses_external_bo;
+    uint64_t last_submit_seq; /* Last submission sequence number */
+} cmd_context_t;
+
+/**
+ * Packet building parameters
+ */
+typedef struct {
+    cmd_packet_type_t type;
+    uint64_t src_addr;
+    uint64_t dst_addr;
+    uint32_t size;
+    uint32_t data;
+    uint32_t *custom_data;
+    uint32_t custom_data_size;
+} cmd_packet_params_t;
+
 int amdgpu_test_exec_cs_helper(amdgpu_device_handle device,
 				unsigned int ip_type, struct amdgpu_ring_context *ring_context,
 				int expect);
@@ -49,4 +88,37 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 
 void  amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 					  amdgpu_context_handle ctx);
+
+cmd_context_t* cmd_context_create(amdgpu_device_handle device,
+                                    enum amd_ip_block_type ip_type,
+                                    uint32_t ring_id,
+                                    bool user_queue,
+                                    uint32_t write_length,
+                                    amdgpu_bo_handle external_bo,
+                                    uint64_t external_bo_mc,
+                                    volatile uint32_t *external_bo_cpu);
+void cmd_context_destroy(cmd_context_t *ctx, bool destroy_external_bo);
+
+int cmd_place_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
+
+int cmd_submit_packet(cmd_context_t *ctx);
+
+int cmd_place_and_submit_packet(cmd_context_t *ctx, const cmd_packet_params_t *params);
+
+int cmd_wait_completion(cmd_context_t *ctx);
+
+int cmd_submit_write_linear(cmd_context_t *ctx, uint64_t dst_addr, uint32_t size, uint32_t data);
+
+int cmd_submit_copy_linear(cmd_context_t *ctx, uint64_t src_addr, uint64_t dst_addr, uint32_t size);
+
+int cmd_submit_atomic(cmd_context_t *ctx, uint64_t dst_addr, uint32_t data);
+
+bool cmd_ring_available(amdgpu_device_handle device,
+                        enum amd_ip_block_type ip_type,
+                       uint32_t ring_id,
+                       bool user_queue);
+
+uint32_t cmd_get_available_rings(amdgpu_device_handle device,
+                                 enum amd_ip_block_type ip_type,
+                                bool user_queue);
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------JmoPtk9DUu1CSQk0pvE0xNTz--
