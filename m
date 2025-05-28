Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DAA6C3ABB2
	for <igt-dev@archiver.kernel.org>; Wed, 28 May 2025 04:49:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE5A10E1A7;
	Wed, 28 May 2025 04:49:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X2gr+CR8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E987C10E590
 for <igt-dev@lists.freedesktop.org>; Wed, 28 May 2025 04:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748407787; x=1779943787;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1P3L4Ht0gOVmzpiORwUh5owGmABqnAU92nSR9tfhClw=;
 b=X2gr+CR8hG0chnAtTzQMU51QjfeAASUuE0Pg6BLLA5MqYFeUk/KCUopA
 ESKc5+AB0Sq2mxrnavZIY/0e8vTVIbqbx7g7mWSk5EfRabceFKJe1eCdN
 +iQTnrvflF6zTHSwl+CjpAY9AlRZw4Y5O2haFAbNTatQb+7TLuJaLrg7b
 eQaaTdsZda60P0WKhVJ8f8ja9R6SLZsOK5qF5rSKcNS4w0mENDndgQ3v6
 CstwWGs+DXxYdoao6z5rBsy1l3x3LUZ3kNfT6ayXhcRA7O04vGdyhtDU2
 MH50bPyoLPj4IK/bzMJ0EZhfTgGWFne0yIQF6pW8eSQPoG7x2vENMsxhq g==;
X-CSE-ConnectionGUID: E/hhM2DGSA6FIXsUFupJkA==
X-CSE-MsgGUID: zMI2fFkCQN2PaOR9t01jjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60673287"
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="60673287"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 21:49:47 -0700
X-CSE-ConnectionGUID: Q7ARcw0KSauvHQPw0AJw3Q==
X-CSE-MsgGUID: J0Y7JErnRZWj2KzBrfgWYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,320,1739865600"; d="scan'208";a="148399169"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 21:49:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 27 May 2025 21:49:46 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 27 May 2025 21:49:46 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.87)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 27 May 2025 21:49:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgWGwQsIE9EsmFbqvVfS5B73cAfxtTU0fQOHHUFNx57WzvirJKzaruwcHsfasRT0B/spsfcaOp1wYb2a1mg3gjyEv+jfO1F/ylNdUohdqvKsELXxY8b4G4qc2UCqO00/EvFhOdeBpe6P5YF7cGHmNO6zCi9OsSGzTTvLVzGEUoeWvEjEgtxil1bYli0riblc/wOf5JafhdRySYwJTuB/HugP4d3it4VlT00HWbrxma5ldVNz2ZKEP9rVO1u8doqA2w/9WB5tpI4K90CTbIObPSYeeV7xqal7ywL8R+DCY/NzQImj5FYqoDRxOK1+X6+flnVQh8SGxOY0QOfm4zkLqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLxRwPg9Ot22/5f3/02fW7v5NCmb4EiL6MiOaItlH8I=;
 b=zQrRRmFCEgy7W48o0jwm80lJG0l4QjZIuNKmfqBfLWzjPDzFKW3ANBDnc2C86UZ0D1A2qAXfQ68JA0YSrsnR2dmxIqtDohm2Ps/joaAhDoOcZLhOD2230BPkrxlsyV/tkwnfOLWwLgBdxQ232XK2qOhlN7yhq2VWMlBvAXhpKvXDU/Xw4BIusObWadleS6ugMZLNrrlNDOmyRk4P+9FhrxfcIrocvi4aP18BjHxTz/NXJ5mc4py6nJ7/AkMpCeCHMglixGOah+biURsmS/3ijAURCbWynaFebBCXYB09WevvYFtSUno7hdoG+nQZhueZ04//qxQW5KuCw15et8R6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 28 May
 2025 04:49:44 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8769.022; Wed, 28 May 2025
 04:49:43 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH i-g-t v12 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Topic: [PATCH i-g-t v12 5/5] tests/kms_async_flips: Skip Async Flips
 with Linear Modifier
Thread-Index: AQHbzsvQhkZvd0d9I0uBWb7dWtoExLPnecdg
Date: Wed, 28 May 2025 04:49:42 +0000
Message-ID: <SJ1PR11MB6129E3EC9D6DC37CC032504BB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <20250527055343.247952-1-santhosh.reddy.guddati@intel.com>
 <20250527055343.247952-6-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250527055343.247952-6-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|PH7PR11MB7662:EE_
x-ms-office365-filtering-correlation-id: b9f5b6fe-ce6b-4f7c-6e56-08dd9da30ff7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?6hRqjZdksZk9uoEByXlUUMX8oVv5LS3xv8+HJSGi8b7VunDDvkszwzPhGM5h?=
 =?us-ascii?Q?Z2TtmDIZWtIN40UPAt5t2qHkZE5eCzdZiIigLQFKW1Vzwl63pjY4CZRvY+L6?=
 =?us-ascii?Q?HMdOS2kFVcPMxxStIZXN2+IMcOf4b4hw2aw+ZP74/aJcgnVHCTgNHjzBRppl?=
 =?us-ascii?Q?94+DxprMxhGm4ORHYe04TGtTWTg6h9JZkgukXivXfjUO41ammoUrtdsJ6oEr?=
 =?us-ascii?Q?3lCECX5JJ/MDSJ0kyv4fRfaSis3zCAk7KdHRfaX8aB5U2mSG6QBcMC0UX1GW?=
 =?us-ascii?Q?btytP2De5MttHcXD+fs2/0KoybcgpL3hjkVheTCbh5+ybOyLBlmtuddqhr48?=
 =?us-ascii?Q?aI8rOdMD/iY7P/QbLuhn7hWgUNx2ok6uyZU0bz2bnCQuNz1/vUFwiJTPBCLU?=
 =?us-ascii?Q?sPlAxgAEmpGpuFYnVdwTqsSvlaCUmZA6FYh4dlQszPlv1YvzHCzwqKnjx0Hu?=
 =?us-ascii?Q?ZQKvp/qcvj032k4lbeatfVVMVLmT/vfQvG/9E1+TWPAoeG04ue2nO3N7Ga2B?=
 =?us-ascii?Q?rHDVY8KsqAdv5oj9m53z/vMuyYSZUweuDVB39yl/K4lwBoJ0QohujTUwHE/M?=
 =?us-ascii?Q?yIv+WheDTxJ6LTmRib1nhV+E3Fw3YbDPh3Wsp+RdBs/ZNg1aUcKCCFTtWJpt?=
 =?us-ascii?Q?QAQvpbAfVZ7so96U37OV05LllaZWfWeLczYhxqwSHSXtZANbaOqYJdRYX9pb?=
 =?us-ascii?Q?DWqFakUGYwIQKzdw8e2AU9p6Lupc/uc4FCX2XTbKRSeib2QbS7qaag9GTKWe?=
 =?us-ascii?Q?l3TJEFCih5jf/aL9udryzHTdjw/cYp4xh72as4MAVO+OO9FSMHQSI7eXBcKK?=
 =?us-ascii?Q?GO8MWFiG0RaBHjSTc3MYPlsV612eZdbUnYom6PM1eYVEecpoyt0MAsGmaq06?=
 =?us-ascii?Q?Fr7r3EVWWu4PPtFdq/YoEA2wxIoMg5LHk4OYgO8VtDI6IOEzr4aGrPvn3VT6?=
 =?us-ascii?Q?r6/2MFhMAHj/D3w+aO9mCu9WLg6tknGNXRKs0UUKoSDYEQQYpu041DUFLJNK?=
 =?us-ascii?Q?1nJKDSCLyeX5ZhFaeh9QJJEFjDWOLOWsdPC0maFhTglg/T/9X+O4MfTMygR1?=
 =?us-ascii?Q?kxfFa+BPeZ+7831VyIL+bqqfPtV7fSpBywLY6tWXLGyXUHDYggdBENzCnY3F?=
 =?us-ascii?Q?rBdBFCIuGY+pntTMMENsVGSJhzJNFWWW45yGtBdqM65YB3sDtS0PvTarWtHS?=
 =?us-ascii?Q?68wy3/YJwTkyZPFM/QOBeX+w9c3BaPxSu0g1vD+GYBujpXQsWzNUS9+79Tib?=
 =?us-ascii?Q?XmWCr1n7yoiLsHtLSATEgQYAmOQbMr5jKdlr5AJH0MaINfF2BjPv+9r4PpKd?=
 =?us-ascii?Q?CQIeJk7s2IZkCsLqH3RKFrVSOW2idYYjEvcQtWQeb+cvYXJ4O7He5CX4m+HG?=
 =?us-ascii?Q?GRHivMui+Pha3JU7pDwRfSkdOqBe6KArn06kIJkGFWwqYDmWVCDpckBr9HtA?=
 =?us-ascii?Q?VcAmvQrppmR5e/VURzTvbkauHTtB+GcReqkWkTxDRfIsNlbpamCVNbRzOYxw?=
 =?us-ascii?Q?ZS7g0HPtrE5BZ2Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CWbapeQ72Tk+XhQXe0SP8dbngIDvtccZyfxSab/7R/QnkOt7DXqW2E5QjZ+n?=
 =?us-ascii?Q?YLSY7LSy8PcqkieM6X1VHyk6Tr69Hk+fCiJ5x98GHDg2JdHZDfgEVLgZ0pNN?=
 =?us-ascii?Q?Ftljvhh81heIPU2RjAV+8Ck2qzx3vouzb5kRyOBhNZOrYzysdcduGxLRSHzt?=
 =?us-ascii?Q?wEBwxBJa7GZiW6UCcg0+I32Lf6/LMloXtTyQoP5dq1x6T/EJ7936PD838rFB?=
 =?us-ascii?Q?DNTTLRsWEVM4g5f2WHN5vnYPc3gToAneTZAObWMHgY/gT5DWtwn0Ye9xpUgq?=
 =?us-ascii?Q?3CsMfLv7MnJiadg7l/G2SmiHJSV613w7On7EKOtbCa8uasQpe0PUAKsgs5OQ?=
 =?us-ascii?Q?7xgnZSpZatZeFNo3ymiq6oODzEsaIKYWgQYJktC2/Z0Z9/mHANc+bVQ9eR7q?=
 =?us-ascii?Q?DonojouwiC65yXM9DXX5wgqL/42QeMHtJOgl0FK4hPLNyg8sTDQpBP5/0rFH?=
 =?us-ascii?Q?zl3HPvjOee5i9a5C9xpwIgy70HD6KQXBrYl/I9wqSx3KgKPIGYIpdw8VN3Bg?=
 =?us-ascii?Q?roBRI/gkIlk0wT/fo7nehrcoL2dO2XYJRZcpLOYauCLunk4Ut75jH61jBZVD?=
 =?us-ascii?Q?gBvwOgFcnkaI7CmhkyD3uvL60OlRqu/mDS2188J5zpHNzCOhL4IXf1epClTH?=
 =?us-ascii?Q?iUeSSYC6vgFtoJyX6qx8YTuFP+xG75kEJlV0uG2UQnZAR9a3CovmGoTcRQwp?=
 =?us-ascii?Q?MDSvEwPnS9lye5ra5y0hFf4algyiOqU5oBDwqocAYIRVxr0Xubp/pZ684R9a?=
 =?us-ascii?Q?TLTKSjnoB9sfEkK4SfhbgzcUtr9EpI2P8SJrA3dULDDyP6EOLnskrPetwazT?=
 =?us-ascii?Q?AXclVTkBhxYkY+LexekHJTZXOdrYNrYB97TT5ul7uBx2U8j7HBwundD61yBi?=
 =?us-ascii?Q?FUj1yxGSvATaZ1JPWeLHuIRiPxmwZ88lSJgAtHVIWQcK5dpILSVYUMW5Cncn?=
 =?us-ascii?Q?PgFFd/RU9A52PF8gprJW8wEssFV36nLygQa8dy/c3uLhMbiM5rwqJMc7njWl?=
 =?us-ascii?Q?yGmmCIM/h81aA6JQTGY7nkZbVcqP5eG/IfC5XOJbLU/m/dKPuqbS/IshTT5g?=
 =?us-ascii?Q?bLBjhNO4dQDo9djdD1/ti91ImZXbDJ3sXj0A3cXpI7mQ8/TUBUu18Ng7DbcO?=
 =?us-ascii?Q?Ljz8bhu3qnvgtKJhjQqMRlCCV0QhPmJz6REpgBI4rT2z5ttxeW5DJuVWR+W3?=
 =?us-ascii?Q?h9wdcIr6j3wN9+8WKncCyshefgWmbysvbV3CB9Bbm6psmskHTU11hWYyywmK?=
 =?us-ascii?Q?tstICiGGhskkm01Gc/lZEQmPAeVDzNXbOqTDetdpINClBcf11j/E10/isfsf?=
 =?us-ascii?Q?ufUDpAbGs1K+H9YrxCYS0kn3xxU4OEF1HG6+anZ0yHrZhUSMr4G2IdoqsD+o?=
 =?us-ascii?Q?udyH9Ad+owYjtTm3MaTicpNktVu5dX0K4E+V+DQ0LmhGKvkPpprNN/1pAKnb?=
 =?us-ascii?Q?ns5YaHmzTYkiNiLrdA7Hjv7Vo9sZLcf0NXYFZ2dgUFWVpee8c6731hLG4DQI?=
 =?us-ascii?Q?iXgddqnyv/9n/6bYyiHR9hHl76E+qwff90WmqHAGazw0rUDa9VBk2K58bzP6?=
 =?us-ascii?Q?NxUfoRgjQEHVZYsubaNwd0VTdoQITNE7NcnbggiLpWskSZB4OnaMlJ+7lpiy?=
 =?us-ascii?Q?XA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f5b6fe-ce6b-4f7c-6e56-08dd9da30ff7
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 04:49:42.9120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YSXVU6L/lzb+xhAqBnTsRcAE25iHV6GZSl6j5OpxMuN448KE/I8YEobyxuWW/5KmKcC2YfHwBe0cv9fgkOssdNHxbRcrS8ASv8TgSHTqvSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
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
> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
> Sent: Tuesday, May 27, 2025 11:24 AM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Murthy, Arun R
> <arun.r.murthy@intel.com>; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v12 5/5] tests/kms_async_flips: Skip Async Flips wi=
th
> Linear Modifier
>=20
> Skip the linear modifier subtest on unsupported platforms
>=20
> V2: Remove platform check and use in_formats_async (Chaitanya)
>     Update the commit message
>=20
> V3: Fix crash
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_async_flips.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> f824f60f9..5aa05d039 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -901,6 +901,22 @@ static void
> run_test_with_async_format_modifiers(data_t *data, void (*test)(data
>  	igt_vec_fini(&tested_formats);
>  }
>=20
> +static bool is_linear_supported(data_t *data) {
> +	int i;

For drivers that don't support the IN_FORMATS_ASYNC property yet we should =
return true here. The assumption is that all modifiers are supported if the=
 property is not defined.

> +
> +	for_each_pipe_with_valid_output(&data->display, data->pipe, data-
> >output) {
> +		test_init(data);
> +
> +		for (i =3D 0; i < data->plane->async_format_mod_count; i++) {
> +			if (data->plane->async_modifiers[i] =3D=3D
> DRM_FORMAT_MOD_LINEAR)
> +				return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
>  static void run_test_with_modifiers(data_t *data, void (*test)(data_t *)=
)  {
>  	if (data->atomic_path)
> @@ -988,6 +1004,8 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive
> asynchronous "
>  			     "flips with linear modifiers");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
> linear") {
> +			igt_skip_on_f(!is_linear_supported(&data),
> +						  "Async Flips with linear
> modifier are not supported");
>  			test_init_ops(&data);
>  			data.linear_modifier =3D true;
>  			run_test(&data, test_async_flip);
> @@ -996,6 +1014,8 @@ igt_main
>  		igt_describe("Wait for page flip events in between successive
> asynchronous "
>  			     "flips using atomic path with linear modifiers");
>  		igt_subtest_with_dynamic("async-flip-with-page-flip-events-
> linear-atomic") {
> +			igt_skip_on_f(!is_linear_supported(&data),
> +						  "Async Flips with linear
> modifier are not supported");
>  			test_init_ops(&data);
>  			data.linear_modifier =3D true;
>  			run_test(&data, test_async_flip);
> --
> 2.34.1

