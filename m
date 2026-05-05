Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131C0CD342F
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 10:50:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C29810E10E;
	Tue,  5 May 2026 10:50:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZGV3lyk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F3D10E9AB
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 07:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777966672; x=1809502672;
 h=from:to:subject:date:message-id:references:in-reply-to:
 mime-version:content-transfer-encoding;
 bh=OntQNa4Q789i1yRW9qjm8720/QXw0gWP4U0GjwQvfbs=;
 b=KZGV3lykJLwOu1LvGO41T/byvEHfC3yhJZ91lyblK/QBUEc4Xz9gA3B+
 SYeU3meqwc2P8ia8ffyh7uDPUlhaNG5ewKTZrQ704myF1N8feGaFUfO1b
 1hd4huMYtz72sCWi8fLSCbs+yhwP7Rc+dtv5C4Vm8l10N4rymTNhE9v7L
 TE5v2s4eztz0US+7XJVcVAxZZ8/uxUFD8qgHqtJxtpM3bTNDZcXwZ+muc
 8QG/KsZAj9ZmqELeCZIWxHVTQkF2ljMroeDalKyOjbSj4aji4azsHBRoK
 ssiyv4mJYhE54u0nbpVCu5/uxpHhMuMRhObK6aXzwVuNatnu2u0eZVKiA Q==;
X-CSE-ConnectionGUID: +Sbd7Kt6TJSEBg4Edl9WYg==
X-CSE-MsgGUID: ZQSfifSzRGSYfj9v3Vd1Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="82444061"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="82444061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:37:51 -0700
X-CSE-ConnectionGUID: u4bUWaCYSHKWdzsh9vzOZA==
X-CSE-MsgGUID: TWucwx0YQkCjdsclc1xMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="240716647"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2026 00:37:51 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 00:37:50 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 5 May 2026 00:37:50 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 5 May 2026 00:37:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fn+U+0kVN5iHiJNnfN/ptOvOeBE+HAtuqm4PANgIryDFg3rEAwOFAFYp+CPKlVVsAeeDOtJvgmewawGTR6YHF+msCfyow7k9zYhi+P2FJ552slpkHD5mfh8B5IhGOE8gs5hkygQLJZVGn5IB4Rkfba6WLnMEs/9cjEmt5Ra1S4Tnino/H53V70GMEcVHg47/NgOtfye8CCaqZ2wAqVEjIX0Ar4RMzzl45RAW0EhftbXAaeH661JJh2O8Wles/721Vry+x9HH5sjViBOQ4yvNlEQRODz4NHbY4tr3e+T4RTiOYeAmVv0M/lMjz5FDTzI1DVQ7MKgqNbjtmd75/ZMK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SlFykIltDC5mq0mBDcDD3ItlGu8PbXFVkTB+6NdXbg=;
 b=GBnfidTNQehXj/jIreGnpC529Ikt+3ROWVLBbp0mtNwmrl8UUH7ZB8YS9cGGPcLKUbMDVKB2Z8qy8u/aRkDuVpuDprT/eKc2OV59h8cFvirhpV5ndT7NjeK+OnFp6P78hnAWsXg3HdSHCZ2Pl845hmtR7YJpJ0iTxA6gsOYPNSKIMXhOLL7Lgs0fVkcz2s/UOozcOz1E3swCVQCFQZSbaKZI9m7o8U10XHRd9HKuuF71ZvF2dkpNtyJlsPHVvtyOFDOkE++XJmqed0y2/aKfS01THNj6CeiM3z4QT1JwXEwwtu4NjdG67uRBNfUFLT11WWgldNxyp2KXwoW3CLYlVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB7589.namprd11.prod.outlook.com (2603:10b6:806:34a::14)
 by IA1PR11MB6194.namprd11.prod.outlook.com (2603:10b6:208:3ea::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 07:37:43 +0000
Received: from SN7PR11MB7589.namprd11.prod.outlook.com
 ([fe80::6ad6:b410:3f21:cccc]) by SN7PR11MB7589.namprd11.prod.outlook.com
 ([fe80::6ad6:b410:3f21:cccc%6]) with mapi id 15.20.9870.022; Tue, 5 May 2026
 07:37:43 +0000
From: "Grabski, Mateusz" <mateusz.grabski@intel.com>
To: Adam Miszczak <adam.miszczak@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "marcin.bernatowicz@linux.intel.com"
 <marcin.bernatowicz@linux.intel.com>, "Knop, Ryszard"
 <ryszard.knop@intel.com>
Subject: RE: [PATCH i-g-t] tools/vmtb: Add VMTB fast-feedback testlist
Thread-Topic: [PATCH i-g-t] tools/vmtb: Add VMTB fast-feedback testlist
Thread-Index: AQHc15qG7AVR/7WuOUSSuwdqFgn8rLX/E4SA
Date: Tue, 5 May 2026 07:37:42 +0000
Message-ID: <SN7PR11MB7589F612B18364FFD37048C3E73E2@SN7PR11MB7589.namprd11.prod.outlook.com>
References: <20260428082243.299243-1-adam.miszczak@linux.intel.com>
 <20260428150934.5cifxdcou2jvhafv@kamilkon-DESK.igk.intel.com>
 <7ef59b71-4a9f-4a63-b1be-5675c857b59a@linux.intel.com>
In-Reply-To: <7ef59b71-4a9f-4a63-b1be-5675c857b59a@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB7589:EE_|IA1PR11MB6194:EE_
x-ms-office365-filtering-correlation-id: 7bba105d-b54d-4681-8c65-08deaa793166
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: Trb7Z6BhapWop/6FdjVOQ9SYOJ85a5jRuORtWbafv/HFhAUVV15F+4ltuCX2tugzeb2kkoeh/7dUhY4+Ous8bQGkEauUxKk7yQLldn0f2qHmjelBjTjKKqDjsbXwCioszuc34SEwRdwurXpCODn1jzIWxDlOe5dhNLRntL40LpwKhHyTR04HAO6fOnXKVmPYZQ188Yr+pXnlEUsh3CAAltCM9rQAoJ0v+6Xf2rfSJwIyaB47dP9X/WVua0S4uIgJoUXVx/XvXxpzWKo+xYiMlWaBZQlZFhre2/YOu8nqdhK2avTFThbNNPehCb5vzo2GyZ3gDo4tsRHyGmbFqrRNqivYqJzAly+l4HlYWREzKYZQNdVvYyWLSyMix2h/Z8e4NlQtcTRwdk9aam5WGNDK+1Urqvm17VzFnTRYwe9Teqh4Fc7UCwNquwV/k7Mtpu74Lncd78eMr9vmm/WdxIOLfYFCi40x6ZLXBj1qa1KLy6hC6EYDsxOS1acUBt3Q9bj4V9/QT3hU/rWGjWE6Mm0cJCHa5fb6HlHsu7/oKChgUhnLUcCYpgn8XFXmSdxcAhmn+OsvA9icg/0OIi+CrmXL67KGbUEvlgVsX9mFbBuezgJPP/8BSOjQT4GRWHzUFQayNYagfpMMDc12XSZW5KjpWX6HMPN8UGDCuYUk+nWd1ZbLJrwBoRGPQVySuhbsvI5n2cypmdOVbwQ9hffR7W4bvwhGIR/2ceif9vFpTXf/6FDb+xsp5U5/Y+jD1sX4w39A
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB7589.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NU1GOVVMalEzTXY1YnFhekdWTmsrK1M1L2VjcU5MdTl2enZlTlJhQzlyaUFS?=
 =?utf-8?B?b3VadzdOVjlOWnFid3ZHZnhJMTYwdGJ1aDltYUJ6SS84Vy82M2RJSFVodTJM?=
 =?utf-8?B?VVZoVXZCOFphZ2pDamNjZy9FVUIxZkcxaU9yaUhoalF1SHlXV3FpY1hDVzJj?=
 =?utf-8?B?RGF4ZW1VNjY5NHlib1VTUUJvb25SdTRFdFd5aEdYTWlWNXVvbE5UZkZCZHFI?=
 =?utf-8?B?dU5uRVowWGgyUXdNUFpKM1BFVWhyQVpYTzkyS3dXcXA0ZGJMS1FyWHRBR09Z?=
 =?utf-8?B?RnFTRWRMamNmcCtIQTBCV1RzVGtCbVpsdnBOYlQzdGdFM3RWQ0FxUm5lck0v?=
 =?utf-8?B?WWpRVUQ2TEEwaEZPbm9DekZvTGZpT2E2SFhwdnQ3KzZHRGhmL2lVdjFmUEI1?=
 =?utf-8?B?dTgzaGl6LzhtTkdUSnlZRDlHUi8rZ0tDOHpPdnpybEZuN0MvWGFYd0dDZVNF?=
 =?utf-8?B?cCtCRERCSnBIRCtsQTFhVU9PMFcyOWUyZHhjbTZVY0VsUERlck8vWlNBeEFu?=
 =?utf-8?B?Y3ZLaXFTc215Si9oTGlyaEt4NjgwemdUaVdja3ovNXFUdFBEMW91alYrSlNv?=
 =?utf-8?B?RFZQNzRTbWx0aFVXTUtMNm5lK25uczBCMGFVZ3MvTGw0QjM0VVQ5NkRzVDRq?=
 =?utf-8?B?VktsVEFKVHM2c3NtUVhGaGZCelNibUh1a0gvdlpNWTQ2OXRZdlBINVZMTnhj?=
 =?utf-8?B?aWYzV1FRWjZKRkpHNi9EdjJLOC9BcUtDcDZwdzFLamlLNUUzdW1sZWhyZGJ3?=
 =?utf-8?B?dW05QkhudXMrbGZOQ2lXNEM2dmNnVXBVKzJ0bUJXWHllZ0xkZWpOTTg0SU5J?=
 =?utf-8?B?UUcwUTkvK09HQURiK25TRU15dTFNZlNzdG96Q2tUeGI1OXVNWnpBZFJSRmpT?=
 =?utf-8?B?NG5yMVhmanFCeE1RWEJIR1Q3QWw0RkloU1Rja2hQbnlHamtkWFYwMDdzdDM0?=
 =?utf-8?B?QXRsWGM2S29BSkVHa0Q0TnFKYmhYcDF3UzcrU1padmJ5U0tHRDBUUkswazR5?=
 =?utf-8?B?UHpIdE0vMjF6MFlYd0xCZko1WUpiaHV5REVJS1RlV0Z5c0JzdndReGxiTHZi?=
 =?utf-8?B?UXB3VTdvdUJ5dmNoVHpaNG9aaXpoeWVoTzI4b3UyNmx4S0ZWanpNVnBUenVZ?=
 =?utf-8?B?elh5dmhBV2pjVXNZWUxZT0Y3QU1aNmd6a1VpcTU2Y3E2YisxNFR4YnVmSFRk?=
 =?utf-8?B?ZjN4K0l3dDJsUmdHSUxZVHM4Z3F4cXVUTmUxaHhXbzdjVUdEaENMb1RsWGwx?=
 =?utf-8?B?THBpaE10c1hLS1Foa2ZzU0xKWmpnSDZVMEZITVdSN210ZUx5azY2Y1ZWSlJh?=
 =?utf-8?B?c1owQmNQZFh0QVdiUC85ZFRCUTZxRDZ5aXl1VTRiaUVDUDhIQmJzODFUN2Zp?=
 =?utf-8?B?SXBNaVVadDNsNFZOcmNZWGEreEljYnp1SGZiN1ZOblRtUGZEUHVZT0ZpSXZJ?=
 =?utf-8?B?V3h3bGltNFRpbEsvRXFJVWZJTHNTUzVLYmR6anBPbFg0dS9KdzltWDE0US9r?=
 =?utf-8?B?eWxSYzBWYVd4RlVoeFBZN0UyZEFKRXlJNldHV2UzNjB3SUVsRU9ZVXZSR1lL?=
 =?utf-8?B?akY3N2VDZHZFenJKSXd1eStGWFZOWU1aalUxZUx1WWVsYm9PQ2F2Q0RkaHEx?=
 =?utf-8?B?Z0VDaGhBNGo4ajFjc3pYT1lZNHRNblJiUm93b2dKQzk0cDcwcXRjT1B0aUk1?=
 =?utf-8?B?c3g0YVFycDBkSnVCRGovbW91d2p6VFZvSzk1VytjclZSajBBTitqaHhJWnlQ?=
 =?utf-8?B?TktGM3lxMmt3SGdLa2NndklUQjVSQk4yVm5DcGYxVlUycERTTjAreHV4Y3Bl?=
 =?utf-8?B?YjdwV2Z2cDZwZHpYbG9wZ0R1Y090VmFtT093RDU5Z3gwc1IvenFTazN4dlRr?=
 =?utf-8?B?WThwSzV6VjJocS9GRmpIbUNBQ1o4VmpTSmtud2oyZXNFL2krbjBaTWxPZVhO?=
 =?utf-8?B?VzBaREE3RzAyZVk3djFzZWlOby90azdMazlVV3hoVjMyZUxXdmlnU3RJUGQv?=
 =?utf-8?B?N2RSZkliRHFNQVhrdnRFcjEzV0Z0c0JFOVJHUzlxL0ZlWFUvb0h2VlJsYmZu?=
 =?utf-8?B?WHZmTUFTV0Zic0VPK1JabDRyWlJLSFVKWERHMmhUWWd4Q09rYlVKZ0l2ZHBL?=
 =?utf-8?B?TlF0ZmpTdGRzN1hQWk5QVjIrMHVKcFlDU1ozcWJua2FnYXZ1ODU4RHdTMnF1?=
 =?utf-8?B?dnNoRGF5c3crRDJRS2RQZTBiSnZqcHpqWVJqcTNEc2x6NkJXMmhBNkZGUjBO?=
 =?utf-8?B?WURFMjFrWGpUeGgzWGdtT054eVRWL3gwQnFMZStmQ253Vmt2ZzlwZXdoYlRw?=
 =?utf-8?B?NmVFLzVlbWpuZVZUU3ptd094NTRldTVRT2kwQ2JTSS9GYXdvZ2F1dz09?=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XZF+kMh5ZfAwGhWKAHGskeidwULDWmQD0u6rEttqu6KVFbKpX8fmn48srlNI8cI8XJdnUdVhNjFDbj8RyLvVQXYrJNmuuxl9ofIq395+hmbWS1IlR/C9C/WNjqja6cFfvMjYd1l8kpm0Qu3gYlJVVL6V/O1Hah+KL9QGbilmHLf3pejN1MrHaOuFUjzpsiBti1lfEK+qVJjYb8F2kSbOzf3QTIV2hy/prXM9HCR7lGWv6PpP4yLh1iHUl7cUYGQI74d7KnQd/zRWmY9ZrwJl0JShXtgB/+t8k6KBbBv2a+0kn35NJMZuQC3dQivvILezqJwIzdLpNSHo0OV1x5yO5g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7589.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bba105d-b54d-4681-8c65-08deaa793166
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2026 07:37:42.9124 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kNONoD/X7S7TU+bab9UyyX1Sivw9cx/wttg6dgpF6FGs2/K3KD3VtLbINJfQnXgCHMMA5HtwT+i/S46RaEnL4uilPpo/CTz7PfX+myjqP1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6194
X-OriginatorOrg: intel.com
Content-Transfer-Encoding: base64
X-Mailman-Approved-At: Tue, 05 May 2026 10:50:35 +0000
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

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBBZGFtIE1pc3pjemFrIDxhZGFt
Lm1pc3pjemFrQGxpbnV4LmludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEFwcmlsIDI5LCAy
MDI2IDc6MzkNClRvOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRl
bC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbWFyY2luLmJlcm5hdG93aWN6
QGxpbnV4LmludGVsLmNvbTsgS25vcCwgUnlzemFyZCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT47
IEdyYWJza2ksIE1hdGV1c3ogPG1hdGV1c3ouZ3JhYnNraUBpbnRlbC5jb20+DQpTdWJqZWN0OiBS
ZTogW1BBVENIIGktZy10XSB0b29scy92bXRiOiBBZGQgVk1UQiBmYXN0LWZlZWRiYWNrIHRlc3Rs
aXN0DQoNCg0KT24gNC8yOC8yMDI2IDU6MDkgUE0sIEthbWlsIEtvbmllY3pueSB3cm90ZToNCj4g
SGkgQWRhbSwNCj4gT24gMjAyNi0wNC0yOCBhdCAxMDoyMjo0MyArMDIwMCwgQWRhbSBNaXN6Y3ph
ayB3cm90ZToNCj4+IEVuYWJsZSBiYXNpYyBWTSB0ZXN0cyBhcyBCQVRzOg0KPj4gLSBjcmVhdGUg
YW5kIHByb3Zpc2lvbiBWRnMsIGFzc2lnbiB0byBWTXMgYW5kIHByb2JlIGd1ZXN0IGRyaXZlcg0K
Pj4gLSBleGVjdXRlIHNpbXBsZSBJR1Qgd29ya2xvYWRzIG9uIGJvb3RlZCBWTXMNCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBBZGFtIE1pc3pjemFrIDxhZGFtLm1pc3pjemFrQGxpbnV4LmludGVsLmNv
bT4NCj4+IC0tLQ0KPj4gICAuLi4vdm10Yi92bW1fZmxvd3MvaW50ZWwtY2kvZmFzdC1mZWVkYmFj
ay50ZXN0bGlzdCB8IDE0ICsrKysrKysrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4+IHRvb2xzL3ZtdGIvdm1t
X2Zsb3dzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvdG9vbHMvdm10Yi92bW1fZmxvd3MvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlzdCAN
Cj4+IGIvdG9vbHMvdm10Yi92bW1fZmxvd3MvaW50ZWwtY2kvZmFzdC1mZWVkYmFjay50ZXN0bGlz
dA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMC4uMzdjNGRlYTNh
DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi90b29scy92bXRiL3ZtbV9mbG93cy9pbnRlbC1j
aS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+IGltaG8gaXQgd291bGQgYmUgYmV0dGVyIHRvIGtl
ZXAgQ0ktcmVsYXRlZCBsaXN0cyBpbiB0ZXN0cy9pbnRlbC1jaS8NCj4NCj4gK2NjIFJ5c3phcmQN
Cj4gQ2M6IFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGludGVsLmNvbT4NCj4NCj4gUmVnYXJk
cywNCj4gS2FtaWwNCg0KPlRoaXMgaXMgVk1UQiBzcGVjaWZpYyB0ZXN0bGlzdCwgc28gSSBzdXBw
b3NlIGl0IHdpbGwgYmUgbWlzbGVhZGluZyB0byBsb29rIGZvciBpdCBpbiB0ZXN0cy8gKGRlZGlj
YXRlZCBmb3IgJ3JlZ3VsYXInIElHVCB0ZXN0cykuDQo+QWxzbywgdGhpcyBpcyBqdXN0IHRoZSBm
aXJzdCBWTVRCIHRlc3RsaXN0IGZpbGUsIHdlIGNhbiBleHBlY3QgbW9yZSBmaWxlcyBmb3IgZGlm
ZmVyZW50IENJIGNvbmZpZ3MuDQoNCj4rK2NjOiBNYXRldXN6IEdyYWJza2kgPG1hdGV1c3ouZ3Jh
YnNraUBpbnRlbC5jb20+DQoNCj5UaGFua3MsDQo+QWRhbQ0KDQpJbiBteSBvcGluaW9uIGxvb2tz
IGdvb2QsIGl0IGZpdHMgaW50byBob3cgSSBhbSBlbmFibGluZyB2bXRiIGluIHB1YmxpYyBDSSBh
bHNvIHRlc3QgYXJlIHRha2luZyBlbm91Z2ggdGltZSBmb3IgZmFzdC1mZWVkYmFjaywgc28gdGhl
eSBhcmUgZ29vZCB0byBzdGFydCB3aXRoLiANCg0KUmVnYXJkcywNCk1hdGV1c3oNCg0KDQoNCj4+
IEBAIC0wLDAgKzEsMTQgQEANCj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIw0KPj4gKyMNCj4+ICsjIFZNTSBGbG93cyBmYXN0LWZlZWRiYWNr
IHRlc3QgbGlzdDoNCj4+ICsjIGRlZmluZXMgdGVzdHMgdG8gYmUgZXhlY3V0ZWQgcHJlLS9wb3N0
LW1lcmdlIEJBVHMuDQo+PiArIw0KPj4gKyMgVGhpcyBpcyBhbGxvdyBsaXN0LCBuZWVkcyB0byBi
ZSBleHRlbmRlZCBpZiBuZXcgIyB0ZXN0cyBuZWVkIHRvIGJlIA0KPj4gK2FkZGVkIHRvIHNjb3Bl
Lg0KPj4gKyMNCj4+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIw0KPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4+ICsjIEJhc2ljIFZGL1ZN
IGNyZWF0ZQ0KPj4gKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMNCj4+ICt0ZXN0X2Jhc2ljLnB5OjpU
ZXN0Vm1TZXR1cA0KPj4gK3Rlc3RfYmFzaWMucHk6OlRlc3RWbVdvcmtsb2FkDQo+PiAtLQ0KPj4g
Mi4zOS4xDQo+Pg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCkludGVsIFRlY2hub2xvZ3kgUG9sYW5kIHNwLiB6IG8u
by4KdWwuIFNsb3dhY2tpZWdvIDE3MyB8IDgwLTI5OCBHZGFuc2sgfCBTYWQgUmVqb25vd3kgR2Rh
bnNrIFBvbG5vYyB8IFZJSSBXeWR6aWFsIEdvc3BvZGFyY3p5IEtyYWpvd2VnbyBSZWplc3RydSBT
YWRvd2VnbyAtIEtSUyAxMDE4ODIgfCBOSVAgOTU3LTA3LTUyLTMxNiB8IEthcGl0YWwgemFrbGFk
b3d5IDIwMC4wMDAgUExOLgpTcG9sa2Egb3N3aWFkY3phLCB6ZSBwb3NpYWRhIHN0YXR1cyBkdXpl
Z28gcHJ6ZWRzaWViaW9yY3kgdyByb3p1bWllbml1IHVzdGF3eSB6IGRuaWEgOCBtYXJjYSAyMDEz
IHIuIG8gcHJ6ZWNpd2R6aWFsYW5pdSBuYWRtaWVybnltIG9wb3puaWVuaW9tIHcgdHJhbnNha2Nq
YWNoIGhhbmRsb3d5Y2guCgpUYSB3aWFkb21vc2Mgd3JheiB6IHphbGFjem5pa2FtaSBqZXN0IHBy
emV6bmFjem9uYSBkbGEgb2tyZXNsb25lZ28gYWRyZXNhdGEgaSBtb3plIHphd2llcmFjIGluZm9y
bWFjamUgcG91Zm5lLiBXIHJhemllIHByenlwYWRrb3dlZ28gb3RyenltYW5pYSB0ZWogd2lhZG9t
b3NjaSwgcHJvc2lteSBvIHBvd2lhZG9taWVuaWUgbmFkYXdjeSBvcmF6IHRyd2FsZSBqZWogdXN1
bmllY2llOyBqYWtpZWtvbHdpZWsgcHJ6ZWdsYWRhbmllIGx1YiByb3pwb3dzemVjaG5pYW5pZSBq
ZXN0IHphYnJvbmlvbmUuClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5IGNvbnRh
aW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvciB0aGUgc29sZSB1c2Ugb2YgdGhlIGludGVuZGVk
IHJlY2lwaWVudChzKS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwgcGxl
YXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXM7IGFueSByZXZpZXcg
b3IgZGlzdHJpYnV0aW9uIGJ5IG90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLgo=

