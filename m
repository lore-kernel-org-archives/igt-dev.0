Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABFACCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 05:07:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FC810E0F0;
	Thu, 16 Oct 2025 05:07:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kkZVpcDJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3F210E0F0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 05:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760591272; x=1792127272;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=75AIWVmFMGKd+krVTu2ajyN/14rHVtYnhtyCksdJX+U=;
 b=kkZVpcDJ61+w2I/GuJaGEMy6s4FiTpxOS0FQu5RAxgy/v61sPMaheXU2
 /1BZOvYtKK/3zos9+a6LZ1w5FTriRGC0MrCqnAeI+AjDcjft3+KaMhqCL
 kdT7Id1Ha/B+HNihAQ3FHQrfhNlI3qfGdJWpFiQtAykswVKZO9fjBvzl4
 hvQNWXwkJ8Nj2c7Po4wjwGpYbLhxsBdd1C286cHWfsxI2sq6dSWlbb//5
 auhKqrb0+LE1L429P0srErRK8ny92BrzZacMErJQzzKNJaitx72gLO8nE
 SAv0PWOmY5YfxbZ+LTr9ipciAA6FzPEQBeHLRIRxd8kj4a3DVRY7FkCbF g==;
X-CSE-ConnectionGUID: ewH39qxcS/y0+4CGANVUzg==
X-CSE-MsgGUID: CE7ewsBvQeaJhj/E9ugleg==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62483339"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="62483339"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 22:07:51 -0700
X-CSE-ConnectionGUID: j8uJV/5GSq+rhfVLtgk1pQ==
X-CSE-MsgGUID: g8HFswG3RpW1jeBsxaPE7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208";a="212953127"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 22:07:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 22:07:50 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 22:07:50 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.65) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 22:07:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vXNc5nH5QaLpR+r7dfjZsUyd8rHWkdnLjByxgpK0diJzctlZMXW8PnDkjT8+uk0D9OBc8koQYq9QtxPg2sJtPWsZqfO2GRveu6BuH2i7mmXx5WsnADRunKgxrcNmpVNqHY2Ibv9bMfiJscbAQlG3xXoWeHecGjpx1ikkq+HApWw/o2EkNNkQAJOWnotZvsUiVcbcJCGsKU4BZ4yQSa9EoNq6H9UGwUCj/MKtQwIB7k7gT/BHuwxh57KOLMyDJh/Mc+bhMCNSEb+awPXy4WyOE5jK17SCAReEywyccOyMyIYDy3QzuEDfA/Pv6vdQ8dOC9f38W2xd/E8nRBDKlC4syA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GzyaOsg8vwd5PQIeq6fS7xCkVeai83PZtbEZZnJEG0=;
 b=kXgUIen9BQ2pwmQaIFNOY8AdVzl61ZCaAwlK13H/YeaPQy0SIpvDqB1A93VhV1Zx1P/N3NKfV1DscUq0Hc2dTgrR0HWf+8kYAp8cyeoMx8hPtShCCIevgO+sX7nRJmmWjjok2v2GXqOeiwgEScQonx+ab+j6WGwZFe1Prz8J5Qh8fhCfUNIqEdZ+mw9g4fgN2DsRugEhqbKNG7IOwr3dnIr00PHsiP3p1mVvZBgOHfo+qIxIS/Fhdy5uHHHie5o+SKlkQ1SyNgbFzB3A7YuvXKamjHltErzgGP1mXeBX0YWtC01AZQl5h10KHpGERtCOddoUszePAVF9F5aBnQGr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SJ0PR11MB4942.namprd11.prod.outlook.com (2603:10b6:a03:2ac::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 05:07:48 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9228.009; Thu, 16 Oct 2025
 05:07:48 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v7 0/2] lib/intel_device_info: get the xe .graphics_rel
 from GMD_ID
Thread-Topic: [PATCH v7 0/2] lib/intel_device_info: get the xe .graphics_rel
 from GMD_ID
Thread-Index: AQHcPZk5qb3E0xKAfUe67pMriiWnbbTD1+6AgABfH7A=
Date: Thu, 16 Oct 2025 05:07:48 +0000
Message-ID: <SA3PR11MB8046EABCCF926C548071337486E9A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251015060144.6410-1-x.wang@intel.com>
 <20251015231515.GE5409@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251015231515.GE5409@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|SJ0PR11MB4942:EE_
x-ms-office365-filtering-correlation-id: 9a481b24-6524-4372-8014-08de0c71f320
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|42112799006|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?aRBHg/beHb4PDBr51AMItgdZ82uyy7EqadTxIf7//RFbU0yft09nNAWis4Sj?=
 =?us-ascii?Q?DZZXBGWMVM/7ztlypIgXQIQh+0lJVI7WqdxpPA22YUk02bo/tlWsI1J4gy2R?=
 =?us-ascii?Q?Rq9VSx7SlrC8lLX4gVOQEtAXFedUpWf/KDEyLKZyMmwROcPRPrNdnOxguBJo?=
 =?us-ascii?Q?Q8WppWjAagnnQhIMtYn5D+44LI9xt3NmqRu+RSd/0fPB8i6Ee3dyKZlZbRUF?=
 =?us-ascii?Q?V9UAqyIJKvgZ0BncONp3OabTwN1HEU0Ufbe+nJ0oIwSSUgY6TEDXKx5yi3S8?=
 =?us-ascii?Q?2XKZRQqqsi7cvq7Id2r+tMxuDpa/TdrT/4jw0KfchYOfMtnipqd0wOHA8VYE?=
 =?us-ascii?Q?swEMR2osN6PxftDWnO5INj9KYfxPnvvqyB8VkaXGopPJZRWcfjXIP9qG1H93?=
 =?us-ascii?Q?vK/i6fRKstwCRs0WRmeUX7D6G0kjvfAFz7101dfXfK2Qf2NrOgbCMDkJOXWF?=
 =?us-ascii?Q?03FwNygW2g9eQQH4QuLQxNH7VdyuiG3lijjIM7ReCYucv+K8qPs0vgdC7exj?=
 =?us-ascii?Q?vQx+GiihPNbe7c5AGWHhkJipH1VJGRdqGr5n7OOB0zv8T8baKLebGNw6Yb5S?=
 =?us-ascii?Q?ai0pHFGoE+atzlhEoz7UNfV7Y15OWl5IH6k44jpTn/THIUK9f/nhb/ZC6RQ8?=
 =?us-ascii?Q?Y/GUnK2R59GysGPWhU4Ctr/2LimwrAxpcJ2J+yrQj7iRxY/RlnZgWO0bmDqm?=
 =?us-ascii?Q?qDm53GoFwoOTE+/UWq8gkFowG23o+gXkBN1nOdzD0JKRWOpmLela3hDe8gw5?=
 =?us-ascii?Q?rdHlSLFB2u+l7vs0tPW1dXvJ1nOjP60tw1IXtPnn6RFOGo/RTGE2NdaoyWky?=
 =?us-ascii?Q?DcfNoMJcJpLINOqQCM6iuUm1dPBunLF97QVeSGB5hg/IcirQ6C1UZbZkzpO8?=
 =?us-ascii?Q?HyMTWND2xw6rtiXcSIW183f/24zU3p3VY7EB0r6BH2sS6s+Scel27NvpTKQ9?=
 =?us-ascii?Q?Hs9y2kbR4VbdhOggPi1dRovqdHZ666/CU1qra76RY19zjFcyzN9NlG9VMPQv?=
 =?us-ascii?Q?Er6OTWnPmBuNa+IZHSIEFybZThLW5qCXu2/26LDVqcs0KbX3nCU8pp1uOHQP?=
 =?us-ascii?Q?AxmE97IfjH10ltPGv4Yl0/rpq5fVwLmW/zuR5I83FQiEruFLC48UP2IJE9hw?=
 =?us-ascii?Q?KEzT1uDA4Y60k+3ztsSUyL1q8rI+PC6nyjttGtmRj8xyXqHbVhHpAi32ZTBi?=
 =?us-ascii?Q?3iCbIjyPvpTeGDnnGDRRg7wbzn5+xSs6Qxsb+Bn2aV71dVhVSCCgxwy+qhFF?=
 =?us-ascii?Q?gIy7ozN8a/4FoUcUTvSu0Qemx+ZHw3VTf/Lpiphqk63ty9Oqdyql3UQkYmJ9?=
 =?us-ascii?Q?ZxMVGUrhKrrHpHoofc7xZMAYjauhgC6V533YcycJPfgErDp15lzhRWlSQDZK?=
 =?us-ascii?Q?jK3tZeBVo2TzNhp9T1gpg+IR9djprWu37UyjkGATM1qDEsXVT8bYx/eAf0qO?=
 =?us-ascii?Q?4yDkMbfqjy2jkYABCN7EXSQJXXZ8stmZGSKJJ/UTzAO2+/fzjnjti0mFRxrt?=
 =?us-ascii?Q?+pzTNQ202eiRgczgc3b7kcZLTn/QUnBA6mvN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(42112799006)(376014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+HlAwl8lIhORucG9y3bncquBZzM1I5kODZZiBHVAuc0t4V2SsjVeVvTQs+h8?=
 =?us-ascii?Q?QeCAwUQM5fZXj5Po5SsAyaggUDa3IZZ9iQEglwTXfVAovQg+CJhYBirgdtiF?=
 =?us-ascii?Q?wh0KQtOrIRtmx/5bE4Gwy39cXH46zBxOSKiKSD/JDLt3ceh8qnNEeGSA+7Ue?=
 =?us-ascii?Q?J1ZiZlFp7bAy7OZcG+UUc9Wunef3gDGW1DOHau/NKQ2Q5AaUQKH3m7XaJqBY?=
 =?us-ascii?Q?mbty5JzxcfN+jrsYqMNgI423bLSo+EDHDDEhB1dJtPYZHbjj/xvkbq2J2s6w?=
 =?us-ascii?Q?UGb4GOS7RZi3vsrUxIZYJPqkIgvZvqFDZyBSVsXHAc/q2Nwz51n6/geaZjDF?=
 =?us-ascii?Q?q1WEU/dlGaz+Hp+53i/s3Lam8oLwpvXW3D6MfziGP5Lw1avVZMO6aZeh6XK9?=
 =?us-ascii?Q?DMMHUvXzrne0E9Fd1ZpOOkiR0gRP/14B2ZCvtmrCXYrev9o1Q0aRaiP7uj9t?=
 =?us-ascii?Q?YjM2SvreF+0hygmjeN2OITKewySEiZmxmN/gSoSYC+FyWjBD5QQm3ZcqpK5p?=
 =?us-ascii?Q?alWBcSFG978DWbooishx0a4pz8655fw5JRK1UdJ5bX7kubZ/9NDpvJoWFZ0o?=
 =?us-ascii?Q?hwIQAsHE6bJRbBtmyS8SEuS1RHTicOMoQsXfVSUr4NaJQ2yqAWDQuTUpNHgp?=
 =?us-ascii?Q?ct8yZFx5BWTpwdGBQfxCWRqIh+MF3S9RsuiTfOwaKdzZm/HiEkxY0Svx7UTk?=
 =?us-ascii?Q?VLkGCdmY5MrS111P+hvCKun3KuR4AVmRIu92tBnGv5hOnawSmUNKT5HxHciD?=
 =?us-ascii?Q?8tvupD104g0PWi+m0s8oAv7czFRDWYo+360EZwI8PK/jcARy/OsSPpr65Yk1?=
 =?us-ascii?Q?zYcButk9GHarEL07gWzAVbfxVg6sH75/J/fUX3C7s61fT0O4Fk36a3w6hcJh?=
 =?us-ascii?Q?LWu5fSskAUwElOJ/tKE14aLPVB84kxyTBFEjgzlmTnjZczIr90Qhne8uQEtN?=
 =?us-ascii?Q?12XJRjqfivAqXPMLrXWfKDcdlShDXn6oO8nnsJ3yaXCwBN+QrwlXZ/ATE2F1?=
 =?us-ascii?Q?rVb4PdZ9pzr4v25AEbQv3KHCN+S/ALOYKqFQVCceCle0g6itfsSXkNur3a+S?=
 =?us-ascii?Q?nb0GQZOzM3lR8viHuKtdwg8g30uzfb7W5Y/ghYZde+pWFn3aN/dPvHsbTWo4?=
 =?us-ascii?Q?RVv9h33wbGdtL6xHznJAI06jRQyxOHLFrLG9Zyim41vv80Cw7m5Rpe7qtAAs?=
 =?us-ascii?Q?CX1ISCesIlXa5eGvR+3aP58dlD5i84WrnoKrTi7O51YOUKk38darLOFrZMN0?=
 =?us-ascii?Q?+zJCqCYFVOFxSoMPZ+Q5rFu805zJKmSGzBRxV+Sv/ueuEtjobX5whFQdj3fV?=
 =?us-ascii?Q?oNvwYH1hsU2s3CQV4UpJRJAiAcNR0lDq6ZccvA+VedavbGwZI8YSsujkaknr?=
 =?us-ascii?Q?RdArI2E8vy6uLWibSHLc0uHP7uWr1oXaS/qbyKTlIBuEb1Vm5qQvDIAMY9tE?=
 =?us-ascii?Q?TYn5Q6hWjcwWjdHRZzvPnhORWtwrXonjotDOqnGMjYO2y0nKwzccNCv8VLBq?=
 =?us-ascii?Q?l1ofnOVtINys9m6m86zBukweXJemgcgRO3hsdJPD5L8y/2cQdtN1S6dbjfeL?=
 =?us-ascii?Q?ky+v3JdtTCavF4FQP0k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a481b24-6524-4372-8014-08de0c71f320
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 05:07:48.2392 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqAdWErvgUUhS4HnDKWoa3+o6rABEH7ShSJ7YLCTTZMyZUEKdNmb/Vo1FuUIZSR/LlyOKQwVCGY1ltWb5IQUmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4942
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

Hi Matt,

I really appreciate the clarity and the direction you're proposing. I agree=
 with the overall approach; transitioning away from relying on device IDs i=
n favor of DRM fds definitely makes sense for long-term maintainability.
I think it might be practical to go ahead and merge my current changes firs=
t, as they address some immediate needs. We can then take the time to prope=
rly refactor the broader codebase and implement the full version query stra=
tegy you outlined. Does that sound reasonable to you?

Thanks
Xin

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, October 15, 2025 16:15
> To: Wang, X <x.wang@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH v7 0/2] lib/intel_device_info: get the xe .graphics_r=
el from
> GMD_ID
>=20
> On Wed, Oct 15, 2025 at 06:01:42AM +0000, Xin Wang wrote:
> > This series enables IGT to retrieve the accurate IP minor version
> > (graphics_rel) at runtime for xe platforms with GMD_ID support,
> > instead of relying on hardcoded values in the PCI device table.
> >
> > Background:
> > -----------
> > Current IGT uses static PCI device tables with hardcoded graphics_rel
> > values. For Xe2 platforms, Different device instances may have
> > different graphics_rel (minor version) values
> >
> > The kernel's GMD_ID ioctl provides accurate runtime IP version
> > information (ip_ver_major.ip_ver_minor) which should be used for
> > platform-specific workarounds and feature detection.
> >
> > Solution:
> > ---------
> > This series adds support to query xe device info at runtime:
> >
> > Patch 1/2: Get runtime xe device graphics version from GMD_ID
> > - Populate graphics versions in xe_device from GMD_ID ioctl
> > - Cache device info by devid in global map for efficient lookup
>=20
> I still feel that doing things fundamentally based on devid really isn't
> something we want to be doing going forward.  Outside of specific cases
> (error decode, driver-less tools that use libpciaccess, etc.), the use of=
 device
> ID rather than DRM fd has always been a minor design flaw that we've just
> carried forward because it's easy.  Going forward, the hardware/architect=
ure
> goal is that we should never assume that there's any kind of relationship
> between PCI device ID and graphics/media IP versions.  While it almost
> always turns out in practice that specific device IDs do eventually map t=
o
> specific versions, that's not a mapping that software is supposed to be r=
elying
> on anymore.  Even if we're not hardcoding versions we should avoid
> assuming that two devices with the same PCI ID have the same IP versions
> (even though that usually ends up being true).
>=20
> My hope was that we'd follow a process like this:
>  [1] refactor existing code to clearly separate the tools that need to
>      stay devid-based from the rest of the tests+tools that should
>      transition to fd-based
>  [2] update the interface of intel_gen / intel_graphics_ver to take an
>      fd instead of a devid
>  [3] update intel_gen / intel_graphics_ver to call the query ioctl and
>      obtain the true version numbers if running on a driver that
>      supports it (Xe) and hardware that supports it (GMD_ID); otherwise
>      fall back to the same device_info lookup we use today if we're on
>      i915 and/or the query doesn't give us any values because we're on
>      pre-MTL hardware.
>  [4] try to cache ioctl results to reduce the number of ioctls issued
>      when a test re-checks the version multiple times on the same fd
>=20
> I'm not sure how well I explained that in my previous emails, so I wrote =
a few
> patches that cover what I was thinking for [1] and [2] of the steps above=
:
>=20
>     https://github.com/mattrope/intel-gpu-
> tools/commits/forupstream/version_query/
>=20
> (I haven't tested that yet, so there might be bugs or spots I overlooked,=
 but it
> should at least give an idea of what I had in mind)
>=20
> The overall diff is large, but most of it is pretty straightforward (and =
a lot of it
> could be probably be re-generated in a mostly automatic manner using tool=
s
> like coccinelle.  Overall I think it's probably a net simplification beca=
use it does
> eliminate a bunch of indirection through local devid variables that happe=
ns all
> over the codebase.
>=20
>=20
> Matt
>=20
> > - Provide xe_device_get_info() API for other components
> >
> > Patch 2/2: Query runtime xe device graphics versions
> > - Use runtime xe device info for Gen20+ platforms
> > - Use weak symbol linkage to avoid breaking static library builds
> > - Remove hardcoded graphics_rel from static table for xe platforms
> >
> > Benefits:
> > ---------
> > - Accurate IP version for platform-specific workarounds
> > - Proper feature detection for hardware variants
> > - Unified device info API between i915 and xe drivers
> > - No changes needed to existing test code
> >
> > V2:
> > - set the graphics version info in xe_device_get() don't copy
> >   the whole struct of the intel_device_info
> > - update the graphics_rel when the info is already in the cache
> > V3:
> > - Optimize the coding style
> > V4:
> > - add braces around the else statement body
> >
> > Xin Wang (2):
> >   lib/xe/xe_query: Get runtime xe device graphics version from GMD_ID
> >   lib/intel_device_info: Query runtime xe device graphics versions
> >
> >  lib/intel_device_info.c | 25 ++++++++++++++++++++++---
> >  lib/xe/xe_query.c       | 33 ++++++++++++++++++++++++++++++++-
> >  lib/xe/xe_query.h       |  4 ++++
> >  3 files changed, 58 insertions(+), 4 deletions(-)
> >
> > --
> > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
