Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427FBC87FCB
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 20:28:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1A310E5C7;
	Mon,  4 Aug 2025 20:28:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv9/Xg3U";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1100310E5C7
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Aug 2025 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754339322; x=1785875322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GEcZWA0SquD+PHa8zr0eBZdtqrBZL1x7uVasw1MEDLg=;
 b=Yv9/Xg3UNSL6fbV3YhbPl7l+Uzq4nmyWuh6gmQOcH5dfFFeqzL8NuGB+
 MzZA80fxY+uam0HYkD7x5OzJgmhxCg5sPPYLo6IN3XCszfnVxNVnXpK6a
 vPjUmTdpxyirX9G2ybY4Kf8zmKFrX11ZVa/e2vGKNvZWoG/khQOC7mlBT
 vzYvqCVBpOxNrOCF2I0hJoI6OozRXYEY9ud3WIGdkYrCHL43ifyF3shwX
 UXuhiSQCGrXkYBdFVN7cIuv+SkUj36eCSHU53GK/BHoYGHZyoJBu/L61n
 jq8ufByiuVnh6b/bi/1dGuiUgoix+srQsk0ThPYRwkWbtm9dzare7KLca Q==;
X-CSE-ConnectionGUID: o1s9jQFUQrm1Y4zynvcjHw==
X-CSE-MsgGUID: ZWvkkmhfR2umbs9CXGCZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60426342"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="60426342"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 13:28:41 -0700
X-CSE-ConnectionGUID: ocMYgj8gQbuXWow/TNPmvA==
X-CSE-MsgGUID: ge3eLV92QhWw6Q9J8A8okQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="201422343"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 13:28:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 13:28:41 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 13:28:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 13:28:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEte8Ng8rfXnFvycnI2BswVrGk2YDfFHnP1IpI3KFH6xPxt/QBhlAU0WcKX+Y9kZSz0e4D5tQEQZ2vxUb6bgazE/nLgqICYb+smQbXyBDLlxbvw6JgrFW0OSmZcirsns8qc2bs+AtFsLVXHwpONvYOWfvTfxqNmDp/B8XvouEaAd7BTHP7tMqN5JUvxHM/Ee0rzgYwRm9/rjiHg9jvbjefbmG3fD9CmggMSISDfPcePt1e+yexKUlJ2T+9AAhOEDstfklcL2gTH+6gNn1bVf3SXYokM1De11DJ1JZDkExIll9Q2ttfqWqFNwsWUkNZTU6+k7bWFwrOJkml5aQmCY3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHHUF+PfyTWqj529kk77MCbkWVtBBmdUER+f1sblLRo=;
 b=t2IdPIzZJ3Gxp+nH6qaAKAdIAGnt3c407JYpwrrrpMm3dbXBp8Sl2X5vlo6hQi58De4Mwv4pf5JMPZtgbzHljUs56CG/xvXmkRKZCMkUbmukmauBnyVOOciFrgkZyJGyCIB1XTvFHZ7F+gCkV8FKBoYVO4/ip0IeIUh0se6u2SOdflFgzcR2ttO5r7X4encr/aRotWXaESBsqLSwrWN+zkaeYcI9rVCjofHsJj0KFZWArAgWx4/n8DjcIZGIMfZ3XI/EFWbYMX9Arb+k3afRukWrvHHdENf56/VvNhTt88UzbnFNjGMwfVKPmf/JjO5VkU8qJzi8fupPOuVp/LceVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA3PR11MB8938.namprd11.prod.outlook.com (2603:10b6:208:581::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 20:28:38 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.020; Mon, 4 Aug 2025
 20:28:38 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "K V P,
 Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Break early if the
 test is done
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Break early if the
 test is done
Thread-Index: AQHcBXQ20fm5f4H1vUiQN5DxKRfg9LRS8CDw
Date: Mon, 4 Aug 2025 20:28:38 +0000
Message-ID: <CH0PR11MB5444C22A1A3782187EB6F8DAE523A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250804191531.1393272-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250804191531.1393272-2-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA3PR11MB8938:EE_
x-ms-office365-filtering-correlation-id: 35114eb9-1684-4df3-a45e-08ddd3957eb1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?T51O3JD4J32KZTzWMIX88ZUrKA4rRmRQWDMZ95XY0poieNZEwUckrQ5/raIc?=
 =?us-ascii?Q?Cxuqif7iPg/cKlg3cH402Pk4HTKIcug2e6CwghpN9Q9Vpnb1tmJ21l1U36/L?=
 =?us-ascii?Q?mMdXioniqUrgd80Dl+Fjdi9aWp372o3vXrvISeKfffIAuXyxFVqo9CxEjYjj?=
 =?us-ascii?Q?bi2rKDwF53lDrfOPRNIrdy5gM//kxRA7yZOhaPg/EfcUWv7XvpSclDezfb+C?=
 =?us-ascii?Q?pXh14KJd4K7UvCL2xMxiQlrUp9vJFZIl4+n081bzW71/7kv3rw2oaT5QiNyW?=
 =?us-ascii?Q?sUBdqDVHVKl0BX1kXHnpjoRWl4TfdSlJL9vCiBza1uWXA8l91B5tttc4dEdV?=
 =?us-ascii?Q?JXz7V51sPy1blsX/nEUnzaLdnXPEieehaNTe8iIztbih8zbjJDa4cKOxYTTO?=
 =?us-ascii?Q?ss7C3R6dStqPu03QqGkZ2qU2bHZ0/2HcyEcR7wUYrOrYrSQZNNsMfYtdriM+?=
 =?us-ascii?Q?1qf882LMpanSfiPj/d/Ts/xTgdj/I4TWRHnVlKWSVzmntuY3l55kJ8ss7jVP?=
 =?us-ascii?Q?hm8OueXHnMWTBgoaPYoXXjl3uSgm5Ldi/iY+FXoex3cGWN/fGWu9VAB0KHUm?=
 =?us-ascii?Q?rbHGST4r3vggAfy4OXB/2LRjIit0NCbvBsifBkG4mGQzXMj8d+7tRcmmiJVj?=
 =?us-ascii?Q?RSjnu5nPxIs+GxQRHsOH4Qquf0Hm2FO1/HCMih4Laus6VtIOPFyRCJIOHakW?=
 =?us-ascii?Q?DKbJvc3gGc1D5lT79aWEGYODSLedSNbSabvmqkt1XRPS7yH5Sv8P59fXqaeg?=
 =?us-ascii?Q?Pk+1pWmbktiH0pwrMYXVy4utdLA9HqdWPJWlrvBwGtBP6mypjH2CqCxjZgMW?=
 =?us-ascii?Q?dvVMOp6LGLTqnjCGTPNKEtHzhmbsQnnzqa2YbNloDulwSvwC+i0WlEXAGYmY?=
 =?us-ascii?Q?TLMPIeKAp5SYez+AcU5DoJ45WXcRkyXPrEj3cWSaPNFNVmS7AyenTX2Gq7pR?=
 =?us-ascii?Q?XekBIYpPXT7rC0KNlZ3sqrOJKC+LLfwBRd+K6ZTZxHbx7x8BisfJc6+GuwfS?=
 =?us-ascii?Q?a+kMIiP1WsnVFJTxmkpduK0IlD8PeNsyARFAEUwGCGLKvDX6kabdfJm3df6q?=
 =?us-ascii?Q?TMvu77P7EzZ0n5bYAHSHFW7+eVYUNJC5KbRUypviG6WfbaTbAEVEaqe+U3UZ?=
 =?us-ascii?Q?0/ho1aKStNe5kc+N5dZj0b+06a37gLHE1fxzTOuadSs/AO0CIZFivDIJQuit?=
 =?us-ascii?Q?t/WMwrcDx808yZcZwq95MKVnQB5xpPTJqPQ72LMSblFPbn7UJba0oyBaNVEA?=
 =?us-ascii?Q?fV1sFZZoDoKYE/iWyYzFnBoMZY5887pUEqGQuVjHeFniu5mAh7H2pyHJaymU?=
 =?us-ascii?Q?KGQitSaZkETO6gJQNFwX8nbSEWyouVfNlwMuVKYtBBH+0CEC9NxYmHTNKG9I?=
 =?us-ascii?Q?3+f7PY3aIwQvDhD9Q4C3cwDitGEVy1PzV6cg055dJecxq4wH5WPnjMOv9aWV?=
 =?us-ascii?Q?fi2sP8C14MBSJVhJp5KQ8hnQ+N6ijHxkBVE3HVRNv2IUga8aoxou5Ju0fh2a?=
 =?us-ascii?Q?FyXho0vkmfMUCrg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zOQPz07fKOoR5chbTsRGevAZn4lFiFHgAY7LYUyMq0ETwdqLlPljFFeiiLFt?=
 =?us-ascii?Q?hfi8xkIqAIL/2s6wZNRKBsSKm5/QQIVG7qMh9Pz71jEP23xM8/gEaPf4DAqN?=
 =?us-ascii?Q?y18LbTRXZzcv4MLY6ooZWUunVF8zGnQDsnBovycgQALwiuScU5panrTuTRAB?=
 =?us-ascii?Q?UhAEicgDT/81nLABBUeYJfY1F1/H16vacWrbqZZkbDy7+4Um+eqWdourxvGX?=
 =?us-ascii?Q?QkIWT4rQ5VqBAHVOLrjTPtPr4KBbqsrhrTYKhveNTGuX68W4u7CVsTpz0y3w?=
 =?us-ascii?Q?gv/UlkCKdHXwgcOfHM+Ei21PDPSXVdnA1aevg+yrDJD2fUY1RIhUGhrBdqzE?=
 =?us-ascii?Q?dqjlAsQNakpiaMOr1u+ai9B+lWjQXecIx6sNjNtHNYpuow/ve37otJUVtPdq?=
 =?us-ascii?Q?Pi6nBJxszMSscf1inio5dOBK6pSuBaCOEFYgpPUq1t7zO+bp8dCjAGgr7qmY?=
 =?us-ascii?Q?IUTM63kbL6kpS+dE3j9oaig0eNayzL27Rr7339iNZE1ry8KCMYiMzmIlmrzW?=
 =?us-ascii?Q?hiKrDfclV2mc87U9mTars7ehQ8ATEkzKXpPUHYhsvwJuEAImqH750UKsc+K7?=
 =?us-ascii?Q?dh2JZnbPia8NxSOQAMwYFCXLMFHLyu70GA3dkNxRkbhceHJ4bilVx6EFgiuw?=
 =?us-ascii?Q?wel2rF9FXbsnHZQec5PkHu3abJvk3Ih27rYne/zekhEGEIXpx2IHs0Cl8O0U?=
 =?us-ascii?Q?7rkG18cHlVvSztUo7xaLVUVOxlCsG5+r0J+O3rmxdtPZoKYnCGU6NtFCWBu2?=
 =?us-ascii?Q?ZEnu3MSYKmeQfVd1uhca+iF66AelBGgCMBeZusgMfXOA6r4Rbbzuyq3rKOE+?=
 =?us-ascii?Q?dIFaV/RU980lE+5YiV96wV3Q6Tk7QNIqrJbNVCkLpoJJuwq+NPl0L8WKPnK1?=
 =?us-ascii?Q?ypGU3rC9rWLmie0Vrz+zbESRjOGTsT829Sj4QpOqut0+ZG9ulZcI8vXgYDpQ?=
 =?us-ascii?Q?BwHBvIyxDTWpF3Ce0Iw2lpnh/pkssnR+17DukeLh95nfa5uNPPlmznVxW2TQ?=
 =?us-ascii?Q?ga25txvC+02tiSOs3EnYNam49eyGqV5LWXZS5X2Aof600jsBzpx/3KsUnLkz?=
 =?us-ascii?Q?EsGep2r1YujiAftzLHriem6mqGa6hyZDJXCQvl7oUXzPfTuACsYnKJukU0Td?=
 =?us-ascii?Q?SNggRJyipvmO8/cg1V8uLL50VximyNxjD256MWzb9kK6Ci7OD7rSh0DPo2yj?=
 =?us-ascii?Q?oAPo/eD7gyd4/ieJpQ3qTDmaKf/cJs+KfFuvUC4mSbD5YyvaQH1P+m95qThc?=
 =?us-ascii?Q?WdiPxQZ9Z31Z4GWUsazkXXkw7M+YtJbtupimhMrQirksyBjYKikpnYFF9ggy?=
 =?us-ascii?Q?kEeGgGnd7oLfHSxpdIjFDT489cGHdQ7okdFdvpdjIxUIJIySQmTxsPgdeKOW?=
 =?us-ascii?Q?vBvUPTleT0aTiqsrEan1WQJtG0vjXORSayspbEEuLQ/RwiBh2iSi+g+5iNr1?=
 =?us-ascii?Q?2YEGxTdh+07O6fi5M0rnlyct2jMm5poy64Yb53HCQUgnlZX4Wy50SHc8t/Zm?=
 =?us-ascii?Q?64uDFyeMWllDlcdMlh/N31Fp6qEJpauIeTUMYsYmv7g7fwXPNzaqhao+JGQJ?=
 =?us-ascii?Q?AOBaXb1VAs+vlpPAOsAUa5QQtfLbIgJMEftD62vtZ2wEuQXAWH22FpC+wUkG?=
 =?us-ascii?Q?Ky8v5q2TelXNwrZve83p6SbT9oZrTRicDEpw953bAEI8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35114eb9-1684-4df3-a45e-08ddd3957eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Aug 2025 20:28:38.5156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xSwBxWXane55wuQbQgxJDvPzTTFwxQXGfY7SBXgCG+cCRyH4KufjG2FSrE8WHT5dYXaTwze4474a0pLyP3LGROWFrnOkovGv9T82ntJjGCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8938
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

-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Daniele =
Ceraolo Spurio
Sent: Monday, August 4, 2025 12:16 PM
To: igt-dev@lists.freedesktop.org
Cc: Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; K V P, Satya=
narayana <satyanarayana.k.v.p@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_fault_injection: Break early if the t=
est is done
>=20
> For the GuC communication injections, the test is currently looping for
> an hardcoded 100 times. In the current driver we call the 2 GuC

s/an/a

> communication functions way less than 100 times each (in one run I've
> counted less than 40 for one and less than 10 for the other), so for
> the majority of the iterations the test is just reloading the driver
> without any injection occurring.
>=20
> To avoid wasting so much time, we can just break early if we've reached
> the point where no more injections are occurring. If we use a positive
> value for the "times" parameter in the injection framework, the value
> will be decremented every time an injection occur in the given

s/occur/occurs

> iteration, so we can break once we detect that the value is unchanged.
>=20
> While at it, add an assert to alert us if the number of calls to the
> function increases above our current maximum number of loops, so we know
> that the test needs to be updated.
>=20
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

Non-blocking aside below, and some spelling fixes above.
With the applied spelling fixes, this is:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  tests/intel/xe_fault_injection.c | 37 +++++++++++++++++++++++++++++---
>  1 file changed, 34 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 8245c558c..00d045cd8 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -27,7 +27,8 @@
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> -#define INJECT_ITERATIONS	100
> +#define MAX_INJECT_ITERATIONS	100
> +#define MAX_INJECTIONS_PER_ITER	100

Aside:
I don't know if having a separate MAX_INJECTIONS_PER_ITER field is
strictly necessary in this case, but it's probably better to keep a separat=
ion
between the two values anyways, so I won't block on it.

-Jonathan Cavitt

> =20
>  int32_t inject_iters_raw;
>  struct fault_injection_params {
> @@ -194,6 +195,19 @@ static void cleanup_injection_fault(int sig)
>  	injection_list_clear();
>  }
> =20
> +static int get_remaining_injection_count(void)
> +{
> +	int dir, val;
> +
> +	dir =3D fail_function_open();
> +	igt_assert_lte(0, dir);
> +
> +	val =3D igt_sysfs_get_s32(dir, "times");
> +
> +	close(dir);
> +	return val;
> +}
> +
>  static void set_retval(const char function_name[], long long retval)
>  {
>  	char path[96];
> @@ -288,14 +302,31 @@ static void probe_fail_guc(int fd, const char pci_s=
lot[], const char function_na
>  	*/
>  	iter =3D inject_iters_raw;
>  	iter_start =3D iter ? : 0;
> -	iter_end =3D iter ? iter + 1 : INJECT_ITERATIONS;
> +	iter_end =3D iter ? iter + 1 : MAX_INJECT_ITERATIONS;
>  	igt_debug("Injecting error for %d - %d iterations\n", iter_start, iter_=
end);
>  	for (int i =3D iter_start; i < iter_end; i++) {
>  		fault_params->space =3D i;
> +		fault_params->times =3D MAX_INJECTIONS_PER_ITER;
>  		setup_injection_fault(fault_params);
>  		inject_fault_probe(fd, pci_slot, function_name);
>  		igt_kmod_unbind("xe", pci_slot);
> +
> +		/*
> +		 * if no injection occurred we've tested all the injection
> +		 * points for this function and can therefore stop iterating.
> +		 */
> +		if (get_remaining_injection_count() =3D=3D MAX_INJECTIONS_PER_ITER)
> +			break;
>  	}
> +
> +	/*
> +	 * In the unlikely case where we haven't covered all the injection
> +	 * points for the function (because there are more of them than
> +	 * MAX_INJECT_ITERATIONS) fail the test so that we know we need to do a=
n
> +	 * update and/or split it in two parts.
> +	 */
> +	igt_assert_f(inject_iters_raw || iter !=3D MAX_INJECT_ITERATIONS,
> +		     "Loop exited without covering all injection points!\n");
>  }
> =20
>  /**
> @@ -486,7 +517,7 @@ static int opt_handler(int opt, int opt_index, void *=
data)
>  	case 'I':
>  		/* Update to 0 if not exported / -ve value */
>  		in_param =3D atoi(optarg);
> -		if (!in_param || in_param <=3D 0 || in_param > INJECT_ITERATIONS)
> +		if (!in_param || in_param <=3D 0 || in_param > MAX_INJECT_ITERATIONS)
>  			inject_iters_raw =3D 0;
>  		else
>  			inject_iters_raw =3D in_param;
> --=20
> 2.43.0
>=20
>=20
