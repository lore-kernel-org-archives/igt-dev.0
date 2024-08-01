Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656C3C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B2810E15C;
	Thu,  1 Aug 2024 12:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9EBYo9O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEDD10E15C
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722515115; x=1754051115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fsNkX7Es8WtM5jM+S+kwULDXhehEERwCDoPBbG9c7Kk=;
 b=G9EBYo9O3qtmeVwkGfUQoK/NXpowM/c9fvDHkQrx6baTGx4vbo2doZRq
 Q5iSTSAYxZZgAfgXdm/Xv4R6ds0YUWT7FlM8MZZPsn/yd5VtMJgaaxw9c
 8FhMcnxc8o69HbNGKIDv40FlL0+YIzYPiciB9JoPsG/csTqYTsac0iAaf
 KnOKE4Dc8XnDzlKzxFLZv8CeIkLzMvLdk8GlKc3y3KfHSJ4CuhnX0+a7W
 MdxFzoA3v+C1jgYU016HTAB7IF3U3o4dR6Pbiqp6qM+F29NxS/D1OIl3v
 rbTXFF7w/4//84PXtf53lFj5sR0r0FfomCO9RNj8R0kkYFwsiPVWudRm/ g==;
X-CSE-ConnectionGUID: M775tZw3QE6PIHF9NrnfaA==
X-CSE-MsgGUID: 4ZPe051VQ96/7nv9WxMTKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="20599869"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="20599869"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:25:14 -0700
X-CSE-ConnectionGUID: AmwZaAmoQgiUtK/b8LQ9HA==
X-CSE-MsgGUID: bFNseIY7TaOXoiYJ8WRpqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="54678947"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:25:14 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:25:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:25:13 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:25:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoETn8pvg8DDbels3QRBguQo/80xfnpAn+5PtMIaHZiBmGxM+JX1frXPNucfM4dJxAdl8pe97TGT9N+iU1iRVjs3Mfq8CWwwqqu1JApUkkkuP7t7SbMPwe7JSzE8QiGrs9RCITaY4VB3N41rb1S4Zfm9wFIMAP9/sQosHuK8lVEDx37pQ7+1qvcJ/Nsf4UcU+nS0KV5H8Xx05M0bcoWoqI5F0FEv+f2SwYtXukzG9CGdbKTBKapIRwSL3JaRIySZzAIwGG8NW/mJE6KN0O8DZQF9pMe3qMISU9P4yb7D9PgTT7GVvufuU43GEj+XbnEt0QsQnsiYZB3zqITUpLGNxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yoKGR7InMZRvzFNWf58ayaF8cZNCriAYPqri91mBH9Q=;
 b=uVTf99HMDcMcYPkI2mcI0zkRu5/nhNPda4uLKh11NuLJgigSDXj/D96APjrB6kP627iM6ky/fVIqFAqKV4npVXfcYkj89x7kMXddo3719G3brGXzZWCv8nJM+aysl6sjmmwtV2g/6BZ7fmEkpW8zuC3fXFWKc9Wzf0TUpLjO3DepoBnwmXCf5C56qZ2gFy6hYX7Ma3SceYcgoL8X/vNGumoIC6aWkFuPTLz791zUnxs9ojcsqrKtoxHvRM61FLT3D81/M8WxJEHAUn1Tn5BmMnabnE1Qac+jj7lfB0T7vy6KyGR84X2TV09XwkakqO4n/iZblYBH8qyn/VVmc82RUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.21; Thu, 1 Aug 2024 12:25:10 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:25:09 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 21/66] tests/xe_eudebug: Add support for dynamic
 debugger sysfs toggle
Thread-Topic: [PATCH i-g-t v2 21/66] tests/xe_eudebug: Add support for dynamic
 debugger sysfs toggle
Thread-Index: AQHa4nZVC38OI2CPU0mR1fAHT1/6rLISVpHw
Date: Thu, 1 Aug 2024 12:25:09 +0000
Message-ID: <DS0PR11MB7264E8211358F4C99332E909D9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-22-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-22-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|CO1PR11MB5108:EE_
x-ms-office365-filtering-correlation-id: cc7d35d0-39f0-48a7-937f-08dcb224fc31
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?P85n6NUin6eFEHHP2Q0SsQlH6hhjoOT7cj7SLUMeymu3mqlbI/lGm0+j0Z?=
 =?iso-8859-2?Q?MTfgVekSLjQ3/AgZW7T7b/JxRwoZIEep93eVVFR3dVRjtk00QKSr7Ezhkl?=
 =?iso-8859-2?Q?Odndq0WfVGWI0VOLyDyeCG4uVk285ZSIoVz2MSEQFjA9xDTqL3wzT5qfJl?=
 =?iso-8859-2?Q?0VVCohVpFXvpgZpMX8i7GFZy7cgL0u25nWHpJ8dRQe6v/ZwOGbCVRUWeVW?=
 =?iso-8859-2?Q?zWY6FEVXRroRRoZcr0520tZHPv6UZCSifS+zX9+7nJYZeWMXemjmWXxjXN?=
 =?iso-8859-2?Q?2TM3R42S5Dy+DS3w9TfLrSlfuAXosXGaoJmp9qbwS8AbdsMa0bHvAI08Hz?=
 =?iso-8859-2?Q?eI3t1JgZ6xtIf1+BD0cRU42MwtiYaWkVLpqQoVFrgRNicLOj1XlZ+MOiot?=
 =?iso-8859-2?Q?TJouOd/6pAPEmfAzZfGnftN3WhWHUCilCg2xgyWMHjGLw6Ddr0PKZqqAQ0?=
 =?iso-8859-2?Q?BZA8EtfMCeh2l+XrCPisWvhkKsn7SAvQj99994jdLOt08tm+CjYsm2BLLQ?=
 =?iso-8859-2?Q?/kQVIBuIHpx4KvHMRdb8DO/dtNpabDkR4qQZPTlOgPDUnjsNY2ybMif04Q?=
 =?iso-8859-2?Q?9RH7FPuyXcCOdeO2seIMO8Y0pYiiZqSju23Td22e9X1Tsc+fpAxfPZjTQC?=
 =?iso-8859-2?Q?wH5E43lUquch+AIhh/lyorKIhCv/CXpx1vnjfGbSEDr2FkoEh5POxSrV3y?=
 =?iso-8859-2?Q?XnKq6/9YFVYticmvaMg7D4gDn4mhibI4ENoR+d07aK+5SHZ2+tqOc3rRJf?=
 =?iso-8859-2?Q?sLseWn/ojvHv3TLrJ6vBZOke86wPL4vBBXtOEb3e3o2VlMXHQx/wkArIWs?=
 =?iso-8859-2?Q?+HfX9yLHOQi3XiK58PlDLFgXMKWR1F87UsDyftS51ChfuOX/fRACr/61eo?=
 =?iso-8859-2?Q?ILjfYRb2rpW7Fu8RWDMyhCGJ4IKHfnRadf5savy28ZHRcMSof84jIMmlPu?=
 =?iso-8859-2?Q?EoZUjBkQKmUGze9HtCeF2AVEA3Jnhcfv7SOe3sKjshn0nbRJLglYakc3Hr?=
 =?iso-8859-2?Q?0szt//uFI2ugcfLEYIWNuOIeF17bYx0V1OPQGWExnVD2xypfqrSYJVc9O/?=
 =?iso-8859-2?Q?M+P1MUp6jZI9Q77uHonvER8Jvh0L/EL7A8YeD7XXKU5Tb8fyBDtUco71WF?=
 =?iso-8859-2?Q?wqslS9dZpBFc1LjHHJotubAg5d6Zjgf6JsveMLXwNmd2lZzI6ASvPnEuqT?=
 =?iso-8859-2?Q?o5+hflgX8hP+ReJ6HrBvdYwhIjJJx0KeddiVdJvofCyKoSGjyo55V9A5SN?=
 =?iso-8859-2?Q?uugwNQrKSPBfXZ3FJRelEJVA3P2QJTjsxZp74z9gM9VSmq8AVtNBQwf6Zl?=
 =?iso-8859-2?Q?eJ8xrHReDxNxnbc8Yvl3wzmaWRsxQVDh7HY57EBm5H5DLZrri2H6jx/ZdG?=
 =?iso-8859-2?Q?ZHkOxFmJP4gSqf6IboeWjuoFo1Xt5fZTKNQKavky5QKTz/t14MySCQqLp/?=
 =?iso-8859-2?Q?hWGmklYVqNGpY0uzorkNF5MryjLawWmZZFVbKw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?CtgL46nbjlf7luhb1b17XABUvFhUiJ+xd3EeA04c9jSIESXf7ZSRr+dU16?=
 =?iso-8859-2?Q?f1teDs7m8EpnxnmZXAelLUjVuejTWXkv7uLo9gu3lKSbYOFpbLLem2Oo4K?=
 =?iso-8859-2?Q?3SlsbHsxe67nIw944BlGxo7WweRE96H60ic4VYSwCJImMnDc4WPRB8x7d3?=
 =?iso-8859-2?Q?eH0LgsPR6GgxHbUdYxkYRKyandWX7bBu9ubNWwcbMVpRPi5L22mcTythsJ?=
 =?iso-8859-2?Q?xCoFBHqKK+ZS0ZgTSais2nljx/5q7pyrkLWGeAuT+BDPNLc28ZMf2rolfU?=
 =?iso-8859-2?Q?bh0TKFaXsBE4fSBaAaatdr/NXDyFaIFnQtnDS7uX6RNTi7KtPAGBdm3y95?=
 =?iso-8859-2?Q?uqC+aTF4f9arQrCVev988u5LAiHr7M+8ZDZc31iMJ7dAKSjRSwjZ0wIwld?=
 =?iso-8859-2?Q?GCyn9/PZBWp613aPkSPO8JmCI9CcoHVPD+zpR9die2jqIMnRePngcib82b?=
 =?iso-8859-2?Q?nL56h/EnS3TnF4FSl3etgGQ19ilxFQe9gq0FFHhVJjEnw7n8KQRFOK32dV?=
 =?iso-8859-2?Q?/T7mCHj6Ug2klxBMplFgoZPL31uiHX9+Luut9ruh8SZUH65PW3BGV57IbP?=
 =?iso-8859-2?Q?2Mo/bjx1DB2jxXXGkWlC/9wYvBCV0a3lma2T6cdsrQw21pYQL2GrUZJ4iA?=
 =?iso-8859-2?Q?iI9Lb/Pptgm/Q02A/cg2I/d+Aj8t3erTGphPPpaoqvHqC+RcDgCi6dKLqq?=
 =?iso-8859-2?Q?xtMAZ4jm8wTcxVv0l2e1gB+mWf586o/wTfJaJgsCeL3SPJ3d1Y3zeJa8/0?=
 =?iso-8859-2?Q?t6/DSdfHXml+s/FUFyT0W2jv3rBlMZpCWAa/CG9YG7Bpv1bKCeEkI15tvc?=
 =?iso-8859-2?Q?ROBSgHIeOt1CZLIIudyaVMsW1scdpv029qohFRAIhxACVUOjTznmKCR8FS?=
 =?iso-8859-2?Q?4+9boxjTQdCWRbF8MItcGdSTsP+xj6vtCYaAp4M09icd0yTmpHGuAQYuo2?=
 =?iso-8859-2?Q?k/3zOQDX2BL+GRFCQ0rdOY46HuNXaolgmgna6uPQoNhAHNolJRxlFwDgTQ?=
 =?iso-8859-2?Q?fBgsZqrJAgYcjQVPpaT1/FsH5WYWRc0gYhf1B2IwJbDeiOMfKzic6XDOTo?=
 =?iso-8859-2?Q?mGuBV7RcBRoWjqhjYuDo4tDGZ6ovruwl5KfnyVy3Jsbl98Rg3FT2q80rqg?=
 =?iso-8859-2?Q?rx2TljAkFhMvCO2zbhMjGpBA8ombZl2u6MCZ2iFm8vWdDVcUSbvXsXL5uT?=
 =?iso-8859-2?Q?2aX+AjIK2KlO+pjlKYMoWCveMIJomMVZakwKa3JirW45q962NG2a1jrl9s?=
 =?iso-8859-2?Q?l/2hv2orPQk0NCssVaww1I/Ou9uUnjioS7xmfb3dYcO1+p5UFouFjUmx8Y?=
 =?iso-8859-2?Q?Uwcw+Hf5LTKgqv2K9Jb5vCcWMWkggXYJmrhzl4YnVo6CoVq3iKspgszc8A?=
 =?iso-8859-2?Q?CciAPJgzYcGj0rW+JhgEPVBQpgl1bxw7SoyhyUjxZbxe/UtFNv6rwZ8izP?=
 =?iso-8859-2?Q?AEXwIUY8FtEdH77wY/k9EaMXKps9Bz+3uA4/VhYwFb7oSpHTpSd5Phojv5?=
 =?iso-8859-2?Q?Rxp2Gxx1MypGQ4xY6w7jVxYysYFuZ2FLSLGovKMwDBkqjgjryBhVOczkBr?=
 =?iso-8859-2?Q?6EWmFjBpxy/E/XqPjFaBQY56gmH6wF/ItuB8ToG2rRwSmjykXs94O5pNpY?=
 =?iso-8859-2?Q?K+7pDkDacWw4SvqvTAV94MX/d6BooTHRrn4h0hrhKQT8akfVSDNg6+7eDd?=
 =?iso-8859-2?Q?eYmJHl18MRn1czne3BI=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7d35d0-39f0-48a7-937f-08dcb224fc31
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:25:09.9240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xUfpywPP6cPLigZQ3oKowqvHxCChF6bffFn49helo8mSdhcg2R/AFK+r/Noqa/Qn1VYll+VWfneceEqsHmmc0UMcr/cH8wCbKo8kiBsF9JiQcjhBvSIb3ODW4CDtT62J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5108
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

Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 21/66] tests/xe_eudebug: Add support for dynamic
> debugger sysfs toggle
>=20
> From now on the debugger is disabled by default so it is required to enab=
le the
> debugger before using it. This change addresses that fact by calling nece=
ssary
> library functions within test fixtures.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@intel.com>
> Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 577985ba7..de8edb485 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -1138,10 +1138,12 @@ static void test_metadata_attach(int fd,
> unsigned int flags, int num_clients)
>=20
>  igt_main
>  {
> +	bool was_enabled;
>  	int fd;
>=20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_XE);
> +		was_enabled =3D xe_eudebug_enable(fd, true);
>  	}
>=20
>  	igt_subtest("basic-connect")
> @@ -1192,6 +1194,8 @@ igt_main
>  	igt_subtest("discovery-empty-clients")
>  		test_empty_discovery(fd, DISCOVERY_DESTROY_RESOURCES,
> 16);
>=20
> -	igt_fixture
> +	igt_fixture {
> +		xe_eudebug_enable(fd, was_enabled);
>  		drm_close_driver(fd);
> +	}
>  }
> --
> 2.34.1

