Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503A1E77173
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 05:46:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10A3B10E31F;
	Fri,  6 Dec 2024 05:46:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTPg/AZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EAA10E1EE
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 05:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733464005; x=1765000005;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WCAfpDZziNQWgTMaVkZ6aK4xbiOUWjzfiEbEeJ5LDhQ=;
 b=CTPg/AZiDqL9hAP0S3Go0kCldyCL90AjZebMHxwvraz3bucqdhDk3UYo
 IZSx/sw8FO3UpzDGhQQo+vssKmYLWuPnhV3TQ3sdJE/mQoV4w2Lw/YCmj
 10q2ByCBq5iUWYqfl8Y8hZvwfJIxiTj80KRZI/Bv+bidZYYkjucNGwpzb
 bIpAvqImhrIR0KtgOVlrFCguuILFDGlL43GKTdJzu8W0q/w4eyRHxT0sd
 avMN4SPGEYa8ofKMdWNAyFw9vrlAeL8eT1pYBdnfGXvcAdzHxJdqInhv9
 2KT5RmPd7gdF88A0TZyV/PoUpsQHCaIC4TyLlTZEG+zMDKuE6p/QHuQF+ Q==;
X-CSE-ConnectionGUID: 1baahGQlRgG5bqfivgAXSQ==
X-CSE-MsgGUID: Oed8Cd5NSACWmBE+0Dssbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33955539"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="33955539"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 21:46:45 -0800
X-CSE-ConnectionGUID: QghIJUJ0SXSh5I+z7o7YmQ==
X-CSE-MsgGUID: g4R04iFMRBKbcUkzgBTCWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; d="scan'208";a="94790248"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 21:46:45 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 21:46:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 21:46:44 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 21:46:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C3W9qVpLZmw2ewkH7kPqBDn1LwLoNGN6MMgJQ/6VIf45hoxhSbxHUTLuKJ9rAktv8aBoZ3us6VhW9l5t+AHhiqp2nPjerhDZEy/BoYJLPzSfqEVmvhthfohtH4RB2Fq4tYlJ01g0ZjVenmkoVulPsEB/C7Hf7mPgdKXUktH2r0sQ/1CvHhLiOTastw5JTwmZJHdYKc4CK8B9X2UADeoksgYU/NepLG/BpH/Jw+aP+9gBouMyMxx8Hxq3OcT3ziAjfqrZRZySeWeJVm8NLoXT+1Z+7vyDD4Q8Bfqebga6/CURJZl72i46ww/TAPyUZP9sEpjdzAX5btF6WcOndTBy4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e3fWSFz4aj6xgGzTKl18IiLxfFjTtE4TfDOlKfDjC0Q=;
 b=rJ1AsDFKUhtOjQ+35kwJoRCqzp6OMNAtvs8Ysj9qto0/HJBX7zzlU20yrIkMZK+Tzng8utkRREVjHSXfSVB5r8Tlr28eqZT++SrAkNHhvYeNO094gGdvNpcal1h96YQnUJLQnoHXbbsWoRV1CqisMiNisQSI+FkowgD94Ohu3brcSvOkoaPpgnmsK9a6aHUYsYOmOZcqFGcjnSCevS0F5e7vzLaHWd1DINIPtFbDTEveI2Ik6TxpAb+Pv2eMl0SfczLbp75yYBNRMSwvxjeyEcKTPiuYmglANkwSDGjNDggbdgijqPzu8sVXOFMliPZsZTUaWylehytMByVoy4ZiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB5327.namprd11.prod.outlook.com (2603:10b6:5:392::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Fri, 6 Dec
 2024 05:46:36 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8230.010; Fri, 6 Dec 2024
 05:46:35 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
Subject: RE: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Topic: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Restore
 preempt timeout
Thread-Index: AQHbRps2NzRtZGKB3EyGLIlzhavVtrLXj4yQgAA0vICAAPGZ0A==
Date: Fri, 6 Dec 2024 05:46:35 +0000
Message-ID: <SJ1PR11MB6204CE919D92698A170721F481312@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241204222347.108788-1-jonathan.cavitt@intel.com>
 <20241204222347.108788-4-jonathan.cavitt@intel.com>
 <SJ1PR11MB62043338AF6E4A908816FA3B81302@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <CH0PR11MB5444A776470662813100144EE5302@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444A776470662813100144EE5302@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB5327:EE_
x-ms-office365-filtering-correlation-id: 74a48ca7-5020-4be2-496a-08dd15b9588b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nCcBHZRnRlZ/GQLS1U10F2rdTqy3dG6g/8t6kgh6/yITwMjCjwgGLfXN51bx?=
 =?us-ascii?Q?62TG7LkSR83uW9kRKaNh1EQhsPBuraO3bV59kWlvYWUElArj/cE9m232JNCK?=
 =?us-ascii?Q?yvylsLx1yK71eoU2OB/rX89/u/cJPW/CpYq0NR5LpzyCB7WhxQYBWC4Dh+/t?=
 =?us-ascii?Q?mYgsi5QLDugTFA8Qv/4reKfq46kLzWQfW1hQD4lprRcepigkyRYyF1kgb21w?=
 =?us-ascii?Q?z66yQ9+L5EXHcChrYsFfEx5I73SWiRH0nvVeYBhJ/B/1HPXSWzHk9OXP7VJl?=
 =?us-ascii?Q?SFcAceTQI8RmHI0RQZoWMiEjhkxh2M5bpSNGMECXGJJX6ixCRSGZhifggeNY?=
 =?us-ascii?Q?/0Ja14ky2Jk9a/FKlBNbEbOWczJImHGmndALmODW4MbLF3cFFVKl8kisP+kz?=
 =?us-ascii?Q?JxEQFbpKFCWPP8NRvzO/YGgSrVuQeLc3+Q8Q3flf4UsOQmV5IoF9SUwVWSx6?=
 =?us-ascii?Q?yqmkn+zjsjY0sLnk6RNu+Ti0KMMIw+dp0nrVPr2EsjwMbY+fNYSCfIxcDIrh?=
 =?us-ascii?Q?zI8VC5wa4kVPBs5mSLVHRbFXDMWsRsfaoheBEkEUfK77Sug6PDK8sQJIQLpg?=
 =?us-ascii?Q?ja/X4QEjLw7V2v1kOX2UO/+0pmWXiguyN4b0f7BuPewzTg0yz+bT4iUKFOpS?=
 =?us-ascii?Q?An8r0wq0ZMx28HqBiEXDu3ZgF1NZ+yWTxjsBm+AchBvKTNy+aiC20v+C/REq?=
 =?us-ascii?Q?7Ee2xpsuQIfEy0At7g/HP8by1l/TsmhgsfU/teCvmJ+O+07nO0u0cwWeZ2MO?=
 =?us-ascii?Q?L2eoB3c00NqvvJXb40GZ5/YDCWx1YAovh2S+F3D4yWhF4M3keC9YaHQOEFVC?=
 =?us-ascii?Q?KvzYo61sFeTgPwMF66tHnXaTi9N5mh4IsEY3pJ8vNHcF4r2EwPILptoAUKAq?=
 =?us-ascii?Q?a10tN+O20oKX3XWnIqe5fVf+sarhTq42/FxDnDL4T1Xv7RIpCi2fTWoroWDY?=
 =?us-ascii?Q?bXfYwr4Y+ETYm0+xcNLXE3fJ10tInotaV/3zX8mFaCxQmm8QCmKoIMAg96pM?=
 =?us-ascii?Q?tgYWwUlyYzNupBIQMG6JbDeTHjLDHNQT2UxLtKG0Aodm7JzjhT5mNJBUMh5y?=
 =?us-ascii?Q?a/Xt1DOnVk8RGU2Sa/pyKjHqqLYND/4DtKrdkVTfVx/XOMPCVA1Tgks5U2At?=
 =?us-ascii?Q?mEwqQ748lZZG5JC8xS72JykIFbb08sxQboCjd0VZ44Ay/WQnRHO0CBxocAZQ?=
 =?us-ascii?Q?Q79HQvjzA7KcNFpIKvdLbyQu6fCmDfTwTp7rTzLVi1hleOC3+tL/xsDc38FX?=
 =?us-ascii?Q?7+TKwXPWItkTIZlt3QatNDAArNhRhQfAwpfe2vcdRC9SRR91IfoSPQJJu/Ji?=
 =?us-ascii?Q?3fgaUFT45eKp6hFULegOSeK/w2e4L8ssUx9lo1B/D3hzRQCsKPlZyqEsceeE?=
 =?us-ascii?Q?fu3G7Ek=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pgoe9rdwjUkt6agn4HL4n62k4fWy65fZup8GXBsep0RhcCyj2yPKs+eudZiG?=
 =?us-ascii?Q?KxrNsynUiufVo7aTpg9TfgOoNtZDJJdGkpgatc/maL0whrbabocxc+JPzRrV?=
 =?us-ascii?Q?IoCpcVk2oaEZoDiY7ABi/jVrsHkxxVGQhQiqFqe8elb2ecQN5RNv0EXdUXW3?=
 =?us-ascii?Q?AFqrgZgDLhQe7HDQiXkf4Dl/GRVZH2ySO/FPQ7yO904GibroOxKL/I2oQ92A?=
 =?us-ascii?Q?xEhpwzyCgN0gQmATmjE1mpdfv6qPPrGVNhXV8uuXSZb1s/QHvI5iEpGfef3w?=
 =?us-ascii?Q?1ZkQRDCQG4g/lADyT17C7AkaM+1B1mFRFKWN6b3h+jlB+xWvqZweHZ0WFRtv?=
 =?us-ascii?Q?GF8/Cl4hAjBpZTalvSjhbm2n9uBNrrO+fUkqcQMjaLNSJ5RWyR0F9WexGn3f?=
 =?us-ascii?Q?PmM6umYxZqoKxv+eDeAY0zVZj00Ney81jb3RVjGd/R8W2a5XJS8bXKLyup4z?=
 =?us-ascii?Q?XdZsGSDcL6YJjKzQSc9FYMjxs6bExGjqf/kQMW/HAtUW8gPqz+TnLdzJRDsy?=
 =?us-ascii?Q?6WRhWRFJKbSKcwNnEWqHdPw3qfv0Kx0Bk+wDbQloG84jWbbwYf3aW7x/ipGT?=
 =?us-ascii?Q?0YSqRpiy/fLJjSfzgoEvUqT0KnjD0QmM1wL5Jpdj1UnpW69bazCjyINw/9Ep?=
 =?us-ascii?Q?PXxr8tFd2ccOO63IIXxAvji4cbYRkSxmv0NIfF15A8Qw2aL8Eebl8O544jyV?=
 =?us-ascii?Q?EhN21gp4zLPdDK9P5dD5pUihDiTj2d1GvMJO7SnK3SbnFUHl/4HsPibpZjIv?=
 =?us-ascii?Q?XEXtclTaTCkCwTpjEj0TtOAk3BH0PfNubbs/ugQDAEjibK1gBClrPCLjVp+M?=
 =?us-ascii?Q?jGg5+Yvny6/eECIs33WElOhQd/Fl+SFVLcZsXYONs+90yyT9pimKT5N4meMv?=
 =?us-ascii?Q?h513VWm4Rv611WFVHDhaUShfdjl4EHjlYL/G6zoWshqG/NBlas2r9pShJE5j?=
 =?us-ascii?Q?zrv7e0yig6e3CFtY0RSzC/PfGxcqXdS+88IUrF0940DFO1+aKns3kgBcvEMG?=
 =?us-ascii?Q?ytF2x7Z86hAqUlKDzTvSfhgXgMIrpWMrCBD50gPWXpj/OjR/UyIbOQCqed47?=
 =?us-ascii?Q?M5ndMx+XYmpHNFa5N+X79DK0T74bWFk2VXtiTMejURaEViFOZcwoSJUwLS1Y?=
 =?us-ascii?Q?59sGTZBdqdtQP277Y/cyjVg3kjO+DRcGkp4YAZgMpMqrxN1tCahxYFpNWMFz?=
 =?us-ascii?Q?pY/87o4fihiv7PqkPdCPUucGSexoyPXFkYnWavkkC+Q64blDF8oaX3bPvUJb?=
 =?us-ascii?Q?qFrgMAg35S5b3CmQ8OYUtpqKUNbgEy2jzLqASDYwruc694noZ+4F++EO7phG?=
 =?us-ascii?Q?yOa2B1gV2g1FSYYJLe6v2VULPUBQSvOhgqnFx1g3VfHIzSobT5f+L6+aYbud?=
 =?us-ascii?Q?4IyT5d5YIAIuxtIjZ57/fMYYO1UMG/tM5nFQzzZxCf5Fc9hf8uvnz/TrTRZJ?=
 =?us-ascii?Q?s8fRsxuu/7OdYjTn1YmKEwGUmC3YWaKeMA7XGWrp8OZsNjDed9PBgV8HaXnr?=
 =?us-ascii?Q?3PDZ5m+sV8L58vQG7bvhEzF7y3r8Gb3GdzED80V5dlZIVG1z3yFuE+zbRxrQ?=
 =?us-ascii?Q?aKKC3QERfNWKxTLdQKKDhOvnrJjtW+KnhcBxBb+V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a48ca7-5020-4be2-496a-08dd15b9588b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2024 05:46:35.4550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBlMe/4q55+ohW0sdlLNIqsrCmuRzFM8waeYoD/+kMJhR1cU+R957U461tHf9OmvrQe1hQxwa7+/JkBKsz7yEyIbZNCmXjkp/LIn7DUxiOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5327
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
> From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Sent: Thursday, December 5, 2024 8:47 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex
> <alex.zuo@intel.com>; kamil.konieczny@linux.intel.com; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>
> Subject: RE: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Res=
tore
> preempt timeout
>=20
> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Thursday, December 5, 2024 4:15 AM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; igt-
> dev@lists.freedesktop.org; Brost, Matthew <matthew.brost@intel.com>
> Cc: Gupta, saurabhg <saurabhg.gupta@intel.com>; Zuo, Alex
> <alex.zuo@intel.com>; kamil.konieczny@linux.intel.com; Belgaumkar, Vinay
> <vinay.belgaumkar@intel.com>
> Subject: RE: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration: Res=
tore
> preempt timeout
> > > -----Original Message-----
> > > From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> > > Sent: Thursday, December 5, 2024 3:54 AM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg
> > > <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>;
> > > kamil.konieczny@linux.intel.com; Belgaumkar, Vinay
> > > <vinay.belgaumkar@intel.com>; Upadhyay, Tejas
> > > <tejas.upadhyay@intel.com>
> > > Subject: [PATCH v10 3/4] tests/intel/xe_sysfs_timeslice_duration:
> > > Restore preempt timeout
> > >
> > > The subtests of sysfs_timeslice_duration modify the
> > > preempt_timeout_us and timeslice_duration_us values.  However, while
> > > the test does restore the timeslice_duration_us value at the end of
> > > execution, it does not do the same for preempt_timeout_us.  Because
> > > the value is not properly restored, future tests can end up using
> > > the unexpected preempt timeout value and thus have unexpected
> behavior.
> > >
> > > Save and restore the preempt_timeout_us value during the test.
> > >
> > > This fix does not apply to xe_sysfs_preempt_timeout because only the
> > > preempt_timeout_us is modified during those tests, and the value is
> > > correcty restored before the tests end.
> > >
> > > v2: Also restore preempt_timeout_us on test failure (Kamil)
> >
> > Restoring timeouts after test looks ok here, you can add my r-o-b for t=
hat.
> But if there is value already set via sysfs manually which is not default=
 values
> then we still have chance to hit the issues we are fixing here. I have te=
sted this
> manually what I am talking here.
> >
> > I think restoring or setting up these timeout values to default before =
other igt
> tests like igt@xe_vm@bind-execqueues-independent is very important or els=
e
> low values of these timeout set manually via sysfs (echo value > timeout)
> might fail the test.
> >
> > Although I am not very sure storing restoring timeout values should be
> based on default values or not. @Brost, Matthew any input here?
>=20
> Do any other tests change these sysfs parameters?  Because if not, the
> restored value and the default value should be the same when running IGT.
>=20
> As for the manual case, where user changes may occur before testing, it
> should be in our best interest to restore any user settings we change dur=
ing
> testing.

I had thought on this again, two cases here :
1. User manually changes on their local systems, and subsequent time sensit=
ive tests are failing, we should be ok, user should also expect same. We ar=
e good.
2. CI has manual change in these timeouts through sysfs (echo), test will f=
ail. Changing manually on CI should not be allowed (through any IGT test is=
 fine) or if manual change is done failures should not be reported. Then we=
 are good here  as well.

Overall it looks good here with above expectations,=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>=20

Tejas
> -Jonathan Cavitt
>=20
> >
> > Tejas
> > >
> > > v3: Abort on restore failure (Kamil)
> > >
> > > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2976
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> > > CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > ---
> > >  tests/intel/xe_sysfs_timeslice_duration.c | 19 +++++++++++++++++--
> > >  1 file changed, 17 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/intel/xe_sysfs_timeslice_duration.c
> > > b/tests/intel/xe_sysfs_timeslice_duration.c
> > > index 899093a9df..752672691f 100644
> > > --- a/tests/intel/xe_sysfs_timeslice_duration.c
> > > +++ b/tests/intel/xe_sysfs_timeslice_duration.c
> > > @@ -115,10 +115,11 @@ static uint64_t __test_timeout(int fd, int
> > > engine, unsigned int timeout, uint16_  static void test_timeout(int
> > > fd, int engine, const char **property, uint16_t class, int gt)  {
> > >  	uint64_t delays[] =3D { 1000, 50000, 100000, 500000 };
> > > -	unsigned int saved;
> > > +	unsigned int saved, old_pt;
> > >  	uint64_t elapsed;
> > >  	uint64_t epsilon;
> > >
> > > +	igt_assert(igt_sysfs_scanf(engine, "preempt_timeout_us", "%u",
> > > +&old_pt) =3D=3D 1);
> > >  	igt_require(igt_sysfs_printf(engine, "preempt_timeout_us", "%u",
> > > 1) =3D=3D 1);
> > >  	igt_assert(igt_sysfs_scanf(engine, property[0], "%u", &saved) =3D=
=3D 1);
> > >  	igt_debug("Initial %s:%u\n", property[0], saved); @@ -140,6 +141,9
> > > @@ static void test_timeout(int fd, int engine, const char
> > > **property, uint16_t cla
> > >  	}
> > >
> > >  	set_timeslice_duration(engine, saved);
> > > +	igt_assert_lte(0, igt_sysfs_printf(engine, "preempt_timeout_us",
> > > "%u", old_pt));
> > > +	igt_sysfs_scanf(engine, "preempt_timeout_us", "%u", &saved);
> > > +	igt_assert_eq(saved, old_pt);
> > >  }
> > >
> > >  #define	MAX_GTS	8
> > > @@ -159,6 +163,7 @@ igt_main
> > >  	int gt_count =3D 0;
> > >  	int fd =3D -1, sys_fd, gt;
> > >  	int engines_fd[MAX_GTS], gt_fd[MAX_GTS];
> > > +	unsigned int pts[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
> > >  	unsigned int tds[MAX_GTS][XE_MAX_ENGINE_INSTANCE];
> > >  	int *engine_list[MAX_GTS];
> > >
> > > @@ -184,6 +189,8 @@ igt_main
> > >  			while (list[i] !=3D -1) {
> > >  				igt_require(igt_sysfs_scanf(list[i],
> > > "timeslice_duration_us", "%u",
> > >  							    &tds[gt_count][i])
> > > =3D=3D 1);
> > > +				igt_require(igt_sysfs_scanf(list[i],
> > > "preempt_timeout_us", "%u",
> > > +							    &pts[gt_count][i])
> > > =3D=3D 1);
> > >  				i++;
> > >  			}
> > >
> > > @@ -215,8 +222,16 @@ igt_main
> > >  			while (list[j] !=3D -1) {
> > >  				unsigned int store =3D UINT_MAX;
> > >
> > > +				igt_sysfs_printf(list[j], "preempt_timeout_us",
> > > +						 "%u", pts[i][j]);
> > > +				igt_sysfs_scanf(list[j], "preempt_timeout_us",
> > > +						"%u", &store);
> > > +				igt_abort_on_f(store !=3D pts[i][j],
> > > +					       "preempt_timeout_us not
> > > restored!\n");
> > > +
> > > +				store =3D UINT_MAX;
> > >  				igt_sysfs_printf(list[j],
> > > "timeslice_duration_us",
> > > -						"%u", tds[i][j]);
> > > +						 "%u", tds[i][j]);
> > >  				igt_sysfs_scanf(list[j],
> > > "timeslice_duration_us",
> > >  						"%u", &store);
> > >  				igt_abort_on_f(store !=3D tds[i][j],
> > > --
> > > 2.43.0
> >
> >
