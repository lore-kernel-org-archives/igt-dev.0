Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD53FE7718B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 22:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C1610E24C;
	Wed, 18 Dec 2024 22:04:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U/3+MW/6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B4B10E142
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 22:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734559480; x=1766095480;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iWEZr08Yn1Vg9o5f6T9vLu5FomGQcLfL8/APBBOfk7g=;
 b=U/3+MW/6ntiLQeJeM99fRdpBZJdtdzIonw66YD8BwABkhldffBJK7x+b
 6pMz4cSVatXcA2mey2QDfy/eOOtMtnCKybdoRCTuAqPd/UtpEjfB6gdyv
 8ECGtTtiBbBYBCX5alZidQ26bzq5lg/D7FI8lBDQi7ze4sHuRVNvXJhTK
 tb2mwTxdUbKTyBDCj+o2eMfRa50gPSzANFk4m1OxTi7q2VlPx1Z8xRfWa
 pjMoYTlzxoDOeDTHJjiP0hLPmnTcSpCHU+1dOhAqnEv2P+aJSqvcSL2kM
 o1PaBK1UQOA0Se1WErA2CTYUzhU118MQeoUVkRkKX6OeRKChbKaC1VitF w==;
X-CSE-ConnectionGUID: JN5XCze9SMSs/ObgZFqmJQ==
X-CSE-MsgGUID: SmEexS5aTQ2VFstfJaAYmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="60438430"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="60438430"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 14:04:39 -0800
X-CSE-ConnectionGUID: MQ3wOZQoQROXHa87CkFAxA==
X-CSE-MsgGUID: 034WMSdbQ868AlArZl/9GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121252376"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 14:04:39 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 14:04:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 14:04:38 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 14:04:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VXcl80SETKdwqUEfI/jXi/PjPSsqpdB0pbBcCJ+m+pHdzZ+Ka4Dig6mrNaYEwvT02/lVtQLFl7poOKdrqF8C1K2sJYbdyVh2fRE25BM8tvjAtU/QXYHhNg+lrnRizTumQXmJHiwm3eJsfHwQN5hPDakwwCqIeab2NnSqTWzzQGM/nsE/+8tJPu2ZolZAL53ovob61x2JAJQFeIpolPmRiUfbpNX/UJxnUZ5gBQgvt23X5Q7dOn/o/eS/rtHVGble1QFqybs6CB5diMJcDdqrn0bHDZKM1SvPqKpNQDK8i0sNxpGAv7Kwz37Wd3eTO3fI9v+J0dRXdYkjkrEmhgAkUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ekZMToObzDzT27IXNatFwrozQoY/TdMVpK5bSZf1hc=;
 b=EfP5KYt3ZvgV4+1a3mlPUbqacyb1BKm0+y3EQk+Gk8j/GeAfSkYK2qM/6PCUffiA+6dNA589RKoPt4vlhcWq7IvR9Jq5YRHbDzyKfZL15O6qZZT6X2pkw+eK/yBQI3j+2xwREkzlsUfKiOWL4os+V5Uw2ubZpTEdTLnALSd740lPD5ZroH8xdVIoS/Kua/UidhLlcxiysoPLEYOUxeHZuKBfV0iXuvJwRT9kbDFZlEw9kt2m5W0m8VIzRs5QNHXlgHz3dHI9ErhC8Nr9DiGosBvXLGganohGs4PEPM0jJgYYGScpZV+8FSQ4VM6Gnr126EtePeplANbB9L/nB17m5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7803.namprd11.prod.outlook.com (2603:10b6:8:f5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Wed, 18 Dec
 2024 22:04:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 22:04:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Taylor, Clinton A" <clinton.a.taylor@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t v5 2/7] lib/intel_pat: extend for xe3
Thread-Topic: [PATCH i-g-t v5 2/7] lib/intel_pat: extend for xe3
Thread-Index: AQHbUZUCLIG/Nbe4zkOMita4tlQgPrLsh88A
Date: Wed, 18 Dec 2024 22:04:22 +0000
Message-ID: <CH0PR11MB54441AA529067619A9458830E5052@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
 <20241218213654.2734573-3-clinton.a.taylor@intel.com>
In-Reply-To: <20241218213654.2734573-3-clinton.a.taylor@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7803:EE_
x-ms-office365-filtering-correlation-id: 7661decd-f7a9-4c93-fc21-08dd1fafedbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pWPtSwaqMprp+CChjmw9/bNknSfa7bWwvBK2bGNcNuimat/3W8quel8xUztZ?=
 =?us-ascii?Q?6354Di4Rni1UmjUk4KNLCtwxe0CZVsV2G4xRSmaJpb1ca67CQsfw7kGxByxX?=
 =?us-ascii?Q?+dtnePPcgiPeAhw1fTVJcTNMocsdOhNraiRVrYV5E8luE92dDROg97ZX0HI/?=
 =?us-ascii?Q?C84CZKjHqrEdfamcUzKUSuTLIZR3Sut+R4WsglHeQiysYoVrAvgYuT6O+AqA?=
 =?us-ascii?Q?A97huTjo7Cl1lUhwfYqWktiJUPWWk4KFxc9avpZLPXxKIa9HRoOXnLBn8DcB?=
 =?us-ascii?Q?Kx4q39EbXBBJmRUCdmKTw5QeVgKVGngVJNGwhjDGx++irZxxePGIEcsIZwB0?=
 =?us-ascii?Q?SiqDSerEWzboSjJl2lCrO4zmiQ+/3yZxKgUSLKb+w8maOo7U6HC+nLJx0cY0?=
 =?us-ascii?Q?bqGXbdmAAuYE/pXNoj8orTgkyagCZbzWGNv/ohg2TllCqDSHwDw16qoyUNve?=
 =?us-ascii?Q?B/lC75tDFO9t7npoZOvWQb3f4qz7tvXszsdk+qcQvqOLjfpApNxaZKoC+DOq?=
 =?us-ascii?Q?n6Y1TedJfmpNmMckeRbGl8VGo3Yo00js7V/58n1EIZHDDWVLTyuj7NqQwn1j?=
 =?us-ascii?Q?5lUrp3wo3x5M9Sb/1dNv2jxzT97/jQSum1fIth+aSiimQz7Q9yzW9IrRHbWK?=
 =?us-ascii?Q?TD/2NEohWVmhWP57DPPfD6WTDYfREmGflFBYdAVZT5NIypGUFxeCfXc86AVf?=
 =?us-ascii?Q?h8qH6BvpaiRtXJNidkMfUdaDnXAYT58p0M3pSHeTP8EDYIv1pciq9p+14EZU?=
 =?us-ascii?Q?z8TIBCLUYKFGcOeYprLS22cUK3N6x3VKY5wBkQG1Jf5uf/QRIzpCUa5b4pEx?=
 =?us-ascii?Q?l/Ns+r+gUi1XJqftcc4LRgUR1WAFYull6xomzJGu8XquMyfAxvkdult8JBOH?=
 =?us-ascii?Q?+3e7XscUwA2YYwM02QCCmkAiXPEmAYCX3QU/6Lu9SUPFaytxXfar5y7ZQdKK?=
 =?us-ascii?Q?di7a3ld3sLRugiEhDjYULRwQ/nf6fQcr7WXR1qhJQGuy8zWpMTimTfUH9QQW?=
 =?us-ascii?Q?1MIHQ9+WVxQluFzYW0P/HtZOuNFgL6QFKo1oSbcEAv7ieJAPYPzewXtS9uVr?=
 =?us-ascii?Q?imDhby+I2o6ej0NCU6oA/eW/ov96v4+V/0izYALDU3Nen+k455FmsaPnk53f?=
 =?us-ascii?Q?SvTuWyk8PvoPKXVu2MpQV+HSQbC1qxbtNMSwD/d9Bs+14ycsdwvqVebUTw/x?=
 =?us-ascii?Q?TuWSP9FEcSHDlfSDAdez0t5TeUi88Isi1mM7nD2len0wSSNs0eKHpgo5irfw?=
 =?us-ascii?Q?aviCIiznMmbY/4VF+DL0n1UDtlk9DkizqJ39c7Et61oDlYflyT9mzmpRvAe+?=
 =?us-ascii?Q?7pgHNVKBJ7xyXkLXfhBCoU5LvvmgOhB6FKkTOYIYwzqHFMFZXcU1tue5aJwk?=
 =?us-ascii?Q?e4zjKESl8FB0S4wm7zITuCoxtKc3+J6teYAfT3tVGqs5ho6KEDPOAyq0Jv0B?=
 =?us-ascii?Q?x8oShXpg0lMRHWo+TPEnzu8PwkaUV1Ej?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+PeQGWCktk/lm/c9gUd/JJAKeCv9BHBt/c2NA4yuDbr+BzMyBSg6IovkrRYW?=
 =?us-ascii?Q?ukTMACYJHx1/lIW9vcbFR8+L87AmjRpJFLclSSCsCkb9Xy96tRWXqS+pzZ81?=
 =?us-ascii?Q?799RqSHu04aknOm1SQ8mnj26OBuYoBm+6xviIUGd6EfHDQ6X8SCQv8oYmaVl?=
 =?us-ascii?Q?LPDEY3wX7pwhw8+3DaEc9FvU9Idiop7MYoG1tPazNBT12aKIshEliEgQoxPa?=
 =?us-ascii?Q?XRFEnF2vNk8bYmvUK2Fjj679lR+uveHFuNx/LvxGeB+yhyBDFg2qknO4VQlG?=
 =?us-ascii?Q?g4YJMzeldtsfp3keE851airSzd8zzSnqGsVgCTT0K+nAFI1yIYhSrPuRWzak?=
 =?us-ascii?Q?jFRnLjNEqrObtL10KI9aA+yGE8LNkum4N4V92szopVx9cls5Dl/ApeQaFlAf?=
 =?us-ascii?Q?NEinDo3ODyur8ZCa5813fmjwLstev28D5VHdmnlIBik0r+tewWgccXN/dDk6?=
 =?us-ascii?Q?3W4snBJNDLnpcakXb2+K7ROMVguXTe2QQ8dk8Gz4OQIB/Qpp8R8ZzwcCwXIm?=
 =?us-ascii?Q?6HUURb+nqu9+QR6CCOph/wqDsg2DLjZdCN+/4VZUxlMohf4ylsNtTrWBfeg7?=
 =?us-ascii?Q?/edV305R8juN6IYoUFaUafjH8wep8b0THcZrfHa+xbX926o54kV2lCTHCJbc?=
 =?us-ascii?Q?4DK4s9RLYJlmvAVPf/MAmiDRA6iEKmstHYJl9o494xoOASlpVbVapQfngQ24?=
 =?us-ascii?Q?vqa4Zc0lCbkadznW+MutYFx/TG56huvUQYyYROfUKNPMCXnRKExtXNjMBl3k?=
 =?us-ascii?Q?u/rrNZyuYdAsTJTQQapefq5MmX9GkqESfvDmr55eKqVguIBfvRgb9JlbQ2Lv?=
 =?us-ascii?Q?7n4C+6UT0jP19T4foNWoA4MHG4BjfFOHgmcnhm6UGf+um6/fKhIz1PFLBwiv?=
 =?us-ascii?Q?NXceRIExBf5oTnuh3ZekQ+gDZuG4bUw0InisFFljynNO/+wYR75/I13cfG0o?=
 =?us-ascii?Q?HncVvxYBV2A1HqBdil7tjJC5wloq+VcxY01A5lCuo1mmhjl+ssvcUym8BDVV?=
 =?us-ascii?Q?Yo2/oTDQCDLmvBTOAe2Jg6lfrNmpYdUO3BO++rHKmHDknw9VES3kua4FX00C?=
 =?us-ascii?Q?vTi10FEPJFuJDovwQXrH78VzQKnxJGmKKhnvT4GhtWidm/rYrPzMmoP54Idp?=
 =?us-ascii?Q?LEQLzPKsaDUbu16WckackP47KqkPxfmq/T9rLN0xcvJf9tMIUiKpVWNKaXC/?=
 =?us-ascii?Q?KzIj0ULVKsjfT1Hio4R3/a/Z6UDKSdjB/hz8M8gYOh9rTEm09uJ2BXATcEhF?=
 =?us-ascii?Q?3qn//6z/NNBOBTlB1644npK8GTb9iL0VJBh/c9C17vGiwnE/VWyeZmrAv2NH?=
 =?us-ascii?Q?gvC1IGx0UxS6vrZo6CjSrJukqz7YXuuF6rNMZLCChs41lehLmOLIeLdEmnm7?=
 =?us-ascii?Q?+hcu6nT0g5hxfef3PL+ewaE7fKVIS8gyiEKt4mbjxr0fhjzCtK4DGv2AovBT?=
 =?us-ascii?Q?gan7vIFTKTPPPH06KUmS3ERqY3Y8yGHEYeldkTMyinl730+7399Ss5Zy7pUc?=
 =?us-ascii?Q?h2CLPFyG5m0yX/fMBJbdvsHzpwgqbEJEDKKgGldNEZRF+f2l80ob8rnr85ac?=
 =?us-ascii?Q?E0vtA1XL1K7PaJ3rGaw31KLoGkMQUQ1Wz6yLBMuq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7661decd-f7a9-4c93-fc21-08dd1fafedbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 22:04:22.4740 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n59pJYepvZ38y5URpJAb0/XNydf/TCWp9/DtGpGcU3OtW3GLK3+uD5o/toVDSqy/frWYiCpGaYlNrXGvpN+sTZpq77YPpKlgvKsqOmRmEk4=
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
Subject: [PATCH i-g-t v5 2/7] lib/intel_pat: extend for xe3
>=20
> From: Matthew Auld <matthew.auld@intel.com>
>=20
> Xe3 should use the same pat_index modes as Xe2. Also matches the kernel
> side.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
> Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  lib/intel_pat.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index 7f175b057..156b1ee5d 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -19,7 +19,8 @@ static void intel_get_pat_idx(int fd, struct intel_pat_=
cache *pat)
>  {
>  	uint16_t dev_id =3D intel_get_drm_devid(fd);
> =20
> -	if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 20) {
> +	if (intel_get_device_info(dev_id)->graphics_ver =3D=3D 30 ||
> +	    intel_get_device_info(dev_id)->graphics_ver =3D=3D 20) {
>  		pat->uc =3D 3;
>  		pat->wt =3D 15; /* Compressed + WB-transient */
>  		pat->wb =3D 2;
> --=20
> 2.25.1
>=20
>=20
