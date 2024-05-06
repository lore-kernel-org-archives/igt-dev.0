Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A0C25B10
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 20:40:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55AEA10E378;
	Mon,  6 May 2024 20:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B+jnE9Ux";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6550410E378
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715028054; x=1746564054;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bkcQVAkdKSUMwrkR44N5klb7afKVaopGfhwIPdJ0muU=;
 b=B+jnE9Uxp1uDFFmIBQBJehQWus2fkgzmsVg1oOjvTYInwX2UnfFWq7I4
 s+Kkvti/8VuKk/PJu90ZbZ902Lo2sJxI5sB+QndQsCcrzMizqgcS1PPKj
 bEdaau9UPgKLGn7tWn8htZPjXxc2OiA/N6YZvhoqrrzy54iT1BTfFMmmM
 4F0GypTN2x6sJk6QvOb7ZfOjFui+z2APEXBKwymRJ6oUgpwvSQQXudhiH
 fhML91/h2u1C7XIYcYVhHzOhZagVODN4pOTWQ//aS2Wqz9mra4paDo4hx
 9rZ4XFlnzIF8fqJVGKCVFpCkxrQ0ndG9FpB8Z1gQmUPl7kNWjDqXbLwaV w==;
X-CSE-ConnectionGUID: sA+jgbBZTyK2SAnemcrf8g==
X-CSE-MsgGUID: TSa0dEWUQgm0+A7EzIRqfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10950871"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="10950871"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:40:54 -0700
X-CSE-ConnectionGUID: v10XOKdoSBKJlGXp1YFerg==
X-CSE-MsgGUID: ba3JiNVBS9uWIyD1d8MhNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="32861169"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 13:40:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:40:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:40:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 13:40:52 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 13:40:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eh3H3quqViNbumoWo5bWYT+/db/8OFKtBQawXZwYKna2fZq7vqULWJ1gS0Tx1D+mZOQkv9XPMc4s4EsLE7Z968lUpAiidStJQDHU+r3Ykv/udOzFwUum6f57DjWSV4cPyRezthxf5ThNW+tC7QUW8ECO9p11EUuwXPB8GG3m2nuKASY1tYzAF4bE4x5TQ16/NHpYrD5JH0WcikoONhX9FNa785QU9sCxmrRSJVMfiknQ6/0V6F4HVRtUIkiicKapUH0xFISGhSO5WHbwoUot8SycaMw1Si9peB9ZvWhOCy8g9Me8ZHXxBZ6cgfZat+9s8p7TDw364lJcEAoSiLnllg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RarkeWtkOujGFhchnWIqKJ+mjRAfru8ANhSnDPpqxno=;
 b=AXY27h/wEpQxhocAQlOP/zGPoTgCRrVOZwDfK4lweIKCgJVW90uKhrvRRWA8QRYSlIRtrufgbpHRrqnnMpGvk2vcJv7UIUvtRjhyXYrIZ4ezAtQLhskLbB09rmbSq5Di55ny/1NDXegqxuiDihQuJG6w5JC6l5NEYyb9rcfRamaKLySqNvy+jYq8LTDDZu/D6OjPDQbeSaN4wgAh3i1NS4X8NPAWTbrwW29jJ2ROxWUEDfn7t93r8UxOSYMCtfttTIPhrgzMwspMBDxHO1xbG2hqdArpbszrSatr4q05fdrh3WNyPQAGhL7qE5no6ujtZn2Ii1940WlAMg1kSlITzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB4965.namprd11.prod.outlook.com (2603:10b6:510:34::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Mon, 6 May
 2024 20:40:50 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 20:40:50 +0000
Date: Mon, 6 May 2024 15:40:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tursulin@ursulin.net>
CC: <igt-dev@lists.freedesktop.org>, Umesh Nerlige Ramappa
 <umesh.nerlige.ramappa@intel.com>
Subject: Re: [PATCH i-g-t v3 00/12] gputop: Add support for xe
Message-ID: <rnuywqquwafdurmwjaorothvvnswnhi4yeraheywlytsxy764b@fj5cseudcywd>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <b1c38cda-2c62-401d-b5a5-dc518a600aa0@ursulin.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <b1c38cda-2c62-401d-b5a5-dc518a600aa0@ursulin.net>
X-ClientProxiedBy: MW4PR04CA0158.namprd04.prod.outlook.com
 (2603:10b6:303:85::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB4965:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c03a546-57e6-4c64-6964-08dc6e0cd0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FAjGpilFz9Vx9zyjBgTvf/IuUbPwr5yptbu7pHAw4HJfD6bUXYthy+Rb6GcI?=
 =?us-ascii?Q?Z3gK2GyNvnMHnqPOjSJx4OwwTK7PBp29HULUXFpO3CKm14SRpD88pCIcaguC?=
 =?us-ascii?Q?ItHrDmFo5jd2wKxHNgTz39pCVm1aaR+GE0PZJgWlsB99Kzy5q/O+c+n5waRf?=
 =?us-ascii?Q?exeCHWCFRnoJbN/jbLPX32WFvj39CTfwVz7YA3oOX88Kt3FhcT+UCl/sE6Bi?=
 =?us-ascii?Q?vlG5QtaUC2qCHuxfHPDZWiKtZmW3QKyqM/but2AExxuaxde333blgvNx7FWT?=
 =?us-ascii?Q?ZKrozQsjzHg+xfVLHHpGrbCkwPXRz7BK+zm1m+l3gEwB3acHYkGIaD/RfLDZ?=
 =?us-ascii?Q?EFIE++k29CgQCi26gFP/DzhgYpLFZjoX4H7hTKb8031nBhmAw3rrxbA8g4QA?=
 =?us-ascii?Q?CmFSPPZcRYmSDChTEDdsEziyX7hn27fTbRSktrhSbdRko/RonNfYJCqFQ0Yf?=
 =?us-ascii?Q?wOHsI3C4FkM7lkECoY/YanboX3GkspLB4G5zr4FvR6uJF5r21TTQhXvwUbeo?=
 =?us-ascii?Q?z8iodncQrm056S6dzpAnsl/3cJjFMasTa9XG0TASHtA6jQ+rf0HNDoGyMd3j?=
 =?us-ascii?Q?/F3vMqp507FKuW2a1ZBH+jGu3MSWddoIaWrANBM653KhoNZ2mYyA+FFcBUjx?=
 =?us-ascii?Q?y8A824bvtYu4hqeE927Bb0kHlH+f3q4IxFcfd7722AZcZ7sOtr1UTN6fk8mr?=
 =?us-ascii?Q?NWzLN0CAUIsAWjF/GKXa5cr9LTkb66ffL568IBE/p1aL57EUlnDieCg+Vix4?=
 =?us-ascii?Q?cfnMaQyxf4EPTL806Q2wDhV9OkXi424XQDEbZcl9OqHFfzaxtDQgmZCRloag?=
 =?us-ascii?Q?GGiaIqwx3fgJpCkfTtD5gSJwSMTk9s7RbdNYZHAX2AmYSuIREA469EfaoCZf?=
 =?us-ascii?Q?sxHHnAAYB5/lwfzt3VWtzojbb4f/eWaAvgWMvXH2dQIa+TKsjZIkFLiaNroP?=
 =?us-ascii?Q?NAwDAc3nzB5RBYZjUxHctLuDpSOojmdweFSUazS1zGs5kBwWTfojEOZF4K5d?=
 =?us-ascii?Q?LdxG5DvHoSrTniOYA41csYSfExBVJXCNQxPLy3eq1DEL14pXmWpc1fuasLlJ?=
 =?us-ascii?Q?KjBkDoCkfSAb770yvhA803FDoPocX6oxvktBVRcVaALqymVa4KwJ6qzAj+y7?=
 =?us-ascii?Q?adEdZsO63flDa8R1WVLwIsSEUK3UJ11zNIGUY8h1mYDqbL3qi5eQyHbPeFFI?=
 =?us-ascii?Q?1KEwT4FRgt5cgK1LRmxecUH7ABAqYYa3yb0rHHbJl0y0yY2BKyKZ5pJB5CM?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jSzMue2SIOrXo43JYMUfxXlr/swmGll5zCYxwUCSqkp+eFqeHyNn0oyk7JWN?=
 =?us-ascii?Q?FG5jCtsPI9ULdusU6/Is/SMbC5HrT+42mVy5lvAHpszQXxkxNg1NFUsNDT0g?=
 =?us-ascii?Q?8wE54SDGVwB6Nfsja37lyXVWv1k8dVYgJnJugEx8lptxZ1Q0oIYTaG2hUhfW?=
 =?us-ascii?Q?OCQOXo0DqsPFgkYeDbUTVv/Fh2D+fnOpWZ9RS/wUGslmzZCmk9Zd29L3tPd3?=
 =?us-ascii?Q?Kms2IL0gFml19o4T2flawsBp8NGK2V2EsFJcKhYk593rggTL4wH3muBTZ3za?=
 =?us-ascii?Q?5WkkMVO2Ay8hq6rFiKp830fhkuSLFvizrzLSgr1546v3iA/6VYAPL4iJCCcT?=
 =?us-ascii?Q?p8h5qA7T9xF3S2X35/it3/4/KN+9xMbz4j+o3PQ7hn+RZekma3INo6+BY4N1?=
 =?us-ascii?Q?MNMajtm61+bYcIPz3tKw7scCYRir5axjwzsMfaVvI7tYMFAn3a1/0f4pRXwt?=
 =?us-ascii?Q?RR3C0WRTbo4SatHYt2Odl8qlHTfQo972qtvxQQc+pREmVWZOqhrK/AY/tDvk?=
 =?us-ascii?Q?eJMRMwBJsYNjpbqPDwp0UVZoYeOUT1Ph7luxW/enQL/mB0rID3BP+1QAm7u3?=
 =?us-ascii?Q?KQ8cp6TiOj0DyvxDmT3mTUdAz2Stor5l70+ZFWEbGrILLLOMcsQxDWGGD/YY?=
 =?us-ascii?Q?jNK25+VPqMSiWan6P/w0zfIatzQXATPs2Q+hxtO8oeNwdROWSbd17tfOULpw?=
 =?us-ascii?Q?mepYAdnesJCVRgcNV2xE2aFoXqmdRCV11g2HkQNEqzqGeFIxpBI/d+DU8czK?=
 =?us-ascii?Q?9jCas5CT5kaq7wBxXFvEdGJB2I1tYSYe1v38x8H/YKqH1r6QF0MzN/stfb41?=
 =?us-ascii?Q?vvFaYZk3xJhOMq0naZeBmoz1kexz1vMKCQFpbPlAswNAJO4YhSzH5tZigkYs?=
 =?us-ascii?Q?HNk9E1aPQLi9OLiOawIbej69ENfUEmNNFsW/EyLidWy+wJvrCWFFfNFhjXgj?=
 =?us-ascii?Q?p3O8+HwENQIMXTeceDLdZmF/rviFTdKy4Sv2XU3sybr9Ch9IS5LPyTQ9aA+t?=
 =?us-ascii?Q?rCuaZkrr/gN0pKsFGZTPpNES6xcvvVeSm0Y/sDRv2BglWwZABcoZQvLeLBHC?=
 =?us-ascii?Q?zLib1j1BFfdnbnlDfg4y6BpfEHtftoV8A3S4EKIC8JOF2kDU7bkgcy8eepl2?=
 =?us-ascii?Q?UTXgmfiuJAmjFjW8tyo65BoYJEDHlR4006k31XbMH1eT8nEr8KQFfFy5Lba/?=
 =?us-ascii?Q?aAnaQNcJxQUbgTh52iNVWJ+/M5k9iJP4kJArFzYagy8ZA8o7f2f9tKPGS1kw?=
 =?us-ascii?Q?p47opv622mTkFAVXVqU8W91Hq/H5CPWi3ywsRjfQzyBp+L9LVH4V7ugObTka?=
 =?us-ascii?Q?mvh4dslWNISLlOgiORWzf6Es77BQtnOVwr7ldP7rfpOMy+hDRBBOGgAJmWlB?=
 =?us-ascii?Q?iNnjgeQgPcH/8aHqVpJICm9Bn9QDDck/aQKvBWmZ+MKZCsL1pazxgEg94cAL?=
 =?us-ascii?Q?Z4BCdUb+h17Jtimpe3d6OlZ+LOGijNzd+osRrgonYMyDBcJWMsIBoBpJntIU?=
 =?us-ascii?Q?ssHZuMrqTvvXKez9tN1+nKnnIpsuG0n1yObumwwPv6kmBClcvghDbb4YIp8Z?=
 =?us-ascii?Q?1qONmw9tCog/SUJO4evL/5o8rPukvq7c1hoMJhyXhIiv8kqzfKf/xgjIMLUP?=
 =?us-ascii?Q?TQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c03a546-57e6-4c64-6964-08dc6e0cd0a8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 20:40:50.0299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nvyMwGSgdEQT+kUPOMorfAaGd7tOb9LKKGpSlW+PYY8qXy5IFllCCE8RM+Qiv5s8Iwz/5xIC9FER7xczQXLpp3wVIHViElDikURIqtDiqh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4965
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

On Mon, May 06, 2024 at 11:37:13AM GMT, Tvrtko Ursulin wrote:
>
>On 04/05/2024 07:46, Lucas De Marchi wrote:
>>v3 of https://lore.kernel.org/all/20240423234431.1959354-1-lucas.demarchi@intel.com
>>
>>I moved some gputop eye candy to a separate series:
>>https://lore.kernel.org/all/20240501173303.115737-1-lucas.demarchi@intel.com
>>
>>This now also moves all the refactors to come as prep patches. The
>>drm-total-cycles addition is  in the last 3 patches.
>>
>>As requested fdinfo and drm-clients libraries now don't take any
>>decision: they only read the fdinfo and calculate the deltas
>>respectively. The decision about what aproach to use to calculate the
>>client utilization is left to gputop.
>
>Approach LGTM so ack for the series. Hopefully someone else can do the 
>detailed review.
>
>Just two observations - 3/13 I don't know what the "fixup" is, 

my bad when fixing the previous patch and forgetting to really squash
that in the previous patch.

>supposed to be and 12/13 incorrectly mentions it is adding some assert 
>to intel_gpu_top.

I will reword that, thanks

Lucas De Marchi
