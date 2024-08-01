Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C040C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 06:25:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6F410E11B;
	Thu,  1 Aug 2024 06:25:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nMsm1Rf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71F7610E11B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 06:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722493521; x=1754029521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mIhN7WSQ1VpvYvz4rgg2KrUAaQqM7I9cdtVyPF+3TVE=;
 b=nMsm1Rf/3BFHsnbdd91xWIUTQ2W7OGFAsG8du6mCUjx9WqDiX71jxV/a
 mXKe+xaXvdyWQqQmC+9Mo61RoKudfZ8PEtst1w0PEsw4HOSFeNfC7WGcT
 4gWhM/TvSqGG3juLStXvamt3rFp9P6Ea3SsWUQHmgwteCYqyBb1dWUWPQ
 dODbR3kdvVIwyje4LjC91SBnVuUwGI79UXpqHiV7FWArGPUABl1lmQQri
 qomvbTfFeMljV4NyCrszcks0xVThdLSwNoWGAeu9ca7HL6scmFFPlrqe8
 I+4fBvridXuLUj53LrCTKYvgjsa85RdRq0YF2f48lIU/OGXgAeq0cm5jW Q==;
X-CSE-ConnectionGUID: DN8oaShVRtCSYVrkS2wpmQ==
X-CSE-MsgGUID: QPLwvIOiQvGXDJthxBzZTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="23341500"
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="23341500"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2024 23:25:21 -0700
X-CSE-ConnectionGUID: bxigaILsQ2WOkbo12X3gTQ==
X-CSE-MsgGUID: U4+Z0WxZTGaUYs37Hlcdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,253,1716274800"; d="scan'208";a="54588517"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jul 2024 23:25:21 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 31 Jul 2024 23:25:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 31 Jul 2024 23:25:20 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 23:25:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HABoeCryPqKXxgtDLwBGWh61wFxomRKe886wH6HdFGGCLBIK9gfEDP9iNXwG64zy0dGbCP33UgYYs4ffrladw/zkrCj2XBs8t602c68lfTewfI1zbsfMg30jwzkpT9HwwZsEZ9M5R/DVFlb8hvJPp+JDwt9UB6sGaN1+QNZaWsUXP69rxFDYia2eoBX5erNmeYw0qSXu9Edvs8iwwUDjt4F7Nlia62RFxuQ/UquWaTxs9jG9TCqUUMbW/Ov/FNnDgQfWbOXyfvmvvZdu/KRtVn+sKAXI8zD8InalfzgGnmIkcUxO8ghlSq3hIehCqChMuIpd9hUbKuSuYlWY4K5UXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIhN7WSQ1VpvYvz4rgg2KrUAaQqM7I9cdtVyPF+3TVE=;
 b=jMxg1jfdLcGK/10KiWD87Q9dfiAqI525RP+MlpdGc5qkrSeSRcwCIH28OLz3c30j7l+IB7r1yHgjUHpVn/YHVCvdsMFssv7XFfSDrDJkmsqDlNd2BBPpfUaUTynTRTzCx9I2MeIfaNQt4cSVcsAaJHAtiTzf7FMb/imxxd3rE3bZQxfMQBjgl2JeO59fZuWfPGOTm9nU6UEt9gUCMLy1bVwW6noQhx2td37OgikIGImDTgoqcJIIIbpV70OuG4W8CKhPd77FK08iORBdSfrJggVq/GivsOdH/EEBMWBkwGcBUoEYoylGchvMY78Wd2Pgz2oeeKa6eS80cxSqWLJjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 by IA0PR11MB8302.namprd11.prod.outlook.com (2603:10b6:208:482::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 06:25:13 +0000
Received: from CH3PR11MB7250.namprd11.prod.outlook.com
 ([fe80::a2e2:fa08:d80a:8fb4]) by CH3PR11MB7250.namprd11.prod.outlook.com
 ([fe80::a2e2:fa08:d80a:8fb4%7]) with mapi id 15.20.7828.021; Thu, 1 Aug 2024
 06:25:13 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 30/66] tests/xe_eudebug: Add
 discovery-race-vmbind subtest
Thread-Topic: [PATCH i-g-t v2 30/66] tests/xe_eudebug: Add
 discovery-race-vmbind subtest
Thread-Index: AQHa4nZp7qnQdMTgbESbQbhHxRM0BrIR8fgQ
Date: Thu, 1 Aug 2024 06:25:12 +0000
Message-ID: <CH3PR11MB7250AF46D8B13815C84BBC4BD9B22@CH3PR11MB7250.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-31-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-31-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7250:EE_|IA0PR11MB8302:EE_
x-ms-office365-filtering-correlation-id: 954307d2-5393-4770-99aa-08dcb1f2b368
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WHQ2TWZNSGN3bzdwM3V2U01yUVA1bFNGU0JVOGp5cmNaNDBTdE9vSFVjL2dT?=
 =?utf-8?B?dkU5WmtGVEtKM2hFbU5UVHpuWFNKdGZxUVdvckdyRG1ZbWp2bzNXSnNjaXRk?=
 =?utf-8?B?d1JrZ1lvRllsaTlsekVwR1gyUEhibHh3YXNGZFFzMXhxL1RTR3FENTFOWU44?=
 =?utf-8?B?aWdHUXBheDgrbFJ6NHZsYW5BRVhFSHhyalRocWJVMHRwT25jdXJ4QS9qWEc5?=
 =?utf-8?B?VDUvVFh4MENHM0prYm1vWDVuNUs0Q2kxKzVyOVZoSTBtT3pWSjNxKyttTWo3?=
 =?utf-8?B?WWVVZnlPcFQwaGpSaC9tb09zZ2NsdjMyeWgvQmRKV0c2M1lBVzdFM05aRTRZ?=
 =?utf-8?B?aWlyeUcvMUd3NTlEQUFEY0I4cnQzMW9MeUkvdDJla1JEWWF0VHFoYldOTE5n?=
 =?utf-8?B?cDh1VVd5WUpOZGFJZ3ptMjJXTnlLN1IwcEhCQWg1RG93eWJTU3QvQVNpTE1p?=
 =?utf-8?B?M3lKUFRPSmRndTlUdkZYeWNUKzBMUHFFRVhpclFoL0hKdzZURkYzMTh4bHNQ?=
 =?utf-8?B?Qko4bE5pRGFWZk9BWis2bFY1NWYraHRTQStPT3dRUEgwZW8zdTMwVmhIRWVQ?=
 =?utf-8?B?Y2E5ZmNxeDlLY1pZa1VDbGUyZHJ6MERzdy8xaTJsRjF3SGQwaTBORklOWnBJ?=
 =?utf-8?B?MmVZLzlRcVlVTE9xZStlSlRXTGIwY3hyQXFKTUxGUVhBanNhNzhhLzFidlhL?=
 =?utf-8?B?ZkxJR0pvVlduNHEzWGluVUlmZEI1MEpINWw5bUFBVVBFZSsvL1FVRHgyZk5L?=
 =?utf-8?B?ZUFYYmd5VWZTd0tBakR5cTNXRDVReEFmRUNNWTIvcURMTXBIV0ExVkt5R0VW?=
 =?utf-8?B?RFdIZmVxL0pjeFdQTGVrMkw5eEFaYUpWZ0FadzlMbG1rQlYrRS9SMFNCMjFG?=
 =?utf-8?B?RXJpZWlCOEg4clV4MmN3Ujgxd1lLNFk5cXk4eWZSZGlnL1RzQ2FDbTJiVHNJ?=
 =?utf-8?B?a2h6M2IvSzVHMTlqUm42MlljWnVjUC9mbmhmYSt4RFZEd1JBdVc4dUV6cXNS?=
 =?utf-8?B?dytVYmhEdzNwSjJ2a3EvMVkzUU1lcjFvb0hrd1pvTmlrUCtnRjZDVEZncHlO?=
 =?utf-8?B?WDJqQmh3R25xSUF2WUh2aWErVGZ5TFRrcHZTRWR0aXF4QkdaL2d5SDcyTkFD?=
 =?utf-8?B?bUIxRk1oWWFwMGg3VEJ5ZVp1a2lsTVJ2dUFBZ1lVVktOa0VZV3NBdU5yaUl4?=
 =?utf-8?B?YW9RcS9ZODVtWUUrYkorOGhWQm1BcmZBZXFpY3RvRk5oSkJWNG50dGExWk1m?=
 =?utf-8?B?ZTRUV2Uvd014Q0dJbGNXbU9rMTlSOWhUaWx6YjcraGtzcVhaaFF1c1EvOS9E?=
 =?utf-8?B?N3BPMlgwamVZVzU3R2NuNENsU2Y0ZGFiSks4VjJsUXRrOG45enNXTFVyLzNn?=
 =?utf-8?B?Sll5YWJzUGExWVlvdFhjRzhOQ0pqUXlRNGJjYlhEeFg3cGFnd1ExUm8xUzNa?=
 =?utf-8?B?NUdJNXJxQlNJWXh6SE03TDVGbzlCTVdubzJxUUpIQ3ZRaUN4TWZncVU1dXVZ?=
 =?utf-8?B?ZkJrcEhlaXB4UWwzTmhzQzRZTGJnTlkwRWlHVGJQTEpqTVpkZGNlSGp3SDlt?=
 =?utf-8?B?UTFNVHd3N0JWTVNkVTQwb2N0LzBtTmVlWHN0eFdUbjZTQzVsTUVlYlR5NE1G?=
 =?utf-8?B?cDA5WFVrNFc5UEtUR0ZGeWdYMkxPWnRYN0VPTjJ1SHJYTkZ4S0xBN0RaZUtk?=
 =?utf-8?B?bmJ6a2FuU3YzdUFGRnZSY0hSOVJZdFlidkNwek5WTHVaQWtZTThyNisyRm5Y?=
 =?utf-8?B?dUlhd2NoWmNZZitPaHRTVlhoMGh3QWtlc0hqdmUwVFpQYlBNMEFCVmJDa2ZU?=
 =?utf-8?B?dStGYnZjQmJDbVhLd3gyWkVqYmVFL2ZDTnJkWkhWTmN2MXZQZllEaXRkVzJv?=
 =?utf-8?B?VjdnQjdjUHVTVTdzeTJpbld4MS93cTZQV1JqbjZFd3pad1E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7250.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2hIaDdjaloyMHMvV2pFQ21uM3hLV1ViRkdDcHpsUUtGUG5pQWFsRXJNTkZC?=
 =?utf-8?B?c2ZqRHR6M21mVERBZ2o0d2dLQmNaUElEaGtWVXFPVEZrcmJCWEtxUVlzbkFH?=
 =?utf-8?B?b2xxVEhNZExob2pGUm4wcUlhOG1CUytkcm9rNGJzWDlYZ0hqVWp1U2VRa2ll?=
 =?utf-8?B?ckkwck0vaTJlNjVsbHlrcGF5a3lwWlJnR0xRY2ljRVRKZTdnVGZDNXZ0NzVN?=
 =?utf-8?B?b2JvSmJuWGR4Y0F0SUt4cmIrWUlmUjVydkdFRm54Z1FmNGlvZFdWZHFyL0ly?=
 =?utf-8?B?dlBjRlErREcyOUpFckhvSEorQ3JwMHBsL1MrNkhrNWhGV2U3enVlVzV3aFdr?=
 =?utf-8?B?V0lORkRYMEE4Qk82ZnZxVzhhYzBBc2ZCNjdheXV4MWFFOUJQM1pVQmE0UUNh?=
 =?utf-8?B?bFBzTFBsdHhmZmlvNmoyaHBIU2dkdGp1cVJtNXZvbW9JWFJ6U0lOOUtTMzBU?=
 =?utf-8?B?SXNRQ3BXTWR3Y2lEaHRnK2dOYWJ5SDVRT2VFTkloY3lzYWZBQWF5R09LMWN4?=
 =?utf-8?B?ck5XUWRRT0ZEV1V4bzcwcUNabE1RTElvUUtrV2ZZUXYrUmRXL3ZqMGN2RkY4?=
 =?utf-8?B?VHdKQndCbHMrNUgzZHFwNjA5RWNYYjlvZFdGbFVUTmxJYi9iSXJYVDlMejJi?=
 =?utf-8?B?cTVIb2xYTGRQWVBUSnVrY1dwK1lRQnFNTlR4VzIzZVgycTVYUHhrZ2tNMUtE?=
 =?utf-8?B?Sy81aWMxdGFyS1ZCQ25vVlRvWW9ISXVsSllXTHQxVGJPcnk2Z1JNZlZtdEVt?=
 =?utf-8?B?SXllRzFsaWlzZG9VU0s1STNyVDZWVXp5UzQyTTVSUlBzUkR3TDNJRktzWGJF?=
 =?utf-8?B?WDhvN3ozUVo2T2xpYkNWM0Nib2VmRHNSYnBVWlpzY3p0ZnVLVjE1WjczRlBk?=
 =?utf-8?B?SlIrTFdJUkJZNDlVQTFVM25LK3NCQlE2OHZJT3F5MmpoRTFWWFZlZkh6alhp?=
 =?utf-8?B?cHJDVi9Gb2k2TlBwMUR3UENzNDhzVXp3d0ZNZnFMQmFweFRQUGpqM1NTY25W?=
 =?utf-8?B?WmFUVDYrMjYrNDZ6d2NRckxxYWo3UkxyYlM3MThlbEFja05XWlRJZk8ybFNo?=
 =?utf-8?B?U2NsRGdBLzFxMlJuaGZCb25IbVIrN3lueVdtc0gwc0I5L2hCaTNhRHk1amht?=
 =?utf-8?B?Y0ZlRlF4eGc3d0pjN1Y5RWp6RENmRXFNemVMazZLbkhFTVV0eGtMeGNjS0tq?=
 =?utf-8?B?VkFhWXdSM0RDRlB5N0NDazFNbjgxaFhyZ1RMMmMwY3UyU0trQjNqeE9FU2l3?=
 =?utf-8?B?Q2FEY2VJLzhLU2IwOUJsN0xSazJ4OG5ZV0RRQ1NGdjhvY3NxWkhnUzFQWFVk?=
 =?utf-8?B?NkZOOTg4cGRZZWpIOC9MU0JLUXp1UDJkdCs3UkdvQ2dvd3Qra0NzOFEvdVFv?=
 =?utf-8?B?ekdTZkpjTk93SGZFZUFFVWNUL2xtcmRCUlkrTlEvMHUzY1g3U1NiTHFxYU5Q?=
 =?utf-8?B?ak54NFVXNEpyaXVJQlZ3OFU4MExzUjROcGd5em5La1hxd1ZsREFqNENXanBV?=
 =?utf-8?B?dGwvN3VUQnQ1NDUyNU12WU5jREZST2k2MXFlZEVLTHVHSnErYytPR1J5UlFj?=
 =?utf-8?B?cmVab2p0U3o2REpIVmZzc014L2M2QUhGeWF6Zlo1aTNQMXQvWmt0eGZLdDgz?=
 =?utf-8?B?UEtISU5ETWJSVHFjZy8zajVLQlkvUVJrdFZaQ042TWtmRTFQdE14SkZ0RmI4?=
 =?utf-8?B?VjdVdStadVhsbVBZMjNRRjV1T05UNHJvSk5MUG8xSUg5KzUyZXc2UTVwcTFx?=
 =?utf-8?B?a1VWYlFlZEJQWnkzRHZZNVVENEw5enRBbmgvMnNYK2hVdEd2ZXh0RTVUZG9l?=
 =?utf-8?B?OS94aW5hL2dEUHVVa2tJbHJzRFU1R2FNb053ZURNL09SajZiWXRra1FwZHhT?=
 =?utf-8?B?N0RQc1hYalJjVFhZMDVNL1BMZk5UcTRjdm9pOUVSZENqbHYrT2M3TEpINHRq?=
 =?utf-8?B?bjgzNnFiM1pwemxQaTdqQm1CVHR3Y2RQSVhOYVgyTy9yNFFwNTh4V25HM1pB?=
 =?utf-8?B?YVZwWVVuUFc3b3V2Vm1pN3Uyamc1YkNJTlh1VFBHZGx2WXVFaXgzQlEyd1lD?=
 =?utf-8?B?dWVvSDMrV3BwNE5UR2RuS1BRL3ZWT0VhSTM4QnNVaEEvdkhoTjV4WXlPQm9T?=
 =?utf-8?B?MUpidkwyS1kwZVJic2M5RjBUbmN5ZWJhSmNsM0p4VXZFcFZQVWJrczdoU3ZI?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7250.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954307d2-5393-4770-99aa-08dcb1f2b368
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 06:25:12.9566 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1BYDs50i/MIOGyaxt2qO7l4cGuOabK2T2cqH6Hsq2+fTct71kn7VLitdxQ/7LLlGWzUJ4tW1f7w2dAG2OOtB8vslt+lK7GjXbylPv3OXaq2YaNu1wOsMYu31AQOfMznE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8302
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogTWFuc3pld3NraSwgQ2hyaXN0b3BoIDxjaHJpc3RvcGgubWFuc3pld3NraUBpbnRlbC5jb20+
DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMzAsIDIwMjQgMTo0NSBQTQ0KPiBUbzogaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEtlbXBjenluc2tpLCBaYmlnbmlldyA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPjsgS2FtaWwNCj4gS29uaWVjem55IDxrYW1pbC5rb25p
ZWN6bnlAbGludXguaW50ZWwuY29tPjsgR3J6ZWdvcnplaywgRG9taW5paw0KPiA8ZG9taW5pay5n
cnplZ29yemVrQGludGVsLmNvbT47IFBhdGVsY3p5aywgTWFjaWVqDQo+IDxtYWNpZWoucGF0ZWxj
enlrQGludGVsLmNvbT47IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wNCj4gPGRvbWluaWsua2Fy
b2wucGlhdGtvd3NraUBpbnRlbC5jb20+OyBTaWtvcmEsIFBhd2VsDQo+IDxwYXdlbC5zaWtvcmFA
aW50ZWwuY29tPjsgSGFqZGEsIEFuZHJ6ZWogPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsNCj4g
S29sYW51cGFrYSBOYXZlZW5hIDxrb2xhbnVwYWthLm5hdmVlbmFAaW50ZWwuY29tPjsgS3VvcHBh
bGEsIE1pa2ENCj4gPG1pa2Eua3VvcHBhbGFAaW50ZWwuY29tPjsgTXVuLCBHd2FuLWd5ZW9uZyA8
Z3dhbi0NCj4gZ3llb25nLm11bkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2
MiAzMC82Nl0gdGVzdHMveGVfZXVkZWJ1ZzogQWRkIGRpc2NvdmVyeS1yYWNlLQ0KPiB2bWJpbmQg
c3VidGVzdA0KPiANCj4gRnJvbTogS2Fyb2xpbmEgU3RvbGFyZWsgPGthcm9saW5hLnN0b2xhcmVr
QGludGVsLmNvbT4NCj4gDQo+IEV4dGVuZCBkaXNjb3ZlcnktcmFjZSB0ZXN0IGNhc2Ugd2l0aCBC
TyBjcmVhdGlvbiBhbmQgdm1fYmluZCBvcGVyYXRpb24gdG8NCj4gdmVyaWZ5IHRoYXQgYWxsIHZt
X2JpbmRfb3AgZXZlbnRzIGFyZSBwcm9wZXJseSByZWdpc3RlcmVkIGFuZCByZXBsYXllZC4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEthcm9saW5hIFN0b2xhcmVrIDxrYXJvbGluYS5zdG9sYXJla0Bp
bnRlbC5jb20+DQo+IENjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpla0Bp
bnRlbC5jb20+DQo+IENjOiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIDxkb21pbmlrLmthcm9s
LnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL3hlX2V1ZGVidWcu
YyB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyOSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rl
c3RzL2ludGVsL3hlX2V1ZGVidWcuYyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYyBpbmRleA0K
PiA4YzIxY2ZmYzcuLmMzNjhlMzBlNyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXVk
ZWJ1Zy5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYw0KPiBAQCAtOTE3LDExICs5
MTcsMTMgQEAgc3RhdGljIHZvaWQgdGVzdF9iYXNpY19kaXNjb3ZlcnkoaW50IGZkLCB1bnNpZ25l
ZCBpbnQNCj4gZmxhZ3MsIGJvb2wgbWF0Y2hfb3Bwb3NpdGUNCj4gICNkZWZpbmUgUFJJTUFSWV9U
SFJFQUQJCQkoMSA8PCAwKQ0KPiAgI2RlZmluZSBESVNDT1ZFUllfQ0xPU0VfQ0xJRU5UCQkoMSA8
PCAxKQ0KPiAgI2RlZmluZSBESVNDT1ZFUllfREVTVFJPWV9SRVNPVVJDRVMJKDEgPDwgMikNCj4g
KyNkZWZpbmUgRElTQ09WRVJZX1ZNX0JJTkQJCSgxIDw8IDMpDQo+ICBzdGF0aWMgdm9pZCBydW5f
ZGlzY292ZXJ5X2NsaWVudChzdHJ1Y3QgeGVfZXVkZWJ1Z19jbGllbnQgKmMpICB7DQo+ICAJc3Ry
dWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSA9IE5VTEw7DQo+ICAJaW50IGZk
W1JFU09VUkNFX0NPVU5UXSwgaTsNCj4gIAlib29sIHNraXBfc2xlZXAgPSBjLT5mbGFncyAmIChE
SVNDT1ZFUllfREVTVFJPWV9SRVNPVVJDRVMgfA0KPiBESVNDT1ZFUllfQ0xPU0VfQ0xJRU5UKTsN
Cj4gKwl1aW50NjRfdCBhZGRyID0gMHgxYTAwMDA7DQo+IA0KPiAgCXNyYW5kKGdldHBpZCgpKTsN
Cj4gDQo+IEBAIC05NTAsMTggKzk1MiwyOSBAQCBzdGF0aWMgdm9pZCBydW5fZGlzY292ZXJ5X2Ns
aWVudChzdHJ1Y3QNCj4geGVfZXVkZWJ1Z19jbGllbnQgKmMpDQo+ICAJCQlzbGVlcCgxKTsNCj4g
DQo+ICAJCWZvciAoaW50IGogPSAwOyBqIDwgUkVTT1VSQ0VfQ09VTlQ7IGorKykgew0KPiArCQkJ
dWludDMyX3Qgdm0gPSB4ZV9ldWRlYnVnX2NsaWVudF92bV9jcmVhdGUoYywgZmRbaV0sDQo+IDAs
IDApOw0KPiAgCQkJc3RydWN0IGRybV94ZV9leGVjX3F1ZXVlX2NyZWF0ZSBjcmVhdGUgPSB7DQo+
ICAJCQkJLndpZHRoID0gMSwNCj4gIAkJCQkubnVtX3BsYWNlbWVudHMgPSAxLA0KPiAtCQkJCS52
bV9pZCA9IHhlX2V1ZGVidWdfY2xpZW50X3ZtX2NyZWF0ZShjLA0KPiBmZFtpXSwgMCwgMCksDQo+
ICsJCQkJLnZtX2lkID0gdm0sDQo+ICAJCQkJLmluc3RhbmNlcyA9IHRvX3VzZXJfcG9pbnRlciho
d2UpDQo+ICAJCQl9Ow0KPiArCQkJY29uc3QgdW5zaWduZWQgaW50IGJvX3NpemUgPSBtYXhfdChi
b19zaXplLA0KPiArDQo+IHhlX2dldF9kZWZhdWx0X2FsaWdubWVudChmZFtpXSksDQo+ICsJCQkJ
CQkJICAgTUlOX0JPX1NJWkUpOw0KPiArCQkJdWludDMyX3QgYm8gPSB4ZV9ib19jcmVhdGUoZmRb
aV0sIDAsIGJvX3NpemUsDQo+IHN5c3RlbV9tZW1vcnkoZmRbaV0pLA0KPiArMCk7DQo+IA0KPiAg
CQkJeGVfZXVkZWJ1Z19jbGllbnRfZXhlY19xdWV1ZV9jcmVhdGUoYywgZmRbaV0sDQo+ICZjcmVh
dGUpOw0KPiANCj4gKwkJCWlmIChjLT5mbGFncyAmIERJU0NPVkVSWV9WTV9CSU5EKSB7DQo+ICsJ
CQkJeGVfZXVkZWJ1Z19jbGllbnRfdm1fYmluZChjLCBmZFtpXSwgdm0sIGJvLA0KPiAwLCBhZGRy
LCBib19zaXplKTsNCj4gKwkJCQlhZGRyICs9IDB4MTAwMDAwOw0KPiArCQkJfQ0KPiArDQo+ICAJ
CQlpZiAoYy0+ZmxhZ3MgJiBESVNDT1ZFUllfREVTVFJPWV9SRVNPVVJDRVMpIHsNCj4gIAkJCQl4
ZV9ldWRlYnVnX2NsaWVudF9leGVjX3F1ZXVlX2Rlc3Ryb3koYywNCj4gZmRbaV0sICZjcmVhdGUp
Ow0KPiAgCQkJCXhlX2V1ZGVidWdfY2xpZW50X3ZtX2Rlc3Ryb3koYywgZmRbaV0sDQo+IGNyZWF0
ZS52bV9pZCk7DQo+ICsJCQkJZ2VtX2Nsb3NlKGZkW2ldLCBibyk7DQo+ICAJCQl9DQo+ICAJCX0N
Cj4gDQo+IEBAIC05NzgsNiArOTkxLDcgQEAgc3RhdGljIHZvaWQgcnVuX2Rpc2NvdmVyeV9jbGll
bnQoc3RydWN0DQo+IHhlX2V1ZGVidWdfY2xpZW50ICpjKQ0KPiAgICogYXJnWzFdOg0KPiAgICoN
Cj4gICAqIEByYWNlOgkJcmVzb3VyY2VzIGNyZWF0aW9uDQo+ICsgKiBAcmFjZS12bWJpbmQ6CXZt
LWJpbmQgb3BlcmF0aW9ucw0KPiAgICogQGVtcHR5OgkJcmVzb3VyY2VzIGRlc3RydWN0aW9uDQo+
ICAgKiBAZW1wdHktY2xpZW50czoJY2xpZW50IGNsb3N1cmUNCj4gICAqLw0KPiBAQCAtOTg3LDYg
KzEwMDEsNyBAQCBzdGF0aWMgdm9pZCAqZGlzY292ZXJ5X3JhY2VfdGhyZWFkKHZvaWQgKmRhdGEp
DQo+ICAJCXVpbnQ2NF90IGNsaWVudF9oYW5kbGU7DQo+ICAJCWludCB2bV9jb3VudDsNCj4gIAkJ
aW50IGV4ZWNfcXVldWVfY291bnQ7DQo+ICsJCWludCB2bV9iaW5kX29wX2NvdW50Ow0KPiAgCX0g
Y2xpZW50c1tSRVNPVVJDRV9DT1VOVF07DQo+ICAJc3RydWN0IHhlX2V1ZGVidWdfc2Vzc2lvbiAq
cyA9IGRhdGE7DQo+ICAJaW50IGV4cGVjdGVkID0gUkVTT1VSQ0VfQ09VTlQgKiAoMSArIDIgKiBS
RVNPVVJDRV9DT1VOVCk7IEBADQo+IC0xMDI0LDEyICsxMDM5LDE3IEBAIHN0YXRpYyB2b2lkICpk
aXNjb3ZlcnlfcmFjZV90aHJlYWQodm9pZCAqZGF0YSkNCj4gDQo+IA0KPiAJaWd0X2Fzc2VydF9l
cShjbGllbnRzW2ldLmV4ZWNfcXVldWVfY291bnQsDQo+IA0KPiBSRVNPVVJDRV9DT1VOVCk7DQo+
ICsNCj4gKwkJCQkJCWlmIChzLT5jLT5mbGFncyAmDQo+IERJU0NPVkVSWV9WTV9CSU5EKQ0KPiAr
DQo+IAlpZ3RfYXNzZXJ0X2VxKGNsaWVudHNbaV0udm1fYmluZF9vcF9jb3VudCwNCj4gKw0KPiBS
RVNPVVJDRV9DT1VOVCk7DQo+ICAJCQkJCX0NCj4gDQo+ICAJCQkJCWlndF9hc3NlcnQoKytpIDwg
UkVTT1VSQ0VfQ09VTlQpOw0KPiAgCQkJCQljbGllbnRzW2ldLmNsaWVudF9oYW5kbGUgPSBlby0N
Cj4gPmNsaWVudF9oYW5kbGU7DQo+ICAJCQkJCWNsaWVudHNbaV0udm1fY291bnQgPSAwOw0KPiAg
CQkJCQljbGllbnRzW2ldLmV4ZWNfcXVldWVfY291bnQgPSAwOw0KPiArCQkJCQljbGllbnRzW2ld
LnZtX2JpbmRfb3BfY291bnQgPSAwOw0KPiAgCQkJCX0NCj4gDQo+ICAJCQkJaWYgKGUtPnR5cGUg
PT0NCj4gRFJNX1hFX0VVREVCVUdfRVZFTlRfVk0pIEBAIC0xMDM3LDYgKzEwNTcsOSBAQCBzdGF0
aWMgdm9pZA0KPiAqZGlzY292ZXJ5X3JhY2VfdGhyZWFkKHZvaWQgKmRhdGEpDQo+IA0KPiAgCQkJ
CWlmIChlLT50eXBlID09DQo+IERSTV9YRV9FVURFQlVHX0VWRU5UX0VYRUNfUVVFVUUpDQo+ICAJ
CQkJCWNsaWVudHNbaV0uZXhlY19xdWV1ZV9jb3VudCsrOw0KPiArDQo+ICsJCQkJaWYgKGUtPnR5
cGUgPT0NCj4gRFJNX1hFX0VVREVCVUdfRVZFTlRfVk1fQklORF9PUCkNCj4gKwkJCQkJY2xpZW50
c1tpXS52bV9iaW5kX29wX2NvdW50Kys7DQo+ICAJCQl9Ow0KPiANCj4gIAkJCWlndF9hc3NlcnRf
bHRlKDAsIGkpOw0KPiBAQCAtMTExNiw3ICsxMTM5LDggQEAgc3RhdGljIHZvaWQgdGVzdF9yYWNl
X2Rpc2NvdmVyeShpbnQgZmQsIHVuc2lnbmVkIGludA0KPiBmbGFncywgaW50IGNsaWVudHMpDQo+
ICAJCQlpZ3RfYXNzZXJ0X2VxKHNlc3Npb25zW2ldLmMtPnNlcW5vLTEsIHNlc3Npb25zW2ldLmQt
DQo+ID5ldmVudF9jb3VudCk7DQo+IA0KPiAgCQkJeGVfZXVkZWJ1Z19ldmVudF9sb2dfY29tcGFy
ZShzZXNzaW9uc1swXS5kLT5sb2csDQo+IC0JCQkJCQkgICAgIHNlc3Npb25zW2ldLmQtPmxvZywg
MCk7DQo+ICsJCQkJCQkgICAgIHNlc3Npb25zW2ldLmQtPmxvZywNCj4gKw0KPiBYRV9FVURFQlVH
X0ZJTFRFUl9FVkVOVF9WTV9CSU5EKTsNCj4gDQo+ICAJCQl4ZV9ldWRlYnVnX2NsaWVudF9kZXN0
cm95KHNlc3Npb25zW2ldLmMpOw0KPiAgCQl9DQo+IEBAIC0xNzU1LDYgKzE3NzksOSBAQCBpZ3Rf
bWFpbg0KPiAgCWlndF9zdWJ0ZXN0KCJkaXNjb3ZlcnktcmFjZSIpDQo+ICAJCXRlc3RfcmFjZV9k
aXNjb3ZlcnkoZmQsIDAsIDQpOw0KPiANCj4gKwlpZ3Rfc3VidGVzdCgiZGlzY292ZXJ5LXJhY2Ut
dm1iaW5kIikNCj4gKwkJdGVzdF9yYWNlX2Rpc2NvdmVyeShmZCwgRElTQ09WRVJZX1ZNX0JJTkQs
IDQpOw0KPiArDQo+ICAJaWd0X3N1YnRlc3QoImRpc2NvdmVyeS1lbXB0eSIpDQo+ICAJCXRlc3Rf
ZW1wdHlfZGlzY292ZXJ5KGZkLCBESVNDT1ZFUllfQ0xPU0VfQ0xJRU5ULCAxNik7DQo+IA0KPiAt
LQ0KPiAyLjM0LjENCg0K
