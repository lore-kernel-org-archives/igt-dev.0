Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288D4C02180
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 08:54:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D83C410E1CB;
	Thu, 16 Jan 2025 08:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrcHaYPj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2406810E1CB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 08:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737017656; x=1768553656;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lAqKdeWQDZVMCzudx/ESPQ9ozUAkhW8NCTivCSu/cvk=;
 b=LrcHaYPj4gWSyRXqhYSpLxsLbtJ4lnWWysRKq1uWVvamBxXXDizUDGPG
 r8ZHP2ccVuCirCcs+37Lu8O4pmk+BQs6S5Yf8B8za5JDlC/WwDfvViJ68
 d4eiIMAJarl3ejk2FYZW8nTC/VfghZGom05UehyN6mI7pE2uEkmByG0of
 SRyXOpZpPBv2ewHpBY5T5ZCY5mZi+kydLjk9Vlo4rnK13T3Kl9HDiv8vP
 60wwnzkG9omoRup3FYaB3vcZb6bPj7/QD+ijz9IlWtEunK1m90r2cpuQw
 ffbBJkFJh/6GEtPRMkexD+UZ0/NKzZ9gb7K+0SIrFGrg5yzqHX0ME9v6+ A==;
X-CSE-ConnectionGUID: Eq8KiaLqSCOcME4yMZcSjg==
X-CSE-MsgGUID: KGdh+5DuRKqB7Nzafu3X4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="48785066"
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="48785066"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 00:54:16 -0800
X-CSE-ConnectionGUID: r5bwRkIfRe6735zWJq7P3A==
X-CSE-MsgGUID: osQAMt6AS+qcBmfugb2Wvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="105184714"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2025 00:54:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 00:54:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 00:54:15 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 00:54:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tGBvjQpGfr+Df/zh27n/XwkMR7yZRh6QtFGN/yNT7bXPYd2JtCVvWteQAbrg7w1tTvL9Ugfk+hYdLI7dj43fYJtD7Hw0s29BhCsXzLJ5R5yeY11hJNNNFcPq9eesv944yJsTgR4+yjLqJbax575g+6aQjuYKnJgFCPfBI+0K8Jf8PYYthbOvNlOcH9hKBbWqQ6+h0KSmShEnG0yWkHFQIABjls1fqcMpaE7bqk+T8jOz5OTxcmFV7LAAVXOx5GdCRBzRjSMkKg+/zzZyTPm3kRFvXdlBs1T9XKM7SgVQhrIVLZ/k5oSPh1bh74cxvOgYM89W08d8JGOo918iYVeSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2dk7HIqP4JjyJc6yCYSFr+bovEwp9eyA5IgE/XDZog=;
 b=jhNYE8uuju0EYPjDL77t13e+ESP3kFGBVoJnnlTPbEu23hWgGD6oYqQMfwVBI1V9VC2I/z27h2zc0aHIJM98c06xNaV4dYUvzqTUq9NMrbrKFf1ghd4spr9vLk0U29FhEJc0/k6zC4i7yLF8XZ9NhqHuu/4UjO765xuof6LY363LYbmcR08rikY6eaztIluKnniU2lGNDR0ZzwLOT07vh8LkKoQoc+4+7nak0KwfxKzPvLHCVdKO16i73eBvvP7M0Qye0JtgFjWd0Z+jecFJEctXoWCucW2rqbtzepsi2h74thAX6YTacKLw7LvBDcm2LpDBBr3ZMRgGRbcgjkHtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM3PR11MB8671.namprd11.prod.outlook.com (2603:10b6:0:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 08:53:26 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8356.014; Thu, 16 Jan 2025
 08:53:26 +0000
Message-ID: <cfc096f4-ba74-4cd3-99b8-70f889350e23@intel.com>
Date: Thu, 16 Jan 2025 14:23:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_scaling: get mode only after
 setting the output pipe
To: Luca Coelho <luciano.coelho@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250110123403.1818011-1-luciano.coelho@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250110123403.1818011-1-luciano.coelho@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::8) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM3PR11MB8671:EE_
X-MS-Office365-Filtering-Correlation-Id: b9b50d8a-9548-467b-f3b5-08dd360b3d48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WG11KzFkZkFsVSsxNlpMOXR3TEZ4czc0Vkt4ZXVnU3dVaHhjS0dVeGFhQkhi?=
 =?utf-8?B?VVM1dFd3eEF3MXlXL0dtRCt6N01nd0svcGlTbVY5Z2JRZSs5bEt2OWhGTTlr?=
 =?utf-8?B?eFN6WEt5TGs2NHBTWFhINmR1VmMyaVVIU2QvTm1BbzBHblpqR2tFenZ5UEFt?=
 =?utf-8?B?ZG93V1RsR092b0xPeHFOSzdMVjFFczcxOXhTUS9OWlVUZHZVdnVaMEVRTVg3?=
 =?utf-8?B?anVwSkFqSlM0SXF0WE0xLy93Z0xxQndjb2U0QU5WTDU4aEpFK09JTndBcmR4?=
 =?utf-8?B?eHd2anFTeXV0aGJIcDBMWDZKRnpIa2FidnV2WlhqR3pqbUFuVG1qbGRwY1Mw?=
 =?utf-8?B?TXhIOWdlNzJBa2Z5Yjk4eklzT3BGZm1JQXRCb2VJSnBnYkZ6bGs4Q1hDazlS?=
 =?utf-8?B?dHpmMlF0SXlBQUZHbUxPcTZQSzNFNEplUnlrUjFYeko0RExXU0pzYW00TVZM?=
 =?utf-8?B?WlI1L29BY2c3alh5bmp1Q1dXWTljbHZ5WStFb2x5MDlJd2RURE00emRvRGti?=
 =?utf-8?B?RHJ0a0JNQUNVOG8xVWdnS0xjSG5kSy9xSjBnTERKZWwwMks5Y3BteWVCcXhU?=
 =?utf-8?B?cWNIb1k3S0FXbnlNaXlsYkFvSFJZMmk2ajl5ZXhmQ0xMZWRXVjR5QkdDSTlz?=
 =?utf-8?B?KzJydGNvTDlocEUyQjFoKzA4YmU5Vnd5c0xhRUVlNytoYnk5RUl2MXQ0NkpW?=
 =?utf-8?B?enpCa0w5SlV6SHZ2TXlTMk1XWXZYdjFzaTVnc1dZM1lCMFlYNHZ3YThySURl?=
 =?utf-8?B?dHhZTzNxaXFBSk5sbVRRWDMyMDVYaDRxVnJJNFYvZDF3YWR3ZU01dWpQMlRo?=
 =?utf-8?B?bno0S1UrcDhSOTh6UWdmb0dRRXVwVzVIUERGZ2dwV2tMQ0F3VXd2aXJzTC9o?=
 =?utf-8?B?c3Z6NWFNdHEvMFh1Y1VCT0hzbEJCL3ViVEcyRWJQR09YNHM2cTVUbkIrYllz?=
 =?utf-8?B?eTUrRUtXeUhQVlp1OXlEdHlyS0wySkFlZkw5RmJBVU4xclM5bHRmRnNpamdq?=
 =?utf-8?B?MGovcGp1bGZkeXlzUUtROEs3UmZkeFJlS0p5TWVFRWJGZlI3NDJvMUxLY1dw?=
 =?utf-8?B?WjE4OEliK3lmRjVqOENGRi9qU0t2eEN5bjJqTXdianVxUXNyQ2N6QVJ1R0RK?=
 =?utf-8?B?UWtMNFZIbktSTmx1MktWNEVYbG1MbkYyVjJ3MEhUQWEzL290eEhjQzVFT2RS?=
 =?utf-8?B?K3ZoL3YwaXJOTE9ITkVCV2VVZzY2dEdXV3owRDdqUG9BaVhid2VqSnpTVGZu?=
 =?utf-8?B?d3RhMnpadmQwU0pzNE5USnNXNmtuVGdVSjlxU0JaSVUxeVNOOENkY1N3bytQ?=
 =?utf-8?B?YmthaHB0K0ordUR3MDBDQlg5WVpsMitxVVMvVHBETEFYcWwzc1MxUXg5MU5G?=
 =?utf-8?B?VStrdkwyV0JxZlM5L3lCdkMrT2ZRdFhZd3p1NGlrWTIreHpWakNESkJKSU1B?=
 =?utf-8?B?dHdjcGF6TWphTE5BKzdESlBhTXFndyt2dlB6TkV3amZBMEo4V0I4alhrWUo5?=
 =?utf-8?B?TXFHZlRuTjNQdGJJYTdxLzBLSG1pcXlxN1ZNTTMyN1lZYzNiZnc3SkZNYkJj?=
 =?utf-8?B?M1VGditwaGxpT1ZSUUhUbGxXUTNDZ2FwVjZ5T0VqME5oVWk0NXFkQy8zalN6?=
 =?utf-8?B?VVg2dlBRUGF0Ny8rbGZjTU9XS2lGZkEzbERRejA4Sys3VFhoc1dXa0I3ZUJn?=
 =?utf-8?B?Yk83NElwbWhpTXhOUFF0VFJ5RVNNTUR6a0lnZGRZMVFIbDBodVAxaVd0R0tG?=
 =?utf-8?B?WlVvZUVXZndFU1lYbDFvRFBVcHlENS9iTEtYWk1yUFZ1WlhvaCtDRzJyNDBX?=
 =?utf-8?B?UWVuMUVYV3NzMHhLVTg2dHZKOEMyUUltK1Z1ektOdGNyQ1B6Y0FsMkhPWFF5?=
 =?utf-8?Q?0G3FyptgLO9hH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWJYQVRBdUY1NVE4NjhiU29Jb3YzTExHSjlYcXVPVDFVUFpRaWtPR0QzZmpu?=
 =?utf-8?B?Rmx1cmFQMExQWVhDempWdGM5YTNkclFRQVZkdmNuSUJnayticUZFZHI5bU9O?=
 =?utf-8?B?V0Z0bEYzTEdsSjhCZkdodWl6aXZ2WGw0R1lubENIUm9IZmlKNnVoT3BpQkp6?=
 =?utf-8?B?K3F3SFFYdEVqZmV3L21mMlpwbDhrM2xkQzkwNzI4V1ZUdTYzQitxUHdyU0M4?=
 =?utf-8?B?dWYvcWV6d09DQ2FRRTNOdXFIRUpqcVdSSWF0L3hZeDFIOExoNjBLNDJFbzhv?=
 =?utf-8?B?RWF0cHMwZXpPL0FqTnBzeTBrM2U4K3dkQnJicmtVSFlDNll1dVN2VVV2YlFm?=
 =?utf-8?B?OVEzZ2tDcTJ2Wkh5MUlTSlh5bjRyNi9TbmFjV1JKV0Q4VnM1djgxTWUwblJS?=
 =?utf-8?B?MXZjejY3RXZwRCtBM1RGQU9pVzI0dGJMWmh1RVFjYXlRWUJBOVdvd3Y0c1hJ?=
 =?utf-8?B?eU1xN29WL2VzcGt5Q21zekZkSnQvNmh6MExuZlRXL0dlQUVVZnFpb3V6ZzBi?=
 =?utf-8?B?aEc5OE9YNXFXUzNOOGFlNTQzVUFYQnhtaVVJUnFCUzdUb1UwajEvOTFsdkVh?=
 =?utf-8?B?QkVHdnNBTHBlc3pZbFpTdmNFZlFnZ1B0dTVVZ2lZZmJYOEM4c2NlNzUzaUxO?=
 =?utf-8?B?M09Qa2YvZm14dW52N1dVQ0haeGJqa1BDMVo3TG1DNmtRQWpJOGRyVXU5aXNE?=
 =?utf-8?B?MWhKUUxoMEpiblRtczl4U2ttb0g2MlEyQkhnWDdYUk5vVHhMb2pBRU0xWUxU?=
 =?utf-8?B?ejNvY3lWRXVsU3JSTStMbWYzL0Y3ZmlmQm9TRVVFM05MN0NsOS9jQlY1cVdl?=
 =?utf-8?B?YXFNQ2pDRXZrUXBzd2FsQ1hwVGJLRUtnaWtDNmVQR3ArNGFGL2lLbCtwYi9G?=
 =?utf-8?B?YUZVZFRmbUxURGY5NElISFc3bkg0VnZRN2tHTWJOOXpjY1orUnpOaGQ1R2U5?=
 =?utf-8?B?emRwQWY0Q3BjQkVUNlVGUElUcndYejhKQUwxWHA4VU5PVnllejBhTE11d2pv?=
 =?utf-8?B?dFZDdEVhd1VXY0hRc0E4YWYydXFYN2FCUUdlSlNtQzc2V2NsUEF3SS9yb0Jj?=
 =?utf-8?B?U2NsekRKZDJBQU4rUXdSVHl5SG5ZdWFWZXRhdDBGN2hDREprOUN3bGlJOHFP?=
 =?utf-8?B?bDRycWtwUFUzYTRDUVpVZUFDdytzTG8xRDFEemdSWmF2Zkk1OFBlb3ZtMnNW?=
 =?utf-8?B?ZjY5dUozRTFTaTFZOHM0NkxUbGgxYWRVWkE1NU9BM1RHc2V0V3BuTmkyZm5P?=
 =?utf-8?B?MlNnN05JT0I3QTlKR2J6YmJKQzVHT2hFK2UrNm9TckRmUzF0UnBXUXlrWFl0?=
 =?utf-8?B?WWZGK28zRGlBdnVxbUlFNHVaMExwc2lrVjBUdVZGWUpIWkl1YVhONCtseEVr?=
 =?utf-8?B?b2ZTa0d0OTNSQWtWMjY4YVgxMkdqWkRwKytlWCtPRkQ2UFRSUzQrWGxQWTRK?=
 =?utf-8?B?U1Z4NnpaYWNHWkx0ZzZpaHdIY3VzaDZJUGV2VWgxZG4wWXdZTTNXNWFWdUZv?=
 =?utf-8?B?bnNnZ1k2ZnlWZHpCaEx6VUlJQTgxOWlnZTBmOTkwTWlZaXM1M0xTQURsL2o3?=
 =?utf-8?B?SEZYRHMrREtmclltbnhvTEZVdy9uUlZDOHFuUkRQU2tpNHJyemhYOWdXVzh0?=
 =?utf-8?B?cm0wWmtiZFFPWHhMTytyV012aEtMbG5OekpBTzk0TTdrL3hkSnV4UjFaYzF2?=
 =?utf-8?B?Z2NPazBPTE40b2tvVit2UjFzbXR6Y2hKSzh4Q0p3Ym9YNnpMVUtjWTVWTHFx?=
 =?utf-8?B?L21TT2xuQnM5eTA0a2pxSXNnOU43ODl3ckRMNWowUEtWcUVCQndqN3hmSHVt?=
 =?utf-8?B?akFMTVZHc0Jwckd0VlprYjJzUFZZRjY4bzBLSCtUbDlNN0tXVStwQlVLZGlL?=
 =?utf-8?B?eHZBQURacjNPZWZuSmJzOTk4VWZOYjlXd1hCenNmMG5TYzFOUHk4dFNzTjhL?=
 =?utf-8?B?dCtGb1RVd04vMVVjeDJOeXRhelZrMUlrVVJxdWluVUJCTGxFYTFwSndmS3F5?=
 =?utf-8?B?TERkV2wwK3EreVVaaVJQVmlrZ3phUHFORnExTVVaaHg2TWNFOUFjUE10YmVU?=
 =?utf-8?B?SHNxNDJGbHZ1a0w4bndjUVFjZFJtOVpuMm10c3MzaTZPZTRCL1ZuZXVJanln?=
 =?utf-8?B?YWExaWw3SC9ldWVFR2pueVdyb0VEUTJwQUF6emEzTXhGRTNjSzdrUFU1QllO?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b50d8a-9548-467b-f3b5-08dd360b3d48
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 08:53:26.4807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 30Q/xyFgnwg0lASQZDalqY+9CbG14BtRig0VZwsIkSgG0uziD5JR7RVa2bVzCaPVup2j/LKkhPH0PIlSMkD3Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8671
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

Hi Luca,

Patch LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

Please add "Closes" tag with valid gitlab issue# in commit.

On 10-01-2025 06:04 pm, Luca Coelho wrote:
> We find the mode before adding the dynamic intel-max-source-size
> subtests because we don't want to add substests that don't have a
> valid mode.  However, during the test itself, the mode info instance
> is not valid anymore, because it is deallocated when setting the
> output pipe.
>
> To solve this, we need to get the mode info _after_ setting the output
> pipe.  Avoid passing the mode to intel_max_source_size_test(), pass
> the entire invalid_paramtests struct and let the function find the
> correct mode info again.
>
> Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
> ---
>   tests/kms_plane_scaling.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 43f578d5553b..4e74f0e107df 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1271,15 +1271,26 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const stru
>    *		max_dst_h = 8192
>    */
>   static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *output,
> -				       drmModeModeInfo *mode, const uint32_t planesize[])
> +				       const struct invalid_paramtests *param)
>   {
>   	igt_fb_t fb;
>   	igt_plane_t *plane;
>   	int rval;
> +	drmModeModeInfo *mode = NULL;
>   
>   	cleanup_crtc(d);
>   
>   	igt_output_set_pipe(output, pipe);
> +
> +	/*
> +	 * Need to get the mode again, because it may have changed
> +	 * after setting the pipe.
> +	 */
> +	mode = find_mode(d, output, param);
> +	igt_assert(mode);
> +	if (!mode)
> +		return;
> +
>   	igt_output_override_mode(output, mode);
>   	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> @@ -1290,7 +1301,7 @@ static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *
>   
>   	igt_plane_set_position(plane, 0, 0);
>   	igt_plane_set_fb(plane, &fb);
> -	igt_plane_set_size(plane, planesize[0], planesize[1]);
> +	igt_plane_set_size(plane, param->planesize[0], param->planesize[1]);
>   
>   	rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
>   
> @@ -1563,27 +1574,23 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				igt_require_intel(data.drm_fd);
>   				for_each_pipe(&data.display, pipe) {
>   					for_each_valid_output_on_pipe(&data.display, pipe, output) {
> -						drmModeModeInfo *mode = NULL;
> -
>   						if (get_num_scalers(&data.display, pipe) < 1)
>   							continue;
>   						/*
>   						 * Need to find mode with lowest vrefresh else
>   						 * we can exceed cdclk limits.
>   						 */
> -						mode = find_mode(&data, output, &intel_paramtests[index]);
> -						if (mode) {
> +						if (find_mode(&data, output, &intel_paramtests[index]))
>   							igt_dynamic_f("pipe-%s-%s",
> -								       kmstest_pipe_name(pipe), igt_output_name(output))
> -								intel_max_source_size_test(&data, pipe, output, mode,
> -											   intel_paramtests[index].planesize);
> -						} else {
> +								      kmstest_pipe_name(pipe), igt_output_name(output))
> +								intel_max_source_size_test(&data, pipe, output,
> +											   &intel_paramtests[index]);
> +						else
>   							igt_info("Unable to find the lowest " \
>   								 "refresh rate mode on output " \
>   								 "%s pipe %s\n",
>   								 igt_output_name(output),
>   								 kmstest_pipe_name(pipe));
> -						}
>   						continue;
>   					}
>   					break;
