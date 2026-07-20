Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D49C44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 06:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4E0210E129;
	Mon, 20 Jul 2026 06:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fX+8NJid";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755B410E129
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 06:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784528232; x=1816064232;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0ddcB0mmZWS44wjDYcXmpm04JRSA7a5E3wbWzJOR8B0=;
 b=fX+8NJidPGO4xM0G3nEpnRLMxdM9S4H8Si3XPMffgLTVlACcy5VQJ8Gl
 8HUU9YE6HNaN8JRKPfFBmVA4VRjcWEjVyiLP4/wM1hz7mgm1tI9qdhQfW
 zQiMMhjniscTLE/pyzhfvC3XeKerBuOxC3cErMkyvSQeeF39rtFs1FRkv
 K3QHIvOnRTY4iz+3XhCOIVzr4sKeVZuBwHXDCh+oFxVCRf22HnoTXRvmk
 Dd7Z+MqOY8yaAjqlY7FTnaMQ3FdDY+bVY2JoLjS0ya9oMcz1PX0Pkmmir
 LyPL5+O8CVA3fMHWuUFAaFJf3F9gPYytUAxvjp5B5mZXGw6SgHKIw7zr2 g==;
X-CSE-ConnectionGUID: 5bQXs05gTy6cKClIXqlL6g==
X-CSE-MsgGUID: ErqwNXSKQqOgDyhWbWT/ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="85300997"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="85300997"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:17:11 -0700
X-CSE-ConnectionGUID: 2MCnSTneQlifen3dy2b3jA==
X-CSE-MsgGUID: wkIsWz/iTHONHbJAdsrAZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="252992094"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:17:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:17:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 23:17:10 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.33)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:17:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fqJWbsvnROm08NIlbLKmzBzan/uCdzkum5M3eyAZOghPRlqHdvQojyqSwcgQ9ua8qW+kcSxYTymKG7Lp1expdld9ppBoFqhDg/idncwQgg3C+Tx+ca+OMbJ3wwSfIl4isA1C99bQdLDhqI4eAdGnvtlSEiFOqWbhnFoxa/Z6YWl2p9iSfshCr1a2W6ckoYRkekQl4XDuUdNjoSNnU+VF5lV3zhAwaSwhe3dJCNGYrWAfKD7J1W+E4QbvC+z8wEe/A3FffktNjHmeacVy17MyQKjg5y60qGamGXsKh86P4yDPszFZNajwdQeJRYM5FH4fr/74xDQopp/esGhAbHQq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RALCCvRRrLpvqJAH9XUNwTYUjWG7f27m0QWG3Rrm5dw=;
 b=PR41qWB5XVk7VIPAZHasMEUm6lBHiWY/MlAvntHxPufjlY1L/u/zGQVz1hSrrU6UyxeLcjdk5/OVN5dwIxmdAFgmE7BPwmPMIBOWP8OSNuKlA9vJInJwqvRO1hfWrEm0uDtfjdOFG5iTa4uQsMcg2FNwwTPkfYpIz8e6M1ys+S+0g82z6kAw70/f4wTqrRZZpTZSILccuGTZug9f21TtJv4MHnYCIblUxARN2WExS9A87HTmYrzk4USfBBpfUzmcBH5Yy/UsWWbfB2/0AsfPsZ5nW9y48T5bZMX0ahj9tT863K7vM2e4hvrKnyFKoAiqZ7iJbS8lU2e9CErDBeFHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by SJ0PR11MB5152.namprd11.prod.outlook.com (2603:10b6:a03:2ae::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 06:16:55 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0223.013; Mon, 20 Jul 2026
 06:16:55 +0000
Date: Mon, 20 Jul 2026 06:16:43 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH i-g-t v3 14/31] tools/intel_stepping: link with minimal
 sub-libraries
Message-ID: <xe7adsoihffym2mm2iplmxvucpn3j7w3jsul55mdo7ghnkfdn7@aihdmpd7xfuv>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1784117512.git.sebastian.brzezinka@intel.com>
 <bc6815175dc04b6f7efccc21b5f86d86026a5d4b.1784117512.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <bc6815175dc04b6f7efccc21b5f86d86026a5d4b.1784117512.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0012.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::16) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|SJ0PR11MB5152:EE_
X-MS-Office365-Filtering-Correlation-Id: 345d03c6-7e2d-4f2f-8080-08dee6267f49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|4143699003|56012099006|10067099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: ljw4Q7tJ6qTOpYdCwB7OuC0lva4nHMxntx0hkFQ+VN+sQlRJ0jL8WN4L+fH8ShvQGugkpHjhm/aeEV8Xh2dgGMGEcmR579f0AddMdbXOLSOfYt+/obHQ9gnOoR+NKbyd0eNuo9A25aXKqs4g6Yb6BAabKa5opxk6XF7EFnR/iW6zIInB+NEB9Ew258mx8AZDNcaLAuONg6CNo32xI6CL2an+rtuEnyYKdydogIfcA1jvEU9GVSIRoKiTEx/+9JdSLUbZ1Dn/2t3z025Tgjf7eYupfzhpbLF2ri6aC2lBRFjrI9sc9Udr1tztASOTeHtjOHAnbs2BsroojSXUD+XvxxVZHYTmD8lABqWLSyqaOeRkIETlv7ZJ2sw8i5fPN6t8z4uayRsTjyrFClBj/QpvZ8LEFUa5YtwcFghXs8t7AaHxawEL5HKruYdRxKU4jYY+hoWJxzhz2JM3wnYVrohAWrWzqLroY2MQnm/aDDz2T2fpW6HHoZOES/N3zeotln4qz3xD6q6zKnCMZ5suF9APD6S/96gX+IxFBbg8XO0/RtyGbdjU65tl61AnbU+PNgex+Fq0PBfpcJHaDwmg2uxP/m56kssPEF8+1tWecmvSYfJbfWM6DgUIi0VDw+tlbWRylwIiZcjl+7LTz8C+XArxH3tUr+fFQqEf7mJvCO2M8xQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(11063799006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjU5bE9mbWVCclZFeXVnWWFiZ09idnVDcG5CVnlqNDd3cHlxeGYzNzlRNVRN?=
 =?utf-8?B?VHJyblpRbmxZT0RVdjB4elM4Zy9yVEI1SCtKRy94cnZoT216eDJpK1VvZjYv?=
 =?utf-8?B?bEtFZEZDY2UzSlJNK0ZSamNGVytLT0pSNW91aWEybjFEbUJRMUIvSmpxcllx?=
 =?utf-8?B?cTg0NWMveVByV0MwWGRzVGh3NVorYkNjNXZwb2tMUW40OGZFSXB4eFZtbWRl?=
 =?utf-8?B?c1lsOE5IU1ovNzh4RzVPalVMMjdyL2FGalFSNEgwMERXZXQ0RzRpcTFsL2VD?=
 =?utf-8?B?Z1gzTlJsZjJtSG1WdUZSOXgvZXdHSG5sSmNPSzQxODFaV3NKdDNWT200bG9h?=
 =?utf-8?B?OFJuUmxpNGUwbno5WWNnWktQYVI4eXd1a3doVUVqMFRQcDVDb3lhem53VFQ2?=
 =?utf-8?B?Y3gySjFEYXdEakJJazhVRmp0Z2V0UmJFOTd6NGU1M21PTXJsVFpQcWFObnZJ?=
 =?utf-8?B?ZndNdUNrLzU1OG8rU3hQTTI4Z0lWamp3K2JGcGF1UWwzUEpNYkYwaDhaSlJN?=
 =?utf-8?B?Vi8xbGJZZkV6ZW9ZejVzWmtqN3VnTHdPaVY2VGFhMTlDbGNiYkVWcjlPbllQ?=
 =?utf-8?B?TmpYRTV1TVkvMk9SWFBhNXhPZnhTUjFUVUxwNVplKzVxL01tbGE2T3I4QlBQ?=
 =?utf-8?B?bWlaR3ZGS1JYbE1PUGZ6ZkpvKzlJdkEyei83U1JjNFJPQjkwMDMvVEpyQ1VS?=
 =?utf-8?B?UGFzRHVCRm9CRytKdHp1M2FNZERnUUY1OWkrWHJ2aXZkZ3UxM2JEc3lXMkZD?=
 =?utf-8?B?eFBFVG5YRTdJZUNOa3dwSkw4d3JaTEhtcjl6Nk02aDVwM0traEtFUzVJRmFo?=
 =?utf-8?B?RHNIZEczZ0dvU2h5L3g2dlFvekFoQ2NTWDM4aUVMRzJtWnB5L0s3eHVKRTJJ?=
 =?utf-8?B?WW50aHFtbjlyc1BYRFVaZWQ1Zy9kZVJYKzA5dUFWSmMxYUZPYVExbVR1U2JH?=
 =?utf-8?B?di94MkYramo4OGZaSG9abk1kb3JlWi93dmZTNkE5R0p1T2h4Y1FmSnVmUldU?=
 =?utf-8?B?TnBOQnVtZU5XVXVmS1YzZmQva3RiYXJLYWg2Q3o3MnpScWdMSGpHTmZka2Rp?=
 =?utf-8?B?QUw0YlZZNW5XV01DZTF4UEhvdUZDVHM1Q0JqSko0ZnZ1eHM0R0pVM3d1MmlH?=
 =?utf-8?B?SE40ZndZbXd6TzBmeTk2NjEwUUNwVEFWcldERWs2K2dQNG54UU1VenZGaDdD?=
 =?utf-8?B?bGV1bFBBbUhvQVVodHhDVnNmQUtKMFR1Y0hjYndCNHpYSTB3WDN0d0tKOUIz?=
 =?utf-8?B?K2RjbUNITE4weXAwTmVLWVNjUWNHSS9hU01lUUFsTWo3a0JOSk9BWmFtcEs0?=
 =?utf-8?B?azdwTFFaZXZ6WmpNR3hoc0xGcUZSZG9QUy8vc1JNRWxlK2ZQbFc2QmFPMzFT?=
 =?utf-8?B?TFVNRlEydGFQMzBPNGpvaGE2cmlWT0s3eUI3K3VhcG1LbFhidTFiRnlWTVNW?=
 =?utf-8?B?RmRUMUdQc2QxWE5paDBTOXVtRkFtMWMwTGs5ZDd5ZFZ1VFZnSzh3V3E4akNQ?=
 =?utf-8?B?anFPQm1NTUdUZGMzb3VFTW1xOGtYOHBiYVlVelNFMFhmQjhPaUtPMlFJSWhw?=
 =?utf-8?B?ZE1zRCs1b3NoNS9pUDVNdHUvRlJYRUF4TnFsc2dxQUJWbGF6dUdlci9vMERN?=
 =?utf-8?B?SlNwRC8vbW1QRTVjb2JMclRxVWE3Wm9NTmpyWjVhZjVGV3JqVEgyc2pBbDdJ?=
 =?utf-8?B?ZGU4cXlNb3BSUDR6MGRSM0lnL2k2bGpJOGdaam4wRFp4bGZ5K3pBdUFKVnVN?=
 =?utf-8?B?VTVQbmpUdndXQUFMUTBISUg1czRsM2R0WVlOcjBmbnpxUUNBTlNLZy84STdm?=
 =?utf-8?B?dlhaOTJtWEl5cEZuR1JLU3Foc05uZFJpZGlqRGJMbkNMKzdpbXBZRlhIU0V0?=
 =?utf-8?B?cXpGSzRPaFkyY0J6MlhJd3ZjaWVabkJybmtDbVRNbWVnaVVjbENXaU82STZl?=
 =?utf-8?B?OXlIRVNWU0M0Z1FiQ1FjMjB0VFpyMmFVRVJzU0szd1MyQjE5QkRKQTFPNGVZ?=
 =?utf-8?B?M0dFU04yMEZqNkZjRDE3R2Mxejk1WVU2VlZlMUp6SEJLWmxqTDlHMndVOUhO?=
 =?utf-8?B?UDV1aFNpdjR0dzJvSURhMUpjMExBeDV0STdvZ2JSMzRuY3ZsQnhkOTNpSVh3?=
 =?utf-8?B?ZWlLSFRPaEhhL1prNHluMkFoV285bEs4bkorTnFiQkpSVlIrVE5mTWdBbW4x?=
 =?utf-8?B?NndmVHE4RXY1bmR3eXBLazJja0hBcFRzbW9jeURrblJwQTcrbmJOb1kyYW4z?=
 =?utf-8?B?MGUreUpvOCtvMUFWVnF3bzdSbUZvdm5GVlNkdlZ2c2xlZ2lkalJBQTlsUFNP?=
 =?utf-8?B?WEZIUGxzYlRTR3o5TkpJTVd0Qzd5R2lxK0svaTNjUG4vY01BOXRKYkJQZk93?=
 =?utf-8?Q?1n5gJJFJwgS2R1ks=3D?=
X-Exchange-RoutingPolicyChecked: Hz1cBs/SOh4FUgvcQhwNGVsPjzjClrV8u9SB3atkyhJiW9WIZqeL9pO8ZtZ+P4hRIcfd/xwWbChOuwLciyLPn0b4JWEOfWD6ADwiTDzInBGr8hYV01/9j46Wui05C9tlsJj+XuYUWc8zGcrUXtO5Pej9pypgmQWoF8RVDhngfAqFyiXVbIAKRb5A8DO39xK6mMmPqRAeebo0LpTPfTJVtbmWFhWdWVz26FCkohXxU+clKTpeLeLwdEePMJ8VtCe9TUDbMKyrU0m1nKitLeHAt2PoEuiI1nTkpysBac/cvMZA1jXaV9FgCflp+5GL34Nw/MDmJuSVmwrCafrrXCwYHA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 345d03c6-7e2d-4f2f-8080-08dee6267f49
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 06:16:55.3690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbgckzoP0nwmuAS4a5B6BU4p0g3wcObS4H8OCuuEyBjEqiYOJFAXRVYBZoq2T8dglf6kBu9PeGee9H4g2JDrlk7Q9oLTZ0qiHPopWSalzlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5152
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

Hi Sebastian,

On 2026-07-15 at 14:15:24 +0200, Sebastian Brzezinka wrote:
> intel_stepping only needs the chipset tables and the small tool stub
> support used by those helpers, not the full libigt.so stack.
> 
> Switch to linking against lib_igt_chipset, lib_igt_tools_stub and
> libpciaccess.
> 
> ldd before: 35  (ldd | wc -l)
> ldd after:   4  (ldd | wc -l)
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---
>  tools/meson.build | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/meson.build b/tools/meson.build
> index 01400f53e..8eb346321 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -36,7 +36,6 @@ tools_progs = [
>  	'intel_pm_rpm',
>  	'intel_reg_checker',
>  	'intel_residency',
> -	'intel_stepping',
>  	'intel_tiling_detect',
>  	'intel_vbt_decode',
>  	'intel_watermark',
> @@ -70,6 +69,12 @@ executable('intel_gpu_frequency', 'intel_gpu_frequency.c',
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)
>  
> +executable('intel_stepping', 'intel_stepping.c',
> +	   dependencies : [lib_igt_chipset, lib_igt_tools_stub, lib_igt_drm_stub,
> +	                    pciaccess, libdrm],
> +	   install_rpath : bindir_rpathdir,
> +	   install : true)
> +
>  if libudev.found()
>  	intel_dp_compliance_src = [
>  		'intel_dp_compliance.c',
> -- 
> 2.53.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
