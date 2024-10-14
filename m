Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6DED18151
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 21:50:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4719E10E012;
	Mon, 14 Oct 2024 21:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g6ZxkV0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6011E10E012
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 21:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728942656; x=1760478656;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hjgh7sHVcKYeTbNXxMdcMMQKOZ3XU7h6shmSKk7NfVA=;
 b=g6ZxkV0fEo2HdIdx+zHLVX1YsrZ3bR+ZHLNRmXMBhPEPqe4vHMR7DWF4
 s7AzVmKd2lQaHp8DuI9BYRAkxTXNv8F6H8/sFxKpWcQ2Czsaz250+CMh8
 gNDDT2xT/afxuKDanwwA/25q6dbIw++pOLHtXTBQ+eXnBSIcq69SDFqQY
 g5U8CJF7KUjxIozolmgPkE0puBFB0mFAnbakcsZDYoU4jRudAnISSqu58
 TvJi76UtQ5ktvF5HhWv/XpFt0CLTlI21ykh9swynu/JP4zUiIgseeUs1N
 pWd5uMS050fyRYb7vQae02GKM/jDNKCTdbKK4EzX8CJrSXaFhJGIQStmG A==;
X-CSE-ConnectionGUID: ReI1aZa+TGivTRba/sNaJg==
X-CSE-MsgGUID: PUkT9nSZQUuy7lyYwPms6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="45822092"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="45822092"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:50:56 -0700
X-CSE-ConnectionGUID: 0t68TXlVT7CIr3CpoplAXg==
X-CSE-MsgGUID: fr/V7uV9TiiiymQYv1r+0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="77704997"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 14:50:56 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:50:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 14:50:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 14:50:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AjQEF/r4NtLnCzJvga+jqK67fetK36YFeK6eMXdGCLalW3Fc5fIqPDDwbCdH/B1lXvEo/+dOum/OQx7neFjtBwDdBuf78WeKCMpJBGeH2+DZpWLYsjFdq8EEcAZkvh4e9Re/8i0FFnYc16P/mEQbTKSNbf7t7gd5lZgvFTdQ8x1xBj3Rf/eBl6NoAYAMJ+fRgjfRRezmJ98qKlAxuHd50XHSx993Pa57n99NHLr2u6K8lUotguk9gNsJfpRpo6iJ3b8+i7kr62fTWw2zRmzmGOTjFg7afTDDaXVbGrz4gNK2uHg92IRIgP88SkEHCDVHiQzmIe0mAoLEWQy1tuO+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8OsYMKNyVU81PxwLFUZQGlKsP7UwasYjBmr9SlleHMM=;
 b=BbiJ6FvX0virfLm6wRxqooXqWbCslyBzTH2ZzvHwt+kX3E024ZHj9vGUd77HYuU4PoItOY8+Ht8e81i+9HfAdU63+N8v+CRUbI9avsFv1HTn7XxxVgW8zpnTdcaxCaic2chJmuy8UtThbRgZRAYeg+Wt4hQ5H+J+UFrBZdZpFcFUurU2tR7DNmXUCBg389he+zmULf15UMnYg1vTsXp7MgKJh9HlekLgyuoh/SFp66J1/gZBfcSwPWi4TBaIhJPwbeYFAoYVlhIDEQ7+8o2AH95SuAdabOlHMvlNKT2KfqDRZ6i5Hyd9Vl/Wf12uoqrTZUTFWez1DnmAfg6qJq4eWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB6520.namprd11.prod.outlook.com (2603:10b6:8:d0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Mon, 14 Oct
 2024 21:50:53 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 21:50:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] tests/intel/xe_exec_reset: Explicitly declare exec
Thread-Topic: [PATCH] tests/intel/xe_exec_reset: Explicitly declare exec
Thread-Index: AQHbHoGU/OlglbQ+6EWM5OjSTK5+qrKGx8YAgAABCSA=
Date: Mon, 14 Oct 2024 21:50:53 +0000
Message-ID: <CH0PR11MB54443EA3C5CA1C8DE8D523CBE5442@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241014213937.255940-1-jonathan.cavitt@intel.com>
 <85iktu2war.wl-ashutosh.dixit@intel.com>
In-Reply-To: <85iktu2war.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB6520:EE_
x-ms-office365-filtering-correlation-id: 7b2713fe-bce6-44fd-8a28-08dcec9a46a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hz1AD2hE2CRY1oh+c7qfHkS6tzQ/MV1tncQNBJCg345VuoSa3u3JYs7ZCuJw?=
 =?us-ascii?Q?Yn3enI1AYN/ZQBY7nnVXGRiAxaftw5WKX2HsqqyaOLh5go78htb9Ii5ahTj5?=
 =?us-ascii?Q?zZQJOling3my2htJoKAaMzrUSb6R0eyylSJG9h4DQV80grs8XtsTzJxoy3NP?=
 =?us-ascii?Q?jMGARe6nyvgMZFpt0hPy+BFIur2hq5sNTJ9NFjoWhpzXd/y2iyTctb+ryKJL?=
 =?us-ascii?Q?7QUC531o7rFKfYV5OtBAlQ0r7UxTWCKYcrXEvbIgdh3gVsUtaYpzM1fz2N9T?=
 =?us-ascii?Q?NpdYDfgb+CjORvk9sTZgwZfImmQwC1QwY0RBuARToWXAcPqmQ8DF+DlFImrU?=
 =?us-ascii?Q?DxrSc6ehINffh9kZadrRY1vd8nYybD/1GAQXuu7XMae/rhOTck9srzZ/htKJ?=
 =?us-ascii?Q?qbJnERrOecEiOoe2btaOdzRHKPyarKvyqf1kov4eF4Za1H1YBmYK9WiCldxI?=
 =?us-ascii?Q?w9TEDwriH5thMVIEw5ELeqmLZoUf3Ea0+AJr/q1ddeDVbg1o+YPSGPvWsqVX?=
 =?us-ascii?Q?etXZ7hVTIL0b7uBcCSSfTrIPfpinHcxV84PmirzbYiCfTw4WvcDMSDOYKZWv?=
 =?us-ascii?Q?bYIyJt87QtnPBzKe0xzdCMFAwbz7HjB9vZPb4h9LZUvqB+PBYNlzCT4+s+Sf?=
 =?us-ascii?Q?z2nW9pooFL65di6ffX2A7Z+8cNeckhEQbjbnFuLs6Tjv7BCUCCY7YYu6HCra?=
 =?us-ascii?Q?l5eNy5a1bzODPLY2EWLGfMWqnIrnISK4Ze9EDvam0hmL0e9PS3i3/0lpAXyO?=
 =?us-ascii?Q?MA6cmx4Dz3nY4ErqorjjqynyWsrTuibHVSmzhMpKc2h66SPE1fZKmVJMrDxE?=
 =?us-ascii?Q?ljUe6c1wi4RfWvAkB9EPrQM8J+dEOqO8F9PdJHXK5IXVwXU3wrwafkNMZ+hV?=
 =?us-ascii?Q?bxUuxI2O7AwrbQiyZcQberHtEoxUs6JIwXw8qJUadaMRBz7mO1JJssWZ7dVG?=
 =?us-ascii?Q?QGHCzpdDPvyPl7R+o4uK2amlm7a+ArriurdcRveeT6OuEfRdjk3AGldqk7Em?=
 =?us-ascii?Q?r9mfU0yr9t7hXO2b1XztvIRfds106bR9Lo8ucfBEPz0PdXXG6FjK4VCpu7Ha?=
 =?us-ascii?Q?uLuccpJGX/SHMrEOcpsJ7mbK+919/bl5FZ+pQLH4LmM/11Odx3xx0HlCbmIK?=
 =?us-ascii?Q?3VgSoXMoRNePJR6fu84eO0/RB1q7SIzET+Ap150s6KJ1NJFjyipAwnT/ma9n?=
 =?us-ascii?Q?M29DgR/Levu3s54eDcytdfKTHZIzGW4UAM3kiD5li5qcubpuetuT3Nngk3gq?=
 =?us-ascii?Q?Edz0NNv0kY4xhvxlse9UJWUUk9uaiZe37MVdRDd38acZ3aHCGj1INJu45kAH?=
 =?us-ascii?Q?8bnqYNR+InKMvOUzAy8uuGtwU1TDvsWc004byZGuer7kFg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?taUrQ+wmi4gYSYFHOEH2Z0rAAESlknO98LxncSEIEP8GwK6XmkEdF6CCHHUO?=
 =?us-ascii?Q?AuXuAZXT2eVEQvPBzUkrweTUq+Fzf8wLStxAp/Xnd51+DsnoRlEG/FT/7EBi?=
 =?us-ascii?Q?Xsjo402h6OJCWB+HWzq1r97Y2oAIU8EmjVKkYQZo9QUHZbVLgquQl8S0Aqnd?=
 =?us-ascii?Q?FX09serhQYJYJOUr3xK7620KEajxZHOdepLeSKPoNYvoobttRU2zP9ZykshO?=
 =?us-ascii?Q?XF2Y8Tog2EOVpGyZF5rgI4Y/v31EA+o7B+zxgFZlusMiYPrwXmGjZAv+I45q?=
 =?us-ascii?Q?YT2hqfAOnqL+HELdzSCrApU5YxbNV8ftbqKiTkasXg+DQ1BIatm5h5tXvlYF?=
 =?us-ascii?Q?YL6/Nyj1RMFbgLHmoowcG1IdEf6/VoBXsCAMQQDPlXDUkEr8Ecz43kh5AP/G?=
 =?us-ascii?Q?Vbhjaqxb45FZcegQWI71QqCtHGC0xcIxFkAHDWe1wsxw3crKs10Nn+0giVSU?=
 =?us-ascii?Q?FZfEsj5kklY/ke9uYdKYRq3cJ+jZrGXI3ay9AsJNGFxfK7ERKjW8/hIZ9sll?=
 =?us-ascii?Q?+krg6ktuQLNh605/E5O6r+1mEiXdYAGy8fFTIcmN3dIT99zEZwKQUadiQw/c?=
 =?us-ascii?Q?a+8J+M4pUVkkWTxuE0iVmaeQTOsFwpeTnisHCfE+ZdQ5C5YGa3SUwaMMRrsP?=
 =?us-ascii?Q?Ym4lZQXe8J1DEbJ3yfHUn64n4BcBZsPycuD1nE5Fuf+NcSYuAJ64IV9Ld+UP?=
 =?us-ascii?Q?731oK4XhWhPB2D9sg/GvIqV6yoAoPIe/K5x+u9mAGK3cOfUAPBYW6klJIXgR?=
 =?us-ascii?Q?bpq2nb/61R5/p6Nb8ghE/rnuWYy/kdkDByn2IVAVi1dn4XiX8RwqzvFsrAZK?=
 =?us-ascii?Q?9o76l8GHE9BrqzE0JshJ/7QizGd2T0HJMZrXz8HRQBRBmAx2AM38T4wmEKqp?=
 =?us-ascii?Q?/Qk1xTPLe5hgmr7hvICzx0HiKlRDlYAz3UsoFAHcUCFtPDXS1+HJKJda37Sl?=
 =?us-ascii?Q?3Nf87jCzw4sRmd3Cw+HLehCg6UunUHx/A4yNX1qWBZ++NOU2c4HnGQO6xLFe?=
 =?us-ascii?Q?0A9NA/VuK3h/mao8mXN3cRUPaTn9VlfsKBnj6/APiYyYIdC0w+6JZVDD3kwx?=
 =?us-ascii?Q?RkWCAschpMowiaqWi4bR+WzH0i1yZ+0rt7G+lb5VPJPlhqxU1gGrcFnKjxA/?=
 =?us-ascii?Q?wLunjZ0FyrkFxTIEfX1Bv+AGsgXPoRg9JQoPZ791Q/68uyAy6lxAJzjdnBWK?=
 =?us-ascii?Q?nkg41R9wmVfJvADN6NK+Fpm41+0D6UzRTt/EYYhic5Gi9KqmYU75pVlgM2Bu?=
 =?us-ascii?Q?L7w6WW16oAIZuTbrCsPOiyzi59h3EGN0ccbInwfn/1dcWKQGR8T1J6BZ4usk?=
 =?us-ascii?Q?rjaByPmnr0u/3G/+NPi75efbLx3E4eh4pZMA6sl9zdgptA5ZoBXa/OGmkiNW?=
 =?us-ascii?Q?+fzPc+SZ9IFA66mrVIvlPBkhFShgbGdS24GhAG9gF+OHwET1bnignTPu87Mo?=
 =?us-ascii?Q?1YnWH2HIk29prY2UT0W4qTyVxbv43r03Fmhvnq3Ndn6r7VlSUaf3XfK7B5sU?=
 =?us-ascii?Q?k9BybbQTdqpDLQc80gZQsBujBU7t99esdl9jCEk9vzT03O4rKgCoWCOrDbmr?=
 =?us-ascii?Q?QvvuwKQYW8Rh70yK8fDU9BEHEZpS0S9Rur2nAYMC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2713fe-bce6-44fd-8a28-08dcec9a46a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2024 21:50:53.4258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jqXmVFOHRiXE6PiDvrm2y+X29EehPdzjczoA4ZJey3K4vCeNtAx9Fa60xvBgydPoWcN+FYGYJda3F+0OjmAwkrsg5PK3o0uJtymAxSerGw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6520
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

-----Original Message-----
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Monday, October 14, 2024 2:46 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.co=
m>; Zuo, Alex <alex.zuo@intel.com>; Saarinen, Jani <jani.saarinen@intel.com=
>
Subject: Re: [PATCH] tests/intel/xe_exec_reset: Explicitly declare exec
>=20
> On Mon, 14 Oct 2024 14:39:36 -0700, Jonathan Cavitt wrote:
> >
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > index b5d5f43eab..fdfefa91cc 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -628,7 +628,7 @@ static void submit_jobs(struct gt_thread_data *t)
> >			.engine_instance =3D 0,
> >			.gt_id =3D 0,
> >		};
> > -		struct drm_xe_exec exec;
> > +		struct drm_xe_exec exec =3D {};
> >		int ret;
> >
>=20
> How about
>=20
>       struct drm_xe_exec exec =3D {
>                 .num_batch_buffer =3D 1,
>                 .address =3D addr,
>         };
>=20
> And delete the assignments below?

Good catch!
I'll apply this change shortly and change the commit message
to reflect the new implementation.
-Jonathan Cavitt

>=20
> >		/* GuC IDs can get exhausted */
> > --
> > 2.43.0
> >
>=20
