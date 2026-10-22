Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18ED606A31B
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 12:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=apPZS2rV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFEB10E3C7;
	Thu, 22 Oct 2026 12:40:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0047C1125CD
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 12:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672754; x=1824208754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yLC64Aa4nTqFeFVlKNMj0y8BC3tvZilAtbeYDgjndNw=;
 b=apPZS2rVEmYhzruzLVXNODihVATpZzgWjSl9+ZY8EZd+hkRBvMi75auW
 3WFBIFjaObRC3ND8PMDWZ5jlVsuClCk+GwHxa3labIvdp5G4BDDeW3Sc1
 YTj0VYYg+WC6wSowr4b9ph7zuyqEzY4fGJAFYhw4UH9x+cfeEtL8ewRfs
 0PE7al6cqJa9PN5Quxbaicp5DkjaGemofrZRfoZD+L+5b3pCGbTIPp4fk
 nEE4Ee95myRGRbZwSJ2nLM63+BJE9phdnkvuovISnohO13AJGOGr0ba29
 geTPON5WoGwZaclc/J1iWcxEpbs2da/A5W+tJ6T74cbL9DOw5fuNUf4AP g==;
X-CSE-ConnectionGUID: To4/Knl5SgqXo6m/WLVv/w==
X-CSE-MsgGUID: lzKFSlxtR3WNNAH689OxVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1452829"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1452829"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:39:13 -0700
X-CSE-ConnectionGUID: idhbZGRoR/u09p7nkCclZw==
X-CSE-MsgGUID: hc9Jzgn2QuyuF8ie0NA43g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3720914"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:39:14 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:39:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:39:13 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:39:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5YiMMXjBTZOKjJ/kBT57rUtY+OnNF2QKIacj9cKUBCfSifChoT5/zoa+TJmKTNZ85DLX33/wBxAhL6Lgw9nrz9cryuHAz5FJpj4CIQbC/QJEIoOt7WqMqOReDJnYh+M9Q+c5Dk7fyYWKJQ1uTdI0BiIJcdnIxL/inRv9qjWw5aEqLwpF3c6xkB6nlWUAAr1S29k5OeRO0fOXDHgY4agIPUujoEz3DOaTH+QBQHE49CIR8R36UEspxdR1/nUTQaJu8kA170TgkBoX8MdvppyBjaXre2veDjF1gKhxcBvsVwhYtMwOL9qBZJmv8V2nnSGeR+BeP8H1QAkKWF9uJBZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yh1xZuDHEnSA+1cN1YRkmtPFowf8tX37wEL06erWL1Q=;
 b=PGwLG+Df+nY+ZWif/sRAZH6WIm8nhUuxIphQ27ZNBsRn3/EAqP5bfZ/vUIICd3+IfUMZPBGdbM13u5TmD0syPGI3PN2itwg5zwWwHVHcPlOgZ/z0fnhPctN4MhKSprz/r0HDs07pW7wYhl9Vt/QfaPi3SXEFvpYSbyCau+vWg+YHDplcMP1u2uyYRTOjxQcHXqwaNN/+Ta1USEjtZj1gfPuzfynLjm4VSbfYpO4flQ0Y8aJ6s0iGYYLoDZP4jkxFLTeRnpsGUtlAFxJIGtSNDdpjbRV8eSsC0JFblFcR8FpC6o+zFFANiAHqcYGxE/1kKbmGxpzaIxk5l7V98ghZ+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 (2603:10b6:610:367::19) by SJ5PPF8DE294191.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::843) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 12:39:05 +0000
Received: from CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823]) by CH3PR11MB046149.namprd11.prod.outlook.com
 ([fe80::7c3f:5300:19c4:b823%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 12:39:05 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>,
 "david.e.box@linux.intel.com" <david.e.box@linux.intel.com>
Subject: RE: [PATCH i-g-t 2/2] test/intel/xe_pmt: Support CRI PMT
Thread-Topic: [PATCH i-g-t 2/2] test/intel/xe_pmt: Support CRI PMT
Thread-Index: AQHdW/Ya2JlgRyIbSkyyI9ebeP90VrcJi5mAgAAA7jA=
Date: Thu, 22 Oct 2026 12:39:05 +0000
Message-ID: <CH3PR11MB04614987CC95027A553C6E2956C1652@CH3PR11MB046149.namprd11.prod.outlook.com>
References: <20261014160516.3542311-4-michael.j.ruhl@intel.com>
 <20261014160516.3542311-6-michael.j.ruhl@intel.com>
 <atoC91YzB2Y9aXt1@intel.com>
In-Reply-To: <atoC91YzB2Y9aXt1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB046149:EE_|SJ5PPF8DE294191:EE_
x-ms-office365-filtering-correlation-id: 59fe9354-973e-4ca7-64c1-08df3039757f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|38070700021|261021121427099003|56012099006|10067099003|4143699003|11063799006|261009223027099003|261021123027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: 6xJSNLJsP3TpHxJJu4dtt8g6bFLGuQEJMfG7Cxvc/pvgbDLFLpMTVR6GZAW3k4Irh2dhWHbxQwM8q1dRMKLsYQWSGg1wGWkHZ7wvhmhBPXrDiReWgU5iIQTwIhyphYqWFLxZ6qN0ReRi1VYA/VUfyqDIykgLN/3Qs7M5ST24gVoRrCimmuNw0AaASFw82ykQbChz+nDXriRZPfs7IXNVVPocq4cjmux5YPSXMwC4seTzJNODkM7SLB1JzRZUIj0Yok5tcBq6EfoA25fbtqSsE3/gp5puK0JHjWGUXgvEWJMmpkoc40iEfcC2hsNMCG7OvNuNNFq1Ex9cUAK+pDHLOATyDicH+vZbd/6CT+ibzqcu1Vb6+usERatSRHZpKDXCKcTbFvrMT7GGKchQx/AJxCAWiSKlBlC2+t/qGaICmeikdgLqecjUFxhs3dCkFPX1oNXQt54aXH2XxjKZGOdRRVvI47kosc/G38++5mScVHWyeX4qlYSqDOF//SgPntt8fMljoKUPgsab0QRwD9BLTHA6T10tTkJ5uuxaFlAET8Mm5VBC1RhHSJc5/tBu+mqMsQ2qPO643+pEG7CX5LmuHSr643eG68LncLGGha2i8kyq1NGTFvrSweYS359tJKwTEVODlMSps+pv0cJGZWRglmDovz0Y9FSH4VFw/3KbcTUiJ7uv/8PBrwnXu4YbS4VOsfu5SVENtFphv3IscGlzUT0Nlbz5/a7sne/k+qQlBv8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB046149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(38070700021)(261021121427099003)(56012099006)(10067099003)(4143699003)(11063799006)(261009223027099003)(261021123027099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/cL8VyfT6SS6+eIBLKvsJAKlwsCHhPCIOrPwgQjmgVcAFVt7j1+T7zyDST/4?=
 =?us-ascii?Q?aSAqlnWQQXYR6mHMTH6I+0Isz7XlVAFq3aYd8ha2yIKNKrrEuH1X2mnA+zBR?=
 =?us-ascii?Q?mip+ZNs7Y7AY3fsKlF6uYVHNz/WdbBKBciipJqpSi8N1Et1PpoZocY+aAGqL?=
 =?us-ascii?Q?KQiYVLxBmdK2L5zMrEJkqsS37e5rEdcV0bsECQmXh2JxjJG+I91Or/+M0pp8?=
 =?us-ascii?Q?48NxIa4Fza91su3ueM13GwIXIuWvWYiiYo5H7ldsLCVw88QfC4hWR06FpE6h?=
 =?us-ascii?Q?LuizfhlvBiRjzd57g8LkiCnLYIVT0mu6Dt347xyqtAT8Rxtr+QpC9BOMh22h?=
 =?us-ascii?Q?xCdFBcBXERO6J9JUW9ZC0eC0Le2BWDbOvZIPsqpsMBR7nbCRNlLsBG064wAZ?=
 =?us-ascii?Q?6UG2qL5UPBwvVc3PPzlMApo4sw79kjSrRXwIbiLzZi/TcHTn7n2YGs4r44yx?=
 =?us-ascii?Q?2+J33X9U8M1fadivQC44HE18RnxG4Iejwe2ksWZYxFMNKGL6a4Z4kcvMZwIe?=
 =?us-ascii?Q?iCzcecbFvFS/uYUwqE9bs1Iu9z62hZ0ER6TPaJIB6HYvP5POBXwg2BFrPSr6?=
 =?us-ascii?Q?5N+NI00uQ5GofuCvnyI73cVa5vl52L+qOlkCE1gt6DEMySZQ5ZbHfv2qcL+f?=
 =?us-ascii?Q?aAjbkxe51uUuKHtQpNgsYfBoVNi0IHD0SeXJsL54W8qQthqliwFjF5AtJL22?=
 =?us-ascii?Q?1x8oMFvOjfrVblDkaHUXzsFfWipD91/3dkZa8udBcfp/qv1ClS+El9lt18XR?=
 =?us-ascii?Q?BkrBrQghELPisRdox+z0T9s+DuVM462XLC5yBhQ7l96mFxxYySww52Dq9bsJ?=
 =?us-ascii?Q?X4TqnyG98fghj0RDoFba5J0juuW9T1rqEmKu3WavdrHOU6KlLDnD2MIUfuoX?=
 =?us-ascii?Q?k8ZstzeL7hlKiaxdFvr70t9w5P7Q9A04KrlA139u4OSm6fVlGWShPzRbRHy3?=
 =?us-ascii?Q?DgW2nEI55Pgup3p1GP1JiRcJxOmPmU078VscUuSuqDuR1y/QUyFpOuIclq5g?=
 =?us-ascii?Q?MMqwzX/d64A3IcbRb+d9dv47KVbNWBKPPuYph2WYN56KwSXmG4E/jOVyzN6o?=
 =?us-ascii?Q?V4ESYKPmyGCTQShSrOQ8w8Mm8gpEMIYnHbaRMCbdC565a+PTTg4h9PJcso/N?=
 =?us-ascii?Q?N/tiNIB7e9ZOyRRDMoM1QCDaR6A1nXfKrwQ5j/2QkzOogQW7j4C9pzYaVnuW?=
 =?us-ascii?Q?zONCFUBiomziVP9P9UAc8qhP6S8xs5VglMOCGH8hpAGZ0gitV/DJwgntZS0S?=
 =?us-ascii?Q?C57uJdbqUA9rqLk4NSJnQF1kjWlXMdnuxHJWkB0cchF1tDEHLc3CxZiK3xAV?=
 =?us-ascii?Q?RAwXKipB7X8krxuyRL7ECQKbhTCaMalWw1LJU4GGpnDiscG4lwX8MGO8v3NN?=
 =?us-ascii?Q?3UXRKNTmbK0ApV8rs3ctAOSl5/ID1HI2TaAbNC7c1yypqt1OY6CZJmB6gg9b?=
 =?us-ascii?Q?gMSKcFX0orjuaV6wjpUSpFVIWXBsBy/zYGVVbTdicSX7mT0yQGXEBC/HHEvw?=
 =?us-ascii?Q?OtbFvOXvJfECcpm6oXwIRwA7kcFRj4hXU5900iMxAo+gQ7IMcIjf8XCBJkYU?=
 =?us-ascii?Q?/i1L0o4BnlZx9bydNK826IZU70OwEJr6Ihyz/n3XK5tOBNsM98YsOnwXGtMb?=
 =?us-ascii?Q?6+HHUp6EHMO5VFXU1Je0yKMfxkGEzcknW8fhv8NK6wkQDE4eI9uSbD5cjd1j?=
 =?us-ascii?Q?77OgTaaARObLlvtNejKx9W27cXhNmKhK+jZPTF1W7sSVd4nPTH9+zxYQJnfl?=
 =?us-ascii?Q?FNw5fqLp0Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: P72MdfDyTTXzfAVfxBjSvbjZ9MaPE7WHH9FLxvTAtvLpMbUEMRZ+FyhL/Ts/rdpO1eJoQQFsKCPxAIrwt7i+bfuTY4qX/b1bPEJkc/+S7PAx6C92CwoynFJo9TZpytTN2E5BKmOxx2XhGmMTKM6Aq+xcydgWjmQzYOsWvv7ZF6KeeFCmQhH5wwr6dNBJZmu5vs9lzGUw0Fli3Al6am31dTDmY+w274zZxRGTdl+HZLmYR9qj1i+oap+suJiGal2kEOutggA2BCgv5XhgUTGdeAtuZNn6mGH4ey/FKvpo6iR24nP1EljOOPPko2W2oEoHBqLajUkE0E0tTEar6y9YxQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB046149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59fe9354-973e-4ca7-64c1-08df3039757f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 12:39:05.1918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nVjl18uH5blnRAhUIJWFUsFsVbPFv5825Qz5fQRGikpTm0AtAp6Grom8+YpF2SnXTYRivJpooJsprUgfsmZspbMbkjNwUgsWn0DA6qWrQYo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8DE294191
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



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Thursday, October 22, 2026 8:35 AM
>To: Ruhl, Michael J <michael.j.ruhl@intel.com>
>Cc: igt-dev@lists.freedesktop.org; Scarbrough, Frank
><frank.scarbrough@intel.com>; david.e.box@linux.intel.com
>Subject: Re: [PATCH i-g-t 2/2] test/intel/xe_pmt: Support CRI PMT
>
>On Wed, Oct 14, 2026 at 09:05:17AM -0700, Michael J. Ruhl wrote:
>> Crescent Island (CRI) devices have the Platform Monitoring
>> Technology (PMT) support for the telemetry and crashlog
>> (type 1/version2) functions.
>>
>> Add test support for the device.
>>
>> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>> ---
>>  tests/intel/xe_pmt.c | 393 ++++++++++++++++++++++++++++---------------
>>  1 file changed, 262 insertions(+), 131 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmt.c b/tests/intel/xe_pmt.c
>> index 35b285d8b..ebd3fe3f6 100644
>> --- a/tests/intel/xe_pmt.c
>> +++ b/tests/intel/xe_pmt.c
>> @@ -8,6 +8,7 @@
>>  #include <fcntl.h>
>>  #include <limits.h>
>>  #include <string.h>
>> +#include <linux/limits.h>
>>
>>  #include "igt.h"
>>  #include "igt_sysfs.h"
>> @@ -25,9 +26,9 @@
>>   * Description: Verify that the available PMT files (crashlog and telem=
etry)
>>   *   are created, are accessable, and respond as per design.
>>   *
>> - * SUBTEST: pmt-bmg-all
>> + * SUBTEST: pmt-api
>>   * Description:
>> - *   Exercise the BMG PMT feature
>> + *   Verify that the correct PMT sysfs file exist and verify access
>>   *
>>   */
>>
>> @@ -40,16 +41,34 @@ IGT_TEST_DESCRIPTION("Verify Platform Monitoring
>Technology (PMT) files operatio
>>  #define TELEMETRY_DIR "telem"
>>
>>  /* itemize the available instances for the specific device */
>> -enum bmg_crashlog_instances {
>> -	bmg_crashlog_punit =3D 0,
>> -	bmg_crashlog_oobmsm,
>> -	bmg_crashlog_max
>> +enum pmt_device {
>> +	PMT_DEVICE_BMG,
>> +	PMT_DEVICE_CRI,
>>  };
>>
>> -enum bmg_telemety_instances {
>> -	bmg_telemetry_punit =3D 0,
>> -	bmg_telemetry_oobmsm,
>> -	bmg_telemetry_max
>> +struct pmt_device_info {
>> +	uint32_t max_crashlog;
>> +	uint32_t max_telem;
>> +};
>> +
>> +#define BMG_CRASHLOG_MAX	(2)
>> +#define BMG_TELEM_MAX		(2)
>> +
>> +#define CRI_CRASHLOG_MAX	(2)
>> +#define CRI_TELEM_MAX		(3)
>> +
>> +#define CRASHLOG_MAX		CRI_CRASHLOG_MAX
>> +#define TELEM_MAX		CRI_TELEM_MAX
>> +
>> +struct pmt_device_info device_info[] =3D {
>> +	[PMT_DEVICE_BMG] =3D {
>> +		.max_crashlog =3D BMG_CRASHLOG_MAX,
>> +		.max_telem =3D BMG_TELEM_MAX,
>> +	},
>> +	[PMT_DEVICE_CRI] =3D {
>> +		.max_crashlog =3D CRI_CRASHLOG_MAX,
>> +		.max_telem =3D CRI_TELEM_MAX,
>> +	},
>>  };
>>
>>  static char dev_path[PATH_MAX];
>> @@ -59,13 +78,18 @@ static char work_path[PATH_MAX * 2];
>>   * In most case there should be a single instance of the crashlog and
>telemetry
>>   * directories. If DVSEC entries are not contiguous the structure will =
be
>different,
>>   * and the code will need to reflect the structure.
>> + * vsec directory string size is sizeof(xxx_DIR) + idx.  For instance:
>> + *    intel_vsec.crashlog.3
>> + *    intel_vsec.telemetry.23
>>   */
>> -static char crashlog_vsec_dir[32];
>> -static char telemetry_vsec_dir[32];
>> +#define MAX_VSEC_DIR (32)
>> +
>> +static char crashlog_vsec_dir[MAX_VSEC_DIR];
>> +static char telemetry_vsec_dir[MAX_VSEC_DIR];
>>
>>  /* This needs to be specific for each supported device */
>> -static char crashlog_dir[bmg_crashlog_max][32];
>> -static char telemetry_dir[bmg_telemetry_max][32];
>> +static char crashlog_dir[CRASHLOG_MAX][MAX_VSEC_DIR];
>> +static char telemetry_dir[TELEM_MAX][MAX_VSEC_DIR];
>>
>>  /* telemetry file names */
>>  static const char *telem =3D "telem";
>> @@ -90,7 +114,7 @@ struct crashlog_v2_info {
>>  	int rearm_fd;
>>  	int trigger_fd;
>>  	u_int32_t guid;
>> -} bmg_info[bmg_crashlog_max];
>> +} crashlog_info[CRASHLOG_MAX];
>>
>>  #define DEV_PATH_LEN 80
>>
>> @@ -121,17 +145,22 @@ static char *device_sysfs_path(int fd, char *path)
>>  /*
>>   * Verify the PMT directory structure
>>   *
>> - * BMG PMT directory structure:
>> + * BMG/CRI PMT directory structure:
>>   *   device/intel_vsec.crashlog.x/intel_pmt/crashlog<a,b>
>>   *   device/intel_vsec.telemetry.x/intel_pmt/telemetry<c,d>
>>   *
>>   * Note: different platforms could have a different pattern
>>   */
>> -static void test_pmt_directories(int dev_fd)
>> +static void test_pmt_directories(int dev_fd, enum pmt_device pmt_dev)
>>  {
>>  	struct dirent *ent;
>> -	int index;
>> +	uint32_t index;
>>  	DIR *dir;
>> +	uint32_t max_crashlog;
>> +	uint32_t max_telem;
>> +
>> +	max_crashlog =3D device_info[pmt_dev].max_crashlog;
>> +	max_telem =3D device_info[pmt_dev].max_telem;
>>
>>  	igt_assert(device_sysfs_path(dev_fd, dev_path));
>>
>> @@ -161,7 +190,7 @@ static void test_pmt_directories(int dev_fd)
>>  	/* find the crashlog<x> directory instances */
>>  	while ((ent =3D readdir(dir)) !=3D NULL) {
>>  		if (strncmp(CRASHLOG_DIR, ent->d_name,
>sizeof(CRASHLOG_DIR) - 1) =3D=3D 0) {
>> -			if (index < bmg_crashlog_max)
>> +			if (index < max_crashlog)
>>  				strcpy(crashlog_dir[index], ent->d_name);
>>  			index++;
>>  		}
>> @@ -169,8 +198,9 @@ static void test_pmt_directories(int dev_fd)
>>
>>  	closedir(dir);
>>
>> -	igt_assert_f(index =3D=3D bmg_crashlog_max, "too many crashlog entries
>%d\n", index);
>> -	for (int i =3D 0; i < ARRAY_SIZE(crashlog_dir); i++)
>> +	igt_assert_f(index =3D=3D max_crashlog, "unexpected crashlog entries: =
%d
>vs expected: %d\n",
>> +		     index, max_crashlog);
>> +	for (int i =3D 0; i < max_crashlog && i < ARRAY_SIZE(crashlog_dir); i+=
+)
>>  		igt_assert_f(strlen(crashlog_dir[i]), "missing crashlog[%d]
>directory\n", i);
>>
>>  	/* verify telemetry directory structure */
>> @@ -182,7 +212,7 @@ static void test_pmt_directories(int dev_fd)
>>  	index =3D 0;
>>  	while ((ent =3D readdir(dir)) !=3D NULL) {
>>  		if (strncmp(TELEMETRY_DIR, ent->d_name,
>sizeof(TELEMETRY_DIR) - 1) =3D=3D 0) {
>> -			if (index < bmg_telemetry_max)
>> +			if (index < max_telem)
>>  				strcpy(telemetry_dir[index], ent->d_name);
>>  			index++;
>>  		}
>> @@ -190,8 +220,9 @@ static void test_pmt_directories(int dev_fd)
>>
>>  	closedir(dir);
>>
>> -	igt_assert_f(index =3D=3D bmg_telemetry_max, "too many telemetry entri=
es
>%d\n", index);
>> -	for (int i =3D 0; i < ARRAY_SIZE(telemetry_dir); i++)
>> +	igt_assert_f(index =3D=3D max_telem, "unexpected telemetry entries: %d=
  vs
>expected: %d\n",
>> +		     index, max_telem);
>> +	for (int i =3D 0; i < max_telem && i < ARRAY_SIZE(telemetry_dir); i++)
>>  		igt_assert_f(strlen(telemetry_dir[i]), "missing telemetry[%d]
>directory\n", i);
>>
>>  }
>> @@ -227,43 +258,80 @@ static void open_pmt_file(const char *path, const
>char *file, int *fd, int flags
>>  /*
>>   * verify that the expected telemetry file(s) are in place
>>   */
>> -static void test_pmt_telemetry_files(int dev_fd)
>> +static void test_pmt_telemetry_files(int dev_fd, enum pmt_device pmt_de=
v)
>>  {
>>  	int i;
>>
>> -	for (i =3D 0; i < bmg_telemetry_max; i++) {
>> +	for (i =3D 0; i < device_info[pmt_dev].max_telem; i++) {
>>  		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>>  			"intel_pmt", telemetry_dir[i]);
>>  		find_pmt_file(work_path, telem);
>>  	}
>>  }
>>
>> +/*
>> + * verify that a read will be successful
>> + */
>> +static void test_pmt_telemetry_read_data(int dev_fd, enum pmt_device
>pmt_dev)
>> +{
>> +	char buf[64] =3D {};
>> +	u_int32_t *val;
>> +	u_int32_t guid;
>> +	int telem_fd;
>> +	int guid_fd;
>> +	int ret;
>> +	int len;
>> +	int i;
>> +
>> +	for (i =3D 0; i < device_info[pmt_dev].max_telem; i++) {
>> +		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>telemetry_vsec_dir,
>> +			"intel_pmt", telemetry_dir[i]);
>> +		open_pmt_file(work_path, telem, &telem_fd, O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid, &guid_fd, O_RDONLY);
>> +
>> +		ret =3D pread(guid_fd, buf, sizeof(buf), 0);
>> +		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> +		guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(guid > 0, "failed to get guid for device %d\n", i);
>> +
>> +		len =3D read(telem_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read telemetry
>data\n", guid);
>> +
>> +		val =3D (u_int32_t *)buf;
>> +		igt_assert_f(*val !=3D 0xffffffff, "0x%x: invalid telemetry data
>value: : 0x%x\n",
>> +			     guid, *val);
>> +
>> +		close(telem_fd);
>> +		close(guid_fd);
>> +	}
>> +}
>> +
>>  /*
>>   * verify that the expected crashlog files are in place
>>   */
>> -static void test_pmt_crashlog_files(int dev_fd)
>> +static void test_pmt_crashlog_files(int dev_fd, enum pmt_device pmt_dev=
)
>>  {
>>  	char buf[64] =3D {};
>>  	int ret;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>>  		sprintf(work_path, "%s/%s/%s/%s", dev_path,
>crashlog_vsec_dir, "intel_pmt",
>>  			crashlog_dir[i]);
>>
>> -		open_pmt_file(work_path, clear, &bmg_info[i].clear_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, consumed,
>&bmg_info[i].consumed_fd, O_RDWR);
>> -		open_pmt_file(work_path, crashlog, &bmg_info[i].crashlog_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, enable, &bmg_info[i].enable_fd,
>O_RDWR);
>> -		open_pmt_file(work_path, error, &bmg_info[i].error_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, dev_guid, &bmg_info[i].guid_fd,
>O_RDONLY);
>> -		open_pmt_file(work_path, rearm, &bmg_info[i].rearm_fd,
>O_RDWR);
>> -		open_pmt_file(work_path, trigger, &bmg_info[i].trigger_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, clear, &crashlog_info[i].clear_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, consumed,
>&crashlog_info[i].consumed_fd, O_RDWR);
>> +		open_pmt_file(work_path, crashlog,
>&crashlog_info[i].crashlog_fd, O_RDONLY);
>> +		open_pmt_file(work_path, enable,
>&crashlog_info[i].enable_fd, O_RDWR);
>> +		open_pmt_file(work_path, error, &crashlog_info[i].error_fd,
>O_RDONLY);
>> +		open_pmt_file(work_path, dev_guid,
>&crashlog_info[i].guid_fd, O_RDONLY);
>> +		open_pmt_file(work_path, rearm, &crashlog_info[i].rearm_fd,
>O_RDWR);
>> +		open_pmt_file(work_path, trigger, &crashlog_info[i].trigger_fd,
>O_RDWR);
>>
>> -		ret =3D pread(bmg_info[i].guid_fd, buf, sizeof(buf), 0);
>> +		ret =3D pread(crashlog_info[i].guid_fd, buf, sizeof(buf), 0);
>>  		igt_assert_f(ret > 0, "failed to read guid for device %d\n", i);
>> -		bmg_info[i].guid =3D strtol(buf, NULL, 16);
>> -		igt_assert_f(bmg_info[i].guid > 0, "failed to set guid for device
>%d\n", i);
>> +		crashlog_info[i].guid =3D strtol(buf, NULL, 16);
>> +		igt_assert_f(crashlog_info[i].guid > 0, "failed to set guid for
>device %d\n", i);
>>  	}
>>  }
>>
>> @@ -299,15 +367,15 @@ static bool verify_msg(int fd, const char *msg,
>const char *file) {
>>  /*
>>   * Set enable enable/disable bit and verify usage
>>   */
>> -static void test_pmt_crashlog_enable(int dev_fd)
>> +static void test_pmt_crashlog_enable(int dev_fd, enum pmt_device
>pmt_dev)
>>  {
>>  	u_int32_t guid;
>>  	int fd;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		fd =3D bmg_info[i].enable_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		fd =3D crashlog_info[i].enable_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>>  		/* force enable so we are in a known state */
>>  		igt_assert_f(send_msg(fd, ENABLE_MSG, enable), "0x%x: send
>enable\n", guid);
>> @@ -325,188 +393,251 @@ static void test_pmt_crashlog_enable(int
>dev_fd)
>>  }
>>
>>  /*
>> - * Test the clear crashlog bit. After setting the crashlog data buffer =
should be
>> - * set to 0xdeadbeef.
>> - * BMG supports writing "1" to the clear file, but writing "0" (DISABLE=
_MSG)
>to trigger
>> - * file is the "standard" usage, so test that usage.
>> - * This bit cannot be cleared by software (i.e. reboot required).
>> + * The error bit is set when a crashlog fails in HW.  It is read only s=
o only
>> + * need to verify that it is "0".
>> + */
>> +static void test_pmt_crashlog_error(int dev_fd, enum pmt_device pmt_dev=
)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		guid =3D crashlog_info[i].guid;
>> +		igt_assert_f(verify_msg(crashlog_info[i].error_fd,
>DISABLE_MSG, error),
>> +			     "0x%x: error clear\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * The rearm bit is set at cold boot.  It cannot be reset unless are re=
al crashlog
>> + * occurs (i.e. setting trigger will not change its value).  Verify tha=
t it is "1".
>>   */
>> -static void test_pmt_crashlog_clear(int dev_fd)
>> +static void test_pmt_crashlog_rearm(int dev_fd, size_t pmt_dev)
>> +{
>> +	uint32_t guid;
>> +	int i;
>> +
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		guid =3D crashlog_info[i].guid;
>> +		igt_assert_f(verify_msg(crashlog_info[i].rearm_fd,
>ENABLE_MSG, rearm),
>> +			     "0x%x: rearm set\n", guid);
>> +	}
>> +}
>> +
>> +/*
>> + * Verify the crashlog data is in the initialized state
>> + * 0xdeadbeef BMG PUINT/OOBMSM default, CRI PUNIT default
>> + * 0xba0b6afe CRI OOBMSM default
>> + */
>> +static void test_pmt_crashlog_inited(int dev_fd, enum pmt_device pmt_de=
v)
>>  {
>>  	char buf[64] =3D {};
>>  	u_int32_t guid;
>>  	int crashlog_fd;
>> -	int trigger_fd;
>>  	int clear_fd;
>>  	int *val;
>>  	int len;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		clear_fd =3D bmg_info[i].clear_fd;
>> -		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> -		trigger_fd =3D bmg_info[i].trigger_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		clear_fd =3D crashlog_info[i].clear_fd;
>> +		crashlog_fd =3D crashlog_info[i].crashlog_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>>  		/* make sure the bit is clear */
>>  		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>>
>> -		/* set the clear bit (0 -> trigger)*/
>> -		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: send enable\n", guid);
>> -
>> -		/* make sure the bit is set.  sleep() to allow HW to set the bit */
>> -		sleep(1);
>> -		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x:
>clear set\n", guid);
>> -
>>  		len =3D read(crashlog_fd, buf, sizeof(buf));
>>  		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>>
>>  		val =3D (int *)buf;
>> -		igt_assert_f(*val =3D=3D 0xdeadbeef, "0x%x: invalid clear data value:
>: 0x%x", guid, *val);
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef || *val =3D=3D 0xba0b6afe,
>> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
>>  	}
>>  }
>>
>> +//#define PMT_CRASHLOG_TRIGGER_ENABLE 1
>> +#if PMT_CRASHLOG_TRIGGER_ENABLE
>
>oh, I just noticed you remove it here... but perhaps we can do something m=
ore
>interactive here...
>
>and also, let's move this part here to the first patch to make it bisectab=
le...

Yeah, that makes sense.  I will update.

I am open to "something more interactive"... do you have a suggestion?

M

>>  /*
>> - * After a crashlog has been "consumed" (read), setting this bit can be=
 done.
>> - * Verify that it is set correctly.
>> + * Triggering a Crashlog requires a power cycle to return the device to=
 a
>usable
>> + * state.
>> + * This is very disruptive and doesn't necessarily verify much more tha=
n the
>> + * current set of tests.
>> + * Commentting out the trigger, consumed, clear path for "normal" testi=
ng.
>> + * Compile flag so these tests can be done expclity.
>>   */
>> -static void test_pmt_crashlog_consumed(int dev_fd)
>> +
>> +/*
>> + * Set the manual trigger bit and make sure the data is not 0xdeadbeef
>> + */
>> +static void test_pmt_crashlog_trigger(int dev_fd, size_t pmt_dev)
>>  {
>> -	uint32_t guid;
>> -	int fd;
>> +	char buf[64] =3D {};
>> +	u_int32_t *val;
>> +	int crashlog_fd;
>> +	int trigger_fd;
>> +	u_int32_t guid;
>> +	int len;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		fd =3D bmg_info[i].consumed_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		crashlog_fd =3D crashlog_info[i].crashlog_fd;
>> +		trigger_fd =3D crashlog_info[i].trigger_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>> -		/* check, set, verify */
>> -		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x:
>consumed clear\n", guid);
>> -		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x:
>set consumed\n", guid);
>> -		/* sleep(1) to allow HW to set the bit */
>> +		/* make sure the bit is clear */
>> +		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: trigger clear\n",
>> +			     guid);
>> +		/* set the trigger bit (1 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: set trigger\n", guid);
>> +
>> +		/* sleep to let the HW do its thing */
>>  		sleep(1);
>> -		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x:
>verify consumed\n", guid);
>> -	}
>> -}
>>
>> -/*
>> - * The error bit is set when a crashlog fails in HW.  It is read only s=
o only
>> - * need to verify that it is "0".
>> - */
>> -static void test_pmt_crashlog_error(int dev_fd)
>> -{
>> -	uint32_t guid;
>> -	int i;
>> +		/* make sure the bit is set */
>> +		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: trigger not set\n",
>> +			     guid);
>> +
>> +		len =3D read(crashlog_fd, buf, sizeof(buf));
>> +		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		guid =3D bmg_info[i].guid;
>> -		igt_assert_f(verify_msg(bmg_info[i].error_fd, DISABLE_MSG,
>error), "0x%x: error clear\n", guid);
>> +		val =3D (u_int32_t *)buf;
>> +
>> +		igt_assert_f(*val !=3D 0xdeadbeef && *val !=3D 0xba0b6afe,
>> +			     "0x%x: invalid trigger value: : 0x%x\n", guid, *val);
>>  	}
>>  }
>>
>>  /*
>> - * The rearm bit is set at cold boot.  It cannot be reset unless are re=
al crashlog
>> - * occurs (i.e. setting trigger will not change its value).  Verify tha=
t it is "1".
>> + * After a crashlog has been "consumed" (read), setting this bit can be=
 done.
>> + * Verify that it is set correctly.
>>   */
>> -static void test_pmt_crashlog_rearm(int dev_fd)
>> +static void test_pmt_crashlog_consumed(int dev_fd, enum pmt_device
>pmt_dev)
>>  {
>>  	uint32_t guid;
>> +	int fd;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		guid =3D bmg_info[i].guid;
>> -		igt_assert_f(verify_msg(bmg_info[i].rearm_fd, ENABLE_MSG,
>rearm), "0x%x: rearm set\n", guid);
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		fd =3D crashlog_info[i].consumed_fd;
>> +		guid =3D crashlog_info[i].guid;
>> +
>> +		/* check, set, verify */
>> +		igt_assert_f(verify_msg(fd, DISABLE_MSG, consumed), "0x%x:
>consumed clear\n", guid);
>> +		igt_assert_f(send_msg(fd, ENABLE_MSG, consumed), "0x%x:
>set consumed\n", guid);
>> +		/* sleep(1) to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(fd, ENABLE_MSG, consumed), "0x%x:
>verify consumed\n", guid);
>>  	}
>>  }
>>
>>  /*
>> - * Set the manual trigger bit and make sure the data is not 0xdeadbeef
>> + * Test the clear crashlog bit. After setting the crashlog data buffer =
should be
>> + * set to 0xdeadbeef or 0xba0b6afe.
>> + * BMG supports writing "1" to the clear file, but writing "0" (DISABLE=
_MSG)
>to trigger
>> + * file is the "standard" usage, so test that usage.
>> + * This bit cannot be cleared by software (i.e. reboot required).
>>   */
>> -static void test_pmt_crashlog_trigger(int dev_fd)
>> +static void test_pmt_crashlog_clear(int dev_fd, enum pmt_device pmt_dev=
)
>>  {
>>  	char buf[64] =3D {};
>> -	u_int32_t *val;
>> +	u_int32_t guid;
>>  	int crashlog_fd;
>>  	int trigger_fd;
>> -	u_int32_t guid;
>> +	int clear_fd;
>> +	int *val;
>>  	int len;
>>  	int i;
>>
>> -	for (i =3D 0; i < ARRAY_SIZE(bmg_info); i++) {
>> -		crashlog_fd =3D bmg_info[i].crashlog_fd;
>> -		trigger_fd =3D bmg_info[i].trigger_fd;
>> -		guid =3D bmg_info[i].guid;
>> +	for (i =3D 0; i < device_info[pmt_dev].max_crashlog; i++) {
>> +		clear_fd =3D crashlog_info[i].clear_fd;
>> +		crashlog_fd =3D crashlog_info[i].crashlog_fd;
>> +		trigger_fd =3D crashlog_info[i].trigger_fd;
>> +		guid =3D crashlog_info[i].guid;
>>
>>  		/* make sure the bit is clear */
>> -		igt_assert_f(verify_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: trigger clear\n",
>> -			     guid);
>> -		/* set the trigger bit (1 -> trigger)*/
>> -		igt_assert_f(send_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: set trigger\n", guid);
>> +		igt_assert_f(verify_msg(clear_fd, DISABLE_MSG, clear), "0x%x:
>verify clear\n", guid);
>>
>> -		/* sleep to let the HW do its thing */
>> -		sleep(1);
>> +		/* set the clear bit (0 -> trigger)*/
>> +		igt_assert_f(send_msg(trigger_fd, DISABLE_MSG, trigger),
>"0x%x: send enable\n", guid);
>>
>> -		/* make sure the bit is set */
>> -		igt_assert_f(verify_msg(trigger_fd, ENABLE_MSG, trigger),
>"0x%x: trigger not set\n",
>> -			     guid);
>> +		/* make sure the bit is set.  sleep() to allow HW to set the bit */
>> +		sleep(1);
>> +		igt_assert_f(verify_msg(clear_fd, ENABLE_MSG, clear), "0x%x:
>clear set\n", guid);
>>
>>  		len =3D read(crashlog_fd, buf, sizeof(buf));
>>  		igt_assert_f(len =3D=3D sizeof(buf), "0x%x: failed to read crashlog
>data\n", guid);
>>
>> -		val =3D (u_int32_t *)buf;
>> -
>> -		igt_assert_f(*val !=3D 0xdeadbeef, "0x%x: invalid trigger value: :
>0x%x", guid, *val);
>> +		val =3D (int *)buf;
>> +		igt_assert_f(*val =3D=3D 0xdeadbeef || *val =3D=3D 0xba0b6afe,
>> +			     "0x%x: invalid clear data value: : 0x%x\n", guid, *val);
>>  	}
>>  }
>> +#endif
>>
>>  /**
>> - * SUBTEST: pmt-bmg-all
>> + * SUBTEST: pmt-api
>>   * Description:
>>   *   Because of how the Crashlog Instances behave, these tests are orde=
red.
>Do not use them
>>   *   individually unless you understand the underlying HW behavior.  Be=
cause
>of this behavior,
>> - *   all of the test will be done in order in one step.
>> + *   all of the test will be done in order in one sub-test.
>> + *
>> + *   Crashlog will cause the GPU to be in an un-useful state.  Reseting=
 to
>recover
>> + *   is not yet fully defined.
>>   *   NOTE:
>> + *     o PMT file info is accumulated from successful tests and is used=
 in
>sequence
>>   *     o Testing MUST be done after a cold reset
>>   *     o Once crashlog is triggered the device behavior is undefined an=
d
>requires a cold reset
>>   *
>>   *  Test category: functionality test
>>   */
>> -static void test_pmt_bmg(int fd)
>> +static void test_pmt_api(int fd, enum pmt_device pmt_dev)
>>  {
>> -	test_pmt_directories(fd);
>> -	test_pmt_telemetry_files(fd);
>> -	test_pmt_crashlog_files(fd);
>> -	test_pmt_crashlog_error(fd);
>> -	test_pmt_crashlog_enable(fd);
>> -	test_pmt_crashlog_rearm(fd);
>> -	test_pmt_crashlog_trigger(fd);
>> -	test_pmt_crashlog_consumed(fd);
>> -	test_pmt_crashlog_clear(fd);
>> +	test_pmt_directories(fd, pmt_dev);
>> +
>> +	test_pmt_telemetry_files(fd, pmt_dev);
>> +	test_pmt_telemetry_read_data(fd, pmt_dev);
>> +
>> +	test_pmt_crashlog_files(fd, pmt_dev);
>> +	test_pmt_crashlog_error(fd, pmt_dev);
>> +	test_pmt_crashlog_enable(fd, pmt_dev);
>> +	test_pmt_crashlog_rearm(fd, pmt_dev);
>> +	test_pmt_crashlog_inited(fd, pmt_dev);
>> +
>> +#if PMT_CRASHLOG_TRIGGER_ENABLE
>> +	test_pmt_crashlog_trigger(fd, pmt_dev);
>> +	test_pmt_crashlog_consumed(fd, pmt_dev);
>> +	test_pmt_crashlog_clear(fd, pmt_dev);
>> +#endif
>>  }
>>
>>  int igt_main()
>>  {
>>  	const struct {
>>  		const char *name;
>> -		void (*func)(int);
>> +		void (*func)(int, enum pmt_device);
>>  	} funcs[] =3D {
>> -		{ "pmt-bmg-all", test_pmt_bmg },
>> +		{ "pmt-api", test_pmt_api },
>>  		{ }
>>  	}, *f;
>>  	int dev_fd;
>> +	enum pmt_device pmt_dev;
>>
>>  	igt_fixture() {
>>  		uint16_t dev_id;
>>
>>  		dev_fd =3D drm_open_driver(DRIVER_XE);
>>  		dev_id =3D intel_get_drm_devid(dev_fd);
>> -		igt_require_f(IS_BATTLEMAGE(dev_id), "PMT supported on
>BMG GPU\n");
>> +		igt_require_f(IS_BATTLEMAGE(dev_id) ||
>IS_CRESCENTISLAND(dev_id),
>> +			      "PMT supported on BMG or CRI GPUs\n");
>> +
>> +		pmt_dev =3D IS_BATTLEMAGE(dev_id) ? PMT_DEVICE_BMG :
>PMT_DEVICE_CRI;
>>  	}
>>
>>  	igt_describe("PMT access and API testing");
>>  	for (f =3D funcs; f->name; f++) {
>>  		igt_subtest_f("%s", f->name)
>> -			f->func(dev_fd);
>> +			f->func(dev_fd, pmt_dev);
>>  	}
>>
>>  	igt_fixture()
>> --
>> 2.43.0
>>
