Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE24D148A1
	for <igt-dev@archiver.kernel.org>; Thu,  8 Jan 2026 05:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C67C10E68F;
	Thu,  8 Jan 2026 05:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aNQfCvna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F2810E68F
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jan 2026 05:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767850036; x=1799386036;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WbjlzizPOUsfRB314/dCQtepSpCVBDfRKAc/Lam1jyI=;
 b=aNQfCvna67XBaz/H50iDkaIH7gxoJG0rEJPhBo2lK8d5vRdAi6PRRtPd
 UdbownmERA6gAl6buNxHRPHljjHu0rLBbouvlZJe5PjiwXG/ZffUPiMgn
 CSsYDMXHq5QlD6Fp1+nh09ZHEe37DFYTq6QZvxrXi36orq39nU8W7ZZLf
 ZVk+vQ8qj6GV6Jo95AUDiL2lr8ZFBqEH5SwD1LhF4bdrbWiPnMS7+4ge3
 KTedaFLCXLIQTKzRrBHqPE4iJboKuu6mB6qHw4bvdrUmyUxjREMc/dTFO
 fQLIGN/Hc27E3ZfYFAtBX4pvlYPHm4MqDw0sejqOg7zXxfyKjJspQoiVo A==;
X-CSE-ConnectionGUID: raNhEpOyS3OBdamnAv4Nzg==
X-CSE-MsgGUID: 0KnxYHjRQbavbkksMykA7w==
X-IronPort-AV: E=McAfee;i="6800,10657,5688"; a="69125146"
X-IronPort-AV: E=Sophos;i="6.16,1,1744095600"; 
   d="scan'208";a="69125146"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:27:11 -0800
X-CSE-ConnectionGUID: TqFu7cNUTsibeYCNA6/vHw==
X-CSE-MsgGUID: KamBUJPGTymLkzuuQ9sC4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; d="scan'208";a="207589029"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 21:16:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:16:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 21:16:30 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 21:16:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDeM8iRBXpf99RfkP/ldD0iKbw5GpLj7MLLpQxDQYkHGEr5gD9faLX0LngtGcFIJL3AGyAAOxIXoO2nq0qTK1cKjdD8DO2mrPxh5ToCO7gyZIHNE9Uwx7slBYHu3d90lFzEUfCAQIoWzJuB7/u6Z6Ig2WUsm9DNGHwzLBUT7IZSehM5WtHYHVlNrdd64K1wQBvkiiqXII24OM8xvXHQz1et78GquZQ12A2SXrXyMq+qEg4Q7acJhUCpJ4r+rHEuk4+TB8Kb7M/V/qtaN7vCpe7pejyHjzGsi800HRs+L+swrpZr4AHisBzkyDinggWY2Ol52MSwMtT9OCynrklegbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tafqMSQtHa4FNXKwm0ZpOpPnw7nR3kKnH1P0mkXfd3I=;
 b=szAcfnMI8uyBs/asuwal8fjWhHeL5jqZOLPikLSTfNx1Mi7iZisOshSqmURvR1DKms1cKoMgferes6JTAGvzhKlsJOglQsj0HM1BoxpxZCRa4U8mQhFoG/slRDii90Xdw3iM4JZgrjkdAiUcpldYNtKRUyr2qlTsUvyP7VBXv8Y6Wv3MSdHZqb4LABLJ2ZENk4p4wiM/JeaskwIu247/1bZPfIP8h8xJ0HsNqkEPA0qYJtnjtftCsETS1rUwpWhhNvstz5S/QMjv1U38XIyuFz77TkYgvZqOgPn/I8joo9lP3C7DvXnSUnppnMIWfmGVYgx0qImAG0WTJOVRU6ar1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH8PR11MB6856.namprd11.prod.outlook.com
 (2603:10b6:510:22b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 05:16:28 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:16:28 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "S, Sowmiya" <sowmiya.s@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t v4 2/6] lib/igt_fb: Validate supported formats for
 crc calculation
Thread-Topic: [PATCH i-g-t v4 2/6] lib/igt_fb: Validate supported formats for
 crc calculation
Thread-Index: AQHcZDa2PL7OesLYB0yEn0mhgqAP9rVH8zhQ
Date: Thu, 8 Jan 2026 05:16:27 +0000
Message-ID: <DM3PPF208195D8D3B06588A052CC605834EE385A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251203094307.3187669-1-sowmiya.s@intel.com>
 <20251203094307.3187669-3-sowmiya.s@intel.com>
In-Reply-To: <20251203094307.3187669-3-sowmiya.s@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH8PR11MB6856:EE_
x-ms-office365-filtering-correlation-id: 087be3f3-7673-4ac2-ce51-08de4e7513a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?SijSuX7YMtuBSxU6G+b4SlP6uUNBGcdwNWtNbsbQB0/SyyDUFXzpOLMJ5NdJ?=
 =?us-ascii?Q?fInUc0G6loAQOgOEgzZvWFjJU6YsRQ+xkr+znb0jOFXFVXDOQaskdXOKnqSL?=
 =?us-ascii?Q?ad/3tWYuxdROk+UntptZKXIVzqPJbwPepf9kRhDXpqNImwKAhMadm7n4hSM1?=
 =?us-ascii?Q?61iuVEsCC+C7fmyQ/tygNor5IUQ1D0GpAhqGYhnJQcVNrg7QW3HUx9R9LoW5?=
 =?us-ascii?Q?g4kjWvw5O/rgzh53ylr+Osl9TVBaMHxj5sUAOGIr42kAibwuVErcHbKFOMds?=
 =?us-ascii?Q?ugKF8XbPUm7J7/+ZHs+Ji6IQPYQA59sWwRWd1yd0UZrqkyM1U3ZEdn7iwPJ9?=
 =?us-ascii?Q?3iIcWic1zxIk32vrafy+kyETPOKkUN5OPW5Csg+V1kwy3qYuYF5HinIhTjOE?=
 =?us-ascii?Q?tRuWsFEwxtuJpiM8ZsUayOaiHrA3S2kBARrCP4aOkzw+jNPYecCPVYqFG6FK?=
 =?us-ascii?Q?ooTfpaoCa7mdrF9ke1oBGqGM4f0hcObTKBNQpRGzqn3dwGyfZ86281ZkKvW7?=
 =?us-ascii?Q?8zCIwEdyupM0XLMMQSPngPRbmct2ypO1zOD7HVN/jLeYoeWsg4QgTlJi8oFa?=
 =?us-ascii?Q?oYrSj5bL5l25+JIdcTP8teJdsSvMP6dT/mQO0Vkqp9rc/RXaE+e4cYIveUpU?=
 =?us-ascii?Q?PivjFXXnt+4n4Ih/iwfgCXKTyj6c7mgoNgsJxjgm34r/6No+pJ1E1V58vjvw?=
 =?us-ascii?Q?0mM0pcIDYRKsNTpFkWYAF1wmFBm2HefeOqWzC5juAcgxG7/XVDyK0JwSJOgI?=
 =?us-ascii?Q?0/gHhCUG+LNayVlxq6qiVV4ikn9cKvf88VEPo/tE+xJPyI+oYq/ReFApwZB6?=
 =?us-ascii?Q?yk+KSHqA7nZizghjd7jrYexJcxSpV09Txz0MYzyXGdUKMvBSXzIb/MLZk5yk?=
 =?us-ascii?Q?40GwKJnhxFAuGUEigZjsmyQf2tNrx1tiNdQ92OONFH52oUbJ0Ff7z4CadwHO?=
 =?us-ascii?Q?37itBfmqlYKZ724TEbdaxjqVoI6DEUVk4QTMYcj2gqcaJH/TZmoEpXnNcSNf?=
 =?us-ascii?Q?g2oiOUsJYJ+Yw8Ij/u0nH4YuLRDC8ps02t85snQRuyd6xQ+CVs5oVZOKdjWm?=
 =?us-ascii?Q?aqA2lvG9dJ8H07FUNe/VVt9iVjWKBYwCTKDiCt0x43v1UOTogE0knOONv1Qz?=
 =?us-ascii?Q?EGE0KUTXxsmgZzrIqIOELE0XYQCT0igCGtVqOHuwhuE8T16hSrqnOs76knZI?=
 =?us-ascii?Q?qEN/5i7eCa+DGSmhMeJigPvf6+1aRtQeE4ZXpohplGUdjkxtl6XfuL3Z0xVC?=
 =?us-ascii?Q?QlTRNsL9OywxmVLyxgwNK/RRnt+G5dAGHGjX3ijSreuugesDDYBKtt2qDYi9?=
 =?us-ascii?Q?p+KmTwDiKD3RBjWOKpny9Y3s/kYmSKfO5m3v8HT2KlyCNGSQXuHeeUZ0npv2?=
 =?us-ascii?Q?aCkavy/AP+gPcVf82fQPqRLQa+u0eiPiAqXPnkBJFQL8TdDpQSYHhJ/CFPpK?=
 =?us-ascii?Q?9C4O82NZF6Rh5I9g8a1RySM6MpHJ/fn74NKHvEV3z0G7KKuAZ/PCEp+xOboX?=
 =?us-ascii?Q?o4yz37mMnA7LI7oDYgOqguwwHIGXveWbUOWK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wzm+toNIu1pbu3MxfMCkr4ypmcVy7YQLeO93qWoetxJh5e6K+6WL8XU7xPuJ?=
 =?us-ascii?Q?hhrigMbQw87sMK9gZ/BddBL+zrIs4SvwUtRUi+qfL52L1svb9kJu9KCk79Zh?=
 =?us-ascii?Q?WBfVY3GKsdzX8/hPAqevkGVRTGFllhNErVBhklDUrDE2PAXsujqAs9CE3SQD?=
 =?us-ascii?Q?7DFOQ+NQtxUgFaDbm0DGdqoKhdsOpyS1cpBnUxS75/J8DxZD3qAcwldpGarj?=
 =?us-ascii?Q?Umpz9eTkgYcuGxgdBSO5laY7am42Gdabe/Tkn+DabzztLb5m/G3EvhGgDo+n?=
 =?us-ascii?Q?fvhZSEG8YZVcr8exzsHDZT1HvFbSSTwQeDvTB7uzBr0zpwIPUYdfwGCy1cMM?=
 =?us-ascii?Q?zGUznGoJqv4dD6o1RMdm1Eef6NL4EVMX1YHw+x/iSJl2mAi/9uQhwOxxxyDR?=
 =?us-ascii?Q?aAswUOE9IYBH60VZDg/P01WFD2pgYfnOz9gfLO06COaNFJo5OLofSsRsTrHJ?=
 =?us-ascii?Q?8oB5Q0KFmjIPwC7Mw+9jZGvjdJG5tmAYuP++TN6Nlp0YNP/0rzFyOlhQsr/p?=
 =?us-ascii?Q?2XAvPZec2/HF9XxYbWlLN+3S1pu1gmIWU16arXrqqLfFmgQcMWK+KOf3fXHl?=
 =?us-ascii?Q?6mKWEdKT8mOw87aTaL6f3oa7aA67WzxrBlnKDDp+BKmZjpG98Lzfa/SWe76u?=
 =?us-ascii?Q?nRyzYJhHhRog+qnVY2uG5zrKJKoy+QZBp65T8tp76U1z1G+kODE+D/i4V/p/?=
 =?us-ascii?Q?5pfLZUkFKt4vAyLHUsKWhoXnPbtZKjVbr4u+gDJyNTAQ/QZ8ux/uOVqU4gaj?=
 =?us-ascii?Q?nw0vcrKj07604vdBnyoiugY8amMvprsX84aVNCGvs8BDS35ROTUrj0Gm8Tg6?=
 =?us-ascii?Q?rDf3D9chLKdxjDmRxVgnNiLfbFgAnVcHcX3IQ8FqwOOMdnylwDhHdovWw1VO?=
 =?us-ascii?Q?uQ5pDB3Q1Te736l+osxiVX7fRNSY/bHmSLYDEIXxWJxZg9Fdk6yuuXqtIEGf?=
 =?us-ascii?Q?sxhtd7o4MSlfR/G441qXsdddcYDUB+hZP5fVYvJFQiCSh8FZsO1XGvDpVnP9?=
 =?us-ascii?Q?g38S7TIzQOCCNcduwBuAAUOJbDDRZr2qlJbOQR6KdcSZZsy83KIqaQYSYTg5?=
 =?us-ascii?Q?LdhifgQI1KxI3V9vqm8iwiAruP7fqdRC8Tw5g40NEor0Rj2nZ4Dg/DrkXBhQ?=
 =?us-ascii?Q?rPvMTNyDu/BwnhPy1xYhM5j9ET8MgVzFbfTRcAxsx+n9NJVQhgT4JJiNQo4Q?=
 =?us-ascii?Q?86GhQwtZb01fJPW/A1JfgYY76mDvrgCFQm6VzsHvISodBoEky5cCDf9LWl0D?=
 =?us-ascii?Q?P6ckD8nyi0sdNL7TGA/edi4vSkqIvYpdajYkFnqITwCN0bhgLUsVz0wtY4AV?=
 =?us-ascii?Q?y3v/kaEWyRxkQh3Thmgo5Pr6GCQ/fbDuiqJ4c3kCmLlqY5XLdI1MvduMQB3C?=
 =?us-ascii?Q?HvrS8+LzriySJq4VmPC4lcEMZGeZ4nLZbw7Yp9BufLvbT4AyZieVqo7jDED6?=
 =?us-ascii?Q?YWtIHpMWQ9nz0fXKVpOVGjg4JK/J3smSRNDHImoHqS37EY/j6E0WWhxvpElt?=
 =?us-ascii?Q?6iVg+PeKEVfPAVa/hB42M3sYcZdCoY5KwXrtcvyKk3KzQmubME5uAzhHSqqC?=
 =?us-ascii?Q?YFFIgc7Y9xdnq7NOWlMpMzJi0t3nL6geUbhWZk63ih3xb28Yu0L97PkyLGLJ?=
 =?us-ascii?Q?jg/NjW7WYlzYI2puW99HciV/FK3mAh/S77WUCpvs2k97PQ6oDO+0wsvqIQID?=
 =?us-ascii?Q?DVhLBwS90kfjsbGiNu+CyUfDgILN6kf2bDwJC7EC7R1RmdvKrv356LkVc6uv?=
 =?us-ascii?Q?Zu7YhsoI+Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 087be3f3-7673-4ac2-ce51-08de4e7513a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 05:16:28.0136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dsfwwd3T/LWnq8DV50LYyzR4BKJLVhhN6KPNaYcG5lZBrn5wDfhFQDYzadniy53/XBJjxFZTOSd4UsW1XtDD/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6856
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
> From: S, Sowmiya <sowmiya.s@intel.com>
> Sent: Wednesday, December 3, 2025 3:13 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Sharma, Swati2 <swati2.sharma@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; S, Sowmiya <sowmiya.s@intel.com>
> Subject: [PATCH i-g-t v4 2/6] lib/igt_fb: Validate supported formats for =
crc
> calculation
>=20
> Add logic to verify that provided formats are supported before proceeding
> with test execution for crc calculation
>=20
> v4: Remove BGR2101010 format verification from
>     fnv1a function

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> ---
>  lib/igt_fb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c index 0a8299d26..80695a0d8 10064=
4
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -5000,7 +5000,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc=
_t
> *crc)
>  	if (fb->num_planes !=3D 1)
>  		return -EINVAL;
>=20
> -	if (fb->drm_format !=3D DRM_FORMAT_XRGB8888 && fb->drm_format
> !=3D DRM_FORMAT_XRGB2101010)
> +	if (fb->drm_format !=3D DRM_FORMAT_XRGB8888 && fb->drm_format
> !=3D DRM_FORMAT_XRGB2101010 &&
> +	    fb->drm_format !=3D DRM_FORMAT_XBGR8888)
>  		return -EINVAL;
>=20
>  	ptr =3D igt_fb_map_buffer(fb->fd, fb);
> @@ -5027,7 +5028,8 @@ int igt_fb_get_fnv1a_crc(struct igt_fb *fb, igt_crc=
_t
> *crc)
>  		for (x =3D 0; x < fb->width; x++) {
>  			uint32_t pixel =3D le32_to_cpu(line[x]);
>=20
> -			if (fb->drm_format =3D=3D DRM_FORMAT_XRGB8888)
> +			if (fb->drm_format =3D=3D DRM_FORMAT_XRGB8888 ||
> +			    fb->drm_format =3D=3D DRM_FORMAT_XBGR8888)
>  				pixel &=3D 0x00ffffff;
>  			else if (fb->drm_format =3D=3D
> DRM_FORMAT_XRGB2101010)
>  				pixel &=3D 0x3fffffff;
> --
> 2.43.0

