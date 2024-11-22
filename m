Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35821E65D2E
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:50:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E2D10EADD;
	Fri, 22 Nov 2024 07:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tm7SL7Cx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 510DE10EADD
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 07:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732261849; x=1763797849;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+ij+OiXGUCnJfpmuS/6g75vgBmZOymSYxC57Ur/601c=;
 b=Tm7SL7CxJdlkyR+Gx153ZsF4EwfA+C8SpoL3E8Ga/k0aNjMC1VdveZYh
 0mr34k8Hg/2fhaK0AdTnA2FK7jZ5jkcHyMEIqcA9RzQy/0gEFSXN564A/
 I1co3K/ESO5V/VK2Et1xjC63wDPDu/D03+qQ7Xx0BhlY1UUmUQ+Q7PE6R
 DiEQPXgL3+ZKRZyrLyEP2hYMclQoDXbaIwigj+HVC7Y6uvhLtnXnPbXjk
 UHqqRfyDD+awI+4wZqagoLxETr12NWorh5TOohPW+EB/Y97NtP4mhhJBS
 a3vozJ64TzEDlF5vv4JCSLggTXegLOpIWXylKe3pESKoXzk0nxZADabIz Q==;
X-CSE-ConnectionGUID: qqhkbBoQRNCZ2Ae5QbtZZw==
X-CSE-MsgGUID: qeHdKq7YTwOHbuKBpCz53A==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="54915036"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="54915036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:50:49 -0800
X-CSE-ConnectionGUID: Q/+s4xunRWeZO50uP1SgGg==
X-CSE-MsgGUID: 2nz/whOiQ1ibuaL0DTs94A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="128021646"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 23:50:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 23:50:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 23:50:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 23:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNTFVio+GgwcqVH7aQc1BILFSD/oYT4cLfwFYqVNbo/klI2pR/rUpDfWUJcxHp+bktlX8x0nFI0OJSC02A8v13zUpRRmjjGTOAuVVNEaIozGn1/oHLrllVWyHF+L2enSdB3Ez3lF7e9ujyl3ZoucTHG3HvuGnuxzTEMfbYhO6jFIV6vrVzfe15HBnwXyrUwK/eIDvMOyEIg/GVgks6CSna1MYP3UinyChHYoOojRZK0O38jsf5kHxxAAUMkwLMNtySeXfx+6PhC7taXiEYFBVLAHT2mxBY41IzZCKVqCsDRgv6xwil4B3hYHaXUGcN/M+kDXNV3PipuAiIMBw4EISg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ij+OiXGUCnJfpmuS/6g75vgBmZOymSYxC57Ur/601c=;
 b=gIQOskSblKXggEH1SR/GFguBf2jURWIuHvdPxrFkSPOyaV97KjZEnns075AZMRIvXJ5KeB/PbEOekuEKaUHgeHZPwuBfxY0C8VkWoHflGgXOGCk+8cz+iXssdFf6qjtNo4KDoDzoBpIFRxcOeCdWs0u4MY6ZCqE4L659cdWqr+ihuqtgsM8NrBg/0nz0817CiEOqynE0M7f1Zgr+MHrd7EEhF8x9MAo/LNAlUTSpt24WKSuR68T/0tmOS5if7quk/xvFql+t+SykxkzgfgIAsDM1WC327zEL+6icgiV7UMehVM1VgTGk0aRaX/n9OHQpLWzJ/AhYlVMh7Rr8JA/6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Fri, 22 Nov
 2024 07:50:44 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%5]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 07:50:44 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v6 6/6] tests/gem_gpgpu_fill: Add offset-16x16
 subtest
Thread-Topic: [PATCH i-g-t v6 6/6] tests/gem_gpgpu_fill: Add offset-16x16
 subtest
Thread-Index: AQHbPLBO+Un2Hle1rkeOqJMI4qDmP7LC7RaA
Date: Fri, 22 Nov 2024 07:50:44 +0000
Message-ID: <ad9ecd6ba2142baee3d2cacf5ad4b9d57a68a6f0.camel@intel.com>
References: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
 <20241122072904.164247-7-zbigniew.kempczynski@intel.com>
In-Reply-To: <20241122072904.164247-7-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|SA1PR11MB8374:EE_
x-ms-office365-filtering-correlation-id: a4606122-e07e-4856-d489-08dd0aca5e74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXgyQlh4YkdHc2tEcis0Mk1SWHVjb0pvY2wwa0JRUXhpVXNGZm5vL2h4S0hN?=
 =?utf-8?B?SjExQytPSXl0d3hVWG5OOHp4eWtmbVRpNndiWmoydk4zSHBxeEJtTTJPT0tG?=
 =?utf-8?B?RGdaQnZ1bWZaNlZZODdCc0ZkZUxYa0Y5cmJyWW1SU1hRSXpHalREcnUwMzdv?=
 =?utf-8?B?cmxQeDJHV280ZzBQbzlaM0hPSWVHQUY2L2wyZHNxTkxCTENTRDBzZFMxTmxK?=
 =?utf-8?B?a0dSRlNNa3haSjRpbGUzbmt5Ui9Ma09PajhkR2xPM3JvTHNvZXVLUVVQOTVU?=
 =?utf-8?B?WFd1aDF4cjl2L0tyZXk0Q1BSUFk2RDNXc3E4cVMwbkdNV04wSDdLR2tGQTZz?=
 =?utf-8?B?cHFPOGpNZGU2amxSYUxjcUVlUElaQTBDVitCZ1JFTGZ6bDlLOGZRT1Yrb0w5?=
 =?utf-8?B?NW1IUThUY0FDemZZVldSb0ZoNllZeXR6L3pTUGJNOVFlRnFLVEltazBVa2pH?=
 =?utf-8?B?Z0NMTTk0d3o2RzdFWTk1RUE5UnhaU0FOUnh0UDBrOWJ4bTRnc1g0THRkU29Q?=
 =?utf-8?B?MUI4R05YWjVlaWQ1U3kwR1VNSkxIQk83MjBURXk4SElremdnTkwzdm96dnQy?=
 =?utf-8?B?OXJhaDQ0THozQUUyM24yZ2ZNVlorMFRrZi9Oa1U1bmZiQzNZbkVsNGdMck5W?=
 =?utf-8?B?REY1SFFOR2VlU2VIWE1iNzhOb2IzTllEWXJsTEJWYnBjVTYzU0ZaUEQ5MDAz?=
 =?utf-8?B?K0RoelRYZWRHeGJCMGU4TkhORXFveHVkdmFHQXluZ1NRSTJaOUYzR3l6U1Rk?=
 =?utf-8?B?QmVhV3lvZ2N5TXY4akc5eUh1SnFKWVJ5djJjNitXeUpNcEJPbEk5aVRLUmJj?=
 =?utf-8?B?Y24xcTZCQWNPenAvOWgvaEQzMjJZclVqdG8yaE5wSTRXM3AwaVVhYXNna0NG?=
 =?utf-8?B?aFBtMUhpbUNLZTQzOFAzUzlGQ0NkOE9scjJJVjVYU1BHQ0kwRGw5S3VRV0lu?=
 =?utf-8?B?NGFWcUFjZGNXd2EwUFpDSW56VGEvQU5oQ25kWVBkTUZ0Sktodmt4S0lUeXpU?=
 =?utf-8?B?bzAzSWsyd0dUN21oSWVUVzVvN0JDY21DTzlEbEpLZzdLVUtyL0Y1UXdYb2RR?=
 =?utf-8?B?eE13WWl0eFFNNnpZdE1Qb3JuWThYT0xwcjRjUkRsVUgreTUyL25MZjZ4SnI2?=
 =?utf-8?B?Mk8wMjdFZkZYRFBncEtBNHA5bW0vTGlVRk4rK3BxTm1qSUJIbFA3R1Yvbyth?=
 =?utf-8?B?RnRsbjFEVVlVaXpUcnlWL3RGMktpellQNHhPdkVnNDBXZ3NiR1d0QVZWNGNI?=
 =?utf-8?B?UUdQQ01CVDkrOWllcXBwT0FKOGpGV1Z1clpYYkNwcWNUaDhqWDd1aFdCSWFl?=
 =?utf-8?B?Uk5CM3J4MDhxcUFJemltMEdWYkdjS0pZTy9XemxqR0xhbFNhRDVON1B5Wlgw?=
 =?utf-8?B?UnVaL0xMcU5QRGtFSHZyYUY1enRpSElpNUdXMjV0YU5tZEZKOEpqdHZRR24r?=
 =?utf-8?B?MVJDejI5Vi9jV0lvaXhCUkRvMWU2ZmY2S3NzSU82OFZVTzRIYVVSZ3YyUUxw?=
 =?utf-8?B?S29RalFEb1plR2VhL2ZMQVY3M2wrOVlnZ1hYYkF1L3FYVDhyVkJUc01Ib1dW?=
 =?utf-8?B?MlpLYnc2YjM1ME80cjQ2UEVNTTArbDU5NEJ4NjBNdUxoK0FOcDdHTnlML2RL?=
 =?utf-8?B?SEhUVjc1QnkyVmNlQURUZFo5ZzV6MWpTOUVleFBiRUpjU2NDU2wycXlHUkg3?=
 =?utf-8?B?aTNDTzE1SnVQY04rZVlLc2R1dkp4THcrdC9XWXVBbkhSalJaV2hBblo2Vk4w?=
 =?utf-8?B?Zmh2N3BWd0NBN05acjNYM1o0TnZRVjU0MHRvT29FT2pQMCtGc2xzRkpSRUdO?=
 =?utf-8?B?bDl6cWZBY1JKUkgrc0VxVE93ZTlJZkJGcXNISTF3bEZiVGNLcDlHemcyK1hV?=
 =?utf-8?B?UTNqdDZVZVhmSTJXMitUS3o0YzJQQW16WTNBRU01cXVyOHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWhWZm56Nk40dWg2by8xc1VXRjFtL1ByRFdSV01QWFZjSDFyaXJScVNkRStu?=
 =?utf-8?B?U3JkOTlXYk1BVTZFK2N4TVJKWlBhOWRmRndwdlNqMHJZNWFtazlxbXdBSTI1?=
 =?utf-8?B?UkdJMk95czZKcEZ3bmx6cGo2YXBvejNYUDYxWEdkWHc3MnYySDh0NzNYK2xW?=
 =?utf-8?B?M0JiQjBrUXJmaVZKRm5QS2lYVUMrYm9PYWNIQVluU3dIclA3NkFHTlJjekNL?=
 =?utf-8?B?Zm01Q3ArTDdTSlByT1p5WGcyRXJ3c0xLUHFmb3Z2Y2FSMVE4K1RZR2poYmw5?=
 =?utf-8?B?T1FkY3c2YmhVTUJPMjBLRDRibU43QmhEa002ZERnNXlzZmxJZVJBamkxRVJR?=
 =?utf-8?B?T0FNM25wOFJWbmR3cFYzdk14YjBVeFNPSi96R3JPMW9Sa0d0YnlDSWwwSTE1?=
 =?utf-8?B?RzV6dFllNUlCYko0dEVmTi9xWTFpcjI4dGo0bThJUDJuQ1pRaWs4STJBZ2lM?=
 =?utf-8?B?ZXd6bXBTUkFNZFN4bzdpcEw2UDd1NDd2VURveThLSmNQeUZLcVNqT0dUempl?=
 =?utf-8?B?Vzhpd25zTmh2azQ0dzJLVzZWb1o1dkFDUzJBUnJEM2pIQmFTcUtMSDdub0xE?=
 =?utf-8?B?RmxYUkJuTUZMT1J5QjJ2MHpYT09CcHg4eHBTYlNFdUNNM3F3WmVRcWNPOU53?=
 =?utf-8?B?YlNRd3BRQ1BRVUZjWHdTWEtpMkV3NjJNSEV1dS95ZkR2SGRxeGJ2VDRjdHVX?=
 =?utf-8?B?MTA4SngxSE9vNkZROUN5STl4N2VQQmRKcW9nYjk0Y1JvejhTbzZBbUxkamlY?=
 =?utf-8?B?QS9MNUQzOVJudk5SaTdMNGdUNVBtL3NuWmxWQzBSK2VMTjMzb29RbmtRT0VV?=
 =?utf-8?B?ZVhGTDB6bmxyYW5KWEYzbGdtTlo3TGFqaEJ6cTNTcjd1NTlTNm5nZGk5WGYz?=
 =?utf-8?B?Z1FnYWRjeFBuQXRhYUhiaFN0elRPZDliNmRmeVA5Yk1QOGhxY01ad1RLY05K?=
 =?utf-8?B?RzI2emgrQ09Lemc4TmlrVktlc1FZU2VndVZ6M1BoQVBLVjUvelQ0ckZuOUtL?=
 =?utf-8?B?dmJ3NG5OeWs1K2M3VjBVZ0RsQzlCSWsveW9HTzFqeHVCallIT3BVaWU3Zlpl?=
 =?utf-8?B?bUNDbGNEc0diL1FQbDFRTy9TQnhLTVcvbk9BSnZiMlZjenR6TzhWOUlCbGVu?=
 =?utf-8?B?c2ZYS2NNcSsrQkNXelBEcmFKS0MxRDc5S2k5a3YzZ1BLVDd1bkdHamVnaUJ2?=
 =?utf-8?B?L2gwaTk3SVJBanVWOFIwaVB3RnhrNUFyREZzS1BDUVhYY0pLM3VBdlh4U09G?=
 =?utf-8?B?MmVoMTh5d0Z6VkNucEhqMG1Jd2hEUHJLbllCd0p5ZkNTNHBiNU9PazZtbTFY?=
 =?utf-8?B?d0VNZWNqT2dDTTRxS2gzYmo1OXQxV1ltQkM2c3htOHBqQ3M0ZmVoUThJc1A4?=
 =?utf-8?B?K3ErUXk1MHRadWZRS0tOK2E2ejAvRnplRllqUi90SlNabDUydzRxb3BiUks3?=
 =?utf-8?B?cngraEtWNFdHR2dNaEE3M0xubFdiL2Ezb1pXbXpOR3hBK2Yxby90UEFJMEpL?=
 =?utf-8?B?cUc3Zm5aWTlDdzFEZWlRajQ0RHA0bW5TR1lIMzNneDdqSUVKV0tDbDN2Nmdi?=
 =?utf-8?B?d2FDR0NGdy9HWWNhSjhWNmxvd2xTUkl2UVlXMHNuS0U5dzJXa0t5ZGYvaVJV?=
 =?utf-8?B?MkFqQ29qRGtMazROQWJNUGR6bURBdEdSRlNWNEZiSnBzaVAwd25BdkY0eVMw?=
 =?utf-8?B?SXRTeHZRT082cWRMVzJncGQrODFXN2ZGTkdvVytUVUVBc1VudWFvN3RBTFg5?=
 =?utf-8?B?aDhZeDMzaVR5LzVjVDJxVnNSRXgxaHlDL1Jkb2gyUFQ5WUZGd0tHOVNGMThM?=
 =?utf-8?B?b2NSSTNsMUdWNHFjQy9TVXhiVit4QTZ1VGNTWGVpRHJXZ1lsbXd6M0o3SzlS?=
 =?utf-8?B?b0RYTGt4dUhuN0xKSVhBODlqMjRMeWZMUnp1dXVLazU4bGdJeWhVczhudEV2?=
 =?utf-8?B?bFlxS0o4aXVnN1pvSlRCUG9nZlF2bUljZStCZWlvc01PWndGZDQ5TzR3QzRL?=
 =?utf-8?B?bEZ6VUIzZjNYY05lU0s4OEd1czV1Vjd1WnJpZGl1VGloYlNRcFhRZFVRMk4v?=
 =?utf-8?B?NXpyQnU1TnU5TjEvS2xOUkhxdnZ3OUdlWVdlcTRLVjUwd1JRZmNoMWFsZjN3?=
 =?utf-8?B?d2oyTEtuVmVhWkhkdWxqNmJjKy9iUTdqYnJtZXphOUltQ0FIbzJsSTBWREJz?=
 =?utf-8?Q?NVVVqflFwdjthDsmlNhOE7g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B531DC0A3EB2244993E808C9D7BD9B2F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4606122-e07e-4856-d489-08dd0aca5e74
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 07:50:44.0492 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lMBxiRIwJ6veb/0YXptTfAa1AIeK6duiepBQ0rPBLnU9DZl9W55NlFjyiX/izfxA3xSq0dvmd37HVeVCdWmKPvwgrzC3lBsfHKvGPKCfUsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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

T24gRnJpLCAyMDI0LTExLTIyIGF0IDA4OjI5ICswMTAwLCBaYmlnbmlldyBLZW1wY3p5xYRza2kg
d3JvdGU6DQo+IEFkZCBzdWJ0ZXN0IHdoaWNoIHZlcmlmaWVzIHJlY3RhbmdsZSBmaWxsZWQgYnkg
cGF0dGVybiBzdGFydHMgYXQNCj4gb2Zmc2V0IDx4LHk+ID09IDwxNiwxNj4uDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGlu
dGVsLmNvbT4NCj4gQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGlu
dGVsLmNvbT4NClJldml3ZXdkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdv
cnpla0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwvZ2VtX2dwZ3B1X2ZpbGwuYyB8
IDEyICsrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykNCj4g
DQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmlsbC5jIGIvdGVzdHMvaW50
ZWwvZ2VtX2dwZ3B1X2ZpbGwuYw0KPiBpbmRleCBlYzM0ZTk1ODQ0Li45NjFlMDc1ZDA4IDEwMDY0
NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9nZW1fZ3BncHVfZmlsbC5jDQo+ICsrKyBiL3Rlc3RzL2lu
dGVsL2dlbV9ncGdwdV9maWxsLmMNCj4gQEAgLTU4LDYgKzU4LDEwIEBADQo+ICAgKiBGZWF0dXJl
OiBjb21wdXRlDQo+ICAgKg0KPiAgICogU1VCVEVTVDogYmFzaWMNCj4gKyAqIERlc2NyaXB0aW9u
OiBydW4gZ3BncHUgZmlsbA0KPiArICoNCj4gKyAqIFNVQlRFU1Q6IG9mZnNldC0xNngxNg0KPiAr
ICogRGVzY3JpcHRpb246IHJ1biBncGdwdSBmaWxsIHdpdGggPHgseT4gc3RhcnQgcG9zaXRpb24g
PT0gPDE2LDE2Pg0KPiAgICovDQo+ICANCj4gICNkZWZpbmUgV0lEVEggNjQNCj4gQEAgLTIzOSw2
ICsyNDMsMTQgQEAgaWd0X21haW5fYXJncygiZFc6SDpYOlk6IiwgTlVMTCwgaGVscF9zdHIsIG9w
dF9oYW5kbGVyLCBOVUxMKQ0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+ICsJaWd0X3N1YnRlc3QoIm9m
ZnNldC0xNngxNiIpIHsNCj4gKwkJZ3BncHVfZmlsbCgmZGF0YSwgZmlsbF9mbiwgMCwNCj4gKwkJ
CSAgIHN1cmZ3aWR0aCwgc3VyZmhlaWdodCwNCj4gKwkJCSAgIDE2LCAxNiwNCj4gKwkJCSAgIHN1
cmZ3aWR0aCAvIDIsDQo+ICsJCQkgICBzdXJmaGVpZ2h0IC8gMik7DQo+ICsJfQ0KPiArDQo+ICAJ
aWd0X2ZpeHR1cmUgew0KPiAgCQlpZ3RfY29sbGVjdGlvbl9kZXN0cm95KHJlZ2lvbl9zZXQpOw0K
PiAgCQlmcmVlKHJlZ2lvbl9pbmZvKTsNCg0K
