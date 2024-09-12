Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C28EE57C7
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A87410EAD2;
	Thu, 12 Sep 2024 06:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kjUs96tw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4F5810EAD1
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726120990; x=1757656990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gAnOW4TDO/W/MuZiytmg1QAEX+F7G/dgyP/UQAO8J9Y=;
 b=kjUs96tw5R2RYXeIjJN2m1bUhxYsFhgXYGksP2nLgNtxGujTJGG4E1gl
 s89ur5jYxtEY1neFGBt5muZWdSjf50Y3wEo157Ua1z7+fjZIZnSHyNsJZ
 OTGddM5THbiewakJ5ED5Ukrj4jAYcG1crLdi2nNSu2b/S8fR5Aa/08v3e
 w4WfSyeXFW+EZV5ljONEb4TT+DA074NJrWgXNtNPI8DIpXawWKDcFRxb/
 L+IpAr1SvY6BmnCe7u0mYoDX3zMHuT/93rgI18Ttmfk2OpuXZFhAqOFjO
 C8ox2nH9Gd6s3IvGlBWvMc704MO3dFo9P294BcfhPhK9p2EYxKMFjW+2t Q==;
X-CSE-ConnectionGUID: 05gxWd3SQxSmevsjkqd1eg==
X-CSE-MsgGUID: MzkMEHTqR4yt1TSPGyV4uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="36305520"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="36305520"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:03:09 -0700
X-CSE-ConnectionGUID: JqNsO4vNS2WhxsCWiEs7ZA==
X-CSE-MsgGUID: jCdSmDCRSlOCJoQHbqfT/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="72382116"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 23:03:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:03:08 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:03:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 23:03:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 23:03:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcLeYE4cQ2bLRNQBSDcEepYFx4Lth5RpKQvhJ5ZGgVxEzhV2eMNop0RzPSzmWjeRR8eW0zRKvmueda6r/LuWLiUJ/XfxTlWqsUnQZaxgB3HgNtIJGkBQdCF6t4OC/rLbObZqGwy2yc7FqJFZdmyXMsWvSFQEQmBt3+J+gB75z3IUJV09ykntHI3AfO2Pd34OiezySAbK4+T8jbva2GDqBDdg1HQWydK81Sb8p+3Cjzcht1qHbzHgrUcMRPw0IIiRdQXkFaW2d9xMr90u+0nz4q1rTByXd6SMZwbc5Vk7xxF7mUdKf7ANRYVeDLRPxfM3mCnU166qqFdkSCVMiCwD7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OmT0SWL/udkIQK95gUfBNlbLhXZ1HkbR1j6hyn7kHY8=;
 b=CJ/I2iPGSf3kqChbf7utGPUScldRMg4swOA2MDWU+drJI1ABWaY87LB7JDjIxG6O0meP+f2UOc3eqRM+hfGMiZD96uNilp8U02frbefYPiNwPs2FdFEKFqR9nLOywlw/yYmcA/L6IGFoZIJ4AI2UZUMFHFaB3R/nlOUpbyj8Q7iWYplYtiL1xg+x//M6Ibe0AFhQPiVhwGeZdX8uRW9BzEPWAVcqo6zKEeGN1g6Qg4LQSHwqjhzvXWQGbKIX8u6y8ThRNGCag1c5WAXj703UE75PwnvaHBaWAvK+mKJNuxxgeNFUyDVuWzXfr636S204+l9BgXhyGjiPw01et2/xAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW3PR11MB4649.namprd11.prod.outlook.com (2603:10b6:303:5b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.26; Thu, 12 Sep
 2024 06:03:06 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 06:03:05 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 12/14] lib/igt_kms: allow set and reset value to be
 same
Thread-Topic: [PATCH i-g-t 12/14] lib/igt_kms: allow set and reset value to be
 same
Thread-Index: AQHa9yiph1VJIGcCAU2a0UYMrEACZLJGLPeAgA2XKiA=
Date: Thu, 12 Sep 2024 06:03:05 +0000
Message-ID: <CY8PR11MB6889D0C411D69EDF45A547C0DA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-13-kunal1.joshi@intel.com>
 <ZtcdN3_PKDlJ0bN9@ideak-desk.fi.intel.com>
In-Reply-To: <ZtcdN3_PKDlJ0bN9@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|MW3PR11MB4649:EE_
x-ms-office365-filtering-correlation-id: aaeadc7d-eeb3-487c-1a44-08dcd2f091a2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?3C73iYIAhJNVSd8vowT+ZZYcp6nER3RdhMCqBmvzzxUCU6b4pfZQ6RYXogAl?=
 =?us-ascii?Q?sYhqHuPZ8YOGRangf0PLeEdySgCC+PaQn0jm8KNxRRWCMdbDJNLUMxOVZSRy?=
 =?us-ascii?Q?uCBzC5pltu8g1M425VDekhB0IWBsUDBfu+1rSb4I/ZOV57XsJRMjYzDymEbf?=
 =?us-ascii?Q?KNqITNEEmggRGJbhBR7D7RYLAcXwy/w2a5UOfKHvD5KFB0sQpJ0tsWiDiHPz?=
 =?us-ascii?Q?L74B8osusbFrCJBKZEKq6jB3VI2ReuLGebKi5wuJWHd5RwlDkCAu0Jx5CsZq?=
 =?us-ascii?Q?uKpjNHjp7Iz9SVPWiS7qBfru0cIiP9ZA3/87pRcPEbRCaIa7oh+uAmuEEbrR?=
 =?us-ascii?Q?J/Ckg5vv4Vdy0HiOz5ZkSbyav2LoIgn27pGQ5+GzusA0EiFZTOfTj4auHX9L?=
 =?us-ascii?Q?3iQoCR6B8Bky0h4Gnh8HkMvCTYECWFJG19/FvY3YeJ+3ZlvEIEWKc8/EzQtn?=
 =?us-ascii?Q?7S1wOquFe6ryTVLFNOjLmenUGU0wgbaT1F92RuOvhh02eciBtgY0APcHG8kO?=
 =?us-ascii?Q?+J89tdQ6Z3foKnFCf0tN1cLnb+R6xKd4xwxY10tE+BNvygJO/aDLadypkcBY?=
 =?us-ascii?Q?Zs8Th5Ah02CoahymLN2GZn4cfNg5QKa6BA/CXWtwOe/Np6+zqLgArxvtgImm?=
 =?us-ascii?Q?zUPkQIL/E414gAalW3u1M9ewMg0VmBVrJg4NzLKCOaqmjvBh7pDVLqxnpEHB?=
 =?us-ascii?Q?UG/D1PbAfXyQShQxLsMy4v5icky+Nwl2T7F1WxLKUztkgmmjsaLc+BWTjN63?=
 =?us-ascii?Q?UxrFnl6Q9U+0zuY9sVMA0RaKLakQYMipkioG/LLAbD1Ko/fn3gliakziJpZO?=
 =?us-ascii?Q?XnZ5oePHqy3Ly+yjTN5eMKu73U9H23462KlyOOZnJtI5ZP4G9GeXlRk0dkQa?=
 =?us-ascii?Q?R3UnO65islCMpN30K860q90unpHfb8DMch5l2hWKTI1yB5BHIBwvZrAamzW9?=
 =?us-ascii?Q?DWObE/RA6GgXzc4o0p/HttszlkT7Ca1SxdPWF4dNxwPeeDu6lsAv+PTQtxTH?=
 =?us-ascii?Q?WoiOacIdGFvppCsYuvCWL+NynvcwtyCngiG1VPBNmVrffkMeB4Sxp30tF2Hp?=
 =?us-ascii?Q?FSjuN2s5Xp5TSW2jVnU/Xnmu5r20Jn/vpqIxZ0zS+uaFM+vJh6Vjp3IMgHFg?=
 =?us-ascii?Q?ldTFniizCWsEn4wTefjXqskI/IqBbFEuchEHvRbYr/JCG5appSLBoA7FW3WE?=
 =?us-ascii?Q?h0iW4jntimcR7CKG9aA6nZoXmZWecxr0/YleOGpr/5sjB+w9TzjRkC3UoHu5?=
 =?us-ascii?Q?JlzPiJVrE3wJeeglHMpW4iIvrsen1JeeccQVD+Bek8HI/+HhrDmidQ3mT7La?=
 =?us-ascii?Q?lEOddRkZ4IPLeY83RTFusZ6DjCrnzf5UA1fgQORixwiq2NKQJJy+99jwpGYz?=
 =?us-ascii?Q?DMEtTkk4elFu7YHM7SJHx7rUX6anE4qU1ffcoZVJfhL3meruJw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VgsC1XqbGXAg8P1Bn18uoubpHLiQVla6TR1RJdJXLCqbuc6285guIrMbB/rv?=
 =?us-ascii?Q?J8JzWz8W0esFtTxw9CX6T4Jgk3ODtLmE8mBOPCYHLJNnjZB82aGA2lLd+yHB?=
 =?us-ascii?Q?vZpyP/7uZOYHcaLD1aT8kZcNjhE6peZUjbZ5BYwjB6zRpcI6H86umzf5qbzA?=
 =?us-ascii?Q?60kr7cDkGUyDxVixvXrtk7luoI6Em9++phnA7eG2C6DkHeNwDuPvstsUNEpj?=
 =?us-ascii?Q?XbDiWn0NUpU26dEiBFQQXmqDvNDDk12IOKAv6g5yLA4GqwPJC150PiWFb6Dp?=
 =?us-ascii?Q?9w2RURM3O8eqWNb1ZZRsz0gdSYawZ3YFeaXkIfLZPygZex6ohbtOHIogvQUU?=
 =?us-ascii?Q?e3o3ZUQph+0gdhVhqmnmfKgs2qTgops8ij9K7APLiNJqkk1KPkyh7uIaGZ4p?=
 =?us-ascii?Q?llWkpfgk9XVYnpRlfeeH3Ud/A3NW6KC/PLPqNeKNXdgsFXfQN01h4bL53ARK?=
 =?us-ascii?Q?3vdkXGJ2+XxzxzUk0DnLXc/g39bCh4oAOY3h3KYxVsbxtgmBtjCwV5rq7vX1?=
 =?us-ascii?Q?LxR6GC+9Rntie5dR3uIaEPeGfi08Tw3/uBi6zkGvZ/TwZZn352IW8R5G7lie?=
 =?us-ascii?Q?lzw1mw8NxoFu07HgX2NTy5x9hrdQdWOSh2gCN50NKYH+Ey9oA3X4OI2HXSjg?=
 =?us-ascii?Q?KCIg5p3BlJzNnUMTWgOkJczxQjb841qy1uFgvlVjhhCPu4+oNooBurykK6GG?=
 =?us-ascii?Q?y7v+K/a6gCkoulzltve5V7igc1ppaMrg5URUqsMgVcLR/iSvWiMhKGZPa5Ad?=
 =?us-ascii?Q?fJy1SKXCzSJdNOXsTfroxBMomJZCLa9Ih657G50f7YLAoVkkvdih9PRT7J/8?=
 =?us-ascii?Q?vAZPjGsrd9z6RfpLNwHHGuLVRKnBVlq0UIrWGq2huXy6k//lrH4ieuG+/Bm1?=
 =?us-ascii?Q?ti0CI2sHPjqITnx7JpLG9G3bQl7Dvwwprlv5garYwLcgqJfFPHFF5Xm7o9QU?=
 =?us-ascii?Q?SDQapAqTOm6x5rqJTs/0bFJipRuDdVa2UqrS4ztxMf5NoBYYHSbNOLaqDDW5?=
 =?us-ascii?Q?NYM4CItfmQsMCfJtlkOmKxrqcWNw/hzdojeoKUJILJ0P+kM3uFl9aHcVXjuJ?=
 =?us-ascii?Q?00lvsS+9aW4TY/Dwt5Aul+YVutOkT4/v7zdnit9e1p+Pc1I4A62c4sYIc/TV?=
 =?us-ascii?Q?YOtn4iLcJ6vKNcZQ54hroGf9OU7GJ3eqeZN6a15V1w0IvPdKgoGuxrPTQ9/L?=
 =?us-ascii?Q?rTIuy0V2jpPcn/WRzK3rUYH3YZKjktyVMt9ivg5sAsWaeeqO1vOU/TLlsECw?=
 =?us-ascii?Q?9jm1aoh8X4jlKJc5pp79SF7ZZIW77rK3tQXfgmUnjL9NdUETQ02PnEid2461?=
 =?us-ascii?Q?4pJ3AhnVW+zb1z7a0thkYnsjzuDTSH1+YMr6L+ybIkONj6f3FY9ouzYVQJ0m?=
 =?us-ascii?Q?GCSmoM52l7BKmmRWUd6Lch8SaxCIpD2lJsLehQLypdJkhQkdppbdgAB9P7nV?=
 =?us-ascii?Q?8tsorMp44TrfsuRWXYCcsyCysXnPWWQmw2ggR6QwOITaeXtn2MbDjEy0yObA?=
 =?us-ascii?Q?LfXLvefutPLKuhaoPGTnf1EHjE+H9RvCooUS1QtaqJ255IJ8W3qJprcJAQy2?=
 =?us-ascii?Q?pKd7RvNI8JVvGtw01hvS5S4AA3qM/A+4F/JeydPZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaeadc7d-eeb3-487c-1a44-08dcd2f091a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 06:03:05.6769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sripG3dyW88Z5/erCCMQ3ASx/Z2koo0K4+ahG2pzPMqegE8DO8br3lP0T0rY5N0SYl+9Pkzcse4h3ED02lQGlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4649
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

Hello Imre,

-----Original Message-----
From: Deak, Imre <imre.deak@intel.com>=20
Sent: Tuesday, September 3, 2024 7:59 PM
To: Joshi, Kunal1 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 12/14] lib/igt_kms: allow set and reset value to =
be same

On Mon, Aug 26, 2024 at 01:36:10AM +0530, Kunal Joshi wrote:
> allow set and reset value to be same, let the caller handle this=20
> scenario instead.
>=20
> example scenario where this is required.
> i915_dp_force_link_rate should be auto before starting test should be=20
> auto at exit
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index b7511ccfc..5427a849e=20
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1572,9 +1572,6 @@ static bool connector_attr_set(int idx, drmModeConn=
ector *connector,
>  		return false;
>  	}
> =20
> -	if (!strcmp(c->value, c->reset_value))
> -		connector_attr_free(c);
> -

But it's not handled now by the caller. I agree it's better to keep the beh=
avior for existing users, maybe adding a separate function for this (named =
*force_reset() or similar).
---------------------------------------------------------------------------=
-------------------
Will add parameter to allow similar set and reset_value if allow_eqaul_set_=
reset is true
And handle this wherever we have used this.

Thanks and Regards
Kunal Joshi

>  	return true;
>  }
> =20
> --
> 2.34.1
>=20
