Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55587C369AB
	for <igt-dev@archiver.kernel.org>; Thu, 24 Apr 2025 05:07:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6310E436;
	Thu, 24 Apr 2025 05:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XAhma92i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D2B010E436
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Apr 2025 05:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745471234; x=1777007234;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Cv54y/2zurbZaJ5+ZOnxO8vMOi4nY9yY7EfCbnHPSi4=;
 b=XAhma92iURQPb2sgR8zWbCpbXH514Vyhoj7PySxV52ZIDL1bMB6xaE0L
 m8eZsad3lJFvMeo24OgsWADM41sZ9UAs1cn8CFTdMtjfxpKzgetbAEBN3
 bDUP+aPqLtN4ut8rJ0gyrJkIixyolhPOVrphOk6JSHy0of/OD5p+B4ipD
 Y1t/6MIiEgWOo2ZQ49suPdwOnsvSjCpuaNQd3D6ZDn5DhN6YH/xKiLBfZ
 7HXJBeWo5Pq4mNQuXLgfhtQQ1gWdQroe7AsfQJcnPL0C9UNBTipiIZBFd
 0QNhXgh2sGpRnYdN83xdDVhcb84OTOWbg6xyf51OEyCtvMnmBKr952kH5 Q==;
X-CSE-ConnectionGUID: FCENuv/0RFKelPtxTomuiw==
X-CSE-MsgGUID: KTLhOD6dR/uYlz+1rMgbkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="50910889"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="50910889"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 22:07:11 -0700
X-CSE-ConnectionGUID: tIvagpHxQPaaTjwvvh6jtg==
X-CSE-MsgGUID: l73B46gKS1G0rzOAZinruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="136588540"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 22:07:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 22:07:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 22:07:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 22:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo4sy+UW5nR1qPtuaIXrMppNeRVHlwld+vVV69ixZZKVrYQHlQW9ysE5WxCQ0NH8q8KWZTzCHYxHidg4n/jTRMODQ5zzM/KcARHYw5YlzhRZkXGE487debloMM9lIBoDEm7IoLy25cspoPmt0NWuJZWPf9AiSjg7V2fCbwmbD71POYWGuotZYiTzQ71sdtqElvWYkITktWYfoj4kX/YE6eXCY1GAv5mbFUbvqtWmF/rX7xqpn+B9pLFLvkA4rTL+hfWgwO+jkkqGbMZTit6L2jeJF5ZTS/001nX90tLIC9+HeclT7znlAPqPFfwmji/5OHYUN6k/ODEpMwiiMesr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cv54y/2zurbZaJ5+ZOnxO8vMOi4nY9yY7EfCbnHPSi4=;
 b=n1Cz1PIa0YsXRBXeuNbGtb3lbkdi2VAqdlVP02lfMb43rBmXuCSjteCKXNyT9ZzZERpYp5X9EK0U2IxegT721ekJh2nTKxBwFljt3V7qjymWOBo2jowBdhxZnPVjJ7Kepd+foRIwUyuBrLjKWuAIB5CL00DoymS+/ae/p5uW0GXvx25qHgLkv0algy/8pTPuLwmJoeXd8TCkqsCfM6+wOjBBOoiYUgabIvE2MCuNgCpLsgJZZ8U6t2wea4b7EpuNFz9LAxuGkYsVyca6xm6Wohq8ihz0p7dzdF/mk2bP040my88CXUFlLWOMjqyH1c/F+y4hN+I5DDZ8wVtBZEh+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 05:06:54 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%5]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 05:06:54 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] benchmark: Measure allocation time for objects
Thread-Topic: [PATCH] benchmark: Measure allocation time for objects
Thread-Index: AQHbtDYzNJ/YpeFEkUGPMfq5X3Q5u7OyRJ+g
Date: Thu, 24 Apr 2025 05:06:54 +0000
Message-ID: <CH3PR11MB8434F1CC0DBFBBE9025D1D758D852@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250423100546.846124-1-pravalika.gurram@intel.com>
In-Reply-To: <20250423100546.846124-1-pravalika.gurram@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CH3PR11MB8239:EE_
x-ms-office365-filtering-correlation-id: 35cb0b78-0572-407f-7d1b-08dd82edd4bb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?WUVzajlMYUlndTJtNTdTS3ZQYXAweCtmKytmRW05UGVLVkc2OGpVaUQ3ZkVG?=
 =?utf-8?B?UVVjR3RYQjgxYktqRlRSdm1FQitnL21CZVJtb3BjcU5qbjh0Mm1rUzEzZG9u?=
 =?utf-8?B?ejYvRk9Xa3RGTDJ3R2trNXlTN0poQTFkbTJBWUk4K2U1SHZ2eXRWdjdyRlZk?=
 =?utf-8?B?cVNlSjBvQTN2QnJiSVk4ZFRjZ0JXS05TUXlud25WcmlQdHRETXFKdjRkTEVR?=
 =?utf-8?B?ZWJLdnR0QjFWSVVKeDkvbldRQ05tTVdZRjZ3T0dOZVg3ZVA4cG01a3paMGpP?=
 =?utf-8?B?b1A3QksvSGtRanhlMUdmODFsd2RJTDN2RU9id012M2FKZUdJb1NKajNZSjF6?=
 =?utf-8?B?R2xiRHFObHNUd0NyK2U0TzFRQm01NjJTNzF2TmIwQm9jMFBia2ViWGlSelJS?=
 =?utf-8?B?VG54MlB2bnUrQzU5T0hMeGxxOHVVaG5yRkYzVTAxemJzZEY5ZkxRekNGNWJk?=
 =?utf-8?B?b0M3VjNCbHpzWkU2cHdtMEpaNWhxeloxZkIyQ0VnOGxTcnBKNWZLSzhPM3RD?=
 =?utf-8?B?N1FrLyt0N25BZ3RXVFN3REVHOHhTRTMzOEFTUHpGdzByR3BDOFRpRXZ4ODB1?=
 =?utf-8?B?dnRHcm1pbDlXdmI4UWs2YzFpZnl3TFBsTTJ1UHNOUUdZWXRmdkxGUDJ6MlFn?=
 =?utf-8?B?aklSK203a1Y3eHJ0Rk5XWWkxVDBRVGt2ZE1HeXBGK2hmZnVtZjFwaHVSaFFW?=
 =?utf-8?B?bmdETmNhenAzRi9yUm9tT1J4N2NPclNhZnhXWU90L1BqVmpCb2JPa04ybmo0?=
 =?utf-8?B?eWJEaWxTemFva3A0bS9qVWpjeUJvaExTSXEwL1pjZUZKSks4M3pnSkF3VzJP?=
 =?utf-8?B?OGo0V3dxaWttQUtKT0l1NlJEUXhZRzlrM1pHbWNmeitITktEWVZyTmRVZU44?=
 =?utf-8?B?SU1YcVNNeHNPKzA2bzdzU2tWRmxieGFNTU9aWFR6aTh5VXZyd29ITk9WUlI0?=
 =?utf-8?B?blI1NStMcGUyTHQ0bktsVlJmc0VvYjJjbWE0NlNaMm5reGJzenJ3QjJobGdR?=
 =?utf-8?B?MmJhTy9xNHByMU1RSEU5UUxzYUJncHlUTmhUQzRHOHBEbmJJSm45SHpYN0dV?=
 =?utf-8?B?VW84aFY5SzFtVVFLTE1aRDdMRzlNRXBtUWo0YzM5RGNTaHp1RmxRbFB0YWE1?=
 =?utf-8?B?ODFKWVhzNEhOY0c3Y1RxeEpBQmU5eVEvZ3dscDh4T1JhR2NwNldvajYwMEpl?=
 =?utf-8?B?Tlp5Qk05R2VzQ0RFZjAzajJHM2dQSkNnbXNIUWZ3ZnVFSVZvdTVTYThwQzlq?=
 =?utf-8?B?ZTNydDcrQjZUa2doQzc2RG5tZzVzZFlCN2QxSTQzUU1hZjlIem9ZRnpURUR5?=
 =?utf-8?B?c3VQQjJkUlBIVXZFbmNYUXNESXJRK2daaWZNMlY0T0I1TVJKYzd0QjVrc1g0?=
 =?utf-8?B?UVM5RDRyaHp2SUpoak1BcnpoQzZtQ1JsMm9qYzh3Q28wRDZFVlBUYjdrcUpr?=
 =?utf-8?B?MXYzSlNQNUxXaFo1cEFVUjhMZS8wWTRIaVlMTjFSQ0xGYnozTU5KMEM4Y1NZ?=
 =?utf-8?B?WjVwTTY4bXI4Mmx6TmJFMGFkZEpuNVcyOFRVODJPOHR6VEsvWmljSFpsVG5z?=
 =?utf-8?B?MGJEVVVXWEFaODdsQURSQldtUkM3UEZ4NUlTUGRlcHEvU2UxZjYvdnVteFJ4?=
 =?utf-8?B?c2phdVBtNi8rbXhDTUFxdk4vbTNlcWpPNU45ZHVtcDl1OVlDR2pwcWNaRWIx?=
 =?utf-8?B?UzVqTlR1ZHZ2Tk13MHJQSU9CR0Y2T3kzNWlxYnpoR2hrSEo0RnhFQW9DSGxy?=
 =?utf-8?B?dVNSbVBLRkEwUi9RZnFlR05keGJzbEkyY05jdElpMUhTdzViQm1RVUFiT2sy?=
 =?utf-8?B?bjdXRjZUV09TSGZNRnZxS3o0cmRzMkNOWlExMS9TRDcxeURicWl0ME1OR29C?=
 =?utf-8?B?Y2k1dGZ3RHNqdUtCME9Cc1czTVY5T08yZ2RrekdHZzhuSW5LRzZIUXAxL25Y?=
 =?utf-8?B?dHVxUzNwUVdYQndTc2R4N2VWUXlhazF3eDFEV3dCOWZkVVZFQVJTVy9nU21D?=
 =?utf-8?Q?Qo4WLC42KULNaCM1OKMjvTFIRqDuak=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bHExZ2gxaTlJUmk1TEo4MHVDOWpoYXdRdnIrRWVja0ZNSFNoNDgrdEhRQ0VY?=
 =?utf-8?B?SGhZZTNmVU9UTlN5UWE1dmdHTUROcGVDRGdhZHgxaTZyN1d5eE9IWHFOalZp?=
 =?utf-8?B?cUJSVVRMMG0yOEx5V0hKSHFTRlFycm1xRmNQZzdySDBVQnpQaFl2ZDFqUXpQ?=
 =?utf-8?B?UEFDY3N0VUpLMjEzUkM3R0tWeW1MYXZhakRGczhIeDU4NGU2WURHeGl4UjBt?=
 =?utf-8?B?S0QrMWwzM3ZaMWxuc3M4ZllLc1NWRVRCaTgrN3VRUWxDcDFKTGV6L0wyUEI1?=
 =?utf-8?B?ZGJ6MUx2YlNLUEhwc0pqSjQwUHJab1NJMlRBaUszOWFpYThLRmxQZGlneDlS?=
 =?utf-8?B?YlJlSmdSTVMyajdWcDFUczhUQjlQOXZkNm5hRHJrSFlSU2xhS3JaMEpYSHY1?=
 =?utf-8?B?cUUyVFl4dHpCcW1XZ3grV2swYXNMcGFhSUlKaDZsaXBTbkxCdkZXcDJlc1BD?=
 =?utf-8?B?a0V6TC9IOEpFV0RwNGtVUjJjYTR6ZjBMcU9FWjY2M2FFQmxNZ2pUU29lejhj?=
 =?utf-8?B?UkxMUG96eUc3VGpNVDY2Q09paXg0TGJxZXdzVWdRdWlJZ00yZ0FMSVNzZWZ3?=
 =?utf-8?B?bkJjZlpCaEY0elpoc1VXcXJvbUtuWm5CQlIrc1BON0V6bUFPSDgzMXoyWDVl?=
 =?utf-8?B?MTlpOE5HV3pSUzJYNkQ3NjU4OGJqeURNV3lROElXRnVaYnVZTHhtaUZVU1dq?=
 =?utf-8?B?V3M5dmhIeDRCM3o2RnQwWXRzNXlmenF2dEJDeEVESGZKeEluU0RPaU9ZcThQ?=
 =?utf-8?B?VnFIUXh6cVlpVFhOc2JmQnVBcHRmR3lzNWxuTHpsY1VMc0JmbnJVNzNPcFpE?=
 =?utf-8?B?NlVYKzl3azhIb05rSWFRdzRMamlXcGZ1T2Fha1IvMDJmbVJxMDJzRUV2Z0ky?=
 =?utf-8?B?WnRwNmRaRFFoZWJaZWw0Q0dPa3pIOFBuUXhaRFdUc1c5MnN6MkZScDRGdDkz?=
 =?utf-8?B?YnNHdWpSOFdEQnQ2SjN6ZWNUY0xmemwxMlBVT2l3WEtXMDgwV2h6bkJPYWdx?=
 =?utf-8?B?U0lpSlJWY2pGQTlScDRpUzNWUkhQaTIraTBOUTNHTWFsa04rNk5xWVVLVnVU?=
 =?utf-8?B?SjhDODdmN0QxRkJCN3lLMmV1aWdsUmhkK1psV3hWUWNudVdRSlpuTXVMOUVT?=
 =?utf-8?B?aHpnM1huZzJ5RW1CbTJOSXRvaExGdlRjMUUrRmJjVFZkR0wrZnBBSk5wWkZa?=
 =?utf-8?B?UWt1VUtJSk5lTVRHV3lNOGVEaVFwbXJqblZCY21VUFZ5SXNhRGdqMTVjd0hz?=
 =?utf-8?B?V1pMeEtiZStjRmVkQi90Vy9ycnc5OEtVUmJyT1E1RmJMVVFVZWFRc3hIOHhk?=
 =?utf-8?B?aDFHYTRQZUNwWUQ1YnJzYUxRTGdOVUVMc2J6YlUvUTVoaXg2TTdIay9TWmts?=
 =?utf-8?B?eFlHZGxjS2RlRkQ4cC9oM01XREcvelp6K055dHBWcFlpbElpUVNZcnVseVV5?=
 =?utf-8?B?Y2ZnQmhucG9La0MxVE9TTWl0cStPa1Y4WmNIV3MvTk9jN2IxSnZXRmxLa3FX?=
 =?utf-8?B?bnB1TGd2SHpmN1hwTG5hVzJGOGM0TVYxM2NRMEM1Z0hua1F5UVEyb3ZSajJ1?=
 =?utf-8?B?ZWZUZHdEb1JzbllxVjJsYld3UU5hUXRTY3VPeStueFlxdzVPMjVhdGpXcEFy?=
 =?utf-8?B?WWRURGhMUkFKN1VaSlhIRnVkcDhrRzlIelkyNjNUQm9aeTJJS2ZkOFdqVVFO?=
 =?utf-8?B?cjRXWG5ZUFhCeWQxeEU3a3NwNkNzUk1OMnB4VmY5UmNZaXdOTTdtOVhjeTBx?=
 =?utf-8?B?MDJaUEpYcU5LbHBkT2tOZFNTVjhmbEFrL2c2akJGVk1NSHRZNktaS1RqY2Zs?=
 =?utf-8?B?RHpYNFlPUTZRaWVhSHkwN1N4Q0F5ZFovaWxGMHR3VXNQMHlPaDlhZlBjSzQ4?=
 =?utf-8?B?dGVTdFZsRVlwTzhYTTlzU3ZpSk9meWtkR3g0UXo1ZEs3NWhYaVp5ZXNCTkdn?=
 =?utf-8?B?b3RJTWpvVXRXT3Z6ckNrajFqdXJaRXEybm9WOHBaMHgvUFJ6QWtmNFVYNXB4?=
 =?utf-8?B?T2hVY2FoTk4wcXJTb2hUcHZQSERaNndQT1QrSmhNdjl3WTBHRmhYUlp0bTE5?=
 =?utf-8?B?ZGV2OTllYUFEWFF6ejJrWVpwNGtmYm5nSXI5Z3VqNEhNb0ZMRXl3SXdsYnZE?=
 =?utf-8?B?UWplcWY1eTJ5TTV0eklVM2x1TFhWYjZha1BrdkE4NFhxbFNmYkxzd3h4b3JO?=
 =?utf-8?B?eFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35cb0b78-0572-407f-7d1b-08dd82edd4bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2025 05:06:54.4124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8jlvBxcDMXphbhgrOz7NjwxHgxKiUFnLf5kuYEeNxg2MLekFNb50W93B9O9dfQH1RWD+rAxFj0rdCW4iQk58zbRZa0GmY7YLWlU+H+aZos0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VycmFtLCBQcmF2YWxp
a2EgPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiBTZW50OiAyMyBBcHJpbCAyMDI1IDAz
OjM2IFBNDQo+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogRGFuZGFt
dWRpLCBQcml5YW5rYSA8cHJpeWFua2EuZGFuZGFtdWRpQGludGVsLmNvbT47IEd1cnJhbSwNCj4g
UHJhdmFsaWthIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENI
XSBiZW5jaG1hcms6IE1lYXN1cmUgYWxsb2NhdGlvbiB0aW1lIGZvciBvYmplY3RzDQo+IA0KPiBB
IGJhc2ljIG1lYXN1cmVtZW50LCBob3cgZmFzdCBjYW4gd2UgY3JlYXRlIGFuZCBwb3B1bGF0ZSBh
biBvYmplY3Qgd2l0aA0KPiBiYWNraW5nIHN0b3JhZ2UNCj4gDQo+IHYxOiByZW1vdmUgdGhlIGhl
YWRlcnMgYW5kIHVudXNlZCB2YXJpYWJsZSB3aGljaCBhcmUgbm90IHJlcXVpcmVkDQpIZXJlIGl0
IHNob3VsZCBiZSB2MiBpbnN0ZWFkIG9mIHYxDQo+IFtQcml5YW5rYV0NCj4gICAgIHVzZSBTUERY
IFtrYW1pbF0NCj4gdjI6IE1vdmUgc3luYyBhbmQgZXhlYyBmdW5jdGlvbnMgaW5zaWRlIGJ1c3kg
Y29uZGl0aW9uLiBQcml5YW5rYV0NCkl0IHNob3VsZCBiZSB2My4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IFByYXZhbGlrYSBHdXJyYW0gPHByYXZhbGlrYS5ndXJyYW1AaW50ZWwuY29tPg0KPiAtLS0N
Cj4gIGJlbmNobWFya3MvbWVzb24uYnVpbGQgfCAgIDEgKw0KPiAgYmVuY2htYXJrcy94ZV9jcmVh
dGUuYyB8IDE1Ng0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0K
PiAgMiBmaWxlcyBjaGFuZ2VkLCAxNTcgaW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGJlbmNobWFya3MveGVfY3JlYXRlLmMNCj4gDQo+IGRpZmYgLS1naXQgYS9iZW5jaG1hcmtz
L21lc29uLmJ1aWxkIGIvYmVuY2htYXJrcy9tZXNvbi5idWlsZCBpbmRleA0KPiAyYzlhODhmZDMu
LjBlNDFlZWQwNiAxMDA2NDQNCj4gLS0tIGEvYmVuY2htYXJrcy9tZXNvbi5idWlsZA0KPiArKysg
Yi9iZW5jaG1hcmtzL21lc29uLmJ1aWxkDQo+IEBAIC0yMSw2ICsyMSw3IEBAIGJlbmNobWFya19w
cm9ncyA9IFsNCj4gIAkna21zX3ZibGFuaycsDQo+ICAJJ3ByaW1lX2xvb2t1cCcsDQo+ICAJJ3Zn
ZW1fbW1hcCcsDQo+ICsgICAgICAgICd4ZV9jcmVhdGUnLA0KPiAgXQ0KPiANCj4gIGJlbmNobWFy
a3NkaXIgPSBqb2luX3BhdGhzKGxpYmV4ZWNkaXIsICdiZW5jaG1hcmtzJykgZGlmZiAtLWdpdA0K
PiBhL2JlbmNobWFya3MveGVfY3JlYXRlLmMgYi9iZW5jaG1hcmtzL3hlX2NyZWF0ZS5jIG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMC4uZjAyOWZiYTk1DQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvYmVuY2htYXJrcy94ZV9jcmVhdGUuYw0KPiBAQCAtMCwwICsxLDE1NiBA
QA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IE1JVA0KPiArLyoNCj4gKyAqIENvcHly
aWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+ICsgKi8NCj4gKw0KPiArI2luY2x1ZGUg
ImlndC5oIg0KPiArI2luY2x1ZGUgImlndF9zeW5jb2JqLmgiDQo+ICsjaW5jbHVkZSAieGUveGVf
aW9jdGwuaCINCj4gKyNpbmNsdWRlICJ4ZS94ZV9xdWVyeS5oIg0KPiArDQo+ICsNCj4gKyNkZWZp
bmUgT0JKRUNUX1NJWkUgKDE8PDIzKQ0KPiArDQo+ICtzdGF0aWMgZG91YmxlIGVsYXBzZWQoY29u
c3Qgc3RydWN0IHRpbWVzcGVjICpzdGFydCwNCj4gKwkJCQljb25zdCBzdHJ1Y3QgdGltZXNwZWMg
KmVuZCkNCj4gK3sNCj4gKwlyZXR1cm4gKGVuZC0+dHZfc2VjIC0gc3RhcnQtPnR2X3NlYykgKyAx
ZS05KihlbmQtPnR2X25zZWMgLQ0KPiArc3RhcnQtPnR2X25zZWMpOyB9DQo+ICsNCj4gK3N0YXRp
YyB2b2lkIHRlc3RfZXhlYyhpbnQgZmQsIGludCBidXN5KSB7DQo+ICsJdWludDMyX3Qgdm0sIGJv
LCAqYmF0Y2g7DQo+ICsJdWludDY0X3QgYm9fc2l6ZSA9IHhlX2JiX3NpemUoZmQsIFNaXzRLKSwg
YWRkciA9IDB4MWEwMDAwOw0KPiArCXVpbnQzMl90IGV4ZWNfcXVldWVfaWQ7DQpNb3ZlIGJhdGNo
LCBleGVjX3F1ZXVlX2lkIGFuZCBhZGRyIHZhcmlhYmxlcyBpbnNpZGUgdGhlIGJ1c3kgY29uZGl0
aW9uLg0KPiArCWludCBlcnI7DQo+ICsNCj4gKwl2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgMCwgMCk7
DQo+ICsJYm8gPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBib19zaXplLCBzeXN0ZW1fbWVtb3J5KGZk
KSwgMCk7DQo+ICsNCj4gKwlpZiAoYnVzeSkgew0KPiArCQlzdHJ1Y3QgZHJtX3hlX3N5bmMgc3lu
YyA9IHsNCj4gKwkJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9TWU5DT0JKLA0KPiArCQkJLmZs
YWdzID0gRFJNX1hFX1NZTkNfRkxBR19TSUdOQUwsDQo+ICsJCQkuaGFuZGxlID0gc3luY29ial9j
cmVhdGUoZmQsIDApLA0KPiArCQl9Ow0KPiArCQlzdHJ1Y3QgZHJtX3hlX2V4ZWMgZXhlYyA9IHsN
Cj4gKwkJCS5udW1fc3luY3MgPSAxLA0KPiArCQkJLnN5bmNzID0gdG9fdXNlcl9wb2ludGVyKCZz
eW5jKSwNCj4gKwkJCS5hZGRyZXNzID0gYWRkciwNCj4gKwkJCS5udW1fYmF0Y2hfYnVmZmVyID0g
MSwNCj4gKwkJfTsNCj4gKw0KPiArCQliYXRjaCA9IHhlX2JvX21hcChmZCwgYm8sIGJvX3NpemUp
Ow0KPiArCQkqYmF0Y2ggPSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArCQltdW5tYXAoYmF0Y2gs
IGJvX3NpemUpOw0KPiArCQl4ZV92bV9iaW5kX3N5bmMoZmQsIHZtLCBibywgMCwgYWRkciwgYm9f
c2l6ZSk7DQo+ICsNCj4gKwkJZXJyID0gX194ZV9leGVjX3F1ZXVlX2NyZWF0ZShmZCwgdm0sIDEs
IDEsICZ4ZV9lbmdpbmUoZmQsIDApLQ0KPiA+aW5zdGFuY2UsIDAsDQo+ICsJCQkJCSAgICAmZXhl
Y19xdWV1ZV9pZCk7DQo+ICsJCWlndF9hc3NlcnRfZighZXJyLCAiRmFpbGVkIHRvIGNyZWF0ZSBl
eGVjIHF1ZXVlICglZClcbiIsIGVycik7DQo+ICsNCj4gKwkJZXhlYy5leGVjX3F1ZXVlX2lkID0g
ZXhlY19xdWV1ZV9pZDsNCj4gKwkJZXJyID0gX194ZV9leGVjKGZkLCAmZXhlYyk7DQo+ICsJCWln
dF9hc3NlcnRfZighZXJyLCAiRmFpbGVkIHRvIGV4ZWN1dGUgYmF0Y2ggKCVkKVxuIiwgZXJyKTsN
Cj4gKw0KPiArCQllcnIgPSBzeW5jb2JqX3dhaXQoZmQsICZzeW5jLmhhbmRsZSwgMSwgSU5UNjRf
TUFYLCAwLCBOVUxMKTsNCj4gKwkJaWd0X2Fzc2VydF9mKGVyciwgIlRpbWVvdXQgd2hpbGUgd2Fp
dGluZyBmb3Igc3luY29iaiBzaWduYWwNCj4gKCVkKVxuIiwNCj4gK2Vycik7DQo+ICsNCj4gKwkJ
eGVfZXhlY19xdWV1ZV9kZXN0cm95KGZkLCBleGVjX3F1ZXVlX2lkKTsNCj4gKwkJc3luY29ial9k
ZXN0cm95KGZkLCBzeW5jLmhhbmRsZSk7DQo+ICsJfQ0KPiArDQo+ICsJZ2VtX2Nsb3NlKGZkLCBi
byk7DQo+ICsJeGVfdm1fZGVzdHJveShmZCwgdm0pOw0KPiArfQ0KPiArDQo+ICtpbnQgbWFpbihp
bnQgYXJnYywgY2hhciAqKmFyZ3YpDQo+ICt7DQo+ICsJaW50IGZkID0gZHJtX29wZW5fZHJpdmVy
KERSSVZFUl9YRSk7DQo+ICsJaW50IHNpemUgPSAwOw0KPiArCWludCBidXN5ID0gMDsNCj4gKwlp
bnQgcmVwcyA9IDEzOw0KPiArCWludCBuY3B1cyA9IDE7DQo+ICsJaW50IGMsIG4sIHM7DQo+ICsN
Cj4gKwl3aGlsZSAoKGMgPSBnZXRvcHQoYXJnYywgYXJndiwgInM6YjpyOmYiKSkgIT0gLTEpIHsN
Cj4gKwkJc3dpdGNoIChjKSB7DQo+ICsJCWNhc2UgJ3MnOg0KPiArCQkJc2l6ZSA9IGF0b2kob3B0
YXJnKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ3InOg0KPiArCQkJcmVwcyA9IGF0
b2kob3B0YXJnKTsNCj4gKwkJCWlmIChyZXBzIDwgMSkNCj4gKwkJCQlyZXBzID0gMTsNCj4gKwkJ
CWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2YnOg0KPiArCQkJbmNwdXMgPSBzeXNjb25mKF9TQ19O
UFJPQ0VTU09SU19PTkxOKTsNCj4gKwkJCWJyZWFrOw0KPiArDQo+ICsJCWNhc2UgJ2InOg0KPiAr
CQkJYnVzeSA9IHRydWU7DQo+ICsJCQlicmVhazsNCj4gKw0KPiArCQlkZWZhdWx0Og0KPiArCQkJ
YnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlpZiAoc2l6ZSA9PSAwKSB7DQo+ICsJCWZv
ciAocyA9IDQwOTY7IHMgPD0gIE9CSkVDVF9TSVpFOyBzIDw8PSAxKSB7DQo+ICsJCQlpZ3Rfc3Rh
dHNfdCBzdGF0czsNCj4gKw0KPiArCQkJaWd0X3N0YXRzX2luaXRfd2l0aF9zaXplKCZzdGF0cywg
cmVwcyk7DQo+ICsJCQlmb3IgKG4gPSAwOyBuIDwgcmVwczsgbisrKSB7DQo+ICsJCQkJc3RydWN0
IHRpbWVzcGVjIHN0YXJ0LCBlbmQ7DQo+ICsJCQkJdWludDY0X3QgY291bnQgPSAwOw0KPiArDQo+
ICsJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMsICZzdGFydCk7DQo+ICsJCQkJZG8g
ew0KPiArCQkJCQlmb3IgKGMgPSAwOyBjIDwgMTAwMDsgYysrKQ0KPiArCQkJCQkJdGVzdF9leGVj
KGZkLCBidXN5KTsNCj4gKw0KPiArCQkJCQljb3VudCArPSBjOw0KPiArCQkJCQljbG9ja19nZXR0
aW1lKENMT0NLX01PTk9UT05JQywNCj4gJmVuZCk7DQo+ICsJCQkJfSB3aGlsZSAoZW5kLnR2X3Nl
YyAtIHN0YXJ0LnR2X3NlYyA8IDIpOw0KPiArDQo+ICsJCQkJaWd0X3N0YXRzX3B1c2hfZmxvYXQo
JnN0YXRzLCBjb3VudCAvDQo+IGVsYXBzZWQoJnN0YXJ0LCAmZW5kKSk7DQo+ICsJCQl9DQo+ICsJ
CQlwcmludGYoIiVmXG4iLCBpZ3Rfc3RhdHNfZ2V0X3RyaW1lYW4oJnN0YXRzKSk7DQo+ICsJCQlp
Z3Rfc3RhdHNfZmluaSgmc3RhdHMpOw0KPiArCQl9DQo+ICsJfSBlbHNlIHsNCj4gKwkJZG91Ymxl
ICpzaGFyZWQ7DQo+ICsNCj4gKwkJc2hhcmVkID0gbW1hcCgwLCA0MDk2LCBQUk9UX1dSSVRFLCBN
QVBfU0hBUkVEIHwNCj4gTUFQX0FOT04sIC0xLCAwKTsNCj4gKwkJZm9yIChuID0gMDsgbiA8IHJl
cHM7IG4rKykgew0KPiArCQkJbWVtc2V0KHNoYXJlZCwgMCwgNDA5Nik7DQo+ICsNCj4gKwkJCWln
dF9mb3JrKGNoaWxkLCBuY3B1cykgew0KPiArCQkJCXN0cnVjdCB0aW1lc3BlYyBzdGFydCwgZW5k
Ow0KPiArCQkJCXVpbnQ2NF90IGNvdW50ID0gMDsNCj4gKw0KPiArCQkJCWNsb2NrX2dldHRpbWUo
Q0xPQ0tfTU9OT1RPTklDLCAmc3RhcnQpOw0KPiArCQkJCWRvIHsNCj4gKwkJCQkJZm9yIChjID0g
MDsgYyA8IDEwMDA7IGMrKykNCj4gKwkJCQkJCXRlc3RfZXhlYyhmZCwgYnVzeSk7DQo+ICsNCj4g
KwkJCQkJY291bnQgKz0gYzsNCj4gKwkJCQkJY2xvY2tfZ2V0dGltZShDTE9DS19NT05PVE9OSUMs
DQo+ICZlbmQpOw0KPiArCQkJCX0gd2hpbGUgKGVuZC50dl9zZWMgLSBzdGFydC50dl9zZWMgPCAy
KTsNCj4gKw0KPiArCQkJCXNoYXJlZFtjaGlsZF0gPSBjb3VudCAvIGVsYXBzZWQoJnN0YXJ0LCAm
ZW5kKTsNCj4gKwkJCX0NCj4gKwkJCWlndF93YWl0Y2hpbGRyZW4oKTsNCj4gKw0KPiArCQkJZm9y
IChpbnQgY2hpbGQgPSAwOyBjaGlsZCA8IG5jcHVzOyBjaGlsZCsrKQ0KPiArCQkJCXNoYXJlZFtu
Y3B1c10gKz0gc2hhcmVkW2NoaWxkXTsNCj4gKw0KPiArCQkJcHJpbnRmKCIlNy4zZlxuIiwgc2hh
cmVkW25jcHVzXSk7DQo+ICsJCX0NCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4g
LS0NCj4gMi4zNC4xDQoNCg==
