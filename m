Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65001C55167
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jul 2026 20:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA3910F08B;
	Thu, 30 Jul 2026 20:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fq8rnczz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A935F10F08B
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2026 20:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785444433; x=1816980433;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xefBVa5c9AZAjprauIIMOct1lvrxJXN6+PMRk8UEQ0o=;
 b=fq8rnczzByIidMz30OXsuMv/BLcoSv8ZmdDPs5XfDxeBhZbaQ4UdZevJ
 0nAqAEuZ/ErTrFmxR0GsmLlcow4pXYGSbWrinAW9/VZyGLCjgMvRQQ6bc
 cssNTG9F/bovknF92f0KaTVFQQfYrIT7zHpalusOi/U/MovBGIUjJHpQA
 5rzMtukVmneHysVZfSB6sI+VahJZU+zanzypMgxnVp86cd4j0IGMjMtIW
 llHc3g07SAzixLvXm+nap1V5/si4L+56h7LHHkQjh8R5z8sOyOhQQwwF8
 VtKGT/Njo7T4b7HpCM9+i8yW6EHzsRKUiljt46lYbx5dCiuUdg5maUtL/ w==;
X-CSE-ConnectionGUID: q6oaJt6mSh64ceuED8ptlQ==
X-CSE-MsgGUID: dfdsMmx8TrahFge7C46ESA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97230317"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="97230317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 13:47:12 -0700
X-CSE-ConnectionGUID: rtQ6PXqLRoGhQi5uk/n46g==
X-CSE-MsgGUID: rCKMBGSkT0evzVxr6NPnGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="254080577"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 13:47:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 13:47:11 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 13:47:11 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 13:47:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQi4eKXqbHfD5zBCSFn6ZcE/H/d2S176/WsboCs+je2MxMq4XMUbaJ38KBUGXKNZu3xUX+lNbNGGX0rilG3GY/J/eoAGfl+yHcrXSIcNJuit7eRwe5hRGeStVY0zvoG8ntysSxli5FBm2fFJlXNkOORNDtKKTwFp9wxET00lWtwI33Jv07lsMa70iKL3oGql8iYfdR4VWOMBu547U76ggFH0CeIzXtKZmPxQiQpvK39OCKFj0ADE0RlhxsHx00ZSAk2uxtOXd+85Bp4syC1QczBEvlqy7/vyL6grPlYENlv4XP/gbiJEqLG8JICfAsuUkRsrd8UH1G0igYpcgO0Vug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYOCOGmGVTSLE87N/N6gElyhil3WiZIai5Fg6bFHLZs=;
 b=pMxdnNl/EKBfr8EFPsopl63VQslUokxd8yeoHjdW5r/uTIQlIooguolpBHLDhrB33Bn5acmkgwqazp11uNf4LMVBghgIiO0ADfejiFNRZThQR64hLXD5nDJ7wY2eSgqg4DBBWq0UXYv+kiz3mznI5iLsNNg5xDW/WzmFEHtt7Wj9Iays1KpWElXbKKhfKLONADHaK0vb9k3clm/0QDHo9ZLcfDeMnwxhoUoURpgni1Cl6E1NtGQdEjUIlHhCnIcQwi3ZoMVVzqk2vHUMzO8laCKCTopcCgcGbslIuRbP1DTARasIuB8Y3IjhvmbUMSMFshSb72OyeKhmE9b8p9qacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4979.namprd11.prod.outlook.com (2603:10b6:303:99::16)
 by BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Thu, 30 Jul
 2026 20:47:09 +0000
Received: from CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc]) by CO1PR11MB4979.namprd11.prod.outlook.com
 ([fe80::ed0a:e4ab:fde6:edcc%2]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 20:47:09 +0000
Message-ID: <bb88bbc7-7310-491d-b05c-b7bbc12ff964@intel.com>
Date: Thu, 30 Jul 2026 13:47:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_debugfs: add uc debugfs validation
 and read tests
To: Sobin Thomas <sobin.thomas@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20260729074130.4499-1-sobin.thomas@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260729074130.4499-1-sobin.thomas@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0155.namprd03.prod.outlook.com
 (2603:10b6:a03:338::10) To CO1PR11MB4979.namprd11.prod.outlook.com
 (2603:10b6:303:99::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4979:EE_|BL3PR11MB6508:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e36c49-8216-4338-1447-08deee7bb947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: topnqdO7/duuWg/gBW7znBxbMcGf23ccLGc3y39IP7O9CM2QuGFprIRF1368ZJOBMSSFzNBRYnXUP79roZERnLuNcHaFmtG41eTMCkETv0/jsdnLcDstlq2cQxRNz/mCWl5o21tkmsVQblxQNX2rYJFr96WzU7CJ0Z65AHmiYHgdNRCTxfumcMtTtkXWwRi62HCGvxEDotqOghHqrbIRS7Q2vMiew97v0Dy8zWGoyYyr1gbpRlmT1wWHS9zdooofU8FLwOUAa/b7Iq3tTVNt+00YBso5BiiMb9I/Q0iVDC8rUcXHvbxP2M6CHqsTZAiSKcIMJZvsJTqsh2jwvpGEg48FO8aAYMmWWvvyw/iheTkcVZyoYpIqjort7xOSWigWNWzn91dWxnoNq9i6MbKJCV+ic7pZVUgP7DDkbLgy0KHhJ/E+AOIpMvX8eMXr9zD0h8B2kGyOIweGSR7fbiltj4i/PZ4mh0WMurHWT0OuRBi46H3d1hfIbOvJ4UMjqZmkGYdOaYKFV8kudaUhdpktYUAh5WvKXZ1imJ7nMfsxtzzei+0ot8sHsZ0kg8+ScjDrU1FXHTd4qFRPTEMrj1UEFoSRi3ShFoK8FEleTgutjWpGcpMVL2AmlqK1hi3fCjpdBwF/NMvqeF1KU6w3WlJ1pvJ+quySukMCR4X3mSvLyD4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTVPWnEwcUh4U216dVRoMWQrSDlqK250ZnJsQkxRc09LTk1ydWhiYU04Kyty?=
 =?utf-8?B?T2tFUWo0bG1vWFpLZGhtM1FCemxMclhnUlBVTW43aWhSdXdGaGhOUi9NR2Ro?=
 =?utf-8?B?M0VoOFZNOWxVMnMzSjV3S1Boa2Z0b1pWWGMrU1pHVmp4RHRMMXBNc2NnRUww?=
 =?utf-8?B?TlZDNGlZV3Z5N1Z6Nkx5Q3c4NXd5YkRaS1NZQ0R5T0x4ZjlhQmNYUm9SSGw0?=
 =?utf-8?B?SFk5TC91MFVqcVZPOHRieWFER0M3Y01jakNvbXlyZHpxV2VDNnRmTVE5TjdL?=
 =?utf-8?B?TEpyMGEzN1dIZVNORElDTllSNUVva0swQjFDUnpLSUZuaXk0VmZqOVo1ZUZx?=
 =?utf-8?B?QlhMK0pPYWVFdU1mQ0hueXM1SEZXN0ViY3U3a0JqelM5QVl6dUkyV0RxbXdk?=
 =?utf-8?B?elpodDMvTlM4dWh2UkdwVGQ1ZzREd0RkdGdiL1NrSVlMTEZTRmtXb1BxWnJl?=
 =?utf-8?B?ekYwQlZnVmF4ak5xVTJVNVJ6T2NqaXlhV3BEZHNkMzJ5UlBFa0NXOW5LckNv?=
 =?utf-8?B?Y0tPVERva2FGVDZraEprZjV5U3pVTStIOXRPdWcvMG4vSi9NTExRQTlzVEFJ?=
 =?utf-8?B?SUluWEh1aUYxWXI3NkdZK21MazQxZXdab0pJQy94VHpRUzl6djJmMXJMeE1u?=
 =?utf-8?B?dFJtWFg2QWh0ek8yZTd5dzFXL2hsMmFUUzhNbFJ1Wi9KaDBLdXVwMm5UcGVm?=
 =?utf-8?B?dWM1cndOUGhvMWFnWUo5MVVlZ2Y2MGl4VWw3N20vTWNrNERhMThDS2FxN2ti?=
 =?utf-8?B?LzZjWHJJcDJTNTJaMHVWdmdHemczeUFTM0dkd1QwdXVDajZxTmNueHdZVzRu?=
 =?utf-8?B?ZkREYTh5YUVmTjhjK09UaWpPRFR4dlJBSjUvZy9KRUc4VnJ0SnBUYW5ETGQ1?=
 =?utf-8?B?TlhUcjd1UElZTUxIK0dmaUxwbThpREc0d2lubzdRNitYM0hmcmJhak5uRXkz?=
 =?utf-8?B?RWFPWERqempkdXVpMlRVeGkwSUxRaDhkWHM2eWFQUCtZNEdpZGxacG9wUW9l?=
 =?utf-8?B?OTJRR3RDWm5tNlo4L0pkUVRENmJRMENkTHpFK2VzZFB3SDZjQXlYRFFDWWlX?=
 =?utf-8?B?eE5EVmNiNXhWQWRTR2ovZTdpZ2xoYjdaOEtSczg2a1dVRlpIQU9KaENJUnRn?=
 =?utf-8?B?RE5Tam4zWjlQSzUyTHJQWVRDZk1MMks2MXF6aGVsTm9zRHZ2eG03c0RmK3hI?=
 =?utf-8?B?WXU1UC8rVWZRc2hnaU5wZGQ1c3N5Q3hKVkZSak1PVlE1WDBWQUV6cnRCOUhW?=
 =?utf-8?B?Ky8vb2VlYWh5eWRSU3NzUzl6NHl6TXgyZnRCUExZbkN3dHFxdDBmNzBzcDdu?=
 =?utf-8?B?VVBVcDZEamtsZjBHRmhZckt6azFGRnltTHZWdWZVSzJGNDZJNGVrMTdzVnZm?=
 =?utf-8?B?N1dwcVZUYVBTRVhhdjYvL0IreHIrM2J1b2NIbVhWdWtIbUJmOWt3TWdxVWtQ?=
 =?utf-8?B?dGMwbmJRVit2NUowUDY4L1FzRGZxQWsxZ0Jwc0FBdXo2ZGFNbVpmL01qRkZJ?=
 =?utf-8?B?aUVvS1pWb3N2V2Y0OFpzM0w1bjdmWjNxT0EwQndJWUNqeVlNUFl6Yi9YYUZQ?=
 =?utf-8?B?NEw0bUpZdmFCRXcvM053SkJqMEFyaHoraWV5bG5sUnFRMGJpckZDWkdsU1Jn?=
 =?utf-8?B?SGkrZlF2TXNUNHM3VEN3M2lWNDlaRUIzU0hIQ0dLanE4cklpZG1XM0dIMDhr?=
 =?utf-8?B?SlprVnlDdFJtekhkMzVVdkx2TTl0Y0dFVlFzQTdLMTF5NUtpV0J1d1hOdlZs?=
 =?utf-8?B?RTY4TjBiRkljNEwvRitNbkd3ejFiL1VXWDRPVldNMmF2ZS9yM3UzMEwxbndH?=
 =?utf-8?B?NWtaSUFxREFNRlFxVXE4QlArS0VuZE5iMTRWZ2s2a3B4Wm5nTTU1bStGR1dB?=
 =?utf-8?B?a1k2cWVFbzNjN21sYSsrQUcyVDE4K0hwWldlUGxnMlh3MmROVE5vQ1laY2Yx?=
 =?utf-8?B?aU0vY1hxMzNURVVQRVVLZlc4QjN1M1pLbzAyaGlvVHQ3Q1Zra3pDUXJSOHN2?=
 =?utf-8?B?bEtFWndFRlNJTGNKRGNQcjJYYWFOY0N3ZE1TOUVBWWJNbHJ4THRpOTkrQzBZ?=
 =?utf-8?B?OGZQQnRyNlZOQ1JpZjRhNS91QjVSRzZ4R29JZnVlQW1ZTUtUbXVUbWZEMmZz?=
 =?utf-8?B?MCtHL2VjUWJMYk1OQktYcDlRZVA3Vyt5L1IwMlRQcXF4WmhkYlgxTkI1dWtn?=
 =?utf-8?B?Skl2TFBDd2oxdGJFTnFPNW5majF6MkNxLzJjeDNPWFJxOUZOTUIwYjZQdGxN?=
 =?utf-8?B?WEcxajQrL0t1UDhMaDFFa1o2eGFydE1HbGFyNlpyV0lyYWVKVUluQVVRZ0Z0?=
 =?utf-8?B?d21nMGtnZ2xNczloT1I1WGVTUGUvdGhHTnNGUnpBTEVZbFliSWhIaWU4NEc3?=
 =?utf-8?Q?snsCD2asLCnAScAE=3D?=
X-Exchange-RoutingPolicyChecked: miysbtVbn4aU/LCFEGCficpB8DzQ5WHL3bRjD7sAlPTSMjjvmIsnXkPfjeapQpDEcoRtB+aByLYC1y/AhG6+n+UI1GEClQjPzL2u2Ghw3jaFAwmu5s1wJjJQhWb98rORer5/rMKp1Al9v8RWBcLaH/yBYmbWTw9MPeIalpn2EAdXKK/Z/K5YY0e6K7ZozWK1BVMaE3GShyVOWE5f4dbM6J2RpCTDoYRKo7pmzM5UVIPm4g8sETy5HjQvLilx0pb8gb1iBZjHnYCZi+S0aaqJkXYdzFBFCaCgNnJKSlYRTEIVwvRJsLHikcGfqtMCiRS3IDb3AOG3sAIFpL7o+24M9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e36c49-8216-4338-1447-08deee7bb947
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 20:47:09.1334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S+It3eeytobS09bYWuC/l5GuWxvDqnTlyyy4Uz4DIxrYEdJ8qpkyXCY4ohojI89jTWsVIk+ur6QitnVPsD+S98n3MTwroVth9RxR2qm19b0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6508
X-OriginatorOrg: intel.com
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



On 7/29/2026 12:41 AM, Sobin Thomas wrote:
> Add coverage for GT-specific uc debugfs entries by introducing a new
> uc-info-read subtest that validates the presence of required files in the
> GT debugfs hierarchy. The test currently verifies the existence of
> the following debugfs nodes:
>
>    - uc/gsc_info
>    - uc/huc_info
>    - uc/guc_info
>    - uc/guc_pc
>
> These additions improve validation of Xe GT debugfs interfaces and
> provide basic functional coverage for the GSC information debugfs node.
>
> v2: Add support for guc and huc info (Daniele)
> v3: Added checks for the device nodes.
> v4: Consolidated the calls into single test_uc_info_read subtest
> v5: Fixed mandatory and optional logs and access check
>      is done using igt_sysfs_has_attr. (Daniele)
>      Fixed subject nits. (Kamil)
>
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

> ---
>   tests/intel/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 70 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index da482157e..5c045b04f 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -16,6 +16,18 @@ struct {
>   	bool warn_on_not_hit;
>   } opt = { 0 };
>   
> +struct uc_info_node {
> +	const char *node;
> +	bool mandatory;
> +};
> +
> +static const struct uc_info_node uc_info_nodes[] = {
> +	{ "uc/gsc_info", false },
> +	{ "uc/huc_info", false },
> +	{ "uc/guc_info", true },
> +	{ "uc/guc_pc",   true },
> +};
> +
>   /**
>    * TEST: Xe debugfs test
>    * Description: Xe-specific debugfs tests. These are complementary to the
> @@ -595,6 +607,56 @@ static void check_gt_reg_sr(int fd, int gt)
>   	igt_assert_eq(problems, 0);
>   }
>   
> +/**
> + * SUBTEST: uc-info-read
> + * Description: This is for reading the uc device nodes.
> + */
> +static void test_uc_info_read(struct xe_device *xe_dev, unsigned int gt)
> +{
> +	int debugfs_fd = igt_debugfs_gt_dir(xe_dev->fd, gt);
> +	int i;
> +	int fail_count = 0;
> +
> +	igt_skip_on_f(debugfs_fd < 0, "Failed to open debugfs directory\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(uc_info_nodes); i++) {
> +		const char *node = uc_info_nodes[i].node;
> +		bool mandatory = uc_info_nodes[i].mandatory;
> +		char *buf;
> +
> +		if (!igt_sysfs_has_attr(debugfs_fd, node)) {
> +			if (mandatory)
> +				fail_count++;
> +			igt_info("%s debugfs node not present on GT-%u\n", node, gt);
> +			continue;
> +		}
> +		buf = igt_sysfs_get(debugfs_fd, node);
> +		if (!buf) {
> +			if (mandatory)
> +				fail_count++;
> +
> +			igt_info("Failed to read %s %s debugfs file on GT-%u\n",
> +				 mandatory ? "mandatory" : "optional", node, gt);
> +			continue;
> +		}
> +
> +		if (buf[0] == '\0') {
> +			free(buf);
> +			if (mandatory)
> +				fail_count++;
> +			igt_info("%s %s debugfs file is empty on GT-%u\n",
> +				 mandatory ? "mandatory" : "optional", node, gt);
> +			continue;
> +		}
> +		igt_info("GT-%u: successfully read %s (%zu bytes)\n", gt, node, strlen(buf));
> +		free(buf);
> +	}
> +	close(debugfs_fd);
> +	igt_fail_on_f(fail_count > 0,
> +		      "%d mandatory debugfs node(s) failed (missing/unreadable/empty) on GT-%u\n",
> +		      fail_count, gt);
> +}
> +
>   const char *help_str =
>   	"  --warn-not-hit|--w\tWarn about devfs nodes that have no tests";
>   
> @@ -619,8 +681,9 @@ static int opt_handler(int option, int option_index, void *input)
>   int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   {
>   	struct xe_device *xe_dev;
> +	int fd = -1;
> +	unsigned int gt;
>   	unsigned int t;
> -	int fd = -1, gt;
>   
>   	igt_fixture() {
>   		fd = drm_open_driver_master(DRIVER_XE);
> @@ -648,6 +711,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
>   			igt_dynamic_f("gt%d", gt)
>   				check_gt_reg_sr(fd, gt);
>   
> +	igt_describe("Verify that uC debugfs info nodes are present and readable.");
> +	igt_subtest_with_dynamic("uc-info-read")
> +		xe_for_each_gt(fd, gt)
> +			igt_dynamic_f("gt%d", gt)
> +				test_uc_info_read(xe_dev, gt);
> +
>   	igt_fixture() {
>   		drm_close_driver(fd);
>   	}

