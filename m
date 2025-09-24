Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C70BCAC5A5
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 12:39:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE7510E724;
	Wed, 24 Sep 2025 12:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E/QPAzOh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF7110E721
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 12:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758717551; x=1790253551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cdvp7KYzZHWt1Vcx+O81gg4IZBVJlkSb23WEN5+/cMs=;
 b=E/QPAzOhF8jn0XqhGQBt5TLM7wjn2Sfde8cJUurKJvXrvt9s5ucl5epn
 jbmdN0G9G7nqhCA9Zxk5H+wJtJB790SMZYgphmSxnLCM7s6Lyas6GH6j5
 YJnuu3faxwLx2yQYg+XR2fHuzRNSQs+DQ7ztrhxuFJvJl5XIia6hNSKF6
 M/LeY06js61vOuyn//zLsrcg07X2L5yfI50aNa71SOvkRODW6WGaQGgLj
 dk7a9jwanR4D++3H+FKRDAcIkrk+3yr19/0QN4vK1kg7Zt7knsQoZx/L/
 axDkSeLEYO4okoG51qVYx3DBz6e0DUMI5zTt4bSEuTHUrc6XEkYCVtav9 w==;
X-CSE-ConnectionGUID: DByqVvaPRauDyqVSlZjwEg==
X-CSE-MsgGUID: aEuwTnqiRPW5wlvJK3TL+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="61181783"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="61181783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:39:10 -0700
X-CSE-ConnectionGUID: r2+yqqWNSQuPrw5TK1WohQ==
X-CSE-MsgGUID: Ey2ukue4QYeA4vppdMcdRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="182302594"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 05:39:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 24 Sep 2025 05:39:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 24 Sep 2025 05:39:08 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 24 Sep 2025 05:39:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBbShCp6cmi7EiqllYP2wkLzZoId0bCzvTl+8pUW6ywkX6UnPxMdd9VTkC3tvIpd8joXm/BIR70B4KWiH3FFsiijRMMlAaRjRJ+04S9CoSGpNssnpdNmcYELi9GookH50Y6atpfdxvaZQAsTSZM1q9f5yDzD0Rks/lf/2AcAp0kYglKUjpdewwvcNyA6f7wpuhIUIgAhXydwd+gFEQQMQRVHyZuZrKXV2kHbxF5xRl5bo9No1tU67svTD0dgaqOgGgLtfhYE4G/LbmGWLcnEs65Jgo0TiX206B45PfNxq5rNhXb/odQBpcFApKnBpziE3985gRmv7JUcNUBoR5R9pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cdvp7KYzZHWt1Vcx+O81gg4IZBVJlkSb23WEN5+/cMs=;
 b=RWWPjI93jvKBNXXH3pXtD0sOxSvkwlVQ7nxAfDjBr7/fykfUSIV64TAC8woYvX410j8gHa5en0H83AyH/Yqnzt/x1oBZzKg4LfzxqL+O+DEfuWjmmsBZy59U35PloSzLQmIEmrnW8kJjG/2mZRSQ4cIDjIkeIoijWPAL/ho8jzzOkOvGZ49P3hesBTv3BX6R1djNxZ8APF5IYTUdpYCRFCVRK6iELW1J/c7ape4AYHVET673fRy9hMGAlEpLKwLNwiJZSe2mS/V8qKiv3bDaQovzoK/fFjExMOKDiSYmhqAIWfyKodKWnclmfnUJvjrbNfME5cV6VyFal2zf0l7nig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Wed, 24 Sep
 2025 12:39:00 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 12:38:59 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>
Subject: RE: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Thread-Topic: [PATCH v4 i-g-t 4/6] lib/xe_eudebug: Improve SIGINT handling
Thread-Index: AQHcLItvYfuCcpqc+EKFz3IHwUZm77SiN42AgAAH1MA=
Date: Wed, 24 Sep 2025 12:38:59 +0000
Message-ID: <DS0PR11MB7264F93764F29BBDCCCBA17DD91CA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250923131002.24708-1-dominik.karol.piatkowski@intel.com>
 <20250923131002.24708-5-dominik.karol.piatkowski@intel.com>
 <411a13c9-cb01-4d30-aad7-970497b3e571@intel.com>
In-Reply-To: <411a13c9-cb01-4d30-aad7-970497b3e571@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MN2PR11MB4760:EE_
x-ms-office365-filtering-correlation-id: bdb0fece-63b7-4b21-66ae-08ddfb6755ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UHY3MFVjQnFpVTNmbDhRWG1nVDdWZGR6ZGdUbFZvbmVtS0VMUjYyeWZDR0ZN?=
 =?utf-8?B?L09DNEJNR0RQMVpMUzQ2WDBuaGlmaVFvMzVJYSs1SFhRcldTMUZtQkRYdTNK?=
 =?utf-8?B?NDJFazBSY0J0NUtFeitKWmY4d0lQTUc2T3l3Slh3dEtSTXVQanJKcDNJTmk4?=
 =?utf-8?B?dHZUNVc3M1NrV0JGaGJaaGI5MzY5KzE4QnlkTXlNckFzV00rbDZlUVgzbkRh?=
 =?utf-8?B?MlZLUjB1TUorTkVtODNlUWE0aEJRMGpkRyswUjkzQWFjQ0JXZUJyNWgzdGRU?=
 =?utf-8?B?dUo2SzJuMUxsYzVNVmVEMEdvRTFFY0Z6K2xJWExGU3Q2cUxIazFYZVBNYXFi?=
 =?utf-8?B?aDJKU1FlcTFObUVpODNJaUw2RTU3SUNXc3VFbnAzRVBqODVnQW1qUCtYNVJX?=
 =?utf-8?B?NGJuOUh4LzJyeWJuVjJ1VVNPK3ZtUFhJNGQxTGw0OWp1eWFacFNJdTlZUFlx?=
 =?utf-8?B?SkZ0a0dabWxHaUxuZ2lndmlVUC92aFVoQkVOaEMwVDd0SnBNRDYxQnpCcGdx?=
 =?utf-8?B?dHIvSUpqSFJjMWVUVk5qUUtOdFFPWWF1bVdGUStwbitGNW5EbFJEc3o2WHRJ?=
 =?utf-8?B?cC85eVBqMEdEZHltQ0NRZTQyamwvMXRTQU4rT2FQcjZJWGNNc0pzQXNNd1hW?=
 =?utf-8?B?ajNvL1Avd1YvcldTdG1YZDgzNjBEZXZMZTJTZGlRL2tiV0FwKzFsZVIvVG5F?=
 =?utf-8?B?Y1pZVmtQd0VWNDZrQzh0ditrbDlwY05rVWl3VTl6cy96cXRzNGowNmJ3RjdH?=
 =?utf-8?B?OXdOOHdRY1Z0aUZuaUpHOHJhWnZrOXBGTTV0T2tsMG8xNmZRa01VbzAvMVJN?=
 =?utf-8?B?Q3pkWmFvN0VKR2FvZzhXdEQzRFpvVmo3WVZMeFN4YlpvenF3TENEYXFlNklz?=
 =?utf-8?B?bkllZ1UvNTNRWVZjUThLaUY0RzhXSUFHOXdPd2RCRVlKaDhFcU9JcDJWNFZZ?=
 =?utf-8?B?b1RSU2s0bWtSNzVSdzUwU0hUWXRkQjZNdHFXY2dMYjBRbU1RMC85R3dTdmhZ?=
 =?utf-8?B?a2ZmaHlrcWx0MitJR212YUJrL1ArQlBWY0J5TllMcHZRdWZwZjNYQ01yRjE1?=
 =?utf-8?B?Q3BZVmxoWkR4WWZEVFh2ejROQlpJUVdjTFA3V0w3TnNBa1dsZHdyMUJ5bGNu?=
 =?utf-8?B?RGk1YzczZVBQTWNSZG4vRExYOHIyRXZscngvZ2huamx6eXdPd1pzaDhESFFY?=
 =?utf-8?B?WnNJWHlpcHRJdmQ0cTFvTmpJckxVeE5PdDIyY2RpMkpsS1BxRk1XSFhGamR2?=
 =?utf-8?B?a05jV09GbnF1U0wxVHFJQkVpUkVSaStrRGJnTExteXkvMmJUT1IyWWlsSE5k?=
 =?utf-8?B?aWdpaDg1YWxxTlJHb2EvcGVzTlI0T3VxMThvNVZGc2l6emlCL0RtQmFQMmZT?=
 =?utf-8?B?S3F0WWlseitEcGNwWWk1aVhRdy9jd2tQK29LajY4OFEwOElVNzNXN0dYV1N6?=
 =?utf-8?B?Snh2YTFIaDVKR1JNeHFxdkc0TUREOUoxR3pTQ0FxRGJYSTh3SlFnM1ZRdjZl?=
 =?utf-8?B?bHJtbmdaQWQ2OU5XOGtud3VudmhjSE4yZG5Wb0s2WGo0UG5uSlRMWnRaK3hO?=
 =?utf-8?B?TTZpNVVDMXJ5TzlRcTdvd3o2cVlrV3dpM3kzQTB3cTJPb1ZQZnoyaU1iejZ0?=
 =?utf-8?B?aVQrb25RWlBsY3VHcHYxa3hkQnFFUk5POEE0VzJJejBqajNkcmt3T3k2R2dk?=
 =?utf-8?B?Z0MxSjB5Vy9ib2J5RDZNOXpRT2pyelJYZXpiS1NpamlNMnhXWURwaDFmL0Nr?=
 =?utf-8?B?YjhaSHV2aFNBUGRZNGFmUEZZT0tINGNlK280ZjV3aTcyQzZnTEVZUW9ab1BV?=
 =?utf-8?B?WHNJYjU2SGEyL09JQzE4WWpNUHpPTk01OU5JSmNnNHpaVkY2ekt3OXNUck5H?=
 =?utf-8?B?UUI4cnI4NzBUeVJkWEQzM2hSVDlkMGJnbzlwVndIdjRkSWRnbkhQczBmS2Jj?=
 =?utf-8?B?T2xBdUwyVEtQMHJ0b0tmS0RObTdlOFRRWU44c3VUNHJwa3c1Mm95Q0JIalZj?=
 =?utf-8?B?L3VIQy8zMlFnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RFRqZ3lPWnVmWWlFYmoxQzRIOS80UTNsdFpqbnZHa3ZBNXBpZGhIcGEraWpq?=
 =?utf-8?B?WXB5RTdpS25DTHhTbzhTTERLK1ZmWG9IekRVL2NnQkloZmEvV3laWmF0UnBK?=
 =?utf-8?B?QUxsVWhRbm50UldEcFg4MTRiakNYVCt2MzRPbTJmNmdrb0M3WU05Vzl4dTd4?=
 =?utf-8?B?WmdKVEJJaDRWaDZkUFJSeUFPQ1BLV0Z0aXUrRkJFTFRaZzBoMXR6Y2dSR0RP?=
 =?utf-8?B?TzdPd2lkRnJRRmlyMGpyR1dRQjhLNjhVaXhoYlVjR0Y1RVUxdnIzZHEzeUdy?=
 =?utf-8?B?VUhpRjJDTFIvSEVRNzYvRXpQbkJlT1Z0SlEwb3J3Uis0SlBSS2pLc3Rtb0dE?=
 =?utf-8?B?bWxXY0dMQk51R3RaVTViM1AxY0Y1blRIVi9pbnRrT254YzJhNXh6WTMxd2U4?=
 =?utf-8?B?TVZxdFowS3FzTlVwMi93QU5KN2FTMThmY01SVytPSmFFMWw2bDY5OGRQNVJp?=
 =?utf-8?B?UmU4S3kwMjZoRjdWaTYxNGRFK0xXVDlETTRYOGhNVWo1YTBrTzl3OTRGRnN1?=
 =?utf-8?B?NjVrRFVMKzhDUGw5OGtZOWdqZEp0Zmpmb1B3MHVvMHY1QjFXODREeCtmdjFV?=
 =?utf-8?B?RnpVVHBCTXNQNUxwdjJ2cUJST2hJOGdzeU4za29VUS9DeGtZVE9TSlZ0Zjhk?=
 =?utf-8?B?M1lHRDViUDFFdjR3Vlh3WUpYUnA4Z1M3UVdYWVYxb3BYWndKVHVpc0lXNlZ1?=
 =?utf-8?B?L1dKVnlieExEV0FFbkE0eGpGamZIN0tESVhMbFptaXNTajVvOTdyUmtTdE1a?=
 =?utf-8?B?ZTEwMUFBT29WSXNOV1VZaGowR1JGTUYrbVRNaUJnU3QxZDBWaTJuT2EvL29U?=
 =?utf-8?B?ekVkQ1pldzBodUFNZTBBUThyanhsWDJ2bk12Z01BS3pJN2UyelNyQVY1ZEFq?=
 =?utf-8?B?eTBNOHJWRmVqREljbVAyZ21YcHFOUlIyejNQdVhTc3NYdFlFRXNHRGp1cks2?=
 =?utf-8?B?NlRtZ2daSEZ5NS92WkhXSG94dmc3Q1VkRVVaLytFUEpJL2lTUGcrc2x4Z2pm?=
 =?utf-8?B?TVc4R2RtNThsbmFmanJ0dTNISmdMZ0tNdDFBOE50dlNLN3hsL1JKYWhEU0xy?=
 =?utf-8?B?OXRUUFJKaVNJd1Bob292QUFOYWlXUXZ3SFJMbFFwVUh3dEpZU2s2UGxOMzhI?=
 =?utf-8?B?bzFUVEhLWDlSeEtvMjczUE1rRWxQUVhSMlNrNmk0WVFycjZnbzN6QjMyL3VG?=
 =?utf-8?B?OW1aMHg5UnppTkU5VlZQRlAxMUlZR2ZVa04xVGR2OWFtOTJSQWdPT0xmRWlP?=
 =?utf-8?B?WXB4TVFRSFVkcEVldGhLTFlvdFZGaUR2RlI4b0FLa2hoYStzbnBONzY3eEtZ?=
 =?utf-8?B?WVpIaGJldEo0WlcxRUw1UmVKZzdMcWZ2U3pVb2w4M0ZMdHlRN1FrWS9SR25v?=
 =?utf-8?B?U1hPR0JYbVpCSFhkaTAwQmJhVXAyS3NHOVFzU3hqZnlQcFVGUHJMcnEzOEho?=
 =?utf-8?B?bXJ4N0RyaUE3M0VlSGcxRyswT0M1V1crNHExV2dzTVR5SkJkWVFwMjJXNi94?=
 =?utf-8?B?cHZBUkJEYlFxT1VoRDlvZllPck8xUjZ6OUgzSjRKdGw4d0Nkbm0yWngwZWdk?=
 =?utf-8?B?eDRHMk1iTlRiOVN4NzUwd21LZnJuSnl6OU9SZHEyYlRqdmRPUGFiRHk0SnNX?=
 =?utf-8?B?TVNHZG9ZbE9PTnA1STVEMVhXMU55WUcwUk5IVXR1QW9sdHkxbGpqOE9wN2Fh?=
 =?utf-8?B?a0xJOVZHeGNFRDFuMHdqYkNOdlpGYmkwQmFOSFhoN2Y1cTJFWkJSRTVpdDVM?=
 =?utf-8?B?c1BxdjdkK2VLV3RScjFiMVArZ3loSU9QQWJlVm9WclF0dFAzYTFnekZ1NjFQ?=
 =?utf-8?B?aTFmbmNZQUsxM3JjQ3lnWElIKzBhbkFGdVUwNzkzOEpXK3M0eFFicG9hbXJD?=
 =?utf-8?B?WEhXd2lGUmk4VEtVSk5DY1hQckxzaUJtVURvY3RnZjJoVmgvald0UmJvWkE1?=
 =?utf-8?B?TjhBc0JncElvNW9haktJYXJuckc2MW82V0YxMnVRbXQ5K3VOM045QnJvSVF5?=
 =?utf-8?B?UjJVVFBSLzYyd0Y1eEppNmduL0Z1ejl6b0NOUUNteVQ1L0JWVmp2S2pCVFN5?=
 =?utf-8?B?MnlmaWxzYWxYRDVHLzJ6ak9ZWE9ManVsTjBZem9KSHN0YkROUnR1dGF3NmN3?=
 =?utf-8?B?Zmx0SE8wRzZvakpTbGEybFc3YnpZbURkR1M1VzFHVXIvbmJMMVhDNWt0RGVO?=
 =?utf-8?B?dUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb0fece-63b7-4b21-66ae-08ddfb6755ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 12:38:59.6865 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h74n4UE1VpIYFfrPUWd2VMidW1iBMOyRJMFq7pwQIDJD04wVzDFF8wHQLGViqixmpIWvWrdzghA+smdESHacoQ9osUvkZNAdiUKXDsQGCkLIIsgEGpYKs+LkxzhnUT3P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
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

SGkgQ2hyaXN0b3BoLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1h
bnN6ZXdza2ksIENocmlzdG9waCA8Y2hyaXN0b3BoLm1hbnN6ZXdza2lAaW50ZWwuY29tPg0KPiBT
ZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAyNCwgMjAyNSAxOjQzIFBNDQo+IFRvOiBQaWF0a293
c2tpLCBEb21pbmlrIEthcm9sIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPjsg
aWd0LQ0KPiBkZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLZW1wY3p5bnNraSwgWmJp
Z25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IE1pa2ENCj4gS3VvcHBhbGEg
PG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0
IGktZy10IDQvNl0gbGliL3hlX2V1ZGVidWc6IEltcHJvdmUgU0lHSU5UIGhhbmRsaW5nDQo+IA0K
PiBIaSBEb21pbmlrLA0KPiANCj4gT24gMjMuMDkuMjAyNSAxNToxMCwgRG9taW5payBLYXJvbCBQ
acSFdGtvd3NraSB3cm90ZToNCj4gPiBSZXdyaXRlIFNJR0lOVCBzaWduYWwgaGFuZGxlciB0byB0
b2dnbGUgYSB2YXJpYWJsZSBpbnN0ZWFkIG9mIGNhbGxpbmcNCj4gPiBwdGhyZWFkX2V4aXQgaW5z
dGFudGx5LCBhcyB0aGUgdGhyZWFkIGNvdWxkIGJlIGluIGNyaXRpY2FsIHNlY3Rpb24sDQo+ID4g
Y2F1c2luZyBhIGRlYWRsb2NrIG9uIHRoZSBhdHRlbXB0IG9mIG5leHQgZW50cnkgaW50byB0aGF0
IGNyaXRpY2FsDQo+ID4gc2VjdGlvbi4NCj4gPg0KPiA+IEludHJvZHVjZSByZWNlaXZlZF9zaWdu
YWwsIHJlY2VpdmVkX3NpZ2ludCBhbmQgaGFuZGxlZF9zaWdpbnQgdmFyaWFibGVzDQo+ID4gdG8g
aGVscCB3aXRoIGNvb3JkaW5hdGlvbiBvZiBoYW5kbGluZyBTSUdJTlQgYW5kIG90aGVyIHNpZ25h
bHMuDQo+ID4NCj4gPiBVc2UgdGhlIHJlY2VpdmVkX3NpZ2ludCB2YXJpYWJsZSBpbiBkZWJ1Z2dl
cl93b3JrZXJfbG9vcCB0byBzYWZlbHkga2lsbA0KPiA+IHRoZSB0aHJlYWQsIHNldCBoYW5kbGVk
X3NpZ2ludCB0byBoZWxwIHdpdGggY29vcmRpbmF0aW9uIG91dHNpZGUgdGhlDQo+ID4gZGVidWdn
ZXIgbG9vcC4NCj4gPg0KPiA+IFJlbmFtZSB0ZXJtaW5hdGVfZGVidWdnZXIgdG8gZGVidWdnZXJf
c2lnbmFsX2hhbmRsZXIgdG8gZGVzY3JpYmUgaXRzDQo+ID4gbmV3IGZ1bmN0aW9uIGJldHRlci4g
QWRkIFNJR1RFUk0gdG8gc2lnbmFscyB0aGF0IGFyZSBoYW5kbGVkIGJ5DQo+ID4gZGVidWdnZXJf
c2lnbmFsX2hhbmRsZXIuDQo+ID4NCj4gPiBEb24ndCBraWxsIGRlYnVnZ2VyIHRocmVhZCBvbiBu
b24tU0lHSU5UIHNpZ25hbHMuIERvbid0IGJyZWFrIG9uIHBvbGwNCj4gPiBmYWlsdXJlIGlmIHNp
Z25hbCB3YXMgcmVjZWl2ZWQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlrIEthcm9s
IFBpxIV0a293c2tpDQo+IDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0KPiA+
IC0tLQ0KPiA+ICAgbGliL3hlL3hlX2V1ZGVidWcuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KystLS0tDQo+ID4gICBsaWIveGUveGVfZXVkZWJ1Zy5oIHwgIDQgKysrKw0KPiA+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlm
ZiAtLWdpdCBhL2xpYi94ZS94ZV9ldWRlYnVnLmMgYi9saWIveGUveGVfZXVkZWJ1Zy5jDQo+ID4g
aW5kZXggZGVhZWEyNWNkLi42NDdkYTdiMzIgMTAwNjQ0DQo+ID4gLS0tIGEvbGliL3hlL3hlX2V1
ZGVidWcuYw0KPiA+ICsrKyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gPiBAQCAtMTA3Miw5ICsx
MDcyLDE0IEBAIHhlX2V1ZGVidWdfcmVhZF9ldmVudChpbnQgZmQsIHN0cnVjdA0KPiBkcm1feGVf
ZXVkZWJ1Z19ldmVudCAqZXZlbnQpDQo+ID4gICAJcmV0dXJuIHJldDsNCj4gPiAgIH0NCj4gPg0K
PiA+IC1zdGF0aWMgdm9pZCB0ZXJtaW5hdGVfZGVidWdnZXIoaW50IHNpZykNCj4gPiArc3RhdGlj
IHZvaWQgZGVidWdnZXJfc2lnbmFsX2hhbmRsZXIoaW50IHNpZywgc2lnaW5mb190ICppbmZvLCB2
b2lkICpjb250ZXh0KQ0KPiA+ICAgew0KPiA+IC0JcHRocmVhZF9leGl0KE5VTEwpOw0KPiA+ICsJ
c3RydWN0IHhlX2V1ZGVidWdfZGVidWdnZXIgKmQgPSBpbmZvLT5zaV9wdHI7DQo+ID4gKw0KPiA+
ICsJZC0+cmVjZWl2ZWRfc2lnbmFsID0gdHJ1ZTsNCj4gDQo+IElmIEkgdW5kZXJzdGFuZCBjb3Jy
ZWN0bHksIHdpdGhvdXQgdGhlIHR3byBjb21taXRzIHRoYXQgZm9sbG93LCB0aGlzIGlzDQo+IGEg
TlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLiBCdXQgZXZlbiBhZnRlciBjb21iaW5pbmcgdGhvc2Ug
Y29tbWl0cywNCj4gd29uJ3QgdGhpcyBjYXVzZSBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBp
ZiBhIElHVCB1c2VyIHByZXNzZXMgJ0NUUkwtQyc/DQoNClRydWUsIHdpdGhvdXQgdGhlc2UgY29t
bWl0cyBpdCBpcyBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZS4NCg0KUmVnYXJkaW5nIHRoZSBj
dHJsLUMgcHJlc3NlZCBieSBJR1QgdXNlciAtIEkganVzdCBjaGVja2VkIGFuZCBpbmRlZWQgaXQg
d2lsbA0KY2F1c2UgYSBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UuIEkgY2FuIGFkZCB0aGUgY2hl
Y2sgZm9yIHRoYXQsIGJ1dCB0aGUNCnF1ZXN0aW9uIGlzIGlmIHRoaXMgaXMgYSBzY2VuYXJpbyB3
ZSBuZWVkIHRvIGRlZmVuZCBmcm9tLiBJZiB5ZXMgLSBJJ2xsDQpoYXBwaWx5IGFkZCBzdWNoIGNo
ZWNrLg0KDQo+ID4gKw0KPiA+ICsJaWYgKHNpZyA9PSBTSUdJTlQpDQo+ID4gKwkJZC0+cmVjZWl2
ZWRfc2lnaW50ID0gdHJ1ZTsNCj4gPiAgIH0NCj4gPg0KPiA+ICAgc3RhdGljIHZvaWQgKmRlYnVn
Z2VyX3dvcmtlcl9sb29wKHZvaWQgKmRhdGEpDQo+ID4gQEAgLTEwOTIsMTQgKzEwOTcsMjQgQEAg
c3RhdGljIHZvaWQgKmRlYnVnZ2VyX3dvcmtlcl9sb29wKHZvaWQNCj4gKmRhdGEpDQo+ID4gICAJ
aWd0X2Fzc2VydChkLT5tYXN0ZXJfZmQgPj0gMCk7DQo+ID4NCj4gPiAgIAlpZ3RfYXNzZXJ0X2Vx
KHNpZ2FjdGlvbihTSUdJTlQsIE5VTEwsICZzYSksIDApOw0KPiA+IC0Jc2Euc2FfaGFuZGxlciA9
IHRlcm1pbmF0ZV9kZWJ1Z2dlcjsNCj4gPiArCXNhLnNhX3NpZ2FjdGlvbiA9IGRlYnVnZ2VyX3Np
Z25hbF9oYW5kbGVyOw0KPiA+ICsJc2Euc2FfZmxhZ3MgfD0gU0FfU0lHSU5GTzsNCj4gPiAgIAlp
Z3RfYXNzZXJ0X2VxKHNpZ2FjdGlvbihTSUdJTlQsICZzYSwgTlVMTCksIDApOw0KPiA+DQo+ID4g
KwlpZ3RfYXNzZXJ0X2VxKHNpZ2FjdGlvbihTSUdURVJNLCBOVUxMLCAmc2EpLCAwKTsNCj4gPiAr
CXNhLnNhX3NpZ2FjdGlvbiA9IGRlYnVnZ2VyX3NpZ25hbF9oYW5kbGVyOw0KPiA+ICsJc2Euc2Ff
ZmxhZ3MgfD0gU0FfU0lHSU5GTzsNCj4gPiArCWlndF9hc3NlcnRfZXEoc2lnYWN0aW9uKFNJR1RF
Uk0sICZzYSwgTlVMTCksIDApOw0KPiA+ICsNCj4gPiAgIAlkbyB7DQo+ID4gICAJCXAuZmQgPSBk
LT5mZDsNCj4gPiAgIAkJcmV0ID0gcG9sbCgmcCwgMSwgdGltZW91dF9tcyk7DQo+ID4gKwkJaWYg
KGQtPnJlY2VpdmVkX3NpZ2ludCkgew0KPiA+ICsJCQlkLT5oYW5kbGVkX3NpZ2ludCA9IHRydWU7
DQo+ID4gKwkJCXB0aHJlYWRfZXhpdChOVUxMKTsNCj4gPiArCQl9DQo+ID4NCj4gPiAtCQlpZiAo
cmV0ID09IC0xKSB7DQo+ID4gKwkJaWYgKCFkLT5yZWNlaXZlZF9zaWduYWwgJiYgcmV0ID09IC0x
KSB7DQo+IA0KPiBJIGFtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGF0IHRoZSBTSUdURVJNIGhh
bmRsaW5nIGlzIHN1cHBvc2VkIHRvDQo+IGluZmx1ZW5jZSBoZXJlPyBGcm9tIHBhdGNoIDYvNiBJ
IGdhdGhlciB0aGF0IGl0IGlzIHN1cHBvc2VkIHRvIG1heGltaXplDQo+IHRoZSBjaGFuY2Ugb2Yg
aGl0dGluZyB0aGUgcmVhZCBJT0NUTCBidXQgSSBkb24ndCBzZWUgaG93Lg0KDQpUaGUgU0lHVEVS
TSBoYW5kbGluZyBoZXJlIGlzIHN0b3BwaW5nIHRoZSBsb29wIGZyb20gYnJlYWtpbmcgYW5kIGJl
aW5nIHVuYWJsZQ0KdG8gcmVhY2ggYGlmIChkLT5yZWNlaXZlZF9zaWdpbnQpYC4gSSdsbCBzaG9y
dGx5IHNlbmQgYSB2NSB0aGF0IGhhcyB0aGlzIHBhcnQNCmEgYml0IGltcHJvdmVkIGZyb20gWmJp
Z25pZXcncyBzdWdnZXN0aW9ucy4NCg0KVGhhbmtzLA0KRG9taW5payBLYXJvbA0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiBDaHJpc3RvcGgNCj4gDQo+IA0KPiA+ICAgCQkJaWd0X2luZm8oInBvbGwgZmFp
bGVkIHdpdGggZXJybm8gJWRcbiIsIGVycm5vKTsNCj4gPiAgIAkJCWJyZWFrOw0KPiA+ICAgCQl9
DQo+ID4gQEAgLTExNjgsNiArMTE4Myw5IEBAIHhlX2V1ZGVidWdfZGVidWdnZXJfY3JlYXRlKGlu
dCBtYXN0ZXJfZmQsDQo+IHVpbnQ2NF90IGZsYWdzLCB2b2lkICpkYXRhKQ0KPiA+ICAgCWQtPmZk
ID0gLTE7DQo+ID4gICAJZC0+bWFzdGVyX2ZkID0gbWFzdGVyX2ZkOw0KPiA+ICAgCWQtPnB0ciA9
IGRhdGE7DQo+ID4gKwlkLT5yZWNlaXZlZF9zaWduYWwgPSBmYWxzZTsNCj4gPiArCWQtPnJlY2Vp
dmVkX3NpZ2ludCA9IGZhbHNlOw0KPiA+ICsJZC0+aGFuZGxlZF9zaWdpbnQgPSBmYWxzZTsNCj4g
Pg0KPiA+ICAgCXJldHVybiBkOw0KPiA+ICAgfQ0KPiA+IGRpZmYgLS1naXQgYS9saWIveGUveGVf
ZXVkZWJ1Zy5oIGIvbGliL3hlL3hlX2V1ZGVidWcuaA0KPiA+IGluZGV4IDhmN2Y2NjIyMC4uNDZj
ZDM0NjNlIDEwMDY0NA0KPiA+IC0tLSBhL2xpYi94ZS94ZV9ldWRlYnVnLmgNCj4gPiArKysgYi9s
aWIveGUveGVfZXVkZWJ1Zy5oDQo+ID4gQEAgLTQ0LDYgKzQ0LDEwIEBAIHN0cnVjdCB4ZV9ldWRl
YnVnX2RlYnVnZ2VyIHsNCj4gPiAgIAlwdGhyZWFkX3Qgd29ya2VyX3RocmVhZDsNCj4gPiAgIAll
bnVtIHhlX2V1ZGVidWdfZGVidWdnZXJfd29ya2VyX3N0YXRlIHdvcmtlcl9zdGF0ZTsNCj4gPg0K
PiA+ICsJYm9vbCByZWNlaXZlZF9zaWduYWw7DQo+ID4gKwlib29sIHJlY2VpdmVkX3NpZ2ludDsN
Cj4gPiArCWJvb2wgaGFuZGxlZF9zaWdpbnQ7DQo+ID4gKw0KPiA+ICAgCWludCBwX2NsaWVudFsy
XTsNCj4gPiAgIH07DQo+ID4NCg0K
