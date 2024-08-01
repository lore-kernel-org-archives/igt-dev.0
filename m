Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA747C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 12:20:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6214610E14B;
	Thu,  1 Aug 2024 12:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjHfRX4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306B310E14B
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 12:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722514855; x=1754050855;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B7Imfg1lJHBz/sZR8bOWN3U9OadWcWxA6r7VTXEsGHw=;
 b=NjHfRX4gePofjjygSXmhU9E62LWs5S/JknV3AMCDyFGtONKVc4RJlt/Y
 099HdlLNrKJvDFHcdbP7oc7GtlWdXk9JE1hkLpQGcMCadptmIZ14hr5PF
 DUJX6M9ohSHuea08TEiAb2xBAbUeWt65Q8Cuz0gg1ZSqUvPTf9Tkdj4P4
 cetCvf75CrY4Me1e3XbYOzQrafFkHFBpfHxuQD1KgvUgT2luFtwZ5PmWe
 gqbS9/ustSbEDWR9i3t1G2uityGNGt15CAkQY2i6I8F8uFa2eBovo8NeK
 65FWULTexRoVqcUB3ArrIRjVhKHvrsFhDBmiAepjCSkZQlh0ZKyShnpHT Q==;
X-CSE-ConnectionGUID: eYl0zm3OQUqq3icKMJ/N/Q==
X-CSE-MsgGUID: ++TqZwI+RkyU+qfUexPg2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="24323379"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24323379"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 05:20:54 -0700
X-CSE-ConnectionGUID: 9O3IULxlT3CRNnvjmrpa0A==
X-CSE-MsgGUID: 5VVsrQCnTwaTDof0Qk2Ohg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59135536"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Aug 2024 05:20:53 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 1 Aug 2024 05:20:54 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 1 Aug 2024 05:20:54 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 1 Aug 2024 05:20:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rd7ATwU6GFS5wPXYJveq6AWzgsVX5LyMROGRbEXyWg3Zui6r4ptDZM5j8RfEo2yJy9YR9639w4SiawasCnDKspALJUFNEoS2w2TFsbvIZk+N4CRaWtwSPMrPJt+mOTxAq+xW+5WBjS7PApn+c5wfSwShhV/Q8OPECtcS3mwfC1/Dmu8icJIQOyZ1CCS4Xf+BOzSdKPzWGubBIX6CYQBbaHtZb8XzMeSIJK8gVIa8lbCAZxZTUp61CMDnTP0lcnSGo8HiWgpLvQ2WX+nKTRBbHw20CRpIkxD2qdrSRo2DgwaMOw7EbJ5pZEQ8SqbdAsrYLeeWyz0Xf4ZGwU6nSDrzqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=86kJVDLrf+bOg6lbREIJOG8rctqnfwWvpj2XrDOeqME=;
 b=BTcaeWsmxWK/wXAEM+rNO/BdTakF2n1I59FShbN0JI8wJKjsBnZQOOl9/rOHo9F9ySfORzhvqCXQttUqrlz1yNVlfanN8Y17rJPXWr/zWVJTV3pOoobviYvMDaedFDLYxwPA3rPZE9jxKJN+kdmQ4qCjEFmGPcKjWIRej3U7QFKFSXPgQinu7LoiwowSxMFQewbyuf1bY7YHczRHDFgMQkF4fnL6sECQRpFoRnxGmljq4lHn7Ts9dbJHNwZ6T/zZZbZvZCRQ63dk+3hRETRrC8L0g6bpo2Ila4dY/W8sqL5FkR3E9Px9A30EkCXEN86CS44udACqqqrp7D03p2D0FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB7642.namprd11.prod.outlook.com (2603:10b6:510:27d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7807.27; Thu, 1 Aug 2024 12:20:50 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.7828.023; Thu, 1 Aug 2024
 12:20:50 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Grzegorzek, Dominik"
 <dominik.grzegorzek@intel.com>, "Patelczyk, Maciej"
 <maciej.patelczyk@intel.com>, "Sikora, Pawel" <pawel.sikora@intel.com>,
 "Hajda, Andrzej" <andrzej.hajda@intel.com>, Kolanupaka Naveena
 <kolanupaka.naveena@intel.com>, "Kuoppala, Mika" <mika.kuoppala@intel.com>,
 "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
Subject: RE: [PATCH i-g-t v2 18/66] tests/xe_eudebug: Add vm open/pread/pwrite
 basic tests
Thread-Topic: [PATCH i-g-t v2 18/66] tests/xe_eudebug: Add vm
 open/pread/pwrite basic tests
Thread-Index: AQHa4nZHQWAO+bL7r0uBrpYZcctMqbISVPgw
Date: Thu, 1 Aug 2024 12:20:50 +0000
Message-ID: <DS0PR11MB726476E7A65B4B62B0BF632AD9B22@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20240730114523.334156-1-christoph.manszewski@intel.com>
 <20240730114523.334156-19-christoph.manszewski@intel.com>
In-Reply-To: <20240730114523.334156-19-christoph.manszewski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB7642:EE_
x-ms-office365-filtering-correlation-id: ba4faeb9-6365-4beb-8782-08dcb22461b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VyLjVUyYkx8o2YTZRiqdvr4R24ZBFpK75MAo2/bkHHua0uO7+0Dkw1UUuxjc?=
 =?us-ascii?Q?2LgEgrk7lCkp8kFRkfiu+WCDArdXGe02ttgqkNxWmVu5fWpoaJCkChDOvpz6?=
 =?us-ascii?Q?PUS01A3T8xZ2BGKqnlj+A39pgh4NG35hcSUGLyUAUT1ew3Va99GWOYMLidcQ?=
 =?us-ascii?Q?4tpuop9L4g9fEkzG2lf1tJGirXVrjm8BFgKf6mdZoKnvsEpssQL5ExGo0q2P?=
 =?us-ascii?Q?FRfd+tbbSQhayvQww5AokOiD66RTaydvk2MHWk5w7xzK13+rxwKh9bpLyXFX?=
 =?us-ascii?Q?ootylAlagLNJOyMn+jXP/ft5E65n0SM9OyFayhBgR541JVmtvatR2VbZS2uj?=
 =?us-ascii?Q?rusarQSmimbA+zZSaSsLOl/BBKINLNzSy/SaF55CSilKkd/lWo0itPy5dCn0?=
 =?us-ascii?Q?TCy4Lm3Lgs+tO081vlDL8+SN+Xd0uw38K0NUsVVM7cxXp8jqTm11fL96JNEA?=
 =?us-ascii?Q?Wv6p/IAdSs2xCbplAAUljhVgeBjwjRXNvtFmLDY2H1v4VBnALO8VorLqKPjZ?=
 =?us-ascii?Q?sgPxX4ug2Eosc3x/NJGpJ1/oTKzT6OEvR5NJDcgLvvuyYxdNhljv0VkEGRO3?=
 =?us-ascii?Q?iJuNC7uppuVYxn81ZKHgaDPQR2tOrrTfWkYjWgDQmLBqq9GPeifU65sTN9f+?=
 =?us-ascii?Q?PNw5ggifysehf91x9DZXRhCvWPl+BCkpukBO9YEEjl1S0pgvWlKMYn/2Yj9B?=
 =?us-ascii?Q?hgWv1zyXjqI/irWzUk6jNnIpSMreHroA6BugZDJaBxIYZmAYZi5jz1BdbS5g?=
 =?us-ascii?Q?sNAVj53bXGD4XniHvJE/89WtUrnG2K0dWNsj3d4OTsdOHguy7YwlS/HN1IrA?=
 =?us-ascii?Q?0uuIQyH5yGt9vxkuGk+JbOnHjQ7oBkIAPHigbr/FO1qheq/v5ns0QPd74AAH?=
 =?us-ascii?Q?ShJ1WzFMFM5PEai5QEnQ3LCNBjmOh3fqVre9lB0CWROVVZQR5ooeV8afopQr?=
 =?us-ascii?Q?v1FqY+0zds9GrbZZZX7UE52cL/QgHZqp6erbbBNKTTM5IkvHu7wZl94vZw2N?=
 =?us-ascii?Q?//mbpzbwxqHvcdz5b6xXpLtiM3no+KP6ILUytQCkki/5T5H24xhcPtdTmM5H?=
 =?us-ascii?Q?SNkJuyWndCMy+n51d9SlFnR5NRZV1La9+ehoPeSGuxSq8KI8rQta1sdxJWAl?=
 =?us-ascii?Q?GpHiYv/3Q0xUvbvrYIxVy+0bjAZ3YE2dSYMPp22wh41YsmzCPBzdzZ5wCDMM?=
 =?us-ascii?Q?HChPZ3xBv1mLS9QIi4VZD0EoryjaMh5GXqegMOLv5YqJGXdBEmPTzc5WDiDp?=
 =?us-ascii?Q?nH4tJ/X05SwmjY3/0bD45fj2m4/mSQpe70r5k2zc1tmbTeko7+txj4D0r9F9?=
 =?us-ascii?Q?U/sRMXY+FjLQ96dKevOwIj1UiChFq6iByWi9fSt44uaFvNwsVZ8nNbJKww/f?=
 =?us-ascii?Q?MgpIdE2w5LkVMFl2nPOPo2/W5A6ZWKQneXTgBf3wjf9XhKmWtg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D2U0JAaS+coN59snGyAcp4LUqUXcQ9MpA8TjyKHEyVHbb0LyfsVD6BGH0Fh2?=
 =?us-ascii?Q?Ov6M5qQdsA7WiwZkxcpZdzgWsBfWVd47MGx6r8CPSyH9tPX8MWp7/CXBsH+F?=
 =?us-ascii?Q?Imy7RG2sYUu31MSJrXDJk3zKUymIdG46t20c8KkYj0R2XPkeUch4mQFouvSQ?=
 =?us-ascii?Q?aEfzVbH+Zp0RlDaxpLDN9Vm8K9Zappzs54C+eI8bFJAzWK0CK7nzELi6SCDE?=
 =?us-ascii?Q?zsWaLTC4/kzKezZKPcKzKa2ogQDvNt75HDX3oFaloFFtLGqx4CiN9isH7kDi?=
 =?us-ascii?Q?xijZj3QhsGTFExCHH/7hJpIHYLFS0zxhbux2FdNkZggzetN0xNByVxnBYCwk?=
 =?us-ascii?Q?G7idgmSOcvly46bwRMfOqWzyKEsNszYSLyPvoJ+p+/wv7RMWO/D5YojUsKnH?=
 =?us-ascii?Q?OQCzFzWA4cj8Km6qTak7h6svVGNUAJstzJOAGRvGAUXhkZB1jubllcY5jCG+?=
 =?us-ascii?Q?7N7HdvYP7ZR8KXfhKISRD6OYICnZ6dSRflWyXmkLFucGlKZIN7CODhdJ2dti?=
 =?us-ascii?Q?lS1PpuFa5OjxwDjxo0kUvH/bneSj3IgZCSV2hJFcsZLcT1prRc7BcGb6yRUZ?=
 =?us-ascii?Q?D+E9bOdziwOrWYTZqDa5ffgTRbEOOKRoFLygL/zyl8uZmZJJvhbUuKGKi48N?=
 =?us-ascii?Q?5reXtKpJF6jVQkZHbfHvdG/jLBJsEQv8qfXPkazb2lHrSI5djOeUq8Iyw3Uy?=
 =?us-ascii?Q?JGDLDUAGzH51hXC8HlBjtHorsQ0KgDDj0oh6PyessGnwKMQXFELGOqmhSn3w?=
 =?us-ascii?Q?Qlo86OCe4N3yuPC/BQ9s+xAoiPv30qr+QxEDOVf2VRSxktPfNCRdmPQyNvo6?=
 =?us-ascii?Q?wOuam4jh44ITtfuW3UIhVnqSm3b2Q4+AjydnlX4qbplSBg5ymQH+BlkXaRkH?=
 =?us-ascii?Q?KcQz1SB9PFONTsAbBEtBYK0IvzDG6bk61eWmvCvQyf/ttQVO9nyMpzEjrJMd?=
 =?us-ascii?Q?hOl6Uo08RlEMMnt6ouwLOE+D2Zin59z17y+g/kD9NC478W3nYlmCM8+NODQg?=
 =?us-ascii?Q?GIreNIjoOr0WXF22VPLBakiAeLuHYz3ByLNIXaHigumGEogLicTdSETG3/rd?=
 =?us-ascii?Q?b/d9fY2XkBD2A2G/H5udK26hCzaZiKuSOJWLQG4Cbt85x/YIt+ZrYVadA+2f?=
 =?us-ascii?Q?GVuyW+mTiBcUYCKHEzrSSmHbw2dktavJhF4cgDsw+mRmoOOnmGIbQbT1nReb?=
 =?us-ascii?Q?HAQAxtLyKP3103SRD6eqDySmeQbCO3irnTbKHG6Djb6Dkiu5QDgQm3ZMnyA3?=
 =?us-ascii?Q?GgXqNtBmULTe7+rDq2yQMkmurPBLgXJf8nMvJ0Pu4FBMEVwi5IC9+HH3jm97?=
 =?us-ascii?Q?FxI3CJXTjlNIq99BRPgkuz93Y7sFApNd/sdY9H/j9rAXqmhrW3qiIKPeb+wz?=
 =?us-ascii?Q?zRhJ/z2Ei/csjfD1mN2sN7k/+IADw7IxrUxlTPdxDbnx1lJkloxgTKTf/pyZ?=
 =?us-ascii?Q?vm4iFE8/sGhd0FZ9DZTt3Q77VwLLzlELiIvWXKzEm0fc4bw0OaRmW+iexvpm?=
 =?us-ascii?Q?a2vZSTvN/TJimjLQDpQvo162dxcooO7P8p4THkbPu1cRI87tDNNNEI7H2e7q?=
 =?us-ascii?Q?/tiGujumRDnYcROYrcXsFdFOACb25HSH9qvFb3Aq5ByQQaoElzAnO6AWnFl7?=
 =?us-ascii?Q?AwaIjHCf1HGGybTHVHb+yS4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba4faeb9-6365-4beb-8782-08dcb22461b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Aug 2024 12:20:50.7133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: My8d3+eeOIJxxhnE5KDDaIQRHRlIT5EYMTSBZj78DcI8zY5U6nAet4Y5ZrB9hbwxQepiqlxfEypt9NyaW8u/vmC9c9qJDYIBGykrAtatnrLtjZ/grv+O1PyUi4TFIR3w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7642
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

Comment below.

Thanks,
Dominik Karol

> -----Original Message-----
> From: Manszewski, Christoph <christoph.manszewski@intel.com>
> Sent: Tuesday, July 30, 2024 1:45 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; Kamil
> Konieczny <kamil.konieczny@linux.intel.com>; Grzegorzek, Dominik
> <dominik.grzegorzek@intel.com>; Patelczyk, Maciej
> <maciej.patelczyk@intel.com>; Piatkowski, Dominik Karol
> <dominik.karol.piatkowski@intel.com>; Sikora, Pawel
> <pawel.sikora@intel.com>; Hajda, Andrzej <andrzej.hajda@intel.com>;
> Kolanupaka Naveena <kolanupaka.naveena@intel.com>; Kuoppala, Mika
> <mika.kuoppala@intel.com>; Mun, Gwan-gyeong <gwan-
> gyeong.mun@intel.com>
> Subject: [PATCH i-g-t v2 18/66] tests/xe_eudebug: Add vm
> open/pread/pwrite basic tests
>=20
> From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>=20
> Add basic tests for opening, writing and reading into client's vm.
>=20
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> ---
>  tests/intel/xe_eudebug.c | 276
> +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 276 insertions(+)
>=20
> diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c index
> 9497e73e9..5080fdf5b 100644
> --- a/tests/intel/xe_eudebug.c
> +++ b/tests/intel/xe_eudebug.c
> @@ -16,9 +16,139 @@
>  #include <sys/ioctl.h>
>=20
>  #include "igt.h"
> +#include "intel_pat.h"
> +#include "lib/igt_syncobj.h"
>  #include "xe/xe_eudebug.h"
> +#include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>=20
> +#define BO_ADDR 0x1a0000
> +#define BO_ITEMS 4096
> +#define MIN_BO_SIZE (BO_ITEMS * sizeof(uint64_t))
> +
> +struct bind_list {
> +	int fd;
> +	uint32_t vm;
> +	uint32_t *bo;
> +	struct drm_xe_vm_bind_op *bind_ops;
> +	unsigned int n;
> +};
> +
> +static void bo_prime(int fd, uint32_t bo, const uint64_t addr, const
> +uint64_t size) {
> +	uint64_t *d;
> +	uint64_t i;
> +
> +	d =3D xe_bo_map(fd, bo, size);
> +	igt_assert(d);
> +
> +	for (i =3D 0; i < size/sizeof(*d); i++)
> +		d[i] =3D addr + i;
> +
> +	munmap(d, size);
> +}
> +
> +static void bo_check(int fd, uint32_t bo, const uint64_t addr, const
> +uint64_t size) {
> +	uint64_t *d;
> +	uint64_t i;
> +
> +	d =3D xe_bo_map(fd, bo, size);
> +	igt_assert(d);
> +
> +	for (i =3D 0; i < size/sizeof(*d); i++)
> +		igt_assert_eq(d[i], addr + i + 1);
> +
> +	munmap(d, size);
> +}
> +
> +static uint32_t *vm_create_objects(int fd, uint32_t bo_placement, uint32=
_t
> vm, unsigned int size,
> +				   unsigned int n)
> +{
> +	uint32_t *bo;
> +	unsigned int i;
> +
> +	bo =3D calloc(n, sizeof(*bo));
> +	igt_assert(bo);
> +
> +	for (i =3D 0; i < n; i++) {
> +		bo[i] =3D xe_bo_create(fd, vm, size, bo_placement, 0);
> +		igt_assert(bo[i]);
> +	}
> +
> +	return bo;
> +}
> +
> +static struct bind_list *create_bind_list(int fd, uint32_t bo_placement,
> +					  uint32_t vm, unsigned int n)
> +{
> +	const unsigned int bo_size =3D max_t(bo_size,
> xe_get_default_alignment(fd), MIN_BO_SIZE);
> +	struct bind_list *bl;
> +	unsigned int i;
> +
> +	bl =3D malloc(sizeof(*bl));
> +	bl->fd =3D fd;
> +	bl->vm =3D vm;
> +	bl->bo =3D vm_create_objects(fd, bo_placement, vm, bo_size, n);
> +	bl->n =3D n;
> +	bl->bind_ops =3D calloc(n, sizeof(*bl->bind_ops));
> +	igt_assert(bl->bind_ops);
> +
> +	for (i =3D 0; i < n; i++) {
> +		struct drm_xe_vm_bind_op *o =3D &bl->bind_ops[i];
> +
> +		o->range =3D bo_size;
> +		o->addr =3D BO_ADDR + 2 * i * bo_size;
> +		o->flags =3D 0;
> +		o->pat_index =3D intel_get_pat_idx_wb(fd);
> +		o->prefetch_mem_region_instance =3D 0;
> +		o->reserved[0] =3D 0;
> +		o->reserved[1] =3D 0;
> +	}
> +
> +	for (i =3D 0; i < bl->n; i++) {
> +		struct drm_xe_vm_bind_op *o =3D &bl->bind_ops[i];
> +
> +		igt_debug("bo %d: addr 0x%llx, range 0x%llx\n", i, o->addr, o-
> >range);
> +		bo_prime(fd, bl->bo[i], o->addr, o->range);
> +	}
> +
> +	return bl;
> +}
> +
> +static void do_bind_list(struct xe_eudebug_client *c,
> +			 struct bind_list *bl, struct drm_xe_sync *sync) {
> +	int i;
> +	uint64_t ref_seqno =3D 0, op_ref_seqno =3D 0;
> +
> +	xe_vm_bind_array(bl->fd, bl->vm, 0, bl->bind_ops, bl->n, sync, sync ?
> 1 : 0);
> +	xe_eudebug_client_vm_bind_event(c,
> DRM_XE_EUDEBUG_EVENT_STATE_CHANGE,
> +					bl->fd, bl->vm, 0, bl->n, &ref_seqno);
> +	for (i =3D 0; i < bl->n; i++)
> +		xe_eudebug_client_vm_bind_op_event(c,
> DRM_XE_EUDEBUG_EVENT_CREATE,
> +						   ref_seqno,
> +						   &op_ref_seqno,
> +						   bl->bind_ops[i].addr,
> +						   bl->bind_ops[i].range,
> +						   0);
> +
> +	if (sync)
> +		igt_assert(syncobj_wait(bl->fd, &sync->handle, 1,
> INT64_MAX, 0,
> +NULL)); }
> +
> +static void check_bind_list(struct bind_list *bl) {
> +	unsigned int i;
> +
> +	for (i =3D 0; i < bl->n; i++) {
> +		igt_debug("%d: checking 0x%llx (%lld)\n",
> +			  i, bl->bind_ops[i].addr, bl->bind_ops[i].addr);
> +		bo_check(bl->fd, bl->bo[i], bl->bind_ops[i].addr,
> +			 bl->bind_ops[i].range);
> +	}
> +}
> +
>  #define CREATE_VMS	(1 << 0)
>  #define CREATE_EXEC_QUEUES	(1 << 1)
>  static void run_basic_client(struct xe_eudebug_client *c) @@ -613,6
> +743,149 @@ static void test_empty_discovery(int fd, unsigned int flags, =
int
> clients)
>  	}
>  }
>=20
> +typedef void (*client_run_t)(struct xe_eudebug_client *);
> +
> +static void test_client_with_trigger(int fd, unsigned int flags, int cou=
nt,
> +				     client_run_t client_fn, int type,
> +				     xe_eudebug_trigger_fn trigger_fn,
> +				     struct drm_xe_engine_class_instance *hwe,
> +				     bool match_opposite, uint32_t
> event_filter) {
> +	struct xe_eudebug_session **s;
> +	int i;
> +
> +	s =3D calloc(count, sizeof(*s));
> +
> +	igt_assert(s);
> +
> +	for (i =3D 0; i < count; i++)
> +		s[i] =3D xe_eudebug_session_create(fd, client_fn, flags, hwe);
> +
> +	if (trigger_fn)
> +		for (i =3D 0; i < count; i++)
> +			xe_eudebug_debugger_add_trigger(s[i]->d, type,
> trigger_fn);
> +
> +	for (i =3D 0; i < count; i++)
> +		xe_eudebug_session_run(s[i]);
> +
> +	for (i =3D 0; i < count; i++)
> +		xe_eudebug_session_check(s[i], match_opposite,
> event_filter);
> +
> +	for (i =3D 0; i < count; i++)
> +		xe_eudebug_session_destroy(s[i]);
> +}
> +
> +static void vm_access_client(struct xe_eudebug_client *c) {
> +	struct drm_xe_sync sync =3D {
> +		.flags =3D DRM_XE_SYNC_TYPE_SYNCOBJ |
> DRM_XE_SYNC_FLAG_SIGNAL, };
> +	struct drm_xe_engine_class_instance *hwe =3D c->ptr;
> +	struct bind_list *bl;
> +	uint32_t vm;
> +	int fd, i;
> +
> +	igt_debug("Using %s\n", xe_engine_class_string(hwe->engine_class));
> +
> +	fd =3D xe_eudebug_client_open_driver(c);
> +	xe_device_get(fd);
> +
> +	vm =3D xe_eudebug_client_vm_create(c, fd, 0, 0);
> +
> +	bl =3D create_bind_list(fd, vram_if_possible(fd, hwe->gt_id), vm, 4);
> +	sync.handle =3D syncobj_create(bl->fd, 0);
> +	do_bind_list(c, bl, &sync);
> +	syncobj_destroy(bl->fd, sync.handle);
> +
> +	for (i =3D 0; i < bl->n; i++)
> +		xe_eudebug_client_wait_stage(c, bl->bind_ops[i].addr);
> +
> +	check_bind_list(bl);
> +
> +	xe_eudebug_client_vm_destroy(c, fd, vm);
> +
> +	xe_device_put(fd);
> +	xe_eudebug_client_close_driver(c, fd); }
> +
> +static void debugger_test_vma(struct xe_eudebug_debugger *d,
> +			      uint64_t client_handle,
> +			      uint64_t vm_handle,
> +			      uint64_t va_start,
> +			      uint64_t va_length)
> +{
> +	struct drm_xe_eudebug_vm_open vo =3D { 0, };
> +	uint64_t *v;
> +	uint64_t items =3D va_length / sizeof(uint64_t);
> +	int fd;
> +	int r, i;
> +
> +	v =3D malloc(va_length);
> +	igt_assert(v);
> +
> +	vo.client_handle =3D client_handle;
> +	vo.vm_handle =3D vm_handle;
> +
> +	fd =3D igt_ioctl(d->fd, DRM_XE_EUDEBUG_IOCTL_VM_OPEN, &vo);
> +	igt_assert_lte(0, fd);
> +
> +	r =3D pread(fd, v, va_length, va_start);
> +	igt_assert_eq(r, va_length);
> +
> +	for (i =3D 0; i < items; i++)
> +		igt_assert_eq(v[i], va_start + i);
> +
> +	for (i =3D 0; i < items; i++)
> +		v[i] =3D va_start + i + 1;
> +
> +	r =3D pwrite(fd, v, va_length, va_start);
> +	igt_assert_eq(r, va_length);
> +
> +	fsync(fd);
> +
> +	close(fd);
> +	free(v);
> +}
> +
> +static void vm_trigger(struct xe_eudebug_debugger *d,
> +		       struct drm_xe_eudebug_event *e) {
> +	struct drm_xe_eudebug_event_vm_bind_op *eo =3D (void *)e;
> +
> +	if (e->flags & DRM_XE_EUDEBUG_EVENT_CREATE) {
> +		struct drm_xe_eudebug_event_vm_bind *eb;
> +
> +		igt_debug("vm bind op event received with ref %lld, addr
> 0x%llx, range 0x%llx\n",
> +			  eo->vm_bind_ref_seqno,
> +			  eo->addr,
> +			  eo->range);
> +
> +		eb =3D (struct drm_xe_eudebug_event_vm_bind *)
> +			xe_eudebug_event_log_find_seqno(d->log, eo-
> >vm_bind_ref_seqno);
> +		igt_assert(eb);
> +
> +		debugger_test_vma(d, eb->client_handle, eb->vm_handle,
> +				  eo->addr, eo->range);
> +		xe_eudebug_debugger_signal_stage(d, eo->addr);
> +	}
> +}
> +
> +/**
> + * SUBTEST: basic-vm-access
> + * Description:
> + *      Exercise XE_EUDEBG_VM_OPEN with pread and pwrite into the vm fd

Typo: XE_EUDEBUG_VM_OPEN

> + */
> +static void test_vm_access(int fd, unsigned int flags, int num_clients)
> +{
> +	struct drm_xe_engine_class_instance *hwe;
> +
> +	xe_for_each_engine(fd, hwe)
> +		test_client_with_trigger(fd, flags, num_clients,
> +					 vm_access_client,
> +
> DRM_XE_EUDEBUG_EVENT_VM_BIND_OP,
> +					 vm_trigger, hwe,
> +					 false,
> XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -633,6 +906,9 @@ igt_main
>  	igt_subtest("basic-client")
>  		test_basic_sessions(fd, 0, 1);
>=20
> +	igt_subtest("basic-vm-access")
> +		test_vm_access(fd, 0, 1);
> +
>  	igt_subtest("multiple-sessions")
>  		test_basic_sessions(fd, CREATE_VMS |
> CREATE_EXEC_QUEUES, 4);
>=20
> --
> 2.34.1

