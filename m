Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3C9E7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 20:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D739D10EE77;
	Fri, 13 Dec 2024 20:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fRi3ItoE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E772610EE77
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 20:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734122888; x=1765658888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9GHag2UwAkx60S40rH6ZUFvdJ+uvJZCXE5vJHGtN9ds=;
 b=fRi3ItoEsHf6AL8XT0UrlbVmlow5UN2Nf13ob8J2FpMGIfMeBv84uqU6
 3rI9ehvOVcikMHCy/7AztsTeqe2UtEaB+3NRdf4n5q/rZEP3FtTUwt7O5
 05EHejalxVwvOxGA2e5F+IZ7PrBYWAFtcjUozoUEUziKTlCVhNIAgYIot
 yLCDSQyXLxDPaNX+VrLAyCikJhkWV7Eo5hQugRKgIN2RLHFs0B6X/Fjzt
 XZk352CE4MdJHY7tsts4h5H4g8FbA3SwlvEFvDw0BXwPe08MMuCM8dM94
 5MBH+oUYMAghVJiEc24wcyJi7azoVSe4qRboXP3bYIAEe574RVZOkpUyx Q==;
X-CSE-ConnectionGUID: v4WDexJSSayW76prM1u9wg==
X-CSE-MsgGUID: WKX4iKEVRlqO4cHIa5ACdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45972769"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="45972769"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 12:48:07 -0800
X-CSE-ConnectionGUID: 8io8ie5KQ72teVeC6RSPOQ==
X-CSE-MsgGUID: g8GumyqiQSqzr9MVf5FNKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="97414085"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 12:48:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 12:48:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 12:48:06 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 12:48:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WXyrC2BH0LZnbj/GPBtsuUaCohXXXNsibrcx4FagTpltpDAfqYVMynSi5LJI/s0AyKQyBTQKeKDCQ4jfVmOzwBbjum29YzxPOhcic6Y68fdMzt0i44dj/PAsIJNzOnwJSCZ8zqFoGlQwckJMqh4C6rrlpohmRRI/nx767evVhgkp6EZpSGyD9oCSU/UgrQp4kcrr95ulFVhE0F77RJPqLWMlBhUCbDcsynH1FcvGVIne6a3jwZkR1li418uYD2Pi1R8GSyUUwPKYNAqd/j9pZe3sdj3feaEF5ODk//34CxdKsKXA5OzspfsUtq1ejiwLtu8rumTp+Hky5eyvjLh8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a5XbO7/1/Tpd6aUPGne60RdgbwQJswhSZ1gWoWu0EqM=;
 b=w+clQKFAwM10QIW3PwSC5LxsLWl5xawV4eoKu6IcDIoJJonu7Vq+tEC4J9zsOSKy5/xxDKUoqzRPIbSdA19WbUAfHYmWnIkcKn4J/UAJgm1updAcAwBwFWKI/G/YBM5BWC7wyatlUBLvOWRZ03CjTP1WqZwJ3sWKG5YJtRfqnQyAMSiqW/6iwpwNhydqc4W7X6aIwJLK9OMBg48dqPzLFNyNIinHAOjYu2wm5mHUaiV1svVghsZF14CzAwzOzCg0PRObCb+/xaUUyGq6tJ1pSlWqlsnZ6BkSDDLKxMkjOSrEPMNRvGNGST9mDLIErr5+3ReAcYtKOBkqh6Q1P9hSsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB8500.namprd11.prod.outlook.com (2603:10b6:a03:574::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 20:47:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 20:47:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH] tests/intel/xe_wedged: Add AUX error to ignore list
Thread-Topic: [PATCH] tests/intel/xe_wedged: Add AUX error to ignore list
Thread-Index: AQHbTX3WJuFsJN1MIUKHccuTxvNOeLLko4oAgAABzsA=
Date: Fri, 13 Dec 2024 20:47:22 +0000
Message-ID: <CH0PR11MB54445FBB75B7FC801A2BBBF7E5382@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241213164105.14015-1-jonathan.cavitt@intel.com>
 <Z1ybxDYsHhbxuJEa@intel.com>
In-Reply-To: <Z1ybxDYsHhbxuJEa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB8500:EE_
x-ms-office365-filtering-correlation-id: f03ab0f9-55bd-4756-96e1-08dd1bb7581c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+eQeEmAoHUMG4QtiVGQweNnOKVM1oCfgCX+2yIdV/FA4Je8vXCRtnWudhMuz?=
 =?us-ascii?Q?mObtSrzvELqgRtqK/CzNip6W9yszBwUvYScg5LEJ2YnOWFSaXnf4wDPbyaVG?=
 =?us-ascii?Q?6sO+l8Vqi2EOC4iTr+dfw0i/Ug6DAg+KbKhtzeUu32WKJnEmgV0q5KUvkgtW?=
 =?us-ascii?Q?LtckPNgKe4s3iUe1oxKUAeUqZZ6eoM3zXfr+fFpcELy4dBDHf2ykr0PgvEmw?=
 =?us-ascii?Q?Zjmr97jY9Kzr3AdKH8x1M3iSKvCdj4At58vxHzmknMd6RFm9eMsRbdDc9pE9?=
 =?us-ascii?Q?QqqZtKhhF0tOAIHgDAmYfVCwwM/wi40Q3n4sccEpsF6qJwJYH0jrza6WqroG?=
 =?us-ascii?Q?W6PEcBAmg9GMvivU7QfDSYTpR2PW01fjS4yjO4TRey7hujlZ2kIunuZZFX8I?=
 =?us-ascii?Q?ipRkAxiLB6RiVtlzHnhqkVjb5Sn7a2dzUmIasApewAaLlbmjGwL81vI8UcDH?=
 =?us-ascii?Q?OVU/+wR+AQneJ5MikNj8OIP3ve4hkNf+TNyHDKZOa6XIO+vQvGz8MDbc5NKg?=
 =?us-ascii?Q?NrsRjpGr1b2xyL7+kKzfgukt4u/8XTgx0sZQQpkv04ikQN5TrmPDJLwplTYh?=
 =?us-ascii?Q?R0gN3dPoZ5Kc2zft1RhzXxVERCVi3iCDA1FJQn6fB9UA0yD/pOwXuWQ4znMp?=
 =?us-ascii?Q?pkbbrJr0EvpmYn1ug3XqOXAXJU05rAZUPSLwJqhsWjZsflsAoRSlCSA3iS1O?=
 =?us-ascii?Q?rr/aUlbKa1UIKrJEzAFJaPUbG9fP//J0UIxHyMQ472DffMEJZZigy02kf4ox?=
 =?us-ascii?Q?RLeprBidn9BiAGzvg22LLH50wBIhILHPQGMmasSgSA9CgeUXzQye52oDDGPm?=
 =?us-ascii?Q?zHtO33VBNzP21+Xcm7CbTyFA3UjHaSp73cmMjoHLpwt1vIxqI5mztDxlMbet?=
 =?us-ascii?Q?TNWFWByBoFsUHcPnv1TU3q7q25ft2w9G45okmy18JJRHDQp8coXipVZM5bmW?=
 =?us-ascii?Q?s37loZTRsajhb/knxeRpNnIoWpFAy+27lTURL3PGCHiVXTxW7B0XAC2SMBJC?=
 =?us-ascii?Q?GYZFGoeLNDTvRdO11WiE+wYFygvEc3aiNKZgx11uLlE+Qs4uYaJ8MKK7A+Dq?=
 =?us-ascii?Q?K0gVC1kmPfAd6kh7UimskR/oF1be9f3jXIDK/e8IW72DllhKXT9j0eujoFTQ?=
 =?us-ascii?Q?aPDmRMm/uAcL14MwWyLvrLkVLvv85bU57mwkRwV+piIFVhy/r4wUtO8pqTXJ?=
 =?us-ascii?Q?uzYwT9u99FvMFAzj7IGZtDkS6sf/rwQHi2kGY5Kwwz2ag7z7DCX73HIEqdPX?=
 =?us-ascii?Q?ApSfbyP16yJ9QCcn84W/wFJGImu1Ts4xxxeLWtimWoU8htMB3doavcxZFHy4?=
 =?us-ascii?Q?q4/TFszK0s/dh9sXszxkQZzscT72k7kYpNh5yBtKBucXY+FycU+BpbbjFbLp?=
 =?us-ascii?Q?tIvRYdb+eom5n+FXWN5VpaIr7+8ABzoPdtiFHb/OMB0cknEaTg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?E20VJ+yK+M6NZzERCalr87QTBnqGTE0nIL7wDmKPWJ2+lPMXVpOAuu51QL2y?=
 =?us-ascii?Q?fqdZ97ZMGS6aBs7CU6vZP8viARFN23XeHUV8P+WnmRY5S8aHDBUFhPTKDl32?=
 =?us-ascii?Q?93xoMt6H8v6v4MBx9CBaDvGaFpuTUrwx0FLRU08feAGsqGxMkIKVm1kX7mhK?=
 =?us-ascii?Q?vgbZRr6dmgxyKuOco2mEC2IqFxxwWo0A5arxNoMvps/URAaIP5X+2ng3JwaW?=
 =?us-ascii?Q?gecswBR10g0NGP9Z6LpXwzcjD5jZk3JAkwPHt/HdwSXeXVpmeQGUvXjHviFF?=
 =?us-ascii?Q?sVt/biTdoKXy4TeHTWL1rObp9HhFqqYNqWRCqYFk5kpBTTqJ2taFyxxila4N?=
 =?us-ascii?Q?6hGWLoFbUzPvv9Aajo+x6NDrFE2d0DD0bvmI+L0oz/bKezikYKdn8jFKTMdH?=
 =?us-ascii?Q?JXCy1JtL1cDtpGpInXADqt1zvqKkyrwMG/FZ8lLU8kgmveUsDoQXj1+AoY7q?=
 =?us-ascii?Q?Yala+G2yJg+AMONkdMZAdjxcHp3+mShq8EMVzTwAc+GZUOlzF6n6gxMpPgZD?=
 =?us-ascii?Q?6c66Vp4XCRLCmM2hlgLBtrDFDq7/Nl5zd65ezN4Lxyn+hyytL3Vv+SxuTyNx?=
 =?us-ascii?Q?Ecbh/XaRRILrshboqTiCek7aAbonVsqkzg9EYmzMsixtxaiTKW6LDvYkPDdi?=
 =?us-ascii?Q?1ACNycLPj11fwB4SJniV02I0r64MyzrPxqX1OlBlhkcokAvT5cHEWZ/O/Jty?=
 =?us-ascii?Q?BQQnZ14aLBALe01kCvKui7Xii5Zd7H5cpcWJmoOStBCelA6HnfksUJ2pW1dw?=
 =?us-ascii?Q?W32vp6uDaE2s+zEqQseJdC0/RMeqfXOQe+mPJbfRsxU8iwI3hPhs913M5m4Q?=
 =?us-ascii?Q?kBGK8COicTfcqXOB31iSs+5Fy8w/KVYH/Wnym3Mk9XQE4Ki4L6W0Q3C5m6qn?=
 =?us-ascii?Q?STPYzB5q9x2tl+Yog8PvhonU3k0vWsAOmfs69YYlv5vot7geop626m7ZB4yE?=
 =?us-ascii?Q?jB1KPIKBURx12o2TEbkmkovV0+AdHw8+uM2S2R7nnE2sZChqQzq5rsQoR0wx?=
 =?us-ascii?Q?aqRZ4UQ7oSVKn0E78a5WGRHcqnknoathhDfOKDPqK2AXHi6HG3fuzLmR/Osf?=
 =?us-ascii?Q?1NBpnFFiZHeGM9U1+HpXgEh/pAl+qh2l1EE8VKILSy8AkWvUfgK5LPylar4h?=
 =?us-ascii?Q?z0yWT9VMUaR74mOPsQiRYVOq465hQar1ISa9VsCkRriVQNzvhcFngvUf61Qc?=
 =?us-ascii?Q?H/HrjjQObR4f0bsgJWSqg/r5Vkqq6lqicUd04o1FKy02uce0TMQXYVVbs82W?=
 =?us-ascii?Q?kQZTO+cdZcw5Frte4wJR71LgYKx1We0hcZLqkUJocK65q9C2GSygqIUYU/lE?=
 =?us-ascii?Q?YqnW+55Nc/2TuILBP/hLsgevwJ9xVXknWwKsJWvCaOOJEqoTzzbJKxIOs41J?=
 =?us-ascii?Q?oJPsqb45h6c0mt2144CMd8upX/PI8v9AKLWVNO8uB7TjtBWTgK9R9qbKEFiI?=
 =?us-ascii?Q?jYkioWypaWn4WV2+5zfslexBJhm8ZlPFmIIDAz7nN3zinJQmTQXJkp9/Fyrw?=
 =?us-ascii?Q?TtfR0y3OjPTckOXruMp1cZn77yWerqIigFYp2AI5F90Z/P7ww5EgcH8TIEko?=
 =?us-ascii?Q?zi2HGR6KsylPK8TpCr5Gme+PDrXYN+2OtVksNDS/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03ab0f9-55bd-4756-96e1-08dd1bb7581c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 20:47:22.7130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Pj1hv0jAgXtWuu4fsoHsDJ5RH9x6dUHdNt1okujJZGwFFhovuhXsu9vyzH1czyzTKECNp83aLJLGjR3W6EClzpMg+ny/VFy5PgtiEmrjqv4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8500
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
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Friday, December 13, 2024 12:41 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.co=
m>; Zuo, Alex <alex.zuo@intel.com>; kamil.konieczny@linux.intel.com; Kempcz=
ynski, Zbigniew <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH] tests/intel/xe_wedged: Add AUX error to ignore list
>=20
> On Fri, Dec 13, 2024 at 04:41:05PM +0000, Jonathan Cavitt wrote:
> > There is yet another warning in dmesg which should be ignored.
> > Specifically:
> >=20
> > xe 0000:00:02.0: [drm] ERROR AUX B/DDI B/PHY B: did not complete or tim=
eout within 10ms (status 0xad40023f)
>=20
> this is a side effect... we should probably investigate a better
> way of handling that in the driver I'm afraid...

Understood.  Thank you for the clarification.
-Jonathan Cavitt

>=20
> >=20
> > Extend the regex further to cover this error.
> >=20
> > Fixes: 21076ee0 ("tests/intel/xe_wedged: Ignore more dmesg warnings")
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > CC: Zbigniew Kempzynski <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/intel/xe_wedged.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> > index 613d571b44..65d715e845 100644
> > --- a/tests/intel/xe_wedged.c
> > +++ b/tests/intel/xe_wedged.c
> > @@ -33,7 +33,8 @@ static void ignore_wedged_in_dmesg(void)
> >  				    "|GT[0-9A-Fa-f]*: reset failed .-ECANCELED"
> >  				    "|GT[0-9A-Fa-f]*: Failed to submit"
> >  				    "|Modules linked in:"
> > -				    "|__pfx___drm_");
> > +				    "|__pfx___drm_"
> > +				    "|AUX [A-F]/DDI [A-F]/PHY [A-F]: .*");
> >  }
> > =20
> >  static void force_wedged(int fd)
> > --=20
> > 2.43.0
> >=20
>=20
