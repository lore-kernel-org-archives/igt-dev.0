Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A64EE57C7
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 06:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4223B10E6F2;
	Thu, 12 Sep 2024 06:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZ1Hj7Rw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACB2E10E6F2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 06:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726121422; x=1757657422;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6zjZsHgFYuOQhXTaiEQMGUwOGEaxzSn0nQYYtB18rCU=;
 b=AZ1Hj7Rw2H+4RccmTR+5VpftuqgoNp1CxYfB0cyjoP8o6kuUMCld72nZ
 ndJ/b1MEoQQith39Pz7BMTrFMHVJD8wfM6YBhc89dR4+KexH+mjZCZ/85
 bjYjzd1EDm7AWxmPUkkzYlGZnf6i0S/8uQS2SjL7NUJQretPv0/gx+5pC
 EJg1CFuwln69qc1C612ps6pnEP0/+FlbMXaiwAzfkEbkVdaGgxuw6OXSG
 CLf2tJMeviUh1GHCi44Ecid3QcuIwCHsljfPwERbQ6B/tV1XfCLSpfa7D
 LlbMCPg1J43S+yG+Vbjp8z1lerYuA/izyo+IFfyOqG9eq/ubzC/Nk1Uwx g==;
X-CSE-ConnectionGUID: MZ9vAMufRZeNGKVNP0ZW8g==
X-CSE-MsgGUID: 1qgU41T4RteUkZUmwdDedg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="42430534"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="42430534"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2024 23:10:21 -0700
X-CSE-ConnectionGUID: RSnvYtp8TYG+Yf38qedndQ==
X-CSE-MsgGUID: g0+6riCFTIm8NImObxWlPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="67837512"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2024 23:10:21 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 11 Sep 2024 23:10:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 11 Sep 2024 23:10:20 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 11 Sep 2024 23:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsXnWvm1qtlxcFGV8ZM1vTw+v+psmXmaQq8RpLD6ucd1wq2Y6X+Ji14UMTcQHorR9WeUdTPOxYw5er/aOour0S6kVsZX6vVwghHuXaQByay2ecMiqEWGFj2jrIs0Gbrg2Ypf96HmZ0vvTZVRbZC5j/S0xntkuNurdMAgF8Lfm579syrw4MPk8B4q1vx24a8JYKdFiSKDChheQlKvxwa88kIlKTG4wc6JJ3G5LupxVZ5pkaM7A2OoK/qFwBy2R+UZ04Kkya4OCfMtFGHDCQpFLOu3L9IY50m5u+EacfZBOTbpI/uiWbylmyOaRWKR/8fqgw7mFCj+GAAB2QlgFd1R0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti3QUZCamxYe9vRh8kYz4VQe80Y3c/lI7OgTYmjRvdA=;
 b=oEV2LLQpzo6xKMw0bfUhEha4sV+tQ1N3qw+pwyJeLwwqIkR66oF1UVpiuyiAibZpWImV7kMeBvwZn3Yot2pI4XSTd+u3v38RQN69GCh+5kX33RemxuZo8p1YgoqZoCIk99dyJXc7NDf2z0BfjHJOtzeu1n4+RQ4B/a9/gvnu4oPiM6xjZfTk9HwNFoHE6TEDYaH+u42qSO+YrErLYtumlJ8TjBAl/J2jmHxvZvNGGdHAsmq/x8GKOkiuGpnSsu8pkqsJdvJaBzZj2I/DwKW//yJOjEUHomdEKo01eXyQyR3apmqNiE4rmdj8TP03W9QB1r7CqfFiAQOruTZKXRR9bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 06:10:10 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 06:10:09 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Deak, Imre" <imre.deak@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 13/14] tests/intel/kms_dp_fallback: add test for
 validating fallback
Thread-Topic: [PATCH i-g-t 13/14] tests/intel/kms_dp_fallback: add test for
 validating fallback
Thread-Index: AQHa9yipmxUt3AHWzkK+BK0hhutjTrJGNEKAgA2QTGA=
Date: Thu, 12 Sep 2024 06:10:09 +0000
Message-ID: <CY8PR11MB688905DE5B6AAA74244D546BDA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240825200612.4036178-1-kunal1.joshi@intel.com>
 <20240825200612.4036178-14-kunal1.joshi@intel.com>
 <ZtcjVeIRJTVBGCnN@ideak-desk.fi.intel.com>
In-Reply-To: <ZtcjVeIRJTVBGCnN@ideak-desk.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|CH0PR11MB5219:EE_
x-ms-office365-filtering-correlation-id: 3049af43-8aa4-405f-d647-08dcd2f18e53
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?Iguz5OQoona16WOE0zWWPXVV9oSwKSr97T67984hOkgNhaA0dtGu90STXX8/?=
 =?us-ascii?Q?9W6uIrBG7cwM8Umm3w1Ai/+0clyRGbo1jMSx/enNMeC/W/sbeXxjpGwrpXJJ?=
 =?us-ascii?Q?m9lYh+eT4Rr6qNvpVS0il9eSif4EanMKuVi+Yx21d1SCMcCgQsiQTV03ocew?=
 =?us-ascii?Q?6R7hrnTFguaephvKXTVUSaHzlu7T1XlRaHAZr/yXMtcY2wcYdOQcVqswNoOH?=
 =?us-ascii?Q?2BokUStPxjCgl9G/qMKOjqHnkOl1TvAUndvQ8oWmEjVSeI7FI8xk5LUqG+JI?=
 =?us-ascii?Q?2wtNpvIysuh+36BxEKhTFKcROXpBhsVL6/BiUIdAXafFUBORllO766WyWZdt?=
 =?us-ascii?Q?AfN+ywAD4YVrhaTQpZ2y/8kIj5tc1a4COm5VsLuUObiRio9lOl5aI+DB6aLA?=
 =?us-ascii?Q?cyDL8ioNZjhZj3r5cJJBHfO5RAHnXf1FirAfqAMvhw6XA7JLMA3O8/8w8sKz?=
 =?us-ascii?Q?LxI/lO/bDfJHqYpGG+FRXTR85p7lOqpmhK0KwHscHcM0yx7se5ddDie4HL9p?=
 =?us-ascii?Q?FgI4TLVLJfPiltC7jrfjUFIHMf4bsotpjjeFyeP6SoR8S7STvPeAV5ZeAryN?=
 =?us-ascii?Q?y0aEti+6O45sAvaV964Cw8sO/4g90E0Q0+2EgKLHloDylEY9X6OxkvLJ2o+p?=
 =?us-ascii?Q?8Ug3WLzPfvHaGMmRX7aCfil5ntMQ6jcEzoMEbFSKY80eQMhF/B/RFvCHLMXU?=
 =?us-ascii?Q?UGGlAHnuIHijX08ahPAZdzW2VR2miBE7j9nwYniPsA6s3c7sh8zaVQjkP0dO?=
 =?us-ascii?Q?eqJIOaNkmxxkCDN59KYv4rxlCa7FLbl//Rs4DkTVFyi+I6gcHPpnONlMgipH?=
 =?us-ascii?Q?LoSjbxRu/KcTCY1TK22mKf+6yC3vzr83r4FR/MRPIUSA/v6ivXYlQA/39a2w?=
 =?us-ascii?Q?UktRcDF22gwaYu9yBbATLxD7nHXerUmUAEhKsI/03ekmptycmr28mOQ1R/bO?=
 =?us-ascii?Q?DjWX2GaHrE3935OnkY1degv425bOtVYDXTgXCf5vNGXAMNHmstZ/ZXmX1etz?=
 =?us-ascii?Q?vvx1dW+YIha9S1XVsgvxolwldcbf0a12Rh1hzbw674ZUcaHCWJgJcVlMzoD3?=
 =?us-ascii?Q?rD79SoNskNyDX1Y+6eUi1Qr/RfjGjYd1GxvjflfJ4rlIvrEJ4ozPiWcQF7Cx?=
 =?us-ascii?Q?6R9L9n9nANOGtz4dCqLH7bVuyUuxML0fMHo5Gz/1wclcTd4CDGF0BGfJMLpR?=
 =?us-ascii?Q?by0rr6LSqiDFcUgCzTdGCmvmqvbrFPyQS2jWzgGe6tqyQhj9Jejzt7pcqoRM?=
 =?us-ascii?Q?Rvt0Q2D5LnLElJLSIGmmhNkCql2RkemnG8Caa7ftXSgw8XLzgN5pT3GdfKCk?=
 =?us-ascii?Q?q5+NU/aC0iPxN4bPgTltC9wRG7IUi6WRQ8/zkiOA3yArVLduH4kngWJ9V1OD?=
 =?us-ascii?Q?H5mOaZlx/QLNI79qZ+Fry7ea3/ryUvDDqSW1hNFqKwcXJJV1rg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lt7i2Gbx52SpOPtZ4fugQif/yR15vaWlOBee8QV/El4HzX/F3n69ploGaCqc?=
 =?us-ascii?Q?waHZ4iB7SH+ien3xO8SharmNUcGInXDeW9IX5zdWl6GAAYQHfuj8xp8WGufF?=
 =?us-ascii?Q?dYvUIlocnLDFNINFf5qFoZh6+J0sZcaAPmg8IL1MTdrc36T8hSp7CyxULYma?=
 =?us-ascii?Q?rL9dT29AMaDDQu6eZxakmQ4kI08XMicsvQDR6w5k9Xo50IL3dbBM9BdJVG7y?=
 =?us-ascii?Q?pmkw6SRESwrGcpoFk9fYa3pNIVbcp6kp86vw2nD0TxTQ/KJtcoKRZh818dMU?=
 =?us-ascii?Q?hMjO9eEL/KehK5GF6FCTWTZ00WrEIVl6B9EVP36bRFRMIjSo/LZ2dg05Cu4H?=
 =?us-ascii?Q?3kiHS3xCepaBVImBk2qKjLdadRZT5h+PWalNp5d9Erg0TG9bPXiYhfP/3FDS?=
 =?us-ascii?Q?mctXxt4VnNe7UeSJ7JFDsNmy6sZDTOM6qJhogvzmWu93fnvrVVK9X14csF5C?=
 =?us-ascii?Q?k6HDqsHPG37I02OZqHAofsAvVtJsAjxEKV0yo4p4kEg03akzgsw7KE60YWao?=
 =?us-ascii?Q?/u+enb9XRAWHrVhkpYHPbbeflA61cubuI8DI5zV1Bb224md0IKYTJe4nEsFT?=
 =?us-ascii?Q?125EpArOva2erS/giFszdfB5khkjzl5rsLHGYXpqIovJg2e9wQ3SPzdW9aXT?=
 =?us-ascii?Q?EhTpGYH5e21d0kfnzxfh1cIoOgkk11boDjiDFNC9TnQJXOK31zq+6Dr48EC4?=
 =?us-ascii?Q?1rVooE4K/NfPdsHrtFvjC0gHvEQM5zs99sk3zkwAehAmf65o04vJrj9uzHA2?=
 =?us-ascii?Q?+u2EvrwvkbwaWpK8SjXAb+t9V5MGmi4Sb9wAEL67ycT7Z2aYWXxxMLcqZQIj?=
 =?us-ascii?Q?p2IixP+CGIP2EBY+4QOdPrgwWpIaPmvg9QMsF4Xf9aQi1M/N5bly8DeCdAon?=
 =?us-ascii?Q?vuA3r/nD6t4LsQKkayBEgTtc6pitpK6TJXpvmPfxppGIZXVTDUY9CouhplGb?=
 =?us-ascii?Q?sw3qXN7Ayxew6M9GcgdB/nfxmfRmlSuJ0YfMDEb0jTyY5oPNUMITgF4CN+BD?=
 =?us-ascii?Q?UH77PTYcWyF2XaVsE8W+70PQm1RU6ua8f53xxx5Y/xa8YOP81Wzh5hzqt1kn?=
 =?us-ascii?Q?foCwMmzAK9+X9H1U3tWArzPAzrBED+gfEAnGSIfgQA8QGKTa2biQoXEJcrqr?=
 =?us-ascii?Q?sjailX8LxNWXq/x5SJUo51xr4jWToaVDJBAKVfSWnIJKM/WZBG8f1c8lqaUZ?=
 =?us-ascii?Q?uTK+Ajf2jPIs9Ik8FpIJJWQ/pcXlCi4paXr546Ef5tA3Dm2lxQMadxydiaO/?=
 =?us-ascii?Q?bHkAGRxN8FcfnwI4y8/B1B1t5KrJZAm1p9lXEP6wzilib14kiayt1Y8M9+8Z?=
 =?us-ascii?Q?MTFEWg9Sv+MLhGoLQ/ybg9kt2S+VoP8FAPN4mboDWMY08N/99E7DmCTJhLf6?=
 =?us-ascii?Q?A4EDk+HMxUQIqGfhslmqfy4RdsuokVmg7DmVD/v8EldxtYsTbfDQD2OedCxN?=
 =?us-ascii?Q?QYgZVFKJBmMRqjgrXeSbg2QD5LA4RZ27mfk/QQHetUnUVk2Vx52MwtPdnDor?=
 =?us-ascii?Q?+afIGpMI/yAg7xUFvJI69X3zr5b0N8NvQBi4EgZvZsOxKOymsCFbaTa3cs63?=
 =?us-ascii?Q?rbZ0NiFxENTplDCgnuQjcWMedjQH7fIgfxVh3bOX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3049af43-8aa4-405f-d647-08dcd2f18e53
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 06:10:09.6386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tepFsyZXcAl84S6jHAjrYVppe8gL74ShwXCRKIeL3wxHsS37nKlsm9auexVh0lBApKjiV36c2FDu6hQ/bU09wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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

Hello Imre,

-----Original Message-----
From: Deak, Imre <imre.deak@intel.com>=20
Sent: Tuesday, September 3, 2024 8:25 PM
To: Joshi, Kunal1 <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 13/14] tests/intel/kms_dp_fallback: add test for =
validating fallback

On Mon, Aug 26, 2024 at 01:36:11AM +0530, Kunal Joshi wrote:
> add test to valdiate fallback for DP connector, eDP subtest will be=20
> added later.
>=20
> How does test validates fallback?
> - test start by doing initial modeset on default mode
>    (if connector is DP then we enable just that connector,
>     if its DP-MST we enable all on the same topology)
> - force link training failures and retrain until we reach
>   lowest param or retrain is disabled
> - expect hotplug and link-status to turn bad
> - expect link params reduce after fallback
>=20
> v2: add test for mst (imre)
>     refresh mode list (imre)
>     monitor got hotplugs (imre)
>     check link parameter are reduced (imre)
>=20
> v3: call check_fn (Santosh)
>=20
> v4: handle buggy lg monitor (Imre)
>     remove reset in between (Imre)
>=20
> v5: fit modes wrt to bw in non-mst case as well
>=20
> Cc: Imre Deak <imre.deak@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Suggested-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/intel/kms_fallback.c | 515 +++++++++++++++++++++++++++++++++++++
>  tests/meson.build          |   1 +
>  2 files changed, 516 insertions(+)
>  create mode 100644 tests/intel/kms_fallback.c
>=20
> diff --git a/tests/intel/kms_fallback.c b/tests/intel/kms_fallback.c=20
> new file mode 100644 index 000000000..e97300c08
> --- /dev/null
> +++ b/tests/intel/kms_fallback.c
> @@ -0,0 +1,515 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (c) 2024 Intel Corporation  */
> +
> +/**
> + * TEST: kms fallback
> + * Category: Display
> + * Description: Test link training fallback for eDP/DP connectors
> + * Driver requirement: i915, xe
> + * Functionality: link training
> + * Mega feature: General Display Features
> + * Test category: functionality test
> + */
> +
> +#include <sys/types.h>
> +
> +#include "igt.h"
> +#include "igt_psr.h"
> +
> +/**
> + * SUBTEST: dp-fallback
> + * Description: Test fallback on DP connectors  */
> +
> +#define RETRAIN_COUNT 1
> +#define LT_FAILURE_SAME_CAPS 1

This is not used. Maybe add a comment instead why 2 LT failure will lead to=
 reducing the link params?
---------------------------------------------------------------------------=
-------------------
Ok will remove LT_FAILURE_SAME_CAPS and add a comment for LT_FAILURE_REDUCE=
D_CAPS

> +#define LT_FAILURE_REDUCED_CAPS 2
> +#define SPURIOUS_HPD_RETRY 3
> +
> +static int traversed_mst_outputs[IGT_MAX_PIPES];
> +static int traversed_mst_output_count; typedef struct {
> +	int drm_fd;
> +	igt_display_t display;
> +	drmModeModeInfo *mode;
> +	igt_output_t *output;
> +	enum pipe pipe;
> +	struct igt_fb fb;
> +	struct igt_plane *primary;
> +	int n_pipes;
> +} data_t;
> +
> +typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
> +
> +IGT_TEST_DESCRIPTION("Test link training fallback");
> +
> +static const char *str_link_rate(enum dp_link_rate link_rate) {
> +	switch (link_rate) {
> +	case DP_LINK_RATE_162000:
> +		return "1.62 Gbps";
> +	case DP_LINK_RATE_216000:
> +		return "2.16 Gbps";
> +	case DP_LINK_RATE_243000:
> +		return "2.43 Gbps";
> +	case DP_LINK_RATE_270000:
> +		return "2.70 Gbps";
> +	case DP_LINK_RATE_324000:
> +		return "3.24 Gbps";
> +	case DP_LINK_RATE_432000:
> +		return "4.32 Gbps";
> +	case DP_LINK_RATE_540000:
> +		return "5.40 Gbps";
> +	case DP_LINK_RATE_675000:
> +		return "6.75 Gbps";
> +	case DP_LINK_RATE_810000:
> +		return "8.10 Gbps";
> +	case DP_LINK_RATE_1000000:
> +		return "10.00 Gbps";
> +	case DP_LINK_RATE_1350000:
> +		return "13.50 Gbps";
> +	case DP_LINK_RATE_2000000:
> +		return "20.00 Gbps";
> +	default:
> +		igt_assert_f(0, "Invalid link rate %d\n", link_rate);
> +	}
> +}
> +
> +static const char *str_lane_count(enum dp_lane_count lane_count) {
> +	switch (lane_count) {
> +	case DP_LANE_COUNT_1:
> +		return "1";
> +	case DP_LANE_COUNT_2:
> +		return "2";
> +	case DP_LANE_COUNT_4:
> +		return "4";
> +	default:
> +		igt_assert_f(0, "Invalid lane count %d\n", lane_count);
> +	}
> +}
> +
> +static void find_mst_outputs(int drm_fd, data_t *data,
> +			     igt_output_t *output,
> +			     igt_output_t **mst_outputs,
> +			     int *num_mst_outputs)
> +{
> +	bool is_output_mst;
> +	uint64_t path_blob_id;
> +	igt_output_t *connector_output;
> +	drmModePropertyPtr path_prop =3D NULL;
> +	drmModePropertyPtr connector_path_prop =3D NULL;
> +
> +	igt_assert_f(output, "Invalid output\n");
> +
> +	/*
> +	 * Check if given output is MST by checking if it has PATH property
> +	 */
> +	is_output_mst =3D kmstest_get_property(drm_fd,
> +			output->config.connector->connector_id,
> +			DRM_MODE_OBJECT_CONNECTOR, "PATH", NULL,
> +			&path_blob_id, &path_prop);
> +
> +	if (!is_output_mst)
> +		return;
> +
> +	/*
> +	 * If output is MST check all other connected output which shares
> +	 * same path and fill mst_outputs and num_mst_outputs
> +	 */
> +	for_each_connected_output(&data->display, connector_output) {
> +
> +		connector_path_prop =3D NULL;
> +
> +		kmstest_get_property(drm_fd,
> +				     connector_output->config.connector->connector_id,
> +				     DRM_MODE_OBJECT_CONNECTOR, "PATH",
> +				     NULL, &path_blob_id,
> +				     &connector_path_prop);
> +
> +		if (connector_path_prop && path_prop &&
> +		    connector_path_prop->prop_id =3D=3D path_prop->prop_id)
> +			mst_outputs[(*num_mst_outputs)++] =3D connector_output;
> +
> +		if (connector_path_prop)
> +			drmModeFreeProperty(connector_path_prop);
> +	}
> +	if (path_prop)
> +		drmModeFreeProperty(path_prop);
> +}
> +
> +static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
> +			      int *dp_mst_outputs)
> +{
> +	int i;
> +	igt_output_t *output;
> +
> +	igt_require_f(igt_check_output_is_dp_mst(data->output),
> +		      "Not a valid MST connector\n");
> +
> +	/*
> +	 * Check if this is already traversed
> +	 */
> +	for (i =3D 0; i < traversed_mst_output_count; i++)
> +		if (traversed_mst_outputs[i] =3D=3D data->output->config.connector->co=
nnector_id)
> +			return false;
> +
> +	find_mst_outputs(data->drm_fd, data, data->output,
> +			 mst_output, dp_mst_outputs);
> +
> +	for (i =3D 0; i < *dp_mst_outputs; i++) {
> +		output =3D mst_output[i];
> +		traversed_mst_outputs[traversed_mst_output_count++] =3D output->config=
.connector->connector_id;
> +		igt_info("Output %s is in same topology as %s\n",
> +			 igt_output_name(output),
> +			 igt_output_name(data->output));
> +	}
> +
> +	return true;
> +}
> +
> +static void setup_pipe_on_mst_outputs(data_t *data,
> +				      igt_output_t *mst_output[],
> +				      int *dp_mst_outputs)
> +{
> +	int i =3D 0;
> +
> +	igt_require_f(data->n_pipes >=3D *dp_mst_outputs,
> +		      "Need %d pipes to assign to %d MST outputs\n",
> +		      data->n_pipes, *dp_mst_outputs);
> +
> +	for_each_pipe(&data->display, data->pipe) {
> +		if (i >=3D *dp_mst_outputs)
> +			break;
> +		igt_info("Setting pipe %s on output %s\n",
> +			 kmstest_pipe_name(data->pipe),
> +			 igt_output_name(mst_output[i]));
> +		igt_output_set_pipe(mst_output[i++], data->pipe);
> +	}
> +}
> +
> +static void setup_modeset_on_mst_outputs(data_t *data,
> +					 igt_output_t *mst_output[],
> +					 int *dp_mst_outputs,
> +					 drmModeModeInfo *mode[],
> +					 struct igt_fb fb[],
> +					 struct igt_plane *primary[])
> +{
> +	int i;
> +
> +	for (i =3D 0; i < *dp_mst_outputs; i++) {
> +		mst_output[i]->force_reprobe =3D true;
> +		igt_output_refresh(mst_output[i]);
> +		mode[i] =3D igt_output_get_mode(mst_output[i]);
> +		igt_info("Mode %dx%d@%d on output %s\n",
> +			 mode[i]->hdisplay, mode[i]->vdisplay,
> +			 mode[i]->vrefresh,
> +			 igt_output_name(mst_output[i]));
> +		primary[i] =3D igt_output_get_plane_type(mst_output[i],
> +							DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(data->drm_fd,
> +				    mode[i]->hdisplay,
> +				    mode[i]->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +				    &fb[i]);
> +		igt_plane_set_fb(primary[i], &fb[i]);
> +	}
> +}
> +
> +static bool fit_modes_in_bw(data_t *data) {
> +	bool found;
> +	int ret;
> +
> +	if (!igt_display_try_commit2(&data->display, COMMIT_ATOMIC)) {
> +		igt_info("Modes overridden\n");
> +		found =3D igt_override_all_active_output_modes_to_fit_bw(&data->displa=
y);
> +                igt_require_f(found,
> +                              "No valid mode combo found for MST modeset=
\n");
> +                ret =3D igt_display_try_commit2(&data->display, COMMIT_A=
TOMIC);
> +                igt_require_f(ret =3D=3D 0,
> +                              "Commit failure during MST modeset\n");
> +        }
> +        return true;
> +}
> +
> +static bool validate_modeset_mst_output(data_t *data,
> +					igt_output_t *mst_output[],
> +					int *dp_mst_outputs,
> +					drmModeModeInfo *mode[],
> +					struct igt_fb fb[],
> +					struct igt_plane *primary[])
> +{
> +
> +	igt_require_f(*dp_mst_outputs > 0, "No MST outputs found\n");
> +	setup_pipe_on_mst_outputs(data, mst_output, dp_mst_outputs);
> +	setup_modeset_on_mst_outputs(data, mst_output,
> +				     dp_mst_outputs,
> +				     mode, fb, primary);
> +	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
> +	return true;
> +}
> +
> +static bool setup_mst(data_t *data, bool is_mst,
> +		      igt_output_t *mst_output[],
> +		      int *dp_mst_outputs, drmModeModeInfo *mode[],
> +		      struct igt_fb fb[], struct igt_plane *primary[]) {
> +	bool ret;
> +
> +	*dp_mst_outputs =3D 0;
> +	ret =3D setup_mst_outputs(data, mst_output, dp_mst_outputs);
> +	if (!ret) {
> +		igt_info("Skipping MST output %s as already tested\n",
> +			 igt_output_name(data->output));
> +		return false;
> +	}
> +
> +	ret =3D validate_modeset_mst_output(data, mst_output,
> +					  dp_mst_outputs, mode,
> +					  fb, primary);
> +	if (!ret) {
> +		igt_info("Skipping MST output %s as validpipe/output combo not found\n=
",
> +			 igt_output_name(data->output));
> +		return false;
> +	}
> +
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	return true;
> +}
> +
> +static int check_condition_with_timeout(int drm_fd, igt_output_t *output=
,
> +					condition_check_fn check_fn,
> +					double interval, double timeout) {
> +	struct timespec start_time, current_time;
> +	double elapsed_time;
> +
> +	clock_gettime(CLOCK_MONOTONIC, &start_time);
> +
> +	while (1) {
> +		if (check_fn(drm_fd, output) =3D=3D 0) {
> +			return 0;
> +		}
> +
> +		clock_gettime(CLOCK_MONOTONIC, &current_time);
> +		elapsed_time =3D (current_time.tv_sec - start_time.tv_sec) +
> +			(current_time.tv_nsec - start_time.tv_nsec) / 1e9;
> +
> +		if (elapsed_time >=3D timeout) {
> +			return -1;
> +		}
> +
> +		usleep((useconds_t)(interval * 1000000));
> +	}
> +}
> +
> +static void test_fallback(data_t *data, bool is_mst) {
> +	int dp_mst_outputs, retries;
> +	igt_output_t *mst_outputs[IGT_MAX_PIPES];
> +	enum dp_link_rate max_link_rate, curr_link_rate, prev_link_rate;
> +	enum dp_lane_count max_lane_count, curr_lane_count, prev_lane_count;
> +	uint32_t link_status_prop_id;
> +	uint64_t link_status_value;
> +	drmModeModeInfo *mst_modes[IGT_MAX_PIPES], *mode;
> +	drmModePropertyPtr link_status_prop;
> +	struct igt_fb mst_fbs[IGT_MAX_PIPES], fb;
> +	struct igt_plane *mst_primarys[IGT_MAX_PIPES], *primary;
> +	struct udev_monitor *mon;
> +
> +	igt_display_reset(&data->display);
> +	retries =3D SPURIOUS_HPD_RETRY;
> +
> +	if (is_mst) {
> +		if (!setup_mst(data, is_mst, mst_outputs,
> +			       &dp_mst_outputs, mst_modes, mst_fbs,
> +			       mst_primarys))
> +			return;
> +	} else {
> +		data->pipe =3D PIPE_A;
> +		igt_output_set_pipe(data->output, data->pipe);
> +		mode =3D igt_output_get_mode(data->output);
> +		primary =3D igt_output_get_plane_type(data->output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +		igt_create_color_fb(data->drm_fd,
> +				    mode->hdisplay, mode->vdisplay,
> +				    DRM_FORMAT_XRGB8888,
> +				    DRM_FORMAT_MOD_LINEAR, 0.0, 1.0, 0.0,
> +				    &fb);
> +		igt_plane_set_fb(primary, &fb);
> +		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +	}

Would be better to have a separate function for the above and make dp_mst_o=
utputs more generic, also used for the non-MST case (adding to the array th=
en only a single output).
---------------------------------------------------------------------------=
-------------------
Ok sure will reuse the mst functions after renaming them

> +
> +	igt_info("Testing link training fallback on %s\n",
> +		 igt_output_name(data->output));
> +
> +	igt_reset_link_params(data->drm_fd, data->output);

Could this be done before the above setup part? Then the modes chosen there=
 should be based already on the updated link params and the commit would al=
so retrain the link if needed.
---------------------------------------------------------------------------=
-------------------
Ok sure will do as suggested
> +	igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> +						   data->output,
> +						   igt_get_dp_pending_retrain,
> +						   1.0, 20.0), 0);
> +
> +	max_link_rate =3D igt_get_dp_max_link_rate(data->drm_fd, data->output);
> +	max_lane_count =3D igt_get_dp_max_lane_count(data->drm_fd,=20
> +data->output);
> +
> +	while (!igt_get_dp_link_retrain_disabled(data->drm_fd,
> +						 data->output)) {
> +

Extra w/s.
---------------------------------------------------------------------------=
-------------------
Noted

> +		prev_link_rate =3D igt_get_dp_link_rate_set_for_output(data->drm_fd, d=
ata->output);
> +		prev_lane_count =3D=20
> +igt_get_dp_lane_count_set_for_output(data->drm_fd, data->output);

Moving these before the loop would avoid the duplication wrt. setting them =
at the end of the loop.
---------------------------------------------------------------------------=
-------------------
Right will move this out of the loop

> +
> +		igt_info("Current link rate: %s, Current lane count: %s\n",
> +			 str_link_rate(prev_link_rate),
> +			 str_lane_count(prev_lane_count));
> +		mon =3D igt_watch_uevents();
> +		igt_force_lt_failure(data->drm_fd, data->output,
> +				     LT_FAILURE_REDUCED_CAPS);
> +		igt_force_link_retrain(data->drm_fd, data->output,
> +				       RETRAIN_COUNT);
> +
> +		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> +							   data->output,
> +							   igt_get_dp_pending_retrain,
> +							   1.0, 20.0), 0);
> +		igt_assert_eq(check_condition_with_timeout(data->drm_fd,
> +							   data->output,
> +							   igt_get_dp_pending_lt_failures,
> +							   1.0, 20.0), 0);
> +
> +		if (igt_get_dp_link_retrain_disabled(data->drm_fd,
> +						     data->output)) {
> +			igt_reset_connectors();
> +			return;
> +		}
> +
> +		igt_assert_f(igt_hotplug_detected(mon, 20),
> +			     "Didn't get hotplug for force link training failure\n");
> +
> +		kmstest_get_property(data->drm_fd,
> +				data->output->config.connector->connector_id,
> +				DRM_MODE_OBJECT_CONNECTOR, "link-status",
> +				&link_status_prop_id, &link_status_value,
> +				&link_status_prop);
> +
> +		igt_assert_eq(link_status_value, DRM_MODE_LINK_STATUS_BAD);
> +
> +		igt_flush_uevents(mon);
> +
> +		if (is_mst) {
> +			igt_assert_f(validate_modeset_mst_output(data,
> +								 mst_outputs,
> +								 &dp_mst_outputs,
> +								 mst_modes,
> +								 mst_fbs,
> +								 mst_primarys),
> +				     "MST modeset failed\n");
> +		} else {
> +			data->output->force_reprobe =3D true;
> +			igt_output_refresh(data->output);
> +			data->pipe =3D PIPE_A;
> +			igt_assert_f(fit_modes_in_bw(data),
> +				     "Unable to fit modes in bw\n");
> +
> +			igt_output_set_pipe(data->output, data->pipe);
> +			mode =3D igt_output_get_mode(data->output);
> +			igt_info("Mode %dx%d@%d on output %s\n",
> +				 mode->hdisplay, mode->vdisplay,
> +				 mode->vrefresh,
> +				 igt_output_name(data->output));
> +			primary =3D igt_output_get_plane_type(data->output,
> +							    DRM_PLANE_TYPE_PRIMARY);
> +			igt_create_color_fb(data->drm_fd,
> +					    mode->hdisplay,
> +					    mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
> +					    0.0, 1.0, 0.0, &fb);
> +			igt_plane_set_fb(primary, &fb);
> +		}

The above would be better in a separate function and make the MST and non-M=
ST cases more unified. For instance setup_modeset_on_mst_outputs() looks qu=
ite similar to the above non-MST setup.[Joshi, Kunal1=
