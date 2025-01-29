Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3706C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 05:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 633D710E253;
	Wed, 29 Jan 2025 05:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="izo3jdSE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F8510E253
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 05:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738129796; x=1769665796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ppn82bgXEBUstxHefi0y5Zgt3VdV8kSZzH8RB03Ulqs=;
 b=izo3jdSEjheOvI1TFb8Gckx/O5tFXwbQP50NnWGjFaL0HoqGHw7JG8UQ
 9ojOtGNUN++SOWV5/AhqzeASIQN4Gli7yblima9Ql/N3e9coD0rEC3jN/
 i1Xwosj7ZgYHbWL/0vk2L7flvpxyav/Df2avvyylemRPoIw1eUYpZDwkO
 ONIt5aAGIH8cAMvUe1QEsbvx6XF7HGkctSDs3HO5FqAKkb9lap1Rzz9pE
 R6v34dCSHTMtlF8O1sln7zMkmZve9gqT9VxXZw23hyPfni0HV0yvhQNB3
 /LHskGlkBqwp/DRHsG+QnthDojnCyPH/8MrMBr07cBGYWK+2OtAIqBz+l w==;
X-CSE-ConnectionGUID: N6Qe+JrZSCWHSwbK04/3ag==
X-CSE-MsgGUID: ijLDDAlPSQaHOneOTKXiQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="42290935"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="42290935"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 21:49:56 -0800
X-CSE-ConnectionGUID: 9z6N1wxDTAyqT8iykuOO5g==
X-CSE-MsgGUID: dMYMNe/qROGVNNLLLQF5rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109853879"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 21:49:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 21:49:54 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 21:49:54 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 21:49:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ki0BXZ7QrmXvpV9S/OmLd0C/HJLtg/VoHY4oNeXriikBRkce8ZxhqXLCRCXJmFf1tuFz4DcD737DOU2fLhWPCc/0SAHoeLS9FI9oBeiYIerSGCPM67prGP7pi+dj+SvzkUKY9yMGsoqW+YtaxF/AlviyryDkY5o8sxgFoiK1OmPnT7SQ6Mg4N1hVthcXDtfLZ2KS9XNtPFypq3+Vcnoo+YtnzYKsRJTOrPKWndOpKet/Jspmto/bDEDByfFbPLtAIIgKptF7fSws4OMYyVBhqviQ+I36GYirig5jwQIugszY+P1T4TG60+hPjNaxlVHn5JdX/50Sn0guyrj9AuMjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WXhCcFrO8zgq2iQJ7/rboS1kxDj2WLKjCZO1yga+kEI=;
 b=cexLYVi1Fw4+/M4/RYpUnP5MYs5leRDDOQOpriUYkPkZCXqa+yFe6BPRR3gbvj4xTuwYlAbeeUhCUM+mL7b340f1MAD6sTnEIrqyzM8UiskGE8DZIsrp5jU8pWxTVOYa8wwqwAVWgXubW5ejfb0zDmoE1GsZ8Sv6hpiTIbCuyS1iSIFcdXGMAf5IKKWE1wjvf5f/8ss5L7sTiB4qzYbiAau/6L3Nwhm8ZDJbjBxjetnkKWeGRQn07NYJKMW+SPn6kW1dDp82ywp4in3ubmMcP1myDFQph5JcNW9uHBLMlxyJUmsLKP85CsIUougEWE318IixxVhabLRQP3dBJQPVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by DM4PR11MB6117.namprd11.prod.outlook.com (2603:10b6:8:b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 05:49:51 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 05:49:51 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce debug
 loglevel dynamically
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce
 debug loglevel dynamically
Thread-Index: AQHbYrhO2OnftlpBlka6aGdaCZivjbMtWuQAgAACOXA=
Date: Wed, 29 Jan 2025 05:49:51 +0000
Message-ID: <PH7PR11MB6053A2C9161DCC045CD65E67E7EE2@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250109170729.47646-1-pranay.samala@intel.com>
 <DM4PR11MB6312EC7D5F28BF763D54292390EE2@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312EC7D5F28BF763D54292390EE2@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|DM4PR11MB6117:EE_
x-ms-office365-filtering-correlation-id: 722771f9-07e2-440e-a044-08dd4028bf82
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?e/Xo/wuaBTHXTxBAm7QBBAg9S8YfQt/01x8MnZ0HF9k+bygwg+i3G69buOjJ?=
 =?us-ascii?Q?9yBN431V8kfxMAMDFEnKid4cvRjL81p8Jko8xeznf3GMT1NVK3q3vE0QkjsQ?=
 =?us-ascii?Q?JNkfF0jYk1F1VidXiu/PvlTFy0W9xXSlscUM5kld4EPdeBISz9YUKhzH4SY7?=
 =?us-ascii?Q?akATULOMI/L3xfKljye2zYFI5w22a0pQn2304XPWMpHsRvjvJ6021tzwIxnS?=
 =?us-ascii?Q?IqBnPNP+OXeNPTeD//zjAC3GS0ZEi5NdNijFxkZBXOLkPA46AWpJB9WRexAE?=
 =?us-ascii?Q?NwyCetue04Qz86V2sv9ESAYH7wpK6OBrC+c+bGAkYGJx+tQU0K8SY38ICkZY?=
 =?us-ascii?Q?tDviTVkAAXsyHnB4X9/zGq7GL5g4Fnn03RE3N6LitGVWcllcBDUPzGFd+exu?=
 =?us-ascii?Q?tEZYT3nwjlobvZ2mY7aHqKfa7RCU/fpIlARwHhbFen3VvpC/VaXM7XQMXLR/?=
 =?us-ascii?Q?O/8OkQWJGQ3tEE6lwZ+Mk+13Mwhd9eNegpn3RPBVI6+SUFn9IWAz/+o0hTXT?=
 =?us-ascii?Q?vyltd7V9YxOaTmch5RolsxzSdzYJHMWtT/8eeD348OFKgphw2IC7GFB4GDpR?=
 =?us-ascii?Q?X3+mGwsE+TVxOQ2twpopvOT2MwKZ2uoet/UKK/RaMdU2LuDVkM3C7bkA98PZ?=
 =?us-ascii?Q?2vPIjLzouPGkH8hTFRj9j5wQXUh83Y2el4148acOkO2oOCrD/lUgjdhFRlmE?=
 =?us-ascii?Q?Z5wBgWmNWV9o3dJ5BDnCmSoPV5z1MtUt024Ij2pe2zMhasAQgz/JKdKzjHIN?=
 =?us-ascii?Q?mZUbJrO9N+KvjL8VGw1st9ofU/U+tydZ4LqNSmpqnltbCvqIs2HsJcfa0YZL?=
 =?us-ascii?Q?Nny4dlyphblpSAkDsS9TKyhANLA6QXamjcQbPvO1s1R48eUEXvmcVdPSCRMP?=
 =?us-ascii?Q?Sqx2/wlyguVs/z7BpH8nQWDvnksZEDXp77SE+62nU9aq2otT6xl7yP1ZMXCm?=
 =?us-ascii?Q?ZYdD3A24X0sP9FArCZe+7jDm9lH+F08v9ADoMXsy7GjTRe8eCkIM42B7oZIY?=
 =?us-ascii?Q?crE+W2+gkyPOtRgE+72yM+ccmWPrHkjPHGzWotOhGFdS4pBQzsD5r1BdKqsw?=
 =?us-ascii?Q?koiJiXYZrKrb+vU7mnLFEMpmXnZ+TIIhSOjIDX6bFd8IMkTVNlnt3Onvn+Nn?=
 =?us-ascii?Q?/MSyyapcdjFRJX+pOC6VA7rk6nytOEOYOGzTu7py45EIDaJyQjDoyuX0Qyik?=
 =?us-ascii?Q?4jRUb6HWc0vy34aNgnyvaEl8BvYy6DkFfYjxS48pCBej+o49v2CGJ+2b/kig?=
 =?us-ascii?Q?xYN9VCeEI4gzlEj67t2R0ZI7a2b3x4Fsexx8lLXFKi/V23kDobTlZBr4URwq?=
 =?us-ascii?Q?KfQ83Vd5aetAgr/YFiHNtaJFEUcT/GtpPhDRKMAfKmdkjAf53IXLbbR4251s?=
 =?us-ascii?Q?AEt+STIHKTGpDt+YXJZa7ddU5bzfuAdsboaRSHNELiTMeWcsiN8hZD2j775t?=
 =?us-ascii?Q?vz6u7Xkb7bMu2DWppUuQvLncfe2IKkRf?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G09reGuLfUTpv5D5sFWjRNt8qrcWRg9ArivWVroNP+YYbXLN8qnvnYAk6riR?=
 =?us-ascii?Q?wV/fzi4lncofp9BZzTQUMdOI+sSfm7Q3upZQ22tmjlVo0O8rFAj1ox1zHCEn?=
 =?us-ascii?Q?oxS2703eYI1P91gMqe3g5wz7BA1tpOPSxbFO+aBfJEpMFnph+35vq/DFC3Vn?=
 =?us-ascii?Q?HV/NKWu85H8an/+6Xv32S6XRY0u5ZDU8+7dVGrov2eOH11Nbx7P+5pW2PpPn?=
 =?us-ascii?Q?78J4KcIH51mBHL6CjvTE4ljn35UkqJ3OuRxRnD81i0s0ZCpgMMP6rbPaKA5E?=
 =?us-ascii?Q?SZtBKNBLHPyMbQznOWW19rF3ZQz95O72WaC+Pv2GBU30U8+FIi3UqVBVSE11?=
 =?us-ascii?Q?2TxMx+1aJRt/DtTyX2wFN73GkthYK3C7QzxOAq1hr+oZXgu/etwjc5v88uXi?=
 =?us-ascii?Q?tg2sIuSgomchzp0wYlG8nm8AJQuB3vIpN0DlptJLWWibBptrGwxvrol0eeJy?=
 =?us-ascii?Q?vUaZFm1zT0jLC+aH9I9O2HWUNyYqEhuVSZ3dJ40a77Krzf3MscdBWzw26Sci?=
 =?us-ascii?Q?IGOFWhdPnqe//EFaKQI3BiGUSQGrMSfAhflbznkZCwBEJs3ra44HczUNI46S?=
 =?us-ascii?Q?AaYP2b/YsMIqxKV/KnIQcau4p9VrWKSNtJHBt/EUpPuy9mIwlnvAhKNXB3Rs?=
 =?us-ascii?Q?Z9DyxFywUD7chYC4xP4Po83g8e/ZKXLW3SpY81kTTOA6lEXrXJ5xD3jTfXmH?=
 =?us-ascii?Q?3ISdV5mkbxaFmwnvYqjANrl3AhBRJPfBcPewFJdukfaEJSTM2vtfxx+Sg7wL?=
 =?us-ascii?Q?tG+CfB53hGFkzKaHGmvr/8Nh9+x+UBVEOG+e5XHz6opX3Sri9pzFU4vnAWgv?=
 =?us-ascii?Q?dnXnkxCYMp8ldyhWzyOWn6glVz5BKFR7by+ZxFIgRMudcYdOmtGN1Eptk5B7?=
 =?us-ascii?Q?i1K/9WMcvL2KS4LSjH0F7p/4LM27MQlB911WBX009+3K97vkL212u3Vcghog?=
 =?us-ascii?Q?Rk5rC2VcEX5STVVzA5D2hZDCFE0LgCmCWNed3U0VoV0xHoyJ4xcyGM8Pu4eJ?=
 =?us-ascii?Q?j6CtYQrFJ3ozCHtTc0ZxqN4KGifWzL5ezL6++0l2oXHRX34+a4aLwG8y+und?=
 =?us-ascii?Q?zb0gW1wo3+MqqGiVYZae/wmOJ3UB5fwoE6dSI7wZG8hp2zYx7ZmPFowCPIwb?=
 =?us-ascii?Q?7rRr1MkYZ2wdVayXuB/BnxQnC2m1buDqO8wMVrXQOETczNawYErA1F7ntVeA?=
 =?us-ascii?Q?ZAhtXqCthV4rWR3ZfTUW40W296ZjtOIqN4yVLBY7DhPdWvXNCayxyzlrxJ4O?=
 =?us-ascii?Q?HSw3+vKNr4oYRsSlLupNI20Ndv8HFyP8NkBfaJQnJkpZGGD5ex5Xi9MhpB/X?=
 =?us-ascii?Q?Lb93vMBRjQwWDeMK8c/Nv3ascdAvcpzeJzgVWIhfbC+yLYPHFB+V5VLrBrxn?=
 =?us-ascii?Q?Nr3J+ycbwuAEG0PUrlM1Qp+5VjBBH4UEeS2l7aQPo6JHEMfaXpKNlBMazL4i?=
 =?us-ascii?Q?Y/K5rUj77MHV27KrCSFFIJXBIlQUArmreroT3PK4xh+5KJjsO3OxiayE0VVP?=
 =?us-ascii?Q?dOy8PZN/ebaMs1EWyRbcMEva4SAs/B4KxvpoKLXikU3KRW40mG9LJ0gJieC3?=
 =?us-ascii?Q?PeqsU7catuSc8s6YCHf+4u2D+a6UxhdZKNZ2HDQ8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 722771f9-07e2-440e-a044-08dd4028bf82
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 05:49:51.1826 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fYLp1RcMkMjwqrY4rhKEF9Zkoo5rx4E7OclQ0p+CoJXKaVsF7VTdLngiHTZG3F/2aFuHoNiuXVaCTCzScmeeTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6117
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

HI Jeevan,

> -----Original Message-----
> From: B, Jeevan <jeevan.b@intel.com>
> Sent: Wednesday, January 29, 2025 11:10 AM
> To: Samala, Pranay <pranay.samala@intel.com>; igt-dev@lists.freedesktop.o=
rg
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1 <kunal1.joshi@int=
el.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce =
debug
> loglevel dynamically
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Pranay Samala
> > Sent: Thursday, January 9, 2025 10:37 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1
> > <kunal1.joshi@intel.com>; Lattannavar, Sameer
> > <sameer.lattannavar@intel.com>; Samala, Pranay
> > <pranay.samala@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce
> > debug loglevel dynamically
> >
> > This test is getting incomplete on CI environment because its logging
> > to many logs.
> >
> > So dynamically reducing the debug log level to 10.
> >
> > Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> > ---
> >  tests/intel/kms_dp_linktrain_fallback.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> > b/tests/intel/kms_dp_linktrain_fallback.c
> > index a05e2015f..415005774 100644
> > --- a/tests/intel/kms_dp_linktrain_fallback.c
> > +++ b/tests/intel/kms_dp_linktrain_fallback.c
> > @@ -14,7 +14,7 @@
> >   */
> >
> >  #include <sys/types.h>
> > -
> > +#include "igt_sysfs.h"
> >  #include "igt.h"
> >
> >  /**
> > @@ -391,6 +391,7 @@ igt_main
> >  	data_t data =3D {};
> >
> >  	igt_fixture {
> > +		int dir, current_log_level;
> >  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
> >  						     DRIVER_XE);
> >  		kmstest_set_vt_graphics_mode();
> > @@ -398,6 +399,14 @@ igt_main
> >  		igt_display_require_output(&data.display);
> >  		for_each_pipe(&data.display, data.pipe)
> >  			data.n_pipes++;
> > +		dir =3D igt_sysfs_drm_module_params_open();
> > +		if (dir >=3D 0) {
> > +			current_log_level =3D igt_drm_debug_level_get(dir);
> > +			close(dir);
> > +
> > +			if (current_log_level > 10)
> > +				igt_drm_debug_level_update(10);
> > +		}
> Once we have completed this test we need to restore the log-level else th=
is will
> affect the rest of the grid.

Exit handler is being called in this function igt_drm_debug_level_update,
and it will restore the log level while exiting the test.

Regards,
Pranay
> >  	}
> >
> >  	igt_subtest("dp-fallback") {
> > --
> > 2.34.1

