Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F21AE7716C
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67B510EE07;
	Thu,  5 Dec 2024 09:08:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ngFvUtAf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC20610EE07
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733389693; x=1764925693;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k61ntJGw8tnH4Iqjkokve6tBHua4E7tkQ6HtLQ1HH1M=;
 b=ngFvUtAfQq/3ZJ3xflHyr0M+RE6oC/BI2WdEO+09tlCC6wCU01AGQdPw
 3wmuILRshf8Qfqhm+GvhNDDLqOIBlRHD+vVagYlfek61EKAhQoRWgzZPw
 rwfAbHaD8PgYANRr2V20eSoJaI84uCMWtJDGxUgF90BdSilEZ8r+K4PCM
 Gj1G5N3nVHvyzjHICwSP6XIYmiHR8o1+uPGrAYuT4t4V4hMjrfGC4Ws9x
 nzSaYm/ve4goATwJ70c8YlYWjzSvRHSdIg4grvZAyPsj6vNhwJQUYiG/4
 aaJ4qKv+xiX7WMXcerIH/ROvtc8QdEFG6vc2QzwlY5x4PE/bKIbLd1e5i A==;
X-CSE-ConnectionGUID: +DlceCU+QOiqEmzduGLr2g==
X-CSE-MsgGUID: PeY8ze5OQqS+EF4O99WmNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51107241"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="51107241"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:08:13 -0800
X-CSE-ConnectionGUID: +0RM4zusTJeRQqSda8pY0A==
X-CSE-MsgGUID: Bk3oG4SMQAa8V9UFUy+9wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="93925318"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 01:08:12 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 01:08:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 01:08:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 01:08:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EyxR4FeJOzeP0Zlc2Snn/sPkD2axQfsI8GMuPA5IuHHXxPqi428B61Q7JaBEixOPDROOGO4Z3rL5W8oAvbEtHzhAApGIJANtlbBjW2zoC4qPC+hXA3e7mver1vjlnxjzI/MsofX+YmE3CtO71J4mzS6CZa/Is7zZPb4+Gdd84/w8jijsiqLhHoaOwZQ4Q/mYwHs4BiLU/9QJQuCTHIenya/BROTuZ1kQq2tFV+hMI8yyNpZrc8QR0VxyMAIvxmWELnpySmiSOmqJKpxBimaNJrpzOEZqDouQ0UZqnZ2rYcNGiVuxwFKhd6Wkcs6KcJ/aSywmy8ymIYlEylLPxVJgGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u5aNG0PpdcB/1zOlEuF30O7x+qqY7J6C/60Re6BLNM=;
 b=tMZlWaShLUlJ534eQO8aenagmfuyHrmdK4sbrADc5FUFvhM3eq2iEcMS7A2F64vFygkQSOiAzGiNhE5V7ABrrzSNNpBELX4V/syfVi0DcRAYfob6iypF8pW7lmXx7E87HMUewQ1VtG1/hiH2xItnCF5M6K2mCGPiwMHttM8mZ7Vlwhwy1RB3P/1j05Jxxim1R5GGQ9Haltsooh3bt0eDBeguG89SGAO15ZRBUIkKcYh8WdFcHWBzKLhb1USl2JvP/shGxZNSiM+YRv7zuWveg6YYMRoNd7C2WAjnI2xP3uE4gDbXUNh6/ImglENAkXXJa8DQ2rnLD7HDPWQJQXSKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ0PR11MB5213.namprd11.prod.outlook.com (2603:10b6:a03:2da::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 09:08:08 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 09:08:08 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Knop, Ryszard" <ryszard.knop@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Coelho, Luciano" <luciano.coelho@intel.com>,
 "Das, Nirmoy" <nirmoy.das@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Piecielska, Katarzyna"
 <katarzyna.piecielska@intel.com>
Subject: RE: [PATCH i-g-t v10] igt-runner fact checking
Thread-Topic: [PATCH i-g-t v10] igt-runner fact checking
Thread-Index: AQHbRtHMe+JsNRyWpU2/HywzvXKFxbLXW7sg
Date: Thu, 5 Dec 2024 09:08:08 +0000
Message-ID: <DS0PR11MB7264C820BA3A5EE6720FFB3BD9302@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <136a49f8-8173-47a8-ac5d-e62e972e1005@linux.intel.com>
 <b909e2ca-f713-45e1-997d-6871e136a076@linux.intel.com>
In-Reply-To: <b909e2ca-f713-45e1-997d-6871e136a076@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ0PR11MB5213:EE_
x-ms-office365-filtering-correlation-id: 7e5e7811-f887-43dc-e8d7-08dd150c55e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?xtmRVlvAlc0by9Gzw1s6v4Lwcthjs8r7fScp08S5nK77vb7jMCyZ2rB7WU?=
 =?iso-8859-2?Q?FVdxkiKX8p1fPPxWHvzcMVwfuQyybtSi4NOB4ymFWRL5fTLkm9ySsDTWm7?=
 =?iso-8859-2?Q?1dGhZ3hk/gCmmRnMtVNJY6cnypYVW1qjpei9m5WlghX86mUk2OULqWcwCC?=
 =?iso-8859-2?Q?Do+pMMOWPKCmnNhxgPXqlAETXX5OfDKSv1USs//2sP57mSCLjkWCQGR7Nh?=
 =?iso-8859-2?Q?9y7BITOwLZzbqOModh3fI4GEjxl1eUQWEFogjIB4FEPFH7od/DXLJORCVz?=
 =?iso-8859-2?Q?vHIuV1nZ4Deh8r867Ufr48Togf0El4GuO7s9gIUZ0FbfwuXJGzmplV35pE?=
 =?iso-8859-2?Q?5uK9w0+braxwWjL/1W3HDMaM4D0lqy4ro/c7CYj4Rk0j3vmbEou+YF33MN?=
 =?iso-8859-2?Q?itUjkOwcgpW2kkTx0w9jcn0zB5z7P+Mx/5yE0NTz97f1e5o3Tw1F8tDbR3?=
 =?iso-8859-2?Q?vQGgCQBR/Ik3A9LvjHka3Qm21p5I8G2n/Sw5X672Mf60Jrc2D86WED2tOh?=
 =?iso-8859-2?Q?U8K9C3QHdDazviqd4tf9aT9ZTZ+ec84hO8KV0OZwsKMKvFRkXvP4O8asXa?=
 =?iso-8859-2?Q?E3g38IH7HrzBtBNTchiq5rou99u+3NdiNmTBra5NqICkdN2O38umZzGsRS?=
 =?iso-8859-2?Q?px2gH6lRfNfi5oEROFvD0Odt8k1XwcIAoByvAHFqZYdlN4wD+9vrV6+ZNV?=
 =?iso-8859-2?Q?X53kTcecctHUwH552EGYlXvYHEiPsw0wFc+K0cMAMaGOuGD+BN0Cd4TDwf?=
 =?iso-8859-2?Q?qa+DzqLDJQv8go5HPsCdmvuo8pxowWVAXW5pWp3dzI2lfWthyGBHTAKAtr?=
 =?iso-8859-2?Q?PGFpFZljTvxEs0epgWEhQ701c57Mz/IOL7Ry3N0RQAr294EXZBMUFyD3wN?=
 =?iso-8859-2?Q?K8QO+Mzq5tjkH06XEJ7Mvul9YAQrr2KliuBF4oCXTRspa9yAyoEc/61+w8?=
 =?iso-8859-2?Q?XmANMXYEEqN6HAcEeR2ruHSjM/zhMqdH2c8XKN4aZ/doV/WQSCLx+WqTMV?=
 =?iso-8859-2?Q?YOMXkWOvEQONZYSp86fROfJuT0XpPKPGWa50FAC4SkHV6sSgWToogTy1Rg?=
 =?iso-8859-2?Q?hyAJa+bG1m20g0pUtYbsOHpF6v12ywVUVHfoOsvRsTrRc51nj+r8jQrUCp?=
 =?iso-8859-2?Q?waBBa1ydDQwpUnp3588suclUC09ibH5ol5V1vHg6f6Z5dvPtAiiyJH6fye?=
 =?iso-8859-2?Q?KAFzTKMvGt2wUETjyEWXxO+9zJP4noqtdftwRG7f+BenSzP6E60tV9aAoZ?=
 =?iso-8859-2?Q?UVLs2GKMThl9eUBkHoePO/fU+49vl9Egc2l0AykL6uxtSjKKDLUfTl6kHz?=
 =?iso-8859-2?Q?AWLNTUpRyp/WaSpPIh0svrZQzkPH8T5bL4ij7M+iYJ7dZfn3hJqGOncvni?=
 =?iso-8859-2?Q?KOqit5hm1OJrTahQB/AoC3w8iizOt8FdWR8dyBhpYKxjejVb75mAf3ZkwO?=
 =?iso-8859-2?Q?93DJzqEuKddFkDysLWYjcydNCt86dYpOLm5aVQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?UP9IFofmb9lmJ2RP+w4QqSl60pwEkDKKC8a/QnvtHTm3fPhEp5xw0jEfzY?=
 =?iso-8859-2?Q?B4IpB/voNDhHAcudHtIi7hMhwSBpt1bTK/wDYhxGNbgvE6QDlM4LWNP8Lc?=
 =?iso-8859-2?Q?LcbJ5sUjLvGo/2YoFOWVO8B7ldyFjz+58PqBlNvlBuS6zP8TPN3jFtGkKD?=
 =?iso-8859-2?Q?skZgVgsdFGXtGO9ELugfHlVRZm2adiZP7axXzQBEJBXzREwOEkDON1Uten?=
 =?iso-8859-2?Q?n2mS57bRLkoWnfmsUeHxwqYIDr1Raji2OkhNvEPQIijyLLpFzcGVfuHuF5?=
 =?iso-8859-2?Q?sAL1IvuCwmtVLwLGkO6zEtd9iwVL1zTWMvv4YLiooHpQvQyRth958HEMew?=
 =?iso-8859-2?Q?tG1n+DxOOieKQOaF5ybiaWpQUCGlz5OiOx6fB6ARMjJS0AMTQHGjqlTnpA?=
 =?iso-8859-2?Q?sXfHe/k6u7ZvLeoOAjxuSG+MRyrmvHOwqVfU/bxqc/tvNObCGM70eGXpk3?=
 =?iso-8859-2?Q?plWUwCwgK9hfBIbwH/v1kh0/Dg2BR3dl+PRO/gl24rNJBxuZLp9qV8hnbZ?=
 =?iso-8859-2?Q?gzQg+YTDagDWgM4OtfRzg2WJReFkAY9F0Y6aCFydu/OC6OjgMRm3Jr9Hbd?=
 =?iso-8859-2?Q?z9GayyRipto/hjYOgEEyzFdIsGPirUvMgnpQ9Dq/iThjm6zGan2768qUF8?=
 =?iso-8859-2?Q?gxR3xAq5tu3sjv0zmckgOjrLVXEnxffZ9VOYtCoSjhooV5SIKCjYfwy3r6?=
 =?iso-8859-2?Q?XhmHaqKv5MC2/ApgSrd1wJNL963pIyjrZZzhYPqJkU2DUptqC/nNSjmiYl?=
 =?iso-8859-2?Q?wKZCmNXPVRIraVyDqHpXXMGcECiFIdypvr80wM5uQ46LCLI8AeLvnOngXh?=
 =?iso-8859-2?Q?eJzlgz+HeujpVDromFO56mBuRWMbpgJQcvKohOUxIApi/fLxU4DgPX3HeK?=
 =?iso-8859-2?Q?hYiR4z1h9MJuwMO2s2Yw/chF2GAn996APO/4DR6pkEeVDdDkwcyT5gg7Tt?=
 =?iso-8859-2?Q?8rBxnaZ94zDEXrZ4N6njBZHS9yf2Ls6UjiVUUY+pgHCTkwOY7tG+VDYInn?=
 =?iso-8859-2?Q?6RxRYue+XLxMhVjTX3JrIf+CVfDrNwmPUnmr17PCmzU2dSX3f+nNBJEEfF?=
 =?iso-8859-2?Q?Bvzy+sOxxb6DdR8/q9ZXelPOiywJosdwaTmbnVNCD5TbLyg6Q8CNY8ib+9?=
 =?iso-8859-2?Q?EEMvhGgGXMM/dYIyue0/2RdkDhQalzO8hiGePuMZOxHIzbSS5aEpMIarRC?=
 =?iso-8859-2?Q?X/HlQkjKUD+7MUxpxtH2CXstOxcxN0vvtt1bwQb7rekVIpXz8uO7oBEWEO?=
 =?iso-8859-2?Q?fwV84+gOeofMBeMv4Rgp6wXxdiTo2rKhLYAS3dJyR24NLSoiQ4PpnD7HEB?=
 =?iso-8859-2?Q?wRGHFyRpDZRDgnhZhdVXGMcIH+GpXcrFQb2RX4XHZ/jL+9wE01yusOdd49?=
 =?iso-8859-2?Q?asTULBXfFigrw27HlcftFV9JHd9SUPHQ+LVFRNvpnGrYVIZOduZuXyQ0K4?=
 =?iso-8859-2?Q?YKZchDVGdWRBoMDlU8n4EU5/nCOatnWmrKdvEBlEIudrEevySPJzW8eU56?=
 =?iso-8859-2?Q?gPR32H6uOEemDXpliYcpxvPeMQGv1wFT/yVy9v+xANVVvZjW5Nq8xfGkYg?=
 =?iso-8859-2?Q?p+r2mVhBSbaGa2sKoQYyBidCbMvzWhtCavMrNWvLQUgneG94lL10Q60XCR?=
 =?iso-8859-2?Q?VFBpUls/Y6+XG5ld0rMD+lM6SVuG96HqgX/TjK5uQEXFMIvVO9Yh0q/w?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5e7811-f887-43dc-e8d7-08dd150c55e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2024 09:08:08.0987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ukHY7xvXc5ADFmbtpVxTjMOLgoqyIiIPpgnj0XITMOkO56vydBSbWYU2zxUmCu1SWBrvPoaa6s8dc47U095TInZynzGHFjsXJUEKLfdWbbId2KdAHrY5tCMyc7Z4TExE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5213
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

Hi Peter,

> -----Original Message-----
> From: Peter Senna Tschudin <peter.senna@linux.intel.com>
> Sent: Thursday, December 5, 2024 5:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Knop, Ryszard <ryszard.knop@intel.com>; Janusz Krzysztofik
> <janusz.krzysztofik@linux.intel.com>; Kempczynski, Zbigniew
> <zbigniew.kempczynski@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Coelho, Luciano <luciano.coelho@intel.com>;
> Das, Nirmoy <nirmoy.das@intel.com>; Summers, Stuart
> <stuart.summers@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Piecielska, Katarzyna
> <katarzyna.piecielska@intel.com>
> Subject: [PATCH i-g-t v10] igt-runner fact checking
>=20
> When using igt-runner, collect facts before each test and after the last =
test, and
> report when facts change. The facts are:
>  - GPUs on PCI bus: hardware.pci.gpu_at_addr.0000:03:00.0: 8086:e20b Inte=
l
> Battlemage (Gen20)
>  - Associations between PCI GPU and DRM card:
> hardware.pci.drm_card_at_addr.0000:03:00.0: card1
>  - Kernel taints: kernel.is_tainted.taint_warn: true
>  - GPU kernel modules loaded: kernel.kmod_is_loaded.i915: true
>=20
> This change imposes little execution overhead and adds just a few lines o=
f
> logging. The facts will be printed on normal igt-runner output. Here is a=
 real
> example from our CI showing hotreplug-lateclose changing the DRM card
> number and tainting the kernel on the abort path:
>=20
>  [245.316207] [056/121] (816s left) core_hotunplug (hotreplug-lateclose)
> [245.383596] Starting subtest: hotreplug-lateclose  [249.843361] Aborting=
:
> Lockdep not active  [249.858249] [FACT core_hotunplug (hotreplug-
> lateclose)] changed: hardware.pci.drm_card_at_addr.0000:00:02.0: card0 ->
> card1  [249.858392] [FACT core_hotunplug (hotreplug-lateclose)] new:
> kernel.is_tainted.taint_die: true  [249.859075] Closing watchdogs
>=20
> CC: Ryszard Knop <ryszard.knop@intel.com>
> CC: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> CC: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> CC: Lucas De Marchi <lucas.demarchi@intel.com>
> CC: luciano.coelho@intel.com
> CC: nirmoy.das@intel.com
> CC: stuart.summers@intel.com
> CC: himal.prasad.ghimiray@intel.com
> CC: dominik.karol.piatkowski@intel.com
> CC: katarzyna.piecielska@intel.com
> Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
> ---
> Re-sending as the mailing list server rejected the message yesterday due =
to a
> probably full disk...
>=20
> v10:
>  - fix memory leaks from asprintf (Thank you Dominik Karol!)
>  - fix comments for consistency (Thank you Dominik Karol!)
>=20
> v9:
>  - do not report new hardware when loading/unloading kmod changes
>    the string of the GPU name. I accidentally reintroduced this
>    issue when refactoring to use linked lists.
>  - add tools/lsfacts: 9 lines of code that print either the facts
>    or that no facts were found.
>  - fix code comments describing functions
>  - fix white space issues
>=20
> v8:
>  - fix white space issues
>=20
> v7:
>  - refactor to use linked lists provided by igt_lists
>  - Added function arguments to code comments
>  - updated commit message
>=20
> v6:
>  - sort includes in igt_facts.c alphabetically
>  - add facts for kernel taints using igt_kernel_tainted() and
>    igt_explain_taints()
>=20
> v5:
>  - fix the broken patch format from v4
>=20
> v4:
>  - fix a bug on delete_fact()
>  - drop glib and calls to g_ functions
>  - change commit message to indicate that report only on fact changes
>  - use consistent format for reporting changes
>  - fix SPDX header format
>=20
> v3:
>  - refreshed commit message
>  - changed format SPDX string
>  - removed license text
>  - replace last_test assignment when null by two ternary operators
>  - added function descriptions following example found elsewhere in
>    the code
>  - added igt_assert to catch failures to realloc()
>=20
> v2:
>  - add lib/tests/igt_facts.c for basic unit testing
>  - bugfix: do not report a new gpu when the driver changes the gpu name
>  - bugfix: do not report the pci_id twice on the gpu name
>=20
>  lib/igt_facts.c       | 755
> ++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_facts.h       |  47 +++
>  lib/meson.build       |   1 +
>  lib/tests/igt_facts.c |  15 +
>  lib/tests/meson.build |   1 +
>  runner/executor.c     |  10 +
>  tools/lsfacts.c       |  25 ++
>  tools/meson.build     |   1 +
>  8 files changed, 855 insertions(+)
>  create mode 100644 lib/igt_facts.c
>  create mode 100644 lib/igt_facts.h
>  create mode 100644 lib/tests/igt_facts.c  create mode 100644 tools/lsfac=
ts.c
>=20
> diff --git a/lib/igt_facts.c b/lib/igt_facts.c new file mode 100644 index
> 000000000..4749d3417
> --- /dev/null
> +++ b/lib/igt_facts.c
> @@ -0,0 +1,755 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright C 2024 Intel Corporation
> +
> +#include <ctype.h>
> +#include <libudev.h>
> +#include <stdio.h>
> +#include <sys/time.h>
> +#include <time.h>
> +
> +#include "igt_core.h"
> +#include "igt_device_scan.h"
> +#include "igt_facts.h"
> +#include "igt_kmod.h"
> +#include "igt_list.h"
> +#include "igt_taints.h"
> +
> +static struct igt_list_head igt_facts_list_drm_card_head; static struct
> +igt_list_head igt_facts_list_kmod_head; static struct igt_list_head
> +igt_facts_list_ktaint_head; static struct igt_list_head
> +igt_facts_list_pci_gpu_head;
> +
> +
> +/**
> + * igt_facts_lists_init:
> + *
> + * Initialize igt_facts linked lists.
> + *
> + * Returns: void
> + */
> +void igt_facts_lists_init(void)
> +{
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_drm_card_head);
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_kmod_head);
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_ktaint_head);
> +	IGT_INIT_LIST_HEAD(&igt_facts_list_pci_gpu_head);
> +}
> +
> +
> +/**
> + * igt_facts_log:
> + * @last_test: name of the test that triggered the fact
> + * @name: name of the fact
> + * @new_value: new value of the fact
> + * @old_value: old value of the fact
> + *
> + * Reports fact changes:
> + * - new fact: if old_value is NULL and new_value is not NULL
> + * - deleted fact: if new_value is NULL and old_value is not NULL
> + * - changed fact: if new_value is different from old_value
> + *
> + * Returns: void
> + */
> +static void igt_facts_log(const char *last_test, const char *name,
> +			  const char *new_value, const char *old_value) {
> +	struct timespec uptime_ts;
> +	char *uptime =3D NULL;
> +	const char *before_tests =3D "before any test";
> +
> +	if (old_value =3D=3D NULL && new_value =3D=3D NULL)
> +		return;
> +
> +	if (clock_gettime(CLOCK_BOOTTIME, &uptime_ts) !=3D 0)
> +		return;
> +
> +	asprintf(&uptime,
> +		 "%ld.%06ld",
> +		 uptime_ts.tv_sec,
> +		 uptime_ts.tv_nsec / 1000);
> +
> +	/* New fact */
> +	if (old_value =3D=3D NULL && new_value !=3D NULL) {
> +		igt_info("[%s] [FACT %s] new: %s: %s\n",
> +			 uptime,
> +			 last_test ? last_test : before_tests,
> +			 name,
> +			 new_value);
> +		goto out;
> +	}
> +
> +	/* Update fact */
> +	if (old_value !=3D NULL && new_value !=3D NULL) {
> +		igt_info("[%s] [FACT %s] changed: %s: %s -> %s\n",
> +			 uptime,
> +			 last_test ? last_test : before_tests,
> +			 name,
> +			 old_value,
> +			 new_value);
> +		goto out;
> +	}
> +
> +	/* Deleted fact */
> +	if (old_value !=3D NULL && new_value =3D=3D NULL) {
> +		igt_info("[%s] [FACT %s] deleted: %s: %s\n",
> +			 uptime,
> +			 last_test ? last_test : before_tests,
> +			 name,
> +			 old_value);
> +		goto out;
> +	}
> +
> +out:
> +	free(uptime);
> +}
> +
> +/**
> + * igt_facts_list_get:
> + * @name: name of the fact to be added
> + * @head: head of the list
> + *
> + * Get a fact from the list.
> + *
> + * Returns: pointer to the fact if found, NULL otherwise
> + *
> + */
> +static igt_fact *igt_facts_list_get(const char *name,
> +				    struct igt_list_head *head)
> +{
> +	igt_fact *fact =3D NULL;
> +
> +	if (igt_list_empty(head))
> +		return NULL;
> +
> +	igt_list_for_each_entry(fact, head, link) {
> +		if (strcmp(fact->name, name) =3D=3D 0)
> +			return fact;
> +	}
> +	return NULL;
> +}
> +
> +/**
> + * igt_facts_list_del:
> + * @name: name of the fact to be added
> + * @head: head of the list
> + * @last_test: name of the last test
> + * @log: bool indicating if the delete operation should be logged
> + *
> + * Delete a fact from the list.
> + *
> + * Returns: bool indicating if fact was deleted from the list
> + *
> + */
> +static bool igt_facts_list_del(const char *name,
> +			       struct igt_list_head *head,
> +			       const char *last_test,
> +			       bool log)
> +{
> +	igt_fact *fact =3D NULL;
> +
> +	if (igt_list_empty(head))
> +		return false;
> +
> +	igt_list_for_each_entry(fact, head, link) {
> +		if (strcmp(fact->name, name) =3D=3D 0) {
> +			if (log)
> +				igt_facts_log(last_test, fact->name,
> +					      NULL, fact->value);
> +
> +			igt_list_del(&fact->link);
> +			free(fact->name);
> +			free(fact->value);
> +			free(fact->last_test);
> +			free(fact);
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +/**
> + * igt_facts_list_add:
> + * @name: name of the fact to be added
> + * @value: value of the fact to be added
> + * @last_test: name of the last test
> + * @head: head of the list
> + *
> + * Returns: bool indicating if fact was added to the list
> + *
> + */
> +static bool igt_facts_list_add(const char *name,
> +			       const char *value,
> +			       const char *last_test,
> +			       struct igt_list_head *head)
> +{
> +	igt_fact *new_fact =3D NULL, *old_fact =3D NULL;
> +	bool logged =3D false;
> +
> +	if (name =3D=3D NULL || value =3D=3D NULL)
> +		return false;
> +
> +	old_fact =3D igt_facts_list_get(name, head);
> +	if (old_fact) {
> +		if (strcmp(old_fact->value, value) =3D=3D 0) {
> +			old_fact->present =3D true;
> +			return false;
> +		}
> +		igt_facts_log(last_test, name, value, old_fact->value);
> +		logged =3D true;
> +		igt_facts_list_del(name, head, last_test, false);
> +	}
> +
> +	new_fact =3D malloc(sizeof(igt_fact));
> +	if (new_fact =3D=3D NULL)
> +		return false;
> +
> +	new_fact->name =3D strdup(name);
> +	new_fact->value =3D strdup(value);
> +	new_fact->last_test =3D last_test ? strdup(last_test) : NULL;
> +	new_fact->present =3D true;
> +
> +	if (!logged)
> +		igt_facts_log(last_test, name, value, NULL);
> +
> +	igt_list_add(&new_fact->link, head);
> +
> +	return true;
> +}
> +
> +/**
> + * igt_facts_list_mark:
> + * @head: head of the list
> + *
> + * Mark all facts in the list as not present. Opted for the mark and
> +sweep
> + * design pattern due to its simplicity and efficiency.
> + *
> + * Returns: void
> + */
> +static void igt_facts_list_mark(struct igt_list_head *head) {
> +	igt_fact *fact =3D NULL;
> +
> +	if (igt_list_empty(head))
> +		return;
> +
> +	igt_list_for_each_entry(fact, head, link)
> +		fact->present =3D false;
> +}
> +
> +/**
> + * igt_facts_list_sweep:
> + * @head: head of the list
> + * @last_test: name of the last test
> + *
> + * Sweep the list and delete all facts that are not present. Opted for
> +the mark
> + * and sweep design pattern due to its simplicity and efficiency.
> + *
> + * Returns: void
> + */
> +static void igt_facts_list_sweep(struct igt_list_head *head,
> +				 const char *last_test)
> +{
> +	igt_fact *fact =3D NULL, *tmp =3D NULL;
> +
> +	if (igt_list_empty(head))
> +		return;
> +
> +	igt_list_for_each_entry_safe(fact, tmp, head, link)
> +		if (!fact->present)
> +			igt_facts_list_del(fact->name, head, last_test, true); }
> +
> +/**
> + * igt_facts_list_mark_and_sweep:
> + * @head: head of the list
> + *
> + * Clean up the list using mark and sweep. Opted for the mark and sweep
> + * design pattern due to its simplicity and efficiency.
> + *
> + * Returns: void
> + */
> +static void igt_facts_list_mark_and_sweep(struct igt_list_head *head) {
> +	igt_facts_list_mark(head);
> +	igt_facts_list_sweep(head, NULL);
> +}
> +
> +/**
> + * igt_facts_are_all_lists_empty:
> + *
> + * Returns true if all lists are empty. Used by the tool lsfacts.
> + *
> + * Returns: bool
> + */
> +bool igt_facts_are_all_lists_empty(void)
> +{
> +	return igt_list_empty(&igt_facts_list_drm_card_head) &&
> +	       igt_list_empty(&igt_facts_list_kmod_head) &&
> +	       igt_list_empty(&igt_facts_list_ktaint_head) &&
> +	       igt_list_empty(&igt_facts_list_pci_gpu_head);
> +}
> +
> +/**
> + * igt_facts_scan_pci_gpus:
> + * @last_test: name of the last test
> + *
> + * This function scans the pci bus for gpus using udev. It uses
> + * igt_facts_list_mark(), igt_facts_list_add() and
> +igt_facts_list_sweep() to
> + * update igt_facts_list_pci_gpu_head.
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_pci_gpus(const char *last_test) {
> +	static struct igt_list_head *head =3D &igt_facts_list_pci_gpu_head;
> +	struct udev *udev =3D NULL;
> +	struct udev_enumerate *enumerate =3D NULL;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	struct igt_device_card card;
> +	char pcistr[10];
> +	int ret;
> +	char *factname =3D NULL;
> +	char *factvalue =3D NULL;
> +
> +	udev =3D udev_new();
> +	if (!udev) {
> +		igt_warn("Failed to create udev context\n");
> +		return;
> +	}
> +
> +	enumerate =3D udev_enumerate_new(udev);
> +	if (!enumerate) {
> +		igt_warn("Failed to create udev enumerate\n");
> +		udev_unref(udev);
> +		return;
> +	}
> +
> +	ret =3D udev_enumerate_add_match_subsystem(enumerate, "pci");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D udev_enumerate_add_match_property(enumerate,
> +						"PCI_CLASS",
> +						"30000");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D udev_enumerate_add_match_property(enumerate,
> +						"PCI_CLASS",
> +						"38000");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices =3D udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;
> +
> +	igt_facts_list_mark(head);
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		const char *path;
> +		struct udev_device *udev_dev;
> +		struct udev_list_entry *entry;
> +		char *model =3D NULL;
> +		char *codename =3D NULL;
> +		igt_fact *old_fact =3D NULL;
> +
> +		path =3D udev_list_entry_get_name(dev_list_entry);
> +		udev_dev =3D udev_device_new_from_syspath(udev, path);
> +		if (!udev_dev)
> +			continue;
> +
> +		/* Strip path to only the content after the last / */
> +		path =3D strrchr(path, '/');
> +		if (path)
> +			path++;
> +		else
> +			path =3D "unknown";
> +
> +		strcpy(card.pci_slot_name, "-");
> +
> +		entry =3D udev_device_get_properties_list_entry(udev_dev);
> +		while (entry) {
> +			const char *name =3D udev_list_entry_get_name(entry);
> +			const char *value =3D udev_list_entry_get_value(entry);
> +
> +			entry =3D udev_list_entry_get_next(entry);
> +			if (!strcmp(name, "ID_MODEL_FROM_DATABASE"))
> +				model =3D strdup(value);
> +			else if (!strcmp(name, "PCI_ID"))
> +				igt_assert_eq(sscanf(value, "%hx:%hx",
> +						     &card.pci_vendor,
> +						     &card.pci_device), 2);
> +		}
> +		snprintf(pcistr, sizeof(pcistr), "%04x:%04x",
> +			 card.pci_vendor, card.pci_device);
> +		codename =3D igt_device_get_pretty_name(&card, false);
> +
> +		/* Set codename to null if it is the same string as pci_id */
> +		if (codename && strcmp(pcistr, codename) =3D=3D 0) {
> +			free(codename);
> +			codename =3D NULL;
> +		}
> +		asprintf(&factname, "%s.%s", pci_gpu_fact, path);
> +		asprintf(&factvalue,
> +			"%s %s %s",
> +			pcistr,
> +			codename ? codename : "",
> +			model ? model : "");
> +
> +		/**
> +		 * Loading and unloading the kmod may change the human
> +		 * readeable string in value. Do not change value if the
> +		 * pci id is the same.
> +		 */
> +		old_fact =3D igt_facts_list_get(factname, head);
> +		if (old_fact && strncmp(old_fact->value, factvalue, 9) =3D=3D 0)
> +			old_fact->present =3D true;
> +		else
> +			igt_facts_list_add(factname, factvalue, last_test,
> head);
> +
> +		free(codename);
> +		free(model);
> +		free(factname);
> +		free(factvalue);
> +		udev_device_unref(udev_dev);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test);
> +
> +out:
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +/**
> + * igt_facts_scan_pci_drm_cards:
> + * @last_test: name of the last test
> + *
> + * This function scans the pci bus for drm cards using udev. It uses
> +the
> + * igt_facts_list_mark(), igt_facts_list_add() and
> +igt_facts_list_sweep() to
> + * update igt_facts_list_drm_card_head.
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_pci_drm_cards(const char *last_test) {
> +	static struct igt_list_head *head =3D &igt_facts_list_drm_card_head;
> +	struct udev *udev =3D NULL;
> +	struct udev_enumerate *enumerate =3D NULL;
> +	struct udev_list_entry *devices, *dev_list_entry;
> +	int ret;
> +	char *factname =3D NULL;
> +	char *factvalue =3D NULL;
> +
> +	udev =3D udev_new();
> +	if (!udev)
> +		return;
> +
> +	enumerate =3D udev_enumerate_new(udev);
> +	if (!enumerate) {
> +		udev_unref(udev);
> +		return;
> +	}
> +
> +	ret =3D udev_enumerate_add_match_subsystem(enumerate, "drm");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices =3D udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;
> +
> +	ret =3D udev_enumerate_add_match_subsystem(enumerate, "drm");
> +	if (ret < 0)
> +		goto out;
> +
> +	ret =3D udev_enumerate_scan_devices(enumerate);
> +	if (ret < 0)
> +		goto out;
> +
> +	devices =3D udev_enumerate_get_list_entry(enumerate);
> +	if (!devices)
> +		goto out;
> +
> +	igt_facts_list_mark(head);
> +
> +	udev_list_entry_foreach(dev_list_entry, devices) {
> +		const char *path;
> +		struct udev_device *drm_dev, *pci_dev;
> +		const char *drm_name, *pci_addr;
> +
> +		path =3D udev_list_entry_get_name(dev_list_entry);
> +		drm_dev =3D udev_device_new_from_syspath(udev, path);
> +		if (!drm_dev)
> +			continue;
> +
> +		drm_name =3D udev_device_get_sysname(drm_dev);
> +		/* Filter the device by name. Want devices such as card0 and
> card1.
> +		 * If the device has '-' in the name, contine
> +		 */
> +		if (strncmp(drm_name, "card", 4) !=3D 0 ||
> +		    strchr(drm_name, '-') !=3D NULL) {
> +			udev_device_unref(drm_dev);
> +			continue;
> +		}
> +
> +		/* Get the pci address of the gpu associated with the
> drm_dev*/
> +		pci_dev =3D
> udev_device_get_parent_with_subsystem_devtype(drm_dev,
> +									"pci",
> +
> 	NULL);
> +		if (pci_dev) {
> +			pci_addr =3D udev_device_get_sysattr_value(pci_dev,
> +								 "address");
> +			if (!pci_addr)
> +				pci_addr =3D
> udev_device_get_sysname(pci_dev);
> +		} else {
> +			/* Some GPUs are platform devices. Ignore them. */
> +			pci_addr =3D NULL;
> +			udev_device_unref(drm_dev);
> +			continue;
> +		}
> +
> +		asprintf(&factname, "%s.%s", drm_card_fact, pci_addr);
> +		asprintf(&factvalue, "%s", drm_name);
> +
> +		igt_facts_list_add(factname, factvalue, last_test, head);
> +
> +		free(factname);
> +		free(factvalue);
> +		udev_device_unref(drm_dev);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test);
> +
> +out:
> +	udev_enumerate_unref(enumerate);
> +	udev_unref(udev);
> +}
> +
> +/**
> + * igt_facts_scan_kernel_taints:
> + * @last_test: name of the last test
> + *
> + * This function scans for kernel taints using igt_kernel_tainted() and
> + * igt_explain_taints(). It will cut off the explanation keeping only
> +the
> + * taint name.
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_kernel_taints(const char *last_test) {
> +	static struct igt_list_head *head =3D &igt_facts_list_ktaint_head;
> +	unsigned long taints =3D 0;
> +	const char *reason =3D NULL;
> +	char *taint_name =3D NULL;
> +	char *fact_name =3D NULL;
> +
> +	taints =3D igt_kernel_tainted(&taints);
> +	/* For testing, set all bits to 1
> +	 * taints =3D 0xFFFFFFFF;
> +	 */
> +
> +
> +	igt_facts_list_mark(head);
> +
> +	while ((reason =3D igt_explain_taints(&taints)) !=3D NULL) {
> +		/* Cut at the ':' to get only the taint name */
> +		taint_name =3D strtok(strdup(reason), ":");
> +		if (!taint_name)
> +			continue;
> +
> +		/* Lowercase taint_name */
> +		for (int i =3D 0; taint_name[i]; i++)
> +			taint_name[i] =3D tolower(taint_name[i]);
> +
> +		asprintf(&fact_name, "%s.%s", ktaint_fact, taint_name);
> +		igt_facts_list_add(fact_name, "true", last_test, head);
> +
> +		free(taint_name);
> +		free(fact_name);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test); }
> +
> +
> +/**
> + * igt_facts_scan_kernel_loaded_kmods:
> + * @last_test: name of the last test
> + *
> + * This function scans for loaded kmods using igt_fact_kmod_list and
> + * igt_kmod_is_loaded().
> + *
> + * Returns: void
> + */
> +static void igt_facts_scan_kernel_loaded_kmods(const char *last_test) {
> +	static struct igt_list_head *head =3D &igt_facts_list_kmod_head;
> +	char *name =3D NULL;
> +
> +	igt_facts_list_mark(head);
> +
> +	/* Iterate over igt_fact_kmod_list[] until the element contains "\0" */
> +	for (int i =3D 0; strcmp(igt_fact_kmod_list[i], "\0") !=3D 0; i++) {
> +		asprintf(&name, "%s.%s", kmod_fact, igt_fact_kmod_list[i]);
> +		if (igt_kmod_is_loaded(igt_fact_kmod_list[i]))
> +			igt_facts_list_add(name, "true", last_test, head);
> +
> +		free(name);
> +	}
> +
> +	igt_facts_list_sweep(head, last_test); }
> +
> +/**
> + * igt_facts:
> + * @last_test: name of the last test
> + *
> + * Call this function where you want to gather and report facts.
> + *
> + * Returns: void
> + */
> +void igt_facts(const char *last_test)
> +{
> +	igt_facts_scan_pci_gpus(last_test);
> +	igt_facts_scan_pci_drm_cards(last_test);
> +	igt_facts_scan_kernel_taints(last_test);
> +	igt_facts_scan_kernel_loaded_kmods(last_test);
> +
> +	fflush(stdout);
> +	fflush(stderr);
> +}
> +
> +/*
> + * Testing
> + *
> + * Defined here to keep most of the functions static
> + *
> + */
> +
> +/**
> + * igt_facts_test_add_get:
> + * @head: head of the list
> + *
> + * Tests igt_facts_list_add and igt_facts_list_get.
> + *
> + * Returns: void
> + */
> +static void igt_facts_test_add_get(struct igt_list_head *head) {
> +	igt_fact *fact =3D NULL;
> +	bool ret;
> +	const char *name =3D "hardware.pci.gpu_at_addr.0000:00:02.0";
> +	const char *value =3D "8086:64a0 Intel Lunarlake (Gen20)";
> +	const char *last_test =3D NULL;
> +
> +	ret =3D igt_facts_list_add(name, value, last_test, head);
> +	igt_assert(ret =3D=3D true);
> +
> +	// Assert that there is one element in the linked list
> +	igt_assert_eq(igt_list_length(head), 1);
> +
> +	// Assert that the element in the linked list is the one we added
> +	fact =3D igt_facts_list_get(name, head);
> +	igt_assert(fact !=3D NULL);
> +	igt_assert_eq(strcmp(fact->name, name), 0);
> +	igt_assert_eq(strcmp(fact->value, value), 0);
> +	igt_assert(fact->present =3D=3D true);
> +	igt_assert(fact->last_test =3D=3D NULL);
> +}
> +
> +/**
> + * igt_facts_test_mark_and_sweep:
> + * @head: head of the list
> + *
> + * - Add 3 elements to the list and mark them as not present.
> + * - Update two of the elements and mark them as present.
> + * - Sweep the list and assert that
> + *   - Only the two updated elements are present
> + *   - The third element was deleted
> + *
> + * Returns: void
> + */
> +static void igt_facts_test_mark_and_sweep(struct igt_list_head *head) {
> +	igt_fact *fact =3D NULL;
> +	const char *name1 =3D "hardware.pci.gpu_at_addr.0000:00:02.0";
> +	const char *value1 =3D "8086:64a0 Intel Lunarlake (Gen20)";
> +	const char *name2 =3D "hardware.pci.gpu_at_addr.0000:00:03.0";
> +	const char *value2 =3D "8086:64a1 Intel Lunarlake (Gen21)";
> +	const char *name3 =3D "hardware.pci.gpu_at_addr.0000:00:04.0";
> +	const char *value3 =3D "8086:64a2 Intel Lunarlake (Gen22)";
> +
> +	igt_facts_list_add(name1, value1, NULL, head);
> +	igt_facts_list_add(name2, value2, NULL, head);
> +	igt_facts_list_add(name3, value3, NULL, head);
> +
> +	igt_facts_list_mark(head);
> +
> +	igt_facts_list_add(name1, value1, NULL, head);
> +	igt_facts_list_add(name2, value2, NULL, head);
> +
> +	igt_facts_list_sweep(head, NULL);
> +
> +	// Assert that there are two elements in the linked list
> +	igt_assert_eq(igt_list_length(head), 2);
> +
> +	// Assert that the two updated elements are present
> +	fact =3D igt_facts_list_get(name1, head);
> +	igt_assert(fact !=3D NULL);
> +	igt_assert(fact->present =3D=3D true);
> +
> +	fact =3D igt_facts_list_get(name2, head);
> +	igt_assert(fact !=3D NULL);
> +	igt_assert(fact->present =3D=3D true);
> +
> +	// Assert that the third element was deleted
> +	fact =3D igt_facts_list_get(name3, head);
> +	igt_assert(fact =3D=3D NULL);
> +}
> +
> +/**
> + * igt_facts_test:
> + *
> + * Main function for testing the igt_facts module
> + *
> + * Returns: bool indicating if the tests passed  */ void
> +igt_facts_test(void) {
> +	const char *last_test =3D "Unit Testing";
> +
> +	igt_facts_lists_init();
> +
> +	/* Assert that all lists are empty */
> +	igt_assert(igt_list_empty(&igt_facts_list_kmod_head));
> +	igt_assert(igt_list_empty(&igt_facts_list_ktaint_head));
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head));
> +	igt_assert(igt_list_empty(&igt_facts_list_drm_card_head));
> +
> +	/* Assert that add and get work. Will add one element to the list */
> +	igt_facts_test_add_get(&igt_facts_list_pci_gpu_head);
> +
> +	/* Assert that igt_facts_list_mark_and_sweep() cleans up the list */
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) =3D=3D false);
> +	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> +	igt_assert(igt_list_empty(&igt_facts_list_pci_gpu_head) =3D=3D true);
> +
> +	/* Test the mark and sweep pattern used to delete elements
> +	 * from the list
> +	 */
> +	igt_facts_test_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> +
> +	/* Clean up the list and call igt_facts(). This should not crash */
> +	igt_facts_list_mark_and_sweep(&igt_facts_list_pci_gpu_head);
> +	igt_facts(last_test);
> +}
> diff --git a/lib/igt_facts.h b/lib/igt_facts.h new file mode 100644 index
> 000000000..e4adca3fb
> --- /dev/null
> +++ b/lib/igt_facts.h
> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: MIT
> + * Copyright C 2024 Intel Corporation
> + */
> +
> +#include <stdbool.h>
> +
> +#include "igt_list.h"
> +
> +
> +/* igt_fact:
> + * @name: name of the fact
> + * @value: value of the fact
> + * @last_test: name of the test that triggered the fact
> + * @present: bool indicating if fact is present. Used for deleting
> +facts from
> + * the list.
> + * @link: link to the next fact
> + *
> + * A fact is a piece of information that can be used to determine the
> +state of
> + * the system.
> + *
> + */
> +typedef struct {
> +	char *name;
> +	char *value;
> +	char *last_test;
> +	bool present; /* For mark and seep */

Typo: seep -> sweep
With this fixed,
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> +	struct igt_list_head link;
> +} igt_fact;
> +
> +const char *igt_fact_kmod_list[] =3D {
> +	"amdgpu",
> +	"i915",
> +	"nouveau",
> +	"radeon",
> +	"xe",
> +	"\0"
> +};
> +
> +const char *kmod_fact     =3D "kernel.kmod_is_loaded"; /* true or false =
*/
> +const char *ktaint_fact   =3D "kernel.is_tainted"; /* taint name: taint_=
warn */
> +const char *pci_gpu_fact  =3D "hardware.pci.gpu_at_addr"; /* id vendor
> +model */ const char *drm_card_fact =3D "hardware.pci.drm_card_at_addr";
> +/* cardX */
> +
> +void igt_facts_lists_init(void);
> +void igt_facts(const char *last_test);
> +bool igt_facts_are_all_lists_empty(void);
> +void igt_facts_test(void); /* For unit testing only */
> diff --git a/lib/meson.build b/lib/meson.build index c3556a921..c44ca2b5a
> 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -18,6 +18,7 @@ lib_sources =3D [
>  	'i915/i915_crc.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
> +	'igt_facts.c',
>  	'igt_crc.c',
>  	'igt_debugfs.c',
>  	'igt_device.c',
> diff --git a/lib/tests/igt_facts.c b/lib/tests/igt_facts.c new file mode =
100644
> index 000000000..7fa9d0f22
> --- /dev/null
> +++ b/lib/tests/igt_facts.c
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright C 2024 Intel Corporation
> +
> +#include <stdbool.h>
> +
> +#include "igt_core.h"
> +#include "igt_facts.h"
> +
> +/* Tests are not defined here so we can keep most of the functions
> +static */
> +
> +igt_simple_main
> +{
> +	igt_info("Running igt_facts_test\n");
> +	igt_facts_test();
> +}
> diff --git a/lib/tests/meson.build b/lib/tests/meson.build index
> df8092638..1ce19f63c 100644
> --- a/lib/tests/meson.build
> +++ b/lib/tests/meson.build
> @@ -8,6 +8,7 @@ lib_tests =3D [
>  	'igt_dynamic_subtests',
>  	'igt_edid',
>  	'igt_exit_handler',
> +	'igt_facts',
>  	'igt_fork',
>  	'igt_fork_helper',
>  	'igt_hook',
> diff --git a/runner/executor.c b/runner/executor.c index
> ac73e1dde..d1eca3c05 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -30,6 +30,7 @@
>=20
>  #include "igt_aux.h"
>  #include "igt_core.h"
> +#include "igt_facts.h"
>  #include "igt_taints.h"
>  #include "igt_vec.h"
>  #include "executor.h"
> @@ -2306,6 +2307,9 @@ bool execute(struct execute_state *state,
>  	sigset_t sigmask;
>  	double time_spent =3D 0.0;
>  	bool status =3D true;
> +	char *last_test =3D NULL;
> +
> +	igt_facts_lists_init();
>=20
>  	if (state->dry) {
>  		outf("Dry run, not executing. Invoke igt_resume if you want to
> execute.\n"); @@ -2438,6 +2442,10 @@ bool execute(struct execute_state
> *state,
>  		int result;
>  		bool already_written =3D false;
>=20
> +		/* Calls before running each test */
> +		igt_facts(last_test);
> +		last_test =3D entry_display_name(&job_list->entries[state-
> >next]);
> +
>  		if (should_die_because_signal(sigfd)) {
>  			status =3D false;
>  			goto end;
> @@ -2526,6 +2534,8 @@ bool execute(struct execute_state *state,
>  			return execute(state, settings, job_list);
>  		}
>  	}
> +	/* Last call to collect facts after the last test runs */
> +	igt_facts(last_test);
>=20
>  	if ((timefd =3D openat(resdirfd, "endtime.txt", O_CREAT | O_WRONLY |
> O_EXCL, 0666)) >=3D 0) {
>  		dprintf(timefd, "%f\n", timeofday_double()); diff --git
> a/tools/lsfacts.c b/tools/lsfacts.c new file mode 100644 index
> 000000000..10dee0317
> --- /dev/null
> +++ b/tools/lsfacts.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: MIT
> +// Copyright C 2024 Intel Corporation
> +
> +#include "igt.h"
> +#include "igt_facts.h"
> +
> +/**
> + * SECTION:lsfacts
> + * @short_description: lsfacts
> + * @title: lsfacts
> + * @include: lsfacts.c
> + *
> + * # lsfacts
> + *
> + * Scan for igt-facts and print them on screen. Indicate if no facts are=
 found.
> + */
> +int main(int argc, char *argv[])
> +{
> +	igt_facts_lists_init();
> +
> +	igt_facts("lsfacts");
> +
> +	if (igt_facts_are_all_lists_empty())
> +		igt_info("No facts found...\n");
> +}
> diff --git a/tools/meson.build b/tools/meson.build index
> 48c9a4b50..ff1b0ef90 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -42,6 +42,7 @@ tools_progs =3D [
>  	'intel_gem_info',
>  	'intel_gvtg_test',
>  	'dpcd_reg',
> +	'lsfacts',
>  	'lsgpu',
>  	'power',
>  ]
> --
> 2.34.1

