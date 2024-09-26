Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ADFCDE032
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 19:48:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5974110EBCF;
	Thu, 26 Sep 2024 19:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YZJRW5E0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB19C10EBBC;
 Thu, 26 Sep 2024 19:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727380126; x=1758916126;
 h=from:to:subject:date:message-id:mime-version;
 bh=TkE5hJJqZMqrzDHoDlgatyRLqw8Zo0gedgo8gveVpxQ=;
 b=YZJRW5E0EUibthMpAAET6PknPa1XaG9hBavs3OFPchAGvAiGMwYbMbDF
 hh0dHy/SSJH7tnrwNVd0S0Vvmu6O7xVbl8WM4kUhQFgPxQW0vNHHPqXcE
 ahjwGBgPZXRhgUY9vFW3qCNOKB4pZjsc6//XWDHROTE9Abf5mLTpld4bF
 1TFNaU9Eh0AGs0L7FoM0RkoZwaB4Vb2tspqHfkInnOruGR3F8+V33ZRer
 HNspw51DAUN1suMd7GB8hOmdBV2HXG5FKPPlN/c1X96wt12lsJLUbqMto
 oBL4q5RTnAci7rwb7RhLijbnnho3LAo+P9XrV73iOsANGaz+w7AFkLhsu w==;
X-CSE-ConnectionGUID: ZkFB0YlDS36LJ3D/n5QPNQ==
X-CSE-MsgGUID: ay2bM1jAQCCrfjGwwIh7JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26644184"
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; d="scan'208,217";a="26644184"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 12:48:46 -0700
X-CSE-ConnectionGUID: YQ23S6J0QeCFIVuI2mevUQ==
X-CSE-MsgGUID: rk6sN8tYScGuoMP1TqoZDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,156,1725346800"; 
 d="scan'208,217";a="103067056"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 12:48:46 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 12:48:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 12:48:44 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 12:48:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 12:48:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 12:48:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aUI/+TGO7t811P7EfbYjxFOl3rqxh75O2DyXgKEhl83mmFm4sVpYXf/qs6Miw1XPV6dkkZlvmXTNA4fsAZrg7uH10kPI3igYXLeSZ1HO0GNKQ7CXO7ixa8amsH2SNCNppjd4DtUUmRiInquY+1OiU6oMU5BSjVX5tVPvKkNTBbMZdpnHXFMNky1s7Q6UT0zYlnHB9bzqCJtZsFe/xtUJsa4s8NmYEOj7rjljeTljrSMh/4QpgH404w1qXZPM1Iyf7i+Cr1/V3E6WxDtVucqX/LHMlhLf8rYFy8AfOd9Y022jtJOenlen3DoB+xDothxhPtep8YkMiVLwICLF9isvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkE5hJJqZMqrzDHoDlgatyRLqw8Zo0gedgo8gveVpxQ=;
 b=CN699vcZwV1J7aHb6DFu6fbZnrHfnUl7hXaSUyr+g1h0l2Z7DDV29szM0KObj+zsHuhIlwD0L3JYqfmcFFUtWwu5OAbaje5Rj0MsuEl93ese++ufdkgVc1jUqRi8XHD5Fj6cCd3xZ+Dx0AopLB3HrSlkwN51IFyCgnwpEeL0ZTbc/IEnm8sK5RvnT6VOyL9L3lZajJuVuQVR1TGtSkUJzdCXwHKSU91bNuwRzW0IbQVujfeano5QPZK/RBaKjv/f1SpUUN0t31UXtscLC9+e4yIi3523l9iNZ0fQZ6EMc/b028onibYQ8h0m1kcwQkvA8+9xlLcrbM8hXyDhrMvuVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB5861.namprd11.prod.outlook.com (2603:10b6:510:133::8)
 by CH0PR11MB5234.namprd11.prod.outlook.com (2603:10b6:610:e1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 19:48:38 +0000
Received: from PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf]) by PH7PR11MB5861.namprd11.prod.outlook.com
 ([fe80::b320:4d74:ffda:ecbf%7]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 19:48:38 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
Subject: LGCI Ubuntu 24.04 Upgrade Done!
Thread-Topic: LGCI Ubuntu 24.04 Upgrade Done!
Thread-Index: AQHbEE0DLo+66HLi3kaNVOFfwW2vHw==
Date: Thu, 26 Sep 2024 19:48:38 +0000
Message-ID: <PH7PR11MB5861451AE3DCE9545A126D8A8E6A2@PH7PR11MB5861.namprd11.prod.outlook.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB5861:EE_|CH0PR11MB5234:EE_
x-ms-office365-filtering-correlation-id: 9f6bd3a3-ddb6-4af2-40ab-08dcde643760
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?moBq/l4DmZuCDVwwoIT+hmXBBSvxhyC21madHZY50cxZrQrYm1d2zr53qs?=
 =?iso-8859-1?Q?WXvyrNp8wukNxoMUSrhcWxrrV1xxmQss25B96hwB5wZwHxbDuUDDnBjTVD?=
 =?iso-8859-1?Q?/+PQYOwLiDdd3S2gjp7kzYL2tm4eIvAEfQGrkwBFU9v/uFawYIN/tJoCNx?=
 =?iso-8859-1?Q?6bHfcVCHcTeR1t20lq7IZBTQ93/R6io1z8eADOd6o3inb48Xp/yLla81IK?=
 =?iso-8859-1?Q?Jdgoypp+d/tuJpjoxvMm0eHwJv1AeKoKZ4ZyQyBZVwtdp5nPyc7vxM9BHf?=
 =?iso-8859-1?Q?15fcVB+KrcyRW9nMY7kK7r7j0PDp1L1MNEfg61s1eXpjYOY5osheDd65b/?=
 =?iso-8859-1?Q?4FGQKQ9926hIBX+AdPORPqnWfrftuc3ugKXovk+D4porJ+f0QY2SBWf42i?=
 =?iso-8859-1?Q?WSN7TW5kayLjs7Le+/0OQwqOA3Sp7gof+rTXThDAurXoctmARlAKVhLafY?=
 =?iso-8859-1?Q?cxFMeesZwcRl4bg5tWIcCWzBMd4/4eVlOwCBsTWGABGqZ88UyAOiu93HdL?=
 =?iso-8859-1?Q?UNSpsqm0LbioeuALT6UiR36TuTgRVqnErHyPhhGbOTCd4EIUan1qRlk8Yy?=
 =?iso-8859-1?Q?cVyYbuI+axcvCuLnRu4rLxl1NxruEXpENX+Q7TjelWcfD8VrWhvHkGBdZH?=
 =?iso-8859-1?Q?ODxQRawnxJUCuQK52QISekqiFtyy+OH32g+UHe70mNf/RD8WcGP6OeLRWw?=
 =?iso-8859-1?Q?/zhdIxpsMl/sdpA1K8RjQaPa3EyG9Lh1d/QO/2ypgDlQIfxEY0qNtmdP/Z?=
 =?iso-8859-1?Q?yOwTrfmxgeqOXaK6kwV65ng6Dpyp5p0tm1Q3dnPF0xJeCb6C2v0AVfUBP8?=
 =?iso-8859-1?Q?V1yLTerYB9BlCADkjSW9v0RyyHDbt0dUeEm5iDarzpPF1oMGS9K2BVu0fA?=
 =?iso-8859-1?Q?RCTWKx62nLC/98DjCCILnLQ0m1JTUlZd5s7rJf2fF5cSeXAt2aRYt4O3Nm?=
 =?iso-8859-1?Q?MeA65iFcxa8e9d2M9xg+AgmGIFyLfdx0Xrr9aNns2j49uxucH7xPDxxPQR?=
 =?iso-8859-1?Q?lbxI2brEK4htyR9ma21euGTXMKKk+KME4FNF+I3Lbzgxp064+nR/ouLnk0?=
 =?iso-8859-1?Q?WipS2PrWIMSRvGI3dqRTuJGFTTkNwG5rYmXswfu9Xbk/rUpq7LX/MMXOM0?=
 =?iso-8859-1?Q?XB9xT1EVGvsvL9skodXJrplGIbboMvMepj8PeuhfNmbUU7p1C1MMrkLKvl?=
 =?iso-8859-1?Q?R07/e5ZF5TapStItq1pwuHL+rkwJvFDHad55jsOzl1S4lWC9P/dE/k8Y78?=
 =?iso-8859-1?Q?La/DhjEABBDuzS1mpVDhQg8JOH1rkjGL40yomhEFN1tv2YsSSeX0JKJTX7?=
 =?iso-8859-1?Q?kfWbyLvR2zZEV0jCTKwPTSN/f5oMyIbkb1P4s0VmOgeP1A8zJROsnCDErr?=
 =?iso-8859-1?Q?JJ45k0LV2sltMLw/EoHmplTN04u+KbMQPRv8lgE/VFxBmTyo9B8VKEDlqM?=
 =?iso-8859-1?Q?jNfydbmDc9Unqpsv9aatCwOUtdW9+ClyUhJVcg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB5861.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?b68Zv89xFdrukVi+je7XNA8gEC5aNWF3UIK9b8f/D/tQfesmaxcm0RJQTW?=
 =?iso-8859-1?Q?kPXHGT8olinMItaEVM9JNuRorz1I+VHAgBJXCnxqTKEBXxDr5ikTJw1psJ?=
 =?iso-8859-1?Q?9whmq3Mpn/Drpr/r7C4k9I8IPc8d9SBgfew4gL7JfC77glOqg6G0CYTP4f?=
 =?iso-8859-1?Q?uly9a4zEocBTcmVrLSvlobsotilovGYR7aRuyhdwnipa1LIpwRFf7UvglX?=
 =?iso-8859-1?Q?LkQVsvuSdhBAJrP6edHOZCYe8dHGEzZoEtW1+AgAHu5mJIB7l3Dqm0sC1O?=
 =?iso-8859-1?Q?81hgNxZY9wm9NH9BcvUxNawqnR5vvOA2AOSXMroCk2ZxAVqqbxSKMXnWMn?=
 =?iso-8859-1?Q?ZSOp456fdL7DxHikZ9042AL+SmYGXmaLJljdHh4V75PUTsGq65sgu1nEeo?=
 =?iso-8859-1?Q?Fv0GTb+OWdmKnQaY33EeWMnzB/C2M806Bn4EZfLNZHm5RLYGyUccfMDJ0V?=
 =?iso-8859-1?Q?YgBu2OsXmEiZ/V35ZSo8mRvNCblHGb2lhlARz+NeaiAQIxpbMd5HtAFaKU?=
 =?iso-8859-1?Q?aKiKWgp/P0pi/PLPitlERLRvQw8P5ffWb9Ar35Yj9Y5MR03u1PrWmmUCxP?=
 =?iso-8859-1?Q?xF2p/iFQY++kamue8KDfbKjFdS9Kufd2MA2b+HOORDmYj+M7GyvOibKTxw?=
 =?iso-8859-1?Q?ai7pR6UeSm7oVx/tdf8Y7h5HQN4g5g3qSRrSY2/AytpHl+Py4cmo8g0tik?=
 =?iso-8859-1?Q?0yBbvP2MtGIvRdV/zwsb80GYj1qrEeNCcPy0YxyOxKMpvogz9uylqFggiK?=
 =?iso-8859-1?Q?6lQi5S407ODc4ik1XnArZ1XJly2EzBLtK7RaND4yFeakzx2lmMsN2ne40h?=
 =?iso-8859-1?Q?NTtt/6GiViugfU4R2DLV4Xf/FkWpBWqcSVJZr4l4oAFHQzyuTdT/MXhjZI?=
 =?iso-8859-1?Q?WXlpAWnZlFZdRhSd3b/eVKfj4zndzy98ubUaUTcMv81LX/hnP4qvtiC5PQ?=
 =?iso-8859-1?Q?cZtdjYdeariEp9Uy1yGXb7DDlJUlUj9QW5KF84TdAOfQ+ppwtwmvhnhIO9?=
 =?iso-8859-1?Q?75O3XHjDqs1QYci88B642kcwg2hCXlZwfWIlv5VofZ4JKPPegRzxkawCXx?=
 =?iso-8859-1?Q?avNazs9cYMSQQpj4zHlClrs4te/PWxOcTm+onIDis84lPRDRs+z1CkgrEu?=
 =?iso-8859-1?Q?r7vDdWTVp/Fo0Hlc9O7WzhQI3UHOpBx/LcnfT1by1zMZofmEcP6CSW0/H7?=
 =?iso-8859-1?Q?nLGY9dHTEcz3jYXjJutY5eAl6YS6wzWOp3qzyNfT5igYI1Uuf5AOdKuyoc?=
 =?iso-8859-1?Q?/AC0ItgTHb9/onjZhMqsUaiETG2J/6alV4ytOJgLfcOjUHpsY+mNyyvycm?=
 =?iso-8859-1?Q?UtCTQWIa5KPiaK6ns0cK8L3PtiiPOmU0ZKUI15I7SRGNTl9hylO+kfZupY?=
 =?iso-8859-1?Q?llj7UL9Z2wOAnqJ7zzSZI2+crEnAPMlQS66SMTuXAe8zHr7BC2qfqZRfgG?=
 =?iso-8859-1?Q?fMlECQA34fRvDGzCxdTw/mwEclL4WgVexYGQ1V1ydkD8WujP+iVuRFB/vU?=
 =?iso-8859-1?Q?Renbd2WQW4ypshA2Uj6c2PTEhh/R0VKltkdSCzfPKPLCNq+E12boOJAyrA?=
 =?iso-8859-1?Q?6OZFFcjDUYOn/phxjtsVdNVj7PVLUQkV+EB3I3u7gJcFM0Q+CcQIrHmRL3?=
 =?iso-8859-1?Q?4t3twOegPb150=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH7PR11MB5861451AE3DCE9545A126D8A8E6A2PH7PR11MB5861namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5861.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f6bd3a3-ddb6-4af2-40ab-08dcde643760
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 19:48:38.6552 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yJf2rnmrTPMNr08Ug36iad1r29cBuw9FbllRmBQPHPL/G0hrIDWjhA9DLK0cEaGg7J6+MK+HZXCtnkVuJF9gkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5234
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

--_000_PH7PR11MB5861451AE3DCE9545A126D8A8E6A2PH7PR11MB5861namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Both internal and public CI is back online with mostly full functionality. =
We are still sanding off some rough edges here and there, but it's safe to =
start reporting issues with previously functional things now.

Thanks, Ryszard

--_000_PH7PR11MB5861451AE3DCE9545A126D8A8E6A2PH7PR11MB5861namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Both internal and public CI is back online with mostly full functionality. =
We are still sanding off some rough edges here and there, but it's safe to =
start reporting issues with previously functional things now.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks, Ryszard</div>
</body>
</html>

--_000_PH7PR11MB5861451AE3DCE9545A126D8A8E6A2PH7PR11MB5861namp_--
