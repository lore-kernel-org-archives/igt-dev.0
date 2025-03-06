Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C712FC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 07:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8526F10E90E;
	Thu,  6 Mar 2025 07:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kcI17UG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8A810E90E
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741247749; x=1772783749;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NXKC/cyB3zfD7HG8fJ0GvvViRDIuFR8yLZIwvH2fv2E=;
 b=kcI17UG2i+y4CYeCSb0eQ+ME2JroLLxgaWRyPaaSLDfZMEcTIPHol/29
 2Ir7+cPljy2X8UNOCS2jyEy0+SXE0WbgkDidRSwu6eLJBYZLHN9zuHZlP
 lDU0Pg4kphk0okxGEazbORnrBewp928FM444C5eg8nH8wF6LL1wIuq//p
 NisbcchdG6zx7SKwyCWZY/HySxt5/eUqqCO5azFHqcoUSoJaNnqh4GAHX
 9r7ehA29wKvaVAHo+6d59en1YFdrWzNP7elwWUh387qg3mpIaIEPCjXVk
 WuYASeCYAuXQZoezr6Msza1DR5cb3Lj22DPbZmGo/msueYbd4Vg2Z0kuy w==;
X-CSE-ConnectionGUID: EisYdn4pTty8zoh6stUCRA==
X-CSE-MsgGUID: np8tUA3aRcCUYBdgwuBcAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53653430"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="53653430"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 23:55:49 -0800
X-CSE-ConnectionGUID: kA5Ey7FXRayeNVrAD5uYvw==
X-CSE-MsgGUID: kvu+kuCJTfe+Kvxf5P+8Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="123103235"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Mar 2025 23:55:49 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Mar 2025 23:55:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 23:55:48 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 23:55:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2ZgQgbHMTN4kaQ6JlJsvmN07Lei0UBrNRIaanIGrs4USt756UXYZ2WvNp6ie+YZy3Vfyq0jslstFMx+G5RpB23u2CLalzvRkiTAVENJFbR1MXl5fvTFo6qc4mYvylHGD+9MjQXqSNjMnE/RhvX2ZGsHtZxQtTE4P+gktdwbRwAAUPMsSP7Wg2saByc+bl8/8cuzMAs+LO36IVkWma5viMAfPZYvqh4b0DjzrTR6WncccET2Gofx8Wrxi4QGinmkeX1z9qanOqdeYC+g1YpYmH18vo8nI3mw135AUQHq98P30zzj2mDsxaSyYt1sxSYEppYRgKrRI+a8L8YDNOx2fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fw5dDru0j8jCaIdOIqmpnGqAoCPnlZQtTEcsoQ49hQI=;
 b=NP7shSTfcHyxbkar5AqLighUxPwgkw11fvAOP/x1RIWYE3T5oGoMP1Tczbn3EiIIJf1Yu6ei68ODjhJdqVgT8MY9NvgNwqeefkelMFsR3xY+4qd09Z6uTTmYgE6PYrJl4SGtbhgMuXW71KehIsZ+ii2FBCbyc9TQawKi+L8HEnWbhzfJ30zRmNYf1oT5VyYGSwoD5YM312tYdGRPWwD6W0EedXFAPluuUqAETTMShmcAPRR6KiYprsdbjiCEnwlA23itLx8U3fGS9/o4Y77qH/pWI7BXEId9bPjMPsVvilzFezdZGD15VVsgOVbPTotpuyzwIgiXnW5O70RsIooFPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH7PR11MB6652.namprd11.prod.outlook.com (2603:10b6:510:1aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.18; Thu, 6 Mar
 2025 07:55:16 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%5]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 07:55:16 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Reddy Guddati,
 Santhosh" <santhosh.reddy.guddati@intel.com>, "Saarinen, Jani"
 <jani.saarinen@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: fix the log
 level in fbc enabled check
Thread-Topic: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: fix the log
 level in fbc enabled check
Thread-Index: AQHbjbn7nuMm6J7ALUqkrJ8I4HauR7Nlvp/A
Date: Thu, 6 Mar 2025 07:55:16 +0000
Message-ID: <DM4PR11MB6312B6BAAE2330CA34BE1FF490CA2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250305103207.137714-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250305103207.137714-1-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH7PR11MB6652:EE_
x-ms-office365-filtering-correlation-id: 3f477f03-1c97-41b6-56b5-08dd5c843b87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?0+mq08km3uA4mKx+eI+/B+dLGY/ScT0aNElg5oSxnlEF+HgLdvl4K73OVI3P?=
 =?us-ascii?Q?0DRqazNXRmeJagJOgnfzCY/FGUUoNjkkerpxXL7+N4G6L2gvhM8YV4AqqvsG?=
 =?us-ascii?Q?bF0kXXo/P0OIFD9vZ0DpcVeBuJKKJ55MEyQ3eaqdopyY8tk/66uwoAPLXYYb?=
 =?us-ascii?Q?hSrSM0mfifRMTHY9Xk1aHpyg1NUQLj+tgLLlenKw8DZ2evONn0+xFDEgc4J0?=
 =?us-ascii?Q?HeT9PR5/6C917/cabFnA1lCCBDe6VjBPJ+K875Y43+mOc0wF+CaOnaU09tMV?=
 =?us-ascii?Q?rWvjkmx1dbKPKLBjItjBE1E1Ic9pUANBgPckEIU0mn/dSYKb1XSUgII1zDHc?=
 =?us-ascii?Q?cw0+j84w1aZFxpmfRJB9kOrK31hejR/j3DDuJLnVxEgMDqAEKudep7rWWWtr?=
 =?us-ascii?Q?AZkkni+wy9OM9uoT2W05p4DEOJk4TxdxmJz/A02z2kr4siHGYzEK3Gh3iPtH?=
 =?us-ascii?Q?+3+2InQiDPSHC4mrR0cnrotFOk5KDoSLSbwcjKstA8ZH4QrzGWdjJplQqP1y?=
 =?us-ascii?Q?pRpZwuW2l5ukpmaczX469kHEk4NYrC1eGCKyc3cAJdS65/moCQHwF7ZIzDVT?=
 =?us-ascii?Q?0ayYPg2oZdiEEanSw0lJHkMGG+j8fcQEekOdmU1XbMexnvRbj1PFS0kNNleG?=
 =?us-ascii?Q?dFcrHmpR5/BBZN6fL0mbuMePIMD2jOjLRtOnjL6hbvMOEuCgXrstzxWXu396?=
 =?us-ascii?Q?mhY2Q8LwA58L7gfAsLlELCmsKXSA95QB8YMZRiFlqgNh7scPY/6LOjewzv/t?=
 =?us-ascii?Q?iCX8P2GdgF1xeG10CAxzF6lvP6IxKHjqYogswEnLkAK9fnYTKcVFwJZS2ydg?=
 =?us-ascii?Q?DAkS67kb0ulNCaIKBn/hFT6mA/P1gdPX45gKz9Q/rtr4eUAcrmPZxTX9M7c0?=
 =?us-ascii?Q?o7HaK9C3QgascgZeNZtFf5GXHtChtHWLAkn3u2iBQwQpe4P+j32qjfRVC38e?=
 =?us-ascii?Q?ynjAEevea6EfpOvpt5LNDYGmHPFJz+eNgpcBUPL+oaXBaCxJs220jpqps1Mv?=
 =?us-ascii?Q?tplHEE7dZHzPagMkeELupiNaooMYkxdhbMdFZfjY8prTnDc8Gj3T1BDeGBKH?=
 =?us-ascii?Q?gLbIoiKwIui8XZJ9cCO2VDDoJOsWHlnPNBQ1wHLPKsVErnW9IjpkKCuzPtEV?=
 =?us-ascii?Q?ZQ0pysGdUpAfGWvQm9Be8B1r2Ov0oiTXJLY0lVq2cW95YM7kgDm/20bABeCB?=
 =?us-ascii?Q?8++kdXvjVlcs2WKMeM5PP0PxyIYD5l+Y91yeCoRXMrZcS2R6roQzxaRgNh8o?=
 =?us-ascii?Q?9/DkMO3UAghBQFBlwLSByV8klvq0sog2qnxoX35q6w6dbC0fgoH7TW4wsPhg?=
 =?us-ascii?Q?WTdCS+FXpgcAr2e3Mn3KGP8vPXYjOmzV9IX75i9J1k4u9ETKnkeM3j0dhqtz?=
 =?us-ascii?Q?Hs/ZzMT43i2VHxAlGxfycd/88k3UFPCRZHoDGZIggaJ30fhXKeaDqsdWMAXg?=
 =?us-ascii?Q?WXfHDTtuPg62bGqksObo3d/ydgJ1pPT1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3zWh/qftddyyQHiuzMl44dhy3LBiLLVxW/3HyXAKS41vVUcmXo+9NUjBf8oN?=
 =?us-ascii?Q?fHD99rX2Nueqfy5S2qQY32XAVLLA7pSkt0Z/Jv2ds+ryATUyvzXz13t5vU5c?=
 =?us-ascii?Q?qe90UWi82FkZXOxXLU52xvF91JZd2WpTp15usoefLGK/Nbd+n68JrydUemld?=
 =?us-ascii?Q?sAPvLGPKH6EJhZnDcFyGSvDfdp6Tl/E7ikzSNTVc8xq8pLe8sIvUImitmrHM?=
 =?us-ascii?Q?bmpYEOehUWNey+Ioz2bTZI++ilfV8xHrwKjzELaZ6+P4EvVXUv2/M73XPZKP?=
 =?us-ascii?Q?st0mEojneq+oNXqSfSTnoXzYWEe6Ch69D+jj1xHWddKutcu+aiK0sfgdsi58?=
 =?us-ascii?Q?hx7aMiFd/g365rv1l1CFE+a184Wb/1ew5Cq6GGSS5fgrA/v8UIddfew5frPW?=
 =?us-ascii?Q?XYXjP5kfzg9DSryAkZ+HEuQ7dDdJdRZe3ep0+tZ7K9tZ3VlEQ/GE4T29LKCe?=
 =?us-ascii?Q?xXQzyT9qLSmKaJkAtH+/gCnhETp0agzpcDQiOng1dM34sV8hIEyVRnVczMmD?=
 =?us-ascii?Q?3nPrRAd5By+qeKNm8tcOwpxgYlVbAXXyP43q1ZkjRm+D4TKGQebytmANjhde?=
 =?us-ascii?Q?6vfrYbFNVNEuXUl2UUrkTRxwZBWwvFOpq7U4rWhj7q25N86NKPi9DCBxkkC7?=
 =?us-ascii?Q?Zjid+ZoSNmUz0ncxF0mpBoz9ob092Ok7Dx6t8Xb4UrbVmMKD4sgs8YUgsl6V?=
 =?us-ascii?Q?C6NvM3DHyV+j55ht0bfRrH0WXazjE3JRKuwmUn7cFD2e02Xj2LfsOaBI5rSB?=
 =?us-ascii?Q?xUWSOxf3zWev8cAUezNY/DoLAk6s9CmfRaqMtNGKltEyKB56DoyJ//spnFtr?=
 =?us-ascii?Q?05TdsJN/1WK1WdpHZQyzJBM+QvPU4oRI0Lf2BH6jNDygPFTUCGfP7mzJxTnD?=
 =?us-ascii?Q?eCXb36pWWJoIx83FLlEylaITxroChn2p/n6yyiTwwdrEO+DVyHDcGv0fQtr1?=
 =?us-ascii?Q?tbl8KwRJ4Tn8/iYrpuBWgyT0aTvezMhfxYngTZQTM2VDsS4pgZVWpQobesqy?=
 =?us-ascii?Q?24Xgp2ulorl6N0r17fHefvLOp4BBEeCKeppJ62s+NSJq9LzUf6A2T82yiISq?=
 =?us-ascii?Q?wz1wVnTMrGR0GjfeNb+MhilIMC3BQTbfFN/rwxxuDtD1tO1Yxn7frFQiPpni?=
 =?us-ascii?Q?l8qIOwubE3QOlPkDjO0gSO2k343t1i97sEMZOEYnkuH11qAgeKMyntkIzbyF?=
 =?us-ascii?Q?FUMiSMC9g0WnxM2RvAB9FR3OMmb8/sD1202wupov+TlURg1lH5+64QZjvTug?=
 =?us-ascii?Q?6EawnjARD2iV/K+sdkCbdHSGpQ4wF8N5JM3Jm55DN9v0lvJ0cSUnLD/ztuMk?=
 =?us-ascii?Q?KwSPu3bNCQgZfEA8wzRUprlhqSOxRwT7DQfKd6kAzxvAop+1AkHmB6hEL8u5?=
 =?us-ascii?Q?+PDhE6S3IF5mlA0XnK/Od2qxSCBKVyqRRX2uvAYnFjCxof5LXk4I4LlhdD/F?=
 =?us-ascii?Q?NN3LtXu38GshQo8joxZ+XSINgXZHO57ijxnTXMDvSV3TEnYHqtaOR0EJqP2Q?=
 =?us-ascii?Q?v0G6YE00NOcAXov2Yj7iUarpnNo+fxDRRjftRi6gHX0SV8iUMpJc4hBTnzem?=
 =?us-ascii?Q?iQuOOZqXd4gLBm2HA50=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f477f03-1c97-41b6-56b5-08dd5c843b87
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 07:55:16.0609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Crva/a8K2gEwOKU3ubfPZFZYHlfYF3yWmlxaGzDtsKNC37xpxtSDScqEfBXsuFlw/xVlwqYL1cUzO0xpkmBfUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6652
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

LGTM.

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vinod
> Govindapillai
> Sent: Wednesday, March 5, 2025 4:02 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Reddy Guddati,
> Santhosh <santhosh.reddy.guddati@intel.com>; Saarinen, Jani
> <jani.saarinen@intel.com>
> Subject: [PATCH i-g-t v1] tests/intel/kms_fbc_dirty_rect: fix the log lev=
el in fbc
> enabled check
>=20
> Even if FBC is enabled and test is successfull, using warn level to print=
 the info
> will make the CI treat this as a failure. In case FBC is not enabled, the=
 assert will
> be triggered and print the error case.
>=20
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  tests/intel/kms_fbc_dirty_rect.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_fbc_dirty_rect.c b/tests/intel/kms_fbc_dirty=
_rect.c
> index 1e3fc1d33..ea7a73124 100644
> --- a/tests/intel/kms_fbc_dirty_rect.c
> +++ b/tests/intel/kms_fbc_dirty_rect.c
> @@ -130,7 +130,7 @@ set_fb_and_collect_crc(data_t *data, igt_plane_t
> *plane, struct igt_fb *fb,
>  	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, crc);
>  	igt_pipe_crc_stop(data->pipe_crc);
>  	igt_assert_f(intel_fbc_is_enabled(data->drm_fd, data->pipe,
> -					  IGT_LOG_WARN),
> +					  IGT_LOG_INFO),
>  					  "FBC is not enabled\n");
>  }
>=20
> --
> 2.43.0

