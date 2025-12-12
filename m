Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F0CD44145
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A1610E55F;
	Fri, 12 Dec 2025 09:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZmxhqfDG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7FD10E55F
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765530981; x=1797066981;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RF9Qcu1ksJpn33nxxOaJE0YzQcRpzjbinp+GZaG/btk=;
 b=ZmxhqfDGbZF4DUztuZBDUio/9hZQad1xYo5XVhXSfzsNQkwTIsQ93GMC
 4R4x2eO9nRizc+uumBdZC+X0AVXECRKvwg59Ht09UtBdzr03wASRInQzt
 GDatvb/eJ2UWqjsHD2eDiSrMyI/7+yc5TaO/+ym7+q832lMCYMT6FWf7D
 eHHJ/ARBwt8XGw6OSLB0R3LcXaYmqwxOiguGEtMROgD17Sc3UaRImjP9n
 yMkRD+B7IlzvLDVmw4m4rlCScSFtaOMajcED/4UZ4YqFaXza0VzrsZzsi
 VjQZQoZQC91HFk1VJiXGgYsj8CB4mwUCkT5yglHMlusWHcjntpMTv/pRx A==;
X-CSE-ConnectionGUID: xJMq2wpeQI+uR+qx31PsFw==
X-CSE-MsgGUID: Vr7l09KTT9OiXzErivI43g==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67559659"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67559659"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:16:21 -0800
X-CSE-ConnectionGUID: 3L/HnLsEQ5yyxwGXZLzDWA==
X-CSE-MsgGUID: mS9m3AalTf+VehD/TBgw5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="201456410"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:16:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:16:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 01:16:20 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 01:16:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1qIn+elOLJccU1nNQxyoSHnVlHHAtfb/QGfv/ZS1IcU5Ag2BaGQv+5eI8poPwTWa4UXcSq16ztErUst8Nh2L/24EzDlTu+d/IK/EqCmP5OKibnpXouAeERfy2329xvWL3Fhy3Jh/cDS83SfQgK4dS77C/tVgJfsn0XQpXAeDlKJdvZJZ/NgxNV8MqkHhBveockjsmg5sYYTBDstlL7ySGnbsZ6q83E7QE27JVV/Mt8QOBdyXe7Ook0dzKNwIXA69B+AzS24qcRsOeBw1WWE8lACQkAPmNHW5tOMYgsjmdV9M2ybj0L3JgJzs9T3V52kJHaJ0jrCJbuwXXwukUCtDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+ujR/heDZIRsPdTZB59r30774mV63xYsQ9eJWX0n7Y=;
 b=oW9qVknnkee19forIFJYlzQVcsAku5S6632HeyQ7KxUsuUd49FoTr5BI/9bp2QaOcZSwz4O0xPzjFTCqYXgKSeyYTpzH89qQW8571Y2wNnLJ8Joa55tFpMlgVOJxDOh6uwj3CAB6sGsMOEfCSYJv6eQOwUK4GEagrGFOX0YhK5oCMq4H4GKcjqNReRiPdTwPKYDVC4aqgNDA714uU6kmdrY6KNBFaTU4NNhvc0eFC4x+wfsGAUJdcqQbxrqx3pMEoAfUu0kzfwjZON2B/yJBmlpETdWSwmLWNrAdw/34L1zXY8ZU3xcVVeusxQPuCZL2jI+JVRc0O/dixNEircnNJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA4PR11MB9011.namprd11.prod.outlook.com (2603:10b6:208:56b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Fri, 12 Dec
 2025 09:16:17 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.011; Fri, 12 Dec 2025
 09:16:17 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v3 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
Thread-Topic: [PATCH i-g-t v3 2/2] tests/intel/kms_joiner: Add function for
 pretest checks
Thread-Index: AQHcaywscwtTAGunJ0qJXzBopUE2NrUduT+g
Date: Fri, 12 Dec 2025 09:16:17 +0000
Message-ID: <DM4PR11MB63128682A13F5ECAEC3F4D1890AEA@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251212055717.2870018-1-karthik.b.s@intel.com>
 <20251212055717.2870018-3-karthik.b.s@intel.com>
In-Reply-To: <20251212055717.2870018-3-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA4PR11MB9011:EE_
x-ms-office365-filtering-correlation-id: 9284f4d6-b03c-468b-12eb-08de395f1b1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ykTFbKQkoKwwkhFIt9ljkd3ZBmbDXSh0ix4jJ+kwFGa1xqrmr8YA3rlJl4Hr?=
 =?us-ascii?Q?QGwkxMgdBHdA7p1voxyC08zXTniV3XlJIAM9E0/DYPw3jK2+77sL6UPx3iVS?=
 =?us-ascii?Q?byohJ0t//d2+JNTu79V4pLlNKJ7e+V4HNCC+yTXHucL5PZxXpE7NM3EgNsBq?=
 =?us-ascii?Q?J7CEB+aYZcpfg2FUhnEwqe8bD2AzRkYacoS7R6fpzjwWBuRbA/rEN5kIb4ax?=
 =?us-ascii?Q?d2u7hYOqwxQrqFB+bEKUhTof0rFStXj//8nSkTPCj65ITDaiM6cjCvH3SZmR?=
 =?us-ascii?Q?HO7ACLz/8KGIMgU+BcHVPYuARrsUCPNqDaHoOcnTjgKSHeTn4mVU7EW1gnEG?=
 =?us-ascii?Q?pnMQO9ZgwHRL6sAHO3+mdzI0rpl8SQqJEnPKQi8f2sShJt+A1Lkg9tDUtWTi?=
 =?us-ascii?Q?CTM9UKHgBv5ng6HS6wahwMqFNAj7swc0tMwt7ljswMDNVkC31/rvfUXSSHwd?=
 =?us-ascii?Q?uhjjRatZR/TdPiQ/rGRfKKV9ubeBM7wIG8737ZFj4Yrt5jGONOOaAARfLX/W?=
 =?us-ascii?Q?xq2WHkr2G85+6XxwDFnEdBFQu12sMrSpz3l2VjRmNbUOfkRoRJNF2LPyF3pX?=
 =?us-ascii?Q?HWM00ONsp43sMHHCwyTOb2g87m+VVgIt1ObRZMK0Mbo80Oc3vy3s5jM+RKTK?=
 =?us-ascii?Q?kbf3buxtyUxZxzTIdgyVc/tc6qwPT3+DW1qwbr4Cz0ot5iKsbZ6Pfl6wQvu4?=
 =?us-ascii?Q?R1BlkKh+EoejCT2gkWxmhGXzmO2tUcldd6DtzEEYp8k6zGaDkH/m3+KUY64u?=
 =?us-ascii?Q?cGhjkGVSo4tcB0XjexEH80wLPLsWn6qAu1j3o08Cd8I0IzOqqtA66fAsQwpU?=
 =?us-ascii?Q?v8I8lTOuNCDbCXMX/i2GqXKbv1LJKogTmjmqJ2SF9fca43NIh2zEnN00H5G3?=
 =?us-ascii?Q?hXBO2/cQPQmmdU1M/QPkJqNT8+0dra75HOrujA6ADBgbbmJbU02aFwEZrao3?=
 =?us-ascii?Q?yuT/GqDEuRFHpHn+UY5PjvhBIAxA32U2kCuKItOIGlCu+6/dYG2UyMd10Fy/?=
 =?us-ascii?Q?bT38JsA7y3INFleP5c5aPU8NoVTIiThqDQvN8oM+8vVJE4kgmda0tdTPFyPn?=
 =?us-ascii?Q?YewgnQlqMx2Qd9iCn3x9w5wN3TvcCLdt/FD1++qjYQMy/ufUllTf1jDjblf1?=
 =?us-ascii?Q?NeDwuA1ryIgrEv7ztmQI2bYi7vY77mMFY3m3jScBTjNR2X8I/6dqmTYqBOxt?=
 =?us-ascii?Q?tzK6jndN9xior6YkLoIQP6QUx39uE+8tJNymsxGb7SU1+lnZUt9Uw0anQZMp?=
 =?us-ascii?Q?8S07nvpRjJPRRWOWOtHUzSBqyoTgaWgnR2cDa7oDtCjXbFrhlBGnE4B4TzAM?=
 =?us-ascii?Q?rhminscQACbm7S42pEsXTOvhlP8M2MgGp3GAI7lV1PVPpcA18Mm4254FxFU2?=
 =?us-ascii?Q?4CQO+WrrUa8EmCIfBiHjBVZjd5Ll1usn4S0W7Ej+YqI2s6qNe7yeZubUa7UP?=
 =?us-ascii?Q?DHmqlJZGOc2BKDy5hP4WO/BP3lDFYKPgSzbcMMCthJMORaACNdHVXmwOCIS/?=
 =?us-ascii?Q?LQ5Zl3waysH4N7SG5/PH+VPKXpvEK8TwhqQW?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XU+Qgvi0CASzVWJy7jPf/+E8HDyKUaxHEiz5lo8qiZBgB83M3+rlceGyrMDm?=
 =?us-ascii?Q?3yUo+ZDcalCMy5vwiT0Cl0O94C3HBVmKeqTyWxI10WmJDt0r5laIRVelV/Ql?=
 =?us-ascii?Q?W/P82vLZQnArYxJxc1mFCVL8B/igigK5HJoLjcIf/jCVDfb+9gOf4DjqpSZ+?=
 =?us-ascii?Q?Sa2QI8LBR9qaa+5RMltTE/PsjzKoJFLIv/0wDFohz7pmdV0kacvHtAOqYoeQ?=
 =?us-ascii?Q?XvHopgC9NPqOt0Ge44XTi9qt+wepYiBj1WvZkfIzMDIRo4YzfBkvpXKxKA4I?=
 =?us-ascii?Q?Y2vBJkfIAugGOQypi724Ibj0JtUgxOQEx1e5HLOLRGtqZpAxoHGDEx9ebyp+?=
 =?us-ascii?Q?KOQ0rcZoU6CCV5VGYXphypiqW3MXBBTKtq5OV1JBgp10RE7F7ZcpvYwslltF?=
 =?us-ascii?Q?P2rIOgrxNis1VIJ9Z7wLM/ddQlxDgUDXHRXzM/p4OoQr/iMRfR9QODlMvMdY?=
 =?us-ascii?Q?TAeQIRAA+qtBZNqUsF2p6tZ4yVjA0Uow9Wl4UbkWRqP+UBwdUn/KVu/6YMEr?=
 =?us-ascii?Q?HHXAEBjninCRfd2oRsfmLqr9LYmxupNceFiDpeP2u2mrIiUVqf6S/qIApeij?=
 =?us-ascii?Q?/2zROabi5s+nw+PhJEEcTa/aFAJXglz638pap9Av0kBpTep8hfunNxBBIdrx?=
 =?us-ascii?Q?M1ZztcCT9HHlAyAat5xLTIiDinoqgGj6WSWDel2MxO8LNu0txwUZ1SZIjBb4?=
 =?us-ascii?Q?1CRUFnmngJHco+PhrIJNyrGRQkbsq0K0SvijQVegMJBKW1hS+OPVhK8HkQXp?=
 =?us-ascii?Q?llpIr7tLvveH3UCOd+ze1i5ewlw7cKhdVwFeF5JPzAnytks5EPKRUzxL/EkK?=
 =?us-ascii?Q?ZAjZXj+zqB1rrpgkYiVAgNdXGS56DWSPovU1VTg5XceTL/Ujnm6Sgq5WdsAJ?=
 =?us-ascii?Q?bSAzJCBwfiVvb1qjoxb+P+FmV9HTGj4y44QLZwK1/YR6O4zVz72FUmAaH8Js?=
 =?us-ascii?Q?7XA4fzLyM3mjgCGmmk5OeDFpNfEAXBy7VSpLK3XCitLMFYiAYIMENxb/HiGl?=
 =?us-ascii?Q?k7p3V57pYIiUHqsPXy9LXzWMGVRN4GYGM/1G1l2JvqWvriEe/IstGYLQ+V4Z?=
 =?us-ascii?Q?VXvW/LHrWLuOer1nn37iwZbVny/S7NJwJC6RK+kEUT5Xc1R8b/2F9Yod/jR7?=
 =?us-ascii?Q?G9wFmoUCAjquWNC+cvjoxcwFXI14Lz8W7Ir08Hw/G26R+nM6v7veP8th51yw?=
 =?us-ascii?Q?2e9khUaLTLEu2nTPXgGQpaANclcmqNIKvBQ0hUYtTgTsKYVxGYHBxOfju64J?=
 =?us-ascii?Q?vNyGUYNn7s2XOTu5tscN+gb59aiLqn2LjW2OROZVhFEj0ajzmj09MJoSv+Zn?=
 =?us-ascii?Q?zuQA0PcowMrqXT+9cXlw5MzaXelar3SsX5WXzIwPghW5k+KDsesZpjT51xnO?=
 =?us-ascii?Q?lRgs5Hhcn0H5H1GN9XZqvqA0uqR2txf1gOs+3bUEAKXlO6tVC6/ipnFs3/W4?=
 =?us-ascii?Q?WsBKeregCp29b/o9052VPMEb7SnY+9GNBre5/wTYreZ4bK/6RfgM++rQM31z?=
 =?us-ascii?Q?R4jia+DBPn/bicmLEDxW/+v/b1VDlqb6USdGttTHXr6oPFiuOLu4otlcEIoy?=
 =?us-ascii?Q?4ORWKOTUZjjP0ZHpTfY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9284f4d6-b03c-468b-12eb-08de395f1b1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 09:16:17.2375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c3QmMPIsydUOTlun6BQOXLWWtiIrDVJ+0VAgiDOWECCCM0EYszwZLHc6bBxVkrsl43ilqWHh8w91jwX/BX2F6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9011
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B S
> Sent: Friday, December 12, 2025 11:27 AM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t v3 2/2] tests/intel/kms_joiner: Add function for pr=
etest
> checks
>=20
> Move igt_require checks in individual subtests to a function which is cal=
led from
> all subtests to avoid code duplication.
>=20
> v2: Use enum for various joiner modes (Santhosh)
>=20
> v3: Split the function for big and ultra joiner (Kamil)
>     Use igt_require_f (Kamil)
>     Minor Styling cleanups
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/intel/kms_joiner.c | 98 +++++++++++++++++++++-------------------
>  1 file changed, 52 insertions(+), 46 deletions(-)
>=20
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c index
> f8e684b47..ed82f4789 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -101,10 +101,16 @@ typedef struct {
>  	igt_output_t *non_joiner_output[IGT_MAX_PIPES];
>  	enum pipe pipe_seq[IGT_MAX_PIPES];
>  	igt_display_t display;
> +	bool ultra_joiner_supported;
>  } data_t;
>=20
>  static int max_dotclock;
>=20
> +enum force_mode {
> +	FORCE_ENABLE =3D 0,
> +	FORCE_DISABLE
> +};
> +
I think these supporting function should be added in joiner helper file.=20

-BR Jeevan B
>  static void enable_force_joiner_on_all_non_big_joiner_outputs(data_t *da=
ta)  {
>  	bool status;
> @@ -179,6 +185,32 @@ static void set_joiner_mode(data_t *data, igt_output=
_t
> *output, drmModeModeInfo
>  	igt_remove_fb(data->drm_fd, &fb);
>  }
>=20
> +static void require_ultra_joiner(data_t *data, enum force_mode mode) {
> +	igt_require_f(data->ultra_joiner_supported,
> +		      "Ultra joiner not supported on this platform\n");
> +	igt_require_f(data->n_pipes >=3D 4, "Minimum 4 pipes required\n");
> +
> +	if (mode =3D=3D FORCE_ENABLE)
> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
> +			      "No non ultra joiner output found\n");
> +	else
> +		igt_require_f(data->ultra_joiner_output_count > 0,
> +			      "No ultra joiner output found\n"); }
> +
> +static void require_big_joiner(data_t *data, enum force_mode mode) {
> +	igt_require_f(data->n_pipes >=3D 2, "Minimum 2 pipes required\n");
> +
> +	if (mode =3D=3D FORCE_ENABLE)
> +		igt_require_f(data->non_ultra_joiner_output_count > 0,
> +			      "No non big joiner output found\n");
> +	else
> +		igt_require_f(data->big_joiner_output_count > 0,
> +			      "No big joiner output found\n"); }
> +
>  static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_out=
put_t
> *output)  {
>  	drmModeModeInfo bj_mode;
> @@ -554,7 +586,7 @@ int igt_main()
>  	data_t data;
>=20
>  	igt_fixture() {
> -		ultra_joiner_supported =3D false;
> +		data.ultra_joiner_supported =3D false;
>  		data.big_joiner_output_count =3D 0;
>  		data.ultra_joiner_output_count =3D 0;
>  		data.non_big_joiner_output_count =3D 0; @@ -574,7 +606,7 @@
> int igt_main()
>  		is_dgfx =3D is_xe_device(data.drm_fd) ?
> xe_has_vram(data.drm_fd) : gem_has_lmem(data.drm_fd);
>  		display_ver =3D
> intel_display_ver(intel_get_drm_devid(data.drm_fd));
>  		if (is_dgfx && display_ver =3D=3D 14)
> -			ultra_joiner_supported =3D true;
> +			data.ultra_joiner_supported =3D true;
>=20
>  		for_each_connected_output(&data.display, output) {
>  			bool ultrajoiner_found =3D false, bigjoiner_found =3D false,
> force_joiner_supported =3D false; @@ -630,32 +662,25 @@ int igt_main()
>=20
>  	igt_describe("Verify the basic modeset on big joiner mode on all pipes"=
);
>  	igt_subtest_with_dynamic("basic-big-joiner") {
> -			igt_require_f(data.big_joiner_output_count > 0,
> -				      "No bigjoiner output found\n");
> -			igt_require_f(data.n_pipes > 1,
> -				      "Minimum 2 pipes required\n");
> -			igt_dynamic_f("single-joiner")
> -				test_single_joiner(&data,
> data.big_joiner_output_count, false);
> -			if (data.big_joiner_output_count > 1)
> -				igt_dynamic_f("multi-joiner")
> -					test_multi_joiner(&data,
> data.big_joiner_output_count, false);
> +		require_big_joiner(&data, FORCE_DISABLE);
> +		igt_dynamic_f("single-joiner")
> +			test_single_joiner(&data, data.big_joiner_output_count,
> false);
> +		if (data.big_joiner_output_count > 1)
> +			igt_dynamic_f("multi-joiner")
> +				test_multi_joiner(&data,
> data.big_joiner_output_count, false);
>  	}
>=20
>  	igt_describe("Verify the basic modeset on ultra joiner mode on all
> pipes");
>  	igt_subtest_with_dynamic("basic-ultra-joiner") {
> -			igt_require_f(data.ultra_joiner_output_count > 0,
> -				      "No ultrajoiner output found\n");
> -			igt_require_f(data.n_pipes > 3,
> -				      "Minimum 4 pipes required\n");
> -			igt_dynamic_f("single-joiner")
> -				test_ultra_joiner(&data, false, false, false);
> +		require_big_joiner(&data, FORCE_DISABLE);
> +		igt_dynamic_f("single-joiner")
> +			test_ultra_joiner(&data, false, false, false);
>  	}
>=20
>  	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
>  		     "when the pipe is active with a big joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
> -		igt_require_f(data.big_joiner_output_count > 0, "Non big joiner
> output not found\n");
> -		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are
> required\n");
> +		require_big_joiner(&data, FORCE_DISABLE);
>  		if (data.big_joiner_output_count >=3D 1)
>  			igt_dynamic_f("big_joiner_on_last_pipe")
>  				test_joiner_on_last_pipe(&data, false); @@ -
> 670,9 +695,7 @@ int igt_main()
>  	igt_describe("Verify if the modeset on the other pipes are rejected "
>  		     "when the pipe A is active with a ultra joiner modeset");
>  	igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
> -		igt_require_f(data.ultra_joiner_output_count > 0, "Ultra joiner
> output not found\n");
> -		igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are
> required\n");
> -
> +		require_ultra_joiner(&data, FORCE_DISABLE);
>  		igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>  			test_ultra_joiner(&data, true, false, false);
>  		if (data.non_ultra_joiner_output_count > 0) { @@ -681,12
> +704,9 @@ int igt_main()
>  		}
>  	}
>=20
> -	igt_describe("Verify the basic modeset on big joiner mode on all pipes"=
);
> +	igt_describe("Verify the basic modeset on force big joiner mode on all
> +pipes");
>  	igt_subtest_with_dynamic("basic-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "No non big joiner output found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum 2 pipes required\n");
> +		require_big_joiner(&data, FORCE_ENABLE);
>  		igt_dynamic_f("single") {
>=20
> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
>  			test_single_joiner(&data,
> data.non_big_joiner_output_count, true); @@ -703,10 +723,7 @@ int igt_mai=
n()
>  	}
>=20
>  	igt_subtest_with_dynamic("invalid-modeset-force-big-joiner") {
> -		igt_require_f(data.non_big_joiner_output_count > 0,
> -			      "Non big joiner output not found\n");
> -		igt_require_f(data.n_pipes > 1,
> -			      "Minimum of 2 pipes are required\n");
> +		require_big_joiner(&data, FORCE_ENABLE);
>  		if (data.non_big_joiner_output_count >=3D 1) {
>  			igt_dynamic_f("big_joiner_on_last_pipe") {
>=20
> 	enable_force_joiner_on_all_non_big_joiner_outputs(&data);
> @@ -724,14 +741,9 @@ int igt_main()
>  		}
>  	}
>=20
> -	igt_describe("Verify the basic modeset on ultra joiner mode on all
> pipes");
> +	igt_describe("Verify the basic modeset on force ultra joiner mode on
> +all pipes");
>  	igt_subtest_with_dynamic("basic-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "No non ultra joiner output found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum 4 pipes required\n");
> +		require_ultra_joiner(&data, FORCE_ENABLE);
>  		igt_dynamic_f("single") {
>=20
> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>  			test_ultra_joiner(&data, false, false, true); @@ -745,7
> +757,7 @@ int igt_main()
>  			      "Ultra joiner not supported on this platform\n");
>  		igt_require_f(data.ultra_joiner_output_count > 0 ||
>  			      data.non_ultra_joiner_output_count > 0,
> -				  "No ultra joiner or force ultra joiner output
> found\n");
> +			      "No ultra joiner or force ultra joiner output found\n");
>  		igt_require_f(data.n_pipes > 3,
>  			      "Minimum 4 pipes required\n");
>=20
> @@ -754,13 +766,7 @@ int igt_main()
>  	}
>=20
>  	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
> -		igt_require_f(ultra_joiner_supported,
> -			      "Ultra joiner not supported on this platform\n");
> -		igt_require_f(data.non_ultra_joiner_output_count > 0,
> -			      "Non ultra joiner output not found\n");
> -		igt_require_f(data.n_pipes > 3,
> -			      "Minimum of 3 pipes are required\n");
> -
> +		require_ultra_joiner(&data, FORCE_ENABLE);
>  		igt_dynamic_f("ultra_joiner_on_invalid_pipe") {
>=20
> 	enable_force_joiner_on_all_non_ultra_joiner_outputs(&data);
>  			test_ultra_joiner(&data, true, false, true);
> --
> 2.43.0

