Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9216AEED606
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 14:05:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5498C10E8DD;
	Thu, 12 Sep 2024 14:05:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dFYpTlX9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F60D10E8DD
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726149957; x=1757685957;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BlCJGq044hFSj7oaLUj049cJVP+sCz3io6q1PIeswtk=;
 b=dFYpTlX9+UR64+7DjSHz7i2FFtHh7ldncjnQJu5m2Hsak1cXmniba5/z
 IH6+NPddSHhzIfwlg1Je9MDCooCsQ+DiiVM5z7UKq8lQewXPo53Zb+LM7
 KGqiajW2ufsGX0beFcVCHsKoq/Rg8JaFVzudmf3KvtZf4SO+tYKpQPR7S
 dE/W3bXhXuUsikl5NZ0MLaNXEh1UkqK6RHyt8qBMWYaGD1zy2W9wwhSUw
 UcC7yVknBZn33nVhiUDIt9zuq4rPbbiAvN1Bydf3st2JaJg3n33L4AK8M
 wjUPvXOY4h5D42npYiyK90ouNFTqExrXt678RQiB0jSNpYjkFPbZcf56X g==;
X-CSE-ConnectionGUID: 93CwSwiwSBG9qEFrWunzlQ==
X-CSE-MsgGUID: qFvYyP/8SCyaTpD8HT90Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24539285"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24539285"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:04:42 -0700
X-CSE-ConnectionGUID: Bp1biA8/QoaNHmhKeVif3w==
X-CSE-MsgGUID: FxXHLJZuTb6wN9BgfFIiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67425523"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 07:04:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:04:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:04:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 07:04:40 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 07:04:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OIGvFMjQO0Gu+RDxEFKyVsbht39UGo6pbQ4SIu9t4Kum2ynjI2cw7g5HISkd6ZUqMgj7T0W2fuThPpzeC5l5XiBJTjn/+CN50VR8I06bVrwJusplOkrv6fjSO0/L2EPXfXyfWJcEeivlIPnoGRpSy/IR2Q8e2/XL90hXqOJx7imXXjaRGD6TpM3SE/rn3DiUM1xrDr/T9WOOg6EyqdcP+awdrOliTyeGs0h/hIWHQgdGrLh7UVETV0RB7NKKJ3FPtPoTkybeQnL9AR1oWpFLfE4KiWyT7cFf4szU7gnDl7XfFmZGOuluOpRJms0YVh5qjGrYP3Rf5QELvAa/4huDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zFkE7awdpawT2BlK1p7+imp/uf17dfBzfKR/HtrHCbo=;
 b=VPFRB8sJHwfAMyNrd3J3DwpxN71W4FV4wifBlOOVlIJ9sX/71MgrXJKc5MeBz/dZTlZgI2vs+pFDZpdFeoLe3YFKvJ3QajrBQsAqS1qN8qxVRZB3LuysvE/IbsdlDdhkiHrAqwkpFTDQpGbIornj8JHDVpTfpDumqYoI8d9E+PYquFj3ESQPqlX0oWqh5P6wQv3HhTbUTIZPUEirUUn9xIiALp5GsbF4mhKDjgGOGO8eFSrtEqcdz3TL3gIGBJUxEobtBqNpaBSJ3M2XVTGy/MGQhO8HqJ3pxADuvM7vbsz1+e+NnGnhyTI8JiIufEqNY6wb9A6vIczdI2GJnQlC4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 14:04:37 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.7918.024; Thu, 12 Sep 2024
 14:04:37 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t 4/4] tests/kms_content_protection: Make
 mst_cp_enable_with_retry() void
Thread-Topic: [PATCH i-g-t 4/4] tests/kms_content_protection: Make
 mst_cp_enable_with_retry() void
Thread-Index: AQHbBRjbyuZrmpVEgUyFSa/uUjZH+bJULflQ
Date: Thu, 12 Sep 2024 14:04:37 +0000
Message-ID: <PH0PR11MB4806EC2EB40A696F61CA6AABE4642@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240912133421.718496-1-suraj.kandpal@intel.com>
 <20240912133421.718496-5-suraj.kandpal@intel.com>
In-Reply-To: <20240912133421.718496-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|LV3PR11MB8554:EE_
x-ms-office365-filtering-correlation-id: d5888bbe-c158-4549-d351-08dcd333d69b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?k8Y2UluPAOm3uqACzbOKAoL0/Au5fBCMf7Q+cuq+L11YHIg/wxRlFCmfgpcu?=
 =?us-ascii?Q?5fe3j1dODRAnjMaluUGoUNLlolKLD8qZjQmgGjEHbmNF+39+Cz1aM3otB43/?=
 =?us-ascii?Q?wy29zu48eNfwr/3C0z8CBRNQKO49cuak5+XJKtRbZ6Ac5MLdDFyardXv7AS3?=
 =?us-ascii?Q?LvTP4fCWCcOrYgaa0b8Bgq4RvBw2xZU2YK6rekYc6ErS/IFPGe/AlUKnYdof?=
 =?us-ascii?Q?E98oH03STozPx3Vdu8FHoEsxJ8+hBn49HUlH0NZPqswexnIRGo0OUTx2pbFp?=
 =?us-ascii?Q?mYCDem4i46iyjcAK1uLRf2KNg0fjzmRX84cgJ/GWIn+iUPfUk+XWN7o/Dkhn?=
 =?us-ascii?Q?F2OHGqjCsFpa5bFUf9MNouwzqOr66HZO587HaVsPlDEZqSg4ClDb6Q/eVvMB?=
 =?us-ascii?Q?S9JyheyAm3CnYK4xWPlRzRji1S0QFc023NJCq5hagB6ITFF9980GWr7f3q6S?=
 =?us-ascii?Q?ZblnqGFaPZN+Tn+OqcnAk2QaYRHVXTQgVIPBQYXgVmxe431f3S0Y6/FBB6k6?=
 =?us-ascii?Q?zciEZsy2oxE99w5EAjxcTF1DWhNiDWTHzcQacwPcVoKo/oIyGfoagHQX1TMn?=
 =?us-ascii?Q?7erSyR7/6eOBAsWtdfYRD2VWkY2066izGqD/RfF2/aS2OSx38p8h3qLIWRy9?=
 =?us-ascii?Q?Ux9CijU1HlH5CmYsNyRWcZ8/d4Oe3S85bMzmp4QFzSgdXTGA1DbsPiN5eLib?=
 =?us-ascii?Q?dEdw9vDmHlkRkvd5YjfcZvx1xeiyn/JYkV82FD7oaRMDcpBfzaQ/T6/nOu9E?=
 =?us-ascii?Q?WyS8K/Ga4vei8mxNNRIXHCG7TjtIyw8a2JtAp7n+siQ/LP/GWx/+HeZ2DKuz?=
 =?us-ascii?Q?hzyt0+s9K+OjNYdfObJPcTO4U0F5Br6GZPY4jy+/Ct9OD38TzR55UFBrKj1u?=
 =?us-ascii?Q?uJ3cZpEY101lFdF/y0wOkXqMCOzxZSPILryMBPHLb7UYizaIwAzN6a9+xWiP?=
 =?us-ascii?Q?HPQSxWMea0Pt+95oknN2v43u8s15ay9Gqy0N3Ckudnd4hRVz0bXF83LCzLfH?=
 =?us-ascii?Q?VVD5gp4fIem20KMm5v23YPXk7sQydc5M514whXibs9uk0DHep1ED0fzdSR7A?=
 =?us-ascii?Q?qSZh7vm+g1waE71+HHI4Xr+gadnvlF+QKNzTZZ+jC+yukCiwIFNqJEo2uAOa?=
 =?us-ascii?Q?nlOcto0NNqj3nZPwozSJB20f+hE1IQlcQqln63DfKlAURh29BY12YRqULJSm?=
 =?us-ascii?Q?oeo8f3781glsDMX7lhLTpAqMSUCtA1/cUesYcoIOtBd4eXIRuHOdP0mCjExR?=
 =?us-ascii?Q?y9tPxIJuTDd+P1NaOLcPTr0CTVb1LOrz6iwXpayBxovfKjym97JB4wnM32JX?=
 =?us-ascii?Q?6/5U2OCIOEFjDmge+EvdbH4TFCQjaHs7+sWfC7fZdPcHQL1j1hMPS38gqaMh?=
 =?us-ascii?Q?XJdv9kc+2qDiB7xCwvKS+P+3ZsnN1YC52hrkj3mTIMvUrCVCfQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZyHS2EOVO7fHSOTwtq4yBRF8lkV8Hlg69FqucXMUI0MGmZ7b0RBD/w+9jGpb?=
 =?us-ascii?Q?nTcWxVVUNfzhFBF7XZ1Noi62E8lUKpUuQvvqg7q2Vb02MvV+vJHD0PJtXGEM?=
 =?us-ascii?Q?fdCQo9Bp8+re5BfU7+lB4YboaguQ6Ni1aSOyhLN6OD3JWWs5T/Bb1TtuPkDG?=
 =?us-ascii?Q?rKDV2tSZUfn3X08APlrJ2naCmCKWJZPzxuyDzrvgCxIRBQ9EOq1PdxbTrNyF?=
 =?us-ascii?Q?zOdxee1ye5kK0uKbCHtbNPI/K803ZmtM43SEqg8Zl1UYKTlszvI7IiQ2gAJf?=
 =?us-ascii?Q?hNqVUYffWK1iOKsQKjLDcgJ9USRnkOEP5eGoZ9w2mTbrWErGycQhmKt8crNW?=
 =?us-ascii?Q?RMorCoWz6sSbMCeO6IRwNRBmotXfWF3LKJX7XoAEnLHzcD/WyikVNaKYLQhW?=
 =?us-ascii?Q?lysBUKmmsAbXUNWePeFExYzf37Ths13kCz/VvzKOi8luXZjD8bcLjtMRnPvj?=
 =?us-ascii?Q?TSN7936VTI7Z5orKGCR7yWmkSZEd6Hmw32w9T3KIKlvQrK9XGkreOH3v1etF?=
 =?us-ascii?Q?S93wYu+0hVel04wB83PvZIxJBduKyJNjCnOia0FafU89pyAHl9dY1lmqTJVp?=
 =?us-ascii?Q?q43yIMNMTRccNbkM/jsmzAEZCeFXnejJkvfV6jGwzf48zwTiPjBLRTPcUKX6?=
 =?us-ascii?Q?VlksBt6RPb6DjiNnrzogUjMaThoUlAmIdurvYoJlmCA11FWGurzdAlTlfPVW?=
 =?us-ascii?Q?jnuOhR4C6TsxY111fRu+NyzecFk7E1mTgDwP7XJq8RvAiM2aV+G5//uLFOk2?=
 =?us-ascii?Q?f2RtfN401UIs5J6e5HWDiMn67bUQL9uQRwYpuCRD68VXZzSvpndPa0ngc/xr?=
 =?us-ascii?Q?K2V36kxpFzNDSzo5hkPZfiFXMa5mLrANr3cbZj/KJOVbRXOfVb95DOixW/sG?=
 =?us-ascii?Q?P/Hjw3G84y4LoI1abTa48yJjHTlq8rZe29XpJBDwRVWUYkRSHhIj2NHugU9R?=
 =?us-ascii?Q?CQs8JXOurT5I53AMRBtSvc6kC32ff0+/Ezr3JUsDzhgmEgWtDcZv24Zo3R0F?=
 =?us-ascii?Q?jA6IX7lhLfaKOR8XT1MZEXncUWEkF1aPh9HgcXPV4wLPPh6+CakNWt+HUWHo?=
 =?us-ascii?Q?Y0X1xP7cJvav7MYJC3f6LQdAYwnx6MsRK+wUHIdhNxYUWER0hTqPa1KeGoAI?=
 =?us-ascii?Q?c7eTQLlM6acFOHBtn0Xw66Z2geeBPnySi858ylINzehNTkZfY/zaL3MCIGFi?=
 =?us-ascii?Q?tasygRCLWOJKWYrEW1xpu4tG/vcEXUuz6pG9z0czsD58RyFn8EVzcn/pbwEU?=
 =?us-ascii?Q?fdrlpsXyjk96IaMk8XVs8oXqXkleX5evB9QvaGDYRefCWdO4a/zCpUnTJAuC?=
 =?us-ascii?Q?qshJq2FLHBCoanJ5ip/eQP5X/3hoTeFrD0ZRQPheAV6GDd4nOQyVzthetSnt?=
 =?us-ascii?Q?b6/y7RSTHkyAgwIK5rMdwL6j1fwQ0j6jx3KYtTFVPw/DljYCSN1UcQ5DYYUD?=
 =?us-ascii?Q?0lVMxFM6qTdMugzj6/waYxwxs4S3hyiBsToUmOSgfmD4b8YKAnSvJtYkAXH1?=
 =?us-ascii?Q?xpa+MZFdZnL6rv63WBPNsKeI8eSScGWng2YNaHv5lGUNeE6Y6F8atX6CCvXk?=
 =?us-ascii?Q?ARbFvBJBDJIsi5LVa1WypnuuvLzxCHujHsr8SdKrjgy6Ia7tJTdqlRsY3YA7?=
 =?us-ascii?Q?oQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5888bbe-c158-4549-d351-08dcd333d69b
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 14:04:37.6576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4sgEhx70OdxtB1z1WzutZTcZ7tA1U6E9OSRO8OpAOEf926cUQazHQJEjPcmFVT1nPsofLU7SZpXB8OBlp70SAmk7NNbDd6nOY2sg97O8Syk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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
From: Kandpal, Suraj <suraj.kandpal@intel.com>=20
Sent: Thursday, September 12, 2024 7:04 PM
To: igt-dev@lists.freedesktop.org
Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B S, Karthik <karthik=
.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj <suraj.kand=
pal@intel.com>
Subject: [PATCH i-g-t 4/4] tests/kms_content_protection: Make mst_cp_enable=
_with_retry() void

Change the return type for test_mst_cp_enable_with_retry to void since it r=
eally does not need to return anything back now that the color change and e=
nablement verification happen inside the function itself.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
LGTM:
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_content_protection.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.=
c index f17d9f2e8..59dca54df 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -662,7 +662,7 @@ static void test_cp_lic_on_mst(igt_output_t *mst_output=
s[], int valid_outputs, i
 	}
 }
=20
-static bool
+static void
 test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_o=
utputs,
 			      int retries, int content_type)  { @@ -704,8 +704,6 @@ test_mst_cp=
_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 	} while (retries && !ret);
=20
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
-
-	return ret;
 }
=20
 static void
@@ -764,7 +762,7 @@ test_content_protection_mst(int content_type)
=20
 	igt_display_commit2(display, COMMIT_ATOMIC);
=20
-	ret =3D test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, =
content_type);
+	test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2,=20
+content_type);
=20
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
--
2.43.2

