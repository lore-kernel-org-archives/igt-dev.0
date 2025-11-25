Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B17D0E6EC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Nov 2025 14:36:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13DFE10E2A4;
	Tue, 25 Nov 2025 14:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aUZRCIdb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D33B10E2A4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Nov 2025 14:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764081411; x=1795617411;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gbNIj4wYCohDFWg8PsbM1VAsa1fkaa6voY/SX7/+rA0=;
 b=aUZRCIdbJ90OP+D/K0pqx/6LBlNJXnJ9KEKJ7vCY4lq14yDM6iv6SMbZ
 vCYO5ws3KCm74rBl2P0YUqZaUJq+ye8yyZaquiaqobwvkvT1grEjP1ZX+
 ZBDsMcOuUIekfGlUKYI9Nw+SPDGOJkmEnncu7vSvhyZkMQmvTjU28mjW8
 SocDEAeSkMDfodqIvKAq1GNWiu8TaM4p8x5dD6IhXPrBbr5qJsjNIgViw
 RJ1VGNRuDStON7j76Z2QKYCc9v81UmSKWx2jdfPHazawXGFEex1drBOYq
 j1e+1sMxYwjtWppIomyHqAbI0IGpyVniYnQtK59SzXQpAkdIMQVPaD3BC Q==;
X-CSE-ConnectionGUID: ZxPmeruKSoOlUV2yvRKcbA==
X-CSE-MsgGUID: IPLe67OlQDeeoBMzY3a52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="53668639"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="53668639"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:36:51 -0800
X-CSE-ConnectionGUID: ZQnRl8d+RIOgcKrPe24mRA==
X-CSE-MsgGUID: SJVAfwYxR2WCzV80AU0Y5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; d="scan'208";a="216002464"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 06:36:51 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:36:50 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 25 Nov 2025 06:36:50 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.53) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 25 Nov 2025 06:36:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+grN0j3P5fFuEqYMY3LqIgJa+GvINV2RzZkLgls11zALAxH6MCFnUn7Ah0ajIIg/PhWyKFVeVd34yXcdrpjwoLVzqtgLrnNO6kjZjefMuT/qqGJPgKXBguJvrI0YiejBD2H1wUCIkQ0MlVFiIOSTDUhGKKWggxvZ4tqoy0hfWvHgAXSaE5cjT94Pkwv/I9h0Fnac4Cua3ndC/7XxsOvP97xts+1x3lvogcCqrwmrJ+kP6pvX6bbYwejlGFh1i45QX09os+eAPhtVQNphltXYZMZ/yxYowsMTqSzD+El88Mx5DkqY7LTPAuX3cTNm6o6pU1eb8iVwI4HqOFTVOW8Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bf/ZrOiydh0Vx3cLH2radi6broCXxXHcht6wjNxdR3Y=;
 b=YVpUA+Dw1JpJNzkYeX2IWWhRgyAeroeX9u3pgTv4xruhNTmH/GUPvFk8+Hu/J6UagqkZBb41ERnXHgf+Dg0sF4/3C93YqggutAVA8bS/7libpjB5M7Z/DltO9ezA4+ttd1477BJ3k8G3kYiT/09LHkjxQdgZgL3V+i0xfFUQUz10fxuZEI9tqDLYqln5eZptBtBiGjQEZiqieNticS2j2DQpu719Sa4jSsk1Kc2kq6+/OeWE3G3qYbONttrqX/26u1F+wSWVPRZU8KQpOpTFFy5IAvoDKfC1QukvkIfSa0HuTMqUyO7HxFsyFSjsTfQiQU/6RWNXmN9GneVt7XXsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Tue, 25 Nov
 2025 14:36:47 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 14:36:47 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Hellstrom,
 Thomas" <thomas.hellstrom@intel.com>
Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcWwN/GyyFNhhwdECOaEwoDoR/CbUDelSAgAAA+9A=
Date: Tue, 25 Nov 2025 14:36:46 +0000
Message-ID: <MW4PR11MB7151C095FCA48709BFA935D8E4D1A@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251121162537.77551-5-nishit.sharma@intel.com>
 <BL1PR11MB5525A52E3B7659CFCFBE017484D1A@BL1PR11MB5525.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5525A52E3B7659CFCFBE017484D1A@BL1PR11MB5525.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|MN0PR11MB6058:EE_
x-ms-office365-filtering-correlation-id: b3887b7d-537e-4e35-5605-08de2c300fe7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?cbaHIdNnKE46WQrUPWt8swKHxoyFQ7StrdMwFrmTwWmiDgLCle2sOzEmef1H?=
 =?us-ascii?Q?jMxWnPydJa8NN7+PHz3lGC+PHm4r1zwrkhfG+vHoAgjIfbbY0RkNf1RY9SRC?=
 =?us-ascii?Q?3Vf2XZXYIdIwG8ajloU3+UnoeRzYL8oA1J6uiTriqominLF5itlGd0/CIMiX?=
 =?us-ascii?Q?hbtP3hFrQ8ChDkl5M8JDQ2pR8ya7ITQMMoxNeHk9zEl3r+eG2YOEFqLO2hSt?=
 =?us-ascii?Q?c48COo2VMJ11GIbOwx1qNfQPW0s/w3UNrcRajzraLIlMNWKDOUTMB5lqVRU6?=
 =?us-ascii?Q?zWVqtEJjI78P8dcT3bv6xqebjM8UrXLf8JSXm/HzkLNJXLpExtsvX5t4Pfqi?=
 =?us-ascii?Q?uUnbwbYoGTKWmB1Rl20ErvkhTaha/D/xY0e6QTRHyPQdk5TR4KQaxmTFrS8+?=
 =?us-ascii?Q?JS0QyIHIjsEWjNszw4h/IIqwBCJ3OckIs08R3bEdvIIrY9F0VQpsNvxbmpWE?=
 =?us-ascii?Q?UDmNM1+Zmrt/edlV7cYrh2tNbAvzMYGMXz0hb8/YDza3N1ZxV9u8nJbb4Dyr?=
 =?us-ascii?Q?7PFZZrHzcdlgke624oTWxhyISQrrJ+FSkrdror+zwRDKQbMoQbPFfNsP8aMR?=
 =?us-ascii?Q?1NP+oKe0KcrxCC9zOwf0Spw/7UY6uut/I1rIEEI/f2mp4zrYJVaChSQsqkrU?=
 =?us-ascii?Q?O76tb+TZxpoFptVBjERQmBZD6WMyfWDBClOQiCsMIGMHHH7mGSxKsAonw7+u?=
 =?us-ascii?Q?ZVRMwe//1RMeEBr5AynzthSXp1WjKb/+Dy4kw4q+RwNYxvoAYrW7H0F4Kl6C?=
 =?us-ascii?Q?f1CSXAnBiwkjdHBR2ZTG7VFWTmMtBYVPgBEjgwmfwmpbE8j3Zc/RTRAAeXDD?=
 =?us-ascii?Q?djG+5XAg2QkfenCiMWXPl7Z5d0+ZRMIiH20WlHnJgDQ4actsIrjwg49pZFw7?=
 =?us-ascii?Q?wTk7H+yyUzowPPKfto1vvk/YP9BQ5aM3fXOruPAdPCm6yzFbHxlcq1pt3lC8?=
 =?us-ascii?Q?6qvagB4/of0kaeVrREYNlAQ+313B7rj39aEewrOuQZkKmAW/k53mdF6uKZQr?=
 =?us-ascii?Q?E4Ypy6neOKSNZ6xWgkYS6Ya3EUBev+2U7MVUFtH5oH1ND2ST/bSowbY22MMC?=
 =?us-ascii?Q?DiXCKcrI+FwQRYhnxLdzQa7p/mkmROYZaqqAZIA1ACwwRScz+gGKPKIadj5A?=
 =?us-ascii?Q?iZaiSATCQWN+KjK4UFUjeUybO2uDLz9Am0nhfWog+SXZxAgLDnvt+GT68Ztd?=
 =?us-ascii?Q?6TQrSu9JS8Fxk21hY0pv4tZYDGvViuS3wpdHP079yT4dbYEQsxsWnMj8bw4k?=
 =?us-ascii?Q?BgjCR+J5fJANNgIKUbKolw/pKz7WiuaLXevIi93R0F3xlzYLYxElcxx4OTXr?=
 =?us-ascii?Q?nQknfBl8wbVNcfDKFMJMYspKq9enZmKczRJE8/n/s1wrWH2JHLZ5U59ztOAg?=
 =?us-ascii?Q?0DYlXsUfuri6m+g8gKl5Fd7CByUOZXbXzk8DLj/XM8QuQu9iq3iAQkQ1yEhH?=
 =?us-ascii?Q?U24bmBk5UpDZBSX1dLZRuga8VXAHoytxSEBw/HP80Gfg9Kx8ilcfB1IsDMij?=
 =?us-ascii?Q?okRt0oH6wAwRUkAJJ+SnEGv+uM4cQmTKKBdi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?l+YKxoRMOI+mSYpywhQAgh5ECh1siREM5qwj3IBqv4DTpV24iMtVBwdXjGFA?=
 =?us-ascii?Q?GxistgW7qRy9ZiZ4IFMY6KIcJk10sYsE7ro9R20uCxXZwmNwgouN5Mw3pgLo?=
 =?us-ascii?Q?fukXQE9dGllZXvnJZGDEOa4MExlNbfVfIrzkxDPKaKydpC2c8w/Rn/nzjAcD?=
 =?us-ascii?Q?+8Mrsiz8+UNBjC7wFc6wCPOTFbNxGOIY7NpwgDwqP9MnLJra9qYFAvx1UfvU?=
 =?us-ascii?Q?bNrblq2pz5GhNXftV6nhmYTruanx5lZBWtu0gH9HlUV6ewMQqmQwGzsW7QV6?=
 =?us-ascii?Q?IukWqdGaK9eTXyvBRT34N1OYkpE8++S4PTP7jesPuYyuz1cDP8LxKlZWpAUG?=
 =?us-ascii?Q?mbO+6laZ4Rp/sn25wQpfmptLgAiBUEhj+epIgj5yJjaS3HfgBFSzlK9IKW9k?=
 =?us-ascii?Q?/HEuxYJFmZ/hvPPV5Dj28XITFNZRtNQNXNkxLP6Wy3/+BAr4TmKs7BiIi8JJ?=
 =?us-ascii?Q?pEXgqXJobGJNglmGC2kjNpmYul6tcabP9scSoQPFCLegktjs/gOQUtWLf6IM?=
 =?us-ascii?Q?nlPqfSlQUdYqEVi8d0VRV6X8h4/NxopsaT8piUkuhlXoHJfKhi1/3isU/o0t?=
 =?us-ascii?Q?ePUwrn1BV4Arv21zqkGp4KixoLNXGOy2NaYXUnsZKwlNnaVRw5/LTL7Ip0yt?=
 =?us-ascii?Q?nf4x0iHwCksldj9GQURh860bnJWidU6SOao4WJvKyHN4fTeL4pzJTjtNX/PZ?=
 =?us-ascii?Q?JtylqQ771IDH98pZYm89tYSgxuwE8+2Xp8d6jtqOniM/QFB8ZIJ/l/6FzpA7?=
 =?us-ascii?Q?058FOsu7CFUxStm3OG+vTMgj23DslzDJdW/xE2NXnKAoiCdgWoxuaBmNLVp1?=
 =?us-ascii?Q?l6MzpHAZC/P0v46JJIgrCKR6ocXu6c2kjyeinvUHL5sukPl0lZTzois96WV3?=
 =?us-ascii?Q?SQnYnt/Z1MFAn9iccJ/zNuR48w/NtPymym+syV1y4uyjm85KS1WM9YvJ974v?=
 =?us-ascii?Q?Vj56YLu6QwyPkvmeuuMfL4RznNNx66SDYd36mCL2VamWDWaz0FQ9IQfj/3Py?=
 =?us-ascii?Q?0lnv9RqDMxtSNKgaK4i+S8sfhfB3aZ0B5oRFz1mRbGg50oHoLPIhpq+it8uH?=
 =?us-ascii?Q?6Eq/cZ5P36aRQUaZ3nktCe8nkQwApcr70yQAb+gN7Blq4bY27XesPh7zU7Og?=
 =?us-ascii?Q?9u/T2AbFgFRpiBkFEAzyCwGOafUpfyXEMmzcRus9wS+E/eboNLjL2TUfRzkr?=
 =?us-ascii?Q?pj+oOeIQ5g71XfhZoZy3QcH+BHJLs48fhBr97wCXD5vts+dJTAUiWWRaXdcF?=
 =?us-ascii?Q?2A5Hk3bPfIJ8cYgymx0prLZv7+LDckky8f4dcwGVVIiTZ7MrI6vFGdY6ph5u?=
 =?us-ascii?Q?/uMLj2gmasT+OQ9+yg6gk3hsxORScTOU9dHfMXn9Q5OM8TunHN/z0MIGsY5J?=
 =?us-ascii?Q?JuOHlaHO6U3ghzUNg9hgq0/oNJDEi8hO1HYzkE9t/a7TnrUTpqkMokv1B7eZ?=
 =?us-ascii?Q?EhvC/64KeSbfzM97IzvnImWTD4qV+QU/jogEAGo77BXJPGjC9nlYLmZEnohm?=
 =?us-ascii?Q?fPYNSxYjQGLiAyBfSwI7STBsu/+iLsUvjfH6vqlMrDcxEX+wdNLPg3AY+IJE?=
 =?us-ascii?Q?ZnDMb56lRpdhhcWAT05HYRoG79aMgjLzjHQh8VUP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3887b7d-537e-4e35-5605-08de2c300fe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 14:36:47.0022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kkXPmcPmD3Ci48KyaDC/sYLkbPwvg/AsF/1EBwgy8RU36mFu1YhNjwXRRIKnh7EabldKg/Up/KXiAoFPasaC+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6058
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

Can be done but we are checking atomic operation in multi-GPU scenarios, so=
 idea was whether all GPUs performing atomic operation correctly and data c=
an be read from CPU. GPU1 write - GPU2 read implemented in other subtests.

Nishit

-----Original Message-----
From: Gurram, Pravalika <pravalika.gurram@intel.com>=20
Sent: Tuesday, November 25, 2025 8:01 PM
To: Sharma, Nishit <nishit.sharma@intel.com>; igt-dev@lists.freedesktop.org=
; Sharma, Nishit <nishit.sharma@intel.com>; Hellstrom, Thomas <thomas.hells=
trom@intel.com>
Subject: RE: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM mu=
lti-GPU atomic operations



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
> nishit.sharma@intel.com
> Sent: Friday, November 21, 2025 9:56 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit=20
> <nishit.sharma@intel.com>; Hellstrom, Thomas=20
> <thomas.hellstrom@intel.com>
> Subject: [PATCH i-g-t v8 04/10] tests/intel/xe_multi_gpusvm: Add SVM=20
> multi-GPU atomic operations
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> This test performs atomic increment operation on a shared SVM buffer=20
> from both GPUs and the CPU in a multi-GPU environment. It uses madvise=20
> and prefetch to control buffer placement and verifies correctness and=20
> ordering of atomic updates across agents.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  tests/intel/xe_multi_gpusvm.c | 162
> +++++++++++++++++++++++++++++++++-
>  1 file changed, 160 insertions(+), 2 deletions(-)
>=20
> diff --git a/tests/intel/xe_multi_gpusvm.c=20
> b/tests/intel/xe_multi_gpusvm.c index 471be6449..4e817edf9 100644
> --- a/tests/intel/xe_multi_gpusvm.c
> +++ b/tests/intel/xe_multi_gpusvm.c
> @@ -33,6 +33,17 @@
>   * Description:
>   *	Test cross-GPU memory access with prefetch in multi-GPU SVM
> configuration
>   *
> + * SUBTEST: mgpu-atomic-op-basic
> + * Description:
> + *	Test basic cross-GPU atomic increment operations in multi-GPU SVM
> configuration
> + *	operation on GPU1 and then atomic operation on GPU2 using same
> + *	address
> + *
> + * SUBTEST: mgpu-atomic-op-prefetch
> + * Description:
> + *	Tests cross-GPU atomic increment operations with explicit memory
> prefetch
> + *	to validate SVM atomic operations in multi-GPU config
> + *
>   */
>=20
>  #define MAX_XE_REGIONS	8
> @@ -42,10 +53,12 @@
>  #define BIND_SYNC_VAL 0x686868
>  #define EXEC_SYNC_VAL 0x676767
>  #define COPY_SIZE SZ_64M
> +#define	ATOMIC_OP_VAL	56
>=20
>  #define MULTIGPU_BASIC			BIT(0)
>  #define MULTIGPU_PREFETCH		BIT(1)
>  #define MULTIGPU_XGPU_ACCESS		BIT(2)
> +#define MULTIGPU_ATOMIC_OP		BIT(3)
>=20
>  struct xe_svm_gpu_info {
>  	bool supports_faults;
> @@ -60,6 +73,16 @@ typedef void (*gpu_pair_fn)(struct xe_svm_gpu_info=20
> *src,
>  			    struct drm_xe_engine_class_instance *eci,
>  			    unsigned int flags);
>=20
> +struct test_exec_data {
> +	uint32_t batch[32];
> +	uint64_t pad;
> +	uint64_t vm_sync;
> +	uint64_t exec_sync;
> +	uint32_t data;
> +	uint32_t expected_data;
> +	uint64_t batch_addr;
> +};
> +
>  static void for_each_gpu_pair(int num_gpus,
>  			      struct xe_svm_gpu_info *gpus,
>  			      struct drm_xe_engine_class_instance *eci, @@ -
> 71,7 +94,10 @@ static void gpu_mem_access_wrapper(struct=20
> xe_svm_gpu_info *src,
>  				   struct drm_xe_engine_class_instance *eci,
>  				   unsigned int flags);
>=20
> -static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> +static void gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> +				   struct xe_svm_gpu_info *dst,
> +				   struct drm_xe_engine_class_instance *eci,
> +				   unsigned int flags);
>=20
>  static void
>  create_vm_and_queue(struct xe_svm_gpu_info *gpu, struct=20
> drm_xe_engine_class_instance *eci, @@ -162,6 +188,35 @@ static void=20
> for_each_gpu_pair(int num_gpus, struct xe_svm_gpu_info *gpus,
>  	}
>  }
>=20
> +static void open_pagemaps(int fd, struct xe_svm_gpu_info *info);
> +
> +static void
> +atomic_batch_init(int fd, uint32_t vm, uint64_t src_addr,
> +		  uint32_t *bo, uint64_t *addr)
> +{
> +	uint32_t batch_bo_size =3D BATCH_SIZE(fd);
> +	uint32_t batch_bo;
> +	uint64_t batch_addr;
> +	void *batch;
> +	uint32_t *cmd;
> +	int i =3D 0;
> +
> +	batch_bo =3D xe_bo_create(fd, vm, batch_bo_size,
> vram_if_possible(fd, 0), 0);
> +	batch =3D xe_bo_map(fd, batch_bo, batch_bo_size);
> +	cmd =3D (uint32_t *)batch;
> +
> +	cmd[i++] =3D MI_ATOMIC | MI_ATOMIC_INC;
> +	cmd[i++] =3D src_addr;
> +	cmd[i++] =3D src_addr >> 32;
> +	cmd[i++] =3D MI_BATCH_BUFFER_END;
> +
> +	batch_addr =3D to_user_pointer(batch);
> +	/* Punch a gap in the SVM map where we map the batch_bo */
> +	xe_vm_bind_lr_sync(fd, vm, batch_bo, 0, batch_addr,
> batch_bo_size, 0);
> +	*bo =3D batch_bo;
> +	*addr =3D batch_addr;
> +}
> +
>  static void batch_init(int fd, uint32_t vm, uint64_t src_addr,
>  		       uint64_t dst_addr, uint64_t copy_size,
>  		       uint32_t *bo, uint64_t *addr) @@ -318,6 +373,93 @@=20
> copy_src_dst(struct xe_svm_gpu_info *gpu1,
>  	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);  }
>=20
> +static void
> +atomic_inc_op(struct xe_svm_gpu_info *gpu1,
> +	      struct xe_svm_gpu_info *gpu2,
> +	      struct drm_xe_engine_class_instance *eci,
> +	      unsigned int flags)
> +{
> +	uint64_t addr;
> +	uint32_t vm[2];
> +	uint32_t exec_queue[2];
> +	uint32_t batch_bo[2];
> +	struct test_exec_data *data;
> +	uint64_t batch_addr[2];
> +	struct drm_xe_sync sync =3D {};
> +	volatile uint64_t *sync_addr;
> +
> +	/* Skip if either GPU doesn't support faults */
> +	if (mgpu_check_fault_support(gpu1, gpu2))
> +		return;
> +
> +	create_vm_and_queue(gpu1, eci, &vm[0], &exec_queue[0]);
> +	create_vm_and_queue(gpu2, eci, &vm[1], &exec_queue[1]);
> +
> +	data =3D aligned_alloc(SZ_2M, SZ_4K);
> +	igt_assert(data);
> +	data[0].vm_sync =3D 0;
> +	addr =3D to_user_pointer(data);
> +
> +	*(uint64_t *)addr =3D ATOMIC_OP_VAL - 1;
> +
> +	atomic_batch_init(gpu1->fd, vm[0], addr, &batch_bo[0],=20
> +&batch_addr[0]);
> +
> +	xe_multigpu_madvise(gpu1->fd, vm[0], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu1->fd, 0, gpu1->vram_regions[0],
> exec_queue[0]);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu1->fd, vm[0], addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue[0], flags);
> +	free((void *)sync_addr);
> +
> +	/* Executing ATOMIC_INC on GPU1 */
> +	sync_addr =3D (void *)((char *)batch_addr[0] + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	xe_exec_sync(gpu1->fd, exec_queue[0], batch_addr[0], &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu1->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[0],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL);
This test only doing
GPU0 writes -> CPU reads
GPU1 writes -> CPU reads
GPUs NEVER communicate with each other
Only tests GPU -> CPU coherency
Missing GPU <-> GPU coherency

am thinking if we do below operation it will be good.
GPU0 writes -> GPU1 READS what GPU0 wrote -> (GPU-to-GPU)
GPU1 writes -> GPU0 READS what GPU1 wrote -> (GPU-to-GPU) This test GPU-to-=
GPU shared memory

-Pravalika
@Hellstrom, Thomas is my understanding is correct?
> +
> +	atomic_batch_init(gpu2->fd, vm[1], addr, &batch_bo[1],=20
> +&batch_addr[1]);
> +
> +	xe_multigpu_madvise(gpu2->fd, vm[1], addr, SZ_4K, 0,
> +			    DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
> +			    gpu2->fd, 0, gpu2->vram_regions[0],
> exec_queue[0]);
> +
> +	setup_sync(&sync, &sync_addr, BIND_SYNC_VAL);
> +	xe_multigpu_prefetch(gpu2->fd, vm[1], addr, SZ_4K, &sync,
> +			     sync_addr, exec_queue[1], flags);
> +	free((void *)sync_addr);
> +
> +	/* Execute ATOMIC_INC on GPU2 */
> +	sync_addr =3D (void *)((char *)batch_addr[1] + SZ_4K);
> +	sync.addr =3D to_user_pointer((uint64_t *)sync_addr);
> +	sync.timeline_value =3D EXEC_SYNC_VAL;
> +	*sync_addr =3D 0;
> +
> +	xe_exec_sync(gpu2->fd, exec_queue[1], batch_addr[1], &sync, 1);
> +	if (*sync_addr !=3D EXEC_SYNC_VAL)
> +		xe_wait_ufence(gpu2->fd, (uint64_t *)sync_addr,
> EXEC_SYNC_VAL, exec_queue[1],
> +			       NSEC_PER_SEC * 10);
> +
> +	igt_assert_eq(*(uint64_t *)addr, ATOMIC_OP_VAL + 1);
> +
> +	munmap((void *)batch_addr[0], BATCH_SIZE(gpu1->fd));
> +	munmap((void *)batch_addr[1], BATCH_SIZE(gpu2->fd));
> +	batch_fini(gpu1->fd, vm[0], batch_bo[0], batch_addr[0]);
> +	batch_fini(gpu2->fd, vm[1], batch_bo[1], batch_addr[1]);
> +	free(data);
> +
> +	cleanup_vm_and_queue(gpu1, vm[0], exec_queue[0]);
> +	cleanup_vm_and_queue(gpu2, vm[1], exec_queue[1]); }
> +
>  static void
>  gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  		       struct xe_svm_gpu_info *dst, @@ -330,6 +472,18 @@=20
> gpu_mem_access_wrapper(struct xe_svm_gpu_info *src,
>  	copy_src_dst(src, dst, eci, flags);
>  }
>=20
> +static void
> +gpu_atomic_inc_wrapper(struct xe_svm_gpu_info *src,
> +		       struct xe_svm_gpu_info *dst,
> +		       struct drm_xe_engine_class_instance *eci,
> +		       unsigned int flags)
> +{
> +	igt_assert(src);
> +	igt_assert(dst);
> +
> +	atomic_inc_op(src, dst, eci, flags); }
> +
>  static void
>  test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,
>  	       struct drm_xe_engine_class_instance *eci, @@ -337,6 +491,8 @@=20
> test_mgpu_exec(int gpu_cnt, struct xe_svm_gpu_info *gpus,  {
>  	if (flags & MULTIGPU_XGPU_ACCESS)
>  		for_each_gpu_pair(gpu_cnt, gpus, eci, gpu_mem_access_wrapper,=20
> flags);
> +	if (flags & MULTIGPU_ATOMIC_OP)
> +		for_each_gpu_pair(gpu_cnt, gpus, eci,
> gpu_atomic_inc_wrapper, flags);
>  }
>=20
>  struct section {
> @@ -357,6 +513,8 @@ igt_main
>  	const struct section msections[] =3D {
>  		{ "xgpu-access-basic", MULTIGPU_BASIC | MULTIGPU_XGPU_ACCESS },
>  		{ "xgpu-access-prefetch", MULTIGPU_PREFETCH | MULTIGPU_XGPU_ACCESS=20
> },
> +		{ "atomic-op-basic", MULTIGPU_BASIC |
> MULTIGPU_ATOMIC_OP },
> +		{ "atomic-op-prefetch", MULTIGPU_PREFETCH |
> MULTIGPU_ATOMIC_OP },
>  		{ NULL },
>  	};
>=20
> @@ -380,7 +538,7 @@ igt_main
>  		}
>  	}
>=20
> -	igt_describe("gpu-gpu write-read");
> +	igt_describe("multigpu svm operations");
>  	for (const struct section *s =3D msections; s->name; s++) {
>  		igt_subtest_f("mgpu-%s", s->name)
>  			test_mgpu_exec(gpu_cnt, gpus, &eci, s->flags);
> --
> 2.48.1

