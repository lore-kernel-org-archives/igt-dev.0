Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1CBF606A325
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 15:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BkHbUL6A;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cExdQZZ7
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6588310E541;
	Wed, 18 Nov 2026 15:55:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC4510E541
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 15:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795016990; x=1826552990;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sLuNfFAi+ElSfVA8R9e9A3zS8Qse/jT/cZQjd4lTMvs=;
 b=BkHbUL6ArrG25V5AqnAgiCuU9xJGrijRHSIgdJHKgqWMpnBRfH0eopZ4
 3ols60pz/OuVCZYK4oL2z1PjssBa8uNzu2GsCeZdk9azC8r5IcTZwbK6W
 J9XrY08Gef342ozyZi9dJ/jMKZQzkalcT8pDJAu9mPxclQLQbcdK768g1
 Bv+aBpsr89dG8Q2l4//r7DwpWsXANzfi9WYg//rRV3gyPoDdMxqx14ZCR
 AbPB0tCXX4Cq6oG/YKZRLFDMEICDSISC2sjapzQ12icuFTcrM0c776yDb
 V5gMBAPtjfLqMRloUwDaqKN1FubO4agYVo2ooSXv3cwyikd0A0sCdY2/E Q==;
X-CSE-ConnectionGUID: yXpNubonR76zmPvTvVhXCA==
X-CSE-MsgGUID: 2MrjTLhETRquRitXXLYczQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3724533"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3724533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:49:50 -0800
X-CSE-ConnectionGUID: KLWBHZxKQR27nR3zpnz3Xg==
X-CSE-MsgGUID: IlnGb5K4Tty5GprPIpFreg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10570665"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 07:49:49 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:49:49 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 18 Nov 2026 07:49:49 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 18 Nov 2026 07:49:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCfFlKlGea/i6svZ9Z94BnMb+1FCOawwhDnKFnyhScASknEQzA1oXj00V9B0uBzA5wXvcCUTlI8L8J35gXEAqflN/K2r0IG+eRK16dk3GdjZepnxeosrR0DR/OyApQgHzInd08UEc4RveMuwpp848BnwvXt9Hc516cADUa1w6jhFPpZ1SEWBioxpdMO2MnsofKy7mk1bplDJ5WDIZ5y81a7n3nvXadALQN+RNMNI4S77qh1co18nUrc604LWwSsL8rmWm2z/Hm/Exw/UkrNYp5zaMhVTjGtmMCqdRLhjsUBEc+TCL3+NEgeqt4wFhbk28Kv/dKujzr2zsbkxnB83AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POD69YKG/QOjZQnfy2lnsekJOkJOue7LevXyKqHer1o=;
 b=rwfLv2SZ5hx147UpEtseP0mzWy3Kwddbs3ijtgXdOIzMIxvougd5y1dSYuaJDvZwv8bGid8PAlHNcuhDN3KahUuLNZG/YwTPjKNW+qLeq/zuMTQf60/O8WfnQXCTZpPNrvwBOu4RTymh32EWDpT7GPMxly3AId/TWnvSQdVx9BaXWqbhMVk/dsR6AZZ3gxJsca9hvZ+EHT/7SeLgVxfRmfxMi1cMc6DVW+nVM2fRdrpi/Kk8AvRxbS/Ngl9SZTfcQ3aj4n67RSdGepPnFGbzuWJ1yOVIxufOhsAAEIwEKv2+iVjqE2ozGT2CNn/AVUnTadgWpp4Fky/SkDLslJDLfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=POD69YKG/QOjZQnfy2lnsekJOkJOue7LevXyKqHer1o=;
 b=cExdQZZ7uaDCZ3lGM+CIezOcxI5pcHFlSbMPchrKPCpQD26CTq1P636f9GKeBu+Nqg4vjGGJl4Xw6mZyxD1lMPKxJi2crxGGhPH3Q7e8srPPZe9JX1pWQszH1csBWi7Lu/HwcV3Ik581N2pFVH0uPG/KaPk6XYTEBm4oCifGY/A=
Received: from SN6PR11MB3293.namprd11.prod.outlook.com (2603:10b6:805:be::11)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:49:41 +0000
Received: from SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::6eaf:49d7:7bb1:2793]) by SN6PR11MB3293.namprd11.prod.outlook.com
 ([fe80::6eaf:49d7:7bb1:2793%4]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:49:41 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Nautiyal,
 Ankit K" <ankit.k.nautiyal@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/kms_setmode: Fix previous crtc mode
 lookup in joiner check
Thread-Topic: [PATCH i-g-t 1/2] tests/kms_setmode: Fix previous crtc mode
 lookup in joiner check
Thread-Index: AQHddawpUy0Wi5jRxk+Zqx9DyB5fx7cz/UQQ
Date: Wed, 18 Nov 2026 15:49:41 +0000
Message-ID: <SN6PR11MB32933DCD3950399F76544A57907A2@SN6PR11MB3293.namprd11.prod.outlook.com>
References: <20261116091832.1312335-1-karthik.b.s@intel.com>
In-Reply-To: <20261116091832.1312335-1-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR11MB3293:EE_|DM6PR11MB4625:EE_
x-ms-office365-filtering-correlation-id: d953c9d0-3b20-4b8d-eab0-08df458b8f0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|261021123027099003|38070700021|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261022105027099003|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
x-microsoft-antispam-message-info: wCf6yIWvK+cQOiuyEFVAh9JRIe2Qjz2e8cN2w2MJ3gfEA/Ck35Q9Yr66bj1w/5pab/UxaV016jUVrtHnhNB9U4UFbiJClahRQmXDmGojs5zYeMR+lkHuEj5WbL05SExV2QVKlBNACSwdChLBDxNX7JlrPI2EurONvYr09on24oxFxY83rfqxL9Yoi4GPoDvO4WKjFhS0d+aID/p+7+x9eHgh2zJ6gAiNTBqvHX5hauG8xMRfHt0p42J7mUpG1m0J2FAO696at347wRZwUVzMWA0NaZQYrcFwl7inhWDNTGkqqwieDwUGeuv/TDtlX34UaAR32tDFFb1jGI55uDYXFhNcpxCGalO05lGsrOkyADeEylvgTzdwMefrB6kBpVerOWCUFhT02k3NX5EfNnmv0DWqpGbO+YZFlmIsSQjXZJMnuUl2dIClaVwilI2i+f/jLoB7pNmH/xL+jzAdb2xdVY/rxsdR1UqUX2uiaGaVcmA9q75mDFuvoyG8H8ILNvm6j+Bm+nSgjDrjIVORI7BKGhc8FLEkPiDkP5e9I0KBXOBjrqhm+7UCFmZOadHFVET4960b/nFyFMZUtDSaev7/o2kZZkwjhnTA3yGA+0GZkiHOpVa8NINPCGDHCiVkC2vRvKeI7EvFNmJJlS7L3BaXoBwdE8VNLpNIMcZ72vn8y1ft0jqqvUnCOtj2USNFEjmaMJmxUDJUyegbI+7/E7TUMM+E5llhZzkB+jMEbpEMpeY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3293.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(261021123027099003)(38070700021)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261022105027099003)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2Lqd+iN4EM8UM16q/IT6U/kI/J+xxUeUD05IRLsoX+lBDqppCQWQynilDJ2G?=
 =?us-ascii?Q?AM27t3ylkxTDG1jsUepTtV/R0jw+qW01L/lLWVK6VZUCylM1e9sSDMlFL67L?=
 =?us-ascii?Q?HOLFh9wlqSY9vuT3XIMB8RKut3zD5bWnYtR5pkc8GOLZiRk/SgOCmiaN8FPt?=
 =?us-ascii?Q?f5nTdDJJL+/fB3pVH6m2SN4Ht2TGheQ4NshDj4iIuLA9uqToKAyOqo77eHAw?=
 =?us-ascii?Q?Nx2OnqZ4bnUvOpNG3aDamz4WhuCfRJ+q9tgaLAgCYFIpJWcXICV52r+iC3/T?=
 =?us-ascii?Q?bnEVU4YgztgrcSn+qzKyB7Q2qW3qCycS+c9q3cB7+u/gxVyGeQCmnjfODjPK?=
 =?us-ascii?Q?Ze3Dx1X9veRcudCK0PUaGfVsJcX8Y1lzPdtegFcC6OvTdkCXhKOxIvs+biGZ?=
 =?us-ascii?Q?0GNs8rkooi7VnkKJGbeKq+wRx73roHJ3yRNh4z9b24BRlomu1hoeO5eiRJl3?=
 =?us-ascii?Q?MDgZbos3LkIX6gbO9BW7sTMNSIjjdEBeeibpNBY511jTLQp7cPmsdakRDOuW?=
 =?us-ascii?Q?SR4HWmk3DZEMQBR2XMMQPN5jqZEEWz07JEGi3uSYg/trt5I4Xy0MGlFWJAo8?=
 =?us-ascii?Q?uJrktaS6sclKESFvlz+BZNkqdOz640uffcy8EgsycITiLC2/vKvyTkDZkXns?=
 =?us-ascii?Q?jWwZLU5LnqgJ1+1gukh62Azcap+0kxaamYOQLMDgDIJe6gfd5Ne/YsTDJYOM?=
 =?us-ascii?Q?hMlrR9xAhnunSuazKNt7cW3WY1WXFSBhe3VaA/XYvToHAXM8QPMC+dCcF0PI?=
 =?us-ascii?Q?/GLlDps1KXdy0HMkce0svjcCbGIFkdxV00DANNNhxXtO1HFbBi17QbdEERED?=
 =?us-ascii?Q?0Ei3LyP+kNe9PBX3Y11B+4kSCyvuuqR1cLv31pzifWMeOfOwM2HN/drBg4wH?=
 =?us-ascii?Q?yqNuevSgR06sJ8YaBAPn1uAp74fnMh003PFRm5TqCuEAokf9WXkKVpnCHjsi?=
 =?us-ascii?Q?/J0e44K84QPzk9n3xZYA6FrYQpbMN73GKe1EEvgj1pNnia2SpdZ9mK3q6dJ0?=
 =?us-ascii?Q?9wxGMG+xPm7FwwqhR+vHUWZGkgiIH/GyM9YT6NGI/fKnjVjk8rGbsAHzr8Lp?=
 =?us-ascii?Q?wW4yovyeGhtXrUpnNKNWHfsRLtPxbqJC+Of7/JRxQ2EeJMyDRPTeXDlxBTqf?=
 =?us-ascii?Q?CIdxkUZh9I4DH4fhD6/qIsZ9AdQ3gq8HEVmpusbjHkyEGU9NZS5A2rbRFoZ5?=
 =?us-ascii?Q?qbXoVmNtk9sHsBeI6LNE/c77EE65PLVY/NN+ziYqcFzQb2YFYNbJTM+KIIZM?=
 =?us-ascii?Q?dlvIcuLpZIvrysVQEoFCrN1VxDr4h656CTe3sLrPPyiPR9ZybbnO0xGr/M+9?=
 =?us-ascii?Q?p/tt79jFYQbtjcIgFngnPUMLFuDMbQZet2o4j1DSkDljAU6oAfmnTmMGS+Sr?=
 =?us-ascii?Q?zMDrwM/PnI2n/M1hrwCs+7tc5MWuf9BmfhkCnFwvT4vVQ7fk/vHv6y95B+/W?=
 =?us-ascii?Q?gTBgWawjuUbmbWI/xQLFtD4vf9J0jmXZuVZ4d0ywcXYP+VSF7QJB8r2+Pj/z?=
 =?us-ascii?Q?871sENzrS49dDxSz0x5RtQty1AJGseGX/Y0+8yXbAqrTkwpQvPduNKC6wD86?=
 =?us-ascii?Q?zx7DGMiD73TsHmlAR/UCMPxRtO/pH1tnIDhggjbTU5UP2bMo7zsTxz0ZMu3P?=
 =?us-ascii?Q?9/99slSrrfrilJEetzzOXBGIOSYJJ5LNsVhheSCCzLEmyWW7d7MFD1M7Sztw?=
 =?us-ascii?Q?6FFvqm5gtPbxe+gLJbrqxyl1nBH8MBKRu+CsFWl5wfipFy3o?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: HvVULe9XSWwaMNdCNZahQbyhqhE/kEAacjuGCCr701DVr7UhFyJl5wVuWDrAoocOQaGCFAQf3XMGmGL107xNP3ta04sZiETCj1lblf8pOZZjejPrySVvwkk2tZQxYceu5/znhNOhKRtHbWjd6oCxfLl3XfKzXLI2LH7UyXDEl3lD6KDboQ7x1nuL3QFtt2A0gUvGKMf0lGQIfcIaPH/VjSb44RTZlu9RMNWoqwb4lUcL0p9BaivN2VFtsLGESc8t/+Mj9MmFMtIjffvS3F8f4HaRBHNjcAH01XOFL1oLrsqkTMSIWAMW9p9hDmKy43LKJxZsAvsWvPV8kN7Qt5lbVg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3293.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d953c9d0-3b20-4b8d-eab0-08df458b8f0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2026 15:49:41.2052 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYUz7DAN6nRZ1fMfiTfA8BSSrmNu79vare0F9lKfER1/nWr0LLSOKD04tQI4s1yLbKo6CCgXhYazSt9ff6sjVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Monday, November 16, 2026 2:49 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Nautiyal,
> Ankit K <ankit.k.nautiyal@intel.com>; B S, Karthik <karthik.b.s@intel.com=
>
> Subject: [PATCH i-g-t 1/2] tests/kms_setmode: Fix previous crtc mode look=
up
> in joiner check
>=20
> crtc points to crtcs[i], so crtc[i - 1] is crtcs[2 * i - 1] rather than t=
he previous
> crtc. For i > 1 the joiner check looks at the wrong mode, or past the con=
figured
> crtcs, when deciding whether the previous crtc needs a consecutive pipe.
>=20
> Use crtcs[i - 1] as is already done for the crtc index and connector of t=
he
> previous crtc.
>=20
> Fixes: df584c804e3a ("tests/kms_setmode: Fix the corner case in handling =
5k+
> modes")
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_setmode.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> a65ea8b23..702261581 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -817,7 +817,7 @@ static void test_one_combination(const struct
> test_config *tconf,
>  			     ((crtc->crtc_idx >=3D (tconf->resources->count_crtcs -
> 1)) ||
>  			      ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx -
> crtc->crtc_idx) <=3D 1)))) ||
>  			    ((i > 0) && (igt_check_force_joiner_status(drm_fd,
> prev_conn_name) ||
> -					 igt_bigjoiner_possible(drm_fd,
> &crtc[i - 1].mode, max_dotclock)) &&
> +					 igt_bigjoiner_possible(drm_fd,
> &crtcs[i - 1].mode, max_dotclock))
> +&&
>  			     (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <=3D 1))) {
>  				igt_info("Combo: %s is not possible with
> selected mode(s).\n", test_name);
>  				goto out;
> --
> 2.43.0

