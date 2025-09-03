Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E6BCA0FF2
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 10:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4572610E25E;
	Wed,  3 Sep 2025 10:44:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K19twBz4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E19110E146
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 10:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756896266; x=1788432266;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2gxm/jQoCAd1WEXyInhlmhzVPbEZ2ju63rFxakBdKxE=;
 b=K19twBz4hbv9E9nO2rBWxpkfaNLmXReyzFZtUqMbvggY+sEP7zfpQORi
 DbukO8MCmDAtOSUi22ySRMYhxe3DZbw3dsezZKaG/bSirxBa47lIKRu4L
 b9Fun2kgKNnlIagJacoWUG7GkAkUJJitcaWnF97owWdJxFj0k0D/deOfK
 /Mzo66S8/F/C4MESs36T8H3HifhN/JVP0j6auTiDmlRRSow7SZXKW+G5s
 krIErguPOjeYjHXjS9wPfTrwX3yDJ8OuIMHTpIvjKtRkzyEj0ghMHApHv
 IM3GZk0D71B6b5byBjUIxXiJQOcyjY72PFVyB8XOX8/F1UlkccOIDNLNl w==;
X-CSE-ConnectionGUID: kwZaDJhnTTmGfDPHUBtS8g==
X-CSE-MsgGUID: Swhl86T5TYyJQkVW7Nswmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="70633157"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="70633157"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:44:26 -0700
X-CSE-ConnectionGUID: gmamj1uPR+SysBYCVtHoRA==
X-CSE-MsgGUID: Mty7mPmfRWiEtTH882xEtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="202431549"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 03:44:27 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:44:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 03:44:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.48)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 03:44:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLoKfu2+nuaDiNLpojv3/a6oK03GGCiDSNX7F2HHARdZNzIUbIQXum9yZSlbD+wohN63kb04PuhAvD1xZbYBCbnfTkeQIWpwFwkzFRvCi7B1rO/T1nLxqzB4U0L6tSIs4vnk7gBkxdq1dYY6rCZvK8il66jo9+oMCTJ0hMDsFViN1S9osJtOZkaIDAc9NA463kz77Gzy4L340Q1aBoT7ROzcDcSfEr7PkuB3ToU/bqmTs7eABE831VQ+Hy+os3ImPVzbGsCYp0BUHaTi7yMPdgOnJ7inztNp1m6SH4hcMJ3CJE+fL674sHjjXGr9gAIvJjWiBqiR6aJ8E/bHEzLZlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYAexILvozp16RlbzxUeS6dUMU4GXO6EJXiPeu2ocP8=;
 b=ZAFXMEXDAAWh6PQsYqPRIGJd7pB4nC4GhPX3w8z15uZ7LjVt/OzsXYlcQBxY6Yj+HlUVXYE8Q5AHtk+u49pJR4oz8BvNB3nladPXMjCiDT8bLaOgaVFQC1a2GMhbqbMRpeD3lRpaVRyy4HHzuMXFNDnawIUzv1dikcVUFRNtSCyDFSOV3kNKug5FNzg5m3Fi1QC4bb8GtXCwqhh1DlVYThajoqOCSlb+nuD20daxEVn870m1J4PvrrTCvJT37x4u+g/C37Ardd38sqx9WuqvzGv3afmO0y++zZ3bL/m58TUJGcWdyHA9ArebJXlPl+NqXZhopJ3aHR/R2d+K101I4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by BL1PR11MB5270.namprd11.prod.outlook.com (2603:10b6:208:313::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 3 Sep
 2025 10:44:21 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 10:44:21 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t v9 2/5] lib/xe: Add xe_vm_madvise ioctl support
Thread-Topic: [PATCH i-g-t v9 2/5] lib/xe: Add xe_vm_madvise ioctl support
Thread-Index: AQHcHL7ClYFLN4dh2USxIU/GAWvBnLSBRc0w
Date: Wed, 3 Sep 2025 10:44:21 +0000
Message-ID: <BL1PR11MB55257B6E7E8BCB093937B0B28401A@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20250903103716.1780404-1-nishit.sharma@intel.com>
 <20250903103716.1780404-3-nishit.sharma@intel.com>
In-Reply-To: <20250903103716.1780404-3-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|BL1PR11MB5270:EE_
x-ms-office365-filtering-correlation-id: d0b2449d-ac4a-4cf2-cd9f-08ddead6d797
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?LP/dM4Wl/2hJp39K/bYbeGR5iShHKlNiqCg7mVh292OHQ0F0BYVY9Fb22GQ1?=
 =?us-ascii?Q?M43xv1r0ULvEX30myGQGKjIVgWihQSOamTwOpikzYIghh3hHXjK4kdrsM2UQ?=
 =?us-ascii?Q?X2CRzhxRpBichkUSGVBe7lWla9sBQxH4/JdRO/ubd11ehVBJLp54u9BVwH3+?=
 =?us-ascii?Q?LaqsHNdgieI0dKmnr2Ms9lplXtPLw+XCW4v0JBNivauWuXHUVKVsQ/Dx+gEV?=
 =?us-ascii?Q?5vS5jXne6UhN1KLayEq30cjiabFgdrHm5ef4dRBJvXwrobDv4DrmXOaTyS5A?=
 =?us-ascii?Q?7iw6WiwWOJ6G5XPEawlgKY4reGzX1OUuebRX/Z3rRFzrvc3A3WZnwZ0APwox?=
 =?us-ascii?Q?ziJTNRdjwNth1gYq9n+DK0lvKIRQODmUyNw755LqrJRx9m0yv/bK7cL/zWh+?=
 =?us-ascii?Q?+1ZWy4Qlo9aIxOQc3BZLe0onN/gPKcot076oA7AsEzRoUJ3SGdFbKtepmqzB?=
 =?us-ascii?Q?g70Zp8egCt646Aevu7JWIm1kMEYNqkDRl7DD02DHUEzrfgk2SV06pHjCsQal?=
 =?us-ascii?Q?a53zvgPPhnb3xbR89lvHZDICUKg7vTE33ZhBF4masNHZ0upUG2BdePv/Zrdl?=
 =?us-ascii?Q?5AqWoXxhxcyCFeWWiw0e+7Y2TcXmL2c8q5HTu1QaiX59EcNuhdl2jbSl2eHf?=
 =?us-ascii?Q?PAsTWqpZmzBWzm1DNu6tiNSZhsK3JaDwUDYzrW2Z8F4Nh2MkjypZ6oF1UJnS?=
 =?us-ascii?Q?+7hECM91iwUM2VsOy0R7qw4tU09xzMD2IsTjcNUEcCE3MFmBDaCPGHvcqrAt?=
 =?us-ascii?Q?0PqZY8kANsAv1WBTkkGRGB7FFKiFKOaHkUSmSzCb6liniCI7ss6heQmolIt3?=
 =?us-ascii?Q?NeQ0bsBBOsmv+R8vBhPH2rlmuW34ro3i2EXR8xumqLN2G4SSTtxq55HYHjfN?=
 =?us-ascii?Q?LX4z1ssFpPD/0n3w4lYTpCj69q0F7y1thsPjPbBBG24KNGU9IHLqpvQM2ZFE?=
 =?us-ascii?Q?ZWYKYPx8UbvRCheYywD7+wtJazPI/HwBP7RV8x7oteoC2iEgK7Cj9PXo8Ilt?=
 =?us-ascii?Q?lVX/ht163CFlbJxSpysW8bXhtKPXgOtPl9aJOa8JsqZk+06AyBkDG9wD8O3g?=
 =?us-ascii?Q?m7crfRXynRA41XngR7Eex91uuZSJ5iVc4mN+X9kbL8zM7HBZ6XnzwWFN2RNk?=
 =?us-ascii?Q?rALaL5WdsdNms1dzBUgKwqOa+E8vR2bHr/R8i9psx9Z+A7rKDMoXeemAufed?=
 =?us-ascii?Q?Izda7aRL0V5yTVVb9687TURRmjVQ0MKC+Rfc+4wnM5VEOhVSopPeOFDZLpIE?=
 =?us-ascii?Q?VpAQpJC2gXkHbzPwwfaWiWV8cSq5kzifGOiVQA9oEmQa8ZDAg6eCY7m6UBhm?=
 =?us-ascii?Q?dswYDpBVSwFWGysLr0miqywfugIsCplLzKeYEbK/FM9W05RRhf8l1tIrAp8q?=
 =?us-ascii?Q?ksNDlcdka8ynQ2KUg0p7wIEY6SymVWA3FD51zhfGVvF9D08k58O49R2t6Opc?=
 =?us-ascii?Q?zzUQ3Oo3fPJNJTuB0MVC4JLQtJpUNT4PWn5VLNGerZ2yYkkH1WCMTA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?t316ZwXACm258pmwNge1jN1hKcHn74MeBTmh3nqJEvNgWwzLvReI/epYsHZi?=
 =?us-ascii?Q?IV6pJgKI5SSY7PNAVLZNHuSlOu5H/EN+thDyiUIh6Mc66IYeyBMBqFLgT46n?=
 =?us-ascii?Q?VIjpoHVRvyT9M6eeepOtma+yXNw0TutHww5dDqzlDpRAdg2ZB5LUxcJPAgw1?=
 =?us-ascii?Q?OK8mHiZKs8OZ2/page87+VlQHYDBGB4YNlZbAPb1Uo4vSkZnAXHVfps/Zpsm?=
 =?us-ascii?Q?j51OXy5ZH8TXizvCqxqeFwJrDkkTq7REP6XIrERBLFg2bJz5Rh38ATdYMD1D?=
 =?us-ascii?Q?T6R47oSVRN/KOzimrQY1WwFCu7URmVgX2UHNkm/Y4F4bQB1nSXBRPGvq/jMR?=
 =?us-ascii?Q?1vB5glbWg/Gobgw2nkRPcnSSofhYBqlDfCbp7mb8/l2idqVgbE4ExpbShmmo?=
 =?us-ascii?Q?ria9OK5OXs6woLh28ytEt5ck+q9GdNfqrHmJi1JjYEJdA1bqTvOpEimZT0wS?=
 =?us-ascii?Q?nrtYXoeUnUEhyMPzjbT5WHL4FwqGgwhbfIFuuVaV+RnQnQMu8gXsBUuFybJP?=
 =?us-ascii?Q?JlnyORutD8WfnEw8e2WM2bmAt9Ra5oixxVxBQj3vMISZjsdoOBy1xo6TrWRu?=
 =?us-ascii?Q?a7ioisb/S22CiVtWpvFp/kMTrYH0xAahv31udHT8PStIJUtBXWzUTXzvvtyc?=
 =?us-ascii?Q?kE0/ZLPKSAQD3ZknvTrrMzAqN8BBih5U5AI4vHAdpTzzID4nTW416gYCYBAR?=
 =?us-ascii?Q?Z/JhATQMWg44dPMaPTYen44X5x21yIoLpfV7QVGAI8WXud0IZbwUE+Oco0Zo?=
 =?us-ascii?Q?50hewYA5U7qhnh/YH2mEh1Mn/9JiUncxc3YnejYDU2VB1mp7rOqtHinR3p1s?=
 =?us-ascii?Q?EAa7ZoksrnyICaw/PED+7p+jMO/YdxX0rU7zNV4L4YlnazK3hdVSJq6Xk3Ry?=
 =?us-ascii?Q?/Uqtr613UEhOgDIl0LWJXQCZz6KmkcMyEAyT7qx0M2JqTHXKCHPGMNczJJAG?=
 =?us-ascii?Q?97xRIeDNx7+wcjy00hVaaNVB3eNsI8omKxUxkocRCXlfPT51PDpds/x/6XQb?=
 =?us-ascii?Q?SWIDOEb7hIrJqZ9BBSdtBCNNi1Y11IA/0FPAY8VAjk9acQuKcMVRUfNzcId+?=
 =?us-ascii?Q?17VW1HktDceC6F5XiTiFTWxOG0CKhc8OVlme4cY1xu6/FEzh8heGeEHkakte?=
 =?us-ascii?Q?cpMRRXYLsCEG1AE0yJysstEiyDdqwZ7hsMrl/rqCA9cH3ZF6ONGJg7FyMeMb?=
 =?us-ascii?Q?27bYSokUzy8sLLShi0Jp8kusVlCV5I6EjHxipRYctjpkf8/OrI9nHL+x+rlm?=
 =?us-ascii?Q?617lWu3SEufHmOwge7xB0y1KJFoGi9ndYU70adlZJ+ecSt8a0Jil3in9iJ31?=
 =?us-ascii?Q?+p2E5WYMWAztljPO50o+e5Q7csTq/y6bf7GVgI9PlnLOvtsbxZ++UEzss+Em?=
 =?us-ascii?Q?DgK8QjT+JfDVQODPCeyNx7yg8zc2y5YZTri0J52At4PDTQhEXYV7PWZP5inl?=
 =?us-ascii?Q?WESUvM3GBg1Rgl1jrfEz3lt5y230eOdRBYY89zFKtcqZhWJGVSE9Vi4Yq4G2?=
 =?us-ascii?Q?iTan+c4mEkgpDSHuX4+ognzU3FmAdRipV3pfDqic+YM5aJ8OBRaYh3Cg2HYm?=
 =?us-ascii?Q?JG0CZuGaBIN9iMMe3C/oj8ef2+G88rKV0A18vaDJEYKHSpVKlnm5gVLmu6hs?=
 =?us-ascii?Q?tA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0b2449d-ac4a-4cf2-cd9f-08ddead6d797
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2025 10:44:21.7059 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6DvvvGF/Ep2627VjkmhzxeOwwOamUz4O2WDIsxlBA4wZ+mBAGzKp5iNxnuXe7W9TM6C36qXbBc8ngpUkGAqE417K1zo86rFfXNijIV0JTec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5270
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Wednesday, September 3, 2025 4:07 PM
> To: igt-dev@lists.freedesktop.org; Gurram, Pravalika
> <pravalika.gurram@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t v9 2/5] lib/xe: Add xe_vm_madvise ioctl support
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> xe_vm_madvise() defined which issues madvise ioctl DRM_IOCTL_XE_MADVISE
> for VM region advising the driver about expected usage or memory policy f=
or
> specified address range. MADVISE ioctl requires pointer to drm_xe_madvise
> structure as one of the inputs. Depending upon type of madvise operation =
like
> Atomic, Preferred LOC or PAT required members of drm_xe_madvise structure
> are initialized and passed in MADVISE ioctl.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 57 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  5 ++++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 1e95af409..5608c=
8780
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -585,3 +585,60 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr, uint6=
4_t
> value,
>  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue,
> &timeout), 0);
>  	return timeout;
>  }
> +
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy) {
> +	struct drm_xe_madvise madvise =3D {
> +		.type =3D type,
> +		.extensions =3D ext,
> +		.vm_id =3D vm,
> +		.start =3D addr,
> +		.range =3D range,
> +	};
> +
> +	switch (type) {
> +	case DRM_XE_MEM_RANGE_ATTR_ATOMIC:
> +		madvise.atomic.val =3D op_val;
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
> +		madvise.preferred_mem_loc.devmem_fd =3D op_val;
> +		madvise.preferred_mem_loc.migration_policy =3D policy;
> +		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D %d\n",
> +			  madvise.preferred_mem_loc.devmem_fd);
> +		break;
> +	case DRM_XE_MEM_RANGE_ATTR_PAT:
> +		madvise.pat_index.val =3D op_val;
> +		break;
> +	default:
> +		igt_warn("Unknown attribute\n");
> +		return -EINVAL;
> +	}
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_vm_madvise:
> + * @fd: xe device fd
> + * @vm: vm_id of the virtual range
> + * @addr: start of the virtual address range
> + * @range: size of the virtual address range
> + * @ext: Pointer to the first extension struct, if any
> + * @type: type of attribute
> + * @op_val: fd/atomic value/pat index, depending upon type of operation
> + * @policy: Page migration policy
> + *
> + * Function initializes different members of struct drm_xe_madvise and
> +calls
> + * MADVISE IOCTL .
> + *
> + * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE.
> + */
> +void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy) {
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type, op_val,
> +policy), 0); }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index 6302d1a7d..8e13f=
fe65
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr, uint64_t
> value,
>  		     uint32_t exec_queue, int64_t *timeout);  int64_t
> xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> uint64_t ext,
> +		    uint32_t type, uint32_t op_val, uint16_t policy); void
> +xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range, uint64=
_t
> ext,
> +		  uint32_t type, uint32_t op_val, uint16_t policy);

Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

