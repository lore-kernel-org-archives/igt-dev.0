Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01A8C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 10:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C610E72E;
	Wed,  2 Apr 2025 10:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaLiowhP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB2110E72E
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 10:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743589053; x=1775125053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IuAvidDuvLdU8WYc73R0qb3aNVCqNrPBEZushnTTF2k=;
 b=PaLiowhPGYQXuZRDxMTSQh8H6eNy0NK+6hrBAic1u/K6i+xJh6wrX688
 l3SAs6+ktzVX3wuM0HM0ljYYVW1IYKM9p4hNqFjBo4svND728nJqnoIAz
 IPiwGd5mC/Ok//e3EqpBVFXjUj/KxWJCWnjuKtXXHIdkVA1G9BeaLuuiw
 LBFYJEQ+jkuhf3JyK0Djj+UZtYIAL/JgvHK99P3+uJ758FKLFXI7T0LpW
 Ypz0AQ3MMknvwBoAdZjRXEFtzDg2AzeRru1JF1pQLXUBoqtlGuJPPrYr4
 nb0+pSs21e3drKyT6nMXlLobP/37ZroaReisho4HS0cWd8M/0xL19/LLS A==;
X-CSE-ConnectionGUID: wANkLzjzQtuUmjfeeh9bzg==
X-CSE-MsgGUID: aBqZBBeWQzSLQGnwYvDHCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48814554"
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="48814554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:17:06 -0700
X-CSE-ConnectionGUID: JzKd9gmFSsKn/lviZAyRdw==
X-CSE-MsgGUID: 6HbHASEISd2qZTRUOfMTyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,182,1736841600"; d="scan'208";a="126909296"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 03:17:06 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 2 Apr 2025 03:17:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 2 Apr 2025 03:17:05 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 03:17:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5tg23VHe3TcdHF/ndvw5Ufx29Hf53tABOW/MpJwRkRAbJOLTv/aey60DW3ALV9dcnXMHG3Rf8+n2jc0N0UiTnPA7nJ64DLKrxUU1kWYMv2rXjjAt1jMzo0N6FL4UBcZydLcq7nx7g9495zCbWOPc1ak4KEMQBdDSbFswypZNmyXGb1crQePsXlCyGMaBLgdYJaH/kM8EfM7CP4W2Gsp2/3IvJUg2ZGyFVW1Uu9gVLY/EKSIcvfA6snx0pJ14P+4rHnqlOfctVY9Fby6UWbrL1jJAjEORNibDa14h4QQSgYIAPiDRmG6p+sJ+D7r5OV5FI1FTJuL6HwNolI/Xx++RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lisFwS0a84me+g+79sm9rBeT9CQkEJIoaufwlOUWzus=;
 b=Q7rlEDjhKkpS1+33mXY4B2+TCQ5byt9AHkXiTtXnU6SnxlAhgitLb3iZKbXeh6MBhi65k45QH4/23n7ZwLy8eNGuwsHZwpE3HKA/7lMsXHWKIBIIY4Ig1SbQ116/Ni4OZgLAxwSD1tIX45z5YmHslOj/2nr6kYmE6XJJvwkobnVtuuD/KZf1Qrs/sVsRY5KiBnGAmdFgjXXsZZR9QLZh2GXl8lOvBblyRymGHrwdFBB6AsN2KZsGXwxDA8uLL7Vzi5bfySdGlQ4j2fn5crsa6/YkvkrhW0IqQjwyoXdYn5vm1sWvavo22b0fqy+URjePWMb7zaBtPxf6/c5pSrqv1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 MN2PR11MB4582.namprd11.prod.outlook.com (2603:10b6:208:265::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 10:17:03 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8534.045; Wed, 2 Apr 2025
 10:17:03 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Musial, Ewelina" <ewelina.musial@intel.com>, Petri Latvala
 <adrinael@adrinael.net>, "Krol, Karol" <karol.krol@intel.com>
Subject: RE: [PATCH i-g-t v1 1/1] runner/executor: Use bootime for time checks
Thread-Topic: [PATCH i-g-t v1 1/1] runner/executor: Use bootime for time checks
Thread-Index: AQHbn/9QWNO/0/CM6UeUvYF7qEg23bOQLL9A
Date: Wed, 2 Apr 2025 10:17:03 +0000
Message-ID: <DS0PR11MB7264856184F37B8BCEB9FC94D9AF2@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250328163342.119140-1-kamil.konieczny@linux.intel.com>
 <20250328163342.119140-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250328163342.119140-2-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|MN2PR11MB4582:EE_
x-ms-office365-filtering-correlation-id: a25656e7-fdbf-46d3-ab30-08dd71cf8349
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?Qaqx4kvYW7vegzyHEdePas4r2yrRppyOYp0lO6g05wc6SFgqQfhCvkuSH0?=
 =?iso-8859-2?Q?Koa20nYNbaRoxE6+/7Nl1eEUuMWcW7plg5vML5xx560Amjrz6x6jaPxvOO?=
 =?iso-8859-2?Q?O8fqnh4TGQg9tXqBxjPtTCnVDKKzxDTp05l7CQ8ZW+FdPukt1hXMUTZud5?=
 =?iso-8859-2?Q?FE/BVDxC9RAndNXTIGm6b4WCw6oCkXLptW+0I+vGD4CfR76Xc43RqYyvm+?=
 =?iso-8859-2?Q?YoFBEXNv0cY2u9R+eNFJqBVPHrv1bxmtHjerbZTL0FLQsMxwucgx5gsfjO?=
 =?iso-8859-2?Q?24jHqoCcj1g7rXdR7blAa5FHEXIOnMQOIuZ/+HLna2grbTdEzzKEv3xln6?=
 =?iso-8859-2?Q?5qHt3T5J+zrKA4vuXFHo7Q/b3qQpPk3INmhQ7RjsCHWGoYojGxRaLCMDNJ?=
 =?iso-8859-2?Q?zoUm6dXKH/49x8O1ATB+dj6S2p85vavCwY3Xn3UBw8FO4pxs1sdywOP+hL?=
 =?iso-8859-2?Q?+1oxpkSzeLNn2ZSN9BeeEBJFT7sR6RD948gHdRasS4tYeKn7IePgaw0cUo?=
 =?iso-8859-2?Q?tF36p5IHbE1lvS7OM1xgsbylVvvwwgrGWEJqdObjU1ocp4ivrYVl/IjZl6?=
 =?iso-8859-2?Q?gbRtgpX+Ofb0c+IHqMC4mftp9aJv4Gqw6vDv6kWHt50OkvnI/2fDtWmD1j?=
 =?iso-8859-2?Q?20NjdWH1nLPQLqLzEHgeY8C257JoEVow9zBNNRYSW+dlBKd+fcP0nDgi3L?=
 =?iso-8859-2?Q?X+vV86NCSxu9Tz0CjyWLZrQz/l4iJnOgfJpmeVwZCRXKhO3LqcWCrBBGd0?=
 =?iso-8859-2?Q?c+i1JbY98Cgv0C+Bj64GYZllCvjZeF0+Wi2JPKPKWhBdfzKNIExF0dYrY5?=
 =?iso-8859-2?Q?8RmoazQK65S+VTR4xYMbpBDr6p0kf+PftECAnOxJRjd0Rg3lSyPTnggyK+?=
 =?iso-8859-2?Q?y2kJa2O1lptc0J8TuJeFnoRjPef3ED+Caplqw18OaZb7FvT/D7j1WaO2yN?=
 =?iso-8859-2?Q?xqrAK5DhXaVv8nEfSOjl0EymstPGcU4aPiKlsNRWjjz0P1q9reyk32zuDm?=
 =?iso-8859-2?Q?HzfmZg6xJJ0GyF/fGjbxnrGEUECCragQhf0O47bax4m13CoN7+QjbI3VIX?=
 =?iso-8859-2?Q?38LzkUunp3Ur718643J3kcfjuMVU5v4d+bid/uORw2VQ/+tvFo+Zh0xb2l?=
 =?iso-8859-2?Q?8VBNVEz5dF7fRxMSgouqWYnx2BPXIQTLA9idlDx3MBi5A+PRo/BQwQJgmh?=
 =?iso-8859-2?Q?f7UbqFOZegmGPcHspV0kfjRLBVDqBm4GrL9/PTvOl/2XPYoCy+BC93ElIT?=
 =?iso-8859-2?Q?ezwJQkCK23APF4fqn7Erpl1lhbXfeHwukUG0DkbkR/Mpo2O1NMeyySoX5w?=
 =?iso-8859-2?Q?IaP8VpULZtxAGVuIaAtG96F+vaXoS/pDX8CPVcSM2T2ZtyIGeMKZqxx1Rs?=
 =?iso-8859-2?Q?HEzo8hGW+ea2J+Y1f9LS7XFXSez0gNdw1QBBITtz2M5e2UF3tIoMoLstA3?=
 =?iso-8859-2?Q?vD65Jq+3tznwywKiEH36xlZiP0QbGJFTbfSJW007EHmo3mgyzKxw1RJiC2?=
 =?iso-8859-2?Q?hTsQ2fvVfh6tf1aSnw+GOK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?wdSP3RRL4b1ssRYx6QnqyoHKkRUlP6TlrEIxP1dVSkq0iYGJdLvv/PCW0R?=
 =?iso-8859-2?Q?mYme1mGSj0d1D9/Z76h5vEK4sZflqryBtXdhJKJNKWO2cuZNMgfPm1lLf5?=
 =?iso-8859-2?Q?CcctwhR77vWFoQFIX0ux3vOC1iy0WwKi+K57pqTrzWcQmH91cmwxbG8mc7?=
 =?iso-8859-2?Q?IiUdTz4Met6GJQxWdhKVSgdUKZHdPkaYg6vTaeddkD5TW202yzrRVNKVEC?=
 =?iso-8859-2?Q?wbn+qMNT7v/n4KBUlHi7Hkfe7/HS206GO7hweHi2anvXkDY5TlDGrwLqC4?=
 =?iso-8859-2?Q?MhklEV5gu0D5OEp9AZW6CU/mBmuWGVwqLeNUdXLVYmYWfrsvVLdbPgUKOf?=
 =?iso-8859-2?Q?AtSzGLH77ei6RAUBNLG3dYGTa4rdyIUfPPJswdVRUOGbU20nuz3Z9UCDqW?=
 =?iso-8859-2?Q?nvEfYZTv/Lvhsoy385I54VyZzr8FS2BUlCq9hN7spYwJPZDWHAbL+Ffl4k?=
 =?iso-8859-2?Q?37fJ/7aUnYKboozZ5SECtd0s8cBkgvTV3bLlt5v+oSUKVm0r2UN0pM6u66?=
 =?iso-8859-2?Q?h67tZiYaVKyiYYLJvWVQmXW5eH32XlJDSs3dOXOmGEc2yMZdDWh/uIrwIf?=
 =?iso-8859-2?Q?3vynbv8qL7VpNTi9x65HpoqoEi8tT/yACIqVrFTqo2m5bhIfESJZHzaWLJ?=
 =?iso-8859-2?Q?g4lOm5kE+v+3DUBIlfIE8pAVWx5euUp4jB+rnLenihSL4jMtkM5/iR8DgO?=
 =?iso-8859-2?Q?BeIxAt919Agr81waIlyy3QC5578mGabZ5vyI4pT1AiyVeP/xB9VfWNViYt?=
 =?iso-8859-2?Q?/eYDv0i9gHi3nwGtTAIP2SHfrfjZ3olJMJTQbR6mzrfYupEzRPMyOFEYQX?=
 =?iso-8859-2?Q?Mo609VOVTE+Zzp8WArno2qATHa02HJ7wy/MzvzEkWcODPASQBS2U28OYHT?=
 =?iso-8859-2?Q?Lc3YXGExbvbzvKiRW3ZqfjUbUgqjOopDIh1haLiwrn8F0BG2iWWISvlOsp?=
 =?iso-8859-2?Q?gYZGXa0Lddeso9yfwlG/x+MyKU9MsB86EEz8A+WCybgTbcaDId1A8S7Qbx?=
 =?iso-8859-2?Q?PsuZ0h6ajsMjkgWzZzXzMmYC2Bwk0n1FCD58ftzAtjqmkg1vXOFiu0o5FT?=
 =?iso-8859-2?Q?eYYLPu+olfomZx5vECAYrGIirKo264uI9QHIkHYGfv1Kb2tBtsD+B8Fa30?=
 =?iso-8859-2?Q?Oms6aa0igSGgUAIrJAD+9pJZ1mgBioJO619W3S2GBPEbSVh/f2oCZeK7OF?=
 =?iso-8859-2?Q?npVIi63U9/QIvot7gozxj4wJaRtHN3OnlJpQAYty21nM/6c4XoMm5EXj0i?=
 =?iso-8859-2?Q?+cSqw1ahhURnnJCQCHkb1lpVblx85rWrpXFZgsxFwVrjVbfBcqwnEC+9jv?=
 =?iso-8859-2?Q?QLHnLM3SEJVt/nLFijMAHqMi6EOS6kD3MM+/NGUEtDdZ0Y9KtV0uP903LQ?=
 =?iso-8859-2?Q?Lp1gR/wylOuk8rvCHCrad367XPAM6JLw+zqPkx1JsGtbECayED5idHMaSI?=
 =?iso-8859-2?Q?N4b1aSIvQWpdlUwnkhwd1l/rJE8AE28vHFQWoHnCfGxomK0lubCsep1MUF?=
 =?iso-8859-2?Q?f6Vy4bC/y5pQWcwkrVWJt/+fGLsKA+Q9e1ZT+3j+BC2HvL+VmtPl/W9ocH?=
 =?iso-8859-2?Q?UxcCpeAin6l4VR00ZxM9WOmPCUo55Ed5/aFhtJcqEsXxf2RHjMQ0tNnv2r?=
 =?iso-8859-2?Q?b0G32G0/Oj3y1ubuBRMnnDSCDR/merceTcHHZAgsVzWKkjCv0CYR2Kdg?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a25656e7-fdbf-46d3-ab30-08dd71cf8349
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 10:17:03.0980 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2J/0lDAzSfNK+AALCB616XpMKCR30aEW2Pe83e+LJxfjWgnwUAx3+NDj36tKiruMDLAZQ/ONSkZ7CQBDX1q01eDz83QjbsO75t424Rjc+AkCDIrKEcbU8poMm7X/rysB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4582
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

Looks sane to me.
Reviewed-by: Dominik Karol Pi=B1tkowski <dominik.karol.piatkowski@intel.com=
>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kamil
> Konieczny
> Sent: Friday, March 28, 2025 5:34 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Musial, Ewelina
> <ewelina.musial@intel.com>; Petri Latvala <adrinael@adrinael.net>; Krol, =
Karol
> <karol.krol@intel.com>
> Subject: [PATCH i-g-t v1 1/1] runner/executor: Use bootime for time check=
s
>=20
> Runner is printing time to stdout/stderr with CLOCK_BOOTTIME but
> when measuring time for a test it is using an igt library which
> uses CLOCK_MONOTONIC. This leads to an errors when calculating
> time left for tests using suspend or hibernate. For example log:
>=20
> [77.376851] [020/123] (932s left) kms_flip (2x-flip-vs-suspend)
> [77.592412] Starting subtest: 2x-flip-vs-suspend
> [77.604996] Starting dynamic subtest: AB-DP2-HDMI-A3
> [115.135795] Dynamic subtest AB-DP2-HDMI-A3: SUCCESS (6.776s)
>=20
> shows test runs for around 6 seconds, while wall time shows
> it took around 38 seconds.
>=20
>   Create a separate, runner specific function for time measure
> and use it where current time is needed.
>=20
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Reported-by: Karol Krol <karol.krol@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  runner/executor.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/runner/executor.c b/runner/executor.c
> index 9c8bf90f0..30e2420af 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -47,6 +47,12 @@ static struct {
>  	size_t num_dogs;
>  } watchdogs;
>=20
> +static void runner_gettime(struct timespec *tv)
> +{
> +	if (clock_gettime(CLOCK_BOOTTIME, tv))
> +		clock_gettime(CLOCK_REALTIME, tv);
> +}
> +
>  __attribute__((format(printf, 2, 3)))
>  static void __logf__(FILE *stream, const char *fmt, ...)
>  {
> @@ -54,8 +60,7 @@ static void __logf__(FILE *stream, const char *fmt, ...=
)
>  	struct timespec tv;
>  	va_list ap;
>=20
> -	if (clock_gettime(CLOCK_BOOTTIME, &tv))
> -		clock_gettime(CLOCK_REALTIME, &tv);
> +	runner_gettime(&tv);
>  	fprintf(stream, "[%ld.%06ld] ", tv.tv_sec, tv.tv_nsec / 1000);
>=20
>  	va_start(ap, fmt);
> @@ -961,7 +966,7 @@ static int monitor_output(pid_t child,
>  	bool socket_comms_used =3D false; /* whether the test actually uses
> comms */
>  	bool results_received =3D false; /* whether we already have test result=
s
> that might need overriding if we detect an abort condition */
>=20
> -	igt_gettime(&time_beg);
> +	runner_gettime(&time_beg);
>  	time_last_activity =3D time_last_subtest =3D time_killed =3D time_beg;
>=20
>  	if (errfd > nfds)
> @@ -1024,7 +1029,7 @@ static int monitor_output(pid_t child,
>  			return -1;
>  		}
>=20
> -		igt_gettime(&time_now);
> +		runner_gettime(&time_now);
>=20
>  		/* TODO: Refactor these handlers to their own functions */
>  		if (outfd >=3D 0 && FD_ISSET(outfd, &set)) {
> --
> 2.49.0

