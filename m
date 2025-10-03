Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346F9CCA471
	for <igt-dev@archiver.kernel.org>; Fri,  3 Oct 2025 11:46:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38BF10E32A;
	Fri,  3 Oct 2025 11:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iiwdmn0T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A267F10E32A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Oct 2025 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759491963; x=1791027963;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=CFeYaJgvcAAWqcQlLGzJJcBxpdNTiYOeFR6t7hfmvQ8=;
 b=iiwdmn0TYoXNyLP5tMrr0PZAcRYIU7r9166fsIgJVpV6yK+9JvTvIYJ6
 iXS3E0TPD/LQcj9+CSHIZVur6qKrtJmrsZyD3QBiB+IO/+53eVhBXoSYo
 qNHlRsaZiVaSu7NinU177ZFcajM21e4LAZismf+BYKTJN4Q12U/G+65qV
 pxTtryzNtx2cxZ9tttA2cNP5AZdUvdRzYoUuPjA4MDBzewDJ95f+rGGKx
 VT2w9IClLrAfJkoZ7gKUVFAdg+qn5hEQeP2zx/R7P5guenbbjT9gFX1N0
 JEie8nWpjeDuOWcafaeEsG8AGWMBGhzHlCo+9puXKjZd1TsOvLBg2wzo7 g==;
X-CSE-ConnectionGUID: 2VpmJiaZQdiSvkoAKDXfPA==
X-CSE-MsgGUID: zCyW+Wb0TJOeaya1LR3a5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="73201474"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="73201474"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:46:01 -0700
X-CSE-ConnectionGUID: I9PnZDh3RUeSQZpOGkgnfQ==
X-CSE-MsgGUID: 5UkM0DmZR5qTkbFwwgVXAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; d="scan'208";a="180070541"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2025 04:45:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 04:45:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 3 Oct 2025 04:45:56 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.17)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 3 Oct 2025 04:45:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2ppjfBY9/iPRF3tY8S4N0VtbWGp/j2vc8OTldJfUkgifmObNnDYWiV8u7FUoLGxgYnzZwY8t16KfYKESke1zXM1gYn00+2zZAwVg8pcEUGxPjyw0Aq7pAd2Z0F7Xl9jiZn/B0r0+Z7+e9xJH6ceVjcy9Du6O7ArhJ84L5yKhC0bb/crdEPmSWCbtj3xqbDd9Ac3jgoAbhiAhwMXyKa79mg5aIAVX7LjXeGD44gRfNyCfvjWU7ejUBDUjX0bY2yb0ZWI3pNxMn251Zhx1YDqvWXswkYoWS42eI0Qzk/97Z7AaFjSgik2xcjacX2hbJGHIhoJSrSkxPp0lsCqOYr7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFeYaJgvcAAWqcQlLGzJJcBxpdNTiYOeFR6t7hfmvQ8=;
 b=tw2lMFsTxGygP7iGOlbDpnpmG82vbmVfIg7UtOXauqnqCsDWMs9iaExHj20d8OM1+ThzJEBDJx4S/VZWCWxyqXl2s8ljprKeyfFgken+qjbe5hXweLoNvaXBYI0xe1k/sp4V+gX2ro+ELuNTUXCn/F6cUu2+Vbnd1itdq8CvVv06aTpes3C7FCjAyB5cRt5ENLBQbT/5koJEIpH88fxS5mPRT+WCg+nA5EHdDnFR11k1SQQ3YvEQ50ck/lQ5eb5jpqjpfa8cFIGYPNqEVvNN+X0nL4TyF+OlKzhXWlm96eZszTbqLY3HcsLQRvNDKxVkJttyqGzdADiotcWTX1sVrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH0PR11MB5029.namprd11.prod.outlook.com (2603:10b6:510:30::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.16; Fri, 3 Oct 2025 11:45:50 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 11:45:49 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Fix memory
 leak
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Fix memory
 leak
Thread-Index: AQHcNFWuUxfOBFg5wEGwAD4bN91fNLSwTdoA
Date: Fri, 3 Oct 2025 11:45:49 +0000
Message-ID: <7a2a227e631a967329db3ce46417692402d4636c.camel@intel.com>
References: <20251003110543.4129362-1-nishit.sharma@intel.com>
In-Reply-To: <20251003110543.4129362-1-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH0PR11MB5029:EE_
x-ms-office365-filtering-correlation-id: 0c2c8e58-6318-4923-0513-08de02726645
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|10070799003|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?elNBVkJGZEh5eDczQmpZcThmakRNNDd1Zjh4U01TT1Y0MG9NTWhlMlQxaSts?=
 =?utf-8?B?T040b0hva0JuODJsRDcvNmVTb0JYalhZUXN2amZtc3R4ZFZ1OTlVRVZEUXB1?=
 =?utf-8?B?ZWpQYU1hcmkxOFRZVGFSSzlCbTZFVWtrTDMrbm90Ui9laW83Z3kvMkpiYjQ1?=
 =?utf-8?B?VDlWdi95NEQ5b2x0Wnp5RTZ6RnJKNzdnWGVwRUJic2hrOWdMSU9kdFMycnYx?=
 =?utf-8?B?S01ONUNRRURZZ0pHMlNHalF1NGpPdWFQRlJTQlR0VkFZWm9aVFVKYnBaU3NF?=
 =?utf-8?B?RDJzMFZDWnp6ZGR0RHRRRmg3cWxMcUNuYUFGRGY3L2ZvS2kvYzRPVkN2RFNs?=
 =?utf-8?B?Wk91dEpPNVlLOUxiQ2s2ekc1dFB4WVI1U2VyWkhhc2lsOHlhWEkraWJtY3Bv?=
 =?utf-8?B?N3lBMFJKL3YzWGx6VHh4MUNMRDhndXBpUjJEYkpIZS82T29qdFhnRVFDdncz?=
 =?utf-8?B?d0pxc1BicDJoWGpqNGl0ZWJzcWNvZDdsTk9kU3J5Y0UvOEVVZFBOOEVvb0pT?=
 =?utf-8?B?K0h2d2U0VXkwSmErd3dxU0I1MHpjYkZPSEJPbTB5ZVd0RVEvMS9rN29sTDB6?=
 =?utf-8?B?N0w5SGZOS1BMREVwVTNYWVlVNW1mUmpmREFCakQvOStWVUdFdVJmYm1BQUpL?=
 =?utf-8?B?RlZ0WUlLQk51Y1NnSnBNbi8zWnkvU2JYcE52T0VDcjN1WjBkVm9aL0pRWjdj?=
 =?utf-8?B?d0tWcjJvWG54RFpGcE1Kbnp2WlFYSTBFSjFWbTJQcGMybElmM1lQRDRyTm5S?=
 =?utf-8?B?b1VkMTJ0c1dCZGpReWxTT1JzVEcyTkJHMGY2bUhaUU1hclIvWnZSZUhEdHRq?=
 =?utf-8?B?K0FlcGYwMWR5YmQwN2hJM2VhZ0VON0NDV3ZEai9nRDRERHNMeElzaVdaeCtX?=
 =?utf-8?B?MkxOUjhNcHBtcEFhNlR3ZHNxTlBQaEZCU0JQL0htMXFEQWNyWEszQ1JEc0Z1?=
 =?utf-8?B?WndEbG5SdjNWSjRMMXF0MkV6MzN5elAwbzY4eWFHeTI2NnJWOGluWkszVlh1?=
 =?utf-8?B?V0NoRnh0aHZMQS9kTm9OcWpBV2pvbGpNdXFRQlY0RDN6bnU2OU1ZbjYwWVc0?=
 =?utf-8?B?R0pZT1FHWWljem9JU3gxS25hbzVGeDJlTi9nQ0xQY2ZNV0hla3BiQnBsSU9t?=
 =?utf-8?B?TXJCTFdRazkwZk0rSC9wQlZOdWdQT0F1MVNuM2ZFZW0wWEl6Zkt0b0tHSVRN?=
 =?utf-8?B?TUs3Q1ZicUtvRTZjSyszUGhINGdCRnhkVUk2cmtVZzlWWS9jVFFFekhNZzQy?=
 =?utf-8?B?T29Ucjc3TkJORDEyUmVPS1lDM1RxdzFUMkhOVmF5ZXF5T25PQkpFYkJheVRC?=
 =?utf-8?B?L0h1MGdCZlQyRmRVWVBzRDliK3NYQUQ0ak9kMkpCQUxYZXR0K0R4SUJqMCsx?=
 =?utf-8?B?cm9SYm1uVlNtdU5FdURXT0hqSWVFVml1OTNZRjdEZ2xzbTRJbk5LdnJqcG1z?=
 =?utf-8?B?c2xVSk9JeEptS3pkK0RhMGZmWDNaZURpc3FraHZtTk5lcHVoaUpWSE95WExz?=
 =?utf-8?B?cU5NQkdXVEMvSWRrWXR0UEhkTURCTm1UKzJ6N0hndWxub0RMSGpXTnZEL0pP?=
 =?utf-8?B?M3BRamJSLzUrT3FNeEhPTjlvbmRJZ0FiQ3ZYdi8zZmM5VDlPWUsxN2t3N0R5?=
 =?utf-8?B?Szd1NFJOdTJlY3VGbmprVjNMWkJnQlZaMFgyOW1kOU1IVDQwTGI3cnV2SHJ1?=
 =?utf-8?B?ekNoZVdYVlBzT3ZnanZZSURsOU5pWU8zWmVIS0FGRnA5L1lBcFY1dGIvaHBV?=
 =?utf-8?B?SDYyTzRWYXlVcG0wNWpHR0dzdy80SjF4N25LYTBiVnRqVlJNcUlFQnFYaVQ0?=
 =?utf-8?B?RXhhRFkzZzhDUGtTZWxSS1NxNk9uTjYxY05lUnh3dzgyTEVuRi9ZYk9JTXdU?=
 =?utf-8?B?R0FjNXNlbXRYR3Y4WkFSUytPYzErRzdTUjZjVVhwYnVLQnhYNkE2eTNxZEJn?=
 =?utf-8?B?emYrdkN2bGNqckI2MFVEMmF2WU5pL1ZQSUxWWnYvWGZqQ2dJdGx4dzkzeHhr?=
 =?utf-8?B?bXBNOVRaVzFNRlVJVS9VRUhzNmIzclZLZjlTdjViUVpYaS9KRGxzNXRxVDd0?=
 =?utf-8?Q?pOs0DF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(10070799003)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHhkWm4rQ2s5M2NNd2RxRzNHVE1CTVJ5TUNwcnVQRU1Ick9GaVdYZGZIUW1Q?=
 =?utf-8?B?K1B0VDJlN3k1ejlQT2ZEMExMbnJGc2VrN0RwNy9EOG5lR2tOMXcreE0yMTNt?=
 =?utf-8?B?MVdLb1ZZUzZvdWozcEE5V1lUVU1HVU5nOTFrdFY3Y3dycGMzQlMyNlhPYjhn?=
 =?utf-8?B?VGhSQXp4VGZLQXhHRU54bTJ2c1Vpcm8vK0FoNXB4bkRFQlZQN3V1dlhzeXQx?=
 =?utf-8?B?SlhacFhRMmg0WXAxR2ZORHBnbmZyV25CblJ4Z0NiMTFOc0pVUUxKMnB4REt6?=
 =?utf-8?B?TitSZG1wL0syWnhrMFBDTzl3dTJQNm0vZnhoQTRMY0xWN0J2bGtCZHBNQmlL?=
 =?utf-8?B?RzBNY1NOU1EvYWNvdVJUZVNRYzBaemx2S1VoVzBnd1FJcUVuZHZXSDEyN2dE?=
 =?utf-8?B?K2RnMGtGMEJyc1BVNmIxOXZBL25vVmVLS25VcFcrZ3NDVTBiZmxZUUZHTTZ4?=
 =?utf-8?B?N2h1WmMwMTQ1clVxVzRoZUZuZG1RaW9zMEU1R2oyNHFLM2Z5Vk1lVVhscnAr?=
 =?utf-8?B?c2J3UnJNU29QRjVpamh6V1dOZ1FwMFluN2JzODBvWEVmaWYvdEVWdjdDRGhH?=
 =?utf-8?B?RkN5cVdRSWNzY2RjTzVDdFVWRjNLNURKZWNCRG4zUTBIZnV0VW0yYStIQkU3?=
 =?utf-8?B?THNqMXgzSmlDUHhzZ1JzZytud3VkMm5OOVVRekF4R3d6MTRlM2tvd2VtM2RY?=
 =?utf-8?B?UkFhUFdxa3RDU3Y1NUxuMHNpM1NEZW94dklBT2lEMlZTZWZpKzlGZVpUbmt0?=
 =?utf-8?B?bmV3UVJqaEJMTVFOVEdscVFtRW94RTVER0dZVXpSM3dHSThFU2lNMllERkFE?=
 =?utf-8?B?QWRkWWQvRDNNMDdmK1dsYkd0dVg0VHI0c3NtUFFXcGVKajZVYTJIMmJIOThN?=
 =?utf-8?B?alVyOERuM3kvVllnbnBBcDMwMEFITjFRTjhKaXJlUnBoc0VnUHhIT2htMVpH?=
 =?utf-8?B?OWhUQVZjNElPL2IzNW9UdTB1djlxRUk3KzZGZ1kxcnMvYlpMVmNoQ0lCdi9M?=
 =?utf-8?B?K3BYTjBYaVdUN1N1WnVaWHAvN1krL3FOYzFqVElrSVZvbXdRL2FORHZId2E1?=
 =?utf-8?B?NWlXY1ZuSXdrNklkWVl4cVI5b1lYOWM1VThwZXZLK09tYmJXWjBwY3pLT05u?=
 =?utf-8?B?VW9jYk05TEQwWGE1MlRaY2FWUUh6cXRmYzB2WWVWbUVaeTdmb29wUjkyaVZh?=
 =?utf-8?B?M3Q2QXJxczFndjVZUitTL1FqTEYvS29LQ2RSUWlNa0xOYzFXQjErcjN0N0t1?=
 =?utf-8?B?Yk1WYVRadVY4cy90cWIrSTdtanM4emJKUUs3QytjKzNORUZoODl4eXZZMVlM?=
 =?utf-8?B?VXhqU1Q4ek1GaUJqVWFaaTZTVUc2aGRzQjRlNWUwTnVyWlc0UERVYlZWb3dE?=
 =?utf-8?B?MWdIUVZoYklkVkN3ZGxxb0hzQ0RiTGY5T09CZDd3cCthYWJQZTNVeU5QTys5?=
 =?utf-8?B?N1lMcEQ4Z29ZTlFCY3lEZnRIeUE2aDZwWHBkQVN1Z2RoVUpYUzlzMVN1eGZp?=
 =?utf-8?B?WHNZRjhUWUwwZmxmbU54emRmMUVLWUlaTGU0VEs4UzNKK2VYWUhVcE1idmN0?=
 =?utf-8?B?V1FkSUxBZW9SRmM3U3ZudUlPYzZLLzhHVFg3dUhHT05SL2xqZnVZY2YyUUVY?=
 =?utf-8?B?QjFmQjd0SzlZT0hMalRkejNLcTNTc21zRHlrV0N2Vzl0M3Y1ZndTcFN3RFpJ?=
 =?utf-8?B?YXVrbmZsdkV4aTJ6MXhTemhhdy9iMGhXTkNYUGx4emNDRXJTcUhaQk9zMCtx?=
 =?utf-8?B?Wkxnd3RqMHBodVhlT09jY3M1Mzd6TXl4aFFMb2U4ZU05Nnhxdm9JM2l5Tktw?=
 =?utf-8?B?MlExSVVDZ1k1SmYwZVdtbUFTOFI2bVpadklPZmYrYkpOWnpnNnZIUUxwVUlv?=
 =?utf-8?B?cmN4bXVoU2EvN0dnRWVCZmVIZUtEZjh2MHRJM1FhbzF1c0VLOGswZi9BTnhB?=
 =?utf-8?B?b0tkMDZFZEhDZDVSWjNobjcySmh1OEhUU0NiWHl0RlJkT2dpRU9UVHpDc2Nx?=
 =?utf-8?B?WXN4dnIvdVhjMGE4dTJTeCtiZ2hsWW51VDBueXRRQWQxb1ZSUDRJT2ZzL0k3?=
 =?utf-8?B?WWtJbGk2YVRIKzdzb1ZTYjN0ckVRUjJhbXEzU1cyejJXd3Z6eGowcDFsWWN6?=
 =?utf-8?B?dXJLY3R5ZVJlZlhlT1VNcUdDNUhhVllOdmNxVjIxa3h3ZWFuR2hqeE0xOU45?=
 =?utf-8?Q?oibLh3/uujC9bL5xhs1iy0/6JBpOvkZGzNP3CMgZC7bV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDF1B0DE98778349BAC9413C15050645@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2c8e58-6318-4923-0513-08de02726645
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 11:45:49.8282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yUxKthBuIQsWhYzIsKRyWEdEIy797aunEwiuWz86xgHuXH+wuyMc0bRJvoLP79Y9ZD99LbD/7NuKHsjd7xgloE7hBkQgn1bjiqBhEjG3JAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5029
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

T24gRnJpLCAyMDI1LTEwLTAzIGF0IDExOjA1ICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBTdWJ0ZXN0IGZhaWxlZCB3aXRoIGVycm9yIGRvdWJsZSBmcmVlIGRldGVjdGVkLiBm
cmVlKCkgd2FzIGNhbGxlZA0KPiBpbiBlbmQgb2YgbG9vcCB3aGljaCB3YXMgY2F1c2luZyBtZW1v
cnkgbGVhay4gQXMgYSBmaXggZnJlZSgpIGhhcw0KPiBiZWVuDQo+IGNhbGxlZCBhZnRlciBlYWNo
IGNvbmRpdGlvbiB0byBhdm9pZCBwb2ludGVyIG92ZXJ3cml0dGVuIGFuZCBjYW4gbGVhZA0KPiB0
byBtZW1vcnkgbGVhayBkdXJpbmcgZmlyc3QgY2FsbC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5p
c2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KUmV2aWV3ZWQtYnk6IFRob21h
cyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCg0KPiAtLS0N
Cj4gwqB0ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYyB8IDQgKysrLQ0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0KPiBiL3Rl
c3RzL2ludGVsL3hlX2V4ZWNfc3lzdGVtX2FsbG9jYXRvci5jDQo+IGluZGV4IDlhYjhiNDNkZS4u
YjE3ZWNlOWQ3IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxv
Y2F0b3IuYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3N5c3RlbV9hbGxvY2F0b3IuYw0K
PiBAQCAtMTMwNCw2ICsxMzA0LDcgQEAgbWFkdmlzZV9wcmVmZXRjaF9vcChpbnQgZmQsIHVpbnQz
Ml90IHZtLA0KPiB1aW50NjRfdCBhZGRyLCBzaXplX3QgYm9fc2l6ZSwNCj4gwqAJCQlyZXR1cm47
DQo+IMKgCQl9DQo+IMKgDQo+ICsJCWZyZWUobWVtX2F0dHJzKTsNCj4gwqAJfSBlbHNlIGlmIChm
bGFncyAmIFBSRUZFVENIX1NBTUVfQVRUUikgew0KPiDCoAkJeGVfdm1fbWFkdmlzZV9hdG9taWNf
YXR0cihmZCwgdm0sDQo+IHRvX3VzZXJfcG9pbnRlcihkYXRhKSwgYm9fc2l6ZSwNCj4gwqAJCQkJ
CcKgIERSTV9YRV9BVE9NSUNfR0xPQkFMKTsNCj4gQEAgLTEzMTksNiArMTMyMCw3IEBAIG1hZHZp
c2VfcHJlZmV0Y2hfb3AoaW50IGZkLCB1aW50MzJfdCB2bSwNCj4gdWludDY0X3QgYWRkciwgc2l6
ZV90IGJvX3NpemUsDQo+IMKgDQo+IMKgCQl4ZV92bV9tYWR2aXNlX2F0b21pY19hdHRyKGZkLCB2
bSwNCj4gdG9fdXNlcl9wb2ludGVyKGRhdGEpLCBib19zaXplIC8gMiwNCj4gwqAJCQkJCcKgIERS
TV9YRV9BVE9NSUNfR0xPQkFMKTsNCj4gKwkJZnJlZShtZW1fYXR0cnMpOw0KPiDCoAl9IGVsc2Ug
aWYgKGZsYWdzICYgUFJFRkVUQ0hfQ0hBTkdFX0FUVFIpIHsNCj4gwqAJCXhlX3ZtX21hZHZpc2Vf
YXRvbWljX2F0dHIoZmQsIHZtLA0KPiB0b191c2VyX3BvaW50ZXIoZGF0YSksIGJvX3NpemUsDQo+
IMKgCQkJCQnCoCBEUk1fWEVfQVRPTUlDX0dMT0JBTCk7DQo+IEBAIC0xMzM0LDggKzEzMzYsOCBA
QCBtYWR2aXNlX3ByZWZldGNoX29wKGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHVpbnQ2NF90IGFk
ZHIsIHNpemVfdCBib19zaXplLA0KPiDCoAkJeGVfdm1fbWFkdmlzZV9hdG9taWNfYXR0cihmZCwg
dm0sDQo+IHRvX3VzZXJfcG9pbnRlcihkYXRhKSwgYm9fc2l6ZSwNCj4gwqAJCQkJCcKgIERSTV9Y
RV9BVE9NSUNfREVWSUNFKTsNCj4gwqAJCX0NCj4gKwkJZnJlZShtZW1fYXR0cnMpOw0KPiDCoAl9
DQo+IC0JZnJlZShtZW1fYXR0cnMpOw0KPiDCoH0NCj4gwqANCj4gwqBzdGF0aWMgdm9pZA0KDQo=
