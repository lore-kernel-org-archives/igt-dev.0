Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60E4606A339
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CSV+lv0k
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7785410E035;
	Mon, 26 Oct 2026 11:50:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32A510EE77
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793015392; x=1824551392;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B6XZmmOGEki2Y2xlRpliWh1cETUwAKTXY9lUCkaa3vA=;
 b=CSV+lv0k+NmX5JsxipmTykh+XgQ0ogkJ1Eym5uiOrNOLn+wmv9eRFNSc
 p7AjPYVVJywZrUHtcUP7LsSmmKtpn4/3ftdE4LhzW5I5K6Mo864UlKw0K
 Fdqrz493johenLxrx+ScgkqsKsyg3MiDNyyCyLK3eS2D6rv6ITzoB/p6G
 Sv2v/xxB+zqstdDsGrCO/LZQIoySE/mcd+UBdI9k6REe/Jr97Ei2qrqj7
 ZIdQkWilwCii9RDHjK8N4T0DU/pr/8brvUPh333XRhjEt2TQQ6c55W6vD
 Qm6fBHSKPX+Lggj2Jvxed0Cv3a2ekL/C2maFsSxNRgaJqujhV8Ewh5PZj A==;
X-CSE-ConnectionGUID: OdQhAy/tSJa7yx1KLgro/w==
X-CSE-MsgGUID: 1pGqev1BSaW3h+uJj5turA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1712608"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1712608"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:49:51 -0700
X-CSE-ConnectionGUID: zpcv2WKzSUyah4Wq7lMHug==
X-CSE-MsgGUID: 5vyLjrXySB6dCA2G0L0Wlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4353268"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 04:49:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:49:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 04:49:50 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 04:49:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tf1cQzYt65m+Z2otc5b8gXzVmmK+sTv8T4No6wC8RznnUwhF26LHb5Fxg8coUnT+e79HXtrjd2pq35GI7Tu/YCxtIDlAv5CELgBfixDf2f5H4kmqhz4zJg30Dxxw5aN7XvjUJS4g0RcFRkWlYMlEWjhaxBeqxuP8QQT6CrzmbeZBiRNIhPe2r0Her+4rBgX2tLShfZe9V+96WinVzibzKmYG9Xc7/IUEHKzOsX3kl2EwQVAE0uxphC0IVl7WzNSQZbgnGOQAAL3Lq6nXL8O9bTksnPNXSQ7nfTbrTjL1sraTPexsgyGNh7Dc+StvvkI3EhRsb5IGZBPc553FsMeD9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llU6ZwgQEKaKyAwykcpf6mb0v0NG9IO2Rk4PSebM5YU=;
 b=aNOLiH1/avDnTAv0TGzLnH3KL+DGtWDR4RSFQM1RnqO5t+lDBGhi53GcuNFW+c0N1PygMrsBQvJ/8l7S7HQtykVrVYXkTe0nLeo8zf2eTlsH1DXJYgrsY2mG4R1UOBH0wgDGZTMleeUx12xfD3Wfa3VZLyw48a6/3uymzVBldfoSjXTA6SWIkzAClfAGT+H7qhiZOw0DN/EMmqXXXaJF94jCrlxNWdIzpCu/myYJm+pajexWbBwAyWwgpetnHe3QscGCbzB6Y6rZw51T0Q5KNe5uk1i2dko49Xa1FgocdKtoZOj6NtogeoCYgFK4eeQSJLULloPrpfJWiU0uWYn/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CO1PR11MB4819.namprd11.prod.outlook.com (2603:10b6:303:91::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:49:47 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:49:47 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: RE: [PATCH i-g-t v2] lib/igt_eld: Avoid asserting on malformed SAD
 fields
Thread-Topic: [PATCH i-g-t v2] lib/igt_eld: Avoid asserting on malformed SAD
 fields
Thread-Index: AQHdZSJ9eyiCzGAeokq8siuPN2xh7LcPtZMA
Date: Mon, 26 Oct 2026 11:49:46 +0000
Message-ID: <PH7PR11MB6053504732E249C3CC031049E7612@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20261026075429.2796932-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20261026075429.2796932-1-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CO1PR11MB4819:EE_
x-ms-office365-filtering-correlation-id: a7c1ced1-d970-4dd2-cc43-08df33573bf7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|261021123027099003|11063799006|5023799004|56012099006|261009223027099003|261022105027099003|261021121427099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: x2bEb6qFKx89o6HvBQiCgFJ6t8Zgr9M16dFYznHCNBSaU1XrEd0h9ErwdENCLUYuyhg1L+dYA2ZkR4XV1sFkhvZyoS68i/PKcOBSQyYjWmYYiKyJIZEsF4S5xw00JmEa8l3AH9Cs4GmsiE4L2X2Xwy9JTe4wKcoPMGpMEYqlXRVaf5vhtossjbDE0ZXIiIeqc7WM9C4J/ZOsFyRliCr/UL4nzZCp+TL3jJjq2ArICyL35FnsuPVxvqLO0X43T870npM9OUWl4ILY1Q3YisTHmr5qSvbc0Pi55+4TIlAGDDV+TD2Xtwkd8x+L3eOirhn6njJfUYYXq2ZvfAxBFTKtEcxul6Lwyw6ZB45doWINDYqVQp2zz1lrFujq1WTrrS1kK9DkdQIIZ5sJtzOURqxCjCBIoay/OEAq8hzgZWRfobB0qJj8Pvm0C0VtcWXudvcCP68yLu1zupx57kNriKrHEvO22EKL6MGJidjPaoB6lP6ddGiUTg1x8LVzSRRUEh2h8ggiDHblOxD9o2xywSZe+VFER/BUDYprg7cayJR50FGtV7dpQQo/m5/u4vZ5wpRLkRLxbXU6ITbQUlGmjzPSrHJJx0jQc4zvUQ7bNOfJ3OGR45jnd/PAVw6VPIZVAsR9M/n4OJoAFkfmhorC8yLwwlODzqzbPLw/5GEj/IvQS/BEn0QoVMszdpP7+04g2pRNydttsm73gwqEBbw6FEsOU1VU4mBkm7YGzSGYuerFj8Y=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(261021123027099003)(11063799006)(5023799004)(56012099006)(261009223027099003)(261022105027099003)(261021121427099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z0ukhY9Im46pOEO74+nFLDKqCv+YzmgKHReS607dPEnIoIJFACcKXQ8FLULk?=
 =?us-ascii?Q?CV0oCNQEwxpIJtYWOTTYeg9LZmeyGhmP2iBFnpiQjQMNDFnOEqZvwnKgp1qW?=
 =?us-ascii?Q?tyjRXv70pX2gmby/9DDvWKKfYEcpdxLRgQCUdxv/T55Ea1jVrsJhAx/E57as?=
 =?us-ascii?Q?r6pqp80JiSMYVzd6CP5BSWzA+72D3i3+bTdrZ7z1uEQOmiDUsqsSVWF4tMcy?=
 =?us-ascii?Q?DPm24TDFq04aHyzkOKv+IB15fEavT3nLHLSs0oAKE7NJKwzlqfYEzIhJO9DD?=
 =?us-ascii?Q?YLRPeZMVOT1WeQT4AL2W3RqjgmVRhKyeAqosf3yuJLORIk4o9Vfo0M4eNV33?=
 =?us-ascii?Q?YpReO6XHfXuviITSPVcP4tJvRu+BodS8s0djdX8kXKNWxxt7fOFWOH1LVJlZ?=
 =?us-ascii?Q?btEgO3U4I4FieXrLpz2FjzVI7p7+S8o2/O3xqQwDb5YhO7k3SewMW/OF+zol?=
 =?us-ascii?Q?jYuFoPEMAaHHK44zkT/r1ub4hYOyVcG/nfnhQJE6wCwHMRMSYYJKPy0qz6L2?=
 =?us-ascii?Q?3+xgr5K/zb/H+zORraTxjf1pV20YsQuKnEW9JlnOeu0kL9o075RFlPatbbJL?=
 =?us-ascii?Q?JpicB49d7FDLVoLgvIQdjq70qzftzvJk9qRwSrPgGWtGf09Wrv4/a14X/6Hj?=
 =?us-ascii?Q?DMfHXt6YIbZ6sOamUiy6dvBR0gicfjyCDxlkVbGZjfU10LHBDMejDvfDt8XF?=
 =?us-ascii?Q?yBKRj3aBR/PsQMJoULGSP45cOW+3jQ/UCse4oABuvAZTdgLzS3YhMU9DdgqV?=
 =?us-ascii?Q?SL+t1P11wXWVj+OU+is81Zrs532GWgTTVfGyW+pQrJUD5vN9xC8P8JX6OewU?=
 =?us-ascii?Q?vrO2NC90T5Esz4Fmc4im4vZXTYS23qHZ/gir0RPeeOuIAdPQ+TQ4QhHEPjsY?=
 =?us-ascii?Q?p1knXN0+HFvmP0hGUnM/5HkwH91SqQsQMA2sAPAke8yP2IR9vQtsNFR4vbLT?=
 =?us-ascii?Q?p06GMOBwhS0h2hWBOqba8LMOeOJ46+bDQwJ8uKtSPbkVuiDK2Y9lwX0GRiG1?=
 =?us-ascii?Q?d0nKiOReg6CX4f25MZBf+Qu+ttBUMiNxQ6+DQ32aeVvfc+Ui27spJfPN71OC?=
 =?us-ascii?Q?LS0ZNEzOnsOz9qB5KKsaQymod7rZIpglpK0JdFyQG0tBZXPecEqDm+t6w7Iw?=
 =?us-ascii?Q?XLfil0TQLV3LEq2GikfvoBMls8+JS+VFmgjSMmJ9GkqgPNdE8HkRyxs7pj38?=
 =?us-ascii?Q?OgENSgHgK7goiepi3ydqxxXIBLkSFXxdv+9YLA/u2yB0y+e71fJ1cWqn4Uzy?=
 =?us-ascii?Q?CNs2vpUim8rd/Nn4gpbdHN0ntfJLLsV5is7rMWfkIER/StOD09rSn3+ikz0B?=
 =?us-ascii?Q?3oBNsuA9jE6VttPb55e3TOAvrc7Xmi0fywxqaMPkm/gvXawxnuzsNwvz6YTm?=
 =?us-ascii?Q?62Eo8Qi1LHCwsqUxPY2SFyZvkEiMlAQ24ymTgnnS6/hD6i4aJ4ffo5X/Nm7+?=
 =?us-ascii?Q?NhKwh6FIy5ofLWHAvgtO2bFsr0OqrFgnBTjB+7Iieo4jNZwrlfaB1QFRZ8rW?=
 =?us-ascii?Q?lLtinKuyGBnE752hWkidpVBFgWjsymXAiL0HAcSgNUK9DQa/M7dT+Mk592ei?=
 =?us-ascii?Q?MUl0jvaCBU0F5Ml9AkabDCB/aFsFax1tzEm0kBYd/3w+iH975wthBHFx56Sd?=
 =?us-ascii?Q?yvAm0yc4hL8N3O7nDyqFSOq/p7b8wWsWLUOlG8TLqVRy8ZkZHdnkAV+O9uT4?=
 =?us-ascii?Q?4B0E8AprIjaF9UU46tFMWgwMG3eRsvXsjIlVz8bTZo/wOMcMs7J9UXCq2IJZ?=
 =?us-ascii?Q?CWCNDGyt9w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: JEB338TAnFQqQTxk/b+YWwFHImPEOPkF0yQ1oj8Od/W+TeX3srQYXQ2gYt+i32z8iBplhjWzUT5AIADmp3a4Pj2xzLSFMeLYIOdKKPEP4zc9yOfu9N/L064VYkxYNodD0FQmXrn1cpRh4hJbm2l6+4EsbXYcizxNxQMNeTKkWPmeDKSL0OcabQ7a+Ig93I6r//uTwlu0mmc4vmUT3rXNgp4AIh1FIgG4mWY2bc+vQfRJHgDFIN6+hpNlz1ewdCkpLg8kUtnpudpKUHAtEHqxqFU6TFCtOt/a3mEFdUWS7qi0qH46WS9wP/xRrPWKehSNxdBbMG9KWUFlbCEhaEAomA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c1ced1-d970-4dd2-cc43-08df33573bf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 11:49:46.9615 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07noxM39LSJIQD0G9AI2nSDDhmEwP7no3T+hGnb5q0705vHZ/ES9ZZv6tYJubBT80K7n7brtoj8elGjyMmBDaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4819
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Chaitanya,

> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Monday, October 26, 2026 1:24 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; B, Jeevan
> <jeevan.b@intel.com>; Sharma, Swati2 <swati2.sharma@intel.com>; Samala,
> Pranay <pranay.samala@intel.com>; Kai Vehmanen
> <kai.vehmanen@linux.intel.com>
> Subject: [PATCH i-g-t v2] lib/igt_eld: Avoid asserting on malformed SAD f=
ields
>=20
> eld_get_igt() parses every /proc/asound/card*/eld#* node before filtering=
 by
> monitor name, so a malformed ELD on an unrelated, non-IGT device can
> abort a test that only cares about its own injected "IGT"
> EDID.
>=20
> parse_sad_field() strips the "[0x..]" prefix from sad%d_rates/bits via
> strchr(value, ' ') + 1 and asserts that a space exists after the prefix.
> But the kernel may not always print one if the ELD of a monitor is malfor=
med,
> which aborts unrelated audio subtests.
>=20
> Skip the malformed SAD entry instead of asserting, propagating the failur=
e up
> through eld_parse_entry() so eld_get_igt()'s existing continue logic move=
s on
> to the next ELD node.
>=20
> While at it, fix a pre-existing fd leak on the ferror(f) path in eld_pars=
e_entry().
>=20
> v2:
> - Fix "before"/"after" wording describing the space check (Pranay)
> - Unify freeing of sad_key (Pranay)
>=20
> Cc: Jeevan B <jeevan.b@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Cc: Pranay Samala <pranay.samala@intel.com>
> Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> ---
>  lib/igt_eld.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>=20
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c index 896ab0e6b..0d3c6689b 100=
644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -103,14 +103,21 @@ static enum cea_sad_pcm_sample_size
> parse_sad_bit(const char *value)
>  	}
>  }
>=20
> -static void parse_sad_field(struct eld_sad *sad, const char *key, char *=
value)
> +static bool parse_sad_field(struct eld_sad *sad, const char *key, char
> +*value)
>  {
>  	char *tok;
>=20
> -	/* Some fields are prefixed with the raw hex value, strip it */
> +	/*
> +	 * Some fields are prefixed with the raw hex value, strip it. The
> +	 * kernel doesn't always emit a space after the bracketed value
> +	 * (e.g. a SAD on a real, unrelated monitor's ELD). Treat that as
> +	 * "nothing to parse" instead of asserting, since we have no
> +	 * control over third-party EDID content.
> +	 */
>  	if (value[0] =3D=3D '[') {
>  		value =3D strchr(value, ' ');
> -		igt_assert(value !=3D NULL);
> +		if (!value)
> +			return false;
>  		value++; /* skip the space */
>  	}
>=20
> @@ -130,6 +137,8 @@ static void parse_sad_field(struct eld_sad *sad, cons=
t
> char *key, char *value)
>=20
>  		tok =3D strtok(NULL, " ");
>  	}
> +
> +	return true;
>  }
>=20
>  /** eld_parse_entry: parse an ELD entry @@ -166,6 +175,7 @@ static bool
> eld_parse_entry(const char *path, struct eld_entry *eld)
>  	char *key, *value, *sad_key;
>  	size_t len;
>  	bool monitor_present =3D false;
> +	bool sad_ok;
>  	int sad_index;
>=20
>  	memset(eld, 0, sizeof(*eld));
> @@ -198,13 +208,20 @@ static bool eld_parse_entry(const char *path,
> struct eld_entry *eld)
>  		else if (sscanf(key, "sad%d_%ms", &sad_index, &sad_key) =3D=3D
> 2) {
>  			igt_assert(sad_index < ELD_SADS_CAP);
>  			igt_assert(sad_index < eld->sads_len);
> -			parse_sad_field(&eld->sads[sad_index], sad_key,
> value);
> +			sad_ok =3D parse_sad_field(&eld->sads[sad_index],
> sad_key, value);
>  			free(sad_key);
> +			if (!sad_ok) {
> +				igt_debug("Failed to parse ELD field %s in %s:
> %s\n",
> +					  key, path, value);
> +				fclose(f);
> +				return false;
> +			}
>  		}
>  	}
>=20
>  	if (ferror(f) !=3D 0) {
>  		igt_debug("Failed to read ELD file %s: %d\n", path, ferror(f));
> +		fclose(f);

Changes LGTM,
Reviewed-by: Pranay Samala <pranay.samala@intel.com>

>  		return false;
>  	}
>=20
> --
> 2.50.1

