Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C51AC83F1F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 09:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3D910E1F4;
	Thu, 10 Jul 2025 09:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AGstAdPz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA0E610E1F4
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752139970; x=1783675970;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LlpQliO42p1Kh3vqPOfL0iocaDbdMeDEImkk2CQfUgE=;
 b=AGstAdPzKx/H+7WH+mZPYUJs4c6LeuiYAjcE2ECPIS+u27aA1M23VnjC
 CkyC1Ekq4StXTGEZ/kuvcagGvBWUgYGvZepI7A5FtLVQu3lzR/L1xB3zd
 kjRpRYCVXUvViX+3OURU686pe+HztxkTIuJLM3Hx4KzmZjhgqTHsF2OP1
 BxkgjeeTSVMTWTW5C1cRnIq1ekAFyH6LL0tgvM04A5/yFRHdc8ufY+IGA
 RIE5dT/FUpkX+2RyXqNp4hUj5T1pbtFxEt+r5Ja+++eg65SzTVpHDRWDJ
 HuPtMHLzk+Eq0P8htPPig0funf8oxYopk5b2vWnmDoG2M+f/A3XgH0PEO Q==;
X-CSE-ConnectionGUID: /0LM5Ke+TrCm/pZkk7jM7g==
X-CSE-MsgGUID: ESclfL5iTKO5+vm+sA+BXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54288772"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54288772"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:32:50 -0700
X-CSE-ConnectionGUID: rFpmZf6xQN6BbqvNq+lWbg==
X-CSE-MsgGUID: uoDh8F6zRfeIC6pGSjI+Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="187027068"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 02:32:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 02:32:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 02:32:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 02:32:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdzq1xU8kREt7b5wQBFwBPc0EUtayhVix3zgO2ixUaFjE58d6kfw8DAOSRhp/aEQQfNGacuPaNADUMvedjKVlTI7qP5MrAqU34BL4hpMo6cjtIbqBjqR7KV6hRYBs8Wv9iGcVhpvmqvymPpk77wUHo6EDE5lw/d5G9CKiUxSmLefeGjVSQbEfPwUqy6yJyTyKuxFSAWM1qTuCn7pv0bzRg/wmPynrL2YlilMNLVlNttknHpuuLppFdsZumML045DxrzEF/7t7AnfRQjWzr9RkMgLJv9Rnn6KOniJFkJLtJcVc3F08ehLydhxXwAkU7DmcVR4OfIXRIXv57hYuCCJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+3j8UfJxuvu88vPKMYQf5Bix4tm6CroxNZuMWP0qaU=;
 b=iy9MzIvkoQaLCqwCIHDNEng63bA0CpISUSS3FuxY3c2D/e4VSGevPy7E76zD1NdlI5C/RiiSlpbk9X/gjlBxSlJX7lPJXhIdowt0RyYTJkyR9Qpa/Wu0vnH2tWyhwErjwCgSHc8P/Rrmzg1qqiV8aM0I5sBx5JZfKrTerAyZiG00MFoK6mA6Mi1CIjm4ikurXvMIvilZRGJ4p/Yg/lhUElgAPPmkUX76rejvYvhz5qnwP5AjIlbP2JtAJuRdweLQ7sjl+mLOk7XYtKGsgI2NVN2dS2lFHP6B2x3JkPtujWlm5VUuIs2HeprSDx9MwNxqNeM19MrC/Zo3tIEfSrICZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA4PR11MB9251.namprd11.prod.outlook.com (2603:10b6:208:56f::13)
 by PH0PR11MB4888.namprd11.prod.outlook.com (2603:10b6:510:32::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Thu, 10 Jul
 2025 09:32:46 +0000
Received: from IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc]) by IA4PR11MB9251.namprd11.prod.outlook.com
 ([fe80::6de6:5e54:b54d:8edc%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 09:32:46 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Thread-Topic: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Thread-Index: AQHb8WkUtDeSfmKOZkOazRd6Esffb7QrGCjQ
Date: Thu, 10 Jul 2025 09:32:46 +0000
Message-ID: <IA4PR11MB9251BAD7B5E113EFC43434D39948A@IA4PR11MB9251.namprd11.prod.outlook.com>
References: <20250710070527.188720-1-jeevan.b@intel.com>
In-Reply-To: <20250710070527.188720-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA4PR11MB9251:EE_|PH0PR11MB4888:EE_
x-ms-office365-filtering-correlation-id: a77a8bde-3fe6-4560-cfdd-08ddbf94bab7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?euf7qlJp8Fxyw2KW64gUPKqFBHG3meYpkeFrPtOSLtTpEc1J3FR4LPorPKW4?=
 =?us-ascii?Q?kwCGDGQDQRXa4MMeJNARfL+LpTiq9qi0lB9Mh5El+Y7iqP0UG5lm1wPq+UbV?=
 =?us-ascii?Q?rS8roHA7lZkfp9Lu2F/djefcY6mhFEJt8zAgXW2S4ggUpydbyNATNdlJHUFE?=
 =?us-ascii?Q?Vq2EriQt5ppu2DAqADcGc3+PXpvM2ZT0qjWJ6sc8w2HhFY1QCynzyTsJ7EHt?=
 =?us-ascii?Q?PhIzj5QpQhKgEG+3D+vwWiRpafRAjJmsKSh/vuXl7KUcjARnQA3TYLCjhxV5?=
 =?us-ascii?Q?PirUPHLyJPU5xaZxGffw+gE4jja1I0bfiTB4Rp0N60AslwPjaCiOn1Wmfi+S?=
 =?us-ascii?Q?Ek/XtA5LuUsKALdt4jaMdknnmNkHxc1Tae6de0HDPNaSSpPyXkmKNGp0ouZn?=
 =?us-ascii?Q?VaxKhMRtEwKGreLNoeR9cm3joQw2myStvYFlu+D1/zewpKfVjotSJyqHMdbW?=
 =?us-ascii?Q?shQqioBRHQ54Gf18L8UzB9YNYBYmgx7oc0PlnEzRxRp0yrU1mS/LK50fdoSV?=
 =?us-ascii?Q?8cmgTEEEu+QAfLheDjymKZIDp7IPvqf/G5fXkNJRcv1Wp7ZIVvVCARLf+kJW?=
 =?us-ascii?Q?0OwRhoQ4Gdb4CTB3+Ccqqibs9jfG5k5K2WQWkDMMykCqMuPMs1/ulYxdQIRu?=
 =?us-ascii?Q?OccbO1NBPp5XAO/q8FSU0EIdsjNwIN9TAUzzD56pw74MYM0vmN2fHC8xQlP5?=
 =?us-ascii?Q?5F/iZ/QNrj0bcYBBAhD4n7wiY2WaBFGY3G2H1Uu/+8EOYGyyzo5S9WZAP0C/?=
 =?us-ascii?Q?9iklL/fP7YKPr+Uu5eLDqxrM4RGAZ8TZArZWoq5Q7mvHQHqeNJoLDJbNydiD?=
 =?us-ascii?Q?JoYXv7nIhMUVYIxLqggl+v8L5So9KyDGvGbTcW5ampH3SG/tZLf3c8BYhmYZ?=
 =?us-ascii?Q?kTeftCFRWouk6vMdabjD30x1XM8uPF8PY8SEM9aRhTHQUpe2BSvTsH3wxc1g?=
 =?us-ascii?Q?kDWP233BpMW+rwbzI0eVHrn6RoqXm88ToCHDscmL/JSFsv2b746l/01f2UNe?=
 =?us-ascii?Q?acDQT42gOYze2XdBRXjA5FQIBZs7RrITw1TUDkmo/yKoeUu0jIhJNGqid/9V?=
 =?us-ascii?Q?8lJlK7ZKLEX+B4vvdcznTgzti9omNmXpJrSgEsYpMmsI8GNeDERkLjg30dDV?=
 =?us-ascii?Q?dz2VkjgDDRwhVB+Fj2z/QNMSdpjsFB8A2FWY7zfiyYjiGaew1QhFQFHE7pWw?=
 =?us-ascii?Q?MdSJWxD8u48z8f10HXsK++V4iWzwVqVNhV5p+0fD4Bawz+lV40MbYHOXn38/?=
 =?us-ascii?Q?NRA3XSpUkQ+YgrjtMvKOVYowCBX46Z22S+15Nsbf02IyA3aMebXQBR65ThU1?=
 =?us-ascii?Q?EPlsX+UbcMzEJNPDGHIFquRyyJky6/uucu2OnlQXTuxmG+6uGGqGDpDTaLSX?=
 =?us-ascii?Q?mmZVwrvAgfnGH3iANP6J8lri2YmMqbaxWshJqr7keWt6wMuC+QpQSfo2/Ro2?=
 =?us-ascii?Q?SSfp2MnOHjhNULmSL/PiciEMYPdFRGtiqKpAzyUslFuOlP58kQA13A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA4PR11MB9251.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Rz55fGwcWeDubC0Cz1zpgO+XWfYGFNc76YIQ0JNa/rz8XBmjtWOtgQZW+P6X?=
 =?us-ascii?Q?UHzE9pT4uQ5l8ZPpSBroESpUYC4PosCLl5u7gt0l+ifxyvqKNA3f8xQPSouY?=
 =?us-ascii?Q?jWMFK3b+j4KOXp8f/dxfzGzmKAjPs7fH3pj13k9et4GfJDHEE+7dtgbTrqai?=
 =?us-ascii?Q?gFHsALvrFd/wb+nYIu6I9XcpYBEptzl6DryDQDl9ZhjddkWv635LiKfFIJFi?=
 =?us-ascii?Q?vtv2lCCVIg6jnatjhjMp3uh3ka6QauBdoNM5StatLCJ6Brn81oWo6GXYt9Od?=
 =?us-ascii?Q?raO6KhA3I39JWT3rx2RZHY/6eekYzqfDxiQa2jkL5WWdgoPO6ZpKtUvyruX5?=
 =?us-ascii?Q?6H8PaYNLnyJTTS4RaV+bOhZsNFV5YjqfuKCTg6i23XoTrL4BoY+ckaWG2Xdr?=
 =?us-ascii?Q?24DQsJz++SwISbFFZjnvlV/NV574ZbLzgYArgcoQsYZDKt2xyO+CJUuD/soe?=
 =?us-ascii?Q?UQ3xEBuVElOrovU24cR2XUICt0dCsRzApvNYSjMu3i3E1qlUIbd9nWTMh2nZ?=
 =?us-ascii?Q?S4oIkdMTclm3T3XGyTJiCIUUi98cdHfQLzYnelqqUvJ0jIBPD6jWP6zz/dRY?=
 =?us-ascii?Q?BK+n5aeYdE5APehgCxQUD3EJKoPae49ruHqX7L6wey9ePnD6beAwiyGWCzIB?=
 =?us-ascii?Q?WhujTzH6i98CuzwIOxTjd4BXu03JzSoI+ZGVF/BPm0oMQNRVfAXqCIapCxOt?=
 =?us-ascii?Q?DI8gZiEGn8LANweYQ16BKwLABg3L6pB0XAPE6uynY8Tomkw7JzaeKJG4mEWR?=
 =?us-ascii?Q?U27HpXkVgPZegK/2D/+54fgb3g/utQw9BqIoJ6cEU5Zue4jvJt0vlGF2uJyZ?=
 =?us-ascii?Q?iIipW5Cej/hhjuGitXW3CyuwQWXi8LDzRWFvognP8lX33fXoXM888WcxAR+9?=
 =?us-ascii?Q?8/RmDfNqos2K/HflYtv4DqL51M/PKXN0jjcJ1Wn1e2vw/GFdmqYWwJR2lEbr?=
 =?us-ascii?Q?PtzcCBx9LTk9hw6KdRhhrFDByUeSWHv5mXQCXqYVEf3S/bIGFAR7Kv1XUBpd?=
 =?us-ascii?Q?+GRv8Odl3Posn6XOgI77T+VKGDIQL7S7w/ap5N++0vrdxlAF2oPXmdb5aF/1?=
 =?us-ascii?Q?Eckx2bG0WDJjMOApJwpBXs9MVWaTfbBInVslrStYxVcxgkfIo+nz+/mbtYsr?=
 =?us-ascii?Q?yC2IlKq4Z3d6hRdPBGhRxANMbtWfgTdPIocFVKJGOjRtGUY0QX8hmffi2k2X?=
 =?us-ascii?Q?nG+MEGXwVXoocDWhEU4C2BBdsM8rKXD/nxiAFIBzVfhknpY/j2yBfonm2Z/I?=
 =?us-ascii?Q?vJLisl8qHktwXUV9a+aWSn3BSpNA8XrCwBfunwzebyR/j2K40pE4/Bg8xgRd?=
 =?us-ascii?Q?OWPaqCpTYmlW/Fiy2KdO9/tK9ybV3yavhTDtRg+OIvjNHoAQ4BKC605ds2gX?=
 =?us-ascii?Q?H8FmkSPVAClkiDzRgzQOKvxVJi42DeXsuUgMJWXPGoNuj8zY472hFD3hv3jt?=
 =?us-ascii?Q?6tNFtAQTQR4PPMP4AHabfTOg/rsfECQ8jDifx09qaFkziwDtjZUkV7CBrSyd?=
 =?us-ascii?Q?skVbFctoASA50RpRhELzk4ciFBqPq3Gp/1tmt8ZdH80Wd0UJIhHZ/JWX2ZB7?=
 =?us-ascii?Q?NTLNBJjAIBeBgwDx4i4gHDKeBwsc+6EgpdgR0r5q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA4PR11MB9251.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77a8bde-3fe6-4560-cfdd-08ddbf94bab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 09:32:46.5071 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ReLZNO4gUDwB/yndiK0QQSrh5Cn1yQrje3E7A1Gxhfl1MuiGXjZdoYzERVzGLSkMUftPmnq9Ugj9O+TDRZ5h3GcVbSHDFDwu1DKzohJagrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4888
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan
> B
> Sent: Thursday, July 10, 2025 9:05 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/kms_setmode: Fix clone mode mismatch by
> preferring eDP mode
>=20
> If an eDP connector is present, prefer selecting its default mode for
> cloning. Some eDP panels support only high refresh rate (HRR) modes,
> which may not be compatible with external displays. To avoid invalid
> clone configurations and test failures, we choose the default mode
> from the eDP connector when available.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_setmode.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 484c3a95f..462313e5a 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -252,12 +252,28 @@ static void get_mode_for_crtc(struct crtc_config
> *crtc,
>  			goto found;
>  	}
>=20
> +	/* If an eDP connector is present, prefer selecting its default mode
> +	 * for cloning, since internal panels typically dictate the clone mode
> +	 * and may have HRR support, making them incompatible with
> modes
> +	 * supported by external displays.
> +	 */
> +	mode =3D &crtc->cconfs[0].default_mode;
> +	for (i =3D 1; i < crtc->connector_count; i++) {
> +		drmModeConnector *conn =3D crtc->cconfs[i].connector;
> +
> +		if (conn->connector_type =3D=3D DRM_MODE_CONNECTOR_eDP)
> {
> +			if (crtc->cconfs[i].default_mode.clock < mode->clock)
> +				mode =3D &crtc->cconfs[i].default_mode;
> +		}
> +		goto found;
> +	}
> +
>  	/*
>  	 * If none is found then just pick the default mode from all
> connectors
>  	 * with the smallest clock, hope the other connectors can support it
> by
>  	 * scaling etc.
>  	 */
> -	mode =3D &crtc->cconfs[0].default_mode;
> +

Unnecessary newline.

>  	for (i =3D 1; i < crtc->connector_count; i++)
>  		if (crtc->cconfs[i].default_mode.clock < mode->clock)
>  			mode =3D &crtc->cconfs[i].default_mode;
> --
> 2.43.0

