Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A62E8C3ABC5
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 05:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5638E10E0B0;
	Wed, 14 May 2025 05:25:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DXRHsXGj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC9610E0B0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 05:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747200348; x=1778736348;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=JXtvg9Nhao9lEQE10pok5g9vPqhw6XQxLFdC3uSkRBs=;
 b=DXRHsXGjZ2Mb+1OVKDnU51UFVvVnIrFnvmlAEyXVzNL9EpCTonPg88WJ
 h2Rbrz+2ciMwffyyQeUB0zk+jvsq4MW0Asn5puhbTQzaGUfV9Uv/uN5xE
 3pEdtXPPajZgV4vqYm0KXyOo8UpWt/h9aYxwq1ORy3LOHq3hLx8zJcAiK
 API0WO0ES7oeVroaS6ayV7RDssBLzXpg6KgaR/gAy8/e4RSiyOR8p5H/X
 KaN154y7WeUDn6pp7wxk1X6EVBKcTMrhfX/sGNkayGy3WOPk9u3O4IN2j
 uY7OKNBN9Ou6Ivrc+0yJfTGFBHAOR5H91/Ti1gHdc+pdLC+s03/e7mh5X g==;
X-CSE-ConnectionGUID: vwtrSXiTTIaLU/jGdYMa2g==
X-CSE-MsgGUID: 0LsK20LBQ6irWCX9KJVh9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49241450"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="49241450"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:25:47 -0700
X-CSE-ConnectionGUID: VFoLDIWQT5uOj8c30xm7MQ==
X-CSE-MsgGUID: dUgTHLvkReOXtU0Zxjvz+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; d="scan'208";a="143038896"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 22:25:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 22:25:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 22:25:46 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 22:25:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NNzzg7z8R2cJZgRQo4odZ84jDxeDq9Nn+mFNGzcXgm0bkjK8AA+3g+tcutmKhRQoh2rNP9ZIZy9LvZtKXt36A3t5Y3vLZMZDMVW+E03q2BQfMdfg7UMoprINcTXPGw/sukNlT0zSfGIyQv7sX7cH4WnxQDImytNLzPj+pCwa5s163Lldypm6QzFgPZgH5NaxDt4RMcjHQut2TUvVW926p3i6UYvDjULLZvkwa0xtZexEJT2tCAI6fE4dR/x0jszOTvrEgAWtKJIrw9RsGe3muofqKGyYfeUyAFW0nXAn+bu+lZ4tYythUWprVX4cvoJrY8WXEANH8KJFV2r+V1vipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQDqGgfWq4B3Mz/HlmhnURSo5AEyOYOXrm2lN5sQh/Y=;
 b=npV1+Lt3FQeXklg5g3fzFbaSThUuO27gICFqXPf48756vz0+RJT2X8UKucI4DexINnnf7dsxYZPfNDXWTB/uD4kLXjATuo6rS0QW2pN3zlj+SkXdxXPUUTpH7ocRYzJg3P7Ke/Wp4EK2RsoeWpP+9iZVL2TvkCIrB6go3INYj+8+S9FZWygBU1Dxpf2kmCdDyw9ADtpl6GC6lBP3ZUbp7APQ0J51dicfA9Di4zSIQxEolXqjnG3TdHbS72Yd3SS1EsyiOvIzMEVau7Jq/a+xicke/xlZVSLefnGN3ZVnmxZrNmjs2MsLONpr8VwWkCnhIT3bl5aU5xQ2VkzaN5cctg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5754.namprd11.prod.outlook.com (2603:10b6:610:ec::21)
 by DM6PR11MB4705.namprd11.prod.outlook.com (2603:10b6:5:2a9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 05:25:24 +0000
Received: from CH0PR11MB5754.namprd11.prod.outlook.com
 ([fe80::1701:75e9:8a93:efbe]) by CH0PR11MB5754.namprd11.prod.outlook.com
 ([fe80::1701:75e9:8a93:efbe%7]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 05:25:24 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Topic: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate
 preftch of svm with single and multi ranges
Thread-Index: AQHbxCmADfMK2ABNo0mgF71RLg0F5rPRKOoAgABvaVA=
Date: Wed, 14 May 2025 05:25:24 +0000
Message-ID: <CH0PR11MB575415E0B1624A79AEEBC777D091A@CH0PR11MB5754.namprd11.prod.outlook.com>
References: <20250513170711.14518-1-sai.gowtham.ch@intel.com>
 <20250513170711.14518-3-sai.gowtham.ch@intel.com>
 <CH0PR11MB5444F3A4DA3A27D0AEDAA331E596A@CH0PR11MB5444.namprd11.prod.outlook.com>
In-Reply-To: <CH0PR11MB5444F3A4DA3A27D0AEDAA331E596A@CH0PR11MB5444.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5754:EE_|DM6PR11MB4705:EE_
x-ms-office365-filtering-correlation-id: 6a420441-fe94-4cc7-028f-08dd92a7ba6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?c+U/U//u6opQFHopTLB7ZBPH20Sfa+RwFYY+vn21yKTW+hW/LzngXpF9Ape9?=
 =?us-ascii?Q?fR3EfbEZNRP30hpWdIUg8dLanemkOyEQ8UdSwtFCJK90e5IhsMAaZ3YMoehY?=
 =?us-ascii?Q?Y3F022hsruVNRrM3F9U19bf64U+4TogJUzkVZnJe9/RfsZouFghrK/sF9anO?=
 =?us-ascii?Q?qxrK51Swrp0eQeT/2bvDOtcFgpt5R54YdcthdqDTYIOj53CteyLzHdsImkZF?=
 =?us-ascii?Q?gYJA92JtuaER675bEycOoWD3QGdcjB/SLWETkeInTgykH8N4lV4+/AXwcj60?=
 =?us-ascii?Q?ZDesd1rpzkSVPiB86iiDOsiIyqpoBzcMQvCgoWrBYy4taTprVfQOsiP8Dp6Z?=
 =?us-ascii?Q?sdCwAIfW0I44P5q6ZyCofqAxaOHzjfwNLhAmkN1jF4morZsXhMmHTBAUgpZp?=
 =?us-ascii?Q?hucjzplu3PWlhHGD7JX54ndYffwnFFQk/6/50VLJONBxj6S9xwZuRio9oEat?=
 =?us-ascii?Q?2I2x7oDEVb1nbFy/d6l0/QNPUkzGjWWU38bRRvlZwIwQ8v1/Y0oLdzEzC6fR?=
 =?us-ascii?Q?vlYP2NfUn9mg5kKvZaNvS+6EOfq9cDsyK80tT0VJy2h+VtPz7NmDsL89L/st?=
 =?us-ascii?Q?k59FbU4w1SMP1xOCR+4rUizrCZyrWwr8H9UW3JLxDp4uSAwP6oEgj6RgsFgE?=
 =?us-ascii?Q?PNwGsjVvBLUBgstYPuIhYkutpgbvmnSnYsIqHSw53NYPdZeMirhGN7vONFNd?=
 =?us-ascii?Q?UnllSDtrSfvmuLnOZ2adK/5LjU2Fm2EYOEjtNhzWCpoKR3F+eTnklrMVFj3v?=
 =?us-ascii?Q?oF45uz1QYqhJOAHzzUw/9Rz06SkFTnKq9b1EK5kckif3HMGJo6UzBPOcEgB4?=
 =?us-ascii?Q?JGkK2zobAbuIGsbv/Q7J+pUXBy7Klqhb+bR9Q7SApoM9Fzm8yPKBCQjlK7b8?=
 =?us-ascii?Q?iBZ9DW44187HvQZPIxtICHTsOfD21cLBO1NL2MjEaLUfZjpR5G6ockR1Bjtd?=
 =?us-ascii?Q?lV8SfAmLRhF44YBc+OmW7F6cMNCHuxajRvq8ubresa8Tw8v9kx7COtOzHmNL?=
 =?us-ascii?Q?ZnN9cBmwtoLoJLY2ASmYJv01M9jlF8pT9oY2h7AiqC1fvre1n/FzihJUg6Hu?=
 =?us-ascii?Q?ySeVI/HFDW+HmBmL8HX8NqOn8tchOlGs2Owh5WkAYTNwKjVR/Jjdbh6VVq4G?=
 =?us-ascii?Q?QfTKPfFlab7JY7/TJoWBl2uwYv8bhImNOflbLE81MUNtERfsniW/0NGg8tKG?=
 =?us-ascii?Q?W7rB9JsSk9A2C1gzcc5OHpvnhDtUHycbfaV8EkZdX3Gc5O3qKXLUvYA5m2GM?=
 =?us-ascii?Q?Fv6ZsF20LzWnAvcwqDSw/BIKvgibrYUVKx4/RaM62nKgw/KBeKKVRuHO7CCO?=
 =?us-ascii?Q?yz/aiZ6c+0zkgDcEXpfnO497fvNhDtdvVMCgxMPjzBLRcREixN1YMqwJREWM?=
 =?us-ascii?Q?x/FcSffzrQPwDrifwZW/4atZpwa8DPS+wnHn3QKa0OYUSAR0uyGlhxIUDql+?=
 =?us-ascii?Q?fd+9NZQzSijK7WEamn3/ziTq6AP0j0eajwyugRZl/DpCEFnJxsS+gA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5754.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aIvoB5FEgP09pxbOcthMq5yCTf61L2IKsbaQutSvvm99j5ujDvHuuIdPcXQG?=
 =?us-ascii?Q?7g1vWI1Kep/2kTvdfNDEZY1yTnM3qPdwSeBRgwp6htrrNvfgjFSjSKRkkDzs?=
 =?us-ascii?Q?IwjrbSnHNGXcBTHESXkRVvBlyimrJPyNU2Jb8a/3E9zUHTUDPUlsdBDqjATg?=
 =?us-ascii?Q?0mXga1UgbNo0DpujWGGQFi9/N6uIFmX0hAR4Lc24xikA/Kbmkw7wS4k/xRAl?=
 =?us-ascii?Q?nyhEzMf8DTuherXBzxwzTB5Dsk6jLDb8ijrG3PTpJkIhZQOKx8OJPL65nrQK?=
 =?us-ascii?Q?w9Lrkn4gA56Z6Qw8kNDK2p36/H9MuTESXbC1sXZGIYggch2t0ySGcsGHYKdb?=
 =?us-ascii?Q?/HZw5JjTR66h6uh5gNnJrDZqZm4xL2Rp0x3K5XcqfMiz/oHX+/9X0milyP2Y?=
 =?us-ascii?Q?e9PECHCiRhPFc9VbaGQ+0U0NNLo1TTR/++9cyD00MJ3S9RUVCaU95g73fBaT?=
 =?us-ascii?Q?smp7UB4ddIo4jqmaOSB+HYR7YAbFgZWV0ZRpfc0wjh2Rnub8banRltY/WauN?=
 =?us-ascii?Q?KtwgRMviGddqN709vff3sjT3hn409JU+1hC0VvXlY+9q8385vw4AzfZHD90/?=
 =?us-ascii?Q?KzArK5KDo5D4E7tFE4l+qOoPJT6juASidIb+YStrUF16dkRabxw6ryuy433h?=
 =?us-ascii?Q?fuXoZL+Q/nqXTuQscb2bR6e53MnIRbH/vglbPbPpiR/XZbyWOJcq+b5PaEbZ?=
 =?us-ascii?Q?gl0M4QlYRi3NiT1OHcRGzUom4fSIdDxEZbchaySLets+EfqYTHjkLy4zhbkv?=
 =?us-ascii?Q?Nhxn4ArOv4VH2RegpLQpc6eq0BN7/sQsc4QWQFTgGOregKQgTEWByLjTt7yD?=
 =?us-ascii?Q?oBTvMeRCIDSAHX0kTxvVY77YNduZ9D4lGfGgGsf3KGinumwEFEWcMuxIMNX8?=
 =?us-ascii?Q?7Wi/ANwuPCc8/c9lh9KT4qo6F3kqDNUOTHIDIzMXgzrZ1uBSr13ECPeUR4lB?=
 =?us-ascii?Q?kGOvVErjAbN5YWmWaHdebWDmh6ziknr4qzagejT6A+yA5VEimLvy1BwX+msR?=
 =?us-ascii?Q?T8n+dB4prhid3fghsj4/ndDedz+UCwIRHi4BwcAftQ1FbSSyh+Km56aacllV?=
 =?us-ascii?Q?Q/ZAoDZYX5lCYVN3aGGj0A7Qsg6AgvSaHI6KL+ZxEco4T8+PBa+Ui12XZx5J?=
 =?us-ascii?Q?OOj4Pjq33AqV7E04HUck8Stpq1DgDVEqPmIncYarq3lirtfYipfY82UO0unJ?=
 =?us-ascii?Q?g0D8lPApD6DAl69iV9XXq23pQGGYyIIdTRXWeEvD6LnPAkHZb9GxNWGZBHmB?=
 =?us-ascii?Q?cnkCDEwwsX7LcthEZObCzgNL4dBEQhw1lKAmcBLeUhJP/ZJEHiRXyGjM/bH5?=
 =?us-ascii?Q?gi9qk58r8egbz+mfzXTkBlQVx7gIiKuTT+ennSltoyaFxSsDqUv7m9Zkxh09?=
 =?us-ascii?Q?t75Pd5435m3Ogo+LqFqHPtE+s1ldGPOotIJKT7nq9hqesrnIENdTwxVq5SE4?=
 =?us-ascii?Q?ErLYPJoFrsvOsd9T04fPHu5zc252svI3NL7IXhveYZP5rdOgU6deZ+eoOMxf?=
 =?us-ascii?Q?MAPHGDsdFXGhlIe/9CoVeDpnDcFdSSNetrs3WgOc28UJdSBcjDLgseZvkl1s?=
 =?us-ascii?Q?JJ9wi7dQoi68Q1C6FN9RGUL8JZbP7XkWS+NJBJd2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5754.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a420441-fe94-4cc7-028f-08dd92a7ba6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 05:25:24.0822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e4pxo+yVuHTtCBxg2OjHhomjDtNz+rwcQ9C8DYN4vbGYQbSxUi3skvzAc4X5dVCYLZdGRqlAoyV7CgnyWf4J56piD2EWaCsMIcGjqxAhLOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4705
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



>-----Original Message-----
>From: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>Sent: Wednesday, May 14, 2025 4:15 AM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; igt-dev@lists.freedesktop.=
org;
>Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Ghimiray, Himal Prasad
><himal.prasad.ghimiray@intel.com>; Brost, Matthew <matthew.brost@intel.com=
>
>Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>
>Subject: RE: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate pr=
eftch of
>svm with single and multi ranges
>
>-----Original Message-----
>From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
>sai.gowtham.ch@intel.com
>Sent: Tuesday, May 13, 2025 10:07 AM
>To: igt-dev@lists.freedesktop.org; Ch, Sai Gowtham <sai.gowtham.ch@intel.c=
om>;
>Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Brost, Matthew
><matthew.brost@intel.com>
>Subject: [PATCH 2/3] tests/intel/xe_exec_system_allocator: Validate preftc=
h of
>svm with single and multi ranges
>>
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Tests validates Prefetch of SVM with single range and multiple ranges,
>> with different range of sizes. checks if not svm pagefaults are seen
>> while prefetching the ranges of svm.
>>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tests/intel/xe_exec_system_allocator.c | 126
>> +++++++++++++++++++++++++
>>  1 file changed, 126 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c
>> b/tests/intel/xe_exec_system_allocator.c
>> index ba11ed834..c3f0e61f3 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -20,6 +20,7 @@
>>  #include "lib/igt_syncobj.h"
>>  #include "lib/intel_reg.h"
>>  #include "xe_drm.h"
>> +#include "xe/xe_gt.c"
>>
>>  #include "xe/xe_ioctl.h"
>>  #include "xe/xe_query.h"
>> @@ -139,6 +140,7 @@ static void signal_pdata(struct process_data *pdata)
>>  #define CPU_FAULT_THREADS	(0x1 << 2)
>>  #define CPU_FAULT_PROCESS	(0x1 << 3)
>>  #define CPU_FAULT_SAME_PAGE	(0x1 << 4)
>> +#define VRAM            	(0x1 << 5)
>>
>>  static void process_check(void *ptr, uint64_t alloc_size, uint64_t stri=
de,
>>  			  unsigned int flags)
>> @@ -464,6 +466,106 @@ static void test_basic(int fd, struct
>drm_xe_engine_class_instance *eci,
>>  	xe_exec_queue_destroy(fd, exec_queues);
>>  	xe_vm_destroy(fd, vm);
>>  }
>> +
>> +/**
>> + * SUBTEST: prefetch-smem-%s
>> + * Description: Test to validate functionality of Prefetch using SVM
>> +of size arg[1] at smem region
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: prefetch-vram-%s
>> + * Description: Test to validate functionality of Prefetch using SVM
>> +of size arg[1] at vram region
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-smem-%s
>> + * Description: Prefetch of mutliple ranges within arg[1] size to
>> +validate multiple ranges are created
>> + * Test category: functionality test
>> + *
>> + * SUBTEST: multi-range-vram-%s
>> + * Description: Prefetch of mutliple ranges within arg[1] size and
>> +check if multiple ranges are created
>> + * Test category: functionality test
>> + *
>> + * arg[1]:
>> + *
>> + * @SZ_4K: SZ_4K
>> + * @SZ_64K: SZ_64K
>> + * @SZ_2M: SZ_2M
>> + */
>> +#define MAX_BATCH_DWORDS 16
>> +static void prefetch(int fd, struct drm_xe_engine_class_instance *eci,
>> +		     size_t bo_size, unsigned int flags, int num_dwords) {
>> +	struct batch_data *data;
>> +	uint64_t target_addr;
>> +	uint64_t addr;
>> +	u64 *exec_ufence =3D NULL;
>> +	struct drm_xe_sync sync[1] =3D {
>> +		{ .type =3D DRM_XE_SYNC_TYPE_USER_FENCE, .flags =3D
>DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value =3D USER_FENCE_VALUE },
>> +	};
>> +	struct drm_xe_exec exec =3D {
>> +		.num_batch_buffer =3D 1,
>> +		.num_syncs =3D 1,
>> +		.syncs =3D to_user_pointer(sync),
>> +	};
>> +	size_t slice_size =3D bo_size;
>> +	uint64_t batch_addr;
>> +	uint32_t exec_queues, expected, vm, *result_ptr, *batch;
>> +	size_t aligned_size =3D bo_size ?: xe_get_default_alignment(fd);
>> +	const char *stat =3D "svm_pagefault_count";
>> +	int b, svm_pf_count_pre, svm_pf_count_pos;
>> +
>> +	bo_size =3D bo_size * num_dwords;
>> +	vm =3D xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE |
>DRM_XE_VM_CREATE_FLAG_FAULT_MODE, 0);
>> +	data =3D aligned_alloc(aligned_size, bo_size);
>> +	memset(data, 0, bo_size);
>> +	addr =3D to_user_pointer(data);
>> +
>> +	exec_queues =3D xe_exec_queue_create(fd, vm, eci, 0);
>> +	sync[0].addr =3D to_user_pointer(&data[0].vm_sync);
>> +	bind_system_allocator(sync, 1);
>> +	xe_wait_ufence(fd, &data[0].vm_sync, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +	data[0].vm_sync =3D 0;
>> +	exec_ufence =3D mmap(NULL, SZ_4K, PROT_READ |
>> +				 PROT_WRITE, MAP_SHARED |
>> +				 MAP_ANONYMOUS, -1, 0);
>> +	igt_assert(exec_ufence !=3D MAP_FAILED);
>> +	memset(exec_ufence, 0, SZ_4K);
>> +
>> +	for (int i =3D 0; i < num_dwords; i++) {
>> +		batch =3D (uint32_t *)((uint8_t *)data + i * slice_size);
>> +		target_addr =3D addr + i * slice_size + 0x100;
>> +		b =3D 0;
>> +
>> +		igt_assert(b + 5 <=3D MAX_BATCH_DWORDS);
>> +		write_dword(batch, target_addr, 0xDEADBEEF + i, &b);
>> +	}
>> +	sync[0].addr =3D to_user_pointer(exec_ufence);
>> +	xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync, 1, flags & VRA=
M ?
>1 : 0);
>> +	xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE, 0,
>NSEC_PER_SEC);
>> +	exec.exec_queue_id =3D exec_queues;
>> +
>> +	for (int i =3D 0; i < num_dwords; i++) {
>> +		result_ptr =3D (uint32_t *)((uint8_t *)data + i * slice_size + 0x100)=
;
>> +		expected =3D 0xDEADBEEF + i;
>> +
>> +		svm_pf_count_pre =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
>> +		batch_addr =3D addr + i * slice_size;
>> +		exec.address =3D batch_addr;
>> +		exec_ufence[0] =3D 0;
>> +		sync[0].addr =3D to_user_pointer(exec_ufence);
>> +		xe_exec(fd, &exec);
>> +		svm_pf_count_pos =3D xe_gt_stats_get_count(fd, eci->gt_id, stat);
>> +		igt_assert(svm_pf_count_pre =3D=3D svm_pf_count_pos);
>> +		xe_wait_ufence(fd, exec_ufence, USER_FENCE_VALUE,
>exec_queues, NSEC_PER_SEC);
>> +		exec_ufence[0] =3D 0;
>> +		igt_assert_eq(*result_ptr, expected);
>> +	}
>> +	xe_exec_queue_destroy(fd, exec_queues);
>> +	unbind_system_allocator();
>> +	munmap(data, bo_size);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>>  /**
>>   * SUBTEST: unaligned-alloc
>>   * Description: allocate unaligned sizes of memory @@ -1658,6
>> +1760,16 @@ igt_main  {
>>  	struct drm_xe_engine *engine;
>>  	struct drm_xe_engine_class_instance *hwe;
>> +	const struct mode {
>> +		const char *name;
>> +		size_t size;
>> +	} mode[] =3D {
>> +		{ "SZ_4K", SZ_4K},
>> +		{ "SZ_64K", SZ_64K},
>> +		{ "SZ_2M", SZ_2M},
>
>You should also save the smem/vram flags up here as well.  Something like:
>
>"""
>	const struct mode {
>		const char *name;
>		unsigned int flags;
>		size_t size;
>	} mode[] =3D {
>		{"smem-SZ_4K", 0, SZ_4K},
>		{"smem-SZ_64K", 0, SZ_64K},
>		{"smem-SZ_2M", 0, SZ_2M},
>		{"vram-SZ_4K", VRAM, SZ_4K},
>		{"vram-SZ_64K", VRAM, SZ_64K},
>		{"vram-SZ_2M", VRAM, SZ_2M},
>		{ NULL },
>	};
>"""
>
>Then, below, you'd only need:
>
>"""
>	for (m =3D mode; m->name; m++) {
>		igt_subtest_f("prefetch-%s", m->name)
>			prefetch(fd, &engine->instance, m->size, m->flags, 1);
>
>		igt_subtest_f("multi-range-%s", m->name)
>			prefetch(fd, &engine->instance, m->size, m->flags, 10);
>	}
>"""
>Of course, you'd also have to fix the kernel docs above if you took this r=
oute.
>
Thanks for your review comments, Sure Will add this change in my next patch=
 series.

Thanks,
Gowtham
>You could also maybe consider saving the num_dwords value as well, but tha=
t's
>probably overkill.
>-Jonathan Cavitt
>
>> +		{},
>> +	}, *m;
>> +
>>  	const struct section sections[] =3D {
>>  		{ "malloc", 0 },
>>  		{ "malloc-multi-fault", MULTI_FAULT }, @@ -1931,6 +2043,20
>@@
>> igt_main
>>  			processes_evict(fd, SZ_8M, SZ_1M, s->flags);
>>  	}
>>
>> +	for (m =3D mode; m->name; m++) {
>> +                igt_subtest_f("prefetch-smem-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size, 0,
>> +1);
>> +
>> +                igt_subtest_f("prefetch-vram-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size,
>> + VRAM, 1);
>> +
>> +                igt_subtest_f("multi-range-smem-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size, 0,
>> + 10);
>> +
>> +                igt_subtest_f("multi-range-vram-%s", m->name)
>> +                        prefetch(fd, &engine->instance, m->size, VRAM, =
10);
>> +        }
>> +
>>  	igt_fixture {
>>  		xe_device_put(fd);
>>  		drm_close_driver(fd);
>> --
>> 2.34.1
>>
>>
