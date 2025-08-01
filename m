Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40219C87FCA
	for <igt-dev@archiver.kernel.org>; Fri,  1 Aug 2025 12:43:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C010E84D;
	Fri,  1 Aug 2025 12:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVycmh4R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B552C10E856
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Aug 2025 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754052195; x=1785588195;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NMiCt8zC7jGEb8feTadwVpd9Xrl+nm/asVbPVI5mM2I=;
 b=mVycmh4Rvb8tD8IUHjTpyveGI58m1uKBozWOT/LBrGTFqufKQuh2bC92
 eVL6XeTafWNILLyv3xf84dsR7zsU63iCkUE855iPfAR+HT01PJEa5ZFBb
 CnwfAdgqq0RoyONE3o9vvLz99CKuSPpyp1/WfOyZf8JSsZR9xo5eb371V
 IQUYI14XQeO+cFmioEXPb8JNZeNHlPSR2MAICddCjVFUczvPSruXfXFAI
 VuOP+aNfWEvuKzmaayDMzLGSXd4Y7rXNkgbHlFutiOz0e/6FWsHcpijLb
 C+OqZkso71UyRFNbYSMYTGGJE0mQjuUTmEEl7OfulCpk52+tVpjQO+r3/ g==;
X-CSE-ConnectionGUID: r56UtlsWSHyRRTWo8fzBqQ==
X-CSE-MsgGUID: 2XVBSwMpQt6BUmpkcWNkAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="55459550"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="55459550"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 05:43:14 -0700
X-CSE-ConnectionGUID: g0iQ5RHFQEiEhhz4Uh2prg==
X-CSE-MsgGUID: t7H1TsWwStGUw6H+9yx21w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; d="scan'208";a="168039821"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2025 05:43:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 1 Aug 2025 05:43:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 1 Aug 2025 05:43:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 1 Aug 2025 05:43:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1sxfLyvv3NsmPXBYW23EWgJMSMvzbETqTFk9HPqUMNqLinBlge+i/KsVSXTqB6WsZlGI5n3A+eKyJ13bL0mGGv+fbePgFhyp8aOZ/7yTtCXgbzZ7oanoM1HV9U3axM5Sf1uEqzBD/qj9VT8ftzxI4ythQg6+o71Tta/IYHnwF0VMdQgaTgBpZa1Q9o7SSva/T9Yus1r6q5il5bzjEYWsKTbYuS6jMXGC4nVgWVkbdekINQ0F3gvN9XGbFjvK84bf9vm6tGB8yKZYlzO5Y9Rn70SUPcLGf3ypv5yEMNTDTNIdOXyXpAD00TIgr5jwUIQMIKVRoaWe7s0W2gW2Y96Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3sgBRsFsc01GRBxs1CD0ihCzk/jP8FservqRZiGkN0=;
 b=oZBi/wnveobZTkUft7WpnnrZIIxeB6LG98Q/kFvqJamwisqxoG585pGUvrY3aBiotBCVuFugKEc5/bjuYAFZw/yV4blVa9sH6E/UIsiGmUR68QeQF/PZQgRgjS4h+kC61cqiQpGETEKE6uiKuwDuA+NXFIP/MSuHkbnXT2RzpZtA9Q1u+5mE/tIIWVnYI+Xa/D0KEAJojHxFPKTmlarii9evYxdH0ASdHgr626kfAtAFS7IjkqUgzWZn1F2jBvZAbVH2g9ZaztuZKdx01Oyz38mq+PT6SwWyEcJbmCSOUdU1EHXWGc4C3Mp1v6waEYSeDKGejZEt9a8nt8rwmpsF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM3PPF2B3CC4BE4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 12:43:08 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 12:43:06 +0000
Message-ID: <7484489f-7979-429a-b778-1927c9e79cd9@intel.com>
Date: Fri, 1 Aug 2025 14:43:02 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/xe_sriov_vram: Add test checking VF
 access to VRAM
To: =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <marcin.bernatowicz@linux.intel.com>,
 <michal.wajdeczko@intel.com>, <michal.winiarski@intel.com>,
 <satyanarayana.k.v.p@intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>
References: <20250717090812.28628-1-lukasz.laguna@intel.com>
 <20250717090812.28628-5-lukasz.laguna@intel.com>
 <20250731082901.4ykdpmnywkx7ythr@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250731082901.4ykdpmnywkx7ythr@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0012.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::7)
 To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM3PPF2B3CC4BE4:EE_
X-MS-Office365-Filtering-Correlation-Id: 83188b77-3ac4-4191-e64b-08ddd0f8f6ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q29jY0tLRGcrbVVyRW1iY3dxYUNGZlhWUUpQRVN0TlJpYXRBQThyU0p2a1FF?=
 =?utf-8?B?QTQxSDEwdkRqUVdWdWxScWUza2RIQTdwT2JSeUZzL3FHU3JTYlpKYmx4dm1x?=
 =?utf-8?B?Y2JXM2N3NTZBZmRkQjd4aFdxZnMydTBTTjRjYlZMOW85aUZNWHIra1h3TnNw?=
 =?utf-8?B?SHpqNFhvK1czdC9jRnpjSi9WNlVpejA2aGU1eEFWbTRPRmVJWWNMdkkyanll?=
 =?utf-8?B?eStvU2JpRGxuVEg4SlRPeFhkOFJKU2NOMW1HU0l4b0N3VG51M29ha2I0U1ZL?=
 =?utf-8?B?T3FPajZMaUhwazdEOU5hSWRuLzRobzdDdVpCTW9tbklJa3daZWR3TFR6TFFP?=
 =?utf-8?B?aGU4QUo2Z2paZTZZSWRUUWRocGcwRVpwTzVvZC9wZlo5cHlWb0FldjdCeVgx?=
 =?utf-8?B?ZFA3RkMvWGxFR202OEtSazVidURGcmExb3hONnQ0M3UwbU03QURQTnpwSHI2?=
 =?utf-8?B?elRHUGpiKzBsd3BWMVhFeW4xY25OY0VPSk5ZVVRFUXIyckhFWTZXQm40UFBS?=
 =?utf-8?B?Vmt3QkRyQ3FpclFLbGgzN003MUF4OXhmR1Q0RnB3TVI0NFRiZTFLV1crRG9p?=
 =?utf-8?B?SDRqRGp0YTFSbG5kQzdnQ2dLRHI5OHd3Y2VwWHYwUnh3R21FUG1mbDlSSlk0?=
 =?utf-8?B?ZE1aMCtkeGpHS2lGL3h3YkJWck1kUDhWcGpYMFlXYk9DekRSdnZVVGlnbzhB?=
 =?utf-8?B?eCtQUk0ySUhpR2ltZGJ4NHREZDl5OEdBSlF3TklrRTVreHl3cW9jczBhY1M1?=
 =?utf-8?B?QmcrN2tKNUh3c1Q3UEpiSS8xOEMwWjZEWG9uYnFqS2FXSGRlUkY4eWFoZk91?=
 =?utf-8?B?dlQ5bmxENE8xalRVSktueEpvd3RIU0NlVFRYVVJScVpEMCtlTW40YllSOE1K?=
 =?utf-8?B?d1dWU2JFREF1SkpXMFdndlZkWGl3cVBGL1U4T2NmaEtRWmJiaVYyaVJPb1I5?=
 =?utf-8?B?MGY1NS9Kc0JucmRzcG1BVXRwN0pzWWFRb25wSmIyMlI3NFdhTVgxWUhTTnpZ?=
 =?utf-8?B?VHJXM1ZnNHl0QnZhOEhTdkE0Ri9OeVBjZHBMNDNrR2E4QXJpWk9RK1BxeG84?=
 =?utf-8?B?ZGxEanR1S1BLNGFCZGFpWkNrcEloOXlIbzA1aVBpdWZHam5DRDRpaE1iK1d3?=
 =?utf-8?B?Ym5RNk9mY3dZSzI4MC9ZTDZWUzJKRjVJbDhDeEZDVE9nbjlxeFZuQUlISGMv?=
 =?utf-8?B?cm4yQVZtaVprUnlvRk9rRk4vdThUaUpKbVdFbDh4b0JrOFlZWUVSa1FnTjFo?=
 =?utf-8?B?dVc2dzE4Q3hjaGVJTmIvdGs1UnE5SXN0RmJ6S0VEU2hzazVwcU9yVWpSYW9G?=
 =?utf-8?B?SURvb0xxRHREZHlaRjNmbTE4Mlk1STdpNytpRG5uK2E3aWg3VjdJYTFIOXNu?=
 =?utf-8?B?bUp2SEM3RXVYekFNcnZqSTZ3bXJ4emU4MVJ4VFRnc0RhTzBNRS9RaDk1TVlM?=
 =?utf-8?B?azFaRTBhVjQrVHl5ZGkwaFpwRlcvK1Z1UFhlNWZUczkwcENWeHhxcWQwV2lU?=
 =?utf-8?B?YVV1UCtXVUVqVWhvNWlRQlFtTkx3eld3cEhCYlFTSGpPeUVJYmJWVE13cHQ5?=
 =?utf-8?B?YUdXVWVTVVA2angzcHhGd1hhV0hRS1h0Z0hrMlovRVdNTEREUUdRZUdJRGRK?=
 =?utf-8?B?QkRMRG5Ydk5aeWxzdHIrL0RUUll0VDVjRXgyR3RRVGx1VjYxZzdmNnYwWUhZ?=
 =?utf-8?B?R0VKdjRmd3RYRjY2Z2c1YUI0clpBN09aSUlqQ3BTNGRYR1JSMXYwV0tFNy9u?=
 =?utf-8?B?czNnRGM3Q2kvUVMwekVIdEFqV1J1UE5pbmJMM2xwRHpYY3lGNXRSVmgrRTV2?=
 =?utf-8?B?R2NVMkpRVlM2SVBJZmJPakZqb1FIdWhiendIKzlrVGg3RDZXd2JxL3pIeFh0?=
 =?utf-8?B?dSs5MGhxdVpyWEpUSGZyeVlncXlXTGY5Wk1qOXZqWi9KMTFuTktuR3lQTWt3?=
 =?utf-8?Q?x2u9ru/nFMU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHp6M1lweGpaMTIrQjc3QXNrclhVbDhDT1NUQ3BOS2draytnayt1VFN1NUR6?=
 =?utf-8?B?eGxNYVpaTndqMUNGTVV1RkFMS1U3WTJSMzRnRWsxU1pPMjBzY2NtRk5RVmJn?=
 =?utf-8?B?b0lkRDVaTlBjWUxYM3ZLZHpxWGNuLzVNamppOXA5V1pOekZnUmpadDBBMi9D?=
 =?utf-8?B?bG8vWTdpUmNsTitpci9TWGxIcHBnNXlTNDB3ZW4yOTNjNWo5Y1VQZWg0VnBP?=
 =?utf-8?B?M1hpSWtxNWFvTVBMZkg4b0pkSWZtZ0o2Rlp0L21FSnd5QXRHT3QwUGN4Vzl0?=
 =?utf-8?B?cHNnNHZyWmRINDQzZUtZZWxRMm9XTlNSeXdvTGwwd01Sc1d5UG50b0dUYUQv?=
 =?utf-8?B?YldYa0dpRVVYZWhXd1grd05ycVBwbkQrSUlHYkQxRFBjK0pPTThxSGlQQU9T?=
 =?utf-8?B?dlY2WjhJcVVmd0JnN1oycVNZTVZoNko2ZVhvZGE3RXI1MllyZHhUY2UrZjNQ?=
 =?utf-8?B?dU9Rb253WXE4RHZNbklJSUlHUzlEUEptdW5ZWHNsVTh6SmI2U0V3N3BDMmZG?=
 =?utf-8?B?dkJ4RnYxNEFJNmRuUEtUMHlaMGFpejBSTlVuT0Nac0dyWTVpOHNCZzdOSlIz?=
 =?utf-8?B?SHo0WVdwUUREOTMvejBPdjJZYTEzdlRkK2RoM3BJbUZ0TzZLYTJycG1pUzEw?=
 =?utf-8?B?KzdQd1ZFTjltRzNmRlh3Umd1RkVtd05yWTZIUFN5L3MzOTRlaVI4bWdaZnNz?=
 =?utf-8?B?THd3bE9pWE1RRU1OOEdaa0xIbE9CYlJQbHptcGh0SFh4OUhKZWJDN3NpMnVL?=
 =?utf-8?B?blgrc0VMNlJLeFFsVmZScC8wK0g3U3duOU5mZmxTZFVBVnBuTFRpdVNUOXJY?=
 =?utf-8?B?L0crS3FVQytUeS96Qk9LZitpWXhwT1I1TkRjUEU1RG5hNzR4bmxoazJDaHlI?=
 =?utf-8?B?R0NseDNGQjhoanlISVk2Q0tlUk5tdkdvRzVzV1ZhMjc2ME5WOVd6KzdEa2xL?=
 =?utf-8?B?YXl5UWxTQTdPeHRCRkREREp0UTFoc3NwR3U2RXE1cktQTEV4Z2dmTjJYQmdI?=
 =?utf-8?B?OVpUcndQa3V6N1I5aEQ3UnUveWo2MW9oMUlSZnBqdVNLY2g5QTEzMGlxWlZz?=
 =?utf-8?B?SW12SUxtd0RxUVVPSVQ5ektUS01ZQ3h0ZFZ3YmllVTM3MXJGa3laeTVyMFZR?=
 =?utf-8?B?em5zWk5PaWVnL3BETnQ2dGVFVVJWM1dEVENUZmVhR3NUVU5HckFUTHQvTDlX?=
 =?utf-8?B?dWxRZGlzU3ZPZ04yYUUxTCtYUkJEQk9LUEtlVDRUZ09yYUtWOE5oblFRSjFn?=
 =?utf-8?B?UmdkNm45dEpvL1pWZFJFTllkb1RFTkl1cFhpMnN5bXlFYXp5VC9YakpXeTVX?=
 =?utf-8?B?cUF1Mnk4QlRKVDJIbDh0MDJZTUJvZS9lcVZKdzB5Y1Ridnl5dlNoRE1zZHc5?=
 =?utf-8?B?U0FGQUpqTWp3SDI4eFQ1MEtFL1Z3SWdJN2lUM01KNGs5Mlo1YkJjNVNxVzZV?=
 =?utf-8?B?eFpidzVYS3loLyt3MG01Z3UzTVdRVEZVOEJtSVhUK3FiM2Jmd0tBRmFPV3NV?=
 =?utf-8?B?cUNMemNabGFXMVNDeWRQMW9WZk1pNzgvbnRLVzM0MGhZSjBFTHFMRnBSYnE1?=
 =?utf-8?B?Tzk4TUhkTWN2VlNheWlLaUVwV0pacm1sRkg1MithN3V6cUNBWWFoR25GNk5s?=
 =?utf-8?B?bVNFYWtHdEZQQWhpR2dRSVdGSVczNnZ4ZmRrMVErTzdkMSs4dVNvenZpbXJG?=
 =?utf-8?B?YXdURzVicVNoMlZ2dGxwUU55SzVQV0hOblJYZFB5RUo3VXVGNEFldVIvczVy?=
 =?utf-8?B?dGF0aXJXMExpSm1MUlI1SnNITUNBelB0Zk53ekE4dmdSVEZERFdjUm94MUtK?=
 =?utf-8?B?ZUhZK3l6NEhZSkhVYzRhS0EzUVdIY1RoRkdHWFhTNjhVTjA0MEoyTHhTdHYx?=
 =?utf-8?B?UFc5LzBKTjBoZWQ2QmI3NDNmR1g1bHl1YXlPdHp0bjY4dUZsM2M0Z3c0eGRC?=
 =?utf-8?B?YVV1RVV6YTRTMFVOelNnNFQzbktEQlNXaE9PWGU2MXp2aU01WGtuYklIeFNv?=
 =?utf-8?B?RzVHaUdFZmo5bjlINHlFaE1ma3VNS2kxdTJQMHFtaEluVWNQV245QmZqeVNw?=
 =?utf-8?B?cytsY2Y3MUNjT1pJS2dDQm40MllnZVpOOUNhZUpOOGFxRy9lSDllNkJBNnJG?=
 =?utf-8?B?YVRIbVl6V2F0SlZwdktQNmE4ZmU0RVBpRjdCRVpsaExWSDVpc1g1STM0VmEx?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 83188b77-3ac4-4191-e64b-08ddd0f8f6ac
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 12:43:06.7832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6G8opxRlJhbAQtjMGXP7/+W0GF9Y/JLF7WYESoslaZMrRsn+jc1tNi/9bCSzDXU1FGLW2RooXUcuOzyW4+UXlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2B3CC4BE4
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

On 7/31/2025 10:29, Piotr Piórkowski wrote:
> Lukasz Laguna <lukasz.laguna@intel.com> wrote on czw [2025-lip-17 11:08:12 +0200]:
>> Add a test to validate VF access to VRAM via BAR. The following
>> scenarios are covered:
>> - VF can access all provisioned memory via the VRAM BAR,
>> - VF cannot access memory beyond what's provisioned via the VRAM BAR,
>> - VF can access memory via the VRAM BAR after reprovisioning.
>>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   tests/intel/xe_sriov_vram.c | 310 ++++++++++++++++++++++++++++++++++++
>>   tests/meson.build           |   1 +
>>   2 files changed, 311 insertions(+)
>>   create mode 100644 tests/intel/xe_sriov_vram.c
>>
>> diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
>> new file mode 100644
>> index 000000000..82f0a2f09
>> --- /dev/null
>> +++ b/tests/intel/xe_sriov_vram.c
>> @@ -0,0 +1,310 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright(c) 2025 Intel Corporation. All rights reserved.
>> + */
>> +
>> +#include "drmtest.h"
>> +#include "igt_core.h"
>> +#include "igt_sriov_device.h"
>> +#include "intel_vram.h"
>> +#include "xe/xe_sriov_provisioning.h"
>> +#include "xe/xe_query.h"
>> +
>> +/**
>> + * TEST: xe_sriov_vram
>> + * Category: Core
>> + * Mega feature: SR-IOV
>> + * Sub-category: LMTT
> LMTT != VF VRAM
>
> Either assume that this test tests LMTT  and name the test xe_sriov_lmtt,
> or else you cannot use the LMTT subcategory here.
>
> In my opinion, this test  tests VRAM access via LMEM BAR on VF (and indirectly LMTT),
> but these are not direct LMTT tests.
>
> But what if the platform used some other mechanism instead of LMTT?
> The xe_sriov_vram test should still be valid.

OK, I'll change it.

>> + * Functionality: VRAM access
>> + * Description: Validate VF access to VRAM
>> + *
>> + * SUBTEST: vf-access-basic
>> + * Description: Verify that VF can access all the provisioned memory via VRAM BAR
>> + *
>> + * SUBTEST: vf-access-beyond
>> + * Description: Verify that VF cannot access memory beyond what's provisioned via VRAM BAR
>> + *
>> + * SUBTEST: vf-access-after-resize-down
>> + * Description: Verify that VF can access the reprovisioned memory (reduced size) via VRAM BAR
>> + *
>> + * SUBTEST: vf-access-after-resize-up
>> + * Description: Verify that VF can access the reprovisioned memory (increased size) via VRAM BAR
>> + */
>> +
>> +IGT_TEST_DESCRIPTION("Xe tests for VRAM in SR-IOV context");
>> +
>> +const size_t STEP = SZ_1M;
>> +
>> +static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned int vf_id)
>> +{
>> +	uint64_t size = 0;
>> +
>> +	/* TODO: adjust for multitile platforms */
> Why not make a multi-tile version in this patch?
> It will be necessary anyway.

IGT helpers currently support GTs only - and it's because the driver 
exposes provisioning data for GTs only:

  *      /sys/kernel/debug/dri/0/
  *      ├── gt0
  *      │   ├── pf
  *      │   │   ├── lmem_provisioned

AFAIK, it needs to be refactored to include tiles as well 
(/sys/kernel/debug/dri/0/tileX/gtY), so support for multitile in IGT can 
be added after it's properly implemented on the driver side.

>> +	size = xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id, 0);
>> +
>> +	return size;
>> +}
>> +
>> +static bool validate_access_basic(struct vram_mapping *vram, unsigned int vf_id,
>> +				  uint64_t provisioned_lmem)
> NIT: s/provisioned_lmem/size

Ah, definitely not "lmem", as everywhere else I used vram.
I would prefer to use "vram_size", as "size" is not descriptive enough 
for me in this case - especially that we also use vram_bar_size in the test.

> hmm, If you later use size_t for offset, then I think you can use it here also.

That's right, I'll change it.

>> +{
>> +	uint8_t read, orig;
>> +	bool passed = true;
>> +
>> +	for (size_t offset = 0; offset < provisioned_lmem; offset += STEP) {
>> +		orig = intel_vram_read8(vram, offset);
>> +
>> +		read = intel_vram_write_readback8(vram, offset, vf_id);
>> +		if (read != vf_id) {
>> +			igt_debug("VRAM write/read check failed on VF%u (offset: %#lx, write: %u, read: %u)\n",
>> +				  vf_id, offset, vf_id, read);
>> +			passed = false;
>> +		}
>> +
>> +		read = intel_vram_write_readback8(vram, offset, orig);
>> +		if (read != orig) {
>> +			igt_debug("Failed to restore original value on VF%u (offset: %#lx, orig: %u, read: %u)\n",
> In the log, we should probably use full names instead of variable names.

OK

>> +				  vf_id, offset, orig, read);
>> +			passed = false;
>> +		}
>> +	}
>> +
>> +	return passed;
>> +}
>> +
>> +static void access_basic(unsigned int pf_fd, unsigned int num_vfs)
>> +{
>> +	uint64_t provisioned_lmem;
>> +	struct vram_mapping vram;
>> +	size_t vram_bar_size;
>> +	bool passed = true;
>> +
>> +	igt_sriov_disable_driver_autoprobe(pf_fd);
>> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +
>> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
>> +		provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
>> +			  vf_id, provisioned_lmem);
>> +
>> +		vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
>> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
>> +
>> +		if (vram_bar_size < provisioned_lmem) {
>> +			igt_sriov_disable_vfs(pf_fd);
>> +			igt_skip("VRAM BAR size is smaller than provisioned VRAM\n");
> I think this is a valid scenario.
> In that case, I think we need to limit the test to the size of BAR.

I have mixed feelings about this. On one hand, I agree, but on the 
other, in such case we might incorrectly assume that everything is fine 
and passing, while there could be an issue that would only appear when 
testing the entire region. I considered adding a warning in this 
scenario, but a warning would result in a failure in CI.

LMEM accesses can still be validated in the dynamic subtests that enable 
a large number of VFs (in such case even on small BAR systems 
provisioned_lmem < bar_size). Talking all of this into account I think 
it's better to skip the test.

>> +		}
>> +
>> +		vram = intel_vram_mmap(pf_fd, vf_id, provisioned_lmem, PROT_READ | PROT_WRITE, 0);
>> +		igt_assert(vram.addr);
>> +
>> +		passed &= validate_access_basic(&vram, vf_id, provisioned_lmem);
>> +
>> +		intel_vram_munmap(&vram);
>> +	}
>> +
>> +	igt_sriov_disable_vfs(pf_fd);
>> +
>> +	igt_assert(passed);
>> +}
>> +
>> +static bool validate_access_beyond(struct vram_mapping *vram, unsigned int vf_id,
>> +				   uint64_t provisioned_lmem, size_t vram_bar_size)
>> +{
>> +	uint8_t read, orig;
>> +	bool passed = true;
>> +
>> +	for (size_t offset = provisioned_lmem; offset < vram_bar_size; offset += STEP) {
>> +		orig = intel_vram_read8(vram, offset);
>> +
>> +		read = intel_vram_write_readback8(vram, offset, vf_id);
>> +		if (read == vf_id) {
>> +			igt_debug("Successful VRAM write above provisioned size on VF%u (offset: %#lx)\n",
> I don't like the word “successful” in this context: we just failed at something and the test
> returns “successfull something”.

Good point.

>
>> +				  vf_id, offset);
>> +			passed = false;
>> +
>> +			read = intel_vram_write_readback8(vram, offset, orig);
>> +			if (read != orig)
>> +				igt_debug("Failed to restore original value on VF%u (offset: %#lx, orig: %u, read: %u)\n",
>> +					  vf_id, offset, orig, read);
>> +		}
>> +	}
>> +
>> +	return passed;
>> +}
>> +
>> +static void access_beyond(unsigned int pf_fd, unsigned int num_vfs)
>> +{
>> +	uint64_t provisioned_lmem;
>> +	struct vram_mapping vram;
>> +	size_t vram_bar_size;
>> +	bool passed = true;
>> +
>> +	igt_sriov_disable_driver_autoprobe(pf_fd);
>> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
>> +
>> +	for_each_sriov_enabled_vf(pf_fd, vf_id) {
>> +		provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +		igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n",
>> +			  vf_id, provisioned_lmem);
>> +
>> +		vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
>> +		igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
>> +
>> +		if (vram_bar_size <= provisioned_lmem) {
>> +			igt_sriov_disable_vfs(pf_fd);
>> +			igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
>> +		}
>> +
>> +		vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, PROT_READ | PROT_WRITE, 0);
>> +		igt_assert(vram.addr);
>> +
>> +		passed &= validate_access_beyond(&vram, vf_id, provisioned_lmem, vram_bar_size);
>> +
>> +		intel_vram_munmap(&vram);
>> +	}
>> +
>> +	igt_sriov_disable_vfs(pf_fd);
>> +
>> +	igt_assert(passed);
>> +}
>> +
>> +static void resize_and_access(unsigned int pf_fd, bool resize_up)
>> +{
>> +	const unsigned int vf_id = 1;
>> +	uint64_t provisioned_lmem;
>> +	struct vram_mapping vram;
>> +	unsigned int total_vfs;
>> +	size_t vram_bar_size;
>> +	bool passed;
>> +
>> +	total_vfs = igt_sriov_get_total_vfs(pf_fd);
>> +
>> +	igt_sriov_disable_driver_autoprobe(pf_fd);
>> +	igt_sriov_enable_vfs(pf_fd, resize_up ? total_vfs : 1);
>> +
>> +	provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_lmem);
>> +
>> +	igt_sriov_disable_vfs(pf_fd);
>> +	igt_sriov_enable_vfs(pf_fd, resize_up ? 1 : total_vfs);
>> +
>> +	provisioned_lmem = get_provisioned_vram(pf_fd, vf_id);
>> +	igt_debug("VF%u provisioned with %" PRIu64 " bytes of VRAM\n", vf_id, provisioned_lmem);
>> +
>> +	vram_bar_size = intel_vram_bar_size(pf_fd, vf_id);
>> +	igt_debug("VF%u VRAM BAR size: %" PRIu64 "\n", vf_id, vram_bar_size);
>> +
>> +	if (vram_bar_size <= provisioned_lmem) {
>> +		igt_sriov_disable_vfs(pf_fd);
>> +		igt_skip("VRAM BAR size is smaller or equal to provisioned VRAM\n");
>> +	}
>> +
>> +	vram = intel_vram_mmap(pf_fd, vf_id, vram_bar_size, PROT_READ | PROT_WRITE, 0);
>> +	igt_assert(vram.addr);
>> +
>> +	passed = validate_access_basic(&vram, vf_id, provisioned_lmem);
>> +	passed &= validate_access_beyond(&vram, vf_id, provisioned_lmem, vram_bar_size);
>> +
>> +	intel_vram_munmap(&vram);
>> +
>> +	igt_sriov_disable_vfs(pf_fd);
>> +
>> +	igt_assert(passed);
>> +}
>> +
>> +static bool extended_scope;
>> +
>> +static int opts_handler(int opt, int opt_index, void *data)
>> +{
>> +	switch (opt) {
>> +	case 'e':
>> +		extended_scope = true;
>> +		break;
>> +	default:
>> +		return IGT_OPT_HANDLER_ERROR;
>> +	}
>> +
>> +	return IGT_OPT_HANDLER_SUCCESS;
>> +}
>> +
>> +static const struct option long_opts[] = {
>> +	{ .name = "extended", .has_arg = false, .val = 'e', },
>> +	{}
>> +};
>> +
>> +static const char help_str[] =
>> +	"  --extended\tRun the extended test scope\n";
>> +
>> +igt_main_args("", long_opts, help_str, opts_handler, NULL)
>> +{
>> +	bool autoprobe;
>> +	int pf_fd;
>> +	static struct subtest_resize_variants {
>> +		const char *name;
>> +		bool resize_up;
>> +	} resize_variant[] = {
>> +		{ "up", true },
>> +		{ "down", false },
> NIT: Maybe instead of up/down, we could use expand/reduce.

In current form subtest name is vf-access-after-resize-(up|down). What's 
your suggestion exactly?

>> +		{ NULL },
>> +	};
>> +
>> +	igt_fixture {
>> +		pf_fd = drm_open_driver(DRIVER_XE);
>> +		igt_require(igt_sriov_is_pf(pf_fd));
>> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
>> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
>> +	}
>> +
>> +	igt_describe("Verify that VF can access all the provisioned memory via VRAM BAR");
>> +	igt_subtest_with_dynamic_f("vf-access-basic") {
>> +		if (extended_scope)
>> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
>> +				igt_dynamic_f("numvfs-%d", num_vfs)
>> +					access_basic(pf_fd, num_vfs);
>> +
>> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
>> +			igt_dynamic_f("numvfs-random") {
>> +				igt_debug("numvfs=%u\n", num_vfs);
>> +				access_basic(pf_fd, num_vfs);
>> +			}
>> +		}
> Am I correct in understanding that the basic scenario is with a random number of VFs
> and the extended one with total VFs?
> If I run the extended version, do we still want to do random?

In 'extended' version it's tested in every possible variant (1, 2, ... 
totalvfs), but you're right - we shouldn't run random in this case.

Thanks for review!

> Thanks,
> Piotr
>> +	}
>> +
>> +	igt_describe("Verify that VF cannot access memory beyond what's provisioned via VRAM BAR");
>> +	igt_subtest_with_dynamic_f("vf-access-beyond") {
>> +		if (extended_scope)
>> +			for_each_sriov_num_vfs(pf_fd, num_vfs)
>> +				igt_dynamic_f("numvfs-%d", num_vfs)
>> +					access_beyond(pf_fd, num_vfs);
>> +
>> +		for_random_sriov_num_vfs(pf_fd, num_vfs) {
>> +			igt_dynamic_f("numvfs-random") {
>> +				igt_debug("numvfs=%u\n", num_vfs);
>> +				access_beyond(pf_fd, num_vfs);
>> +			}
>> +		}
>> +	}
>> +
>> +	for (const struct subtest_resize_variants *s = resize_variant; s->name; s++) {
>> +		igt_describe("Verify that VF can access the reprovisioned memory via VRAM BAR");
>> +		igt_subtest_f("vf-access-after-resize-%s", s->name) {
>> +			unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
>> +
>> +			igt_require(total_vfs > 1);
>> +
>> +			resize_and_access(pf_fd, s->resize_up);
>> +		}
>> +	}
>> +
>> +	igt_fixture {
>> +		igt_sriov_disable_vfs(pf_fd);
>> +		/* abort to avoid execution of next tests with enabled VFs */
>> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
>> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
>> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
>> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
>> +			       "Failed to restore sriov_drivers_autoprobe value\n");
>> +		close(pf_fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 5c01c64e9..6054a2c34 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -329,6 +329,7 @@ intel_xe_progs = [
>>   	'xe_sriov_auto_provisioning',
>>   	'xe_sriov_flr',
>>   	'xe_sriov_scheduling',
>> +	'xe_sriov_vram',
>>   	'xe_sysfs_defaults',
>>   	'xe_sysfs_preempt_timeout',
>>   	'xe_sysfs_scheduler',
>> -- 
>> 2.40.0
>>
