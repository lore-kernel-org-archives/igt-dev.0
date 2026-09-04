Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E25AC79F80
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 06:25:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8628110F87A;
	Fri,  4 Sep 2026 06:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FC2Ct6cz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5436F10F87A
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 06:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788503097; x=1820039097;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oKsTPokBf2xZ+GaVzPU/qrY4QZ058BmvLxR2sE2Nsi0=;
 b=FC2Ct6czLm961O5QQh56uZzubhycHGkJvHkQaBBynx2bi6ejAlnr/gHT
 DAXR/4B28RlQzXwqRXcwBFrySDO2y0wJGV3Ap9AzcvsJIEIw99E2QXZ9M
 cFOgazF6+MnyRY4IXOHxG0OSlXJ1lJth+uGtojWGpuRC3aN+xqEZ5qEbJ
 oDD/hCEjMzz8b/wzcFkC74vNOd28WbU8gZFiPsDBEmokulpK6SbcyJgd3
 z7aJmrexuViRPddkasAmssoQlZe5MxDNIusGL7GRpNC40lPjXXtsJZWqX
 uRA3ei4QFfA9wDf1e494TJQNPdyoff2+ATpL8xICrdHwGKDRhbCjR50+Z A==;
X-CSE-ConnectionGUID: tGU9Qc1YQby+g1PFWBFutg==
X-CSE-MsgGUID: 814/9sOrS86UbXArNnfYZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="100158843"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="100158843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 23:24:57 -0700
X-CSE-ConnectionGUID: 4rd6wgL6RJ6OHTC0HVsyDg==
X-CSE-MsgGUID: R9jcbRLkRj2t4K/ob7PICg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="266277381"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 23:24:57 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 23:24:56 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 23:24:56 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 23:24:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eGNSbhuXKrwKuLOM0J9uLy2/1sj2F3CkaEytuwO7fOq/3ee5XRgg6qK0HjzdyU93FmAk6PxiEkz0A+ff2WCCpgCuobwXtg0xjb6SmlmN8DozIlKD+DmwXROQQGS6xIdpESJt3z7+Cmelr0mcvbDwXOVm4C3SGAimbevps9tYkNtvPHFG0bQsMKEvai8lsUtc5PByD2JciMs0G63LbeM9nzZhjUuU5/lT6sxZoLuy3Mxp7kg4swX1d9KE871rAjJric1hm3SAWwrhgQS1YCfjUvBL9AuE3QeCkKxbDsOrEWPCo9/Dd/Wc4xUvq0+21BsUSSWD52NPvvOpb3vLvBGLjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIkpy2kz195Vwyt77Fro3Kt6kMoXfwPue+LPz26mJ68=;
 b=Ywo1SeF6PqIIq4nd7V5fhziBgzsx93gTCeKYehZ0ZxqLCaEMhfi6OPr7pqyvB2Tgrvrj+Z7vBIxLku4UUoWYIxwf+NjdUTZQVZdMkdrE6+xuzdFZ77r5YQt2BSuz/8pTo8mhA1/fNBaIbtPtlSHs8RXh/Iu4mFSfn3qq1aFvxo/OvEUGR9w4toG4jslSSLHvQ4mYqD8kNmzdiVLMvfxPOZgqP/ynItL/vEWl/aNuhxlDNigAl/xruW+BkVL7DNWeHEsEX7CrdOZ0jtkBE1Jvu6ovqPA89uRHn/9OWcJsF1A5LvW0++z0w4D53606g7EodFJG7uq0NQBmRj2e5jbSDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6115.namprd11.prod.outlook.com (2603:10b6:930:2c::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.13; Fri, 4 Sep 2026 06:24:54 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 06:24:54 +0000
Message-ID: <1b4d63c3-bef7-4576-9947-49931878353c@intel.com>
Date: Fri, 4 Sep 2026 11:54:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/intel/xe_ras: Add test for GPU health
 indicator
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <badal.nilawar@intel.com>, <kamil.konieczny@intel.com>,
 <sk.anirban@intel.com>, <raag.jadav@intel.com>
CC: <anshuman.gupta@intel.com>
References: <20260902025813.1795134-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260902025813.1795134-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: f8426ca7-6cb0-4d3e-36f0-08df0a4d3b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|11063799006|10067099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: FFF0+pkyYBvFhYJc7UV7/U517Pmcgipjv+KjuOB/DmyOq7H+QSm7pKpwReEjwhE8taVxye7mTu4gQ5TSX6Eu4a31fHOSblRYTARWUDqYT+SHyUh638vEjQfwFVLkvI4T1p2Dv29t6QUnFBfobyiiA91p+dPlXyxwVq/NoED8fDtcmCg0riASvHsVhF9mzK2F5ltuOQ41nIDpP0Ro1ECqSzRd1H4kMWhrDgNrcMxvmhnFdWaV/PiG75eHftPtbo98s7wbyRYCYu4g2LUbu6Y2BVsspbR/hzHNP51v78lsr3/lN0bL4TTo3GKHI9Kz8IFshEPM22KIaHab2GMbgDYnaGwjLpnbA/gW36sIVW5C+dkHc7LyqiDalJaxYINjLmC3PNdTWinNRThycqS2hxJPfLrwU2Egp5sZ22U0qZT/4vSsNnbkf+lE1TwOB+WQDhnamJDHy6QKo5kqHTwYsDmODSDqqtVMlPnHNcRTiq0TUF46wlTZ3+PZ52h91sQOwlNcKoD+TbnoP8gcvD5+snH0rNQmoYezsfSlMWNkdLQLCy4AH1khIKm0w8FbTByZfF67hqxLsaH/x0aPtsIO+heJIsv04dzEn82E1PaubpLKhRQ3e2se4IOXZY78j70UglzV3oervCGR5rjEtgBLqp9ZL3ecncwJ91gplXMdBMlh8zg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(11063799006)(10067099003)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alBMRWZjQklOVDF5VXVTRzZ5dmh3ZVhieTN5TXQramFmc1l0aUZqbjJWZzRR?=
 =?utf-8?B?V2JQRFAzNlZBRkhBMjZrenFCNWxWOGJTdW5rSjFLU0tUbGJHQ2t5d1lKMXp0?=
 =?utf-8?B?TC96bS96eWJ6Q3FyWU5qdDdHUDBuOHU3aU5UMDY3SDhmMXo5cm9RK29qRHdo?=
 =?utf-8?B?cTFkVzBxVjduWmhIOUkzT1hKWG5iUzFuZnpzZS92aTlzaEhIRUJBSVV6TVJX?=
 =?utf-8?B?YVNyR0tBcnkyQVdGclZMT25JNkFHbkV0VzA4NDNtZjZVcjQ0clczV3dPVHJG?=
 =?utf-8?B?cWVhY2YyM2FYcTJXdkNqcWNRNk4wMjNlTnk5TEdTV2RUTVkrempreVlLOTB6?=
 =?utf-8?B?UVAzYUdnaWhPV2xQbE8yR3BTNE02NDkzWXV4akhxbVZVK2dyZEhpcUJHQTVw?=
 =?utf-8?B?TEd6SDNZQUJuS1NhbEVLMmQrb1VzVHdyNVFKaWk0RURhbHBjZVF2QkFLYlNP?=
 =?utf-8?B?Z3NlOVlrTEtjTUdmZmoyZlJDbVgrbWJ0N3Erbkx0Y1l1dEowSkJFb2RPMGVi?=
 =?utf-8?B?TlNWVW5VampYUk40ajkyc015RWRxejlwdmo3SzlLYktDbWRCTnlIY0FnYW1G?=
 =?utf-8?B?cVVUR3pUaFd2eTBvSnZxNndMQ0haNVFxM1h4ZnVDcTlQbnR5aDJBcllLU2t1?=
 =?utf-8?B?aFZNMGU3OVBRNUF4U0dESWhZSXRTeDF3dEppVStucmgxWEF3aHhkK242VXAy?=
 =?utf-8?B?am04MXFtcjZvNXhNUnJ0Z0Rpa0grcW9nMnZKSjhIMDBzOC8yVTFablFZT1lz?=
 =?utf-8?B?ekZzcStaT0dSdjFjOFpUZVVqWHhoUTJSRzFVbjZwQ1FhTXBINzhyT0c4eUR0?=
 =?utf-8?B?NktoKzdQSUlrMktsbDJkdE1EK29iMnU2ZnhVZzdPbERWd1VLMVFaaXNEU1Nk?=
 =?utf-8?B?UjNlT1AvTDVOSUkrUVo2M3pnMDU2a2ZSb25DRmRqSlkvbHhtWERMcXUzVWVB?=
 =?utf-8?B?bGhIbFJwODFlRkgzWW5kelkwNm1aTlRFdzN0WE5xN2xUOVZJQmxiYms3U21p?=
 =?utf-8?B?SDRsYVVIelU1ZGZvUXhNQUEwRUpzTDhzMThSRkE1S1RMWGFGUWRjUkJjT3pM?=
 =?utf-8?B?MU9RYUxSTERXMW5NcEEyL0tKYW92RkdrK3dUS3psQTIzb3dqbXhwWGczMzNh?=
 =?utf-8?B?dlRUQk5DSWJWQSs3bWxpWEhxZzNSSXZtUHJWS0w1VitaYlN3VDFNSGJmdHY3?=
 =?utf-8?B?TU9URlY1ZU03UU16NHRZZVg1MHFmUmdmOEkzQlBoVVpscXNnUG1nQzlxWnk0?=
 =?utf-8?B?M0gvbks3cDFicDBWSTNnTVFHa0JZOTR0NHQyMGh4L0pESlJQL2JkUkM1bi8x?=
 =?utf-8?B?RTRST3N0WW1GMzAyRFJ3T0s4Y29FaTF5Rmh4WmtmOW5TYnJ4TnFNTXFWUi9W?=
 =?utf-8?B?OGtqYUlwZzdBZXRUSzFQVElscjNwc2tqNGpaYjJFa3MzSy9JOG5XT0tuWWJH?=
 =?utf-8?B?dndaYjZOSVV4dU9uY3A3K1pqb0VoSk9TOEJHcXh4aThSdDg1b2Y1TC9zK0cw?=
 =?utf-8?B?M081dU53YlQyRTdzRzBCNk9sWXJjK0RBS3BRS2NFRW15aGxaRExoVUJCNzJp?=
 =?utf-8?B?R2VaNjZsWWtaU2ZDcGw4OG1vUVZvaUtGejRzZGs4TkVJdk85UnFiTkQvR2xN?=
 =?utf-8?B?bXhJa0ZMV0Q1b0EwdkR5aTkvQ01EckNUcURiVDR4UHNGUktLcUZlVjZVbGt2?=
 =?utf-8?B?WVNKK2ZCWGJJemhDRkhyODZjeVFrQ09mem9VbFVoS0pnQlM5RUJpNHZva2Ev?=
 =?utf-8?B?bkY5Tkw2WVFPTlR6aG5xQ3lSRWdrWlplZ3crdWswZW5VWWErRXZrZkJRQytR?=
 =?utf-8?B?RmtVZkNDSlBkQ3BSTSs2U2NHWDdNV0Ftamh3c0dCWE5rWjJIRGR0QjRraldJ?=
 =?utf-8?B?cDBFWWlJMUh0bTBwZW1Zbk1FMmRteG83K1k5SSsxS3BFTVBjV29WRmVrVStl?=
 =?utf-8?B?Si9qSllJaTZEWkJ6OW1TUER2SE1XQjBLV3NYYVFuYjZSbGFEeitkK2JzZXFw?=
 =?utf-8?B?ajIwcFp5dkEza0w2Yi9JWW1yNTU2U1FxdEY2OFNYSTUzaENxUElxazN1WlFl?=
 =?utf-8?B?RWVpMEQ4R21YS3BUeVZ1RFl3SGxwdVBWNFdiYWtxZDluSmFjK1VNL25GZUw1?=
 =?utf-8?B?am1pTTRwOXg2RTZDdEdOMGNRankyWDBWTmd0d3NrY0JmWEtlNUNrNTNCcWxu?=
 =?utf-8?B?aWV6eVJqTzdDOTEvcDU0VVVRQk5iLzJaK3R0YmIvTlBhOXJMMWdUWi9mR2sz?=
 =?utf-8?B?elhMZ0RZdy9ydDRqeGVHZkMxbHFxcjFIYkxhS2lXRW1sWnhoaHlSdkYybmZZ?=
 =?utf-8?B?ZjNrY3JmQWVmT0hmMDh2akN1WGw5RmhlOXhJUFRzS1U0RWdWQUp5UT09?=
X-Exchange-RoutingPolicyChecked: MEyy72YIrehSo38sUObeHcr/mrAAVOGf2IC73ZfJKeDx78dR4BcgbwV7xTAuEOwZ6NhqAG5Wvkbq1vvNlxOEV46vZaM4gHLdvscjQe+oPzV38gz6Avv1dK+Qsw3PLv2/XcqaQkLApaIuVNGGAst6KOidoZWnh/wHx/puHnJtxabnBCyRMFRRfvbXjQJTeCisgDKhC1pCjFlxBYfGRtl4snoGtgMRQDWeOacSNKdbn2NL/RVv7gLEZnqrRjGEUJijzCh7K3OgK4scCVsM1OmzYU83/F3twuFCcN6vR0LDxy9IYRHAtzl46colfHonjjnwPcnET9zgQZioWrCC0MeAGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: f8426ca7-6cb0-4d3e-36f0-08df0a4d3b5c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 06:24:53.8763 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xJE4OKNyYmBfdawyRt9KQRajpxS8heWZfpFiT9TpiR/Gi+tYbp7KYuh7Hf9NuT33bpsVns+W9viJbmXGFQ/apg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6115
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


On 02-09-2026 08:28, Soham Purkait wrote:
> Add a new Xe RAS test exercising the gpu_health sysfs attribute
> exposed by the Xe driver on platforms that provide the system
> controller. The attribute reports and allows updating the GPU
> health state.
>
> The gpu-health subtest validates each valid state by writing it
> and reading the value back, and checks that invalid writes are
> rejected with -EINVAL, guarding against regressions in the
> implementation.
>
> v1:
>   - Platform-conditional skip w/o fd leak. (Anirban)
>   - Restore via exit handler. (Anirban)
>
> v2:
>   - Remove dead-code and extra comments. (Anirban)
>   - Initialize exit handler under igt_subtest. (Anirban)
>
> v3:
>   - Move igt_info to the normal cleanup path when
>     restoring gpu_health. (Anirban)
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> Reviewed-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_ras.c | 131 +++++++++++++++++++++++++++++++++++++++++++
>   tests/meson.build    |   1 +
>   2 files changed, 132 insertions(+)
>   create mode 100644 tests/intel/xe_ras.c
>
> diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> new file mode 100644
> index 000000000..f3b507ce0
> --- /dev/null
> +++ b/tests/intel/xe_ras.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <errno.h>
> +#include <string.h>
> +#include <unistd.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * TEST: Test Xe RAS (Reliability, Availability, Serviceability) functionality
> + * Category: Core
> + * Mega feature: RAS
> + * Sub-category: RAS tests
> + * Functionality: ras
> + * Test category: Functional tests
> + *
> + * SUBTEST: gpu-health
> + * Description: Verify the gpu_health sysfs attribute accepts each valid
> + *		state (ok/warning/critical) and rejects invalid writes
> + *		with EINVAL.
> + */
> +
> +IGT_TEST_DESCRIPTION("Tests for Xe RAS");
> +
> +#define GPU_HEALTH_ATTR	"device/gpu_health"
> +
> +static const char * const gpu_health_states[] = {
> +	"ok",
> +	"warning",
> +	"critical",
> +};
> +
> +static struct {
> +	int sys_fd;
> +	char *orig_health;
> +} gpu_health_ctx = { .sys_fd = -1 };
> +
> +static void restore_gpu_health(int sig)
> +{
> +	if (gpu_health_ctx.sys_fd < 0 || !gpu_health_ctx.orig_health)
> +		return;
> +
> +	igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, gpu_health_ctx.orig_health);
> +	close(gpu_health_ctx.sys_fd);
> +	gpu_health_ctx.sys_fd = -1;
> +	if (sig)
> +		return;
> +	igt_info("Restored initial gpu_health to '%s'\n", gpu_health_ctx.orig_health);
> +	free(gpu_health_ctx.orig_health);
> +	gpu_health_ctx.orig_health = NULL;
> +}
> +
> +static bool valid_gpu_health(const char *s)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++)
> +		if (!strcmp(s, gpu_health_states[i]))
> +			return true;
> +
> +	return false;
> +}
> +
> +static void test_gpu_health(int xe)
> +{
> +	char *health = NULL;
> +	int ret;
> +	int i;
> +
> +	gpu_health_ctx.sys_fd = igt_sysfs_open(xe);
> +	igt_assert(gpu_health_ctx.sys_fd >= 0);
> +
> +	if (!igt_sysfs_has_attr(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR)) {
> +		close(gpu_health_ctx.sys_fd);
> +		gpu_health_ctx.sys_fd = -1;
> +		igt_skip("gpu_health sysfs attribute not exposed by driver\n");

Won't exit handler be called here?
Wouldn't it be better to skip on gpu health sysfs open.

> +	}
> +
> +	gpu_health_ctx.orig_health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +	igt_assert_f(gpu_health_ctx.orig_health, "Failed to read %s\n", GPU_HEALTH_ATTR);
> +	igt_info("Initial gpu_health: %s\n", gpu_health_ctx.orig_health);
> +	igt_assert_f(valid_gpu_health(gpu_health_ctx.orig_health),
> +		     "Unexpected initial gpu_health value: '%s'\n",
> +		     gpu_health_ctx.orig_health);
> +
> +	ret = igt_sysfs_write(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, "bogus", strlen("bogus"));
> +	igt_assert_f(ret == -EINVAL,
> +		     "Write of invalid value to %s returned %d, expected -EINVAL\n",
> +		     GPU_HEALTH_ATTR, ret);
> +
> +	for (i = 0; i < ARRAY_SIZE(gpu_health_states); i++) {
> +		const char *state = gpu_health_states[i];
> +
> +		igt_info("Setting gpu_health to '%s'\n", state);
> +
> +		igt_assert_f(igt_sysfs_set(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR, state),
> +			     "Failed to write '%s' to %s\n",
> +			     state, GPU_HEALTH_ATTR);
> +
> +		health = igt_sysfs_get(gpu_health_ctx.sys_fd, GPU_HEALTH_ATTR);
> +		igt_assert(health);
> +		igt_assert_f(!strcmp(health, state),
> +			     "gpu_health readback mismatch: wrote '%s', read '%s'\n",
> +			     state, health);
> +		igt_info("Verified gpu_health state readback for '%s' successfully\n",
> +			 state);
> +		free(health);
> +	}
> +
> +	restore_gpu_health(0);
> +}
> +
> +int igt_main()
> +{
> +	int xe;
> +
> +	igt_fixture()
> +		xe = drm_open_driver(DRIVER_XE);
> +
> +	igt_subtest("gpu-health") {
> +		igt_install_exit_handler(restore_gpu_health);
> +		test_gpu_health(xe);

Wouldn't it be better to have dedicated subtests for each value instead of
adding all testcases in a single function.

Would be easier to find during analysis as well

Thanks
Riana

> +	}
> +
> +	igt_fixture()
> +		drm_close_driver(xe);
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..3c2d4fdda 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -333,6 +333,7 @@ intel_xe_progs = [
>   	'xe_prime_self_import',
>   	'xe_pxp',
>   	'xe_query',
> +	'xe_ras',
>   	'xe_render_copy',
>   	'xe_vm',
>   	'xe_userptr_pressure',
