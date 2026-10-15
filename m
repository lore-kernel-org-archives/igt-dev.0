Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D17CC6B33
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 12:16:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A65F10E238;
	Thu, 15 Oct 2026 12:16:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F35510E948
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2026 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792066556; x=1823602556;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=aGdEq2UXmjjVL5ZfkLZrxw9gYyJjziOk6SQQr05XWVw=;
 b=PwFqb2nhdxhO2vQeQg9P0WgmuK9B2KWODkPbasv0TP3XPiU41zpp2pPW
 cFKKYP1SaH6AfDxx9HEX27TCLPhFxxfwv/GjzasK+cYXkKRzxo07Xp2Sh
 VfyzuYBL7LCyL1R3tZ6hjURP7JHXfGUoYL/8dtZFsxLQAz1iHdDsMUr6/
 7UkqCoEO0ogJ6xBi+IzMwDA0XreEJP0eieBROLt8Ea5e9F5Fl/umZDH0/
 c7GYwhTRMJprBkf5C5iAi6UXHJmweesaP4hCDjZ7gcZdECARJN6n/mV3N
 KSsPizWg1Q3joyrTbSuwTDGE26RvRPd28BZ13yE8/yXj7RHjbQdw33Q5v A==;
X-CSE-ConnectionGUID: LQNWxhR8SBCvQ/Xqi8tnJQ==
X-CSE-MsgGUID: fAGH+zJdRhaRNPguuXpkog==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="845522"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="845522"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 05:15:55 -0700
X-CSE-ConnectionGUID: f07EgD+pS7S2ER+kBgku0Q==
X-CSE-MsgGUID: 2VRPPFSiRweqlK0gbEcvzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="2038777"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 05:15:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 05:15:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 05:15:54 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 05:15:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRnUwez5zyqI1xtbMbFhLPcBzG60HbP9Dq0JY2Uj17qZ+dWteKokqSae0ptrqmMLLiDxiuCtic/FvdYfAOcOmJXeXqBXdiRjF545aHNuzA6z0VK+nRVfBwFLurq8SmmxLPt2yOZPrJmaa62QrYwjBZYPbA7geKMrtIYt+tqw8FE98xM8UzjuE2MDYT0P1WNb/W3se4uzLQgLZwLYqMrl4YlQDfaxHsLB9WlWmuCfCoD3yD9E95JM8J2sOiNCaIduVoy7uLy3l+amgSth4QAzY7f2yQYAbd5AwgvGcC06iKK0KgP0kv68Ge+X0h0sbr3UfEQrrrIBhuIuMff9REg6fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tDx6JwY7ppIAelt/fsQbjGV/hdRrzBYDjHsOsulLR9M=;
 b=D7G1/eoN3XnOyKFdl7Ehv/vfa2DTXI6SQGyBPBikPX22kQ8kY3SOsA2McUcROABpTl0d5/Y5uuhJD+WHiSNz3xKjnYuF+LIrJBxhxoS01ODEm698tV+nlm26tTELJRO4McH0kVFlYI7RrG6QuQmIcDeMCKjdbZKr3VAmS4+pm75YMHz3shzLL4lqoVMC9oxbVXGEcPRR7QMIP5l403uSZaphn1AwlAor9ZYdXA4Wg9DXYQ45ci+IWZCDunF75U0FQ2WS1iJFtmYx//lYrnf7xc/3h+tn1OScZycxGUhhe3f+xby9UwchS04Jc+axLePp7iYaxCAdALWaXQdIEpH8SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by MW4PR11MB6839.namprd11.prod.outlook.com (2603:10b6:303:220::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 12:15:51 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 12:15:51 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Kumar G, Naresh" <naresh.kumar.g@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH] tests/intel/xe_waitfence: Set ABSTIME flag for abstime
 subtest
Thread-Topic: [PATCH] tests/intel/xe_waitfence: Set ABSTIME flag for abstime
 subtest
Thread-Index: AQHdScwc2FtP7E+EJkGVqnZPYUbZgLb+qTqQgAAAmEA=
Date: Thu, 15 Oct 2026 12:15:50 +0000
Message-ID: <DS0PR11MB87180EBA020A5D7944AC6386819C2@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20260921131933.3321706-1-naresh.kumar.g@intel.com>
 <PH7PR11MB714511375EA001C6C235A083CB9C2@PH7PR11MB7145.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB714511375EA001C6C235A083CB9C2@PH7PR11MB7145.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|MW4PR11MB6839:EE_
x-ms-office365-filtering-correlation-id: ffd41637-ad7f-4890-1ba4-08df2ab60d8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|38070700021|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: q2Nv8q5XL88pbb3IiFG2DTldfjZBVPbPWfP7UnYUcunpts9naBlXEAuH/EWbYFD8MlKfsrILSlcDG+ixqdWXlf08+FoXx9Ebyg9kUrEF5dY8wP02z9R93i5rHLHxHM7V1gEq53XDDqYhhpKpFj7UnMb+RVeM8Zjv7ci+A0L/1qa7/V6wlXyXaFQVGPjyFP7CmnVlGQ8eyHOIDZULmIIper5QlanaoXEkxb50PMwPMjkNNXrb0oiWXuwtkgnaK53A9rMXx2XB875TLJPN2bDXlNJOOWH6Z0Yb9iVVJwQAT6PbDYLVYSTMnmlR8vqgsBq0fJ0hQmMMI6PvYFAhOo/Saiign1udc6WgPRQo2yNEKwHxPRfCSX0m18C2Z7KRG7+IReYpyHr5lkx9s/Ken6gTt9xr73E4Y02ED+QLsPk+X8biCTOJeFqXIdXQp+pbNDaEuq3EJUXh6fwT3Wkws1IZOvA1yfrjOSr2kLoMRZJZlHXthOXyed2saH9IwjqJSj3Q/VjQQcB65oF3mgccfMj8dt2EmAaN9MlAmcZQ8HPVZJymVx52G5yXknr7FIxN+uhelTlicVYD026vMEAlj7gBxO7PZIHpNrEuBGM2PBv6no8zA0hiw8fCcIT3iGXfy35SE3Uu3sIeGidb0nj+I1U+9j4Y+SJFC57HevFbLSy42iU2WEi3e1zWOigiC/EEHB/n1aMzV77hodxt6uYwhpq8rSOzXH36ZI58OH9RFyUVgOA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(38070700021)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kPm1+0MUK+527PDPO7Irz1FFOprWNnycS+9z0WZrnHnegpuQ43frOKPwjF+5?=
 =?us-ascii?Q?rTSoxcij5/L7JB79lIX+BNra2mgIZYIk2nljhaiGIl8x0WxQTI4i4IdFH6cA?=
 =?us-ascii?Q?HN8PVPj17lZxuL3XsBETuao5xiV9QXFCd/kdyUmU7QYaY2vvqcBNRt67ijaP?=
 =?us-ascii?Q?ILSP4a7p8sMHGhmuv+h1gjnuM+9On1tKhvS+5kzPkjimR6DISsgy3rpmKDEb?=
 =?us-ascii?Q?T6m5qzv3mBc2eC1jE3TLYGOW++jybsJ2KGmq7C8A1vDxe7ShNLvrrnj7HUDH?=
 =?us-ascii?Q?TqQ/2gp7+gY0KhW7FXDmhBQej1jgCztkvBFzxGGQj/0H6aTO7W4Rq0t++iwn?=
 =?us-ascii?Q?6zCUBOA1wWoKnnQedriTeWy6t4Z0BrdDhGVK+25/sD3RxBiCT5aGrvXQG+kV?=
 =?us-ascii?Q?zzF85RhUfMmqnHIOVfLLFHsKDPd9vW6ppdEP9jrsSHZj4pL7E7W4WPn++B7v?=
 =?us-ascii?Q?Ol0NNAlNzIQhRV5xyPxJ1u0ZRtbwBVQzyXRblrUmR2mQ4XylRM96VMaLPTer?=
 =?us-ascii?Q?AlHh40NS1v/CQsPS351SgIc9cjr0WvD8+dyzdL7X/V5KMysZ9K2L95CvrH8Y?=
 =?us-ascii?Q?WodBtk8sazH+mtCPCKF2FAC+KX/nO5FOze45q3BxM6HuI1s5EGZiiIAIkZJZ?=
 =?us-ascii?Q?GgtrULYS9BvSAHid8TX+XL/a8u3kYzh2EMMjZpFFyY7ChZjZZtfaLEbWw+u+?=
 =?us-ascii?Q?qOxxiIW/4zHD6rOxE9lmgPr/44dol7CJ9+fpvc65E1A9SmjtTmgblgcqz2pX?=
 =?us-ascii?Q?Lx7QxyqOcvXT9BVx/Itm7hfuQrq2YzhdufSpgp0+5dW5gmsu+AQWJf/nRieT?=
 =?us-ascii?Q?RwYcRJTyDHLjaBy/lx4mm8iw7iI2RMsdjAkSAORigfP7vubhbgzbgnZpK4ry?=
 =?us-ascii?Q?q2C/VSxblVPvUvuaTuLhzNUFSKDpMcZUPQAd0tqLwUfiN4J0eQaXICnd/Xfj?=
 =?us-ascii?Q?QZ6u5vewxvWzbw6QnApIgWKgXs/kNv/qfXRyPe6bFAKDqqh8dUPKUas48bDO?=
 =?us-ascii?Q?0AlngF/hEiS9ffoOYqS2S8+vUOK29GCALoXfZIDLj6L0K6ABVW7XmHec8hgr?=
 =?us-ascii?Q?1F4VpXGgOsrl959G9ft+pvGGn8q9VdA8bi9H9Vg7xg9Lfl+gx+yvDJ863rvF?=
 =?us-ascii?Q?AO7eWOsBiHniZ9Hp+dXQeAkcfOpoEjRwJCf4MPn5qSdj8HnKPbv0NUeQPebO?=
 =?us-ascii?Q?DVQaCgyQi2L9SJhiBBMDDXd3u4DvAoCivS1whyTVOh1i2/ajhQDDaeEditAm?=
 =?us-ascii?Q?dtGI06Dqktib1PE4hx+H+Mv3b80FBBEKQswSjhtvte6km2ctJ3PVT1+nPLxl?=
 =?us-ascii?Q?1E6WbyRoriYLz9h4ZUBTDkUy1FBb1a3ZYrLsMUjxHn4c/nkBUq8p40I44qBj?=
 =?us-ascii?Q?0wjPNxcrUcrPjketJm4EJweCuM5ORy5yVN0Yf70mgIZu4ShjOVScihXrOAW1?=
 =?us-ascii?Q?9hMB77/PNFLsDNEUEpxXCn5RjahrXhe/11RrnNlcE/8hFFktGRtM/LBG4b9F?=
 =?us-ascii?Q?bHP9xBto50Xmj0PYtX2UQ1PN9ANEMBRkJOI21zcwHeY32kn8v8i9O9k110wV?=
 =?us-ascii?Q?YyyPQa1NFie73bKfK6ZsPxmeHjcQXbwqKzryy867nPs+O9yIeP81+97/A50s?=
 =?us-ascii?Q?bek5Fiz9yOXTRxbvKTSAWLzfc5m7jmBej14AMkjRTKzcg9SvvAQeaNpCgSIw?=
 =?us-ascii?Q?TPonzRvXKkvF9BuFiz71PZorJ+yf5HiS5h+Z7eipqeWS+FPwl6ezYi5eUkcF?=
 =?us-ascii?Q?RuwXXGCpHA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nhfyKuKWb/0Ei5YQD3lyomAlru251XNhjBu/OgsNJjSe/Vs2c9VNBOwG95qYi+tyALaSO9F6Emt1PjvuOeF6aIzTzaZoAwlXUhk4+viJCjtgR0waMzXUWKwNwgldwlJa9fKP3um6UgNDPW/hrsTMv+vHBemkscmjOyLMXvxw/DrMx/ffY/MV+s7UHaRF5pI5YrNMfVTTyAoZNGS0lLFJJOGefNzERnFYPR4ZRQlitWsJBt0w+D0nV0WL9BkkJQf+5pL6OGgo5z4/zSiU9b7Uk2zhZBYm3klyfa8UOICeXcyD9uK+9jFCRuAVRMgrChPHo3MGqGLFwnv3BMkSBhQphA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd41637-ad7f-4890-1ba4-08df2ab60d8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 12:15:50.9127 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0eiZ2wMqu/vz7sgHOqG/bDlYeenh9oFBBJAp47rhHbULbEwkdXUGc1AxSCi7yd0Z76kexWA9lt/rjFVruSjuGXG2Z7lt9uZjh3JWDztlJh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6839
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
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: 15 October 2026 17:43
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Subject: FW: [PATCH] tests/intel/xe_waitfence: Set ABSTIME flag for absti=
me
> subtest
>=20
>=20
> FYR,
> -----Original Message-----
> From: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Sent: Monday, September 21, 2026 6:50 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kumar G, Naresh <naresh.kumar.g@intel.com>
> Subject: [PATCH] tests/intel/xe_waitfence: Set ABSTIME flag for abstime
> subtest
>=20
> The abstime subtest computes an absolute CLOCK_MONOTONIC deadline,
> but passes flags=3D0 to DRM_IOCTL_XE_WAIT_USER_FENCE. Without
> DRM_XE_UFENCE_WAIT_FLAG_ABSTIME, the kernel interprets the value as a
> relative timeout.
>=20
> Since the absolute monotonic timestamp is much larger than the intended
> 10 ms wait, the ioctl can sleep until IGT's inactivity timeout kills the =
test if the
> user fence has not already been signaled.
>=20
> This was observed as:
>   igt@xe_waitfence@abstime - timeout -
>   Inactivity timeout exceeded. Killing the current test with SIGQUIT.
>=20
> Pass DRM_XE_UFENCE_WAIT_FLAG_ABSTIME for the abstime subtest,
> matching the timeout value being supplied.
>=20
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>  tests/intel/xe_waitfence.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c inde=
x
> ecdce9f93..f453a4a2c 100644
> --- a/tests/intel/xe_waitfence.c
> +++ b/tests/intel/xe_waitfence.c
> @@ -130,7 +130,8 @@ waitfence(int fd, enum waittype wt)
>  		current =3D ts.tv_sec * 1e9 + ts.tv_nsec;
>  		timeout =3D current + 10 * NSEC_PER_MSEC;
>  		signalled =3D wait_ufence_abstime(fd, &wait_fence, 7, 0,
> -						   timeout, 0);
> +						   timeout,
> +

In that case should not we restrict with absolute monotonic time rather tha=
n changing here? Because someday someone else can again change or use diffe=
rent time.

Tejas
> DRM_XE_UFENCE_WAIT_FLAG_ABSTIME);
>  		igt_debug("wait type: ABSTIME - timeout: %" PRId64
>  			  ", signalled: %" PRId64
>  			  ", elapsed: %" PRId64 "\n",
> --
> 2.43.0

