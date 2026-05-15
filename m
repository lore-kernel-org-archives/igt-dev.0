Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44648CD4F3C
	for <igt-dev@archiver.kernel.org>; Fri, 15 May 2026 05:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CB710F3D8;
	Fri, 15 May 2026 05:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nnxUkQKK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F47010F3D9
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2026 05:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778822865; x=1810358865;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0ViRatWf8GQZM6AaY1STYtjWtjiLXsWDGP6GapmcQKs=;
 b=nnxUkQKKsMy+e2uYBnWXFhXvU9JmTnKgwrlmZMtBuxvgh5ANDtkVUzyR
 JyP8wTfFjwfGZrTv0mzkQc70Vl52OBcGerh5Ai8bZ+oP8PpC76bDOk5ee
 M3Nwd7F2IuIuhKeo5fHGWqa8GFRXs6FsC+ZntEmZb9dZZezd/OTbyxTFc
 rrMOEGsRrCFAzYErE15EZsbTzn6XHyWXAfMH1GRLTl/vEabE09X3THWrF
 ysFJ99nXalA0jN8Qsz0Xdp2NPuyQv4954GGBSlwsOsZ8w5+QXOTyqpwHG
 aOrUmpAXY7DXBBGMZiNsLstgms7uR9ombAhvoCqyrK0onbighSXFrg+/8 g==;
X-CSE-ConnectionGUID: 8N2yfCv3SxWybUjuxOgcAQ==
X-CSE-MsgGUID: iO2kn/vjTuWAK+PZLgI84g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79734225"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="79734225"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 22:27:44 -0700
X-CSE-ConnectionGUID: ul33Dg2qTpCZ8Ze30FR+hw==
X-CSE-MsgGUID: i0zIR1VeSFOHr43gosSzbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; d="scan'208";a="238479236"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2026 22:27:43 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:27:42 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 22:27:42 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 22:27:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gT33q7sL8sYtHHvU6b8jHrkZP5dMCPQITW40yJDN7t0EPlbfgfqFwFBOsSKUejXDl/7U+Eq3w4mTwkfay0APBaWE7Zrcc2UhRcgXNR3ZkXv4jd0xijYqAVfJZYKFeBc/0CkuX1k8nBu7w7YNAF5QLVdyTZ0EgENoaznSmhFoT/IQqNVsc7lREz+Guc87IQHwktb4kaLVkXCmmjfVJAT0nUUy99mxAjhniPoXvY3D2wpnl05WVVF+OZXCzcVKIYjSypDASVZi3hMmXW4Z6fmhKcaqXIJlFY7lcZiheskZ7/2RmOLG0Cz1swbSoQa4jWdFeja4BuRt2AceZ4OvG+V1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps+rp+AlCMZrapAUYPFkjCg5QAUc1tcgErMuEHzptnc=;
 b=chpTKUTX+IFYR+i9Z/LSE2pmUGbPEsfjhUu+nhU/4QcIVeky4VNHACDuc6jiTV4mBKxvHEiTvsJ6vsLmnLx3XrQilpc6F+8fqAhNDnFgagZDwK+YFA82gI/TvPPq8CAyzuIhJSnnwq37NBMQ0vt/jDYLdUBrde3IFK5DxfaXyTQwLM8JmtjYojaOgCPvN/WqZc0eJfoJWpX/JaW+1Tdoe+9/CaRCXOTNyLmt75EetJTJzwUag5SNljUvET7IoQhxyrkHvuQ3KhKO2o2qChVlGNo3GBlKgZjJy8nMH0uU48JXxvwM8l93mqAVQDUcG0zlyW8q6aB+tTSnGdhCGkGBLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DM4PR11MB6429.namprd11.prod.outlook.com
 (2603:10b6:8:b5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 05:27:32 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::308:3508:f7cd:9717%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 05:27:32 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "jason-jh.lin@mediatek.com" <jason-jh.lin@mediatek.com>, "B S, Karthik"
 <karthik.b.s@intel.com>, "fshao@chromium.org" <fshao@chromium.org>, "Navare,
 Manasi" <navaremanasi@google.com>
Subject: RE: [PATCH i-g-t v1 3/3] Revert "tests/kms_content_protection: Add
 per-CRTC framebuffer infrastructure"
Thread-Topic: [PATCH i-g-t v1 3/3] Revert "tests/kms_content_protection: Add
 per-CRTC framebuffer infrastructure"
Thread-Index: AQHc44XYlSgxlC+9/EqqSz8cot7z9rYOj/IQ
Date: Fri, 15 May 2026 05:27:32 +0000
Message-ID: <DM3PPF208195D8D0FC51E025ED11D9D4FD4E3042@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260514093510.688396-1-santhosh.reddy.guddati@intel.com>
 <20260514093510.688396-4-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260514093510.688396-4-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DM4PR11MB6429:EE_
x-ms-office365-filtering-correlation-id: 5a92adf1-85e2-4cf3-65cd-08deb242aa0f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|4143699003|38070700021|18002099003|3023799003|11063799003|22082099003|56012099003;
x-microsoft-antispam-message-info: uQpFFZ/9ofRfgCxeo6EY4lXMklzur7ga/uEaL27OblOKh/PuiCwzBUopvRra3oq77ozwRDSXI4Rx+j6vXeBVf7H5f/0ESsrkyiA5quGqZNdR8gIxFehlEvpSW6T+SnI3ny9icMNbFCY6OEHJYmz/d4gtltlOx5d2EKKhmPsJw7TUT2746hswYgCX3eNUayWo/OD7vXTvavbY3rTfUA7F1JoeA6qT1Q6Ae8olXMmKJJ5qogs68BJyBA51dCKn7l6QlJHVnjD9mO1TnmFf5YJFZ3iGZMcyIQMDn45g2rGSWPvX0zpsxjxH4l+E2+POIoixJgGfK8L7wFjnrNanjxXsOnOAKVLI9/R5W5Xc3cFMY73S2/K55jqANMHvJP8At3YDBYrJS573uPEbB6xj1W3qsz1u5deXQfZtCI1phlL8+hSyEidMqSw3mpO/pGh8QrrdK/7rHr2Q4Hxeha78D9bPzAOMZepB7M0PYvf6crw9NM/xa/xvVgXyqHoDyOAJEV3S0iDn6q2LT4fEULS24oKoOPhTKnhimnAaIvwXMQn89+Gj4ayA1p+1DWq6a2Z26EozJWMqnpwvzpIkksqmMuLk3gDjsv1Kq7xjojV4h5xcAX6MXcv8KEZ4QavcZyYybLiw/Oi9XywGeR8g6kwFMbzS4nNKn/oi7FLuO/S5aehRCnU16qadKI0YU7UxfvvVDZCElsSKKYHzPrdyZiEqrDPNCF3I5NTa5CzsWjI86BGj0s0e8YRY6PRgZOZmTtAtliCR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(4143699003)(38070700021)(18002099003)(3023799003)(11063799003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x4i+H4V4OOs9FXYWdW9W6mULtpDMmMkQM8eCWDZsyQtw4s+yjv/MpYKaDAX4?=
 =?us-ascii?Q?/bTsrbfdMkhpp2X9Ij5aNHtLOZ3IN2NLcKHLkpj4f9giFP4G3onemYwUQXQu?=
 =?us-ascii?Q?QHqiJ8w6uDtPBUgA+12daQ9lVIN21kBQJB15GLdqU/DekmWv0iPlaXibfwRs?=
 =?us-ascii?Q?cXtJfS6ApymCPGKoOmU3N0coKYSy9ie7O1SBfHtF1ZETQfDIdNcJ8BGP+aM1?=
 =?us-ascii?Q?9sDCHO3wc154YzAyV8NVeeRzTZuaIv+ZEl9wrozv/ayZOIksGSgaSk/+zOtJ?=
 =?us-ascii?Q?+Se2r5HzGL97f1um8nRwhaeb3D4Jro5Vru9oOvYkLBPY0ygrW8+ueeurNG88?=
 =?us-ascii?Q?Blp6hZuD3XypMGCjsq4PvQInzqPDeery9e2VeqYh62NskYkNhjUTyReHioj+?=
 =?us-ascii?Q?/7pAngMex8sIR8IqU9cvV50pnNvVj5gHWlChZCmsOu99neJz1AWaHFBTUwEy?=
 =?us-ascii?Q?a8VAT6ZLiIm84esKjw0OYmsHD8oCvq6f4VXbAUoW64IWbjQ5fVge2MyLwz9U?=
 =?us-ascii?Q?P5vCOrVce6CCRwI205NzlyCzQabT2NJD6vFs2pMJa41Oa7YgXMLq0nmVXn52?=
 =?us-ascii?Q?4eGyBqv+Dp/H4Sn6pM3OJDx+DPri7kutsCjdL4G1kDrERv0zP3ReL02jLOAm?=
 =?us-ascii?Q?kMxe+mVA4J3OUuNk7yrNbJ3AiX5IZTAPh4l73bXRsG+lsc5AtzAJfAElpWrw?=
 =?us-ascii?Q?gy9uOR9jd56IQWsLkrn8mKHWNVNXO1QFKSGtFatwczAksV2akikl551SnT5U?=
 =?us-ascii?Q?fG3yX4HIzEH++kmVtgsjco0k3c/C8d1W8z3SFq3uY4pFsdtEVmqSaBjt0al8?=
 =?us-ascii?Q?Y5qZfJ5JyTzAzlCxibb3a+/KyDLy8egpB9RzGFq7xtRpTDM2sWbqRbwHyowx?=
 =?us-ascii?Q?qgAIAt0SMUNDO2jP/kJc+lINrMcWDmXNgBqn9ooZbHDlPoAby4uLYmysdyFW?=
 =?us-ascii?Q?Gy8BiM644RaIU6BcrZzS6vBT7TjcTH0epfJ5xBK47+ZbqdDXLwZzNK7wdHQP?=
 =?us-ascii?Q?0KttEH43Y+GGGBjg1OsKBW/3rtVXZwoONkRvViDbJM4kwR7gEKWE1IHBLJIw?=
 =?us-ascii?Q?CfnYK+KUlUzcvl0yZow4L/MYaL8QXcFRZPzTKpyJyYmEECiDu44lFNz6vEH7?=
 =?us-ascii?Q?PVRisrUaA6/xjkxC6BrL/ifpafLqtBdwnGbw9/lRWIboBjI2tFthbckPNXuK?=
 =?us-ascii?Q?eVXXtHAXf3Jpl/vxTz0Fcy+hEBjiPDJ7r0eZoURER+FXsnWF+ucjuyPgWMa9?=
 =?us-ascii?Q?8MKOV+k7wfC7kTa9/6h6uC1aMr6ZU1Dyo2UiMhuBYghuyEHZofCyQKY4iQab?=
 =?us-ascii?Q?ZI6AQFdv8KDPXj26emPYgHB/F7SaAjKMx+SNTlUDErgqVNXI1O0xjE2jdkL2?=
 =?us-ascii?Q?fzmoM7dqZaDGZlWVp0jLnx4VMHfTH86blc28rXXIgWoTS6F+FlH+JmFziKzj?=
 =?us-ascii?Q?G5FSsI2+yBVthw3ZPw5DzI0gDBM29WUfS3VVx/+/zNpnZI+YDiaaH88U9tlD?=
 =?us-ascii?Q?YyI1pbsfmiTY+2o3zGCT9imquvik2Kf5/vJH2939ZAivbhnh4FMDDYoM+P+t?=
 =?us-ascii?Q?k1zzTWYxGehXu9gezJnUdoJByIE7DcYTo5RZP/7hPzMie8IuN5tI85pPbUFH?=
 =?us-ascii?Q?TK/mylQrwrm1hQMsZG2531vlouQur4AKnWVGUgnSeI4FtwCY7ILIQNL+eTeK?=
 =?us-ascii?Q?aqUqaxZccp33iSQzFU3m9cyDXpNZS11rFz804+mFQ1kcVhVqXwDlVj9rXSaS?=
 =?us-ascii?Q?wKXyvwb9Ew=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: bjT6L68/HrLrTaTy5LsQkbi4GwQeWVvDSCLNF7u3pl0YNIQsT1tKlAj3hXTf/ZKISBg1pU3iZnx926+laYEYPwjEmkFwjTqw1v+WGdlFIXzIvR9qafPZLV+FKuMEahuPxNTXY27tmziu/2eBThzr2mUgH+g8sbhWh7nKAY+oAFz6I52tqh/qw9HBD37GzVedh96Pkxiu+/DaKf0gz4czGp2ZHekXc+fSJslhjzw7kFwRQUi3n6YAKU56iFL3I1+EH0DdRXNS3DKTvgEcmwYIJtLqm1Wa74yl25IsOoF0u/GWABnbSZPgfsU6hHXzaGPq9pU+ntxgGKe74GcP0dXZ4w==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a92adf1-85e2-4cf3-65cd-08deb242aa0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2026 05:27:32.3289 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 51Di+AWiYZbFMotukbkwgqvOJeBKJqK8rb+4TOaI/tBiYCfhJxcGvOPz8ZHxWy71Xs7fn6nmK/PUNUR7y9bzqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6429
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

> Subject: [PATCH i-g-t v1 3/3] Revert "tests/kms_content_protection: Add p=
er-
> CRTC framebuffer infrastructure"
>=20
> This reverts commit 925b14d430a42386e5d33a4be36ef84161ec9b80.
>=20
> cc: Jason-JH Lin <jason-jh.lin@mediatek.com>
> cc: Fei Shao <fshao@chromium.org>
> cc: Manasi Navare <navaremanasi@google.com>
> cc: Suraj Kandpal <suraj.kandpal@intel.com>
> cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  tests/kms_content_protection.c | 50 +++++++++-------------------------
>  1 file changed, 13 insertions(+), 37 deletions(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 47ccf61d7..c59441f11 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -107,15 +107,10 @@
>=20
>  IGT_TEST_DESCRIPTION("Test content protection (HDCP)");
>=20
> -struct hdcp_test_fbs {
> -	struct igt_fb red;
> -	struct igt_fb green;
> -};
> -
>  struct data {
>  	int drm_fd;
>  	igt_display_t display;
> -	struct hdcp_test_fbs fbs[IGT_MAX_PIPES];
> +	struct igt_fb red, green;
>  	unsigned int cp_tests;
>  	struct udev_monitor *uevent_monitor;
>  	bool is_force_hdcp14;
> @@ -996,49 +991,31 @@ static void test_content_protection_cleanup(void)
>  		igt_info("CP Prop being UNDESIRED on %s\n", output->name);
>  		test_cp_disable(output, display->is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>  	}
> +
> +	igt_remove_fb(data.drm_fd, &data.red);
> +	igt_remove_fb(data.drm_fd, &data.green);
>  }
>=20
>  static void create_fbs(void)
>  {
> +	uint16_t width =3D 0, height =3D 0;
>  	drmModeModeInfo *mode;
>  	igt_output_t *output;
> -	igt_crtc_t *crtc;
>=20
> -	/* Create framebuffers for each connected output's pipe */
>  	for_each_connected_output(&data.display, output) {
>  		mode =3D igt_output_get_mode(output);
>  		igt_assert(mode);
>=20
> -		/* Find a valid crtc for this output */
> -		for_each_crtc(&data.display, crtc) {
> -			if (!igt_crtc_connector_valid(crtc, output))
> -				continue;
> -
> -			/* Skip if already created for this crtc */
> -			if (data.fbs[crtc->crtc_index].red.fb_id)
> -				continue;
> -
> -			igt_create_color_fb(data.drm_fd, mode->hdisplay,
> mode->vdisplay,
> -					    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> -					    1.f, 0.f, 0.f, &data.fbs[crtc-
> >crtc_index].red);
> -			igt_create_color_fb(data.drm_fd, mode->hdisplay,
> mode->vdisplay,
> -					    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> -					    0.f, 1.f, 0.f, &data.fbs[crtc-
> >crtc_index].green);
> -			break;
> -		}
> +		width =3D max(width, mode->hdisplay);
> +		height =3D max(height, mode->vdisplay);
>  	}
> -}
>=20
> -static void remove_fbs(void)
> -{
> -	igt_crtc_t *crtc;
> -
> -	for_each_crtc(&data.display, crtc) {
> -		if (data.fbs[crtc->crtc_index].red.fb_id)
> -			igt_remove_fb(data.drm_fd, &data.fbs[crtc-
> >crtc_index].red);
> -		if (data.fbs[crtc->crtc_index].green.fb_id)
> -			igt_remove_fb(data.drm_fd, &data.fbs[crtc-
> >crtc_index].green);
> -	}
> +	igt_create_color_fb(data.drm_fd, width, height,
> +			    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +			    1.f, 0.f, 0.f, &data.red);
> +	igt_create_color_fb(data.drm_fd, width, height,
> +			    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
> +			    0.f, 1.f, 0.f, &data.green);
>  }
>=20
>  static const struct {
> @@ -1264,7 +1241,6 @@ int igt_main()
>=20
>  	igt_fixture() {
>  		test_content_protection_cleanup();
> -		remove_fbs();
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
>  	}
> --
> 2.34.1

