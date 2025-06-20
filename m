Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECB6C71155
	for <igt-dev@archiver.kernel.org>; Fri, 20 Jun 2025 05:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2102B10EAD9;
	Fri, 20 Jun 2025 05:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHWLPEVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F7210EAD9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Jun 2025 05:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750398114; x=1781934114;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o+q/LZbvX2X6ABeJ40gfgaCiJgEUEYc4Pvv5S4yHQsc=;
 b=IHWLPEVOBH+0T/3SxzUfq3Cq10xOl6wG6VXETnVscaOjWNsdLj9rPewr
 9TzbnzOZQmHCSMNYYpvEmcOX9D7RXtrO91p3/voCzP0NCAAaq1Iti60OI
 graXrz/zJFZcDLsZcblQokybg7ZFi3Smv0QYaxky8HANEXOyZu2lASFuW
 Ap9y9EAOliKoIlTh4Cvk1svFOEXxWHu+/zm/Ap6Bo/pYL3o5gKyp+4jPc
 Gkfcq66D6qauPbs/dHLzYpGXo044qzh1OBcTAerPPaejCDoeWYPKC83uv
 kze67pONdLt7bb6LOLPunQyNubIoblt1bkepc3fGYh+9abUjZNCx6l6cJ Q==;
X-CSE-ConnectionGUID: FBYeQ5n/QxiN4+sapKBS0w==
X-CSE-MsgGUID: KF3Nb10dQ3SeHL0/KMRIIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52533334"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="52533334"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:41:54 -0700
X-CSE-ConnectionGUID: ebP5qFKLSWyPSkjFD3dupw==
X-CSE-MsgGUID: zf7ocSfxQSa2qAwkto7J7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; d="scan'208";a="151351169"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2025 22:41:53 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:41:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 19 Jun 2025 22:41:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 19 Jun 2025 22:41:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMo5siW47mU86Cq3AkpKk0u2FGUDkTqbpk7JsTXGDEpmjWRKhbiKuSlT53ZOlbsyIE1QC6LEPdslWN7WEGANRoqHl13vMxUYNaFiBh95rq6XGv9gMgzneZpfgI/Jjq3QBnlpriwDs8quy15wrQG/a4twq+QE8hnRrICL13DY/j7FUw+njWnsnYSCmvNYQDRGHcNqyct3CJ8huo8hKlBdgepcVc3oXn9HxEfCcoNdO2VQBe2W2j/xVRo1JDHjr8qKO9Qmj5jeZtSRGzjDbM61m0glvVOFW4DWhV2EYrU8Y2GPmA4AQizxq5WHPWboIjVx62/JWqJAVpiYDlVeLiXKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WreJiBTDswzGSMr03V0p1wOksykKITms+iw+KjHQg78=;
 b=ieM44x9QPzyIkhULE55AJZIkvIbLppjRDO8aUJ13j+xZMm5shPRGZHErFVsIchBnbrLmRUk/G7a7CJwzUzorS5FSLedMmtnt5JKFEjZgCSDRl6sL/nsEC1t8nwbzLMMSHNWUZKCUmGejd02ppexmcrXm47y+odJLwe59wRgOMHloQeubAn8yNAAWXS+1rEXcYY+HNLkKtrPCUCiLHTHzrPiFSYMTouqSyFSd8pbPkSlLMjaZeid4UdHdjBq2MMGGhz5im7F14+vxaEXqqv7amy75SeZiW47a2AWgiuUaVCJH4SqG4EMSmSCLdhtaC88UIYjTaY0A+6YwlB1qGsrlbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Fri, 20 Jun
 2025 05:41:21 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%3]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 05:41:21 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "B S, Karthik" <karthik.b.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t 3/3] tests/kms_async_flips: Add DPMS subtest
Thread-Topic: [PATCH i-g-t 3/3] tests/kms_async_flips: Add DPMS subtest
Thread-Index: AQHb4QyksDMm6BxUKUGomc7kDmwvIbQLiJGA
Date: Fri, 20 Jun 2025 05:41:21 +0000
Message-ID: <IA0PR11MB7307259DED2EF282E0CD11F2BA7CA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250619112334.744213-1-karthik.b.s@intel.com>
 <20250619112334.744213-3-karthik.b.s@intel.com>
In-Reply-To: <20250619112334.744213-3-karthik.b.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: 97045134-7d70-42d1-daf0-08ddafbd1622
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?FScoasnm5H0yO+X1Zv7JiBY3RVIeQQCM6rbV2oqfBJbHXb5F6yCGBgEtoL5l?=
 =?us-ascii?Q?CisAiEgBQqaSWnAS2bIM6IFtqWTn6MYt+FU88x+cpdpn44/QZ8TWniw6+tOM?=
 =?us-ascii?Q?F3xzZT+HNbzZKwr2JuRkDfLMwm3QoHXLujk/l6FbL/qqPYdjmwJE3IeFOsxi?=
 =?us-ascii?Q?tlTmBiyEp4CxKAIj2+IdAYR+AGxecCdlt1JmB6kMGUPRMM2xC5c6sTVQ56IU?=
 =?us-ascii?Q?JLGZzcu7oX4AR3UeYBWiRMa/tFnWpm6+MLPTAdVlp94fvaJL8NblgQMuBNNk?=
 =?us-ascii?Q?EzZIv/Z3GkGXgZURTushdLrx+pbS1UzDvITSMIU9h0YN7I7ACn7TGEPgJE3E?=
 =?us-ascii?Q?aRREl0tT01beZVBIR70YctFVIfUxQYvtlhtg0ZViQ/gemj/lOk0yU5lrToj/?=
 =?us-ascii?Q?zEldOB4vpQptg4hWOpWxwHec7c4a76rkZd++PGDdu171CfEIf2K49sWKiFef?=
 =?us-ascii?Q?tcFtkmHgXuhHjEJ1Rn5FkY0kNs9KXRAEjUJcFR3dzkmtdgocsZcThP9Nmy8p?=
 =?us-ascii?Q?twbAY3Fq3+sKgphx9GR+qqZOm1it3scSlEsHMsFzKZ2cSNnjozT09cKbN3Xb?=
 =?us-ascii?Q?PkuL97h4Eg0WlcNETVnfZm0B+qplOW6BEbSYIc0zdMnuIODLBQ5VqAQihkXn?=
 =?us-ascii?Q?UbX1gS/7sM1NvB7excRJ1H4qg6V0/TvcbBC0nyMa+bcYFRI2Sf+G+Ky6rcQQ?=
 =?us-ascii?Q?+CdrZO9QmGK/OEZDn+SX3wStMKxZAbEfE+RZwyK5GJprp8UXjgAzPIUP8UbD?=
 =?us-ascii?Q?MplAhscShbyVsnzE3PI/PP5HnW2gv/TK5z07vYUA3k+JUnHX1x071ll8z6Zt?=
 =?us-ascii?Q?aPFkT9F2kMd2XD+VWvGPF93SJlhNxshxkXoJlmzEpb+ChDzS+5n4R1LsWWYN?=
 =?us-ascii?Q?tTwHUZ9CdcBO8twsnTkoJv52l3Y5dTPgGY2WulKDWNd3Q6/KJZoirYACNOfX?=
 =?us-ascii?Q?uX91jQl7zkMw/MI128Nzzv14id3g9SE8mgX1C3yVGaDfPpePSUvMMpwxkgNK?=
 =?us-ascii?Q?cEBGhSu7Omb+ZKZELRpofTtJPLxP/MqgA9AHggYPfQL4cwmuyz6EO2re/SwU?=
 =?us-ascii?Q?uD2hhW5asjLr1oG6Py8WORcdbr7QTVUqQdYDcBwA3A56IHoHYOTAFp/ORuN/?=
 =?us-ascii?Q?gD392QSqHir1BntR0xT/GTk4QNy02qWBDXDIjtAvk+CKT3in1AwrByDkyFv4?=
 =?us-ascii?Q?sc5ngGv4/sHdguR4oy+uytdjIf7FpJFtMFjYnxbf8e/z90evBn+WYTaqcYhk?=
 =?us-ascii?Q?reGheY1GTBEQi3n1n71dUPM4JOuHOy4xDJB0/uAvQzzzfzLIycWydL8j8uL7?=
 =?us-ascii?Q?gLHJoov6Ocs6qXiXpAXMlTHlHS3xH652WKpSUArrTUM+9zVxwQbpkRoWn7Zm?=
 =?us-ascii?Q?6b+aOUvRYqaos26tNXm0ROPdy/CIrp+xOkaJlVRZq3XFghnU3Nn2xD5WYQTk?=
 =?us-ascii?Q?RQOfyotBZ/vSNZTQ2VbeUL6wVraQW+5qq2cwmWjv89Kiwhq3z/Rx25tjO4w0?=
 =?us-ascii?Q?9bGD2DpXAHmUPOE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5d812QMbRidcdT5BwhcL4hbcw6jtCfOJJv4XYwumQlaNaGfXyo7nARufmVEc?=
 =?us-ascii?Q?rHjlu+E08EmcOiH5XObOU9/T2dq3ynaWsPKEo89Nht1ovBeMIzx49jwPgRDS?=
 =?us-ascii?Q?hCmssrYswg9eT9dGu+rRDiGYqvRe+wKxG6F78yc2KNCRauVVE9B6k7a6A19C?=
 =?us-ascii?Q?sOOGlzrlRAEzb/bHk063Lki4XnNMUyYM/hZyyLIlQp/uOXe23DarZiu3Uf4q?=
 =?us-ascii?Q?D5bUmWYUia4ICK9P2LsUa9HtNlWS3l3L02WAynNIlTNb+nFjuPox/vSkqYSa?=
 =?us-ascii?Q?W7jI3T0aZnkL8Vr+oSQh93wMbsDqEPgtdHiBbiJkjJj3G5Kgos3PT4xEkJyB?=
 =?us-ascii?Q?gW3ZA5DdA6MvfENTobciZFcxr+4s36wVO3tm48kU2BxruCtk4dR19bIlhM4q?=
 =?us-ascii?Q?DhQS0Cv608dzoDR8dYTvC4UZcKV8OMuhO9OXxMAcVi9iCEbJmW0usGyZVTie?=
 =?us-ascii?Q?wefasVl+juDBT9+4GEpk75KJrpj7eCbvaU7DeoanFfNnAdclQlUknHX0A7KX?=
 =?us-ascii?Q?Gs2Jk084cVShojhUbGvKPaLatpyl7I5dsIolVy+nMfj7XoIzC+5S31nLdpCD?=
 =?us-ascii?Q?SCRrJ6f2kvQrC/kfTYPAqpAGyoB+j1XcyWSqtRurxkawz79ixUsr2WEbOyNq?=
 =?us-ascii?Q?9fB+WzmDdIhIe4fE1Sjb+dIaTmHEiVFN85asfDQXNr1d8jINLQcWBqteFAdW?=
 =?us-ascii?Q?ISL9WoOBjB2DTJVKwbie8vKSiGVNV/+nRTPlb4G755y3Am77+Yickt13bDWw?=
 =?us-ascii?Q?qTGBqga4s5Zq/1Byoc7DDfaA5PHAiBtwCGQJJdXfQZSfDv8Wf9QzGqEsUEAd?=
 =?us-ascii?Q?ZviudUQ92AyyKdU+uMIoBKvMYRDztDOSKnrR9uTFF86kKMhCb+Y59LZhUzjq?=
 =?us-ascii?Q?eO3cm4zaoq3gsNQBQH9wrOrdEGn80d8FlOk96Rk1C6bDmrKus/dLmEZDAdVs?=
 =?us-ascii?Q?TeR7CJjnUkTaggA4mQm/0H9vQ5z1Vy6+jk0y9KDBszOWWO3wWv8FUkjCqzan?=
 =?us-ascii?Q?UubJlnIn/G46bgcDZuKjmiQyCVsLSU46Oz96XMNN+i4fxXPRpPls8p3fim8i?=
 =?us-ascii?Q?jnH2TpjQ/46UpK0lOkOG+7uY8ikBEbbo7P4HyQa5iUEKjsVlDEyqPx9v7iyw?=
 =?us-ascii?Q?X5EV8C+wPtp+hylkjSUIXJ5RuV0uLypYzAaBhFaolwanIp8Qr8VSQUVENIbB?=
 =?us-ascii?Q?9hrBTLWBqJuQgtC4Dkk2yA1BEKmCzTKa83eMQVtDXm2Ww1VTTkGp8Dqy0pNO?=
 =?us-ascii?Q?Md0j44Ukzc4BO++iNyKealGjlMYGJjoQx9+tr7u3K+qgg+yJjI0JErWS9dXQ?=
 =?us-ascii?Q?Q1S8bGHuoSLMEOBpQANWyw7LVolWTMbXBMiitSTTMqBPUHTPy/6F6oiWP5Mo?=
 =?us-ascii?Q?O/+bJzfOV42c+JpmdGMtjfpubIYcdCnnitEltZeh7eBnnupw9B+ccTplDyPS?=
 =?us-ascii?Q?L3n/FZoZ2BXYXz8VafMPlX/AZk/X3J9afz5kdBzkPeI6jcRLP6+zurS9KV8A?=
 =?us-ascii?Q?MGd2cPVvBp0njyeGvnchj1hcTOArTfz+ofeJ3JUgHrQdKdlJzyKWOqFYrWpC?=
 =?us-ascii?Q?gae+TCMPi/FoqkAXFqxDWD4TN6RYLXWYmWy/Etql1vM0F/+33hj/8kHNpJPk?=
 =?us-ascii?Q?uFDwqG2XoZQD6Tr9PkXjGXGUp/H1insl3qLYmJZvMeVB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97045134-7d70-42d1-daf0-08ddafbd1622
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:41:21.1474 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPAtqZzlovj82urGdnB6yDLJQrUlfjvcZsQvkuL1hJaRsKPe3i8U7gPfULRpLSXNCny33a4828K3XapI/ZBEwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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
> From: B S, Karthik <karthik.b.s@intel.com>
> Sent: Thursday, June 19, 2025 4:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>; Murthy,
> Arun R <arun.r.murthy@intel.com>; B S, Karthik <karthik.b.s@intel.com>
> Subject: [PATCH i-g-t 3/3] tests/kms_async_flips: Add DPMS subtest
>=20
> Test functionality of async flips with DPMS.
>=20
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>  tests/kms_async_flips.c | 34 +++++++++++++++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c index
> 8587e4675..b0f96ad95 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -89,6 +89,9 @@
>   * SUBTEST: async-flip-hang
>   * Description: Verify the async flip functionality with hang cycle
>   *
> + * SUBTEST: async-flip-dpms
> + * Description: Verify the async flip functionality with dpms cycle
> + *
>   * SUBTEST: overlay-atomic
>   * Description: Verify overlay planes with async flips in atomic API
>   *
> @@ -136,6 +139,7 @@ typedef struct {
>  	bool alternate_sync_async;
>  	bool suspend_resume;
>  	bool hang;
> +	bool dpms;
>  	bool allow_fail;
>  	struct buf_ops *bops;
>  	bool atomic_path;
> @@ -375,6 +379,21 @@ static int perform_flip(data_t *data, int frame, int
> flags)
>  	return ret;
>  }
>=20
> +static void check_dpms(igt_output_t *output) {
> +	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
> +
> +	kmstest_set_connector_dpms(output->display->drm_fd,
> +				   output->config.connector,
> +				   DRM_MODE_DPMS_OFF);
> +
> 	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPE
> NDED));
> +
> +	kmstest_set_connector_dpms(output->display->drm_fd,
> +				   output->config.connector,
> +				   DRM_MODE_DPMS_ON);
> +
> 	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE)
> );
> +}
> +
>  static void test_async_flip(data_t *data)  {
>  	int ret, frame;
> @@ -383,7 +402,7 @@ static void test_async_flip(data_t *data)
>  	igt_hang_t hang;
>  	uint64_t ahnd =3D 0;
>  	int mid_time =3D RUN_TIME / 2;
> -	bool temp =3D data->suspend_resume || data->hang;
> +	bool temp =3D data->suspend_resume || data->hang || data->dpms;
>=20
>  	igt_display_commit2(&data->display, data->display.is_atomic ?
> COMMIT_ATOMIC : COMMIT_LEGACY);
>=20
> @@ -454,6 +473,11 @@ static void test_async_flip(data_t *data)
>  			hang =3D igt_hang_ring_with_ahnd(data->drm_fd,
> I915_EXEC_DEFAULT, ahnd);
>  		}
>=20
> +		if (data->dpms && diff.tv_sec =3D=3D mid_time && temp) {
> +			temp =3D false;
> +			check_dpms(data->output);
> +		}
> +
After DPMS cycle the first async flip can consume upto one vblank time. So =
this delay has to be considered while measuring the performance.

Thanks and Regards,
Arun R Murthy
-------------------
>  		frame++;
>  	} while (diff.tv_sec < RUN_TIME);
>=20
> @@ -1063,6 +1087,14 @@ igt_main
>  		data.hang =3D false;
>  	}
>=20
> +	igt_describe("Verify the async flip functionality after dpms cycle");
> +	igt_subtest_with_dynamic("async-flip-dpms") {
> +		test_init_ops(&data);
> +		data.dpms =3D true;
> +		run_test(&data, test_async_flip);
> +		data.dpms =3D false;
> +	}
> +
>  	igt_fixture {
>  		for (i =3D 0; i < NUM_FBS; i++) {
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
> --
> 2.43.0

