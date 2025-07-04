Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D0FC83F03
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 12:29:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BAAA10EA1A;
	Fri,  4 Jul 2025 12:29:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RBbOqY1i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA6010EA19
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 12:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632157; x=1783168157;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/u3dtsYYvNOGpJUUgCLdy2l8PWG+r4ANWKpU/LuvuGY=;
 b=RBbOqY1iOgYMoMb/liUXGMmMEDBTFmBSQKq7tBF58N331sElBSIMWBE8
 g5yfJJ+4YvxFFJZLZYSZF8MaNKfqdQFVTfuBhtb/S02nFYkqvLUD519gl
 rILuXw23qptNaGcy8rcHaPwza8Mzs/fVuxg4xrd//5tnssfX1iTBotu7d
 7YqA2xWfGDkB+IR54qK54hsnWMOE+FhDi5HKUVRnLhLKPDUJyb2BmYhgZ
 EnKa4rE5CHQJpLrLH3AauDLQ8+kO3tlcvuL09gymXW6dvQULed9z8GLLh
 S0UTwD1YEPsNDwJofzDCsfQZxcyijvCeVWbFsP5PrO3gkoCT9mO4/oLqd g==;
X-CSE-ConnectionGUID: 0B86rPZOS6iV6FZtVwsNiQ==
X-CSE-MsgGUID: 5NSdCdyYQTuAFucGJyv3Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64567758"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64567758"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:29:17 -0700
X-CSE-ConnectionGUID: dX9wHirYQECQoqV/4NgBkQ==
X-CSE-MsgGUID: yYXiTL6RQlOlv7K7h6AXeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154054938"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:29:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 05:29:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 05:29:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 05:29:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRf+jet3ktlqJrlC5ojNEfIURAQfip1n/jA+wVzUNS6shZPi8QErC5uJgESDY75APbIvUzMkbZtL3duJGJ7fmQiCi/YTbWNIn9BRQ0QosA9x7NxD8voei87RI3K1I+y0LRbfYVs6QL4cV5s53aD3tUrxYy0uXj4rJ5zdIji628j/wJKv/esAjF8ZPyVxHQVjC1nS1J2j9GTsfEioqyrMgOXkugXym9HRDc0RW4ppqqZ+6UpGjeBHMADkGE3/jTwPwtvD73yaXgLIi7enLXb6sz61qnm4Wl5ofZeFg6vSXqMZOGIBCc4lx2RKhOGDbAj/Af1R6L05EqTQf5IXCLyklA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NcEWOfSeBshaDb8xOOVyBbHQD4j7XO28xUeKiR9lkzA=;
 b=XEEadgp8eX8vntnwB12aGovaldf4UuhucGq3eBGsYjKrwCQQaVNAvOA+Y7yc0+GbIEJ6Q8mh+TPuOr233UwzcuQWizY9SSkacUcq/2DzVreRm1mv1T74uETWG5TaaSqx5aIS5qffgfZP8H7J0FnN5XB9Eygk7xvFPqclmrL700JohVtTUQVZcLVo5lxcEW3HnC2FaJfw4e+7kH14PF8l3k4Syll9n5H7kNdQfESNivwtftAG5L83HwSSqsTEK075VGV0mOtYsY1aGTokNei7N63iGK79v68j7xI2HzdiW1DDdBj6//25t6ypAcJTexN7aQFjcFUP+PWGMEt7gaMS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 SJ0PR11MB5071.namprd11.prod.outlook.com (2603:10b6:a03:2d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 12:29:14 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%4]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 12:29:14 +0000
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
Subject: RE: [PATCH] lib/pciids: Add one more PCI ID to BMG
Thread-Topic: [PATCH] lib/pciids: Add one more PCI ID to BMG
Thread-Index: AQHb7NeYUCu8ZO2zZEiLOTP98JOiNrQh4piAgAABTOA=
Date: Fri, 4 Jul 2025 12:29:13 +0000
Message-ID: <DM8PR11MB5624B0CF53C28F2879698E22C742A@DM8PR11MB5624.namprd11.prod.outlook.com>
References: <20250704113356.100859-1-ravi.kumar.vodapalli@intel.com>
 <24129ab046212a1b989c94fa79b4e3c660dc6118@intel.com>
In-Reply-To: <24129ab046212a1b989c94fa79b4e3c660dc6118@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5624:EE_|SJ0PR11MB5071:EE_
x-ms-office365-filtering-correlation-id: 1640030d-61a9-4799-3227-08ddbaf662ee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?f+Sgh+sJGY3MTitiPT0vsmOMPBmInEhP2liXTMtCjKIYg/Xszy8iwz1yotUD?=
 =?us-ascii?Q?x6MN+zfyzCIuR1bGk+zu5yGA7/jIWxGWxqjSzaGb0YNR4EXwMfVeoVXPYfQy?=
 =?us-ascii?Q?KLYXw+reBuULZ0+i5baP42bdXd2RE1Q2t3qtmsHCn9IEGjN+rHKYr23DPJiD?=
 =?us-ascii?Q?lYxW601Z/1QB5TSqdMLym8Y5a5ePD8febhGCdVWDnINo4SPtl/twHbOnOC0k?=
 =?us-ascii?Q?A6UsIej4uXxfioxq2sfV54HuNgxjObLl6hKfm0ZrzvaI5GBd9Wm6Ucb0NRPA?=
 =?us-ascii?Q?xmVp1cdAi5CpgzwpaAPqLgQEQZqe0qoU4S6yzgVT2c0Z0oTpq4RahKXgdEH+?=
 =?us-ascii?Q?Iy77J1ihXHZXktLc/nNlSTsBCXE/MuiQoBO0JBGA5WY1pwfRGV7yOPs9+3Y/?=
 =?us-ascii?Q?jpaN2o68gk6R/9Sknz7lpU+yVYOmN28lOgKtpAYlIkhLLKXC8gN376CWuPyE?=
 =?us-ascii?Q?vLdo4IijyJuAzPXXZDal911XVF+gw/ZxMMyLCtEwuG5hH3TehKQCLUWWatml?=
 =?us-ascii?Q?5r0dM36jM6iK213yvw5d0RsHFmWpWMiuh8pYbcY4NsIP3HqC1XYXFrKJqavR?=
 =?us-ascii?Q?PI/ClQfa9KI1NP9yXugz+LHtWwPDfwb7BDhvPJnznHRTIXkVVvvmg9ZGrDIi?=
 =?us-ascii?Q?/VTxGxGBelILpm4pV1yhwyHk6x6+U0CaIlI91Pk/FZlZ/kUiGzcDH6E0HIs+?=
 =?us-ascii?Q?27b1S0PAIti+pPT2v5GltuJ1+i2b1JsgqNf/2kZlLihiT9RjO/geeI2iqYx0?=
 =?us-ascii?Q?OPrgjjsCOGt69kj1XM7TDN0FiLWd8lWBFblcmW41Mgkb/MWYEmEna9eAD0Oa?=
 =?us-ascii?Q?q2QWuGJqIOew6ffGLGxkwy9hhdw1iDsukqXGmZp85WODi24H1bxM8Dwn/rqV?=
 =?us-ascii?Q?yu5d1rY174mryuPiADFpDUjrqTeE1uZBClX4gMwMe9IKcd+zsUMF3o3ONoAG?=
 =?us-ascii?Q?NHvgmz1zV3M0Cg+kU9xCKTVjsEe/XTxDqXA7HE4pMMTxZnbFkMJUCkv995pP?=
 =?us-ascii?Q?IfUmfq6bgzIkGu5v4OH2ijrFcQoop3fx+zRAjcQSGg15KjWKWyX3/UuXzfJc?=
 =?us-ascii?Q?jzGkx99FZVjjwp8OuujGEqXIgg01Fdq+5/GfpBN+ihs1RsvQiSzIOAl+UIJ/?=
 =?us-ascii?Q?cilnTBmFtbF82yuR+X2vuC7RAtXu9bEOH08rUdvl+HYgLluCgLFQ2CmmDsr7?=
 =?us-ascii?Q?XCk9ZXXjpBckEWawY9uwPiuZiYCXD+DU33ed1iqx/yrhrCJajBUNg54t72+c?=
 =?us-ascii?Q?meicfp3GEDRDUmfSVPU7gqOrZrKwb7gzgqOs1DuSrNPA2zcug60uR8mDHJF9?=
 =?us-ascii?Q?4mmZEPyc3aYWM+6zwP539Pr+vc1OhCvNx78CJqYHE+/8/Stu4sFtzewseS9G?=
 =?us-ascii?Q?wekY2gQ4Jb/FrYtPljVZmM51t5JKmzRYo36kMtP2hLeRp0SL2qivsl1jnCRt?=
 =?us-ascii?Q?DK5u34aF+lORkYv8H3YafLEwRzz3n+zK7UBgiEYSS2yhEkw+zCtlHnBgQQan?=
 =?us-ascii?Q?glz/4iAjBHF4fdg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NqkmQux8vYx74+4RO9YQyvkztn3CNK2RxDCc4zn9T59Wfs7/C3l4xX+HEmfi?=
 =?us-ascii?Q?cmw1b5E+WAr+I8wuvlhWq+85ZGAujczOr4eK9E4tHSZ9tHDalA2S04aJKNuz?=
 =?us-ascii?Q?98x3AjD6o/6aip5OkYc30XSGbtVI9BEB6PNKRRfN+gv5tKRLZAMwkC/mqfC7?=
 =?us-ascii?Q?xJIMF5rva1So+MYjmWrqiWuUqt8IM0nHOOruFla85oGwJgOYXbXZVS2bVW+J?=
 =?us-ascii?Q?wGtmji4fgqdfSkZPY7qWRDTpjQCadonZRPeEWjqGMTqwPIHeDzTX26TgqVBY?=
 =?us-ascii?Q?P6LP1MJY70uHJRCB5XDV41VLmgeccOkQBXFH9rwGRnDPseaK0P4BwNGkz2kX?=
 =?us-ascii?Q?hJfDMotQtzyoI+TRXfkLukchL+JEbbr1A1vy9gNNQi+7HjJqfQ57mfAAOuTW?=
 =?us-ascii?Q?BU/ALmkN0cnmpbmUxjlZL8qit0SSWiRI0QqzpZHcGd4PNXxKUZmUraCW/tY0?=
 =?us-ascii?Q?W5eTgB/jTl8HK2MgKLfyG0b1kROSr18W1HYTrMuypJRKZNMHYo6Qu0IgTJgq?=
 =?us-ascii?Q?qPf3bqoVopBVkVUbBsRWUm2N/pHDsm4hnFKzz+ruL4GcvAgKCguo4yvKvDzO?=
 =?us-ascii?Q?1GRjxoOnUDqEollhrajMpfKdsZOpNZmFTnfe9chr4sO/iiNopRK9sD/kfsR9?=
 =?us-ascii?Q?pSKI36d49ZhpxGV3DfDhQfVx5/iJZjtDroy2Y4aGixmh12ZuEtVaRsaLfZ9A?=
 =?us-ascii?Q?ZLWXp79KlYF57iEKfvNpkqK4JKiDoCFGjb4hkP0ODozuJOKsMjYhGhJwkDhU?=
 =?us-ascii?Q?kQsFV6i4yk2hujaDTvybLGlgTCjLFKiCwNKbSBh2SfIZiUWum8YtLjhsVpxY?=
 =?us-ascii?Q?h7eDNSL0M+aQSByjKZ+E1e3HZckpZVHrwOI0u5QUh+cfKxqi29yxN+j55lL7?=
 =?us-ascii?Q?6DfJTpbUpVAcSyqgd8mZ0BI8OwdBZDCnW+n/qH6iKrLY9W5OAIStAx6BLFUV?=
 =?us-ascii?Q?dLEh5F/b9vQqkg6BIxRhiOu98L8qQz1eVwwBCkGQgMPgPRyDrjCzxPj81vZR?=
 =?us-ascii?Q?ultQnq4F9oiZhDL7GYdzB6oNHO0lke5ga+vBN6yqDiz2k67lrF4dDEKDkcdx?=
 =?us-ascii?Q?S+wjeWU8HJb8ehN9X74rmlJq5pcaIrXKDuxO5/rpq2os5H8x3qICCdtbvTMp?=
 =?us-ascii?Q?lwjzcbVeatsGYLEjs6/nYEbKEC4Ao0zKYiks8aIkfr0pYMDSWCiBYOufbBXV?=
 =?us-ascii?Q?G04xxuDbMMgAr26GYbpQAx25AYsPQL134JMXjggYvDVONf/Z+/H1jz91Wnju?=
 =?us-ascii?Q?GJh3INgEjS4Zmho0XQqKTpxsqYS2CMPbqyWVGrNGp4dYpBaIqfb8iyDA5KjQ?=
 =?us-ascii?Q?YpOlTda5auP6qUBe26QA0J5dXPbDS6uKsTOllgVmcV8s+dMAdfzs9+aOdKTS?=
 =?us-ascii?Q?BMgwGn7WXGEEhISRWDfehprXYdfKnTAIo6wCNMc1MS5W3BXciSpyunqoDZTN?=
 =?us-ascii?Q?HNAW65qgV/PBCGh4BTLJI512C8I+PqM9GKQ7mrPe4Dwq/nJMuoHN78an5H5i?=
 =?us-ascii?Q?yC6CZ8M7lmWED4IhNhG31bX5QwErJBCQRms7R0Hgxzk4ox9oVzI8jgNMI0/3?=
 =?us-ascii?Q?Ct8Et56Cbn0+Q8po6PRr+kCQl/m6IWTAupw9By98p38egQnTjeZaEpEk2A+E?=
 =?us-ascii?Q?Aw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1640030d-61a9-4799-3227-08ddbaf662ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 12:29:14.0725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uf3GIxZQATcXxf/VCDelaB+zhMxztXd1p6OM09HTBA7VVlqSCwvtXx14UC02wzoM5XcbyTWaaZiqe8VvPU0XNkSqf6ozfmpUOz9Ncd7Blas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5071
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

Hi Jani,

I have submitted kernel patch it is not yet merged, that's why we are seein=
g this issue, let wait for kernel patch merge then I will take generated co=
mmit id and put in igt patch and resubmit.

Thanks,
Ravi Kumar V

-----Original Message-----
From: Nikula, Jani <jani.nikula@intel.com>=20
Sent: Friday, July 4, 2025 5:51 PM
To: Vodapalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>; igt-dev@lists.f=
reedesktop.org
Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>; Vod=
apalli, Ravi Kumar <ravi.kumar.vodapalli@intel.com>
Subject: Re: [PATCH] lib/pciids: Add one more PCI ID to BMG

On Fri, 04 Jul 2025, Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com> =
wrote:
> Align with kernel commit f7814ac1cc23 ("drm/xe/bmg: Add one additional=20
> PCI ID")

$ git show f7814ac1cc23
fatal: ambiguous argument 'f7814ac1cc23': unknown revision or path not in t=
he working tree.

So you've sent a patch but it hasn't been merged. Please wait with the IGT =
change until it has actually been merged to the kernel.

BR,
Jani.

> It Adds one more pci id to BMG.
>
> Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
> ---
>  lib/pciids.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/pciids.h b/lib/pciids.h index 129c3172a..666265b5f=20
> 100644
> --- a/lib/pciids.h
> +++ b/lib/pciids.h
> @@ -846,6 +846,7 @@
>  /* BMG */
>  #define INTEL_BMG_IDS(MACRO__, ...) \
>  	MACRO__(0xE202, ## __VA_ARGS__), \
> +	MACRO__(0xE209, ## __VA_ARGS__), \
>  	MACRO__(0xE20B, ## __VA_ARGS__), \
>  	MACRO__(0xE20C, ## __VA_ARGS__), \
>  	MACRO__(0xE20D, ## __VA_ARGS__), \

--
Jani Nikula, Intel
