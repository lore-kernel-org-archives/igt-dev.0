Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3E5C98317
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 12:03:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8590510F4CC;
	Thu, 24 Sep 2026 12:03:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="leLtskSt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E20610F4B0;
 Thu, 24 Sep 2026 12:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790251386; x=1821787386;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JsXl8jujXDm0sJnwaCxaz36F1UOKwco5cJ4Buj8WINY=;
 b=leLtskStROCkt+rZUIgEHiUHLBBRwHlF4d7UVVV+9/QF4i4aKCsjddZI
 IBn3HqRTx2m5PJRtXR0SVTVhzKF6wgGV91dyeq3HHNcYhXST5xCvaxSRx
 Bnxb95EThof1ORJqZ1N68Kh/YrOM+Jkj3X2GKEXSiWN7adnXpkCAPMH0f
 +RwVc2hZR1n/hcAgvK8Z+0yEesj0/bsRYrrLPdhpOV5JoXpLGkE47zth/
 lx2qFTsSmFIXybsk0Zm3Cq1xqOyBqj2IK/fQ8eaXEsLEYDXRkKqhkvVDL
 IHChkauoA3x7JwWHfdoT5EMzz+gIHqWQyGG2eLD/m1IJfVFt+U3RX73Rn w==;
X-CSE-ConnectionGUID: HiUO8dhrRA6+W6OI8w934w==
X-CSE-MsgGUID: 44n6bo+aQD+EXx8a+/ufBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91123422"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="91123422"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:02:54 -0700
X-CSE-ConnectionGUID: 9/NW3cXaSROEBycORjnK8w==
X-CSE-MsgGUID: EVWnQuPzS2Kp+xFSzu9nKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="270492670"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 05:02:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 05:02:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 05:02:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.50) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 05:02:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u9Fym5q6+33gq2h8G1FgEAt4tjhcrxh/1/BeSfiXnwhPxKoez/atf16LEYpuo37OhlaXzddSDbV+p7YFX0SDni3sqYL7Iow8edJ4q7SAG3Vji75GKPaUuSTqSowlRcHYXl3U1YsOjHSsJRoISl3hU9t9AHDk/vA3xLzbnV5zKRGEw9JoJEDr0UiDPELWLQFVUNUAfxpYZqfsyl9p0DT3cnXeiB4fOfIm9lsYo1hK+yelvk1zN00r9Pl3zWeEtjBTbOLQg+ehXQ10erzkVN1GVw606qUg4fvay4qrEHNPwJMoGC/dQV5CeimQANI8IHbccEYQnlf4cGjvvWWr0qffRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JsXl8jujXDm0sJnwaCxaz36F1UOKwco5cJ4Buj8WINY=;
 b=ob+bY2gUx04JHJam8FywxgwuiWa703EuLsrJlqlHuLiGBhNDOqo67YK3KraqsRghbuj+vLGv4KCD0cLFqk1KVJmcMPvBS0BMVQod1/GrmGsqGvYtU74Xk+9Mt6qIMM1muAzu+xzDaofD6SbSJHYmSiFX/kmo7fwB4sjZb0fCcZ6K20/k3RFZp7PEgirZjqgfuEUT5UGCo0In9fnzRTCzMEU8wqM/HfVvXkCQn+edDWFhvTtT3892TcLmKsUAS+YuS4jT3If+pXD6glYzDFPsfXovLmUBElYeLayN5SMr/DSkY835a+Svo26bdBpViV2X5+EPDGoXkA7O6p6NbD72VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by IA4PR11MB9369.namprd11.prod.outlook.com (2603:10b6:208:565::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:02:50 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::250:1566:d191:a23b%5]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 12:02:50 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Aurabindo Pillai <aurabindo.pillai@amd.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMva21zX2F0?=
 =?utf-8?Q?omic:_skip_missing_CRTC_props_in_state_snapshot?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNfYXRvbWlj?=
 =?utf-8?Q?:_skip_missing_CRTC_props_in_state_snapshot?=
Thread-Index: AQHdS/mYHJ72G0Eev0etL8vnkFuOubbdeN7g
Date: Thu, 24 Sep 2026 12:02:50 +0000
Message-ID: <CH0PR11MB54915698D34D902096D1EA65EF812@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
 <179020563583.198725.1434891016913920582@61270ab9df2a>
 <20260924075048.52kwxm734q7akycj@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260924075048.52kwxm734q7akycj@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|IA4PR11MB9369:EE_
x-ms-office365-filtering-correlation-id: 92a79a51-111f-44b2-10f0-08df1a33c1b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|5023799004|4143699003|11063799006|13003099007|38070700021;
x-microsoft-antispam-message-info: 3bS1UwrUi/NOK/JDrQr5cmguFLOHkEl2+j9VEqqDEVVUw+Ock7+aTHWBeSlbPG2oGrGyaq0XprhZVsR5AYIhgxpmtPexNf0vw6WrbNZpocPWxBNsATO65dks2jTkJcOJcOM6ZzvBGXdUITyuhAu/7IeEiP+pQXpPdNkkgBn18OxvbAIjPOFQd8pU+bmhGbdgTljbasHK1sfsOM5NaCHvDvub5/NzKeF6uW6eCpUTpkuMJajkwTCrGq6pBeoWUoo+RLa9inyzfaLDgVweXJ7T8+1txNw3V0pZxEkNYs26CSstHuySJCsl4QWwzecLAhJYjUUnDl3a0LDVoZvhvdaHwaxNBtCMkMvSLoUafHXwEgjPdveMzBIwWKQ7CqQDlgMN45ExaZGe6725ETEcMkSYART8t84OGwRSdhHBGTIRCueFnQ6E3SZCLtED6m6xpha2KmheVaidBYK/eFSuMSqxIzM/o3F6LRoI1XJ2mw54cmHKRdlLbvAe3I2UJpxF02njLFmHotf+u5iDGdDDu7jh8D855oRjwbaARTphBV6TFoFf/FOYfAEe2UdE90bkR+ojHSD1J1P9sl0WWSGkj2z5B/Zr2o8UVkMeL5G4g9AXEJJAYFstxZtDm6kdw67lz16S8GDzrepuUoFtiWvX1RpEtD/MnE1IgdcobXBFzbw1jN4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(5023799004)(4143699003)(11063799006)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z3QvNllNbFp6RmtmZjhFYzNESEw3Szk3L3crMW94ZG9xNjFXY0VwRGJBOHRL?=
 =?utf-8?B?WnE0TGFOdXpCVVBBUHJwdmJZUWNTVGlscVpDaUd5V1hpakQ2Y1lKRWRSdzEy?=
 =?utf-8?B?bnZjZWgrQjNzcXJaa3FGWEJONmZLNXhCUjdSNDYyZVAwYTZ1a09hQ3VBUkU3?=
 =?utf-8?B?bm9ncmNnZGRveUxtSzdQZFo3YkppWjhOVlZocXpXR1hzUFNyQ3ZtWGwzMnVt?=
 =?utf-8?B?UFp5ZkVXZS8zTGtYa2lDdHFpVk1uTDIybkdjYlJIVHJTWXBlT1dlRmtlVStG?=
 =?utf-8?B?NUJBNjRzVWpiWWtWaWg3MjNVQll1dlY5NFJiV3VMdGE0WC9jcVFnME93SjIr?=
 =?utf-8?B?cFNaN2haK1ZDMHdKdW9MVERIOEtDN080TE5ibnA5VDVLUSt5TlZjRk9rQnNM?=
 =?utf-8?B?MWo2dGlPNUt1dHVRczNHem9haVZyK3ZZVElRdTAwbGpPcmVGaUtsQWZvWWRO?=
 =?utf-8?B?aTMzTzJ6eDlpSnI2aTJvYy9tOUoxL3dwNVA0TkFYVS9hUTFMY2hUYk95WWg3?=
 =?utf-8?B?NjNsZ1dmdkZzMXh0ZzhHZnhxVk5SRDluRTFtSEU3R0lKQ0w2RlozWUdWSUxX?=
 =?utf-8?B?SzVCeEpmbVNnZGo1dDhtcGdpMVZGbjEySDg3citMT0p0dFkxVEpZcTh2TE5r?=
 =?utf-8?B?OWJYSEdMOGduTFIwSGRVbTJVNW1JQ2hOYjBSWWpxa2hhOUEycE01Q0VpbXMx?=
 =?utf-8?B?NTdabytTOWdlWUZHdlExWm8xTG82cWlyWjRmZ2hCT1h5R3k4czlXNEQrYWVQ?=
 =?utf-8?B?cmpQelNJOVdhQSs4WFVLZldmenFzUFhhUlNzVm4zVjlUOGlOY0pVbzFxOWtt?=
 =?utf-8?B?SWQvYWthRy9TQVpWNExqVnVKbHhWZVVzMFJ4ZkY1ZlplVEttQXdab1oyc2tP?=
 =?utf-8?B?UjJ5T1lobU9IRW1NNUhURGIxMHhUbEF5c3V0SFU3VThNdmFzRndjVnppbjE2?=
 =?utf-8?B?bFAvQm1YZEk4QzVwTTJYWWhGaWtrUC9ScHJFMUk0Nk9nRUFYRGlMcy80MGVo?=
 =?utf-8?B?a3V4aTRjdlRDQkFNWVBjWTdqVUI3czlsRStvelNXaThiWXY2NUJHRmV2eEpF?=
 =?utf-8?B?QXROSUJkd2JYdTM5S1JUQlhVMjA4NW9FUjZBSHp6TlAxVjZIL2VneitNby9C?=
 =?utf-8?B?b2Z5K2k4cEtyNDF1dzhMUW9Md0V5SjhJbTFHWjBaMXNNb2gzRHRtUGxaOWlO?=
 =?utf-8?B?QndOVmZvempUdUxnWng0eTkyd3JCemFkdU4wcThSV2MxcmdJd0FGTS82bXh0?=
 =?utf-8?B?L2x0a2FWUHlxLzBXeVlhT1Nqbmxzdmx0b1ppV282eVEzNFdWcUtZOUxGZXBH?=
 =?utf-8?B?MVlPVHEvZGJhVjdCVlIrSTFHMUd5WENQUzRGYlNtdFg0eE11SDVyY1N6dzBM?=
 =?utf-8?B?VVVtTEk4UmYvSkJ1Nm9qVkpYUjBhRDJCQ0ErQjkvdzdmelBXaHIrYk5BYzFv?=
 =?utf-8?B?Vm02M2Nibmk0Ny81cWZtRm0zci9DVnR4OFRQMWd6bUhOemNaYjhHY011U2hh?=
 =?utf-8?B?MUFWcEdHOFBRbDZMK1FOaEFEVUZ3bXZwa3prUmxCNi9lbnpidkhpdGlzeFR3?=
 =?utf-8?B?STJZM2ZPbTNoTXRzYkJEZkxuMXVqV0JEaXoveXVBV0VCLzduWnpNUnVja1dV?=
 =?utf-8?B?N250RzJBQmVKcVlSMUlyZDJwS1hFQXQyeTBTamM4Si94T1U5US9nYXMwc2ZM?=
 =?utf-8?B?YnYySUZ5dkpQeHFINDVjbXhMSk04SjM3ZXdxdGZIV2VoMDEwNTJtMjF5RGVL?=
 =?utf-8?B?V2pFYlJaQWZHZGpBSkZiaUZ4Y004NXdWU21xckR0bjJadTgrb0FKNUtqa25I?=
 =?utf-8?B?WC9qZGFDZUQvcWx2d2ljSit6MWt2Y1crV2k1MkNrL3ZyRGZaOU81WHhwTElP?=
 =?utf-8?B?cVFZWmhpRmc5cVFVVVFhTGNFdyszdjEwa0c2RTlTTUJUTmVXZlZYMFI2ZDg5?=
 =?utf-8?B?Wjdxd3lmRnlJQW41WXVTU1hXR0ltT21Lc0t2bVRLZ3hNcVh4VnIxRXlUNzZN?=
 =?utf-8?B?Nk8wQUx3Q0JVVDJGOVBXL3RscEFtVDAwMkV3WWZZR1d3Unh2TGZyTWw4b3NB?=
 =?utf-8?B?c3M1Yy8rbzNJYnM0WG5WZnVTc2pnVUNEM01SbTVlbUVCNTM3QUhWS01WZlRw?=
 =?utf-8?B?NXN1SEJ0Q09xcUZnL1BMZmVtM2VnaXlwajduWWZpZGRQcDNCditidGRiVDlQ?=
 =?utf-8?B?ZVFrTEFUOG14N1MrRjViN0JMMmxBY2pOVURPd1pWT012UGN0SDJnOW1Zcmxa?=
 =?utf-8?B?Sm9lU2FacVlZQWVDWmFiTnhZUkxHeHp3aHdkUk1OWjV5b1VQQjlDOFplVFBk?=
 =?utf-8?B?bnp6VDhwZEJ5SWZtY08vVEh3eXJmTkRRWlhtSlF2YkkyeGZKSUk2Ymh6NHBU?=
 =?utf-8?Q?Ew8IsUHqICND76CGRSABbhIrYurCK5oG8/GFh83AteAE0?=
x-ms-exchange-antispam-messagedata-1: t5Bk7vcrzlsGQw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 12R/4S+BhrAOIl2bzxubibJywwMnJwMnHWIr7igqyDKXQo4Ro5gue+RBOe42r0QzbQ3sGhQ6zQW8llqehKMYcLLDxSHYA0/5LFPbZFrd+RcQ+h/ZI4YUAnYE+sy7vDsvzJri2gM1RCgj8ABURLz0EAqMhB5+poUXxKDwgUa8mZf03tgPyuZOaUvGzq16ofx2SD6BBHvF++kJap4qxg+0ynoli9B5DWkwas3TProcWW2iZ/jNCYhNuIVFz46V7TQUOeFvd8pm53CnGcAsrEtUa5C3DGOXvAUtWPo2TqRQtG37WGagYledgoZli7WmyY2LlsqgT2FAJV2Mu59t2MI7rg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a79a51-111f-44b2-10f0-08df1a33c1b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2026 12:02:50.4915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pqNwbeF5kxWpP9SMILkhKf2lOBpHgCXyfmFCZjZxhx1nSIBWXGrmAFYHPROcNpnHQhY/waRryJRNOq/lZ3ojMTW8WDsTOJKpmCCZjIxhNi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9369
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

SGksDQoNCmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTc0ODIyLw0K
aTkxNS5DSS5CQVQgLSBSZS1yZXBvcnRlZC4NCg0KVGhhbmtzLA0KUmF2YWxpLg0KDQotLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSTkxNS1jaS1pbmZyYSA8aTkxNS1jaS1pbmZyYS1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEthbWlsIEtvbmllY3pu
eQ0KU2VudDogMjQgU2VwdGVtYmVyIDIwMjYgMTM6MjENClRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KQ2M6IEF1cmFiaW5kbyBQaWxsYWkgPGF1cmFiaW5kby5waWxsYWlAYW1kLmNv
bT47IEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpTdWJqZWN0OiBSZTog4pyX
IGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNfYXRvbWljOiBza2lwIG1pc3Npbmcg
Q1JUQyBwcm9wcyBpbiBzdGF0ZSBzbmFwc2hvdA0KDQpIaSBpZ3QtZGV2LA0KT24gMjAyNi0wOS0y
MyBhdCAyMzoyMDozNSAtMDAwMCwgUGF0Y2h3b3JrIHdyb3RlOg0KPiA9PSBTZXJpZXMgRGV0YWls
cyA9PQ0KPiANCj4gU2VyaWVzOiB0ZXN0cy9rbXNfYXRvbWljOiBza2lwIG1pc3NpbmcgQ1JUQyBw
cm9wcyBpbiBzdGF0ZSBzbmFwc2hvdA0KPiBVUkwgICA6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVk
ZXNrdG9wLm9yZy9zZXJpZXMvMTc0ODIyLw0KPiBTdGF0ZSA6IGZhaWx1cmUNCj4gDQo+ID09IFN1
bW1hcnkgPT0NCj4gDQo+IENJIEJ1ZyBMb2cgLSBjaGFuZ2VzIGZyb20gSUdUXzkxMTEgLT4gSUdU
UFdfMTU4OTAgDQo+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0tLS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0K
PiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdlcyBjb21pbmcgd2l0aCBJR1RQV18xNTg5MCBh
YnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJpZmllZCBtYW51YWxseS4NCj4gICANCj4gICBJ
ZiB5b3UgdGhpbmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGgg
dGhlIGNoYW5nZXMNCj4gICBpbnRyb2R1Y2VkIGluIElHVFBXXzE1ODkwLCBwbGVhc2Ugbm90aWZ5
IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnKSB0byBh
bGxvdyB0aGVtDQo+ICAgdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVyZSBtb2RlLCB3aGljaCB3
aWxsIHJlZHVjZSBmYWxzZSBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0KPiAgIEV4dGVybmFsIFVSTDog
DQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4OTAv
aW5kZXguaHRtbA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAoMzkgLT4gMzgpDQo+IC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBNaXNzaW5nICAgICgxKTogYmF0LWRn
Mi0xMyANCj4gDQo+IFBvc3NpYmxlIG5ldyBpc3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBp
bnRyb2R1Y2VkIGluIElHVFBXXzE1ODkwOg0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiAN
Cj4gIyMjIyBQb3NzaWJsZSByZWdyZXNzaW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGttc19wbV9y
cG1AYmFzaWMtcnRlOg0KPiAgICAgLSBiYXQtZGcyLTg6ICAgICAgICAgIFtQQVNTXVsxXSAtPiBb
RE1FU0ctV0FSTl1bMl0NCj4gICAgWzFdOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJl
ZS9kcm0tdGlwL0lHVF85MTExL2JhdC1kZzItOC9pZ3RAa21zX3BtX3JwbUBiYXNpYy1ydGUuaHRt
bA0KPiAgICBbMl06IA0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlw
L0lHVFBXXzE1ODkwL2JhdC1kZzItOC9pZ3RAa21zDQo+IF9wbV9ycG1AYmFzaWMtcnRlLmh0bWwN
Cj4gDQoNClRoaXMgaXMgdW5yZWxhdGVkLCBwbGVhc2UgcnVuIGk5MTUgRnVsbCB0ZXN0aW5nLg0K
DQoNCg0KUmVnYXJkcywNCkthbWlsDQoNCj4gICANCj4gS25vd24gaXNzdWVzDQo+IC0tLS0tLS0t
LS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgY2hhbmdlcyBmb3VuZCBpbiBJR1RQV18xNTg5MCB0
aGF0IGNvbWUgZnJvbSBrbm93biBpc3N1ZXM6DQo+IA0KPiAjIyMgSUdUIGNoYW5nZXMgIyMjDQo+
IA0KPiAjIyMjIElzc3VlcyBoaXQgIyMjIw0KPiANCj4gICAqIGlndEBjb3JlX2F1dGhAYmFzaWMt
YXV0aDoNCj4gICAgIC0gYmF0LWFkbHAtNjogICAgICAgICBbUEFTU11bM10gLT4gW0RNRVNHLVdB
Uk5dWzRdIChbaTkxNSMxNTY3M10pDQo+ICAgIFszXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RfOTExMS9iYXQtYWRscC02L2lndEBjb3JlX2F1dGhAYmFzaWMt
YXV0aC5odG1sDQo+ICAgIFs0XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTU4OTAvYmF0LWFkbHAtNi9pZ3RAY28NCj4gcmVfYXV0aEBiYXNpYy1h
dXRoLmh0bWwNCj4gDQo+ICAgDQo+ICMjIyMgUG9zc2libGUgZml4ZXMgIyMjIw0KPiANCj4gICAq
IGlndEBjb3JlX2RlYnVnZnNAcmVhZC1hbGwtZW50cmllczoNCj4gICAgIC0gYmF0LWFkbHAtNjog
ICAgICAgICBbRE1FU0ctV0FSTl1bNV0gKFtpOTE1IzE1NjczXSkgLT4gW1BBU1NdWzZdDQo+ICAg
IFs1XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RfOTExMS9i
YXQtYWRscC02L2lndEBjb3JlX2RlYnVnZnNAcmVhZC1hbGwtZW50cmllcy5odG1sDQo+ICAgIFs2
XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4
OTAvYmF0LWFkbHAtNi9pZ3RAY28NCj4gcmVfZGVidWdmc0ByZWFkLWFsbC1lbnRyaWVzLmh0bWwN
Cj4gDQo+ICAgDQo+ICMjIyMgV2FybmluZ3MgIyMjIw0KPiANCj4gICAqIGlndEBrbXNfcHNyQHBz
ci1zcHJpdGUtcGxhbmUtb25vZmY6DQo+ICAgICAtIGJhdC1kZzItODogICAgICAgICAgW1NLSVBd
WzddIChbaTkxNSMxMDcyXSAvIFtpOTE1Izk3MzJdKSAtPiBbU0tJUF1bOF0gKFtpOTE1Izk2ODhd
KSArMyBvdGhlciB0ZXN0cyBza2lwDQo+ICAgIFs3XTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RfOTExMS9iYXQtZGcyLTgvaWd0QGttc19wc3JAcHNyLXNwcml0
ZS1wbGFuZS1vbm9mZi5odG1sDQo+ICAgIFs4XTogDQo+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTU4OTAvYmF0LWRnMi04L2lndEBrbXMNCj4gX3BzckBw
c3Itc3ByaXRlLXBsYW5lLW9ub2ZmLmh0bWwNCj4gDQo+ICAgDQo+ICAgW2k5MTUjMTA3Ml06IGh0
dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTA3
Mg0KPiAgIFtpOTE1IzE1NjczXTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9p
OTE1L2tlcm5lbC8tL2lzc3Vlcy8xNTY3Mw0KPiAgIFtpOTE1Izk2ODhdOiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzk2ODgNCj4gICBbaTkx
NSM5NzMyXTogDQo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJu
ZWwvLS9pc3N1ZXMvOTczMg0KPiANCj4gDQo+IEJ1aWxkIGNoYW5nZXMNCj4gLS0tLS0tLS0tLS0t
LQ0KPiANCj4gICAqIENJOiBDSS0yMDE5MDUyOSAtPiBOb25lDQo+ICAgKiBJR1Q6IElHVF85MTEx
IC0+IElHVFBXXzE1ODkwDQo+IA0KPiAgIENJLTIwMTkwNTI5OiAyMDE5MDUyOQ0KPiAgIENJX0RS
TV8xOTIxMDogNzAzY2QyNzFkYjNhMzUwODg0NjBhYjNmZWMwYTk2YmQ0OGU3ZmUwNCBAIGdpdDov
L2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1jaS9saW51eA0KPiAgIElHVFBXXzE1ODkwOiBm
MDIxOWMxZjY2ZWRlYTYxMmI0MDA5ZDNmODZiNTg1ZTE0ZjgxOGNkIEAgaHR0cHM6Ly9naXRsYWIu
ZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzLmdpdA0KPiAgIElHVF85MTExOiA0YWVh
YmYxMDRiMTM2NDM3ZDBjY2M1N2NhZjMyYTc1MjU4N2Q1OTVjIEAgDQo+IGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaWd0LWdwdS10b29scy5naXQNCj4gDQo+ID09IExvZ3MgPT0N
Cj4gDQo+IEZvciBtb3JlIGRldGFpbHMgc2VlOiANCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEu
b3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xNTg5MC9pbmRleC5odG1sDQo=
