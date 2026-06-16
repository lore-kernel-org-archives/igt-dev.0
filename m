Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B26CD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 08:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A7910E931;
	Tue, 16 Jun 2026 08:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jxLcZ4XJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C6C10E931
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 08:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781600349; x=1813136349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u+8sECaOI1De1XzxPek5TanUwK+2g060PGCDgxLoRV8=;
 b=jxLcZ4XJYAC4O825nBj3KHQbKTbVOAOFf+l8AapsHfhrsYof4RvOXNZA
 C3Yg77oYnAed5DFKK75IvC2IGZ5jeDlb20AueNdeQvq80AOor4VEGBSm8
 Kjw/d8Z8NcyBB+U8yBVEjRwe5RkD80i2HiF3wDcwsE2D9p/9+cJoHH2OU
 E4HjLhtSp1X+AlvmpaRj/r/Pv4eB/a5VREisOqYI+73fXeiV+g/UsRINV
 L8i2v1MMsYAdkfY7QpROms7bYMNHIgrpXcZHiTjPEQmXqWNZoJsYA1p3P
 5ATg0wr1UG3nEYIr7Xk9Ae6NjjXVuu0PY6aio7hB5Q4gQNpRdWvmeaZlF g==;
X-CSE-ConnectionGUID: 5ssRrjhiR+Ccxa4tq/5RAQ==
X-CSE-MsgGUID: +rbzsqDgTMud0ReOy8Szcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="85997657"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="85997657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:59:08 -0700
X-CSE-ConnectionGUID: 4VAneu+XTLCkeqocq4FSXg==
X-CSE-MsgGUID: DXRrhPLMRpGUnMVNpDEkug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="245340932"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 01:59:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 01:59:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 01:59:07 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.29)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 01:59:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oivIqffYaDjEl9HlVdWzd4Q2cQG+J6fOwwMEvpa7leza6DIHlAu3zRtFUQpVgqmDnybjj2htb9O561wcSdPFkX+ZCbpx+V0XuqSfd4NOmuL3+6DHwh8UzuCFNXo6mtFwlfBZhnS10AQJYVomKvJoKR8299+GT/WxPOcXEEpFrp0pbmiSvO0pjVYsnMa07ePYSwhZkq+Ap0bFmP4LAJseP2Et0E4OIW2Q+tf/TE0Whw2gCGxMp/7mxCg3TSqwaYxPDYFHQ2bwAQo42CxcLjNVvFWJ17DNeBwcKdEiqnufEoHQj3Aw3guEqolavdutNrSiAIiV3OLSeyPJT1zrSgE+VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g51rNkO99CuSteGwAY2pph4Pu/2Nhn7Wd1mMZIwVMtA=;
 b=YyzSbInZ8lTF8TGtWhMfyU6ETzp+ovpGbneuoQktopax8CE7pK+2Q9QECo0Zn0j3fx8lENeTk4nl9z1R9nnrPhA9aX3P9mgzLjKvNb0gEQlqg50qf9ziRJRUHF4H5Nu2IpoMe9a0YNAXErXl2wz8yNFe5NM1o9E/WAQbZBEvm/WCe6DVZE3O0vcnzS6W11bLO4sVzD/FGSa0vx6BtgKG5KUIpab82S+y9z01rdBWm/vVmGTobwzDIdnPGEjkJS8+JedrD68AUd9sbTEljFGszUQUpxN7uK7Et2RVwjzM2JDt+b45tNAzKl5S5Le3aEolSK4Bp04aXtmV05J0KYyUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DSWPR11MB9583.namprd11.prod.outlook.com (2603:10b6:8:36e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Tue, 16 Jun
 2026 08:58:58 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%2]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 08:58:58 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Joshi, Kunal1" <kunal1.joshi@intel.com>
Subject: RE: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Topic: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
Thread-Index: AQHc+jCrHtR0AuIHJUiy08vAkf9F7rY/YzvQgAFHjICAADFz8A==
Date: Tue, 16 Jun 2026 08:58:58 +0000
Message-ID: <PH7PR11MB605329E2FF71E2B37C10EBB4E7E52@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260612055857.2465378-1-jeevan.b@intel.com>
 <PH7PR11MB6053FDC4877E947DDDD81380E7E62@PH7PR11MB6053.namprd11.prod.outlook.com>
 <DM4PR11MB6312E509E6FC514860EE184490E52@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312E509E6FC514860EE184490E52@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DSWPR11MB9583:EE_
x-ms-office365-filtering-correlation-id: ef4c419d-1063-4597-eb72-08decb8580dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|6133799003|3023799007|4143699003|5023799004|22082099003|11063799006|18002099003|56012099006|38070700021;
x-microsoft-antispam-message-info: SNVMeA+FfDY0PysFBX1TYqXq1DYAWqY6kJsnW9FK5tcemLQmkqBVsbeyoGUolbsc9RDzFbVd4gYYKElxgZEfTlYK3uS6Rk1O+8mbmBsth3LXl6IMp3v4zwuCfl4BKW+cQLFY6SFPJwJ+Wq6DGb8TlPjqu9h/icH/82BJ4/bMXgOf8m3uC81+OXL1///MmUPpHNbtQrtCTGJ/OrQb5aIw+/QDQ0tzMseCcyO9TfubIaRBP8l/N+LZWEe3ptwWS8VY/CrLWcHEt7zRWxxqq39lXTqhreRvZdcbcaNDOnuuAOENSYeamtTmkcTwPm1r4P8wBzFPdMnEH0VJ+skdFe45a6jiRXboZkEN9Wz5M8Irjo5TVCa87S2yajk/nCh+LNw5k4Tb5bDR/C0PYyHMRIJOt+NGPxDz1oBVJU51niTT+rE5A+H08r+FCDTq3plvQtD9TeHu5mQvlablVCPKUbxFxEdfOFMrouKd6QcRyzxnvUpDCFqbzpKFmaq3ExnWVbD/RCP0HoTSG+yJ0kkVVwHriRyqRLvDtYqBC4dpYWS0/Fc5QFCxTv5q2EpMSffYuLOWOjQDmjx00u/cMmfbr6iiOC3NcNM+/hghM/pFdFKvlsy/eOBingI+McIIL05jl5wUxnWgBgILDzXQ7Ce1A/2mW12fylQjEhst+5BejoySlFV3JsStIABI6zd/XvB3cbvCgz6dSDeam89c0brh0Ps8sKAsQa9gFqZ5bBwNzS4tBt8w09hdrpsr8mMd/S9/2aY8
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(3023799007)(4143699003)(5023799004)(22082099003)(11063799006)(18002099003)(56012099006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?//ayUpH0VRi7WcuPegXz1mtTSIybaPrpWkRnGabAyCbFx5adtn5RnNqh0Bm3?=
 =?us-ascii?Q?guZtiUgyqYwxyLgBlNKZq+cE+TkT9j4X4uGEE2urtrKhYeemF8BJrxWM3CAw?=
 =?us-ascii?Q?ymJwu8dGENHx2KFoTJYfp4G2HX0g9kcD6YdkWxl2Z0dK57hR9uEcklfU99tz?=
 =?us-ascii?Q?mzXfY19A5OAzjM7Oz3IzTTaw/zfrehqEI3Mc8aNNXcDZ9oocGv2/HP9gMlYL?=
 =?us-ascii?Q?KL44dsfrhBXG+7yeEWgtLN/pehY66U8/Mqs7iWTKDLD/U4tri4Nnxl3DCAGJ?=
 =?us-ascii?Q?9L4UHQRiEpjBu04klsK4oPlD084onVpUIbKlHswbgl2Psqfupw9yKO2ET4Ku?=
 =?us-ascii?Q?y5vAAVohPhB/oJYgnkEj1wwChJdM3DEF3dU8SX/Duq1J+QbQVO/VR5232Lvj?=
 =?us-ascii?Q?YYY6ORT4I2MfR/mAR0ByxMW9UgcGz5QcXmT5cWA0+6b46JQ+j4woajq0lAIl?=
 =?us-ascii?Q?QrFOWI9PjX2XKcxhkUj0Tt4JNIETwJBcQFOeHof4PIiyR3sCQ8kmDeEAECny?=
 =?us-ascii?Q?JlCsShZXxVTD19dz6pB0M21ihWs3UqeRr3zjs1miwozZlAwNTUN/fQ/HeTBw?=
 =?us-ascii?Q?pqqv99tQdRV/dcOozRCfm1pfi0Pm4t8tSNDzuH9gpFsDlnuljR8xABYR7LAG?=
 =?us-ascii?Q?SsmyYpBaN55NVZZFeao/bgyuLuKhIR5GVRT1vthOcPUmWHgTCsRNWPwssCUd?=
 =?us-ascii?Q?/bgg/g8+XYDlC9ty3B7rzF3o/2OPPnNquqm33lgdMhHJlttDIWSDlJlebon7?=
 =?us-ascii?Q?y71HZFWPeRpqFb3FmLBmQJSN+eyNNdU/zTEbxanPQOeiUVZuwmnE3DQrOAh+?=
 =?us-ascii?Q?Yg+QGVgjJIWfmXsE59cPMRPDHEwfofXFwKTSEPQxD8F5xjTr4MvE9AtMah36?=
 =?us-ascii?Q?QNgfdfGvsoqUDUSZJzaavkBQZAo15q6v+8nmc2fMJ9dWJwmQvWE4ZrKl2vTS?=
 =?us-ascii?Q?y9BYcn+1qLqLWZP4nVeDqBOCJJV4cP61UlEiAFy9dy2UMuEsqd8FuAPfhVuI?=
 =?us-ascii?Q?LO1kxrhyStPL21r7CEDLgL+XAUpwNfappTsgaZDcc5j4rhXiPksSSrWyzDek?=
 =?us-ascii?Q?/mpR21AzbzAnD5ZJ9klU3GA1JC1y+W6IvATOUKBze/3oawzYTBSNauPUVDw6?=
 =?us-ascii?Q?lnj1VxBwZ0tpLGWzPJkr4CWr0IJgC0SvKuPaJg1wKtH0YDd+wtPFEeoPsdOk?=
 =?us-ascii?Q?k+Zyd2/K3XKzSYFSh9xs6VsA+v1rr9xPiG7+i+vYXlO07wYcEcrze5kviSdB?=
 =?us-ascii?Q?l6kS4WJHSLqaaOCpQXnqkmEMO7gLKz3Q741ZF6MVxpn+9GMqIzL+/4PPiPRb?=
 =?us-ascii?Q?8Hwp25645bX9AX6oLI1ZN6dJ/wCHrXcFylpw1qse4PBuiaRChn7Gp4SEPQiD?=
 =?us-ascii?Q?cZDAErrHfZzWeiKeO1yOjAChIQtbBZsigoplWvEKIWSuqEdRn4QyTHxzDqYc?=
 =?us-ascii?Q?i/kppckt/qp8Jh5xS58JYZDZsD9d8rLIIReliPSbGvoq0gbRUwgJOeYYfxfy?=
 =?us-ascii?Q?NyOmFWjAHZIMQyQiE7C1fYsFTi9W7bLVKTH6wIS8BEs9vbu/lCYSnmuMUXQQ?=
 =?us-ascii?Q?7i6mK4r91zkQ4BwfIKdY0xZKC8aQ+BImzJ0FfliUFSWk/NIRSXkqvivvEWnW?=
 =?us-ascii?Q?qXjxMuLEONn7H3cc9xAWdatF97esJ+py3954xt/1vMPJNbG5XqmMGuhE6vb5?=
 =?us-ascii?Q?cqqxW0JSylmb44b2LYIUgvpxTJUTt+NaHqEHyWO+2eGfbgKCrCqXmdze94RH?=
 =?us-ascii?Q?UKAcIAZBsw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GIqr3fzoXy7PVoGC34swr4n/FDv8H9+A72nsWt8T+4ce2Hk96RarCf+/HB79UiFpzBukqssvOBCu+ld/cZe/Uy1Kps2pfSlKY3T6iACw8Af4gjVAvjlPxZf0xuMIj/cO5vY7twv/t4uS2CsLmqPFjdJOlP8RK8+E0qkSMLT2OJ6s6G2Bkv1kwD3HgihT101p4mE8XW/b+DyALzq3688pg2R+iWjNnUU05+4LZZiBNzgReQoQfGjrUOHnkQZ6mWkxGOLrmUu+bI8yy3jeme5zLdTAUyFam8wPR0LPiDOUEokg3BQgQuyPrdvDfYHkVoP/eXcw9XkgYgH/AaF/r0fFUQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4c419d-1063-4597-eb72-08decb8580dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2026 08:58:58.5782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9zgsZQykqH5r0qvGGk45/4MCufDkaaw1QtTrlemBs5cthDBStNulK1YKQj4FZPyuUDJCgYDgjgjsxD56Nw1+og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9583
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

Hi Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Tuesday, June 16, 2026 10:49 AM
> To: Samala, Pranay <pranay.samala@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Subject: RE: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
> suspend/resume audio tests
>=20
> > -----Original Message-----
> > From: Samala, Pranay <pranay.samala@intel.com>
> > Sent: Monday, June 15, 2026 3:36 PM
> > To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
> > Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan
> > <jeevan.b@intel.com>
> > Subject: RE: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
> > suspend/resume audio tests
> >
> > Hi Jeevan,
> >
> > > -----Original Message-----
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > > Jeevan B
> > > Sent: Friday, June 12, 2026 11:29 AM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; B, Jeevan
> > > <jeevan.b@intel.com>
> > > Subject: [PATCH i-g-t v4] tests/chamelium/kms_chamelium_audio: Add
> > > suspend/resume audio tests
> > >
> > > Add test to validate audio works before and after suspend/resume on
> > > HDMI/DP connector.
> > >
> > > v2: Perform a single suspend/resume for all audio combinations.
> > >     Re-enable chamelium after suspend and separate pre-suspend
> > >     and post-resume validation paths for clearer failure diagnostics.
> > > v3: Drop commit and use igt_assert_f with explicit messages to
> > >     distinguish failure in audio tests.
> > > v4: Updated test to avoid false-pass on zero executed configs.
> > >     Replace post-suspend forced re-enable with connector
> > >     re-probe/connected checks.
> > >
> > > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > > ---
> > >  tests/chamelium/kms_chamelium_audio.c | 159
> > > +++++++++++++++++++++++++-
> > >  1 file changed, 158 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/tests/chamelium/kms_chamelium_audio.c
> > > b/tests/chamelium/kms_chamelium_audio.c
> > > index df8d27c0c..cc106f52a 100644
> > > --- a/tests/chamelium/kms_chamelium_audio.c
> > > +++ b/tests/chamelium/kms_chamelium_audio.c
> > > @@ -52,6 +52,12 @@
> > >   * SUBTEST: hdmi-audio-edid
> > >   * Description: Plug a connector with an EDID suitable for audio,
> > > check ALSA's
> > >   *              EDID-Like Data reports the correct audio parameters
> > > + *
> > > + * SUBTEST: dp-audio-after-suspend
> > > + * Description: Verify audio works before and after system
> > > + suspend/resume
> > > + *
> > > + * SUBTEST: hdmi-audio-after-suspend
> > > + * Description: Verify audio works before and after system
> > > + suspend/resume
> > >   */
> > >
> > >  /* Playback parameters control the audio signal we synthesize and
> > > send */ @@ -695,6 +701,66 @@ static bool
> > > check_audio_configuration(struct alsa *alsa,
> > >  	return true;
> > >  }
> > >
> > > +static bool run_audio_test_once(chamelium_data_t *data,
> > > +				struct alsa *alsa,
> > > +				struct chamelium_port *port,
> > > +				snd_pcm_format_t format,
> > > +				int channels,
> > > +				int sampling_rate)
> > > +{
> > > +	struct audio_state state;
> > > +	bool success;
> > > +
> > > +	audio_state_init(&state, data, alsa, port, format, channels,
> > > +			 sampling_rate);
> > > +	success =3D test_audio_frequencies(&state);
> > > +	success &=3D test_audio_flatline(&state);
> > > +	audio_state_fini(&state);
> > > +
> > > +	return success;
> > > +}
> > > +
> > > +static bool run_audio_tests(chamelium_data_t *data,
> > > +			    struct alsa *alsa,
> > > +			    struct chamelium_port *port,
> > > +			    const char *audio_device)
> > > +{
> > > +	bool run =3D false;
> > > +	bool success =3D true;
> > > +	int ret, i, j;
> > > +	int channels, sampling_rate;
> > > +	snd_pcm_format_t format;
> > > +
> > > +	for (i =3D 0; i < test_sampling_rates_count; i++) {
> > > +		for (j =3D 0; j < test_formats_count; j++) {
> >
> > Please consider restructuring this format/rate loop execution into one
> > common path (single helper) and reusing it in both
> > test_display_audio() and test_display_audio_suspend_resume(). This
> > keeps behavior consistent and avoids duplicated loop logic.
> This will work as a helper, Once this goes through, I will float a patch =
to
> update the basic audio test to use this function.

Sounds good, doing the common path refactor as a follow-up works.

> >
> > > +			ret =3D alsa_open_output(alsa, audio_device);
> > > +			igt_assert_f(ret >=3D 0,
> > > +				     "Failed to open ALSA output\n");
> > > +
> > > +			format =3D test_formats[j];
> > > +			channels =3D PLAYBACK_CHANNELS;
> > > +			sampling_rate =3D test_sampling_rates[i];
> > > +
> > > +			if (!check_audio_configuration(alsa, format,
> > > +						       channels,
> > > +						       sampling_rate)) {
> > > +				alsa_close_output(alsa);
> > > +				continue;
> > > +			}
> > > +
> > > +			run =3D true;
> > > +
> > > +			success &=3D run_audio_test_once(data, alsa, port,
> > > +					      format, channels,
> > > +					      sampling_rate);
> > > +
> > > +			alsa_close_output(alsa);
> > > +		}
> > > +	}
> > > +
> > > +	return run && success;
> > > +}
> > > +
> > >  static const char test_display_audio_desc[] =3D
> > >  	"Playback various audio signals with various audio formats/rates, "
> > >  	"capture them and check they are correct"; @@ -762,8 +828,10 @@
> > > static void test_display_audio(chamelium_data_t *data,
> > >  			sampling_rate =3D test_sampling_rates[i];
> > >
> > >  			if (!check_audio_configuration(alsa, format, channels,
> > > -						       sampling_rate))
> > > +					       sampling_rate)) {
> > > +				alsa_close_output(alsa);
> > >  				continue;
> > > +			}
> > >
> > >  			run =3D true;
> > >
> > > @@ -789,6 +857,85 @@ static void
> test_display_audio(chamelium_data_t
> > > *data,
> > >  	free(alsa);
> > >  }
> > >
> > > +static const char test_display_audio_suspend_resume_desc[] =3D
> > > +	"Verify audio works before and after system suspend/resume";
> > > +static void test_display_audio_suspend_resume(
> > > +				chamelium_data_t *data,
> > > +				struct chamelium_port *port,
> > > +				const char *audio_device,
> > > +				enum igt_custom_edid_type edid) {
> > > +	struct alsa *alsa;
> > > +	igt_output_t *output;
> > > +	igt_plane_t *primary;
> > > +	struct igt_fb fb;
> > > +	drmModeModeInfo *mode;
> > > +	drmModeConnector *connector;
> > > +	int fb_id;
> > > +
> > > +	igt_require(alsa_has_exclusive_access());
> > > +
> > > +	igt_require(chamelium_has_audio_support(data->chamelium,
> > > +						port));
> > > +
> > > +	alsa =3D alsa_init();
> > > +	igt_assert(alsa);
> > > +
> > > +	igt_modeset_disable_all_outputs(&data->display);
> > > +
> > > +	chamelium_reset_state(&data->display, data->chamelium,
> > > +			      port, data->ports,
> > > +			      data->port_count);
> > > +
> > > +	output =3D chamelium_prepare_output(data, port, edid);
> > > +
> > > +	connector =3D chamelium_port_get_connector(data->chamelium,
> > > +						 port, false);
> > > +
> > > +	primary =3D igt_output_get_plane_type(output,
> > > +					    DRM_PLANE_TYPE_PRIMARY);
> > > +	igt_assert(primary);
> >
> > Primary plane is fetched and asserted but never used afterward. This
> > can be dropped if not required.
> I agree it looks unused, but this was kept as an explicit readability/san=
ity gate
> to document that a primary plane must exist before proceeding.

Primary looks redundant here since chamelium_enable_output() already fetche=
s and=20
asserts the primary plane internally before using it. So, this duplicate ch=
eck can be dropped.

> >
> > > +
> > > +	igt_assert(connector->count_modes > 0);
> > > +
> > > +	mode =3D &connector->modes[0];
> > > +
> > > +	fb_id =3D igt_create_color_pattern_fb(data->drm_fd,
> > > +					    mode->hdisplay,
> > > +					    mode->vdisplay,
> > > +					    DRM_FORMAT_XRGB8888,
> > > +					    DRM_FORMAT_MOD_LINEAR,
> > > +					    0, 0, 0, &fb);
> > > +
> > > +	igt_assert(fb_id > 0);
> > > +
> > > +	chamelium_enable_output(data, port, output,
> > > +				mode, &fb);
> > > +
> > > +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> > > +		     "Audio test failed before suspend\n");
> > > +
> > > +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> > > +				      SUSPEND_TEST_NONE);
> > > +

It would be good to add chamelium_assert_reachable(data->chamelium, ONLINE_=
TIMEOUT) after=20
igt_system_suspend_autoresume() and before connector reprobe/audio validati=
on. Other Chamelium suspend=20
tests already perform this, and it helps avoid failures when the Chamelium =
board takes a little longer to=20
come back.

Regards,
Pranay

> > > +	/* Re-probe connector state after resume instead of forcing a re-
> > > enable. */
> > > +	drmModeFreeConnector(connector);
> > > +	connector =3D chamelium_port_get_connector(data->chamelium, port,
> > > true);
> > > +	igt_assert_f(connector->connection =3D=3D DRM_MODE_CONNECTED,
> > > +		     "Connector disconnected after suspend/resume\n");
> > > +	igt_assert_f(connector->count_modes > 0,
> > > +		     "No modes available after suspend/resume\n");
> > > +
> > > +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> > > +		     "Audio test failed after suspend\n");
> >
> > Update the message
> > "Audio test failed after suspend/resume\n".
> Sure, will update this.
>=20
> Thanks
> Jeevan B
> >
> > Regards,
> > Pranay
> >
> > > +
> > > +	igt_remove_fb(data->drm_fd, &fb);
> > > +
> > > +	drmModeFreeConnector(connector);
> > > +
> > > +	free(alsa);
> > > +}
> > > +
> > >  static const char test_display_audio_edid_desc[] =3D
> > >  	"Plug a connector with an EDID suitable for audio, check ALSA's "
> > >  	"EDID-Like Data reports the correct audio parameters"; @@ -866,6
> > > +1013,11 @@ int igt_main()
> > >  	connector_subtest("dp-audio-edid", DisplayPort, &data,
> > > test_display_audio_edid,
> > >  			  IGT_CUSTOM_EDID_DP_AUDIO);
> > >
> > > +	igt_describe(test_display_audio_suspend_resume_desc);
> > > +	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
> > > +			  test_display_audio_suspend_resume,
> > > +			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
> > > +
> > >  	igt_describe("HDMI tests");
> > >
> > >  	igt_describe(test_display_audio_desc);
> > > @@ -876,6 +1028,11 @@ int igt_main()
> > >  	connector_subtest("hdmi-audio-edid", HDMIA, &data,
> > > test_display_audio_edid,
> > >  			  IGT_CUSTOM_EDID_HDMI_AUDIO);
> > >
> > > +	igt_describe(test_display_audio_suspend_resume_desc);
> > > +	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
> > > +			  test_display_audio_suspend_resume,
> > > +			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
> > > +
> > >  	igt_fixture() {
> > >  		igt_display_fini(&data.display);
> > >  		drm_close_driver(data.drm_fd);
> > > --
> > > 2.43.0

