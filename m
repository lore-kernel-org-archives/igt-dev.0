Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11197CC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 04:17:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A850B10E6F5;
	Tue, 13 Oct 2026 04:17:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47CD10E6DF
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 04:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791864975; x=1823400975;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=h7QJw4kSk3vSr68C01sr9o7DYLon+bQJJ9A9/4QIu24=;
 b=eOVyUgYRyMcEuGW1oNHhOwJ7TsfxVURHq5Vrzyg7UC06WLu6k3kciKyI
 FyqE6rmHEkWofUgocpCsraAdpQ0y+q4Q8CWOVeMIAWZe8tkQF+TF3cN8d
 iz43ispeeYPiK2oqa29Ii8IfmEncKBU+Y1sanljZWJqi7fpbeEdpMcwPR
 MjOliCSojCjrVGFlkkGVks6lh99tqOoeWoiX+mkZVFD20ubDlbKXis4qx
 mN919hemluaQUC7aoh0Tw3aGdVZl5yMqp51/fDFwOoNMBcWNYj+8RlcdZ
 kmpkawPghMlYhymxXvVzIlkNncom5Pw5j9WQQFZVVlCvp2GzVEJZR9ABo w==;
X-CSE-ConnectionGUID: 6PmO+dV6ROuCpe/LQcFxhw==
X-CSE-MsgGUID: HxEDC/11QhGgUuwngNplpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="467114"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="467114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:16:15 -0700
X-CSE-ConnectionGUID: szskhj0hRM+rD0VR5pOS6w==
X-CSE-MsgGUID: bZ1XyRkKR8qEzX5X20p4uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1113197"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 21:16:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:16:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 21:16:14 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.23) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 21:16:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjXwq4+yaIcnwTFvzhPpduN5p/JLNeTOry5LyRgkJMKQYX8XfKxl12rGvtCAY7PE3vogfoQei03QaDPEncIqKoeBfHguWSRUQPrsqY3Mb7S7hoD6o1UMx0GzYeIKQh7c5oicghqnf8UJQzPgdJ1ngixnJcqzv90GkXVPLXEphoHmT0FVMQO+Z29jDtIMxhF7U/Jx0va+coQOxE+o38HV9/iY2HFk6U8AHd02H5BYk2FVffbYEFBr1HRimHzv/0nzUDp/mKqb89aCiaTWoUYQY2k1ZReamjYfPXdBKGQlayqPrBVu4xM9W4KEiQdVohLxqfub+OW7L2HqfySfOU8gPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h7QJw4kSk3vSr68C01sr9o7DYLon+bQJJ9A9/4QIu24=;
 b=pm5Y9mfNkDH4VmEnj5LRWKtMb4fQTNdJuSb68V/YBVHwm9JWlEffAau2J+enwb1N16coo6PUGm7vmF2xf88/hAfWKKZopCiw5XyFEyNRhR74VBaCtgpPY/sZKWEJ+GwFev6a5lGqJaw+EYYBHiQjAvGyLj9m+dDhWS4npzKQ1SCwXeCpLhYvP6JX0Hbt2/YNjpNoqFSJdz0I72RbL+SJ0Pc+iK5t7dNflLA6GxM/WKCPbxfoJwNMlCZ9kGjqAcG0uFWJZDV71VX4nLDXZIs3crVzc7vBw7Jgsb6UVI0gVwFO9jJoUPrVTFFN4etggfo/Q7FJfxGK4S1I1wi4e0HGIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by PH0PR11MB4950.namprd11.prod.outlook.com
 (2603:10b6:510:33::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 13 Oct
 2026 04:15:37 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 04:15:37 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manna, Animesh" <animesh.manna@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_vrr: Let the pipe go idle before reading
 the DC3CO counter
Thread-Topic: [PATCH i-g-t] tests/kms_vrr: Let the pipe go idle before reading
 the DC3CO counter
Thread-Index: AQHdWiy5seWcia4x6k+z7paWQTC20bb6RsYAgACXSGA=
Date: Tue, 13 Oct 2026 04:15:37 +0000
Message-ID: <DS4PPFE901A304FF6D34F09AB56C4FE9358E39E2@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20261012093308.731774-1-suraj.kandpal@intel.com>
 <cb268395-3068-42d9-b501-672fe02d3b74@intel.com>
In-Reply-To: <cb268395-3068-42d9-b501-672fe02d3b74@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|PH0PR11MB4950:EE_
x-ms-office365-filtering-correlation-id: c77f65ef-3631-44d4-6ede-08df28e0a297
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|10070799003|260925022911599003|22082099003|3023799007|18002099003|10067099003|4143699003|38070700021|56012099006|260925021911599003|11063799006|260925021311599003;
x-microsoft-antispam-message-info: pieG4Eka4N1xmi/CWQhmzKGgjE4jfGHSCCmsQ3YWNCYedfs07ObF+KeiE8vVSqT3KqvI82zoMfSCT/ngCqwDVJlHyyPtCNMwQsl8X1idnvVtVxOXpHqeimZY29168Y02x5Q2nSNhhxQNbZAHyFSqAQ4Tv2KVRAFDnLEbJb/aMO7Ekt5/gesU2ESxdJ68AvSlfhZlo/gQ4aqAf35Ew9bPKeKBPS2643z+Xy6d17qo5L3+8gB/aKfKRTVxdyHK2woCr8CWsq8SYF5MB+esMeNctZO/PwIRRWMAhGrtI2QjoBtxsUo/OTRJTYG2hw0ANie0X1h0CfjZ+fTgp0xhT7KZaoqVdK7rtYsvIK08wPmPpoN/t3B85TTOeQC4Z/QWx0VcWSdZBzYjCL3iZM3srwXzbLjH9n72fl4pCEfU8FmY9sJ0rISUO7fayyLrn2gwXyc92X3NoAvr1cBZNaFYuHqAv7bNQ8n1DPhvFA0ZHekzoKSSjrnI+VTnsRNTigw+dbI8hc0wh2ru6vivr9ucAKShW5oa1JA3LPxlE1fVo/+fIUMD70TRKkkdpL89GyJDKAUm5/o+V932scwCPAcT9uDf1xv5eu0S6613porJMwhYY9nH3WSLErj6EUm73AL9dVBY7992XAPw0GWbYg6cwibLgWH0VnQ26exuSrjYjTuy7UW74qb240AAWFlVPMon6TrJG7j/vVUZD7qRwDrODdkm4wyhNN4jZ5eY56O8HsOD7VY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(10070799003)(260925022911599003)(22082099003)(3023799007)(18002099003)(10067099003)(4143699003)(38070700021)(56012099006)(260925021911599003)(11063799006)(260925021311599003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmlhREpaNWVpZWxKVFlqaFZCQXI2cDBKOC9yZEViUHBxYVhsTXdFSlNpNTJx?=
 =?utf-8?B?aU9xMmg2SmRGaWRleWhPZkp0T2dsMDZ0WW9rRzhmL2VxZUdpTmM2NWlteGxm?=
 =?utf-8?B?UmJlVjB4bGM4dHV5SVJSdlNPQ3JibkhNSEhMMjVablVTaTJvVEY4Z1NOaDJ0?=
 =?utf-8?B?YSsvbnNkR1kxZ1BWMXptVWFLYzRWaXVsdmU0R3JXQ2plRmxlZVZRMFBKdWJy?=
 =?utf-8?B?TGJETWppUDJFOWZOM1BaTlozOGUvcW4zckl1N2oyMWlWa2xaZWlOVnBTK2J3?=
 =?utf-8?B?QmQ4eEpmWHgraEJqTGUyOEVwWjNjbVZ1YnkyeUc2eDcwQlB6UHFnZk5JRTFu?=
 =?utf-8?B?TTlEV1UwbHFRNW04Q1pOZ3o3bkJGRWdGNFNBaUtNSnlqdDdpUWk2NlZrN3V0?=
 =?utf-8?B?ZTFNTFZwRjNsKzZZNUtvMlRaZTVRdmJBVlpibENFWTBKRnVvalFsbVNzcUU5?=
 =?utf-8?B?UFR2NGNkMi9SNU12UmZ6c01HV3kvQUViZG9JRUF5bDFFMmpXSkdnc1JjRTFN?=
 =?utf-8?B?aGQ0TTFpMVcyZy9zTTdwcis3U2dnYTJKdVpUejZvOWkvMGRqenIwMmp5bGdj?=
 =?utf-8?B?Mm9acVVPUURqbndXcHNVNlJyUFlld1NlQmJsQ3U2ZkNUY1FVVWJCZyswblor?=
 =?utf-8?B?WjU2YnBycHh1NzE4QmRVNzFIaFc4QlJ0cnFBWDRYdldzNzZkaHBJajRrNlpK?=
 =?utf-8?B?RG9TL0xiRllKdm04Z3FVMURLSXovcnJwTm1qZGVNbGVTY21qdU9RbGdrWmdq?=
 =?utf-8?B?Rm0zMXJsRWppNHZuQUNTZzJVdGdTeEFGRTJPTDZMdWd4M0orUXFZeDdvT1pl?=
 =?utf-8?B?Zll6dk5uY3NycW45L0x2T1RoNk5RQkU0V2cxTXhmRjFxM0Y1cVhCVmJ2SFZE?=
 =?utf-8?B?WWZETC8za2pKb1NqOTNHMUtUeE9DaGswNVFqS2FxaG1VL0FDY0FrUTNMM1RQ?=
 =?utf-8?B?Q0VJYldMaG1FUmM5ZlRheGY5MkRGakZILzJiUGh3UytsR2xrTi9hdGd2bUxL?=
 =?utf-8?B?MmZvTndZcEkyY3M0WDVwcjN1WXZybEJUbXlpZTBzeUowcGdLV1RYc0lWS2w4?=
 =?utf-8?B?K3hMSHFhVmIxSWE3NWFiUlpBbEx1VUZxcmFHTjUwWU9VVm1PbFdOMDVQVk1O?=
 =?utf-8?B?bm8rSmVzVHJnV1NwYy9IUDk2YVgxUUR3MSthKzY2a25jbUsrUDNla2ZSYVdC?=
 =?utf-8?B?REpZQnlQeHBFVS94S2JUNldoQUpEQVAwdFRmb05ZdzlKTGE4L0o5aDJUMWlQ?=
 =?utf-8?B?RSs2aWlETG9EemxNKzdXMENHc2k0K3JpaC85UmIxaUpLeThFMnNUaW9DTVNl?=
 =?utf-8?B?N1ZGN043bmtyc1pxNWlOSmhiOTNoaTYrR3RVR0NpczJXZ3ZIY2xHTlRhMFA3?=
 =?utf-8?B?c1BZNlBqbE93NzMxYnpmbDRGYjFlSGN0WThzVnA1UDJuS2hkdXREZW5vUWZn?=
 =?utf-8?B?RlVBMTUwN3B5YUhobWRoNjZyWGFobUs2WEVnTWl2amFpeFB2VjFuOXAzWW85?=
 =?utf-8?B?L1NDQk9kaVBhQjRMem15Ym5xdGdmQkRsTDFaVmtPbU4yTXFjVkpPVWFOeHBF?=
 =?utf-8?B?OUFVNFNZUnI4OXFGaHpEbk4rVzY3Mzg3K2NlblNXVGRZTEJZS0RoWFc3VTlD?=
 =?utf-8?B?K1JJV0FWTVFkMnNGL2lzckZpV3BQQ0c1SXJMaStRb1UyNEVGaTBOQ0FyNlp1?=
 =?utf-8?B?Qlg5bTQ4bzBrR3k0VnlJNEJXRjlicGNDdlI5YW9pK2NpTGhhOFcxZ3hFRXhp?=
 =?utf-8?B?ZmhnQklacUdYcGpmRlZ3d0ZZeUk1NWt5TEZuNzc0SS9WcndNaloyMTRzM2Ey?=
 =?utf-8?B?VDBXcWlwem5QY0RaUVR3dFhCZ1dKSHhwdXZPRTRxaERCZXJ6NHk4V2d6T1kx?=
 =?utf-8?B?NHd6ZTU2QjJlVVk3dGE4K05UalpDQUF5RTI4STYvaUxXMmdZaTRSVlNjSEdo?=
 =?utf-8?B?aEFsQWhGMG13WHRaWkkzVEgxOVB3U0t3aENqaWxxRmpmblZ1Rit1WFg4VkxR?=
 =?utf-8?B?T21DQWNaWkF2L3dkeHBTeEQ5TnJxVTkycXFteXNFdEdScFBwazJZMmxxY1Zm?=
 =?utf-8?B?US95TEZmL3loVTRMWG5BK01ORys2eFNJRkRHbGJZdVZTYlVxbVY2S2ZuT2Zp?=
 =?utf-8?B?TmJ3WWFJallnWjQ4V1g3M2RLZmZqKzR0U1lzcXBnbEY4MFBiQm8xNGRsSng2?=
 =?utf-8?B?T3l3RlV0MnN5cFoycm5MN0JZRGx2djU4QjIrcEJuOVVHakhwMmR1M3M4ZFA0?=
 =?utf-8?B?TVVxQjJiSEJoVHg1TXkybHZHdFhsTzQ0ekwxMmNSZHJqTFhKL3A4RXhyZ2Fz?=
 =?utf-8?B?dlVrMFBkeUFmSUtkeUNpNFMxQ2tpTytWVHBWTlI3Q0RCb01QUkJjRjlaUldK?=
 =?utf-8?Q?A7nXfug1JlpMVCOtVv3Kyyh3mAmGBR+v61WL82PSh5bSt?=
x-ms-exchange-antispam-messagedata-1: ETa3Fi0/VYNwxg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: TUwTCjLBdDl4lMrEVklA9/7kGkF3BJoZa5Zg1JSFbwgYtWOG4fjvR8gKMUjI4fKRa14PiP3MTwZHnPHK29IyZwW8wePcBpt99tdLusD8SaDolgn86gzl6EC0J/oWHM44XnXvg17bLh45vZE9kNb9aqFqvnvJtFgBFqhSoHzwWK+XUpm3AXqhy0cPz75J6de/ujj2C4T1KyUSd5uUWI+PXvOGMzMn6d93v/CmfHaMCwgZvblgaejLGhM3emWcd6zHQ3G0PVdb8bLnQ3Tpn3QvoHcFRWZ8AKxD8jDQjtNXKNW7jzzOAyyaBLHRyPaPYZUYfib1QjaVygPfjArxfZz/BA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77f65ef-3631-44d4-6ede-08df28e0a297
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2026 04:15:37.5130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c8qnFnK8mfJmhqUANaLQrobuimEHgYgdNayWlMxNsQOWTavKdPfpsoz9EK1Ce1v91FCBjnOVW0FRGSGWjI/cQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4950
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmFsYWRhbGEsIFJhbWFu
YWlkdSA8cmFtYW5haWR1Lm5hbGFkYWxhQGludGVsLmNvbT4NCj4gU2VudDogMTMgT2N0b2JlciAy
MDI2IDAwOjQyDQo+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRlbC5jb20+
OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogTWFubmEsIEFuaW1lc2ggPGFu
aW1lc2gubWFubmFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10XSB0ZXN0
cy9rbXNfdnJyOiBMZXQgdGhlIHBpcGUgZ28gaWRsZSBiZWZvcmUgcmVhZGluZyB0aGUNCj4gREMz
Q08gY291bnRlcg0KPiANCj4gSGkgU3VyYWosDQo+IA0KPiBPbiAxMC8xMi8yMDI2IDM6MDMgUE0s
IFN1cmFqIEthbmRwYWwgd3JvdGU6DQo+ID4gRXZlcnkgYXRvbWljIGNvbW1pdCBob2xkcyBEQ19P
RkYgdW50aWwgYSBmcmFtZSBhZnRlciB0aGUgZmxpcCwgc28gd2l0aA0KPiA+IGZsaXBzIGFycml2
aW5nIGV2ZXJ5IH4zM21zIERDM0NPIG5ldmVyIGdldHMgYSBjaGFuY2UgdG8gYmUgZW50ZXJlZCBh
bmQNCj4gPiB0aGUgY291bnRlciBzdGF5cyBmbGF0IGZvciB0aGUgd2hvbGUgbWVhc3VyZW1lbnQg
d2luZG93Lg0KPiA+DQo+ID4gRmxpcCBmaXJzdCB0byBjb25maXJtIExPQkYgY29tZXMgdXAgYW5k
IHN0YXlzIHVwLCB0aGVuIHNhbXBsZSB0aGUNCj4gPiBjb3VudGVyIGFjcm9zcyBhIHNlY29uZCBv
ZiBhbiBpZGxlIHBpcGUgaW5zdGVhZC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFN1cmFqIEth
bmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMva21z
X3Zyci5jIHwgOCArKysrKystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfdnJyLmMg
Yi90ZXN0cy9rbXNfdnJyLmMgaW5kZXgNCj4gPiBkODNhZGVhNzQuLjFhM2UxODc0MCAxMDA2NDQN
Cj4gPiAtLS0gYS90ZXN0cy9rbXNfdnJyLmMNCj4gPiArKysgYi90ZXN0cy9rbXNfdnJyLmMNCj4g
PiBAQCAtMTA2LDYgKzEwNiw4IEBADQo+ID4gICAgKi8NCj4gPiAgICNkZWZpbmUgVEVTVF9EVVJB
VElPTl9OUyAoNTAwMDAwMDAwMHVsbCkNCj4gPg0KPiA+ICsjZGVmaW5lIExPQkZfSURMRV9EVVJB
VElPTl9OUyAoMTAwMDAwMDAwMHVsbCkNCj4gPiArDQo+ID4gICBlbnVtIHsNCj4gPiAgIAlURVNU
X0JBU0lDID0gMSA8PCAwLA0KPiA+ICAgCVRFU1RfRFBNUyA9IDEgPDwgMSwNCj4gPiBAQCAtMTE4
NSwxMSArMTE4NywxMyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2xvYmZfZGMzY28oZGF0YV90ICpkYXRh
LA0KPiBpZ3RfY3J0Y190ICpjcnRjLA0KPiA+ICAgCSAqLw0KPiA+ICAgCXJhdGVbMF0gPSBfX3Rl
c3RfbG9iZihkYXRhLCBjcnRjLCBvdXRwdXQsIGZsYWdzKTsNCj4gPg0KPiA+ICsJLyogS2VlcCBm
bGlwcGluZyBhdCB0aGUgcmF0ZSB0aGF0IGVuYWJsZWQgTE9CRiBhbmQgY291bnQgZnJvbSB0aGVy
ZS4gKi8NCj4gPiArCWZsaXBfYW5kX21lYXN1cmUoZGF0YSwgb3V0cHV0LCByYXRlLCAxLCBURVNU
X0RVUkFUSU9OX05TKTsNCj4gPiArDQo+ID4gICAJZGMzY29fY291bnRfYmVmb3JlID0gaWd0X3Jl
YWRfZGNfY291bnRlcihkYXRhLT5kZWJ1Z2ZzX2ZkLA0KPiA+ICAgCQkJCQkJIElHVF9JTlRFTF9D
SEVDS19EQzNDTyk7DQo+ID4NCj4gPiAtCS8qIEtlZXAgZmxpcHBpbmcgYXQgdGhlIHJhdGUgdGhh
dCBlbmFibGVkIExPQkYgYW5kIGNvdW50IGZyb20gdGhlcmUuICovDQo+ID4gLQlmbGlwX2FuZF9t
ZWFzdXJlKGRhdGEsIG91dHB1dCwgcmF0ZSwgMSwgVEVTVF9EVVJBVElPTl9OUyk7DQo+ID4gKwl1
c2xlZXAoTE9CRl9JRExFX0RVUkFUSU9OX05TIC8gMTAwMCk7DQo+ID4NCj4gPiAgIAlkYzNjb19j
b3VudF9hZnRlciA9IGlndF9yZWFkX2RjX2NvdW50ZXIoZGF0YS0+ZGVidWdmc19mZCwNCj4gPiAg
IAkJCQkJCUlHVF9JTlRFTF9DSEVDS19EQzNDTyk7DQo+IA0KPiByZS1mbG9hdCBvbiB0aGUgbGF0
ZXN0IElHVC4NCj4gDQo+IElNSE8sIFRoZSBzbGVlcCBzaG91bGQgYmUgYWRkZWQgYWZ0ZXIgcmVh
ZGluZyB0aGUgREMzQ08gY291bnRlciBhbmQNCj4gcGVyZm9ybWluZyB0aGUgTE9CRiBlbnRyeSBj
aGVjay4gVGhhdCBhcHBlYXJzIHRvIGJlIHRoZSByaWdodCBwbGFjZSBmb3IgaXQuDQo+IA0KPiAN
Cj4gIMKgIMKgIMKgIMKgIGRjM2NvX2NvdW50X2JlZm9yZSA9IGlndF9yZWFkX2RjX2NvdW50ZXIo
ZGF0YS0+ZGVidWdmc19mZCwNCj4gIMKgSUdUX0lOVEVMX0NIRUNLX0RDM0NPKTsNCj4gDQo+ICDC
oCDCoCDCoCDCoCB0ZXN0X2xvYmYoZGF0YSwgY3J0Yywgb3V0cHV0LCBmbGFncyk7DQo+IA0KPiAg
wqAgwqAgwqAgwqAgdXNsZWVwKExPQkZfSURMRV9EVVJBVElPTl9OUyAvIDEwMDApOw0KPiANCj4g
IMKgIMKgIMKgIMKgIGRjM2NvX2NvdW50X2FmdGVyID0gaWd0X3JlYWRfZGNfY291bnRlcihkYXRh
LT5kZWJ1Z2ZzX2ZkLA0KPiBJR1RfSU5URUxfQ0hFQ0tfREMzQ08pOw0KDQpUQkggaWYgdGhhdCB0
aGUgY2FzZSB0aGVuIHdlIGhhdmUgYmVlbiBkb2luZyBpdCB3cm9uZyB0byBiZWdpbiB3aXRoLg0K
RnJvbSB5b3VyIGNvZGUgc25pcHBldCBpdCBsb29rcyBsaWtlIGRjM2NvIGNvdW50IGJlZm9yZSBu
ZWVkcyB0byBiZSB0YWtlbiBiZWZvcmUgd2UgZG8gdGVzdCBsb2JmLg0KV2hpY2ggd2FzIG5vdCB0
aGUgY2FzZSBiZWZvcmUgYWxsIEkgZGlkIHdhcyBhZGRlZCBhIHVzbGVlcCBzbyBkb2VzIHRoaXMg
bmVlZCBhIGZpeGVzIHRoZW4uDQoNCg0KUmVnYXJkcywNClN1cmFqIEthbmRwYWwNCg==
