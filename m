Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5533606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 06:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GISbFWOY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA5910E124;
	Fri,  6 Nov 2026 06:12:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DB810E3AD
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 06:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793945506; x=1825481506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E7FEB0Hqd9fTbft2LrPHTRhVfthbAy8XZhApQIZSWwo=;
 b=GISbFWOYQ06e5d+xheONmMAlzc3arcaMmUyv7wCPKYC+M9ULQ7tq3uyC
 nK1FISADh+C+QKW9klyTZYfbQdSYqH+bLvMX+5Yix3zHhyh7Cz2CcydmX
 NVRjuEVnW3TgWP4N1vv7BcAvnl3UrxG/XjYZIyC5suxVu4BT94xSfq9iU
 5QEdT9xeG4GHkIKF/7v3w6ykQDthK3qHfJAyrWYzE4mpfvxvf43VVE1p7
 Lvr3m42St6wPk2+U0sD6jjjEAFKwZuZS5E+dWtBQPiTKBGVUTyVyRIWl3
 MEBLsduTPGHHAC6d+ZJgJYw8pWc+zUzYwN7Mqr5AXkgzWMrsgME+VmyCZ A==;
X-CSE-ConnectionGUID: 2N3MpaH5TvuJSv7qclft/g==
X-CSE-MsgGUID: S9k61I2QQ7Spnn2y/RuM9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2791439"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2791439"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 22:11:46 -0800
X-CSE-ConnectionGUID: QN91bemQRvyCxMza5UFYQQ==
X-CSE-MsgGUID: K8VYvtiESRC7lrz13LOn/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7624231"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 22:11:45 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 22:11:45 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 22:11:45 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 22:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQiJXDd5HCpZZRgK1s7+CSJzOJ+lQQOrLqMRkwEiK8nYPEgZG0S3XGixVuDIlDnsh5npw6n9X+IoMXaARm5oUTQ1aOH/c5bwW98mdWDDuagNTmibskSE5fHhdCQvT2BmZnksbiSM3f/l/XaNwaCw2JUnvyTefC3EIbEnCUbfM9cw4eVVST+ZnltcT1dS+ntNz9PxbehEKOCfnzfAhyWtwjgaFKLKdiSENPyMgQLh2pJBgwbHJ9Q2uD1X4jW72i6BrXAfLQABvz21cW6mjb8s4GBzvr0B0L9Sbyids4IjEP+YAXJc9prOujwn8nS1kyUsl4fQ6L6v54YNY8ThUw8Y3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6FiIdhqxJIL6HXIQgLNXG/RwnfIzrWS/x2FGZ9i4+g=;
 b=WkX3wbIrsQ18PUx5/adEAXVtGEn3LLLF9y2YwV4qGg9RKrpvZQUILm1d5wN4DVOW+TGbamIDqPgjsJdbfMGCVJMkwkdPrtUC95mGiIbfgcaj1492rcZQ2XX43pIM7ZxLTaBpi2fJkV0yRM/1CaKaLoU3Ke2b+qNvtDhfpvfwnK+bNgLuPd2c/bh67sX/k3mdPkskqKeQX1NDwH7Joy31EklgB3PeOnVXlDqd8bcO4jYge/Jyq8XIm7jTQ+3BMslmFOyG31l5QvsMh4JtSweW8YdQ8gFMSrA2Jw5+v70u5gQXjm+QzuwzwUEds3K/DQ/OpCW0SHyILtYix99v2n3z8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by MW6PR11MB8389.namprd11.prod.outlook.com (2603:10b6:303:23d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 6 Nov 2026
 06:11:42 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0592.010; Fri, 6 Nov 2026
 06:11:42 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Sharma, Nishit" <nishit.sharma@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v7 4/5] tests/intel: Add threaded random-size
 allocation stress tests
Thread-Topic: [PATCH i-g-t v7 4/5] tests/intel: Add threaded random-size
 allocation stress tests
Thread-Index: AQHdYYNSkLdiQi/c0kCZYVteBPLusLcgpyPQ
Date: Fri, 6 Nov 2026 06:11:42 +0000
Message-ID: <CH3PR11MB8434F5E0236B7E92B2EDAA308D762@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20261021174032.18337-1-sobin.thomas@intel.com>
 <20261021174032.18337-5-sobin.thomas@intel.com>
In-Reply-To: <20261021174032.18337-5-sobin.thomas@intel.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|MW6PR11MB8389:EE_
x-ms-office365-filtering-correlation-id: b4c472cb-baa1-4d15-5141-08df3bccd3eb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|261022105027099003|261021121427099003|261026121527099003|261009223027099003|261021123027099003|261026140227099003|38070700021|261028144727099003|261102123227099003|4143699003|11063799006|10067099003|22082099003|56012099006|18002099003|10086099003;
x-microsoft-antispam-message-info: Na553NIMDn0/hbibjU0VQmB1ukLoDbM7BOkAKbGnLHPZ5O8YmxS1j7kAdqQ3WHKTBQZTOyOCuvoGZVAwl2G03md0Mz6aVcC2rAqcuYJDPVYJ3MCYoyYWr7aCBlXc0u9sTdAEL+lRwlzogaChsPk5iLRnJu2WKSZre/CJSaqL78IAWxMn/5dQxC6puxcNmARZWPx0v9weHX04u05oZ2lpGC2NaF2BV024akvyavuJC+Vy2GoCQbl3bvgO8NV9r1CgG2Q6IE5FrITZosrUMw1Fs667QRGt8gRrGiIW5zBlxgNBpVZ2sppMPnctsX+iZwgPlcU4/2djgHfILY0q2Lc7ZnRsVcwu3htRMowRKKkqRkxuTVd/Jqr+a3Qia3KQhPEIGczEbVwCnmLErdJingKqcsK0mtXtmXX0plsi+W6BehAkjQGh/dIP9ukfTPIQ1iM3dAL0NFi037yFvDOoVhNeKDQp9uprnxiASjFQ0FpnqBV+/s24BZvx8oBHnScGtiHNeX/i6RpBuqYPyenBKYHXXbXeoFu8Ca5+DgNIFEXWAupfzcB3vEcy7SBFho+NEto0nCjYE5dP5nG5+6KQFN0CAm31L+pGintuDBtHZ3da8l7fZvx4wV1ijKgLiSxAr7vYMB0cGFArNPNJkj3WVAQn88yflWtZYJo48WkecLn7gnW2TPrds9DzCwJVC5+bQvunjkOF8Lcfg9Yo/OxoJdyA8N0D56KtTPbV5EzQMlxwkkE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261022105027099003)(261021121427099003)(261026121527099003)(261009223027099003)(261021123027099003)(261026140227099003)(38070700021)(261028144727099003)(261102123227099003)(4143699003)(11063799006)(10067099003)(22082099003)(56012099006)(18002099003)(10086099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nuwwfDBrhGnGmGJRTSS31ijz8QlQmesfPdzPmQIIqjlIbi/WUX4veeMfJzUw?=
 =?us-ascii?Q?n/gY44SRfO8ZyELXF6ygiXc7i1vxTl0BPGIjJZ/NFGkOOpuFjnN3f4hYUhRC?=
 =?us-ascii?Q?q0YHAmUsRYG2DUWBPzSWJ/xBJJedeMDIzpmEtr2lVyO50y/2iads0iKdYXc6?=
 =?us-ascii?Q?MmH8lmS1e67InPQ+3m8cDTBf49NCZ0RRnNBL7pIGO50ZpVvIKLLfTWLhz8ta?=
 =?us-ascii?Q?kRKwJhPPJ8qwfaUtMU5F/JErsazdLHpMC+FJULKHnXyj7hFUuQXGpUu4mvib?=
 =?us-ascii?Q?sXza0hXB+YH/95r3jOMQkqZessJLpdw2Be64BMmx/ZXaQBD+O5UAnj219S9M?=
 =?us-ascii?Q?oYSWeHvDVb1662T4Z2jnjrRNvU5XJHmP3WzzpMfynetheWWIYQHUlThkNxho?=
 =?us-ascii?Q?GR21YZ19nhyDGipGQon3MSFIRNE/44ry9rdElam8+NZKKixehef0D8Nrsy4f?=
 =?us-ascii?Q?q7zySb61gmyAQFbmxA7zG/md3P61QFiDddhWinTcFCYUbfHH+5cglYK2IZC4?=
 =?us-ascii?Q?9CTY+nrewMUIOfPMQJucAlTG7ZMFv68YGk7Kruk+8Azm4YrxFC+6QAIXvp7l?=
 =?us-ascii?Q?UZsN0gHfziDkjR1TuCqLzDjJs+y1qUwMeq7jLAS8Ds1bfe5yMfAhVW+QBUVU?=
 =?us-ascii?Q?GwedQkQLyRsNz/6duKcT9vGLYKtfKjK0LdB864mvy+ch2j4yWaDNMEct2RFh?=
 =?us-ascii?Q?YiDDFotScNp5IVt5g4BzH1x9tE7Awqau419BgPI2NKy0Ig47m/ukkVC/3Wqy?=
 =?us-ascii?Q?LUYlwomdtdERos2zEqDrzX+5b8sPzeD5//dBmEOLwz95TeB4dvs0toDP2hYx?=
 =?us-ascii?Q?6Za0mISrNqt/9MT715K23dlQzZf7UhS7S7YljhSXpBipYQxAbJYJmQRFVxd4?=
 =?us-ascii?Q?l4iFdeSPsm2pV/H5l35++BnFf0k+iQBHBF9aY7i+Ve8l2JqvuIhA973JIrGO?=
 =?us-ascii?Q?9lIpLy/xc5yj4Pk/X5jC/f5oLfM3ddfSZ+hvt1g/uMdJ2VxLLKO9aXi+c+ZY?=
 =?us-ascii?Q?kNor74jG2L71zFLUp78prOe4JMUbpuKz5mrFXgNxkCzDjaLeckKwmgnqc0du?=
 =?us-ascii?Q?1x2DHPY4ChgO/refL4yIgu3SJQ5RxbZtaxA7qahkHbreEvbdpzelgHuABeFt?=
 =?us-ascii?Q?CzrjwUPp8Iy/ZWXDXZxg/FunBEN/dezZl2FQNBt/Y6yCY/UeS9NkX8gcpiof?=
 =?us-ascii?Q?Ii1kVqbA/0rV++Y2s87tmBol0HxLnDfQmwjs05wLlsA7mJ1sXCGt+FVSGGJD?=
 =?us-ascii?Q?KJ/ztPnybH5SEjo9gIP6jbMFv/Vh6fcB4ZXooX2/BLyT+HATcGGraauQfNa7?=
 =?us-ascii?Q?+O+WmNmzp54rcar7jEUNVXEisIqioUrXOiRwtZGdO6Aeig/ues/uZmONRnh1?=
 =?us-ascii?Q?2rRlqh8xW+/E3BRYDtDr3KtQtdr+DwOVjqnUQNkQicB4v9GF65dswpJB2O1Y?=
 =?us-ascii?Q?dQUMOKxqpa0lzexruTym5eNUTWgZb2V1dTxphtp/JYeH8hjCCkUOEm8eRSop?=
 =?us-ascii?Q?ToQHLfuDqJNAXMvyIquzXDGCqdsmsKcaol9I4NRrRA3Ek2CsiJxUyvi5VWxH?=
 =?us-ascii?Q?H/0KB119rD/aOzFzmdWMSXnLLpoobOs5r21N6r47W+IVVEYBlIaVCXdGGqVr?=
 =?us-ascii?Q?XcN6qM/Ndrl+hqC5CgZOo/L34wAfhJe3sgVZhwCqDo6x3CTelZxC3tUeHnRy?=
 =?us-ascii?Q?X3QypOI2+w3v58EiFDqvjHI3Di3Dl0To3YtkUjaeDwtNVZTZbqmlM3MW15dK?=
 =?us-ascii?Q?mVW9EwMcYwy4jP8w6FkQqlss2vhrHxE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: GAptiFYJnUJpZcH9LPePSARZhdfJPP5xdtUMjLCFnHznpr5t8vTL4Ju+y7jTnMHSRlHWoriQAq8mMhuijzLQSsVxnzS0gDB2UIHfSa9T43gTUph4iJHJHcdXpt6hbTxy86HDm74FFyq/5okdCk/GTg9R6cO0lUoKqfA6q1NhWRm9buJGt41UaWNEnABs5LXU/CV6/4T//DBw+31DFfEodvIodod8QVOtPFswXTobD9qBsoE/Yp2OrGRm62Bv20N1IgihBMdwIkhe3E5E/zsomwk+IyKEsBA0G3xmioPijAEi9aFr1k43aKOOgujCAVZoYUPKLEzy2pkx98LXXCwdNw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c472cb-baa1-4d15-5141-08df3bccd3eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2026 06:11:42.4579 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PZ8qKWRjoZFt4VSmwg5w4gvdz0ek7gC88q8KY5ny/JsaVTZbp+UWxKwI+EvFC47iAvvREvTNxG13vdBgq1HuXC0iR2gie9R7iLVld7po/Kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8389
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: 21 October 2026 23:11
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit <nishit.sharma@intel.co=
m>
> Cc: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>;
> Thomas, Sobin <sobin.thomas@intel.com>
> Subject: [PATCH i-g-t v7 4/5] tests/intel: Add threaded random-size alloc=
ation
> stress tests
>=20
> Add a new TYPE_THREAD test mode that creates a worker thread per availabl=
e
> engine and performs random-sized BO allocations concurrently.
>=20
> Each thread creates its own VM and execution queue and exercises the exis=
ting
> allocation path with both aligned and unaligned bind addresses.
> Additional variants cover leaked bindings.
>=20
> These tests provide additional stress coverage for concurrent BO allocati=
on and
> VM bind activity across multiple engines.
>=20
> v6:
> - Use rand_r(seed) instead of rand(). (Priyanka)
> - Advance bind VA per transaction. (Priyanka)
> - Use engines[i] instead of engines [i%n_found]. (Priyanka)
This seems not covered.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_bo_alloc.c | 166 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 164 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c index
> 1b3bef79a..dbaa389df 100644
> --- a/tests/intel/xe_bo_alloc.c
> +++ b/tests/intel/xe_bo_alloc.c
> @@ -29,6 +29,8 @@
>  #define SZ_4K_SHIFT	12
>  #define MAX_ALLOCATIONS 50000
>  #define N_BOS_PER_BIND	10
> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) #define
> +THREAD_VA_STRIDE GB(1)
>=20
>  /**
>   * SUBTEST: all-sizes-once
> @@ -64,6 +66,25 @@
>   * Description: Test 10 batches of 10 random BO allocation sizes bound t=
ogether
> as a single
>   * array of binds, with bind addresses unaligned to BO size
>   * Test category: functionality test
> + *
> + * SUBTEST: threads-rand-sizes-50
> + * Description: Test 50 random BO allocation sizes in test table with a
> + thread per engine
> + * Test category: stress test
> + *
> + * SUBTEST: threads-rand-sizes-50-unaligned
> + * Description: Test 50 random BO allocation sizes in test table with a
> + thread per engine,
> + * with bind addresses unaligned to BO size
> + * Test category: stress test
> + *
> + * SUBTEST: threads-leak-binding-rand-sizes-50
> + * Description: Test 50 random BO allocation sizes in test table with a
> + thread per engine,
> + * leak the binding
> + * Test category: stress test
> + *
> + * SUBTEST: threads-leak-binding-rand-sizes-50-unaligned
> + * Description: Test 50 random BO allocation sizes in test table with a
> + thread per engine,
> + * leak the binding, with bind addresses unaligned to BO size
> + * Test category: stress test
>   */
>=20
>  #define N_ALLOC_SIZES	256
> @@ -78,6 +99,7 @@ enum test_type {
>  	TYPE_ALL_SIZES,
>  	TYPE_RANDOM_SIZE,
>  	TYPE_ARRAY_BIND,
> +	TYPE_THREAD,
>  };
>=20
>  struct test_case {
> @@ -124,6 +146,20 @@ struct batch_data {
>  	uint32_t data;
>  };
>=20
> +struct thread_data {
> +	uint64_t va_base;
> +	pthread_t thread;
> +	pthread_mutex_t *mutex;
> +	pthread_cond_t *cond;
> +	struct drm_xe_engine_class_instance *hwe;
> +	int fd;
> +	int count;
> +	uint32_t vm;
> +	uint32_t flags;
> +	unsigned int seed;
> +	bool *go;
> +};
> +
>  /*
>   * Reserve a chunk of process address space to use as the VM bind addres=
s
>   * for a BO, and hand back a pointer inside it aligned either to bo_size=
 @@ -696,6
> +732,112 @@ static void all_sizes_once(int fd, struct
> drm_xe_engine_class_instance *hwe)  }
>=20
>=20
> +static void *bo_alloc_thread_fn(void *data) {
> +	struct thread_data *t =3D data;
> +	uint32_t q;
> +	uint64_t va =3D t->va_base;
> +	int i;
> +
> +	igt_assert(!(t->flags & LEAK_BO));
> +
> +	pthread_mutex_lock(t->mutex);
> +	while (!*t->go)
> +		pthread_cond_wait(t->cond, t->mutex);
> +	pthread_mutex_unlock(t->mutex);
> +
> +	q =3D xe_exec_queue_create(t->fd, t->vm, t->hwe, 0);
> +
> +	for (i =3D 0; i < t->count; ++i) {
> +		uint64_t size =3D alloc_sizes[rand_r(&t->seed) % N_ALLOC_SIZES];
> +
> +		test_alloc_size(t->fd, t->vm, q, t->hwe->gt_id,
> +				size, t->flags, va);
> +		va +=3D size;
> +	}
> +
> +	xe_exec_queue_destroy(t->fd, q);
> +
> +	return NULL;
> +}
> +
> +static void run_threaded_bo_alloc_test(int fd, int count, uint32_t
> +flags) {
> +	struct drm_xe_engine_class_instance *hwe;
> +	struct drm_xe_engine_class_instance **engines;
> +	struct thread_data *threads_data;
> +	pthread_mutex_t mutex;
> +	pthread_cond_t cond;
> +	bool begin_work =3D false;
> +	int n_found =3D 0, n_threads =3D 0, i, ret;
> +
> +	xe_for_each_engine(fd, hwe)
> +		n_found++;
> +
> +	igt_assert(n_found > 0);
> +
> +	engines =3D calloc(n_found, sizeof(*engines));
> +	igt_assert(engines);
> +
> +	i =3D 0;
> +	xe_for_each_engine(fd, hwe)
> +		engines[i++] =3D hwe;
> +
> +	threads_data =3D calloc(n_found, sizeof(*threads_data));
> +	igt_assert(threads_data);
> +
> +	pthread_mutex_init(&mutex, NULL);
> +	pthread_cond_init(&cond, NULL);
> +
> +	for (i =3D 0; i < n_found; ++i) {
> +		threads_data[i].mutex =3D &mutex;
> +		threads_data[i].cond =3D &cond;
> +		/* reuse engine 0 if only one exists */
> +		threads_data[i].hwe =3D engines[i % n_found];
This need to be changed to threads_data[i].hwe =3D engines[i]; but the comm=
ent seem contradicting.
Rest seems good.

> +		threads_data[i].fd =3D fd;
> +		threads_data[i].count =3D count;
> +		threads_data[i].vm =3D xe_vm_create(fd, 0, 0);
> +		threads_data[i].flags =3D flags;
> +		threads_data[i].go =3D &begin_work;
> +		threads_data[i].seed =3D i + 1;
> +		threads_data[i].va_base =3D BO_BIND_BASE_ADDR + (uint64_t)i *
> THREAD_VA_STRIDE;
> +		ret =3D pthread_create(&threads_data[i].thread, 0,
> bo_alloc_thread_fn,
> +				     &threads_data[i]);
> +		if (ret) {
> +			igt_warn("Thread creation failed for engine %d: %s,
> Continuing with %d threads\n",
> +				 i, strerror(ret), n_threads);
> +			break;
> +		}
> +		n_threads++;
> +	}
> +	igt_assert_f(n_threads > 0, "No worker threads could be created\n");
> +	ret =3D pthread_mutex_lock(&mutex);
> +	igt_assert_eq(ret, 0);
> +	begin_work =3D true;
> +	ret =3D pthread_cond_broadcast(&cond);
> +	igt_assert_eq(ret, 0);
> +	ret =3D pthread_mutex_unlock(&mutex);
> +	igt_assert_eq(ret, 0);
> +
> +	for (i =3D 0; i < n_threads; ++i) {
> +		ret =3D pthread_join(threads_data[i].thread, NULL);
> +		igt_assert_eq(ret, 0);
> +	}
> +
> +	/* VM destroy will be done for successful threads */
> +	for (i =3D 0; i < n_found; ++i) {
> +		if (threads_data[i].vm)
> +			xe_vm_destroy(fd, threads_data[i].vm);
> +	}
> +
> +	ret =3D pthread_cond_destroy(&cond);
> +	igt_assert_eq(ret, 0);
> +	ret =3D pthread_mutex_destroy(&mutex);
> +	igt_assert_eq(ret, 0);
> +	free(threads_data);
> +	free(engines);
> +}
> +
>  static void run_gt_dynamic_subtests(int fd, const struct test_case *t)  =
{
>  	struct drm_xe_engine_class_instance *hwe; @@ -773,6 +915,11 @@
> static const struct test_case test_matrix[] =3D {
>  	{ "array-binds-rand-sizes-10", 10, ARRAY_BIND | LEAK_BO,
> TYPE_ARRAY_BIND, true },
>  	{ "array-binds-rand-sizes-10-unaligned", 10, ARRAY_BIND | LEAK_BO |
> UNALIGNED,
>  	   TYPE_ARRAY_BIND, true },
> +	{ "threads-rand-sizes-50", 50, 0, TYPE_THREAD, false },
> +	{ "threads-rand-sizes-50-unaligned", 50, UNALIGNED, TYPE_THREAD,
> false },
> +	{ "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING,
> TYPE_THREAD, false },
> +	{ "threads-leak-binding-rand-sizes-50-unaligned", 50, LEAK_BINDING |
> UNALIGNED,
> +	   TYPE_THREAD, false },
>  };
>=20
>  int igt_main()
> @@ -787,8 +934,23 @@ int igt_main()
>  	for (i =3D 0; i < ARRAY_SIZE(test_matrix); ++i) {
>  		const struct test_case *t =3D &test_matrix[i];
>=20
> -		igt_subtest_with_dynamic_f("%s", t->name)
> -			run_gt_dynamic_subtests(fd, t);
> +		switch (t->type) {
> +		case TYPE_THREAD:
> +			igt_subtest_f("%s", t->name) {
> +				if (t->requires_evict_ram) {
> +					igt_require(xe_has_vram(fd));
> +					igt_require(igt_get_avail_ram_mb() >=3D
> +						    (xe_visible_vram_size(fd, 0)
> >> 20) / 2);
> +				}
> +				run_threaded_bo_alloc_test(fd, t->count, t-
> >flags);
> +			}
> +			break;
> +		case TYPE_ALL_SIZES:
> +		case TYPE_RANDOM_SIZE:
> +		case TYPE_ARRAY_BIND:
> +			igt_subtest_with_dynamic_f("%s", t->name)
> +				run_gt_dynamic_subtests(fd, t);
> +		}
>  	}
>=20
>  	igt_fixture() {
> --
> 2.55.0

