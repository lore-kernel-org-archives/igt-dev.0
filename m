Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F6DC3ABCB
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 06:29:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381F210E19B;
	Wed, 14 May 2025 06:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UWzq+jrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635B110E19B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 06:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747204138; x=1778740138;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lc23cq6ZnqrPdC8M02n53DP1uGxFi2vedNnm/dnYyOc=;
 b=UWzq+jrDHAsp1Zh1jV1FskKjI14wbAb4+/JET8Z9n3Q5/+DH35AGgubx
 HNeCTdYyEmCSWXhqg+W2xgC/QNfyk1bduVEysh3PsWwYX+1bm73fYPGZk
 nZAll93JS3VgtfCvutVa2B+jAOGgpHEiaHA3J8nfW25JyhCJXnoFgY4ME
 FYE5rUT3GVbVl5ZGmVfsAn+PDsR2T+dufFslEod5Tgvt020gtzEKtJAXC
 Mq3Ib3mRin6IoJhC3YMGbCRre8nyGhzAVcZA1DXqyz07T/X46Oy9+ACvb
 vV3GjnocUzjzTqnHkm5sESob6p8RKR+iAhEG3nVKgzm/2uPfln6MYxTZU g==;
X-CSE-ConnectionGUID: qVCFxw9dQm6LUCYzYu020w==
X-CSE-MsgGUID: +BqZeQ4KQuiPjKOqYm4LjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52746799"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="52746799"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 23:28:53 -0700
X-CSE-ConnectionGUID: 7rNRsAEwTaWUK6YjUgi6+Q==
X-CSE-MsgGUID: zz/f2IJEQbOqKN84MZqx6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="168888165"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 23:28:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 23:28:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 23:28:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 23:28:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbrVbBXpUVb2fE8NNfOtS+oNE0v5guF/zJ40gZ/yuNB51bfSzHYKiFd6fUPlqW708U+RuQ1vI/nQoVZr5AXZOgNpuhYMwUKmzaUyv+HKFbwVG/LjWlJ8wy3MeYL+YUi5W5jm2FMriTLKAxyEdoPJXf5vasFUUzOyCqQdrYlGCViaLdbGonbSu88RHZCurhDPAhmsJO71PdbeOiJR/w68NUFtcAmqzoeeewWH2eUmUuR4KCl66xy7FChupkHgiau0w4OY7sgenqteOzvQ8pmlYZUs4t9NYY3Ad1eHGYAE3XvJdmNMhNrMH3R+8ZgUvIc496d3t/asXlhxRI7LHm492w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRIq+n0atvwxk1fjD5DHDCBeBRpieYmZrlrVvHucHXU=;
 b=VGE1903wDDfMOUgvmZZScYomlp0wkhByTbg6qQAD9yT1WGoZnrGpIYO4Z8cyTzpdHH4wp+G6nRcPgYF929y0LQEkJQshp8JrIyUkJEH5L2D2zCJbR7aZaWEQIP3oTk2hRHeb/rnfBgx4wJyN+j1QijgW4PrgFU+uOF3CElhjupqsLgoIllYw+p/tIVHZibR2yzZGHVwEejV8Xe5ImW+GcodJedEzcyOSe2jgTPS5sQS06GDTITDp2ImBb/zVSXnB2/dGb1prE0h0oOh7XMpc77yUQzeYAzOQuqBTi5bwWcgz8U7z63dFxnvjO0eN8IQKEJYay2JCrCD/axrM54Q1Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by CY8PR11MB7136.namprd11.prod.outlook.com (2603:10b6:930:60::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 06:28:47 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 06:28:40 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
CC: "Ramadeva, Dwarakanath" <dwarakanath.ramadeva@intel.com>
Subject: RE: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
Thread-Topic: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
Thread-Index: AQHbrRhrsgrnbOLmCUm+wIOMgsX7h7PR2IeA
Date: Wed, 14 May 2025 06:28:40 +0000
Message-ID: <CH3PR11MB8434C65C91AD19F5BAE291478D91A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250414083627.3264121-1-nakshtra.goyal@intel.com>
In-Reply-To: <20250414083627.3264121-1-nakshtra.goyal@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|CY8PR11MB7136:EE_
x-ms-office365-filtering-correlation-id: 4246cf8f-e1e9-495d-7ed8-08dd92b09168
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?kSCxfCq9pVxJS9+vuAghCLWh1EAqSJXu3ENmPqBt73kXuknDtLyFo/lr7JaZ?=
 =?us-ascii?Q?TVMB7AibVKQlgAWOWbNNW5Er7/LGaxMnifLFkWdyq07qVOhSctBUMPOZ6LE0?=
 =?us-ascii?Q?NaNsQwQgkEhUV2BANaEwfygcyzt63qJt35KtAQIO731S8uyuBX22VcgvEgZ9?=
 =?us-ascii?Q?O+ksOUl3qQB0ulJE5zlloh0s9YUikXmk4gEkNqwWXMtVU7jQg6NCBfd63MwU?=
 =?us-ascii?Q?YXSPusK+8/DnngsYyUk9El5mMyKxQ0cTuTj7jqQKHQYzc+rhVT+ESgjiPJQO?=
 =?us-ascii?Q?Fcg9g/a1rJteIck/l80JgmqFbj7cxajqW9h2k1KeD0BpN9I856gmGQnveSp0?=
 =?us-ascii?Q?w2sb1+4BbAYjUkzKgO/KineksfBbCsu2l1/GFrYd2slPxCv5HcIe0YEGJUAb?=
 =?us-ascii?Q?UOOsZ2rwzx13j8ymx5x6hs7MU6cKxQrPxRecrFoah4aSrjYNSknhIXQZeQKE?=
 =?us-ascii?Q?9VRNLXZxJRYGR6xJSV29a/c1NfQW9NZCJR4WlNUWTR93lk3YZof3Ki/M6h9J?=
 =?us-ascii?Q?hMHTpWLM5qIHHR7Cxxn37kYjsTG6Fze529cATJasdTO192VROhXKfOyfrJHO?=
 =?us-ascii?Q?2WL/KTYYvJ0widC5XxoGJ1havPXw2Rch4AErofghtJp3H+kspQxlImyaesS6?=
 =?us-ascii?Q?pEwRwn9YucO+Bay4/Ja9peGN39X5r3+LW0WhzrokS0/wA5A5Wp/55wr/xUMj?=
 =?us-ascii?Q?b7Z/CQtvr3W0xlDIPrgN3DKWqoQFPR4BHc+i72x2HcjVVsl7GY/Oe9+2jx+K?=
 =?us-ascii?Q?ocK9P7wVA4/zilXZmQMMVza36VyPCeiNQn9VOtPz1489ubzg6CtYlLZVw99q?=
 =?us-ascii?Q?ySkBM6O4X7f7YI0mV8SE/ayTfGzBm2ytnpULrCGpJJF70rOu7d59tyuMhYHU?=
 =?us-ascii?Q?t8YBLYuwY0TFhFN47m6lvRBZaBDbEsWp81dw0rhp5YpVT0YbY4tsEVvfGryj?=
 =?us-ascii?Q?I2T9SW5/CT9CdqIIHlrKMV87lh2LdL/ltUYHLTX526I7aTM8IeQGvpCbMAhP?=
 =?us-ascii?Q?8GNihh7TTfCXLFc1mjKWErkPhf3cajL6ZirS5djO6BP4/WoZnv+8ZOsxqoxm?=
 =?us-ascii?Q?CmvYADRYc0iE41qW0xQlsSs+ryxRvjUb6t7/0t69oCNSROhAzI0Cn35pA/i5?=
 =?us-ascii?Q?kIW2BzKGia2ROwWGQB6JMPEGIxprFBZ3NQEUHCkyOZ7hsUt7/v0fk3Efq25i?=
 =?us-ascii?Q?Jr9k31j3RzySWm7amdtBBxZAQ+M7Q+/k7mHRhYnCkAtlkK565bc/2GnGjDPy?=
 =?us-ascii?Q?XFfx8Z8NXYLQwHXU4jsIEbcmx0MqLLu8Tmvd8PIVk/ng4CC2ngxtt7k9cQ+2?=
 =?us-ascii?Q?WcSYYSxhkB2m/GNLKcDz/1pTvF8wkNaLOhsvLIADwUiVcq/0aWriaD8qi74+?=
 =?us-ascii?Q?ppsds0Mm7oGGC7E6n+ZQoV5uMo+FrE4DT6IhqhTee6scCTwNHDD5FcGkD1dy?=
 =?us-ascii?Q?q4DjRsS4hUQ1YPATlFP0OQbSOYMBhIx5ADmauM6+qNNSh2jSfTKiOYmYA0PE?=
 =?us-ascii?Q?OfC32Tis5weuzk0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7FaefO61GzVbX5TgFX9unANWHh+st0rjiac5bbPjK6Sp3Snlp35djlehM5dF?=
 =?us-ascii?Q?JmQIVJbiaO1xt4Ct59gSgcLUuyh2O3BwJtyKdbNjPD4wL0bAbYpYU8C/KgpO?=
 =?us-ascii?Q?47NoXw9pDjpWq1XVXg3kLyCY+pm36+NacUr7b/DfiuESFKdwei84Fkg8828F?=
 =?us-ascii?Q?e9tiy4CSRwWG3euxaoicKJuUYvcWWR7sVil6asOqNo5WdC7JVNlstS2FxZ7i?=
 =?us-ascii?Q?Gbjh9NURiMk9jZFbtAHuwc8mznX1tVorcbRqMppYXtuItI0Bn9S9OXOhvKYZ?=
 =?us-ascii?Q?0CTsisBQibgSqnnA8Ck1rdatQ95qo5YmeIlpxxS2tR/fveXMJLrQXZLyLRje?=
 =?us-ascii?Q?STiS2HnJc4o/0cc2LhjJitTO2qSeMfvAKfi3bLgR26agHRKsIgrGWCJkJeqK?=
 =?us-ascii?Q?KGyiqR7WWeFuztD+eEf6qItsq0MtGnY5yGlP3liVyTpgjzVAsq1LblQhL2F+?=
 =?us-ascii?Q?2+0lflid4NZ/5rRClter3OwmFQtaE1pj9G9y56AbFN4drTz6e60g/6+Omqmt?=
 =?us-ascii?Q?gORNJ7t+k/HY1IBup1nLbm/cu46WjbYoLsb01nh3tN311H1ZCtDYlergcqxg?=
 =?us-ascii?Q?Wgxt+i0YbXOnw9bRJ9RJeaXPP79L8w7r7M2TuGffosrqElta3ZOgR8qCqYRc?=
 =?us-ascii?Q?6za9PWtIKxQ9PZi2ZWFQbdJCUFw3ZuI5GBN5VxeLaD4k+2SAOna+MfKmq0fG?=
 =?us-ascii?Q?JFO9t1XrpoEJqAAWgRfIVCHzG2X07RxT9k/Mf15wl6lup4aRa0reqPQ36k5P?=
 =?us-ascii?Q?i+5AJmj7Dxy8wpCBPxwB64KUEe7y8V2B/hmQG68b8UU1QUWEKBPLBMpG2K7V?=
 =?us-ascii?Q?SLZYZC1p3i90sDTnqMLHW3BO5v/46qJG6nbAqm+K7esihtJFiKu8quIJ9yla?=
 =?us-ascii?Q?BCUzKvIKh6UtgEnJYALbSQgZ3x8/V3POo3AMTCJuscWbdAd+C+rsGn7bPooP?=
 =?us-ascii?Q?OApY7xVwKGD/fTWcruY2IbnL/vpJXypy/aYfeeMo5fVzQ+NX1uWVP055OoQV?=
 =?us-ascii?Q?6RYF2s4DQGU/cGu3MQOjsyh+TP56Ct0oEmszWN9NgFRpziO1e7YLyRN7Dh9w?=
 =?us-ascii?Q?G9D9OXJOm4uHoTZVkyeB9oxYxOldLkaJA7w6aYmW2daR77LDtKfrrMs07BPh?=
 =?us-ascii?Q?HouS8J/klZ9HwHMRqzMX2YOCzGAH5g3gSSRBH/Gn1gDK+OnpMJXnicWpPxPh?=
 =?us-ascii?Q?zDlukJ62ZFl4DjmfhMalw+vpFUklRDtAgKbvNzAthlGJRq7q69Hq7cU6Od5t?=
 =?us-ascii?Q?OubgUxnc48Booz8EBP6NuzQ0lPuAoF80Qi5Ljp8p7m/U3+k/sBvU5J9zCSGp?=
 =?us-ascii?Q?yCTDp7j3Kc6KEWOnYwerhpcOU6XewV5eIuLz8pf/fWI+kib2ZTtN4nKqmfvh?=
 =?us-ascii?Q?5UrodKy133p2WSmH2VOgjcipAw+uhQXgjF6udm2JYIwg2E0YkO2/0gTOowhO?=
 =?us-ascii?Q?9e/BRKlPgzc2yqDv0gkrGVOFFLUu/GfRjXBi7he1Lz3UGoxZ+rCOq2hM63Jd?=
 =?us-ascii?Q?EEW93IdCLfgegWWJnRKCwUTnTHJkA8NVp6BMODrggHDFi0chfp2GJUkv6d1n?=
 =?us-ascii?Q?BRdZejZKe/hWgu7LOVTYqg7ZEoMb4VnN4lwNsPzO+R9AzOeGO6tR3smjK63J?=
 =?us-ascii?Q?zA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4246cf8f-e1e9-495d-7ed8-08dd92b09168
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 06:28:40.7521 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mTVoL7M5VLP6Ztpk9Me09YK8jgNpPy3Uc7tJG2kFdsQF4v+BhS5H6jUfJNV4p07V9XPhRqRDSpBdfgUgtTwsvCndWiamIFkJWqR4xYgQZmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7136
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nakshtra.goyal@intel.com
> Sent: 14 April 2025 02:06 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Cc: Ramadeva, Dwarakanath <dwarakanath.ramadeva@intel.com>
> Subject: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Map a memory then make it read-only and verify kernel out for read-only
> memory
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_mmap.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c index
> 5fd641075..649a11544 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -338,6 +338,24 @@ static void test_small_bar(int fd)
>  	gem_close(fd, bo);
>  }
>=20
> +static int
> +__xe_query(int fd, struct drm_xe_device_query *q) {
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, q))
> +		return -errno;
> +	return 0;
> +}
> +
> +static int
> +__xe_query_items(int fd, uint32_t *items, uint32_t n_items) {
> +	struct drm_xe_device_query q =3D {
> +		.size =3D n_items,
> +		.data =3D to_user_pointer(items),
> +	};
> +	return __xe_query(fd, &q);
> +}
> +
>  static void assert_caching(int fd, uint64_t placement, uint32_t flags,
>  			   uint16_t cpu_caching, bool fail)
>  {
> @@ -357,7 +375,16 @@ static void assert_caching(int fd, uint64_t placemen=
t,
> uint32_t flags,
>  	map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
>  	igt_assert(map !=3D MAP_FAILED);
>  	map[0] =3D 0xdeadbeaf;
> +	munmap(map, size);
>  	gem_close(fd, handle);
> +
> +	/* Adding a Read-Only page check exercise */
> +	map =3D mmap(0, size, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1,
> 0);
> +	igt_assert(map !=3D MAP_FAILED);
> +	igt_assert_eq(0, mprotect(map, size, PROT_READ));
> +	igt_assert_lt(__xe_query_items(fd, map, 1), 0);
> +	munmap(map, size);
> +
>  }
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>=20
>  /**
> --
> 2.34.1

