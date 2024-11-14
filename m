Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0C5D6DDD5
	for <igt-dev@archiver.kernel.org>; Fri, 15 Nov 2024 06:44:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A3A10E06D;
	Fri, 15 Nov 2024 06:44:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aaPUgosQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E381910E06D
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2024 06:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731653062; x=1763189062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zNPpUd6dzK+f7KP1Avhrve0DOct++WMR2dcK5KX86KU=;
 b=aaPUgosQU9Rk9dhhJvfFLgcb3ZTnxnr5ZQRocVIqoe0UCKAwxb8jc7Uj
 VePztGjDUbylnR3WpW41KRg41B9YIDEOM9+mL2aCLjZjynGeQX8wQghi0
 GnpzWMFlpaFhiTxj0oazTKamv9qqQ3h8bo+SeytnzvigUs5E1pzOL7avs
 nj32DuYh9/1207gL73PtKEJxAp8kb6uLtxZV1xvtYOszxFvIylXBtwsDK
 dZRGzOyPryPp2C5DkKYxhzwyi/amq0DcJWQ/DbdFOjANFtSLT4bP2Mnac
 hhQJZMMIR4uFgWRUi6mHzlvDFL/Es/16ER31pasxaS8jxWBnOq9a8WRN+ Q==;
X-CSE-ConnectionGUID: /1e5C3niTnuPvtnTllWh2Q==
X-CSE-MsgGUID: QC7mlhRrS1ioP2CMYt0J+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="35395076"
X-IronPort-AV: E=Sophos;i="6.12,156,1728975600"; d="scan'208";a="35395076"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 13:43:28 -0800
X-CSE-ConnectionGUID: QFiEqRwVSnSzbuXsEpKZ5w==
X-CSE-MsgGUID: bgK6xhaaQpu8rNn3VjMwhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="93290545"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 13:43:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 13:43:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 13:43:26 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 13:43:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2KoWrX5TRpyLUIqOQFPYnSZcgZ6ntr0+5VCXYYmT01jWMzbYGCp5pWp8q3s97QmoNlg0WsG9oyrWVueIf0k4KmsBphvIgmTDnFjzUmXHFWBeAxPJ1QV+5x4QCF1bRlWiCSOYhn0pM6kgu+fSB1zWG99XaGd7E+ZJyyEV+7zvTqjhL/d90GwwtqbJUBeVKu5Mdu2BPmCrVKqXPMs05XP4eYi6rZwYFaKFKuNi5Hwi1ud418nyUOpiacC7Z+nbF2t2q3T02qndf2oMlT1FZ1nVTxlGxekbnFMDFuxn0YgNXa9nd77mMK61pcMZSc+Z7Xke9Iwr+A3euXxAcGqhhVqpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM4Zm18gz7bXqKqagQbz3B/s7YmsSnyoXAHJnGRc4Fc=;
 b=nUlwXGXJ5r4RJOv9i0Bd0nOfmUGcLWdY4TdTBjjg7tN08VEnznfN3u45/RSRd/p0Mdu6r+2Hgok7dtgCHjQ5uWl1caF0qcT5FcvzeKxDSXZ2xWziqp20Mfzq2w2m3ERZSQXUmY6HoxdLtsRt1m4TwxUieoE4VIDZyAN0ioyJFq6uMhyM1akh+OMYQ1pXUxYJxB3KGVkMUJoSudfoz1puRhXl1lVrImoxobmrx4OOATtjWGrFD1O/K6YJu3Eb1yIV0EbSzCoqmOq5Dxr4mqAjCkGlBxlJmkqbxXADudD4mhXe9LwMcwDLKNQgVAxWCXhHU8pWiraDKSpYKqV5xGMEFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 21:43:21 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 21:43:21 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Maslak, Jan" <jan.maslak@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>, "Maslak, Jan"
 <jan.maslak@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/2] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Topic: [PATCH 1/2] lib/xe_query: add xe_hwconfig_lookup_value() helper
Thread-Index: AQHbNrJxOota8O5kQ0qTrR4VtY1qvrK3ROUQ
Date: Thu, 14 Nov 2024 21:43:21 +0000
Message-ID: <CH0PR11MB5444134B3F4F03E54A0E9A0AE55B2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20241114162843.1210570-1-jan.maslak@intel.com>
 <20241114162843.1210570-2-jan.maslak@intel.com>
In-Reply-To: <20241114162843.1210570-2-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH0PR11MB7421:EE_
x-ms-office365-filtering-correlation-id: d4817e7f-1ef0-43d9-78ae-08dd04f55c1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?DMcfJTWiX/IopAO3nmzHVjpuyhZPZDG2WR2RS9O+M8GeYb6UVVbZA1wcDmJv?=
 =?us-ascii?Q?08s6Pch8EsB4q/eEW25BwIfYMkEJTdwsErbtSYc4ezqlQoKgThb8WNGxl9on?=
 =?us-ascii?Q?32w2iqZnUSVpZD4af5xQwCz0pYxzINJoV+jwYHRmvOYqui8OhDiI+x1u6Y9M?=
 =?us-ascii?Q?jC0yTY5FxFE1vuD6qrLgnkwGrxEC5paQ2uqEx4PI0ZJoKzR1SUL3pYFoUdhJ?=
 =?us-ascii?Q?1yLwQKxmtihXWf2Ybx3Bt/d9byzKz6GibWFWyX0+iGjKraR1psab0xZhotLO?=
 =?us-ascii?Q?e9/nFaVFJHIpte3gOvquxVO8L8B5kbzQuVSb0jzs7i0B1NEbg597JEdkR4Sn?=
 =?us-ascii?Q?1QQPVBbUbI0mEIxUJeVJDtv53rqhktY/6rly96Q19Plz1Vttvjgp8w5kr9We?=
 =?us-ascii?Q?pySzsPnLquleZDBI3B8DGUXV7Lqw4gVZnlfAlzAhA2jPP5xHP6N63+0i8q3+?=
 =?us-ascii?Q?AVKBaKcglwRMSOOXZXvXI4utbrkhRQPDvLePdszneGzqEbBn2Wejrs/j5xgF?=
 =?us-ascii?Q?biqd4ZmbxbL4dh1Xbr7a1+46LpZfklr8CL0VOtlFDDL9/XKO+Fb4wot4L0+c?=
 =?us-ascii?Q?SGKzYu9x6GF1gROzxO5UJh44nKCOoCnyhKx1z2T6JjZ45X/KuJy9gtvgkvyk?=
 =?us-ascii?Q?xSrAl6u4l4+Ctbm8FDDzvsm73WgcIC60egMlE3ikpOleAQOIzD/c9ctWR/83?=
 =?us-ascii?Q?7LM5IdFN325VwMHR7YptjhQhV3UqvQFEzuUMgZ7B7cNLBHS0CIOjL6JYVXeh?=
 =?us-ascii?Q?yIzPqvofV9gMc+RH/NvghDWTkkhSuj+SQtfPBkc5q5WHTLM//f/elfww3VoW?=
 =?us-ascii?Q?depRfUzx2qCY/2uw/WB/FwNgtEsYHxQmzOvLkeuzDRIUx4tFfAFEkqOk3xE3?=
 =?us-ascii?Q?+ir4otA8Pw8OjHITNYWEcwQg+Rg3o9g1ullEcTVDapWI8truZDnZIQs/914k?=
 =?us-ascii?Q?NSUSU650ij/cwvOpkVmLKN+25geIiIgN3Pnl2Cg8qqN7+Biz3H7MHmcRJbjs?=
 =?us-ascii?Q?v/TQH1LG6h9gwyEXgyrYAaApkmn9tvz5gkDgIeQkYmC2U8+2G0PS3cvFRmsw?=
 =?us-ascii?Q?g8sJ8kF77J2H8GBotxNg2JJdOnA9XhfP9mw5UZ/ZASxjuLulIBBwmUtn+Aze?=
 =?us-ascii?Q?+8RaFJanbu8+nLpUOvh4Ww+2g3I62BOaW1lP+VZOvnDNuWJVSftSQXRWtQ20?=
 =?us-ascii?Q?zbz91M69ObAecwbRfSEtWV2t7OJtoLN2qu/viNjvB+8LgyuEPFBNxmKAIS7O?=
 =?us-ascii?Q?viX9QJ00W23xpksh6H+BR9H35SPGPTuMeYj+puTC7ehNNVInS35XyoPPu2QB?=
 =?us-ascii?Q?M3S5OoNUZNHmNXO9LyJd48cEAyB/FQpSg66TQid1pT3cdvNdRF26vJwO/vsF?=
 =?us-ascii?Q?d0fzFAA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mDJjGTwKLVPsoxlTjx5svZnIGw088M8XLtOYhBpyZ5UQh/IEP/UayW0vwIXR?=
 =?us-ascii?Q?NAqpetA/2cjAq2xiRnusWwbXuSfh6a3RbdWmSH5MFulb3/NIEGUklFR4T+OI?=
 =?us-ascii?Q?RjnoQFs3qorPUHrkNDey0KHBZzLVOCOsrAv2CfPzdwTeuzTm3dAXc4qerDuc?=
 =?us-ascii?Q?5Bco8SsimV5YkLIKsB580rLizXEWLemjeK+NiRKnMc0do5+O4jzMs37aCVQo?=
 =?us-ascii?Q?2LgHc9aI4zzHQHOhBryqiGq4dJh87GCIJr4viC8yVEoKmDCi6as51oli5qOl?=
 =?us-ascii?Q?wsjaoSkYQhM82bFYtorVZC4UwOp6GDqB9qs2Rtq7miJnR0I35vCa427GRqoU?=
 =?us-ascii?Q?KwiS8N0BCATLzfpClkxHe2T/cdjvRhrbPqW7jFKY7Mk9Q12tc+AE9SMPiVx/?=
 =?us-ascii?Q?QYrDHNulBLo80WhEoivi9261bSGf6DCwUxY0DO4d7wkx13LZtoRo21eoDW0N?=
 =?us-ascii?Q?drft+GIRYUkbpXy2KmcMnG39us1Y74uTiXLJKiOyY+MqFIkJwUZBZ5IWEohR?=
 =?us-ascii?Q?/nrJCy8ZrROEdK15YRNwT3Af0JV7K78044xNcUGIGea50AfFyUdWz4/R+vcn?=
 =?us-ascii?Q?O1LGGXdttu+PxSMY5kjFyd2Iaie4LINAoeSjWFCdJNdPBe6l0Y/QpSnRXQav?=
 =?us-ascii?Q?UBQznQULjH+b580eHk2TX+jGCIa7OhzW30dHlTw0XnQ6NTlF1s3dnl6WmgYI?=
 =?us-ascii?Q?CXi10wgKbQ3KB5gzyZfNGhxLi2MvsrC8swBOK82skyBu1KUBRSWJlWw9/iIQ?=
 =?us-ascii?Q?wXvuPY/Hn7Ht+KriSPvIV55e04eAHPlLRhvkzqh3to2pA9CH4UXtPxOkvDPT?=
 =?us-ascii?Q?vkjQx+EU0KbLE+uGgoRZm/3mPWWYTEHgM29i+UhVHwwAI0bx3NiKekY2wGNk?=
 =?us-ascii?Q?l8CcUrGiyd/dBy93IRy+Z4zNhPbewnktQ0ivyQKD4fI2+dWj46TV+DWwuSFN?=
 =?us-ascii?Q?lqW4dM0DsNpfeysSArV5AusZ6cHnLrFcJ5yHUs2p54e3pbBF10MjD1S5o+V/?=
 =?us-ascii?Q?OgXWERCcqRNDzfBSSvYdHbu5jrsYThv+Lr4qUcEx1P3S3R6q4STZuovhnPf/?=
 =?us-ascii?Q?xmvPLdu2ygfB9vdHfReMDITfk6OblrvMUjizrs2Sjwatzoo1A7R4yrNkkDKD?=
 =?us-ascii?Q?1At8D+XVHuW7W11KrjV1eeiTNg6wWpeGXUzssmBu9q10PHJ3yQVt1Hcrq/q1?=
 =?us-ascii?Q?NcnACAJTDsry2gGlUpeSO+0ugBuljgb28Spw4UEgritHJvDWz5kuEriObQNi?=
 =?us-ascii?Q?feQCRJKjcryHBYnqAQadpWHDbK81J5df63Xof0Sf9Cs1ru7tRh51OvIhGYv+?=
 =?us-ascii?Q?ak5ZFogUkNTNomod+YZqQrO+ijMOJmZbMdSq4wkz2r447iOwMaFDDmLCerfj?=
 =?us-ascii?Q?4NFec+SRlaRPkzqLWTIo/e3AiRKMQdh3MVvAlZA3wUy29IE8bnOC6/qE0PmG?=
 =?us-ascii?Q?vH77uKwWVebFwySriLGdBfN7mH0NYU2M7XnpEzgAE4I5X/V25y+/OlGNfB70?=
 =?us-ascii?Q?EJBwNWD/kxGcEzrjbtMFEqjbphtEI4Z7ZBYUEi7fOYDmjDgsF85x2V8q9KBU?=
 =?us-ascii?Q?XXCVMKRrttAm1Bm1ba+px3LmuDBYQo1PZ/f1L7Va3OLBSfyoQZOAdJz6Y0pH?=
 =?us-ascii?Q?Yg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4817e7f-1ef0-43d9-78ae-08dd04f55c1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 21:43:21.4996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +BWGb+YmzbizIXTLxZpcDaUn1qqQ58MYyap0IH7gAPVgqMJPxo1RyRs55djBqDh4Mu4eVI5Gz0jIk80wUqjo705jI6GnAwNdSqTzLvpz/KM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Maslak, =
Jan
Sent: Thursday, November 14, 2024 8:29 AM
To: igt-dev@lists.freedesktop.org
Cc: Grzegorzek, Dominik <dominik.grzegorzek@intel.com>; Maslak, Jan <jan.ma=
slak@intel.com>
Subject: [PATCH 1/2] lib/xe_query: add xe_hwconfig_lookup_value() helper
>=20
> ---

This patch seems to be missing a commit message.  The commit message doesn'=
t need
to be particularly complicated, as long as it explains what the patch does =
and why it's
necessary.  Or perhaps just explain what xe_hwconfig_lookup_value does.  Ma=
ybe:

"""
Add a new helper function, xe_hw_config_lookup_value, that
returns a pointer to the value of a given hwconfig attribute.
"""

On the other hand, it might be better to restructure the query itself and c=
onsider
how to best format the commit message after that.  See below.

>  lib/xe/xe_query.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_query.h |  2 ++
>  2 files changed, 58 insertions(+)
>=20
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 0c9cff066..07d790f37 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -811,6 +811,62 @@ uint16_t xe_gt_get_tile_id(int fd, int gt)
>  	return xe_dev->gt_list->gt_list[gt].tile_id;
>  }
> =20
> +/**
> + * xe_hwconfig_lookup_value:
> + * @fd: xe device fd
> + * @attribute: hwconfig attribute id
> + * @len: pointer to store length of the value
> + *
> + * Returns a pointer to the value of the hwconfig attribute @attribute a=
nd
> + * writes the length of the value to @len.
> + * The caller is responsible for freeing the returned pointer.
> + */
> +uint32_t* xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute=
, uint32_t* len)
> +{
> +	uint32_t *hwconfig;
> +	uint32_t pos, hwconfig_len;
> +	uint32_t *value =3D NULL;
> +
> +	struct drm_xe_device_query query =3D {
> +		.extensions =3D 0,
> +		.query =3D DRM_XE_DEVICE_QUERY_HWCONFIG,
> +		.size =3D 0,
> +		.data =3D 0,
> +	};
> +
> +	/* Perform the initial query to get the size */
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_assert_neq(query.size, 0);
> +
> +	hwconfig =3D malloc(query.size);
> +	igt_assert(hwconfig);
> +
> +	query.data =3D to_user_pointer(hwconfig);
> +
> +	/* Perform the query to get the actual data */
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	/* Extract the value from the hwconfig */
> +	pos =3D 0;
> +	hwconfig_len =3D query.size / 4;
> +	while (pos + 2 < hwconfig_len) {
> +		uint32_t attribute_id =3D hwconfig[pos];
> +		uint32_t attribute_len =3D hwconfig[pos + 1];
> +		uint32_t* attribute_data =3D &hwconfig[pos + 2];
> +		if (attribute_id =3D=3D attribute) {
> +			value =3D malloc(attribute_len * sizeof(uint32_t));
> +			igt_assert(value);
> +			memcpy(value, attribute_data, attribute_len * sizeof(uint32_t));
> +			*len =3D attribute_len;
> +			break;
> +		}
> +		pos +=3D 2 + attribute_len;
> +	}
> +=09
> +	free(hwconfig);
> +	return value;
> +}


While there's nothing wrong with this per-se, we might want to consider jus=
t storing
the full xe device query results for the hwconfig in xe_dev, as a part of x=
e_device_get.

So, instead, we would have something like:

"""
static uint32_t *xe_query_hwconfig_new(int fd)
{
	uint32_t *hwconfig;
	struct drm_xe_device_query query =3D {
		.extensions =3D 0,
		.query =3D DRM_XE_DEVICE_QUERY_HWCONFIG,
		.size =3D 0,
		.data =3D 0,
	};

	/* Perform the initial query to get the size */
	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
	igt_assert_neq(query.size, 0);

	hwconfig =3D malloc(query.size);
	igt_assert(hwconfig);

	query.data =3D to_user_pointer(hwconfig);

	/* Perform the query to get the actual data */
	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
	return hwconfig;
}
"""

Then, in xe_query.h:

"""
struct xe_device {
	/** @fd: xe fd */
	int fd;

	/** @config: xe configuration */
	struct drm_xe_query_config *config;

	/** @hwconfig: xe hwconfig table data
	uint32_t *hwconfig;

	/** @gt_list: gt info */
	struct drm_xe_query_gt_list *gt_list;
...
"""

Finally, from there, we'd modify xe_device_get and xe_device_free as such:

"""
struct xe_device *xe_device_get(int fd)
{
...
	xe_dev->va_bits =3D xe_dev->config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
	xe_dev->dev_id =3D xe_dev->config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE=
_ID] & 0xffff;
	xe_dev->hwconfig =3D xe_query_hwconfig_new(fd);
	xe_dev->gt_list =3D xe_query_gt_list_new(fd);
	xe_dev->memory_regions =3D __memory_regions(xe_dev->gt_list);
...
static void xe_device_free(struct xe_device *xe_dev)
{
	free(xe_dev->config);
	free(xe_dev->hwconfig);
	free(xe_dev->gt_list);
...
"""

This solution also allows us to no longer need to add
#include "intel_hwconfig_types.h" to lib/xe/xe_query.h

-Jonathan Cavitt

> +
>  igt_constructor
>  {
>  	xe_device_cache_init();
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index cabb8078c..580f82958 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -15,6 +15,7 @@
>  #include "igt_aux.h"
>  #include "igt_list.h"
>  #include "igt_sizes.h"
> +#include "intel_hwconfig_types.h"
> =20
>  #define XE_DEFAULT_ALIGNMENT           SZ_4K
>  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
> @@ -112,6 +113,7 @@ struct drm_xe_engine *xe_find_engine_by_class(int fd,=
 uint16_t engine_class);
>  bool xe_has_media_gt(int fd);
>  bool xe_is_media_gt(int fd, int gt);
>  uint16_t xe_gt_get_tile_id(int fd, int gt);
> +uint32_t* xe_hwconfig_lookup_value(int fd, enum intel_hwconfig attribute=
, uint32_t* len);
> =20
>  struct xe_device *xe_device_get(int fd);
>  void xe_device_put(int fd);
> --=20
> 2.34.1
>=20
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.
> ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wy=
dzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-=
316 | Kapital zakladowy 200.000 PLN.
> Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu us=
tawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w tra=
nsakcjach handlowych.
>=20
> Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresa=
ta i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej =
wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jaki=
ekolwiek przegladanie lub rozpowszechnianie jest zabronione.
> This e-mail and any attachments may contain confidential material for the=
 sole use of the intended recipient(s). If you are not the intended recipie=
nt, please contact the sender and delete all copies; any review or distribu=
tion by others is strictly prohibited.
>=20
>=20
