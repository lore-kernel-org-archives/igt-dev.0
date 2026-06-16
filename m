Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB4BCD98E3
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 16:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784888924B;
	Tue, 16 Jun 2026 16:09:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PSn3T7Eh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1664510E09D
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 16:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781626140; x=1813162140;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=7W3KTWBx5YFpEEX7UcbXuUo0qsMIwY2zTJvJpG7zcvY=;
 b=PSn3T7EhPDvGRdh+PwG1fouHSGmvibXe0qnfoeJyvt956KMs3rkr8fRf
 h/dqrRL+a4e+hKE75C8IBGJsV3lWPGh17L0dfm0tgMwMXxHTb40X/3g/8
 uMbNx2KvT/sFBprSolmbzSCLwpZKJryeim8F/xKbRsij1djPVr4Bimr5Q
 mGHHgStLg2kpoAU1yIekDUGAveit92xX/tUENIkE68pC2fpr/LL57HnHt
 BZdMReHZ5/T4Ak0gMze0MjQWIO2AlUip2UO3WYzr14VKUvh/kVqsSY2jv
 rJoWtdpIyefGyLyVhdWuhimmreAg68otXDXVk8Eyx3lIsaqVKQ2b27S9G g==;
X-CSE-ConnectionGUID: wq7MfM6LQCKbQEuH9GRClQ==
X-CSE-MsgGUID: 0B274bKXSiiymv0inPe6Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="107830133"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
 d="scan'208,217";a="107830133"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:08:59 -0700
X-CSE-ConnectionGUID: nbxvusaKQ7qISpclvpMWjw==
X-CSE-MsgGUID: UX4/hh2RReK+uzXUK7HTjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
 d="scan'208,217";a="285920031"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 09:08:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 09:08:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 09:08:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.59)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 09:08:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHCa2wPYK4CUIL2fFKLOtqwjWo4gVjY5weTYRGtfJH2N0D8uYTnGAoPPXj8zCfJ+Fq9JkgU+EmKxrsKAe1/DhLbcOhLJgbUOVdiWKgbXK6PA2lAmWmhuvOeMbKhxDLt5VjgQCHD7XVTOCKHrkctdvuE0yrwSay9XssweHOxhFtyL2p350G4WDlblyTVPyyFYmB4JzKB7CzzGVDwx3lLdqZTMFcw6wpkhxfVkGPSpRdLHkiQcy4Bnh+3wfHLkaMJuygLJS+6/7WYwowMvnHDCsZxqdsmOn03BaMbEVvcL6ciumda85pStemBtJzHKq/B+yB6LVZS9J/KFWkhYGicYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5gGCivl6kp0t00RHx1vPRICGXW24/4EImmVgwUZPIfU=;
 b=xJurn+aQ9SofW2esKRr6/9VAWdKWEZ6bXhhdvPIFNxOSY3HQJDynyGZFiwGwIhuyheKYXfjr5BOiHBKlICuVM067WofcZtV/0Nkliq/QFag26U0vVe0DzcXGO6Zjy+AY5FUclvs035X/GqxZDjPx70ZivshmWyK/0rHB0foiNrtWeLAVK3GeHkZ8moLF8DUmOi99wFCkKm5PX85E94DM+kHgboquFmDoVTsAnZA7PjW4tsxq1z97TYitAE2j/PUiOYLg6JiNZkPC5N6e1ckUS/AWG6lR3h0x/zM5x2pd2VNBkZC49oSb9rOu2K+Qv5qyxoLsAJ9MkGXA2WyMR0yJKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by DS0PR11MB7652.namprd11.prod.outlook.com (2603:10b6:8:14e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Tue, 16 Jun
 2026 16:08:50 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::6349:cd26:d23c:4ece%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 16:08:50 +0000
Content-Type: multipart/alternative;
 boundary="------------A1RnzYdpwHy3dnU9esQ8pbNr"
Message-ID: <c609a90e-03a6-4d98-9e16-549c6e875ded@intel.com>
Date: Tue, 16 Jun 2026 18:08:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 1/6] lib/igt_device_sriov: Add generic SR-IOV
 exit cleanup helper
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <adam.miszczak@linux.intel.com>, <lukasz.laguna@intel.com>
References: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
 <20260615103220.281656-2-marcin.bernatowicz@linux.intel.com>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <20260615103220.281656-2-marcin.bernatowicz@linux.intel.com>
X-ClientProxiedBy: VI1P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::9) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|DS0PR11MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 1946cff6-016a-4012-30ca-08decbc18da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|8096899003|6133799003|22082099003|18002099003|4143699003|11063799006|56012099006|5023799004;
X-Microsoft-Antispam-Message-Info: dRq41pS1geKdBO17j42GTjvP6k+AOpY7iHGGNZvP8wRZ8JUXwHN/EYnWZeOzlBtHET0vyHOKmkGs3Y0IZ9HGVgyOt7zs5uEBkyRiGb0rspJ/Ldmsh2ab2aN3hdJtS6I1EYM8ayD2AybYrP9uDv/vFo/U1+4NJgCRRhxcoKrgjexrTHYHRVBYl6a9uExWDxXG4P4AUFMijoAd1oWLDSSPkh78OUKUWVrQ4DRlcwN/3abHMiRYvpZu2gWQFyjnZIsUX70HMGWkunGjSAbQ2mVIeWTun7XbOpDliCpbF0VQba9SEBS16dYLp1qlK0/BFdUQQKQpiNjFL339PsyuJJdkrgpmo33AaMiOmb9nR+1xxmNWJy5SYZNP+XsqIj/w+6FDdasmq2o37tblH57iv/2OzYD8qOi36bs37iMfbXL+vv6PWchymq2Y8x6qgSIXnaA+olBTsfDpvOpFcPTCP16bQGJd4Q5WzhpfXjrYJsiIhqOO6L5zVJRoRCJq/Gj8+AozBPA7b9NvohUChKnhYtE19XCTpEnm2kH0ZcuW1dsXlIiOgIqxgNr4bZkZHWsGohXOh8ZtFUlNrX7/5r0trSgVZK3jAkfN9w+NI8UUS6AMN6B3KJmp+RTdDJv1HE4/aSHOceOKP+0pVUgOtnHxxuZ0oZcbFxFeLc7BtfbyA5cpOLaMqy0IGs+esaZmksaNJeqT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(8096899003)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006)(5023799004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZUaktkV0p0bWRDSmJHSzZ2VkdpVmIxVWpjRmlYRkpYMG1XOFo2QlRtd0ps?=
 =?utf-8?B?V0kwUFZBZlBIWm1Ja0tORy9VQzBwS0hhdmNwdlNLZTFHVVNiWWlkWC9OdFF6?=
 =?utf-8?B?RCt6Wm5GNFBHMnhCcVg3MkZiYWJwcUN2WWRFVk5nUG5aMTFYdHZ3TERoR05K?=
 =?utf-8?B?cC9SUW04UG85VENEMU9FbmtXeVkwVFhsenU2MnI1Rlo5NWtEMG93SUgwNkND?=
 =?utf-8?B?OHE0S0R6OVpCUUpvc0haUHJxZy9MSDl6dlYzTXdGZzdxZWdLUnNkd0xCRzBG?=
 =?utf-8?B?a0lSajBuUHRNU3FjTXVNZjlpWDVwdWVKY1hSVWY0L2lxRHluUm16NFlBM2Ft?=
 =?utf-8?B?ODNWeUVST200SGFpcDFRdkJVSzlndlpOYnVZWk1pbWVIbTIxb05QdnhiZjJS?=
 =?utf-8?B?K0w2UzM5N01MVkRoQlZLQUh2VlBsaDVJa1hHa3VNWm8xT3hLLzdZbklpVGM2?=
 =?utf-8?B?R2pEcFNXaXRmOVNzUlJvNHlRbm1WU1I0NW9wMDIwc21xZ1ZvalRXRm1jMWl0?=
 =?utf-8?B?anUwZmVLeUxoRVdTT3NGMXRkaVZWMlJCVG9NRk56aWZUTUlXUDR3dUh4cE9O?=
 =?utf-8?B?ZFJxQlNhVGFDL3BwTGsvUEovbXhMRUM5bFpxcWRLVjl1UVp0MzJ1azREZ2ZF?=
 =?utf-8?B?N0dBZHJKUHhFd0VtVjZteFlqUVg4R3JzQWMxbmhLQUU0VWdVSHVNT1krbUpo?=
 =?utf-8?B?cDA5Z2FTRkJzbGdpRVM2am40WlZwbFVZR2daV1BCRWNuVHYxSkdxYTQ4NlpH?=
 =?utf-8?B?eUVockYxZFVJcmVLSVpQeXJjSE5NUSs0RDh2VEpiQlY4TG1kbXQ0cTUwWHN0?=
 =?utf-8?B?Zks3Z3lZU0xhU3RkZUVUcUZVVndreUtrUlhYajFiLzY4NEZJRVU0Nnpqdndt?=
 =?utf-8?B?a1NiN2hubVdqcnRRaUQ2ZGNrVEpGM291ZCtJM3gvTVExQ3A5ZHRGUm5haWg5?=
 =?utf-8?B?b1V3c2JLbUVJSzBTTm54SzRFNTMwTkUydGZJNlVEVDhwUDNzdlFjM2FUVmV5?=
 =?utf-8?B?UDY0T0VtUThCVkQ4VHJSb0o0OWQzZW9rY3ZvNFg2MU81cWYzcFl2bU5iV1Ex?=
 =?utf-8?B?UVl6anZ4R0IxRVVJU3JFZGxCclF0bTNWcGlPMk5UM2F5R3hDMmpkdjZXeGtK?=
 =?utf-8?B?NFZhejdZVGU1dE53VTAwRHVoMHVmWkpPcjNiT2xZQjh6cXIrYWdQdlZsVTdw?=
 =?utf-8?B?b1BZWDcvWFBnQjBFblR6K2diRTJXUkNjRHpoaGZHYlFpc01pS2J4elBlaDlT?=
 =?utf-8?B?QmhZcXdBWThsT2pFdnd3S2swSytUNWllRkNISUxUanpQQmw1WDhzcElCTEYx?=
 =?utf-8?B?S2Y1Z1pua1hQd25IREtvNUZ3TjNCZFYwM3dWR1VER2dXNVRNNm1vcjFPZkEx?=
 =?utf-8?B?cy9QV05TUEpKNzhMNk9keXJ6TE9aazRIZ2Y5SHozdFRBQWc5bVdjdzJLdllR?=
 =?utf-8?B?M3Y4V01LVit0ZUVMWEM2bkxmUDY5QmNuVjQ0REFHdGlBOC9haW9SK2x5NWtH?=
 =?utf-8?B?ZU9LM2htNlQ5N29UYzFHUjZQcTFxdVQwYks2b3ZqQWZZRXhrVjZHZ1hIcDhE?=
 =?utf-8?B?dXc2TC90N2JwSHFxeGZXMkovdktJQWhkVHJtQy9pVURQNDRNbWFkUEtiNXNx?=
 =?utf-8?B?VUY1Wk9nK3hwa1pKK0dVOWZIc0l6NVNpblJ4S1RaZm01anpDbGhKV09vaWc0?=
 =?utf-8?B?U3NMdlI3UndVU2IyeGxzY2FLUW42bDl4Ly9TOVBxVHF1M1ZpS2d2Z0FVbUlv?=
 =?utf-8?B?aG11Y294OTEwb0hjUGdBdkNxU0JCZnJCYmxvUkR5Skd1dUcreGE0S2ErdjJ6?=
 =?utf-8?B?dllwMnFsZ3ZoaGtFYmVPQ09tbmlqdkRBbzJyN0FSSURTVmpCNjY0ZExTZWVE?=
 =?utf-8?B?aVlrZ0s4UjJKUndXdHpndUxVVDkzdnZENVZiWFhBemJZaTBUMUV6dDBHdEw4?=
 =?utf-8?B?Q1NmUEhGNm5iRUhySHF2SjJzR2hzcmgxYzlWdlFObGh6eVh0TVA4enNSZ2Jw?=
 =?utf-8?B?MEYxcTVLbW9taTlWVTVYK3pHR2JBUFB5K3hyeVBpaVFNSCt4Y3p2c0F0clc4?=
 =?utf-8?B?cU1JUlc0cjNzdHlzWTMyVGROU1NQL1BVNnAvcDVVN0FjNHcxMjlJSHlHQ1Zn?=
 =?utf-8?B?djkyckNUcnNHWWhvSjJNSzFvVDlUMnEvcG05MTNIcDd0Z2RFRGliYXZzM0ht?=
 =?utf-8?B?Q1BBZERhNkU5cEdlcXl5MDVtbkJrcGJPQ1p1WWJNS0RBbkM1TE1Qci95MENG?=
 =?utf-8?B?Zmp0RTh0Y2VRNG42d045WjBhOE03bENmUXZrbi94dGpZV3hOT3NVa1Zpdzdn?=
 =?utf-8?B?ZTNTVlFIdjhHWnRTZnFGTGF4V2FMNFdwSW5sY09UOGJvSlArelE5Nmx1MTlq?=
 =?utf-8?Q?yaGv8oDplHTfj+sU=3D?=
X-Exchange-RoutingPolicyChecked: lsr3l/Ara4jhLN4BfeyJLh4Osz0wAmuuvfSnuP0uhaRSeWoBWUdSuwl4IOHKZjxN9mQgpeind/RUfgGNV54et0RvWTOYvB9FqFYO78HOMRO6k3pgrGXtbP9fcZ+lhQuVAdSklQzO41T9c4G41I4P//L3UGFlIO2CQOsooViMRQnpnU0rQEV+3/6r/rlNq8OKqXXHt8n8GWRbhOLcOfs15VrPGtmlHtGuotgsPB3HdPE+j0Wj1tKINdrsAai01lSK+ypM3shB/cPqIXKnWbXw9upwOVyvPnGcS/pVceu3eCB7fwpYULWNF8x+1eaKELfxWp36N6rSx6bcxtTZJt2S5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1946cff6-016a-4012-30ca-08decbc18da8
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 16:08:50.1246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuUy1b7qzfpNLVymQuLbhmUtpZGtXQUzLOImSCWUv0SSltw3DwmrJAyq9AA5pw+DEl3vQVCLttZQG6XTaMc0x9cLczk6k9jCCGJcLlTi280=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7652
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

--------------A1RnzYdpwHy3dnU9esQ8pbNr
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

LGTM,

Reviewed-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>

On 6/15/2026 12:32 PM, Marcin Bernatowicz wrote:
> Add SR-IOV exit-handler helpers.
>
> The handler provides best-effort cleanup on exit: optional callback,
> VF disable, and optional autoprobe restore.
> Add a helper to clear handler state after normal teardown.
>
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak<adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski<jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna<lukasz.laguna@intel.com>
> ---
> v2: Always try to restore sriov_drivers_autoprobe. (Lukasz)
> ---
>   lib/igt_sriov_device.c | 91 ++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_sriov_device.h |  5 +++
>   2 files changed, 96 insertions(+)
>
> diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
> index 8f2cfa50f..da1557010 100644
> --- a/lib/igt_sriov_device.c
> +++ b/lib/igt_sriov_device.c
> @@ -546,3 +546,94 @@ bool intel_is_vf_device(int fd)
>   
>   	return (value & 1) != 0;
>   }
> +
> +struct sriov_exit_handler_ctx {
> +	int pf;
> +	bool restore_autoprobe;
> +	bool autoprobe;
> +	igt_sriov_exit_cleanup_fn cleanup_fn;
> +	void *cleanup_data;
> +};
> +
> +static struct sriov_exit_handler_ctx sriov_exit_ctx = {
> +	.pf = -1,
> +};
> +
> +static void sriov_exit_handler_release_fd(void)
> +{
> +	if (sriov_exit_ctx.pf < 0)
> +		return;
> +
> +	__drm_close_driver(sriov_exit_ctx.pf);
> +	sriov_exit_ctx.pf = -1;
> +}
> +
> +static void sriov_exit_handler(int sig)
> +{
> +	if (sriov_exit_ctx.pf < 0)
> +		return;
> +
> +	igt_sriov_disable_vfs(sriov_exit_ctx.pf);
> +
> +	if (sriov_exit_ctx.cleanup_fn)
> +		sriov_exit_ctx.cleanup_fn(sriov_exit_ctx.pf, sig,
> +					  sriov_exit_ctx.cleanup_data);
> +
> +	if (sriov_exit_ctx.autoprobe)
> +		igt_sriov_enable_driver_autoprobe(sriov_exit_ctx.pf);
> +	else
> +		igt_sriov_disable_driver_autoprobe(sriov_exit_ctx.pf);
> +}
> +
> +/**
> + * igt_sriov_install_exit_handler - Install best-effort SR-IOV cleanup handler
> + * @pf: PF device file descriptor
> + * @cleanup_fn: Optional callback invoked after VF disable
> + * @cleanup_data: Opaque callback data
> + *
> + * Registers a process-exit cleanup routine for SR-IOV tests. The handler runs
> + * from normal and signal-triggered exits (when possible), disables VFs,
> + * invokes @cleanup_fn if provided (passing signal number, or 0 on normal
> + * exit), and restores the original autoprobe setting captured at
> + * installation time. Tests that perform full explicit teardown should call
> + * igt_sriov_clear_exit_handler() once that teardown succeeds. An internal
> + * duplicate of @pf is kept so cleanup remains usable even if the caller closes
> + * the original DRM fd before process exit.
> + */
> +void igt_sriov_install_exit_handler(int pf,
> +				    igt_sriov_exit_cleanup_fn cleanup_fn,
> +				    void *cleanup_data)
> +{
> +	int pf_dup;
> +
> +	if (!igt_sriov_is_pf(pf))
> +		return;
> +
> +	pf_dup = dup(pf);
> +	igt_assert_f(pf_dup >= 0, "Failed to duplicate PF fd (%s)\n",
> +		     strerror(errno));
> +
> +	sriov_exit_handler_release_fd();
> +
> +	sriov_exit_ctx.pf = pf_dup;
> +	sriov_exit_ctx.autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_dup);
> +	sriov_exit_ctx.cleanup_fn = cleanup_fn;
> +	sriov_exit_ctx.cleanup_data = cleanup_data;
> +
> +	igt_install_exit_handler(sriov_exit_handler);
> +}
> +
> +/**
> + * igt_sriov_clear_exit_handler - Disable SR-IOV exit cleanup context
> + *
> + * Clears the active SR-IOV cleanup context, used when a test has completed
> + * explicit teardown and no longer needs best-effort cleanup on process exit.
> + */
> +void igt_sriov_clear_exit_handler(void)
> +{
> +	sriov_exit_handler_release_fd();
> +	sriov_exit_ctx.restore_autoprobe = false;
> +	sriov_exit_ctx.autoprobe = false;
> +	sriov_exit_ctx.cleanup_fn = NULL;
> +	sriov_exit_ctx.cleanup_data = NULL;
> +}
> diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
> index a417b30d8..4e4ba230a 100644
> --- a/lib/igt_sriov_device.h
> +++ b/lib/igt_sriov_device.h
> @@ -36,6 +36,11 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
>   bool igt_sriov_device_reset(int pf, unsigned int vf_num);
>   bool intel_is_vf_device(int device);
>   const char *igt_sriov_func_str(unsigned int vf_num);
> +typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
> +void igt_sriov_install_exit_handler(int pf,
> +				    igt_sriov_exit_cleanup_fn cleanup_fn,
> +				    void *cleanup_data);
> +void igt_sriov_clear_exit_handler(void);
>   
>   /**
>    * __is_valid_range - Helper to check VF range is valid
--------------A1RnzYdpwHy3dnU9esQ8pbNr
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>LGTM,</p>
    <p>Reviewed-by:&nbsp;<span class="ws-pre-wrap extended-commit-description-container pb-2 text-mono wb-break-word prc-Text-Text-9mHv3">Jakub
        Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a></span></p>
    <div class="moz-cite-prefix">On 6/15/2026 12:32 PM, Marcin
      Bernatowicz wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260615103220.281656-2-marcin.bernatowicz@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">Add SR-IOV exit-handler helpers.

The handler provides best-effort cleanup on exit: optional callback,
VF disable, and optional autoprobe restore.
Add a helper to clear handler state after normal teardown.

Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Cc: Adam Miszczak <a class="moz-txt-link-rfc2396E" href="mailto:adam.miszczak@linux.intel.com">&lt;adam.miszczak@linux.intel.com&gt;</a>
Cc: Jakub Kolakowski <a class="moz-txt-link-rfc2396E" href="mailto:jakub1.kolakowski@intel.com">&lt;jakub1.kolakowski@intel.com&gt;</a>
Cc: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a>
---
v2: Always try to restore sriov_drivers_autoprobe. (Lukasz)
---
 lib/igt_sriov_device.c | 91 ++++++++++++++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  5 +++
 2 files changed, 96 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 8f2cfa50f..da1557010 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -546,3 +546,94 @@ bool intel_is_vf_device(int fd)
 
 	return (value &amp; 1) != 0;
 }
+
+struct sriov_exit_handler_ctx {
+	int pf;
+	bool restore_autoprobe;
+	bool autoprobe;
+	igt_sriov_exit_cleanup_fn cleanup_fn;
+	void *cleanup_data;
+};
+
+static struct sriov_exit_handler_ctx sriov_exit_ctx = {
+	.pf = -1,
+};
+
+static void sriov_exit_handler_release_fd(void)
+{
+	if (sriov_exit_ctx.pf &lt; 0)
+		return;
+
+	__drm_close_driver(sriov_exit_ctx.pf);
+	sriov_exit_ctx.pf = -1;
+}
+
+static void sriov_exit_handler(int sig)
+{
+	if (sriov_exit_ctx.pf &lt; 0)
+		return;
+
+	igt_sriov_disable_vfs(sriov_exit_ctx.pf);
+
+	if (sriov_exit_ctx.cleanup_fn)
+		sriov_exit_ctx.cleanup_fn(sriov_exit_ctx.pf, sig,
+					  sriov_exit_ctx.cleanup_data);
+
+	if (sriov_exit_ctx.autoprobe)
+		igt_sriov_enable_driver_autoprobe(sriov_exit_ctx.pf);
+	else
+		igt_sriov_disable_driver_autoprobe(sriov_exit_ctx.pf);
+}
+
+/**
+ * igt_sriov_install_exit_handler - Install best-effort SR-IOV cleanup handler
+ * @pf: PF device file descriptor
+ * @cleanup_fn: Optional callback invoked after VF disable
+ * @cleanup_data: Opaque callback data
+ *
+ * Registers a process-exit cleanup routine for SR-IOV tests. The handler runs
+ * from normal and signal-triggered exits (when possible), disables VFs,
+ * invokes @cleanup_fn if provided (passing signal number, or 0 on normal
+ * exit), and restores the original autoprobe setting captured at
+ * installation time. Tests that perform full explicit teardown should call
+ * igt_sriov_clear_exit_handler() once that teardown succeeds. An internal
+ * duplicate of @pf is kept so cleanup remains usable even if the caller closes
+ * the original DRM fd before process exit.
+ */
+void igt_sriov_install_exit_handler(int pf,
+				    igt_sriov_exit_cleanup_fn cleanup_fn,
+				    void *cleanup_data)
+{
+	int pf_dup;
+
+	if (!igt_sriov_is_pf(pf))
+		return;
+
+	pf_dup = dup(pf);
+	igt_assert_f(pf_dup &gt;= 0, &quot;Failed to duplicate PF fd (%s)\n&quot;,
+		     strerror(errno));
+
+	sriov_exit_handler_release_fd();
+
+	sriov_exit_ctx.pf = pf_dup;
+	sriov_exit_ctx.autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_dup);
+	sriov_exit_ctx.cleanup_fn = cleanup_fn;
+	sriov_exit_ctx.cleanup_data = cleanup_data;
+
+	igt_install_exit_handler(sriov_exit_handler);
+}
+
+/**
+ * igt_sriov_clear_exit_handler - Disable SR-IOV exit cleanup context
+ *
+ * Clears the active SR-IOV cleanup context, used when a test has completed
+ * explicit teardown and no longer needs best-effort cleanup on process exit.
+ */
+void igt_sriov_clear_exit_handler(void)
+{
+	sriov_exit_handler_release_fd();
+	sriov_exit_ctx.restore_autoprobe = false;
+	sriov_exit_ctx.autoprobe = false;
+	sriov_exit_ctx.cleanup_fn = NULL;
+	sriov_exit_ctx.cleanup_data = NULL;
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index a417b30d8..4e4ba230a 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -36,6 +36,11 @@ bool igt_sriov_device_reset_exists(int pf, unsigned int vf_num);
 bool igt_sriov_device_reset(int pf, unsigned int vf_num);
 bool intel_is_vf_device(int device);
 const char *igt_sriov_func_str(unsigned int vf_num);
+typedef void (*igt_sriov_exit_cleanup_fn)(int pf, int sig, void *user_data);
+void igt_sriov_install_exit_handler(int pf,
+				    igt_sriov_exit_cleanup_fn cleanup_fn,
+				    void *cleanup_data);
+void igt_sriov_clear_exit_handler(void);
 
 /**
  * __is_valid_range - Helper to check VF range is valid
</pre>
    </blockquote>
  </body>
</html>

--------------A1RnzYdpwHy3dnU9esQ8pbNr--
