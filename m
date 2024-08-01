Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C4DCC3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 19:22:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6C710E93F;
	Thu,  1 Aug 2024 19:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oI/qzZTY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BBAE10E92B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722540133; x=1754076133;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Wt7gsBDhUrqEYkmVkAOZs4kJ1za7EvgpXM4jMqf7SVo=;
 b=oI/qzZTYFePWcmJOCnNdJbwMcmYLyU90iR4/eW7rpuH9EGkfU0LTtm4w
 5XfPA+8aGG27utJe51iFXjvxeW5I+NPeJCO2SUGdrbrkPJariOk8ZxpSB
 i+vm2WYujpetCudGzR11l1VxpSlHWQPhjjev8m04PhhWRfXtTSKwz+FqE
 TMEAm3nY+Nhj4JAW2vdiMorpT7nnkNP90/d/FZjOjwKAf1vMVuCN4gqZ8
 8AmNKCD130fOU1sIsmao/yGnpCQxIA4nBiaFKqcPiPvD4iDdMDeaVjPMH
 RO5D4CXlHmEhLmRqG9kjVzdp2e7KcUXs0ZVo5DWRnyvgBjsjlEtYuC6tw w==;
X-CSE-ConnectionGUID: zX6SR/zpRt+oqXAA0q/qzA==
X-CSE-MsgGUID: N0soUQ3nQwaS4XHwPs9/Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20110315"
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="20110315"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 12:22:12 -0700
X-CSE-ConnectionGUID: dc2ykQe0RjyfhiHv8eNmtw==
X-CSE-MsgGUID: SIaVq7neSZqLvzrb9JdceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,255,1716274800"; d="scan'208";a="59478948"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 12:22:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 12:22:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 12:22:12 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 12:22:12 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 12:22:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qreUym0AIG51gYQFFjzTgq9Ke8erbhAK9gkyXM56qLnMrQ1+TtL243BrtVuBOjUmez03bqN2/0Jg2SSFSPyP0r5YOMljrNO9poiL1i5kyn0R2zL2EQAGmlgM8BOVv5/JdGfDb3a289jOzLiKkZ5Y2XbBizeqtPPNGoMj0uAIUtw0jNldhyrz6zf4tWh7Ip5N5JbszJXGEiozNkzLwm2/TRwJJDmsdsfxh2vaqkffLGBwuqAe13tPjYjGh9YX24hiFL4Dyon8l/g5Iy6Sl/cC6Opwq1rt3dAcV60p0jzDOGycyxeF97iDXy4NTl6llGil6rqYMmMQghyArHTbEaVfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt7gsBDhUrqEYkmVkAOZs4kJ1za7EvgpXM4jMqf7SVo=;
 b=nhZawdWePUPsiMJ+Jtl1Eq91sPvrrlTSZe53/w9mdQtRs9IQ/wvV+k+4rRfuYKxzwAy6K8qkiQ2bsAumWLDr8AxI2XbgHZSP/aMMHDlru3AredXRqN/CDb9njdPtDE5Il7zfOws1NZwDQpN7FB0N6wmRZrUfcOppAcMe/qdfTdPgX9kPVJ1bbdrCfCSnAkHDgc5osJZETSbas34MZ67LLSUoitAxXIOJ7iumsGBwcpFi9Jvx8WSxpQu7AtO0RQ9FmTfC7fdHSo2JUF3mcxjkS9Xdy2unN1VRvPhHcdJ8T37X31drjVwfyTjBm91GuBv8Y2D+sRdJk0g2G72aCNQNPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH7PR11MB6699.namprd11.prod.outlook.com (2603:10b6:510:1ad::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22; Thu, 1 Aug
 2024 19:22:09 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 19:22:09 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Manszewski, Christoph" <christoph.manszewski@intel.com>
CC: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>, "Hajda, Andrzej"
 <andrzej.hajda@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Piatkowski, Dominik Karol"
 <dominik.karol.piatkowski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>, "Mun,
 Gwan-gyeong" <gwan-gyeong.mun@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>
Subject: Re: [PATCH i-g-t v2 50/66] tests/xe_exec_sip: Rework invalid
 instruction tests
Thread-Topic: [PATCH i-g-t v2 50/66] tests/xe_exec_sip: Rework invalid
 instruction tests
Thread-Index: AQHa4naICsNsZevimkWR30Oku8UyJLISyz2A
Date: Thu, 1 Aug 2024 19:22:08 +0000
Message-ID: <3dba6de943fdca957dc06356242ce4334585c95a.camel@intel.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-51-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-51-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH7PR11MB6699:EE_
x-ms-office365-filtering-correlation-id: f86cad56-dbc8-4a6b-acff-08dcb25f3cb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cEVpUDM3aHIzMmdBUU1hcDdOSVd2cVNWZjNjdDAyd0M2RHNVL3NSQ25CYWVE?=
 =?utf-8?B?bHZDWW53TnhRYmgxN3drKzgxbkRLSndQOG9tUVZid0d6OVU4VWtQWExrNzhG?=
 =?utf-8?B?cTVsVFhnVUxURllSRkwwdkpzQnBub0liTHRqMkMxV2RYMEJqMWhwNTFCY0Ur?=
 =?utf-8?B?cy9RVWQvMXJiaU56TmVWRGMrekV6ZHdaLzhFK1FiWDJuNmdXVDJIQVhDTnNO?=
 =?utf-8?B?NDhOaXpiNVpxMnZPdzlCc0sxdmt0blB0SmxXMjk2VUY3OERRU3kzR3RMa011?=
 =?utf-8?B?clRRVlZUUHpHYk12TVU3d3hKVVhhTHNaKzN1TTArSkFYZjA4L0s2ZExCMi9X?=
 =?utf-8?B?bDhLZXZSM2JWOHF2M2ZkUkNGMnlWWFZ6U1RHbzBNSE9aOVBiU1A1Q3prdFNq?=
 =?utf-8?B?bWtZRzJhOVRsK2IwRGRaZmNpS2FuNkRuVURIck9sMXAwbFQ5NXhFT1k1UUI4?=
 =?utf-8?B?Y3NoTWYySk9za1ZqU0ZMa0RPaGp0MUZCSUY1S0l3Titxc1lGeVh0cUJiWFc2?=
 =?utf-8?B?QmQvV3dyZmZRNjZDNHRYaEF6UkZKOFVQRDNSUHVQTmJFSlRNd1BjYzROWk9N?=
 =?utf-8?B?YW9mZVc1enBzdEJYY3czRng1NnZOeDk3STZFeFZnR3FKcU94MUw2bVZtWEdm?=
 =?utf-8?B?eXVKeWdYa3Z0Y0VBMW1nam5OWTgvWUl0QlVtd1hING5zN1JNMnVKUkxPRXZh?=
 =?utf-8?B?ZnVCcjdmV1R6Z1dqWm52UlZDS2tra1J3VGp6ZWFQcDZPQnkyeU1ZM2NMNmhu?=
 =?utf-8?B?dXhucnBYNTM5Y212NjA4UVZPWER5bnVBMWNxV0N2dUdvSGJQV0huVVdVOWN4?=
 =?utf-8?B?RW1jU1NLZElISVZJSUtNSTVrVm03Z3k1eXE1dDFFSmI5MWNzaUgxQzQ0OXJF?=
 =?utf-8?B?bVl5NTIwOHpzbVduM0ZMOGMyWStUTU5hQkhzenFzQUZmV2lINWlzQU9oTnl5?=
 =?utf-8?B?MGlzdmMvU3BIb1d3NlFSVGJIUWs1Rlc4ak9ub0YxOFl5eUFta2JUblVGVm9h?=
 =?utf-8?B?Y0IyZWtteGRvUTRCMEhIR2k1SWphMFVuTm1pcDJaSTBSMjdzaTdiZ2NSQm5L?=
 =?utf-8?B?eHh2SllMTENDazhxdmNnNXVRMkpkZlJvVkt6Y3JlNXpFdVlzb1RLSldsK041?=
 =?utf-8?B?K0xnRVhibHYzd3VEdDZ1MkU2Tm4zcC9iU1ozZ1JxK3FWMU1ubTc2TjBoRVVE?=
 =?utf-8?B?YmFkbVhQSjRPbFl5UUkwODVxdjZTTEYzWTByajV5ZUQzTWh0Tk5kbEozc003?=
 =?utf-8?B?SUVKdVFjNGFLVjdaa0hpWGRXOXNGaWZzOFZPWDhKYWlGVlBoTjl0Rk44TitI?=
 =?utf-8?B?c1llcGZCU25PWFlLTEJaaDliOGxlLzh3S3AvMWlLTmZUNnZwNnFQUTMwN0dk?=
 =?utf-8?B?TDd5enlrbnhSeVVXVU9yZ29WUGZ4WGw5NTY2MmYybFFqTmJXV0dnZTFrd2Iy?=
 =?utf-8?B?REhYWmJXSjZPcDJ1UmdhK2gySDJGNytMZ0NWaXVZQmwzVFZ2cVVNdmFQeTIy?=
 =?utf-8?B?aGh1WjQ2dktSWVpVMUdEcGpTNURpNXFtT05sdGlaNVp5bDdiSmMxaWJpTG5V?=
 =?utf-8?B?Z1hMZ3BuY1hrbTBNUkQ1bXdHL1NJWUt6QzZZSUlHK25QaDFZcXlpbDFjNENv?=
 =?utf-8?B?aWlXRXpDQXYrV3hON2ticjJWWU9zQTJGb2xwV1hDa2o1UzdpVUVMdnlmK2ZX?=
 =?utf-8?B?NElDV1NKcUtYOXRZNDFBajNqN0N5MVhIV2xGblJYZGxWNG42cDVUdVg3U29C?=
 =?utf-8?B?cG1XZ09PV1ZMeGVJRUlmQzlCT3c2MlF2N0lSQkl0SVBzUnVEK3c3UzJMb1pt?=
 =?utf-8?B?UmhKOU9uYVFGV1plLzJXbm1BVmVrYXkyQWJENCsxdVVhTFExQXRISnNjemNV?=
 =?utf-8?B?STZjck9mVTZ2YkI5dWdFTDNWcDhKWUpETFZPTjUrS2F0WVE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OHhJRXoySk90NG9JcVRXSVExOU02TVhWa1k2QTIwMGZCdWtQQ3pqWjExWjJ1?=
 =?utf-8?B?ZURRUDJnWjY5R1VWUnNWSmZCa2pFL1p0QnhWVmxMUHlaUUF1dkNKaW5WN2Vj?=
 =?utf-8?B?dEk3UUVjbFQvNFZaK0R1VXpPZG1RZU9UUWlYcUhUbGwvTXgyRmcyZGlLczZl?=
 =?utf-8?B?RCtGSzEwdUQ4RnpLNVBxZXRIZ2Z2bXFRS09sNjhKdnJvaUpyNUlEOGVybG5R?=
 =?utf-8?B?OEhTSGhqZWxjb3BnUWR3UE9LMEM3UGFUa2dGblNMUjZBTEtNYWpGdEl0ckFE?=
 =?utf-8?B?RU02TkFydTNFL1FGU3l6REtEd1k3L3lJRXBDc00yWmNtbmpNNnl2TW5xRW5N?=
 =?utf-8?B?SnkrK3BWSzBaK3lUY0V3dFd2dzdzbHZrNllDRlM4eXMzbVFIQVBqYTZMQVFz?=
 =?utf-8?B?dDdWYXhBMWtGSVluWXdXbVNUSTZBMVpKRXVUYVM1L2hLVEo0YUFMekVYOW1k?=
 =?utf-8?B?MFRQSldHVS9ZOHByS2RwOVJzS0JDbEp0c2ZaL2RiRnFWZDFOeThqdkE4K2J0?=
 =?utf-8?B?TXdsKzB5eFFtZGk4THZLZ1BjS0ZkTXpKVTV1MlBQVCtTR0tQYUc0QlVCYjBi?=
 =?utf-8?B?M1lSRTM4WjVvYkxOeHNMMUdPMGdmWUZVTnU4Y3NOTjRaaXN3czMxRTBnT1o2?=
 =?utf-8?B?RWJFSnZHeEF4UXBRU2h5ZG8xR0xjWGk1dWV6TXlPb0k1NUNOdmh5cnpxSXh4?=
 =?utf-8?B?OVdrZHAvQjVzUFdRMWtJWGtNc3pFaFdnS202eWxKMXNYM01kR2lnVjVDK1Jk?=
 =?utf-8?B?aVlUZU9KajRMd1BOZHFVYy9jY1ZhU3NIcEpGQ2FYenNmMjh2WXNZcmgramo5?=
 =?utf-8?B?YWJvaTBaK0ZidFp2VTRnQW5iS3J1MU03eGx5NUFPYVFKakNzQzhJYUFWUU1x?=
 =?utf-8?B?TkdzbktrSUxvKytCdmQrNElWMWplYjBGcnFwSXVJRHF5SDRpRUlEWFZLOWhU?=
 =?utf-8?B?SzNVOHk1WjdaYjZ5Z1JienlJWXJKTUdXQlR5NlRqeFJOTDlUUkJMZGhZUTZN?=
 =?utf-8?B?bER2L2Q0T2pwR1REcEE3L3FjWGZ1MnBzZ2NVbDQ1cjNzVXZ4aStXRFlvMU1m?=
 =?utf-8?B?UUNTK2RvN2JwT0dsZ2gydWEwY3pHOUJicDFBTDgrQ3l6eFZGMnA4RFFqRDY1?=
 =?utf-8?B?NVB5eEMwTzUyY09PTDFpUW1zbGlwVXNURzR2amloVGk3M093TlJwb01zOXBX?=
 =?utf-8?B?cnBiMHZvamwyL2xQSk13Y09YdCtQeWszQnU1aXNjdUxUSXRRdmxkQXlmLzhD?=
 =?utf-8?B?bi9ONFpFTlVvMThmcE5sYk1IVXpYZHRGNDdKdzFoZU1CcndiaXY3bWRPdExD?=
 =?utf-8?B?dm0vYVMveGp2YWJWZjlLRjhSUlVtazhleTBtMzQ0UkZEU1BhY3o1WkJEV3FS?=
 =?utf-8?B?cTZnckM3UThyS211eDNmUEd1cmVCbFY4cStlZ3BlYjdxclJEbUlwb1dpdEhM?=
 =?utf-8?B?R25YZkc3c0NPa1grV2lwOUtlNnNPZk9SZGtGclE5TEl4MGN3RGJsZnpsTHAv?=
 =?utf-8?B?SDRDVUlvY3llbzZxWHZKYXNKdkpLTldqTjNCS01hRTNhc1pOTFJiN0JTZTNo?=
 =?utf-8?B?YjRMTFJ1VDkxdkkxK2REV2ZnMHd3eGYwSVRwT2k3UkhpYWlJZ3VjY1RWUTZo?=
 =?utf-8?B?ZGJDNVNCT3lvM1A5MnZyaTJkbG5oTmZjU3NhTU43QmYrQ3RQYnorS25STFNW?=
 =?utf-8?B?U1JjTWc4YUFTMHpkK2dKdjZCYTV3dDRjRlNqWUk4SHRROXBYZUR0eFNUOE5H?=
 =?utf-8?B?ak9NUkxVZVRuYk9KRnhMUVUvN3R6aEw3VDBqWFplRDBRcDk4VW04ZXYrTGZ6?=
 =?utf-8?B?NWtNQU1TVGh2cjN5dDdrS3ZOSU1PS2xMa0hQQy8yS2VZbEZyQWZ3ODFUNlo5?=
 =?utf-8?B?YzQyZi9SV3ZzTGxGSk50M24zc3UzdHMzQ05QWWNZc2laZi9NSkdFcldjTG5L?=
 =?utf-8?B?dVgrRm5LRGRzUFVrUHdqU1lBVnVVaXVrYVVtMkdCWGpyVXpHZ1duWHVwM010?=
 =?utf-8?B?WEtvSzFXQkkzcHdBVm9RMTNYZkdLMWMycXArek11ejUxY3BLZXhxbnJQcVBR?=
 =?utf-8?B?dWw0Y2ZLMno1TGhRY2RIeEZvZDNWUGk4RzhJQlVoUUFvMjcrcy9ndWY5ekk2?=
 =?utf-8?B?RlVOdk5lSnJ6YVhRQXBGUDdRMSs3WERTeERpOUtlY1YzS1gwekZWN3VZMElC?=
 =?utf-8?Q?DMZAXkU4fu3UPiNXIkldPNU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A8E9038C34BF44BA963DD9150A57CE6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86cad56-dbc8-4a6b-acff-08dcb25f3cb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 19:22:08.9554 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +1Dj0GDAe8zE1ilrjNxUUqkI7bvp6gn5l3ATaSKQuYvCl7U7HW8u3vSkPRx23xkLlc/tlq6LyOmzargi+fJx2+/Lp1oh62s5VpYIi9xZDA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6699
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

T24gVHVlLCAyMDI0LTA3LTMwIGF0IDEzOjQ1ICswMjAwLCBDaHJpc3RvcGggTWFuc3pld3NraSB3
cm90ZToNCj4gRnJvbTogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+DQo+
IA0KVGl0bGUgYW5kIGNvbW1pdCBtZXNzYWdlIGlzIG5vIGxvbmdlciB2YWxpZCBoZXJlLg0KVGhp
cyBjb21taXQgaW50cm9kdWNlcyB0aGVzZSB0ZXN0cy4gQW55dGhpbmcgdGhhdMKgDQpyZWZlcmVu
Y2VzIG9sZGVyIHZlcnNpb24gb2YgdGhlIHRlc3Qgc2hvdWxkIGJlIHN0cmlwcGVkIG91dC4gIA0K
DQpSZWdhcmRzLA0KRG9taW5paw0KPiBUaGUgdGVzdHMgZGVwZW5kZWQgb24gdW5kZWZpbmVkIGJl
aGF2aW9yIG9mIEdQVS4gSW52YWxpZCBpbnN0cnVjdGlvbg0KPiBwcm92aWRlZCBieSB0aGUgdGVz
dCBoYXMgMjl0aCBiaXQgc2V0LCB3aGljaCBvbiBYZTIgY2F1c2VzIFNJUCBjYWxsIHdpdGhvdXQN
Cj4gcHJvdmlkaW5nIGFueSBleGNlcHRpb24gcmVhc29uIGFuZCBBSVAgYWRkcmVzcywgdW5sZXNz
IGV1ZGVidWcgaXMgZW5hYmxlZCwNCj4gaW4gc3VjaCBjYXNlIGJyZWFrcG9pbnQgZXhjZXB0aW9u
IGlzIHNpZ25hbGxlZC4NCj4gDQo+IFhlMiBhbmQgZWFybGllciBnZW5zIGFyZSBhYmxlIHRvIGhh
bmRsZSB2ZXJ5IGxpbWl0ZWQgc2V0IG9mIGludmFsaWQNCj4gaW5zdHJ1Y3Rpb25zIC0gb25seSBp
bGxlZ2FsIGFuZCB1bmRlZmluZWQgb3Bjb2Rlcywgb3RoZXIgZXJyb3JzIGluDQo+IGluc3RydWN0
aW9uIGNhbiBjYXVzZSB1bmRlZmluZWQgYmVoYXZpb3IuDQo+IElsbGVnYWwvdW5kZWZpbmVkIG9w
Y29kZSByZXN1bHRzIGluOg0KPiAtIHNldHRpbmcgaWxsZWdhbCBvcGNvZGUgc3RhdHVzIGJpdCAt
IGNyMC4xWzI4XSwNCj4gLSBjYWxsaW5nIFNJUCBpZiBpbGxlZ2FsIG9wY29kZSBiaXQgaXMgZW5h
YmxlZCAtIGNyMC4xWzEyXS4NCj4gY3IwLjFbMTJdIGNhbiBiZSBlbmFibGVkIGRpcmVjdGx5IGZy
b20gdGhlIHRocmVhZCBvciBieSB0aHJlYWQgZGlzcGF0Y2hlcg0KPiBmcm9tIEludGVyZmFjZSBE
ZXNjcmlwdG9yIERhdGEgcHJvdmlkZWQgdG8gQ09NUFVURV9XQUxLRVIgaW5zdHJ1Y3Rpb24uDQo+
IA0KPiBSZS13b3JrZWQgdGVzdHMgd29ya3Mgc2ltaWxhciB3YXkgdG8gT09CIHRlc3RzOg0KPiAt
IGNoZWNrIGlmIFNJUCBpcyBub3QgY2FsbGVkIHdoZW4gZXhjZXB0aW9uIGlzIG5vdCBlbmFibGVk
LA0KPiAtIGNoZWNrIGlmIFNJUCBpcyBjYWxsZWQgd2hlbiBleGNlcHRpb24gaXMgZW5hYmxlZCBm
cm9tIEVVIHRocmVhZCwNCj4gLSBjaGVjayBpZiBTSVAgaXMgY2FsbGVkIHdoZW4gZXhjZXB0aW9u
IGlzIGVuYWJsZWQgZnJvbSBDT01QVVRFX1dBTEtFUi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFu
ZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiBDYzogTWlrYSBLdW9wcGFs
YSA8bWlrYS5rdW9wcGFsYUBpbnRlbC5jb20+DQo+IENjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRv
bWluaWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfZXhl
Y19zaXAuYyB8IDcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19zaXAuYyBiL3Rlc3RzL2ludGVsL3hlX2V4
ZWNfc2lwLmMNCj4gaW5kZXggMzVkNjViY2M0Li4wZGIwZGM0YjggMTAwNjQ0DQo+IC0tLSBhL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfc2lwLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfZXhlY19zaXAu
Yw0KPiBAQCAtMzgsMTQgKzM4LDIyIEBADQo+ICAjZGVmaW5lIFNIQURFUl9CUkVBS1BPSU5UIDAN
Cj4gICNkZWZpbmUgU0hBREVSX1dSSVRFIDENCj4gICNkZWZpbmUgU0hBREVSX1dBSVQgMg0KPiAt
I2RlZmluZSBTSEFERVJfSEFORyAzDQo+IC0jZGVmaW5lIFNJUF9XUklURSA0DQo+IC0jZGVmaW5l
IFNJUF9OVUxMIDUNCj4gLSNkZWZpbmUgU0lQX1dBSVQgNg0KPiAtI2RlZmluZSBTSVBfSEVBVlkg
Nw0KPiArI2RlZmluZSBTSEFERVJfSU5WX0lOU1RSX0RJU0FCTEVEIDMNCj4gKyNkZWZpbmUgU0hB
REVSX0lOVl9JTlNUUl9USFJFQURfRU5BQkxFRCA0DQo+ICsjZGVmaW5lIFNIQURFUl9JTlZfSU5T
VFJfV0FMS0VSX0VOQUJMRUQgNQ0KPiArI2RlZmluZSBTSEFERVJfSEFORyA2DQo+ICsjZGVmaW5l
IFNJUF9XUklURSA3DQo+ICsjZGVmaW5lIFNJUF9OVUxMIDgNCj4gKyNkZWZpbmUgU0lQX1dBSVQg
OQ0KPiArI2RlZmluZSBTSVBfSEVBVlkgMTANCj4gKyNkZWZpbmUgU0lQX0lOVl9JTlNUUiAxMQ0K
PiAgDQo+ICAjZGVmaW5lIEZfU1VCTUlUX1RXSUNFCSgxIDw8IDApDQo+ICANCj4gKy8qIENvbnRy
b2wgUmVnaXN0ZXIgY3IwLjEgYml0cyBmb3IgZXhjZXB0aW9uIGhhbmRsaW5nICovDQo+ICsjZGVm
aW5lIElMTEVHQUxfT1BDT0RFX0VOQUJMRSBCSVQoMTIpDQo+ICsjZGVmaW5lIElMTEVHQUxfT1BD
T0RFX1NUQVRVUyBCSVQoMjgpDQo+ICsNCj4gIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfYnVmICoNCj4g
IGNyZWF0ZV9maWxsX2J1ZihpbnQgZmQsIGludCB3aWR0aCwgaW50IGhlaWdodCwgdWludDhfdCBj
b2xvcikNCj4gIHsNCj4gQEAgLTY4LDggKzc2LDEyIEBAIGNyZWF0ZV9maWxsX2J1ZihpbnQgZmQs
IGludCB3aWR0aCwgaW50IGhlaWdodCwgdWludDhfdCBjb2xvcikNCj4gIHN0YXRpYyBzdHJ1Y3Qg
Z3BncHVfc2hhZGVyICpnZXRfc2hhZGVyKGludCBmZCwgY29uc3QgaW50IHNoYWRlcnR5cGUpDQo+
ICB7DQo+ICAJc3RhdGljIHN0cnVjdCBncGdwdV9zaGFkZXIgKnNoYWRlcjsNCj4gKwl1aW50MzJf
dCBiYWQ7DQo+ICANCj4gIAlzaGFkZXIgPSBncGdwdV9zaGFkZXJfY3JlYXRlKGZkKTsNCj4gKwlp
ZiAoc2hhZGVydHlwZSA9PSBTSEFERVJfSU5WX0lOU1RSX1dBTEtFUl9FTkFCTEVEKQ0KPiArCQlz
aGFkZXItPmlsbGVnYWxfb3Bjb2RlX2V4Y2VwdGlvbl9lbmFibGUgPSB0cnVlOw0KPiArDQo+ICAJ
Z3BncHVfc2hhZGVyX193cml0ZV9kd29yZChzaGFkZXIsIFNIQURFUl9DQU5BUlksIDApOw0KPiAg
DQo+ICAJc3dpdGNoIChzaGFkZXJ0eXBlKSB7DQo+IEBAIC04Nyw2ICs5OSwyMSBAQCBzdGF0aWMg
c3RydWN0IGdwZ3B1X3NoYWRlciAqZ2V0X3NoYWRlcihpbnQgZmQsIGNvbnN0IGludCBzaGFkZXJ0
eXBlKQ0KPiAgCQlncGdwdV9zaGFkZXJfX25vcChzaGFkZXIpOw0KPiAgCQlncGdwdV9zaGFkZXJf
X2JyZWFrcG9pbnQoc2hhZGVyKTsNCj4gIAkJYnJlYWs7DQo+ICsJY2FzZSBTSEFERVJfSU5WX0lO
U1RSX1RIUkVBRF9FTkFCTEVEOg0KPiArCQlncGdwdV9zaGFkZXJfX3NldF9leGNlcHRpb24oc2hh
ZGVyLCBJTExFR0FMX09QQ09ERV9FTkFCTEUpOw0KPiArCQkvKiBmYWxsIHRocm91Z2ggKi8NCj4g
KwljYXNlIFNIQURFUl9JTlZfSU5TVFJfRElTQUJMRUQ6DQo+ICsJY2FzZSBTSEFERVJfSU5WX0lO
U1RSX1dBTEtFUl9FTkFCTEVEOg0KPiArCQliYWQgPSAoc2hhZGVydHlwZSA9PSBTSEFERVJfSU5W
X0lOU1RSX0RJU0FCTEVEKSA/IElMTEVHQUxfT1BDT0RFX0VOQUJMRSA6IDA7DQo+ICsJCWdwZ3B1
X3NoYWRlcl9fd3JpdGVfb25fZXhjZXB0aW9uKHNoYWRlciwgMSwgMCwgSUxMRUdBTF9PUENPREVf
RU5BQkxFLCBiYWQpOw0KPiArCQlncGdwdV9zaGFkZXJfX25vcChzaGFkZXIpOw0KPiArCQlncGdw
dV9zaGFkZXJfX25vcChzaGFkZXIpOw0KPiArCQkvKiBtb2RpZnkgc2Vjb25kIG5vcCwgc2V0IG9u
bHkgb3Bjb2RlIGJpdHNbNjowXSAqLw0KPiArCQlzaGFkZXItPmluc3RyW3NoYWRlci0+c2l6ZS80
IC0gMV1bMF0gPSAweDdmOw0KPiArCQkvKiBTSVAgc2hvdWxkIGNsZWFyIGV4Y2VwdGlvbiBiaXQg
Ki8NCj4gKwkJYmFkID0gSUxMRUdBTF9PUENPREVfU1RBVFVTOw0KPiArCQlncGdwdV9zaGFkZXJf
X3dyaXRlX29uX2V4Y2VwdGlvbihzaGFkZXIsIDIsIDAsIElMTEVHQUxfT1BDT0RFX1NUQVRVUywg
YmFkKTsNCj4gKwkJYnJlYWs7DQo+ICAJfQ0KPiAgDQo+ICAJZ3BncHVfc2hhZGVyX19lb3Qoc2hh
ZGVyKTsNCj4gQEAgLTEyNyw2ICsxNTQsOSBAQCBzdGF0aWMgc3RydWN0IGdwZ3B1X3NoYWRlciAq
Z2V0X3NpcChpbnQgZmQsIGNvbnN0IGludCBzaXB0eXBlLA0KPiAgDQo+ICAJCWdwZ3B1X3NoYWRl
cl9fd2FpdChzaXApOw0KPiAgCQlicmVhazsNCj4gKwljYXNlIFNJUF9JTlZfSU5TVFI6DQo+ICsJ
CWdwZ3B1X3NoYWRlcl9fd3JpdGVfb25fZXhjZXB0aW9uKHNpcCwgMSwgeV9vZmZzZXQsIElMTEVH
QUxfT1BDT0RFX1NUQVRVUywgMCk7DQo+ICsJCWJyZWFrOw0KPiAgCX0NCj4gIA0KPiAgCWdwZ3B1
X3NoYWRlcl9fZW5kX3N5c3RlbV9yb3V0aW5lKHNpcCwgc2hhZGVydHlwZSA9PSBTSEFERVJfQlJF
QUtQT0lOVCk7DQo+IEBAIC0xNjAsNyArMTkwLDcgQEAgc3RhdGljIHZvaWQgY2hlY2tfZmlsbF9i
dWYodWludDhfdCAqcHRyLCBjb25zdCBpbnQgd2lkdGgsIGNvbnN0IGludCB4LA0KPiAgfQ0KPiAg
DQo+ICBzdGF0aWMgaW50IGNoZWNrX2J1ZihpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwgaW50IHdp
ZHRoLCBpbnQgaGVpZ2h0LA0KPiAtCQkgICAgICBpbnQgc2lwdHlwZSwgdWludDhfdCBwb2lzb25f
YykNCj4gKwkJICAgICAgaW50IHNoYWRlcnR5cGUsIGludCBzaXB0eXBlLCB1aW50OF90IHBvaXNv
bl9jKQ0KPiAgew0KPiAgCXVuc2lnbmVkIGludCBzeiA9IEFMSUdOKHdpZHRoICogaGVpZ2h0LCA0
MDk2KTsNCj4gIAlpbnQgdGhyZWFkX2NvdW50ID0gMCwgc2lwX2NvdW50ID0gMDsNCj4gQEAgLTE5
NCw3ICsyMjQsMTAgQEAgc3RhdGljIGludCBjaGVja19idWYoaW50IGZkLCB1aW50MzJfdCBoYW5k
bGUsIGludCB3aWR0aCwgaW50IGhlaWdodCwNCj4gIAl9DQo+ICANCj4gIAlpZ3RfYXNzZXJ0KHRo
cmVhZF9jb3VudCk7DQo+IC0JaWYgKHNpcHR5cGUgIT0gU0lQX05VTEwgJiYgeGVfZXVkZWJ1Z19k
ZWJ1Z2dlcl9hdmFpbGFibGUoZmQpKQ0KPiArCWlmIChzaGFkZXJ0eXBlID09IFNIQURFUl9JTlZf
SU5TVFJfRElTQUJMRUQpDQo+ICsJCWlndF9hc3NlcnQoIXNpcF9jb3VudCk7DQo+ICsJZWxzZSBp
ZiAoKHNpcHR5cGUgIT0gU0lQX05VTEwgJiYgeGVfZXVkZWJ1Z19kZWJ1Z2dlcl9hdmFpbGFibGUo
ZmQpKSB8fA0KPiArCQkgKHNpcHR5cGUgPT0gU0lQX0lOVl9JTlNUUiAmJiBzaGFkZXJ0eXBlICE9
IFNIQURFUl9JTlZfSU5TVFJfRElTQUJMRUQpKQ0KPiAgCQlpZ3RfYXNzZXJ0X2YodGhyZWFkX2Nv
dW50ID09IHNpcF9jb3VudCwNCj4gIAkJCSAgICAgIlRocmVhZCBhbmQgU0lQIGNvdW50IG1pc21h
dGNoLCAlZCAhPSAlZFxuIiwNCj4gIAkJCSAgICAgdGhyZWFkX2NvdW50LCBzaXBfY291bnQpOw0K
PiBAQCAtMjg1LDYgKzMxOCwxOCBAQCB4ZV9zeXNmc19nZXRfam9iX3RpbWVvdXRfbXMoaW50IGZk
LCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpKQ0KPiAgICogU1VCVEVT
VDogd2FpdC13cml0ZXNpcC1ub2RlYnVnDQo+ICAgKiBEZXNjcmlwdGlvbjogdmVyaWZ5IHRoYXQg
d2UgZG9uJ3QgZW50ZXIgU0lQIGFmdGVyIHdhaXQgd2l0aCBkZWJ1Z2dpbmcgZGlzYWJsZWQuDQo+
ICAgKg0KPiArICogU1VCVEVTVDogaW52YWxpZGluc3RyLWRpc2FibGVkDQo+ICsgKiBEZXNjcmlw
dGlvbjogVmVyaWZ5IHRoYXQgd2UgZG9uJ3QgZW50ZXIgU0lQIGFmdGVyIHJ1bm5pbmcgaW50byBh
biBpbnZhbGlkDQo+ICsgKgkJaW5zdHJ1Y3Rpb24gd2hlbiBleGNlcHRpb24gaXMgbm90IGVuYWJs
ZWQuDQo+ICsgKg0KPiArICogU1VCVEVTVDogaW52YWxpZGluc3RyLXRocmVhZC1lbmFibGVkDQo+
ICsgKiBEZXNjcmlwdGlvbjogVmVyaWZ5IHRoYXQgd2UgZW50ZXIgU0lQIGFmdGVyIHJ1bm5pbmcg
aW50byBhbiBpbnZhbGlkIGluc3RydWN0aW9uDQo+ICsgKiAgICAgICAgICAgICAgd2hlbiBleGNl
cHRpb24gaXMgZW5hYmxlZCBmcm9tIHRocmVhZC4NCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBpbnZh
bGlkaW5zdHItd2Fsa2VyLWVuYWJsZWQNCj4gKyAqIERlc2NyaXB0aW9uOiBWZXJpZnkgdGhhdCB3
ZSBlbnRlciBTSVAgYWZ0ZXIgcnVubmluZyBpbnRvIGFuIGludmFsaWQgaW5zdHJ1Y3Rpb24NCj4g
KyAqICAgICAgICAgICAgICB3aGVuIGV4Y2VwdGlvbiBpcyBlbmFibGVkIGZyb20gQ09NUFVURV9X
QUxLRVIuDQo+ICsgKg0KPiAgICogU1VCVEVTVDogYnJlYWtwb2ludC13cml0ZXNpcC1ub2RlYnVn
DQo+ICAgKiBEZXNjcmlwdGlvbjogdmVyaWZ5IHRoYXQgd2UgZG9uJ3QgZW50ZXIgU0lQIGFmdGVy
IGhpdHRpbmcgYnJlYWtwb2ludCBpbiBzaGFkZXINCj4gICAqCQl3aGVuIGRlYnVnZ2luZyBpcyBk
aXNhYmxlZC4NCj4gQEAgLTM0NCw3ICszODksNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X3NpcChpbnQg
c2hhZGVyLCBpbnQgc2lwLCBzdHJ1Y3QgZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZQ0K
PiAgCQlpbnRlbF9iYl9zeW5jKGliYik7DQo+ICAJCWlndF9hc3NlcnRfbHRfdTY0KGlndF9uc2Vj
X2VsYXBzZWQoJnRzKSwgdGltZW91dCk7DQo+ICANCj4gLQkJZGlzcGF0Y2hlZCA9IGNoZWNrX2J1
ZihmZCwgaGFuZGxlLCB3aWR0aCwgaGVpZ2h0LCBzaXAsIENPTE9SX0M0KTsNCj4gKwkJZGlzcGF0
Y2hlZCA9IGNoZWNrX2J1ZihmZCwgaGFuZGxlLCB3aWR0aCwgaGVpZ2h0LCBzaGFkZXIsIHNpcCwg
Q09MT1JfQzQpOw0KPiAgCQljaGVja191c2VyY29yZWR1bXAoZmQsIHNpcCwgZGlzcGF0Y2hlZCk7
DQo+ICANCj4gIAkJZ2VtX2Nsb3NlKGZkLCBoYW5kbGUpOw0KPiBAQCAtMzk2LDYgKzQ0MSwxNSBA
QCBpZ3RfbWFpbg0KPiAgCQl0ZXN0X3JlbmRlcl9hbmRfY29tcHV0ZSgid2FpdC13cml0ZXNpcC1u
b2RlYnVnIiwgZmQsIGVjaSkNCj4gIAkJCXRlc3Rfc2lwKFNIQURFUl9XQUlULCBTSVBfV1JJVEUs
IGVjaSwgMCk7DQo+ICANCj4gKwkJdGVzdF9yZW5kZXJfYW5kX2NvbXB1dGUoImludmFsaWRpbnN0
ci1kaXNhYmxlZCIsIGZkLCBlY2kpDQo+ICsJCQl0ZXN0X3NpcChTSEFERVJfSU5WX0lOU1RSX0RJ
U0FCTEVELCBTSVBfSU5WX0lOU1RSLCBlY2ksIDApOw0KPiArDQo+ICsJCXRlc3RfcmVuZGVyX2Fu
ZF9jb21wdXRlKCJpbnZhbGlkaW5zdHItdGhyZWFkLWVuYWJsZWQiLCBmZCwgZWNpKQ0KPiArCQkJ
dGVzdF9zaXAoU0hBREVSX0lOVl9JTlNUUl9USFJFQURfRU5BQkxFRCwgU0lQX0lOVl9JTlNUUiwg
ZWNpLCAwKTsNCj4gKw0KPiArCQl0ZXN0X3JlbmRlcl9hbmRfY29tcHV0ZSgiaW52YWxpZGluc3Ry
LXdhbGtlci1lbmFibGVkIiwgZmQsIGVjaSkNCj4gKwkJCXRlc3Rfc2lwKFNIQURFUl9JTlZfSU5T
VFJfV0FMS0VSX0VOQUJMRUQsIFNJUF9JTlZfSU5TVFIsIGVjaSwgMCk7DQo+ICsNCj4gIAkJdGVz
dF9yZW5kZXJfYW5kX2NvbXB1dGUoImJyZWFrcG9pbnQtd3JpdGVzaXAtbm9kZWJ1ZyIsIGZkLCBl
Y2kpDQo+ICAJCQl0ZXN0X3NpcChTSEFERVJfQlJFQUtQT0lOVCwgU0lQX1dSSVRFLCBlY2ksIDAp
Ow0KPiAgDQoNCg==
