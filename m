Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D812DEE4990
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 10:53:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7922589A5C;
	Wed, 11 Sep 2024 10:53:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvkwoVUv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7970F89A5C
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726052031; x=1757588031;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y2O6hHl3HkWtWeCSOrxc0IA8q6opzKHWGb20QdPfWUo=;
 b=IvkwoVUvOBaTT37ShKJJWaAKb+nki8mOLb9IuahUrmaq4DVpaRCqLGLT
 0VQ8pkbTwOtwRRauOw34V1JkcbiZjv+77IVsHHfHOWL+UdYKfXC8FkQ9W
 R30B7L8YGoQNJ+/gsyonklEyDvbB0DAa3DcC1EbLIHxQ/o9MBCw6hgjuN
 11POztQMRsF61pt86nt/YIcAjYRUSII2kEJ47v9tcnbx4K9J+NYirzZ/N
 KpKNObk15x6oosaCKRprIpA2YqbhSgsWc694HuQLd5tIGQcBAilL+q1eP
 ujthQnoElrSqmoylr/OzK5aA7DKomrnNxsVSSmSmalqe4gVhjuIIdcDpg g==;
X-CSE-ConnectionGUID: aEj/owwwSx6Dufx8UHh6Dg==
X-CSE-MsgGUID: /sI08qkZT7Sfb4OpKN2xDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24383381"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24383381"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 03:53:50 -0700
X-CSE-ConnectionGUID: aUVR0DFDQUe8dG3Xq2Y6kw==
X-CSE-MsgGUID: 6C2gkYmXQ8m1f3QdpTuMOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67281230"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 03:53:50 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 03:53:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 03:53:49 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 03:53:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kARRfuJfEd4yA/BV7x0UDO7Bi1RotKJvI2qem/B92+ils+M8NmyBuYFTyCyGtrOFPEzh4LrrXiS9QjKxO8oEHnO7bdtQoCOvRGH0N15b5K5FOj3Bl0IX/+lzL3hAmzorLMvmCIQkGNjJ2CQPf8fwji75EH/FaO0K0Gl+F8xRgqxt7709bZYo0rJRHBedrepjYgcyTIrI+nNZxwuyoB2sURLEhBkIS/C+8VE8x9vWfhVMKFITlmHoyydLCEwMEUKSmRJM/1kmI4K/mSZF7NbyYNQalhKWBF9AEtj/zvnhcGuFBlrP2yz6pO/SgnZ4sbz2dzjpcCEYq0h6WlR3dkaF7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2O6hHl3HkWtWeCSOrxc0IA8q6opzKHWGb20QdPfWUo=;
 b=pKONm6q00bvapxp7FGB7mdaPwjMI3CShar5Fj2mARhIaqbqiG6W1pr6ogmjm0yqluSYenjd4utCQ5qdunF8L7cKWcSeoATnITCCFVQQOyCUivbKgeAzQU8ojuady0QXqfCV7a5hg2ImfmgWGKlnIOu64RQ6yyqF0DMC+of+eYZi0JME4FAoMN+iOTB/V0Mm4Nv0NL1Vgi5TCAXcyWqtjANr1YUPp/qP9rmaGSLgymTnHwJ/qZQ/C27i7NAAdIqb/L9mpUgD1pnRf7KLXuz0Rl1SptoqM6p1lXUQAsBkuzpWsvgYquzJBIL/YY+pafJ/RLy5HKZeP9X3yA+mCBwydYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 11 Sep
 2024 10:53:47 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.7918.024; Wed, 11 Sep 2024
 10:53:46 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH i-g-t v2 2/5] tests/intel/kms_psr*: Add
 psr_sink_error_check to PSR tests
Thread-Topic: [PATCH i-g-t v2 2/5] tests/intel/kms_psr*: Add
 psr_sink_error_check to PSR tests
Thread-Index: AQHbBA6f5mNGtVrHpEWZvoaEj6/yRbJSY3vQ
Date: Wed, 11 Sep 2024 10:53:46 +0000
Message-ID: <PH0PR11MB4806273B9AF8BFB2EAAF02ABE49B2@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
 <20240911054958.1023925-3-jouni.hogander@intel.com>
In-Reply-To: <20240911054958.1023925-3-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|MW4PR11MB5935:EE_
x-ms-office365-filtering-correlation-id: faafa152-5221-4c80-c157-08dcd25002bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RmFZcG80QjdPZStKRTh3T3BBTVZmblNiNCs4NS8wTk1SQytLUlRiVGhiU0Rq?=
 =?utf-8?B?b1RlVnp6UGhQcXRmMEZPQWQ1ZGVmazQ5Y01ZTnlDbjc1SGFYNFJVcFZnWkh2?=
 =?utf-8?B?My80NnozMnRnR2hpalRxSFJjQjg3Z2J1bmVycWREL2F6UGF2a0hRWnlLYWdp?=
 =?utf-8?B?Rm5Sc1ZIbFMxQkJtakVmZ2NBeEExUXhtaGt4WWNmNFhHSzVnbTN1OFFJMXlT?=
 =?utf-8?B?THhqV0tCU1ErcTdHdWVyLzJFR0EwbEpkcmlPMXJFcnZZSTBZWDhFVU1PUHY0?=
 =?utf-8?B?dHZvSXBNNGVGVzVOeGVkbE5EcGp6eUE2bnZ4Rm9YZ1BpN3pSdEpzd21pTm5G?=
 =?utf-8?B?c1ROVHluZ1RvZkZta3B1NCtHOTFMQU02a1VLSXhaUGRQWGZjUHdKTk5iS1Vp?=
 =?utf-8?B?M25vY05Mc3FUWEprVnFNSDI5MDNYb0RKRFN5MmhrOHV0cncxVlJvTEd2aDVt?=
 =?utf-8?B?Y0lpYmsyR08rODVQOXFiWEVxclNUbGd2VWdKbU4rUUdLdmR5YjlBcWI0cmc5?=
 =?utf-8?B?ZENVckFSSTlPNVlWUG1rWFp6T0lYeXJrbWxveHpMbkJOY2E5RDAyNEhMbDJ5?=
 =?utf-8?B?Mm9TQXZ1MzR2bkpDamh3ZEN3U2N6MFZMeVphVUgzdlFLMm4rZlNWOVFNMUhB?=
 =?utf-8?B?Ny9VRXQvNVN1ZElUdTNOcHhuOHYwNmJtcWN2SWlvMkoxMXhydkVwZzUvWllu?=
 =?utf-8?B?VDlscEhzZTIxUG5pdDdHZXRtT1RxaUl6OUtSeGJGb0hOd0NwNzNiWlZ1N2hQ?=
 =?utf-8?B?d3lvV0pFUUhJOXdYeUJXQXp6OStxdDdzeXNVNk0wMERnRXFHQkcrb0RLYmMr?=
 =?utf-8?B?akJWaFY3TldyZkliTzIrSi9PYytYMW9wOTBkZGdFWjdsY2hjdFNWQWQraDUr?=
 =?utf-8?B?WXc3L1VKTzl4dXNoc3IyRHJEU25hUm42QVQ4M1dvNmw1YlZORUhaZGFPTlJB?=
 =?utf-8?B?Vjh5d1BNVURkaERnYmxNcTU0OE9Fb2ZuNkZDMDJ1cldXMnc1N0Y2U2ZYSC9w?=
 =?utf-8?B?ek1LTlpETnJjR3RFbDJQbXJaMTJwR1dWUi9XVWlubjdXRDlpeGtOSmN5OGU0?=
 =?utf-8?B?SDFyekdHU1J0Q1M0Vzh5VVdGbVF5Vy9SWSswbGZZV3BUa2NtQStkVzFqNkJk?=
 =?utf-8?B?ekVpSDRldDVFY1JCYlRnRmtCL2hzbG4xYlc4K21udEdWd2NaTS9rU3gwcFlr?=
 =?utf-8?B?UzljYVc2SjZPdVQ0b3lJRDhGRzhjYmZtU0syVnNxc0ZnU0V2ZDZSQUt2dGN0?=
 =?utf-8?B?cXRLRmtndVp0Rm5rYlJheGUxSDZPVUs1bG9vZVhwVE83R1FQeHZySWN0bDNv?=
 =?utf-8?B?eDIybm5Pc3FHeHRJZjBJdDdVVktaUTNGV3dSZEQ0SkVJWU9qREN6ZHVzWXZ3?=
 =?utf-8?B?NXJPeTZNOUNKYjUxemdQeHFUamtOMUZCRzBEc0tXRDd4MXd4WHpwRStPTE1Y?=
 =?utf-8?B?L3lMbHBUZzB4a203TytnR3ZQRkdTMit4dHBXeHhPZTZHSUdTSWhKcDJ5dXFj?=
 =?utf-8?B?NjdMc1d3MXh5NmNkUk1mNDlBamlmVmkxY0pJeCtwSHdiRlh1bmRpVnZIclNQ?=
 =?utf-8?B?UGtHN1dPSjE0eDk5MEF3WWNLWktDMDUxZEJaRDJzV1g3RkZMU3B4TlJucWhP?=
 =?utf-8?B?OXE0dnhQS2xRYmh0ZWFEN001Skx2SDVjcjZaaFlpYVNMY0FuZzNRSzVWaGRR?=
 =?utf-8?B?cXdyUVZCRjRjeEQvYVhyejJnK3ZPZkhxUzFWUExYd0NCWGlIZ1NFdVJyS0pE?=
 =?utf-8?B?cUJ3bnhxejRYUmhxdjRWREVZNEpITzlMOWJNYmo5Zk5UelJ1TTZVUkxlL0Zz?=
 =?utf-8?B?TUZNZFMxRkdRTXhTdDZJLy9tMFpKbFF1SXN5dExiNUhyVTdhVDZUU1JraUQ2?=
 =?utf-8?B?V3JUQVUremVnb2d5N0J4Y2xjdTNPb0ZOVHFuKzNhYjhhb0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UDk0SldoWEFBWEFTbFhJZXJtdUZ5UXlyVm5sOEdqNmZLZlUzdzJXRWhjdFdh?=
 =?utf-8?B?ZFR5MUpOM2JqYk0xMTNJc01BZzI4OStLb2tTWlVVOFYvbWprM0IvZURWOGsx?=
 =?utf-8?B?T1NrdVRkRmM4eGZKNGE1UmhGcERmMnhZaUFBYnU5QS9udjUwSm1yYUpPcVBE?=
 =?utf-8?B?cFRQRkY2NjJxL29ZRWVHWXRoSUZQdGFuVllWYnFkT1N3cENoWjYra3UrTUZq?=
 =?utf-8?B?U0Y4OHNoano3TlRoV29HK1VJSFhyNlF5MExPYWlYWHhpUzlUb2hVZCsrdkZn?=
 =?utf-8?B?RVJ5aVZsdFVkUS9JcUpXblJ1cXFNazZreEtJNUc1cDRyR2crTUNuTEh1eGRn?=
 =?utf-8?B?UmVRZExGaW9LWmxrZERiUWZ6bExhdW41Y2RLOURnNWNQSFpKQzB4S1EyWW1w?=
 =?utf-8?B?S3ZuWjhQM2J5RXU3NW8yQkQrUXltN28zaFRlMlg3b0Q3TEk4N1NnL0oxU0h1?=
 =?utf-8?B?Mmx3UWhIK2ozUmRMeTFGNUQ0RWo0dUxQTzBIdXMrMThLU1AzNmp6L1JoeGRR?=
 =?utf-8?B?NGZWdXpiUGZiajFTWjhWN3Y1OTdFZEN2NTB5dStqSHJPdkd0R2xZQkgyRmFI?=
 =?utf-8?B?TTMvUVVrQjhOUFFzNnZYLzZOWDJwQXNkVVE4eUZ2WEpIdmU5YTNCMEVOaVRv?=
 =?utf-8?B?dndQaE9QM3IxVDE3eEY5aU90WGdrcjFOc3p1Q1ZweTh2ZllOWDMwY3lYRS8v?=
 =?utf-8?B?aTZrckJHWG5nVERZdUVSaWpKbUZoK2c2dHdMSWw4d28yWXZ4Y0FIcS9LTlZJ?=
 =?utf-8?B?aHIxcUlIVVlZejd5VEFwK050dndvN3pxYWc0ZFhlSHhkSitDcVZZN2ZQRDYy?=
 =?utf-8?B?dXJwdnA0cXFvSno2YlVFQ3JsKzBXU1ppc0tZVStZWG5JWVF4Q1crdkRSR0pU?=
 =?utf-8?B?cVRXbkJ4cEZIbklYK0hWOFhUcUE1WWJLMUQ0R1NzcHlIV0ZNWGQzVmtNSW5v?=
 =?utf-8?B?dDh0eTVTb2szSGIwV0hMSVM0NUtlam9tYTl5OE1lRFkvYXI3Vlg1czJlTU13?=
 =?utf-8?B?YlN4bE9OZWdIcDJNS2ZqT09XNXFKazVDcWExc1MyWE5rNW5FSVBjbFhsRm1V?=
 =?utf-8?B?S1JQUUg1UzVEWE1EbHJ0UWp0NitiVFByMkV5eXk0WFV3dkZDdmNDWWxMNDdH?=
 =?utf-8?B?NVpHQU4wVHhudC9IT1k1a015dFI0ejYzcmNzMTdzdi9XMWhIOGp3cWNWWXFW?=
 =?utf-8?B?endtdjNPVEdFZkg4STBLdUlJcUtOYWdRT3E1dUNrV0x6ZmVGT2ZWb3N3L1dk?=
 =?utf-8?B?MURLN0NmOHl4UVI5dkZicG4zZ1hZb1llb2pZZTJSKzBmWDBqTnBSMkcvUTdw?=
 =?utf-8?B?QVFMQTJOMWUwL2IzTDFkUEs4QnNkYVN3Z2RSQkJKK1I0SlVYTk1TeXlSVTBL?=
 =?utf-8?B?TUVyTDQ1RlhuV29FdXZUODdlMXQrd3dMeUIvdXB5RnByR2pxbjBWcm1qUitC?=
 =?utf-8?B?dEJBQ2grZC9WWUpzbXRGRzFkZnhWYys3M1dyUG42NXNrWmpJOTVUQkQ1ZGVY?=
 =?utf-8?B?MHdWYjN1WlZoT3U3ZjN6U3Y4bS9oMmR1NFZ0WmFQL0IxOSt4VVd1alJIcFo5?=
 =?utf-8?B?VlF5Wk5CVGliVkhKNTlndHVxQzFsa1pGMjhPajQ4eEVlaWZIYldCU0s4RGhm?=
 =?utf-8?B?TVNGNVBMelBtODVBZ3JQOTZjQ0syL2pla3VvaDYxY011czRUK2NNVTFuQXJ1?=
 =?utf-8?B?ZkZJL1dzTVRhcFNZRlFKcXhmSDIwOCt2d0hJN2ZHVGtKR0VZRVdIYlo0SWJF?=
 =?utf-8?B?UWRlNXFlbkEzbitWb1NsaDBBS0QrMnRQaE1EVEU2WXNlTDZpNGptaFl0RUQ5?=
 =?utf-8?B?UTQrWUFnTmFsZVJ0Ny9WZlE1bE9mSXduZkh0YThseUE0V3prb2lhOEFtOHF6?=
 =?utf-8?B?OTBNdWFpUURQTmZ6VjRrZHF2RU1rd0lPVHZGcTdZcHJIMFl5TWlWNUdNeitT?=
 =?utf-8?B?dm95RDhDR0lrMGxkemxnQUZJZytleHQrdDRCVW5YMnplaUttb0FTQ3c1L21a?=
 =?utf-8?B?SmVpY05LbDlSL2NBMlRSUFVZVzJsdVR2REhGTS9CMUk0WWNkL21RNlpva2N2?=
 =?utf-8?B?cDR4N1BvZnVGWHFUTXF3Z1JCS3ZNeEI4OWVyV3AxV2dsejFSQk4yemhwdEtM?=
 =?utf-8?B?cE9oSGJaNTNWTzcrb0ZtdHRCVXhGMzFkb3dhMGZKVDVBYkNHeGpuYjc1WmFZ?=
 =?utf-8?B?OWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faafa152-5221-4c80-c157-08dcd25002bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 10:53:46.4654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RulsOB0J+N/KFEjo3dYTMsu2LJi6mwsvXnDD/LvTpBsWOSLzAi2spqeaAUOg+lAaaQE/8wemdZJOFJ9hO3vHQZYGMxHTQG98sOHhXfGRIiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgSm91bmkgSMO2Z2FuZGVy
DQpTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxMSwgMjAyNCAxMToyMCBBTQ0KVG86IGlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogTmFsYWRhbGEsIFJhbWFuYWlkdSA8cmFtYW5h
aWR1Lm5hbGFkYWxhQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaSA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPg0KU3ViamVjdDogW1BBVENIIGktZy10IHYyIDIvNV0gdGVzdHMvaW50ZWwva21z
X3Bzcio6IEFkZCBwc3Jfc2lua19lcnJvcl9jaGVjayB0byBQU1IgdGVzdHMNCg0KQ3VycmVudGx5
IHdlIGFyZSBpZ25vcmluZyBwb3NzaWJsZSBlcnJvcnMgZGV0ZWN0ZWQgYnkgdGhlIHNpbmsgaW4g
b3VyIFBTUiB0ZXN0Y2FzZXMuIEZpeCB0aGlzIGJ5IGFkZCBwc3Jfc2lua19lcnJvcl9jaGVjayB0
byBlYWNoIG9mIHRoZW0uDQoNCnYyOiBzcGxpdCBrbXNfZmJ0IGFuZCBrbXNfcG1fZGMgdG8gc2Vw
YXJhdGUgcGF0Y2hlcw0KDQpTaWduZWQtb2ZmLWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhv
Z2FuZGVyQGludGVsLmNvbT4NCg0KTEdUTToNClJldmlld2VkLWJ5OiBNb2hhbW1lZCBUaGFzbGVl
bSA8bW9oYW1tZWQudGhhc2xlZW1AaW50ZWwuY29tPg0KLS0tDQogdGVzdHMvaW50ZWwva21zX3Bz
ci5jICAgICAgICAgICAgIHwgMiArKw0KIHRlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMgICAgICAg
ICB8IDIgKysNCiB0ZXN0cy9pbnRlbC9rbXNfcHNyMl9zdS5jICAgICAgICAgfCAyICsrDQogdGVz
dHMvaW50ZWwva21zX3Bzcl9zdHJlc3NfdGVzdC5jIHwgMSArDQogNCBmaWxlcyBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKykNCg0KZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL2ttc19wc3IuYyBiL3Rl
c3RzL2ludGVsL2ttc19wc3IuYyBpbmRleCBjZjBjZTRiYjguLjJiYWRlZWRkZCAxMDA2NDQNCi0t
LSBhL3Rlc3RzL2ludGVsL2ttc19wc3IuYw0KKysrIGIvdGVzdHMvaW50ZWwva21zX3Bzci5jDQpA
QCAtNjUwLDYgKzY1MCw4IEBAIHN0YXRpYyB2b2lkIHRlc3RfY2xlYW51cChkYXRhX3QgKmRhdGEp
ICB7DQogCWlndF9wbGFuZV90ICpwcmltYXJ5Ow0KIA0KKwlwc3Jfc2lua19lcnJvcl9jaGVjayhk
YXRhLT5kZWJ1Z2ZzX2ZkLCBkYXRhLT5vcF9wc3JfbW9kZSwgDQorZGF0YS0+b3V0cHV0KTsNCisN
CiAJaWd0X291dHB1dF9vdmVycmlkZV9tb2RlKGRhdGEtPm91dHB1dCwgTlVMTCk7DQogDQogCXBy
aW1hcnkgPSBpZ3Rfb3V0cHV0X2dldF9wbGFuZV90eXBlKGRhdGEtPm91dHB1dCwNCmRpZmYgLS1n
aXQgYS90ZXN0cy9pbnRlbC9rbXNfcHNyMl9zZi5jIGIvdGVzdHMvaW50ZWwva21zX3BzcjJfc2Yu
YyBpbmRleCAwM2ZmMWNkZGIuLmE5YmUxYTFlYyAxMDA2NDQNCi0tLSBhL3Rlc3RzL2ludGVsL2tt
c19wc3IyX3NmLmMNCisrKyBiL3Rlc3RzL2ludGVsL2ttc19wc3IyX3NmLmMNCkBAIC05NzIsNiAr
OTcyLDggQEAgc3RhdGljIHZvaWQgcnVuKGRhdGFfdCAqZGF0YSkNCiAJZGVmYXVsdDoNCiAJCWln
dF9hc3NlcnQoZmFsc2UpOw0KIAl9DQorDQorCXBzcl9zaW5rX2Vycm9yX2NoZWNrKGRhdGEtPmRl
YnVnZnNfZmQsIGRhdGEtPnBzcl9tb2RlLCBkYXRhLT5vdXRwdXQpOw0KIH0NCiANCiBzdGF0aWMg
dm9pZCBjbGVhbnVwKGRhdGFfdCAqZGF0YSkNCmRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9rbXNf
cHNyMl9zdS5jIGIvdGVzdHMvaW50ZWwva21zX3BzcjJfc3UuYyBpbmRleCA0MzdlZTM2ZjYuLjAw
OTlkYWYxZCAxMDA2NDQNCi0tLSBhL3Rlc3RzL2ludGVsL2ttc19wc3IyX3N1LmMNCisrKyBiL3Rl
c3RzL2ludGVsL2ttc19wc3IyX3N1LmMNCkBAIC0yNzMsNiArMjczLDggQEAgc3RhdGljIHZvaWQg
cnVuKGRhdGFfdCAqZGF0YSwgaWd0X291dHB1dF90ICpvdXRwdXQpDQogDQogCWlndF9hc3NlcnRf
ZihyZXN1bHQsDQogCQkgICAgICJObyBtYXRjaGluZyBzZWxlY3RpdmUgdXBkYXRlIGJsb2NrcyBy
ZWFkIGZyb20gZGVidWdmc1xuIik7DQorDQorCXBzcl9zaW5rX2Vycm9yX2NoZWNrKGRhdGEtPmRl
YnVnZnNfZmQsIFBTUl9NT0RFXzIsIG91dHB1dCk7DQogfQ0KIA0KIHN0YXRpYyB2b2lkIGNsZWFu
dXAoZGF0YV90ICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkgZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL2ttc19wc3Jfc3RyZXNzX3Rlc3QuYyBiL3Rlc3RzL2ludGVsL2ttc19wc3Jfc3RyZXNz
X3Rlc3QuYw0KaW5kZXggZDZlMjM0MGI4Li43M2E2ZWI1NmQgMTAwNjQ0DQotLS0gYS90ZXN0cy9p
bnRlbC9rbXNfcHNyX3N0cmVzc190ZXN0LmMNCisrKyBiL3Rlc3RzL2ludGVsL2ttc19wc3Jfc3Ry
ZXNzX3Rlc3QuYw0KQEAgLTM0NCw2ICszNDQsNyBAQCBzdGF0aWMgdm9pZCBydW4oZGF0YV90ICpk
YXRhKQ0KIA0KIAkvKiBDaGVjayBpZiBhZnRlciBhbGwgdGhpcyBzdHJlc3MgdGhlIFBTUiBpcyBz
dGlsbCBpbiB0aGUgc2FtZSBzdGF0ZSAqLw0KIAlpZ3RfYXNzZXJ0KHBzcl9nZXRfbW9kZShkYXRh
LT5kZWJ1Z2ZzX2ZkLCBOVUxMKSA9PSBkYXRhLT5pbml0aWFsX3N0YXRlKTsNCisJcHNyX3Npbmtf
ZXJyb3JfY2hlY2soZGF0YS0+ZGVidWdmc19mZCwgZGF0YS0+aW5pdGlhbF9zdGF0ZSwgDQorZGF0
YS0+b3V0cHV0KTsNCiB9DQogDQogaWd0X21haW4NCi0tDQoyLjM0LjENCg0K
