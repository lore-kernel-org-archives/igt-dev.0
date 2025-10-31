Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD71CCF9F8
	for <igt-dev@archiver.kernel.org>; Fri, 31 Oct 2025 14:12:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3C10EBC4;
	Fri, 31 Oct 2025 14:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L1u+aHKq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B3F10EBC4
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Oct 2025 14:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761919961; x=1793455961;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=nCG1l98NlshBVr5x8LPxLyIVW7LP0ffJZqE8V01hwRQ=;
 b=L1u+aHKqcwpSuVKmgDO4gnCpt/6KmeqY5otupdwqXfdhT9EFcDaMzQIr
 9TatUDLo79wXBO649RmQNDo+aAQlkq13AIZJT8SeUPrjtqLvt56DQXk23
 Jq2m2m+B47lO11Hw6WXf4wtCgcDMF+HAQaL3YNyUXgU4eOCKwOyl73Wcu
 xP8wpqiwsuTsaHeC78dWkv1HDjqN7agbYz23eB6xns6K3HlLqhi91L2Hz
 UuKVUskgWnC5dTKZRGoud623YD7lY5WPROoK1jgdCFKdLL8m2zUvZfo5Y
 DSX6guedIWokjzjMA9CC16clLZjAU3xneS4aX73C/GbRi3duKxb+GynEW A==;
X-CSE-ConnectionGUID: iGCeXY3XQTqDy5e9p2CeTw==
X-CSE-MsgGUID: elUMBGHcTaqr+/bJ5e/gvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67941134"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="67941134"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 07:12:41 -0700
X-CSE-ConnectionGUID: XBC9IKR1Ql6BgWSTWpboXw==
X-CSE-MsgGUID: 2JutWFcgT7+SiQylzs1xdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; d="scan'208";a="190591708"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2025 07:12:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 07:12:40 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 31 Oct 2025 07:12:40 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.22)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 31 Oct 2025 07:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7UqpchQpayZRak7CoERLl62H99gOkc3WKdrMJLaQFBEwfLk1Qpfe2tHhroY++aA2DEPGMNQwrSw/S7FwSzephkTEgbYTATY0sJ25QcGk/sSl3xNKi9MXoZ8+zvhbwxBI6rrLD0CmBQ0fOfR5KNiUExgyKfUQcnH0PuR6U3hvHU0D2fKfvaqSOzlWZ3zkdkaJBq7ppUBSZz07wUK94tXtcXj4cnYNWHd3r/UaPcVNrRS8B7AcPZd4MhYtqPJC10JFnjUJH44SRAcM7mQl+6zB4/vIiyom8sWqHx/6BtAuuJ27iIAVYFsZ1OBtqc71OeVtoItF9oxSQca8cML8UH+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fvnheJWIPY8PAyAuQGvfz4/bjJU5aQSKk9Br/NKTso=;
 b=NBqnRIFfyMQ774HEcuhyrJMgV9Trm7KzbgpnWRQBdv1neoiTDNDWZDyFAXuzmOSHqa6IcaIvZ9nEOb+7Qayxq6KOkrHpEQAwZH4hebizWY4yacuyk+RJGx+Q3yNq/835qpgAK4LaJKLlxo2IKRc9kLs59oiNYRN4eAA4zd+NLk6Nrv1uUztUKf3L12mXeiS35Biazq9R/V03x5651HzRBdM4qNq2G4sLUOKEifmYu1J7cXV1feST054fGS1BdNB9nGGO7ZqaF2yT1vawP2m7KPDhL6czr8aZeQEgA7vk+7Q3wT4guruJuoO+ynjW9MbILtdYPPQndp1jYLenwJTD3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by DS7PR11MB6152.namprd11.prod.outlook.com (2603:10b6:8:9b::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.15; Fri, 31 Oct 2025 14:12:36 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%3]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 14:12:36 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Thread-Topic: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7
 residency
Thread-Index: AQHcJtLmCB3UW00jxU2XZKmaBrYUsbSge5QAgDwVxfA=
Date: Fri, 31 Oct 2025 14:12:36 +0000
Message-ID: <PH0PR11MB4806DB23998658A34E4F6545E4F8A@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20250916062411.23433-1-mohammed.thasleem@intel.com>
 <DM4PR11MB6312650124CF03C419D8F03C901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312650124CF03C419D8F03C901DA@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|DS7PR11MB6152:EE_
x-ms-office365-filtering-correlation-id: 0f3c3d96-f3c3-4699-9360-08de18878b0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?5NWOs593sRmxkCIUYdZ8XJAUX7xFb3ieCY3YhVn2EQxurrZPtcWLdPKS+V0o?=
 =?us-ascii?Q?mL4NC4Mh8AXWvAaYOikHzOsl/slNSXs68liFGickpg0jRSPUhU9Ondd0fm2E?=
 =?us-ascii?Q?V22Vx8T1UZnKR80AQkCcRc4hMXgU/XKpCwy6xQ6nPsRuiwlKvw7URYf2W12N?=
 =?us-ascii?Q?AFn9sOlqN+aVQCKOnH5henAa5JyEzGz3CzemrrEMG5lABv3own5T4t+0h8fO?=
 =?us-ascii?Q?g2RIm+Rvo/Kx16r4YQPN3u5UqxRUOlaXdL5jhxhKP8DVml7ed3iD3JZkI2Su?=
 =?us-ascii?Q?0UC4IfbuFQfI6Hi+TYQA2/S0ITSfIM1aNJCNm3Dj61WRGIyHUa/aQB+sbuox?=
 =?us-ascii?Q?7IXXWcF/hb5uz7zD3LvKQUvH4hKDZ6zEV9fiKINIDEXK+bbqnLbREar6bbRu?=
 =?us-ascii?Q?9nKAuQYA1ET2cQMmzsJDv9nGAZ3+3ZA7WF4+omW/dzuJ/RtWIazmE+cg2ifa?=
 =?us-ascii?Q?Ch4pZRnux73ay8nA8g4O6pAKMRzPsY2M7CBzOETUsccyK4zzzzLZEIDhNHpT?=
 =?us-ascii?Q?x4nvV+FvSg6Z7vTwLooLR9voLR7ychImIE+ptB3ug3aPsQ1nYk5YtLrAr/84?=
 =?us-ascii?Q?jdtm7jqtxDet08YXQmUvDkKxHDU1SrhDQgD3xX3wDS/yj8gUo2mFcz0tiRMA?=
 =?us-ascii?Q?nJmQH/IlDrpzqy2FY0PPSJBahGDcFTLNXu2JbmPb7VhSl8NohB7m5L5GrwMb?=
 =?us-ascii?Q?4hqP6kWktacw/bIvJ/C0zVQH3VWr07jIqA7uLnCfIr3Bq68b5cfRVyOLCNYb?=
 =?us-ascii?Q?0xD576MCJR4n5bMZvJwuLnvzYXxpHkUh0F7J1+FQFAzPPZPyWZBo7KTDEHgW?=
 =?us-ascii?Q?QjK7zY0Tx5RC1lhBYSEvYrfdhyKA+Shf6eJjEstJ49v9430Q5HySxB3hi++W?=
 =?us-ascii?Q?//qQg4OfTide2Nley8M0huXLyqBvm5LLvI99p44MVuuc9smSJ1Fks5uJyZae?=
 =?us-ascii?Q?UX+5LO2iMXVI1gTVwn64LWAcqo6oS0BTa75UAUmuF1LzVfDfsY2XkixnQ6qI?=
 =?us-ascii?Q?6o3oQh5b9l2nx/kYufvjEd2k0ysr74mhSvOYWEs9SCOXNH7poS39dCUT7yw0?=
 =?us-ascii?Q?Jm7U++tjbsR2vUbUKLyNWAqIvBKEr+O1cwSdl+38EAqm8aQlQx+796dJ1Muu?=
 =?us-ascii?Q?H7ZtJPxentQy5FIxMTk3xbJzYbQ/MbWcIuNiiWPs2b0EgZz2jVLcQap5tbmd?=
 =?us-ascii?Q?GAyZRRfP5sei+f3dlmHEPdlTeMJH5It7pJb7+7so0GPgW3NhjeGgmdhTw8Wv?=
 =?us-ascii?Q?AP8FgZMj6o7UaITVfpjhzw0OeR6Oh7E/3TdISah8SsY9J6/sV+FgQfc0AZT1?=
 =?us-ascii?Q?5vURrXuO5idslONrZY1EHCkx2c0a8GauTGg7ypjVfD0PsZ9+9vzmTLikku8l?=
 =?us-ascii?Q?Hy/orwug/JkseQsoVlHBF259EAyNWww8ez6LokHRVv3GKW+kr2ImK4SBHFsY?=
 =?us-ascii?Q?jovJfl+7BQmi5rcsKYuPNoQ3QzSH18PF/TGuLrnIu8nU473QenZkIXjZLhU9?=
 =?us-ascii?Q?5cRQO0LVUMwjTvgEf/J4+OnfDp3yXZSFlgiY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5x+Dj3xa0BQI9fHekDuICcQWJ79qayTY9ja6USwG+yPxc2OwtoiLAU7scVek?=
 =?us-ascii?Q?XTvWHBf+KxpYz1/GQqvahYBc1USm6LU4yr0LIXV/JapJR+v08JdmlnbTfwUY?=
 =?us-ascii?Q?CdADXKE+qR+hjUk0vybJQKdjf07x3OY5O8fVxTfI5hV99hrpA9U9uzpLGYt5?=
 =?us-ascii?Q?nEdA6VA7p6ITl2b9JK4GKxj9SZ1wa1bGFLZD352BUsk8Al4w1opWvkhpQWBV?=
 =?us-ascii?Q?DwQHNgCvWPVFcjtf9Jd3ppF9iUBSOspB+jfj+sPvcjW3Fwt72FhtT/yy0ObG?=
 =?us-ascii?Q?QavxmJEL9OxzKTuL7Dn8kbyLEY8nl5ys7MZVRrkNY3zmqUOQNGYPaCCneAle?=
 =?us-ascii?Q?YiQufW7Iq530quepz/8hDP1W4uY5tqWG/YrBr7PO2zFG3olxv7FT4vLpWXcP?=
 =?us-ascii?Q?d0heuIr4nzGlGmc7Z8b74jbDgUaa4j2SRUpIkCik6CJqTuWM8ZdS0nOVUsgk?=
 =?us-ascii?Q?DnJ1BR1JG1JT6+HMWu1pIMPoa5STy+AZqQnFwDBULxhmNUISmcUkAg+8NBRr?=
 =?us-ascii?Q?3KR9CO7eMGf6IB1H62kpU3kAyVBlszKy9Lql9ueEdvuvYWl/b2qwDzjzHVGy?=
 =?us-ascii?Q?pCgxCwn42wd34fXwjGqxIw++I75TBJ3n8VhKwWpX28QJCK6bSFez/fpSz+gq?=
 =?us-ascii?Q?xOXgqfob8zcD6yNq27XteFqctgwoaHfSnSpWT2nK2Ql83ECLd7P6pIL3vNC/?=
 =?us-ascii?Q?neHt339gV6ikLpc87JAxQaa9cyEUHfTsJvMEyVXKdz+Ax5yaWBB2teJK0pRU?=
 =?us-ascii?Q?sCJVrEPUMgKglXWuC2n+Qz9+8WwvD/zMDtEdWww7evVHkWfAqTE654A26CHO?=
 =?us-ascii?Q?bEBNgwyyGBvPddAfzzvUyTqNzgJ/ohE5m5wmqCFzsrrBwQWhkqx7FMIE1QJ5?=
 =?us-ascii?Q?HjutZlXg7CT+DykHX/WRcCWEaKu6FGo+BBWDHhnKQMlUFkVGnLWrZ2axLsx1?=
 =?us-ascii?Q?I9MtfgmG4Ocht2YVClM0Iv6/e6PUKcZaGgbWBOd0yzacw7Sbp+ogSbPjzpTF?=
 =?us-ascii?Q?pTWWqITrqqWwN2foQbIJvk/ZeZ5AcEjlCzgnSTyqFWwQzUJiwzhUS+A7PYv2?=
 =?us-ascii?Q?9c5QreqAF4NieOf491ni0Schrt4OZ0DUZ8erkudR4OfLNdlAOMXouM3OzgPv?=
 =?us-ascii?Q?0dQdLLQx0GDhSPPu3oJGnqx/uEWeCfqbJGRNddrRKiQIDCUGm88gPB6k1bSJ?=
 =?us-ascii?Q?OoCHcy/4uR12cIhy9azLZ7UJkmq3STGVNb7yGwVrb7TeFBZOI/rAvFSbadWs?=
 =?us-ascii?Q?FiFyAjjLhOcg5AQp03/EpcpK04Ny2J5yP+QAR8pXNOF/fL3rVJllGFDWM2my?=
 =?us-ascii?Q?4QrViGzCrqo+Ah9eVFKouNGFdn9mAwLyuvuZpbSL12mTzoNc/YuNBno8eqba?=
 =?us-ascii?Q?IK4eFPsNrjNsgN3tqyVm9VIxuKAWRW7uefzn1LA0ig1XuHqi9oCc7J69SolI?=
 =?us-ascii?Q?ygIZyGcDmjtGBHWkXwTHxnU4eTgWRd7uJlRLDZjRB6n8cp05XDcKZ1CfeRfS?=
 =?us-ascii?Q?6CQFJCLExrHrAtdbIme2XPEoxOqQR+FXCNbiH8OcNtfBdG4vC4F924gdg42b?=
 =?us-ascii?Q?yOgum504xK0Z0B67JkrjL4x9sasGr/jiZ26cQoh/LlgOaaTppXMySHZfcJ2C?=
 =?us-ascii?Q?Yw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3c3d96-f3c3-4699-9360-08de18878b0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Oct 2025 14:12:36.5436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ltMf3KB5gIcIjfOXRFgLyGb182GuJWjnY97ELaulWinwOkTQYO8I/bmvHwkTZrat3xOSqFQgqfOik/906bF2q07Ovs5olMcQrEy9iVZc7sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6152
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
From: B, Jeevan <jeevan.b@intel.com>=20
Sent: 23 September 2025 02:03 PM
To: Thasleem, Mohammed <mohammed.thasleem@intel.com>; igt-dev@lists.freedes=
ktop.org
Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7 =
residency

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of=20
> Mohammed Thasleem
> Sent: Tuesday, September 16, 2025 11:54 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_pm_rpm: Add test to validate G7=20
> residency
>=20
> This test validates the dgfx Package G7 residency.
>=20
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/intel/kms_pm_rpm.c | 116
> ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 115 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c index
> d22f165b8..16b278d78 100644
> --- a/tests/intel/kms_pm_rpm.c
> +++ b/tests/intel/kms_pm_rpm.c
> @@ -128,6 +128,9 @@
>   *
>   * SUBTEST: universal-planes-dpms
>   * Description: Validate universal plane (set/unset/change) with dpms.
> + *
> + * SUBTEST: package-g7
> + * Description: Validate the package-g7 residency.
>   */
>=20
>  #define MSR_PC8_RES	0x630
> @@ -178,7 +181,10 @@ struct mode_set_data {
>  	drmModeConnectorPtr connectors[MAX_CONNECTORS];
>  	drmModePropertyBlobPtr edids[MAX_CONNECTORS];
>  	igt_display_t display;
> -
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	igt_plane_t *primary;
> +	struct igt_fb fb_white;
>  	uint32_t devid;
>  	int fw_fd;
>  };
> @@ -1572,6 +1578,108 @@ static void pm_test_caching(void)
>  	gem_close(drm_fd, handle);
>  }
>=20
> +static void set_mode(void)
> +{
> +	enum pipe pipe;
> +	bool found =3D false;
> +	igt_output_t *output;
> +	drmModeModeInfo *mode =3D NULL;
> +	igt_display_t *display =3D &ms_data.display;
> +
> +	for_each_pipe_with_valid_output(display, pipe, output) {
> +		drmModeConnectorPtr connector =3D output-
> >config.connector;
> +
> +		if (connector->connection !=3D DRM_MODE_CONNECTED)
> +			continue;
> +
> +		igt_display_reset(display);
Can we reset outside the loop. Before we start ??=20
> +		igt_output_set_pipe(output, pipe);
> +
> +		if (!intel_pipe_output_combo_valid(display))
> +			continue;
> +
> +		for (int i =3D 0; i < output->config.connector->count_modes; i++)
> {
> +			mode =3D &output->config.connector->modes[i];
> +			if (mode->hdisplay =3D=3D 7680 && mode->vdisplay =3D=3D
> 4320 && mode->vrefresh =3D=3D 60)
I see we are trying to find 8k mode only if not found test will skip any pa=
rticular reason why we are doing this ??=20
I fell this can be handled better, first find the display which has 8k and =
then run the test accordingly. =20
	-->We specified supported modes for g7 residency, 8k@60 also 4k@144 will b=
e added at next version...
	-->hard coded modes would be removed at next version to support multiple m=
odes.
{
> +				igt_output_override_mode(output, mode);
> +
> +				ms_data.output =3D output;
> +				ms_data.mode =3D
> igt_output_get_mode(output);
> +				ms_data.primary =3D
> igt_output_get_plane_type(output,
> +DRM_PLANE_TYPE_PRIMARY);
> +
> +				found =3D true;
> +				break;
> +			}
> +		}
> +		if (found)
> +			break;
> +	}
> +
> +	igt_require_f(found, "No 8K@60Hz mode found on any connected
> output
> +\n"); }
> +
> +static void set_output(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_create_color_fb(drm_fd,
> +			    ms_data.mode->hdisplay, ms_data.mode->vdisplay,
> +			    DRM_FORMAT_XRGB8888,
> +			    DRM_FORMAT_MOD_LINEAR,
> +			    1.0, 1.0, 1.0,
> +			    &ms_data.fb_white);
> +	igt_plane_set_fb(ms_data.primary, &ms_data.fb_white);
> +
> +	igt_display_commit(&ms_data.display);
> +}
> +
> +static void cleanup(void)
> +{
> +	igt_plane_set_fb(ms_data.primary, NULL);
> +	igt_output_override_mode(ms_data.output, NULL);
> +	igt_display_commit(&ms_data.display);
> +	igt_remove_fb(drm_fd, &ms_data.fb_white); }
> +
> +static uint64_t get_pkg_count(char *pkg_data) {
> +	char *e;
> +	long long ret;
> +	char *s =3D strchr(pkg_data, ':');
> +
> +	igt_assert(s);
> +	s++;
> +	ret =3D strtol(s, &e, 10);
> +	igt_assert(((ret !=3D LLONG_MIN && ret !=3D LLONG_MAX) || errno !=3D
> ERANGE)
> +&& e > s && *e =3D=3D '\n' && ret >=3D 0);
> +
> +	return ret;
> +}
> +
This should be a lib function I feel.=20
	--> other binary also using similar logic will consolidate all and will up=
date at separate patch.=20
> +static uint64_t read_g7(void)
> +{
> +	char buf[256];
> +	int ret;
> +	char *str;
> +
> +	ret =3D igt_debugfs_simple_read(debugfs, "dgfx_pkg_residencies", buf,
> sizeof(buf));
> +	igt_assert_f(ret >=3D 0, "Debugfs dgfx_pkg_residencies file not=20
> +present.\n");
> +
> +	str =3D strstr(buf, "Package G10");
> +	igt_skip_on_f(!str, "Package G7 is not supported.\n");
> +
> +	return get_pkg_count(str);
> +}
> +
> +static void test_g7(void)
> +{
> +	uint64_t prev_count =3D 0, curr_count =3D 0;
> +
> +	prev_count =3D read_g7();
> +	sleep(10);
> +	curr_count =3D read_g7();
> +
> +	igt_assert_f(curr_count > prev_count, "Package G7 residency is not=20
> +achived\n"); }
> +
>  int rounds =3D 10;
>  bool stay =3D false;
>=20
> @@ -1695,6 +1803,12 @@ igt_main_args("", long_options, help_str,=20
> opt_handler, NULL)
>  		gem_require_mappable_ggtt(drm_fd);
>  		pm_test_caching();
>  	}
> +	igt_subtest("package-g7") {
Need to add igt_require first for dgfx_pkg_residencies if not there it shou=
ld skip here only not assert when test starts.=20
> +		set_mode();
> +		set_output();
> +		test_g7();
> +		cleanup();
> +	}
>=20
>  	igt_fixture {
>  		teardown_environment();
> --
> 2.25.1

