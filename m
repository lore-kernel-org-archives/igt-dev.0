Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F2EFCCD184
	for <igt-dev@archiver.kernel.org>; Fri, 17 Oct 2025 04:21:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2A310EAEA;
	Fri, 17 Oct 2025 04:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PP+afG6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C68F10EAEA
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Oct 2025 04:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760674871; x=1792210871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PAxU5hZ0cpe03RAnMcqcMi2XjRvGpkGJA/cyTT+2eG4=;
 b=PP+afG6Nwe1fvSEUpb1pgMWybbIs1C/gKVqIk6KYeZyypboi/UFXjE8g
 ZfX3gPvsfzZqVr2DOyAOSc+Ulg8eTHdVLCZkIjRYzJkMudygsgXFTVoYV
 p76M9htQaqhkEh6kEUf4XHAJHoVrC9VfIWQsR0i7KVU12TNNSk5BoeaM6
 RbXYkt1oQuk879eIUPXSUPBuf6ueCvPpm/LE9PhU4jzulxMIFGkQk+4BO
 MdEu044c8uwncCbMbsOnPkqGoTwV0k8IMJiDUYtlIWsewKudAnebmRjox
 jDzx/TGVTFgFl1Pf9cGChqpFzrlGL/DY8+Kpe+eXQPeOTGbBGNSxqQvBu w==;
X-CSE-ConnectionGUID: yTH8ONkVRMS2Q2+aQtXj1g==
X-CSE-MsgGUID: bGBQCBL2SnGkMeFwYLPCpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="74322300"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="74322300"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 21:21:11 -0700
X-CSE-ConnectionGUID: bGwlfo+2TaOQdS+V2D0khA==
X-CSE-MsgGUID: 3YVH3t6BSI6SS6ZQopkCMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="181831113"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 21:21:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 21:21:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 21:21:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 21:21:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGXrr6z7y4WLxny50iAaei3Mk8LFE+9qv55LKgyQbkt5a92sjIqpouuw/kRJoo3b6yQAzUwRg8GGAclOJQbyrMaol1JShIGdEZAvcYtePQdJtwjLVBdk4QdfCOloNxBUvmKzXCEwLbDf9psGEXmTjopkmAHSvgCIHk/d/glGjRoDrAgOoG7DMnUzcRE21lFj4/qlxwNsFqAX87Ey8WLmQzV9rLSfXQQcz/9zN1Y4ialES3/NYpezBzAtQUNOdAO86bu/ABimFxCYFEAnloCuex6AxKBnXdK7rspcri6o18rDgPzaDNS0lpFq0VOservfGJzkhHvL9pNfOakfD0UUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mYzx3aTYL1i9SGPDWoR1OPtYqKcI1pGcQ5BNfDlTUVY=;
 b=rEb3v5G30LDXMBGSb7rynRtiG2VLwjEDPg6yiQWNZFPyHI2ck9773p65BuLMCc3ePR28yE3lgyAYex4SYLufxTd4gOVQVYNzwBiAQnZSn0uP+gg9HKe+OXfFtqtkYH8Mof4SM/wB7cnC1WqPFjPksa+77+S44rfUCDLUCUaIL9FzWtAJ3q8ZE/1j07Doys79+uliGkiNdkY/WbSu0dBuIUROblTbkZP748HJzj8/suQFAYJaxV8aQ1Hjw8xVix2sngoO/c1oFGtZ/yaM4eLbndCDdRYwu4AgR+wc6bhYTJPGcKj4rs0NNfXavxbFleR+jvIBJh0QUur2lqLDSdDQKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by SA1PR11MB8476.namprd11.prod.outlook.com (2603:10b6:806:3af::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 04:21:08 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 04:21:08 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v7 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Thread-Topic: [PATCH v7 1/2] lib/xe/xe_query: Get runtime xe device graphics
 version from GMD_ID
Thread-Index: AQHcPZk5nRrgllQzU0+wPcfbHJMFCrTFWQsAgAAWeJA=
Date: Fri, 17 Oct 2025 04:21:08 +0000
Message-ID: <SA3PR11MB8046F85F2B7082E6BC4E493686F6A@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251015060144.6410-1-x.wang@intel.com>
 <20251015060144.6410-2-x.wang@intel.com>
 <20251016221338.GO5409@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251016221338.GO5409@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|SA1PR11MB8476:EE_
x-ms-office365-filtering-correlation-id: dd746133-019f-4710-bacc-08de0d34989b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|42112799006|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?58QKVoWcrkMssyNEDokF9JazBJBqSPJdQAAwq/7Ze3QZxAxcU+l92Iwe1hIL?=
 =?us-ascii?Q?i08JbLowIR8oXfJXPSEiRn9MCLTVM50J8vH8pM8ESYG6hqNDOvyIyXVnZTJA?=
 =?us-ascii?Q?O/ZjLmzPZGevnr2fy50I/QtxPYv88EN3U68D6Y4Ago/IGbxSPlXUewB7IMSx?=
 =?us-ascii?Q?xVMWJ0ntKAekVw410hpyeLpIbNmCKvPlduc0uNhFRim+hu+LzO4BPETtHbed?=
 =?us-ascii?Q?I1q+i81w0O4Wf2GvXGTlke/kpQwGjN2HY3oLOgAgamnHtuRqeuuYI7dYllx3?=
 =?us-ascii?Q?jdeODHJuUSx6LXK29k2l7+aIyn0rZ/pWAFszLL4pEPOUjhnuAJVy9FzPkzPm?=
 =?us-ascii?Q?amSLOqt6fc9QcuWZnhef9PVVrCocNKZMZdf0CcMCPs/5h2zSFaIHpiNNiU0j?=
 =?us-ascii?Q?oa92XoBqoTf2sQQhylvpAg6ovEnWQvUxiUIyNGG5NmT18ybRKgsAQYwlKmUi?=
 =?us-ascii?Q?X/VrwIPKIVhdJd7DJnJVbo3olvIsqZtGAO7rAbNHRG3XrXe0F4c7Wpgg2AMg?=
 =?us-ascii?Q?8y20JEN2iVoVfrRcLHu6tBqKvPGoFlu1MLZLrpe/04mhTyVmGKiFMHI+oY6H?=
 =?us-ascii?Q?C7jycrD71AMEf2AfEMXx5/2RgbWTnuu81TW1pjUH1bEXnnZ83rXwNbKm0RpE?=
 =?us-ascii?Q?Dib54GZepds9dRWx4zIHcFya7z+8qrCNupP9DoAJ+tP/hqyBDwo4kTn37BPu?=
 =?us-ascii?Q?tLAf3tPWenttA4UDzAEitEfJBjAwHKF4bMzhjam3nzgiOebY8kQTB1K/A3gw?=
 =?us-ascii?Q?4BNkwY1XVpvhdtbc1m+6IMCASTlv4ViSJ39Pghv+Yi4nQ3eF0zvTwXhxg09U?=
 =?us-ascii?Q?Lc/g1FTK39ZUGEoma0ALLho2tzAdBan9QHJCRguOUh7U36SqhBlPM7V6+p8r?=
 =?us-ascii?Q?tdLpU9Ux/31pQzL8WFLkwA3dpCVXlKzNF29E5ol6tcqirlHJMGSNuFAYQBf7?=
 =?us-ascii?Q?Un+AwP8lGF8mZzUK3YWZsCBP82aHy15zYq/iEp1yoUqqTFWmSMcknbF2mY0F?=
 =?us-ascii?Q?ILnpfEx/p26UFdBmAI6tW3bxW02xITywdJ1gwgLlUKDddCxSDKuhIP27HDKw?=
 =?us-ascii?Q?x/NYwjgcfkdKsiiban9VBLpiBEohIYoFVmcEo6BPzFUCfnBoNVD7mtCBjA1D?=
 =?us-ascii?Q?Xffv/1WY4ojxNwx78aCAKCXA6kyZ7nqKhGavMSLAAJbNjR2lHbxo80A1boiR?=
 =?us-ascii?Q?QjkMFbrZpfcQVl14AMxwkhJ6L/XpARU9Vk/G42NpAmHH4zolcFoPP6llml5T?=
 =?us-ascii?Q?HJb8tMcIKXC7j2xFeJJkZGUPR3Yq2MeTlJsdDG9SBQ2ELD1CmCJ2F86ICDEh?=
 =?us-ascii?Q?VYjR58XkDvfKyunDRsN0mvJX1aSdRZD+oWedTjdJpYmivkJOWJ9VH5U2O6Fa?=
 =?us-ascii?Q?Pvf9omPKHHMtR0SwbzpFocxLOVyD1bC+Lm3afq4M6VUS5q79vdAABZhLeWRm?=
 =?us-ascii?Q?ZuXEgymcneaD9nUgYtUUD7TG36D5UTDmQmJNSWq/I4D9UFOi5PIX1jSVUpU/?=
 =?us-ascii?Q?8I17oN2THnbWt5mja8vlVIg/xU+Uf1zxx2j7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(376014)(1800799024)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/AD2ctR1QMwMxO2FYOibj1wVoKDgDmdTq4cVQcD9/ByLRVPqMXgIxwvo1RyL?=
 =?us-ascii?Q?7qRJtuavnvZePiLtI5GDFnGGBRgE39bqiOrpo9ozSfmHdP+C9UnZ8a+Xw2Dk?=
 =?us-ascii?Q?1sSdI5e8q3rCT0n/bUkIi43jnt+kqDjoeUdBq+JQl2ux9BrIw8wgDqI/R+fI?=
 =?us-ascii?Q?hUQMzxLy6Zp9PUNNIRe57oWrlIQKzycFaPhokYCtzae2CYiw/qEYdGqskyvM?=
 =?us-ascii?Q?mgQt/pG6y9RwTybKpMKbD9CMyW2hMK7WUtr3MIeTYFx75/vO5Tkm3o8KR30P?=
 =?us-ascii?Q?r1Xh0cQVz3YL1G3Y7kc6psYClj+sejEXgw7YT96Nb0Z5tXClOdNLT33JV5fP?=
 =?us-ascii?Q?TGDsBBNtz92hmT5/AwqZ62NSjIqAyTsY3go7wqog1keWY0IF/b6dxHSXmhuo?=
 =?us-ascii?Q?jMoI/VObCqui+YWK2Rafew27z5UoiZ0ki+NSkSwCzv6/Ujf1wav3BVAAkxlm?=
 =?us-ascii?Q?2cwel9GlrJbzzsAX+Q3AwYMCq6rNGLTy9yr0ZoYvur75gSsyMG70ucbpYikq?=
 =?us-ascii?Q?4tIZ9qAxD/pkX0xvlYTGQ/Q1HtIB8Sh0DHyIcO5KeP6hkRekWYnd3Wji443a?=
 =?us-ascii?Q?ogPk+pSpIKmqkSAQ8PwYNXTZQ4qDOMR5slxzMWnyyRE2EuqhITStSoFAI6BD?=
 =?us-ascii?Q?kPuj5/Zql8rK52ly2xBJPPd7XZjiy7uIYMYJzfIULK4PYgxy8BbRuOE5X5+d?=
 =?us-ascii?Q?xDQ2wbmdm9+NpMK8/LOh5LXNCP2uAkt3oFlAbE44lZ6N6whtdk7gKVuBrLs5?=
 =?us-ascii?Q?Y3lbkQnzJLPidRMFsK27/P+LQL5MV/tM7zo234ODAXbRoLppA9iK8sUgJR+z?=
 =?us-ascii?Q?31Ym3SGg2/Pce7HSlzLcgbG86jG3yKU0W4Cgo0ZpaXdvCvYrCOPi27ISGjBg?=
 =?us-ascii?Q?ixiEDt+rAM0xRo30odWY2WDttnMXAXn+vbi9i7DdmUbPCjrzaCskt6gYx1zN?=
 =?us-ascii?Q?Ej4mk/ZkjctMf4k4YGEO09JGPHcEr9VACSe7hqdSUrOu1tAAqqr4j/APbVat?=
 =?us-ascii?Q?LK8lFjZhD55Ac/lP8C+U2Ogl4X3n1YhLn4FasvEcRzxPdE1reC2wd2tDmexL?=
 =?us-ascii?Q?vh0NOqDwqd1MNv8yMnzEOI62exGu4nnKHIr7WtdYMKLYqgJeLR66O8S6GVrQ?=
 =?us-ascii?Q?Tb3rvuLCkzJv5mFrXNk3mJvtPLY2rDUZoz/eE6RsBIXDObOLxdTcbYPxFQDd?=
 =?us-ascii?Q?m09pSUvwI+pdp2szjWRiYxsGa6Es9Gi+YoYU6QV5X3dCO4hmR9N1XB+TCZh9?=
 =?us-ascii?Q?kIx4KS4FMFJtCTRv9KGe3Q1YtbzuU5X0fywZ/0RP3RDrF+SPigA0LiH9kf+A?=
 =?us-ascii?Q?+h4AKVLct9Nps8zU0s+Lp++h6z81k29v/MjmNX4yiYg8eX5KJBwB63rM7BDr?=
 =?us-ascii?Q?SOVsqCtOXM8P6hsPNsW5jO29ommCfVeWZ9ltzAtQ9IUZH6++7oD+KF0IDLhJ?=
 =?us-ascii?Q?KAe3seie9Jme398disFDCehpzBi8S6TxGGrjUHGT8NQSZ0LsX3hTpiozq253?=
 =?us-ascii?Q?E0Cppy4a9uVpX/drhw4j39KObUas6kgz8cP5arxkEaL2QTxNlpVSz0FpIUCW?=
 =?us-ascii?Q?O98NaSazMXbmV/tlW0Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd746133-019f-4710-bacc-08de0d34989b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 04:21:08.2703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+jPySNeXITFT6EFe75w5IDKhpX54MJUyvo+5SYCpz3CTK66XaGQ7vwQZvFnLbmcSVfo798fl8fzNUbuI93IHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8476
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Thursday, October 16, 2025 15:14
> To: Wang, X <x.wang@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH v7 1/2] lib/xe/xe_query: Get runtime xe device graphi=
cs
> version from GMD_ID
>=20
> On Wed, Oct 15, 2025 at 06:01:43AM +0000, Xin Wang wrote:
> > Add intel_device_info support to xe_device to store accurate graphics
> > versions retrieved from the GMD_ID ioctl. This allows IGT to query the
> > exact IP version for xe platforms.
> >
> > Key changes:
> > - Add intel_device_info field to xe_device structure
> > - set the graphics versions based on the GMD_ID
> > - Cache device info in global map indexed by devid for efficient
> > lookup
> > - Implement xe_device_get_info() to retrieve cached info by devid
> > - Clean up cached device info entry when xe_device is released
> >
> > Signed-off-by: Xin Wang <x.wang@intel.com>
> > ---
> >  lib/xe/xe_query.c | 33 ++++++++++++++++++++++++++++++++-
> > lib/xe/xe_query.h |  4 ++++
> >  2 files changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index
> > a89e0b980..b7c9a2bec 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -335,6 +335,17 @@ static struct xe_device *find_in_cache(int fd)
> >  	return xe_dev;
> >  }
> >
> > +struct intel_device_info *xe_device_get_info(uint32_t devid) {
> > +	struct intel_device_info *xe_dev_info;
> > +
> > +	pthread_mutex_lock(&cache.cache_mutex);
> > +	xe_dev_info =3D igt_map_search(cache.map, &devid);
> > +	pthread_mutex_unlock(&cache.cache_mutex);
> > +
> > +	return xe_dev_info;
>=20
> The function name here makes me think that this is going to always return=
 a
> device info for a device ID, possibly from a cache, or possibly from othe=
r
> sources if the item isn't already cached.  But it looks like this actuall=
y just
> returns NULL if this function gets called before any
> xe_device_get() happens.  I'm not sure if that's what the caller(s) will =
expect,
> so if the intent was solely to provide the contents of the cache (and NUL=
L is
> expected), then you might want to include "cache" somewhere in the
> function name so that it's clear and this function doesn't get misused by
> accident.
>=20

Maybe I should just use the name like xe_device_get_cached_ipver()=20
The return value can be null, since the intel_get_device_info() function wi=
ll be=20
called before the fd open.=20

> > +}
> > +
> >  static void xe_device_free(struct xe_device *xe_dev)  {
> >  	free(xe_dev->config);
> > @@ -379,6 +390,21 @@ struct xe_device *xe_device_get(int fd)
> >  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->gt_mask |=3D (1ull << xe_dev->gt_list-
> >gt_list[gt].gt_id);
> >
> > +	/*
> > +	* Set graphics_ver and graphics_rel based on the main GT's GMD_ID.
> > +	* We should use the hardcoded value for the none GMD_ID
> platforms (ip_ver_major =3D=3D 0)
> > +	*/
> > +	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> > +		if (xe_dev->gt_list->gt_list[gt].type =3D=3D
> DRM_XE_QUERY_GT_TYPE_MAIN &&
> > +		    xe_dev->gt_list->gt_list[gt].ip_ver_major) {
> > +			igt_debug("Setting graphics_ver to %u and
> graphics_rel to %u\n",
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_major,
> > +				  xe_dev->gt_list->gt_list[gt].ip_ver_minor);
> > +			xe_dev->info.graphics_ver =3D xe_dev->gt_list-
> >gt_list[gt].ip_ver_major;
> > +			xe_dev->info.graphics_rel =3D xe_dev->gt_list-
> >gt_list[gt].ip_ver_minor;
> > +			break;
> > +		}
> > +
> >  	/* Tile IDs may be non-consecutive; keep a mask of valid IDs */
> >  	for (int gt =3D 0; gt < xe_dev->gt_list->num_gt; gt++)
> >  		xe_dev->tile_mask |=3D (1ull <<
> > xe_dev->gt_list->gt_list[gt].tile_id);
> > @@ -413,6 +439,7 @@ struct xe_device *xe_device_get(int fd)
> >  	prev =3D find_in_cache_unlocked(fd);
> >  	if (!prev) {
> >  		igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> > +		igt_map_insert(cache.map, &xe_dev->dev_id, &xe_dev-
> >info);
>=20
> If we're using the same hash map with both fd's and devid's as keys, isn'=
t it
> technically possible to have a collision?  It would probably be extremely=
 rare
> (especially if 'ulimit -n' hasn't been adjusted upward from its default o=
f 1024),
> but it still might be best to just use a separate map to eliminate any po=
ssibility.
>=20
>=20
> Another possible issue --- don't we have allocation lifetime problems her=
e?
> What happens with this sequence of events?
>=20
>         xe_device_get(fd);
>=20
>                 - Nothing found in cache; alloc a new xe_dev
>                 - Insert    fd =3D> &xe_dev       into hash map
>                 - Insert pciid =3D> &xe_dev->info into hash map
>=20
>         xe_device_put(fd);
>=20
>                 - Remove fd from hash map and free(xe_dev)
>=20
>         xe_device_get_info(devid);
>=20
>                 - Return &xe_dev->info
>=20
> During the device put, we only removed the fd key from the map so the dev=
id
> key is still in there and available for lookup.  But both were pointers i=
nto the
> same malloc()'d allocation, so when we free()'d that allocation on device=
 put,
> the pointers we get back from subsequent xe_device_get_info calls now poi=
nt
> at unallocated space.
>=20
>=20

This issue will not happen, the delete_in_cache() function will remove the =
devid cache before the xe_device_free(xe_dev);
And the xe_device_get_info(devid); will be called only once, even the xe_de=
vice_free(xe_dev) has been called the program=20
still cached the devid --> ip ver mapping in the intel_get_device_info()
static __thread struct intel_device_info xe_dev_info;

normally we will not have this kind of scenario, I checked all the test cas=
es, the xe_device_get_info() function call is
happened at the very beginning of or during the test, none of tests and too=
ls will call the function just during the fd close.

> Matt
>=20
> >  	} else {
> >  		xe_device_free(xe_dev);
> >  		xe_dev =3D prev;
> > @@ -424,7 +451,11 @@ struct xe_device *xe_device_get(int fd)
> >
> >  static void delete_in_cache(struct igt_map_entry *entry)  {
> > -	xe_device_free((struct xe_device *)entry->data);
> > +	struct xe_device *xe_dev =3D (struct xe_device *)entry->data;
> > +	struct igt_map_entry *info_entry =3D igt_map_search(cache.map,
> > +&xe_dev->dev_id);
> > +
> > +	igt_map_remove_entry(cache.map, info_entry);
> > +	xe_device_free(xe_dev);
> >  }
> >
> >  /**
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index
> > 715b64e2f..1a261866f 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -74,6 +74,9 @@ struct xe_device {
> >
> >  	/** @dev_id: Device id of xe device */
> >  	uint16_t dev_id;
> > +
> > +	/** @info: Device information for compatibility with i915 */
> > +	struct intel_device_info info;
> >  };
> >
> >  #define xe_for_each_engine(__fd, __hwe) \ @@ -140,6 +143,7 @@ int
> > xe_query_pxp_status(int fd);  int xe_wait_for_pxp_init(int fd);
> >
> >  struct xe_device *xe_device_get(int fd);
> > +struct intel_device_info *xe_device_get_info(uint32_t devid);
> >  void xe_device_put(int fd);
> >
> >  #endif	/* XE_QUERY_H */
> > --
> > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
