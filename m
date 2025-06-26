Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 998F2C7EE30
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 22:18:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552C810E913;
	Thu, 26 Jun 2025 22:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vm9M0CSU";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE71A10E91F
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 22:18:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eCojPk8E8nnIshqf/AUhJBa+PN0AjrWaeaMIblQRwVj13aY6FkKfpxQ7L0JnZKQibz/pG+pA7JukprfHUMYWOdwJqlgNLkDXysBk4UqtxIxdjfwwm1g/RHIR4KjvU1PWzDFq/zsQluDmnLj3vzdErkQ55bd6osoXk2rR0amnEpInORPPxQp/Fz7qoyvPfCSv0TsN4rYBUhAm4notDpuZgukfcITYcTSeUT8PknwuR90NfR4vW3vhRjaA//F176t9Jp/0o3Tk3DkOQsb5jHezJprXk80N8qmkzJJ0W4bDq+CaNjXgH5J9GNWo3RANJ7aNRiiBTZS2uIrR2UWjjeUfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BS348VkCuurq03jo3cqXMshrbiqthIKft56kkYni2Xo=;
 b=x0QY6z3vl6tygpM0E/omVvbuPI3ajj37Bpy8okcGoaB3J7xiUCfJj6YS+mei0a1LMCZB9NJ4irnv7nJvvc7Qy1kO4FB5A85EcNycwcND5KU3Dkvh2YhL8EanbBNEtz1fILeJw6CwYCdsqIWXyi+/3dnHpF72vU+E8G6ptX41H8Bk9XtKtS5LvLcTu2H978IGkwjje8D3gQsK2WD2IaOs76N0oxjxV8y8KaAU15/nSNnlMI8s8L7m0sXXoerWoiqiyAXltQU2G17F4rc9p4dszpCLdvtj/dPX2BhdvFmslrVqPBngx49S+xbq65kMenyD9D60QNHIqb341A7/VaK20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BS348VkCuurq03jo3cqXMshrbiqthIKft56kkYni2Xo=;
 b=vm9M0CSUnocaATTw+dOll3AgtNDTprMpjmJKjRey8XDeiTIDT/Z6epYu1JVUv7g+3FVDcmvwtcDVuy4zud+OIY8zNjwgxbu2zlw4Nmz652z2EMy2iWWiBjNklPFAo/bNI6zd1p7IKAqv/MRXfIZBmGxcUCnJEVmrAWnX3YjpGvo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by IA0PR12MB8693.namprd12.prod.outlook.com (2603:10b6:208:48e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 22:18:50 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8857.026; Thu, 26 Jun 2025
 22:18:50 +0000
Message-ID: <172f4dff-1f05-416c-b285-1cad5f6f670a@amd.com>
Date: Thu, 26 Jun 2025 18:18:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu: Add user queue test control via
 environment variable
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250626060118.3641808-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250626060118.3641808-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0052.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::7) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|IA0PR12MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: 414a21ec-71f2-4507-7d1c-08ddb4ff6d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2FVTFZNWk5SREczVW1qc0dpeS9FczR1NUMrTi9jQjZvTjN3MmZzK2syUC9h?=
 =?utf-8?B?N25kV1MvNXJuM2dhT0NtYzhpTjh3QkNoQ2RoTDlUSEpCN0RyU2VseHI5bkZU?=
 =?utf-8?B?c3gzR3dvV09iY2ZuRTZuVXJHQk44SVRqbFB6L0xqa3Brejc3MVZzWU9PUTJO?=
 =?utf-8?B?RVViUUNWZGlOMEFUaDZNZXFNTTZXMUFFYjZBRXllekhjL25COTlmSlhSRE1M?=
 =?utf-8?B?ays5R01RTGw5V1c1dWdxZEJudmlITy9OWEp2M0dXTmh0WUhkLzNkWE1NeFJH?=
 =?utf-8?B?eTRuVHkxMTZ0N2M4TWdzWW1nbWFEdW1INU1ESDZEWlhiL2lCYkdxZDQ1Z0xY?=
 =?utf-8?B?N1lNQUpHeWlUOFU4US9MZTdXRTNIVzNDQU4ySGg3Rmk2WUpSdytvYnFmRjg3?=
 =?utf-8?B?S2NzYVU3OUxpaUh4bTZpQ1UzRWg5Z2FtdW00QkNGSEd1dEFodHlBWlZzdDVw?=
 =?utf-8?B?YUEzdlU4QVRJcC9wOUc5a1l6TkJBM1FlQzNUUnBvRWVUMTM5eFRxbTc1Rnlk?=
 =?utf-8?B?SXB0a0wzYmZZa2Q0YjZEOC9aK1dMVWk5d1g5M21TS0t6aGxweGtwNXA5bG45?=
 =?utf-8?B?S2o4V0VlT3JIZ012VWp0UjFiYXovY1V2aDUwV3psVm4wL3kya0QrbmRBcjJW?=
 =?utf-8?B?cTZxTjFWM3pjOThJM2drQmVLOWxhQTJycDdVUWVFZ09RczNyaDJ6T1pwK0NN?=
 =?utf-8?B?aWNFdmIxSkQxTkhiN3FGd2kwamMzb25LV2xocWpxamgyMEorbmJpRUN2RHQ0?=
 =?utf-8?B?bGlkenl0R0wvSGtRdWtkNUVNQkM1UmVGWStJT1QyZ3djVzB6TmhLdWc0cm1C?=
 =?utf-8?B?M2R1VWFtOFVQMEYwRTNHRlJ6eUZxRUdIazlwT01Ic2dra3FvRnkyY25hRGt1?=
 =?utf-8?B?bVA4NXVXc0U5VXovd01BTVRMZ1QrRU1MbnorYUh4UWpQcVVCYXhwSnRJeXN0?=
 =?utf-8?B?dC83dzRjQzROT0Z3NUhwcEhDTXNDR2g4ZnBOT1I3b2srNTFwOURqdW5lMjdm?=
 =?utf-8?B?ZW5yeGo1c25SR3FmVHBJQ09vVXB3ZG9jUTd1cDJrNFkxQ0o4MFdTN2hCQml1?=
 =?utf-8?B?a2c0eDVIZ3V6T3ZrTElFb3pGR1dNYWJGYlZwUkY4NzQxR3pkMmpsaE0xQWcy?=
 =?utf-8?B?Vm90bGljY2paR2NnOTRaNUpXWk5LdUtwSGwvVnYydmlxRENEN0F0R2doUVZ4?=
 =?utf-8?B?dUc3SmI1VUF5dTRJWkM2bEpEZ3FtRzRNUVdxcjgvdGpaV0wybGJMNGoycDZ0?=
 =?utf-8?B?T1BWZWVMYUhyLzlLWHFkalc3a3Mxb0ZBNVFvWUhWdGxwVGUxRXNTcktUa2xU?=
 =?utf-8?B?RURFRlBuVkNPUERraHB4UDdIVEVDcU1XZkU4ZFU5a2wyVFlLeHVhR042TFds?=
 =?utf-8?B?TGVOOHVyZDJORGtzeWtweFVaRHdib2RmaTkrSjMwUG16eUx4ekthZHY1T1I1?=
 =?utf-8?B?WVZrMllYcDNBbkdUL2llMjNRZURXb09CRllDTXNkK2NJWGRPTnBqYVZDZkZj?=
 =?utf-8?B?d1pVYWxUb25YZTlmcnlpVm1FOTZoWFRIZHp5alpDMmFxN2haeG0xZkIvQ1hv?=
 =?utf-8?B?LzROOUFRNk1CeTNISGNwME5Pb3J4WG11SWw5NzdxMFBGOEZpM2V3cyt0ZVhm?=
 =?utf-8?B?d0NYQW1Ja2Q0RjhHK0xkTDRUOUtUVVdhQjNrRDYzSk1pcy9wZU0rNGZQMkxm?=
 =?utf-8?B?VVNlUy9PMWpiWkZaalJaeWZUV01wUmxTaWRTU1VpWlk2MmU1dXcrVG1OeHl5?=
 =?utf-8?B?VTRoSGVnZ0N0Zm5hYndOYnQ0M2VFRFJTTzRKU1MyWC9vbDNNOTZoclZVV1Fi?=
 =?utf-8?B?NFlpaTcyNWFBcUo0TldYMkJ1ek95TkZqMFM0UFBlQ013NDlzVHB1bW9IN0tl?=
 =?utf-8?B?Y2EwaGgrdjdWNi9SVnZPUDl6eHh1dkNEMGl5eEFpbUxmUkxyN1ZEbEdxTUtI?=
 =?utf-8?Q?ACDMuP7QI14=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFkxbmp3bWVRNkVITnRkTlFERUMrZTJ2eUZsNnVqcy9xZ2VsZllQQ2dQTVg3?=
 =?utf-8?B?NGFIbnJKUEtld0xWRzJwTVJ6NVJKTzVpVnJzSG94ZTc5NEFvY25Zc09ueXZM?=
 =?utf-8?B?RDhSdlhRU3hDcHB0Ym43OTRLK0ovRTVqZFV6c2FZZFpYYlptOXFkY3FvY09H?=
 =?utf-8?B?a281S3R0bTMzSEtXZXhXcnh3WXhKUVZnOS9KdC9SM3JwTlBCdDVYUG4wbWJs?=
 =?utf-8?B?eXRrbDBzVTVNOEhzcWJLeXA1VFNPck91VWE0OGduN21XTHZPeEpCbHFFQ1ZR?=
 =?utf-8?B?cEk1ZTdXMjlNT3NnVkN4UkR1TENLVFlpSno1T0RBbG9nTjZTQUJkSTljOHZk?=
 =?utf-8?B?azlic2EyVnkreFlIVm0xaWZLNkZlck5MWmJOcnVCUURWRXk1UmNhVFpFZytV?=
 =?utf-8?B?Sjh6cU9QN0wvK3ZYb3hndnVUblFXYjF1a1EzVHAwL0VuNkkvM0RETXRHMkhJ?=
 =?utf-8?B?YU9pUWdXWG5SU2tCVzNmNjRJUCtrSXNjLzdKeEllR0hLblZWVTBBT1dhY2hJ?=
 =?utf-8?B?UW1KVGdoU1RmWjdXcG1hUVRhaUNpNmZFUTNPRUlVa2Q1ZGJ3OXBKVi9pMUM0?=
 =?utf-8?B?WjdpRXJMUzViQXBxRE94WnpTbjBjMUpHTDQzVTlnajMwMUhsSmhGdnNva0Vr?=
 =?utf-8?B?K1F3Qnh5SFMzMEFZQzFEOTQ5Rm1EM0hKV3RiL2lYTVgxNFkrVkphM2ZYcEFn?=
 =?utf-8?B?UDBqbjZlSHFsdVlPT09pcTVtUi9uNUJ0ekJRNHhvRHUreWFQMStDYTJQdlZn?=
 =?utf-8?B?ZTA1L05tMU81MVZsQlY1KzZQbHFMYnQyYzlDM3N1Y1RyR0NJVk9LSEFGMWdR?=
 =?utf-8?B?enF2eUZrVmEwTUtQNmplUmd3blhibHQ4bDBnemdaUWJtS0dVbERNM0s3ZFFo?=
 =?utf-8?B?RXZTQzF3RjJOQkkvZ3JhcHN6eXYrd1NiUDQxWmVVSUhqWlZzQmRIVC8wRUNB?=
 =?utf-8?B?NHhwaTBIUTJwU2hHTFNNd1UzV0FLSFhNc3pacmd1dVY5SVVhYnJpYXp1Snl0?=
 =?utf-8?B?a1Q3SzJSMVlUOXUrZ3YvOHZJd210cTJCdDh1aHlaOXRoZ0lVK0ZuaitFUVFT?=
 =?utf-8?B?a2s4ZFY4S1lBSkJ3dm5ubnNVWHU3UmEyLytEVzdQdjBJaTB1VnVnaVNCeFdZ?=
 =?utf-8?B?SlB2anVqOHR6b3ZuWm1SbXMzd0ttRUgrUDRtbk4zVnEybjRBZWl5RWRDTEpW?=
 =?utf-8?B?b2xqSHI5NXdtUTR6aXpzYkU5aWRocG5qdi9LODJJODJPeVhVbjgvM0xRMjNj?=
 =?utf-8?B?cnI1VVdZbnpjWmdWc1BQT3VmSzJtZHBjR3pHZXBjc0t2U0U1bTA1dGJmNXpn?=
 =?utf-8?B?bTRZL2JYekZNOTVwclY2cjlIN0VnK0N4VG5qZkhlV044dm9lb3BBWHZuYzlX?=
 =?utf-8?B?WnB0VWZ3alovcG82Y2dkaDRoQ3RoT2RsRVlrSDJjSERxNFRqb3h5Nlh6SGR4?=
 =?utf-8?B?SnQzTGpiN2lmMkxtTURWM0M0UDU2U1RDUEpmWjBVRTM5emREekFjc3pLTlNo?=
 =?utf-8?B?T2o3ZnlPY0M4NEJvSVRnYVg1WFVCZGtBQVpycmw3aVRJLzhqNFZ2Z0Izb0dL?=
 =?utf-8?B?WGUzYVBFV0pwSTVsb0VZZERLcE95NWNXNURKVWxsTkdKSWM3cURvZVMvd09M?=
 =?utf-8?B?NGJkendISHpKMTZYNEdLS3R3bVN5NTJ2TFk3SUdVZndJT0gyZFVDdDU0SnRw?=
 =?utf-8?B?cWR1azZ2aW95dytLSDJrTzFienR5Vk52NjI0UnZMK0NiQXdmejNNYWhlaDds?=
 =?utf-8?B?bXBkZXU3cXZNdG9Wbm1XN1l2MkhnN1BvbUxDdUJzQlcwdHZMWUxJN1VuaWRX?=
 =?utf-8?B?ajkrNkZaZzdSRjJSZk1mQ1luNGR5Rk1NOHVjMjJVVnpSL3VjaTFHOExFTWtW?=
 =?utf-8?B?TXNwRUROK2E0c2RvT21keWtmb0IzTmQ0RzNBTVhkYVdtZ05wQ3hqeVB6TnYr?=
 =?utf-8?B?eVg3eW9Ib3FlUm5pS3liYm5tODZLV0tGQ3lvcHErSzdVYkd1T29NcXg0ay9S?=
 =?utf-8?B?QnhhZVVxSzhjUVI3OHNvT3h4V0FCb3NwMko3WVZScjhzNnlFdXN1eE1aS3VD?=
 =?utf-8?B?MUNsbEQ1NHlMa2w1SFZtNE03S2hjeGlMSWVkalQvdDUyL0JJYWx4Qm1Yclg2?=
 =?utf-8?Q?t7BbVX76IgwAnPk/o+neWlxos?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414a21ec-71f2-4507-7d1c-08ddb4ff6d2f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 22:18:50.0173 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: izHKddoZOiqHsjoVTlZhioG4jqZg2eC4WU36oUIY5MYC6WmqqXjWLLIpUPGgISD4Nbeh6SG1Rld7ykxzVSK+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8693
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

Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

On 2025-06-26 02:01, Jesse.Zhang wrote:
> - Add environment variable check 'AMDGPU_DISABLE_USERQTEST' to control
>   user queue test execution
> - Only run SDMA with UMQ test when both enabled via the flag and
>   hardware supports it (userq_arr_cap[AMD_IP_DMA])
> - Helps disable user queue tests when needed while keeping other tests
>   active
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_basic.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
> index 39690419c..9eb5c7599 100644
> --- a/tests/amdgpu/amd_basic.c
> +++ b/tests/amdgpu/amd_basic.c
> @@ -700,6 +700,12 @@ igt_main
>  	int r;
>  	bool arr_cap[AMD_IP_MAX] = {0};
>  	bool userq_arr_cap[AMD_IP_MAX] = {0};
> +#ifdef AMDGPU_USERQ_ENABLED
> +	bool enable_test;
> +	const char *env = getenv("AMDGPU_DISABLE_USERQTEST");
> +
> +	enable_test = env && atoi(env);
> +#endif
>  
>  	igt_fixture {
>  		uint32_t major, minor;
> @@ -820,7 +826,7 @@ igt_main
>  
>  	igt_describe("Check-DMA-CS-for-every-available-ring-works-for-write-const-fill-copy-operation");
>  	igt_subtest_with_dynamic("cs-sdma-with-IP-DMA-UMQ") {
> -		if (userq_arr_cap[AMD_IP_DMA]) {
> +		if (enable_test && userq_arr_cap[AMD_IP_DMA]) {
>  			igt_dynamic_f("cs-sdma-with-umq")
>  			amdgpu_command_submission_sdma(device, true);
>  		}
