Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E52C27C55
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 20:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BF610ECF8;
	Fri,  7 Jun 2024 20:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="moHRVryy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457C610ECF8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 20:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717792953; x=1749328953;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oddJyBmOMV6yrb4OeU5ILShnEVnFfDW2dInJrMElxVM=;
 b=moHRVryyiKfo+Gy1lciZ+xW4pHtEiX1PlJQU0seNJgj+KtuOO7cyfOxw
 p6nk11C0HqqMxvwC3FcjOsZRIiXFk3auLMArmM8Ost5LG/+r9s4+cg7yW
 3tOD4D5HQT/LHkc32dAhAvt3ezLYazMrYRBCDvGkCCbqFR9gTSxA0ySA4
 wuxY5nL/fS9IMkkFvu9g+N4kTEYHUROUQDwRr16gEblk+YXjSfiUofYf9
 Ls8N2e0eL03eFC03l32HuXOzXat9udXV4XEh4tycjP5XwVER+vY5r/8NP
 86kmGEr+XtUxGKJTBSuQOsMfDMs3VZ64hd8s/vQfp1QpKrIjJy6Y+F7KQ g==;
X-CSE-ConnectionGUID: 3DruaCpdQtyKNX3Oh7oteA==
X-CSE-MsgGUID: DZ7QbQcRTB6kl1jYCyPFMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14363428"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="14363428"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 13:42:33 -0700
X-CSE-ConnectionGUID: O6WjOnnvRgCOShoALanbcA==
X-CSE-MsgGUID: zmdNJGe7SMK0/XPFCCFMsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="39101969"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 13:42:33 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:42:32 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 13:42:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 13:42:32 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 13:42:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZCLm1LQOCUfvmr9CcsBbvI107uTnlX5DVJTSVD3OeAou1+x179Ptm958B+hFcuVUxhrjdAjk/qmDmvXIDrn2/Tp7NiuLEhmv+FW2I4/ivXubrP12e3o0smPgJCI/mGaHBTQHVpK6LDanBqK4ZaChVf5nRIuZafDdwR6uYs4uwtgT5ApKdv/V5e7pmcklAdhsa9nk824QnvH8+J7CCE1At2QtgryNvffQIUO/hUoCqVg+RtnMjzuJU+n09D6PSLPiuX9AZhzexMYCBmYDX7DXjV+0sENY7J9jecziZyTn2tddSKRdYBt3Dg6IpcyfwGwNJnefkEwWb0J8I3PYUBef8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBHm7D1Mvcxlqz8X/o4aPm29UqYXrnvYrwh8j4Y8o2k=;
 b=fwaxaUXOEKYyWMlKG2Kd6CwpH/7TtWK3Q6i32bv5GWSsbZcVw/HNshIBzOGVmSgNH4SSDqL3v2QYDH90YtrkD03u7UFYShWeQ3uHLVQUhrUaPdZ20kfE1XoycCnUFy3Xjfg23V3L+4Kqc27+ikhqCcbVlBVkc3uR1fe2AyMZZsunLP0YsdSLNVDu301yH9xZwm7wmLuJsQIhdlEsZcGdZzNfooXM+t3gTndHfNjCAsVSvB3UVos0+UvEdH6wUiJIRM/4MotZsTUEyyfTvAy4KV5MCOD1xVOM4f9vQMDXp4mi81iH4t+ZYcdPZcT8+GvcakYlTJjHOvN3RtVSM+GUXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM6PR11MB4612.namprd11.prod.outlook.com (2603:10b6:5:2a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 20:42:28 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 20:42:27 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 2/4] lib/i915/fbc: add fbc frame size check helper
Thread-Topic: [PATCH i-g-t 2/4] lib/i915/fbc: add fbc frame size check helper
Thread-Index: AQHauOsplLHuVPmUA0ObETrsZvDGoLG8vv+w
Date: Fri, 7 Jun 2024 20:42:27 +0000
Message-ID: <CH0PR11MB54444335CA4C7A68D324DE32E5FB2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240607145732.285557-1-vinod.govindapillai@intel.com>
 <20240607145732.285557-3-vinod.govindapillai@intel.com>
In-Reply-To: <20240607145732.285557-3-vinod.govindapillai@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM6PR11MB4612:EE_
x-ms-office365-filtering-correlation-id: 38547d82-1141-4bee-239d-08dc8732584b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?cNy6xRa7Pp4aDxFkFnxfTpMaYQ9xnkgb8P1moyb/V2IecAeOuuqifwzKtCYZ?=
 =?us-ascii?Q?pkkNdjsvuHiiEZYAONaV81vGnCK8DkTLOsY9QDgUnqmHyFIyuMarrgpkI3is?=
 =?us-ascii?Q?flr59wsHDjirunXRDD68ImpCAPPvaLAAfL/Wb2TmNZS0sut+EXUb1OTElUbn?=
 =?us-ascii?Q?bRc8s7uBt3FpODl1dAMPFwFCoARuLkN05h7U6IiTik14LwHW+SoxWPtXvUqe?=
 =?us-ascii?Q?KtDoeYDen1MD+LYUc3lxjRKrO3mlTCoZDIlVRwtTg3XwsWqeoGeL3IsBkPJw?=
 =?us-ascii?Q?TFFhY2++PMzZN1cYI+S5z3//hLDy0MVRqTUh7aiqVOdFtsc5hcQM2CGOUE5R?=
 =?us-ascii?Q?QauxB+Xi9vdwNxOZm654hv0rFMevEQHgXesjOTV+KnuBoGaInut00EiCyimC?=
 =?us-ascii?Q?h0z+HEwhnm9Q4xxj8BNHIAd+NHac+3FQM85kZ1lBxRbX7olzL4aK0mf0O8bN?=
 =?us-ascii?Q?bgBoQtLc8708dO13eqFdavInoIBD1PeRWGrnsdu2KLcKuky/UXk86ZoIzgRa?=
 =?us-ascii?Q?vy/KKa2iSPdZb7JP6mXuoLOLql62VBEz5QQGSPUs+vT7fxcu2wuoKRtbQDaO?=
 =?us-ascii?Q?Xe2/F2r2NiggCWMnstzRNTtf82zt7j1WPfVNXh3QgWulSSVggjamG6rS03+p?=
 =?us-ascii?Q?bm7HoM65hRMb9BLXxAo/zIq4wMpq1UU3YkuOor8RwXUPqWTONJLsK3JXoGM1?=
 =?us-ascii?Q?0Is5mj4lhlqQz6VtaJqFysto8MsCkK+zWYa/pBklbcJuNTex1bsUvYSaUsuH?=
 =?us-ascii?Q?aKZgyIHhRAntjk93o9nvvWRLSWoD4UwZ/RI/sKT73F5P772UTAcJPOl3ISDL?=
 =?us-ascii?Q?4C0a+mWS/RYtQp+h4akZ1z1V5uu5s8PbR6KjfDCHQLowzLg4vSC2RV2pzcxq?=
 =?us-ascii?Q?f6e50G0lRRlFKPoRJ0rlF7aI3yHBVyYgdgCSYX91WpNFpfao1ZpLPM4W0IQR?=
 =?us-ascii?Q?/sooUba2ZzFqB/lTa1JsX3fEsgty+PIHuHt1JSStaf0ppoIi8E2xLJ0G0O9j?=
 =?us-ascii?Q?FdGpbhAoAQWVKDdrq8FwSmM0aXKyQxIVp2TTmR/7zw5uihYK/YY3C94lCLEt?=
 =?us-ascii?Q?jGt30UqFHh7uOb/bMSZOKZBlj3n2QdCRvewABs1Wze+2MoUT3gxUo98Wk+ky?=
 =?us-ascii?Q?nwNgCeI6Z9juIze4yg5tMZKIsc/pF9wyMVXLN/hkcV0xFwLTdFug9Mep5+lN?=
 =?us-ascii?Q?qeo6OEiyGPXJfMrXofE7SVOtPAsvW2Uz629sy6W0+TfF9DMYtzJ0FchJ4zbW?=
 =?us-ascii?Q?guehudFnybeUNfDs+FoCM8u8IjzGTnG1ka37cShAFl1C7GKgrg8Jf5G7G6ra?=
 =?us-ascii?Q?DhiKe9U58F6ma1bMDvveGykZBTh4sgVYYJtPGk2k6lKV1TLwzoZLRN6GMtVv?=
 =?us-ascii?Q?x7X141w=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pby+3jGC5QwVwvjtn4GLdAcisS8Hm2YEeloXLD2Y1yCGxdey6KK9qAtUA/cJ?=
 =?us-ascii?Q?bwOQgnD4ihE0qU4rBvt5uyAfU3r00fOCBvRhOcaCnhRc5SkW8JYE/Qelf3nZ?=
 =?us-ascii?Q?DwP6vDzVdisaoYeklnzqbR8ab+ZbM7oDwZ14JXFizuyG1I5x9BHDl6BfpT61?=
 =?us-ascii?Q?QVuzyUWDrM8cEecCNI9App7XGvYz5zFEuPtjy5vOMCyqBIstNGUpnjd6Lm2b?=
 =?us-ascii?Q?z64lMSGclQjQ3D/Dw8k0Sfa6sUHpzY8P2T2iuIpQN5bcHGEs5x4MDJzxeqp/?=
 =?us-ascii?Q?zEaGPtGHHgCdz2TuJAhR6XyCB6VjMV88GLYK6KRCSdhfqMIIC3am+nJ3TMvU?=
 =?us-ascii?Q?GOPHSqZFmvlvWHtbA3EU7KAqki7kEKhtV6Y/wEANOFz9qXAe/SUgUV1Qh2te?=
 =?us-ascii?Q?IMMQdtQPT/9pTt7m2hq71MBAVRyiE/XhqljnRDtJOtYD62shBBpCSYxe7rMk?=
 =?us-ascii?Q?Cfi+DumTpRD25foiHzc0wHkUG2Y2i4nG8/wwBGvd3STd3rRTwWVfFWneq9Pl?=
 =?us-ascii?Q?fDuBGQ0ylROV53qgVZJRbth32tmWFRW9UavzrykRE2vK7QfhpAoGqYy48qQF?=
 =?us-ascii?Q?6TJiKUf8gQ3ZS3QhV4wmI8mhYyncsIODmdNT4VagZ5XURiRpYiZgyh9wRQX0?=
 =?us-ascii?Q?7q2FbXHMhsgqglO1h5e7FXbL8mdgp3sCOXvezq/IHjOYdJXTYmsfxN1U3788?=
 =?us-ascii?Q?7HPRsX3eRHYY96tZEwrWoYMHlPCyFmaw6fCNGcX+zSnM9OzCpJzagaw/GBKb?=
 =?us-ascii?Q?i0VqZgo4YYFWfvR9SgCjMAcXz+JbOfAs0qL/4T0Mlge8NiRY4cZqWs+rMnM+?=
 =?us-ascii?Q?P5gTLuDhqrZ+a0uebZOKNxxSTMOGi5YofG/i7haZ9oMhf4zd3FpZUzlrOYUb?=
 =?us-ascii?Q?zW/2pK6QZ9fcBwovYxOXBlkNX5p2ngTb64p7R3qlS5CbQRwx578h2cJ5CEQj?=
 =?us-ascii?Q?2OxZ3Q+yGMUIiYhNUV1MJSCp6H7T+k+5eQPu7I1SWRo7/bHomTYnGpOAKQ2a?=
 =?us-ascii?Q?vDrBBNW+YvvhJyl4ZP2JYVfZPqdlidyz1OppxG8bEdXYbObhKmvUzPX10Wws?=
 =?us-ascii?Q?2CRx7LyEG97Cq2fM//xU3Xgyr3UBMeHyhlUsgARfDgYZtrg6FKUOSkGyJqQZ?=
 =?us-ascii?Q?vM9036Q3C0G1PNEl6hciAN5DFRlGBV+kPDQ6pax8GBUOrZ9S3DuRXwdePFDz?=
 =?us-ascii?Q?KsSEWU66/+yTGUKzI0d9hxXuf5uzygA+AG65TDSVYqZ6jU1xUgJ1w+/HwC1c?=
 =?us-ascii?Q?T4GA+fEbuVMr24pdrEm1WSiYevhQKhbxb1rxKCKyujgAzkb/Cyb9yhoJIVgM?=
 =?us-ascii?Q?ZY64ZZAgCkQzNcrMkKkpfY6P/QzQUJOhX1eYg8AUXr4WiapB39yF+UnfEajW?=
 =?us-ascii?Q?Gij6ErVfti/vNhML4AMksFTbMcYjPLoqItL73k4NPbHOE+WNWy+xzM3irM3B?=
 =?us-ascii?Q?FuXvokEl2jT8CSTRcrzTzsq+nqv5D3/FXAhcC7uW4H0NBFD+tZLgQrf1US4y?=
 =?us-ascii?Q?to641uDBgJYtzYN6rUGfiToWuspc/2hIUO1HcJLg/SWkJml2jUus2T1pTA5T?=
 =?us-ascii?Q?sSb6zNCOpQRjplMPcJxFb7e33kvNY0l5wPf2vNbF?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38547d82-1141-4bee-239d-08dc8732584b
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 20:42:27.8696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vcDr25KA10u+BMVla+d70pPBZdpBJHwMFljcREVdbUETBs1Xi5diw7lSPlgLpQHiqKJvXx9J5mS4vihTH5GR2AkGr8XfNL/v2LacVOhNfIU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4612
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vinod Go=
vindapillai
Sent: Friday, June 7, 2024 7:58 AM
To: igt-dev@lists.freedesktop.org
Cc: Govindapillai, Vinod <vinod.govindapillai@intel.com>; Heikkila, Juha-pe=
kka <juha-pekka.heikkila@intel.com>; Hogander, Jouni <jouni.hogander@intel.=
com>
Subject: [PATCH i-g-t 2/4] lib/i915/fbc: add fbc frame size check helper
>=20
> Add a helper function to check maximum plane size fbc can be
> supported in a display version.
>=20
> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> ---
>  lib/i915/intel_fbc.c | 36 ++++++++++++++++++++++++++++++++++++
>  lib/i915/intel_fbc.h |  1 +
>  2 files changed, 37 insertions(+)
>=20
> diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
> index 07ed7f469..992e9c4de 100644
> --- a/lib/i915/intel_fbc.c
> +++ b/lib/i915/intel_fbc.c
> @@ -99,3 +99,39 @@ bool intel_fbc_wait_until_enabled(int device, enum pip=
e pipe)
> =20
>  	return enabled;
>  }
> +
> +/**
> + * intel_fbc_plane_size_supported
> + *
> + * @fd: fd of the device
> + * @width: width of the plane
> + * @height: height of the plane
> + *
> + * Checks if the plane size supported for FBC
> + *
> + * Returns:
> + * true if plane size is within the range as per the FBC supported size =
restrictions per platform
> + */
> +bool intel_fbc_plane_size_supported(int fd, uint32_t width, uint32_t hei=
ght)
> +{
> +	const uint32_t dev_id =3D intel_get_drm_devid(fd);
> +	const struct intel_device_info *info =3D intel_get_device_info(dev_id);
> +	int ver =3D info->graphics_ver;
> +	unsigned int max_w, max_h;
> +
> +	if (ver >=3D 10) {
> +		max_w =3D 5120;
> +		max_h =3D 4096;
> +	} else if (ver >=3D 8 || IS_HASWELL(fd)) {
> +		max_w =3D 4096;
> +		max_h =3D 4096;
> +	} else if (IS_G4X(fd) || ver >=3D 5) {
> +		max_w =3D 4096;
> +		max_h =3D 2048;
> +	} else {
> +		max_w =3D 2048;
> +		max_h =3D 1536;
> +	}
> +
> +	return width <=3D max_w && height <=3D max_h;
> +}

It might also be helpful to have a separate function that returns the max f=
cb
plane size supported as a raw value in case any tests wanted to operate on =
the
full fcb plane.  Say:

int intel_fbc_max_plane_size(int device, uint32_t *width, uint32_t *height)

This could store the width and height generated above and be used as a help=
er
function for intel_fbc_plane_size_supported.  I also don't know if fcb coul=
d be
unsupported at some point, but the int return value could be used for any e=
rrors.

This is just something to consider.  I won't block on it:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt


> diff --git a/lib/i915/intel_fbc.h b/lib/i915/intel_fbc.h
> index 995dc7f1e..f05b351f6 100644
> --- a/lib/i915/intel_fbc.h
> +++ b/lib/i915/intel_fbc.h
> @@ -14,5 +14,6 @@
>  bool intel_fbc_supported_on_chipset(int device, enum pipe pipe);
>  bool intel_fbc_wait_until_enabled(int device, enum pipe pipe);
>  bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level);
> +bool intel_fbc_plane_size_supported(int device, uint32_t width, uint32_t=
 height);
> =20
>  #endif
> --=20
> 2.34.1
>=20
>=20
