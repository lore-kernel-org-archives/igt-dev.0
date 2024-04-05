Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E018DCD1292
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 10:18:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2584B10ECCE;
	Mon,  8 Apr 2024 10:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zwbnk/sB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F2C113B56
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712317011; x=1743853011;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LED6AQtsCx84gfCHxUx5wZtzCpOxLSDugAPuSzQ9fuo=;
 b=Zwbnk/sBnc6bSLM3C0daeXl8EuR8cYd3Nw55l6TMX+0q3ZK2e+74wAs6
 6Rj8sKqmK60AodIVSnpeU/zEeC4l3iJQ6VUp+6OPAwQeHZccGtamlmNL+
 LjSAAWLXT2HyZ7Gc2tKwRtQC2nIRdIPRZF8gUd4e3BFtMXIgW2pGCEf+C
 wcqjbeboJx5KQkUl4UFQTxoyR+7YriQ2nIYoRPlvVmwZnGSxNCHGjwyko
 Sbs6sE7LMGNUs4YqIGYglZeM0Axo3DBFni8x8WYSlCNLs8wEOSnHpdM3i
 a3Ei/+QvMv9NvVu9mYMPaUqzyd7K04srBLbhv7eLafSa4SfQ9FuZTYcFA Q==;
X-CSE-ConnectionGUID: J7BXet4lQPqfzFLbvymZkA==
X-CSE-MsgGUID: 0X0XDeufRZGukD7Hm6RAQA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7769349"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7769349"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 04:36:50 -0700
X-CSE-ConnectionGUID: 2iyDJBq+TsWRL74xHkUyOQ==
X-CSE-MsgGUID: L2FqI97ITD+i/qnXKPplRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19240840"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Apr 2024 04:36:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Apr 2024 04:36:48 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Apr 2024 04:36:48 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Apr 2024 04:36:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dv9pMVhfM6OENyuLtnXtDmMO2httkOuOhkepmT76LRkdewxZZnMtFL3JYo61HY8PpPrtb2ZtdI09W86Moce6hIAhfmpsuu1tjSiJ+Olbbt8myLsRVdlqjV4BTHi7jNggSnBAOEIuAShFiXr8Y/Eo8CwqVe09MkJPNxYOO/4XJmgp5W8rcnZAK2aQsidD4nsSD1sXvShNgmrKcvCxIvCX4ZUmzIjY0xqDMalc5FwFCiRpSPAUY9Be9vLQoDIm/kYyj3vRK8SayzlBVJSrow4CVIqhcWK/qCPNZvvapr13UHGmyfzUORb7Pws5z5T/q8dc7EHRv1h3jzOrD/RuExFO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SHcJxCvYSjiiqG3EjjR/NUbpmNMRvFWWtktnvwsCw4Y=;
 b=jivv590HlJWxmS1pVrPDeMsvAw8nEpVASb+k6ZoOTADRy59B4+vX4QpRwY2cpmEZoN6xwnhkloCJXZCD2g/+3STMnyR1b9pz3rN1JczfDJoWZU7nl1eUWG56yyPOjJZxch9dfIllP2tUZs8/l2WkfeyVAxC445F2PxjryGUKkiCeNJ9YyFlfKuaxGK84TKs2lcAmlRo84aoVCITLWHevSzPsBR7594CjYmR97jODBp0c6QjHQm0//003nEADlREmyvsNMQj5FQ1BLdkIc83yHqNiSy97SPHrpe0jZj37ZnaZqaJt3wAlSfhGus9DV5jbZv/72MAtzzaQt+kFLjyCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 by SA1PR11MB8325.namprd11.prod.outlook.com (2603:10b6:806:38c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 5 Apr
 2024 11:36:43 +0000
Received: from PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::b38f:31b9:308c:c04f]) by PH0PR11MB5949.namprd11.prod.outlook.com
 ([fe80::b38f:31b9:308c:c04f%3]) with mapi id 15.20.7452.019; Fri, 5 Apr 2024
 11:36:43 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t] tests/intel-ci: Addback evict & threads tests to BAT
Thread-Topic: [i-g-t] tests/intel-ci: Addback evict & threads tests to BAT
Thread-Index: AQHah0XooytlHYRQ2Ue91B5LEuPbG7FZi/5A
Date: Fri, 5 Apr 2024 11:36:43 +0000
Message-ID: <PH0PR11MB5949E924DAB24CAAC9B1593885032@PH0PR11MB5949.namprd11.prod.outlook.com>
References: <20240405104159.14617-1-himanshu.girotra@intel.com>
In-Reply-To: <20240405104159.14617-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5949:EE_|SA1PR11MB8325:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2Kh5uN/JxxrJIcuuRLrwI8YfKJXnyDEQXcGvW3wLVepzMx9RRct01a+OekldWZTooEVSCaLz25XnV7mpVwgIiQDSjaFHF5w4Ph/oKQCSwG+szgCKuo8fV5h7EZO42O2wpnD9XEKc1FuqQ8u3A3SUKQR9pOBk0psEV74/ZLOkerFJyHif2PgJeCsunBr4R7A6OLhYxiR5+WOQ+PdzlaC+PoGlWHsnwzticGngElKE0tLyqNlQGz1ByMC4ttaVtY3OInf8EJXXDh7zHYHH5Y2h9mY4EN7b3sPTUV5UOw+KpPzYMnivPKe+CnLjYxh+EAjCu4pok17ih6LB0d0A/NikYVEPmv0Ggri3ikcEkacUO6lxLWbLFnfAbOTfzIRelDFX3V4PPDEBlvy6e06gsO8p/IRrtGpZUER9ZQGJ4KjJDk9u9FgI6qUyYU5OKxGnBl4+rVkS0r0H9crvgIeX3z23P/J+Qx07ppD4Fe24ehjF7/IuzWSnDju4Vcz+dTcBB/Jr0ZLJp3k3TvbmUCssogfePXXhw94eRQPufrERHgxgkhoqKntj0rId26jmvtgG42waEh+b0xZDv2IhuHhhNu3Gj4+GSSVq/MhO8MLOpOXkaZ+qstKHLilPTDS4HTkenNW9rs1VOzwyPiaSN+Qmmhg4oG6GOohnGWpQVqcd3Y7Tx0M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5949.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eR8AhQVMi9EqBNNigASbSE29PqB2sRUAoskIEuZ6ZtGy5GRyA7jqA7Xw2nq0?=
 =?us-ascii?Q?4x6dHb18KPt1SAzDrKlF91s7kq7cKnQV3yh9FJWuyaO30NrqOxm1EcxrokOD?=
 =?us-ascii?Q?t5YjyajHHiapjixae3WexsDAtI4WpLTjZ9chjN0rQgbYzxVDeOVPEHDqNhmg?=
 =?us-ascii?Q?vz03NfCyEmyRLqxwi6Q+PycZy2YeE+XwzXW4yNC8gGVRlGVH8AKmlyM8Ib8l?=
 =?us-ascii?Q?dgB/Cht4tliDzNcAWbiU0XtznMuToGXjdePBdDU4IwggmSd6kztuK8biieno?=
 =?us-ascii?Q?CUTwp7G5INIv0RwFT2fU2rqlZz+Nms5apj492TyqysjpKAFWXhEFp2Oef7NN?=
 =?us-ascii?Q?lwB74/kbNX+OggkK76r0ZBbdBOQuIAQIHBbCvGsnrdjhcfafDF2Dk9YPV/VR?=
 =?us-ascii?Q?3Vbuas9vJF+3qhJWkYy9afGcX+bQXLObZNkfZ74KTMMoEw7vlNtraoyHvElu?=
 =?us-ascii?Q?VrZIXjb7uQtg3iY0mPqh0RFCV94RktW1CuxW07pVoqYaWCVIbFWMsMXr17kd?=
 =?us-ascii?Q?1Dc4vNOllMxtjSFYTyIASYw+S5RUzTXPc3Hllqw/79HlqJ5HIgThX/pZ3TDv?=
 =?us-ascii?Q?hCAdnCTjzIOCd0CEcSDFnKfA2S7oZ5x5tF/xMlDXvxFOF/TKHwXwOS2iafsx?=
 =?us-ascii?Q?xZADmbb/3W9q0heOuP2yjLjjVcfLklLs08Z87gEluNgn0uZDXhlhxmM92GxN?=
 =?us-ascii?Q?/eSDhRhe8gnoe99pXvi/ZPa7Ht3o1juMDpe8vz4TVS0TgTHwJJlz9bhV+3PH?=
 =?us-ascii?Q?gdnKCNV8C/P8bOfxcPkhuv/8SUxEyH5OLsYyBk8LkC9/yAEHFmMzR9+TmVby?=
 =?us-ascii?Q?AeDwHpauH+sxtC838titpX2WJ1eN/nXmYEqYM98oG0pTQvpWb3zc1+WnPz48?=
 =?us-ascii?Q?VLecZQjb8ePq8DxmTNpf1F0+Se8SBUuXA/YmPli1HymB0jaKQwe9+Hp6EKho?=
 =?us-ascii?Q?oROGXS1ZtSRfTFwXubUbV6nmasosncCiScUZ8cN6wuMl+AV1+/5R4UoZHlbx?=
 =?us-ascii?Q?Zp/Mns/Dj8MZVKgzsM/Zu7pZ/sDxCXyh0PEjIMm/sh/E9lFfiBmQJfJSA41r?=
 =?us-ascii?Q?bxiiL6h29ub20dDbLuU4/RwUogX65B0wM8X7dSyG+mrPG5pepW6CjYCmyK8X?=
 =?us-ascii?Q?RvtHM7nXVf6QZo8Wt0hambFa8hd1iqRU4I2N3sTY/CkczsHZDtvoDrIhn8Cj?=
 =?us-ascii?Q?YP127nz/2ztUhcGD3hBrROY7xok822IQtJRnwTKvO4xUB7nlPSGIyWBayr+3?=
 =?us-ascii?Q?OSbmJtsFMpZX4pDHHiDIk/hUv0l9g5scBMnfWjh9HiBn1KUWuKdZWMF8L6Yx?=
 =?us-ascii?Q?a1t0RZcVUt3xyN/w8bKMrOLeJivSCH4x+dZJpKwqNFFug8T1fSwnDJ4EYsgq?=
 =?us-ascii?Q?fZxbrCs6oNTLYh6iZFacKTWcHi81yGaw6Z6f72+q86WmsXjpoEX9ndE81rU9?=
 =?us-ascii?Q?LnjwtessW7WGUEW0+HTx16Lzlzmxvusr42KOG+eE+uKotTnNmNMKMPkcosbd?=
 =?us-ascii?Q?Go3wi5kseo7lUINw8M1ccBvu0Wv4HIGm1hJvXGYwzV8VQCIuvXG9kXxZ69/Z?=
 =?us-ascii?Q?TNFDjPyf/E6S9z0d9qGulY9aw8Zs9k/MclQsNWAY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5949.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 276bc05e-f5d6-4b30-aee2-08dc5564aaf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2024 11:36:43.2770 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x6AjieGRjJZLgZZCO5pd3gA/dUl9FzDNftUzSypPMIsGOfETUZLZu9rx/LfTuL2dxGPlW/+wPg+msetQNbPwXdjdlGGx0mSzGcvuJ2dDFxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8325
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Mon, 08 Apr 2024 10:18:11 +0000
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
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Friday, April 5, 2024 4:12 PM
> To: Gandi, Ramadevi <ramadevi.gandi@intel.com>; Chauhan, Aditya
> <aditya.chauhan@intel.com>; kamil.konieczny@linux.intel.com; Modem,
> Bhanuprakash <bhanuprakash.modem@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: [i-g-t] tests/intel-ci: Addback evict & threads tests to BAT
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Addback xe_evict and xe_exec_threads to fast feedback testlist to bring b=
ack
> the coverage of BAT and reorder testlist so that kms tests run before cor=
e
> tests to encounter problem caused by "6.9.0-rc1-xe"
> Regression.
>=20
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/xe-fast-feedback.testlist | 139 +++++++++++++----------
>  1 file changed, 80 insertions(+), 59 deletions(-)
>=20
> diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe=
-fast-
> feedback.testlist
> index c859acdca..365d033af 100644
> --- a/tests/intel-ci/xe-fast-feedback.testlist
> +++ b/tests/intel-ci/xe-fast-feedback.testlist
> @@ -1,6 +1,64 @@
>  # Should be the first test
>  igt@xe_module_load@load
>=20
> +igt@kms_addfb_basic@addfb25-4-tiled
> +igt@kms_addfb_basic@addfb25-bad-modifier
> +igt@kms_addfb_basic@addfb25-modifier-no-flag
> +igt@kms_addfb_basic@addfb25-x-tiled-legacy
> +igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> +igt@kms_addfb_basic@addfb25-y-tiled-legacy
> +igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_addfb_basic@bad-pitch-0
> +igt@kms_addfb_basic@bad-pitch-1024
> +igt@kms_addfb_basic@bad-pitch-128
> +igt@kms_addfb_basic@bad-pitch-256
> +igt@kms_addfb_basic@bad-pitch-32
> +igt@kms_addfb_basic@bad-pitch-63
> +igt@kms_addfb_basic@bad-pitch-65536
> +igt@kms_addfb_basic@bad-pitch-999
> +igt@kms_addfb_basic@basic
> +igt@kms_addfb_basic@basic-x-tiled-legacy
> +igt@kms_addfb_basic@bo-too-small
> +igt@kms_addfb_basic@invalid-get-prop
> +igt@kms_addfb_basic@invalid-get-prop-any
> +igt@kms_addfb_basic@invalid-set-prop
> +igt@kms_addfb_basic@invalid-set-prop-any
> +igt@kms_addfb_basic@no-handle
> +igt@kms_addfb_basic@size-max
> +igt@kms_addfb_basic@small-bo
> +igt@kms_addfb_basic@too-high
> +igt@kms_addfb_basic@too-wide
> +igt@kms_addfb_basic@unused-handle
> +igt@kms_addfb_basic@unused-modifier
> +igt@kms_addfb_basic@unused-offsets
> +igt@kms_addfb_basic@unused-pitches
> +igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> +igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> +igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> +igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> +igt@kms_dsc@dsc-basic
> +igt@kms_flip@basic-flip-vs-dpms
> +igt@kms_flip@basic-flip-vs-modeset
> +igt@kms_flip@basic-flip-vs-wf_vblank
> +igt@kms_flip@basic-plain-flip
> +igt@kms_force_connector_basic@force-connector-state
> +igt@kms_force_connector_basic@force-edid
> +igt@kms_force_connector_basic@prune-stale-modes
> +igt@kms_frontbuffer_tracking@basic
> +igt@kms_hdmi_inject@inject-audio
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> +igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> +igt@kms_pipe_crc_basic@hang-read-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc
> +igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> +igt@kms_pipe_crc_basic@read-crc
> +igt@kms_pipe_crc_basic@read-crc-frame-sequence
> +igt@kms_prop_blob@basic
> +igt@kms_psr@psr-primary-page-flip
> +igt@kms_psr@psr-cursor-plane-move
> +igt@kms_psr@psr-sprite-plane-onoff
>  igt@xe_compute@compute-square
>  igt@xe_create@create-execqueues-noleak
>  igt@xe_create@create-execqueues-leak
> @@ -142,66 +200,29 @@ igt@xe_pat@pat-index-xe2
> igt@xe_waitfence@abstime  igt@xe_waitfence@engine
> igt@xe_waitfence@reltime -igt@kms_addfb_basic@addfb25-4-tiled
> -igt@kms_addfb_basic@addfb25-bad-modifier
> -igt@kms_addfb_basic@addfb25-modifier-no-flag
> -igt@kms_addfb_basic@addfb25-x-tiled-legacy
> -igt@kms_addfb_basic@addfb25-yf-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-legacy
> -igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> -igt@kms_addfb_basic@bad-pitch-0
> -igt@kms_addfb_basic@bad-pitch-1024
> -igt@kms_addfb_basic@bad-pitch-128
> -igt@kms_addfb_basic@bad-pitch-256
> -igt@kms_addfb_basic@bad-pitch-32
> -igt@kms_addfb_basic@bad-pitch-63
> -igt@kms_addfb_basic@bad-pitch-65536
> -igt@kms_addfb_basic@bad-pitch-999
> -igt@kms_addfb_basic@basic
> -igt@kms_addfb_basic@basic-x-tiled-legacy
> -igt@kms_addfb_basic@bo-too-small
> -igt@kms_addfb_basic@invalid-get-prop
> -igt@kms_addfb_basic@invalid-get-prop-any
> -igt@kms_addfb_basic@invalid-set-prop
> -igt@kms_addfb_basic@invalid-set-prop-any
> -igt@kms_addfb_basic@no-handle
> -igt@kms_addfb_basic@size-max
> -igt@kms_addfb_basic@small-bo
> -igt@kms_addfb_basic@too-high
> -igt@kms_addfb_basic@too-wide
> -igt@kms_addfb_basic@unused-handle
> -igt@kms_addfb_basic@unused-modifier
> -igt@kms_addfb_basic@unused-offsets
> -igt@kms_addfb_basic@unused-pitches
> -igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
> -igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
> -igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
> -igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
> -igt@kms_dsc@dsc-basic
> -igt@kms_flip@basic-flip-vs-dpms
> -igt@kms_flip@basic-flip-vs-modeset
> -igt@kms_flip@basic-flip-vs-wf_vblank
> -igt@kms_flip@basic-plain-flip
> -igt@kms_force_connector_basic@force-connector-state
> -igt@kms_force_connector_basic@force-edid
> -igt@kms_force_connector_basic@prune-stale-modes
> -igt@kms_frontbuffer_tracking@basic
> -igt@kms_hdmi_inject@inject-audio
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
> -igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
> -igt@kms_pipe_crc_basic@hang-read-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc
> -igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
> -igt@kms_pipe_crc_basic@read-crc
> -igt@kms_pipe_crc_basic@read-crc-frame-sequence
> -igt@kms_prop_blob@basic
> -igt@kms_psr@psr-primary-page-flip
> -igt@kms_psr@psr-cursor-plane-move
> -igt@kms_psr@psr-sprite-plane-onoff
> +igt@xe_exec_threads@threads-basic
> +igt@xe_exec_threads@threads-mixed-basic
> +igt@xe_exec_threads@threads-mixed-shared-vm-basic
> +igt@xe_exec_threads@threads-mixed-fd-basic
> +igt@xe_exec_threads@threads-mixed-userptr-invalidate
> +igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
> +igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
> +igt@xe_evict@evict-beng-small
> +igt@xe_evict@evict-beng-small-cm
> +igt@xe_evict@evict-beng-small-external
> +igt@xe_evict@evict-beng-small-external-cm
> +igt@xe_evict@evict-beng-small-multi-vm
> +igt@xe_evict@evict-cm-threads-small
> +igt@xe_evict@evict-mixed-threads-small
> +igt@xe_evict@evict-mixed-threads-small-multi-vm
> +igt@xe_evict@evict-small
> +igt@xe_evict@evict-small-cm
> +igt@xe_evict@evict-small-external
> +igt@xe_evict@evict-small-external-cm
> +igt@xe_evict@evict-small-multi-vm
> +igt@xe_evict@evict-small-multi-vm-cm
> +igt@xe_evict@evict-threads-small
>=20
> -# All tests that do module unloading and reloading are executed last.
>  # They will sometimes reveal issues of earlier tests leaving the  # driv=
er in a
> broken state that is not otherwise noticed in that test.
>  igt@core_hotunplug@unbind-rebind
> --
> 2.40.0

[Gandi, Ramadevi] please move evict, threads test towards the end of testli=
st.
