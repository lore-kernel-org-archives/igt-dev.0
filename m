Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0689EC36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:44:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF78210E0A8;
	Tue,  1 Apr 2025 09:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HdUYiVcr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF8610E0A8
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743500664; x=1775036664;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o44jSRVFWPdhQXYoYR5EzYgdsW4cVOwYflsD2OYHHgI=;
 b=HdUYiVcrXbexV2NjiOI96HD6WJL/u/UIRUMpAdZi6zJg2zUohEs2VV1E
 WVx4EMMqw8fVHr6JEKgtCG4SUosqcaBm/Vcx01rPIHZKlTQ2Zk2tLfMNL
 oRU64Aj7Q5wPdoUXzxYSyAO6jz8hiPVQW9FoOAuctWccwGbT40StgqWka
 09uO/Zxq5sYsOGLnj5BbEwtjtrCY2nBnFajfQ7agCQ+FZvZXXJceD23rH
 DYKKsRe9bK+OQWZYox63NdwQT8eKSNMrBjXg/A23Pg6HizxwuQTtowrEa
 L/wBkDkoOtXLGT7LBrN5Ly/yZqG9fS/IiuxcyQdN4EghIYXYeKPyCSCpb Q==;
X-CSE-ConnectionGUID: 6DqMd3puQZmqJSTe5Pbb3A==
X-CSE-MsgGUID: DN7mA3tnQ1uR4aXNjhA4/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62214634"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62214634"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:44:23 -0700
X-CSE-ConnectionGUID: 1yJaal9BQwuyTwYrMAMpgw==
X-CSE-MsgGUID: gn4ZX47IQt2+MKOZbVak6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126169217"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2025 02:44:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 1 Apr 2025 02:44:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 02:44:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 02:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bkV3swX40G3DeWWAJ1tI1fbaLuZHwinlzoFm9CJRUCwB+UW01x+r2BGnVQd5LQX+zmpmPktX6dP68hCkBBJMJh3s2j93+NziLyR7RixFh72TqB2xmbDk4sXnw0sLOCtGOVDTNidcCwAgbAsa88YhQOoGN+ANaH6lZeL/4Gyu4oA4zIq9s5XYiktw5M9Nxd2cCnOVZYEU/pPn5pyHSnH5PRFM0NYrhyUEB7gUQF+15utvB5pDiEEN/aRyVIOpiYMeZiwO1JRNdNnUZsjjlFsxA/jAos5YsyjjIsv4FGgE3af9lAc5T7qg5fW9O3c+AFOCR7w9k4MjCxdvT0aEdf81/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TLNc332SFwzAOmlV5dATSD4EsDsRvhclhB60JUBMfuA=;
 b=WjvOVL1gQbf17AmaY6iHZcDhW92ZOq8s04tydGX4YyJnW6gvi5wHliXUrFVIIWcKwqCwNDd/bEjEDaqC345wCb2+V5IvrwTYf1GvXKRkl4yeFxrx9PSQ3Q0Ry4pmfaYvumGh6yzma2UTFHDMHkyNVN4nY/bsz7IznmoVkeKw8q5mPNBFvvNI4rQdga3ERYrr/TvQfQkbwnHGuMFVmlP+CVYd35FKU6Bb7nOQNmXG8uDZucULaDetazPWo0NGG+GsDScc+wBxAb8FtCUmiSEmXSzJoVOxXCQycB+24FWozzVWQJ9k6reAv6htDWoD/MbzlZInIhL7wKybaylHhzs0kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB5768.namprd11.prod.outlook.com (2603:10b6:510:131::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 09:44:19 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.045; Tue, 1 Apr 2025
 09:44:19 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Thread-Index: AQHboksaIQ+epgdqGE2T95L8Ox1sIbOOiEpQ
Date: Tue, 1 Apr 2025 09:44:19 +0000
Message-ID: <DS0PR11MB7264088073A8FE7968EDA470D9AC2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250331142749.1821941-1-sobin.thomas@intel.com>
 <20250331142749.1821941-2-sobin.thomas@intel.com>
In-Reply-To: <20250331142749.1821941-2-sobin.thomas@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB5768:EE_
x-ms-office365-filtering-correlation-id: 5d23a04d-3929-4fa3-60f1-08dd7101c63a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4zc4y4PZUcfJapTOZZWmNnGV63SrMmGxoZ8ykeEClsEncisr/HtMWBo5Lp5A?=
 =?us-ascii?Q?Y6Vn+wr8isAIC3n4lN/a5bBtzWwKkvbDZkz8ZIPc/PBvoJDNpwf0hEZxGyyW?=
 =?us-ascii?Q?4hPi0hvqUJXB+lF+EQs81svbmV8IsGCcrSQOne9Gq21wuFVv8J3tuZpYrPu3?=
 =?us-ascii?Q?RXjPwlu7UCTIC5XJz7XZBlMwh35gjLimE1mbUV7OwdEHfbjw5zxMgfehLDq/?=
 =?us-ascii?Q?K5tXu1ZFQ8bNR8yjUu+n6X+rWIvaTcKaKPOq/1KqGDXLh+VverAvwK3hkJ16?=
 =?us-ascii?Q?v85h/Pg4iNPNQdsRGtbVjJ5vTanO8u8R4kj/AipcGu2wVPum/HwjJ4WQDJCs?=
 =?us-ascii?Q?Rt6hLGh4PTtNBkkkSOyW3vH6YkzB6uIbrQNp8U8bTxk2IhbsLERq2Ef+IuIy?=
 =?us-ascii?Q?UbDks4R52NUUSfZtEYsZ6lN/oDQN8+gb6FuQ6y+8Pj4ci9fiCgs3JuuX5/JK?=
 =?us-ascii?Q?qlrAFWQBXPg0O+MwtYfUtXHWnSZV1WvZ56LOyvRGwJXb1HrTzVs2ncPGFbTf?=
 =?us-ascii?Q?MB/56K3ryQxULPqNOcBbwIQYxIqph8PsPwn1X1mb8KOcPGHd1MeMrq1PFH0D?=
 =?us-ascii?Q?znZBy0yN+ux9wDNLzHQVJSmBASt0WQF8HiQCsjIaekNb5BhunpCpHFNgcnuC?=
 =?us-ascii?Q?6Hk543esRLq3I5OXDWJMn+kEOTNGaQOHKqDvbm3AmMHgdigLm/vzUEq48lMl?=
 =?us-ascii?Q?1KZ01lOhsR22Tldyua+9h25t+SpJEPdqb1RSnBFg2vIHvk8Eqvq04JnPWuTR?=
 =?us-ascii?Q?8RSFquixuzMEO9mZPTxeeJV7YZIH+FUd4KYND7yniRKlT+7y18Knn7+4whuk?=
 =?us-ascii?Q?Vy52MLkXOkUwWeKVTgQMRcL6V7SxMd6MiLUPG4aZW60jkvR1JQnDBKw5FwBI?=
 =?us-ascii?Q?yBk9EAd6uXrqDRRSRHGVztaF7lEg3hmJFfXC6y8OmHmPIzGCLu3u7NXpghGr?=
 =?us-ascii?Q?6h91Ec3SN+mtm4ZWPoHYxjSXaDv+aH0oPnd1bvD9NxdwECBLOfLLMYtX/3gJ?=
 =?us-ascii?Q?qisRxLgPENiTozgIw9tqk5eSNVVn+Jsc7N5SEpZk5/zfsz4lLpfO6c0yLRc0?=
 =?us-ascii?Q?hfYpFVGyaxkNOSQkAs+QYUr3gfTEkNMvn0Q1a8bpOURdGks5yuAa0mm8rZju?=
 =?us-ascii?Q?msMyLzBngy7EtrO2lInOfJwOfLnFf1h6fkFfqTATOr4GFFxcRFTNYjlHkQrg?=
 =?us-ascii?Q?dnw0LEMGZxGO02Hs2cz/KwxJY8QHKYwHR6/O6grRUGzoljsngUUfrZPWZNby?=
 =?us-ascii?Q?JLx1K6bthVesDPvmnid3nSUDceb2MUoOmROY78Bob+YMUurychfdQrjtvj2R?=
 =?us-ascii?Q?3IRQzq2ow2f6cw8zVeaLwtA2+wTXBrNQEPEv+XMRXy3IGcr989UaQdYZI+AF?=
 =?us-ascii?Q?IVW2rPILD57bQEgmbdRzrJ4gX4rLo9Zz0/Nl5Noh+mnqiCdYhq5F+SoPwFR/?=
 =?us-ascii?Q?pHD2s5JqpTpGEoV4bMatyuJjtAkGBPVG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vJXbSo6m6eBqqC1nCEmCsf4wD9BgVPq8RGl44ibfzIuKaVQSaodS6PiZBBDB?=
 =?us-ascii?Q?ne6ss/NhUby5VFa1d5MkQSx4Rs6fhJ8dVmv+/Xnzlb91yukLT3KotL9s2MdQ?=
 =?us-ascii?Q?QV3k+RjN6GMA0U47foXWQUF0Y6Njme08JCFfaiD8W0cnvGeaP5Ugu95PWull?=
 =?us-ascii?Q?vQEqfTHH+KbmLF5bZVT5BzkRemdSHRYDEXprS4HgDS6b5ZJ3N+Tbttz3MqhP?=
 =?us-ascii?Q?jyGt5cy9fuzi0QWY67DBlhIEkSjcIO0JU8tE7Db2H4ecpTXMTQ4XghflA0gK?=
 =?us-ascii?Q?YFfxce4cVhJMBJdFB1/aLF+Gq56sPnnA47S0dWI5vl0w3aAggQYfpbKa/8fd?=
 =?us-ascii?Q?FJfD6WTQHg3J9Pzhw4D0Z9ugqk2gY0deU25NN4osQLu69TlxbkihpMp3EGJU?=
 =?us-ascii?Q?zJTFWyQ7E3Mei1NEbdkyYpQKJ661qFy52DW2kMKMgUNxU9oynsgADYDR8A/c?=
 =?us-ascii?Q?/p3TtddlkyiQwm0vF24hsejRob3sWXsufSUUe5B00joKV8P4cEurbx+vuPs5?=
 =?us-ascii?Q?cfSD84zwju8y4ahc1PM2KJTaQG2IkuJM/kIHf0ZSjo6VbL5tJrUi62rRWOYO?=
 =?us-ascii?Q?CNrX7rL5j1xNrr5rr80e8PDmyF5vAJ5l7Dmvdw1qd56172HlFOtdMyV28Yov?=
 =?us-ascii?Q?EjvoWpWJQERo9aQAiiUp9GNiquiDp0hi1Q+k910xIaiy7nQG7me91SziFCT+?=
 =?us-ascii?Q?pORRLVdQ+exyMNx0dprlXJIRvYp2893dQYGPt+Ap8sN8kcog7EfWt/WNeylc?=
 =?us-ascii?Q?1V9YYxCJPlp8k3BohhyS7mhgtweDAyrNntWUdCZUjt6t9Q4c7kPtAeWC4g7Q?=
 =?us-ascii?Q?UWYJ/YxIWeUfJf+7QcUJz9jWzHkljcJL442kOWvCssLJhFMabyIhHsfQXrpO?=
 =?us-ascii?Q?oIbfFpildgTSKHbygyiU+xYrlUDQ5WtXQAJDr8MAsIpcRm0BmpQBDfF3soip?=
 =?us-ascii?Q?hGXCkSvqzrQi7BEd8deGIkMXR5aVtBkRShrP0spwXgUMQEhkelcsPau1oUmq?=
 =?us-ascii?Q?O7xttO+QKvaEGWSCKkcRKN0RD1zjg9p9LYNmESnUjupKb/Fv/a95DD20iANo?=
 =?us-ascii?Q?q7lUWcI2jFKLVrOZ+dNlKA+sek+17XCVlO5ugsOzpsD73+KrNDjQVX3YysyJ?=
 =?us-ascii?Q?G4dvGAFFZPB4W+PpUXEq1470pFG62kttqo98QBo0gZySkBXxWttE8LOI4DBo?=
 =?us-ascii?Q?7QRmkYBqOkhcPq5Yp3OYYHvUm6eNobUbvpPw71cBKLwsPynlvaf9r0G/VbOt?=
 =?us-ascii?Q?mKj3tHpF5Sr2e4vF8jJVsrxT0+J9Ok5GFLK/sTzVxvzBReQnyaN0GfdMXOxq?=
 =?us-ascii?Q?qLlqm8Ig1m6lU6hjU3wHdMl3m8IbWOcaezCx2XKpnKXA8MRSHot/qFtUEw58?=
 =?us-ascii?Q?WMcc/88N0cH1nTd5/5UuMd/YF1yftGx7KwOxryYeuBz5jDwMyB8ddIOr43RO?=
 =?us-ascii?Q?0360fuaiCh4vfW1y1wRbNY0YlncEp2F/Mw+pNViMtJVcOalXBs+606/doWtd?=
 =?us-ascii?Q?m5d4/j6m+wvgdTr4LHRxQrkSnnXRsWZgd9qBZHaKnHjutkbcQpOTJPAAEyS7?=
 =?us-ascii?Q?dm2sZ0dnTXhrYEMgZCf0Re7OUVB0dPnX58Xv2ZmzeD1sozYfTKLnoK22KOXw?=
 =?us-ascii?Q?iA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d23a04d-3929-4fa3-60f1-08dd7101c63a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 09:44:19.0633 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ldsn1+elwKhm+Gu3Pbe8oN4pJXPhcXA/jpP7GPTZwAkUHxcqMrjWKSR+YKavgqkldSJIZNVyoINlji3Xeo+KrfgPeTXMZ1kfct1kDHSWgEijS9kAs1Em2gJQD7uHztL2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5768
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

Hi Sobin,

For future submissions, please don't change cover letter's patch number fro=
m 0 to not confuse patchwork.

> -----Original Message-----
> From: Thomas, Sobin <sobin.thomas@intel.com>
> Sent: Monday, March 31, 2025 4:28 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Piatkowski, Dominik Kar=
ol
> <dominik.karol.piatkowski@intel.com>
> Subject: [PATCH i-g-t 1/1] tests/intel/xe_sysfs_scheduler: Add invalid st=
ring

Missing v2 after PATCH.

> test for engine sysfs properties
>=20
> From: Sobin Thomas <sobin.thomas@intel.com>
>=20
> This test validates that invalid string inputs are correctly rejected
> by engine sysfs write. It ensures that the property values remain
> unchanged when invalid inputs are provided.
>=20
> v2: Added error check for return values for igt_sysfs_scanf and
> igt_sysfs_printf. Removed the changes for fault injection in
> tests/intel/xe_fault_injection.c
>=20
> v1: Initial changes for checking error string.
>=20
> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> ---
>  tests/intel/xe_sysfs_scheduler.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/tests/intel/xe_sysfs_scheduler.c b/tests/intel/xe_sysfs_sche=
duler.c
> index 4fc764f82..594c51d44 100644
> --- a/tests/intel/xe_sysfs_scheduler.c
> +++ b/tests/intel/xe_sysfs_scheduler.c
> @@ -10,6 +10,11 @@
>   * Sub-category: SysMan tests
>   * Functionality: scheduler control interface
>   *
> + * SUBTEST: %s-invalid-string
> + * Description: Test to check if %s arg[1] schedule parameter checks for
> + * min max values.

Please align this line in a similar way to other subtests in this file.

> + * Test category: Negative string test
> + *
>   * SUBTEST: %s-invalid
>   * Description: Test to check if %s arg[1] schedule parameter rejects an=
y
>   *		unrepresentable intervals.
> @@ -121,6 +126,29 @@ static void test_min_max(int xe, int engine, const
> char **property,
>  	igt_assert_eq(set, default_max);
>  }
>=20
> +static void test_invalid_string(int xe, int engine, const char **propert=
y,
> +				uint16_t class, int gt)
> +{
> +	unsigned int saved, set;
> +	char invalid_input[] =3D "999abc";
> +
> +	for (int i =3D 0; i < 3; i++) {
> +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &saved)
> =3D=3D 1);
> +		igt_info("Initial %s: %u\n", property[i], saved);
> +		if (igt_sysfs_printf(engine, property[i], "%s", invalid_input) >
> 0) {
> +			igt_critical("invalid value %s can be set to property
> %s\n",
> +					invalid_input, property[i]);
> +			continue;

I see a flaw in the test flow. In case of igt_sysfs_printf not failing as e=
xpected, we print message with IGT_LOG_CRITICAL level and just continue the=
 loop, not hitting asserts below. The thing is, the igt_critical does not m=
ake the test fail, despite the fact that we found a bug. Please fix it.

Thanks,
Dominik Karol

> +		}
> +
> +		igt_assert(igt_sysfs_scanf(engine, property[i], "%u", &set) =3D=3D
> 0);
> +
> +		//Check if the values are unchanged.
> +		igt_assert_eq(set, saved);
> +	}
> +}
> +
> +
>  #define MAX_GTS 8
>  igt_main
>  {
> @@ -130,6 +158,7 @@ igt_main
>  	} tests[] =3D {
>  		{ "invalid", test_invalid },
>  		{ "min-max", test_min_max },
> +		{ "invalid-string", test_invalid_string },
>  		{ }
>  	};
>=20
> --
> 2.34.1

