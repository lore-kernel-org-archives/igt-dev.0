Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D29F532D0
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 04:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29EF010E1C9;
	Tue, 24 Mar 2026 04:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B1GrimSy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD2C10E2BF
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 04:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774326432; x=1805862432;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=tDk7x7zCLkgO4mzYvUlU+TitDZHyc6Ieo8gU6QhS618=;
 b=B1GrimSyhuF0bTV2aEwvBq+1jq/b3SEE1GiA/9Fb6liNM0Qj8MO8JEbA
 eTdRnxu992lOP0B511gOT8+hjgtq7qimlso1QTbVivjhVCzuG8tIcIniH
 Okzt7Osu3jG32cejIW1dUj0ZSJsl/qWzKoaEl1XG3ogTAy4CSdZsedaZm
 uCyBjHCTAaSQo8wvccIjOE8IIV9f8Ia8pdlPUrYNYL8TyfBkK5etcqVUy
 s2jC7AMr+391EKdHI33J+St+X7eE26boTcC2b9urhmuhhYZJZz/jw3klj
 Agm7SQl5kvS75TpGdpyuUDYcm5MjdSyZ07PY97vZzf1Z4T7Zz2PyvBviq Q==;
X-CSE-ConnectionGUID: GkQUZY3mQxmsa4J9M30CIQ==
X-CSE-MsgGUID: fkSL180ZRb2qTE7MlkRbkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75359883"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75359883"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:27:11 -0700
X-CSE-ConnectionGUID: PbGGVGi5SFSfVZtk91tLuQ==
X-CSE-MsgGUID: KFS3+UqfS9Kxvsu+FKPtcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229171247"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 21:27:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 21:27:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 21:27:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 21:27:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VTYKaZsJhEc9DpLrklFXoE8azSrjTSyhAcjvlqvuVemnjGXZWwz+nQEpU7hLdjt++2L+mh056YBNlwlw+XtHGTbaSWZG5P5r9b/F4v30tr49jSNKvQf9y2MJNyjbLG3KDL/sYGbEy2dwtyCjFvQ34Ok+em+Y+j2wkgn+xF9LHrzkfFOKoNIOh9fCX07ewvVXwYLzZCXV3tLA/k22DMp+a3wWgz4YYQSl9/UjNnEbQx6MI1h6NSJ2c2bFUJaVTtHbVHPFYiktIDBIZr+F5jH9EjzDnfX13Nw0CE7BCU4gLsOA4KQKG2aw00RStUj4JO+JJec6FvMJrX2gVxuoUTecZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDk7x7zCLkgO4mzYvUlU+TitDZHyc6Ieo8gU6QhS618=;
 b=go9I7oX0VRrDIUuv+nH8j0fBHkP/AKiZVuGwMZHrymB9d9LHgxKec4YLDn0hM5XoB8tYyjHIw/2UnBtlvaXhJmtzylKtwG9dzrjvZrp86I5a02YWbxnxpNbUXDxZfmaXdyFdEFmmTV5BaV7Xw3F00houAu9kUnS7DesoSPZCbwNIyt/Qto57T3unW7Rkw+WUXMgyGel4niZipqxZkap18J7+MxqOO5WD3La7bbvwutQmo4LftlRdZcyzshgzpUnHWUciIPkmvU/+9MVf/rhxosvEaW9vOCW3huBF+HsQPi2bRXObdGpUcrw0c52MQBJj9oaBEqkEZj7nbpoQWoK4Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB8256.namprd11.prod.outlook.com
 (2603:10b6:806:253::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 04:27:07 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%4]) with mapi id 15.20.9745.012; Tue, 24 Mar 2026
 04:27:07 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: John Harrison <John.Harrison@Igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
Thread-Topic: [PATCH i-g-t v2 1/2] tool/intel_hdcp: Show actual HDCP status
Thread-Index: AQHcn3RDPbU8WrtKNU2V0s0GPHJf17WGMtHggADrbICACyr9AIAAMpqAgB81HQCACyakgIAAa4SQ
Date: Tue, 24 Mar 2026 04:27:07 +0000
Message-ID: <DM3PPF208195D8DEFB0B13D82E69455C33AE348A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260216184341.437722-1-John.Harrison@Igalia.com>
 <20260216184341.437722-2-John.Harrison@Igalia.com>
 <DM3PPF208195D8DAFED433B0156A8991F49E36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <852e3018-2ba2-4687-9794-49291636472d@Igalia.com>
 <20260224193044.vf5aauujilkcyth3@kamilkon-DESK.igk.intel.com>
 <8466ebfe-5d07-4330-b87f-d6757a65fadb@Igalia.com>
 <20260316190600.52rtxdxekh5dh6iw@kamilkon-DESK.igk.intel.com>
 <43c906e9-d9bf-432d-89a8-b734442a90f1@Igalia.com>
In-Reply-To: <43c906e9-d9bf-432d-89a8-b734442a90f1@Igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB8256:EE_
x-ms-office365-filtering-correlation-id: 66e06025-b874-4c74-71b8-08de895d9bd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info: r15LP/G0T7mdnR9zJvprW+aRnGYan9hA0LHxyRhNSHDBFYW8vVq6FixXDFxZ0/H+3LkMyDaIIgCZrtvJf4ZgRoGa3K+EEzwuP4Ixlx+JP5Tg6RlheeTRCehrKcZzSGGX96sZMyOGGagHpkGUfpGGT68hlDxy0BWFgo03Zz2wWM2lAqwIawaTwTAR+CTIXTj22ya83lhsllZYVATZO1PvnwTpA6Lcq5bgnOkY5GBEyvwN0mz7YLUnYj0tUYTBOa/nPIb7Od+baARLE3k0f2ouGuzwONI/R5uovN2Dw94hQnU3XPUZqQwhF1KlVLq4XA9LQihtbAaPlZZz+uBewzXYUtL/lhnSoFuc+6UpElQDr96ylkURJSGgMpfCvcYMlIfnOVxum1mFTFhl9ZI2hny6LbmQA5UAw9rreNYrpbmSzHbSghnU+PfMjMmpIUo9I5ZxVz2bkzc4qe8FKCLl4zJjdg6bkHJK6fyxfDBNR6McfdcEgTS43f3iZW0a7+32kwXVFOR96ZF8QwSnV1hF7tMhBgPLcD1kKtRK2NKDlFZ9IvKmJOYVsJcR0YG3OE67OhZL1r99ebEW27RDb63Fe/ajtISbEf1NV/2TdPjXykXspdJ7neClIXgJ4dpjcKwR3OP/flgocMIjrpgXkh/Jd+0M9ah9XxQFUnL7MeoBh3ly3ahVljoO3V072uQxH2fJCIDcLCAc0KsYszb0aO7fZT0MCK5JvM39bePqz/0jZL4LqYMQBDTPQXp4Mu7zOvLZVJRcXW9ecHxrF1ypNEnoOit3CSt2Wci20FMXDWElw5QK2yQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bVc1RkJ3aE5wek0wUzdFMEk4anh1MXRyaC9CdDNuSlZRMjFMZVFOb3dUNlhD?=
 =?utf-8?B?MHdKUldBdHp2ckxFRDU0a1EvVkU4c1Jad0p0TjlkeVZoeExIZmJFbTc5VFlE?=
 =?utf-8?B?SXlZVVFWamZ6V3lxNEs4b1lvSEYxd2RkOWJKRkZsVHgvU0psbHBNQnVsbGRs?=
 =?utf-8?B?MTlGckFGQkpPMEIwdFJtT1IydWhkb1p0a3M2Wmo5blZiODkva1JFa1NzRkNh?=
 =?utf-8?B?VEVsK2NVbm9OZnpDd1FiaW40L3o3amgwMFhLb2RtbzJXNll1bDdtODFVWk5B?=
 =?utf-8?B?WkRNRk52SDVtN1VscStZcmhSdjFET0dnNnFiVTFVRTE4MFdidUd6YUFjSytN?=
 =?utf-8?B?RDVZTEM0V2Z2alRIbWR3U3ozUTdDaUhWTGlHQTNTL2VZTlBnR3V1WFVGUlVz?=
 =?utf-8?B?LzVXV1FLUEYweGt3bDYrUFo1emZHTzBUdHV2ckVmZ0pGQWZHS3VjTENXTUxi?=
 =?utf-8?B?Y3VkZEpHbWthL3I1dFNHNFRmd09zbU0xMGhKQWZVVkc3L1dxNkFQeEFDbmdN?=
 =?utf-8?B?Y1FkUDFnRjM4NzQvWjJ3aXp4UGcwK1dKK1hZMm5nM1BWZ0RFWkNmalA1Q3hq?=
 =?utf-8?B?YmRlSjBvQWdTYXpueW0vMEl0ZmNsQk1IRGcxUnB6KytMV01EbGFISHU4bXdH?=
 =?utf-8?B?MW45UEFxWC8vR0JLM0FyTmxDM0IxRzZ1QzVlRjhUZnMyejQ1UVY3UEV1T1Ez?=
 =?utf-8?B?cXdsUGZqazExNW03a05qTTBoWG9sUDFpL0g4cHZjU1d1aDRCaWNaQ1BNTU9O?=
 =?utf-8?B?dDFNVGF1QkkyV201QVhZSFArcmxlOTRrZjhkclZsNzIzUXkyNWZCb1FyK2tZ?=
 =?utf-8?B?YjVTVmUrb0Zmd1dreC9yOTcvaDVaRllOSVh6UzFtWFJTUXdIcHBibnhid1Ns?=
 =?utf-8?B?cTNuTFF0a2xFNEx5VVI2V1pIQ0o0Ry9wN0tNcUlsbGxSMlFZazFyd0VIQUV6?=
 =?utf-8?B?Rjk4OTZ4b25sZ2thZWdrZC9vWnpoVm1MT3ZUMytwMjNhVUt5NFVVY1VMZjJh?=
 =?utf-8?B?anAvZ1p4SllxMWg4Zkh1QVk1ZUIvOHNQSDFuNmJHaE12d3dIT056aXhRUFhs?=
 =?utf-8?B?SlMzYzB1SGJRaVgvTEJhNzQyRVM4S041RUhzbmNHbWk2M1VIVGZmQlRlRGFK?=
 =?utf-8?B?WFBOK1lySjZpZmt4SmtldXd5ZmNMOHZKaFVHWWV6MHdwUzBhcUg4MnI4Qlpm?=
 =?utf-8?B?Vjc1b3FEei9mQWRrYzlBemVmNHBpbXoyRWRDQ090OWo1ejlsbFR1S3R2NDJ5?=
 =?utf-8?B?djJZZi9ZVWlDVXVFanZEL3VIZDJ1MkZSWG1jQ3RIcyt6VUExL3UvSFhMbkNJ?=
 =?utf-8?B?M3pnSmdTdlM1Sm1GaTJVRFU4QW5mcDFHMElBakdhc1dLc2JiejlHNmVodzdj?=
 =?utf-8?B?RWRJazBpZG4wV3VZMWhsb25uVXdCWmY0eVVqenJ0a29rcjN6dlVJb0tvaStO?=
 =?utf-8?B?TEF4YURnLzE0cDRtR3hDMWpUR2tjR0dHYzdtaG9ZbXZpUFIzcjRaWjFLeDV3?=
 =?utf-8?B?WWdHb3o2b3g4VXZPelVHVjBZTEtYZW41Z25TQmtYOVRsdlNRTEk5dmQxQnE2?=
 =?utf-8?B?VjlmQ1dtdFk4Vnd2T3NVc05ET1cwaWp3TUFReWlab2NoakZCekpGSE8vNExS?=
 =?utf-8?B?U0pSZnBxVGhWYjh3RlNmdkJ4RzA0Tk8vdzhXOHczWHRMT2NINGoremJNVmVm?=
 =?utf-8?B?Y3YvNEhuUEdvMzlDQXZWc3NzRXlOb08zZFY5bWRQZ3pYQ1lIL0ZXQTU5QnZG?=
 =?utf-8?B?dC9rV3hjbWFNQWtIRDA3MGZUV25pSXRjVGNLOGRSVnlOSyt3c01aZ2VzZlRx?=
 =?utf-8?B?NlhZNDllN3IzbUNDc0JNQ2FSR0x1U1dvRHZSQnNRV2pFR21KYTg2eFN0STI1?=
 =?utf-8?B?TnBWcS9WQVZ2a1JPR1FiWHNwTml4QWYyV0tvMHdMUDhMdFJtUVg3bWtwS1BX?=
 =?utf-8?B?Nzd2WG5FS0x6YmxBdVd3b1pJVTBqME9NMmJHSktVMU8xU0pHVXRIQXF6c0NJ?=
 =?utf-8?B?a0hvdE8vY1VBMU1URUlnblFEOUIra25xTEdldlRtR2Zvb1laR3hzcGRaS0dv?=
 =?utf-8?B?K0h5aSs1UHphN25BVXUzMFl1a2twdTM2ZzM1cnZGWnZNa1c1L1MweHRtK0dm?=
 =?utf-8?B?aW9NMDZHTWFUM0k2MGk3M3B5M3l5czY1U2hXS3hWeUNnUlN1eDVvYWxHMG1i?=
 =?utf-8?B?eFpuejhVNWNVMUFheGZOUmQ2UEpJRkN3a0RjdXhlV2Q5WjZqZmF0Rit3RkZE?=
 =?utf-8?B?Ujd6RDduMTl6TjFkQ1BJaEJpaW5Wem1ETVR5Ti84d21vRVlDTmVmVWlSY2Nz?=
 =?utf-8?B?a0RGR1gwY3J1VnJWZ1d6OWp3Q2NuRVBEQTdDdlBudmMxTUErUlN6UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: R3F2TMyL6547vBR5OjyXDfe9iaxlPxus5UfKrjdxEO6mQIssaAj4ORwv7QbRbuVVaFd7ZA6yxqf18n0xX/i4JWrkzq2YFkRF38GerYZcSA2jMvrl02Y/Md3c5dohhPnkSG9rXTnCWiQhFV6BX7GdrLYGgFXB6L2lyBAiUDJk1bJIlIcwREZgBMrMqZ6wwekMaFqeERnos+1xB9cf+Sf8pzq71tbTcLqnUJX7dFUNxQHjpqoUCWJ4MerXlrVExiGyP6gpg3tJvbjlS6lmr2n6f31UqcXhqTa1grOW19KKYz3gF7WYSw7bJDOUFWfbdqCBHb/hZfrkMp3ghKdZkoLpBw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66e06025-b874-4c74-71b8-08de895d9bd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 04:27:07.2304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DuxaaQgr8bSSVxvgNtN7neiXXI/byyIiF8DE4USAp8kx+iz2CBmT8w4s5cssR1LJYCKPYdXWJuYuGOwBwonIow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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

PiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IHYyIDEvMl0gdG9vbC9pbnRlbF9oZGNwOiBTaG93
IGFjdHVhbCBIRENQIHN0YXR1cw0KPiANCj4gQFN1cmFqLCBwaW5nPw0KPiANCj4gT24gMy8xNi8y
NiAxMjowNiwgS2FtaWwgS29uaWVjem55IHdyb3RlOg0KPiA+IEhpIEpvaG4sDQo+ID4gT24gMjAy
Ni0wMi0yNCBhdCAxNDozMTo1MSAtMDgwMCwgSm9obiBIYXJyaXNvbiB3cm90ZToNCj4gPj4gT24g
Mi8yNC8yNiAxMTozMCwgS2FtaWwgS29uaWVjem55IHdyb3RlOg0KPiA+Pj4gSGkgSm9obiwNCj4g
Pj4+IE9uIDIwMjYtMDItMTcgYXQgMDg6NTg6MDEgLTA4MDAsIEpvaG4gSGFycmlzb24gd3JvdGU6
DQo+ID4+Pj4gT24gMi8xNi8yNiAxOTowMCwgS2FuZHBhbCwgU3VyYWogd3JvdGU6DQo+ID4+Pj4+
PiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXQgdjIgMS8yXSB0b29sL2ludGVsX2hkY3A6IFNob3cgYWN0
dWFsIEhEQ1ANCj4gPj4+Pj4+IHN0YXR1cw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IFRoZSAndmlkZW8g
cGxheWVyJyBzaG93ZWQgd2hhdCB0aGUgcmVxdWVzdGVkIEhEQ1AgbW9kZSB3YXMgYnV0DQo+ID4+
Pj4+PiBub3QgdGhlIGFjdHVhbCBzdGF0dXMuIFRoZSBtZW51IHN5c3RlbSBkb2VzIHJlZHJhdyB0
aGUgc2NyZWVuDQo+ID4+Pj4+PiB3aXRoIGEgc3BlY2lhbCBjb2xvdXIgdG8gZGVub3RlIHRoZSBz
dGF0dXMsIGJ1dCB0aGF0IGlzDQo+ID4+Pj4+PiBpbW1lZGlhdGVseSBvdmVyd3JpdHRlbiBieSB0
aGUgcGxheWVyIHRocmVhZC4gU28gYWxsIHlvdSBnZXQgaXMgYSB2ZXJ5DQo+IGJyaWVmIGZ1bGwg
c2NyZWVuIGZsaWNrZXIgKHRvIGJlIGZpeGVkIGluIG5leHQgcGF0Y2gpLg0KPiA+Pj4+PiBTbyB3
ZSBkbyBub3Qgd2FudCB0byByZWZlciB0byB0aGUgbmV4dCAicGF0Y2giIGp1c3QgbWVudGlvbiB3
aGF0IHRoaXMNCj4gcGF0Y2ggaXMgZG9pbmcuDQo+ID4+Pj4+IEFsc28gZG8gbm90IGNhbGwgaXQg
YSAicGF0Y2giIHNpbmNlIG9uY2UgaXQgZ2V0cyBtZXJnZWQgaXQgYmVjb21lcyBhDQo+IGNvbW1p
dC4NCj4gPj4+PiBCdXQgdGhpcyBwYXRjaCBpcyBwYXJ0IG9mIGEgc2VyaWVzIGFuZCBhIHNlcmll
cyBvZiB0aWdodGx5IHJlbGF0ZWQNCj4gPj4+PiBwYXRjaGVzIGhhcyBhbHdheXMgZXhwbGFpbmVk
IHdoYXQgaXMgaGFwcGVuaW5nIGFzIGEgd2hvbGUuDQo+ID4+Pj4gT3RoZXJ3aXNlLCB5b3UgZWZm
ZWN0aXZlbHkgaGF2ZSB0aGlzIHBhdGNoL2NvbW1pdCBzYXlpbmcgInRoaXMgaXMNCj4gPj4+PiB0
b3RhbGx5IGJyb2tlbiBhbmQgSSdtIG5vdCBkb2luZyBhbnl0aGluZyBhYm91dCBpdCIuDQoNClRo
aXMgY29tbWVudCBzdGlsbCBzdGFuZHMgbWF5YmUgbWlzdW5kZXJzdG9vZC4NCkkgbWVhbnQgdGhh
dCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2UgZG8gbm90IHNheSB0aGlzICIgdGhpcyBwYXRjaCBk
b2VzIHRoaXMgLi4uLiINCkJ1dCBzb21ldGhpbmcgbGlrZSAidGhpcyBjb21taXQgLi4uLiIgcmVh
c29uIGlzIHdoZW4geW91IG1lcmdlIGl0IHJlYWxseSBpcyBub3QgYSBwYXRjaA0KSXQgYmVjb21l
cyAiY29tbWl0IiBhbmQgeW91IGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZSBtZXNzYWdlIHdoZW4g
eW91IGFyZSBtZXJnaW5nIHRoZSBzZXJpZXMuDQpBbHNvIHdoZW4geW91IHdhbnQgdG8gcmVmZXIg
dG8gdGhlIHRvIHVwY29taW5nIHBhdGNoZXMgaXQgbmVlZHMgdG8gYmUgcmVmZXJyZWQgYXMgInVw
Y29taW5nL2xhdGVyIGNvbW1pdHMuIg0KDQo+ID4+Pj4NCj4gPj4+Pj4+IEluc3RlYWQsIGFkZCB0
aGUgY3VycmVudCBIRENQIHN0YXR1cyBhcyBhbiBleHRyYSB0ZXh0IGxpbmUgb2YgdGhlDQo+ID4+
Pj4+PiB2aWRlbyBwbGF5ZXIncyBvdXRwdXQgc28gaXQgaXMgcGVybWFuZW50bHkgdmlzaWJsZSBh
bmQgY2xlYXIuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gQWxzbywgbW92ZSB0aGUgZW5hYmxlIG9mIEhE
Q1AgaW5zaWRlIHRoZSBtdXRleCBsb2NrIHdpdGggdGhlDQo+ID4+Pj4+PiBpbnRlcm5hbCBzdGF0
ZSBjaGFuZ2UuIFRoYXQgd2F5LCB0aGUgbmV3bHkgYWRkZWQgJ2VuYWJsZWQvZGVzaXJlZCcNCj4g
Pj4+Pj4+IGxpbmUgZG9lcyBub3QgdXBkYXRlIGluIGFkdmFuY2Ugb2YgdGhlICdyZXF1ZXN0ZWQn
IGxpbmUgKGR1ZSB0bw0KPiA+Pj4+Pj4gdGhlIHZpZGVvIHBsYXllciB0aHJlYWQgYmVpbmcgYXN5
bmNocm9ub3VzIGFuZCBtYW5hZ2luZyB0byB0dXJuDQo+ID4+Pj4+PiBIRENQIG9uIHdoaWxlIHRo
ZSBtZW51IHRocmVhZCBpcyB3YWl0aW5nIG9uIHRoZSBtdXRleCBsb2NrKS4NCj4gPj4+Pj4+IHYy
OiBTcGxpdCBpbnRvIHR3byBwYXRjaGVzIChyZXZpZXcgZmVlZGJhY2sgYnkgS2FtaWwpDQo+ID4+
Pj4+IFlvdSBjYW4ganVzdCB3cml0ZSAoS2FtaWwpIGhlcmUNCj4gPj4+Pj4NCj4gPj4+Pj4+IEND
OiBTYW50aG9zaCBSZWRkeSBHdWRkYXRpIDxzYW50aG9zaC5yZWRkeS5ndWRkYXRpQGludGVsLmNv
bT4NCj4gPj4+Pj4+IENDOiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4N
Cj4gPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSGFycmlzb24gPEpvaG4uSGFycmlzb25ASWdh
bGlhLmNvbT4NCj4gPj4+Pj4+IEFja2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmll
Y3pueUBsaW51eC5pbnRlbC5jb20+DQo+ID4+Pj4+PiAtLS0NCj4gPj4+Pj4+ICAgICB0b29scy9p
bnRlbF9oZGNwLmMgfCAxNSArKysrKysrKysrKysrLS0NCj4gPj4+Pj4+ICAgICAxIGZpbGUgY2hh
bmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPj4+Pj4+DQo+ID4+Pj4+
PiBkaWZmIC0tZ2l0IGEvdG9vbHMvaW50ZWxfaGRjcC5jIGIvdG9vbHMvaW50ZWxfaGRjcC5jIGlu
ZGV4DQo+ID4+Pj4+PiBjZDVkMmI2YmUuLjhlMjljNWUzMg0KPiA+Pj4+Pj4gMTAwNjQ0DQo+ID4+
Pj4+PiAtLS0gYS90b29scy9pbnRlbF9oZGNwLmMNCj4gPj4+Pj4+ICsrKyBiL3Rvb2xzL2ludGVs
X2hkY3AuYw0KPiA+Pj4+Pj4gQEAgLTQ4Miw2ICs0ODIsNyBAQCBzdGF0aWMgdm9pZCAqdmlkZW9f
cGxheWVyX3RocmVhZCh2b2lkICphcmcpDQo+ID4+Pj4+PiAgICAgCWNoYXIgdGltZXJfc3RyWzMy
XTsNCj4gPj4+Pj4+ICAgICAJdGltZV90IGN1cnJlbnRfdGltZSwgZWxhcHNlZDsNCj4gPj4+Pj4+
ICAgICAJaW50IG1pbnV0ZXMsIHNlY29uZHM7DQo+ID4+Pj4+PiArCWNvbnN0IGNoYXIgKnN0YXR1
cyA9IE5VTEw7DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gICAgIAlkYXRhID0gKGRhdGFfdCAqKWFyZzsN
Cj4gPj4+Pj4+ICAgICAJY3VyX3R5cGUgPSBkYXRhLT5oZGNwX3R5cGU7DQo+ID4+Pj4+PiBAQCAt
NTAyLDYgKzUwMyw4IEBAIHN0YXRpYyB2b2lkICp2aWRlb19wbGF5ZXJfdGhyZWFkKHZvaWQgKmFy
ZykNCj4gPj4+Pj4+ICAgICAJCQlwcmV2X3R5cGUgPSBjdXJfdHlwZTsNCj4gPj4+Pj4+ICAgICAJ
CX0NCj4gPj4+Pj4+DQo+ID4+Pj4+PiArCQlzdGF0dXMgPSBnZXRfaGRjcF9zdGF0dXMoZGF0YSwg
ZGF0YS0NCj4gPnNlbGVjdGVkX2Nvbm5lY3Rvcik7DQo+ID4+Pj4+PiArDQo+ID4+Pj4+PiAgICAg
CQlzd2l0Y2ggKGN1cl90eXBlKSB7DQo+ID4+Pj4+PiAgICAgCQljYXNlIEhEQ1BfVFlQRV8xXzQ6
DQo+ID4+Pj4+PiAgICAgCQkJYmdfciA9IDAuMDsgYmdfZyA9IDAuNzsgYmdfYiA9IDAuMDsgQEAg
LTU0NCwxMA0KPiArNTQ3LDE4IEBADQo+ID4+Pj4+PiBzdGF0aWMgdm9pZCAqdmlkZW9fcGxheWVy
X3RocmVhZCh2b2lkICphcmcpDQo+ID4+Pj4+PiAgICAgCQljYWlyb19zaG93X3RleHQoY3IsIHRp
bWVyX3N0cik7DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gICAgIAkJLyogRHJhdyBIRENQIHN0YXR1cyBh
Ym92ZSB0aW1lciAqLw0KPiA+Pj4+Pj4gKwkJY2Fpcm9fc2V0X2ZvbnRfc2l6ZShjciwgZm9udF9z
aXplKTsNCj4gPj4+Pj4+ICsJCWNhaXJvX3RleHRfZXh0ZW50cyhjciwgc3RhdHVzLCAmZXh0KTsN
Cj4gPj4+Pj4+ICsJCXggPSBkYXRhLT53aWR0aCAtIGV4dC53aWR0aCAtIDIwOw0KPiA+Pj4+Pj4g
KwkJeSA9IGRhdGEtPmhlaWdodCAtIGV4dC5oZWlnaHQgLSAyMDsNCj4gPj4+Pj4+ICsNCj4gPj4+
Pj4+ICsJCWNhaXJvX21vdmVfdG8oY3IsIHgsIHkpOw0KPiA+Pj4+Pj4gKwkJY2Fpcm9fc2hvd190
ZXh0KGNyLCBzdGF0dXMpOw0KPiA+Pj4+Pj4gKw0KPiA+Pj4+Pj4gICAgIAkJY2Fpcm9fc2V0X2Zv
bnRfc2l6ZShjciwgZm9udF9zaXplKTsNCj4gPj4+Pj4+ICAgICAJCWNhaXJvX3RleHRfZXh0ZW50
cyhjciwgaGRjcF9zdHIsICZleHQpOw0KPiA+Pj4+Pj4gICAgIAkJeCA9IGRhdGEtPndpZHRoIC0g
ZXh0LndpZHRoIC0gMjA7DQo+ID4+Pj4+PiAtCQl5ID0gZGF0YS0+aGVpZ2h0IC0gZXh0LmhlaWdo
dCAtIDYwOw0KPiA+Pj4+Pj4gKwkJeSA9IGRhdGEtPmhlaWdodCAtIGV4dC5oZWlnaHQgLSAxMjA7
DQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gICAgIAkJY2Fpcm9fbW92ZV90byhjciwgeCwgeSk7DQo+ID4+
Pj4+PiAgICAgCQljYWlyb19zaG93X3RleHQoY3IsIGhkY3Bfc3RyKTsgQEAgLTYwNSw4ICs2MTYs
OCBAQA0KPiBzdGF0aWMNCj4gPj4+Pj4+IHZvaWQgc3RvcF92aWRlb19wbGF5ZXIoZGF0YV90ICpk
YXRhKQ0KPiA+Pj4+Pj4NCj4gPj4+Pj4+ICAgICBzdGF0aWMgdm9pZCBlbmFibGVfaGRjcF90eXBl
KGRhdGFfdCAqZGF0YSwgZW51bSBoZGNwX3R5cGUgdHlwZSkgIHsNCj4gPj4+Pj4+IC0JCXNldF9o
ZGNwX3Byb3AoZGF0YSwgQ1BfREVTSVJFRCwgdHlwZSwgZGF0YS0NCj4gPj4+Pj4+PiBzZWxlY3Rl
ZF9jb25uZWN0b3IpOw0KPiA+Pj4+Pj4gICAgIAkJcHRocmVhZF9tdXRleF9sb2NrKCZkYXRhLT5s
b2NrKTsNCj4gPj4+Pj4+ICsJCXNldF9oZGNwX3Byb3AoZGF0YSwgQ1BfREVTSVJFRCwgdHlwZSwg
ZGF0YS0NCj4gPj4+Pj4+PiBzZWxlY3RlZF9jb25uZWN0b3IpOw0KPiA+Pj4+PiBNb3ZlIHRoaXMg
Y2hhbmdlIGludG8gaXRzIG93biBwYXRjaCBsb2dpY2FsbHkgYSBkaWZmZXJlbnQgY2hhbmdlDQo+
ID4+Pj4gQnV0IGl0IGlzIG5vdCBhIGxvZ2ljYWxseSBkaWZmZXJlbnQgY2hhbmdlLiBBcyBwZXIg
dGhlIGNvbW1pdA0KPiA+Pj4+IGRlc2NyaXB0aW9uLCB0aGUgb25seSByZWFzb24gZm9yIG1ha2lu
ZyB0aGlzIGNoYW5nZSBpcyBiZWNhdXNlIHRoZQ0KPiA+Pj4+IHZpZGVvIHRocmVhZCBpcyBub3cg
ZGlzcGxheWluZyB0aGUgSERDUCBzdGF0dXMuIFdpdGhvdXQgdGhlIGRpc3BsYXkNCj4gPj4+PiBv
ZiB0aGUgc3RhdHVzLCBpdCBkb2VzIG5vdCBtYXR0ZXIgdGhhdCB0aGUgY2hhbmdlIG9jY3Vycw0K
PiA+Pj4+IGFzeW5jaHJvbm91c2x5IHRvIHRoYXQgZGlzcGxheSAoYmVjYXVzZSB0aGVyZSBpcyBu
b3RoaW5nIGZvciBpdCB0bw0KPiA+Pj4+IGJlIGFzeW5jaHJvbm91cyB0bykuIFNvIHNwbGl0dGlu
ZyB0aGlzIG91dCBpbnRvIGEgbGF0ZXIgcGF0Y2ggbWVhbnMNCj4gPj4+PiB0aGlzIHBhdGNoIHdv
dWxkIGJlIGludHJvZHVjaW5nIGEgYnVnIGFuZCB0aGUgZm9sbG93IHVwIHBhdGNoDQo+ID4+PiBX
b3VsZCBpdCBoZWxwIGlmIHRoaXMgY2hhbmdlIHdpbGwgYmUgdGhlIGZpcnN0IG9uZSBpbiBhIHNl
cmllcz8NCj4gPj4+DQo+ID4+PiBJZiB5ZXMsIHRoZW4gaXQgc2hvdWxkIGdvIGZpcnN0IGFzIGEg
Zml4LiBJZiBub3QsIGlmIHRoaXMgb25lIGNoYW5nZQ0KPiA+Pj4gZG8gbm90IGhlbHAgaW4gYW55
dGhpbmcgdGhlbiBpbWhvIGl0IHNob3VsZCBzdGF5IGluIHRoaXMgb25lIGJpZ2dlcg0KPiA+Pj4g
Y2hhbmdlLg0KPiA+PiBUaGF0J3MgdGhlIHRoaW5nLCB0aGVyZSBpcyBubyByZWFzb24gZm9yIHRo
ZSBzZXRfaGRjcF9wcm9wIGNhbGwgdG8gYmUNCj4gPj4gaW5zaWRlIHRoZSBtdXRleCBsb2NrIHdp
dGhvdXQgYWRkaW5nIHRoZSBkaXNwbGF5IG9mIHRoZSBIRENQIHN0YXR1cw0KPiA+PiB0byB0aGUg
dmlkZW8gdGhyZWFkLiBIZW5jZSB0aGUgcmVhc29uIGl0IHdhcyBwcmV2aW91c2x5IG5vdCBpbnNp
ZGUgdGhlIGxvY2suDQo+ID4+DQo+ID4+IFRoZSBsb2NrIGlzIHByb3RlY3RpbmcgdGhlIGRpc3Bs
YXkgdGhyZWFkLiBJZiB0aGUgZGlzcGxheSB0aHJlYWQgZG9lcw0KPiA+PiBub3Qgc2hvdyBIRENQ
IHN0YXR1cyB0aGVuIGNoYW5naW5nIHRoZSBzdGF0dXMgYXN5bmNocm9ub3VzbHkgdG8gdGhhdA0K
PiA+PiB0aHJlYWQgaXMgdG90YWxseSBmaW5lLiBCdXQgd2l0aCB0aGUgY2hhbmdlcyBpbiB0aGlz
IHBhdGNoIHRvIGFkZCB0aGUNCj4gPj4gc3RhdHVzIHRvIHRoZSBkaXNwbGF5IHRocmVhZCwgaGF2
aW5nIGFuIGFzeW5jaHJvbm91cyB1cGRhdGUgZG9lcw0KPiA+PiBjYXVzZSAnZmxpY2tlcmluZycg
b2YgdGhlIGRpc3BsYXkgLSB0aGUgJ2FjdGl2ZScgbGluZSBjaGFuZ2VzIGJlZm9yZSB0aGUNCj4g
J3JlcXVlc3RlZCcgbGluZSBkb2VzLg0KPiA+Pg0KPiA+PiBZb3UgY291bGQgbW92ZSB0aGUgcmUt
b3JkZXIgaW50byBpdCdzIG93biBwcml2YXRlIHBhdGNoLiBCdXQgZ2l2ZW4NCj4gPj4gdGhhdCBp
dCBpcyBhbHdheXMgYmVzdCB0byBkbyB0aGUgbGVhc3QgYW1vdW50IG9mIHdvcmsgaW5zaWRlIGEg
bG9jaywNCj4gPj4gdGhhdCBwYXRjaCB3b3VsZCBoYXZlIHRvIGhhdmUgYSBkZXNjcmlwdGlvbiBv
ZiAnbW92aW5nIHRoaXMgYmVjYXVzZQ0KPiA+PiBvZiBjaGFuZ2VzIGNvbWluZyBpbiB0aGUgbmV4
dCBjb21taXQnLiBXaGljaCBpcyBub3QgaWRlYWwuIEhlbmNlIEkNCj4gPj4gdGhpbmsgaXQgaXMg
YmV0dGVyIGtlcHQgdG9nZXRoZXIgd2l0aCB0aGUgcmVzdCBvZiB0aGlzIHBhdGNoLg0KPiA+Pg0K
PiA+PiBUaGFua3MsDQo+ID4+IEpvaG4uDQo+ID4gU291bmQgcmVhc29uYWJsZS4gU3VyYWogY291
bGQgeW91IHBsZWFzZSBhY2sgb3IgcmV2aWV3IHRoaXMgc2VyaWVzPw0KPiA+IERvZXMgaXQgaW1w
cm92ZSB0aGlzIHRvb2wgYW5kIHdvcmtzIGFzIGludGVuZGVkPw0KPiA+DQoNCkN1cnJlbnRseSBJ
IGFtIHNlZWluZyBzb21lIGFsaWdubWVudCBpc3N1ZXMgd2hlbiBydW5uaW5nIHRoZSB0b29sLg0K
QWxzbyB0aGVyZSBjYW4gYmUgYSBiZXR0ZXIgYXBwcm9hY2ggdG8gZml4IHRoZSBmbGlja2VyLiBJ
ZGVhbGx5IHdlIHRhcmdldGVkIHRoZSB0eXBlIHRvIG9ubHkgYmUgc2V0DQpXaGVuIEhEQ1AgaXMg
ZW5hYmxlZCBidXQgb24gcmV2aXNpdGluZyB0aGUgY29kZSB0aGF0IGRvZXMgbm90IGhhcHBlbiB3
aGljaCBpcyB0aGUgcm9vdCBjYXVzZSBvZiB0aGUgZmxpY2tlciBpc3N1ZS4NCkkgd2FudCBzZXRf
aGRjcF9wcm9wIHR5cGUgdG8gaGF2ZSBhIGRhdGEgYW5kIHN0YXR1cyB2YXJpYWJsZSB3aGljaCBp
dCBvbmx5IGNoYW5nZXMgaW4gdGhlIG11dGV4IHdoZW4gaXQgbWFrZXMgc3VyZSBIRENQDQpIYXMg
YmVlbiBlbmFibGVkL2Rpc2FibGVkLg0KDQpUaGVuIGxldCB0aGUgdmlkZW8gcGxheWVyIHRocmVh
ZCB0YWtlIHRoZSBtdXRleCByZWFkIHRoZXNlIHZhcmlhYmxlIGFuZCBjaGFuZ2UgdGhlIGJ1ZmZl
ciBjb2xvciBiYXNlZCBvbiB0aGUgYWN0dWFsIHN0YXR1cw0KR3JlZW4gaWYgZW5hYmxlZCBhbmQg
cmVkIGlmIGRpc2FibGVkLiBXZSBjYW4gaGF2ZSB0aGUgc3RhdHVzIEVOQUJMRUQgREVTSVJFRCBh
bmQgVU5ERVNJUkVEIHdyaXR0ZW4gb24gdG9wIG5vdCBhIGZhbiBvZiBpdCBidXQgaXQgd291bGQg
bWFrZSB0aGluZ3MNCkNsZWFyZXIgYnV0IG5vdCBhdCB0aGUgYm90dG9tIHJpZ2h0IHdoZXJlIHRo
ZSBIRENQIHR5cGUgaXMgd3JpdHRlbi4NCg0KU2FudGhvc2ggY2FuIHdvcmsgb24gaXQuDQoNClJl
Z2FyZHMsDQpTdXJhaiBLYW5kcGFsIA0KICANCj4gPiBUaGFua3MgaW4gYWR2YW5jZSENCj4gPg0K
PiA+IFJlZ2FyZHMsDQo+ID4gS2FtaWwNCj4gPg0KPiA+Pj4gUmVnYXJkcywNCj4gPj4+IEthbWls
DQo+ID4+Pg0KPiA+Pj4+IHdvdWxkIG5lZWQgYSAnRml4ZXMnIHRhZy4gV2hpY2ggaXMganVzdCBw
b2ludGxlc3MgZm9yIHRoZSBzYWtlIG9mIGENCj4gPj4+PiBvbmUgbGluZSBkZWx0YS4gT3IgaXQg
Y291bGQgYmUgYSBwcmlvciBwYXRjaCBidXQgdGhlbiBpdCB3b3VsZCBuZWVkDQo+ID4+Pj4gdG8g
c2F5ICdkb2luZyB0aGlzIHRoaW5nIHRoYXQgaXMgcG9pbnRsZXNzIG5vdyBidXQgaXMgcmVxdWly
ZWQgYnkgYQ0KPiA+Pj4+IGZ1dHVyZSBwYXRjaCcgYW5kIHlvdSBoYXZlIGFscmVhZHkgc2FpZCB5
b3UgZG9uJ3QgbGlrZSBkZXNjcmlwdGlvbnMNCj4gcmVmZXJyaW5nIHRvIGZ1dHVyZSBjaGFuZ2Vz
Lg0KPiA+Pj4+DQo+ID4+Pj4gSm9obi4NCj4gPj4+Pg0KPiA+Pj4+PiBSZWdhcmRzLA0KPiA+Pj4+
PiBTdXJhaiBLYW5kcGFsDQo+ID4+Pj4+DQo+ID4+Pj4+PiAgICAgCQlkYXRhLT5oZGNwX3R5cGUg
PSB0eXBlOw0KPiA+Pj4+Pj4gICAgIAkJZGF0YS0+dmlkZW9fc3RhcnRfdGltZSA9IHRpbWUoTlVM
TCk7DQo+ID4+Pj4+PiAgICAgCQlwdGhyZWFkX211dGV4X3VubG9jaygmZGF0YS0+bG9jayk7DQo+
ID4+Pj4+PiAtLQ0KPiA+Pj4+Pj4gMi40My4wDQoNCg==
