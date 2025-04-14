Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C201CC369B2
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 08:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7322410E4E8;
	Mon, 14 Apr 2025 08:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHg18Njb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA8B10E4E0
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744619539; x=1776155539;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fVNvgH1kSt3A/Y05EAXaaExt3ZdnYPI+cUv8tcXndVc=;
 b=MHg18NjbFaeDcbXLYbPlhXeao3HHiwA3lxF56VxnD4nQ1AfY8HH4Z7P3
 666lE3PTOA7kajiO05UfEe/47ko/tbW2z4xVsOCabJi6uFW62zrOeRmA+
 6gN1rvkfJ3hpHrvfcjfYmH6ktSPj31lDqDIl8FfxX4nkodTIYhs/VjkFp
 OdSDg8QUQhAwIWX9JBhr49U+l+DjM5rUBGiMuh8zQRwtYgR0Pw7IpchYT
 jxuaO/3x1PEVy4N9ze49rBR/bw+pd+gemGci3ApdE2QcWMtAM2PYG4Et1
 W/5c8mjKZQxNLgdgGURCQrGrAOLjWHkx01SkNHCk4uwEQQwnJHkEn0IuF g==;
X-CSE-ConnectionGUID: VxBC50XWTVOdCJUGhRujXg==
X-CSE-MsgGUID: aymBkqNVQy2Vn0TLwhn58A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="56737816"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="56737816"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 01:32:18 -0700
X-CSE-ConnectionGUID: 59bAGT50QO2n32zgDxQ+ow==
X-CSE-MsgGUID: TBY3m04kSLSrcIwBKfdZRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; d="scan'208";a="130614250"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2025 01:32:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 01:32:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 01:32:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 01:32:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gc2PnndfyK4nc3vtg1pX1AYJoiRe3Dg0P6MuP51nHnSIZH+OAoyj+P5TBArbrsogGS1G6DW0yTvxl7xh5uLbt3QVH5XZrfz+NUbtZtyFI/mWMIhv/OkyYU/n64oAzej6mKpCheqjHLNLpqph+Q4YAixn3osJmoXwDxqaT7E4o/e7XtpA3joq8n1Vx9y60pi5vENBWogltp2/D5ghJUzT4pGmC8YFZyPoJx+9+c/tdoojA4iZYE6v4sCfS85qcSleqRAWHs5oNxRBqx85O7E1eZBcnhmePhd/fkYuRxT07CSGHHiZNz6SkalX0fzyrE/XqtB1xAINLG5kITSkspACaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzPlcZBoO3R8utcHAnPOJwG+kdh0ktaiEILxUq3PMUg=;
 b=Xk4/n6Ddwm8b2cPPUxedoh3ERZEgwad6wZoqqmlEm7YR+y4n3MHjr92igZSalsS571eQN8PY4G+aLWqvDU4LcZA65N4sa/V7RrvTUhYxbIj1fuMRt/gB+1iw7XVPFrYk8LXkRMLiewDgbWE5s35nc1wtc0ysbW2xH1UAOKzkJ4kmtlQY2Yeq/oCnNqU6OzLEU+e9aT3tzMUhRvw2RWj0hU8wtQTKiaSbsncDcUP8a6DO36ji+MGBHaVnf1yityO1aJ7YIXXRMMPN+EU64SEjDiUxVO09t0Y2QFaI8oJMzvBAsZPq68YJr6ofG5e/8WC60d+HaL8uAZZSzjYDhwsCiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DS0PR11MB7851.namprd11.prod.outlook.com (2603:10b6:8:fb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 08:32:15 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%3]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 08:32:15 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Goyal, Nakshtra" <nakshtra.goyal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
CC: "Ramadeva, Dwarakanath" <dwarakanath.ramadeva@intel.com>
Subject: RE: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
Thread-Topic: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
Thread-Index: AQHbrRFFro1RY+aCGESmY5CpnlX67LOi1KSA
Date: Mon, 14 Apr 2025 08:32:15 +0000
Message-ID: <CH3PR11MB8434A641C5FC7C302B1409008DB32@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250414074522.3263805-1-nakshtra.goyal@intel.com>
In-Reply-To: <20250414074522.3263805-1-nakshtra.goyal@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DS0PR11MB7851:EE_
x-ms-office365-filtering-correlation-id: 323591e0-aa16-4053-8648-08dd7b2edc52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pAU001V3PkOTbUmy3G22P9PdxlY51mcsJvqnnn9qT2LDBbfWoLn3VrUchaoq?=
 =?us-ascii?Q?hvNbhO4HAlGiCJ5wYlPML+FD6PEBuVYkGU+WS9BjppTard+M/8td3c6BzNeE?=
 =?us-ascii?Q?swH8vnHnLWBgBOEdYfGOb4SsrdIvrMg+aWRUP+hsAvQZI/xa9vRjRjG6cm0j?=
 =?us-ascii?Q?mfSS3btq5ENUWcxrQCYmSr3WxTRmPxDvhjZ1bLWT/hP+nR/2joN4H4DjU5+2?=
 =?us-ascii?Q?7J8qghvvJwiTCW00GmcxowI/qu5fbb/HvpRGlluhP0fK1S179k+roLDWt1Nc?=
 =?us-ascii?Q?xvsFoS+aYonBVaUbJXcwZO6d9V4O9XhludVAp7SdCS13IkJXSBuycQtX/EWO?=
 =?us-ascii?Q?eyUL/qr+RWOo7T4OUcpa0i411eBVDXlTAPctoPtxiLvtN4D4oeNLBHoAJ42A?=
 =?us-ascii?Q?AXlInsw59Hf+i0MjCnwp+38jJkNWy4amnL0sFzUj5cwxjdaKvRG30aM8JfKH?=
 =?us-ascii?Q?gi8+mfXwNw7AlXoRP2zO8vhB8dwS+s+NmtQbzUzMvnLvmZqEqC04ukBfejbe?=
 =?us-ascii?Q?kh2iwJf642J1tX93V1fBbmM+Xdp1xwq13b7QNg2HLkDEWYQw91rMeocgWS+R?=
 =?us-ascii?Q?spiOpoZ8INiqhxzV9E8f4r2NOBSNIGlm/mK2vVeFpR2OSdGEqwzuunOVOK93?=
 =?us-ascii?Q?LGHqgs1fBf6rwcVqiKxSXd1oJ5HSjB4YvxkaQnZl8rkdBDzi3Mi30vfoeudj?=
 =?us-ascii?Q?F7+p1hMeH9hivbY3/ix5MvpcnNEl4rkixjRj1dIPJNDAZo9W5G5WhFsNQwgc?=
 =?us-ascii?Q?FGNlUqXsz6HgTKkUqC/E9qLAdj8JISK4xD/nmcITcwyI8sTHp0OhUAmUvAca?=
 =?us-ascii?Q?isagQdaP53iFF03PbSS4a74MsrzuE30e40vlgjoDt/X0rFaEOzazw9SiFUY0?=
 =?us-ascii?Q?C03/UoiV2f3LUveIli4/dyQbKTSwUgSG4Sp5pq4oku+fd3tnlxJAlH8t4DJE?=
 =?us-ascii?Q?rP6GLVCXNeyWCSErlmgVPxXw+9ovCTrFmqFMmIaHAz5azVYnKG2PolHzRBH2?=
 =?us-ascii?Q?C7qcQFSIZ3v42RnzSDxN6qEavirqMh+svswYYPp6vHh/t3cWXz+/YQMhfCuU?=
 =?us-ascii?Q?kxPqVs3PvZ0elFfLIW4rpjq2LHKSfyDd8xJnj79yYLkxS80MkiuSxj8wAauM?=
 =?us-ascii?Q?e/swp7PzEUBgBV8rlVKsTRN86pJO2EuNBkMa4JTXHqTISybENVQoQVXRa38+?=
 =?us-ascii?Q?LMcVJbetg03z3IyP0S6MsqjZ/Mv4TodnMveMm6XklqayZedalMFJyuokZU22?=
 =?us-ascii?Q?fvOzVqjS4QHl0FrMUgv01n7i6Lyap8NZBprT6BDP2JvwwdNhIwP7dA74xzI7?=
 =?us-ascii?Q?B+FWW4aK45GkyDcVV6O96zj7D1P9uYxdwEcthjJStNkCN57B9cFj/9QRi/Ek?=
 =?us-ascii?Q?3TLNuHqSQtcluxFnT+/f8HVieXwF/Zn0Vwn/ph9jgXmpnjE2XLu4T1ruDWlb?=
 =?us-ascii?Q?Nb2TsIGa9GznSrX9k9DQqYS9TgGzkPKv4Ad2bBIziVb1ZXPYnyeWQi7sQlAQ?=
 =?us-ascii?Q?GJppKVGakb69ifA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3wLI08D3ZbAnm+0LNNRC2muwOqry+ca3eg+QNOtvfGBf6ZE2PL1MGp3Myfju?=
 =?us-ascii?Q?tm+ZBzy6wlOhXDeRIrBQND23KBN/2REA2GaNHJHtAPHFez9NwtF539uEYvI6?=
 =?us-ascii?Q?+4JpKk+K9XRpnUnipSvwYgO/mGRIBbbKYRNdFFiI5ILuBjC8MDxXKgdhQcnC?=
 =?us-ascii?Q?kmP20GJ/r0v3Ig7ezbGNZTdSaXC0Q5C9UohQGQpqF4kiR2ZJa8IkgQFDpxOv?=
 =?us-ascii?Q?/kH6TigTXfkdyYalSKkHapwEwnIsGsvs0eAU9UZbNxkVaQKm3SM5iPFJvWSV?=
 =?us-ascii?Q?Fhsk1rzgLChpL/YjwLcs82Jfpg/lZ4bMfKIYfCZA3tG/p4NtmZqK+P2xiQGZ?=
 =?us-ascii?Q?+tHdUMebb5eg4JpdKQLQGsM/zDWck358E9utsapoXcCv/kanvGYu+mig5vq0?=
 =?us-ascii?Q?xjoztrmeKjrmlnc0f5oCfg1QhEqWUSmuApoaWVXBF2Wzowq+niD+MWiRMnMV?=
 =?us-ascii?Q?F3ZMdZ/I4jTzoU9oV2YxTI39dZBpVFlTKqv7jUBLAK9qCWRvF0aTkiQ1m5pV?=
 =?us-ascii?Q?FHrWkfBYZ2IRhI0AHkBypt6DmDabVg7FYqLkYouhdc409IUSPMltX8lxB1uz?=
 =?us-ascii?Q?D/sf95rEekjGHE3/TBVOYu1DPcuxthBKfMHNB4hMvhcYk3rCBxh6RRX8jn4g?=
 =?us-ascii?Q?LtPf7pztZZSqxXsNwnNtfomm9j6XY7FdHQJrDZDRNNLaYyyInSjY7ZIBwPn0?=
 =?us-ascii?Q?nMSXk1N6q4Jc5ylFA62S5PHWLNmi4qwx0rEtn7fxXVi7jYh5GwwmO78+rbD3?=
 =?us-ascii?Q?nFN5/JB2wb4bou0FRxJHZRSUtCyXxjkc0GTFikHm5z+t20MuBqRCkv6LIBfR?=
 =?us-ascii?Q?atTqhnML+Xb2kZJuZ2Yv289Fb/dgxD3FZVS6CfCFdgtub9SGdPiz+4l0ppry?=
 =?us-ascii?Q?eURJPSitQ+YXXmK2i5+8pBZOE88f6xmuyLABnrym78s1g9q6bUZPeYf2jrUl?=
 =?us-ascii?Q?mP478yFbzav2SETJXwMuVgGpzWipP52FBMzOyHf5LYMzxTpFcUs/AD1H+rEH?=
 =?us-ascii?Q?IcFG67sniUaBu0T/XDfCtAyRRmUnch68x1szbGjFYHtZ2ldWo9cH+8im6Qu7?=
 =?us-ascii?Q?jghvx+x1y3I4vi1G1ysphAf880JYmCbZsxWbmsF8EuPjsVNoK4SkrqOOH/vt?=
 =?us-ascii?Q?hs5Dvsu1shFH1wroVSVG2SheNbUQoFs35NZSCr5VJH1F0nDLlM/Fhu+LS2jk?=
 =?us-ascii?Q?BO+JuNH4wziG6orQ1FJsWSj+RoPOhZFanMwLBF5MtBfEH+lhz9Airmw7Gcfd?=
 =?us-ascii?Q?Wtalcvd1CNfY35CYGc5fnVmWKdtfNtK6IEkiUaq9ipHyAfRB8DsbO5oKvWkn?=
 =?us-ascii?Q?NnGKuz8xsqTJTkWEoWlq0NNNCa3Hmy1xu/fONJn4U20/eQWz01TVNWm7s+wI?=
 =?us-ascii?Q?3EgWCpDWOzsgViorD6+ZdSI7AqLmZi4JUVHbFx1AMQht6vGR2smKgKc4Z/7R?=
 =?us-ascii?Q?l8TenaFFzLln9ZYxGcA6Z3177CYvddWnJj4ZkcV57W2e8XkLivhh06SV/GYo?=
 =?us-ascii?Q?MFzqXRBv2jQ6reFFWsoWL+FI5MoYR46zvW1UgmFf5cbyaWbprMwO7TZPVyY+?=
 =?us-ascii?Q?OZ3v9vucq8P9GhdoX7cfO7HTHJc5KP5qbfinbxyJW9sYdTJtjlTAwTtoxIl8?=
 =?us-ascii?Q?6WaNPoDL/RR4xnXobpKGhCf+J2dQPwZ6x4qdsN4c/aINkCrBd+yZHiDi/EoO?=
 =?us-ascii?Q?ve8tzA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 323591e0-aa16-4053-8648-08dd7b2edc52
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 08:32:15.1537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vCRJ+AlPICWQdT6Qn+1hcg2bGaADP8d/q5VKXkd54uZfJY3Q7DnsWKy4PTqdsGSFjL28IyAXzTSA63G/4ygH+Xdqy+1ZjYH0BlAY2fSeRlw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7851
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> nakshtra.goyal@intel.com
> Sent: 14 April 2025 01:15 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Cc: Ramadeva, Dwarakanath <dwarakanath.ramadeva@intel.com>
> Subject: [PATCH] tests/intel/xe_mmap: Adding igt exercise for RO page
>=20
> From: Nakshtra Goyal <nakshtra.goyal@intel.com>
>=20
> Map a memory then make it read-only and verify kernel out for read-only
> memory
>=20
> Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> ---
>  tests/intel/xe_mmap.c | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c index
> 5fd641075..649a11544 100644
> --- a/tests/intel/xe_mmap.c
> +++ b/tests/intel/xe_mmap.c
> @@ -338,6 +338,24 @@ static void test_small_bar(int fd)
>  	gem_close(fd, bo);
>  }
>=20
> +static int
> +__xe_query(int fd, struct drm_xe_device_query *q) {
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, q))
> +		return -errno;
> +	return 0;
> +}
> +
> +static int
> +__xe_query_items(int fd, uint32_t *items, uint32_t n_items) {
> +	struct drm_xe_device_query q =3D {
> +		.size =3D n_items,
> +		.data =3D to_user_pointer(items),
> +	};
> +	return __xe_query(fd, &q);
> +}
> +
>  static void assert_caching(int fd, uint64_t placement, uint32_t flags,
>  			   uint16_t cpu_caching, bool fail)
>  {
> @@ -357,7 +375,16 @@ static void assert_caching(int fd, uint64_t placemen=
t,
> uint32_t flags,
>  	map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
>  	igt_assert(map !=3D MAP_FAILED);
>  	map[0] =3D 0xdeadbeaf;
> +	munmap(map, size);
>  	gem_close(fd, handle);
> +
> +	/* Adding a Read-Only page check exercise */
> +	map =3D mmap(0, size, PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1,
> 0);
> +	igt_assert(map !=3D MAP_FAILED);
> +	igt_assert_eq(0, mprotect(map, size, PROT_READ));
> +	igt_assert_lt(__xe_query_items(fd, map, 1), 0);
You had not written any thing before, but you are just trying to query then=
 you will find error only write?
I think
First you need to write data, read it then change it to read it only then t=
ry to write it.
Or else can you explain this once?
> +	munmap(map, size);
> +
>  }
>=20
>  /**
> --
> 2.34.1

