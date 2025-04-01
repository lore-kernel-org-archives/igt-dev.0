Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A377C3601A
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 10:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ECD10E551;
	Tue,  1 Apr 2025 10:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nbKmJ2VR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0A810E551
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 10:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743502052; x=1775038052;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LF1JqU5Jb1QFe3cRltfHXIOs4NpKyh0vMTRup9lfu9E=;
 b=nbKmJ2VR0ggTRjmm2I7Q7Hiyre3lau7hJ2M7ZOqYfJXQD8CEfPQ0MABj
 jCKGbi4o4oQMH928lKVjE9bNumL7B1R6wyjCnNwpwqSeADE9Z4hg/akmH
 /P+e5uZ5WHxwf1FSe1zBx9xoih/CP0581Er3CHseSnvWwMSfOr5ycFeO1
 GwOIZcb3dsu/9VwNvATl8CVsFzH/z0xOEnGKhqIqusiZlstCPNaOOmmhP
 CC+1Jj9y6pUVMfeDnX1/glI1h2bjszQHAAP+7f/ljOAXAIbqrCwGCRX4Y
 Pydx7QxiGpSSoK9LSHCgICAzKW5Dp5lQGZJKBHXKgHkFVqWQPy4DjhoQ3 A==;
X-CSE-ConnectionGUID: sCajQ4WzSFusv39BpitgZQ==
X-CSE-MsgGUID: EM7B6y66R++G+pVHbp+Eeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44066098"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44066098"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:07:25 -0700
X-CSE-ConnectionGUID: nzBkbkqTQE+/m6nSlouAyA==
X-CSE-MsgGUID: wOkJOpEkTy6fsp8es7kYaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="126173250"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 03:07:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 1 Apr 2025 03:07:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 1 Apr 2025 03:07:24 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 1 Apr 2025 03:07:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1JboaBaFailpWnchFWQz/e9+DdaVB6ugZbMMMhIrX+wLz0UrvXikhXRgIA6jZrEUn2hWzyA4kZGkRONsw2bYiP3agxWdOj4GfSkqv0iF0TKNrOi+RGgo+5LSzfPvR95fXkbERjktq2BoSB9J6/i+b2BK4/beeBHi+W4RepsippKy4CxYlhhWD2Ld/e7EiVHq40Kp9jnJhQJaICwvyGAMjyxWMn2aQ4h/e36w6HTZiyy5I/Gndf5RPdknuubCCurCLLd9WEEbFityGCH0ouHvx3GfG76Cwv8Ee44mgrrUSreHWcOjzvvDljf0kVeBm1HX/hGt0Xna9Kvgl56BAWG+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dc7mNT+7Pnf5zIB46LCWzHdQj1/s5WB/h95+MeifoRg=;
 b=X1mu5wGvlpMyn/3Jeip2eVSRDr+F+cRj8hUgnrN3OoESOxYhpHtdLS6bAv1nDgkkyCXVodPCZfJ/V0h3htLN23naUJ2kQ2+SeDhcfLkui7vQz5CIY8Yh/HADNyN+ih5bwSugAJVXHUtNbveyAx2qIEGXuShPDGCuZxf8GWLE9U3riovBIQRu7D98Alha9ym7cLhcKsqZK5AmJpoGfMra2SngaDxUgL6JKgNyU0r6FmKFArfQzS35/W4APoYC0FYwSnj8Hv5hxAM1bQMlFManFs2T2DOvAGvsTyViAKD7mVbIcScIfYtUdlHchJpSoDjhYTc4knnBtsLO3s29Mxstmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MW4PR11MB5934.namprd11.prod.outlook.com (2603:10b6:303:189::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 10:07:08 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 10:07:08 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Shankar, 
 Uma" <uma.shankar@intel.com>
Subject: RE: [PATCH i-g-t,v2 3/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
Thread-Topic: [PATCH i-g-t,v2 3/3] tests/chamelium/kms_chamelium_color: Fix
 ctm-limited-range subtest
Thread-Index: AQHboAwI1a/VjX02xEiryGUEflVyqrOOmrYA
Date: Tue, 1 Apr 2025 10:07:07 +0000
Message-ID: <SJ1PR11MB6129FB51A11CFEF345A15B67B9AC2@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250328181055.642777-1-swati2.sharma@intel.com>
 <20250328181055.642777-4-swati2.sharma@intel.com>
In-Reply-To: <20250328181055.642777-4-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|MW4PR11MB5934:EE_
x-ms-office365-filtering-correlation-id: 078e8fc4-56da-4843-3bb3-08dd7104f62a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?4WSMHg4q1NE27sX/eIaOa/orQZaU1vKiVfsFKMxK3RZTRI4Ian+nqWrbTU0/?=
 =?us-ascii?Q?KASIZl8rw/9zMVE26dTB2wK7tFerraU5rNEsznafFLUn4dIwvMfD395gpHkN?=
 =?us-ascii?Q?RhFMTeVEbl98BcX0YWI0+w1KHzzAYPjpeVTO0VW//TyrPWLTfkzG6asgkfTT?=
 =?us-ascii?Q?i/LcgskQrCtSNFrM8W8QhON1qvPcSWLtdLHYuZt9Zbv/QKxQR0ddMamMHykP?=
 =?us-ascii?Q?pnXfq0DKno89xryyTdg83bk2X1qlC5VnaXcc5ePaQtQj+TQ2ExbE9X6FCT8D?=
 =?us-ascii?Q?+jkI6je7u4EQk0hcM+EGCJQR0tb6LeRSB9qolz42R/Mogo9NGmbRbqKKohVy?=
 =?us-ascii?Q?HNYEbAWWtUmf2RMAljpEzFSprnnESV/Sgp3Ya6ftiAUuvlYCyXK15so3p+GV?=
 =?us-ascii?Q?RWooyYQh4gUdNeu7UJ7Uxion1B/aGYzZn6GCX5DQ8j+fsxONPZj4riT27mSl?=
 =?us-ascii?Q?71bvJaTp9u0B14rdjgRDtFJU3HX5uJcSojFIidXyeixB59Cgwp3F+ityWUjn?=
 =?us-ascii?Q?5FBVshnDJ67Fprcjc+CwkYJNF3mBt6FEwcr9Fjlbqr4ClH/65oHwFI2THpNk?=
 =?us-ascii?Q?Ki0Uz6H8cUDNsojskBMAZtEwCJUUEOjgZhWWJiEsUbJsOC/tNmP1qc68bXZc?=
 =?us-ascii?Q?Sekj+4jJHayM1Z37CyqQk3UZdpsV3MihpKDxD1qLgAGL976HM5c6yO2QmqIs?=
 =?us-ascii?Q?A89bY/tNh9u3/kDic2vEEyG19sYk4v7fFJ+/uHRhgqRG8wgZI9Pw7lqLkVw6?=
 =?us-ascii?Q?yMCs8OJ45TlgzIi/iiq4kXbJWZ9hXShyquSrzRNydu3cx4Mc1IiZS8zZ9css?=
 =?us-ascii?Q?jAcIT9zIsjMmekOgvE3RFC1bjzmkl/pZXR3wEc7taV+qCu6d0xR6V+KpdjID?=
 =?us-ascii?Q?Ej537aReBmeUut/KHdy33gr9YTYTMTlgCKKMBnBFq8K2q2Hd8uRA/D3tC8PD?=
 =?us-ascii?Q?3zhJ3rt9/orgbCCPG8MbLmn4czaj0baDrTcDZ9oeLeIrvGjKEFahQKf++JZB?=
 =?us-ascii?Q?kDMMsOySnKPNqneIk/2trSanNzl7/1isbZ1ow9Zo+jotDB2wcYe0Z5GkCbXl?=
 =?us-ascii?Q?Hhqp+7V0ouVLb8JyWANTapGLl/r2Nu+r7Pl4ggYAsANMJbsI/XBop0d5SBjj?=
 =?us-ascii?Q?jd3dzPnCWE9gmrYa2keYMrfwLR+kW20aQuqKboNhkhEnqN86T1GwHYpJUbaK?=
 =?us-ascii?Q?k236u07BCETdLBplwdmg9pFzcDmaLckp9r3fF1d9iRyyxP2zVqvqmJER9C5Q?=
 =?us-ascii?Q?K1mNy0sF3QXMmv6Ets93Bp8ggeraK98boMwY1hZiRyZl92RDRcAS/LuDH/4a?=
 =?us-ascii?Q?ahME65PUgPDREEePFk/aaG4rrwPm7otQAbEhDVZLmyYazxp2wJZyG7kxmtWH?=
 =?us-ascii?Q?92gvaxCkylHduZaoi41OEU7OmazliaGQQPCZs8vRKRyedljNmEb79tABtIG6?=
 =?us-ascii?Q?YAEgs1QROYXFcG+22XYY/zrryMbipcqS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OfVoFul25vQIvw4hwKurT7OfrglC02cWV7uV4hhRtqohIkFIZL/TQvkgs86y?=
 =?us-ascii?Q?yWixK2wstKxBK9Ip4D+sqQFKBzKghOfOWg8viRD5WxwNhKkHBZ0zb71aTJf0?=
 =?us-ascii?Q?TL1bShFg30Tmh5H8mF0j8g8GCrUwCubSKYZydo4zU8LwRyxcX0kxVfGXXtSV?=
 =?us-ascii?Q?oTTJdgoZmXLpGKApZ7o26aVvgqFXhZflPXg08RUh+o4WmMYLgMVX6oXKoeXj?=
 =?us-ascii?Q?Ex2QJpHyKMg/eHojS4LfVidHNzod4p5DzvI4JsfdlcB/7YGZgkQRi9nT2Bk7?=
 =?us-ascii?Q?GhwxsE0advF+o6ffNM1vqKozIA/DCiJsXzxwkCTvtGI8pYlOcstXQRZPv6/v?=
 =?us-ascii?Q?6/p0izi3ElTaZVmGral04Jeqzb1NPdVAX/e2IhSYBmF+A7oIe2jHFKHP4VPS?=
 =?us-ascii?Q?CaSZ1288Rm8o1qK7OdLycz3FRBrf7TWqJEAapWK15xNjzIDmjtoeAnzSrl4v?=
 =?us-ascii?Q?D5ZkO6wjPeivInSCriemE/w5BLTzgjMav3jDQJ2w3rl/YWtbljjfyPCmHwQ/?=
 =?us-ascii?Q?X7PFINsZI67pbonxP/0L05PNsakerJQxL+niagojNaFARTYqYn26aH3TMzaY?=
 =?us-ascii?Q?aBQoh+7/t/DkiXoN0lDy2m/UiJj1j3WkDdYJ6S9RtUA/nKjBZJC8IPZHmyBR?=
 =?us-ascii?Q?KV4NleW4PQvuEysnyTzCe5UlID3626DWjQbSYDOHuvNTsfV/sWoKWlC9k+CF?=
 =?us-ascii?Q?1F8vhMhkCZrYZEfK4nT5DOL0dMsQLsjNmKSnoLiiWekUPAyjWjjHm3STsXs/?=
 =?us-ascii?Q?Q9ealve+GVXtEnUE0fHAexRpy/RGaerGP2KaAn5OLhzVSKyUP1ksh+x5Gw1k?=
 =?us-ascii?Q?jl7/Et0cf7hvnH/wUraBjLFXZlGvUUSZm377A+UToxA6q6cyU01umXS9b/q4?=
 =?us-ascii?Q?d9NdKwk5baIGoimhGZUztLJtLsqLgkotEXNqduLZYdQavJ2iF9M+91Z0G9K/?=
 =?us-ascii?Q?U3h7QhL+Xsj6RfPC5uTbrMOiGgfOw1LwciB5FX8y4CJtin+LIjsyJAwttvAU?=
 =?us-ascii?Q?hRYYl9fdBlHzm4JXskX4OiemgmuBUjCfBMtAElruewoeo15yCMxfjU2Hax0j?=
 =?us-ascii?Q?zSBsCXdqx6R+yTiKKTwViEgzKz/0wia/LKsZ8M3OK1XN/f50NlQV8L+XxZaE?=
 =?us-ascii?Q?42zK0xaGwoXV454bT+DuISI+ZEr7oBO9G7+iNu6Pa6l5+2NiGgnCcHklRCRN?=
 =?us-ascii?Q?UT+tDNWlWK7CQWS4w1fRDw/ndYDG0EWJfkvwPq06I62aZs0fd3wrMi6EzBQL?=
 =?us-ascii?Q?uhwP6hS7YULPa+bHiwz6YDg/ANZeWTdp3KVT8Ioi1vvxzEYPQZEHkTum65cy?=
 =?us-ascii?Q?eNMQzKUwRr09L0IT+S9zL/p3g+1CgnvN1SUVeZKc4SN13cHtnczfs8+qCM5p?=
 =?us-ascii?Q?BPC1/uNlSy/r/jjMAtZY+CsdQ0P7iwdDRMw9G48hC7tkg5sUNa++VRlts8i1?=
 =?us-ascii?Q?rhmGSWrEHlntfU3ZzREwV7t3/NINDw+brHbw62FqCAf633hntv76rOqOe417?=
 =?us-ascii?Q?PD5J3wZzDxvNpqt+N5fjrzN1F2BFI4BlcmV9xJ9P4rUa9tsVouaiMpH0svMe?=
 =?us-ascii?Q?hFHK9jIuJwf8PrBYCbwsJERRDXjYgk7uumj0QJ40/F6/kU+6fOlMpjSwq06y?=
 =?us-ascii?Q?TA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078e8fc4-56da-4843-3bb3-08dd7104f62a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2025 10:07:08.0215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hg3XW4/UlFEjavkbS0sqccmy33FjQPMedadlygRXgdcLQBSPLAlXBr8IKqpSgtZJpmSBZqVRkxyECSXAUU0dHHOl2AzjRU+A2GoBnKpnoRA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5934
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
> From: Sharma, Swati2 <swati2.sharma@intel.com>
> Sent: Friday, March 28, 2025 11:41 PM
> To: igt-dev@lists.freedesktop.org
> Cc: ville.syrjala@linux.intel.com; Shankar, Uma <uma.shankar@intel.com>;
> Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>; Sharma,
> Swati2 <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t,v2 3/3] tests/chamelium/kms_chamelium_color: Fix
> ctm-limited-range subtest
>=20
> This test verifies the connector's capability to clip RGB values when swi=
tching
> between full and limited range output.
>=20
> Steps:
> 1. Render a frame with full RGB values (0-255).
> 2. Set the connector's range property to **limited**
> (BROADCAST_RGB_16_235).
>    - Despite the full-range input, the output should be clipped
>      to limited range (16-235).
> 3. Commit and capture the output frame (Frame A).
> 4. Render a frame with limited RGB values (16-235).
> 5. Set the connector's range property to **full** (BROADCAST_RGB_FULL).
>    - The output should now match the input without modification.
> 6. Commit and capture the output frame (Frame B).
> 7. Compare captured frames from steps 3 and 6.
>    - The frames should be identical, confirming that the
>      connector correctly handles limited range clipping.
>=20
> v2: -remove unused fb (Chaitanya)
>     -remove computation of reference CRC (Chaitanya)
>     -add details of test (Chaitanya)
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/chamelium/kms_chamelium_color.c | 60 ++++++++++-----------------
>  1 file changed, 23 insertions(+), 37 deletions(-)
>=20
> diff --git a/tests/chamelium/kms_chamelium_color.c
> b/tests/chamelium/kms_chamelium_color.c
> index 68611ec6a..6009de7d0 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -342,19 +342,19 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  		{ 0.0, 0.0, limited_result }
>  	};
>  	color_t red_green_blue_full[] =3D {
> -		{ 0.5, 0.0, 0.0 },
> -		{ 0.0, 0.5, 0.0 },
> -		{ 0.0, 0.0, 0.5 }
> +		{ 1.0, 0.0, 0.0 },
> +		{ 0.0, 1.0, 0.0 },
> +		{ 0.0, 0.0, 1.0 }
>  	};
>  	double ctm[] =3D { 1.0, 0.0, 0.0,
> -			0.0, 1.0, 0.0,
> -			0.0, 0.0, 1.0 };
> +			 0.0, 1.0, 0.0,
> +			 0.0, 0.0, 1.0 };
>  	gamma_lut_t *degamma_linear, *gamma_linear;
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo *mode =3D data->mode;
> -	struct igt_fb fb_modeset, fb, fbref;
> -	struct chamelium_frame_dump *frame_limited;
> -	int fb_id, fb_modeset_id, fbref_id;
> +	struct igt_fb fb;
> +	struct chamelium_frame_dump *frame_limited, *frame_full;
> +	int fb_id;
>  	bool ret =3D false;
>=20
>  	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> @@ -373,28 +373,11 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  			      &fb);
>  	igt_assert(fb_id);
>=20
> -	fb_modeset_id =3D igt_create_fb(data->drm_fd,
> -				      mode->hdisplay,
> -				      mode->vdisplay,
> -				      DRM_FORMAT_XRGB8888,
> -				      DRM_FORMAT_MOD_LINEAR,
> -				      &fb_modeset);
> -	igt_assert(fb_modeset_id);
> -
> -	fbref_id =3D igt_create_fb(data->drm_fd,
> -				 mode->hdisplay,
> -				 mode->vdisplay,
> -				 DRM_FORMAT_XRGB8888,
> -				 DRM_FORMAT_MOD_LINEAR,
> -				 &fbref);
> -	igt_assert(fbref_id);
> -
> -	igt_plane_set_fb(primary, &fb_modeset);
> -
>  	set_degamma(data, primary->pipe, degamma_linear);
>  	set_gamma(data, primary->pipe, gamma_linear);
>  	set_ctm(primary->pipe, ctm);
>=20
> +	/* Set the output into full range. */
>  	igt_output_set_prop_value(output,
>  				  IGT_CONNECTOR_BROADCAST_RGB,
>  				  BROADCAST_RGB_FULL);
> @@ -402,11 +385,21 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  	igt_plane_set_fb(primary, &fb);
>  	igt_display_commit(&data->display);
>=20
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame_full =3D
> +		chamelium_read_captured_frame(data->chamelium, 0);
> +
>  	/* Set the output into limited range. */
>  	igt_output_set_prop_value(output,
>  				  IGT_CONNECTOR_BROADCAST_RGB,
>  				  BROADCAST_RGB_16_235);
>  	paint_rectangles(data, mode, red_green_blue_full, &fb);
> +	igt_plane_set_fb(primary, &fb);

We may not need to set this again. Hopefully, there is no downside to paint=
ing an fb already assigned to a plane (apart from transient artifacts).
If there is, then we should consider using different frame buffers for full=
 and limited painting.

Otherwise LGTM.

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> +	igt_display_commit(&data->display);
> +
> +	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> +	frame_limited =3D
> +		chamelium_read_captured_frame(data->chamelium, 0);
>=20
>  	/* And reset.. */
>  	igt_output_set_prop_value(output,
> @@ -414,18 +407,11 @@ static bool test_pipe_limited_range_ctm(data_t
> *data,
>  				  BROADCAST_RGB_FULL);
>  	igt_plane_set_fb(primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> -	chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 1);
> -	frame_limited =3D
> -		chamelium_read_captured_frame(data->chamelium, 0);
>=20
> -
> -	/* Verify that the framebuffer reference of the software
> -	 * computed output is equal to the frame dump of the CTM
> -	 * matrix transformation output.
> -	 */
> -	ret =3D chamelium_frame_match_or_dump(data->chamelium, port,
> -					    frame_limited, &fbref,
> -					    CHAMELIUM_CHECK_ANALOG);
> +	/* Verify frame dumps are equal. */
> +	ret =3D chamelium_frame_match_or_dump_frame_pair(data-
> >chamelium, port,
> +						       frame_full, frame_limited,
> +
> CHAMELIUM_CHECK_ANALOG);
>=20
>  	free_lut(gamma_linear);
>  	free_lut(degamma_linear);
> --
> 2.25.1

