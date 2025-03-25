Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A98C35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 09:04:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D7F10E520;
	Tue, 25 Mar 2025 09:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V2Ljpw5u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85AEF10E520
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 09:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742893491; x=1774429491;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w9gU/mFD5w3K1nnzlarsRmHK+6wE5SPYDFR0dfZwLow=;
 b=V2Ljpw5uYlspydvfTDK5ZoGw0vOH7YhbnqXpUl56VL+IdVdwVJ6bWtSx
 kx44V08gVciEg4g8O6YysJDuaVTzBUJUioVvck5J0rXQu9EYE1d3lc4F4
 onDQGBYROmkkwQYdzaClKdWjPvhWW34URZaGKNyCCmqm32V3yZaFUzGx4
 pXTCn7el0j8f4s+RRXbI+AJOqJcuCesGjFBxfRIjzJNbC9QQDV0FPBviD
 aASltb6QJICraepmZVbi8LdPJ+XO7GA/vJTBDKVbqOaTEa4EBMXnQjf3m
 vQVfyeAiepAVFqd/i9yZQp9EBPoHcf4OvrlnuqXYtLdh4bGrz1+ZKxkBZ w==;
X-CSE-ConnectionGUID: AtlYc1keRDWRTfaX6ANAVg==
X-CSE-MsgGUID: M+EpJk08SLine3cvPy3uMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43286296"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="43286296"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:04:50 -0700
X-CSE-ConnectionGUID: b/llxq1GSHWwlIxcq0+LOg==
X-CSE-MsgGUID: SrHtoyEkSliwKT/e30a9Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="124345760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 02:04:51 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Tue, 25 Mar 2025 02:04:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 02:04:49 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 02:04:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sOaIAS8I4JIjJG45T+ShgI0FCzd0e843IAwNnaFF2dZiN4cNBDAIbNJSXLYB0OWQoiYuGLzEl919SJUqOvSikI8mULT1sCzjhZkZFcH5QgbZ1MigHCfJXNIfK4ekgQfUTzzzZY152o8VX45XGd8scIMQ1McS8+JCh5Ya314buluqZVqEeFb3yqPvGuBCvd7u3FAURrzHI6/X1rMarQhL1RgqjoCltcz0mm7LQ21aHNZIzglBuBCuL33h2wwCfxVMkFxN1QNraVJbQ5G6r4qRkWeo93aBIkigAkacUek1H+AsRGzzenMUs7fjm9wmhtiepurZ17jNHp2zjIf1tEsaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR2BKOBHsVe06KWxqJ+neEmPS5K8pyQNqLOItBwZiow=;
 b=TlZd58UV/yMfvrUNRlpCjXqESA+tluscU14PSkvOwrfwns6xnVMv+RBwQj890rj57bYfbPuilriiWuKaZUPM7hqRrjECEi4Py4UovG3A+opiiEKZzWYgI11kx1/xdAo0eDJS+NWIdwqon71dQIPiw76GQq54um96BmOJzrOV4/dczVwR7kJEVhtbNtS+k/x9XsjpPF8fdW4B1XVS6lRMM+/QPf74LUHUk6CcTO2RS+ilBEOsiwQC/RiH9NFeK8xg1fokD7lv4JeB2HAlvowZlqr8euJOGjlSb862+1+43BnTGFkPkRTmSCjyhuclW39JDaNwDfByuxovXGpgi+Wryw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 09:04:47 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 09:04:47 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t v6 2/2] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Topic: [PATCH i-g-t v6 2/2] tests/kms_async_flips: use in_formats_async
 for async modifiers
Thread-Index: AQHbmJCT7or+x07b1kGD7DwPnXQj/bODkVpQ
Date: Tue, 25 Mar 2025 09:04:46 +0000
Message-ID: <SJ1PR11MB612923FA9865BF1965B45B6CB9A72@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250319052905.2624650-1-santhosh.reddy.guddati@intel.com>
 <20250319052905.2624650-3-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250319052905.2624650-3-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA1PR11MB7679:EE_
x-ms-office365-filtering-correlation-id: 533bdfb9-d925-43f2-0ea7-08dd6b7c1779
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?TUmFTgmBLqIZYTkfgM8BhRGvuk24yObuFZsB3n/M8RjWdLTZRtQaV0oCX2/D?=
 =?us-ascii?Q?m5JNKduIStr90ASZyTq5PeXWorgQYt5KBQI/TdiLrwQdEFg5mHA1hK3v8Zru?=
 =?us-ascii?Q?CrpeGf4JsxHcdK+IHQJ83Pp95bsjU8Dwt7BGtaU0/UA57BLVsFWCyR7pmMj+?=
 =?us-ascii?Q?xqP8MZRflCtHz8Xm3B7KEbOJD+1hXb1DraOiZKPu62puag7QuYdMjVSLUzhg?=
 =?us-ascii?Q?QqUMWvnFFi6FNEkZjR7h4jLIv82AbwE2w26HBCoWW1Ay7gwDgZ6/FzedSbxO?=
 =?us-ascii?Q?6E5WGqppOQCWkeKGl1PefHOfCe5DAfxUCjZxSpIwdCv3Xem4K7aaoX9i9vPT?=
 =?us-ascii?Q?XTtZ7KRg475QRI+Er+1q7GU/K3LQQsoTT0PilnE/vCkBshS8/SzfhoZ+HEe5?=
 =?us-ascii?Q?QTX/DKnR4CY/He2l05/hTmm1xDohRakEc7Ir0QhC1P2LYcgmwtc9Eu91IV+E?=
 =?us-ascii?Q?9zpaNqTf9NJUiy6ITejzaRBv5SsPqXP+XiBiVdFwR0nn/yjTZ/BFG5eYcxfn?=
 =?us-ascii?Q?MmMIrHzA808V3pzcdvnASfJZ0iwov+8gFzfkMqeWK+QIMNvWizDvouso7ywa?=
 =?us-ascii?Q?Q+RtpNErdW/ni5vNMAmSnKXZGdEkwAnD44b0pJOnsEUaTWyS9U32iG7dVcQO?=
 =?us-ascii?Q?3DtsY40euaxgMdRjsg+UohTwEemGf16Nas4gwjt+UzNnmMTvn+bmnouhuwZi?=
 =?us-ascii?Q?NzPsWf474Ne/NTvVzqnwR7FT3vS0eYbiUc/qZzc1JbmnkiyoPBuZ0kEdRnGF?=
 =?us-ascii?Q?rRHM1hbeZtsThAEn4ldYcCVeWpq7Uydte/YTpXZ0/lw4SsV++DfVrZp2/Tdq?=
 =?us-ascii?Q?3ewz2T2Tm3eSWP9hoIWgMTLjIZNZCmjxiOojDW2Do92XJgsTKKGvKJr4ShEE?=
 =?us-ascii?Q?gHqStlw4Wky3Hx9kRkVVwCJWoaj4fXOId0+RJipw5biBKcITn8hFLxXTbfJk?=
 =?us-ascii?Q?He3XynkKY68e6DxuFbkctut3fbEbK5M5V/WhYtbcso6ZzVzIEXCXsENjzNSu?=
 =?us-ascii?Q?L99LzvelUcZ678vjqrXqoL0bVXwGZ2lG5VSOulkU137mL+XRqm85VoZZt6h6?=
 =?us-ascii?Q?3UlI0csAYutJJtfxPbqkmiST+WxJhX7dVz1vPdLXj0Gc+7TzZpHK04VylJQy?=
 =?us-ascii?Q?ZTKEtgzj9p1EssbRCz4KdmE+my6eb9CJwvsY2b3PCzfpU2C5Iou+i/+S9h6k?=
 =?us-ascii?Q?QtIu9qKrln7v2P9+1+SJEn+MdunXzcck1F3Cv6YJ/s5ngswHf4V9/9MA+NFP?=
 =?us-ascii?Q?3vn2kjVG4NHa2zgCbq19onNFv9v+WTGyLlsIkZovbVTMqBhVZyent+l6UOm/?=
 =?us-ascii?Q?cl6fhFoM8rIQfhv6MiPoPnWQlOJ547VwwPgotBFV2JM5Q8dXUQm4ONJf0mrC?=
 =?us-ascii?Q?DpR81gNaShbt+J/17xF74ez0kB2ltgmDLhJ07efjI19+4sedJQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BYGC2G2a449rQ1KW8jnstQKB4IbmRYHDqpFLGKxNOXZ+uiVcX+0OV2kM+AEk?=
 =?us-ascii?Q?2W2d4Aw2pKCA+avql0FwtU3gixxjvMBhAv6E2AdtSJZNYNZQcGaXhtBTYZfB?=
 =?us-ascii?Q?SQRMZAAOfHds9wP9HQ+T860CZ+Kzvcu02kuxCE8cgcVGZyoEJCk+T4WAnzW0?=
 =?us-ascii?Q?oEdjLGuwHdgyOiocI0Q67LyggOCucotj0e3Q0LIgxvwTx2kZDNtZr2HOHDlm?=
 =?us-ascii?Q?ZJDUFbQ37TiV/PhnRtJQw85deRktYfSpQaN3efzmhjmIYQ/Pb6DrvrB8WH/k?=
 =?us-ascii?Q?z7OaLM868w9iiapL14o+20vocz8cLCAE72k9mfczDr7ngA/3NEnVfu4seR+N?=
 =?us-ascii?Q?GdGnyGdl2A1KdimhCebQf6YIqWGbP1JxZlYcGVwQbuW9e5Tg+o9Ab3JrEkDF?=
 =?us-ascii?Q?xQ7elRdHEICup26FIWEye0nzj0+okC+jCEMU+3Ih2m7l0UrTfFeq7GX6RDhc?=
 =?us-ascii?Q?2rkbqRfwAs1B6AuHWW/7d7u1X6onetLaoVmwGwWwZU9qHGjRMCzHzGs1MlrB?=
 =?us-ascii?Q?cK1XOTU7o0hwLQMfq2A1+r1G89Fyu0WxJcqBZ/Je089KTTU4jx4PWU8lZxCh?=
 =?us-ascii?Q?TiXspqEVee6GCIceFBZMG0xUWwr65zmThUdoN9ya9nEDx+T/+Z0+mza5sxvh?=
 =?us-ascii?Q?O7Wddk89lcwUA43KxNJgwJfCBYs342TbiJ+pQfCHvNF99mc1phPnWGPI/+lJ?=
 =?us-ascii?Q?UqpZSZx3gaG30vvtNfZbgYMFSy0s1syIUSwvkOLKZEwT10zM9HSKhhrMm/1i?=
 =?us-ascii?Q?cb7paRMuwhyaMYqrCmAtqBJvLChC3b1DOeKPcgQ+bnbXjkJ5paphNZ5E65L5?=
 =?us-ascii?Q?a0DcOVOoA19Zv+JX1sflkQgLV60i51GyKI/ZjfXc8+jZYFkpI8MDpASZdxym?=
 =?us-ascii?Q?MGS77nOMzZUV8rfzYGNp15Fnx52ajLfljpW39/vnNsh0IDDI9JBDvZUS/kGZ?=
 =?us-ascii?Q?j6yKXwdQLX+dWGkeKESMiUTNagc3HdqMNNvKF19mGzq83MT3/rwjFQmKsLVz?=
 =?us-ascii?Q?iycTtg53FXuE0HiEUQOGGB4tU1kIk4rqjkhF5TnzRZ7iSE2+i7waDTCrwFIo?=
 =?us-ascii?Q?NU6lBJdcYn0A3+k5dSaIZbWbaCfSzNxeTjHemP4Fss53bMtjsL5lsmdj1pjc?=
 =?us-ascii?Q?iahGygi6hlo/JwsO8D4U2wmVYs3xsHCIeWDGCqTm060Pel212yAjkxIqv5Wx?=
 =?us-ascii?Q?XIo/iXLhj780p7oAS0ZWiWiRPl8YeARmzck+6BMHPhMfZypk7z/mK9r9f2JU?=
 =?us-ascii?Q?L5Yan2MRvDNIUCZIwLmvkZs4fnhnd+uBbiLjUlV/QOZDVLEE+SsiF9pt8LVt?=
 =?us-ascii?Q?s4Ny53SVwPiqVZr1Phh8JWomKWH+8pmI0olSm0/XMkQ7YmshBWMIFpWT/iFQ?=
 =?us-ascii?Q?3+NueFlfbxiZ9on/SIF7Q8WjGOOQ4vJes93cb1Ad5YJNWW8tpeusLtxb6Edy?=
 =?us-ascii?Q?rn2XBp7lIsI8tD1iWH+7vgf8G++RYJaiIAV8icgUPdbw6vkvHVYB7mi5FUNH?=
 =?us-ascii?Q?suPeX8ei6k2vKZ9PifMefRhw2Hah1s9oWHqTsG/0T9cJ86OO5hglSsl+4e/F?=
 =?us-ascii?Q?b4CoLrKfELS0B70XJ2hhI2vqmwu8dSFyBHKY9JirXTK0uzCHDwpN3b89KwOz?=
 =?us-ascii?Q?kQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533bdfb9-d925-43f2-0ea7-08dd6b7c1779
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 09:04:46.9792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b8yC016FXrchjbL+el+RgZthhLwj9WtYn6HB+ofixVffuDTt+hrp1wNOFQQrvvouY/xmooEBSNB+fLi7HyXzLwb8n54ckIEi2DXxDKaToG0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Wednesday, March 19, 2025 10:59 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v6 2/2] tests/kms_async_flips: use in_formats_async=
 for
> async modifiers
>=20
> Utilise IN_FORMATS_ASYNC property exposed to get the list of async
> supported modifier/format pair and improve the test coverage by iterating
> through all the supported modifier format pairs.
>=20
> V2: Improve run_test_with_modifiers to set data formats based on async
>     formats.
>     Update make_fb to use data formats instead of hard coded format
>=20
> V3: Update commit message, remove complicated iterations (Chaitanya)
>=20
> V4: Reduce the format+modifier combinations to reduce time needed to
>     execute the tests. (Chaitanya)
>=20
> V5: Remove unnecessary check for reduced formats. (Chaitanya)
>=20
> V6: Introduce new test for all formats and modifiers, executing only one
>     flip to reduce overall time.
>     Update test_with_modifiers to use async modifiers and formats X8888.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 116 ++++++++++++++++++++++++++++++++++++++-
> -
>  1 file changed, 112 insertions(+), 4 deletions(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> da426f753..165900e09 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -36,6 +36,7 @@
>  #include "igt.h"
>  #include "igt_aux.h"
>  #include "igt_psr.h"
> +#include "igt_vec.h"
>  #include <sys/ioctl.h>
>  #include <sys/time.h>
>  #include <poll.h>
> @@ -85,6 +86,9 @@
>   *
>   * SUBTEST: async-flip-suspend-resume
>   * Description: Verify the async flip functionality with suspend and res=
ume
> cycle
> + *
> + * SUBTEST: async-flip-with-all-modifiers-formats
> + * Description: Verify the async flip functionality with all supported
> + modifiers and formats
>   */
>=20
>  #define CURSOR_POS 128
> @@ -122,8 +126,15 @@ typedef struct {
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> +	unsigned int plane_format;
> +	bool async_mod_formats;
>  } data_t;
>=20
> +struct format_mod {
> +	uint64_t modifier;
> +	uint32_t format;
> +};
> +
>  static void flip_handler(int fd_, unsigned int sequence, unsigned int tv=
_sec,
>  			 unsigned int tv_usec, void *_data)
>  {
> @@ -193,7 +204,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>=20
>  	rec_width =3D width / (NUM_FBS * 2);
>=20
> -	igt_create_color_fb(data->drm_fd, width, height,
> DRM_FORMAT_XRGB8888,
> +	igt_create_color_fb(data->drm_fd, width, height, data->plane_format,
>  			    data->modifier, 0.0, 0.0, 0.5, fb);
>=20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, fb); @@ -348,10 +359,19 @@
> static void test_async_flip(data_t *data)
>  			data->suspend_resume =3D false;
>=20
> 	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> SUSPEND_TEST_NONE);
>  		}
> +
> +		/* Reduce test execution for all formats and modifiers. One
> flip should suffice */

We will need to flip at least twice because Intel HW converts the first asy=
nc to sync.

So we have to add data->async_mod_formats to the code that does the extra f=
lip.

                int flags =3D DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP=
_EVENT;

-               if (data->alternate_sync_async) {
+               if (data->alternate_sync_async || data->async_mod_formats) =
{
                        flags &=3D ~DRM_MODE_PAGE_FLIP_ASYNC;



> +		if (data->async_mod_formats) {
> +			igt_assert_f(ret =3D=3D 0, "Async flip failed with %s
> modifier and %s format",
> +				     igt_fb_modifier_name(data->modifier),
> +				     igt_format_str(data->plane_format));
> +			break;
> +		}
> +
>  		frame++;
>  	} while (diff.tv_sec < RUN_TIME);
>=20
> -	if (!data->alternate_sync_async) {
> +	if (!data->alternate_sync_async && !data->async_mod_formats) {
>  		fps =3D frame * 1000 / RUN_TIME;
>  		igt_assert_f((fps / 1000) > (data->refresh_rate *
> MIN_FLIPS_PER_FRAME),
>  			     "FPS should be significantly higher than the refresh
> rate\n"); @@ -710,17 +730,99 @@ static void run_test(data_t *data, void
> (*test)(data_t *))
>  	}
>  }
>=20
> +static bool skip_async_format_mod(data_t *data,
> +			    uint32_t format, uint64_t modifier,
> +			    struct igt_vec *tested_formats)
> +{
> +	/* igt doesn't know how to sw generate UBWC: */
> +	if (is_msm_device(data->drm_fd) &&
> +	    modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return true;
> +
> +	/* VEBOX just hangs with an actual 10bpc format */
> +	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
> +	    igt_reduce_format(format) =3D=3D DRM_FORMAT_XRGB2101010)
> +		return true;
> +
> +	/* test each format "class" only once in non-extended tests */
> +	struct format_mod rf =3D {
> +		.format =3D igt_reduce_format(format),
> +		.modifier =3D modifier,
> +	};
> +
> +	if (igt_vec_index(tested_formats, &rf) >=3D 0)
> +		return true;
> +
> +	igt_vec_push(tested_formats, &rf);
> +
> +	return false;
> +}
> +
> +static void run_test_with_async_format_modifiers(data_t *data, void
> +(*test)(data_t *)) {
> +	struct igt_vec tested_formats;
> +
> +	igt_vec_init(&tested_formats, sizeof(struct format_mod));
> +
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
> +		test_init(data);
> +		for (int i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +			struct format_mod f =3D {
> +				.format =3D data->plane->async_formats[i],
> +				.modifier =3D data->plane->async_modifiers[i],
> +			};
> +
> +			if (skip_async_format_mod(data, f.format, f.modifier,
> &tested_formats)) {
> +				igt_debug("Skipping format "
> IGT_FORMAT_FMT " / modifier "
> +					   IGT_MODIFIER_FMT " on %s.%u\n",
> +					   IGT_FORMAT_ARGS(f.format),
> +					   IGT_MODIFIER_ARGS(f.modifier),
> +					   kmstest_pipe_name(data->pipe),
> +					   data->plane->index);
> +				continue;
> +			}
> +
> +			/* C8 format is only supported with legacy LUT,
> skipping it */
> +			if (f.format =3D=3D DRM_FORMAT_C8)
> +				continue;

We can remove this as kernel is not advertising it anymore.

https://patchwork.freedesktop.org/patch/643629/?series=3D140935&rev=3D9

> +
> +			data->allow_fail =3D true;

We should not need this anymore as we have the exact list of modifiers we s=
upport.

Worthy checking if we need this for other tests too.

> +			data->modifier =3D f.modifier;
> +			data->plane_format =3D f.format;
> +			data->async_mod_formats =3D true;
> +
> +			igt_dynamic_f("pipe-%s-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
> +				      data->output->name,
> +				      igt_fb_modifier_name(data->modifier),
> +				      igt_format_str(data->plane_format)) {
> +				      /*
> +				       * FIXME: joiner+async flip is busted
> currently in KMD.
> +				       * Remove this check once the issues are
> fixed in KMD.
> +				       */
> +				      igt_skip_on_f(is_joiner_mode(data-
> >drm_fd,
> +								   data-
> >output),
> +						    "Skipping, async flip not
> supported "
> +						    "on joiner mode\n");
> +				      test_init_fbs(data);
> +				      test(data);
> +			}
> +		}
> +	}
> +
> +	igt_vec_fini(&tested_formats);
> +}
> +
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *)=
)  {
>  	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
>  		test_init(data);
>=20
> -		for (int i =3D 0; i < data->plane->format_mod_count; i++) {
> +		for (int i =3D 0; i < data->plane-> async_format_mod_count; i++) {
>  			if (data->plane->formats[i] !=3D
> DRM_FORMAT_XRGB8888)
>  				continue;
>=20
>  			data->allow_fail =3D true;
> -			data->modifier =3D data->plane->modifiers[i];
> +			data->modifier =3D data->plane->async_modifiers[i];
>=20
>  			igt_dynamic_f("pipe-%s-%s-%s",
> kmstest_pipe_name(data->pipe),
>  				      data->output->name,
> @@ -757,6 +859,7 @@ igt_main
>=20
>  		if (is_intel_device(data.drm_fd))
>  			data.bops =3D buf_ops_create(data.drm_fd);
> +		data.plane_format =3D DRM_FORMAT_XRGB8888;
>  	}
>=20
>  	igt_describe("Verify the async flip functionality and the fps during
> async flips"); @@ -896,6 +999,11 @@ igt_main
>  		run_test(&data, test_async_flip);
>  	}
>=20
> +	igt_describe("Verify async flip with all supported modifier and format
> combinations");
> +	igt_subtest_with_dynamic("async-flip-with-all-modifiers-formats") {
> +		run_test_with_async_format_modifiers(&data,
> test_async_flip);
> +	}
> +
>  	igt_fixture {
>  		for (i =3D 0; i < NUM_FBS; i++)
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);


Now to some over-all design. First of all, let's separate out the changes a=
ffecting existing tests and the ones that adds a new test.

In addition to that, since we expect this property available for all intel =
devices, we should trigger a failure if the property is not present.

Also, we don't really have a fallback if the variables like async_format_mo=
d_count are not initialized.

Regards

Chaitanya



> --
> 2.34.1

