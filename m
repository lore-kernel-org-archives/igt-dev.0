Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99499C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 07:53:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F7810E0A6;
	Mon,  5 Aug 2024 07:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eo+0srni";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D7F10E0A6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722844421; x=1754380421;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SQMCbOCu4+hdgV6UVobWlQcP/+JVvsPvD/yLPgvgOEo=;
 b=Eo+0srni68k+FecNZHnCZ/h4QErPWtKYxmdj/dVU+MA33+ssC5464cfM
 daYdHMSEcgvD7XO/OXl4MNllF7kSzbH1OwYvANOmH2h2Ez1M6C7tfJB7W
 +4Ov6JRkCMSe/T16KCM/UlZIBd0Db3kBMH6kJVbtFC4iUaOFnFlG10xkv
 095nREqFBgx4s6m9nowORHri7HLpudr5ipWIP6/SFdG2ZyIlRhU8DYK4L
 7nLNKVSAKnIrg1DkpOaFNcw8JTTM2JRalzQ7j7Me3BOJ9t2Zh/yHdc5Rv
 sFQKs+AB2y93dlqX012wtbcJRAp09E/Pr1RF39Lm+Kh/9QmEx8XMC1cxF Q==;
X-CSE-ConnectionGUID: fDBKfzq0Qn2QSnxFuVf9eg==
X-CSE-MsgGUID: NuTMG42dSZeNjmJEnHFgfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="20957073"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="20957073"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2024 00:53:40 -0700
X-CSE-ConnectionGUID: Fj9+hvffR/+cK3HYoTPOig==
X-CSE-MsgGUID: UnWYVd/gTmCNlTsFTp1i4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; d="scan'208";a="56289294"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Aug 2024 00:53:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 00:53:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 5 Aug 2024 00:53:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 5 Aug 2024 00:53:39 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 5 Aug 2024 00:53:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4WykqiKq5jtWSieOcemIN1iiNztM8ZlyOBUaL4NF8bJ+X1HbX2JoCP+RZvvLhoIVOwsyFFNuiY8dGl291l8WnH9PAi/QLu2SB7Bq8tMM8XuowIdFoDc5nDwJfmVgdwsEVMsGvIDkhn+zZtTN7AN0PGX/YTT3Q1ad2+918oPQ2giMvsILgSOK8mmTEOF4lHc1B4ZIoUkWyFPq+bp9joX8YaDd1Xe+UwbtaDuXr+s1hPt3jYGvyC/H4WH69X4ZR8qZpOa+ug5Nui9Y4jL0+/pEmJjcbXFtxMKm3IekdCUePQhKzazvGBmkJBmp3v6Wv0HLRmxzbpApMVJxerlSSPPOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VPhRJXJPof8TiMRb6YjYloFB4mxL+zFA7eKy+aPyoSI=;
 b=i8CRetewFzKbvOVr+CT6vhCdvm8ptNNYU8hJFjZrX8rzN2rvxAVOiH74QBraoFObZ7ImXg809Li6+XbzfgOEcxiOrTFe6nyV0fbysKoy9kINuhpOGazPuZVfL1RV3WdC7xXWkcKKSYlrKQTbOud9t+yLwyfIjTv3disGlvebzBgNAa4Sm7H/KNfllwYK9DHOpn3cq6Ngh5CcLDTOMdnxSN3fDKGbv49LA/OwqsSFTQrp/MyYIHBD7KxTld0wlCVnWijnx+3Ennj+SRAlKZYlVpT15rX/pSJ5iiOY997T7DubgSQNQwwctMvEcFt6q1tit2IpYbT2E1S1yuUuzrHEVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Mon, 5 Aug
 2024 07:53:36 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 07:53:36 +0000
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
Subject: RE: [PATCH i-g-t v2 58/66] tests/xe_eudebug_online: Add
 interrupt-reconnect test
Thread-Topic: [PATCH i-g-t v2 58/66] tests/xe_eudebug_online: Add
 interrupt-reconnect test
Thread-Index: AQHa4naVE3qMKuiJQEWLyIS04sMqDrIYVC1Q
Date: Mon, 5 Aug 2024 07:53:36 +0000
Message-ID: <DS0PR11MB726404A87BF55179D9CE0C29D9BE2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-59-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-59-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MW4PR11MB6840:EE_
x-ms-office365-filtering-correlation-id: 31aa49f3-f7ff-4ab8-878a-08dcb523b5fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?oVBsGAcMfVu4KkxPBk0hiJeCVXoha6W18lcdzfa9hMBiNRySS1dAeY3BgK?=
 =?iso-8859-2?Q?bEg7bhEZ5drppZ6rpXnYfvt8thQFpr+KDYJys5tIYaWmyVHNG1jjcyy6q6?=
 =?iso-8859-2?Q?8JzJdujgOLE2lUkT2PoJSI297gtuPfMqNPvR2zY1kZcC+qtORw8ME428iu?=
 =?iso-8859-2?Q?FcJgWjpPJVozWmhOxyraQwTHGPBaSp1cNy1k8V+6QigSlVN4odMWoDiLWl?=
 =?iso-8859-2?Q?9XAOPXWsFHiw/xW4snPyTSNfUTOHWsrzlkj1dTIeTfrt4pWdBAZRedc6r5?=
 =?iso-8859-2?Q?fAO2HSesx+UEhiXj35aflh4o0pLCD7mTnoBZh4Fy2P33WGAvQj+9Crkorn?=
 =?iso-8859-2?Q?u+L8JHyp3S5bwe0Sk/rrKFu4ckH3tHq9sysNTOmFJUKQhXvOSrplwN0bmb?=
 =?iso-8859-2?Q?YtDApC/1fGymEGX1AP2fodLSWgHb4MkfXC6kxYsvw7No9G8ZTphMHoioao?=
 =?iso-8859-2?Q?be4mgNJj86lGsz3u2LCSX8Gna+stdNM8NKNrcKw8NSPqiqHj63sAUOuSLN?=
 =?iso-8859-2?Q?VkGjtZxcbu3QbqcfFlHsH3RBH0xoHY2z/YK3lCxhB42grGKAMQIfyo8kEp?=
 =?iso-8859-2?Q?rBL8wTsMus/+LIkawfPXT2K7anmdrUXNwMIpLZgNIoN1SIcIYok/X0HW1L?=
 =?iso-8859-2?Q?YGOce9QJZBTxodlsIRkUzkgnTeuUqrnjmJWsXAxOkXi2lrmHa0lGsZBjRz?=
 =?iso-8859-2?Q?FG1NMaRIg4+MG4Q8DbZ6mkD1Wjyw6xofOP4FBjyjHYE6lBgiPpZcNGHfjl?=
 =?iso-8859-2?Q?2Iy/CGiCtrBJm7EYk4GCa8lfYXsWIDlLKbQWpOkupQTNx1APUVD1mn8gyf?=
 =?iso-8859-2?Q?Uq0yI2u6aQyBQvAfnafouFn8oRr6k1aAJCKZQacHTk5sY+aJNFsz26/Cng?=
 =?iso-8859-2?Q?u0UcC1aAHsm4n5RbzVLuWoFCY76KuAHTnm5qsu67vBv+UHsHxj0uPdPQ8g?=
 =?iso-8859-2?Q?WzE8gIwypfOFq7UVFk0JYhZokpT8AgYm6uvcFsLatKfa0mt+960NS7FDGP?=
 =?iso-8859-2?Q?SoA3Dw06hTPyMLJ9XypJSNK35sUMVpJ4Ry5iGY+DWRMPWT20htv8spQQ1i?=
 =?iso-8859-2?Q?KW95m4jrq7DxDJiZYJXf2T2mWbckD5NnOqCtD/WyLID6BbwQWMe0SoPuhC?=
 =?iso-8859-2?Q?LVCaUMg3HezjVRBPf/vzriJsEv1aSJQ9dGmpLFiv7mrboDJitOgU6A0z89?=
 =?iso-8859-2?Q?qLgP3KF3XPHl/kQt8cFzdJRJ4jb7r+py1tdz1tfWAt/Ytk0t+Ove637JCx?=
 =?iso-8859-2?Q?8mGX61q9WIPHDkUKtXton5DGaLv0LCB6ZyYLCcG7l8qasj2FdXkkDqi+A0?=
 =?iso-8859-2?Q?4Zf4heFIWT1F2rbxDcrMO9aTAMWa1g9ZRJP0ajOT4Q4UkGFMri8rBD6Omm?=
 =?iso-8859-2?Q?rRlTncpKIiJt2dCIWDgIjD0lpS8y/3PIOlXdeSyuIRfBM6iylELsN2395L?=
 =?iso-8859-2?Q?S6R5qElpGGcTW2rGrrXWe1zLwg9xUY5D6Qj9UQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?K/PCJuOBb1as26fL6ehJkXvbimmIyWKCzkUM1NVhRJnouVvJnobsOzYBX1?=
 =?iso-8859-2?Q?D3Ts4opz5rS+YCnxnkDWSoYeq+HBd04NfZtrFPH4K6WznF2GF7KhwMFscC?=
 =?iso-8859-2?Q?kqEy+CuRRHxzIb7Q0L7QA7HNUM1KQIpkELBjZ9ZG/ctw5y1Ytw2ePU9UOc?=
 =?iso-8859-2?Q?EfP9GWO/Q8P3tdai4VE552/GxYtuMOGCHykI3aXdYnRtc2J07Db2Ra22+S?=
 =?iso-8859-2?Q?m5QxurG8kg4zwwtbchTf9EyWBZazcncS4gS4fHo5hh2+CkDOvLirIAsYHS?=
 =?iso-8859-2?Q?yG8yFV5K5mJ05Tij2yzLDPQNQJVaUiVu87I/xXD0GkoBjxAjsIuKINARg5?=
 =?iso-8859-2?Q?eRwX2wWfVrg+kzcp+DoDpDiRUAGcR0k5iIs6SUV5F+XPdqaub7jf1Ijgno?=
 =?iso-8859-2?Q?AHUQV79gAoSWDuEl/kjOSdFYURLncVElT82MrncCbElxLQF130tYAODk8H?=
 =?iso-8859-2?Q?7ToARhHTkTFEx9ifn3iLN2BHKrZMdAAXRWpWZsGIKplh7yCUbKO7gp7AiZ?=
 =?iso-8859-2?Q?Xyc04DBQ1NqRGZkyqVkkmDgdUuUlH/+c2KeoPXr5P2ggNX59GVIQn7gMPf?=
 =?iso-8859-2?Q?DWwnK/DwTuzAKQenei6ZGdYO9b40IywP0Uk00b5jp+6bmLj3vMO/cE8zPK?=
 =?iso-8859-2?Q?aA78aKBZohffsvH3f0Ldgf05IwVmDCHSWP+mB/SC4RbtZqz4scrZahRMpA?=
 =?iso-8859-2?Q?nLvYUKbRVMcxOH3N9vLjbjmJCc2yCN65AA3RREI4k2w9bWfgeH2szYA3hQ?=
 =?iso-8859-2?Q?xvsZo6nKF2QOSYqP9pmuQSChnopDSw4JABUzCgzEooGpjQk55ku7jGHmco?=
 =?iso-8859-2?Q?GthCorBkSGI8QxmougitXBG3XkppGWOcRK0F5QyM9AXf6OsBIQRDl27maX?=
 =?iso-8859-2?Q?ISuwLVEXZJZgCXAvVr98wMUAKAxCXxdvE2opiF6/AJsOENRRrsOA1g6AZn?=
 =?iso-8859-2?Q?JhHtOQpkiRqDuVfR3sSBNJeVBlMAGguqLSDJ3d1aXqqyvWDtYVeTzu4Hbj?=
 =?iso-8859-2?Q?VP3jPaV2CZEJef450bHbsyJbKErTSJTUhasy8qsicLTd2VbA8wqdBiGVBS?=
 =?iso-8859-2?Q?eAI8WkNvAefpIv7A+G+aX9QrRWxLTMt1Ea3Trk9XXIomJClELW9lUtKi0H?=
 =?iso-8859-2?Q?xadWkVxOySzI1LJulx5i03SSujAZhaoRkFiD8L/uyH+E4qLlCzzGt6JmS8?=
 =?iso-8859-2?Q?0v+xehnE4i6upAtYjpjtVp0IeH0pCtNfUrA1ApE6L4CPdb1CSNNXrYY3Th?=
 =?iso-8859-2?Q?ujyFeUqqCylEf7MknXS1gdaxCJg5C8GjMcUDOIokpy3Uv0VVPYwg3VWa6O?=
 =?iso-8859-2?Q?QFrZylYyIzsrAtf1P0X+Y8ryTq4sVqcjuENRQmQlHfl5fshOhpl/6iXeYF?=
 =?iso-8859-2?Q?8Odf0bT00Xzsv7f9o2w88TPlELGbvWkJI7AMCA/Fm8nGJp78iQbldZuTxV?=
 =?iso-8859-2?Q?e1xE/FKgos3GQj6u+Cw/xnGJhb0E2dtv1bBLcrrEKsY12+PiYQ4Zns3e2J?=
 =?iso-8859-2?Q?5GdjopGuMd/DGulVDoYh0sVTVP8TzQsqwsUcPyvWhIfrINXInwYhBUav9L?=
 =?iso-8859-2?Q?Z/ayYhFArga6/V2M2Ek8OjZ5Vf6nxYsW34XmqKEUFFoyYrGAnFoFfKShru?=
 =?iso-8859-2?Q?F3Nr9ksItmTKoaxSbqLW3XZ7qgZezX1RZ2dIDi/9O/EpFy1xaTV85WcA?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31aa49f3-f7ff-4ab8-878a-08dcb523b5fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 07:53:36.1321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVsqh4ifbv5Sl+dlSMZrYprM4qDepdLNvmNXHrlZuH1U4itsbZuAgMazlsyLSyocwQsOikXy7YGp2SfqWzzFrAirbH+SIbgqGIzqL8Q4JtTCEekN7/4kW0qwJUY8i2LZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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
> Subject: [PATCH i-g-t v2 58/66] tests/xe_eudebug_online: Add interrupt-
> reconnect test
>=20
> From: Karolina Stolarek <karolina.stolarek@intel.com>
>=20
> Introduce interrupt-reconnect test case where the debugger is closed and
> reopened on attention event. Check if the workload is reset when there is=
 no
> active debugger detected.
>=20
> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
> Cc: Christoph Manszewski <christoph.manszewski@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug_online.c | 126
> +++++++++++++++++++++++++++++++-
>  1 file changed, 123 insertions(+), 3 deletions(-)
>=20
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_onl=
ine.c
> index c101bde2f..9f55cec74 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -22,11 +22,14 @@
>=20
>  #define SHADER_BREAKPOINT	(1 << 0)
>  #define SHADER_LOOP		(1 << 1)
> +#define TRIGGER_RECONNECT	(1 << 27)
>  #define TRIGGER_RESUME_SET_BP	(1 << 28)
>  #define TRIGGER_RESUME_DELAYED	(1 << 29)
>  #define TRIGGER_RESUME_DSS	(1 << 30)
>  #define TRIGGER_RESUME_ONE	(1 << 31)
>=20
> +#define DEBUGGER_REATTACHED	1
> +
>  #define STEERING_END_LOOP	0xdeadca11
>=20
>  #define SHADER_CANARY 0x01010101
> @@ -682,9 +685,12 @@ static void run_online_client(struct
> xe_eudebug_client *c)
>=20
>  	intel_bb_sync(ibb);
>=20
> -	/* Make sure it wasn't the timeout. */
> -	igt_assert(igt_nsec_elapsed(&ts) <
> -		   XE_EUDEBUG_DEFAULT_TIMEOUT_MS / MSEC_PER_SEC *
> NSEC_PER_SEC);
> +	if (c->flags & TRIGGER_RECONNECT)
> +		xe_eudebug_client_wait_stage(c, DEBUGGER_REATTACHED);
> +	else
> +		/* Make sure it wasn't the timeout. */
> +		igt_assert(igt_nsec_elapsed(&ts) <
> +			   XE_EUDEBUG_DEFAULT_TIMEOUT_MS /
> MSEC_PER_SEC * NSEC_PER_SEC);
>=20
>  	ptr =3D xe_bo_mmap_ext(fd, buf->handle, buf->size, PROT_READ);
>  	data->threads_count =3D count_canaries_neq(ptr, w_dim, 0); @@ -
> 1158,6 +1164,117 @@ static void test_tdctl_parameters(int fd, struct
> drm_xe_engine_class_instance *h
>  	online_debug_data_destroy(data);
>  }
>=20
> +static void eu_attention_debugger_detach_trigger(struct
> xe_eudebug_debugger *d,
> +						 struct
> drm_xe_eudebug_event *event) {
> +	struct online_debug_data *data =3D d->ptr;
> +	unsigned int max_size;
> +	uint64_t c_pid;
> +	int ret;
> +
> +	c_pid =3D d->target_pid;
> +
> +	/* Reset VM data so the re-triggered VM open handler works properly
> */
> +	data->vm_fd =3D -1;
> +
> +	xe_eudebug_debugger_dettach(d);
> +
> +	/* Let the KMD scan function notice unhandled EU attention */
> +	sleep(1);
> +
> +	/*
> +	 * New session that is created by EU debugger on reconnect restarts
> +	 * seqno, causing isses with log sorting. To avoid that, create
> +	 * a new event log.
> +	 */
> +	max_size =3D d->log->max_size;
> +	xe_eudebug_event_log_destroy(d->log);
> +	d->log =3D xe_eudebug_event_log_create("debugger-reconnect",
> max_size);
> +
> +	ret =3D xe_eudebug_connect(d->master_fd, c_pid, 0);
> +	igt_assert(ret >=3D 0);
> +	d->fd =3D ret;
> +	d->target_pid =3D c_pid;
> +
> +	/* Let the discovery worker discover resources */
> +	sleep(2);
> +
> +	xe_eudebug_debugger_signal_stage(d, DEBUGGER_REATTACHED); }
> +
> +/**
> + * SUBTEST: interrupt-reconnect
> + * Description:
> + *	Schedules EU workload which should last about a few seconds,
> + *	interrupts all threads and detaches debugger when attention is
> + *	raised. The test checks if KMD resets the workload when there's
> + *	no debugger attached and does the event playback on discovery.
> + */
> +static void test_interrupt_reconnect(int fd, struct
> +drm_xe_engine_class_instance *hwe, int flags) {
> +	struct drm_xe_eudebug_event *e =3D NULL;
> +	struct online_debug_data *data;
> +	struct xe_eudebug_session *s;
> +	uint32_t val;
> +
> +	data =3D online_debug_data_create(hwe);
> +	s =3D xe_eudebug_session_create(fd, run_online_client, flags, data);
> +
> +	xe_eudebug_debugger_add_trigger(s->d,
> DRM_XE_EUDEBUG_EVENT_OPEN,
> +					open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->d,
> DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE,
> +					exec_queue_trigger);
> +	xe_eudebug_debugger_add_trigger(s->d,
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +					eu_attention_debug_trigger);
> +	xe_eudebug_debugger_add_trigger(s->d,
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION,
> +
> 	eu_attention_debugger_detach_trigger);
> +	xe_eudebug_debugger_add_trigger(s->d,
> DRM_XE_EUDEBUG_EVENT_VM, vm_open_trigger);
> +	xe_eudebug_debugger_add_trigger(s->d,
> DRM_XE_EUDEBUG_EVENT_METADATA,
> +					create_metadata_trigger);
> +	xe_eudebug_debugger_add_trigger(s->d,
> DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE,
> +					ufence_ack_trigger);
> +
> +	igt_assert_eq(xe_eudebug_debugger_attach(s->d, s->c), 0);
> +	xe_eudebug_debugger_start_worker(s->d);
> +	xe_eudebug_client_start(s->c);
> +
> +	/* wait for workload to start */
> +	igt_for_milliseconds(STARTUP_TIMEOUT_MS) {
> +		/* collect needed data from triggers */
> +		if (READ_ONCE(data->vm_fd) =3D=3D -1 || READ_ONCE(data-
> >target_size) =3D=3D 0)
> +			continue;
> +
> +		if (pread(data->vm_fd, &val, sizeof(val), data->target_offset)
> =3D=3D sizeof(val))
> +			if (val !=3D 0)
> +				break;
> +	}
> +
> +	pthread_mutex_lock(&data->mutex);
> +	igt_assert(data->client_handle !=3D -1);
> +	igt_assert(data->exec_queue_handle !=3D -1);
> +	eu_ctl_interrupt_all(s->d->fd, data->client_handle,
> +			     data->exec_queue_handle, data->lrc_handle);
> +	pthread_mutex_unlock(&data->mutex);
> +
> +	xe_eudebug_client_wait_done(s->c);
> +
> +	xe_eudebug_debugger_stop_worker(s->d, 1);
> +
> +	xe_eudebug_event_log_print(s->d->log, true);
> +	xe_eudebug_event_log_print(s->c->log, true);
> +
> +	xe_eudebug_session_check(s, true,
> XE_EUDEBUG_FILTER_EVENT_VM_BIND |
> +
> XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP |
> +
> XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE);
> +
> +	/* We expect workload reset, so no attention should be raised */
> +	xe_eudebug_for_each_event(e, s->d->log)
> +		igt_assert(e->type !=3D
> DRM_XE_EUDEBUG_EVENT_EU_ATTENTION);
> +
> +	xe_eudebug_session_destroy(s);
> +	online_debug_data_destroy(data);
> +}
> +
>  static struct drm_xe_engine_class_instance *pick_compute(int fd, int gt)=
  {
>  	struct drm_xe_engine_class_instance *hwe; @@ -1220,6 +1337,9
> @@ igt_main
>  	test_gt_render_or_compute("reset-with-attention", fd, hwe)
>  		test_reset_with_attention_online(fd, hwe,
> SHADER_BREAKPOINT);
>=20
> +	test_gt_render_or_compute("interrupt-reconnect", fd, hwe)
> +		test_interrupt_reconnect(fd, hwe, SHADER_LOOP |
> TRIGGER_RECONNECT);
> +
>  	igt_fixture {
>  		xe_eudebug_enable(fd, was_enabled);
>=20
> --
> 2.34.1

