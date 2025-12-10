Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CC5D3C521
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 03:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ADE210E651;
	Wed, 10 Dec 2025 03:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f15GRQ23";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F8310E651
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 03:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765337833; x=1796873833;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WNLTfKRiN25lIWtcY/G57wuwOcfgqKe9K/AwAdAfOak=;
 b=f15GRQ237zBjwxO2YAYJy8ZGWRqmOFp4zJEKIjvqtDqCZWbIvEkakuZB
 PUkkv6SSrTP0Cp3YhkgtBo950+AKNCwvf0G9mLWSW/cCZvgK5IpGu7ClL
 VFbZ1Men899GfB8y3UlyETmRXLaAvmtfUQHm1C6XOWtiZY1ocBtAUKqAr
 T0eAbZh6FQtfwNrlEpPofhAJXemK04DSHOT0tjp5sqFV17ZqYyROmjAQn
 8z781yMj17tQO/iuDrdMkSqoOLMYque8G0eJ7cYG8rODm1BPz1jtssw0a
 PpaMZa0xKMn1/D1omk7igtOjIFK+vNJpE1AlRJnXTRbOOSIJhsLWcSh/W Q==;
X-CSE-ConnectionGUID: dmVEFDaBSdOOCTBMVOWecA==
X-CSE-MsgGUID: 1r/iTWL0SD+Yq7RnKeMjCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67474789"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="67474789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:37:13 -0800
X-CSE-ConnectionGUID: 7iZrjc2TQCKCzyarULwzPg==
X-CSE-MsgGUID: 05CIV2ZKQMSKx9fEVVdPUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="200563576"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 19:37:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:37:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 19:37:11 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 19:37:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nREi9j7NRXVaEnOpAIGFoGt9zhG4VnMc141V5utPW8fjo1vkt8UivvThlFYPmbGzDFvEAIDTJsQZfelGTrE8tQzOXNSIek6qS/TQtBFi3RAMxkJPVVZlsvKws/tbJUnPsJU/B03BBx6L/px6m3LD+1XAYCWBjKwpxrtOUYWmndxO89yGNHkdMO9BIQ3dhzyne5iWRCG5nqGWwpcl+yfkoxaLKTS9bLPD02Mxy9yuv0o+zaSVp2TX1YSRm4XXuCmN9z87GUaL00zoFAIqNVhYMYLLCAaWNjsCfBoQ9PbbPKaTs3z1/9/4RzOkf3+NWdiHPdhoDz/THvWxZdDiM0wJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fqZh/NRD0eHgjZ1RbK1i14u7v+0SSkGi/rf6REsmbs=;
 b=BWFRDQZH09dJwJFXCgSWfcmsPaq5K4oGIv3CSScuKgf0bIDa5n+Q6yAmT7tFlsnjhpoc9tsWX4ax6QInjs8+DRer8mN604Vlg+vTXqAhDHTdNka1PjAaGInsKqNVMauY9eb4gN2hKf03HyFKZ8WEO1k8wNpggaVE3HWVnDsUOfBsnD5+AHSVQ37ZnfGJOgTRabXB/Yq3rulHJxUQ+5qK9BlqgFRYr5LokT8V/KWnG63YYNA6821aaOZLe4cK0MB1rU95riGwF/YyBmJNJa/E4qeCsU6DN4Vux6F+Ts29ZGuxXBUmb3VnGf5l1KkRczlsgPSw4IcQlBpftAUfavdQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SA1PR11MB8426.namprd11.prod.outlook.com (2603:10b6:806:38d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 03:37:04 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 03:37:04 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 3/4] tests/kms_hdr: Use lib function to paint fb
Thread-Topic: [PATCH i-g-t 3/4] tests/kms_hdr: Use lib function to paint fb
Thread-Index: AQHcaYRl9j+/UmNiSU+VOHzVLJITnbUaOWFA
Date: Wed, 10 Dec 2025 03:37:04 +0000
Message-ID: <DM4PR11MB6312542358007E2421BE1D4C90A0A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251210032349.2781106-1-karthik.b.s@intel.com>
 <20251210032349.2781106-4-karthik.b.s@intel.com>
In-Reply-To: <20251210032349.2781106-4-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SA1PR11MB8426:EE_
x-ms-office365-filtering-correlation-id: 3ae500a1-2c22-42b0-f56d-08de379d633a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+fq2QU6DfCiWnNWnE97NVx1YrYrW3P81G4t3gPbhK5wwqpSWKchtO0ZHuRC0?=
 =?us-ascii?Q?CnAQ8fMQt8XAmvmIGe/D5YlQr7jitUFVJf52WkIsh16MFlHgRSORBdls2fBl?=
 =?us-ascii?Q?g4C/ffbeOMXLKegaavgRZE0nmhXWMNft39rqQk3bHkqhBV3WOkP3w0v0Uo5H?=
 =?us-ascii?Q?mDkSusjyGvT9LTXJT0YA5ZTDJA4DOoFvq3IiUwHBa4PFphtFL8vBmqzvb/Tm?=
 =?us-ascii?Q?N/azT/aGT5GciRCnADivqs5Q353KdyLsIA5cDdI8wYWnCxGkWffy6w/xIncX?=
 =?us-ascii?Q?f5vBselDT9D4ozUifJVcbaYMBkMAkS83uw+ITkApuZjp2gZbC6qDw5KyiB/V?=
 =?us-ascii?Q?CqrYhDfGjeYtOzMiZGAKTxCUs7R2GdV/qxmhq/e9mrUeU23zuSUwEL+RkbLC?=
 =?us-ascii?Q?Ga1w/7wGOSVJ4u7yU0dizA3AOmENmDQSljmx37i1T7B5uRfd+ZhJy9CBZ4E9?=
 =?us-ascii?Q?BLSQinxCeNx+Xb9RQnoJIKjk2GEolgfHrXKCl1smAqSUw3W8T+W/SyASZDA3?=
 =?us-ascii?Q?jooabxwBcB6n6D5bq4rgzGLY/DSSLVRyHoLdw/GTb8rLLf1CIzUh+6jGOEYo?=
 =?us-ascii?Q?AJ+5ew7XIlsvGGbKgnjrPRIvy7iYSIDukwpzD6bRGJfGbswvzLNCA6Rn2Vsb?=
 =?us-ascii?Q?LsX9B3G01oKYKxVTGZTjAF2/qsxdnyND1FYPjk8ux6ApYfyFCWIPkAHHVFLw?=
 =?us-ascii?Q?jlC4DJomDQb1NamckqOcVYtACT45IyFs0vHnuRX7iO5c/ygoPF9GZFiLf72d?=
 =?us-ascii?Q?d2U0eM5yLDO6u/acbfQ2+8pi+p9JpIrpnPwKjH420ThPG28JSg0VeJa8bJsK?=
 =?us-ascii?Q?UxnBar2Q7Hn2nRob4bQPG554XgURc66IwPWJXGdRHjefss2FRiNk2WJeOfQK?=
 =?us-ascii?Q?QdppyUR32u5tztXIOXIVZcKBXUjzFKSgfbiK/Xaq0Y+xn8HsuDvU0C/tRYqj?=
 =?us-ascii?Q?5WBIyqUdEQ4EJI8ueHGZFP1lREzwBqo9g4cAyyjf/iUZL7Xb4DopH8YCOpj7?=
 =?us-ascii?Q?q9baFLyHfrGTRsn1gYW1Ih4Mnx1H+4tatCLXiYCk6udf+FEz0JqXzL7KfM0U?=
 =?us-ascii?Q?MwijyQys+RdASX6OqevPKrmpwuJBWujPtzCJapVkfZSSKZkVpqR0+jdE2U5q?=
 =?us-ascii?Q?iYpr3/uqGVtQOOHgLqi94TSNV3IdSGFCz9W+dPWPFTltPgj+D+Jlo1Ozgtz2?=
 =?us-ascii?Q?Qvsk0Tw0/HWMZvnxZg1rfTnHZJor2kfO3BRCfxJB3s/xOYSCqokvkou3Ot77?=
 =?us-ascii?Q?ZWwIyiQDWV8h8tifvQdojNph1KmI4AsuBRdQCAa8yuE1jhK15LadWO2BRUlz?=
 =?us-ascii?Q?I0oy5mbd/NO5qSHaUxRMhh6mWha05T/DrsyeGCKaBiQOR5AAmnQdQyQGF+iB?=
 =?us-ascii?Q?N9Byb2wCEU00M4LsdyXw5BBgysnQEUAbxDPH62YKgzsoqHrSuYPLbkZ5mGhs?=
 =?us-ascii?Q?bJ1U8H6AEOl3dcN6ZvnOvRL7IYLnTMwUXyz7Zu2yjMi1i8V+51csq1RDAfD/?=
 =?us-ascii?Q?cRSBZGz+9LucU29nJ1HYeqC8J1RHL5foWUHC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H80mKXRRhrL6PZ8mXvZlmTVNjNQi+gaDfIl7/nQI6z636KV7KTBtWf91U5Cl?=
 =?us-ascii?Q?XEJmqofWcTs+N4XTm4FCkGPwoVPtRU4x8Pd1G7aeLYsiiLP4c3/pPichAWQ1?=
 =?us-ascii?Q?Jo9TFtRCAyQjp5pZF7qx750ZCq4ijNOQRml2d14RBgycDomXgUnJPQROOCEI?=
 =?us-ascii?Q?S1X7FG9SgjeJw+Fezfa5WQNUq1ptCW7zTOF6zL0XD4guTptPUsivMU3QPAuw?=
 =?us-ascii?Q?5lkUfUcYBBLBp9KIQ2QD1iDjfPuzWQWbd3h3xryL/+5F2QxmtXbYgn+wdQgk?=
 =?us-ascii?Q?nezDCo+olJAcIPxB+RYWSkLzEyaKZ9ACOSHBK9dxhZ+2pppJngcG7nI7lNXZ?=
 =?us-ascii?Q?+uWYc7Tc2l6NCjqPDq50ajVBt9pvlMoTboOMTpdtVi+3HeQvZ1kAFwwJ5mPZ?=
 =?us-ascii?Q?RR1mY4YBdbHBXb1+SPiJh3zgypWbSvDaWcXbxK/hNzz0bWAMDzK01N4CaVqf?=
 =?us-ascii?Q?fdaR0kjE6ZAtkch/YrgCeraHF0k6KvGEaPYdDyAKPeYznJJYYGvDMW1RdWEP?=
 =?us-ascii?Q?wzz5Uni5sLJfuUPCxmJWOVzQIVWn8i0kA1QoN1LJmR56vqXInUm4KmGX3ZA+?=
 =?us-ascii?Q?bFtonQqOFstc3FX87EI8Kpp/aZvU+Y/YF5fLyDrdU2s9dmvih3LyeQNPPPnd?=
 =?us-ascii?Q?nONTcRH7PbqreQ9zXOm8miccGicNJe7/KkRFquedZH6uz7y7IRPTcf7XaPF0?=
 =?us-ascii?Q?9aiwDHdkJuXxnuMqf2t8CBneRzevb+fnya93fhwpsgDm+Bf2293UMcxhjqzm?=
 =?us-ascii?Q?pGc+9qmdj8dfPK+HzpwRnykQ1oLslihlFuHvGb0hopanBsclAPhhv0LeRyvp?=
 =?us-ascii?Q?HWPrXXtWYKtSi6wRKIhjVNvTJjPJec23B1Bo7TUPCjp4NS5XIwaIqHMeuGBr?=
 =?us-ascii?Q?CTq3UqxeASw3U4VT6MTiU4sN0tEIboBlcGAiUhANMS4nlTy3cNHObf0VKxP7?=
 =?us-ascii?Q?kQFy35JikFduonHEyUIAFOvYDS4Gay4HNf1ZRNDPWM54S+XNzoWvGucLuKC/?=
 =?us-ascii?Q?nFFpgjA6UlfZXl1zAksVGsdzsA62fEnnuZTVfQcM5GnjPRxGOXNBlyhHgHj1?=
 =?us-ascii?Q?Pxx6cRTF8mKH7uAiXO86zesvqR5RuOs7MW3XTu7DkzW+cCLp5WLLEWskx64F?=
 =?us-ascii?Q?JbgVYxiFXuAYCYVrsGTxmvsk24IRhT5/3BY6jeTU2YveAI+VDT4jQBzchYDq?=
 =?us-ascii?Q?c/Kf8e0DrU7gFQdACYcCRcYr8gOwlOZOJrdL6tCkAw+W28cVy8QQ3C2ezy87?=
 =?us-ascii?Q?yYDp4gF/mTIIJT3XIsbnU0x41NyQdCNoSP8kGHNTa6fwa1Xqi7+HqSsDyEGQ?=
 =?us-ascii?Q?27lQjw9BxgtDcsmnQNsi2d2CH5zh1pTQ4U60UezqvrT4iZz8IyN7sda4PMw7?=
 =?us-ascii?Q?EgyJYUoPNj60CN0Dx0yRDg3a5giN67HQe6YSVU/Klcv06h6hnglxi62IyYcu?=
 =?us-ascii?Q?6FZ45Yde8UCsN+pgYZq3rGQDiLIJOOpy7Rm+wf/rZRozuD05Fj3SgUDag14z?=
 =?us-ascii?Q?xJi1ZullJFFKAB6FFN4LkbD3xfqyNnqfY4dZsX39RbrEAsxPFxcDipuxhxJi?=
 =?us-ascii?Q?5X6KoYX4RB/xn/wxMFE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ae500a1-2c22-42b0-f56d-08de379d633a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 03:37:04.6798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtJU9YHore0+z1VDXOYAG4XeFCkekKg6e3wDBZCgqk2f0cfQQIk6yX9KgiT3Izl2zsXrNaB2ULyPtoztOBCV5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8426
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthi=
k B
> S
> Sent: Wednesday, December 10, 2025 8:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 3/4] tests/kms_hdr: Use lib function to paint fb
>=20
> Use the lib function igt_paint_test_pattern_color_fb to paint the fb inst=
ead of
> doing it locally in the test binary.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_hdr.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
>=20
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index ab0ec47cb..a5912501a
> 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -146,12 +146,7 @@ static void test_cycle_flags(data_t *data, uint32_t
> test_flags)
>  /* Fills the FB with a test HDR pattern. */  static void
> draw_hdr_pattern(igt_fb_t *fb)  {
> -	cairo_t *cr =3D igt_get_cairo_ctx(fb->fd, fb);
> -
> -	igt_paint_color(cr, 0, 0, fb->width, fb->height, 1.0, 1.0, 1.0);
> -	igt_paint_test_pattern(cr, fb->width, fb->height);
> -
> -	igt_put_cairo_ctx(cr);
> +	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
>  }
>=20
>  /* Converts a double to 861-G spec FP format. */
> --
> 2.43.0

