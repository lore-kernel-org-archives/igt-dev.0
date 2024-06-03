Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A64BC25B76
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 08:48:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C3A810E325;
	Mon,  3 Jun 2024 08:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mrbSibH7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD5DC10E325
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 08:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717404494; x=1748940494;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=+rzkuqqd1ZGb8tHh9CbtvVLWakLmvi8eOt76vWKU138=;
 b=mrbSibH7X/4CoI0qT10OZAcsI0WYDWYX1CU0NITIfvw2u/X13AeMh9BL
 0o4SivUhCCo+2ACByRb4nVZbv6Mb6jxCSI+/F+GoRsAw6ZObDkLM/n9Gy
 bQ11vvTgXkDMjZlJHKAq+JoulDRThk4ekd/MerTZQRhq/LUeT1pGbjLkt
 R+KuUsY7XrusPgIWiyKsiFh4e/vgBNHukK08eAVHdIYRuoUKNoNPKT353
 ZOyI1pUGEZWeCzDIBFEnpAR5U6E4fofrMpwc8/9mZ86paZy+rDHbEPrdu
 NA6tBncAsv2cOutQ+isEG2E7TaFAfUBNt73LZkat0sQi9tfm5x2jYs6kP g==;
X-CSE-ConnectionGUID: d8GNZooBT2KWS/9/Y3s0fA==
X-CSE-MsgGUID: Xkcok0S9Tgi9HJUvxUnTCg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14112232"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="14112232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:48:14 -0700
X-CSE-ConnectionGUID: r6X04KF1Qd+P3BmOcGpoHg==
X-CSE-MsgGUID: KKtpiSexQu6U7c50+NF3dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="36710415"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 01:48:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 01:48:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 01:48:13 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 01:48:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QDCI9+PrqHjKVXKs2GrbDIAMfkizVxqlICqaWftmZ997QoC4S0Zwh73tO+mJExk4J6joNdQTy5/lg+R1gJv3COTx8UjBfmYrcI0oFZ+C8p3DlJAtGxeHganDHuG25xX2D+Km9R8Ku7isdtWh2EzbYO029AquF4FKK3N6CtFJu6w7bTHIbsQE/c/PZTMVPE+9Z0HOun7svTGczxCvBMzw2nOihiti0JdVdxj7gKFIpSEZU7tcSuDdfsiJWVsccwp9MI4JZr0Ooayt67yDY0hkj3lr5kEwuXW1ZDYywWalcjhfMg8xIirzv19ANLIPvd1a2tQHDuehBlQHxm7uNDaMrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JVqycD7p6rP/uLWUu/FLvZHnotnVJb1DAwtBA7ixrrk=;
 b=mYWQpYIix/srSzBXqUhg17I068ZEcG70mWfXzVdqUBh2X3Ddy/OYFCt17HPOyVtNM9puf3EPyah7Bkwv+WZVOF9OMbncx07frm8/Kuw/7JdBZvrPAM0/zp3A2IIA5z7cmmszhECiqhBV3WWbCLYSf/rYmxaumJWTM9p0WAkyDYt7KHooVCols52W+SaNnrHUQcL7Vbv2K0PMCWBXAfxctbhCoT/K5MaQ81Shd3mbhSpmzJCZvCxy5Ur2mmawR475kx3ZhlWiF/+1Yuo83STrdBmDp9VhOwygVMXCWNskRuMOpZlNme80fOA9UQbEPBG4wKjwG/Mt/Qy4iVaCjqJKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by IA1PR11MB6172.namprd11.prod.outlook.com (2603:10b6:208:3e8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Mon, 3 Jun
 2024 08:48:10 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4db5:b0d9:b6b3:bb52%4]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 08:48:10 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t 2/2] tests/kms_vrr: New subtest for CMRR
Thread-Topic: [i-g-t 2/2] tests/kms_vrr: New subtest for CMRR
Thread-Index: AQHaG4yDUtGprpGWs0STjS/JysM5GrG27ITA
Date: Mon, 3 Jun 2024 08:48:10 +0000
Message-ID: <IA1PR11MB6348073857C488911BA75774B2FF2@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20231120082459.1859375-1-bhanuprakash.modem@intel.com>
 <20231120082459.1859375-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20231120082459.1859375-3-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: bhanuprakash.modem@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|IA1PR11MB6172:EE_
x-ms-office365-filtering-correlation-id: eba39eee-78e8-49a3-95b3-08dc83a9e5b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?fcZHxOFV1RFbo2rMNgVpymOqdV/mBnrjl3rMS0sgjLDPAZQFRw3GMfmn+hmQ?=
 =?us-ascii?Q?goL1yC078L8fpNehtL/0thVF3v278Cc4jIl2xK4ob5fDFiIstdkntsTs8U7a?=
 =?us-ascii?Q?Ztwxd9Zhlzrjf9/NAT62OdYmEANf0AgWgWlsfCl3HXjhy0KSDo665m48imEN?=
 =?us-ascii?Q?3LGKURX7B57bHpxeOj/d/g5gmbt6P+tLS78T+UhGhFl7DNpNfshJK/XEZGeC?=
 =?us-ascii?Q?+YLhNTNCcL1OgUigrQSYtpc4n47uq4DTHRU/pgVwZ8HMqcuZI0Zu8OFVh8j3?=
 =?us-ascii?Q?8/vbIdv3rzFY0k0IdgzbWdYkagw4WFG3BhkUmDq9snmnCogFX0fdd0UhHq6b?=
 =?us-ascii?Q?21vmYA9ORvw5n4x5ZBAx01PKPzurQjD2C+poIv24OFed4FixKmwUZn3KLbDP?=
 =?us-ascii?Q?jID1Tv2zZbKUwap1nnzT1y3zPgcq9yPyv3+H+G8drOcBmj5dmurYu0eUK9uk?=
 =?us-ascii?Q?Rsi6CMNfRbb4SU89MsHWj5k/SAgcNfS5ihFt6YyNpVSZozzQx1aZnGTRQ7kI?=
 =?us-ascii?Q?L2FuumSiSxi8U7lq1BqUtdEGgD+CTtCngQqn4l065TV4l0RfclqzhgPOTd62?=
 =?us-ascii?Q?HSmyCC7oK21gQHJSP85ZEzCKh8UkIaXkOBGmkuGII8haV58SASjXUI3uwgkJ?=
 =?us-ascii?Q?S2VM3EgQ2rzN0PU62C/1GbZxYJD0Fe31W0Q+YeILWFPudXdrmx90RVZZhbE4?=
 =?us-ascii?Q?0M8veosE04c7xvX6xnxO3mrtyWdx/Kh5LLzMMbw5/d7WOVlp+lbzDbQjaNKb?=
 =?us-ascii?Q?eF/+fVXCFk/BwuUKO7fTZ3yc+stxI6C/1f3TAqPjaPgAe/82AuZX8rd2LhS6?=
 =?us-ascii?Q?QB6Ds2r9bEMMf+aON1ysQO3F8b2KCk2AH828VbV2dLitWiBODOdpdJf/YYdZ?=
 =?us-ascii?Q?0+jdV88Dtdix6GW12ir2NcLAoEqvjWBt4FJdoqgyciUhvGW2lAUWa1Ansh/e?=
 =?us-ascii?Q?imy5izniAbqyx6JoujLJgTyaEDISAttNEwaSASw64M/whcsIadE+RICbfl0u?=
 =?us-ascii?Q?Mt7F9jmwicw9kwCC2qeh53Q/S8tXct8HrIJP0h3jXcAxFui3uODHzJrSUubA?=
 =?us-ascii?Q?9vyAGvUOnq1hbwA7ZjWGPYhO4xxCesyJhaWskIoNPATBKUyv32ndJVrSl8kF?=
 =?us-ascii?Q?rDbrXnUyw4guJQVyB4QGhfDKavgLHj2WQS3Nh/gxoOssuaigzdZSuyp4TDg1?=
 =?us-ascii?Q?AcyRiQpwaLI30uIxT5+UXsgHBlx8MZtvZQNdSPFSsCKiVFOvyufuTTwHVnwC?=
 =?us-ascii?Q?e70d1YX3P5Wz+zBf0+13VOxY6cKBkmbJE6/v4Gk0DVOxo22R5BhIcNKa6eup?=
 =?us-ascii?Q?tXpfoReJauDXTG8o9c8pmxZyRHXhFpiybfqdTx+lXGAvlg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jtRCTqXHur5UTH54soSO734xYQCupskM6eEeqH6g21bZl7RYDaRNNhnJNPNf?=
 =?us-ascii?Q?BdynAugjXcY9L4JjNrxkC1rMFlIz+2LSREVz+uxavOMVnH78zn3fQ/VbKZeQ?=
 =?us-ascii?Q?zzaCfWi6Z5wdrGfojxaDniqyFfNeAT/uCC+5Lwh/YTirz44lhHTdwvl8EI5h?=
 =?us-ascii?Q?xOyt8If6TA1eWRNM1kgN5AO6HsKTJKFPWiBuGRPbZoL0JTOjHQ9gj/wLyx+y?=
 =?us-ascii?Q?0kqjTgwk4+V+jSrSKOj9w6E10myiwod4yvDuAk4wDixDW6Fx9BJ8+BlWlo/f?=
 =?us-ascii?Q?1TEsvwA/sK2nKqyPHHbvGV4rQh5ogaTOB2hF0rXmrqE0NB/iW53S8eYWCw+b?=
 =?us-ascii?Q?W+DBvzbrFdfc7/VhdyOzrWWr6zPmrvegnTjb+FS/Q+ijEjS9eUhTpUfa0S8u?=
 =?us-ascii?Q?7Ozn9AmLGNIWyaoW3q6jaEICeCF0t8EU/J9xGAVToQSaIbzI44MuSeJzHQO8?=
 =?us-ascii?Q?6G7xnqSeijZQyEykqlxjSgAwRGBmbA3/f6ztudbEcOhrsK6f1E4sTNU8IN8P?=
 =?us-ascii?Q?yQ0kEp0omJej0eoUlst3+bl+bCO4w5QHRRzk5Zb5nhK9+OSMmpciJuSXrgzN?=
 =?us-ascii?Q?7jfq3QoozlMEFY97WA6PPZxnpTteOZGp9q4aStTTcGsjQUfTlrHrKgjd8cML?=
 =?us-ascii?Q?ZLXqT2DGW/TgdfDOKgzp9+C+R+3Hsurdl9WYkeWccxUY6W8KTs0WddJR/6t1?=
 =?us-ascii?Q?jUEvDCwFTPzrvRuCOVYDV8hiMQF45Z3YwQZfY+Gd/yDzVIeCYjKIyXTMMtFq?=
 =?us-ascii?Q?g7q2R/UL/frZaAce7HcHB8Ngjz8oLEyG+cx/wKAygACAOsF9fPG9TJTLebJr?=
 =?us-ascii?Q?lr1LQMCajeGIuQujfqO1KyMMGGAU/d62/VQA7n1AZBeYk1+vQB6HYdL+YeHa?=
 =?us-ascii?Q?oUeg48Iv9iYjniLVHCNGCu3dWxzvDPsrQG4vU0edT2k1NWKiRwGYsmArmbat?=
 =?us-ascii?Q?zqaI8iKsTaDsFMwoUcOttHYPN75fJBim59wC+duVHC+7epiSrNZ5UVZE25YW?=
 =?us-ascii?Q?2Ahuzp+kfegyGx5CLAAihLH0MtLmdtHZ+EP1S/1OwZdm2J/o2J5R8QnLG0VJ?=
 =?us-ascii?Q?DrIhDmK8kzPosInUgH1m9zFohy59V/6N2QRe2owd1/z8XcNMFtMRe+Tn1rhC?=
 =?us-ascii?Q?BvzJPSVXoLVumB6YYTj27V1G6+MVRXjDStpoEZuH/8mcynVRZFbcsVreKdSw?=
 =?us-ascii?Q?YRo9RUNwttr2uf8vwuRawHqqQC6r8jV3v9C0DZ0m1yF1LN2s//J0Cg8rhU00?=
 =?us-ascii?Q?a/10wKe7Gjcvcbw8MXKPj0vCp0tfDYPuN38XwDbG0lV8LesIzGIMYUlVxXIz?=
 =?us-ascii?Q?tONcDRUIXrZK2LhLVXaLm0/Nhksr7tNsa+6YTkwzLyCNMU5ufRpUYQmvZWzE?=
 =?us-ascii?Q?tP2vb/82mQ4uhy8V/egjemiIAyXuNBQwLuStSXjLbWpNpAm1kW7C5r4eLwIe?=
 =?us-ascii?Q?gwL+xo093Q/K5gTW3Nrcq5JDQYtk2nLp9+Bo7ydubcQIzWfpVUvfGu2YF2gU?=
 =?us-ascii?Q?ZbOHhneWFXJxWxwJbY1eJKLpWBa603dDQvdSlX+bDyIqazOXU6LvlmJv01m/?=
 =?us-ascii?Q?UfbZE7UbcrjD7b4c6oIT13AVbPuw7MbN9z7DwaXqea0+uxXo86aURQCWFLhW?=
 =?us-ascii?Q?AN9HdrAfhsCOf399o0ZIW08=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba39eee-78e8-49a3-95b3-08dc83a9e5b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 08:48:10.6131 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: culdRORwf/U1bygyCuw2pocbv/8czQa0/7JuhH9hKn+oKmQzoXOwNNYuewKyyxiPYyT6Z/GiWr2Ir2kuW/q7g/3DH4Vczv1+2mGXHgbFfGGBIoKKRYDv/Gs0YZHlHYMl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6172
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

Hi @Modem, Bhanuprakash

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Monday, November 20, 2023 1:55 PM
> To: igt-dev@lists.freedesktop.org; Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 2/2] tests/kms_vrr: New subtest for CMRR
>=20
> CMRR is an variation of VRR where it varies Vtotal slightly (between
> additional 0 and 1 Vtotal scanlines) to match content rate exactly withou=
t
> frame drops using the adaptive sync framework.
>=20
> This patch creates a new subtest to validate the CMRR as below:
> - Request flips with the refresh_rate * 1.001
> - Flips should happen at the frequency of refresh_rate.
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 97
> +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index 741a13be6..351645da5
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -29,6 +29,14 @@
>   * Category: Display
>   * Description: Test to validate diffent features of VRR
>   *
> + * SUBTEST: cmrr
> + * Description: Test to validate the content rate to exactly match with =
the
> + *              requested rate without any frame drops.
> + * Driver requirement: i915, xe
> + * Functionality: adaptive_sync
> + * Mega feature: VRR
> + * Test category: functionality test
> + *
>   * SUBTEST: flip-basic
>   * Description: Tests that VRR is enabled and that the difference betwee=
n flip
>   *              timestamps converges to the requested rate
> @@ -83,6 +91,8 @@
>  	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
>  	(m)->type, (m)->flags
>=20
> +#define CMRR_FACTOR 1.001

Need to think of an appropriate name but could be something called MULTIPIE=
R ?

> +
>  enum {
>  	TEST_BASIC =3D 1 << 0,
>  	TEST_DPMS =3D 1 << 1,
> @@ -332,6 +342,57 @@ do_flip(data_t *data, igt_fb_t *fb)
>  	igt_reset_timeout();
>  }
>=20
> +static uint32_t
> +flip_and_measure_cmrr(data_t *data, igt_output_t *output, enum pipe
> pipe,
> +		      unsigned int refresh_rate, uint64_t duration_ns) {
> +	uint64_t start_ns, last_event_ns, event_ns;
> +	uint32_t total_flip =3D 0, total_pass =3D 0;
> +	bool front =3D false;
> +	drmModeModeInfoPtr mode =3D igt_output_get_mode(output);
> +	uint64_t req_rate_ns =3D rate_from_refresh(refresh_rate *
> CMRR_FACTOR);
> +	uint64_t exp_rate_ns =3D rate_from_refresh(refresh_rate);
> +	uint64_t threshold_ns =3D exp_rate_ns / mode->vdisplay; /* Upto 1
> scan
> +line. */
> +
> +	igt_info("CMRR on: requested rate: %"PRIu64" ns (%f Hz) "
> +		 "expected rate: %"PRIu64" ns - %"PRIu64" ns (%f-%f Hz)\n",
> +		 req_rate_ns, refresh_rate * CMRR_FACTOR,
> +		 (exp_rate_ns - threshold_ns), (exp_rate_ns + threshold_ns),
> +		 (float)NSECS_PER_SEC / (exp_rate_ns + threshold_ns),
> +		 (float)NSECS_PER_SEC / (exp_rate_ns - threshold_ns));
> +
> +	do_flip(data, &data->fb0);
> +	start_ns =3D last_event_ns =3D get_kernel_event_ns(data,
> DRM_EVENT_FLIP_COMPLETE);
> +	do {
> +		int64_t target_ns, wait_ns, diff_ns =3D exp_rate_ns;
> +
> +		front =3D !front;
> +		do_flip(data, front ? &data->fb1 : &data->fb0);
> +
> +		event_ns =3D get_kernel_event_ns(data,
> DRM_EVENT_VBLANK);
> +		igt_debug("event_ns - last_event_ns: %"PRIu64" ns (%f
> Hz)\n",
> +			  event_ns - last_event_ns, (float)NSECS_PER_SEC /
> (event_ns -
> +last_event_ns));
> +
> +		diff_ns -=3D event_ns - last_event_ns;
> +		if (llabs(diff_ns) <=3D threshold_ns)
> +			total_pass +=3D 1;
> +		total_flip +=3D 1;
> +
> +		diff_ns =3D event_ns - start_ns;
> +		wait_ns =3D ((diff_ns + req_rate_ns - 1) / req_rate_ns) *
> req_rate_ns;

Need to find out/calculate what refresh rate actually coming from modeline,=
 based on whatever fraction we got in refresh rate,
igt should check if we are able to achieve those timings or not. Lets's say=
 as an example found requested refresh rate is 60.09 then igt should check =
if
event is received at 16.641ms instead 16.666ms.

Regards,
Mitul
> +		wait_ns -=3D diff_ns;
> +		target_ns =3D event_ns + wait_ns;
> +		while (get_time_ns() < target_ns - 10);
> +
> +		last_event_ns =3D get_time_ns();
> +	} while (event_ns - start_ns <=3D duration_ns);
> +
> +	igt_info("Completed %u flips, %u vblanks were in threshold for (%u
> Hz) %"PRIu64"ns.\n",
> +		 total_flip, total_pass, refresh_rate, req_rate_ns);
> +
> +	return total_flip ? ((total_pass * 100) / total_flip) : 0; }
> +
>  /*
>   * Flips at the given rate and measures against the expected value.
>   * Returns the pass rate as a percentage from 0 - 100.
> @@ -414,6 +475,34 @@ flip_and_measure(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  	return total_flip ? ((total_pass * 100) / total_flip) : 0;  }
>=20
> +static void
> +test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t
> +flags) {
> +	uint32_t result;
> +	range_t range;
> +
> +	prepare_test(data, output, pipe);
> +	range =3D data->range;
> +
> +	igt_info("CMRR test execution on %s, PIPE_%s with VRR range: (%u-
> %u) Hz\n",
> +		 output->name, kmstest_pipe_name(pipe), range.min,
> range.max);
> +
> +	result =3D flip_and_measure_cmrr(data, output, pipe, range.max,
> +TEST_DURATION_NS);
> +
> +	/* Clean-up */
> +	igt_plane_set_fb(data->primary, NULL);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_override_mode(output, NULL);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_remove_fb(data->drm_fd, &data->fb1);
> +	igt_remove_fb(data->drm_fd, &data->fb0);
> +
> +	igt_assert_f(result > 75,
> +		     "Refresh rate (%u Hz) %"PRIu64"ns: Target CMRR on
> threshold not reached, result was %u%%\n",
> +		     range.max, rate_from_refresh(range.max), result); }
> +
>  /* Basic VRR flip functionality test - enable, measure, disable, measure=
 */
> static void  test_basic(data_t *data, enum pipe pipe, igt_output_t *outpu=
t,
> uint32_t flags) @@ -587,6 +676,14 @@ igt_main
>  	igt_subtest_with_dynamic("negative-basic")
>  		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
>=20
> +	igt_describe("Test to validate the the content rate exactly match with
> the "
> +		     "requested rate without any frame drops.");
> +	igt_subtest_with_dynamic("cmrr") {
> +		igt_require(is_intel_device(data.drm_fd) &&
> +
> intel_display_ver(intel_get_drm_devid(data.drm_fd)) >=3D 20);
> +		run_vrr_test(&data, test_cmrr, TEST_BASIC);
> +	}
> +
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		drm_close_driver(data.drm_fd);
> --
> 2.40.0

