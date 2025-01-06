Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1DEE77198
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 22:58:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11F810E0E8;
	Mon,  6 Jan 2025 22:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idWQhJk4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE9510E0E8
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 22:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736204323; x=1767740323;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/J8tqtjIPrIQzp3CIx168G6xqHegQYCqBijeFJmpy30=;
 b=idWQhJk4X7+Wa8oAIL0KzaBHaaeludjQBhw9ZeOytP7GeGw0fClsJp9T
 27SEmWg3Q3dEK6ccYOoh8x41lEfzT3VYb/qseSb6udgXjsv/x0mOShG4G
 LAK3O5vO+RN0KlX8PIjhOXA1wuNEQRMUTQdfeimK08CePP8mHJZjvSMAA
 bjm+6pQOq/1+7YyXMBGYGCpN7umptv3ZinHhXdsVR3vD0yCpML60y6iy8
 U3UD1fJWvGuNcFo0wRghJ8GANd9nnMRLELGg+2bN38viAEY3vG3jaHRhJ
 st2mp4ZsgyLr1Al6Ti5PlajoNKwrvJqGnRjF+9BmEoLQuHItvk52kjV8v A==;
X-CSE-ConnectionGUID: znfpq0v3Qm2GARGGfVijdg==
X-CSE-MsgGUID: yT3TOirPRYKZbVALPkIVtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="36479810"
X-IronPort-AV: E=Sophos;i="6.12,293,1728975600"; d="scan'208";a="36479810"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 14:58:43 -0800
X-CSE-ConnectionGUID: ltWDYgJcTNqOC/S03NkBCA==
X-CSE-MsgGUID: IV5FwdEgRautPsomW/0tLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102440220"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jan 2025 14:58:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:42 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 6 Jan 2025 14:58:42 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 6 Jan 2025 14:58:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qA6aa/Qtu6VpaN0msWWGqepa4CJDQ6dKowrC3LLPmSb0lTVFrY7i+91oUHVPoQGaNysgUf1Xf2AXJYrFCGoA/HAFDLE7LRGn1P697G4vtewLSLx5g9UXUGB/Ryf19Gslwr1ENxlyOM0sujSGE6GTg0eIbzTBZGfnP5h38hHS4nKlsMJEKF+LUpis2hDm4cpU/YoNzJJlU4ZZ6bicwNm3L1OnwEIpy/A7UN0v7pf4i1Cpqi+tQe5z4zdffARKZiQHv8S3OjHgoKUvKCFk7whUT6Lq+zxasO9gKM0hJDrciyPcxwBpQTxrVIvgvW61fJMF2S7MgO/WtUop/6zFbWEDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jryVfG50TofvNDt65aidnSKhuz2pwn0nkDQNPjlnZGk=;
 b=q/DDCBfH7Mqh4SCH4jpykWnJO/FcWgKpnWM6dbQD2teQEiXgFdP9Q+DLnPdAIJLm7LrZmupaNSRcIW+z9uBk9zWwXZk/sbUhzzCVxTPjXYJjp9CQ3TJdUQKHzxEosZffatg7ZmhehA/U7QsiEaRtfRwOjD2AWh4nHTCSoyOt/iTVYI/tPREP+GGJBEhpM7N5focc55wYt9IZ/NN/73P8qzTUYacHqYlNMQejELpzZ3BqzX1jdP//Fr+QSb8tQzbA0PMIQ0lN5rcvQz2TlJsMJsopqI63l8BU9y9DS2s+MjSguTh3QMvCoq1ecDmWXuntm18W59j8QnI3mdbG/Xg9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 22:58:23 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.8314.018; Mon, 6 Jan 2025
 22:58:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t 5/8] lib/xe: Split nsec to ticks abstraction
Thread-Topic: [PATCH i-g-t 5/8] lib/xe: Split nsec to ticks abstraction
Thread-Index: AQHbXniOSJ1EQSRPCka0DCeN46OQvbMKUNdA
Date: Mon, 6 Jan 2025 22:58:23 +0000
Message-ID: <CH0PR11MB54441882DB91BD490BFD9B90E5102@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250104071548.737612-1-lucas.demarchi@intel.com>
 <20250104071548.737612-5-lucas.demarchi@intel.com>
In-Reply-To: <20250104071548.737612-5-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4622:EE_
x-ms-office365-filtering-correlation-id: 1cfd412c-f287-4bff-6fa0-08dd2ea59f25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ftR9+shQMrdQ+R/qhSe4Z0/Gn7J94ms9Y9whbUUtgiPuTwcmSJlT0kQwgEwz?=
 =?us-ascii?Q?5Q6/tJXV2fh3VVHfyXdLgZFw3KunlTjbPaZoAP7vYKk49dzjWyRiXJLT1enB?=
 =?us-ascii?Q?Wba0R+SmDHqFx0kErnjn8Gd51IHxIRrprIQr29gd+5ida2pdv/N/BytsWxuE?=
 =?us-ascii?Q?S+oXFPtKJfLifBroWYa7SCAH5e9zhkgilDdA8ggQoc6yU/O+LwVFRkorTNdh?=
 =?us-ascii?Q?OtjJOw8eZqUqgWilE0DQgTi/OktQRITNY8tPJ5z2pX4at3lKvwT5P5XCpJ3t?=
 =?us-ascii?Q?HEZYkif6pOxsLS3AxsuEronprlB3Gp9Ou6iEkxwgMz9t/7IUnm3lkDvCCev3?=
 =?us-ascii?Q?1/Sps86vMoEWN1jcgb8Kcs7iqUdTdshCzPIXZv2YKVwtowQDsvsNC/dJwWTE?=
 =?us-ascii?Q?xzbNq9xx9aFWiKGl3lQmEt+cRlRSJ6Hcw5WP9P485wIVF+UoDo7Z1hai/Ghv?=
 =?us-ascii?Q?bVauSKOdsH57ERlBbba0SsD/B1s2dzjQkRe8F46pokc+Fom2ZQY/yVwvEjFq?=
 =?us-ascii?Q?gWlP8oBUNmRjwJ/9V5P5aJqT2KzpmGIPL+q4zLEkjhDqgskD5+BhVfDk9wSi?=
 =?us-ascii?Q?HBNjN0+iDy9E9+wUdrEQ9cxRyKsx41XhDz6krq5VSdnR+E0UmFPAlnVYosB4?=
 =?us-ascii?Q?pjBTmysbybX5MRH/70pfN8v0TO9m8epia+WgvK2GFpf5QAdR3eObKWQW3N3J?=
 =?us-ascii?Q?vAci7AcM12HP+080zbUBMSPXU1kar3OLVsOjgOxZJ1jQJDBJ5r30Yz6V1yNV?=
 =?us-ascii?Q?Rl+mjnlqZY3mTzXpFjlxGa0U5hbBceinxXH1OVkVJVT5yha9Wz6OxX6jn8H0?=
 =?us-ascii?Q?UGHjMv6zhsPBWfCIuDmtg52luzqz2eIq15HBWQSHT7+gec5mcVJKFGFRgovR?=
 =?us-ascii?Q?y8ZLwl4EKoTBSxf0ZGicyqnqbQsRC3BObb1gWXvtyVShoRIM3nYYFbWwIbFI?=
 =?us-ascii?Q?mambvEw/NIh5Mvc30vxkowQQEfOCNd5RwrAxSM13XZeAk5YhAxMt+dYaAAOl?=
 =?us-ascii?Q?/BWdBzk+ZpHwJa4pdil8dfB+i8j4+VnQv+ptd1pD3mvr0b8ZnAUKmTRzB2cp?=
 =?us-ascii?Q?YBXJIYC4XFzUQnwqawpIxdwGmyyWR26sYIOg5Xi9IGXphA+DbNbOE3PkxEuU?=
 =?us-ascii?Q?g6TkN5qWynSQ9uLwfIx24gmpp7fSl9e8++leCPaGZP4DvKDT2mvdrPfiUs8u?=
 =?us-ascii?Q?6n2HOJOxBGo37ct0Cn5pmZRpz28BvC17ZOQWbYcd11Q1Z0odeMZNG7TIe8Fc?=
 =?us-ascii?Q?Bsr5+f1Hf9exJlxsTABakgSfY10rpkCBIpLGAz5SGn6bZ+ssCniXsNSVLbYm?=
 =?us-ascii?Q?pZv7ZN5Q4ytwF8/+y3JQ+oe2TPd30E3Q7SW0TtwoVs9kMWMiBM8ZZ2lVE5qV?=
 =?us-ascii?Q?EH07S/v5xkjxVcxGO3JfmFKFpLaK43mcceYQM9FHCL90xEfbzdDQoMjGeDg+?=
 =?us-ascii?Q?Ak0ml1OHY00gyGoMv4soEW3gz3QICA9R?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oh9YL121RM1Zrih2qoeekP9YkDAHHehDONBhF/aL20a2wiSxcTmENwNrdx2s?=
 =?us-ascii?Q?JeDlm3NB7lXj0IRyAeAcFCfUCInCvpuO28AlWUZpdciElbdDSEVuOQwQZ1Qw?=
 =?us-ascii?Q?D7Nvf//p/ebQeFfY3+58fIYRELcO5P70vokjBou7eOfjHaQIENiBOoqo/C+e?=
 =?us-ascii?Q?LIxXSkCCEV5hyuREk31j99PSaxZ1K/iqt6Y2LW5jacKw+VM/TbdDdnqpO6ig?=
 =?us-ascii?Q?3wbcfKePkp5TKRYda2Tg1gVB/FK+0nPgMUeFI+tPI9c/KO+NanLt5WzUWvFH?=
 =?us-ascii?Q?6UDWI+Gv/TH2n4L4y+LDLxU3hceO5fVNKOwLESpa1Uks9AkTo1d9bytLn8nA?=
 =?us-ascii?Q?D9LrSDaujSjEqPvBkQ1SN7EoPT8CdndMe/bPyBrUP2BU4HQr+8N35B0yj1U+?=
 =?us-ascii?Q?pEoGdwqMfBn/8X4M3WI4wDw+JXYzFYdb/ZhVKjCWoa6bGaZdD0hTijrlFUQO?=
 =?us-ascii?Q?vGhbXQDqGnj64pNl+qL155rm9vdcAInHrMF7JmlKIM4moj7T5gh9jbM6ZZjl?=
 =?us-ascii?Q?kJVMF0bp530j49rVng7OcuDRNredZdBW/lJSQf+PCVS6NLLIOSIch2+zUaSM?=
 =?us-ascii?Q?HT3uQ4JcjqZP2vYmM7y2qL5EHMbm3SiyfcdG1Pv7k7t3ePenibeXW3QyeNor?=
 =?us-ascii?Q?+o6ANjQmv4wsFa+R2otUye/4gxVRAU1X8LnXJAaYKwQQNKzlbcVFhHBXZ351?=
 =?us-ascii?Q?ACIdjeNEQHkJb6ja4C5s6FvZd1ZU5zYqtrlUtbDEwAXHckPOmSgQOF9jjM6T?=
 =?us-ascii?Q?+ZKx7bnYGPg8cci8FduJnkL7rLkBiYqhcQ+X0JcnxuUA3zqgdkDGTFsZDF5j?=
 =?us-ascii?Q?HNj3puSm3ANB0aQ8nB1UxuU3wOgK6ZyuBbClv3TGFJHg9vn4oT8RDMJ3H1Tt?=
 =?us-ascii?Q?E60LGym1iXWlbjM1SSy9grGu9TtxkH+pJl+xszoOiRrwFt+cQkf4IkNi340m?=
 =?us-ascii?Q?aGPf2f/WleD5/f5E0KPXYfqHEVuxUcE5el+ih0vWx8qFCKfdqvxg934otNlI?=
 =?us-ascii?Q?xVuD2TMLWqryOMqXzp+1OUZs11WzCdCeYEVdeqdpaPVDJHpiuAaW8oNSwFj9?=
 =?us-ascii?Q?b3rGLnxDMXeVqj5FE3q2/24N3uSdCGV00yEPwOmZB8G+nBr+YfA68RsT9DUr?=
 =?us-ascii?Q?f0/pKlSY9rJOOelEc4rIBDxlWlmbT82v9gsPrl6wpeCG+2UdVFYrV4YQQFwJ?=
 =?us-ascii?Q?n6zXFK1EATamEwWZMYdfC79Gy3vLQU1iuT3b7VPY4+LFd8Unl+SsFFWWGNim?=
 =?us-ascii?Q?SZz7fNStjFSJLZc7nYOKLcizEdNhezak2Fn0iVqP8E57Ty9I3bzG9dhYMcXQ?=
 =?us-ascii?Q?V/vDhpajYGNuOZeYbOQRKyseqGBOcuqPnNNTQ3izuPHe7QX/OMtAlQvXuGMW?=
 =?us-ascii?Q?PpUZ4AlJtikJdnWF2xrCgwW3nmkL9io6YYX/1AmxiGbVFKkY7dPD1u/5jkD/?=
 =?us-ascii?Q?kmrWj5DGMPcQpln3OBFQHVKp+TBEiQHWzfUQ1zhnRzsKbUkifqlxpC4Vn6rY?=
 =?us-ascii?Q?1l8qwGdh4uTaDx9/tQjxvdXtGx2FJcJJlbaXxkPPwOmh/7+KYiq9J0JTLOGi?=
 =?us-ascii?Q?cha2tZk9KGl7RoukY0ViShxib9pM1yDj2Q7nIxi4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfd412c-f287-4bff-6fa0-08dd2ea59f25
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2025 22:58:23.0461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: httUcha6hOzi8aET9L54DFwslcr7rc3w7lVfXWlPOxz0B9SzoeS5oHQb8AkxGbbgKddcKWTTYhUMu2RYDKhwnWFfe6ohccQr+iuM2F+fcU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lucas De=
 Marchi
Sent: Friday, January 3, 2025 11:16 PM
To: igt-dev@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 5/8] lib/xe: Split nsec to ticks abstraction
>=20
> There are 2 things happening here: one is converting time in nanoseconds
> to ticks by using the refclock, and another asserting a spin duration is
> not so close to the maximum duration since there needs to be room for
> context switch.
>=20
> Move the time conversion to xe_util.c and adjust it to maintain
> namespace and have better names.  Places that do the time conversion to
> pass to xe_spin then use the xe_spin_nsec_to_ticks() wrapper to
> calculate the ticks.
>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

I only have a single minor nit below, but otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>

> ---
>  benchmarks/gem_wsim.c           |  8 +++---
>  lib/xe/xe_spin.c                | 47 +++++++++------------------------
>  lib/xe/xe_spin.h                |  9 +++----
>  lib/xe/xe_util.c                | 40 ++++++++++++++++++++++++++++
>  lib/xe/xe_util.h                |  2 ++
>  tests/intel/xe_exec_mix_modes.c |  3 ++-
>  tests/intel/xe_spin_batch.c     |  2 +-
>  7 files changed, 66 insertions(+), 45 deletions(-)
>=20
> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
> index c4fd00a6a..454b6f017 100644
> --- a/benchmarks/gem_wsim.c
> +++ b/benchmarks/gem_wsim.c
> @@ -1797,8 +1797,8 @@ xe_alloc_step_batch(struct workload *wrk, struct w_=
step *w)
>  	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_=
size);
>  	xe_spin_init_opts(&w->xe.data->spin, .addr =3D w->xe.exec.address,
>  				   .preempt =3D (w->preempt_us > 0),
> -				   .ctx_ticks =3D duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
> -								1000LL * get_duration(wrk, w)));
> +				   .ctx_ticks =3D xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
> +								      1000LL * get_duration(wrk, w)));
>  	w->xe.exec.exec_queue_id =3D eq->id;
>  	w->xe.exec.num_batch_buffer =3D 1;
>  	/* always at least one out fence */
> @@ -2655,8 +2655,8 @@ static void do_xe_exec(struct workload *wrk, struct=
 w_step *w)
>  		xe_spin_init_opts(&w->xe.data->spin,
>  				  .addr =3D w->xe.exec.address,
>  				  .preempt =3D (w->preempt_us > 0),
> -				  .ctx_ticks =3D duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
> -								1000LL * get_duration(wrk, w)));
> +				  .ctx_ticks =3D xe_spin_nsec_to_ticks(fd, eq->hwe_list[0].gt_id,
> +								     1000LL * get_duration(wrk, w)));
>  	xe_exec(fd, &w->xe.exec);
>  }
> =20
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 2bde55856..333f8d7d8 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -13,43 +13,12 @@
>  #include "igt_core.h"
>  #include "igt_syncobj.h"
>  #include "intel_reg.h"
> +
>  #include "xe_ioctl.h"
>  #include "xe_spin.h"
> +#include "xe_util.h"
> =20
> -static uint32_t read_timestamp_frequency(int fd, int gt_id)
> -{
> -	struct xe_device *dev =3D xe_device_get(fd);
> -
> -	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
> -	igt_assert(gt_id >=3D 0 && gt_id <=3D dev->gt_list->num_gt);
> -
> -	return dev->gt_list->gt_list[gt_id].reference_clock;
> -}
> -
> -static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
> -{
> -	igt_assert(y > 0);
> -	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));
> -
> -	return (x + y - 1) / y;
> -}
> -
> -/**
> - * duration_to_ctx_ticks:
> - * @fd: opened device
> - * @gt_id: tile id
> - * @duration_ns: duration in nanoseconds to be converted to context time=
stamp ticks
> - * @return: duration converted to context timestamp ticks.
> - */
> -uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t duration_ns)
> -{
> -	uint32_t f =3D read_timestamp_frequency(fd, gt_id);
> -	uint64_t ctx_ticks =3D div64_u64_round_up(duration_ns * f, NSEC_PER_SEC=
);
> -
> -	igt_assert_lt_u64(ctx_ticks, XE_SPIN_MAX_CTX_TICKS);
> -
> -	return ctx_ticks;
> -}
> +#define XE_SPIN_MAX_CTX_TICKS (UINT32_MAX - 1000)
> =20
>  #define MI_SRM_CS_MMIO				(1 << 19)
>  #define MI_LRI_CS_MMIO				(1 << 19)
> @@ -60,6 +29,16 @@ uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint=
64_t duration_ns)
> =20
>  enum { START_TS, NOW_TS };
> =20
> +
> +uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
> +{
> +	uint32_t ticks =3D xe_nsec_to_ticks(fd, gt_id, nsec);
> +
> +	igt_assert_lt_u64(ticks, XE_SPIN_MAX_CTX_TICKS);
> +
> +	return ticks;
> +}
> +
>  /**
>   * xe_spin_init:
>   * @spin: pointer to mapped bo in which spinner code will be written
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 593065bc0..01f45eaeb 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -15,10 +15,8 @@
>  #include "xe_query.h"
>  #include "lib/igt_dummyload.h"
> =20
> -#define XE_SPIN_MAX_CTX_TICKS (UINT32_MAX - 1000)
> -
> -/** struct xe_spin_opts
> - *
> +/**
> + * struct xe_spin_opts

Nit:
This change (correcting the comment style for the xe_spin_opts declaration)
might be better suited for the next patch in this series, as we're already =
cleaning
up the other abstractions in the xe_spin.h file at that time.  But either w=
ay
works for me.
-Jonathan Cavitt

>   * @addr: offset of spinner within vm
>   * @preempt: allow spinner to be preempted or not
>   * @ctx_ticks: number of ticks after which spinner is stopped, applied i=
f > 0
> @@ -68,7 +66,6 @@ struct xe_cork {
>  };
> =20
>  igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
> -uint32_t duration_to_ctx_ticks(int fd, int gt_id, uint64_t ns);
>  void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
>  struct xe_cork *
>  xe_cork_create(int fd, struct drm_xe_engine_class_instance *hwe, uint32_=
t vm,
> @@ -82,6 +79,8 @@ void xe_cork_destroy(int fd, struct xe_cork *ctx);
>  #define xe_spin_init_opts(fd, ...) \
>  	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
> =20
> +uint32_t xe_spin_nsec_to_ticks(int fd, int gt_id, uint64_t nsec);
> +
>  bool xe_spin_started(struct xe_spin *spin);
>  void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
> diff --git a/lib/xe/xe_util.c b/lib/xe/xe_util.c
> index f0b6bbb2d..06b378ce0 100644
> --- a/lib/xe/xe_util.c
> +++ b/lib/xe/xe_util.c
> @@ -4,9 +4,11 @@
>   */
> =20
>  #include "igt.h"
> +#include "igt_core.h"
>  #include "igt_syncobj.h"
>  #include "igt_sysfs.h"
>  #include "intel_pat.h"
> +
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_util.h"
> @@ -235,3 +237,41 @@ void xe_bind_unbind_async(int xe, uint32_t vm, uint3=
2_t bind_engine,
> =20
>  	free(bind_ops);
>  }
> +
> +static uint32_t reference_clock(int fd, int gt_id)
> +{
> +	struct xe_device *dev =3D xe_device_get(fd);
> +	uint32_t refclock;
> +
> +	igt_assert(dev && dev->gt_list && dev->gt_list->num_gt);
> +	igt_assert(gt_id >=3D 0 && gt_id <=3D dev->gt_list->num_gt);
> +
> +	refclock =3D dev->gt_list->gt_list[gt_id].reference_clock;
> +
> +	igt_assert_lt(0, refclock);
> +
> +	return refclock;
> +}
> +
> +static uint64_t div64_u64_round_up(const uint64_t x, const uint64_t y)
> +{
> +	igt_assert(y > 0);
> +	igt_assert_lte_u64(x, UINT64_MAX - (y - 1));
> +
> +	return (x + y - 1) / y;
> +}
> +
> +/**
> + * xe_nsec_to_ticks: convert time in nanoseconds to timestamp ticks
> + * @fd: opened device
> + * @gt_id: tile id
> + * @nsec: time in nanoseconds
> + *
> + * Return: Time converted to context timestamp ticks.
> + */
> +uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t nsec)
> +{
> +	uint32_t refclock =3D reference_clock(fd, gt_id);
> +
> +	return div64_u64_round_up(nsec * refclock, NSEC_PER_SEC);
> +}
> diff --git a/lib/xe/xe_util.h b/lib/xe/xe_util.h
> index c544d912f..06ebd3c2a 100644
> --- a/lib/xe/xe_util.h
> +++ b/lib/xe/xe_util.h
> @@ -47,4 +47,6 @@ void xe_bind_unbind_async(int fd, uint32_t vm, uint32_t=
 bind_engine,
>  			  struct igt_list_head *obj_list,
>  			  uint32_t sync_in, uint32_t sync_out);
> =20
> +uint32_t xe_nsec_to_ticks(int fd, int gt_id, uint64_t ns);
> +
>  #endif /* XE_UTIL_H */
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_mo=
des.c
> index eeae9d122..0bcd49cc0 100644
> --- a/tests/intel/xe_exec_mix_modes.c
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -22,6 +22,7 @@
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  #include "xe/xe_spin.h"
> +#include "xe/xe_util.h"
>  #include <string.h>
> =20
>  #define FLAG_EXEC_MODE_LR	(0x1 << 0)
> @@ -132,7 +133,7 @@ run_job(int fd, struct drm_xe_engine_class_instance *=
hwe,
> =20
>  	if (job_type =3D=3D SPINNER_INTERRUPTED) {
>  		spin_opts.addr =3D addr + (char *)&data[SPIN_DATA].spin - (char *)data=
;
> -		spin_opts.ctx_ticks =3D duration_to_ctx_ticks(fd, 0, duration_ns);
> +		spin_opts.ctx_ticks =3D xe_spin_nsec_to_ticks(fd, 0, duration_ns);
>  		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
>  		if (engine_execution_mode =3D=3D EXEC_MODE_LR)
>  			sync[0].addr =3D addr + (char *)&data[SPIN_DATA].exec_sync - (char *)=
data;
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 0ad2490a0..5d9afaf3d 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -277,7 +277,7 @@ static void xe_spin_fixed_duration(int fd, int gt, in=
t class, int flags)
>  	xe_vm_bind_sync(fd, vm, bo, 0, spin_addr, bo_size);
>  	xe_spin_init_opts(spin, .addr =3D spin_addr,
>  				.preempt =3D true,
> -				.ctx_ticks =3D duration_to_ctx_ticks(fd, 0, duration_ns));
> +				.ctx_ticks =3D xe_spin_nsec_to_ticks(fd, 0, duration_ns));
>  	exec.address =3D spin_addr;
>  	exec.exec_queue_id =3D exec_queue;
> =20
> --=20
> 2.47.0
>=20
>=20
