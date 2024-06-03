Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16415C25B75
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 08:10:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F9410E301;
	Mon,  3 Jun 2024 08:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iTLzybD5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E1F10E308
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717402248; x=1748938248;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vQzmTEZWXqc29Ug86dd/0wIZLKH2MTNvzl41ZnyDat4=;
 b=iTLzybD5BKO74Z+uiHjl2OIspfCn75LzueuWjbcbbWDsPttxr7+6f5jv
 6y5hWivkdKR8O08kGbnoaAh6HUl7Ah2s+OvqxMlkPiq4MxcKYsoNKrF/w
 h4Bg1KwEuTezsoaQiwNuYWuceoqmI6AB3sHMgzUZupZD3LlCx7+oHXmVc
 VXr/1mShILAGuftxxq+NteucgFpFoUPi5UhFbNlTH1BM3lWFVs9Osb7BT
 b9jRnssCnDj9x4rIqvHuDu0Gt/7sOknYMzGwIbwDaAECH7E34uZJT5DvD
 bIqov6syDsYIOcq3QhRD4B7KmqwVP/2y6eS8jHpCczvczguDFw9j4+tCW Q==;
X-CSE-ConnectionGUID: f1EuGCKgT2OBW+4MjEDhQA==
X-CSE-MsgGUID: WtpMPo7sQM27NrB86ENAAw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13695336"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="13695336"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:10:48 -0700
X-CSE-ConnectionGUID: SbwIsD50Rpm8xelAaF7BXA==
X-CSE-MsgGUID: xuVmZDQeSXGZqxV/j5Me2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36886881"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 01:10:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 01:10:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 01:10:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 01:10:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZticVPPxcPRsEr0wvBGQAHIyUa1eiJ83Qhtg7JjBJFzhFDVbLeJ5x5sjj0dK6OplC95gKkdY7BmCtm3xSDuHkCAa2BNg22miXdtePmpmd233pHKcBKRSoXb7GMCewGQ2t9Lh8dBsw7nnd9J7E9mppaVIBVjEPkrfjrKZHYvyNI3WoJ//QD17/+LQjMDiQOfgXjr2ZUIfn8MMxMtx4cRyquEvZAnkaIPQ1ns1KJMeb/TDf4uPR5qzVuLgabFzsCn9YNsYGln+wedUXEPzxvbXoK2raPX+XetYF3GQE/zp0UcCq7dYXIks2SxPR6HmXQOjOC47/RlQ4V9F3y7PvUCkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUJeLbu9hkETW6wRpqDXRy2I3l8mlNc4OA/YrgEBlWI=;
 b=RoLp8APjsV8yAnkIFsAfG7FRbqjWmwamXSq1mj5qkCHNmzqG9blCaqU6X+KRAKGewjOr5FfB9La8pDn3O2krfyS7hOk47LsutPIYmovMX5E48YmUSwAtS8vqM5rUSDDeuPb3JeclcS7aPm5jAxL3eAU97HX3OrZSzK3wo3NC7eetm01q9ccMK9GJNHfa7PeIc43Ar/V1Ir2KOgpyFa4FfAEQqSjFl7ZraMpWDVqBZTeFN6Kx5G8ZS1T6fKwWfMgGMpv7/voA1t4x+KYtdB2D2pQSBHTHvqbthXomMP580dz0xxkwBwPC/fG+Rhf3WgfrPttuUkbCVBi92FuAx7KTig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) by
 CY5PR11MB6536.namprd11.prod.outlook.com (2603:10b6:930:40::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.22; Mon, 3 Jun 2024 08:10:44 +0000
Received: from DS0PR11MB6495.namprd11.prod.outlook.com
 ([fe80::48a4:1327:8beb:f33a]) by DS0PR11MB6495.namprd11.prod.outlook.com
 ([fe80::48a4:1327:8beb:f33a%3]) with mapi id 15.20.7611.030; Mon, 3 Jun 2024
 08:10:44 +0000
From: "Lobo, Melanie" <melanie.lobo@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Srinivas, Vidya" <vidya.srinivas@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
 RGB16161616_64B compressed formats
Thread-Topic: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
 RGB16161616_64B compressed formats
Thread-Index: AQHatYyZVnihJ55GM02G5nGZLJSgNrG1r3jA
Date: Mon, 3 Jun 2024 08:10:44 +0000
Message-ID: <DS0PR11MB649595D2406DE04EBB1A692B88FF2@DS0PR11MB6495.namprd11.prod.outlook.com>
References: <20240603081607.30930-1-melanie.lobo@intel.com>
 <20240603081607.30930-3-melanie.lobo@intel.com>
In-Reply-To: <20240603081607.30930-3-melanie.lobo@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6495:EE_|CY5PR11MB6536:EE_
x-ms-office365-filtering-correlation-id: 854bcd6d-8d2c-4e69-352e-08dc83a4ab0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?MTzM/lyyNPjVbY6L05QL+WH3Ox0i92IHtJ1ICm7XcvmBUEoxchMgT+Kpz+vN?=
 =?us-ascii?Q?kV+fJSLv93cIbsPJ6PKfu3Rs56SnW0Uactm9ziow5eoZQGI83TRLrGhWS0B1?=
 =?us-ascii?Q?hVaIAvH4IV9kAYDJD/z5WZGNuPf2ipKAhRrbCga7L9SsULVEeLk9XAeVH5/5?=
 =?us-ascii?Q?NIIkZAaZBtGLAPIowkDaR3E7bK5Jdq6dlfBXnsQ4JwRvXLZa9NXcG1Vjq/gF?=
 =?us-ascii?Q?ywtlwrM/daXgHpSSlVdslPtFytl5/mp1ZIyBi7CMUYrZSysiqIulUAftirUM?=
 =?us-ascii?Q?gEZKZhO58RRVCVFGIqT/xcraF070iCPPojnQApwcXeqPGGgqW9WVritWIxUG?=
 =?us-ascii?Q?gn/tT8BHjUsgnDvSnh6lZSDZ7mZfKsq/xc4g/kcWr/33tYe/SnFHlx5FcqQE?=
 =?us-ascii?Q?//GjcQeBZ3Ar+ZB4iu5r9KQS8aL8S1e4HWIuUOhyEPxtQry5S/mOkaGxcjre?=
 =?us-ascii?Q?1YUMs3sUcJ2TqonTas9q/iHxnfHCNqIlrS2RpAo3wgtQmUA5jhRVol/Du72u?=
 =?us-ascii?Q?2h/jVnl1IQtnwt4tSTf53si7VrNKAQLrGC0T4X6n/c+RuTDOtFcWg1DbrWy0?=
 =?us-ascii?Q?OdDEiuBMcPAUvtRnwCM8areHh7d3aDT7EvwKUS0YljB3DF4xUvcaipaN5yLJ?=
 =?us-ascii?Q?NEf8ydho1nyhQ51lmASOUB3xBZeEuO2azdOyqGb4nl8pw4OOUTxyKgbVMkha?=
 =?us-ascii?Q?yrY0HGCGtlvFtEq8vPiFl0tqnqqr9lkzif668cVqaKlFcMz4qSWj8xEtvp//?=
 =?us-ascii?Q?YF1AetdcDOSbQYE+rRYBM+rbygWfDqWmPEM8Lozj416UCUo10mxZ339eR1js?=
 =?us-ascii?Q?TrNGauPjYkydH3pfOo1yKFt8aYzAoApH1Cmp55ao9e0XGzijHeftPuK1qbyO?=
 =?us-ascii?Q?zc21PbZqY1pzpN2YijApx9Z8HTnotey9W5Hu2wxnT6NOpQAR8q4qgEN8J2yn?=
 =?us-ascii?Q?iRNMYEpWTJI49vV+glXBgpWBrCbBq2lhCxJ/OWk4Me3tjmbhQoD2lJTK5Tkq?=
 =?us-ascii?Q?mce7f+noutEV4QSlwQK1/mVGRoRG3i5QWPMoIQyp3fSTuqhVaGUhKFBld/VX?=
 =?us-ascii?Q?Gf6CCiX+sT81u3vSwcUINQvirjhmN5XdhafIgE7J3tAzP3sby/ua5SkpKtMu?=
 =?us-ascii?Q?kuC6Hh2iMECmh/1i4nGyZuxDftRyMW7cPaRJ11f3JzaaIuy66yd/eEtNauh6?=
 =?us-ascii?Q?bOjhgWTOu9X9n/OL284bAooMoxCuw+c5TKkN+i5eKVofiof9Ei5SHwonUsgl?=
 =?us-ascii?Q?rZ/1LcS/O4p+crL8EWPgW7FKyRXdZn1EoQXko6/WIFREUjOhBMxl45ecEwLK?=
 =?us-ascii?Q?sOo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6495.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?c9GZq7QfCXFN/QNd8BR3K6gpmQWOBxqKIeJw0UvNn2KKnH5xWz59cgLIYOXQ?=
 =?us-ascii?Q?dFldaldeX10KI4LZQbO8kLXA52XEUTOrl8yurFJ1uGA5GbhkEKQUXdOGRqoV?=
 =?us-ascii?Q?jcV3fNN6bwJU2sFw3UEv5fov3FYqvIcDoMhn/oczQtDSt8E/xYaUWUaSRF0e?=
 =?us-ascii?Q?2ZCK9tdsexTbmNBanCIjbyhtMz2+BM19t5di/MKJsTsytJVmKuW8z8WEkU/R?=
 =?us-ascii?Q?x96qQou0/7kKpBZpnu7PfKByaKM7/+w/NZhqD2//IcWzOhZOqj2SJQW4Tu6f?=
 =?us-ascii?Q?sBdbAhdBk3r2505Trs8z313VCANDvsH+xCSKFuDbPB/kqbFzDbZUPTxawwpd?=
 =?us-ascii?Q?IvbZDLGXPmCuHrM6HXRlaipvGv3RS1QCXmHDh6S7TERaNVYCX/lw0uhrZqZZ?=
 =?us-ascii?Q?lhLne/Iue2kjRpkRzrcEmarFZe/jUPW8NLvyc7YxTaxMzV83QMDluIQ0ilTC?=
 =?us-ascii?Q?lt7LwpZHA51UYTj7seMUXuu9IssM7euRCI0LgdIVJ+67jwd9w+bx6458iW9N?=
 =?us-ascii?Q?tt7ztLTX/RmqHnnRPpIZ+nRIjiVVpXnkyYDxuBOYaI0gzq3GGAor2vOFWlK2?=
 =?us-ascii?Q?x+fOJCr3S8xb+qxNA9IF/rpsgvu7GEX76C5nE3SAY952GSJXhOHqhXQOg9I6?=
 =?us-ascii?Q?wXWdCJziUSact299GuBEs3zgGXWZUpWBbxNF1hTSTo6O9UdbUyv8ji/z5zCR?=
 =?us-ascii?Q?vgCXGOk8hgAE/DB2hhTzJY+KgFEJh9jZ5riWusvJqC8H3IxlJ9/kr57H+ZaF?=
 =?us-ascii?Q?Od9XdA0dqaTxysFU9NkbSIazfwQW4uI3jx/ZD/LcuBWfzQ8SBQQzJdYI1CQq?=
 =?us-ascii?Q?gosv3osPpWe7pKh1BTiNc+Sb7vB+cVKAlzRR83nqiZN3az99QyCqspD10qf1?=
 =?us-ascii?Q?wlTkZCC+JKMSVsVxknXTT7WxhzwRwZaqx/k9lg4xMIrF/VBJjedgB+THAB/j?=
 =?us-ascii?Q?Y5zdsplrLtIlfoie0dsG4Fmb5+ssbLQxRrx/E4fdq9Xi/2Pv1XH1zVqwdXBH?=
 =?us-ascii?Q?Dx0plyT+ZL7AVXA8j9tbIKtJOIsLvXSpAB8CnATv2Qgcj34qmVglEYSxTY/K?=
 =?us-ascii?Q?fmULFZPQN69oX7EiOTk3guRfueC/F8vRyopD/8qNo7kh7t2H38NNVCO0w4kt?=
 =?us-ascii?Q?VTuQ7oSGgUkMHgVZjUdEQclVAhDH5+9FYVPfp3H3Dfopw0cgZ48Fc1HukJev?=
 =?us-ascii?Q?MJKSOff7RhdzUApzpVUZCgFXX26+okRm2wVCDXu94nCCW0D30LTGZHRJ2zoO?=
 =?us-ascii?Q?SUIE+ka4sBOh/1REgVt4O8HYwTBDeSNIHqoRMhBJuA66DdxgynNkCMgx8jC8?=
 =?us-ascii?Q?N8FJhz7X404HELuTD5Q1xW2/RtstgjiY+kTY4nQLhVzLnVBhAndxo/2eKzu9?=
 =?us-ascii?Q?KKF+SCX7I4Q/qT6PFDeHxNzJGkeSbFHyv8+ls1qZH1YTETITPm6LCYrPaN6K?=
 =?us-ascii?Q?Q/h3oRbg8qpm5cja7E7bRRF1qV4hHfuGlIP5Cs0uM5BHMd2B4L8xgGAxFiJ/?=
 =?us-ascii?Q?tw70jkSmeUhbU4qiOiIkBJvTcaV1pp5/4gV1PFuk3Lc+XroihU9RR46Nrt1O?=
 =?us-ascii?Q?fJhlmDM1lOoiRaB9UZNFPFdzCUl4lerC++tQNs6S?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6495.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 854bcd6d-8d2c-4e69-352e-08dc83a4ab0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 08:10:44.6645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kf0uh/B7o2FsoEzlDVUyrwtNtL9kWefusrhElSgb0qCaA0Dm6FhEj/42pzpsMnZn7IQ/n/p94/CCdwt7n3YngQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6536
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

Hi all,

I have uploaded a new patch set here due to some issues in uploading the co=
ver letter
Ref: https://patchwork.freedesktop.org/series/134353/

Regards,
Melanie Lobo


> -----Original Message-----
> From: Lobo, Melanie <melanie.lobo@intel.com>
> Sent: Monday, June 3, 2024 1:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Srinivas, Vidya <vidya.srinivas@intel.com>; Lobo, Melanie
> <melanie.lobo@intel.com>; Juha-Pekka Heikkila
> <juhapekka.heikkila@gmail.com>; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH 2/2] tests/intel/kms_flip_scaled_crc: Add support for
> RGB16161616_64B compressed formats
>=20
> MTL supports RGB FP16 format which is a binary floating-point computer nu=
mber
> format that occupies 16 bits in computer memory. In this test platform sh=
all
> render compression in display engine to receive RGB FP16 compressed forma=
ts.
>=20
> This was tested with kernel patch,
> https://patchwork.freedesktop.org/series/124957/
> https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com=
/
>=20
> cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  tests/intel/kms_flip_scaled_crc.c | 42 +++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_sca=
led_crc.c
> index 7dc07bc8330d..65fd31c5c963 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -96,6 +96,16 @@
>   * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to str=
ess CD
>   *              clock programming
>   *
> + * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-%s
> + * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to str=
ess CD
> + * 		clock programming
> + * Functionality: ccs, scaling, tiling, vblank
> + *
> + * SUBTEST: flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-%s
> + * Description: Flip from 64bpp non scaled fb to 32bpp %arg[1] fb to str=
ess CD
> + * 		clock programming
> + * Functionality: ccs, scaling, tiling, vblank
> + *
>   * arg[1]:
>   *
>   * @downscaling:        Downscaled
> @@ -345,6 +355,22 @@ const struct {
>  		1.0,
>  		2.0,
>  	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress
> CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
> DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress
> CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_ARGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
> DRM_FORMAT_ARGB16161616F,
> +		1.0,
> +		2.0,
> +	},
>  	{
>  		"flip-32bpp-ytile-to-64bpp-ytile-upscaling",
>  		"Flip from 32bpp non scaled fb to 64bpp upscaled fb to stress CD
> clock programming", @@ -529,6 +555,22 @@ const struct {
>  		0.5,
>  		1.0,
>  	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsxrgb-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD
> clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
> DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccsargb-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD
> clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_ARGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
> DRM_FORMAT_ARGB16161616F,
> +		0.5,
> +		1.0,
> +	},
>  };
>=20
>  static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
> --
> 2.17.1

