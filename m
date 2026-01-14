Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BD7D31A0F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:40:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A256C10E1C0;
	Wed, 14 Jan 2026 06:40:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI1owZah";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F2610E1C0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372805; x=1799908805;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yZP8gS2Z7LFRhohJluxKu9Dl259JKqIQ9DpphejmhNw=;
 b=gI1owZah7MmcPutDHB+Ug+a1ApPj6Va+CMxWdzeX4aSHfuXH9mqCGpl6
 z/zylEHwJ7VWO21dN2MXcJmvvm+1hnEJlGepyCFteTgbp3hqLEi/FpszZ
 yHBxqjxLaivW5JaM1dWaTlPox4Ho5x2l4Bv19HXiFIWZoVxJgAkl2lmAy
 V4tGvq9mDjarMKsHbKBzvrOzRZmh57k3w+ZvNZtdJoPJqk+Jog2KpVv5o
 z5yt/igqyEfkDVDxu8fWT9eUgxUMl2XgAogaN8reSgr2m1nMbvW/nPuw+
 cUGINX+qqsejBCT2dEvVS6ZTx+fR+lslWpdbWqA9ab7pEG38pQAMSnn1y A==;
X-CSE-ConnectionGUID: hVNsRCi3SuapRsKPVYCxyQ==
X-CSE-MsgGUID: Q13PFw2cSIKz6bOhIszkGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73505975"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="73505975"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:40:05 -0800
X-CSE-ConnectionGUID: 1H8nWtovTheNpoMYGAyzWA==
X-CSE-MsgGUID: GQniwVoFRkSWSMqxsT1pqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="204610847"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:40:05 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:40:04 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 22:40:04 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:40:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hYF7Kbn+3ZLkv80jijY+M0HyuCqOexHt9SeBP+EVQTzlMSiovSFk/xRqswPnodWDtxR99LyHITM6UORjyflr/7d1MVfvA2s+f+5G9cn9rGsst/KWRmAc7MXjuQCllsHHvbj+iUCTmzurlVjcAqoSDURlpVNuzi6GU+dVMELF7UGzTeJ7YCF08LrgFl8+aQMz2QQ8oGPXAAm5IvyckO14d1GzgqMUWgD1vdI6EC0hnMUeEEwTQlfRi0RJLebJ09zOUfxUpIgfPLtvmPP4ijcRivkrO/l7YVzJ8Duo7vabVuIOVHSE5+sfLn7MPjC/weYwfraPaAR3flP6XXGRpFbWug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NstLD3JdldyoewGXP8UdruuW1lJ0mtZeJDULHd5YN3c=;
 b=A0opuxfC536tRv1OodChB3NTZHYU1dmTGNeuG0Bh/4b70Mt0xWw/v+WBnYNwWTHfrGNFhkVJMU1XgwEDEWtbcvzaSkc9Eac14vb+lQoyu3sRpAkCEe0f6jdhQ0jkZzByNUXjipMVqs4eSUdxZ3742yNj/P+dx5H7gkg4JcJHrxp0ZwrRPxL2mEQXTcz5evyJOG5+yhYAmdbP2890z74tZuW1tYjEMZ1y/Ivhu6qeW8F7BYD2upttTGBnz1zG1KBwksRU7nwcF/NDzakZuSf47lIMWkNJ/8oPFh2DgT+idx19DSr3hf2m5UWVeZWbknP74g2UYifDyMpYMiF8SjuYeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 06:39:56 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:39:56 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 5/7] tests/intel/xe_exec_reset: Add multi queue
 subtests
Thread-Topic: [PATCH i-g-t 5/7] tests/intel/xe_exec_reset: Add multi queue
 subtests
Thread-Index: AQHccN9jQgJdPozxfEaEmn4Ks+1hh7U8yTeAgBSVS3A=
Date: Wed, 14 Jan 2026 06:39:56 +0000
Message-ID: <CH3PR11MB84345836773415AE3503C7178D8FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-6-priyanka.dandamudi@intel.com>
 <aVX1Pyb02_3hU6cp@nvishwa1-desk>
In-Reply-To: <aVX1Pyb02_3hU6cp@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: fe522d93-e32b-4411-1e78-08de5337bb85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JXEo2sjeUSCeha0UGu0o8Mu5GYKiZqoqVsqBklnF4ZXd4nfCp/hoxeqr7s6J?=
 =?us-ascii?Q?r7IGpMJ0+XA6TrAuJr5S1hs1pMd9jBXU0Ge7aRv8AJ68/8MLlAp7fv1Jws3Z?=
 =?us-ascii?Q?WvPaO2jOCTWUfazHmtNtfIl0yM6XTpgvbXe9bkmKOE7kHAyHz4Q9M6KJqlbQ?=
 =?us-ascii?Q?Gin7Z9dIxNV3n7MUfqkUMDEUKp+dMvKAbQfkrUX7G7p5JQDHKWVRDxAdo7wM?=
 =?us-ascii?Q?JrWP7V90FxVrjg1XRofwaxLovBaRlVIUHfx41FP3lsMOtC+HwUv0sBNqJiYH?=
 =?us-ascii?Q?NuKqrvSt/fB2bY2vHqpvIoC7/i+SCIm/j1q5Qm34KaIT9ICVn2vbI/wywWb3?=
 =?us-ascii?Q?6Xq6syvLkP61J6aX1ZTtxfMcV7S6j3w61XsQ4QpLqluIkAZNaTkr3427E/nB?=
 =?us-ascii?Q?pdY7jgGibiunOj11c4+Msn0hT5GoXA82L1aegH62S24EcXvklMV9jYJj43EP?=
 =?us-ascii?Q?i11bMs/8KKbKItkzGfZ5r8pogeN2eP38nX0TbFWP0FNq+SRPVbGGbmxlltKS?=
 =?us-ascii?Q?59bPFRqAg1xO1lorHXTeMnyQc2SCMqFiLEtc6B0Ff/CNaRKoxkRrqw6ah7L6?=
 =?us-ascii?Q?nPmAxJuU5qh/0hkAb9iJqQpzzR7vZuXLRnrj2TyUvu0qkhBt/kJrgON/Pdrj?=
 =?us-ascii?Q?SECVsmwEGkPhA4TjgBqbiPWdli9u1aWAOvR5gDiVXh9Bd5SKE3ZuA0LNpG0e?=
 =?us-ascii?Q?RLZMoVE8LLsdzGavi9338jyWeOz33g13Kwgw2njHn3hBztKDf8JMN3x1dYrX?=
 =?us-ascii?Q?nOLyPkv13z9FoWw29St8DMA3DxXCCSb6LT73PHDN09meGnBBs2kqQV5iKp6O?=
 =?us-ascii?Q?yTEO6/u415Jhedv76QetYgukZptm+Ve7Othyv2bVKD9oa3RKFnuBQlPej5TW?=
 =?us-ascii?Q?JO6dlHz5fDAL9tZNBW04CKjZs9b4e3j/TqYKIBp2PwHuanuaewM2NB/APBuX?=
 =?us-ascii?Q?EQrBNsqVSSj/2Joi/dpeyAMpRQmVNVK1pOLXymokwYEIEVZPQJptpdaFpPj2?=
 =?us-ascii?Q?nR5LyACAEF9zCqaIn9AP5ReeULbscr6tq/rlGFYUs96O4rD/zNIHwbExpiRz?=
 =?us-ascii?Q?TtqbkuhfOQADnTOMWtPtq/APs0o323KSug5Ll52VxK7Xl8z6fmUXyrq1zAcQ?=
 =?us-ascii?Q?kv1Y4RhsKKSRmphEB+TJxyIANkbxeEAuaGJIiotr1g5houOpr8lLv43AivaN?=
 =?us-ascii?Q?5BTcbKazOg/SlkzMqU1KgfUtLRKopWqoy9tkpg4myxJW0PkVZy4U2bxIVj9m?=
 =?us-ascii?Q?izfYOa4OACe7fFajSpWCMK02wsXfEpvAPNaLgKCEAXSg0l44hxHKZ0noOeie?=
 =?us-ascii?Q?DrCZh08sRXVKHJk+AwhX7h2HxlgTdkR7UMOiQG2TgEdivIZr5ptAtfYmYfud?=
 =?us-ascii?Q?vdsGuaWV90E3cfeZWxmn1uxhaic2tqINtadrO7RBxOPbeJkjbq+qyXaUtdwD?=
 =?us-ascii?Q?TSgzgF3/ywOc64JAZdR4oiCxo57zouw/lKqdpErU5B4HKCusUiPGjfNwL83P?=
 =?us-ascii?Q?ttMcGBSV8uFxjJzt/hsvq2h5qXy0ZT8gGst9?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8KDVQRygrV72E3wu6opjC67Gld6OmDDBmSFCd7uI9SsKBExMCC308I91kkUg?=
 =?us-ascii?Q?nX8NDNcQPbbnQDiftSLKoqFGqzXjIWqlxAelDrcubFfZocRV2WcWZcsYWHNl?=
 =?us-ascii?Q?V/aKVZsrdF6MdyA889lfTfiJMnETJgX7Og86G8Y3h+AgqtDA2GJuWvF7XZ6n?=
 =?us-ascii?Q?QOFmRUBHXtsxr0rf3JJnXI/VIVz2gvAx3VJT7PPoIDJAFDzzyjm5TaFUs7fd?=
 =?us-ascii?Q?+f+tMp/F1CNykhbQkxvlwHFHunA6xsB5X6oCISAnSvbEmvt3YMVXkeohz1N6?=
 =?us-ascii?Q?HoVunGLHjMiROPxu5sCI+JIVxtqr0wu2LJM04+51F/R+JeCCeP+zvc5T2YhO?=
 =?us-ascii?Q?a/5vPvdUYw7TvY57oSVexyjacOrpaMzTkb/UsVTZxPQ16UDC60LrwD1uPlAN?=
 =?us-ascii?Q?63gBkkGSNxDLXiOKG/OK3W/eG3x874zH3wVAAKLXB/2L8cM2/TyBINtdPMGM?=
 =?us-ascii?Q?kUQh1tF/ujXdGKu5MezSbgSsRtDwvD1ec4173EAodV/JqzTQtZAp30amX7rc?=
 =?us-ascii?Q?DgMIBeNp2G8iqHGAqebfqVEmwmUl8vJRtsLv1FfD9VS+2npsyDOydxvhEsyt?=
 =?us-ascii?Q?unSoefOg8mVAfo8yhTnUZ+nN+IX4JR1FyyIm0k+ZZgQP5qKfuS2ZQpkAHUc2?=
 =?us-ascii?Q?pyG5RoOxPbkQZj5bQefFuG3a2lkpNdsvM4qu9l6gOmBwlfU+jFP/RR9fK8Xc?=
 =?us-ascii?Q?gBAXMWqd9ZGmYj08KMWNW5uHr6s8R0e1rQyBnM+ROtb1fYxdB1XiBYYZQMXZ?=
 =?us-ascii?Q?N6FfzySw0dOwGQKMTfqrHbuMLuADxsESnpKJ+5KsdVP4WtzCmlTbfpSXh1/g?=
 =?us-ascii?Q?yYAlPTyDDOX9DITajXeWbfgzAaOH5EaGKeN3faPSXRFHJkdmyR7l+e/N71vd?=
 =?us-ascii?Q?ffLHNJ2vtYYd4fR6AxxIB3D/3yDpxH2nGTTBSaCDABmGX9mC+FuUC0lhAKhq?=
 =?us-ascii?Q?ouNfkC9F4XRDk+mm7znaJwyZt80DQFKrFYS8SCUDYopbZVi9gJuXudLEepsc?=
 =?us-ascii?Q?2ZRuiQImdgUdknT7VAfFtp/BH27NzNwf3K7rIwcZpwmgksPQMCDlqAnSaVnr?=
 =?us-ascii?Q?uR/sIfHdAjDOSlGHYZWH8NM7RErJmrKMmzzmnuN+KKRfqo2C6Zqa/biFyCIq?=
 =?us-ascii?Q?XDkMvKYyjjB/q6FMxDBpKDvowbRglg0rHBgvfNudRatpsdfJZ9fWAB/erPHa?=
 =?us-ascii?Q?7kYERb4sq/87cjFUE897DH2PaIyudVzChZk2iV1LvDtvwlOAU+BCOEc0oJTv?=
 =?us-ascii?Q?i9hUNVmdBzQVr8Phhy+P8+SyP0tsbW+/a//ift7SWh6j+zlHl+cp0fAkvLTh?=
 =?us-ascii?Q?GHbXWSGfkmOQlVthM0M0osrJwTfh2Kg8I7SNL2/bnRosQB18ChEyax66vxR7?=
 =?us-ascii?Q?ap2At6+2Px2zy2J5tvZ9Hs61YBsuNJBGc1hNsxwUFj/ItcbjKRgQi49hPib2?=
 =?us-ascii?Q?pVYeBndTmWXDs5O7TVwMyftUkYNqPCndfTU0D5ikIQaDnNziYPRpbze9H4Kk?=
 =?us-ascii?Q?xonJVoRHk+uM1JGwumXCKMEUZysqKo6VPQIfgCVT86UWEaXs18SbW27aIEMz?=
 =?us-ascii?Q?VcEEEUzWfCx+1yVClVt0R1xYZBAbqWcjm+P2lqsRySM7VKhrKZHZFJYHvk8B?=
 =?us-ascii?Q?eXdPoess8CUHC44JG+dF9Ps28f6leEmAjjPAHp4Xubm6oufpA/8uskoYirxj?=
 =?us-ascii?Q?z3uLOs3XKnRc6+H46syIQBZ2vmlSsaetQsUWvxeMTZx1un8li2zyxHrAlj1k?=
 =?us-ascii?Q?6x5pDxl3nhlGbLCRzz5iZLXkkhyvHEI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe522d93-e32b-4411-1e78-08de5337bb85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 06:39:56.7399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MPq01JUCjqH1GcsCODyaPAqe7NbcGp9G73MdCnCWJBFoTJoIlzqf1rt4jN0P9OzYnt6SxyVLbrqwoIAcks8SWKzVc1SHe+yZKJanTl8OuE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 09:47 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 5/7] tests/intel/xe_exec_reset: Add multi queue
> subtests
>=20
> On Fri, Dec 19, 2025 at 05:31:52PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Apoorva Singh <apoorva.singh@intel.com>
> >
> >Add multi queue subtests with gt reset, engine reset, close fd,
> >close-execqueues, cat-error.
> >
> >Signed-off-by: Apoorva Singh <apoorva.singh@intel.com>
> >Signed-off-by: Fei Yang <fei.yang@intel.com>
> >Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >Signed-off-by: Daniel Charles <daniel.charles@intel.com>
> >Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> >---
> > lib/xe/xe_legacy.c          |  38 +++++--
> > tests/intel/xe_exec_reset.c | 197
> ++++++++++++++++++++++++++++++++++--
> > 2 files changed, 222 insertions(+), 13 deletions(-)
> >
> >diff --git a/lib/xe/xe_legacy.c b/lib/xe/xe_legacy.c index
> >084445305..6572617fd 100644
> >--- a/lib/xe/xe_legacy.c
> >+++ b/lib/xe/xe_legacy.c
> >@@ -26,6 +26,10 @@
> > #define GT_RESET			(0x1 << 0)
> > #define MAX_N_EXECQUEUES		16
> >
> >+#define MULTI_QUEUE                     (0x1 << 20)
> >+#define ENGINE_RESET                    (0x1 << 21)
> >+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
> >+
> > /**
> >  * xe_legacy_test_mode:
> >  * @fd: file descriptor
> >@@ -69,11 +73,18 @@ xe_legacy_test_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 		.ctx_ticks =3D flags & LONG_SPIN ?
> > 			xe_spin_nsec_to_ticks(fd, 0, THREE_SEC) : 0,
> > 	};
> >-	int i, b;
> >+	int i, b, hang_exec_queue =3D n_exec_queues / 2;
> >+	int fault_position =3D 0;
> > 	int extra_execs =3D (flags & LONG_SPIN_REUSE_QUEUE) ?
> n_exec_queues :
> > 0;
> >
> > 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> >
> >+	igt_assert_f(!(flags & FAULT_ON_SECONDARY_QUEUE) || (flags &
> MULTI_QUEUE),
> >+		     "FAULT_ON_SECONDARY_QUEUE requires MULTI_QUEUE
> to be set");
>=20
> Isn't the ENGINE_RESET test also only valid if MULTI_QUEUE is valid?
> If so, we should assert for that also. If not, then we need to add a subt=
est for
> that only (without multi-queue).
Will add a separate patch to add subtest for engine-reset independent of mu=
lti-queue
But it will be part of this series as the multi queue is dependent of these=
 lib changes.
>=20
> >+
> >+	if ((flags & FAULT_ON_SECONDARY_QUEUE) && (flags &
> CAT_ERROR))
> >+		fault_position =3D 1; /* index that complies with index %
> >+n_exec_queues !=3D 0 */
> >+
> > 	if (flags & COMPRESSION)
> > 		igt_require(intel_gen(intel_get_drm_devid(fd)) >=3D 20);
> >
> >@@ -101,7 +112,20 @@ xe_legacy_test_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 	data =3D xe_bo_map(fd, bo, bo_size);
> >
> > 	for (i =3D 0; i < n_exec_queues; i++) {
> >-		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> >+		if (flags & MULTI_QUEUE) {
> >+			struct drm_xe_ext_set_property multi_queue =3D {
> >+				.base.next_extension =3D 0,
> >+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >+			};
> >+
> >+			uint64_t ext =3D to_user_pointer(&multi_queue);
> >+
> >+			multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> >+		} else {
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> >+		}
> > 		syncobjs[i] =3D syncobj_create(fd, 0);
> > 	}
> >
> >@@ -123,7 +147,7 @@ xe_legacy_test_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 	}
> >
> > 	for (i =3D 0; i < n_execs; i++) {
> >-		u64 base_addr =3D (!use_capture_mode && (flags &
> CAT_ERROR) && !i)
> >+		u64 base_addr =3D (!use_capture_mode && (flags &
> CAT_ERROR) && i =3D=3D
> >+fault_position)
> > 			? (addr + bo_size * 128) : addr;
> > 		u64 batch_offset =3D (char *)&data[i].batch - (char *)data;
> > 		u64 batch_addr =3D base_addr + batch_offset; @@ -133,7
> +157,8 @@
> >xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > 		u64 exec_addr;
> > 		int e =3D i % n_exec_queues;
> >
> >-		if (!i || flags & CANCEL ||
> >+		if ((flags & ENGINE_RESET && e =3D=3D hang_exec_queue) ||
> >+		    !i || flags & CANCEL ||
> > 		    (flags & LONG_SPIN && i < n_exec_queues)) {
> > 			spin_opts.addr =3D base_addr + spin_offset;
> > 			xe_spin_init(&data[i].spin, &spin_opts); @@ -157,7
> +182,7 @@
> >xe_legacy_test_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > 		exec.exec_queue_id =3D exec_queues[e];
> > 		exec.address =3D exec_addr;
> >
> >-		if (e !=3D i)
> >+		if (e !=3D i && !(flags & ENGINE_RESET))
> > 			syncobj_reset(fd, &syncobjs[e], 1);
> >
>=20
> Why is this required? Even if we reset syncobj of the hanging job, the ne=
w
> syncobj will still fail as its job will be stuck behing the hanging job, =
right?
> Asking because looks like we are skipping this step irrespective of wheth=
er
> that syncobj is going to hang or not.
Validated it, seems this change is not that valid, will remove it.
>=20
> > 		xe_exec(fd, &exec);
> >@@ -224,7 +249,8 @@ xe_legacy_test_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > 	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> NULL));
> >
> >-	if (!use_capture_mode && !(flags & (GT_RESET | CANCEL |
> COMPRESSION))) {
> >+	if (!use_capture_mode &&
> >+	    !(flags & (GT_RESET | ENGINE_RESET | CAT_ERROR | CANCEL |
> >+COMPRESSION))) {
> > 		for (i =3D flags & LONG_SPIN ? n_exec_queues : 1;
> > 		     i < n_execs + extra_execs; i++)
> > 			igt_assert_eq(data[i].data, 0xc0ffee);
>=20
> So, we are skipping data validation for CAT_ERROR also irrespective of
> whether it is multi-queue case or not. Is that intended? If so, that shou=
ld be a
> separate patch (independent of multi-queue).
Will add a separate patch for this change independent of multi-queue but wi=
ll be part of this series.
>=20
> >diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> >index 7aaee31dd..fe496a538 100644
> >--- a/tests/intel/xe_exec_reset.c
> >+++ b/tests/intel/xe_exec_reset.c
> >@@ -125,6 +125,10 @@ static void test_spin(int fd, struct
> drm_xe_engine_class_instance *eci,
> > #define SYSTEM				(0x1 << 12)
> > #define COMPRESSION			(0x1 << 13)
> >
> >+#define MULTI_QUEUE			(0x1 << 20)
> >+#define ENGINE_RESET			(0x1 << 21)
> >+#define FAULT_ON_SECONDARY_QUEUE	(0x1 << 22)
> >+
> > /**
> >  * SUBTEST: %s-cat-error
> >  * Description: Test %arg[1] cat error @@ -355,6 +359,68 @@
> >test_balancer(int fd, int gt, int class, int n_exec_queues, int
> >n_execs,
> >  * Description: Test compute mode close exec_queues close fd
> >  */
> >
> >+/**
> >+ * SUBTEST: multi-queue-cat-error
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test cat error with multi_queue
> >+ *
> >+ * SUBTEST: multi-queue-cat-error-on-secondary
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test cat error on secondary queue with multi_queue
> >+ *
> >+ * SUBTEST: multi-queue-gt-reset
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test GT reset with multi_queue
> >+ *
> >+ * SUBTEST: multi-queue-engine-reset
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test engine reset with multi_queue
> >+ *
> >+ * SUBTEST: multi-queue-close-fd
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test close fd with multi_queue
> >+ *
> >+ * SUBTEST: multi-queue-close-execqueues
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test close execqueues with multi_queue
> >+ *
> >+ * SUBTEST: cm-multi-queue-cat-error
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test compute mode cat error with multi_queue
> >+ *
> >+ * SUBTEST: cm-multi-queue-cat-error-on-secondary
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test compute mode cat error with multi_queue
> >+ *
> >+ * SUBTEST: cm-multi-queue-gt-reset
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test compute mode GT reset with multi_queue
> >+ *
> >+ * SUBTEST: cm-multi-queue-engine-reset
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test compute mode engine reset with multi_queue
> >+ *
> >+ * SUBTEST: cm-multi-queue-close-fd
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test compute mode close fd with multi_queue
> >+ *
> >+ * SUBTEST: cm-multi-queue-close-execqueues
> >+ * Mega feature: MultiQ
> >+ * Sub-category: MultiQ tests
> >+ * Description: Test compute mode close execqueues with multi_queue
> >+*/
> >+
> > static void
> > test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > 		  int n_exec_queues, int n_execs, unsigned int flags) @@ -
> 383,10
> >+449,17 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 		uint32_t data;
> > 	} *data;
> > 	struct xe_spin_opts spin_opts =3D { .preempt =3D flags & PREEMPT };
> >-	int i, b;
> >+	int i, b, hang_exec_queue =3D n_exec_queues / 2;
> >+	int fault_position =3D 0;
> >
> > 	igt_assert_lte(n_exec_queues, MAX_N_EXECQUEUES);
> >
> >+	igt_assert_f(!(flags & FAULT_ON_SECONDARY_QUEUE) || (flags &
> MULTI_QUEUE),
> >+		     "FAULT_ON_SECONDARY_QUEUE requires MULTI_QUEUE
> to be set");
> >+
> >+	if ((flags & FAULT_ON_SECONDARY_QUEUE) && (flags &
> CAT_ERROR))
> >+		fault_position =3D 1; /* index that complies with index %
> >+n_exec_queues !=3D 0 */
> >+
> > 	if (flags & CLOSE_FD)
> > 		fd =3D drm_open_driver(DRIVER_XE);
> >
> >@@ -401,7 +474,20 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 	memset(data, 0, bo_size);
> >
> > 	for (i =3D 0; i < n_exec_queues; i++) {
> >-		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, 0);
> >+		if (flags & MULTI_QUEUE) {
> >+			struct drm_xe_ext_set_property multi_queue =3D {
> >+				.base.next_extension =3D 0,
> >+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >+			};
> >+
> >+			uint64_t ext =3D to_user_pointer(&multi_queue);
> >+
> >+			multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> >+		} else {
> >+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> >+		}
> > 	};
> >
> > 	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
> >@@ -411,7 +497,7 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 	data[0].vm_sync =3D 0;
> >
> > 	for (i =3D 0; i < n_execs; i++) {
> >-		uint64_t base_addr =3D flags & CAT_ERROR && !i ?
> >+		uint64_t base_addr =3D flags & CAT_ERROR && i =3D=3D
> fault_position ?
> > 			addr + bo_size * 128 : addr;
> > 		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> > 		uint64_t batch_addr =3D base_addr + batch_offset; @@ -421,7
> +507,7 @@
> >test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
> > 		uint64_t exec_addr;
> > 		int e =3D i % n_exec_queues;
> >
> >-		if (!i || flags & CANCEL) {
> >+		if ((flags & ENGINE_RESET && e =3D=3D hang_exec_queue) || !i ||
> flags &
> >+CANCEL) {
> > 			spin_opts.addr =3D base_addr + spin_offset;
> > 			xe_spin_init(&data[i].spin, &spin_opts);
> > 			exec_addr =3D spin_opts.addr;
> >@@ -466,8 +552,14 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 		int err;
> >
> > 		err =3D __xe_wait_ufence(fd, &data[i].exec_sync,
> USER_FENCE_VALUE,
> >-				       exec_queues[i % n_exec_queues],
> &timeout);
> >-		if (flags & GT_RESET || flags & CAT_ERROR)
> >+				exec_queues[i % n_exec_queues],
> &timeout);
>=20
> Looks like unwanted indentation change.
>=20
> >+		if (flags & FAULT_ON_SECONDARY_QUEUE) {
> >+			/* exec may result on -ETIME for fault on secondary
> queue */
> >+			igt_assert(err =3D=3D -ETIME || err =3D=3D -EIO || !err);
> >+			if (err =3D=3D -ETIME)
> >+			 /* no need to continue checking once -ETIME
> happened*/
> >+				break;
> >+		} else if (flags & GT_RESET || flags & CAT_ERROR)
> > 			/* exec races with reset: may return -EIO or complete
> */
> > 			igt_assert(err =3D=3D -EIO || !err);
> > 		else
> >@@ -478,7 +570,7 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
> > 	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> > 	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0, 3 *
> >NSEC_PER_SEC);
> >
> >-	if (!(flags & (GT_RESET | CANCEL))) {
> >+	if (!(flags & (GT_RESET | CANCEL | ENGINE_RESET | CAT_ERROR))) {
> > 		for (i =3D 1; i < n_execs; i++)
> > 			igt_assert_eq(data[i].data, 0xc0ffee);
> > 	}
>=20
> Some legacy mode comments applies here for compute mode also.
>=20
> Niranjana
Will make change accordingly.
>=20
> >@@ -979,6 +1071,97 @@ int igt_main()
> > 		xe_for_each_gt(fd, gt)
> > 			gt_mocs_reset(fd, gt);
> >
> >+	igt_subtest("multi-queue-cat-error") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			xe_legacy_test_mode(fd, hwe, 16, 256, CAT_ERROR |
> >+					    MULTI_QUEUE,
> LEGACY_MODE_ADDR,
> >+					    false);
> >+	}
> >+
> >+	igt_subtest("multi-queue-cat-error-on-secondary") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			xe_legacy_test_mode(fd, hwe, 16, 256, CAT_ERROR |
> >+					    MULTI_QUEUE |
> FAULT_ON_SECONDARY_QUEUE, LEGACY_MODE_ADDR,
> >+					    false);
> >+	}
> >+
> >+	igt_subtest("multi-queue-gt-reset") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			xe_legacy_test_mode(fd, hwe, 16, 256, GT_RESET |
> >+					    MULTI_QUEUE,
> LEGACY_MODE_ADDR,
> >+					    false);
> >+	}
> >+
> >+	igt_subtest("multi-queue-engine-reset") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			xe_legacy_test_mode(fd, hwe, 16, 256,
> ENGINE_RESET |
> >+					    MULTI_QUEUE,
> LEGACY_MODE_ADDR,
> >+					    false);
> >+	}
> >+
> >+	igt_subtest("multi-queue-close-fd") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			xe_legacy_test_mode(-1, hwe, 16, 256, CLOSE_FD |
> >+					    MULTI_QUEUE,
> LEGACY_MODE_ADDR,
> >+					    false);
> >+	}
> >+
> >+	igt_subtest("multi-queue-close-execqueues") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			xe_legacy_test_mode(-1, hwe, 16, 256,
> CLOSE_EXEC_QUEUES | CLOSE_FD |
> >+					    MULTI_QUEUE,
> LEGACY_MODE_ADDR,
> >+					    false);
> >+	}
> >+
> >+
> >+	igt_subtest("cm-multi-queue-cat-error") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			test_compute_mode(fd, hwe, 16, 256, CAT_ERROR |
> >+					  MULTI_QUEUE);
> >+	}
> >+
> >+	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			test_compute_mode(fd, hwe, 16, 256, CAT_ERROR |
> >+					  MULTI_QUEUE |
> FAULT_ON_SECONDARY_QUEUE);
> >+	}
> >+
> >+	igt_subtest("cm-multi-queue-gt-reset") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			test_compute_mode(fd, hwe, 16, 256, GT_RESET |
> >+					  MULTI_QUEUE);
> >+	}
> >+
> >+	igt_subtest("cm-multi-queue-engine-reset") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			test_compute_mode(fd, hwe, 16, 256, ENGINE_RESET
> |
> >+					  MULTI_QUEUE);
> >+	}
> >+
> >+	igt_subtest("cm-multi-queue-close-fd") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			test_compute_mode(-1, hwe, 16, 256, CLOSE_FD |
> >+					  MULTI_QUEUE);
> >+	}
> >+
> >+	igt_subtest("cm-multi-queue-close-execqueues") {
> >+		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0));
> >+		xe_for_each_multi_queue_engine(fd, hwe)
> >+			test_compute_mode(-1, hwe, 16, 256,
> CLOSE_EXEC_QUEUES | CLOSE_FD |
> >+					  MULTI_QUEUE);
> >+	}
> >+
> > 	igt_fixture()
> > 		drm_close_driver(fd);
> > }
> >--
> >2.43.0
> >
