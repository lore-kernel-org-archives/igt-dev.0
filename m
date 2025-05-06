Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AFDC3ABAC
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 12:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710C110E685;
	Tue,  6 May 2025 12:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X7mUb5kU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B772F10E685
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 12:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746536012; x=1778072012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=a6ER1fPuEcIsjzzfXh/EHJlg18138ObUGBVwCDXddnw=;
 b=X7mUb5kUPDkcMgm2MGljugSr1+oZdnptE/ywzDbvhHR8fTjBiQj3Dugn
 ToCUOqiKwftoS/REDP3REzh0jHmgZVxkmsafXhr6btqdtH7EPvdNXSQYs
 6dqOlZozzdAvC0wyK4ukLCmslmMpza56VKswnVSCwhIpAZR4VjfOgbdlV
 N0SdPuY3ntufQlAdFuWHzZ3VjAyUp/LSdmmCulo5LsSd9L5NskSfw0bTQ
 Xv+DXnpPb+8gHzh7BkxR3pCKh2Tuk+jpQT6dMJWeUlLA0WJ5VJGjKHPfN
 vyJq8sX1nYLFOY7PXlTd+gH8Dr4n5O9ujG7ekgwQ1T18o9oiRZLYT1TDz w==;
X-CSE-ConnectionGUID: USth6pX/QN2DKxUweGMr3A==
X-CSE-MsgGUID: pYD0siGJQJCLwuihfL4mFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="48329974"
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="48329974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 05:53:32 -0700
X-CSE-ConnectionGUID: gizD0nKWREmu+Uys1jbMmw==
X-CSE-MsgGUID: HwJf2yFBQta6vJkFXZ32PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,266,1739865600"; d="scan'208";a="140370555"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 05:53:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 05:53:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 05:53:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 05:53:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YjDZ7JCrTOk+lgMSqbp6J8vpTdUG72JdXzhIc8SJfOzh17vZ+TJHL7cAQeWlsbTMr3WjJQcoaclU8R21gjBkXr5CfwL5LjSkW5RanaMZeInraUDfctuSjmwOExOLI0HiPdpbjcWJ/g4vrG2hGhc7WR6MP4zHOkwQnPH7fsrp8mceBQWqZf4HeezwSUHCz/csuF2GtDxTST1zSugP7CmqnzQdLverE7xCJ/SGAsqIkO4ugfyC1fQO5vG6dViOX6pSQkmQ4KSIExXXHze4a8s+Mguy6hlolqIjXaym76ogazwFwbSQ7vzADmyonyBq0DmrIpihOKCYToxarO/JMU7DUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KBvj9lEpMy5Ux+YstmcoGOAAh0X+QXyQikInWLCeLVQ=;
 b=o26cQWNgZC9evj2NN1TwIiJKEqsAvrnrnTQDrXbfsAP+6rm8fn4B+VV5R9MCNWYvT09HcELSk2pMXnsaaLBszwq/XI3NpyRaF21zO1/A8YcKaAItL8gPCS0Y1AciW9GEEJS64r/tqdpTha8NzXLyaJuNF01XMmkeXtFaWk4v9x2/+SeToQuPXNjRsd7hgqGTbc+jhn0CJf+OoFgk+Ifyr7gNssLTBdnhuF9xqJ2a7mxKBVNFGMBDPaO2VP3rzUbsvu0HaDaAb+8puhtFJTdOCI0PMjc6HNaO311f/VZ4SkHxkbngdfYpk4tB5f27Sb2bktJ9fhlSZFbvvrzrxoBrHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by MN6PR11MB8243.namprd11.prod.outlook.com (2603:10b6:208:46e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 12:53:22 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 12:53:22 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe_pmu: Check default scheduling
 attributes before test
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe_pmu: Check default scheduling
 attributes before test
Thread-Index: AQHbvm/vEe6jVM9bxkiTEEPrz3TyB7PFjlvg
Date: Tue, 6 May 2025 12:53:22 +0000
Message-ID: <LV3PR11MB8695A7334868120572639BD7F989A@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250506101554.629218-1-marcin.bernatowicz@linux.intel.com>
 <20250506101554.629218-3-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20250506101554.629218-3-marcin.bernatowicz@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|MN6PR11MB8243:EE_
x-ms-office365-filtering-correlation-id: 39015c6d-863a-4e6d-5424-08dd8c9cfb9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?PCR5VPudV2KvmyLJWJm7V0pXgLu8ecU6bcrco78ylRGjTiWdUU3fF/JnwzbP?=
 =?us-ascii?Q?3EkPTaAqhouQLBZr1mekTNTxNEW+aHbyVE9lcVAKxHMGWiyRI5IO6Zp6QcME?=
 =?us-ascii?Q?BsIn4UcfMA4QuHFoFKwvwgajnIxfBUjmWO2iplkt+c2kqJCJAUHWXUkRUQBp?=
 =?us-ascii?Q?jq+K/AoZz+tRIVHWki0sijiGEH5I7XGEaYCSI3oILehGV5Y2jiLF5/2od8on?=
 =?us-ascii?Q?imZXurQv+1AnTTnqEm6iqOPv10sq7B7uxhKB5W3RocZsFwkBHQeP0yeoXOZR?=
 =?us-ascii?Q?xaVgvzu+/fUmoZ1Sn9J0G9AvCE0lFSo1EZ8le9Dj02WKTBYDLN3xHGHclY+g?=
 =?us-ascii?Q?WY8R59W0RfkqdKTzlyfJSkLFgIBgJQRGHsN6n7g8zbSFxZRRtGgqYkWuq71w?=
 =?us-ascii?Q?DhEY2H+SnmJ0ZS1kNMK+iSS+i1evwh0yWUQIl8K3wAhnNIG52tBdf3KLqEwT?=
 =?us-ascii?Q?Fp6Rqk6QidTXBadQzNFeYk/JhSW4/sJXfEQuLVdymu6Fn03VTxCoijuNKDBc?=
 =?us-ascii?Q?fKE2uJzRNObggV8T9mRvrXP+DU6r/CgnaC2gTGBGpkyhYJk5t8T2zDygcVfT?=
 =?us-ascii?Q?zPxtI2VMTlXf91az6/JaWyIYs9jgh7Q9OmX8kBDviudtst4AOZUNKSREP4xK?=
 =?us-ascii?Q?8cHEurL7Mkszoy2Mfyk0tRKugzs110F4JUL1K5NMs5FRc07+DbZ5UvAdXcbw?=
 =?us-ascii?Q?5QH1xHLrFkuujUi9rqzL382cXVnJNszL7NFq0FO/Gd21qnphWrR2WOcVDR0w?=
 =?us-ascii?Q?PnFJva46Kb7T4x5hdHS1KR4cwmDmiXy4MY5SLUsbdGnRXMXHbA+m5q7/FvlJ?=
 =?us-ascii?Q?DYqqH4bgFson5SzAzEtXJmBLJyEyTVwC3XRKDqf71Hb0uh2rswwiSlQf0EKB?=
 =?us-ascii?Q?ozvR3/Bf/b6SQF1wJn6/VS5Y7KesQ02iXvcowyxu98AgXeL5puFNvECnDzDD?=
 =?us-ascii?Q?syQW1TzOG4aCFs8/mKBSncs6mq8xnufy0CNX9EhvP3Sj//wqE7MzMs2e3RbR?=
 =?us-ascii?Q?Lr9mDJ4t+T9DzDwnb+rnmVc9qF8DnPTANRuNEry4ixqjbcvPc9Rs7U95wca8?=
 =?us-ascii?Q?8Cb0BXa7tt/vU0U0uN04ZpqwAegZgmbZ6Fz4Aj/82PqE0tbUxALZF95MFTM3?=
 =?us-ascii?Q?jVNlik6kBL5YjeHIIsJdktY+5wXgNh88H1UV09y8PN1YvxygVhcNoD0JtM+F?=
 =?us-ascii?Q?IbYbjC6AqFDynR9/xVoekP4bXxXHdKWM0opCRFxOAJum5qbd5k6HPRWwWuqM?=
 =?us-ascii?Q?2NPBlHA84nXTdXyo8P7o5dCrdQ1qgF6BP72pgYR2Ph8XyZQoP67cnBrEOmex?=
 =?us-ascii?Q?9YjPjnoH7EHz0yu8m/wPACJwMVpUeom0sqGsIUL24kBdjMqjTTYkcVeFUjbo?=
 =?us-ascii?Q?+VFvSOtiXa8QloY6Zky307EcIH46H/Ipxhco6KAnqHee1Aa+7E9o+UDuCqH1?=
 =?us-ascii?Q?YbI/y0AXjmY482gQLUDPpXVRM5mC65AWSZTZN5RmO6zootbPYd+qyPWkm+1c?=
 =?us-ascii?Q?Ezjr6DhNOaI7MSo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aeVMelsryKcHlITRr2EwIV83mT89VgOh2Ei83bPd7NG5M2o/6N5q6mT0QeKe?=
 =?us-ascii?Q?ncXJlU/oYKcn+bzAoy9NHeg8yyDkvtVVWU5PZhdoSzn6rp+wWZ69aNzKuLBA?=
 =?us-ascii?Q?zcvNEXph7plM2fDsJGY3qy0bsQB09ij5Z85/gBYrb2i+UnArIOHIRqhGZSrU?=
 =?us-ascii?Q?xnJs3VQonMYFQYhDz4BsMuOgZMms7VzmAqlDdTBaZq30r/vqV82dPpoS0onj?=
 =?us-ascii?Q?ZsPrIyi0XGEw4ZXtWIUfjWpCwesSt8M5xMUpGyoyv7ItRWEtw5nUJN5kH5jV?=
 =?us-ascii?Q?9BlPXGVjV8o4JNhrWQK96Vh84TPXCXi1X4DhIAYBhXgZPYLFoyKTTlU5JVYY?=
 =?us-ascii?Q?On/Y27YZ8vK+IuxKucw4tGTgpLG+/xnLlNct3oGnjmqTMMPS2yp8zvB4cQFT?=
 =?us-ascii?Q?LJx2simG3KXOSR2yo/Fg3fcmn1LbMS/BpJoH9OkY6hH5Einq57AyJ9cu6Jqs?=
 =?us-ascii?Q?6Mk6p8cRBNQ62QJjqWX9UKAtzkXG4qEAsINOdfiHM5UGkhwyVCn7Vwis/Ce7?=
 =?us-ascii?Q?mnapbf9EVic+arjrLLre1/F9ICY/IYGoKR1rYgwacm3YlTCo9wT03b8vd49l?=
 =?us-ascii?Q?XJnWR+PhCJAgd9FfXG6wdwgbQK5OBh6K4TnphukwbNUEfOufeb43fHCESRJ2?=
 =?us-ascii?Q?ofBsrYDbqJtcbtwjqL2Cfyt4NRhyUjG/yKPyGGc8qsw5XJz6RBgLxdjRY467?=
 =?us-ascii?Q?qQgF1fAj83O4RezEPjDyp/PTXZD0Cfnr1WQdxqn8AXX+KFj7upOW4Uhx/GbZ?=
 =?us-ascii?Q?USNY7U6MDatiAAeeKpahCQ6Hrkb2MnP877FBYdwpV4SFnf2mZpKEXLmmCWuK?=
 =?us-ascii?Q?vJY76NTIhtnbfirMHDEAyBb7d7MuL9InPxYlgCHDvmgekVTxSY5cUiUoksRc?=
 =?us-ascii?Q?KWT1xnmmCUBoMqxTZpS07rrqN7W6kwyig0kpFxJpkEgUz5kH6FiyO9aMSrpO?=
 =?us-ascii?Q?id4RBQvWxxN0UDl3YB/K1B0z6VT6engAzz8V5cUKWGl1bV2VONHKFu3shkDj?=
 =?us-ascii?Q?GvPqpxEzcry2PWw3JiXC3+jQ2nmpRtQyQWBzPtSvOGdjPlX2n9Y9aPKj6Tne?=
 =?us-ascii?Q?BOE1NGIhDPP3pMWRf8HsVN5mbWDD9hhiiN8wtEiP8Q+ABytxLcpcuL5YmWXb?=
 =?us-ascii?Q?l2BGCyvMsTcj4Bj6jumiC9zrMmkoi894HNZJYxefxvw5m0pVL76HsOnkod6X?=
 =?us-ascii?Q?djeY2MUdDmw5FWSZwqgUv0ACieEUKWznb/Hi7hH4ywEleuTEa3TmGleLhcbd?=
 =?us-ascii?Q?9gKvWYagVdDuhwhwiOIFY6k78BaUv7CNeDLyvx9QV80LMhU0TJVweaB9KW/s?=
 =?us-ascii?Q?psRdJp09b9iYSE3Ffl5s4cCKDsSc01GPSl/SB0NvockyLnRFzh/o7g2Kn040?=
 =?us-ascii?Q?VIsexeoyHml2pVwkYvo8ZLTqvavFtBe0mbbn4efKcwIKsqDwu2dISjuuAIDI?=
 =?us-ascii?Q?c4y6dGdgnzozd+XbwKzby1O3yEAwoHToThGeQFa+l2K62w2CgqrbI2eMEQL0?=
 =?us-ascii?Q?PbajJeM+NFuivx791iHTTnWQqPGKvvGoIS3iTbyIaC1V1lxL4WxTbvyv6wvM?=
 =?us-ascii?Q?jPujIv4dt7OO969hHS7rlzfnO+SDO0txsR0TJ87O9jTlSQaph5mX6/2wvodx?=
 =?us-ascii?Q?Kw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39015c6d-863a-4e6d-5424-08dd8c9cfb9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2025 12:53:22.0346 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zKIpiBhKrIZkRsltYfXzeHxQBYeQd1Z83EzC/v7wD2MRIraE46VwNORUUKDLAMV6mrCwfUdET4/lWMthSFqiPO26yBv2FrP9dIWzkonFuXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8243
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
> From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Sent: Tuesday, May 6, 2025 3:46 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Kolakowski,
> Jakub1 <jakub1.kolakowski@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; K V P, Satyanarayana
> <satyanarayana.k.v.p@intel.com>
> Subject: [PATCH i-g-t 2/2] tests/intel/xe_pmu: Check default scheduling
> attributes before test
>=20
> Ensure that default scheduling attributes are set before running the
> test. This avoids unexpected configuration during VF provisioning.
>=20
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> ---
>  tests/intel/xe_pmu.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
> index 8cbbf6916..806a62cdb 100644
> --- a/tests/intel/xe_pmu.c
> +++ b/tests/intel/xe_pmu.c
> @@ -471,6 +471,7 @@ static unsigned int enable_and_provision_vfs(int fd)
>=20
>  	igt_require(igt_sriov_is_pf(fd));
>  	igt_require(igt_sriov_get_enabled_vfs(fd) =3D=3D 0);
> +	xe_sriov_require_default_scheduling_attributes(fd);
>  	autoprobe =3D igt_sriov_is_driver_autoprobe_enabled(fd);
>=20
>  	/* Enable VF's */
LGTM.
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> --
> 2.31.1

