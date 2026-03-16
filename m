Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE86F506D5
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 14:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5397F10E258;
	Mon, 16 Mar 2026 14:24:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZO7uYIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE05810E258
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773671050; x=1805207050;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9gBUsZjm9QABxoTewgNtZcgghZF7pWcBKmxejidJ+ho=;
 b=AZO7uYIEHochSmxzD+j8Wo22tOuNhu1LBfna1oPFfMBhZwP9s3yMmGck
 CTkdDqdFEIfuE0p6bj5l2aDWfV08gtZmgKRdG7PsTY/KislT9AqaQzK4G
 fPEJ+tdcjOfacEIhOVImhmoXvLNmREZEMTJ45+Kv/+y8WfHZNjMDky8F0
 Hk4dZZWB4yEeHgblnOXUZDzuA2rR73pJ6xT9W3E2wePJ5levyXrlA3oOd
 Pl0Q1BxDtaL8SUJxFzZABozCSyQwP+b2/6ph6xoONnZzdS5UoRLnRtLfB
 4w35eayrLaZ6S7ZCwmR85UfBT3lZRUiFac/ri4ioclqvvvJa9Cwe/9aWr g==;
X-CSE-ConnectionGUID: ynirGRLHT+yEN4fd7sed0w==
X-CSE-MsgGUID: lIs5g5PTTyKKvtaH+4/sMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="78537482"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="78537482"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:24:09 -0700
X-CSE-ConnectionGUID: gJddbq1mQuy4O5l6juBvxA==
X-CSE-MsgGUID: vXDeNTX2ROGI+WOI7ywhGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="218182039"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 07:24:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 07:24:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 16 Mar 2026 07:24:07 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 16 Mar 2026 07:24:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJT/bxVPUedp6xSZog7E3DjqxsyygUj0fwuHeYgfHOsq+0/AMzD2LcEI94cG5RMj9CXtxfBmZ3QcmNEga8wN5JCTmj+rJoqX4fpmVpBnedutulnwJUTj+NB2Eqf1j015jEsxGShg5oCrwzxsm0frVBu4ywDBACUbHWnYrtfoT0H13z/9e9bGEaNYgHdF+HBJDWzDDlkzGpZU1zetAS693sE6BrqTiGoeAbUjaE6l/jKoOnaLfpy75HrgObyn6Sf1W+OBhnGxcgpmZYTQAj6pCMW11aGPMs+Hk6u2CbRPFIi2cFYAKCPMpf9KbyYy18VKJLC+guiQHdOJ+iNSGwKSnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gBUsZjm9QABxoTewgNtZcgghZF7pWcBKmxejidJ+ho=;
 b=OVjZRTuDH2hiBI3MzyTRq1z5qYiwNM3bXtPUFNwx3rVBxF4uWI4sbLdXtJtLE/Qr84uwpDiTYDaTKyqq853dCDarKO5X5/18nTVGNefWCJTpRFg0oziJA+ml0/jl1cbwZmnhThKyQQ3tlmycmLAK+MV5qhRyfDXFxZOGaXYJC4w3VcT4Oai6ZTqCGuJAm8DCCLN52sg++eIg4vY8geCF3MG4MPJrPO9SNjQAeja6aaLnG5DTu4EQowvF9GlfQGN31XvyQ2BYEFvu2DGAzFrw2XHN/9AP2Z9FOMvetQYf+nyAi8Nv8Q9jfS2nAyNiIzIvO66vFXbJ9lwh6NeEc2v3pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6796.namprd11.prod.outlook.com (2603:10b6:510:1ba::6)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 14:24:05 +0000
Received: from PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7]) by PH7PR11MB6796.namprd11.prod.outlook.com
 ([fe80::60ca:3168:fb41:7ae7%5]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 14:24:05 +0000
From: "S, Sowmiya" <sowmiya.s@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/kms_content_protection: Get HDCP capable
 outputs before modeset
Thread-Topic: [PATCH i-g-t v3] tests/kms_content_protection: Get HDCP capable
 outputs before modeset
Thread-Index: AQHctQQBXnNWzDF5EUGO6v35OCmd8bWxMxlw
Date: Mon, 16 Mar 2026 14:24:05 +0000
Message-ID: <PH7PR11MB6796F69565C7C46EFE55B906E540A@PH7PR11MB6796.namprd11.prod.outlook.com>
References: <20260226164742.1845906-1-santhosh.reddy.guddati@intel.com>
 <20260316051351.15659-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260316051351.15659-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6796:EE_|PH0PR11MB5190:EE_
x-ms-office365-filtering-correlation-id: 712bfd21-9c02-4e3b-927e-08de8367adee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info: Nl7FdkAWkzx8XqPd7APcjWHFeesDsgWwgXQhzxxgKFzh6CNOAcIHjPLTTB/m2VT0dHDhdsXAWw8SUbfU//RXqOWa1Rv4a8mG86iW0bH+P9zq+zvuvQagIkCRqG/F+It9WSlPuM9KnvEdD8DjFokDFTmX6eu58a8BiTSv4xQ+yeMNv0mbjcOAnJ/i43MGgtqFILx6qPMUdc0fT0oResvnpGkQmzGZtI5zttaLnOxE6qi7YI7fbfdRh7wNNawbBIOqFyNLYTVU1btvUBX+2w2P3bGW6DxJYNPsJ4AID5TYXAHSNSjOQnAbg1ucC5WHaRM4G/UD81V6W2RtW8USYSeXQS3iD+P/+1cD6Ngh/V20DSW34eJ5a019FBa3qgXYREGi421/CZv4ti9YtjCZII6RWFXKKCVtKd7hdigL3b8tsFqO5OMnZbvcWxmBlPk7ArS+zzeYGzDj4Cu5rPt6PwYMc+Q54QJeE3ugQ9xRDTx43m/OtLtfbsaCDXOnbhi01SXOehgIIV/nSMbv5V8MDyDhLKaqr6u/PA+PIKNLLl6XdYe5K5N+3Km6i9J8nPxhUSwNacKn1YyyuHrio3mhqq6vaDTOO06xknHXZ6g1SDn5cv3ZiFTVbHufZiSK5taYblUrlScwmoJrhry2UtmLpJbd0/+CEhXdD84++j5Hj9NyChaPT+lD57Kukvt/g6s9jGc8gv9rA3FH8oYbNc+57AASIF1IC2jHMFnJIoP8vf45VT9fIO/L2F8MP08S4JYI0XFkQfcbnGcCrHFyEXvOAcPlLisR3b2s5uo7GtCaktln1Ww=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6796.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2JUclhpTGtaK2h1Y1cybHZNbTR4QlRPWkZwMXp4RzA1UEtsZGlhcTVXUm1K?=
 =?utf-8?B?WXZ0Q2RTY3o0SnozU3lva0FmaFVaWE5rSkpCa1p3dVQ2Y3dsMVhuVTg1a2xs?=
 =?utf-8?B?MXErZHdmd2cyNTgvOVdJNTJWRHd1dkpsWTkrN0pJK2Frb1Z6R0FvaWhzdUlt?=
 =?utf-8?B?Zy8zWjdZdER0d1VobjhkRGRYeDJ2T3RZU2QxUTduYzNJRUFxTUo5UGRLOGpK?=
 =?utf-8?B?bWpBRkFQNmN2dW0zb1ROYk9mS29NNGh2cmxobVhpaHltN3hpU0c1bVJHUmtK?=
 =?utf-8?B?TFA0OTFBeDY1UkRnNTBQdmdGUXdLdGt6cmZRc2tPSWtjSEZ0RUpqSGlkRjdm?=
 =?utf-8?B?U1J1K3gzUEZQZWdVV0xld0Y1dmx1aGNwZStlSFEvR1krZHdtM1pXYk9tMXAz?=
 =?utf-8?B?dFMzblV5Y0wyNUg5SXRaV3B3YjZEUUFsYXREZkpNUUVmZzM1czlLY3VpOTM1?=
 =?utf-8?B?K3BYTm5Id2xueXpxWFI1cFcyZXZJNGVDSjRmeHlsRmhGMWNNeW5kd3Zxd2cr?=
 =?utf-8?B?eVBDNzFGN25xY3d1cWNqcStreTUzb01tblBuZll6eDlZVWRBUUphRXM3bGxx?=
 =?utf-8?B?bnhyM2VheGJLOGd4Y0lZTEZmbnZULzV2ZUJ0RkIxMGwwWDJVaENCdVoxallO?=
 =?utf-8?B?Y3VleG9ZY084T0R1Uis1dnhFalhDeEFEeGhPSmU3clRBaDRUdkM2Y3ZUeE1Z?=
 =?utf-8?B?MVBlVmVWSmE4NG5RVEVVNE1pSDdZa3JUS0djcnlSQWszZUcwRVczTy8rTFpm?=
 =?utf-8?B?ZnVCN0RlTlBvN0xtMkdmQzQvV0xhQ2FyelNwWVdaa1Vmd1Y2bktSY2xvZ1M5?=
 =?utf-8?B?RHpjTDJUN0phM0hFUUVMeUhQV3FUOXEycE0wTVNlam9QTjRsWVpYU2xrcmVu?=
 =?utf-8?B?VlRRamd1NUVaemtTV0FxbDBYcG1RR3lseUlnenBORUplYU52U0FSUlJOZUhI?=
 =?utf-8?B?VzN5VWFxWDNZVkx0R1NvZ1lwQ01aVDBVZlZtOHdyWDhGM0JLYSs0bHhuaTdX?=
 =?utf-8?B?L2I2U1dnbTdBZForZmlVTXJBeDlNVng4S2h5T1FnWTVzWTJQdHcvMDVLKzgw?=
 =?utf-8?B?MEZwNTlUTC9PSjRpRTRVV3hqUWtSek1lVzZEV1lJTHA3T1ZXU05OV0JhWXNx?=
 =?utf-8?B?UHppazRPMnRIWldqSlI0RjJNMTQrc0F1a3RvTFlRQ2FDSHhBV3NTNURBcm0x?=
 =?utf-8?B?YjdSZjBwSlpDaStCTlFndm8vZ2VaZFZoc2NXMUJFWGg3V3hNU05oUGEwTEZ4?=
 =?utf-8?B?dGEzTW5jZCtGbTc1WnVOVC94ZWs2ZWN3WEM1L2FmNUxSeUR6WkRoTnVkb3NZ?=
 =?utf-8?B?aU9uQTRIZUFEY21Lbk8yVmUzK3hZYVRMb250aWJFb2NqN0xLcXRJZVZHTjI5?=
 =?utf-8?B?QXdxQ2V0N1RJaUZibUhya3lHMFFuZWVleno4NHBoUFBTRnNtUU9pWHc5R250?=
 =?utf-8?B?SXd2WGU4cnl3VXNKL3NHM2RSSGVDK1Ayb3JNemhlbXlPbUlZd2pxdVNKMDV5?=
 =?utf-8?B?R2ZtazRyYWZIckIvdHJtVjJwd2hRS1dzMTdKODRlYkJCWGhQTlR5d0thSUUv?=
 =?utf-8?B?S3FISTVLNWt0TGJyTVRnYTFYcmFhbThQZWxXekJTVVVJRFhBVVd4UUJaZWpr?=
 =?utf-8?B?QTdJOVBLNHo3NjRCV0NaUVpNZzNpZFJ4MEZpWHpCcTNFaWxMNkEvdTJUV1NF?=
 =?utf-8?B?TTMvN0RzOXVneThnVXlOc1N6QWl0Tm1CYktVM2NiMkdLUmRMM1VkK0hyYWVF?=
 =?utf-8?B?bUlsZFlxUVZuMU1LVnZwUHdBWmgwZWRCaHp6WmF0RWorL1ZXZFBSZUw4a2kz?=
 =?utf-8?B?bGtNcWpycFh1M1VvRi8xcjRPRUNZelo2Z0NTMGZHajBaYlNCaXY4UmNBMzh5?=
 =?utf-8?B?UDVWelhzendaekp4Z3NtL0ZEUlk0MVh1MmovdENtVzlMa3JROWNLczV1NWlv?=
 =?utf-8?B?NjdNTzhKUW9COEx5NGtzOC9GYzBBd1NpVUFsQUJmbmVud1pVR2dETlF4cWdS?=
 =?utf-8?B?a3hRbFhMekdnK1ZORFNZQlJUYkNJTWU0L2lsWGo5RkJFdGJDU2MrZFIwUmFK?=
 =?utf-8?B?Qzk4UzBpMmJaTHZtSmlWTktubU9MOWZLUElUUGYrSnNISEMvcXBZdDlySVpv?=
 =?utf-8?B?R2JBTG9MVEpqbWNrc3NOVFpZdzRQUWpDZ2JJak5KM1ZoN0hEa3dzS09udk1j?=
 =?utf-8?B?UGpOdFVRalRuZlZuQ3dwV0Nla0ZYQWRJaUxGTGNLQldJcjdTdVZPMEEyWGQ3?=
 =?utf-8?B?dkJBZzRUb2hQN0NrNWMrUS9iZERDeFRaYkZKNkpSK3hsOXlTM2NRRFZRZlM5?=
 =?utf-8?Q?1Jmw/mgQ9KV60cYFuN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: b+YTkl2GqJQ/h8YPUKZqYuB59K9kMCC6Gf66ueIbZguscZwQ/AHG63ArzscUxoR9r6VZPDS+fDXM3d75O8dbXon/BS7zAOPqm6788lOKCWV12xlSUhCKmr+TCvIWEva7LtUpVoRQUuBBaO8H8EBvmfXoxC0ki3a7i7xH9bkkC/J34nzL7es/oFy+DRqOzB10gMq95z4c0T56VP7hRB1RBCmSJ2OCbQcj6evLuVzvYsvPTmKSYvGYL9ZRgvHwv5kUqnv39RgntTyM7D2OQpO33wbiR5wNb7xE1q0nRfu9UGV9Q8rVG5CV4y84UdH76dW24aWzqqEyGGM/l8jjDST8Cg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6796.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712bfd21-9c02-4e3b-927e-08de8367adee
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 14:24:05.5822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qQBEWHcvGYax1gGEWa14C6AhDVXw9QuaXi/6IrOqmFbzE2/uJCDrEeRLCMQoYy8SeVEVh5jglhkdO7NI6sEcNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

SGkgU2FudGhvc2gsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0
LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9m
IFNhbnRob3NoDQo+IFJlZGR5IEd1ZGRhdGkNCj4gU2VudDogMTYgTWFyY2ggMjAyNiAxMDo0NA0K
PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEthbmRwYWwsIFN1cmFq
IDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT47IEIgUywgS2FydGhpaw0KPiA8a2FydGhpay5iLnNA
aW50ZWwuY29tPjsgVGhhc2xlZW0sIE1vaGFtbWVkDQo+IDxtb2hhbW1lZC50aGFzbGVlbUBpbnRl
bC5jb20+OyBSZWRkeSBHdWRkYXRpLCBTYW50aG9zaA0KPiA8c2FudGhvc2gucmVkZHkuZ3VkZGF0
aUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBpLWctdCB2M10gdGVzdHMva21zX2NvbnRl
bnRfcHJvdGVjdGlvbjogR2V0IEhEQ1AgY2FwYWJsZQ0KPiBvdXRwdXRzIGJlZm9yZSBtb2Rlc2V0
DQo+IA0KPiBGaWx0ZXIgb3V0IHRoZSBIRENQIGNhcGFibGUgb3V0cHV0cyBmcm9tIHRoZSBjb25u
ZWN0ZWQgb3V0cHV0cyBiZWZvcmUgZG9pbmcNCj4gYSBtb2Rlc2V0LiBUaGlzIHdpbGwgbWFrZSB0
aGUgdGVzdCB0byBleGVjdXRlIG9uIEhEQ1Agc3VwcG9ydGVkIHBhbmVscyBhbmQNCj4gYXZvaWQg
Y29tbWl0IGZhaWx1cmVzIGFuZCBpbnZhbGlkIHNraXBzIG9uIEhEQ1Agc3VwcG9ydGVkIHBhbmVs
cy4NCj4gDQo+IEEgY29ubmVjdG9yIG5lZWRzIGEgdmFsaWQgQ1JUQyB0byByZWxpYWJseSByZWFk
IGl0cyBkZWJ1Z2ZzIGNvbnNpc3RlbnRseS4NCj4gVG8gYXZvaWQgdW53YW50ZWQgbW9kZXNldHMg
YmVmb3JlIGNoZWNraW5nIEhEQ1AgY2FwYWJpbGl0eSBjaGVja3MsIGNvbGxlY3QNCj4gYWxsIEhE
Q1DigJFjYXBhYmxlIG91dHB1dHMgc2VwYXJhdGVseS4NCj4gDQo+IFYyOiBBZGQgY29tbWVudCBk
ZXNjcmliaW5nIHJlYXNvbnMgZm9yIGludmFsaWQgc2tpcHMgKFN1cmFqKQ0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2FudGhvc2ggUmVkZHkgR3VkZGF0aSA8c2FudGhvc2gucmVkZHkuZ3VkZGF0aUBp
bnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMgfCA0MCAr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9r
bXNfY29udGVudF9wcm90ZWN0aW9uLmMgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9uLmMN
Cj4gaW5kZXggZjM1YzlmYTczLi45NmE2MmJmYzUgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ttc19j
b250ZW50X3Byb3RlY3Rpb24uYw0KPiArKysgYi90ZXN0cy9rbXNfY29udGVudF9wcm90ZWN0aW9u
LmMNCj4gQEAgLTcwNywzMiArNzA3LDU0IEBAIHN0YXRpYyBib29sDQo+IGlzX291dHB1dF9oZGNw
X3Rlc3RfZXhlbXB0KGlndF9vdXRwdXRfdCAqb3V0cHV0KQ0KPiAgCXJldHVybiBpZ3RfaXNfcGFu
ZWxfYmxvY2tlZChzaW5rX25hbWUsIGhkY3BfYmxvY2tsaXN0LA0KPiBBUlJBWV9TSVpFKGhkY3Bf
YmxvY2tsaXN0KSk7ICB9DQo+IA0KPiArc3RhdGljIGludCBnZXRfaGRjcF9vdXRwdXRzKGlndF9k
aXNwbGF5X3QgKmRpc3BsYXksIGludCBjb250ZW50X3R5cGUsDQo+ICsJCQkgICAgaWd0X291dHB1
dF90ICoqaGRjcF9vdXRwdXRzKQ0KPiArew0KPiArCWlndF9vdXRwdXRfdCAqb3V0cHV0Ow0KPiAr
CWludCBjb3VudCA9IDA7DQo+ICsNCj4gKwlmb3JfZWFjaF9jb25uZWN0ZWRfb3V0cHV0KGRpc3Bs
YXksIG91dHB1dCkgew0KPiArCQlpZiAoaXNfb3V0cHV0X2hkY3BfdGVzdF9leGVtcHQob3V0cHV0
KSkgew0KPiArCQkJaWd0X2luZm8oIlNraXBwaW5nIEhEQ1AgdGVzdCBvbiAlcywgYXMgdGhlIHBh
bmVsIGlzDQo+IGJsb2NrbGlzdGVkXG4iLA0KPiArCQkJCSBvdXRwdXQtPm5hbWUpOw0KPiArCQkJ
Y29udGludWU7DQo+ICsJCX0NCj4gKw0KPiArCQlpZiAoIW91dHB1dF9oZGNwX2NhcGFibGUob3V0
cHV0LCBjb250ZW50X3R5cGUpKQ0KPiArCQkJY29udGludWU7DQo+ICsNCj4gKwkJaGRjcF9vdXRw
dXRzW2NvdW50KytdID0gb3V0cHV0Ow0KPiArCX0NCj4gKw0KPiArCXJldHVybiBjb3VudDsNCj4g
K30NCj4gKw0KPiAgc3RhdGljIHZvaWQNCj4gIHRlc3RfY29udGVudF9wcm90ZWN0aW9uKGVudW0g
aWd0X2NvbW1pdF9zdHlsZSBjb21taXRfc3R5bGUsIGludA0KPiBjb250ZW50X3R5cGUpICB7DQo+
ICAJaWd0X2Rpc3BsYXlfdCAqZGlzcGxheSA9ICZkYXRhLmRpc3BsYXk7DQo+ICAJaWd0X291dHB1
dF90ICpvdXRwdXQ7DQo+ICsJaWd0X291dHB1dF90ICpoZGNwX291dHB1dHNbMTBdOw0KDQpZb3Ug
Y2FuIHVzZSBhIG1hY3JvIHRoYW4gYSBtYWdpYyBsaXRlcmFsOg0KI2RlZmluZSBNQVhfSERDUF9P
VVRQVVRTIDEwDQoNCldoZW4gZmlsbGluZyB0aGUgYXJyYXksIGNoZWNrIHRvIGF2b2lkIG92ZXJm
bG93Og0KaWYgKGNvdW50IDwgTUFYX0hEQ1BfT1VUUFVUUykgOw0KDQpSZWdhcmRzLA0KU293bWl5
YS4NCg0KPiAgCWlndF9jcnRjX3QgKmNydGM7DQo+ICsJaW50IGhkY3BfcGFuZWxfY291bnQ7DQo+
ICsJaW50IGk7DQo+IA0KPiAgCWlmIChkYXRhLmNwX3Rlc3RzICYgQ1BfTUVJX1JFTE9BRCkNCj4g
IAkJaWd0X3JlcXVpcmVfZihpZ3Rfa21vZF9pc19sb2FkZWQoIm1laV9oZGNwIiksDQo+ICAJCQkg
ICAgICAibWVpX2hkY3AgbW9kdWxlIGlzIG5vdCBsb2FkZWRcbiIpOw0KPiANCj4gKwloZGNwX3Bh
bmVsX2NvdW50ID0gZ2V0X2hkY3Bfb3V0cHV0cyhkaXNwbGF5LCBjb250ZW50X3R5cGUsDQo+IGhk
Y3Bfb3V0cHV0cyk7DQo+ICsJaWd0X3NraXBfb25fZihoZGNwX3BhbmVsX2NvdW50ID09IDAsICJO
byBjb25uZWN0ZWQgb3V0cHV0IHdpdGgNCj4gSERDUA0KPiArc3VwcG9ydCBmb3VuZFxuIik7DQo+
ICsNCj4gIAlpZiAoZGF0YS5jcF90ZXN0cyAmIENQX1VFVkVOVCkgew0KPiAgCQlkYXRhLnVldmVu
dF9tb25pdG9yID0gaWd0X3dhdGNoX3VldmVudHMoKTsNCj4gIAkJaWd0X2ZsdXNoX3VldmVudHMo
ZGF0YS51ZXZlbnRfbW9uaXRvcik7DQo+ICAJfQ0KPiANCj4gLQlmb3JfZWFjaF9jb25uZWN0ZWRf
b3V0cHV0KGRpc3BsYXksIG91dHB1dCkgew0KPiAtCQlmb3JfZWFjaF9jcnRjKGRpc3BsYXksIGNy
dGMpIHsNCj4gLQkJCWlmICghb3V0cHV0X2hkY3BfY2FwYWJsZShvdXRwdXQsIGNvbnRlbnRfdHlw
ZSkpDQo+IC0JCQkJY29udGludWU7DQo+IC0JCQlpZiAoaXNfb3V0cHV0X2hkY3BfdGVzdF9leGVt
cHQob3V0cHV0KSkgew0KPiAtCQkJCWlndF9pbmZvKCJTa2lwcGluZyBIRENQIHRlc3Qgb24gJXMs
IGFzIHRoZQ0KPiBwYW5lbCBpcyBibG9ja2xpc3RlZFxuIiwNCj4gLQkJCQkJICBvdXRwdXQtPm5h
bWUpOw0KPiAtCQkJCWNvbnRpbnVlOw0KPiAtCQkJfQ0KPiArCWZvciAoaSA9IDA7IGkgPCBoZGNw
X3BhbmVsX2NvdW50OyBpKyspIHsNCj4gKwkJb3V0cHV0ID0gaGRjcF9vdXRwdXRzW2ldOw0KPiAN
Cj4gKwkJZm9yX2VhY2hfY3J0YyhkaXNwbGF5LCBjcnRjKSB7DQo+ICAJCQlpZ3RfZGlzcGxheV9y
ZXNldChkaXNwbGF5KTsNCj4gIAkJCWlndF9vdXRwdXRfc2V0X2NydGMob3V0cHV0LA0KPiAgCQkJ
CSAgICAgICAgICAgIGNydGMpOw0KPiAtLQ0KPiAyLjM0LjENCg0K
