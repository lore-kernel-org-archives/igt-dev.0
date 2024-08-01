Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFC8C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2653A10E952;
	Thu,  1 Aug 2024 12:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BbiZdott";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0D1510E952
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722516593; x=1754052593;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8DRuO82v8jGX6mzZvl5/N9FDOZu2Ey4OLfalgLdVfyA=;
 b=BbiZdottxUNlDA8ehG0ou+ItbRjjiugrb2gyT/ADLV6uyBo7no87FO5i
 u+wv3rn/3l0djQIuxB5pOhHGW4h2Q6N76EAQggPSIlVRpfOmpTPxm32qS
 nV8BWMWoFEZ+72ugSyQwtTUEwxyd5e83uhsfk2nYBuFTuuxEer55lw9Us
 nidPqRqeVYq8yx2pZBtcmZmKfRNAvDUf3gSq8X8ZEuwBhNCcA4+h1MIFr
 xgAp6+ZkJgORHsZcUorL+hZNIh9dRc8NLCI7gw7nY2+pNcvjPjUF51MMq
 FpBztZcRtZ+6+A0f6ZNZcYLstPi8BvNnGA2kPDC/thvysXQtNaxJUc2tR A==;
X-CSE-ConnectionGUID: Vf4pN47XSHWIyUAPheyqgw==
X-CSE-MsgGUID: TeCEP70XS/K7ZyEtS7DNyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20050667"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20050667"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:49:53 -0700
X-CSE-ConnectionGUID: mgTQDPiEQHKIv1rAjzbaAg==
X-CSE-MsgGUID: WuYUJuL+SnaHLK1yMCxYcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="55269886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:49:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:49:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:49:51 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:49:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LTq8rz8/me7g6H7XWCc7bOOxXmVlbEShVp2HamrnVSN1G7fM3Cl8mh01GXISxg3kgEGcOAP/UwDA3CcIjJpJsFqkVZHLf2miXA4WGmNeL7mKdk4ZgHpkTU43RYMGd86BsRtrjVBcA0NMe6kCXLhQE+F0t/qCsw0lJ5jAOuiySQ3yMMdmAjBTed/Fgu4MZVcxl8cbiTUEbqC2UGZkWRLtQLAdFkBgi1GAiCLdNlkhQijdTYkoFGuPD8MeuHVmpXuGi5vyXwy+V042dx6tpW1SLH4YZIR6qKWvkDPCbqu7ucTERmkXWTy9mlFdHre4/DgTlqRnZ+Z4ujJd8r8tGmHwhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAIYPU3FCrl8W6UalEKMoVHxJVsVtIIrJx7IWw7P7gI=;
 b=cPMEaTt7FRubff168bxgUz6TCMIFfEI6ANunb0bfqNUgf5C4D7gwm5tbZ2i5x5+akjmOsI0Pns4UG2LRaWQBBRtkWJhnZLD9SVHPu58RsaQeDrX4eejYypZktMsp9y10Co/j9iPr0+2q8sBGuF6HZpjSHxAYTzrHDAy9ZfDudqLDje/bYzcSjDSfQ/GN4pZ+kJSgQFsjANQ6m/qrmfSXVkHCDipL4Uk0dYEFQpyf9dD3vEhhVK+8gNWBVXzBC/jC0iw8jLHt9N0dizM7Y3ovm6or8m71dlv3XSHaBk4Nlbd7mQ1AlYioIjk8g5IpB4iToUceWdSqrhNUUNw847+QWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ0PR11MB5198.namprd11.prod.outlook.com (2603:10b6:a03:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.20; Thu, 1 Aug
 2024 12:49:49 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:49:49 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 28/66] tests/xe_eudebug: Add basic-client-th test
Thread-Topic: [PATCH i-g-t v2 28/66] tests/xe_eudebug: Add basic-client-th test
Thread-Index: AQHa4nZpuZnggNU4WU6lh6gMkiBKwLISXYTA
Date: Thu, 1 Aug 2024 12:49:49 +0000
Message-ID: <DS0PR11MB72648E09A9802045F1264366D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-29-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-29-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ0PR11MB5198:EE_
x-ms-office365-filtering-correlation-id: 7f9fbfa5-66c3-46e1-6ce3-08dcb2286e16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?lhg79pQaU3IJKS1ubLsOhj65bv/kSvdgcK4Z46R75IUyblN8LqFLPt/YYk?=
 =?iso-8859-2?Q?+cJaKhPuds14l2SRmX43IM13jZ25q/h3rpYxOZ1Qx4dBZcyRhFAdibe7q7?=
 =?iso-8859-2?Q?InYi8SPdgRbFShoqxG9bgYfPDDNQ25BclQYRycM4HQloKiEx9Y1QWSqLRu?=
 =?iso-8859-2?Q?Ps9+ms2bAEBRp9IL2TlelyMqWUjyDx1NBn4aooHzVJRcrnRumNUQXMlBRS?=
 =?iso-8859-2?Q?hS0rreDEiBNA6Fs66wbq2cTSMf8+oC4PqnurS6xxidsy6QSx+4OF8nAp1P?=
 =?iso-8859-2?Q?mIKDg8A1D8ui9KQd6maK/gnUy6QHDyKW+TIwb8BtBnhRgyombr4r2j+OPC?=
 =?iso-8859-2?Q?POKk75Ru2moUHt9WVRaG2FPfUIGZHiKA8obIAngGGbE0/iHrcBTti+E2HF?=
 =?iso-8859-2?Q?/FmjWTcGThhLliJF5Cx8dOY/N7yX4dFDw5PmUM5z8p79mXEZNwPN+1V920?=
 =?iso-8859-2?Q?cPyAFt2/YUx6nncQeGvPd3VIsqHt4Zm8PsmevJ82vqpGhW2nWC9AAELdrz?=
 =?iso-8859-2?Q?WbYQjL/ynObUXeP5CQXyJ5bo5nZ9n+TAoZ5CSq6/ffB68PK27u/0SxMJGV?=
 =?iso-8859-2?Q?dVqSz36lSV9T4m7VUd9v5yuywOVSU71M0K8QHVaqCgYy7r38F4yUGmIUrT?=
 =?iso-8859-2?Q?15kH7IvTAaYiaeF8Rtj1BTRf7GqMLrTQDQo2kdS+7xqLKqX19Kily7qyAu?=
 =?iso-8859-2?Q?7lan8pVe/9v/B8aqkomjwwyxaTaednSMSXY5aQNLAjf8QWSGGXWuZ5ypr5?=
 =?iso-8859-2?Q?lF62Pm7r0HX+Qd/IonuKbGtoXPiVTjIz4o57TbVeVITgJdon3GEqBG71MZ?=
 =?iso-8859-2?Q?kaYmSMAkhIhxbUYRRPL2z0bAZQMqcYpdRL1BG4met8J2ZjUbUDsmEjvIJC?=
 =?iso-8859-2?Q?31eHzYR1JgXh/Jd3feEVp0it1mh1JgYXd8TTJ4XYYhQlzxsv9m+GQ4o66B?=
 =?iso-8859-2?Q?aIs+a7XU6Da32B0RPLv5yk+TQpxj+8gdHDYLQGSi2d6h3AVkY/R7wBYpEc?=
 =?iso-8859-2?Q?OYzUcP6Ffv1OzJ9uDGHr58tVj8v6QxrrUkaoLHWnSWWGuB/xhT4gzzjtZ+?=
 =?iso-8859-2?Q?M9HAPrM/dDQXxtuvdQRK9fOoGiKhSodluRUXXhFc66KWxX6j+auVb2yxJa?=
 =?iso-8859-2?Q?o3hBm8ktoLmEBYAMhXIUnJS/EcuHDlVs7THb8twyBvvIrELC5LOFn1oEcZ?=
 =?iso-8859-2?Q?cbTyckQVShlakFcsIz12VQYlcwH4CVc1S3wJiflQvHnIwn4nrmC6Omx5nY?=
 =?iso-8859-2?Q?hBqY/xlPJObO0LVBKvT4RsS4oGXBs+BXkYE1VpMPlyBVOibmVqYO+W61PP?=
 =?iso-8859-2?Q?4XybTB88X+TzD9zo/lyDINVproAu1Xl3PYJ1rW1W+n/rxIRwYO4pdTUPxN?=
 =?iso-8859-2?Q?PmMXnIKdF3tJQmbbqiR/geWk77rYKj/UywQ2MR0dowAh+qSquvGBJaf4qU?=
 =?iso-8859-2?Q?UrpPRVXcXzQN+swmJWzgCa8xAEfvPAq5YG6XWQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?+mb+j0SDF9rHoinhgbta9xixj4z8qCDfQFusPOuhHvDzgMLfDag3fsIXB+?=
 =?iso-8859-2?Q?EIFCY/6bWl5KPEtce/0Jh6E124K3Q5ir+vQ+/8QYYoRV8nZZwOW3wHgAhj?=
 =?iso-8859-2?Q?DYpAZWm3xwr6TgdhuHBG3dq3HyhzZEXYYx+krPhhJMvIWwrunpDaqIz+iB?=
 =?iso-8859-2?Q?582vZBooGPoMF/JGr+Nkgbbj+7Y/SrFwYS75dYUHIzh8mlZ/CRzRroNBz0?=
 =?iso-8859-2?Q?p0Hlb7P0Aq6+9PHEO17ni89sgbUnsEpEa0z028AM7jRu7Szu3Lm6ZLACsb?=
 =?iso-8859-2?Q?oKvP2uI9OADVp7DEXQlUQi9Aaw1EngnpGqguLahNjOQBVJoNzg9RpoaUm2?=
 =?iso-8859-2?Q?fvv+hkhgfKY+MiKwYRAHbRUOVyNu+B5gOgsKQn8GHzpNFvQuCtQBisLCwE?=
 =?iso-8859-2?Q?48mKpZHuKN5AP9veAa1W+Spe7mA+AWWi30zTbjS7PAk6FtUi3c1UawlCsR?=
 =?iso-8859-2?Q?0L3D93XEq5CiOcD9uriDH0h33a2EW8eezqJyKwi6jqx46Mt1eE5GJxNapl?=
 =?iso-8859-2?Q?VedynF00h0WuELmCe9Tc1TOJpO6jwGiYAVDzdViJw9XtmLMfJrLDipLrx1?=
 =?iso-8859-2?Q?sDCMz7ehqbrazAB9WIFQCPpFyJPwGJAxv+VKVs6blC/gsrTUP6zT+jgJV4?=
 =?iso-8859-2?Q?CEwzdMHR4Uf66BsgWc9rMSJsUZoU0nurYQhEwdVOJ2A9qmOdsCy/W+zWqh?=
 =?iso-8859-2?Q?K3RXx4SHOkfOfKDT5y64pyA2V8Pjf+mkC936vcKud6ZLYSYUbp9lWhusmY?=
 =?iso-8859-2?Q?pTO/lzuspRFwJc8G227GiR80MM8HnEV10VZuz1BVZnIg4ETThFM1ZwWTF/?=
 =?iso-8859-2?Q?Zi99edcIut+pAKBitmIr2JwZ1zAdZlHYKW2rsD8GZCDXSprgiRbRAHHnkO?=
 =?iso-8859-2?Q?Fn670mNneDfbhvImtLsO9bJbVdAArNswdsKmIWtIQ2rDCEcXCti66PQdzI?=
 =?iso-8859-2?Q?Ds0fnptjmgyzAzqIJE1mHTvAHPCQzesrs841ZMFJDqjTqMt2A29h3sWNZA?=
 =?iso-8859-2?Q?Nw+qslLFFPoxXjj5iWMMnttKkTm21RhKcdqJmcxqMU+IaXuVPtw69jBy7Y?=
 =?iso-8859-2?Q?PyT6wqvQi/GUlllG8Txxg4WuNqGx6nLFxdjzMx1nxV4ySidRmFfB5w8oR5?=
 =?iso-8859-2?Q?+YRs3DJNMtDxGbJiJXN/YaDSggR8HsJIRPt83sty4rokYjfn1YQIpIA+vh?=
 =?iso-8859-2?Q?hGjVGojPL2CTELmJOgIaPS5UgtuMG53j4CDQjx7q34IBpRAw2CdRy+NJ4f?=
 =?iso-8859-2?Q?DNc//9JgU0UK4GqArDXEOshvbiCLkXVHS5BzjFrZk96IkkhLsLlF424UF2?=
 =?iso-8859-2?Q?BfQTN6dOzuBDmyJOsOiMHkkX2oXuCujUpVFXlJVJfoDzyMTo6T6Bc1OoSu?=
 =?iso-8859-2?Q?cWl+d18TXJD/m5vo8fo2IARpyra7EiT9OQhGtueRL43t6sKm59kw95CMrg?=
 =?iso-8859-2?Q?49iMAex/o8HMVuOFc6Ux1e5fgsqHShF4Xs74puZpHSdUuk+roHel1simi1?=
 =?iso-8859-2?Q?HrQaUAIvR931McfNWvrSuErTHxjykyV9Gt1g4jiH46YBe162e03gk9ZKjd?=
 =?iso-8859-2?Q?OsDFGFcNWRqoTqGo50KTjPadkjWaJ/GiBhGayzCXD0tKLEK2/dUs6Xmr34?=
 =?iso-8859-2?Q?7UY7azwDPZUqSUuWiyNHdyLBNySfYTXPvDmHj/l2DK/9M99oIDGt3fpz5/?=
 =?iso-8859-2?Q?ASNTbSlLPp/Ne7uXE9I=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9fbfa5-66c3-46e1-6ce3-08dcb2286e16
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:49:49.4898 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Q5EUIk5RYVjKeGuD+9Be3ASqMDi81ZFlRis2mBm4nUtHvVD0JtXoj/lWsWa3GwF5xR0RKLqeMvnInJWDM1TwMSo5wgSDmP9ea8Zu4kFZVDcD/zTxwj+l3G/jFwK+JrY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5198
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 28/66] tests/xe_eudebug: Add basic-client-th tes=
t
>=20
> From: Pawel Sikora <pawel.sikora@intel.com>
>=20
> Add basic-client-th test which is a multithreaded version of basic-client=
.
>=20
> Create random number of VMs in random number of threads.
>=20
> Signed-off-by: Pawel Sikora <pawel.sikora@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 77
> ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> ab856727e..022b39f1f 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -13,6 +13,7 @@
>   */
>=20
>  #include <poll.h>
> +#include <pthread.h>
>  #include <sys/ioctl.h>
>=20
>  #include "igt.h"
> @@ -640,6 +641,10 @@ static void test_read_event(int fd)
>   * Description:
>   *	Attach the debugger to process which opens and closes xe drm client.
>   *
> + * SUBTEST: basic-client-th
> + * Description:
> + *	Create client basic resources (vms) in multiple threads
> + *
>   * SUBTEST: multiple-sessions
>   * Description:
>   *	Simultaneously attach many debuggers to many processes.
> @@ -1057,6 +1062,75 @@ static void test_client_with_trigger(int fd,
> unsigned int flags, int count,
>  		xe_eudebug_session_destroy(s[i]);
>  }
>=20
> +struct thread_fn_args {
> +	struct xe_eudebug_client *client;
> +	int fd;
> +};
> +
> +static void *basic_client_th(void *data) {
> +	struct thread_fn_args *f =3D data;
> +	struct xe_eudebug_client *c =3D f->client;
> +	uint32_t *vms;
> +	int fd, i, num_vms;
> +
> +	fd =3D f->fd;
> +	igt_assert(fd);
> +
> +	xe_device_get(fd);
> +
> +	num_vms =3D 2 + rand() % 16;
> +	vms =3D calloc(num_vms, sizeof(*vms));
> +	igt_assert(vms);
> +	igt_debug("Create %d client vms\n", num_vms);
> +
> +	for (i =3D 0; i < num_vms; i++)
> +		vms[i] =3D xe_eudebug_client_vm_create(c, fd,
> +DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
> +
> +	for (i =3D 0; i < num_vms; i++)
> +		xe_eudebug_client_vm_destroy(c, fd, vms[i]);
> +
> +	xe_device_put(fd);
> +	free(vms);
> +
> +	return NULL;
> +}
> +
> +static void run_basic_client_th(struct xe_eudebug_client *c) {
> +	struct thread_fn_args *args;
> +	int i, num_threads, fd;
> +	pthread_t *threads;
> +
> +	args =3D calloc(1, sizeof(*args));
> +	igt_assert(args);
> +
> +	num_threads =3D 2 + random() % 16;
> +	igt_debug("Run on %d threads\n", num_threads);
> +	threads =3D calloc(num_threads, sizeof(*threads));
> +	igt_assert(threads);
> +
> +	fd =3D xe_eudebug_client_open_driver(c);
> +	args->client =3D c;
> +	args->fd =3D fd;
> +
> +	for (i =3D 0; i < num_threads; i++)
> +		pthread_create(&threads[i], NULL, basic_client_th, args);
> +
> +	for (i =3D 0; i < num_threads; i++)
> +		pthread_join(threads[i], NULL);
> +
> +	xe_eudebug_client_close_driver(c, fd);
> +	free(args);
> +	free(threads);
> +}
> +
> +static void test_basic_sessions_th(int fd, unsigned int flags, int
> +num_clients, bool match_opposite) {
> +	test_client_with_trigger(fd, flags, num_clients, run_basic_client_th,
> +					 0, NULL, NULL, match_opposite, 0); }
> +
>  static void vm_access_client(struct xe_eudebug_client *c)  {
>  	struct drm_xe_sync sync =3D {
> @@ -1469,6 +1543,9 @@ igt_main
>  	igt_subtest("basic-client")
>  		test_basic_sessions(fd, 0, 1, true);
>=20
> +	igt_subtest("basic-client-th")
> +		test_basic_sessions_th(fd, 0, 1, true);
> +
>  	igt_subtest("basic-vm-access")
>  		test_vm_access(fd, 0, 1);
>=20
> --
> 2.34.1

