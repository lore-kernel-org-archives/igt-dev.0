Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFCA510ED661
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 13:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651F710EE99;
	Fri, 27 Mar 2026 13:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dBBwCmgP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8156210EE99
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 13:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774618607; x=1806154607;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Lfp02BJaw8UI6uWmtscoaOrP6rwrOp56c3UXRwaW2P4=;
 b=dBBwCmgPsuUGCYRXfXlgHsfCybFPwVsyTHWVmYHwC1kHsAXKtkBEULcA
 xTuYpoOqbCD7Gewwq+JFONA01vHum20s4SFFeKIJxnvY5GWl0gONH3FR9
 Xten/ZB+Ewm4En5dUhlgc9angL4d9Rgkdq+fQSAPhvZf/3O+HYtaZJJkr
 TWekszVdwEOxQuVNYX159A0CCr6xNK4rzNZIF79sjQGvyeHrzUfSxrC8e
 UOw6z8SoXk6NOk6A9I37m/JDKU7Oi9CREl1bBIQvInGmvpFTsyR4YqACA
 cpIg3ZTwc5lupsr1RN+pbk01oAIQdP2DgY7qiXfJqumwoqO2xL05iAxP1 g==;
X-CSE-ConnectionGUID: 4EVi1NbSRdS/MugyrudDsg==
X-CSE-MsgGUID: hqb6p5QFQ/CUvxWtYBTfag==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79291961"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="79291961"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:36:46 -0700
X-CSE-ConnectionGUID: MBjXbV9DTdO384KtN9LVFw==
X-CSE-MsgGUID: Ra9QVpRvSo+jnb2LL2qCCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="224523095"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 06:36:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:36:43 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 06:36:43 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 06:35:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b02tUj1XneRw0P2+Xh2RxyTXYTbqA6Qjv261trON9kvwEQyzp9THlfw2bVf9mDRpbeoOY9r0VOzOqldbbVvi2JBlsLvRf17jmiMkSjaOiCrzX0cKjJXz4o1HuEKpQI3dTKyZFQ01UevzZk4c2U8Bbt0xdMnA0t0Qatpe4soR3SoLq2bIzDpaBjDNF4hGv5NEeA6tlyIg5P6gp/SGzGEsr0DylNuBKkhfE1jtD4XfPeZE4yzufrHhgE6BUi9AEyX8NmyBJzDfnwTIdqj8vO4Y7lxaI0PU76Ixl/JHOJ4pDB9Z5GHy+4ZRXfEdFiTiaKHlpwCeqMlTndR7eqvDFA18xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfp02BJaw8UI6uWmtscoaOrP6rwrOp56c3UXRwaW2P4=;
 b=IVSIJ1RpPzhLuUlVnnYf/Hd4io4LqW33DIoGLF4jFAQCobINpfnphWKpV/Omn8IBHBIBaCh0m7lMAVdyfzv/pnBQb9LWAifCEzQ3Px/0IFo23NoJNjRyp3PXDiQfvBOkJVh5Gqv/tW11Qg6yzASA4FQQ+JbDpjXa2IAILWwVG2FOpO5ua/0eY/4vjreM+uxMvdAsRvp50Wsd2oi+lcNBCGkpv/0GFM6DaonUJKChmfFvL0HJfpeQ3jjpX7/MnzcigQiF1iNqRy8eEVzap8YuFh6i6IjWVOxNzitp1OtHZirRZP8UmFiBPQzCGkfwO8JfEbXnIetjetesQYHCAijQ8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 MN2PR11MB4680.namprd11.prod.outlook.com (2603:10b6:208:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.10; Fri, 27 Mar
 2026 13:35:11 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 13:35:10 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Thomas, 
 Sobin" <sobin.thomas@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v8 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync()
Thread-Topic: [PATCH i-g-t v8 2/3] lib/xe: Add failable variant of
 xe_vm_bind_lr_sync()
Thread-Index: AQHcve0YiXc6KqkhIU+ahiPwgs0NurXCYTWA
Date: Fri, 27 Mar 2026 13:35:10 +0000
Message-ID: <9426ab783be6baf444cea62daafabc3cbaa2eed0.camel@intel.com>
References: <20260327132427.2681193-1-sobin.thomas@intel.com>
 <20260327132427.2681193-3-sobin.thomas@intel.com>
In-Reply-To: <20260327132427.2681193-3-sobin.thomas@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|MN2PR11MB4680:EE_
x-ms-office365-filtering-correlation-id: b4f97f6d-9503-4a79-120d-08de8c05ab3d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|1800799024|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info: +eShdlK7MxkEOuCtSfAlKRIcqQsnAyBV6qbO4vpUKxxhdrmLxDu9Dl81EZM8LwXT8ScKByTbFOjamDzPbz1VEcx/1VP2IyJN0pCTP6XR2aMhUeXPMa1wlZ0D5B9eBcCZfANUfiK1TCd6pyHsJ8RJKLhoYv5jYOGDCOYBn4oCBlNqPd1B9H2ubjtoZYD88RNgT2Xdbo3zq1wD8Osev70WYMZWV7kGfd1NsMGURmYJkQxb2SY9u2ZwsHzDqX1YxRSI37IOXGSHcl9WNc29tTCfFS8zG4KGCebUb/rv2lND8agrck/WSboWM4yx93rbytVFI+BdpyAvXuFiXesQ4SGTnPJbEM63r8reBkZfN4X9IcUW9YdLcX4OGv5zO/BRCWW/0tcZe01tpSWv/Ydnoh/InQM973XXcqjr6aPXpVbyhoDAHVO23G6RQi6IlN2wWWEL/TKfXAoyEzFN8wSjvhdbtsMs9gNZ2xbyJmH4wRgTaPKx5J+L/G5mvp+cw3Tp1y0W7JMMMGyYteYUfgReklRJpkPijUAzRf3GO2p8nHbUdolKDUqG+Sp4VUs5Pa9jeuYiLBAZ3V82A2Ik88nc1LF0KODLTEX6gzxHDh0pBlSgi6/dWaw8aHnGqfjTCNxUtZzWZu6gWCJK/maCU4KpMfBjskKq6MtVjpuRxDQF9Q01Q3LFesi6mmcicn+sj7dKm+dN3lUktApZ7izS9MJgmj0UfRZhDCCb8qJelTXX2q0LBQ3U7IYyuq2pI5rhr+BUnDDG1s84u5DVndliafKcb5JI2t586zPHJf6wpeZlCmMH/Mw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700021)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVpDOWlDZFB5TTdYZU9XeHFBK1Zzc2l3Rk9ycjRqRkJpMUdCa1dVTkFzSTN5?=
 =?utf-8?B?VGF0eVRvWCtjSHdjM2ZpcEVNMUJ2cTUzMG5iWkowbldYSml2YUt1YWZmOUZY?=
 =?utf-8?B?S1ZFblh5enp3SnJLajEyTEg3NFg5ck54b0lVRmZlb0R3NVJPVkNrSVNRSDFP?=
 =?utf-8?B?OHM1VlRzNkF5WG53YzdHeTRkdWZRQ0E0MGt1dTRwQThZMjVWLzNwbmlTZUs4?=
 =?utf-8?B?UkQyK3NHUStRWFl5WklsSXJ6dG1tZENiaS9sVmNVQlpUbWFhSmJpL0VUaEpP?=
 =?utf-8?B?YzYwR1dka1BZeEc5TWtyQnBBYWYzbGorbk9VTTVCMXl3NWZEaW1LUmU4RUdU?=
 =?utf-8?B?MlQ3UWo0VEM4SXlrVENCSHRTZm1qRnY4S1BRSzZEQW9xRkVBK1RYa2ZxenRT?=
 =?utf-8?B?eFJZZEhOZUlSMGR0WHJBL2swOHZuN3N2bzhCWmRRZU9Dd2tiT0tjbjIzWkU2?=
 =?utf-8?B?b1BkRXJreTFXenhnMjU3YTBrK1ZONnZncU5sQStWOGVBOEtVdEpVKzM2YklS?=
 =?utf-8?B?VUt5Qk8ySGhzSmdkMXhWMHUzajhZWVZmQllpdkNlZ2I1azN4cDJFNkJOdTF3?=
 =?utf-8?B?QkRGTnJZL3NBQXdKY21ielZQckhOa1pJeEdqZlRWWGtGMjl3QXpCd3Rnc2tZ?=
 =?utf-8?B?NjZIWHpsazFXcVE2emJ6Wk9pSlpJY1hLeSt1Q1c5dkRUdWNSb1lxRXNmRitQ?=
 =?utf-8?B?SFZmZ3RTbWt5UFNuc0JTUExjVGYyaXVBdVEvRTFSUThsczJ3UnA2cTgyTXoz?=
 =?utf-8?B?eGtpUW1KRUlQSDE2ZnZMbExrc1V3T3pTZkJjU3lFTS94cjd0SVdraFI4aEpt?=
 =?utf-8?B?TUhZYmxDLytyQjVzN0tHT0d6bmxhdzZYVFFMQ2NZNzIzN04xUUJEaENLemZV?=
 =?utf-8?B?NysrMkxCZm0rR3hsRUt3VkhVNjZ3Q0UxRmFrUkp5aW0ycUYwZnBtSVp5TFJu?=
 =?utf-8?B?SWFveVcxRFN2TGM5bFVjZmNDcFM5S2w4UDkrRVh0cGlZRjEvTTI4clNXRmlq?=
 =?utf-8?B?clhCLzlteUxtcFhlekVuSkFCZStFVGdtdzFsNlhkZlNYR0tyMVNZb1g4RlJy?=
 =?utf-8?B?YUNCb1N5b3UxVWFvWENnZGcrZTlMVWhuZ3lwODU0aHVIUDhhb0grOU5GSEI2?=
 =?utf-8?B?N1hoNkpnM0F0V1p0UE1nQm1XNmFPaU4xRlcrOXNaNm5OOEpSRmZNMmZTL3hN?=
 =?utf-8?B?K2RrODZGSDVER1BQb3NSRFZHN0dzOFFXdEVFZ3dwTXRMN2F5Ni8wNklpY0ZC?=
 =?utf-8?B?V1l0S1ppdFhMbUpRZWdmYnFzZWI5N1MzZWZRM3l6OEpRRUFDVjVOYWdYVlhi?=
 =?utf-8?B?aG4zdWt6L0F4alVwTDRxNlhMYVNzb3puY0tMRFdDUThqWEErckxQZytqNkFE?=
 =?utf-8?B?ekxraW9nRFBXQVB2OFNxckJqb2o5M3RTSHlWdnpvTk5TcHJQQzArdGtEblRU?=
 =?utf-8?B?cGRVdmpkTVVQWkJJYmxBQkVLZ0RCUTVjZUtpZkVzQzRMQWFZcDI5RFI3cXpB?=
 =?utf-8?B?cFhWYmZNT21yZVdZN081TlQ0RStJRmY2eVdiTnBqN2U5RHRvZExjTVJJZ2RL?=
 =?utf-8?B?Um1nSTRvY0tQQUhUb2MyWUowMDRsTll1RWk0TmtkZWV3UGwzZVVnT05MQUMv?=
 =?utf-8?B?Q0FJVWlnVG45Ymp5L1VWTFBBN1o3ZUhOUnhiOWVJcmQzQkFCSEtWWnNrNmdS?=
 =?utf-8?B?U3Ywa3VIaEtkUy9XSUpEMEk0U1Bob0U4cnQwbkJFamd0VklzTCtlY0Z6ZEJ6?=
 =?utf-8?B?amg3RTIxUjBncG1rbEpTdnlXN3hwbll3SWVPTnkyTml3NnduZWxhV3RnWWZQ?=
 =?utf-8?B?bFFQekdkUzdOdVRmUVNSbk5Yb0VpQzhtZm55RVZTcUhnNWVCSDJmenBjQ05M?=
 =?utf-8?B?ZEZEeFZwUzg3aGo3WmgzTjBxdHIreEVydnB4eHBKNDdBaXk4aXpINlJvZmRK?=
 =?utf-8?B?aWt0Sk1tVGFTNDRxaVVDaS9YbzhVMWdDVUxQMkRWU0lvSlZyN0ppaUdycFpC?=
 =?utf-8?B?WnVHS3c0MjBlT3ljS2JTQUltdng4RWNXdVF4N0lyZmRpV1hFZjl6UVBRSDFW?=
 =?utf-8?B?anBURzcwSlFCS1hiUDFkQWVkZnptUFBNTElYVFNzamUzMS9RNkR5UWNwT1J6?=
 =?utf-8?B?SzZQMkpmT3QzNVArSlRhaWZkZFVBb0tlQVhSZDZSeDZlYXQ0YWt4U01pcUU0?=
 =?utf-8?B?b0ltMmpvYm1ENVMreGhFQ29zVDNEcnhEMFF1WHJmUC8rTjhTZCt3L0NDSVBX?=
 =?utf-8?B?K2xzc3lpOXhOak9sMVdGWHJyeDAyYklnZ0JHcmlSb0ZQRzdjNFNJV2JvNzZm?=
 =?utf-8?B?QXF5Lzl6UWFoQlh2Q3hYRzBvTGV4cjE2d0p5NW9KK2k5bU1nSmpmZWVSbnky?=
 =?utf-8?Q?Mn1yIpuE4z30lqSGkcNZ2N7r6tr+S0txjhldOJi2uBhSs?=
x-ms-exchange-antispam-messagedata-1: og6HG1e2L4YXEQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <277744987DA5AC4C976ABF2133EADC55@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: tq0EV4PhPA9NaDQbC6R4Oa9nzB0ONEH8z97KkDtTAjZIIlvp/PPg/ucLZ/grpVeJvSWn7WevOXV8XRee3vPrxIu5W62MCdoEyED8gNs3jM+woYNN/e6ceylMX/uh5moKzA1IPf8MDSWnwYdrfPdsIqwCbofrtas0M2XlFRrWjFOa/mhuTKoji8fdVa+0LELOSdvRh61CdkKYmcZb5+25dkdWAZ11ct7/5B+KwzpdZ+J9mmaQCq67eBJkKodlpIofvXPE6thLnguh1j7+39IhA6YlEybI27IIhYjPIn/hUdlfXS6sCQeGlYSQNEJSVGYvawbDuveM56agl5eC0X7agw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f97f6d-9503-4a79-120d-08de8c05ab3d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2026 13:35:10.8282 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JRzjElgDxmQ3zxuxxbz7NT+ODFR4oLTherMUzsg1r9KRTCGHPdvUCRvPrL4JyBFW+vmHSmJTxgaM7v5TmcaP5/TdcbPi9gLgA/4x726YjTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4680
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

T24gRnJpLCAyMDI2LTAzLTI3IGF0IDEzOjI0ICswMDAwLCBTb2JpbiBUaG9tYXMgd3JvdGU6DQo+
IEFkZCBfX3hlX3ZtX2JpbmRfbHJfc3luYyBoZWxwZXIgZnVuY3Rpb24gd2hpY2ggcmV0dXJucyBz
dGFuZGFyZCBlcnJvcg0KPiBjb2RlcyBpbnN0ZWFkIG9mIGFzc2VydGluZyBvbiBmYWlsdXJlLiBU
aGlzIGFsbG93cyBjYWxsaW5nIGZ1bmN0aW9uDQo+IHRvIGhhbmRsZSBWTSBiaW5kIGZhaWx1cmVz
IGV4cGxpY2l0bHkgd2hpbGUgcHJlc2VydmluZyB0aGUgZXhpc3RpbmcNCj4geGVfdm1fYmluZF9s
cl9zeW5jKCkgd3JhcHBlciBmb3IgdGVzdHMuDQo+IA0KPiBSZWZhY3RvciB0aGUgaW1wbGVtZW50
YXRpb24gdG8gdXNlIHByb3BlciByZXR1cm4tY29kZSBoYW5kbGluZyBhbmQNCj4gdXNlci1mZW5j
ZSBzeW5jaHJvbml6YXRpb24sIGFuZCBhZGQgeGVfdm1fYmluZF9scl9mYWlsYWJsZSgpIGZvcg0K
PiBjYWxsZXJzIHRoYXQgZXhwZWN0IGJpbmQgLyBvdmVyY29tbWl0IGZhaWx1cmVzLg0KPiANCj4g
djc6IEludHJvZHVjZWQgeGVfdm1fYmluZF9scl9zeW5jX2ZhaWxhYmxlIChUaG9tYXMpDQo+IHY4
OiBNb2RpZmllZCB4ZV92bV9iaW5kX2xyX3N5bmNfZmFpbGFibGUgYW5kIHhlX3ZtX2JpbmRfbHJf
c3luYyB0bw0KPiBjYWxsDQo+IMKgwqDCoCBfX3hlX3ZtX2JpbmRfbHJfc3luYw0KPiANCj4gU2ln
bmVkLW9mZi1ieTogU29iaW4gVGhvbWFzIDxzb2Jpbi50aG9tYXNAaW50ZWwuY29tPg0KPiAtLS0N
Cj4gwqBsaWIveGUveGVfaW9jdGwuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQ0KPiDCoGxpYi94ZS94ZV9pb2N0bC5oIHzCoCA0ICsrKysNCj4gwqAyIGZpbGVzIGNo
YW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbGliL3hlL3hlX2lvY3RsLmMgYi9saWIveGUveGVfaW9jdGwuYw0KPiBpbmRleCBlYTNmMmZj
YWEuLmE4ZDMxNWRmYiAxMDA2NDQNCj4gLS0tIGEvbGliL3hlL3hlX2lvY3RsLmMNCj4gKysrIGIv
bGliL3hlL3hlX2lvY3RsLmMNCj4gQEAgLTgyMiwyMyArODIyLDQ3IEBAIHZvaWQgeGVfdm1fbWFk
dmlzZShpbnQgZmQsIHVpbnQzMl90IHZtLA0KPiB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCByYW5n
ZSwNCj4gwqB9DQo+IMKgDQo+IMKgI2RlZmluZQlCSU5EX1NZTkNfVkFMCTB4Njg2ODY4DQo+IC12
b2lkIHhlX3ZtX2JpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50MzJfdCBibywg
dWludDY0X3QNCj4gb2Zmc2V0LA0KPiAtCQkJdWludDY0X3QgYWRkciwgdWludDY0X3Qgc2l6ZSwg
dWludDMyX3QNCj4gZmxhZ3MpDQo+ICtpbnQgX194ZV92bV9iaW5kX2xyX3N5bmMoaW50IGZkLCB1
aW50MzJfdCB2bSwgdWludDMyX3QgYm8sIHVpbnQ2NF90DQo+IG9mZnNldCwNCj4gKwkJCSB1aW50
NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0KPiBmbGFncykNCj4gwqB7DQo+IC0J
dm9sYXRpbGUgdWludDY0X3QgKnN5bmNfYWRkciA9IG1hbGxvYyhzaXplb2YoKnN5bmNfYWRkcikp
Ow0KPiArCXVpbnQ2NF90ICpzeW5jX2FkZHIgPSBtYWxsb2Moc2l6ZW9mKCpzeW5jX2FkZHIpKTsN
Cj4gwqAJc3RydWN0IGRybV94ZV9zeW5jIHN5bmMgPSB7DQo+IMKgCQkuZmxhZ3MgPSBEUk1fWEVf
U1lOQ19GTEFHX1NJR05BTCwNCj4gwqAJCS50eXBlID0gRFJNX1hFX1NZTkNfVFlQRV9VU0VSX0ZF
TkNFLA0KPiDCoAkJLmFkZHIgPSB0b191c2VyX3BvaW50ZXIoKHVpbnQ2NF90ICopc3luY19hZGRy
KSwNCg0KTm8gbmVlZCB0byB0eXBlY2FzdA0KDQo+IMKgCQkudGltZWxpbmVfdmFsdWUgPSBCSU5E
X1NZTkNfVkFMLA0KPiDCoAl9Ow0KPiArCWludCByZXQgPSAwOw0KPiDCoA0KPiAtCWlndF9hc3Nl
cnQoISFzeW5jX2FkZHIpOw0KPiAtCXhlX3ZtX2JpbmRfYXN5bmNfZmxhZ3MoZmQsIHZtLCAwLCBi
bywgMCwgYWRkciwgc2l6ZSwgJnN5bmMsDQo+IDEsIGZsYWdzKTsNCj4gLQlpZiAoKnN5bmNfYWRk
ciAhPSBCSU5EX1NZTkNfVkFMKQ0KPiArCWlmICghc3luY19hZGRyKQ0KPiArCQlyZXR1cm4gLUVO
T01FTTsNCj4gKw0KPiArCVdSSVRFX09OQ0UoKnN5bmNfYWRkciwgMCk7DQo+ICsNCj4gKwlyZXQg
PSBfX3hlX3ZtX2JpbmQoZmQsIHZtLCAwLCBibywgMCwgYWRkciwgc2l6ZSwNCg0KSXQgc2VlbXMg
bGlrZSBvZmZzZXQgZ290IGxvc3QgdGhlcmUuIFByZS1leGlzdGluZyBidWcuDQoNCg0KPiBEUk1f
WEVfVk1fQklORF9PUF9NQVAsIGZsYWdzLA0KPiArCQkJwqDCoCAmc3luYywgMSwgMCzCoCBERUZB
VUxUX1BBVF9JTkRFWCwgMCk7DQo+ICsNCj4gKwlpZiAocmV0KQ0KPiArCQlnb3RvIG91dDsNCj4g
Kw0KPiArCWlmIChSRUFEX09OQ0UoKnN5bmNfYWRkcikgIT0gQklORF9TWU5DX1ZBTCkNCj4gwqAJ
CXhlX3dhaXRfdWZlbmNlKGZkLCAodWludDY0X3QgKilzeW5jX2FkZHIsDQo+IEJJTkRfU1lOQ19W
QUwsIDAsDQoNCk5vIHR5cGVjYXN0IQ0KDQo+IE5TRUNfUEVSX1NFQyAqIDEwKTsNCj4gwqAJLyog
T25seSBmcmVlIGlmIHRoZSB3YWl0IHN1Y2NlZWRzICovDQo+ICtvdXQ6DQo+IMKgCWZyZWUoKHZv
aWQgKilzeW5jX2FkZHIpOw0KPiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gK3ZvaWQgeGVf
dm1fYmluZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQzMl90IGJvLCB1aW50NjRf
dA0KPiBvZmZzZXQsDQo+ICsJCQl1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1aW50MzJf
dA0KPiBmbGFncykNCj4gK3sNCj4gKwlpZ3RfYXNzZXJ0X2VxKF9feGVfdm1fYmluZF9scl9zeW5j
KGZkLCB2bSwgYm8sIG9mZnNldCwgYWRkciwNCj4gc2l6ZSwgZmxhZ3MpLCAwKTsNCj4gK30NCj4g
Kw0KPiAraW50IHhlX3ZtX2JpbmRfbHJfZmFpbGFibGUoaW50IGZkLCB1aW50MzJfdCB2bSwgdWlu
dDMyX3QgYm8sDQo+IHVpbnQ2NF90IG9mZnNldCwNCj4gKwkJCcKgwqAgdWludDY0X3QgYWRkciwg
dWludDY0X3Qgc2l6ZSwgdWludDMyX3QNCj4gZmxhZ3MpDQo+ICt7DQo+ICsJcmV0dXJuIF9feGVf
dm1fYmluZF9scl9zeW5jKGZkLCB2bSwgYm8sIG9mZnNldCwgYWRkciwgc2l6ZSwNCj4gZmxhZ3Mp
Ow0KDQpXaHkgZGlkIHlvdSBhZGQgdHdvIGZ1bmN0aW9ucyB3aXRoIHRoZSBzYW1lIGZ1bmN0aW9u
YWxpdHkgYnV0IGRpZmZlcmVudA0KbmFtZXM/DQoNCi9UaG9tYXMNCg0KDQo+IMKgfQ0KPiDCoA0K
PiDCoHZvaWQgeGVfdm1fdW5iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2bSwgdWludDY0
X3Qgb2Zmc2V0LA0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3RsLmggYi9saWIveGUveGVf
aW9jdGwuaA0KPiBpbmRleCBiNjJkMjU5ZmQuLmE3ZTM4ZWEwNCAxMDA2NDQNCj4gLS0tIGEvbGli
L3hlL3hlX2lvY3RsLmgNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmgNCj4gQEAgLTExNyw2ICsx
MTcsMTAgQEAgc3RydWN0IGRybV94ZV9tZW1fcmFuZ2VfYXR0cg0KPiDCoHZvaWQgeGVfdm1fYmlu
ZF9scl9zeW5jKGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQzMl90IGJvLA0KPiDCoAkJCXVpbnQ2
NF90IG9mZnNldCwgdWludDY0X3QgYWRkciwNCj4gwqAJCQl1aW50NjRfdCBzaXplLCB1aW50MzJf
dCBmbGFncyk7DQo+ICtpbnQgX194ZV92bV9iaW5kX2xyX3N5bmMoaW50IGZkLCB1aW50MzJfdCB2
bSwgdWludDMyX3QgYm8sIHVpbnQ2NF90DQo+IG9mZnNldCwNCj4gKwkJCSB1aW50NjRfdCBhZGRy
LCB1aW50NjRfdCBzaXplLCB1aW50MzJfdA0KPiBmbGFncyk7DQo+ICtpbnQgeGVfdm1fYmluZF9s
cl9mYWlsYWJsZShpbnQgZmQsIHVpbnQzMl90IHZtLCB1aW50MzJfdCBibywNCj4gdWludDY0X3Qg
b2Zmc2V0LA0KPiArCQkJwqDCoCB1aW50NjRfdCBhZGRyLCB1aW50NjRfdCBzaXplLCB1aW50MzJf
dA0KPiBmbGFncyk7DQo+IMKgdm9pZCB4ZV92bV91bmJpbmRfbHJfc3luYyhpbnQgZmQsIHVpbnQz
Ml90IHZtLCB1aW50NjRfdCBvZmZzZXQsDQo+IMKgCQkJwqAgdWludDY0X3QgYWRkciwgdWludDY0
X3Qgc2l6ZSk7DQo+IMKgI2VuZGlmIC8qIFhFX0lPQ1RMX0ggKi8NCg==
