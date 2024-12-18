Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD705E77188
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A96210E142;
	Wed, 18 Dec 2024 22:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eoZTB+PP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FA610E142
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559479; x=1766095479;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KT80BrGOLAAcSTQlnaFhImyO7QUCJWzbiUPwt7Znuro=;
 b=eoZTB+PPsMNBKU5lQ0hCYUHl4VxGotfzjI5lsa4XzezMsEylVDTrcR5I
 dg6LKeDMODbtXB39/6c/KuC3PXQlADu9fyBABjFgsD9XqYTc9sro1/dEl
 1OvMBWD0jtuCqUTcGv9JpEiSgVW8CnsaB2uaxQLkZKUEAWoBItm3XFvPl
 gLSCg8kcmcbTbOaWxr9F8noDBeO/Jn224XAyH2GzTCxv1PtcEsVH4lFmF
 NPi02wIzr6RusLXWPUtC2Y9moWnO/LXAs6cKWPmx2W3lm/NCDcNbKtV/a
 eqmtTx+eq6HP8ntApZZ7T9epdP1nESLp/M9yDrX1QIoKwaHO1LRVQ10MB w==;
X-CSE-ConnectionGUID: bRIObOGkRU2PpBTIsWoLaQ==
X-CSE-MsgGUID: 43ou+r9PSC+9+1g4RXPtkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34938862"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34938862"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:04:39 -0800
X-CSE-ConnectionGUID: BWF1ZJ5ERu2jAbt2dVwJCw==
X-CSE-MsgGUID: XnqU0ebuTL+ky2Scr6oLKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="98471420"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:04:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:04:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:04:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:04:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHsT56BYa+m0DuwQLFxLU1T7pwFdsPUFwCVDmMor1lTkQJURNQM0qj57OLrenHNKddJ1iiEX9s9dk7loky1l/o3CpgZNjLYzFntuVpnn6fkWVpKSHO9ALl7eZzK7kePk2LlcPxK8ry3cbDtd4xn/f8woiAef/7b2vuyx9LRUsFwmlb8tAt/87u4RpSAoExAj40z2TllQmQTxy1ltwgZGarRW7yoPP8OWF1ew8xYD5JxIgYRrIJzAWOTAhNuaaO+qSwRVKnLTVOXhpe7020oyyjxw7Trab9ZsIBbiSGYbGNkgIClVYrqQ57xwlg8AijykzSt+Q9ej7uzSKeWMNlXXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xj9ytupj0++GRHdUks9FaxUk4K8YTYBAuzJnGjtuUR0=;
 b=d57zpayE4swZN4HuFIiJQT+owOv7Z2jHaeTelWkxm1ZPsU3UzxkM8n86zP/hk4g1MQ8oS4hPmMGpzeJEf0OwfvJ0BWPkCYXc/xt4cuHWS19LFnM6O0gcz4oOTSPrKtVjXf+X5oSacMHH6Ny6SovyYef53jhvUnoY3ShfIMn3O7xeH5SnxhvM7C+ZQQ/x55jKXLKbbj9LgOvuY11/XptjdtTl6A28WJQcMHZasfwXfLpW6GATTBKH8FeLz6hxEg+22tSTN39gl8i8PjVqXmwQNciCm/q8xsilv/T31niqEW6aurU0R+b8ycEbO5nCSYXjT35uGE0OTwCp8tiG69RYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 22:04:19 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:04:18 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 1/7] lib/intel_chipset: add pantherlake
 definition and support
Thread-Topic: [PATCH i-g-t v5 1/7] lib/intel_chipset: add pantherlake
 definition and support
Thread-Index: AQHbUZUAQh21dygV7EKj6lM7N5TfgLLsh4gg
Date: Wed, 18 Dec 2024 22:04:18 +0000
Message-ID: <CH0PR11MB5444CBFFB52F9498B9A23E23E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20241218213654.2734573-2-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-2-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7803:EE_
x-ms-office365-filtering-correlation-id: 53f7d6af-0599-4284-7453-08dd1fafeb93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?hHt9ssiKHugxtlDp7iD+ar70kMQhs1FejZqn3KMxaNp3EuacSX0xl6Czdsqs?=
 =?us-ascii?Q?9AH518JU44Qd2y5iywCs6KoaIP757AQRlCo9iLg0xPq5vOmA9P6eNzVjD3v7?=
 =?us-ascii?Q?IL9+1Xe/+xpvpVMn2ZF4pzq495qQwYkkCVZA0YAWmB/yQ/LsaFSqQ5qmI79B?=
 =?us-ascii?Q?+8N0hRzVV96i+oHNpyaLe+O8hoqyGoqIeRu6iBNw1RDt/JiKSmV32rOKTlBE?=
 =?us-ascii?Q?cYXDrzA5Z0aFeJ3pvhpa10zWLYbS1F+tGcd/Zu2b3l8f3zwAvamI3iQ9gLS5?=
 =?us-ascii?Q?6kGnNn2wNxm9+3Qsm+zfFYtYAEvh5jmhCdpuqIEEIpIPr8ehX1QV4JJ8zac3?=
 =?us-ascii?Q?is0lj5iSo2vgNCtK0zF8doCRJIKaNQ4wM03gMH65kMKGNq82opvzxKv0ETtr?=
 =?us-ascii?Q?8maY/eua/4m8an2NSPEXU9NNHoo450elbi/T5mhiIjKWG1qbpuJ5hMrHtJUP?=
 =?us-ascii?Q?MSG+0vU3dF3GWXxKYQJwp4I4BONIlktBMnOw9o+5tvIDRR2/U5D9ZtLfPOwy?=
 =?us-ascii?Q?gG6Yza7PSO4BUNDnUC1Js9IjENpOLo96kh4Gi2ydgd2ndKAaEj+M4MGP/rw4?=
 =?us-ascii?Q?g6HjMw4YDS51yyuwcmdtpCxobXqGWsO8WU8hW1zPPXFDswvoRVjCS5pzVKc1?=
 =?us-ascii?Q?ie9j5Y3IMRF2VD5ouFx7hUa3ietmnCstpXWcc4tDw4wSR/xVjJtiu1QmCA0v?=
 =?us-ascii?Q?2FcCVlGPPymm7RZBB3TBqB9+pHYXSHU7XQQvI79CiRYP1lK9fd1V3IJu4IBc?=
 =?us-ascii?Q?zMlKguY+oqrYi0A5UgXphrTVKzUAiUXoYmg5r+bD7Zyr+l/GTP+PHB437GKF?=
 =?us-ascii?Q?RiXWOvvI931bhXFGnVTTfB4zJmRv6pfa5tZkNbE+9tj43R4UCXWbcuZ9+sld?=
 =?us-ascii?Q?mWPSfN37o5VEVI9F+VamHnM2FmHeh38jPZ4WUENCtDEpIBQLbvPgTWWc071o?=
 =?us-ascii?Q?1V5dvB69gz+YHxD/9byEwPWsv41AoRlX+Wr0OGKX58SSmE5i/k8VBZPJ4FTu?=
 =?us-ascii?Q?xrWrlEOhFyPNZYtKW4oel/a/74SnhqwH7mDz24d16jprzNZSIjHaP/rKP+D7?=
 =?us-ascii?Q?phKzk7uAfxk7CT6TQW9SiXY0z61q79Tu93fR9DUwPkFCs7UwZY9H3Gk5GXbh?=
 =?us-ascii?Q?h4gUsavU9JJX6qx6mPz5pAB4j2j8m4ko6470zR8mL11P9JYdkFlChAKc0aHQ?=
 =?us-ascii?Q?6voUnV0Dmh4mKHbxHdLvb0xKAmSgyL7+beoM5EyUc1zUfx7IC4aFpGI9U2xB?=
 =?us-ascii?Q?Qkj4rLSsHFxlaupiC+t0rT2VmjutEIQt9pvuQZkqqpaRsqNQB4SQF1ziefYP?=
 =?us-ascii?Q?2MoIT0if4A7n/btpSDbNWXknwngEa6KgSVaUjMsdZywRfWxrKpJnlESXg/rr?=
 =?us-ascii?Q?ITFsZ/MJBAV2FYp9S00EcsTYJ0v2Jhgd9C2Cios8aXk7uUnCRuurKjhiPlI9?=
 =?us-ascii?Q?m2bBdbF6FhI/0ZVWWf1U3uj4SWNIm+4D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?071+yGiV+QZLpX0NhCT7Ern+CAOMGapNZLQlsoWjH6GiOhzQ/7gOe5dCG1oA?=
 =?us-ascii?Q?jX5Uy5V3dW/mRLTGV3OnXO4JW9fhjZIZrSyI9oor7DiRgAMIH26BiT+mIR5b?=
 =?us-ascii?Q?Yqs59ChqlN0rnfzg11eUvB6T1xQ/zDyEYZ87oFLEUrYUM3guUndx+QdxXYSf?=
 =?us-ascii?Q?RCfDDQlwn+aB5hMUPIaq00lFZVRMfrCLE2TqlDkS30ykchbn04zKw76Fn+g/?=
 =?us-ascii?Q?sGC4X9GpPktVPoa1DXNnWeoZ+Z/62HWJ5jLtEyIBxEiAlQbuEIEla9ttDJkQ?=
 =?us-ascii?Q?2vkOb2Xo4DuDVREpfvsuA3HexMgFjOidGf1A/P9/s1+8VGuqG1nkb/9zEsxD?=
 =?us-ascii?Q?YzGbWQNOLmHYWgW297o8VGUB49bYe8CWZjlkfd63f3gZ+MvlzCgN/GoW2Kvp?=
 =?us-ascii?Q?dzFwXaY2GuS8GaHBHH+f1Hu+8eNPdLEipEwXHEa+6NjRDetaPUls2zy3i9FB?=
 =?us-ascii?Q?pZZ3SQ92g9LW5FJ9HGKENKyqTZxDrGJGbD8CBzb2wzOTOncpupEw2vPB4n06?=
 =?us-ascii?Q?7qxQ0lzWANa8viU42zyG0tR9uZOscnCkfH4akcQn94HszbsdQ+kiGgpsd8iy?=
 =?us-ascii?Q?ImCEj3SXg+y8k6kNWmIqmK7HFyuVOsyq2imeiEYjyOlkrV4VSQr4U07L2Sk4?=
 =?us-ascii?Q?QynAmuTP/GeTaN/kCFI33voE2qqx6TTZ29KZCAqwxZa6uWaDlB6h25hhKA1i?=
 =?us-ascii?Q?nzHi2Aun67GOECyMZQ+MZmLZtj0PNtR7J7MGjZx+H8o5xOqEgNFd75o0iVCh?=
 =?us-ascii?Q?EOutMOI32UQNFjOp//sKcrsAHXTQ0xu0Mno4cjfjhWFh2T9YLwsrW0KtEGsa?=
 =?us-ascii?Q?Z2Do1foKaZK1EGJ/zLf+ZRfkk9ESUxbq123ju0PxSTQclzkC/+dA8yHaMU2E?=
 =?us-ascii?Q?3ZHWEUBqWMEKKT80Zn08o/YwvzgiIm6LHeVy++4rpVMxBdji67u6xUCfNPBd?=
 =?us-ascii?Q?PjN6gwZpH+f2/jBUUwqUOJGUeEL/OVBWSQEJz+NlUtyrK6DUK0+7Dp00Aaaf?=
 =?us-ascii?Q?NSyTOO5wicF+LCVn76nvlVduY8Kp4r0/klD/Ah/27h0pmLTQyeb8P5JK35Dp?=
 =?us-ascii?Q?QxJ+Ud7+S192oAg6YciYEe0PqqlYHKz47+eoZS/9rnTAlRZMVgoWYiWzRBj0?=
 =?us-ascii?Q?b45bqqT6CJBR6YBiu4s4v3icOCE9xdmt4RSvSm7eVDQKbVGoqtZifQMfzpGj?=
 =?us-ascii?Q?nwiP61KHARyV2DEH4bDiBySqcraP3tgsENdFmuTACnFfkBBTHGeeAe2C8lXq?=
 =?us-ascii?Q?vqc50OchLUEeN3Lh2zzUFTAVvQdnrgzRYb2zXNWFTEaQYgLnbQIoemnwobfg?=
 =?us-ascii?Q?KfHkNkGzqhvZFJiV4pjOGFXDWckDpsYVM88RgluD2ZGYsuzfqK0ryP3TIptd?=
 =?us-ascii?Q?V44wjKigXl21Z14aHeM+75Lew2/jsLHZGPSXuswn2oErq96feGnxl9h3i0gd?=
 =?us-ascii?Q?HY548JRnY2lOyTo5/SJemZj62TWIAVH5vnsNi7AAOXibYEhvFXlDES8wvB88?=
 =?us-ascii?Q?WQseH0EMbNxzqRwB9YQUJrMO8BUrHq+1skTKjzavLsDdINml0qB7O6BYaUNn?=
 =?us-ascii?Q?Mzg6QiphdX7Ho9+c+y3GEgPFHMRulRFOZB9f+z9V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f7d6af-0599-4284-7453-08dd1fafeb93
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 22:04:18.7990 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xgJqp7BPY6oGqc4PyKMT4adSuEuCeHj1MAPG5Mad6Czmzoz7UiwhQpDvsN+fQJj4yDi68UspPHGm53u0PAgC0NwnTjkV9vh3xol036R2T38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7803
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Clint Ta=
ylor
Sent: Wednesday, December 18, 2024 1:37 PM
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 1/7] lib/intel_chipset: add pantherlake definition=
 and support
>=20
> From: Matt Atwood <matthew.s.atwood@intel.com>
>=20
> Add support for the pantherlake platform for xe.
>=20
> Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/intel_chipset.h     |  2 ++
>  lib/intel_device_info.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>=20
> diff --git a/lib/intel_chipset.h b/lib/intel_chipset.h
> index 0c04476bf..c93ad9f75 100644
> --- a/lib/intel_chipset.h
> +++ b/lib/intel_chipset.h
> @@ -92,6 +92,8 @@ struct intel_device_info {
>  	bool is_pontevecchio : 1;
>  	bool is_lunarlake : 1;
>  	bool is_battlemage : 1;
> +	bool is_pantherlake : 1;
> +
>  	const struct intel_cmds_info *cmds_info;
>  	const char *codename;
>  };
> diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
> index d38dc415d..349cf1b48 100644
> --- a/lib/intel_device_info.c
> +++ b/lib/intel_device_info.c
> @@ -526,6 +526,17 @@ static const struct intel_device_info intel_battlema=
ge_info =3D {
>  	.cmds_info =3D &xe2_cmds_info,
>  };
> =20
> +static const struct intel_device_info intel_pantherlake_info =3D {
> +	.graphics_ver =3D 30,
> +	.graphics_rel =3D 0,
> +	.display_ver =3D 30,
> +	.has_4tile =3D true,
> +	.has_flatccs =3D true,
> +	.is_pantherlake =3D true,
> +	.codename =3D "pantherlake",
> +	.cmds_info =3D &xe2_cmds_info,
> +};
> +
>  #define INTEL_PCI_ID_INIT(_id, _info) { \
>  	.vendor_id =3D 0x8086, .device_id =3D (_id), \
>  	.subvendor_id =3D PCI_MATCH_ANY, .subdevice_id =3D PCI_MATCH_ANY, \
> @@ -642,6 +653,8 @@ static const struct pci_id_match intel_device_match[]=
 =3D {
> =20
>  	INTEL_BMG_IDS(INTEL_PCI_ID_INIT, &intel_battlemage_info),
> =20
> +	INTEL_PTL_IDS(INTEL_PCI_ID_INIT, &intel_pantherlake_info),
> +
>  	INTEL_PCI_ID_INIT(PCI_MATCH_ANY, &intel_generic_info),
>  };
> =20
> --=20
> 2.25.1
>=20
>=20
