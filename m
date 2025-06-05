Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73613C5B543
	for <igt-dev@archiver.kernel.org>; Thu,  5 Jun 2025 12:43:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 206F210E10B;
	Thu,  5 Jun 2025 12:43:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cJMPHvvw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9450B10E10B
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Jun 2025 12:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749127394; x=1780663394;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2QSElCCSYcEQbpT2nmOmQLYeEy0qjV7fjADB7Eunf3U=;
 b=cJMPHvvwqTj0GCrbHxqHN3Exbcjq3VQYUuhyOPLcjKOHO1hQtqpT08xx
 V2eeR0BAgWrHqTqxy29tdq6kJo0jmbkR4OPciqoN/oy0TE6wah9r2HN5f
 ZXnWv6PWJHxt4MgmQiMnLD+LG45AX/yJwTgsNJ/eajEjWTtCuWFr7Ejur
 TDxUghZp8nZRaaYM8ZNm7xcwbfMXxym97+ueJHfHkpVe2+SqcNT/K21Ox
 eIfsv9WjhXz3thco0udrbvhmu5tnz7GJW6LZsjyU7DnRDz1HuB7gdV2Ro
 /Dutbvjt9omLxNdKwXK3yQwig9BfSmMV8xz2nyaubbQEbGEqA2rnsUeqt Q==;
X-CSE-ConnectionGUID: mEqc+hTgRgG5MR8gYuSlWg==
X-CSE-MsgGUID: 74weDNphS5Ko7vDCyLVzqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="62636259"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="62636259"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:43:05 -0700
X-CSE-ConnectionGUID: ZQPMoPgfQ1SnDRg7CtQj3w==
X-CSE-MsgGUID: +4xuSs8dR4SEp6q/JQnzWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="146084206"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 05:43:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 05:43:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 05:43:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.74)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 05:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQS7J6gEMIxerYdiQf/E5SwQgn77izXCMyrd/sduBZ6FBwmmQYRrsRxyOm+7jV795pDJvU40TVNI8ZDpXfGtfH5h2o0fU+YDMTme6lqD2wZyU/Yg1V4V3yfezg1/0ezSnkwSzu403XgiyFGEEg0XVHC1V9CUwWAqQpapvEUX8GMmQvVAjjT7h9NURG1ZmsWyFHzmCQNoNYnCB0FbsvTx6KvNAv6p6GvtdtDsiIgfXy4sNEBEc6oVOgp48XtguxL8enbOiixWFUU6vMd8Q/D+NmlwlZ/Jqxm5b0zd3qiAlTPYGLw8BDRHyPgZqhZNTLyoHAJ2lMzN/XG7TuhkZqrwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUt8o7JW9IdSW3Rww1xj9NKR2Fa+YPpjm0mtT3pA4Y0=;
 b=DTiNahlrDKZikf01KWTwGZHltZxm9pqnOsL53baDKe0smVW+X6aSLIS+GHGiomszd+I2HatWWvYWu3QxmP7EJRzsBUovbJP/Wyt0+oJ7YjT45+47GXVjObpArgHdB3d8w2LMR8blID37bTPPFxtzsAMi5pt5M+XHqOM8EvtaLS1FuK9eHbtRUxLi7GRhfeChNJIO9tHOwOFZPkbS9znCK1qewB2hIFxr7gDMNp9t1j56obPFWLZlP+Lg38ZfKNmk3PFsIosf/RTWA96G24jF+qeZyJsMbwSztryuLJgu7eOGXpb1hrz3nW8YbzcQrqOOtbcK3I3Spi2BkKr5OwSTDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by BL1PR11MB6028.namprd11.prod.outlook.com
 (2603:10b6:208:393::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 12:42:48 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%8]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 12:42:48 +0000
Message-ID: <a47c787f-09d5-44f7-957b-9bbdd9a882e8@intel.com>
Date: Thu, 5 Jun 2025 14:42:44 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] gitlab-ci: Remove MIPS
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ryszard Knop <dragoon@dragonic.eu>, Petri Latvala <adrinael@adrinael.net>
References: <20250605123610.55595-1-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250605123610.55595-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0020.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::9) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|BL1PR11MB6028:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c3ee4eb-ca61-4b50-c4a9-08dda42e7a21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnhaTEplc1JSY1dvTURieDlxd0pZdEZ1ZmJ3WnBaR2pFRUxYNVhCQmRYKzkr?=
 =?utf-8?B?Vzdtdml5L2I4bXYvZkNwUDExSzZWRjZlL0tuZkxaQUZoTWxYeE5QQzlSQTE5?=
 =?utf-8?B?c2lBV09mZGRpZndsenp1Z3gwUjRUT1Q4TjI5N0E1SXA0NGdyQjhweERKVW16?=
 =?utf-8?B?T1cybjBZbHFsNENsc0VSUStQV0NPbDNtb3RxZkxSVWJsL0FPODhWWUdHdWVU?=
 =?utf-8?B?NE84bndyWDQ1QUxxTDJxQXI5bEkyWStvYzFLaXJ6Z0N3eHFOay9WVXpweUda?=
 =?utf-8?B?QkZZMjEyMHYveGpHbDFvOGdJTjlCdUx0blZKQWt1ZzZIMXV2enFpVGZSOGRO?=
 =?utf-8?B?aG1RcEFDUWx2NCsxOWlubXFqbWdoUHBsTHRQYUw5clQ1bTlaeE9Ub3Rld09S?=
 =?utf-8?B?VzZROFRFMHlNdUo2L1dhM1dKaDBnTnlseTBJS0M3VDVPSTRYTUNvdytpaHVj?=
 =?utf-8?B?a0NYREh0V1JCWmsyaHYvU0ZLclJJVWVKM1RlWm1TeXV1OVJFKzUxK2hyaUFW?=
 =?utf-8?B?d0E1VWF2cnY2eW1TdGIxNE1VaDJ6WGxVTXdsUTNTb29WV0xoL0Y4Nld6RDZL?=
 =?utf-8?B?Z0VXVGY2OTcxeXJQY0txSTJvRnZuT0JUdks0ZFZBVU5IaEt5c3lxK3lXY1I2?=
 =?utf-8?B?bC9HclY5aGZMOGZXVlhPZjE2MHU2citRNHYrSkhWcGszYUdydFJjRHlzdzF5?=
 =?utf-8?B?aWJrMUZXNFRJemxZVkZESnhtMjRJK3A1NFJSRjZyQ2JPc3dYVHRFUjdZQ0Qr?=
 =?utf-8?B?VUpsMUtvQk11bWdzU1RaNFMzTW9GV00rRS9XV1ByZEVhTmNyRXlUeUhlNzYw?=
 =?utf-8?B?aHZ4ODhQb3FRcWQ1TWZHRjZUaVdHRzJPWGxmU0IrN2U1WFdBUXJwd1hnWTZu?=
 =?utf-8?B?L0xxV1ZJbzNiMmN3QWo4NDBFR25ITllIYzBxdHpPbFFsaXRrSDNsYjI1R3VW?=
 =?utf-8?B?RUpaV1dBaUNmM0ZmVWtIMHR5ZU5Oa0hCMG9QMjhQb3M2VUFaemdGTWdNMlJw?=
 =?utf-8?B?YzZWYUU2bVRQT2Q5SWdnVlBzNnlNMlJnY1hLR1NGdzRUeVNBc3drNjQ4V1ph?=
 =?utf-8?B?ZEUvWFFoMXZGRGFrR2VWUVJtVm5HVHVpbXFmNEN6bnFuMTQ1TlpkUWptU25M?=
 =?utf-8?B?bHEyM1FYZTRPcStEd0YrSWxNTGRacVZPVHg2U1FwNU1IN3dOR3JkUEdxTXJa?=
 =?utf-8?B?dm1XTE0wWHRmaVRVa0NRM1JwbXB4VkNCUWsyQkZTY0hKS1VuTzVwbU5QKytk?=
 =?utf-8?B?ZTJ2VzNrdithUVNxL0VCamIyazB4ZzEyaTk5d1A5T3EzNElISnBGaTdMVWQ2?=
 =?utf-8?B?WGFWeGZFemJGcTFncDZFU09xQ1BRQTM3dWNyK0hWeVZWQmhKaFJMZDRkSEJK?=
 =?utf-8?B?Z3BoU0tGQVU0emlJRmZWNWhmamg4bWRBN013cnFkaml6T3hsaERURW9EcnN2?=
 =?utf-8?B?WTRDT3ZORkQ1c0xpNFFjdG8rN0ZWWHh3K1BmK0hOTGE3REg0VkRmVWNVVWlI?=
 =?utf-8?B?Q2NPM2F6TmxmOGozeFNYN0dCaHhaMTMxS25Ednl4b2NLRjJUWVBOVGcyT3hm?=
 =?utf-8?B?QmEwZ01aYUhKUEJrQmY2UTdRWnViVW9XRFZNZmFCNGJVcEdJa0lDKy92Ukgw?=
 =?utf-8?B?Z0RweXBxUWsvSDVTUFRVOUdpdGJtdTJQbnY2cWtkM1J4S01Ddm4vVlUyUWN0?=
 =?utf-8?B?M2hVQ1hBbHlnbkMrU3FkZzNucWpjNkpvYVpxWTh3ME14S2NyYTFEb1VCdytq?=
 =?utf-8?B?dk9CQStYOUlwWWw2dE1SZEkyZVZwMUNPYm5DK0VtZGROcnUvUWFYekdRS0gz?=
 =?utf-8?Q?3v3pVUC9sErWqWB3LdK4WdCM5tcbH/vayTf9U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXF0WWdJaXZPK2doQjlFV0YxZG8ybzd3Wll6Nmxudm83aUVndFU2S1B4QXNv?=
 =?utf-8?B?Q0tIcENRajJ2RmFwUkdKR3Qvc0E1NTk1WVJJS0Q3SkNKRGVac3lSaHZLV1Yy?=
 =?utf-8?B?RlJCdS93NWk0S0hsNWxwOWxrSm1CNkZtS3pkSjlVbWRLTFp1SlRYSGhoaWRJ?=
 =?utf-8?B?U1hrTWd2NkZCMWJiMEpidnI1eU5iSk5qMWpoRTNva2phSzdhK0hpbzdiM3A2?=
 =?utf-8?B?dkdNWllHUzlFNm1scUYyUU5ZRUNtRGhQOWZCWXlPTTRJbnpDcXVDVGp0QmlO?=
 =?utf-8?B?Slk2TitMOGRTZWN1YUR4VUl0aEw1dUtiNkM1T1N5QlFsVjdRTHVQSHh6RmQ2?=
 =?utf-8?B?cXBZRmx1cXJ2Z2k1bkg2VW5yRURsL3lPVFM4aVI2Tlc5UDErNmlDWTQzRWN5?=
 =?utf-8?B?YUxsOXU4N3ZMVTBjUndjaytZNnJOY2NvNEI1ZCs0dWs5S2EvUGZURk81TGJ3?=
 =?utf-8?B?MDVVSm9QSmtBa2lqVXdJdTJiVzJXV3VlTjBxVG0zdzI1UFhsUnV5WHQyUWx5?=
 =?utf-8?B?QkxYY2JhZi9wTWF5SnVvejRPOS9RbjgwQTEyWkxYRnhYL01nbGZvakNUUkU4?=
 =?utf-8?B?cXRHQ3RiTytGaFJ2WWZrc2hvejk5WGlkY3VIY2Q1SHhsQVZhUjJmdXlBVEFF?=
 =?utf-8?B?Q2hmei9leFFzZVVsMDQ4UXBCOHF1WHZGT0FZR1hBZFFVdTBHMVFDSm9Xa3BK?=
 =?utf-8?B?U3lPTmRtcmhFT1ErOU85aUZjanBzdnBOQm1nS09HNC9uV1NyRlpIVHdidnZV?=
 =?utf-8?B?LzU0T2FDMmp5bm81MXJ4bG0xK2VrdFErZ1lCRlMyZW10S3IwTTNvZnkvdXYw?=
 =?utf-8?B?YlZsZFBZdmlKVkJ5ZHE3b0l0UFpHWHoybzJJTnNxVDZKSkkyMzNoN2JteDRE?=
 =?utf-8?B?YUpaaS93WmtGMzVUTXhVWHQwMTlRZkE5SkFHcWx1NW1RNkNSbGR4R0pMNmNs?=
 =?utf-8?B?UDFYbDVybEp2MFhsamdQVlNvcWEyTTd2UnZxN0xwRzUvS2VZNnd5MkxqMWlk?=
 =?utf-8?B?TkNMc3R0Y0NoOHl3T0RyRFlLdHdyQ3BTOUh4K0c3bnVzcU1NWFlGUjRQSjRI?=
 =?utf-8?B?U2R2bW96WG9GcXE1dzIrZXJrYWJOdXMxR1gyWEhpTUVxb1UycFFCWWw3Ymd5?=
 =?utf-8?B?Q3puOHFQeDVvbEpvOU1iMFp6V083My8yZE04U1ZQd29vVFdENWlqck1sc21E?=
 =?utf-8?B?UWZRTXhKVnhHb05ZZUh1Mm83U0JuMGs2WTdUOWlWcEM4QitlR0YzNnJoTXJo?=
 =?utf-8?B?cC9sS3hjVkxFblp1LzNNOUpsMXY2YURVbzliTzZvTVJxblNnWGtsV2hpdTNH?=
 =?utf-8?B?cGZIZmpRU0xFa3hiLzZGNzc0bmtMMnJKdXRNdExqcklmS08zMnlvOHFBVUZn?=
 =?utf-8?B?dTFFbW5Xa0J1dXY1TGYxWlk5azVOWDAxdlVPcVg0ZEQvR2ROYXFzRlFGZjg1?=
 =?utf-8?B?dUhodnpIaXc5L3hyRXlybUtyVUg1Z3B4SnNBZHFVZjRFTWlTSUNwK0dvdWZH?=
 =?utf-8?B?bk5tWHI2Ukd4RUJ2ODVWWU5iVjBZdG9yZTVUcmZhNEs0alhqZko1eG1mQzZB?=
 =?utf-8?B?U3lSQ3ppbjV3TzJwNk1DelpGNUdIQXJXeWhnVjdqRUFiamx0Y29WZ2dVb1Uv?=
 =?utf-8?B?NUNaajZuVU9NZGtDeDZxOEEvRXl3djFYUDRDek9HR1hSZUxhVU9PQnh2enBq?=
 =?utf-8?B?MGp2QjdOZ1h5YnVZbG52TXNyRk1oNittRktSeE5wYkZBWDVCTmNBd3k5K0g1?=
 =?utf-8?B?OFJ2NFhScTM2NTZzcGdtWHFuVW1sQnQwZTZDRjVjMGdWRE5GbVdia1hteUla?=
 =?utf-8?B?cU9OZE80MUJwdEwxSkNjSGFETDFWOG44RUdmd1d6aVVidlJaVTlKN1owTjdo?=
 =?utf-8?B?elVWSWpjYVlLMXhRZDJiakF3NVAxNHJRNXlhT0pHZnpJaUw2S2hWdjZMd0F6?=
 =?utf-8?B?TzRBcWtTKzVyK0E5TVl6ZEt4TEN0OXQzQ1JwM0NPWEQ3NjJlWTdYczdPeUln?=
 =?utf-8?B?VjlldkFuc0VxTktER3NyaXlhV0xKRnhXRW9QSTd4S1RlOFg2VlhwTUFvRUFI?=
 =?utf-8?B?K3krbzQxNGtVQ1FLaW1VV0s0bWNtSUFoMUZBZnUzVmtKLy9YdDVubTZVelZP?=
 =?utf-8?Q?Wc2HlnhU/t9R+37xbgv4w0gUN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3ee4eb-ca61-4b50-c4a9-08dda42e7a21
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 12:42:48.4203 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCrdTyG+iE808u4i9pLdxK1ZfkhSB8vyQzu0s2SJrjJwjTmplEOMR45i5FXczNlpJ3ZQwDL48j+m9qnIdhmukQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6028
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

W dniu 05.06.2025 o 14:36, Kamil Konieczny pisze:
> From: Ryszard Knop <dragoon@dragonic.eu>
>
> MIPS testing was commented out years ago and it does not look
> like it is coming back, so just nuke it.
>
> Also Debian dropped mipsel (MIPS little-endian) port few years
> ago so remove it completely from pipeline.
>
> v2: removed also building and compilation (Kamil)
>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Cc: Ryszard Knop <dragoon@dragonic.eu>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Ryszard Knop <dragoon@dragonic.eu>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Fortunately gitlab-ci was not forced over these years to rebuild mips 
container.

Great:

Reviewed-by: Andrzej Hajda<andrzej.hajda@intel.com>

Regards

Andrzej

> ---
>   .gitlab-ci.yml | 34 ----------------------------------
>   1 file changed, 34 deletions(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index a6c076dba..1aff5cb00 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -44,13 +44,6 @@ build-containers:build-debian-arm64:
>       - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
>       - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-arm64 build-debian-arm64
>   
> -build-containers:build-debian-mips:
> -  stage: build-containers
> -  image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
> -  script:
> -    - podman login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
> -    - .gitlab-ci/pull-or-rebuild.sh base Dockerfile.build-debian-mips build-debian-mips
> -
>   build-containers:build-fedora:
>     stage: build-containers
>     image: registry.freedesktop.org/wayland/ci-templates/buildah:2019-08-13.0
> @@ -150,17 +143,6 @@ build:tests-debian-meson-arm64:
>       paths:
>         - build
>   
> -build:tests-debian-meson-mips:
> -  image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
> -  stage: build
> -  script:
> -    - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
> -    - meson --cross-file meson-cross-mips.txt build
> -    - ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> -  artifacts:
> -    paths:
> -      - build
> -
>   #################### TEST ##########################
>   
>   test:ninja-test:
> @@ -218,22 +200,6 @@ test:ninja-test-minimal:
>   #       - build
>   #     when: on_failure
>   
> -# mips testing temporarily disabled
> -# test:ninja-test-mips:
> -#   retry: 2
> -#   image: $CI_REGISTRY/$CI_PROJECT_PATH/build-debian-mips:commit-$CI_COMMIT_SHA
> -#   dependencies:
> -#     - build:tests-debian-meson-mips
> -#   stage: test
> -#   script:
> -#     - export PKG_CONFIG_PATH=/usr/lib/mips-linux-gnu/pkgconfig/
> -#     - env > build/envdump.txt
> -#     - meson test -C build --num-processes ${FDO_CI_CONCURRENT:-4}
> -#   artifacts:
> -#     paths:
> -#       - build
> -#     when: on_failure
> -
>   test:list-undocumented-tests:
>     dependencies:
>       - build:tests-fedora
