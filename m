Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3839ACAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 11:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E318010EA95;
	Thu, 11 Sep 2025 11:15:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQZJ5D2B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6767010EA95
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757589315; x=1789125315;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SgPMpIePm7K/0IG0MbXXO0mQmv3L5BgbYMNaXXUy8Z8=;
 b=dQZJ5D2BSkEz1XLwZBvt6w143okmk3//2YRfCCzhIVdUl/XfzryNFGTW
 nwxUOkybm/uBi60O1vh3iy2nxv47EKlK/xQiKPVg5/T4dljFOKX93BEMc
 UWhGyVRt70aMaJKulzxXmjR6voJ3iExss5Jspo/bLEV84KEElkcsosvO6
 YAfFeMJFWp275eRsdBX/DPTtD2NwDISpJNA+eLV1sY61/8mYCCB3G/d9Z
 5Dzhr+qWF3PXmPKNcfR5bcER5wgjECBrGMJzqIfcBo+VCIxpVskbKdCR2
 YCPlEGLL0m1YRE5kwxPXI1jzcdNew6tt+4ECithul8OwtIacC+v87TjWA Q==;
X-CSE-ConnectionGUID: r+4TYFmgQa2IqpUqt2nmZQ==
X-CSE-MsgGUID: 0qThppWuTWy9yIWOUCVg+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="70535114"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; d="scan'208";a="70535114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:15:14 -0700
X-CSE-ConnectionGUID: PicrDm7HQ1yiTTUrTvey7g==
X-CSE-MsgGUID: hJw5FURQQEi/AEX/JL8Ukg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 04:15:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:15:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 04:15:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 04:15:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvcpgId1ixNN8sY5gLiZhiVIALzqEbHCgIXavSrJI+3Ym0h1YoChwd73DrqrtQuenzsfLW11P9fpKBn8IK5qm9yvyimzgmFuuFzm9V4ir+o0koTYqB8Jl5ptoHPonC7CV2B7vAoAIBLxBSnYUpTbMbpWS8Khsx9GmVPo8uZTG7ohhFtdPl2SWSqvenSf1SO8b3iK9Ixv4Vwtjh9Zh7DhkhV8XHbClNsLLPIJtkRgaj1dYdY0v6ZNZDc23iQKn50X58TxUxhWtJJLo0qcR9I0OxudMK23obs2JGYT710iesCMGRwRYRsAz4k/nwhwTG6wJ19wA5ePCRyEpuDt4F1e7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hvQo86cUijCsqaQdPGHDnouMgDkOTEAT+CB9FKE5Jg=;
 b=k53rUi5XEuIvNARNWGzcd0OpGpbOlC51KVKOTBJuplmdQHkXU0TyfWPehRLX7+A+JNVyQAUTPqiYv/zUkt7OYmvysFq/cN8s9gP7B3itWwjNXxy02md41/BT/Exb3/XGxWostCg6FDrbIc6xskDELyKakxL5OpGPIyC0ncuPbP9tHdUhxkpr/Eu3H3wRq7LJLmBcQJudMjEjipRUSH95u9kVMnhSZajvw8ZyPgrjdllyEwYudSmlWIeHY6liBxzE1C5FT4Ia0PkmfBMAIivqnSwc5T0TUxfNxN0iN3h0z/9DJQ7jex6wVu4aC4oZN1V1hqnsEHvxu+BiGWF3HXgn8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by PH7PR11MB6836.namprd11.prod.outlook.com (2603:10b6:510:1ef::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 11:15:11 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 11:15:11 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "Patelczyk, Maciej" <maciej.patelczyk@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Patelczyk, Maciej" <maciej.patelczyk@intel.com>
Subject: RE: [PATCH i-g-t] drm-uapi-experimental: adjust eudebug ioctl numbers
Thread-Topic: [PATCH i-g-t] drm-uapi-experimental: adjust eudebug ioctl numbers
Thread-Index: AQHcIwrnnplxLdonW0+i143Y3Mcd07SN1Guw
Date: Thu, 11 Sep 2025 11:15:11 +0000
Message-ID: <IA4PR11MB925189B09A1A927BBD021DE29909A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20250911105739.2374050-1-maciej.patelczyk@intel.com>
In-Reply-To: <20250911105739.2374050-1-maciej.patelczyk@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|PH7PR11MB6836:EE_
x-ms-office365-filtering-correlation-id: 816306fd-133e-4d10-d816-08ddf1247970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mjZ3s/uwihOEfYnLgKfRbjWG4m3IQ2rvxROSlL0XSoumi46NUwCWsrKyrAo0?=
 =?us-ascii?Q?Mdvdo+Fdjhl9wXvaUliG5GSC3NIU5yXMerShEsdeHE2mx8phvxn5EYa7Q/Sk?=
 =?us-ascii?Q?LH+T2Ydi5OHw+dbZ12k+CnWwc/p8sjmdAPy4Bcfj3psPpbB9vn4feeyp0qAR?=
 =?us-ascii?Q?lnmDmXOn92v7ahuZrXMoi4kYiWe71lqxXShQpip+1QSSlJhIuA+vvG1+Z7pE?=
 =?us-ascii?Q?ODgZY01MFoySHv2UnfJxuLONHYpVypT8Qm5aZYqmNOR7bZ98kaK2tybaoJMY?=
 =?us-ascii?Q?UvkGBzXUXENCLKsnJ1QO4nWQR62NCGKZYohFo94oKq17NRMSHTJ95sue4ilZ?=
 =?us-ascii?Q?vvOjFFMWcynp0WI4xVZWG2atcKDbsFMKvYSlhEsYIxM/anb6aVqFp/KKxTz3?=
 =?us-ascii?Q?cWnVPovz3aud4X09+8YbP0mstZ7wvCKKdv+cJNn1pRSxbZ3eLBteE37y9ZUy?=
 =?us-ascii?Q?XgcQ9MwSTSV/WOxzzP6WPpDfRNQEFAW5VZ/G3yqYXR1Js3r9bSTwpdEcTZTD?=
 =?us-ascii?Q?by4LA9f2Fk4obIXWEXaev88Fn3zRAvmmYoTKsylWDjjMzCe6pX7dzbTByuuM?=
 =?us-ascii?Q?mO/d5FMGN1Y1f0S5J5Ty7QYrSZJADbku21PfkTwRAWLKPhVVclP5PLTdJNwk?=
 =?us-ascii?Q?xf21ChaQhhOocBqRlEZKnGdnhBMy2h3Ki4dD+Tw9aEtO4lhuDcFLHL2VzESw?=
 =?us-ascii?Q?Mk1MJnuh/slnG05k5HoJl8+6LjM12v+AGDTD8+D+HTCppN6X28GY8FrbgXWf?=
 =?us-ascii?Q?6YMOFrCk+JS1s5JskvSi1s9FgYxnm8AsairM5zv3jDLNwsnlblNCMuGFNWBb?=
 =?us-ascii?Q?SYRMyZCGQjMoG1mVWcYrAPWwGLdU2zXTN4Xqx0Z5OHEsrJkliMVfbC86hkn9?=
 =?us-ascii?Q?eXYz7YlovpJYQcOBmT5lLKkqoZdY9SAlC7gBS1K2DJbIxcVD3A0fDs26X8RD?=
 =?us-ascii?Q?DvdcsR/Ezju65N3CrT3N45hb9KymJnAUFgIszGPO64udcr1GEUJ7IYmgWhUU?=
 =?us-ascii?Q?bTpKRAOT8KZUrJ2VqLPOntE2oHQKAbUs+bzd7j9ZGOtgXvt48ihibeWcMc2j?=
 =?us-ascii?Q?Qj895PIs07k+EHro6VQ6p0rGIZoagn/Ju0CxHkk3N3kQg71Owkxkxg50nbjH?=
 =?us-ascii?Q?9AxGwZpor36K3YOfP+d3HRzxTaJRMGLKzjABvjH+Dgte2GkfYOKviWJQCJcS?=
 =?us-ascii?Q?y7B/TkhY4u7S7RyRLpPMCcwMQ60VX6QXS9b7RLNrH8MtOlilln3UEPTl8Y3W?=
 =?us-ascii?Q?cftNb0/YBkrfu7jhR3wyr1HTiYv0QTlYHhPWKLslV/EBlWb7kgmmqx6yU9sN?=
 =?us-ascii?Q?WZp12WFhpVNP84jhnj2JzAPQSSGVk57UJpWz1sNK9/3lClfP0dhO3/pOuCsQ?=
 =?us-ascii?Q?Y0yDxKmHoXv/s8NYkBdHuDzjInafDN2YgsQjKtr3zTPXRqneUG7cVOdNtWtU?=
 =?us-ascii?Q?3TJLk5J1PHCK/nZn7z9dAOEcP7vZSdcWKjwc6U7MJpGOtV3yVLglnUgW+Yh8?=
 =?us-ascii?Q?Bo6Yfy8DB6eCtcY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xWF9fl1O2xe3vujlJWcR07UIeoLdFI1/jnDtVoRrn87RWP9hzVnPlTdDUXXv?=
 =?us-ascii?Q?XVKxZZ2loa6wB1vMmXtwJSrG4fgGXqRqjhHrBb+ZPcGcs0SXvsooeJ+ZdnQ1?=
 =?us-ascii?Q?SXduqwYfZ6UCxmZzY95OQDY39mffH/XLZ1teNg4BVTNL2tjGY1Df4091HZA8?=
 =?us-ascii?Q?gd7x6ns4fpjkeM2nLiUUB4ScMpBYtUuAunyG224rWbiVWe0XOgls2VHeEHSt?=
 =?us-ascii?Q?+0Dk+9MzIGAXgQtmERWHVciWNVPf7gi//jzL290xZPF87YGGCB3biOXwa6Gt?=
 =?us-ascii?Q?OHlG764QCSD8+0BOBQqrXb1OeVfoXTr5UGC7pJ40lNmJ9y6QPI7eA2CZus1p?=
 =?us-ascii?Q?a1lBUiZL7i928h5pyGY26GEvRO98rvSBb25WxYVbMQmiQi0fcX47W+oyZl4i?=
 =?us-ascii?Q?RIWAe5+XVN5xa2nyuHzDIZfbDDehmf1h9QocOs/uvoUnCabDTSY/QsO+Xde1?=
 =?us-ascii?Q?c0VPbfvsmTlSnh6prcRYhE0oXfMbMTprBVouKFlHh84PR/sLRvA+iMxdwPB4?=
 =?us-ascii?Q?JAx2p9JMEmqvXYaZ6NlpwE9VF0wIYNXpqL4ZClI1aHQnoYoK9aUTrU6euZDo?=
 =?us-ascii?Q?gyICE55CX6l5kKDyq587Gcy3BKfcpU7VaXomxx6fE/qAzsK+4nhPOeWsXdX+?=
 =?us-ascii?Q?Wh/XC1B9FKfFrPjyK1M5Wpts/GJ+tQ7cQFALbo73rpVhAMlZpgEtT6TicxYW?=
 =?us-ascii?Q?1MVRDIgGlWCdxfv2ZAUSpL/iANusi7GAxHo/aqrBFUlwzeoYss/ydylRfTvP?=
 =?us-ascii?Q?9qOuRjwbZZHfninvC3D0ndsP7UWTrRixgZbn7CuyMSd8Vem2AUKhBJb552OM?=
 =?us-ascii?Q?ZdYSHEOQnGRkcwocv7WHjCRwQo87vIKyElWJQpic65eEkqxmnRDX1MYXfGEv?=
 =?us-ascii?Q?QYr3cPaGL4cKt0pNKWIG2xt/Nn4VbP7gW4fw5lZ+G+zcRxWGrOV1N6Jmgv9P?=
 =?us-ascii?Q?3L42WwXkWSsnjXIQPX5Shos/ls7giiaMu/20SF5382xF513GKDnGF8UVRl4F?=
 =?us-ascii?Q?0lxkbmkpKRmsjE4rNli4H+IT7RlPQCFjOTS6Cs6wGf5ldDEbUXaACYkITT2k?=
 =?us-ascii?Q?dENOngmwOaPWCv4Q5tOxAe9RoD/75HB+pe3m9ilivXPUjX7aCBUR/W0Xn5re?=
 =?us-ascii?Q?yVGnNnR794m77BH7tD/mH8RGDMNCInHAKyK39ddCWjeGUtpcZ8Vlmg4r5Nd5?=
 =?us-ascii?Q?a8+MkSNDygof9GNXM5XS5gAkukrXgToDF8PAwthjR2EI9wCtaPDJ6wOD1jX4?=
 =?us-ascii?Q?ZnSQnKPZQL7xuXbeyxcd6LoW46DTScdiGBxoDF3Gmlt043AsuPxoVBDJFkAz?=
 =?us-ascii?Q?FP5XcbHkTr+UPOVf8PdMRx/07ZCnzO1dxRGZnT+QOjkzkJeowynh58pIJyo9?=
 =?us-ascii?Q?piOivGZsxXIX821unZdKKasKoXjYDNfZNNw7lOKRPEPbMblEt9G8oYPR1WcG?=
 =?us-ascii?Q?md8luAFChHwX5VbzLiyZydLQ+XX8dzwGQxEY8oQAmFewMeCwYDkzSC/nHTGE?=
 =?us-ascii?Q?cLRRjrsLG+CgosnCxoSJrXtA//uBOJhq+AAodx5/OZ14DK+BYwjTZJ33d+pQ?=
 =?us-ascii?Q?j6qVxxhGx5nPOsK+BCaAg50+m0Fg5UBUjDKqlg7P?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816306fd-133e-4d10-d816-08ddf1247970
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 11:15:11.4830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MbYK965/873yIGIkKGfhXRGZC/wTX6skgbsjoJzLC5lV6t9UFVZLYJNXPlIcmBs7dtF+apjCTXIC6YIU2kXlHBJFjAGyzmk2/kHLxUx7IlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6836
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Maciej
> Patelczyk
> Sent: Thursday, September 11, 2025 12:58 PM
> To: igt-dev@lists.freedesktop.org
> Cc: kamil.konieczny@linux.intel.com; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>
> Subject: [PATCH i-g-t] drm-uapi-experimental: adjust eudebug ioctl number=
s
>=20
> Adjust DRM_XE_EUDEBUG ioctls not to conflict with drm-tip
> DRM_XE_MADVISE 0x0c and DRM_XE_VM_QUERY_MEM_RANGE_ATTRS
> 0x0d.
>=20
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  include/drm-uapi-experimental/xe_drm_eudebug.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/include/drm-uapi-experimental/xe_drm_eudebug.h
> b/include/drm-uapi-experimental/xe_drm_eudebug.h
> index f66de2ff5..5aeb6a735 100644
> --- a/include/drm-uapi-experimental/xe_drm_eudebug.h
> +++ b/include/drm-uapi-experimental/xe_drm_eudebug.h
> @@ -19,9 +19,9 @@ extern "C" {
>   */
>=20
>  /* XXX: BEGIN section moved from xe_drm.h as temporary solution */
> -#define DRM_XE_EUDEBUG_CONNECT		0x0c
> -#define DRM_XE_DEBUG_METADATA_CREATE	0x0d
> -#define DRM_XE_DEBUG_METADATA_DESTROY	0x0e
> +#define DRM_XE_EUDEBUG_CONNECT		0x0e
> +#define DRM_XE_DEBUG_METADATA_CREATE	0x0f
> +#define DRM_XE_DEBUG_METADATA_DESTROY	0x10
>=20
>  /* ... */
>=20
> --
> 2.35.0


LGTM

Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>
