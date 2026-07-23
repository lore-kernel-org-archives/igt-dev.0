Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE4C531F9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 08:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACC310F2AF;
	Fri, 24 Jul 2026 08:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RouI0lpG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1C810F09F
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jul 2026 11:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784805667; x=1816341667;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=0P1LhB6aIvv+UKg4X4XIIhxM7OoeD0eoko3Ctij/s6g=;
 b=RouI0lpGtX4A0hFAvXA/sUP3zc3RKLUUMiGIKrXAPmXtpUeuuh0pTwDC
 Jk/nkg5GF9FKEBsubKe1z60B4avcyWHHGWwjeh0XXkO0fqs50xl5iB/mg
 PhmgxQwrwWGfALAHt1sYokgxaRCRbe8qC2gGbdcTPIGibTdASZHOc8WVb
 jjWl0qeDX59wcHR+nPGmYpGd99v+45ywDwwmKroZRO1IPmwWjFOUDHReL
 2hILDJxeU9X8mb0BdmFA6zUlusvUj+5xm8oziQpCvbnlR8EWXHfMnZjNo
 2dhDlcQRfA6xpT7ojSXQUmZdM2XeqOX7MTQxJbN2YI2rC77zE4re2hRPU g==;
X-CSE-ConnectionGUID: e8u02JzcRVubL24bKVbSyQ==
X-CSE-MsgGUID: ml6FRI5KRLapTcVBn3h3pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96601470"
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="96601470"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 04:21:07 -0700
X-CSE-ConnectionGUID: SyHOo69QSUaC9q1tTENY6g==
X-CSE-MsgGUID: 4RrQl6H5RruRtX+al4Ex3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,180,1779174000"; d="scan'208";a="261935441"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 04:21:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:21:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 04:21:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 04:21:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QUcr+y+w61+LO4QkQQJq2O/wXHfPkcpvTaQA4NCyT2YDU5ak5nvJDxEXYHy1cKEIHHrKQCkvztsQ+/Cfb7i4SdCSbi9FkkYjaLKajKAagcgwlmyrUMTWFW03fN4wkZLr93TiHhKRKLKZ2sZJ1YBtyfdCFU4PA9JLnZGkWQFSzy2hoRYFvor2NYcLn4Bhu2YT/4pqaEI8X3Zg9gohr7K3h3RD9V00gh4FX05uY3cicnhWps6vnuGi+apujOeg2niefrksaYqAB4SLBZ2yQ0GNGKm9DF726IIRlXbRUVwor+PGKIUFqxgqBciM/pS4JJwekbH7gzsni8Lq1E2x96BPow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYrmuvTfqbD2z3P0Ani9CtMQN9x8nFyJ0p1qfPyxXqU=;
 b=p96PQ947zGU5d9gssgzoHivWCds15uD09N86kXbFtDHJapM1SSZ240TthlQ5Qpt7sbqGcyVb2/fjZW34h2VTnDgiX5rBKGXTehdIHH/f2UPLyu5lQ3/CwgjqNzhp5+Ei2Qlbh1KajfFToaGTlWo9seO5zptqCQPNbxxZEuRlZDY8Upi8c/KiYmHnf1hIgMLWnQOcuWjLvw9F1AGvOZJHYtfI5ndiswTK+9h2bkd4GpMTZPqqJlBSEDYJ/MlRNdvhZPWKtP8p8LEys6+51PInpquyg5IBgyYDkBuFxFh1BnowbROyuezHRZvVoQM7tKOijTkevpew5gUGPBxoZ2hGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) by
 DS0PR11MB8070.namprd11.prod.outlook.com (2603:10b6:8:12d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.11; Thu, 23 Jul 2026 11:21:03 +0000
Received: from DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::1c26:34fe:2995:253]) by DS0PR11MB6445.namprd11.prod.outlook.com
 ([fe80::1c26:34fe:2995:253%6]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 11:21:03 +0000
From: "Krzysztofik, Janusz" <janusz.krzysztofik@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Laguna, 
 Lukasz" <lukasz.laguna@intel.com>
CC: "Bernatowicz, Marcin" <marcin.bernatowicz@intel.com>
Subject: Re: [PATCH 1/2] lib/igt_device: Extract helper setting device filter
 from fd
Thread-Topic: [PATCH 1/2] lib/igt_device: Extract helper setting device filter
 from fd
Thread-Index: AQHdGomttkNkEXq+H0yi2UwHCK3arbZ69ZuA
Date: Thu, 23 Jul 2026 11:21:03 +0000
Message-ID: <67a441c7b0cc018b5c5e3905586501d6b22ebe86.camel@intel.com>
References: <20260723095701.528790-1-lukasz.laguna@intel.com>
In-Reply-To: <20260723095701.528790-1-lukasz.laguna@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6445:EE_|DS0PR11MB8070:EE_
x-ms-office365-filtering-correlation-id: 753fd9ae-ab64-4679-f89d-08dee8ac7b67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|42112799006|10070799003|23010399003|376014|1800799024|38070700021|56012099006|11063799006|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: G3yMQjtZIKrpxknsnMm0dvcwwff0Nu2zXMBNkUmnCRBrNU2zzFyly9IvTsWPJeteCOe1sjL6cwIbfHmioXZVbiKfwMcsgE1SiIvprtOmoGIGW3qzdbyepVnmsJcN3pZfmBi9+LJi0aE/wAM0W9mYsBVMFB/UOF9kME3DhbrOdt3jdSOrvATc3++5G48dgCVeQZj//qDSdKmoz9yHSUMrViMLGKxSpYHhVkmab0DtLhCt7ExLVn9PZURzB+ATcRLif51f4u8mlTdbC5UvOTdCuXUpB3Au6aSzyaUYK2a+4qJfzTAtXMjuqwRR1//bqEk7Dte6Lfwzt5Wb4bFamDRQvA/yjAsLM2rboggw76Z/deqcGLIwhszYNnR6JguSOecmf/IWjhFFQAPdtYPqIiFnUx849xNSGmTl5LFtktSg+GmlLtmg0p4LZ5sOH4xP3iC9Pp07jXnpX9O4Z6keou9IDxxdxioBCxrt/4DoFNJdYQp2Gk2tO/hXd9zxgwSXlfApQwmxhhCoqiPE3Gmrf8lQauuy3ekjQa97WXymco/7Zj8Hsb18Jn6T5U1U9Phh3Nz7PDuPC75crWX5Oggo3vedYDOy46V6Nahfj0u+0LGLjcECUTNkiZ+STobvXodH3jro1/SwtiR6ag614h/ZCOMU5i2UPu3fAcQG2zd1SzL3xwVoVdohFmu9ueoFyfBUgexMAz+gKg566Eq+75a/0H9dsJizn26qffkw46o+oi9oNB0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(42112799006)(10070799003)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dVIrZEp2NjlGS2pISDdrRHE5dE5Xd0xqZW5vVGUzUkhHbmtJMXZkTDl6K0sz?=
 =?utf-8?B?K3B4YWc0QWEvWS9POEs5RHZ4ZWRYbGVpTGxkbitnU1N2RlpYTk9YM3dLMGNi?=
 =?utf-8?B?UDlXYzJWMlkwdGhmU3Zrd0UzU0JVcXRTR1FOeCtMUTRIR0wwN1RYbmthanRZ?=
 =?utf-8?B?dXo3Ulhod0tjQU42U293S3VuNXVXWTNCMDJBWDc5YlVPaUlGMW5GdXpuUU1U?=
 =?utf-8?B?Y3RzRUhFNGVXaVkxZXFMZlB0VENwUzB5T1JHNlRybGFEWUpJbVRUR3UwQkda?=
 =?utf-8?B?bDd6cThkNkVoN3drNHc1by8remlXUWYyR1o0cjRmSVdoTDJURk1sbEJGL25K?=
 =?utf-8?B?cDNpaWhjc09KbGVRdHZvdXhZUkpqd2dKN3JxQURGeGpzOUlya21wRTk4S1JU?=
 =?utf-8?B?RDJGVTFOc1RNSmt4TUNxRm9YNVFVTEhJOUh0Ri9ITTIxUXEvWmxHUlVreG9R?=
 =?utf-8?B?TVYrNnBtUmNMRk5TYm4xMFNHSlk2czlhM0JFc3JuOTVGTGw2dHVGWEx6RzdU?=
 =?utf-8?B?Y1FmbnVEc3QvNHN6TmF0QUN2RlcxUUVSZmc1MmZqOFdEOXlhU1MvMGhBcTRC?=
 =?utf-8?B?amt2QzFaKzZzM21ObTdoQlUzYUFvMFl1WnBFRS9IY3doTVZFWUtSVEg1dTZk?=
 =?utf-8?B?SktYMGlNVXIvNnUwK3dmSWVDeFRkOGhHaTI4YTU2djdkTWhSaDZnd3RXY0Vp?=
 =?utf-8?B?RFJYWlNrTjE0NkhaSUZjNm5iNUZDL0ZZOW9ETmNEMXJKWSt1cDRWeUh4UTJy?=
 =?utf-8?B?aU1QK3RTNE42ZytVTUdreUUydWZ1YVFxdy9HWlRkOFdQSTh6KzhqaEh1S2tW?=
 =?utf-8?B?Vjd2bE0yT1FYTHFrYlJGcG1rMkliYjg1ZDExSzk5bVZDSHhDWDJqZjdBS1gw?=
 =?utf-8?B?YjlyL2diYjZtQ3dFT1M1VzBML1ZWcW5QYlFKUEI1OVJsZnhnNTdXQXY4SXpq?=
 =?utf-8?B?K05zL3RhTndzbkEwcnRNUW5vOVorK1lHdE1QdkdYUENLVW8rYkdOdSs0SkhH?=
 =?utf-8?B?WlFTQS9YUFBqYmVCOUExREtTakZRcFFncXZsN05qL1pnQjR3YVJIM2VVcG5o?=
 =?utf-8?B?R2tJMDVISjJZM1dsYXRneWZuaHlZTUIwMU1JSU5LdXJlMkZYaGdUTEtGbUhS?=
 =?utf-8?B?SnJUQlEwOHZFajRUa29TQ25tMGxlYWNaSG9EOGJXL3hmTE42N0svbUlHdjBi?=
 =?utf-8?B?SzJTQkdEYTF0elY2TEs2SEZ1aDJOYUtFemc5MGExbEZkc0xTaEN0NWJzRTAw?=
 =?utf-8?B?cGxWMDJad0lvNSsyVnNtbUJvelN3SElPbXNtVHVwcTJQRXBsVGc3RlBNa2Js?=
 =?utf-8?B?RENwZXhqTFpmekVBSUZWRlhleHNoT3JPWWxhNktzUXNwL2p1MStQYU1QcjVp?=
 =?utf-8?B?a3hhckJrNm9CalZkNWhGRlloMlVacHh4QmlwS2NiYzhzWS96QzF0T1VkU2RI?=
 =?utf-8?B?aFVDNWtuSElHcGdYMmI2dXM2RWxPeldXSUV6dXFnZGhWOWxPa0RraWQxNHFO?=
 =?utf-8?B?Y0lqaURBSVZPS01xQXdRSWlQY1lZNmpBVG9kaUhpeTZNNnJ2SDE3SXFKVFdt?=
 =?utf-8?B?MGUwQVA0bmdoSlB2dUtWdGFGNEtMblZGQlRqZGpJaVQ4VnpyTk53QnZ2QVdm?=
 =?utf-8?B?WFJrTytqeDNicWloTUxqdVcwTS9weVlkcjlMcDVNUXQxUTI5allEenVzdVlw?=
 =?utf-8?B?dFl1MHVmR2NiWWwzRGJLRW5ZZHdrbWZQZzE5NlBacUI5M1lzYkkvQlliSHdn?=
 =?utf-8?B?L1lwSCtrRzJESDBhZmhnVTNpSjZtb1dkVGtTKzUxSC9mZmJuQmFDN3o2NElG?=
 =?utf-8?B?QXh3UnB2M3ZEbGtJVFplN3dNNkZNQ3FDZWlzS2FNMHdXczEvaERPL1pwSkpG?=
 =?utf-8?B?UWJiYTlHSldRV1dpc1ZQd3hBUHZVTmc4T01qV1QxVzN2UXRIV0k2akRZbTM3?=
 =?utf-8?B?dkw3a2lWMEpCK0I4TFl2U3l3Y3MrU3lRUnc1SWI0emFXUFZHWVZ2QVhRMVgr?=
 =?utf-8?B?ZndrL0FoS0tkRXpja05rczhKTUMvemVxb3MzOS90dlJISDkyUGVyRVA3cWps?=
 =?utf-8?B?cE44QVE2dzFZR0ZCLzVLYkdNMzhKcjVNcVcvS2tyeUF5K0VkYTJCTnFVaWNV?=
 =?utf-8?B?S3BGaGlTV2lMRFo5Q21Cc0txVy9iNTNnTzUrSXIwQlN0eGhJU3BtTlpzWis0?=
 =?utf-8?B?V0xtcWxLY05PYmdNWHZwM2lUQ0xVWDM1Mi9zeEZnWnh0QnQzOGdNSVVtdStw?=
 =?utf-8?B?bVpwdW1QR2ZkZ0xEN1pXcVQwTFMxYXRwZVdhNVhHNEhVY29rNGVCTmFPSHp4?=
 =?utf-8?B?MUJTODFUNHFxVk4xMGI5UW1CUVJLRWxVUWxCOWNIdU9mTjNyeStHMGhOQUJ1?=
 =?utf-8?Q?NR7SsP93c2kCvehDPRG+uyEBXAlIK5xxOr1bY8yDey6q4?=
x-ms-exchange-antispam-messagedata-1: z3ijnJRUIuVYPA+cYD9fB0tWUsi9QzpRVj8=
Content-Type: text/plain; charset="utf-8"
Content-ID: <44E36C3B56AD1B4D9AB6792EBBB19398@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nytfiHkxn+FdcqmK+tJJXfbplcgC5Xgr8XRVAkTYDwBaDuU1z7/RMWGCbzZNi13/eqlhpw4Pa3ulS1lKQ9fP3xPqj7GFw+DU5fTygjNEQP15jHGwRdapwLQNtrujkh58iKJreKzJ1jZQwF4tivFSKmyh8uxccbKIK8phJDIGhE4ByU8shqpBT66xvnz5kIIAuwjq0VAfz3ZI0gPS1kBvU7Fn2WSDuY90gBsj2YNhGdHzDoqmlxz+vUAJPY1hIaiMxASuyiLhwBd3F+4/QEjO+7DdUqU0vdAz0tmJBK3NIgus8IPjcrvEqvkGrxXsM0xW0t9ps4XwzmaAnrzimfo/9A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 753fd9ae-ab64-4679-f89d-08dee8ac7b67
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2026 11:21:03.5006 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cNVDdc71xAttyfrYyRXmgV1+l2R0TdFbLLzyRg6+QjwIOxIQ2SPTDe5/TUWjsCxX6vMcTuyh6YG0cC+4YYgMuZwjmUEx03+piOuGypsmGac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8070
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Fri, 24 Jul 2026 08:37:18 +0000
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

SGkgxYF1a2FzeiwNCg0KT24gVGh1LCAyMDI2LTA3LTIzIGF0IDExOjU3ICswMjAwLCBMdWthc3og
TGFndW5hIHdyb3RlOg0KPiBIZWxwZXIgc2V0cyBkZXZpY2UgZmlsdGVyIHRvIHRoZSBkZXZpY2Ug
Y29ycmVzcG9uZGluZyB0byBEUk0gZGV2aWNlIGZpbGUNCj4gZGVzY3JpcHRvci4gTW92ZSB0aGUg
aW1wbGVtZW50YXRpb24gZnJvbSBjb3JlX2hvdHVucGx1ZyB0ZXN0IGludG8gdGhlDQo+IGxpYnJh
cnksIHNvIGl0IGNhbiBiZSByZXVzZWQgaW4gb3RoZXIgdGVzdHMuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBMdWthc3ogTGFndW5hIDxsdWthc3oubGFndW5hQGludGVsLmNvbT4NCj4gLS0tDQo+ICBs
aWIvaWd0X2RldmljZS5jICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgbGli
L2lndF9kZXZpY2UuaCAgICAgICB8ICAxICsNCj4gIHRlc3RzL2NvcmVfaG90dW5wbHVnLmMgfCAx
OCArKy0tLS0tLS0tLS0tLS0tLS0NCj4gIDMgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygr
KSwgMTYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2lndF9kZXZpY2UuYyBi
L2xpYi9pZ3RfZGV2aWNlLmMNCj4gaW5kZXggYzYxN2E5OGJjLi5iNzIyN2RjOTEgMTAwNjQ0DQo+
IC0tLSBhL2xpYi9pZ3RfZGV2aWNlLmMNCj4gKysrIGIvbGliL2lndF9kZXZpY2UuYw0KDQpJJ20g
d29uZGVyaW5nIHdoeSB5b3UndmUgcGxhY2VkIHRoaXMgZnVuY3Rpb24gaGVyZSwgaW4gbGliL2ln
dF9kZXZpY2UuYyzCoA0Kbm90wqBpbsKgbGliL2lndF9kZXZpY2Vfc2Nhbi5jIHdoZXJlIGl0IHNl
ZW1zIHRvIGZpdCBiZXR0ZXIsIGF0IGxlYXN0IHRvIG1lLg0KSXMgdGhhdCBiZWNhdXNlIG9mIGRl
cGVuZGVuY2llcyB0aGF0IHRoZSBsYXR0ZXIgbm93IGRvZXNuJ3QgbmVlZCBzbyB3b3VsZMKgDQpo
YXZlIHRvIGJlIGFkZGVkPw0KDQpUaGFua3MsDQpKYW51c3oNCg0KDQo+IEBAIC0zMSw2ICszMSw3
IEBADQo+ICAjZW5kaWYNCj4gICNpbmNsdWRlICJpZ3QuaCINCj4gICNpbmNsdWRlICJpZ3RfZGV2
aWNlLmgiDQo+ICsjaW5jbHVkZSAiaWd0X2RldmljZV9zY2FuLmgiDQo+ICAjaW5jbHVkZSAiaWd0
X3N5c2ZzLmgiDQo+ICAjaW5jbHVkZSAiaWd0X3BjaS5oIg0KPiAgDQo+IEBAIC0zNTEsMyArMzUy
LDI0IEBAIGlndF9kZXZpY2VfZ2V0X3BjaV91cHN0cmVhbV9wb3J0KGludCBmZCkNCj4gIA0KPiAg
CXJldHVybiBOVUxMOw0KPiAgfQ0KPiArDQo+ICsvKioNCj4gKyAqIGlndF9kZXZpY2Vfc2V0X2Zp
bHRlcl9mcm9tX2ZkOg0KPiArICogQGZkOiBEUk0gZGV2aWNlIGZpbGUgZGVzY3JpcHRvcg0KPiAr
ICoNCj4gKyAqIFNldCBkZXZpY2UgZmlsdGVyIHRvIHRoZSBkZXZpY2UgY29ycmVzcG9uZGluZyB0
byBAZmQuDQo+ICsgKi8NCj4gK3ZvaWQgaWd0X2RldmljZV9zZXRfZmlsdGVyX2Zyb21fZmQoaW50
IGZkKQ0KPiArew0KPiArCWNvbnN0IGNoYXIgKmZpbHRlcl90eXBlID0gInN5czoiOw0KPiArCWNo
YXIgZmlsdGVyW3N0cmxlbihmaWx0ZXJfdHlwZSkgKyBQQVRIX01BWCArIDFdOw0KPiArCWNoYXIg
KmRzdCA9IHN0cGNweShmaWx0ZXIsIGZpbHRlcl90eXBlKTsNCj4gKwljaGFyIHBhdGhbUEFUSF9N
QVggKyAxXTsNCj4gKw0KPiArCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3BhdGgoZmQsIHBhdGgsIFBB
VEhfTUFYKSk7DQo+ICsJaWd0X2lnbm9yZV93YXJuKHN0cm5jYXQocGF0aCwgIi9kZXZpY2UiLCBQ
QVRIX01BWCAtIHN0cmxlbihwYXRoKSkpOw0KPiArCWlndF9hc3NlcnQocmVhbHBhdGgocGF0aCwg
ZHN0KSk7DQo+ICsNCj4gKwlpZ3RfZGV2aWNlX2ZpbHRlcl9mcmVlX2FsbCgpOw0KPiArCWlndF9h
c3NlcnRfZXEoaWd0X2RldmljZV9maWx0ZXJfYWRkKGZpbHRlciksIDEpOw0KPiArfQ0KPiBkaWZm
IC0tZ2l0IGEvbGliL2lndF9kZXZpY2UuaCBiL2xpYi9pZ3RfZGV2aWNlLmgNCj4gaW5kZXggNzgx
YTcyMjM1Li4zYWQwOGQzZWUgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZGV2aWNlLmgNCj4gKysr
IGIvbGliL2lndF9kZXZpY2UuaA0KPiBAQCAtMzgsNCArMzgsNSBAQCBzdHJ1Y3QgcGNpX2Rldmlj
ZSAqaWd0X2RldmljZV9nZXRfcGNpX3Jvb3RfcG9ydChpbnQgZmQpOw0KPiAgc3RydWN0IHBjaV9k
ZXZpY2UgKmlndF9kZXZpY2VfZ2V0X3BjaV91cHN0cmVhbV9wb3J0KGludCBmZCk7DQo+ICANCj4g
IHZvaWQgaWd0X2RldmljZV9nZXRfcGNpX3Nsb3RfbmFtZShpbnQgZmQsIGNoYXIgKnBjaV9zbG90
X25hbWUpOw0KPiArdm9pZCBpZ3RfZGV2aWNlX3NldF9maWx0ZXJfZnJvbV9mZChpbnQgZmQpOw0K
PiAgI2VuZGlmIC8qIF9fSUdUX0RFVklDRV9IX18gKi8NCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2Nv
cmVfaG90dW5wbHVnLmMgYi90ZXN0cy9jb3JlX2hvdHVucGx1Zy5jDQo+IGluZGV4IDdjOWRhZTFi
Zi4uYzZlOWQ0ODU0IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9jb3JlX2hvdHVucGx1Zy5jDQo+ICsr
KyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMNCj4gQEAgLTM1LDYgKzM1LDcgQEANCj4gICNpbmNs
dWRlICJpOTE1L2dlbV9jcmVhdGUuaCINCj4gICNpbmNsdWRlICJpOTE1L3BlcmYuaCINCj4gICNp
bmNsdWRlICJpZ3QuaCINCj4gKyNpbmNsdWRlICJpZ3RfZGV2aWNlLmgiDQo+ICAjaW5jbHVkZSAi
aWd0X2RldmljZV9zY2FuLmgiDQo+ICAjaW5jbHVkZSAiaWd0X2ttb2QuaCINCj4gICNpbmNsdWRl
ICJpZ3Rfc3lzZnMuaCINCj4gQEAgLTU1MCwyMSArNTUxLDYgQEAgc3RhdGljIHZvaWQgcG9zdF9o
ZWFsdGhjaGVjayhzdHJ1Y3QgaG90dW5wbHVnICpwcml2KQ0KPiAgCWNsZWFudXAocHJpdik7DQo+
ICB9DQo+ICANCj4gLXN0YXRpYyB2b2lkIHNldF9maWx0ZXJfZnJvbV9kZXZpY2UoaW50IGZkKQ0K
PiAtew0KPiAtCWNvbnN0IGNoYXIgKmZpbHRlcl90eXBlID0gInN5czoiOw0KPiAtCWNoYXIgZmls
dGVyW3N0cmxlbihmaWx0ZXJfdHlwZSkgKyBQQVRIX01BWCArIDFdOw0KPiAtCWNoYXIgKmRzdCA9
IHN0cGNweShmaWx0ZXIsIGZpbHRlcl90eXBlKTsNCj4gLQljaGFyIHBhdGhbUEFUSF9NQVggKyAx
XTsNCj4gLQ0KPiAtCWlndF9hc3NlcnQoaWd0X3N5c2ZzX3BhdGgoZmQsIHBhdGgsIFBBVEhfTUFY
KSk7DQo+IC0JaWd0X2lnbm9yZV93YXJuKHN0cm5jYXQocGF0aCwgIi9kZXZpY2UiLCBQQVRIX01B
WCAtIHN0cmxlbihwYXRoKSkpOw0KPiAtCWlndF9hc3NlcnQocmVhbHBhdGgocGF0aCwgZHN0KSk7
DQo+IC0NCj4gLQlpZ3RfZGV2aWNlX2ZpbHRlcl9mcmVlX2FsbCgpOw0KPiAtCWlndF9hc3NlcnRf
ZXEoaWd0X2RldmljZV9maWx0ZXJfYWRkKGZpbHRlciksIDEpOw0KPiAtfQ0KPiAtDQo+ICAvKiBT
dWJ0ZXN0cyAqLw0KPiAgDQo+ICBzdGF0aWMgdm9pZCB1bmJpbmRfcmViaW5kKHN0cnVjdCBob3R1
bnBsdWcgKnByaXYpDQo+IEBAIC03MTMsNyArNjk5LDcgQEAgaW50IGlndF9tYWluKCkNCj4gIAkJ
fQ0KPiAgDQo+ICAJCS8qIE1ha2Ugc3VyZSBzdWJ0ZXN0cyBhbHdheXMgcmVvcGVuIHRoZSBzYW1l
IGRldmljZSAqLw0KPiAtCQlzZXRfZmlsdGVyX2Zyb21fZGV2aWNlKGZkX2RybSk7DQo+ICsJCWln
dF9kZXZpY2Vfc2V0X2ZpbHRlcl9mcm9tX2ZkKGZkX2RybSk7DQo+ICANCj4gIAkJaWd0X2Fzc2Vy
dF9lcShjbG9zZV9kZXZpY2UoZmRfZHJtLCAiIiwgInNlbGVjdGVkICIpLCAtMSk7DQo+ICANCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQpJbnRlbCBUZWNobm9sb2d5IFBvbGFuZCBzcC4geiBvLm8uCnVsLiBTbG93YWNr
aWVnbyAxNzMgfCA4MC0yOTggR2RhbnNrIHwgU2FkIFJlam9ub3d5IEdkYW5zayBQb2xub2MgfCBW
SUkgV3lkemlhbCBHb3Nwb2RhcmN6eSBLcmFqb3dlZ28gUmVqZXN0cnUgU2Fkb3dlZ28gLSBLUlMg
MTAxODgyIHwgTklQIDk1Ny0wNy01Mi0zMTYgfCBLYXBpdGFsIHpha2xhZG93eSAyMDAuMDAwIFBM
Ti4KU3BvbGthIG9zd2lhZGN6YSwgemUgcG9zaWFkYSBzdGF0dXMgZHV6ZWdvIHByemVkc2llYmlv
cmN5IHcgcm96dW1pZW5pdSB1c3Rhd3kgeiBkbmlhIDggbWFyY2EgMjAxMyByLiBvIHByemVjaXdk
emlhbGFuaXUgbmFkbWllcm55bSBvcG96bmllbmlvbSB3IHRyYW5zYWtjamFjaCBoYW5kbG93eWNo
LgoKVGEgd2lhZG9tb3NjIHdyYXogeiB6YWxhY3puaWthbWkgamVzdCBwcnplem5hY3pvbmEgZGxh
IG9rcmVzbG9uZWdvIGFkcmVzYXRhIGkgbW96ZSB6YXdpZXJhYyBpbmZvcm1hY2plIHBvdWZuZS4g
VyByYXppZSBwcnp5cGFka293ZWdvIG90cnp5bWFuaWEgdGVqIHdpYWRvbW9zY2ksIHByb3NpbXkg
byBwb3dpYWRvbWllbmllIG5hZGF3Y3kgb3JheiB0cndhbGUgamVqIHVzdW5pZWNpZTsgamFraWVr
b2x3aWVrIHByemVnbGFkYW5pZSBsdWIgcm96cG93c3plY2huaWFuaWUgamVzdCB6YWJyb25pb25l
LgpUaGlzIGUtbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlh
bCBtYXRlcmlhbCBmb3IgdGhlIHNvbGUgdXNlIG9mIHRoZSBpbnRlbmRlZCByZWNpcGllbnQocyku
IElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBjb250YWN0IHRo
ZSBzZW5kZXIgYW5kIGRlbGV0ZSBhbGwgY29waWVzOyBhbnkgcmV2aWV3IG9yIGRpc3RyaWJ1dGlv
biBieSBvdGhlcnMgaXMgc3RyaWN0bHkgcHJvaGliaXRlZC4K

