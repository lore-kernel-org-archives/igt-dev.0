Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483FCC44515
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 06:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E259310E680;
	Mon, 20 Jul 2026 06:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gshK0ZKL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A22C10E671
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 06:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784527259; x=1816063259;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YvXQSUFfdo9mCK8LQxuxxG8fkHcwVnqNfmpGde8s68w=;
 b=gshK0ZKLEU9fMLgM1xjaff3mCCjXjOCw4dUTfIPYz0zF1N7GeoZzP8D+
 RNmey2VI1EmqU+Td+ya7Pm2eK1zjfFSjfgHA0k5Qo185FZ3blw4FCLfeT
 xpNfPjyCPCpg0gZ/ev24yqW/B+QVGDbTs9kjXYc027VrqFLojOwsiLZ9/
 W8PGtbXXaIK9SSfwZWUlJ6KOrrZrR2SN69GzDV9u+eADxaVJMw91MMnla
 GfuHTVllmVLyhnwRftUYjPJ07bPjX1Xgm3QrZCMgPo6h5c3oDKfDuta1C
 VaKpRTBZ3d4VLzoAGao5QnkQ8DfL4qDuOOkTQLc1EQHSe7RqB12Nz4D7v w==;
X-CSE-ConnectionGUID: WmIeIx9rSuq4jfEnn4rAuw==
X-CSE-MsgGUID: Ia6omiW5R66Gra/twlEvzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="88778658"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="88778658"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:00:59 -0700
X-CSE-ConnectionGUID: xKbRFeCxT1a8FNcyNpZAfw==
X-CSE-MsgGUID: JpHUolKwRvWWUo5Wyds4wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; d="scan'208";a="256191332"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2026 23:00:58 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:00:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Sun, 19 Jul 2026 23:00:57 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Sun, 19 Jul 2026 23:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kupp+8pPkxjGhtKYmD82ZuQ2plzKn3eqcYPZrPah0B9qp37J6Oc9hYKGSUI8pkRgXLlkXzjtrC47+5TbNngSTW5AfydtKwkZTG6Uy/17uDzfrmxkOgSVJbUx3QoU4GwceiK7eqsQrdfxHwGm622HP6LonOioMNPaNuxU26WxFvF+ist1PznZCP92BMHAeHo1s/91Bnc/H6LSFxRCYKr8JLv+B7q+S2lB2z87mPPbid5edzbRiDSXG7DF8ioDCR5+M2DM85W9f6hQEB+6A4Kr0IqPEvzvRq3yNUIKoiEERdahqZvyWhh5Z9BUqmk+RClSq0NxJQ0Rn9tBUYha6xTy9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hV3qQpAvevepJANJBQM9Qkyi84MkNqwIQMhGylagUa8=;
 b=ZH2MqqN+MrRfAdPlXatTh7paJjSPhLY5lK5Zqe2y80JqY4fBYX9hgkpL0bOGXRA2uMCsixLgYQfJDkk9K1fUahUp+OKZX2ixEjGlLE/tUTTywlscNMeGbekoZvfq/3GyOZKana6ks56Jc1a2xNJncy24Pjo7u61F++BGCpLF9Q1sMBnOw7VuAxiumkZNEW+t+7uomB2qEK7lMoFWCGi5W6yOnrNxGxW+/LO/aufUUGuz9IHBjMVIjCyaw9mD0wX/ZzJPHynOlYqpxZJtkGVa8mvIejgtrVtPcsjvDTruldVl85o36HXt9QXSKCBr9KLWeYx101ZyxTTIjULOOpZUDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 by PH7PR11MB8275.namprd11.prod.outlook.com (2603:10b6:510:1ae::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 06:00:54 +0000
Received: from CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03]) by CO1PR11MB4913.namprd11.prod.outlook.com
 ([fe80::938d:6d4c:e26f:ed03%6]) with mapi id 15.21.0223.017; Mon, 20 Jul 2026
 06:00:54 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>,
 "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Add test to validate
 YUV420 with DC3CO
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Add test to validate
 YUV420 with DC3CO
Thread-Index: AQHdFaCbFbRwyufEYk6F3/8mzMARnbZ17hSg
Date: Mon, 20 Jul 2026 06:00:53 +0000
Message-ID: <CO1PR11MB491351544EC1072F857A42DEE4C32@CO1PR11MB4913.namprd11.prod.outlook.com>
References: <20260717035658.857405-1-jeevan.b@intel.com>
 <20260717035658.857405-3-jeevan.b@intel.com>
In-Reply-To: <20260717035658.857405-3-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO1PR11MB4913:EE_|PH7PR11MB8275:EE_
x-ms-office365-filtering-correlation-id: f8f56481-84b7-41fc-a1d2-08dee6244261
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|10070799003|1800799024|3023799007|11063799006|4143699003|10067099003|56012099006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: wyQmx/OFkMQLukzYIaKl9UisiwQ3ZcftPxFAsWYtWvQNjaxwpkO8utXovQZOKecy7P2Kl3+RYe8psG6YqS6mmp3slgdUFR3HBjMiakuZc7bHZzWt1W1awnmPiB3eZGic2pso4qjMGj5TLha1U/gppNfR7EJB67FpZ8CMwNiauzfLseanOLk6jrvTzV15cLqLn7bDiScdDwIwbxm6nqwbyFEFFOv4CbHSybnQt3YXokXlcgmePxUFXHiOBhT26oAZNGD+eeYHf9zg25hgaCTFz195x5oPlyy7dRnBqcAwyuQucW3JlPYCtFgDML+/cu/3ZYYPKKVrtV9wZbNJwVHEH8upp2mUloXbK+4MPwvuJwGXaKX1bHgj1RRC1CIaUQHJaoykzQO2td1DueMW2EZzxuJ7Xlq23PCowatDg79OzK31K8HpPjqf838sFu/ubQglZ+A0DoyZfsix5qUJqLmcXQYGWX7z6GohCcLUYajwYEfBN+T+IMJkb6uf+rfjBTGn7QRT6LA8U2Z3CxdMLx8wRG87OJU2USZLV1WXEbeKzYKoBiKUT43bU6Hjhv5awEa+9euX9wwOP5qeqhwH23E+agGJxVukKTcX1rLB/AthklprA22Kl3cFgWmyygBsqorGd9I7Nil1+zE9i641ca4QeglLREUxW3sMzuzZV1CTWAZ8ZnH8+Bw22WQv1Uhr4Fc//aAz4+4chYC8oTVOYCp+kPB9vDF/ff23Ny6ybLtbdk8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4913.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(10070799003)(1800799024)(3023799007)(11063799006)(4143699003)(10067099003)(56012099006)(18002099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xEo3EA4Tc35jGXd+oCPwpSXkxj7B/OViTY5oyg1HFSqzoM1hkYUaCNHTIfZF?=
 =?us-ascii?Q?cI2xAM8s+vymTKbyShttSNdpI1jVu0N9UcN2WbA3za5bwMXKvwQBxn0+FLlz?=
 =?us-ascii?Q?QOcGgW87iig1CYxCPYqc0ZddT7G4fuI/3sIF8v1pS7sS4KJIWpzLJRH64+yd?=
 =?us-ascii?Q?9keU3Ze6ChPZVsmi4hH7rsioi30OLY4Qvj3K9XDAcbieMveBU1RWlPBnu5vg?=
 =?us-ascii?Q?X3YbgAcl5I9Qyf96+N69orekh4mRvDP7LnBfbApf1AScYp8370VaaTRggIdG?=
 =?us-ascii?Q?OsPa6dxvh5sdlqxBb7LLgUEtU3bL/nVZm8Pw83mFu98KaklWK0n6zz4QVi0r?=
 =?us-ascii?Q?B3gsdoFdmZ9Zho9HCwGVNk6uPc//h0pDkggiGx/V464cZpLASPazcrK7T4oq?=
 =?us-ascii?Q?uknKM8B/j8+Iz1Rlc3iqzDqbAQfkhBS1Him4qLTMjVtEbWB678ykxa5a4P9W?=
 =?us-ascii?Q?J6iHgZLlxCOgI8Qr9n9PcBz0j4jMIN72K+HTOjZTeHoCx+HiZwMaPB1vbgEd?=
 =?us-ascii?Q?Yg7fR2JwmFgUUj2tQBmebuZ+BfmZus4PWyY/MgFz7lv7qtsnAkPAzMH01eQr?=
 =?us-ascii?Q?Tw9R0KF2j8w5h1VgzbjCDEJKEKvu6m8iQ7RTiKxAeLZvMT1SJS/CeUnPsXtR?=
 =?us-ascii?Q?SDg0TIdyaFRrlDVCBdUmJIxs4FRiueGAK4XdFvXwVKku4/kM/mbVQ6ZSrEF5?=
 =?us-ascii?Q?v36AV3F45MEiY0m4OTd+qHFqoRlF1pH8XbRi3/GqYkEQw3UO+D3yTad/JBq3?=
 =?us-ascii?Q?ZmEMAdOHUvqQ0vCOMyfURSYdDXX4tgrNS8Zifv0vCzPuIjTZqFymxPVFav2D?=
 =?us-ascii?Q?bYYX5iEYPr8gjSP27w5W+lLuCAKCAUFMe9tL63wISP7J08i+vlQX3XdrInhF?=
 =?us-ascii?Q?6KGpw3siNdIFZ0p7woCWTbECF5hsvnQfcuSAGexBH2ep6z0/CUL6nszzThF6?=
 =?us-ascii?Q?3eYbkNPhGSEIo8ENl3k6ea8kolBQbNJ7cDnmGPOkdYYlfECSYA4QoQF/RoPY?=
 =?us-ascii?Q?aUBvoESxov/1dJUnH+n2T9oBE9EVOPaCA9u6mC0rbW7nERpV2dd2G6y6vilC?=
 =?us-ascii?Q?r1GsmIqydBwVLTzTXRgO6pJOKhYGyTzwa7pxqp1o4Pbx1vQjtpBlS2fDvgNT?=
 =?us-ascii?Q?hNwDkj16iHU3GaTuhFumc3EfFBcaeA1SxDK9wG+/h6yaSod/PCNJiClrgvfT?=
 =?us-ascii?Q?Icn92keHPPfBtur8c7bcJEkni9XcAleC8m65FzZeASmcmlvw4D/jbFHBwXBf?=
 =?us-ascii?Q?GHqAXEO3pHWa0kLbJE7xjSWHvQf6s47i0RPo7tLiOdXY5zMCsuYcpqnswcjw?=
 =?us-ascii?Q?0e4Wbpj+J1F1Dwz1za155sjdtsmtEBKciHRkLDuVmQ7sHvKhdNmOG6Wd5D1J?=
 =?us-ascii?Q?3nqIqLy6dP1JxxBZMRFAmShKiASqZUTiM4LxJPUMWX5gw6g+GAL/EUrD3qf/?=
 =?us-ascii?Q?l3ju/ZlrYQiWf7KTlPsuCRa5bxFLIQtMcyWMBSvMBDbUt35mftD2HJy8u1e8?=
 =?us-ascii?Q?8uO2vWCRsECrsxaiz12Rej/vjl2F22dXPn85SbCysYJJ6+/8Ev3ZQGsGnB+g?=
 =?us-ascii?Q?gu+aZMyRH8pw4BDKAyQJu7pF5oSVnDlXKbMeTWPciBcWQA+rm3o88lrnrv15?=
 =?us-ascii?Q?K9TBQk6D0ZY5biwgYAfivMCgJWtwHs1e4mfvDhupdb/KlH5csQ9Q3c6Npi6f?=
 =?us-ascii?Q?oshPkCE73OOVeyBMFKe2RCsyswE66b0nMxIPq1pBXaxAo7POax+OcjsPCQAN?=
 =?us-ascii?Q?X23huRjVv7ojHsblxRckK3qC5bRX0J/Ej1DHIB2+G+fDioo+fvXnlqy3IXT1?=
x-ms-exchange-antispam-messagedata-1: dcVEknXWhW3XBA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RH8Z8KCO6Kd27nSUeLLM9h1Ft4WPzAu420ZtPsoIyYgsllZ8ND1gg27UkywPFDSWjXkk17FEFZ+SByNB8PmEIXOdXKoR5z1kdg1w+k2qIxHvn1FxxVBiQh9v0aXtI7wvNY6TrDJZa1MjSU+5Zvx/y1B9aS0IKg413z6lHVbnEoU5x0U7MqqjtZ1rCOCJyqguR1IJjAjiY7BMOOj+I++Mso0Ivm0ybW3ohgpANVmWMsJEQown9EzNHHhwaobz0bhq9zoT0F61H6uFwmXnzQ2lfRwAd7und7SitcrEIScTuHSSoRtUNYSC3sjLJGF3UvKMdP4/L5wD1SdOwbcqjp23IA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f56481-84b7-41fc-a1d2-08dee6244261
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 06:00:53.9494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XZgzwpPTsOe5hzJkl1jGAh5DGmKU14LdzaW9+whsK2RjB5KIj2upbQj5llwinwo0Z62bwwhxLOvdz9S/MeJW63MpsM5jtQJNTFrvrDrfJoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8275
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan B
Sent: 17 July 2026 09:27 AM
To: igt-dev@lists.freedesktop.org
Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>=
; Naladala, Ramanaidu <ramanaidu.naladala@intel.com>; B, Jeevan <jeevan.b@i=
ntel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/kms_pm_dc: Add test to validate YUV4=
20 with DC3CO

Add a new validation test to ensure YUV420 works correctly when DC3CO is en=
abled.

v2: Add YUV420 support for all DC3CO tests.

LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_dc.c | 70 ++++++++++++++++++++++-------------------
 1 file changed, 37 insertions(+), 33 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index 018def=
5e4..52f0be183 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -125,16 +125,24 @@ typedef struct {
 	igt_display_t display;
 	struct igt_fb fb_white, fb_rgb, fb_rgr;
 	enum psr_mode op_psr_mode;
+	uint32_t dc3co_fb_format;
 	drmModeModeInfo *mode;
 	igt_output_t *output;
 	bool runtime_suspend_disabled;
 } data_t;
=20
-struct dc3co_test_mode {
+struct dc3co_test_case {
 	enum psr_mode mode;
+	uint32_t fb_format;
 	const char *name;
 };
=20
+static const struct dc3co_test_case dc3co_cases[] =3D {
+	{ PSR_MODE_2, DRM_FORMAT_XRGB8888, "psr2-xrgb8888" },
+	{ PSR_MODE_2, DRM_FORMAT_NV12,     "psr2-yuv420" },
+	{ PR_MODE,    DRM_FORMAT_XRGB8888, "pr-xrgb8888" },
+};
+
 static void assert_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_=
count);
=20
 static void set_output_on_pipe_b(data_t *data) @@ -275,7 +283,7 @@ static =
void create_color_fb(data_t *data, igt_fb_t *fb, color_t *fb_color)
 	fb_id =3D igt_create_fb(data->drm_fd,
 			      data->mode->hdisplay,
 			      data->mode->vdisplay,
-			      DRM_FORMAT_XRGB8888,
+			      data->dc3co_fb_format,
 			      DRM_FORMAT_MOD_LINEAR,
 			      fb);
 	igt_assert(fb_id);
@@ -300,6 +308,15 @@ static void assert_dc_counter_negative(data_t *data, i=
nt dc_flag, uint32_t prev_
=20
 static void setup_videoplayback(data_t *data)  {
+	igt_plane_t *primary;
+
+	primary =3D igt_output_get_plane_type(data->output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_require_f(igt_plane_has_format_mod(primary, data->dc3co_fb_format,
+					       DRM_FORMAT_MOD_LINEAR),
+					       "Primary plane does not support format %s\n",
+					       igt_format_str(data->dc3co_fb_format));
+
 	color_t red_green_blue[] =3D {
 		{ 1.0, 0.0, 0.0 },
 		{ 0.0, 1.0, 0.0 },
@@ -893,14 +910,10 @@ int igt_main()
 	igt_describe("In this test we make sure that system enters DC3CO "
 		     "when PSR2 or PR is active and system is in SLEEP state");
 	igt_subtest_with_dynamic("dc3co-vpb-simulation") {
-		static const struct dc3co_test_mode dc3co_modes[] =3D {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
-
-		for (int i =3D 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name =3D dc3co_modes[i].name;
-			data.op_psr_mode =3D dc3co_modes[i].mode;
+		for (int i =3D 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name =3D dc3co_cases[i].name;
+			data.op_psr_mode =3D dc3co_cases[i].mode;
+			data.dc3co_fb_format =3D dc3co_cases[i].fb_format;
=20
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >=3D 35, @@ -919,14 +932,1=
0 @@ int igt_main()
 	igt_describe("Validate that no frame drops occur during DC3CO entry "
 			     "while alternating framebuffers with PSR2 or Panel Replay active")=
;
 	igt_subtest_with_dynamic("dc3co-framedrop-check") {
-		static const struct dc3co_test_mode dc3co_modes[] =3D {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
-
-		for (int i =3D 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name =3D dc3co_modes[i].name;
-			data.op_psr_mode =3D dc3co_modes[i].mode;
+		for (int i =3D 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name =3D dc3co_cases[i].name;
+			data.op_psr_mode =3D dc3co_cases[i].mode;
+			data.dc3co_fb_format =3D dc3co_cases[i].fb_format;
=20
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >=3D 35, @@ -945,17 +954,1=
4 @@ int igt_main()
 	igt_describe("Verify DC3CO entry is still functional after a DC6 entry "
 		     "and exit cycle");
 	igt_subtest_with_dynamic("dc3co-after-dc6") {
-		static const struct dc3co_test_mode dc3co_modes[] =3D {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
=20
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
=20
-		for (int i =3D 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name =3D dc3co_modes[i].name;
-			data.op_psr_mode =3D dc3co_modes[i].mode;
+		for (int i =3D 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name =3D dc3co_cases[i].name;
+			data.op_psr_mode =3D dc3co_cases[i].mode;
+			data.dc3co_fb_format =3D dc3co_cases[i].fb_format;
=20
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >=3D 35, @@ -974,14 +980,1=
0 @@ int igt_main()
 	igt_describe("Validate DC3CO counter increments before and after a delay =
"
 		     "greater than 6 frame gaps during video-like load with PSR2/PR acti=
ve");
 	igt_subtest_with_dynamic("dc3co-vpb-framegap") {
-		static const struct dc3co_test_mode dc3co_modes[] =3D {
-			{ PSR_MODE_2, "psr2" },
-			{ PR_MODE,    "pr"   },
-		};
-
-		for (int i =3D 0; i < ARRAY_SIZE(dc3co_modes); i++) {
-			const char *name =3D dc3co_modes[i].name;
-			data.op_psr_mode =3D dc3co_modes[i].mode;
+		for (int i =3D 0; i < ARRAY_SIZE(dc3co_cases); i++) {
+			const char *name =3D dc3co_cases[i].name;
+			data.op_psr_mode =3D dc3co_cases[i].mode;
+			data.dc3co_fb_format =3D dc3co_cases[i].fb_format;
=20
 			igt_dynamic_f("%s", name) {
 				igt_require_f(intel_display_ver(data.devid) >=3D 35, @@ -1025,6 +1027,=
7 @@ int igt_main()
 		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
 			      "PC8+ residencies not supported\n");
 		igt_require(intel_display_ver(data.devid) >=3D 20);
+		data.dc3co_fb_format =3D DRM_FORMAT_XRGB8888;
 		test_deep_pkgc_state(&data);
 	}
=20
@@ -1053,6 +1056,7 @@ int igt_main()
 		igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
 					     PSR_MODE_1, NULL));
 		data.op_psr_mode =3D PSR_MODE_1;
+		data.dc3co_fb_format =3D DRM_FORMAT_XRGB8888;
 		psr_enable(data.drm_fd, data.debugfs_fd, data.op_psr_mode, NULL);
 		igt_require(!psr_disabled_check(data.debugfs_fd));
 		test_dc5_pageflip_negative(&data, IGT_INTEL_CHECK_DC5);
--
2.43.0

