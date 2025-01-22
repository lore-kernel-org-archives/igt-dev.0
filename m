Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C636AC02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 10:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83EE610E6AD;
	Wed, 22 Jan 2025 10:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jKoz2MRo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1213410E6AD
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 10:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737542008; x=1769078008;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PPR0/f4Nm3EOzRIsxHamZuYFxPate1j6KZ4LUWGavic=;
 b=jKoz2MRogEkb59tThhcjd3FkDVeil5aZwh6RLbH1Xe0Bhffj1Jfb53ws
 CZnriUhJ1+r/n3DTdIiSVC0HfhmSZlbbMAvxFjPAQoRq/kH8+FUZ15yau
 uRaAEnSzjiLf6bXMqsgb8tS7jwFR0Ggk9lvfDciq8p8fcQWFlScTMt4BI
 KIA8vCWbN4fVbFN6End4byB8OSJuY0KIk6b8mm6CvY02EzlqEx2YKcQI3
 slgCGhT1k7wtTRznrgR40VAocKZ5DkWubD5Q9mlo9E1eUJG6dJTlY8BEL
 u7W0Jhzs5J8T8VJzqV5JBCe0PfHkg8vICjr7QrJrJAgbwORwAo33Fr3tC w==;
X-CSE-ConnectionGUID: JDgMHSWrSYm3TQz29/bNXg==
X-CSE-MsgGUID: bRbeOXVuR+e6eotOuWu8cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37870918"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="37870918"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 02:33:25 -0800
X-CSE-ConnectionGUID: OutFv+dPTc+kHiziulR+Mg==
X-CSE-MsgGUID: y2Tg4QHrS3+++PPzYgzDFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="137975903"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 02:33:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 02:33:24 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 02:33:24 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 02:33:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8SHM+LmTMKvzPNxMLzE9BblDdkbI4bjC1A8zsT1Y82afi+vEQhMJ1OcUKRBXrDRbvccuIep1OTQmMB5tQbZzo02oEYjyHWf/cSX5BHF1WbAiFkQVcomng4Lrf8DaKpVzfBf0ivZrSPCrDKBy76cWo7LSFTc8VASip2hIL3SyFXbPKQrZetWpFABwkoMiJFDWIRVfydcwM/nLfrIFaLHATYHYXqU9PO9RTBxr4iCwHO/ENYmKDjxj75pGWKGoF2GmqTqV0NG7nczuX4zucN8mFh2fHzAnpFg4GhRGqfQThOc4b+ib8oc0TK3fxbUvlJix0qM4UHT+pQVBxCONf9WHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPR0/f4Nm3EOzRIsxHamZuYFxPate1j6KZ4LUWGavic=;
 b=BzSGfZC3bbt8TreTi78qD+aC+tlApWfI7HM//rjrg8s7MxorTwSdSJ1CXFJVAZZtMPkE1jnv13tfprf8UbMJR+1FxD5hiQhT2D35tL7JCDU7S5N92E2DjKNa7zX8QkrpSWa/NgChzLb1HGwrKk2C38ZhHbVsHudyrZkac6F3U6CFj6i+NSRh3BlislZWihQwgO8NEKCCA9NwSQAcyEIkHv1WQvPN6cOKycTnVGzWY2wF4bSd6dOS7HGO/hBrDHMiq2MyBHmKO9D79IhK4rh+pTNWkSqDpM6r3NAy5tEJI8d17qPnYetI8aBBSKSvikhD3ztYEJAcraGLdaXY4KrJdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Wed, 22 Jan
 2025 10:33:22 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8377.009; Wed, 22 Jan 2025
 10:33:21 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: Jordan Justen <jljusten@debian.org>, =?utf-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: RE: [PATCH i-g-t] tools: rename power into igt_power
Thread-Topic: [PATCH i-g-t] tools: rename power into igt_power
Thread-Index: AQHbbBwewQ0wKDHsdUCdWPs6Qy2BYbMimcUQ
Date: Wed, 22 Jan 2025 10:33:21 +0000
Message-ID: <CH3PR11MB843465B2479EB9A94F249DF38DE12@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250121154919.181947-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250121154919.181947-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA1PR11MB7087:EE_
x-ms-office365-filtering-correlation-id: 43516b76-c974-4def-23f7-08dd3ad031a4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|10070799003|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?eVJPU25kU0hEdTJTWVpuVzQwOHVuSVI4bHpDNTBIaW5FRXJxYVF6V1NQbUt0?=
 =?utf-8?B?UUxDcGFQL3RrZGRiTms4Vis5L0dmNVhkOXV2ajQrU3VVTUZSSTk2Qk01Umtz?=
 =?utf-8?B?Z2cydjJUZzR2eUI1YVRKNjlSV2VSRUx2YTc1U1FPTnV3QnlFZnllb3NNc0tF?=
 =?utf-8?B?aTNjbVk3UlNZenRyQWE0bUtFV3hUd3pTTENINzdnYkpOT28yNzRxWms0VjU2?=
 =?utf-8?B?MWRlMCtidlBqakg5RmRaKzlNNEJsWWMwbTlKQzBMVllCVHBtWStxZXc3eUIy?=
 =?utf-8?B?clNHVEptbUV2WVlkcTZOSmV3elZsVVNmSEU1bW5BK2haWm85aXZ1cGg4cHln?=
 =?utf-8?B?N1JacnpzazNWcEVFSUVxS0FrbWpIMkVDTlRHbzZoVmo3dXk1d1BxQmNwQjlQ?=
 =?utf-8?B?ZzJNMjVkdkVSTEpHN2g2eE44R21tUklGaWJBK1pYNXorZUYvdEdVY3pyQW5z?=
 =?utf-8?B?VUdYQ0FadWNEYlQ2aERjbWVtRXpFaEwxelR0V0NCS1d4M2hDVnROWS9tM1FI?=
 =?utf-8?B?ZVVQQjlmUTdiMUR1MlVIczUyQ09hUVRvaTFzZktlbDFOTlJCYlhzU2EvVjgx?=
 =?utf-8?B?K0h1WmlPV3lhY1BUUTJVTWVWUzRaNzg4bmErTjRHc0xQbWI3U1BtY1NBY25m?=
 =?utf-8?B?Tmdjb3V0VkNqdFBxNVZHeEJTci9hTVZzSWJta0FDVSt0aXhrY1gwUFhqOTd5?=
 =?utf-8?B?WjNVSmdEb205d3d6bE1sK1ZqRitEWmFpTGI1QkVvd2FnSTNQTkE4WjJ5M1Aw?=
 =?utf-8?B?K2VkU2hSS1lqOXYvTzZuM3BBWlB0NVM0bWlnYVk5YW9DUDBYNHlHT2JJUm5z?=
 =?utf-8?B?ZDEyU28yeWszWmN3TE9kUGhZeDMrbk9rWjFKUmpaVzM0bnBWSVNObEd4bVpT?=
 =?utf-8?B?MThwUmllKy94d0ZxaFVaa2VHVC9Uc0xRTGlkb2g3cXZqeCtBZ1k2N3ZDVlIx?=
 =?utf-8?B?cm1jR09BOTVMakszRXZmOFNhSG9RN3JSS0RyODhaTnlQYzZxcFpHdm82TkNF?=
 =?utf-8?B?bzJmY1JCczhWMm5QUWcwb0NpTmRLODhoVTNiYXJlOUF0cytZd2tod3dTOHhX?=
 =?utf-8?B?WmFZVFNtVGRKS016czFVZGJuZ21paFBpcnRXL094L0tUS2tYOVJYU0RPYnNn?=
 =?utf-8?B?dWgxQm16YXNaUVlDSVV0ZDdjTHVWa1MwTEZnckV5QTdyczIxUXdObk01V29N?=
 =?utf-8?B?ak80bFVjTEZxKzRMUElDeFpLM2NPS2RMZUVLSDM1MUVGOGhXZ1NKeTBRM0ZF?=
 =?utf-8?B?Q3kveWxzZ05XZXp5M0NxdTB4ZG5IL0liWlVaRVlMeFdCaTRJWE0rUXlieisz?=
 =?utf-8?B?WXhDL28yNTBCaEtqcWVZZUpJdEZOaVdwRnNCakczeThSUU9UUld3ZmlZQ3hT?=
 =?utf-8?B?c0M3V09KS1FVK3lCaFFRNkQ1VDRPU0RKM2RDNFhic1RkTkdXejVDdUlFcWVl?=
 =?utf-8?B?UEkvWFVOZkdTWWxLaGc5bzIwSEpkY1QwVmhkZHI5NUpESWhwNkt2blE2VDhu?=
 =?utf-8?B?MlFMTW5IaUxnV0t5bVBUNkFsNG1mMmg3WEExdE5LcHhad1haRVMxU2thSStW?=
 =?utf-8?B?ckZZeXpYeHVqL2NPVVRNamZUNlNpUU44M3o4czFCczdibmd4L3NVZkh2bm05?=
 =?utf-8?B?K01GSlAwK0hLYUJuOWdLU2dUbUpYN3NpMVBWMkZjOWhDVm1IWE5Ua2kwUXUv?=
 =?utf-8?B?QlhkcENnQzFlZkwrbm1mcjdoaUFmN0xjVUJ1Wk5KRUxTNTlNTE5HZ2E2MnRW?=
 =?utf-8?B?ZFJWUkhLRmxDaW43MEx0NHNjVnBmcU5IY2hjS0NGb1ZsbVhOTEFMVnZWcThF?=
 =?utf-8?B?RmFDdGdJeXkxZE1VU0EvQVJqdVgwcWRnb29UNXFXd2NZN2xqeU1DQXFlSUtP?=
 =?utf-8?Q?P5ULj/VimBcqb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M1VRQXlsL0VJcStyQWVVeDFnN3AyYkpVdGp4VWZnYXdPajd0TXFhKzNUUHRB?=
 =?utf-8?B?dEhLbUlkRStvV01Rb2lwd3ZwUFVuQzR3STBqUXlERHh4L1lpOFRjT3k5YkZw?=
 =?utf-8?B?bTBZY05KeFQrV0t1TWpkTURQRnA5aVBuVmM1VWVXWE1sZ2hvZS9ZMlNtRDVV?=
 =?utf-8?B?T0Z4dnlYQlcrSStxa2Y5RkQ2Kzcwam11WWRNUFlTUitCZVdtcGlKeUgzaUVm?=
 =?utf-8?B?ZENsTk1EZGlxdFRUWGxJTHRJZXUxQXNmM0VlRlAyYWM2Um4wOWJFc3BoTFAw?=
 =?utf-8?B?anJpRWdlVGdXRGRTQ3dWNzEvZFdIVWVhcjNhcDFKVkFyTGdYL3VsR3pGU3k3?=
 =?utf-8?B?NWNTN3FlL0FVdlZqRmFOTE95a0lreUhZMEdsRDl2NU1LZnJGN1BsZE03TTl6?=
 =?utf-8?B?dzhmNVZBVlNxakZHLzFSYlltR2doTjZlVFh2eDYzMG5tVEhXOXJsZlNYSjFj?=
 =?utf-8?B?TFl1REoxMkZQWkh3K1JNaG5YYWlkWUdFU1IwZHRiaGJLK3VFcmllSXp2eWJa?=
 =?utf-8?B?RGs5M3dOWHNCeEhqUzBxUGs2Z29IRGV5NXJZZ2xnaXhnL0g2UjVtaGEwMkpO?=
 =?utf-8?B?L0ZQUHFSbUNsTDdyYzRhWi9GUVdIY1hnRjFBeFcxU1lKZGxWaG5nWVVCVzZN?=
 =?utf-8?B?SXpRVERYdTE1dHNyUUl1UEM3UFMwaEk3OTFoWUVLSmpZaGhqZnV0UjRITWsw?=
 =?utf-8?B?bWVEaDRRQjVxRVA1akxjcm5HQ2VTQnFlZ2M4V2FrYVVRYjVxSktLbEJQZ2lx?=
 =?utf-8?B?OUFpbFVpTS95QVExRGJBNzJlZVdBVGtsbndzRnBqQjBBQitQQkVNNXVUV2RP?=
 =?utf-8?B?UzRoWWlPUk5HT1BnUDl0cUFyL3RDL0ZPYms1OHljVkZydy9zRDZCWkI4VXR4?=
 =?utf-8?B?SEJadGN3dUpXVW45dndUbXZLaThwMGdEbXV5ZVBjVXBvQ1dMREJOTHI4aEQx?=
 =?utf-8?B?QzduSk8wY2tic3hyYzdMR1BtMnFSL04zbEg2YnJ1cFg0YnNXdXJLTmhuYTZu?=
 =?utf-8?B?a1BDZGw4NVAyRnV5LzVUV05XN0lKZENEd0VSL3pmU3FlNTI5MkR3UVRPc0JO?=
 =?utf-8?B?MlE5SnViWm5rRVFkcnBqYUl3czZHR0hRd0k2eDRYSU9ZWG9UaURiRnRMUEsy?=
 =?utf-8?B?SERyRUVHU1ZYaW02RlBVdVVlZGV3TWkrbEFSQzMrZWdjNFdDQ05YRmVRNDNy?=
 =?utf-8?B?SnFPZlZ1VVNzY3lFbkgwNmRIU0IweGxiaDhNd0xpb0s1VjcxUTRHZUVCL3l0?=
 =?utf-8?B?Zkx5emxrWlk4dFVMMFk3WFlpTmRqbFl5ZTVqL09FZm5neHgrdlFYSFoySzI4?=
 =?utf-8?B?OE1uK2FEaC9FcDJta01YRmJMQWRMbERIZzBKME0yV2cvblZQaWdGNGNTdUpX?=
 =?utf-8?B?U0RMeG9May9uQW9jQXVZZXoycU1FTDhxSjZFKzB5WENZS3RxUVFEWnlrNGhs?=
 =?utf-8?B?WFlSa0VmdGlnY1R3U1lWdXJaREtUMW1CZ2NGcGcwcWtEV1Z4dTVvb2hhZmRV?=
 =?utf-8?B?c2pTcS9LUFQ1NEVnbXNmeWtoSGZsMW5YZjdrSG1WaXFqd3JrNVgwM080Vm5R?=
 =?utf-8?B?cWt0M09VRXlzYWwvWmRjVVFRSVFoV3k1NWllb0hhYzRmNzB3ZzMrcWlTM095?=
 =?utf-8?B?OUpjdHhQVWIveThBOUNybGgwbk1DbUQxd2VwbzFQV2pZcTNrZ01OaWdGK2RW?=
 =?utf-8?B?M3RYK0tMNWlNQSs4dCtYRWl4dGpHWDJ6WVlmTk1BdVdMZkZPYkxxSU54b2lp?=
 =?utf-8?B?QUVTeFlRNjhhS1plMGhIdXBuYjRPdjFFeTdNdWd2NURWVUlxb2NkamtHejZR?=
 =?utf-8?B?Ulh0NDAzWGdocTMraHJ0dVdLUzdIK2E5aEVsRElxelNqWm1mS3RiWmFGY0Nl?=
 =?utf-8?B?dEkvNDdGTHBsd3J6S3FvMmN5SmJSZERJNVNqZWp4eVBSKzlSWUZyR21IQ1Vr?=
 =?utf-8?B?TU53NmhoM3Bsa0c4cEN5SGJ0L3U1aW1TMHZwTTVPZldGWm1wQUgwc0hEcktW?=
 =?utf-8?B?bzZaUFEvazIrdnlEZ21tS1FsbE5EaEYxNGNmeDJEcjhPNm1tdmZXM2Y4dGpr?=
 =?utf-8?B?UTFVMGJrT3VnTWwwYmNNcE5pTm95dFhtZzQydlpBZXRTTUJHWTdGSEIzTUJT?=
 =?utf-8?B?YkxvK2R6ZTlhdDIzajUxd3h6Ky9oaDJLd25YNFo3NlZJeHBBdWNUYUk2alVa?=
 =?utf-8?B?d2xYMDAxZCtGZUMrSUV0clpmN0V2OW1ucEVYS012N3F2ZzRZUVU0VE5BeFRM?=
 =?utf-8?B?YkJ3WCs5N2syaXhmVFIzekFsTFlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43516b76-c974-4def-23f7-08dd3ad031a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 10:33:21.6595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CruJ3AOjvaxiGsrrg9H+psvPcYfLXBUPlbnFBNOZw0KTYF63Spopq2jxxJLaoy0dIm+BEpUSLUrw0CEliLotYmx4MuRV5jxe9A6G6VPjexI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
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

TEdUTQ0KQWNrZWQtYnk6IFByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGlu
dGVsLmNvbT4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2
IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgS2Ft
aWwNCj4gS29uaWVjem55DQo+IFNlbnQ6IDIxIEphbnVhcnkgMjAyNSAwOToxOSBQTQ0KPiBUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEthbWlsIEtvbmllY3pueSA8a2Ft
aWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT47IEpvcmRhbiBKdXN0ZW4NCj4gPGpsanVzdGVu
QGRlYmlhbi5vcmc+OyBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIHRvb2xzOiByZW5hbWUgcG93ZXIgaW50byBp
Z3RfcG93ZXINCj4gDQo+IFNvbWUgZGlzdHJvcyBpbnN0YWxscyBpZ3QgdG9vbHMgaW4gL3Vzci9i
aW4gYW5kIGFzIGxvbmcgYXMgYSBuYW1lIG9mIGEgdG9vbCBoYXMgYQ0KPiBwcmVmaXggb2YgaWd0
XyBvciBpbnRlbF8gaXQgd2lsbCBub3QgY2F1c2UgYSBwcm9ibGVtLiBIb3dldmVyIG5hbWUgbGlr
ZSAncG93ZXInDQo+IGlzIGEgbGl0dGxlIHRvbyBnZW5lcmljLCBzbyBjaGFuZ2UgaXQgaW50byBp
Z3RfcG93ZXIuDQo+IA0KPiBGaXhlczogYTg4NmUwYWQ5NzgzICgidG9vbHMvcG93ZXI6IEludHJv
ZHVjZSBhIHNtYWxsIHBvd2VyL2VuZXJneQ0KPiBtZWFzdXJlbWVudCB0b29sIikNCj4gUmVwb3J0
ZWQtYnk6IEpvcmRhbiBKdXN0ZW4gPGpsanVzdGVuQGRlYmlhbi5vcmc+DQo+IENsb3NlczogaHR0
cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLy0vaXNzdWVzLzE2
OA0KPiBDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4N
Cj4gU2lnbmVkLW9mZi1ieTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXgu
aW50ZWwuY29tPg0KPiAtLS0NCj4gIHRvb2xzL3twb3dlci5jID0+IGlndF9wb3dlci5jfSB8IDAN
Cj4gIHRvb2xzL21lc29uLmJ1aWxkICAgICAgICAgICAgICB8IDIgKy0NCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkgIHJlbmFtZSB0b29scy97cG93ZXIu
YyA9Pg0KPiBpZ3RfcG93ZXIuY30gKDEwMCUpDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdG9vbHMvcG93
ZXIuYyBiL3Rvb2xzL2lndF9wb3dlci5jIHNpbWlsYXJpdHkgaW5kZXggMTAwJSByZW5hbWUNCj4g
ZnJvbSB0b29scy9wb3dlci5jIHJlbmFtZSB0byB0b29scy9pZ3RfcG93ZXIuYyBkaWZmIC0tZ2l0
IGEvdG9vbHMvbWVzb24uYnVpbGQNCj4gYi90b29scy9tZXNvbi5idWlsZCBpbmRleCA1MTFhZWM2
OWUuLmYwOTFhZjM4MCAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbWVzb24uYnVpbGQNCj4gKysrIGIv
dG9vbHMvbWVzb24uYnVpbGQNCj4gQEAgLTEyLDYgKzEyLDcgQEAgZm9yZWFjaCBwcm9nIDogdG9v
bHNfcHJvZ3Nfbm9pc250ICBlbmRmb3JlYWNoDQo+IA0KPiAgdG9vbHNfcHJvZ3MgPSBbDQo+ICsJ
J2lndF9wb3dlcicsDQo+ICAJJ2lndF9zdGF0cycsDQo+ICAJJ2ludGVsX2F1ZGlvX2R1bXAnLA0K
PiAgCSdpbnRlbF9iYWNrbGlnaHQnLA0KPiBAQCAtNDQsNyArNDUsNiBAQCB0b29sc19wcm9ncyA9
IFsNCj4gIAknZHBjZF9yZWcnLA0KPiAgCSdsc2ZhY3RzJywNCj4gIAknbHNncHUnLA0KPiAtCSdw
b3dlcicsDQo+ICBdDQo+ICB0b29sX2RlcHMgPSBpZ3RfZGVwcw0KPiAgdG9vbF9kZXBzICs9IHps
aWINCj4gLS0NCj4gMi40OC4xDQoNCg==
