Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFEAC369B2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Apr 2025 12:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95AC710EAE2;
	Thu, 17 Apr 2025 12:04:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B9drp/L5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E8510EAE4
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Apr 2025 12:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744891491; x=1776427491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mfHPeu0FGEsqZphT6E7cCgPNN0QpLF5RGr+JXUKRUl0=;
 b=B9drp/L5kw2DCg151258f5R82NqK/pV58HqiYqprBNTAOd18ot/pWIzV
 D/ZIQEiZ9bYZ4fndkzVrvW8JzwzvjKlKufo481Pri6kGbN+/Sg5GB3spB
 pLJUN36cE7s5N793+emanL5fYsVza7lAeh0K2lf6r8PIoGGH73/GzvPlZ
 aCDWMS2oergUs5pAT4QIffq2iDYMw58P3MSy/EoeF50YEvz/Ql0iP1Pnk
 kwEFnj99pIdDsQGH/xUVsLVo7eVbycxP4r9sMnR20c28+FYcJHjb4nMuv
 lKa+nNygvti4xKLPTFNIQFO2iLcORHJg4MzOxDId5Jbmb/VgC3UzMil9/ Q==;
X-CSE-ConnectionGUID: bd9Cj5bORNeb27bzUNQcsg==
X-CSE-MsgGUID: iA3hCHHPRzqzZECisuFZDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46358979"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="46358979"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 05:04:50 -0700
X-CSE-ConnectionGUID: 3jv61TgYQtirCo+YGjYP6w==
X-CSE-MsgGUID: NU5SMtpnRNOjhOK0JxO1Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; d="scan'208";a="130743674"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 05:04:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 05:04:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 05:04:49 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 05:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnKpJAao0d2oBNoqMg3bOWvvuGtCKvKSP7ES7sjJXKcmF2O2oQRoD1ifcWzv5J5CSNzsGW9RkbsVP9GWFJ7IejwDePOcPDuv98fSy5iAdaxJ6k4A+irNRWS/JI9f0OGeUgzSJrv+zulocouL1t04oiLPPMZk/wDniTqXB1ziHFekz6EC6VU08SJpxWkhTN7u3Thdxm6yNyLwZbBbjtnKsQtDkiYkiMay6J8i20OFXLZ+6mzWi6wX+9UlOAOXTufMDGlHLSUh+UtajRRKUXgw7nCK5DP8b2ate/N8Pb6JYFXOe87QCZ6GYIR/ULtoxOueqRifFK37IM1e8A30BxYAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFBRP/jqQuUTHfeyxqZpvNeuoyjm1r3Tp35avqhs6ag=;
 b=l/SpQsZ1QMCH9iK064iNFfCW2j4y32W34AJGQLLkhni36ujX/FmJJKJt0mmxy1VZ4pOH2UPMnWWTMhFitlzS9fxf9a17QQrMwd2ty46llNhJWjQ89MwWwLEDA2BPAioNfE7SoHfenrrepxpdvoTBpvIdl+BTfiV9K1qvgcAC5JZrkD0KJ+39ULycABCJEEj7DYLviaSyS8NvxQJL115ajPLr/gl3XjlWFokubRxNxGIdxkDpb+ZWpOx4AO5qGJxlTyy8jd31FRGeXGvqfr6eAi0xLa7Pn3qa1iBBJ//vk87JQGBwXg1hje0V1pEMUMTRRGERiJR1VS79ec2UKQo33Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5819.namprd11.prod.outlook.com (2603:10b6:510:13b::9)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 12:04:12 +0000
Received: from PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2]) by PH7PR11MB5819.namprd11.prod.outlook.com
 ([fe80::dfc9:d5e9:2cd4:8d2%6]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 12:04:12 +0000
From: "Sokolowski, Jan" <jan.sokolowski@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Konieczny, Kamil" <kamil.konieczny@intel.com>, "Tahvanainen, Jari"
 <jari.tahvanainen@intel.com>, "Chauhan, Aditya" <aditya.chauhan@intel.com>,
 "B S, Karthik" <karthik.b.s@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 2/2] tests/intel/test_config: Add GPU excluded
 platform definition for LNL/BMG
Thread-Topic: [PATCH i-g-t v2 2/2] tests/intel/test_config: Add GPU excluded
 platform definition for LNL/BMG
Thread-Index: AQHbrtNujbgVMrV24kyAZa1YyD2WlrOnw/vQ
Date: Thu, 17 Apr 2025 12:04:12 +0000
Message-ID: <PH7PR11MB5819204B491430D6944D587B99BC2@PH7PR11MB5819.namprd11.prod.outlook.com>
References: <20250416132129.1363764-1-karthik.b.s@intel.com>
 <20250416132129.1363764-3-karthik.b.s@intel.com>
In-Reply-To: <20250416132129.1363764-3-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5819:EE_|SA1PR11MB8491:EE_
x-ms-office365-filtering-correlation-id: b86a9ab2-2707-4a64-d1ad-08dd7da7f7a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?id9/ah03mdD7EOjw42bsHtqtI3t11treEpAa7x6QQwvemaoa2+5O7DJo63QQ?=
 =?us-ascii?Q?1TJBReq/b6X4DzwiwLFccmB+L4myJgClgasWXIy5Uu7v6vj2FQQtBAH30U6h?=
 =?us-ascii?Q?uYmCe40mIzn9EXekFfihNTROfmIfkPtoXlytHfhFXHX0etzrYXBUocgnan58?=
 =?us-ascii?Q?NtP8WN4j9gPinpSTpmh/8NSIhnwMrIYwKXWIjCezQ9BWaGpGGW0TpgdOUqjD?=
 =?us-ascii?Q?wEVXGlYs6/Y2VtnGwdlkYut8SBCRE2OmFz+6zz7kJZb+G3UEN1hgxRuTEbE0?=
 =?us-ascii?Q?oyRIMFfw08HFTTGF6PPfvu3B3OlIRizY917QzzkVkh4koHIWUSBK6zXIcuQz?=
 =?us-ascii?Q?0UdQdWpcSw1A+uZfBowQ5UGRj6iNP0hCT8QBKKfdaGE+v5YXKxmxd3X6ZOU8?=
 =?us-ascii?Q?wVPgaBn9cz3Gwo/QfTQzbF3vyE1L5OmSmoy6IhVBFG3GhU4gxkDQjfhraMt4?=
 =?us-ascii?Q?m6TqvD+Pwtf2ycXCYNY2TjPZKXwbDb3Fvedp85xNGGC2oR7OoKo5yCyRKv+B?=
 =?us-ascii?Q?LwviMX/UDeYL4tovhgXnwWxNA16ENPzRGSvfvYgBpmpUPFelNgvcFiPKjY0Q?=
 =?us-ascii?Q?qwmLZWffgLfmuEFRwWsAR1Rzjfxoy/avZ1uJmsW+OZu410B/+VRagQzJQmJb?=
 =?us-ascii?Q?zbcS0xKlSv5n29I7ulJHvOO+qyB3pHzZjSF8SD8S2IJl2Rx/hWkVHB6b1TYW?=
 =?us-ascii?Q?RuiqkqlW8s0xMJijw0WZ5YTKaFUChu98aRE9yTZG5wIrdk/MkxofSUH3401Q?=
 =?us-ascii?Q?IO5IByvuEF2PrWolaZZvfQzEeF50Nsp8H/pE7+uCD3Qwyi3NtfOqzra3tcGW?=
 =?us-ascii?Q?PcpUzG0LocWnRJM8qc1o2csAGPUeV0+VxBiRD+iX2r672GEEP2fHsNlw3T4Q?=
 =?us-ascii?Q?TKqakgZSvNKggUWvYyMZPlqCxACiSaA4RyoHfsf4OF4D4QoGPs0yR7zi8OqD?=
 =?us-ascii?Q?LgCF7CYySoR+TJSeBjDZSIHywKvCMUEQYQ6Tnlt5vM3/5oIq5PKgb+2DhJRK?=
 =?us-ascii?Q?aTxroaEtZb7D5eawscxBi4JInm0feOcNYPpHsSyH81Jkr5wcWJ9ItwVOTCmG?=
 =?us-ascii?Q?MVhk4aU9zkMeZhttISuU1d/7qz2B0nL50ewWe0j4oeboNAfH1JOxKYDdxYRN?=
 =?us-ascii?Q?xnZHTR/Mv9VRvj2PI6h7K3YrhxAiPG+VpR4DYkiDSFkdWuYQ1HzMgspwXDVe?=
 =?us-ascii?Q?YAxbS7sg+nYQvDy6pPYjh7wpjMzI2H2V2TsFf9FTgbuniJ/EZ8Bjgc7eQ0DI?=
 =?us-ascii?Q?nOoWRaEY0HaZBkP/H6UtwI5q0styQZP2CJ0zrcbHzlS3QU56e0Kxea63EuI5?=
 =?us-ascii?Q?N4oUPfd5xCW64QbclawMRlKhitFpLMll9EJsJybL2rk4tngQrafKIhMFq/uM?=
 =?us-ascii?Q?CPTh7EM6L7rPJstThVlZ/9AgVmVQ6oErOQy7fWyuVAW+iwFh80kYlxeZtv4P?=
 =?us-ascii?Q?aHIE3eZfWWQAqcFTuVqtLY664mmMi+xej71Uz0GjFi9pdVZx0CkDEw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5819.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QE+XbcJ8q/MsC56G1jScX28ODWa9vQH8kZ0opjgjwgr5FH8nuOFfElC6EbsU?=
 =?us-ascii?Q?jBVwdI/fF8zSUtXKuVNi3rF1kmuksvm3WC3LtfozU8KsJWN0qB0NgOC1FZrR?=
 =?us-ascii?Q?drU7hNT3ftD2P8sIqCSgdKIWHX4lPECEdNtukkdDKsvNPH1hBpJQg8llBxBM?=
 =?us-ascii?Q?7yTZ7h/g+XPDZI6PyKEify2U4DAnsS/i8SRo70iH8jT0QsahOBgC8EgTaz/t?=
 =?us-ascii?Q?nhJ4bHlqeDTQfP0zcQT+lSCAPBXow+N6d+7wAvZy99Kam8Vfzddl+G40Vwuy?=
 =?us-ascii?Q?qdZpQB7oSssRARLXFTXfUte8/cKOc3BOojGG8rhZF/l/uph3SRQrhg0knc27?=
 =?us-ascii?Q?HXyoW5Riv/N8K9NWCKiQJSIxo5sqbukwYkid1vUP5y2R1j8keJk2j+faU/qO?=
 =?us-ascii?Q?woPeYGXmyTfTVfbkbJktUk8zTs0AYaH4LUncXHGXUpsl8xOOSigPLpzz4rTN?=
 =?us-ascii?Q?UgXtFBm5SzoKUWGpRvxZ4j/zGYdD33joTc6+aamAwucwM2G81gaV/whyXsGV?=
 =?us-ascii?Q?fti42cy1DgM5xXWUd7hqWakvv4IWDCiMRdhRH90wcpABhax41KozIo2avqjq?=
 =?us-ascii?Q?ENCttmYGxxFefnAHkwPnEJIn28GNosOdeQ0DffiFOZGhHlz4ag/2i0yp0QfW?=
 =?us-ascii?Q?HEG2L7b05zRGB0zDvk3AoRR3DIvz5hHgUMinpiFWfFKHjtYS0SnkMb2wFeaf?=
 =?us-ascii?Q?OqAg7VhJdibo5Hs8q5vErhbdo5sGHEO2b88DgIRKHwgG3Hjg8S/CW6YeZzHE?=
 =?us-ascii?Q?YT9Ingo4Nj/Nngofd0zqMJvlh5Kt2sAIEbkSYCo3DfgjnTjvSyxSTtKwhN2E?=
 =?us-ascii?Q?pgBAXm7rZGFXtT4o3ER+0RYS/On/fPcAejM95qjaJnRbnT2wf+sAvGw2avsF?=
 =?us-ascii?Q?Xik6QiIGpx2xnNZcXe0ClZzLQQPesrfTsvyI8RJczb7ZJU4DJdq6HjNzUyFE?=
 =?us-ascii?Q?6y/BAs1pPRtfOOjEt1FE6mIJZwaTMI+yQ5BCwCprZ9RZxvhWK0hjkFXRLe0W?=
 =?us-ascii?Q?nM7DnxM72F6iqv/MpweyqK+d0ILs8WObtdIohpY3OPxAcqIz3jttAElOJkPs?=
 =?us-ascii?Q?l6Ba8xNwekNkVnCqAb3RxhiRthMitvX9EeZzaEEZ3sIaS2ShBJ+tuUZTVjQP?=
 =?us-ascii?Q?A+CnSEpul+s0SftSq2zvyHcY+K6u5gA6py2MsUHScotg0xp88x/xspikzrc9?=
 =?us-ascii?Q?SrrlRQBN9yPBD7wWxI+B9qW5Pxy5O6CUFL7sB3LpxF/nIIervPCxTRxDUIw7?=
 =?us-ascii?Q?wDQ7GaV+hX6HM6nhR+SXbQ8ZoIHJjKEAFqgboQr33VWdlG6WndNjN8gD0Wu7?=
 =?us-ascii?Q?71Tmm1+y7ektBlB5fgagNDKXulT8ZB8UjwWcCb8G+xiJZSb/8npY3QTiCrfc?=
 =?us-ascii?Q?UvjO11BGinOzvGyiJNbi/kn12uHLFtDXWuB0KMaqGvzjWtwICHhTGiEulWKZ?=
 =?us-ascii?Q?NygdXAnjoWHdohUPOsvMMBvDguDF0dFCG3OfTFRkfSNa0bXm8FTVMiyjHknC?=
 =?us-ascii?Q?YoA3jdtTCznBeuV5K1c264dv+7uiSlDily/izASdk7zPPV/8u5Zf0qw4LvJr?=
 =?us-ascii?Q?vowqD/qEapEhj4cxAEQ106408JBOu6GvtWUypZ15?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5819.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86a9ab2-2707-4a64-d1ad-08dd7da7f7a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 12:04:12.4038 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BcT2M9Un2GplSlbgMq82JHxEQhah6X8J5RXdm3BUXySPQZCOLuX5URZVxkjG30AhNoi4vqc7VqwD6cp3nOhvgmYhOoeOymJlcmnMcvyvutE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
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

LGTM
Reviewed-by: Jan Sokolowski <jan.sokolowski@intel.com>

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Karthik =
B S
Sent: Wednesday, April 16, 2025 3:21 PM
To: igt-dev@lists.freedesktop.org
Cc: Konieczny, Kamil <kamil.konieczny@intel.com>; Tahvanainen, Jari <jari.t=
ahvanainen@intel.com>; Chauhan, Aditya <aditya.chauhan@intel.com>; B S, Kar=
thik <karthik.b.s@intel.com>; Kamil Konieczny <kamil.konieczny@linux.intel.=
com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/test_config: Add GPU excluded pla=
tform definition for LNL/BMG

With config definitions added, the blocklists for LNL and BMG platform on x=
e
can be used used to generate platform testlists.

v2: Fix Typo.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/kms_test_config.json | 10 +++++++++-
 tests/intel/xe_test_config.json  | 12 ++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config=
.json
index e11c7f4fe..65d6eb07d 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -54,7 +54,15 @@
         },
 	"GPU excluded platform": {
 	    "_properties_": {
-		"description": "Provides a list of GPUs not capable of running the subte=
st (or the test as a whole)."
+		"description": "Provides a list of GPUs not capable of running the subte=
st (or the test as a whole).",
+		"update-from-file": {
+		    "include-type": "regex-ignorecase",
+		    "include": [
+			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
+			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
+			{ "all": "../intel-ci/xe.blocklist.txt" }
+		    ]
+		}
 	    }
 	},
         "Description": {
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.j=
son
index 4556025f7..eb0a7d905 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -71,8 +71,16 @@
         },
         "GPU excluded platform": {
             "_properties_": {
-                "description": "Provides a list of GPUs not capable of run=
ning the subtest (or the test as a hole)."
-            }
+                "description": "Provides a list of GPUs not capable of run=
ning the subtest (or the test as a whole).",
+		"update-from-file": {
+		    "include-type": "regex-ignorecase",
+		    "include": [
+			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
+			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
+			{ "all": "../intel-ci/xe.blocklist.txt" }
+		    ]
+		}
+	    }
         },
         "GPU requirement": {
             "_properties_": {
--=20
2.43.0

