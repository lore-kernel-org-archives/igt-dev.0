Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F076CD8CAE
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jun 2026 04:55:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F1110E080;
	Tue,  9 Jun 2026 04:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IajDy5Gj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D8510E080
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jun 2026 04:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780980930; x=1812516930;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8wOdTdAaOiIAHYX0OKuWxj7CxJccyPlcfXfQTEKJ/tg=;
 b=IajDy5GjEDpmWZDR0eUqUhFzj/2uyJ/5nAvZ/1BQyHtHcgI1lv9Cbr00
 01IhCT8ey3WEHbawSuz2PwyLb3bb4t4X+sjLYLjmMJG/hEL2h4m1ytIK9
 wE9WK2HyxaqOd2M2q7NxfdwWVg2jz/gxFOwHDmTLtXMJNUYmQ11fGhh/N
 WJ9VIgwUe4R64NAqLQae1Y5ORf1oUHK/iCnnpc3LwFwFYpKhlKDLdwoYE
 gWyDe07cthBSn8LFknCqYfr+Mabw8pQrMCKYZ2w63Tvu7LT5ZlLpwU7pu
 tqwYPbuK+Msw5YQsszC5Mk6WiFn780azKhQH3YQTigxyk4rZcPKnVBG4H A==;
X-CSE-ConnectionGUID: vdCllf2+QumdZUUvCKcYKQ==
X-CSE-MsgGUID: LO5WXb8YSwqbXnj3RcIcyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="81919057"
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="81919057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 21:55:30 -0700
X-CSE-ConnectionGUID: LrFtVfOpSGiuQyBg+iuE/w==
X-CSE-MsgGUID: vmFRVOQgQwq70BUoJSOxUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,195,1774335600"; d="scan'208";a="242807170"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2026 21:55:29 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 21:55:28 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 8 Jun 2026 21:55:28 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.15) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 8 Jun 2026 21:55:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BueSUMb+W7bNS6+0ImtvuGCnLqVSJTLRBiwG5ufoqoTu3LcaanU9nHOOrK0rmhWpYPoRUOosmjFhNtrz63RGFzmFXPlRu/OOkNHOgZ3fNdOJ25zsjLBXnsBuEe161PqWvgoX9aSXTKldP9FslgvLBenFlthz7dCTOxYLravn3XJ41a9yPXFewxb6mXcZn9qoL8nOaFgKfz/YR0IygltnBSJIjuihDP10h9sCvuXi64NroWLGCX8PIoH2z4WBJzC+oQtauw0H89gAv27LV/7tztMGtqyb/7cLnkEtoRzQQCc9OxaM1SxQCVhmT8n7ErhPb4T9RviFPBsIgJfQWkBvZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wOdTdAaOiIAHYX0OKuWxj7CxJccyPlcfXfQTEKJ/tg=;
 b=pMiIdj929i8fSifZSuzjzBzUWorRys5EHSplW0o3+W7qKZRMkUOOj3VJZBRaCGv98vowU/m13/19CjYeQKC3lMlO6JnqkRX0P+7s8ozKYM7IvYRkn/lyldPrKTFbctkHbjO1zAZy8Suy1jFsm3TpI6UW6ARmP/oklIUomJpaqTh0kmIncLqLGfyfcYIvwz7CYc9/wgbI8e4BwuuWlyOdEty4YHAnIE529YHioXVEBxhlSTX3ixW9rexSMjnbaINHYMclsKfwwLLL0DiGM/xCMT9YG+UfQQTzik+LijDLWpfhG4EGHNwzVMNkbcqczjRyZFgNd9QUbshRu+jun3yfuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by SJ0PR11MB5937.namprd11.prod.outlook.com (2603:10b6:a03:42c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 04:55:20 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 04:55:20 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: =?utf-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [i-g-t,v3,2/2] lib/tests: make igt_get_output_max_bpc() return
 status and handle failures in callers
Thread-Topic: [i-g-t,v3,2/2] lib/tests: make igt_get_output_max_bpc() return
 status and handle failures in callers
Thread-Index: AQHc9qRrkjE6cAfAxUahRtQMPE3m3bY1qn7A
Date: Tue, 9 Jun 2026 04:55:20 +0000
Message-ID: <PH7PR11MB6053C39B4DA708C0B2B14949E71D2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260529063230.754253-3-pranay.samala@intel.com>
 <3ed14927e0f0a7b07b0e9203c472d4a3e1128e55.camel@mediatek.com>
In-Reply-To: <3ed14927e0f0a7b07b0e9203c472d4a3e1128e55.camel@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|SJ0PR11MB5937:EE_
x-ms-office365-filtering-correlation-id: 8026aa7d-afd5-4186-8aa9-08dec5e34ebc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|11063799006|4143699003|56012099006|18002099003|22082099003|3023799007|38070700021;
x-microsoft-antispam-message-info: yQGdCmmm9Mubd9Ls94ciN20Ok6Nxt83jZC2kX5IY+VQsBtU3qCwGXmBUcyPY/2ZcctaJ0nqNbqz921fA1KcysqDcAknJ2yTV6Vzs9T+ncwte4I0bsmbAay0CW/oDQAusO4LQTKJH5dTqfjsnyMjgpD6OtX7DqWC8FG67tbah+tO1N2f9+b4kjM2Sbjkx2SDUXCeWhIFLEey4EbuQcQESjTpLcHD392pobfkunrIdKhBEmF6NjvtH9hxgKOcTLj0zWEnGL2Wm06wx4XZ3dGsACIW9krG9sVNP+dFqPszuaKfF+YuJXdR/VlJ0aJqzgi0mLqB2OcvTHrXIdndz6vNYwk/Rdu2jTCToVXz+ehqFk0zOjRFuIsheR4DwcB+bDV+DNsHWd5b3e0Qi1bnZlshhJndEUNYeCdWmTIRc0epmmLpCDjMb4AO6xDNf0K4+6QQjI9+x8+HST9UcpJ/YeRbecqkecdCd0qxhMgPbKr1xhKC3Bm3itayM6JATCQeeKy/UIz7WoYrAHT2OpCPFzLiHA5r6plLYStsn1IYRirU5ZoEOnxHyUlz010p1E09XghzN5FJTsw467x9A52sOcY9Sxl57L5uzztUKOLKIbuNX2kt4zCAb0tdfVjS71jfMETD9uNhYE+fxvaosM4uvDzPilpi+0/nt850HW+51aPAk3iQYFZBQF1wfWoyqvebVjWxMeI0ATebDtN6co4Kkt0+ZFA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003)(3023799007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bzJpMUI4Rm1GbnhlZEdtZGlhVGVMd0R6RmRIalpFcHZYZnV5L2hRckVRbFBj?=
 =?utf-8?B?UkkyTWlYTTZWbVlybU53d2JQamRIc2o2c1VCK2M5MjdPUk90RTBRUytSZ240?=
 =?utf-8?B?TkMwS1lkcWlrZlBHUW5SZS95MTZGdm40L1NrVEkwMHFRbTFrY0VVR1NIWCt6?=
 =?utf-8?B?OTZ5OFBNYlR4SThGQjhrRlQrNTNneGpEelhzRWh0WGZ6WkRUaTRQbkIyUlNt?=
 =?utf-8?B?cDQwcHRnMElxbkFtUktNZkdRZzRmSmVqL3B0NVE4UXZScE9sMkZpK09kdy96?=
 =?utf-8?B?dysvTHVFK1hIamRHdnVyTG1DYS9lTjJIeXV2TzhZcXRVRnh5NFpFeWJIbm10?=
 =?utf-8?B?K0FyMjB2ZVVwN0NCYjM3NnF5VzFSQkZ2NndMYnp4bnErUGhuWHlGZ2dTY2Er?=
 =?utf-8?B?UXpFL29rUGlobktLRTVyUTdDY1ArYWtJL3NnSUM3YkVkMFV6dEdzYkp6eE0v?=
 =?utf-8?B?Rlk0RDlhejdlYWpxRkdpMTFkMXF2QzBNNU0reDN2T3hPTzlFdUNzQWxRd29Y?=
 =?utf-8?B?WTF0SHNGd251UXczZkdhYnZhT1A2bVVRRzd5MCt6YXFjdlVJZ3hmUzFOOGxa?=
 =?utf-8?B?N1M0V0NSZVlROURQSEhCeGNJTnVtSUdvU0Fyd1NkRk1KQWNGZ3ltY1ZhUDBC?=
 =?utf-8?B?WEp0UkZGL1l3UkJzWmxmUnlvM0Rra1JwVE8vd1VqN0lOSENzdkVwT0QwcnUr?=
 =?utf-8?B?bUFNZFUyYW9oMjNWdmF2dEdzQ3E4TXRSQ20wUWNJdUFyNnRWR1JGSU9RVXBK?=
 =?utf-8?B?MnpzcnN4N2VZNGlMVnFRSGR5N1NHS0tWMytKK3VyTFlGNWNJb2VNUHE4NTJR?=
 =?utf-8?B?OFh6MXpoTEZsOGZSTVBTSUZiaWVqVU9iV200YWtuMExLbEJrc3ExdjRxVWo2?=
 =?utf-8?B?SmxWVjd1TzlzdVNlQ0lqejZ5azZnVEd2U3NNYkFXVmZyeWxLUDQrak9EcVRy?=
 =?utf-8?B?cXJ0RzNtWFA0SFBTaTYwczk4ZDhBL2FXb3VoOFJnSWMrNW9KeFdTSmtVMysx?=
 =?utf-8?B?VWlsVUZCZVN3bUtpSVg3ZDdEdDN2Slo2aC80dmQxbzd5V3FyOWRSRjU5N243?=
 =?utf-8?B?aFpKZG84Y0FkSW9Qb1NsOVdxTVRhcGk3aTA1dDBsbG5jN3NBVFRTdnMzRjZM?=
 =?utf-8?B?TUlSeUtKdHR5UWxnUTRscWxjdjlJT1IyQjdYeWxBejYxbHFRcEQ2SkxMRStP?=
 =?utf-8?B?YVZjV01CR2k3aVBQNlZ1d1NyUW1vQzBwRVBDT1hTZTZqQzROVGZ4K25NY0ZR?=
 =?utf-8?B?K1MycDFmY0d0ODh6V3BKOXJ0UVcyb1NrM3d3Y1Q0M005VjJmUzFHYmJmbHZh?=
 =?utf-8?B?MzhQdVJSMzhyT3lBQkNraElrNjJ6SzkxRWJEUU9RTWgwam5rUnNvbG5qY1ov?=
 =?utf-8?B?amJWaVp1eXUxRnVrUnN3VGpHWHpIdTZKUUdCUGdXSGQxRWtnbVBQYml5RFRV?=
 =?utf-8?B?bUNsY3I1cW9sNEF4MDlwT21jNHZWMDcvNnJpeEtNY2FGYTk3ZUJ6ZnpBWFBG?=
 =?utf-8?B?a2pGK20rMGtIY3M2MDBpMldOc0RnSmsxR3VpdzdNd1pIZDJRVVN6OXYvZm9h?=
 =?utf-8?B?RGQ1L3V0ZkMySFpQNU1kYzBvZWZNSVRTM2t0UFI4cHlqSC9sZE5xM01nKzZa?=
 =?utf-8?B?Y2ROU0EwZFRyaklZTUtaOGxUUXhaeVZRUkNrd0Radis0TlcyOVR6ZEFrUW1N?=
 =?utf-8?B?TWZqNTVnREJyNXN4QmkwSmNYUFZZUEZIdVpSU2ViUVNJOGFJbnYzakpJUndB?=
 =?utf-8?B?eFNaSWUvYWNhbG5UcnFnUXQxeko3S1BZUkdIeXZLeEwyczVpV0RmN0RnVFBJ?=
 =?utf-8?B?UmVBT0ZGUFhMTVpiOEZJQ1RSZncxdnlZS3FYYUNpeXplb3REVGxEcU8xVkxV?=
 =?utf-8?B?M1dMMHhuTTBxMyt5VXV5QlZmNVNFNjM0eW9rZkgxamVOOG9qSmo4R3VndTYx?=
 =?utf-8?B?TjVLYVh6SUJ2OVhuOWdVYUMvckRnNlhDdjBRRUpGV3V5N0YvS1N4RFRQditS?=
 =?utf-8?B?cUdyb2Q5ZWVjdGZPNDVSeHpOSk01WWNrQlZUejdFVWYxRy9UaVlkUWdJcGxV?=
 =?utf-8?B?MnBpNFVKbkxib2dwRXIzV1NWRU9oRk0zQW1UMDdkMkVCam42aFQyNTMxYjZ0?=
 =?utf-8?B?Q29GT20rckRsQVZJOXQ3V1pOem5JM0dwRDU3cFZGU3cvNjdKQU94dmtuMHls?=
 =?utf-8?B?K2NlUmE2T2pMdHV2dDcvZGJlbFJyRWxKbzZqVnlGNHEzWWtobFRsVXEzNjh5?=
 =?utf-8?B?MlR4MzhLZzBYdDlhc0V4dU9HT2N5M0pOZDZjb1NZTUdxSXlIV0JCNkV4V2hY?=
 =?utf-8?B?V3NndnpCRWJUK25xdWNJTmZZNUZBYkhxNFdmdnhDRXEzZ2dlR3RJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: O0RV600OseiFaYLiE7Q/lovGTTYzifWj8+kkst3aJuY0rNBBiuzzCjzFI0wDapAce0S43FaU+7toX+gF7q3Pb/5or9BhNFLddDAlz/IHs0LiQ3Bg/+xlxV3iu+oxl2KYJI2Bl6MBn77sVK5HtMIXj908I2aLQb9bS6k8yFeIAfJMlqyaLlQEYkFshc0xkatQMLkCzkdiRl9f1vt7kzo0emu3iDWZx8bTLtEpirIbpGqmie1YXJ0SFWNf27CKzX+4MUF0ltCL3GKKW2LzDtdmBafyIFODMxvwY3orzjsn/EaQKgqL+IV+xvberBnXXSYUKWwKVgjh2QMpGgXnS57deg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8026aa7d-afd5-4186-8aa9-08dec5e34ebc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2026 04:55:20.2001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8BK3OvJ+Bw/yW2Lp/U43wlf7cXVBqhwDyB1vXoCDsnmEBaJemLrzRKaVtKKYbtqEGh0b5I+MwMHA+dWSCyaR/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5937
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

SGkgSmFzb24sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24t
SkggTGluICjmnpfnnb/npaUpIDxKYXNvbi1KSC5MaW5AbWVkaWF0ZWsuY29tPg0KPiBTZW50OiBT
dW5kYXksIEp1bmUgNywgMjAyNiAxMTowOCBQTQ0KPiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IFNhbWFsYSwgUHJhbmF5DQo+IDxwcmFuYXkuc2FtYWxhQGludGVsLmNvbT4NCj4g
Q2M6IExhdHRhbm5hdmFyLCBTYW1lZXIgPHNhbWVlci5sYXR0YW5uYXZhckBpbnRlbC5jb20+OyBC
IFMsIEthcnRoaWsNCj4gPGthcnRoaWsuYi5zQGludGVsLmNvbT47IFNoYXJtYSwgU3dhdGkyIDxz
d2F0aTIuc2hhcm1hQGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtpLWctdCx2MywyLzJdIGxp
Yi90ZXN0czogbWFrZSBpZ3RfZ2V0X291dHB1dF9tYXhfYnBjKCkgcmV0dXJuDQo+IHN0YXR1cyBh
bmQgaGFuZGxlIGZhaWx1cmVzIGluIGNhbGxlcnMNCj4gDQo+IA0KPiANCj4gT24gRnJpLCAyMDI2
LTA1LTI5IGF0IDEyOjAyICswNTMwLCBQcmFuYXkgU2FtYWxhIHdyb3RlOg0KPiA+IENoYW5nZSBp
Z3RfZ2V0X291dHB1dF9tYXhfYnBjKCkgdG8gcmV0dXJuIGJvb2wgYW5kIGZpbGwgYW4gb3V0cHV0
DQo+ID4gcGFyYW1ldGVyIGluc3RlYWQgb2YgYXNzZXJ0aW5nL3JlcXVpcmluZyBpbnRlcm5hbGx5
LiBUaGlzIGxldHMgY2FsbGVycw0KPiA+IGhhbmRsZSBkZWJ1Z2ZzIHJlYWQvcGFyc2UgZmFpbHVy
ZXMgZ3JhY2VmdWxseSBpbnN0ZWFkIG9mIGZhaWxpbmcNCj4gPiBpbnNpZGUgdGhlIGhlbHBlci4N
Cj4gPg0KPiA+IFVwZGF0ZSB0ZXN0IGNhbGwgc2l0ZXMgdG8gdXNlIHRoZSBuZXcgYm9vbGVhbi1y
ZXR1cm4gQVBJIHNvIGVhY2ggdGVzdA0KPiA+IGNhbiBkZWNpZGUgaG93IHRvIGhhbmRsZSBtYXgt
YnBjIHJlYWQgZmFpbHVyZXMuIFRoaXMgc2VwYXJhdGVzDQo+ID4gcmVhZC9wYXJzaW5nIGZhaWx1
cmVzIGZyb20gY2FwYWJpbGl0eSBjaGVja3MgYW5kIG1ha2VzIHNraXAvY29udGludWUNCj4gPiBk
ZWNpc2lvbnMgZXhwbGljaXQgd2l0aCBjbGVhcmVyIGxvZ2dpbmcsIHdoaWxlIHByZXNlcnZpbmcg
bm9ybWFsDQo+ID4gY2FwYWJpbGl0eSB2YWxpZGF0aW9uIHdoZW4gbWF4IGJwYyBpcyByZWFkIHN1
Y2Nlc3NmdWxseS4NCj4gPg0KPiA+IHYyOg0KPiA+IC0gQ29tYmluZSBsaWIgJiB0ZXN0IGNoYW5n
ZXMgaW50byBzaW5nbGUgcGF0Y2ggKEthcnRoaWspDQo+ID4NCj4gPiB2MzoNCj4gPiAtIEFkZCBk
ZXNjcmlwdGlvbiBmb3IgdGhlIGhlbHBlciAoU3dhdGkpDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBQcmFuYXkgU2FtYWxhIDxwcmFuYXkuc2FtYWxhQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiDC
oGxpYi9pZ3Rfa21zLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDQxICsrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiA+IC0tDQo+ID4gwqBsaWIv
aWd0X2ttcy5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgIDIgKy0NCj4gPiDCoHRlc3RzL2FtZGdwdS9hbWRfYnlwYXNzLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqAgNiArKystDQo+ID4gwqB0ZXN0cy9hbWRncHUvYW1kX2RwX2RzYy5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrKystDQo+ID4gwqB0ZXN0cy9pbnRl
bC9rbXNfZHNjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTMgKysrKysr
LS0NCj4gPiDCoHRlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgMTAgKysr
KysrLQ0KPiA+IMKgdGVzdHMva21zX2NvbG9yX2hlbHBlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgNSArKystDQo+ID4gwqB0ZXN0cy9rbXNfZGl0aGVyLmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrLQ0KPiA+IMKgdGVzdHMva21z
X2hkci5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE2
ICsrKysrKysrLS0NCj4gPiDCoDkgZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKSwgMjIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBIaSBQcmFuYXksDQo+IA0KPiBXb3VsZCB5b3UgcGxlYXNlIHJl
YmFzZSB0aGlzIHBhdGNoPw0KPiBJIGdvdCBzb21lIGNvbmZsaWN0cyBvbiB0aGVzZSAyIGZpbGVz
Og0KPiANCj4gdGVzdHMvaW50ZWwva21zX2RzYy5jDQo+IHRlc3RzL2ttc19oZHIuYw0KPiANCj4g
DQo+IA0KPiBJIHdhbnQgdG8gcmVzZW50IG15IHBhdGNoIFYyIGJhc2VkIG9uIHlvdXIgY2hhbmdl
cy4NCj4gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzcyNjQxNC8NCj4g
DQo+IFRoYW5rIHlvdSB2ZXJ5IG11Y2guDQoNClN1cmUsIHdpbGwgcmViYXNlIGFuZCBmbG9hdCBp
dC4NCg0KUmVnYXJkcywNClByYW5heQ0KDQo+IA0KPiBSZWdhcmRzLA0KPiBKYXNkb24tSkggTGlu
DQo=
