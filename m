Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F126FC5911
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 08:53:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF97410E889;
	Thu, 26 Feb 2026 08:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ejYegID5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C07810E885
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 08:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772096018; x=1803632018;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QOVxVmr6fPLYb3h2x5svuxHUaGKUSWXlO/Od1+osyaw=;
 b=ejYegID5tULLrf6R143elLYBImd3ldPCP6L53OJuDxs4HTfEJwo73GJ7
 AcO2LaFQVIuYpV/hAE0n/LsiJ0xe25K44kLiK54mxUYukH/D+gqJV9/YY
 6cS+QeSo7Pv5vvR+YLSyf+GTQfyWMRAhyp8l0OxeFfN9zSqP2vOsrzd5K
 dZew41/B4Cmx1a8oxBQ/3XM1naNC669bA47Ji5kxsapwEaJ4lprLvilOj
 X+bFnFMOC/29jR3fZo82xpuvbPlXfWZed0Pkcj+/PS+HmLw83kmmgNduj
 zm0iNfi5cjy/S1hA+0Sl4c+g8+RKMQIHUX/R9JM+wrwUtNtVo47c4LBwy A==;
X-CSE-ConnectionGUID: 06xOOIWCRxiuEYGAXj/gXg==
X-CSE-MsgGUID: EVfBoYRGSLmDbOFIK9GE4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="60726159"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="60726159"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:51:37 -0800
X-CSE-ConnectionGUID: +iPJAaJISaieEKGqPj+jTQ==
X-CSE-MsgGUID: pH+2IkdXQzSZFHG4mc5FUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="214744535"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 00:51:37 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 00:51:36 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 00:51:36 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 00:51:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwilOLit0ALvmMjBhSAZspxMYzVtmYOOU5Saizy1biKzay2yG2+WEKdj4vkaN6PNcqlv4kj3W90dq7XtKxUWDaSVBgUJEgw3CIiygKnPqY6PRE65+rBxqWoNutiWI6S5san7c2MuRTlmd9Zyvc9+gjwb5v8i8wps29XbdCXxxmpFHuqOaYoBtU9BtLwsXyr73qsBMVlb6ndsmpPMzgmsTunvqHLEnx0kyLm3ANSaeM54/WJf/7+IYx8U+THn2lk3nSfI7aApdHtX/n3r7UuiZ+v0qcUOHzEbMukA9sp6HgTgrTftI/ffdNyge4ygzUG3hZ/4okaPjjvb8m2avo9haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsSB1kEq1b9kZNzIvdkHGPOeR9zm1Wll8wjGS98hpk8=;
 b=U3OT07laqcS0epv/qIcLCgWpeuh0ryhY5STETSLhrpjdDuL2AJ02ApwVfVgpHSOPxmvs/fRMOI4XdlGPItBsgBTtaHEB28Arnf/u1yZ6Ten8bbUBpZM+hWKsT3cSP51rKqNEYdWJPmaIWECaYSiONtIhUfekn/tFznQOWqnjnKUb6hzENrE+rkuuwoOdDxgxBI4Ssh3/bSAxNNRqk6hFKNoJwlpaTq2Z3sSp6U9Xk4UqixeS+SkOoIJ93f6943JniHC683eXAgaHgaNZhfPr3CCs9h72G3ybMelpFmO4WBWRa9/J83FmIvhEL+qLsqyCr9CZsDNSPPJp2PNc9bvIpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by CY8PR11MB6985.namprd11.prod.outlook.com (2603:10b6:930:57::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Thu, 26 Feb
 2026 08:51:34 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%6]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 08:51:33 +0000
Date: Thu, 26 Feb 2026 08:51:23 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: S Sebinraj <s.sebinraj@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <carlos.santa@intel.com>,
 <karthik.b.s@intel.com>, <kamil.konieczny@intel.com>,
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v4] tests/kms_explict_fence: Add Test for Explicit
 Fencing
Message-ID: <ubagvytbuffhbuuxphwwa2mk2tf3nj4suhv4rpokq6b2qih4fl@u6zdwsiplm6e>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260217075953.3220732-1-s.sebinraj@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260217075953.3220732-1-s.sebinraj@intel.com>
X-ClientProxiedBy: WA2P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::6) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|CY8PR11MB6985:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a640fc-ddca-4e5c-2d91-08de75143e31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: wRDztqgk00tB+Rufz921ztFX3Blvh9Knsl5PhMdfvVTYKdPXqDTipD0nprxURFmIqqQnX891NwLjLhRGa2zIFsGol8a6l9UeVqCxtMTPI6t2HP3jKvnGryESAbMT9/sLhGfyPP+7JK5sp16krwL6boEanS/Qk1KNYO83gt7cEWzHpqpJgZXEAaTq+ukHo4UMS5ad779dr/3OVT+NYgQn/74JTgRDELI9AA5xuNRr2MzZJBXSDkAQpi/fmvodk3om9e+U3rhCQ3Qtz305GOyQfv823HObFYRsv4ceLB939UmKlsUaxdFMfm16MdwM0drysdomWteCPuOkSl/knlJxe0G8mxHPO1MJZd2/LjR20Su770OSg4CBhqa1WlO3Fkj4TiCyBSjf9Dps9fvqGw6dpl9iOwvDlx6um9vdDwJY0hfe8w91ZMWMloF3yyAaqMdHosA4JCws6k5BxVQMLVcwKq+NYs3yktoH+kchcujT5NqK3Nuyj5LriAS17y8Sb3w4hoI73Hd95ADaHuIZYUcOfuE++pNWQyUwS4C/mn+wNcIq2OxwxVT98F2cwHceoMtd1rZCTXX7TkMcVuH7EU/QNewsZmPBZVNq1fvoeiI/VYnvcutmknHPQZa4sVgm77cBPIkN54cv8FzHUZz9nDjb+FI0WEjyBFl8tPt6LYlW5ig=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWJYdUtBQnRJWXB4UHJyeklDekNIMFhoSzY4TGx2aE10KzFmYUZGWFhQUjRP?=
 =?utf-8?B?anJHMkxneURBaUFXRWw4R2JTQ3hmU09wNG5KTVJlb2Nub3Z3bWIxZEtnajdJ?=
 =?utf-8?B?YmM3bnVDQ2hFVVV5WEJHQ2NWUDNud1p3cHd4MjVDb00yMDd0eDNZT3I5citu?=
 =?utf-8?B?NTdsN2VCY1BuQmJCVzJHcHhIeTRpZksxd0xJS1BZd1JybEpUcWxOU2RudDZa?=
 =?utf-8?B?M3hvUC9Qc2N5Tk5VdUZ1NmlobHB5RWhUQ002Z1pTUkh5ejAzQWFpT1UwZDdk?=
 =?utf-8?B?eC9sODIyY1R1UnZsbytZbXlHZ2VTK2tCTFRqRTU0Z2hVWDNjWTk3czBHNVMz?=
 =?utf-8?B?dkZjOGR2a2U4Q1ozZWhPQmRFM2ZmNlN6ZHI1cTgrZk9uRCs2M3dEdWU0cEpt?=
 =?utf-8?B?ZzdYQXVPM0w1SkxPV3V6OGkvQzQwZ2p0cHlkQ0M0NlJnQ2hBUS9aNVhIUzA0?=
 =?utf-8?B?enRVMGJGNkxKZFl0a0NBYmJSUUk2RnBCUElBTFEvdjJUVGw4aW4wZ3JMdVlu?=
 =?utf-8?B?bTVMWkNaUnBMbkJ5Tk1YVUdzRVdWMERSWmhoenREcVFlVzVJcGxvSEVRejV6?=
 =?utf-8?B?aFpxOXZwL0tpT05pWjNhT1hsOXYxUXBrSFQ2bktpU3dycCs3bG91cnBkSUtz?=
 =?utf-8?B?QzhJejVjeDJabURkNGszdWlkRHJ3VXJTVEpaNnZnY1BKWTV6czNIbHlTRm12?=
 =?utf-8?B?WGZNZmw4SnFMN0V1RnpmQTRzMVpWYzhsWHNpbWRZZHFtZENUSVpRelZjZ2JW?=
 =?utf-8?B?RGk2UGZseTlhWDNpVU5meWZmUVhqNUxuTGVDUHF2LzlWdHdBZDVCNHlwdnJR?=
 =?utf-8?B?dEtVS2Z5NHNxbjdtS1BoUUJaRXRYV1lsaVBqWjRUM1RmSzMwNHh0YnFWaVFG?=
 =?utf-8?B?OFU5bDJGRGpHeEQzbmxOVjdHbnp5cTVkV0Y3NE8rbld2NTNxYVJMZzFqc2wx?=
 =?utf-8?B?N2NablJBaCtmai9XN3loVTJPMFAxa0l1b0lIL2NnUCtMOUNFRWtiWnJGa3FB?=
 =?utf-8?B?ckdMbHZuRENnaVVXbkE2RHFXZWRpMUZ4Zm15WWs3SkVHT2hsdTc3NHRLWGY0?=
 =?utf-8?B?dTJNRmc4L2hIUGliZzJZenR5N25ubWk5NWhVSXUxMXlKWmh5Z3k5K1J1bkdK?=
 =?utf-8?B?WGppT0ZMYU5ETWtuTVFXZEJXNmM0WjVTUVVXeGs2TmVwSXVwN0tKUjZlUXhM?=
 =?utf-8?B?Y25mMC9hQ05nN2NLSHdyMnAvTWp4b21TZFJFT1VvV3RaZ0hsUjVKbCsySERh?=
 =?utf-8?B?SGtOMGI0SUxxRitwVnljSlFjT3hTVUkwZ0huUi9Gd0R5bFJySWNwUFlmeWtm?=
 =?utf-8?B?eDVpc2lDeVY3RUtQcXdYWWNvQ1paMFY5cGw4S2JtN3BYWFJvU2o2blZ0cmhO?=
 =?utf-8?B?YWJrdjV3NCtDT2Z2eHhqTDJzNTBRMCtZNW1sRWNNb0lDaUN4emR0ckc2THVy?=
 =?utf-8?B?SXpQYjRlMmZqU2VTWC9ORk92a0Y0RnFEMDZRVGFpN202L2N0elVHTFBGMUc2?=
 =?utf-8?B?SG1EWGRUc0tUMWNDL2s0UHp2M1V4SDRSWUYzamNlRlJqdWdOaXZMMXF2eUZU?=
 =?utf-8?B?dXlqOGVJZlUrMEF1NzJLTEJtM1BhUEJ2UUNWWE1wVG9LZSsvK1JoT3dLVFQ5?=
 =?utf-8?B?a2ZnZm1KSnhnY1V4b29LWTFYS1RDODdNT2trM3k0OU1pYTBJYmhzNDFLbi80?=
 =?utf-8?B?M3o5aTZxZkpnOCtCTHBNYXQ3ekFXOHp1WjlqUy94dTQwd0l5K2RGbVpSdzJM?=
 =?utf-8?B?b1lGR05UbUdUcit6b2VQVjRVOExqdis5QTBhN0VYalNPQTBsZDZiUlhkaXZT?=
 =?utf-8?B?MEVrSk1xQThQaTJHN1hjQ2FEam9meXpLOXpCSWhWRWNlOCt1Z282bldkTjhl?=
 =?utf-8?B?WHNpallIa3ZaU0VEdlQxUXhDRzZLbjNldHJSbGJzUC9tbWNlTXdTUDFPaDgw?=
 =?utf-8?B?akt0amVsenIzOFRuK0c2bFZIS250a1djM3BkZnZGQjM3VitkWDdTV1pmZWpD?=
 =?utf-8?B?MlV3bTdxOFlReS8ybnVjTlhxY3ZRZHlwbjJKTTB3bkg0a0lPakZCUVAwUU9N?=
 =?utf-8?B?R1VOYnRoU3p4bCtaL3dVSUNZZEZhU3A1cEs2T09aRWFoYWovd2hhODgxTzQx?=
 =?utf-8?B?Q1VzUllZUVNrQ0VNOXNtTXlBTXJqbWhTSEJ5UVd2K0VvNlk3VjI3VXRrbmJs?=
 =?utf-8?B?K0tWRDM1dWlnMkR1cmZZN3E1cTNwWVNEQVo4Mi9reHl4YTg2aUFaa0taQ004?=
 =?utf-8?B?amh3RW5NSE1Zc3dJaEl5UmlBWCtiSTFxY1laSFdwVFNBTEh4RWJzbTVBZmt2?=
 =?utf-8?B?eXBTUUxrL0ZJdnpHK3hDcDlXaUFqbzZ3YjhGc3poTkRQU1N5SEtrN1ArK3J1?=
 =?utf-8?Q?8y3GoI7iIGHPlgeQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a640fc-ddca-4e5c-2d91-08de75143e31
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 08:51:33.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L3Bkj2AvnRnBXcAjvvhOJNI/X4MRecRLW+W7ImnbHEP4JGgzwV3tXHuZFYmrSikFvznKYf6aSJCko5JMSZWM7Zpyf7AORCsxumRP4u8l6wQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6985
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

Hi S Sebinraj,

[...]

> Background:
> - A bug regressed for Xe driver on PTL (Android) i915/display handling
This is a bit misleading. If the regression happened in Xe
driver, why are you referencing i915? Is this part of common
code between drivers?

>   of explicit fences when provided two or more buffers at once,
>   with 1+ already-signaled fences and 1+ not-yet-signaled fences.
>   https://patchwork.freedesktop.org/patch/662982/
> - Adding this test so that IGT contains sufficient testing for the
>   use of explicit fencing in the KMS Atomic Modesetting APIs.
> 

[...]

> +
> +		/* We need at least OVERLAY_COUNT overlay planes for this test */
> +		if (data->overlay1 && data->overlay2) {
This will be a bit cumbersome to maintain, if the number of
overlays ever changes, because you check for overlays' existence
directly, not for the number of existing overlays. However,
I couldn't come up with a better solution without introducing
complexity to the code.

Rest of the code looks good, extensive comments here helped me
understand what is happening.

[...]

-- 
Best Regards,
Krzysztof
