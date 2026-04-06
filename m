Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF57E64016
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 13:35:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A00410E253;
	Mon,  6 Apr 2026 13:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HT04bRjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0583010E253
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 13:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775482495; x=1807018495;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k+vQqlKLD1UdToCtGDIVXMrFFJ5gKrKpnWZWKhCvI4U=;
 b=HT04bRjtjXbaQKJ9uKD6j+NdexUasUZGqydhXuzWlm5bKPoOwlcE7PjZ
 y2hbE8+43s7KAXyTGj/PPTm57LVu466wjW4i+G+rbXAarme9r2kuVm/ne
 EnZBVL74a2mN4vROhhx8vXin4Kg2UJIgVsIVZL7AdocEudfxWb+2DY2xK
 6gNohoXlnHTD/NdQty3vgH1znufNaWbvcIYpoNewTMSiMeRUx8aTeUUUj
 H19FxafSwiJ8HgATRhoDQ5KEtrtwvo1Gik6HMT7w+wAKyBnxPqPiakOuD
 FwLQGMUIRFxgZzeD1qEpNTF6+ruQcEQuce1VuHDeY/KJWoKFd+1GT7pCa g==;
X-CSE-ConnectionGUID: XYZNwSAkQNmCaCOmhjGPgg==
X-CSE-MsgGUID: oRzWXbdtTgyU7EImksuQcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="75469448"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="75469448"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 06:34:54 -0700
X-CSE-ConnectionGUID: 8ljRiuxSTbKlqixjEkoSCQ==
X-CSE-MsgGUID: ZNS3k5P1SiWf8ipMY4U5tg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 06:34:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 06:34:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 06:34:40 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 06:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoTLxHDxqDN6TGQ8sszP8AFnv7WQdypCTG3Ie0uAWdTjHwp3PggMPz1Vtm17ukxcBmcJvWb0XG4wi56yLDxfk+PYzPk95P+jeOrYw1XIb5XnyXlgo4YecpUZN3yZd08A5mFQh3t+m97zbMYqulQamItPdRaeUFmNqYOOl0IVYxb9+fcHjnLa4hQRTvK34a7Ecyk/8J46H9Ao3P7b6nWDVM64rQYe560MIY+8jLQPtpdRlGVpd+PqLcZtnhsvNQhTatWNLOdSTHfhhuQnN+qIJ2x4C5eD5XfW4cbKOoN3JX/lFLWTgQQMid4MoXjLEglXzv4OLYU8W0ZzLLj7EwgS6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQcV9aa9vfzI6N4ztiRM2CmC4w9bV0JFlz1cDwseZDc=;
 b=Yfo/k3iLKMcDPPLdj850aZF39REE55dsB3em5gOzAPCcmd/ZA2JzFZc7yeg2i8ivnyMlmrioh49DmlToJn6eIEGH0PMMNXK7uaPWMcr5vNdN0WYqpCVncO037tzRH4SCMwI8IHDPnw/0ic8ioaReKNytxlOIdq00mpYDkI7hBDClRK3GTnBKN12gJZmIsWWoRTW1Y6PLP0u7l426cV8d1B331P4a5T5a1DHbq9vPve0PMC0R+BAjnqukIQL8y6Z3X5nGzcmTcc8TUYVDdfeNe22oqHet/7xf4OvfiONPG3YtDFNnhtsOdwyr+eWOGlP9oUdYEbI6uMOmO6tvsZr3qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by BN9PR11MB5225.namprd11.prod.outlook.com (2603:10b6:408:132::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 13:33:59 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 13:33:59 +0000
Message-ID: <928258d0-0e95-465e-9cc4-f1ca8846deb2@intel.com>
Date: Mon, 6 Apr 2026 19:03:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 5/9] tests/intel/xe_madvise: Add
 dontneed-after-mmap subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-6-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-6-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::16) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|BN9PR11MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef9376c-6b62-437c-6a95-08de93e12867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 6XFYoewQbVcQTvU1fLf0a+g07Kmnfxmr8z+lb/bL5hq/WR81G8Sg9LpgSW+oJ4Kzdki34ObtF0vVjKB/X/lcSQtvSahEn4OOfyBt9lI1BM94lNDxDNIo+02fACL/Eq1xkszabTBBznVi47ue2DTE3M5iyecnxJJWBtbXQYaMS0tqlTqBTzQCWWqVBXiqXP4hDn/yLoaoeU0kPv+7YTWQ00uRKPn8UuXmNq0qtswok+l6ZKbFHpnBorVRF0BvnZjlwHf8epcHu47BC6Kfe1LubSXporJxa3IXNrFqZZ3/p1x5o6qgv74TVClsd5GQIKim7vRsW7vd77I2TZmEOEy47OAQfTFeTOO9am8m4b7I5raBqRYr1IR1O+yp2lJUHb1faYkCnKPVonwDHlStxJCdOAivTYLZq+QJtvbSm1goT/qe9oW0e3UdWwEyt5OBrDMTFWw3F4ZMqxIoev9kcOmJ0PZhp5ZPSCa2FTCmIcFkW9jccHXOCPYiNznh2kV1cFM4ZbdcPRe3yXpWT1uSpdeUeUpP9clReVZQSMtRMRSElmZhV9QmRjqGIBhrrJGPJrwsHrhXfOkeO2bTSCz4Om/xD1Vr2lREB532F6448RZ1Kba4YceeXbDbLjZPjKmUa33NU/aJWukDrkeuy1zod1KWDi3IdG1RGlQ2IYsQS1nUsx9S/093O6BzGBnEkCrb8eob9+9RdJm1ftfIDrO5UOJrKxggrdL47h4euHd5xgDSpvc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cStFQk5EUjErRDRIQWo2clFsWDlBVExLMGIydkl5Q25DVUxmVVBzT2E0NXFJ?=
 =?utf-8?B?bUI4UTJ2UVJ1aUtyQlorL2I0RmQzSit2dkQ2WmN5UnVST25lUWgvSGE1ZGFH?=
 =?utf-8?B?ZlRTUkMvcXYxOVBma0U2UVRrdW1VUGhFS1Q5dU0rb01WMlN5Mlg2cmVsS0hJ?=
 =?utf-8?B?aHIwT2xsU0JsQ2JiT251S25wdkNqY1dSYVZpQ0EvWEtjdGlsOGdic1N2MUx2?=
 =?utf-8?B?TU95Q21UU05odEFaalFxRldXTjgzaDBhaTE0RDJKNitMelVxNCtvd1lJeWgx?=
 =?utf-8?B?Uks2Z3o0a2dCOWJDZGJla3ByZlppRncxeW9XRURPaW9TM2RnaE51Y09BVWd1?=
 =?utf-8?B?dEQ0ZFRFUUh5Sk12RFpPOVpXQ0hkelEzcmdJM0k0UEFFSkxqWlhuM2ZOTEZv?=
 =?utf-8?B?UWt2MjRIR3NDSGRsbjBvWFhpcXpZaU1GWnIwd3VJMUtaVHNDRStQUDQ1eFlE?=
 =?utf-8?B?NlB2ZUNPUmpCQmFScWI3RENEdW5oNUZJT3Q3MzF1bFV4TzE0S05Jd3B2MHpW?=
 =?utf-8?B?RFZlS2hjVFdmV043alVyZ2pQeUtXQjZlZEh5YWtaN1Z1NDJOanR6NW1XaEhT?=
 =?utf-8?B?WXRtSVlmV2VOdzl5bm85ZjQyREdCRy9mbHM2cytaUEdjRDJWaUN4U0tORDJ2?=
 =?utf-8?B?NGNOc04xc2xabTR1WkdFMjRuNTIxOVFGeUFKM1BVdXRHUDE4VzJKRWxJQ2k1?=
 =?utf-8?B?bVl0amI0OFdYZVlLZEF1N1NzKzE3YTN0cUxrWTcwRWxabFlmcUx1ZGhHendq?=
 =?utf-8?B?TFNOUWpqcGFZeHRUYnlaS1FCOFlORFNEdy8rY3FqNm40Mlc5TFVzak9Ra3F5?=
 =?utf-8?B?MFhUOE9TNmU3Y2RRaWlFT3JzdTM2QmIwZ1NRWW1FQTAwRnE5ZG5DMHF5eTNR?=
 =?utf-8?B?TFVQVG0za2dyZmE1N0Y5VmRrM2JUYmFTTHozaEkvbEluUkJyVENiSndVK3lL?=
 =?utf-8?B?QlpQZ0d6YVVFU3VzNWhjdXJpL1duRzFVSktyUStaMVp4RWlDQ1Rhdm9iQmx6?=
 =?utf-8?B?d2FzK0RWQldrc3djRUJTL2RYNGxQQk1NcThyTEMyVXVZak1CdUpnQUJOUTdm?=
 =?utf-8?B?OFVja0RlNHpJUk1SMVNXM1hnZVU5ZEs4dlp6dE9DeEhHSGp0NlNlaFVTdEpL?=
 =?utf-8?B?dkJwRytPTFB0SjVhREFEeGRGSlFBUjJldDZvWkNsYXpUWUprV1R3dWVvLzJu?=
 =?utf-8?B?U28vRXZIWmxvRXpwY1ROUzJ0YU11MGduLzJRMjFpdlpnTmROUUpvRmJYMm5K?=
 =?utf-8?B?UysrNW0yRnJmcWVqaGZsTklCcGdpZmVXWEVBb2VLNW93ZkZsU0UwcEI0aVRT?=
 =?utf-8?B?RytBbVpzS3I5UnZPZDA5QVA4SFI2UUtZbFFFMnVDZzJqNFo3MUd6RVhDMFd3?=
 =?utf-8?B?UWRnQXRhb2tTZXp5Smt0T2J2ZGtVRW5VM2ZHVlpKK0hGM3ErZWpQaGdvUWI5?=
 =?utf-8?B?dVRNUUlrV3NDWDlYT0FVVG5VRTQrenMvMXVFMDBETVNhMy84TlUvRWFMWXpN?=
 =?utf-8?B?RnFSSVVXc3RiUm9VOU1LL0NSUUdSRWNyQnd5Y2xWMjdldWRjN2x0aDd5bjBS?=
 =?utf-8?B?Sk5xRklhWXlIQlZhYVI3MGhYbWNUbGhTdjNKSDdyN2ZJRWJzc0wyQUQ3a3dZ?=
 =?utf-8?B?Vmg2NnV3QW5DYUoxN0NJNWVlNzNySUduKzVqbFZMZGNEQmtNRU4vRlBwOFNE?=
 =?utf-8?B?d3g0YmpFSEFxWkx1SDlVWTVWV2xkaU50OElBMkljV3FBNVM4VllaRitINjFl?=
 =?utf-8?B?bmNmL2pNUzZ0M0FRQlIvYUduN1pVSXAxY2hvS3dUNE4zOEpSMkpzUldVUXhI?=
 =?utf-8?B?ZXNKK3ppbHh4QzFmQlphbkRyeWV4OHBJNnZpSkNac3NhWmxDbHNGRW9wdFI4?=
 =?utf-8?B?QjlpdDk2elVKSTZxbnk5Y1dSbXp0RXc4TXFaNUdKOGFVQ09obUlENXFIMm8y?=
 =?utf-8?B?elZNL2xjQy9zemVCeU1nRjhTejBBZkhXR1I5RmNQWU4vbWJyR1JhbWJtWU1X?=
 =?utf-8?B?QnFkUG9USFRlaUo5RjZ0NjdOaWdOanRzZ3VaWEgySFlob3hGeFQ5ak1rU1U3?=
 =?utf-8?B?VmtkaWQ2Kzc5MkdKWGZlRUlkZUt2OGk3TUlPL2lVRTZBUVhMcGVHOVF5cWJk?=
 =?utf-8?B?YWs5K1NyT3BraTNQZmdNaGcvQ2ExNU45VG5XejZCVnlPOEY1OFZNQnFCWXUr?=
 =?utf-8?B?NlJheGFNL2JnVDlpYTlSa3FGbFMzMDBQLzVYNGdCclVxZ2RqODcvWnZyY1Vi?=
 =?utf-8?B?NjlncFpEb29hcDVyTUl4elNZc1l1aVdZMk9waVBVelgwSXdRVU9sYWdlSzlB?=
 =?utf-8?B?Z2ZxTUhsaTdVYVZGajZxZklTWkRwM1RkSlphVXlPMlZxaUVnTGhVelcxd1Y0?=
 =?utf-8?Q?fszbxPTQTMB4Q9vg=3D?=
X-Exchange-RoutingPolicyChecked: g/sD32zDtVpsMSz6OmB3CcWuklUuWcNFsv1m+lDyxtNR8hTJ2SaFjpHucak4GexM3+G7js6EY74Zso4d7RWiXPXvmBi6i5mejKWBnggcr5gxdll7iH2y0b3UxC64TQdhoCUMDdxiYgwfSV2iqZBDe0Tf4cOtNppZX2jDdetn5Pb9sgFZ08Ca0iFBFoqZs4zoyuSbfpbFuzj58F/BPFJF2V5dBhp6G4vZcU4FM+4E4Q7c3PfyGs6iuUyWJb48OwneRfXefYYinS3E0eaS1JZstwoBZDs8//KE+RWtGKIfjUtzH1DzSj4s9dvETXtOuHvuY+duB2IJXimCvPOyWoUN8Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef9376c-6b62-437c-6a95-08de93e12867
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 13:33:58.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHoJbprVIwR7Uwd5qh7SI0iTge4aR3S1CX/wHS/WjXOksJA+vN5pakj/BrjA5UrgxsBVwQmMuD3mZxZgAIswIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5225
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


On 3/25/2026 6:14 PM, Arvind Yadav wrote:
> This test verifies that an existing mmap becomes invalid after the BO
> is marked as purgeable and purged. The test creates a BO, maps it,
> writes data, then marks it DONTNEED and triggers memory pressure.
> Accessing the previously valid mapping should now trigger SIGBUS or
> SIGSEGV, confirming that existing mappings are correctly invalidated
> when the backing store is purged.
>
> v4:
>    - Added proper resource cleanup before calling igt_skip(). (Nishit)
>    - Added assertion for xe_bo_map. (Nishit)
>
> v6:
>    - Fix sigsetjmp(jmp, SIGBUS | SIGSEGV) to sigsetjmp(jmp, 1). The
>      second argument is a plain boolean savemask, not a signal set.
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 64 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 64 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 81e05b6d4..9a157de1d 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -244,6 +244,64 @@ static void test_dontneed_before_mmap(int fd)
>   	xe_vm_destroy(fd, vm);
>   }
>   
> +/**
> + * SUBTEST: dontneed-after-mmap
> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on accessing purged mapping
> + * Test category: functionality test
> + */
> +static void test_dontneed_after_mmap(int fd)
> +{
> +	uint32_t bo, vm;
> +	uint64_t addr = PURGEABLE_ADDR;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	void *map;
> +
> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
> +
> +	map = xe_bo_map(fd, bo, bo_size);
> +	igt_assert(map != MAP_FAILED);
> +	memset(map, 0xAB, bo_size);
> +
> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
same comment as in Patch-4/9
> +		munmap(map, bo_size);
> +		gem_close(fd, bo);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
> +	}
> +
> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
> +	{
> +		sighandler_t old_sigsegv, old_sigbus;
> +		char *ptr = (char *)map;
> +		int sig;
> +
> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
> +
> +		sig = sigsetjmp(jmp, 1); /* savemask=1: save/restore signal mask */
> +		switch (sig) {
> +		case SIGBUS:
> +		case SIGSEGV:
> +			/* Expected - purged mapping access failed */
> +			break;
> +		case 0:
> +			*ptr = 0;
> +		default:
> +			igt_assert_f(false,
> +				     "Access to purged mapping should trigger SIGBUS, got sig=%d\n",
> +				     sig);
> +			break;
> +		}
> +
> +		signal(SIGBUS, old_sigbus);
> +		signal(SIGSEGV, old_sigsegv);
> +	}
> +
> +	munmap(map, bo_size);
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   int igt_main()
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -268,6 +326,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("dontneed-after-mmap")
> +		xe_for_each_engine(fd, hwe) {
> +			test_dontneed_after_mmap(fd);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);
