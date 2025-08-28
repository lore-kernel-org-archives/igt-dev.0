Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24E5C8303F
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 16:48:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A79810EA50;
	Thu, 28 Aug 2025 16:48:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WY0vjxpK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D41C10EA50
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 16:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756399679; x=1787935679;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Kh8ZnsFAxleTI+dAJXgUsG2oWSFBeYY+9Fln/tX9tA=;
 b=WY0vjxpKdj2iIN4A+wqXrTvegPBs66bq8r+sYR/ZTgdAmnxfCZ8qru/i
 r13bypDRQIVbF0dQAbK+tJFRdeM/dXMr1Sc1qxvOBDNQVXQR+1vctm4Zo
 MacWl6Wfptz2D42H/c+ZDjvGczvVQnYJDIQTnkH0Gc0eMcDQa0FPtIt2F
 bVBHRUNFU07ISbaxBZUH6FVN5z84VB37X9/REsrDePRdSFaWStQtrdgcj
 PlmdLf9ueNQygQOghiIJ2gPex3Lxg8OY1VHGz8Yvt633livtreM9iKd8d
 xCv/pjd7EVJ90bK31YtvjbbFKK2NaErf9EOuaRkMfjeq/Sh/FGQeH4vUv A==;
X-CSE-ConnectionGUID: bZ3prAntRuu6XlYikQ6EhA==
X-CSE-MsgGUID: DoaOCVNxTue0KFC5phaWHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69271491"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="69271491"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:47:59 -0700
X-CSE-ConnectionGUID: Hms64XMFSjeCK2x0MpwzNQ==
X-CSE-MsgGUID: NRaHRZ14SUOom2AnL0ZOTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="174545118"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 09:47:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:47:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 09:47:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.69) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 09:47:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZCBlLIsacA6LGuf+cl9+s6kxMK+hLhfV4PiI17ZirkoIU3zfPjVwCfGJQGs7b9YE4YHTRvdWoUlwsu4Z87u3Fq2cNYJ8cZT2pNsgWN537rPCvtGMzWN5CQrvazXoUKlvrXm0wdIWutytHe0L1zlHDg1M4+JNgVSIA9u1KcU60Ng0rbHzNSkPpQzw3ZTFmohCpRrAl/UNgFbUhdqI7O0bD1uzk8sDi2AW4rQNzT4HLITTyQKmklwPF5+WbtzLFmDPIry77mFjgjS5tpv6RAzRzY1a0AhHGMhuBLKVhVKzSf7oYFEUMh1vkd3hGiINCDEy1laUYIJK74lB/X71QZkbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZfwOCqU/DUqKbAanz03CCb0i/n6p0j33+DkdSKBXTA=;
 b=P7oBx0QEeOEk4/Ht+wbBhbSBwleuoRHI/JjzeHVIqEpBDE81DskD1wajHUfHtFQb/6WOXdv4165M+SBjByOwJHWexx4mrTAWY4rTdYLW0v8xHaNI9LbsF3Nzfx5bQWUsTzSxCHRWXsPW0G79mi9NdUPL6j4RJacIeDGVSuYe22smpXRozaT8IWyvQsPTNWsUMUBbLo9HxZihH2/PY23uMmbpNQmceOaaAZfagpou9jKbTwnhFixPPqyfBl4PVc4phnJRTIedGr3uu+cUKmt5IP1jXoElMpAMyn/KGEikws8XZRTAqtkhTWUYrqPi3f4R6EOtQGb76p4hvTL2bshRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SA0PR11MB4526.namprd11.prod.outlook.com (2603:10b6:806:96::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 16:47:45 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%6]) with mapi id 15.20.9052.023; Thu, 28 Aug 2025
 16:47:45 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Topic: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
Thread-Index: AQHcFmVGcYtU1C7UH0eXHzfZLVFO37R4KhUAgAAc1jA=
Date: Thu, 28 Aug 2025 16:47:45 +0000
Message-ID: <MW4PR11MB715145027D1B8271642E3C48E43BA@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20250826084133.897768-1-nishit.sharma@intel.com>
 <20250826084133.897768-3-nishit.sharma@intel.com>
 <BL1PR11MB5525B2D062096D41912C21F5843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5525B2D062096D41912C21F5843BA@BL1PR11MB5525.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|SA0PR11MB4526:EE_
x-ms-office365-filtering-correlation-id: f0fea873-ae37-4e24-ba0c-08dde6529d1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1Vnk6HtR3hKGDSxZ1WLmec+dSCSz5GMTxkBHTFxwYJHnx61XKvLjBYzrvWud?=
 =?us-ascii?Q?UhZUq9G1xsSOhdXMaCd0sQSUmZc/Xmd0U4JCo3TvkeoGlJDGjtTUBsoEAx1u?=
 =?us-ascii?Q?h96tJxy+ceMBted5PFl9qVbKSdcBC0SOOU1VAxy6jJRfX3RIFsJaDpUtDfgR?=
 =?us-ascii?Q?xHYFkKbmIxJqD0LcofKQttZz1eqFtBm68cvEQxoAxJQUUcaASdxN6m/5IPxd?=
 =?us-ascii?Q?q7YoKcjSavi0+g2wCTuXf9fV03DtVP2d3xLrhFlkBtVx6MbVTCHep8RcGcRe?=
 =?us-ascii?Q?YwCMhr2iv/tygR73htL0oN8CxO5CN2r+yv/caXOp2F47gPCfs4XlVZKXF4ml?=
 =?us-ascii?Q?6ZLCkJAFlLz1AExVEs1RqoZwTVpe9OsOOvryvfFf6/TZL8ibDM0Fz74/FWaI?=
 =?us-ascii?Q?JPCTu/XNS4LYUUJ4SD7VOEH99P+4YBzYT3wClEv1HuJEMwO9+eFMREar1V0f?=
 =?us-ascii?Q?ZXTyfQSQ0uCyRhvURhG3IetlteSRnCzDpgUjorj5L5YDrsUgYE78WDyjnfPQ?=
 =?us-ascii?Q?Gg+2U1uiB/UVGqx1ZdJUvT1KcML7hZaUV+F4/KunAUciRkt+OXRfyxYtVw4y?=
 =?us-ascii?Q?vVys92EpWjMzlRi/GdyjlLy2NMXZlfGp3pE8sLYHFgHE0Yg8ml5DeLliNxhS?=
 =?us-ascii?Q?oQ7Nw19A+GPT8HjTCf6R1BJwuvk7ucf0djz94KwN3lAyppF9QW/dTM1ZW7H1?=
 =?us-ascii?Q?4Dq8h9eCcGZuKQfl5YISZUerR1DnHh+5ytbj/kl7tirFKtNYOZ9d2cHDThU6?=
 =?us-ascii?Q?h3DASW61ERsO4HKCo+DjejwV4dO0CoqRF8KDL1p9hds3icwpBhkUA9b4RK0z?=
 =?us-ascii?Q?OMsp2K92FtpMdfZp3XwKWDEh+SODsk24eXIKiCLYMefEgdIb6E3y7xpPREVA?=
 =?us-ascii?Q?Q3ZLBI3uIMnjLIPKHxB8nfnaYuNMEa8utip51rwBbNMQpN3E0/E5CR6VRn1D?=
 =?us-ascii?Q?X/kMgG9QIWvVOP9fKxBUW0LB1/UCtIBN/qNT2uNGPfG12x8+tablideKomgP?=
 =?us-ascii?Q?KY6V7R8mE5t52WjtzEZw+hj+PCBtB/qNqGNDdKud3RqX8xrTYxG/XzmAdv3C?=
 =?us-ascii?Q?o8EQAyvG6+ZZY0ubsZfWFZUVl6LzUx2OmBTzkIgR5zy4m+81ZJi3GkAF0VSH?=
 =?us-ascii?Q?7L/+2Fi92E3P0VLs7gPf+l9Cs5gK5Jvs/lQ+nAraIbFUpbs1cM7zV97gnFAx?=
 =?us-ascii?Q?hFsVdhaceF2J6Q9RVvvHwAPGedsaTFg5OBanlnnQxoT2W6zeUQEEov2fPEpD?=
 =?us-ascii?Q?dYceW282Nmyyg9KsAy9EXOvUbbi1Ky9pxRGMZniJtTtpq9dbP9ATicSNahk6?=
 =?us-ascii?Q?wjpfT17Fh29aFjSuuQVGJ4doC+GetNCM5R+bNPrmCqmJAQtqLqDd7Ra9ZS3i?=
 =?us-ascii?Q?u8y2B6jzhdfyxcZn/UZzOMVes2LadLvyNPcu0d5qM4w4E16lR/GeuU5qY8i/?=
 =?us-ascii?Q?1HNDhRH1o1QckoxfmfQIs6elODbFfPOzIGooV6HvRyYoXAyaZiTXmg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0iU/9ITyho56H0ZA7BCh7mjy4I7Fe/MEQMD1DsjjXzeJ4jMZttpYVlCY2eKS?=
 =?us-ascii?Q?C8mxkN7AgmY/9zn3MGhjaK5phxZRb36gh3Bs7hF22RAMgMt92HDPYEjK/CiZ?=
 =?us-ascii?Q?mwZIwZTxBMtEWxVzmBaWhAELKkamdT1hoOTzgqsOeqKUmbOpwZJ1qmMkSEUT?=
 =?us-ascii?Q?143HT4pY6sRcY3diwCZLaZ3QI9OYvF0jtkFUmIiHu4e85YD7Fx/SEZPhHTEN?=
 =?us-ascii?Q?o0yU6EuNmY+eNnkZ1XsF+thf6upoj3KdjQf0UdT0PILjMlyKTVQso7BM4tx0?=
 =?us-ascii?Q?BQj6GlPQYH7u+GjdSCu0rz9eF0a8RgUKhfYM4AROnQMt32QOhT4jMtJNSP/2?=
 =?us-ascii?Q?Nyie4kWlVtn3QSeFqx8tvjIrNcOXMaHg8uYoSTnEZiBOV4sJF1sfnp2nmVgo?=
 =?us-ascii?Q?ZymZaudOqGnS+TvkAR74HaWYPr8XVh5cUOF+b3GlRf+UwS0xNQOIQk+fwSOz?=
 =?us-ascii?Q?OVo04M8yTMM2KTjUt3nZM4Zq8OVbFU9e9v02SY6H98DzuJXVR59V6hbF7jqy?=
 =?us-ascii?Q?x/XKsYfWwG9LiGUSbtoQHSdrdtRI9CLGMoTWg4WP3LGHQLA31lU3BTCKq0c9?=
 =?us-ascii?Q?YvZOk8idfcWdw4d99VDmCxK9AU4PKOeO8GoRaWI6cnXjBx83zfRyhDYLob0w?=
 =?us-ascii?Q?bIIHw/b6kpxlbHMhzdcrk9WZQeSJEG5WP0O8JOAVTntfUGqLXHUABDEuQiE7?=
 =?us-ascii?Q?T5AS6nGw83ocohvqVYBwqDBpMHO1WzIcPDLaNNUxDenQuhw0/SCTCr5alanK?=
 =?us-ascii?Q?ibYelk3NPiC2zYGW4d/o8k6cVWzFZyxYdNEFuAGumqPm0aOyEVZkJGWAJ8AZ?=
 =?us-ascii?Q?o+BZo5BB7pdjNn9ONvh+DBi4YPRQNzxSJkBZupmJ+E7dDCMe3lqAesKVjPrY?=
 =?us-ascii?Q?gNmsSlwmMLdb6X1DgorGvmJz/BxMSpOd8dfYdLVxYKV51Ff3e83CxHEXBxaH?=
 =?us-ascii?Q?2o4i4M4+9YknTmF6L58UlgI69pgPYTDzixCDVGFZyKbvIHLreCwKYJ+in39q?=
 =?us-ascii?Q?OVXjiufl+XSmnMbAgWdCkYRp9Pz4YjV5uBHOya9mgsCTEEjBuHoWejvrYzIQ?=
 =?us-ascii?Q?IOqgFD/tdtP+wbO0rPnyiOMYejt/Z5QLVf8LZzlca/ulI2zuMTqqZIWhkhFI?=
 =?us-ascii?Q?h+1UMcJ3SUbNAlcfKAZibZ6Ipp71PKwp/9SDo0qXl4yzd3PpbpzO3itXIKHo?=
 =?us-ascii?Q?iqUGYnYW9BzpDxLCTFjyVO2xb0Z2w/9EsIDBWe3lkUxDTGJLR/fahIg93vUp?=
 =?us-ascii?Q?jxYPCNQfQzYmHnU7yLwPuQLRQHOPFjwbF6cWADxKdvCPtNCxMHIl2sKlN+S4?=
 =?us-ascii?Q?6mMsMZhgemNO9zY/OAWfEQqRe87MJLYE4TB0sWzKUnyYaVGYbU9lSMVyOAvo?=
 =?us-ascii?Q?7X4H6O3nIkf7hUF8WkDItLCb8Vswo1cB1VSySe0tnrit8geOkUDjzek0QVTs?=
 =?us-ascii?Q?lLRxTSozb4OwyBSxrBmwN0PTjJbZfhk7G5C8lE0s1Dje0hUQ8S2dbftaei5e?=
 =?us-ascii?Q?5GE0u3waX0Xl2QDtfyTuNxKQOHZC8zMzte8JNxi82C7UIo7LtfPgkQ24dKYG?=
 =?us-ascii?Q?Mk7BCuMURxJ4hofZ+QzlSf6X3pveCbxyJ4ZRmB1z?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0fea873-ae37-4e24-ba0c-08dde6529d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2025 16:47:45.3937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3hVPP+SKcTmFiy3PXNgSYTYhDQc77+UNi4LpbYmC5K96Kzpj0Z+sF6hAjWAQ8Ex3ZQvBQJ+yodn8DNlTff0PqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
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
From: Gurram, Pravalika <pravalika.gurram@intel.com>=20
Sent: Thursday, August 28, 2025 8:23 PM
To: Sharma, Nishit <nishit.sharma@intel.com>; igt-dev@lists.freedesktop.org=
; Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew =
<matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
Cc: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
> nishit.sharma@intel.com
> Sent: Tuesday, August 26, 2025 2:12 PM
> To: igt-dev@lists.freedesktop.org; Ghimiray, Himal Prasad=20
> <himal.prasad.ghimiray@intel.com>; Brost, Matthew=20
> <matthew.brost@intel.com>; Sharma, Nishit <nishit.sharma@intel.com>
> Subject: [PATCH i-g-t 2/5] lib/xe: Added xe_vm_madvise ioctl support
>=20
Use ] lib/xe:  Add xe_vm_madvise ioctl=20

> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> Added xe_vm_madvise() which issues madvise ioctl DRM_IOCTL_XE_MADVISE=20
> for VM region advising the driver about expected usage or memory=20
> policy for specified address range. MADVISE ioctl requires pointer to=20
> drm_xe_madvise structure as one of the inputs. Depending upon type of=20
> madvise operation like Atomic, Preferred LOC or PAT required members=20
> of drm_xe_madvise structure are initialized and passed in MADVISE=20
> ioctl.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  lib/xe/xe_ioctl.c | 56
> +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h |  5 ++++-
>  2 files changed, 60 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index=20
> 1e95af409..43bad8452
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -585,3 +585,59 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr,=20
> uint64_t value,
>  	igt_assert_eq(__xe_wait_ufence(fd, addr, value, exec_queue,=20
> &timeout), 0);
>  	return timeout;
>  }
> +
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t
> policy) {
> +	struct drm_xe_madvise madvise =3D {};
> +
> +	madvise.extensions =3D ext;
> +	madvise.vm_id =3D vm;
> +	madvise.start =3D addr;
> +	madvise.range =3D range;
> +
> +	if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_ATOMIC) {
> +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_ATOMIC;
> +		madvise.atomic.val =3D op_val;
> +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC) {
> +		madvise.type =3D
> DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC;
> +		madvise.preferred_mem_loc.devmem_fd =3D op_val;
> +		madvise.preferred_mem_loc.migration_policy =3D policy;
> +		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D
> %d\n",
> +			  madvise.preferred_mem_loc.devmem_fd);
> +	} else if (type =3D=3D DRM_XE_MEM_RANGE_ATTR_PAT) {
> +		madvise.type =3D DRM_XE_MEM_RANGE_ATTR_PAT;
> +		madvise.pat_index.val =3D op_val;
> +	} else {
> +		igt_warn("Unknown attribute\n");
> +		return -EINVAL;
> +	}
> +
Uses a switch for clarity and extensibility=09
Initialize the struct with designated initializers. "Please refer ___xe_vm_=
bind"
__xe_vm_bind initializes struct drm_xe_vm_bind and struct drm_xe_vm_bind do=
esn't deal with different type of attributes
The struct drm_xe_madvise have different type of attributes like preferred =
loc, atomic hence have different members. So structure
Member initialization is different in this case
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
> + * @op_val: fd/atomic value/pat index, depending upon type of=20
> +operation
> + * @policy: Page migration policy
> + *
> + * Function initializes different members of struct drm_xe_madvise=20
> +and calls
> + * MADVISE IOCTL .
> + *
> + * Returns 0 if success and asserts otherwise.
> + */
> +int xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> +		  uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy)
> {
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type,
> op_val, policy), 0);
> +	return 0;
> +}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index=20
> 6302d1a7d..a5996cf65
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -99,5 +99,8 @@ int __xe_wait_ufence(int fd, uint64_t *addr,=20
> uint64_t value,
>  		     uint32_t exec_queue, int64_t *timeout);  int64_t=20
> xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
>  		       uint32_t exec_queue, int64_t timeout);
> -
> +int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t=20
> +range,
> uint64_t ext,
> +		    uint32_t type, uint32_t op_val, uint16_t policy);

Both functions currently use the same parameters. Are there plans to modify=
 __xe_vm_madvise in the future?
If not, is there a reason to maintain two separate functions with same  arg=
uments?
Idea was to follow calling conventions as other function. E.g xe_vm_bind_as=
ync() and also ioctl is called from different
Function for better readability.

--Pravalika
int
> +xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,=20
> +uint64_t
> ext,
> +		  uint32_t type, uint32_t op_val, uint16_t policy);
>  #endif /* XE_IOCTL_H */
> --
> 2.43.0

