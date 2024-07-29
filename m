Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115EDC3DA61
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jul 2024 06:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8F6E10E0FE;
	Mon, 29 Jul 2024 06:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E9iK3o9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D2010E0FE
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jul 2024 06:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722235778; x=1753771778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JvCwoXnciKigsy7O5hGWLLr7lnkhea535o3E95cve8w=;
 b=E9iK3o9rKt2tddn579CmYyMFt7fbSElzGXBJZhoqacsBTfHvRWJVDQNs
 5tR80IaXi0cFzw1/zTK+/KfNDLqu6JEUwgsYETXM0ndIuUjyYoDdRl06Y
 JA2T6LfSpQGIDBLUArQ9vXvV/9+Nbvqe4PDzLr8jS9Vh0QMgWFaNV/as4
 DETGVTQ2IcjuH0EMbcRiCjq/8Uqy54P5Ue/VHTD+y+tTdEBKPfzAK/pNU
 fCr1HtRpaGNQqIttfhCnZExTwsCCz68GChtlr5NywTrO7bTWD5JytT4AD
 +M/qMKsCv8Lf2oX74zwJOKOTCP4zuidL6j+MNTrGgRyggzpBDqsaUdVb9 g==;
X-CSE-ConnectionGUID: Pxz6HLkVRdSv9RqED/vF+w==
X-CSE-MsgGUID: UGoSfcj1TU2dlYDmSwfdqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="12761218"
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="12761218"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2024 23:49:37 -0700
X-CSE-ConnectionGUID: 6fDRsgyPQ2qB3nx1JjLw1w==
X-CSE-MsgGUID: ZvQUIe0mS9Gbi77gCvCbrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,245,1716274800"; d="scan'208";a="54119586"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jul 2024 23:49:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 23:49:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 28 Jul 2024 23:49:36 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 28 Jul 2024 23:49:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 28 Jul 2024 23:49:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cyGCA3WWaQxU8dJgTeWVU8UpeoyjYEik/psyk0rrkQtYTpAMU7FhWcb45kEhqj4uZ288qnFaA2MQr4AUSh4VL6QP3tx3ABaehG1BMuV6XgYMvoD0OYccXFDfEXpy2xnvib/r3dCh5or2NqaB0dubAo8DQyRpcCm7uqpxFGkMDU/flvd/RV7pLk9qYlPsi2aqisnyUyobYL5FX0z4EBsOpPR6QkC5Fu9wxmtOjTJI9UsmK2qXeqxzEfHP7j6WkvGbD37WwLzQxqq9a7SDpGNFeiMikkYpfMA2R0fbWZKs7aVeZBU1CIP/+rpzBtKfXyvkkQSm7g0kJzGfQoP0AeYSvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BRW5Oz+6maGRBp+EI2bTSRYG6CjVydAt/NfZPzUgvs=;
 b=VMxb5/5psR7QYMMYa3oUf1Dxlft2hyOaOze4McpCKCqrcHInQt9pCS7thLQmpeLQvihnGoPhCTnvrS7jpWmGwS1eMZvJB6qmIqmPfcMgxMy+xQLWqSPhN1DWTXtcgiroxrmNcCgaht0IQEZOyGpEva5IxsSC8zKcTeuigvB8Ui88ykO1z2kBCj2AEqzFGmHjHgxLS5qXeUTBjhICoAzoM97ZL7lH5BiLlpA/YP46La+bTdjqx21TtharG8q3xVjYRy0+qBGV5jgpNOu8VnIOqBT28AdixJwoh6K8LBJSsAEkq2dAwICG6Wz4RjrMvnQbyQoPKAyzOc3DyseF3ww/DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21)
 by CH3PR11MB7250.namprd11.prod.outlook.com (2603:10b6:610:149::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 06:49:34 +0000
Received: from SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527]) by SN7PR11MB6750.namprd11.prod.outlook.com
 ([fe80::9570:169d:a0d5:527%3]) with mapi id 15.20.7784.029; Mon, 29 Jul 2024
 06:49:34 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v3 3/4] tests/intel/kms_pm_dc: Add polling for
 deep-pkgc
Thread-Topic: [PATCH i-g-t v3 3/4] tests/intel/kms_pm_dc: Add polling for
 deep-pkgc
Thread-Index: AQHa30MnCUEJDlw/jkGoW59EcUg8/LINRo+w
Date: Mon, 29 Jul 2024 06:49:34 +0000
Message-ID: <SN7PR11MB6750E24FD40001C6E414B372E3B72@SN7PR11MB6750.namprd11.prod.outlook.com>
References: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
 <20240726100751.918038-4-ramanaidu.naladala@intel.com>
In-Reply-To: <20240726100751.918038-4-ramanaidu.naladala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR11MB6750:EE_|CH3PR11MB7250:EE_
x-ms-office365-filtering-correlation-id: e14756b7-aeb3-4c21-7f8f-08dcaf9a9b09
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?EDT1VOvX12ii9Q+kOz/k6OxmBRnVqiPuQ3JVBDFNX3RT4D1vWuBQtQbljIFp?=
 =?us-ascii?Q?BgpUf+IqnYAlc74lhFRxpmeO/JYXicwIC9GDugnSTpmzrydRKPLxML9MkbOs?=
 =?us-ascii?Q?i2IhI52XlX0uyu9yNddB4S0Ha6UVEe2upg/+uXbxHOxs1cJXpEPi3/yTuIxt?=
 =?us-ascii?Q?eEA4FJsMKyLNhHew9D2LNrIHnFpEDvKuFK3aXzPIB9ihD+xMvyPkzsT8Fo8v?=
 =?us-ascii?Q?qN0g1AUkD/8xzB6c7oHvGIFCSkWj7ZWZPmv2BAQ2uOPOUexahrAwO5sZT67X?=
 =?us-ascii?Q?FCC8M+psXyjKvuaQdwIcJg5WtJ3lUwBAk5GVOVWECV9pbhyZWEfbFwkiYPa4?=
 =?us-ascii?Q?N9xlMgL/HUAm7k6rcFkYrR2Sc/Wil09qyp4nMnvQPV3Mt58gbB3FXmQFOKFw?=
 =?us-ascii?Q?Aed285jT4i15GBzgAyCa/DgZHY+7tHozdizFdBXiBabCtmTrSEHf3CczXo5J?=
 =?us-ascii?Q?j6YUNtEFL/adWQDaQksDdjb60A0ZB8mSpvwMQFcmiR3/AQhweGK7wBeN3Eu3?=
 =?us-ascii?Q?rAQHQljvc71Dqv7CYnVtWgykL51OzLtVvf/WdXQQ6NFf4V3MguaUvMssfUdu?=
 =?us-ascii?Q?XSVzFylp1+F6jTks38ORqQAceVeDXWe+y14F/j9pHh9rhiTQaZqxRKtQJHSi?=
 =?us-ascii?Q?p50khvQqOsyZg1KMQ1ufOrnsSr1O8+DP1+HzR7NVY52/uWa7El76CKx4fxCF?=
 =?us-ascii?Q?il1UART08J3t49MvOKhuwp1ZVB9R97+wiHfIsVjXVPI8riTegPg5cukg6lm6?=
 =?us-ascii?Q?z6RNBas1XkAL7uAttV8Grzc8K3hVRgWXiWesh9R/V0O6nsiPx1ZK2twQne8t?=
 =?us-ascii?Q?ImlPe3MWCmy+bjJsnrPw/OL2IJ8/Vvoh2Qj3tWg1PybJpho+GRUdmDFwSfp0?=
 =?us-ascii?Q?FPJHB09gVp32izqinezMGfl3kmnz1FkMPVd5XDjXtcs2MIY6XEXoWtPe8uLN?=
 =?us-ascii?Q?9ITI9SHOsaZ4mjDxPb/rDtY36jZOdQ3Gom1G+skv5OcG6VbJLica+zkTlNpW?=
 =?us-ascii?Q?9ie0o143grFjWQGAuaaAASCo7vtccL5148c+jVPh/mx0oH8QiKatucawvszb?=
 =?us-ascii?Q?TIm5C+9fD6vtsD1YCdmUykGsBJjE7WxLYbe7VQEySFIgxsLzYRzd3DiduXgk?=
 =?us-ascii?Q?bXpGuKePfkhwJ2rFY3PGXyczHyzcDa2zVCQT2iVBPvu/DBwUvJsROc/7nwRY?=
 =?us-ascii?Q?fu33Tle7bRk1N7i6URsrc65MIaXmAgZZEBYespcuh77iLXVUknQgEO4Zf3BH?=
 =?us-ascii?Q?e9ez93XKu9Y3N2UxZHWtaOl/1fBfI19asLJ2tVy7rl7kaRWG1xqsAfTHWNy4?=
 =?us-ascii?Q?WlcdKHpScTdZPg27McqMMsxT8pD5nmO7zXGa/YXDQwtM/Rk/f1OImCurDkd9?=
 =?us-ascii?Q?Gy516Iubatu3I1H0mGTnV98hQZJpyuvbpYHcZb7+vcP1pTdmjA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6750.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hQMWcnhz8c9w0OFeCfZEoKryGmPuGDxWE+B2wRGetYzRKxyH6J2FBVSIay5i?=
 =?us-ascii?Q?9ekOuT8F6zBp+TLGsvWaYN5AsTGjKClRTXhCT8lgPyTv4BovmhFHTxfiK7VY?=
 =?us-ascii?Q?1N9lcY4pqN0Xpc5kgOLPS6rsHQ7zQ46Dk70/cpGj+91I0DSBQ6fpd9ic62F8?=
 =?us-ascii?Q?wDWAxbJqa1pcvPhXMpsvOxnxiI2nlTwrcmyguybTQL1mlQF8oajKkDz+SQD+?=
 =?us-ascii?Q?q3LGrjALKZUvqfSsOsHb25ukEevz+so/qIUKeLZW1Pq03aIUH3Lc2q39mrUT?=
 =?us-ascii?Q?GXshyISC+UXoUG6d4aB8Np+WUGFs2o4v8o8wJwYn0LNmT00U7RtbHUls0mH1?=
 =?us-ascii?Q?S8jFJo+Wv6sVcF1w35L4zBDuPWI1Z01UoDVLnVMw6JBEP0ROVNRYpBClJIX9?=
 =?us-ascii?Q?nixMeo0Vn4qjLprS1EPpzOl1gEl7sNLeI2FLU/LCkk194X9Yvlbt/taBtNRM?=
 =?us-ascii?Q?zYoLmDJkIdig67Xot/BR+IwMk3l3b9Iq9QbFPmKtTudSd0J9bbISsJ4oVjYX?=
 =?us-ascii?Q?dF7lmi5gcDlszdy/Kh12WeOKREC+rM90AWGEV0QRKcCHljiEyaSvyXpFZBVM?=
 =?us-ascii?Q?gIBwBEUuL/uO0qnWoiKmMtj5pWmGVXTZxZKoKFg5sF8i8RQQOkHn4icpidDP?=
 =?us-ascii?Q?70LG5ra5+SJWwGv8pCegKw3FTkGwaFBDr+UmcBH5BBbXmzhFajFyVnxxzsnj?=
 =?us-ascii?Q?xxc8TbIfhogw2bTjwrlmt4bIyKADsSVLSyxC3+WDAGDGpxm4mK5lDqg5j9YZ?=
 =?us-ascii?Q?xabarZgGTgoQ5og7hniFDUdcs0mSibf4A5BLkdjkAfhpu32Ld2S9VLpAs2EG?=
 =?us-ascii?Q?QuM4N7Lh34vOvcxYL3caQCv5eobYfqjEhMZcOdfzToNF5R1g/Nr7M1xi8y1L?=
 =?us-ascii?Q?T/mmaak3p//d58UxWKzqq5lACs9F5O/Ajr5HVkgvd1MwoJGehGQPD9623k6Q?=
 =?us-ascii?Q?dbPGNFJBEKkHfjxap6XSUhLaCAl1gFFPpjCTvGJ631NinBAgZx02A3IbQY7/?=
 =?us-ascii?Q?6OJoPtEtIQpb0KUfOBfqmpzTcFbK0Z90MwsBCmeGDVggfAV4brQgK3Xqj5x3?=
 =?us-ascii?Q?94M9V/A9GyA++s7wtgpydQkChGnqhE6GrRqjxn9kmI2/zPyP5nd1HptIvK9M?=
 =?us-ascii?Q?oDB3TQiWU79bc+x48Ayc0LO4VQm7sgoMlTil7BS1a3D3bwXeHuo7+0qRG4Za?=
 =?us-ascii?Q?s7k2R+UJGIXtjfXYZvZLZHzdxh1A2B6fRFGSV0iw/xGzjSqWeznQvSaMyO9H?=
 =?us-ascii?Q?KOfBmj3WGOJnXlIzdQcyr6uVYBBw+wp56lID93VkW+3GETDdgNqFwkECrK+Y?=
 =?us-ascii?Q?oD5BkMK45TzAclsPZmQDvGPox2igCZaFBPxw4uPFRSUFZXhd3NUL2kSlKruH?=
 =?us-ascii?Q?0GrV1BDfmn1oU/iK5JelTVkT0GXR8FDy6i+7aZDKe8tlMUYMe0e1tZqCb84m?=
 =?us-ascii?Q?Rr2SBYeN7fM0c73Iv4EdC0FDhYz2Dj6LVmZ9nQZGQht53V1DSGHVWY8u6JwE?=
 =?us-ascii?Q?uoIazrfE08Ht8L86qyDk4ApQW9bciBjIUZzG75qWRVDjNzC8/OtnvvYIu2HN?=
 =?us-ascii?Q?5SSqH/vcDWy9G8RpDNq4wRrDcaHF2sw7NWGFklpX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6750.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14756b7-aeb3-4c21-7f8f-08dcaf9a9b09
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2024 06:49:34.0659 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5/8MQOAfl0yyiz1v+ch0I8KOyT81ic1FnMQ4Jfo9dKwlAqSFOs+hpu00ios8zf2YbG0TWUnAEk1R38WY9oAWQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7250
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
> From: Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Sent: Friday, July 26, 2024 3:38 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>;
> Naladala, Ramanaidu <ramanaidu.naladala@intel.com>
> Subject: [PATCH i-g-t v3 3/4] tests/intel/kms_pm_dc: Add polling for deep=
-
> pkgc
>=20
> Added vblank wait to synchronize with frame time. Replaced
> read_pkgc_counter function with igt_wait function to poll for
> PKGC10 every 5ms until 2 frame times are reached.

Use imperative here too.

>=20
> v2: Address and correct review comments (Suraj, Jeevan)
> v3: Update commit subject/message.  (Kamil)
>=20
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>  tests/intel/kms_pm_dc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c index
> 09d362694..92c146d6c 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -635,23 +635,24 @@ static void test_deep_pkgc_state(data_t *data)
>  	setup_videoplayback(data);
>=20
>  	primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY);
> -	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);
> -	delay =3D 1 * (MSECS / (data->mode->vrefresh - 10));
> -
>  	igt_plane_set_fb(primary, &data->fb_rgb);
>  	igt_display_commit(&data->display);
> +	/* Waiting for the vblank to sync the frame time */
> +	igt_wait_for_vblank_count(data->drm_fd, data-
> >display.pipes[pipe].crtc_offset, 1);
> +	pre_val =3D read_pkgc_counter(data->debugfs_root_fd);

Why sleep ? not explained 0.5 seems like a magic number here
> +	usleep(delay * 0.5);
>=20
>  	while (time(NULL) - start < duration) {
>  		flip =3D !flip;
>  		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data-
> >fb_rgr);
>  		igt_display_commit(&data->display);
> +		igt_wait((cur_val =3D read_pkgc_counter(data-
> >debugfs_root_fd)) > pre_val,
> +			 delay * 2, 5);

Once again do not use magic numbers like this (5) it causes confusion eithe=
r have a define or a variable.

Regards,
Suraj Kandpal

>=20
> -		cur_val =3D read_pkgc_counter(data->debugfs_root_fd);
>  		if (cur_val > pre_val) {
>  			pkgc_flag =3D true;
>  			break;
>  		}
> -		usleep(delay);
>  	}
>=20
>  	cleanup_dc3co_fbs(data);
> --
> 2.43.0

