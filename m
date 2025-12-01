Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E8AD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A48310E04C;
	Mon,  1 Dec 2025 13:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DiCRwuj/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4444810E04C
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764594881; x=1796130881;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IN2cslBKfO6ePd1bU+bNHftNGGF6lDlR7SkcOR9jk4Q=;
 b=DiCRwuj/BGm0eQ7BxSGUYUY92Dia9YWrXNfhrm4utCKQNvy8mp2lyDJB
 5hXPqQ7XrHFKWLhygffyzD+lSn/tpvvjQ2K/c5ZTOZpzVYZAxWxgDM0sw
 vIbGYOEVGmAsmjv6m1k/CgPjcCaznvFClmkcgOmOSVeU3bUqkjk85Uc8k
 MXJHH8HKqlrykEx4gWCSnUAaR0/x1uu/8XMk3J3lTNZDfE0hS4YOBtqhP
 6qD40b24V7TNfsiL/vApdNGopONYCY96eVc/m7VBjsYXt5FVWUBtzeFT7
 Jui3d29Ys8k7sLB8XMBIFZccjK8o+sSxwT4Jw6gaWcZXF8QIFD4BBKhYX A==;
X-CSE-ConnectionGUID: LJwZdICOSuypcOto9zNZ0g==
X-CSE-MsgGUID: 2HHntv/bRVC6sqHGoL/gBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="84135507"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="84135507"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:14:41 -0800
X-CSE-ConnectionGUID: uOB1QtcTTCiOLE7rDaH7VQ==
X-CSE-MsgGUID: G2L3Hm/0TdWIZ/WmbQxWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="199188218"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:14:41 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:14:40 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:14:40 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:14:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qGlu9gCNFTkoHPJE0fkR2vVSDI2p0KNasaZ+FNHv5FXsNHWIyzyc42Km6TyVzGjqwp1yKUbEg53soOLO7zG09WWUnTmzm8iC6+yYj5NtQj305MAAxH0xduP8/Xv0IaqMJAU86T5TMtI0/x+B4W2m3wDNKgmxJtU2N/k6K6n8i3hR7ZL0lmcT1ZYrsem9uDkYbD3cU7cpAB+L9A3NEcNG7r0Kmm2NH+YLzJgrhj/8OvQe6aL2d//UQdOjrPvjq3rUhD2kFe3GAKnfpMafP7LHW2RcPRp+oyLxMEJCsFJS+CMIemucI3OD1+uEzxpA9ypETET+s7mQjkBch/P1UBqScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN2cslBKfO6ePd1bU+bNHftNGGF6lDlR7SkcOR9jk4Q=;
 b=wO0gCKIHhiyIrZ82SXGgRLA/GSL29bnX2AGGiexmNcl2Qy/z3FnC2cOEXO8btcsoZGRQYiKPCFCi1m6rIzOefSkP8ecsERpge0Go1avzh/G42nqwy7CcV7lX7KfOg7NpR3qgGmhi168Wo6S3YpX2QEjIzJzV8lTKiDFJPGdKBzEd+ngeMF3CdJOzfQBlRygRQ4aKjiyCFwRS2/AMbyNtjIUumbxs0svu2oyCxd3UYfDkHlHKmCw54vcl1hvpU1YcvaHdXiL400lDXIDzghjB3Z7ZhjchndOQGopfuebgSxepowsFrrQf1WHev5Xm7NfTcn3gfFu5/+BqlEzRbw1Z1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:14:38 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:14:38 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 02/10] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Thread-Topic: [PATCH i-g-t v9 02/10] lib/xe: Add synchronous helpers for VM
 bind/unbind operations
Thread-Index: AQHcYqFtxo9W8zbg0kmXa3J5+z4mK7UMw5fA
Date: Mon, 1 Dec 2025 13:14:38 +0000
Message-ID: <BL1PR11MB5525F55228D9A388ACFFA54784DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-3-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-3-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: e4e3d9ad-ec87-42c4-eb8e-08de30db9497
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eFFxRnZKdGhPTkp1b1RKczhKc21ZY016UU9waDVCQm1Qclg2ZnlFN29IYXZM?=
 =?utf-8?B?YmM0WWlvKzQzY3NKblMvbEpnV2JVNFpVWG1IaUdMMjViZ1hPeXEvZjJPMldH?=
 =?utf-8?B?R2dqeDM4MDAxZVlicGhVdVJDVzVhUzZ5WUdhb2FWRzN6MU5VMURYbnluS0ZB?=
 =?utf-8?B?NjVsK0QzejVMTnZVc3BuRUtabnhmQUZvMXhkMnllN0w2UXVibUxyaloxSmcw?=
 =?utf-8?B?TkpPUU0xTEc0L3k3SmJBZmtzY0Y3UWNSUU44YldDcXZsNmtTYmpnMTB0b3VO?=
 =?utf-8?B?UG5sUmhGWWVZcGNUM2k2ZjJuc01QUzVrbUtNbGJlTHRvbzBEbk55T0ZwNmNp?=
 =?utf-8?B?L0VRUG9xRWJGdVViUGFBWDJuV2tvTjZscTl1c0pHbWJQSUJCYmVRRldqeTNx?=
 =?utf-8?B?UnNuK2xLYjJuUkloTERaQWdLNUJNTFRwVXVibTBsZzgzeUhpeng1bUdUbGNL?=
 =?utf-8?B?U2dDSjg2V3dOSUJMZ2x0QW9lRWdVSTZYVHBUWndHNnlGZm1wRUhXaUsrN2o1?=
 =?utf-8?B?b3FHQ1NoeG9qZXJNNVlTZlU2ZitLdGZFQmlreG0ydUNYRGxyVEpJQkRrRVln?=
 =?utf-8?B?b1preW8wMlJCak5XT1pFWVNOcm1sazZ0anQwU2Z6cmE2dDVJKzRPOFlKbU1q?=
 =?utf-8?B?Q1g1eXBoNGxHMm54citlQnRvTVo4SHFaMk91ZXI4Ykp0OFJYZURDTkN6bGdu?=
 =?utf-8?B?UXRmOUpRcXhQRUNhb3Bla0IxVnVhNFhwSWtVbWkrMU81QUMzcXRCdGFTci9Z?=
 =?utf-8?B?WFFWNktTYVVHZzh6L0hjK1BsQTVndDRpV1BUK1UxcG0xemN3YloyblJtSzMy?=
 =?utf-8?B?elhrcHpaL2p3aDFnVWIyeDJxa0NWYmc4Y3JEeEJrcE42S2doRTArMStUdjQz?=
 =?utf-8?B?ZERTV0ZOZi9IczRqOTRLYjdkb2RiT0RLNXFwdk1yT2NURlJqM2xPR0ZqN2gr?=
 =?utf-8?B?TzFxVVhMNGxndHpRckU1NysyM2RkUGIyS20xN2FSMnQyYmZmaG5SWi9NeU5s?=
 =?utf-8?B?TnVCSGJJSkdyVlMrVUlIaFFmSDNtY3JuTmE2ajZOTDZlNWtKVFFwbmVGTDhx?=
 =?utf-8?B?eFgzTWZrelV1anBkNTZkM21GcmppWU4wblRxYlpXV3lHZWJTQUpQd1czMUZU?=
 =?utf-8?B?MWM5akhmbE1Sb1BUWG04aG5haXU1TzBLOWIvV3ZybXFyS2srcTZhVXZtdHpq?=
 =?utf-8?B?VXQ0RmE1VjlqNVUrN2NPM2RFTHdYeU5xcE9NLzNtV0FacitISlg5WjBvVlBj?=
 =?utf-8?B?VDFCZHJ6Y2NTK0hMWDFKN21ITytQT3JzS0psTXoxZGRqbkk2ZHdGYVpFVUVw?=
 =?utf-8?B?ZjN2elUyNWUveHVXbHJLYi8wY2lZWCt4ZXNnUzVYYXR3SXhCcDVFL0tRYlBE?=
 =?utf-8?B?VUdyeXYyTFhFOE15QWxOcjlPSXhYblpCZTBFd2s4UWwyRllka0hlSWRPOTh2?=
 =?utf-8?B?N1VabjR5STFLWXEvUXJGMitqVFhSbHV6dmNPT1lTcndsK09xUkxqZUdKcElv?=
 =?utf-8?B?QXV6bDFMR3Y4ZjZyNEJhRXNPWmovV1h5OEhGZXpQOHBhcnRBdnZHN1hicDc5?=
 =?utf-8?B?Qm1IKytKZnJZcEhrU0grd0loMk5ETjI3aHpjY2hwNWwrdlZnYzM2RVVZbFB5?=
 =?utf-8?B?a2hxZXFYR3VuaGs0cDZua2tFMUt4VXk0THlNWVVNZGRqTmJBemxSRDltUHNN?=
 =?utf-8?B?R2dCVEhTYjIrV0UrQ1NXV3BPSmJ2cG5LMis0b1R2R292SDdCWUhpcU41K0hw?=
 =?utf-8?B?MFlRd3ZaWm5Hb1Y3dlZRZDM5b3lkakVsc004V3RGbk9iNHVYZXQwendNcDZ1?=
 =?utf-8?B?dEJIVU5Kc2hUUTExdzZaY0Z6M3Jkbyt3Q3BuRGZIU0lBR21UMnNxSERUcytq?=
 =?utf-8?B?TXMwZm9wKy9OOHJ0SmNKTW1IaDhQRHM2amhrUTFEMUQrOHRpeHQ2KzhWdkxD?=
 =?utf-8?B?d2xBTXNtTk5uMDNzRkxEcWpTdm9qSGovN1FSRHlINEpGRzdFTHVLWTVSOXZ4?=
 =?utf-8?B?ODNENW5nckxBYm5SejU3T0QzNU5EMmRCR242dXBIMTZyclBrSHo1OGt1aGFP?=
 =?utf-8?Q?CnK44t?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjVPZHF2c09GQ0ZFdGtVNFM4dEtkV0tzN1YxZ2pBZldqam1zQkxaSm0xeFJw?=
 =?utf-8?B?OEFVRW01UHZCUnNTMmlkdE5nMUpWRTlCRmtRRUNGNml3ZFR1WUN2MVlLd2wv?=
 =?utf-8?B?SFFxVlZVUG92QlJ2WVNIVnZDUVlSRjN0Y2VOZDI1Z2RXc0pZOGxtNXhheWQz?=
 =?utf-8?B?YVhMZlRzTjhLMTJZMTB2U1B5RjQ3Qmd6N2UydDM1dUdjdHFhN0tYK2cxRVNv?=
 =?utf-8?B?bnBuMVFGMGJCakNJSGVoSlY0UmxZUUdidzQrT0hJUkZiQUtKZ1JIeTI5RW90?=
 =?utf-8?B?ZkszeUdSZkZVcWtPS01SdHdmYzdlMVhCeVlxUmdUUmxXV1FoVGQrZWdoZEdi?=
 =?utf-8?B?bFczOWRkUEVYT2ZHaElZdjNUV0FGTXgxVnNHbEFLRmdxclczaUdGN0RSNCtq?=
 =?utf-8?B?OW1MQXpDM3NjNm04bWFjMFRwR25ONzBvdlIvTDQwenA2ZksyVm5MSXFNaEZC?=
 =?utf-8?B?a1NRakNaSGVKUGRLcUVWbHBYMzZHTHZ5TXUxd2ZaK0Mva0lweDY0cnVmTGVh?=
 =?utf-8?B?OUhHd21rVERGMHZkK1h3NzE3Y25CQkFTSWkrYUtpNW4wL2l2b2ZDZHI5UzM5?=
 =?utf-8?B?a3RCem5xOHRGdmw4bTVmVkQ0cEpqcS9LZnF6ZjVnQjhkdHFEYm1zcXkyR3hC?=
 =?utf-8?B?NUJ3NTZMSHJ6dmxZYXB1eEpKWUlGbXZDRndieWo1MVF1MUcvdmNMRzFuakNp?=
 =?utf-8?B?TGFBemREU045UU9jY2JFT3VVMDEzVmVxcHI1aGx3ZnVqM2NsMGx2L2VZejN2?=
 =?utf-8?B?ZmZQNFdXeHdGcjFKUkpDSXV0M2NiS1VIKzVnLzdVMEV4cVFTUVBCaUhZc0JJ?=
 =?utf-8?B?ZWtBay9ibnozdG90eWNQQ3UrdmFWV0hEN1N5VzhiNjRRcUFnd2FTLzV6dHUr?=
 =?utf-8?B?QnpjWXd0bWY0akJyOWFEU0V0RGQwRDJzS3p5b2JPQkVWQkliN3Rialk0dHRN?=
 =?utf-8?B?ZGFUNElYcTg1KzVXMmFONjVkcjUzNkptOXFUcHIybFp1SDJFQmJjVDNSNlE5?=
 =?utf-8?B?dkdVbWk1VTVQWk1ScVh0Y1BUa2d5TUlheDF0WkdxbmFyWmNYekwvMFMwaDhn?=
 =?utf-8?B?WDRsVkNCQjFaUGlUNEVLajFnY1A5SmtpL3k0T01BcFBWSWU5V2ZOT2dLcUND?=
 =?utf-8?B?S3ZEWnpUTTBqWkI5TUZWVTRTbGlsdUMrNHdScU1sUWVIQ2J3MEE1Mks2bEpo?=
 =?utf-8?B?Y213V2VCcXRrSUtjZE1BbnR4UzlPeEVHdWFzNlVvNm9LYWdvb3VmQndCTnJT?=
 =?utf-8?B?cDUveDMvYlVsSG44VlBGanRLdEtzSG5OSUxscnlRV0pQRGxnWDEySk1KS0lC?=
 =?utf-8?B?K1FRUGlESjBYYUl6VFR2cTNtZjliZFlHTmV6UVg0QjJCL2JZYTdOak5FZ0pG?=
 =?utf-8?B?cUhWSFBVVXNyS2pLS1pEYmZiYTYzTDB1NnJFWU9QZmU1ekRMWkdTd1IyWVIz?=
 =?utf-8?B?b1JnaVEzZzVCb0g3TnNvVU9nQ0xxTC9qQzdVZWxMd2tOdnkvNWx3cW90LzI2?=
 =?utf-8?B?c2R1NS9jUzkvVDBBYS9FaWlGeWpEV3lpSDFIQWdmOEJaOHlyb1JhcDBrdTRs?=
 =?utf-8?B?RWE0cWVyTTkyLzZzQUhnd283Q3hBRGMwa1JIMTZFNmdteW5DR1JLWlIyUFZp?=
 =?utf-8?B?SUdMdzhzL2wyOWZxcEtmeHF0djVXR1BETzNOOElVOXJ5M0JPU05laGRqcVdr?=
 =?utf-8?B?OXJmeFVpTFpWYmVEN0lyR2pnVVRoZHo5QXJyTDBLZEFTZjNoa093cnJmMEpa?=
 =?utf-8?B?VmtuMUtoeCsvdk5DRHFtank3MFZ1UXoyYm9GMGR1cUZTSjc1QmhlQVR4ckUw?=
 =?utf-8?B?Z0pWYnM1Mmg0amUzT2F4WGJSTG1vbFpkVEdObXFBWExSYWdUUlNpNHIzMDJl?=
 =?utf-8?B?bVBsbUdJOXNZRC9xajlCVndLeGJKcFgvcWFjWWFjak8yd2NCV0pFWXZXOEIz?=
 =?utf-8?B?alJLQ0dKd2xoaGJBOHE2TnVqbXZLSitoclc1eXh1dVVGVXlXdTh3L0ZMQzlt?=
 =?utf-8?B?elNmOWt6bFNtVm1HR29LN0VkTlBET01PMmRkRTN0dWFxUG1yT0J5TzI3Q3JP?=
 =?utf-8?B?OXB6WjFURUVML3pDZEEyK0hDVHRnZ3ZOaUUrWVA3NTBpcG1NeDlvWVhUcFpO?=
 =?utf-8?Q?N8tIroIi0PUEY9cyJKN8OT3kN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e3d9ad-ec87-42c4-eb8e-08de30db9497
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:14:38.1590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tjKxKi65WJa0vtZLvPfFPSEMTau2XVqRpxVJs5dpzqRQqq6NNXenMVJgI8B8X8I1Uk3nMRM050ilqJ+d949HZ+mAMO7j9NhUAmEH5AOqn3c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU2hhcm1hLCBOaXNoaXQg
PG5pc2hpdC5zaGFybWFAaW50ZWwuY29tPg0KPiBTZW50OiBNb25kYXksIERlY2VtYmVyIDEsIDIw
MjUgMjozNCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFNoYXJtYSwg
TmlzaGl0DQo+IDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT47IEd1cnJhbSwgUHJhdmFsaWthDQo+
IDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIGktZy10IHY5
IDAyLzEwXSBsaWIveGU6IEFkZCBzeW5jaHJvbm91cyBoZWxwZXJzIGZvciBWTQ0KPiBiaW5kL3Vu
YmluZCBvcGVyYXRpb25zDQo+IA0KPiBGcm9tOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1h
QGludGVsLmNvbT4NCj4gDQo+IEludHJvZHVjZSBzeW5jaHJvbm91cyB3cmFwcGVycyBmb3IgVk0g
YmluZC91bmJpbmQgb3BlcmF0aW9ucyB0aGF0IGhhbmRsZQ0KPiB1c2VyIGZlbmNlIGFsbG9jYXRp
b24sIHdhaXRpbmcsIGFuZCBjbGVhbnVwIGludGVybmFsbHkuIFRoaXMgc2ltcGxpZmllcyB0ZXN0
IGNvZGUNCj4gYnkgZWxpbWluYXRpbmcgcmVwZXRpdGl2ZSBzeW5jaHJvbml6YXRpb24gYm9pbGVy
cGxhdGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1h
QGludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IFRob21hcyBIZWxsc3Ryw7ZtIDx0aG9tYXMuaGVs
bHN0cm9tQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIveGUveGVfaW9jdGwuYyB8IDM5
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDM5IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIveGUveGVfaW9jdGwu
YyBiL2xpYi94ZS94ZV9pb2N0bC5jIGluZGV4IDIyMWZkN2M2Mi4uMzY5YzU4ODdkDQo+IDEwMDY0
NA0KPiAtLS0gYS9saWIveGUveGVfaW9jdGwuYw0KPiArKysgYi9saWIveGUveGVfaW9jdGwuYw0K
PiBAQCAtNzQ3LDMgKzc0Nyw0MiBAQCB2b2lkIHhlX3ZtX21hZHZpc2UoaW50IGZkLCB1aW50MzJf
dCB2bSwgdWludDY0X3QNCj4gYWRkciwgdWludDY0X3QgcmFuZ2UsDQo+ICAJaWd0X2Fzc2VydF9l
cShfX3hlX3ZtX21hZHZpc2UoZmQsIHZtLCBhZGRyLCByYW5nZSwgZXh0LCB0eXBlLA0KPiBvcF92
YWwsIHBvbGljeSwNCj4gIAkJCQkgICAgICBpbnN0YW5jZSksIDApOw0KPiAgfQ0KPiArDQo+ICsj
ZGVmaW5lICAgICAgICBCSU5EX1NZTkNfVkFMICAgMHg2ODY4NjgNCj4gK3ZvaWQgeGVfdm1fYmlu
ZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQzMl90IGJvLCB1aW50NjRfdCBvZmZz
ZXQsDQo+ICsJCQl1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1aW50MzJfdCBmbGFncykg
ew0KPiArCXZvbGF0aWxlIHVpbnQ2NF90ICpzeW5jX2FkZHIgPSBtYWxsb2Moc2l6ZW9mKCpzeW5j
X2FkZHIpKTsNCj4gKwlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3luYyA9IHsNCj4gKwkJLmZsYWdzID0g
RFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+ICsJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9V
U0VSX0ZFTkNFLA0KPiArCQkuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QgKilzeW5j
X2FkZHIpLA0KPiArCQkudGltZWxpbmVfdmFsdWUgPSBCSU5EX1NZTkNfVkFMLA0KPiArCX07DQo+
ICsNCj4gKwlpZ3RfYXNzZXJ0KCEhc3luY19hZGRyKTsNCj4gKwl4ZV92bV9iaW5kX2FzeW5jX2Zs
YWdzKGZkLCB2bSwgMCwgYm8sIDAsIGFkZHIsIHNpemUsICZzeW5jLCAxLCBmbGFncyk7DQo+ICsJ
aWYgKCpzeW5jX2FkZHIgIT0gQklORF9TWU5DX1ZBTCkNCj4gKwkJeGVfd2FpdF91ZmVuY2UoZmQs
ICh1aW50NjRfdCAqKXN5bmNfYWRkciwgQklORF9TWU5DX1ZBTCwNCj4gMCwgTlNFQ19QRVJfU0VD
ICogMTApOw0KPiArCS8qIE9ubHkgZnJlZSBpZiB0aGUgd2FpdCBzdWNjZWVkcyAqLw0KPiArCWZy
ZWUoKHZvaWQgKilzeW5jX2FkZHIpOw0KPiArfQ0KPiArDQo+ICt2b2lkIHhlX3ZtX3VuYmluZF9s
cl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IG9mZnNldCwNCj4gKwkJCSAgdWlu
dDY0X3QgYWRkciwgdWludDY0X3Qgc2l6ZSkNCj4gK3sNCj4gKwl2b2xhdGlsZSB1aW50NjRfdCAq
c3luY19hZGRyID0gbWFsbG9jKHNpemVvZigqc3luY19hZGRyKSk7DQo+ICsJc3RydWN0IGRybV94
ZV9zeW5jIHN5bmMgPSB7DQo+ICsJCS5mbGFncyA9IERSTV9YRV9TWU5DX0ZMQUdfU0lHTkFMLA0K
PiArCQkudHlwZSA9IERSTV9YRV9TWU5DX1RZUEVfVVNFUl9GRU5DRSwNCj4gKwkJLmFkZHIgPSB0
b191c2VyX3BvaW50ZXIoKHVpbnQ2NF90ICopc3luY19hZGRyKSwNCj4gKwkJLnRpbWVsaW5lX3Zh
bHVlID0gQklORF9TWU5DX1ZBTCwNCj4gKwl9Ow0KPiArDQo+ICsJaWd0X2Fzc2VydCghIXN5bmNf
YWRkcik7DQo+ICsJKnN5bmNfYWRkciA9IDA7DQo+ICsJeGVfdm1fdW5iaW5kX2FzeW5jKGZkLCB2
bSwgMCwgMCwgYWRkciwgc2l6ZSwgJnN5bmMsIDEpOw0KPiArCWlmICgqc3luY19hZGRyICE9IEJJ
TkRfU1lOQ19WQUwpDQo+ICsJCXhlX3dhaXRfdWZlbmNlKGZkLCAodWludDY0X3QgKilzeW5jX2Fk
ZHIsIEJJTkRfU1lOQ19WQUwsDQo+IDAsIE5TRUNfUEVSX1NFQyAqIDEwKTsNCj4gKwlmcmVlKCh2
b2lkICopc3luY19hZGRyKTsNCj4gK30NCj4gLS0NClJldmlld2VkLWJ5OiBQcmF2YWxpa2EgR3Vy
cmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gMi40OC4xDQoNCg==
