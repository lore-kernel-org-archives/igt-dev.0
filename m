Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8FECCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 10:27:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C8F10E1E6;
	Wed,  8 Oct 2025 10:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mcxZId6h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC8810E1E6
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759919222; x=1791455222;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lJhtwKU/emMiJu6eFcvtfvFRUX3KljQiyzLws1AGweI=;
 b=mcxZId6hKGKMTbg7gBidn1yh3Mzois/sBblhYBzskYN9qprPyXOIf68a
 5dkVJA6Pvxu00FQNAexwcg/RrMElstfhV4036z9/ROPW/9d761UGiyYlW
 IQI3tS0ttskjKpHQ3V4M4BuoJBbZi0MU42Y0WoiKNbhS/0tRWDIXGWrlt
 x3Npjij0RfB6jXAdOP5ZCR+wgs3bP1xN2jn74CGnwe+ifFkVg7C5aMwBF
 WbDoMYFG8YJiIqPefVfo4XokT4jKY7LQnIf7bLrDA9x3gbjQV4WZkGIaA
 CjxvEi84vejRSAQ8KF3zvJf+skuIyoAIHEH/gtuRTfUVCrhMNdE4P2t91 A==;
X-CSE-ConnectionGUID: O8n9Uo3ZTOCTG98PqISXtA==
X-CSE-MsgGUID: QTTB4qudS3aX9tqKvWMbRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="84726362"
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="84726362"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 03:27:01 -0700
X-CSE-ConnectionGUID: 9hGbl8fERNS19XX9h3b0Og==
X-CSE-MsgGUID: J7Vz0BgWQfyX/rgc7oFfyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,323,1751266800"; d="scan'208";a="204127789"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 03:27:01 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 03:27:00 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 03:27:00 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 03:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L19L+E6/D4LEpDxpPjRBzxxTF3E6kw8SWiZFZk2uuHVZdfsQho2oG4ORfIPbYhWZjrL0coHhRdbLi7FFnI1ZEIX6kHqxkIVv3ra/Rm8b4DO14buz1gAUR5ho1zZVPARwkZPc0Fs3/+3QAkbi+J48xaDYvO9dc2dnXEWuUGEFq1ycOyiM7KxaVP7OY0z2b3etKgFB6nOei9euMiyrLeHC/q9eS7Az4bmwRJS6ORvs/uf5/IkJfVe/FWujeiast3QrZFvAkyMULN9oZu/uNJ2Er5IbAcameUW6hUHVrhEAnIhobwezmMNIxtn81dz7f1/acGxvU9u/SH0GUt96GR7jwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vP93kaE2eLwEDhNFHYNsP+PGuhXZ5vrSGI2bwlqsGfc=;
 b=JY5r66IfL5NAkXTXu+wgSPU+BTy/X5Q01kd1k9LXpjVc1PR+2eXC5594VUQPuBcPEdHzVcThgoWF61z8I8qHghOW3xdJK+rCmpl8uzc33rm7wI+n3sPculdRbvXCvepo9Y/W6N00M/0eY6w5cWhgO0aYP/IvfIalqeT2kAUvtxXTwTMO8t2l+qzTd5b44rqyBhkaLuq4ykOzqclom4XlMCj3bjGxEfYDROdVloD3O0IzqFGmpH2LeqA5TZbX/2nDPkjJGVMCY8yo2jZz39g2fsex4y53HQse5PdwQzNl6eiwN1VDdmiHyPEFvU2Mwc+CVCxmyxnwZaO8GdrGnLvYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by PH7PR11MB5984.namprd11.prod.outlook.com (2603:10b6:510:1e3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 10:26:53 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%3]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 10:26:53 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix typo
Thread-Topic: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix typo
Thread-Index: AQHcODWOZf8riLhfVUGeYKnfc44DoLS4A1Lg
Date: Wed, 8 Oct 2025 10:26:53 +0000
Message-ID: <PH7PR11MB6053D7E7E6C5EC689AFBB3DEE7E1A@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20251008092530.1537245-1-jeevan.b@intel.com>
In-Reply-To: <20251008092530.1537245-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|PH7PR11MB5984:EE_
x-ms-office365-filtering-correlation-id: 2bc197db-eff7-44a6-5ec6-08de06553377
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TYYRmLPa3aZDU5mw52MDwzBLLlZkJ1QDy1uoPld2My8EzHbgK9Vdq6VUnurg?=
 =?us-ascii?Q?CrIhciewG1xml9P9mmjuqFbonyAAV1zHKeTqzt2hoOa9A0boerhU3BFCLwX0?=
 =?us-ascii?Q?hG693dnsXhSqbiO/OdPMc9YxrAU7kTWgghU49K9SSGkhqd3CRJ12TWE1D/fK?=
 =?us-ascii?Q?vIdDrz5vVPgwwrz1w0j1zgmwvx6DpSMLp2YNBuaZEdkXqRMR/JRwB94lHnNL?=
 =?us-ascii?Q?kOKBDNt4mZQkMjU5vW/7qCyJgn3qpi94LI8y4oCumMAsFIXdzGPhytq2Qcip?=
 =?us-ascii?Q?+pG2aNn9G1EETBHykAyIBmy7UbwTBYm/ZINT1DauM9vflkbpr+gjutmBLAex?=
 =?us-ascii?Q?C250XXkyrrsD0bwchOYzh1Bnz49ko/3MXUnGX3LniOLWv2NuvJIma7TGB/A/?=
 =?us-ascii?Q?bMVXMoKpj9X2bX8G9PRQ0AFaU8qWtopuqtkpHOOapvbXhzTxQQM2pQ9PATs8?=
 =?us-ascii?Q?MZP+Jsgf8V2sLcD+dASmElvJgNafcmX5YStcfU3qIj426zt/j+q3xPqkYlCT?=
 =?us-ascii?Q?501R6KMbxOg85xz3kiZJVT8KFSE/BqlblPrSsGZl+FrOd6WF6kxg908fpWb6?=
 =?us-ascii?Q?oDpEoXU/OdORyM6lZh7s+rI/jNA9/meN51RsvN+a90Liaa70NJDVisre5SM3?=
 =?us-ascii?Q?2MxVR9jAlybuc2fkpqym0t351Lqgo2do6JRyprgQmHsuILolNxrU//ST5wDO?=
 =?us-ascii?Q?I/RZudd+xrOEVWrd1rTPm7mM/AuSGI9XEOIpyMDWVSDQuq46RvxLPOD/vSKz?=
 =?us-ascii?Q?Gxi/GCiaO/1VuTNyKzxrpBvpETGxPbmRCVSsXNxZgN0x/QGcQEMokSUF1HLf?=
 =?us-ascii?Q?sfmQHurC0TtFjEYGStyj5I5z25OxpUYw+F6B8eBecHr7uhXzJuYi1fmoAs/w?=
 =?us-ascii?Q?VOfIaKBC5k91GJ2GZS+Plat6p22QP8vojZU5TdcjpL8eEYqPa0k3ryzAvDSN?=
 =?us-ascii?Q?6ymr24FkTNViR2jtWK70wGTIaEgxjX9fltL31Z7C5B+cvdOqauiF+NmdJjaw?=
 =?us-ascii?Q?CaJXlSakyggbsn4h/zxaWS63tM4KfJ+68x3RdK+K/00w4a7F9K4l5jffNhU0?=
 =?us-ascii?Q?yoiUUG/bmAKVA4VjR83oMvVpt/u/iGGpM45rUaZ/HFrft0cr+CWoHgBGejbN?=
 =?us-ascii?Q?tli3DYgLncBt8BWrg71kE+Bs8Wkw1/+IP2kEj4idAZEKi4ajuWJAQrYcGx+y?=
 =?us-ascii?Q?a9jZLQ9RdVUPsS50cvTcxNoOD9TFRbAGw/R2PQ8Op/GgZfv7GS/okZAPLHX7?=
 =?us-ascii?Q?qXO84zqRQjGxYs2kE4LrrxKDoxjlQLQPOVKho3NMXcXlo0nU9JmK7t4idaRz?=
 =?us-ascii?Q?mQEaM/hJPtH+UANRZQWL19d9iPvpDy31Qp9TVe9KxdjjH9SGKLQ+VwNWKqi6?=
 =?us-ascii?Q?1E7kjJ1YxZLcu85tf+GAZXlAFASJfGbaUgaL44dOLJkfJ24e6/bwgyiE/Ml1?=
 =?us-ascii?Q?rEL01zOXe5eROqIRlFMDcnA5onKa9vPrEVhuhkYlz1WRbGbY2BeGyV7MLUD/?=
 =?us-ascii?Q?9r15ROgC6Pd7bzESr1jMlzsJ34/MQYfchrTa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?maCxTtHySN4y9V/KVqusAS8j1G0FJO5HRsOopR25QcmPUuRwbQZ49XaOjRJ4?=
 =?us-ascii?Q?1o0IPKnckXzRH+MPnK+az2l+oPvZGPpvzwqkhnybEsv5ELrhFHIksatR/+/G?=
 =?us-ascii?Q?1DPiZOvv+4/AnIkpuT5PiZLh2XCV1FCm4EvDIqSTsJTmzMUkVc4vVPLC7qys?=
 =?us-ascii?Q?ODuJdR7MnIEQsyYMK75EAs3ij/lkgU9Oy+gTvc0FAzJ4+EFr0d2JBc4k99w9?=
 =?us-ascii?Q?Hbs/Xdri/RTXSOjgscDLWjYtjWdMNBqV7amAKgdY8XTJFXhCEAfH4ZkGRw44?=
 =?us-ascii?Q?uxmdwaeuaUY49nB9f3v81EhRLdIwX2xVP+8xk0tTISfWeTcN/KhF4oMyyUac?=
 =?us-ascii?Q?P3PxxljhyBMFqkCmLInIbc/iBigEMTAvyBYQ0UhC61Z2ezJjvlRy9jEYI0C3?=
 =?us-ascii?Q?f/7NvR47zSUcHmLyFXPYPGSBNUQSdFjYGwipIb6X3OqdLt2k0pCLioVhokfv?=
 =?us-ascii?Q?tqXCrQucetsuAO+IDST3thliNNZFHtP0MCyDObwSNkYp7Q4PU6OC68B+AF64?=
 =?us-ascii?Q?lFfGh0FKcroNLRw4x5zl3hvXiFVzvOS/qAkNpSlRFmYWR1vSKVUUHZdmwIn/?=
 =?us-ascii?Q?4Sjku4tr+3kcL1JKn+MG3s5irWfBWxy9EXcRX3lmY+VPRQD5opuZfj3BZWKN?=
 =?us-ascii?Q?57ncyqkACtTsaGG25MfPd/+7moHlkHIjQZK5GgdwQNlqnzV0p0w05Z9KGfSR?=
 =?us-ascii?Q?FGEBvnPEARkB21NcyaK63HjJ/+idxq9bqK4Q44yhaTWB0qHbXx1Ulo0iVeZE?=
 =?us-ascii?Q?tJXQN+68wCKWvAiEwBQvVtdpRnyO8d5GOagyCJYDJ/JVZqiEGC+0u+j+5vyr?=
 =?us-ascii?Q?QnDZmqiSoSOwt561YaW2meQPC5uQ58MVNbaxnnVO5UyATXCo26iEiROk/V53?=
 =?us-ascii?Q?RNA9NowULmBjg/L+i1UZTec78A1DUt3wFNNYqdB8qrQtdEDxCVaXHCST+qiU?=
 =?us-ascii?Q?/yDhBCg8iNbTnD3vLatlqUXHs0oxEWXDHIECr4RV9jssFC0sWwhGTL+VnOZ2?=
 =?us-ascii?Q?NO1rfSS/oB4iG6A+I1M5HR4y2kA9pBxWTR7K2r1SjbSVF4sh6ibpB8yv716W?=
 =?us-ascii?Q?SOlwh5CfZi065KsedG4X0e0wzTk+pwGXlBTrbWs8hJ6BGKgs575yf3zx90ew?=
 =?us-ascii?Q?82qEMyj4t3CLkQTH5zi8SDAdZakWNj24MLBj+twtTyS5/6AA+j26FPY4Gsm8?=
 =?us-ascii?Q?oq4oRw0nNqtIIKz/azRTtIvRFnz1vcA94K7JsRPJ0/6uNOyfUY0FTFgcUWw/?=
 =?us-ascii?Q?tWBH+f7xZuL5hFRpuxV6i0A6jZu4wBQbppF8lUIhaqfonF5qIdz5GRdaeAZE?=
 =?us-ascii?Q?l++gGkg+zrl6XO21iyQ72BSrQaU/wlsyNspsHmg8U1N2Iwz8d+yKn67FwV60?=
 =?us-ascii?Q?9T3iHszq4+QSyVfLmYeLxmV4Ffgq9A2+De8MiOLH/iomnsfgyZ8On1EyLfda?=
 =?us-ascii?Q?Lnil6Fi6Mr52CethRGfB5nmOKkhf60Q0WQpCJbMwrwNvYSFaMAX0JUH3hIJP?=
 =?us-ascii?Q?48eEMJfNHQ8eJXDHpEXeYlDXB5+VNRB7bOqRcX7BGjrdLhh/QGZ+jNLnuOKx?=
 =?us-ascii?Q?/9jPkZqlutaN63xCeSm1rB7FxSqlzElZjyZ/euHu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc197db-eff7-44a6-5ec6-08de06553377
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 10:26:53.8513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5YMfBK19zIVC9qnWuVLl248UGiu3aEWgNc8XXVFEk4V6EOL0ARs39w9NYaRmfGCQNnlHH8EJwBQBhlj8flY/5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5984
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

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: Wednesday, October 8, 2025 2:56 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; B, Jeevan
> <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Fix typo
>=20
> fix typo : %s/offscren/offscreen
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
LGTM.

Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_frontbuffer_tracking.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/tests/intel/kms_frontbuffer_tracking.c
> b/tests/intel/kms_frontbuffer_tracking.c
> index a29da1d43..03428b373 100644
> --- a/tests/intel/kms_frontbuffer_tracking.c
> +++ b/tests/intel/kms_frontbuffer_tracking.c
> @@ -76,19 +76,19 @@
>   */
>=20
>  /**
> - * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   *
> - * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   *
> - * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   *
> - * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   *
> - * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   *
>   * arg[1]:
> @@ -104,23 +104,23 @@
>   */
>=20
>  /**
> - * SUBTEST: drrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: drrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbc-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbc-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   * Driver requirement: i915
>   *
> - * SUBTEST: psr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: psr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbcdrrs-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcdrrs-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   * Driver requirement: i915
>   *
> - * SUBTEST: fbcpsr-1p-offscren-pri-%s-draw-%s
> + * SUBTEST: fbcpsr-1p-offscreen-pri-%s-draw-%s
>   * Description: Draw a set of rectangles on the screen using the provide=
d method
>   * Driver requirement: i915
>   *
> @@ -3948,7 +3948,7 @@ static const char *screen_str(int screen)
>  	case SCREEN_SCND:
>  		return "scndscrn";
>  	case SCREEN_OFFSCREEN:
> -		return "offscren";
> +		return "offscreen";
>  	default:
>  		igt_assert(false);
>  	}
> --
> 2.43.0

