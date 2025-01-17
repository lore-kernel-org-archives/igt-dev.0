Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BC6C02183
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jan 2025 23:26:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D0A10E327;
	Fri, 17 Jan 2025 23:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpMyNgXh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5644D10E327
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2025 23:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737156367; x=1768692367;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QGIibfOFnABoHgdPY6ZRi+X08yTSHHcbpm0TCIwx8mg=;
 b=hpMyNgXh6xoQiwJiunuQXcC1PjovATUXwu7K/Kz+enrX55XBZhhu191U
 TM5vOnlfV0Qaw8qPG9wA1+lf/4FnXbmpZamNQ8LWb8+EakMhuzAuF3IJc
 nj/52ks6EEzgD1aiOcLVa7pKBA6s4OyZK51d73+TwcQ6qNEXQ06P7mMKI
 w5DucjSUMkg3JxE0FPwQJOCmBISI9c/oX/mEC4JB7q/JHKu3xsivY6xP3
 eJPrzGWrxz0g431RDKvKDGjFnk0n38H1VRsUp345dje3E1opxxSi+Q8Md
 Pe5IKVt5FPu7lhObByXJpwe97PmWJsEDZ1lJXZm3rVQ1JVWwvaWXngD1g g==;
X-CSE-ConnectionGUID: j3dqKrARS+SnHCw4vnnEuw==
X-CSE-MsgGUID: H6guq2PvRuyYT99glkyLIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37839740"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; d="scan'208";a="37839740"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2025 15:26:06 -0800
X-CSE-ConnectionGUID: nba3GZfOT42EbTuqT3+06w==
X-CSE-MsgGUID: YHnHqW6jRD6autyAgxGFmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111044523"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2025 15:26:07 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 17 Jan 2025 15:26:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 17 Jan 2025 15:26:06 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 17 Jan 2025 15:26:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SARKFQA/ZJUBxBm5xm51EtE8acb/Mn+Pgf31Nx58amy5L5FyP6MJmW8qu9Zbc1w6/tr6/b2aZ8DmKIRsCZz0VjDAv1JEpUWIYvtUrxr8ymWeH02cv6CciWpXVBgkzNnoL7fIK+hXFB/OYr9OhxqivyWAtKTiFzK3l2fwRmhr8Lqidosy1XjH9BoNo6FrsVdKidh9H82TQnTPfechXCCH4A+frRv4W6Xys/qFmw5bHa5EJJqwx6wV7PCOFIipSif0UzPBGY9EdwnEUKez/aY9MVdA1xpOWTYPq4KSobTFEJYAW3lrOgfK6/MgmA94l0qFlguIHcFKftE/gU6v976nDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlAVrOEZZQaSyTcACLQRkWrnzdys2wIv0NjyLWPQxUI=;
 b=lzjbbsHmI31AwTz/ZppICOU4AesUoDB9UuNSY8mAn+2FmEQ35N3a7HRTxdAf+aqzT/8lVi8b0S6tgUifTWKefm1JSqTBRbMXUviBWlof2ifUMQcisC0KObEP5cX4JUXjiN1vXazbEyrKfYqNt6RYkiuPxKiLjgqnZ4zMFfPX0W6MB1Rm5zhfFtnph3m/IKSxcamfv+Ue9zR708iWBCzzxniSLapzGv2T4r2PhC7bjM7tFowy6QFnHMeh8tbI/1hdgItscFvwY46Ep/8gMtZoI1v7GMDriSITSsqzIUK5FydnfzQak7yd17mOMNftYuJR+PqxoxeU+CUkhGOJQQdTcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 23:25:18 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 23:25:17 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Thread-Topic: [PATCH i-g-t] tests/intel/xe_create: Check negative cases for
 exec_queue create/destroy ioctl
Thread-Index: AQHbaSGpR5QcdngKUEOqDDkDOWkbbLMbdWxw
Date: Fri, 17 Jan 2025 23:25:17 +0000
Message-ID: <CH0PR11MB544426C2ACF15B4EAC47D4FAE51B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250117205319.3359797-1-nakshtra.goyal@intel.com>
In-Reply-To: <20250117205319.3359797-1-nakshtra.goyal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB5047:EE_
x-ms-office365-filtering-correlation-id: db83e812-3e53-4334-81ca-08dd374e3401
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GiBW/QQ0eZWs+HnawnuWP6DAaPJTDS2oNGnDXAHJwDInrtI1AQAvVWVropuj?=
 =?us-ascii?Q?mgdRxmlSx6dCyMaHfbn+r+QefFZzudjEueKw1GoJUCWfO3E3qJgIFna3lB3S?=
 =?us-ascii?Q?j+SsZVcxzhuXuG6k1cNs1UwXnbtXVFRItF4VQwNUqYdXCy4u1KOkb3aZrxEi?=
 =?us-ascii?Q?YccLrvKk4dmy8PSIy9uoQBTyJJvk+abeRid03MbRHZpoCOE+U5v5nSKzxjpX?=
 =?us-ascii?Q?Chgfn/29ADsyhPWsBChRttIRpQ0Dkj2vLJ8KpOZbdr42s/32G10AjUM2yKgl?=
 =?us-ascii?Q?evMKADr99C5WMhNeJz9MdPrXIhgLf1QwjIT+xTtx35rHEPaoguBd3QwxlmJ+?=
 =?us-ascii?Q?ly1zjiCstH8usqpuoR78nikN2X1Udwa6DuYttvguwZnkKlp7CmJh/a7vhW9X?=
 =?us-ascii?Q?xjtG8KRglQGJF8pMTH0u6gUviP7pF6z/7SfCeO74sgbSviD7l7berSIeusR9?=
 =?us-ascii?Q?e+ZxxiYHHCE5WkTmKfM7G+/yfysWsmLt8IwXfR1x3cmXUrwtQHPpP5mCZd39?=
 =?us-ascii?Q?KepVfMvdEz95FDYM3CxA3CNQlTGkHDFoSCXIcNfA2ithBbtg1Rh2nm0vDKr4?=
 =?us-ascii?Q?gahe5qefuHdNmY/DZwGxZuJ4nYyHs+NLGo2UaImGF3rMFskFvDf5V6c8p1B7?=
 =?us-ascii?Q?WyTR1yFPep987KmWYE0Z3HuLidAF2BkfiTQFyXcfsAjpZ3akNwiFvYQTmpFo?=
 =?us-ascii?Q?W3pGrjdgb34THNzJIOSTfgHqDYcgFGxERTZ9RpxSKIe9XoiFjWR2lXxHzPzB?=
 =?us-ascii?Q?nqWO9h3kAZcAWquZpH1ZUvBInzjdybKhvnX46V9kuKmdvqg3XNYO85uPT/3O?=
 =?us-ascii?Q?UELUcK+Jcx51bT7BwD95qj2tgDZdQn32vILyNHHeC9LsbTjjr9XGviAVfzGN?=
 =?us-ascii?Q?/wPpQdA/kWGD44sdHK42xcYvviaG8jBN57Xhy09KiggMNkjswJzjAZyRFcHb?=
 =?us-ascii?Q?dLjWfcx2+/1whz7wKHuZqxyLUUl3ru637bPStJM133sTPLL/U/hTGOirT93f?=
 =?us-ascii?Q?B7BOrozuhibrEGRdT3bN+V99IfmBEBy3HmTbbYWT8uIMgG0445yx7A6duDaw?=
 =?us-ascii?Q?sFnZbBuGE6kuKVVAZIETbTHbNtm2eEt1OiRnWMn3FNt82IqF1dI1CJ8IdlkF?=
 =?us-ascii?Q?cRQiSrZsiBMfp3F7TiMWFny9F3TDtovBuYU/Pmceqfo16ebPbgRdsMS6oTfq?=
 =?us-ascii?Q?K7IkKT+8uEAaAyTwnz7BFakDovtoivJUyQLjyiOsFJ8EB8Mat8VFOL2wTOOS?=
 =?us-ascii?Q?9qEmrZqrjYvKmPZ46txaOSCpwZ7RG2Lt87DfKm60J+/foWVksvYVJ87iYOKJ?=
 =?us-ascii?Q?3kjpl8SZ3S9ehq9j45rLMqBBodKIrYYX8caYkZE6ot1wnbqvdAyGil/Jb3LL?=
 =?us-ascii?Q?AC0S95B0K/Lr7egZw9EpzeRULu3+Njzv2YCCTryYJZl8meIOqKzl5ug9Pc4j?=
 =?us-ascii?Q?p0gja0K/BPwAfoYYk4pAEctAj/+jWFAU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TuuuIAqGshG8+PYkJnS7gQTIbIBkH9qIduZxkNAghVwwJ1hSS+4KMAbQW5s4?=
 =?us-ascii?Q?ASiyMTSdp8LLsO9SeLxa3UjInlA/WyIl1rWAAQ9Qnl7cm68dalT9w4ortRlR?=
 =?us-ascii?Q?JB/zQ9qqI1rtNBEQopkLJPKnA1xlkDQfBVd9i0ybagzY5Fd+GPvmSEQjApL2?=
 =?us-ascii?Q?WtIGFP/oXvHvrb2/I6HE5FEpw/KnwdWCT1rv12aqZWCWjdsvJL2gtffDSTdG?=
 =?us-ascii?Q?j36mq/GEKmPC/dn4AGjyoHzuVamdliZVVnhtKQ81+GvwBP41Q/Om/m6qkslh?=
 =?us-ascii?Q?NS8Lv3RC8mVQj6AY8LnJqhNwfCkBbvElnc9Q0+4XdwbcymxNJxlf4hXNJ3j0?=
 =?us-ascii?Q?c/6HyJKz0mazjz83jzkKmE8m8Hw4jYqPK4FO3C3aeYMBGWihRoPCLRQ0zemF?=
 =?us-ascii?Q?foaEXr8fhL1AKYmUYv0zQW9zafJLPzvfNv/UJVAd4Cp9u6hbaT4kgi4TRFwV?=
 =?us-ascii?Q?GT8s/e9gjzqGQRasD2GUUJ7+8AiiGkiCIFHAM798RkEUMDnqe9cihFKEbJyn?=
 =?us-ascii?Q?ZWkoc63XjeT2R4ZOK4Ero98ePLpmoBiMyVdnmXTw9QaK5VoxwhK/5JhtFwZg?=
 =?us-ascii?Q?kRUet7VBbOuZGL07okMjfe57TZHrC2LIwd2jaa05Sn7yTcs20mJdNJsGxKOJ?=
 =?us-ascii?Q?8kUBspzpZ0qgdYczFn9QJqknlh1qasAUMKiKAdBlNsXjxpy3goVcfGQRmDcv?=
 =?us-ascii?Q?HQZOwERBMay/EIsOUWlgt+TLLSxezqJEqQMFZ9JpX+Z27kdy/o75t2eR0tHC?=
 =?us-ascii?Q?LF1JY3CWGTYluAYOg4TMqKzd4V+gyvXnJBW8zlxBI6zLn1b8GkGFfhg+1SNC?=
 =?us-ascii?Q?eEXCZLPdbqkd1243SNxZwQiDgyVfzpOP7RWE73ZAKUEQ+4EH4B3HYQo8rQpb?=
 =?us-ascii?Q?4CqFr1C6INSKBVbs0CKbkrHrROSIYECrtUwVV/cX9Ri1TfYAHUV3FUMYGb3Z?=
 =?us-ascii?Q?3HsAqzQGeYAueLjGbt1VWDucVnZmW6bwDMUew0/OA4A616EKLwNB0LZBsyX2?=
 =?us-ascii?Q?oqk+S+lqFwxr0I0YyznUKfTRe68yFBCM/grV6le6nmw1C1eNQmo+dWg9VFr9?=
 =?us-ascii?Q?0Ukw63UDraOIHw5wlO7Il62e/jGTjGDN6Hh2/B+ePKp81y7R3KGbDTbvmDgK?=
 =?us-ascii?Q?K5qIIePX4be2cZJ9oS2/E4hc49xLx+3U44n1aBjzk2gozJpcLJBePlvNHFss?=
 =?us-ascii?Q?rfpn6DtSb5Yc5fOou67vmEKy0onxt1bDOrLOCKRuoDlb2z6l/uXFgb0UfZvA?=
 =?us-ascii?Q?I9uwTYOiiQuQLQb6pjjOvRVnLfDc1GYB5kSeK7KqYN2xMAFvoI9vIkOMgjV/?=
 =?us-ascii?Q?Np0hNQ26sF1kx9LF6BrJkPmHUeKF4hFc76T9hQDpmO1n2D5eCqQXrkIxZJdn?=
 =?us-ascii?Q?TvXoUw5PV2EPNPoktwtpxLOO6iXf35Z0Cw0oL8FAvCSfARMSdkU55/0UzZwd?=
 =?us-ascii?Q?2xP+jE4s+zLaby1Ob00rKChsrOKZCe3j7cbYLrpBnCWoZKZMYnmz8/YGAIa2?=
 =?us-ascii?Q?WJDZvbX3uT7Dvb6UoEDJUcZ8DOOgpAhj8RVfHvsasSKla4BvUSwU6URMyAky?=
 =?us-ascii?Q?iBfwvJ12pky0Gap8jxlM+VgWlZSv4/Qd8JHj7LsN?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db83e812-3e53-4334-81ca-08dd374e3401
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jan 2025 23:25:17.5578 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SvjbYHWKWlnVav4YkyJ5wcc0OOBgSM5X/vtCrmXL22lMpkHG41zwxTJL5MnyUO9s2i6z574h3Um7ZPXlyZvTUOH6jQtcMnvaFFEj/MqRVwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
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

I left some notes below.  The NITs can be ignored safely, but everything el=
se should be corrected.
To summarize the requested changes:
1. Swap the names of the invalid_width and invalid_num_placements tests, or=
 test the product of
those two values instead (as it should not be zero and should be less than =
XE_HW_ENGINE_MAX_INSTANCE).
2. Add width =3D 1 and num_placements =3D 1 to the drm_xe_exec_queue_create=
 struct in invalid_extensions.
3. Check for EFAULT instead of EINVAL in the invalid_extensions test.

Once the above changes are applied (or refuted), you can add my RB:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of nakshtra=
.goyal@intel.com
Sent: Friday, January 17, 2025 12:53 PM
To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.co=
m>
Cc: Gurram, Pravalika <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_create: Check negative cases for exec=
_queue create/destroy ioctl
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Negetive test cases to check expected errors using invalid
> flags, width, pad, reserved bits, num_placements, extensions, exec_queue_=
id

NIT:
I'm always a bit concerned with these error-case tests that we might be hit=
ting
false-negatives, or cases where the tests should fail but end up passing re=
gardless.

We don't have a unique error code for every possible failure in the executi=
on,
so one of two things could happen that would cause the test to pass without
correctly identifying the exercised issue:

1. The test fails earlier than expected, but with the expected error value.=
  The test would
still pass, but we wouldn't be able to catch it until the same failure is p=
icked up again
during regular execution.  This would mean the test isn't exercising what i=
t's supposed to
be exercising, which is bad on its own.

2. The test fails later than expected, but with the expected error value.  =
This would
arguably be worse than the first case, because that would definitely mean t=
hat the
error case we're trying to exercise isn't properly being handled.

In both cases, the issue could bleed into regular execution.

>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_create.c | 141 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>=20
> diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> index 07e11036d..edc2a6178 100644
> --- a/tests/intel/xe_create.c
> +++ b/tests/intel/xe_create.c
> @@ -59,6 +59,123 @@ static int __create_bo(int fd, uint32_t vm, uint64_t =
size, uint32_t placement,
>  	return ret;
>  }
> =20
> +/**
> + * TEST: Negative test for exec-queue create/destroy ioctl
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: Synchronization
> + * Functionality: exec-queue create
> + * Test category: negative test
> + */
> +
> +/**
> + * SUBTEST: invalid-flag
> + * Description: Check ioctl with invalid flag returns expected error cod=
e
> + *
> + * SUBTEST: exec-queue-create-invalid-reserved
> + * Description: Send query with invalid reserved value for exec_queue_de=
stroy ioctl
> + *
> + * SUBTEST: invalid-width
> + * Description: Check query with invalid width returns expected error co=
de
> + *
> + * SUBTEST: invalid-num-placements
> + * Description: Check query with invalid num-placements returns expected=
 error code
> + *
> + * SUBTEST: invalid-extensions
> + * Description: Check query with invalid extensions returns expected err=
or code
> + */
> +
> +static void invalid_flag(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.flags =3D -1,

NIT:
I'm fairly certain that for right now, any non-zero flag is invalid.  We co=
uld
probably just use 1 here, but maybe this is to future-proof this test for w=
hen
flag support is added?

It's not particularly important to change, mind: -1 is just as invalid as 1=
 is.

> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void exec_queue_create_invalid_reserved(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.reserved[0] =3D 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +
> +	create.reserved[0] =3D 0;
> +	create.reserved[1] =3D 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_width(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.width =3D 1,

I think that we only get an error with width and num placements if
width * num_placements =3D=3D 0 or width * num_placements > XE_HW_ENGINE_MA=
X_INSTANCE.
So, here, I think it's technically the num_placements that is invalid becau=
se it should not be zero.

> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_num_placements(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.num_placements =3D 1,

See above comment.  I think it's technically the width that is invalid here=
.

NIT:
Maybe this test and the above invalid_width tests can be concatenated?  Som=
ething like:
"""
static void invalid_len(int fd)
{
	struct drm_xe_exec_queue_create create =3D {
		.width =3D 1,
		.num_placements =3D 1,
	}

	/* Test width =3D 0 */
	create.width =3D 0;
	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
	create.width =3D 1;

	/* Test num_placements =3D 0 */
	create.num_placements =3D 0;
	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
	create.num_placements =3D 1;

	/* Test length overflow (length =3D width * num_placements) */
	create.width =3D 16; // FIXME: Refer to XE_HW_ENGINE_MAX_INSTANCE here.
	create.num_placements =3D 16;
	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
}
"""
Or perhaps we should be testing length =3D 0 and length > XE_HW_ENGINE_MAX_=
INSTANCE
as the tests here instead of exercising width and num_placements separately=
?

> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);
> +}
> +
> +static void invalid_extensions(int fd)
> +{
> +	struct drm_xe_exec_queue_create create =3D {
> +		.extensions =3D -1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE, &create, EINVAL);

I ran this test on my end, and while the error value here is correct, I'm f=
airly certain
the ioctl is only reporting EINVAL because it's hitting the earlier invalid=
_num_placements
and invalid_width cases.  With width and num_placements set to 1, we hit EF=
AULT
instead, which I think is what's expected to be hit when we run to
exec_queue_user_extensions in the execution stack (namely, due to the error=
 reported
by __copy_from_user).

Though I can see why EINVAL was chosen here: we test something similar in
create-invalid-mbz, and there, passing any extensions returns EINVAL.  Howe=
ver,
xe_exec_queue_create returns a different error value in this case.

Also, this is the only error test that goes beyond the width and num_placem=
ents check
during execution, so this should be the only place we need to set width and
num_placements values.

> +}
> +
> +/**
> + * SUBTEST: invalid-pad
> + * Description: Check query with invalid pad returns expected error code
> + *
> + * SUBTEST: exec-queue-destroy-invalid-reserved
> + * Description: Send query with invalid reserved value for exec_queue_de=
stroy ioctl
> + *
> + * SUBTEST: invalid-exec-queue-id
> + * Description: Check query with invalid exec_queue_id returns expected =
error code
> + */
> +
> +static void invalid_pad(int fd)
> +{
> +	struct drm_xe_exec_queue_destroy destroy =3D {
> +		.pad =3D 1,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +}
> +
> +static void exec_queue_destroy_invalid_reserved(int fd)

NIT:
Hmm...
I was originally going to point out that we probably don't need to declare =
"exec_queue_"
here and could just shorten the test name to "destroy_invalid_reserved", as=
 then the
naming convention would match better with the create-invalid-mbz test.  But=
 then I
checked create-invalid-mbz more thoroughly, and realized that these tests a=
nd the
create-invalid-mbz test exercise two different utilities (exec queues and b=
os, respectively).

With that in mind, I'm not sure if this test suite (xe_create.c) is the cor=
rect place to be
exercising the exec_queue_create and exec_queue_destroy error functionaliti=
es.
Though on the other hand, I don't see us exercising anything even remotely =
similar in
any of the other test suites, so this is probably as good of a place as any=
 to perform this
exercise.

-Jonathan Cavitt

> +{
> +	struct drm_xe_exec_queue_destroy destroy =3D {
> +		.reserved[0] =3D 0xffff,
> +	};
> +
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +
> +	destroy.reserved[0] =3D 0;
> +	destroy.reserved[1] =3D 0xffff;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &destroy, EINVAL);
> +}
> +
> +static void invalid_exec_queue_id(int xe)
> +{
> +	struct drm_xe_exec_queue_destroy args =3D {
> +		.exec_queue_id =3D 0xffff,
> +	};
> +
> +	do_ioctl_err(xe, DRM_IOCTL_XE_EXEC_QUEUE_DESTROY, &args, ENOENT);
> +}
> +
>  /**
>   * SUBTEST: create-invalid-size
>   * Functionality: ioctl
> @@ -392,6 +509,30 @@ igt_main_args("Q:p:", NULL, help_str, opt_handler, N=
ULL)
>  	igt_fixture
>  		xe =3D drm_open_driver(DRIVER_XE);
> =20
> +	igt_subtest("invalid-flag")
> +		invalid_flag(xe);
> +
> +	igt_subtest("exec-queue-create-invalid-reserved")
> +		exec_queue_create_invalid_reserved(xe);
> +
> +	igt_subtest("invalid-width")
> +		invalid_width(xe);
> +
> +	igt_subtest("invalid-num-placements")
> +		invalid_num_placements(xe);
> +
> +	igt_subtest("invalid-extensions")
> +		invalid_extensions(xe);
> +
> +	igt_subtest("invalid-pad")
> +		invalid_pad(xe);
> +
> +	igt_subtest("exec-queue-destroy-invalid-reserved")
> +		exec_queue_destroy_invalid_reserved(xe);
> +
> +	igt_subtest("invalid-exec-queue-id")
> +		invalid_exec_queue_id(xe);
> +
>  	igt_subtest("create-invalid-mbz")
>  		create_invalid_mbz(xe);
> =20
> --=20
> 2.34.1
>=20
>=20
