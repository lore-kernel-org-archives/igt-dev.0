Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C95C54FB3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 15:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E306510E2B4;
	Mon,  2 Jun 2025 15:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nkFQ1MMG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C5010E2B4
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 15:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748877522; x=1780413522;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ytqvtoOlaKsbk6oWOceo5MtxV8f1ZVDw7ut02v+M44c=;
 b=nkFQ1MMG/qn+5n1iWjqbOEzNy4I4J+MPf7HsZTnXlmiiqR76En9iTHDw
 8ssE2Ei6o97Ja1NROZA56rXxelUN3y4Uhj2QupQEX2LGMYjYHiR31v915
 GeFg0vBDmvYx2GwSxWGY5KZfPxZqPpXOvYmA2czGKYAtvZvYgcgPozbTt
 opW4hkxSYUCNOwyJbuRIZEdimi7x4vtCemQblGP0K5bQoIDj1X9hVEY0m
 U1fOTzJvQY8swNdsxncazf+iMzZ8Wxp4GrZUYHzPJP+XlMW0rpESHDLfq
 802qsbP4QNcD8SW0moGiKrvawDigx/ZAATkUrUd5rF6RzcpM222ApFOLJ g==;
X-CSE-ConnectionGUID: TjGBlNgARC2gSPY8jH6usA==
X-CSE-MsgGUID: p/FbmeOfSE6Q0Nvrv4m3gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="54691258"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="54691258"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:18:41 -0700
X-CSE-ConnectionGUID: +nkYWWx3SFy0bqSvFMtx3g==
X-CSE-MsgGUID: sXqPB00fQeCerth7rcOBpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144525136"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:18:41 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 08:18:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 08:18:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.65) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 08:18:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bs6kSbGBYux9uctijXc1qiPvKANqJM/UUlLvRLW55fDfV1FFc48ov2dGWJSd9gksBlgpBVpM+KpePTyPihHL9RyQyJ8bArb+1lzpVzeE/V6xUIvFHqV21TzMGaRFgN0H67wiXgAqshygSiQldSt1xA8GZx37t4pktQRSNhQVdeLLsOZ/xWyea++lG+tkCDsG4yfNXZ8LvMc6GwzOT6D1q2MoIph2uL9wnygoGry859qvDSb9qKFaJO3irf0g2ucS4GQohytJbp6gchwjEXUbYs/PVSUGfxSeqnGpc+oLn0/ptAByJMYbpqsq0NdpWZAkEh2FaNAlRg/XYPNICJvmJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOMgWiqsqZKcsiFJr/lvkD+2o4kcDpcWAIi4lP6WTuY=;
 b=ZQJM8Hk0fnJ8ge6SIpLDdmSkNmDtrCIztRju2Xi6bnYs0zSIL8dtqev8nPQ6zLPS19UJ+sisThLTkRS1762cYQfabCJ1tgKF6ogjUTRFARdF3Cf5jxkXBp9CS4Bjxj3fHVlLxky/CzkcfCyqNvvamFKBMMgnxsKFv44boX1jkD3hO6DcSvyd9kwzivWNftKC4Rn0AauriMOsgZV+r9gP3bY5bRSBuVIt3Y5JrPdNHA980XAhKgz1dqeqjR+PJRlbs++dw+Lm2BtBYMuFHzE3gCd8249kVdag0c0ZRxfoDUUzQ291YTBeP9eK4/MnmTbN2jx9vLPQWqlrKF6k5DGM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN2PR11MB4583.namprd11.prod.outlook.com (2603:10b6:208:26a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 15:17:57 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 15:17:56 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, "K V P, Satyanarayana"
 <satyanarayana.k.v.p@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "Dugast, Francois" <francois.dugast@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb0JvCnpB9WjrebkeSiFKJEHnUQrPqCzmAgAAR3YCABb5jAIAAECpA
Date: Mon, 2 Jun 2025 15:17:56 +0000
Message-ID: <CH0PR11MB54449E4951EFE269EFA0C64CE562A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250529133132.29912-1-satyanarayana.k.v.p@intel.com>
 <bafb3f48-e1bb-4ed4-8419-dd5e85875795@intel.com>
 <CH0PR11MB54442A56220EDDF9DB18A52DE566A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <7aa19e84-6bd4-4e6c-a70e-242cf96a102a@intel.com>
In-Reply-To: <7aa19e84-6bd4-4e6c-a70e-242cf96a102a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN2PR11MB4583:EE_
x-ms-office365-filtering-correlation-id: cb0d4da8-9126-492b-7a79-08dda1e8a75f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vDUkek9ersjLdOMyWEnyopD0isaZMghO4DkGQ8YOggloA8Y6GMn9V1L3x/l8?=
 =?us-ascii?Q?s7C64zuqVz+G1cE7pM8zLae52POL8DCuPZV/QzFonAAov8X7Kj0tvd6bqu5o?=
 =?us-ascii?Q?ZLuPhsArhUsMkZkl6OSDOquc3mv3N17o4XQw0Idg1OHYJe4MO5dhRjBO9zED?=
 =?us-ascii?Q?e8C8349OJFTCK+DJOUeD5YtvcVJ9ehaI8D9pulBooLdQ1Z5FvH5nl6Q6MM/1?=
 =?us-ascii?Q?rNspNNgutYf6iyNkt2YB0C+rMQiKexxr7anZu/cdL63g80Qy1VE8jW7rjw/Q?=
 =?us-ascii?Q?NS5wq3XsMekP8hoPQpGye/GFvZSdTLAyCRufUd9GXHZX7fCeSHVsQd31np/k?=
 =?us-ascii?Q?hEUHCyXLguKKhO4AjUZOF33kcabVSGk9d4TQp/xVWWKnhWg4NtmRb7RGKXa1?=
 =?us-ascii?Q?UOKxc9TUBNkGATyjzTz5oLyDjXEJe021BxnGKOYvfSiRx9TxATCg5tjsnQM5?=
 =?us-ascii?Q?cxDu4zTijumureCLGwXCi60gVno2Jq3gdLrZ98nmZ0Y1sVK1l0EahH+lf+QT?=
 =?us-ascii?Q?rmOpFC/2nz9dxtJX81VvthJlkefsLj8R/DzYg6wohqwYxbkGz0Gf0Xutygoc?=
 =?us-ascii?Q?Y6WuGgeAYtDDX7l8z5XO+mrupJFq0uf3Pk0pQOBwvVT80bE9q/uu+iQKWalp?=
 =?us-ascii?Q?qhlF5yRptLj2lsJ+5ikvqWfz8UOwPPF0OtCzTDzoosJmWQeKo2JtgLx4IrUe?=
 =?us-ascii?Q?gxVeu/8b04u7KvLEIp9iAVt/JyFh/RcD4jAJTJxoyKI35Hqu5VG1ULybrcG+?=
 =?us-ascii?Q?s+gClCqWugFJN7PRa0LZDaqbEzR1xkrHugXBNAQPHC9rkrs8eDqJJIF0FZ0K?=
 =?us-ascii?Q?izQqUlZkRb7oq9gQZ1/0nFD7zCrHcKG6ZcqtA3BlDEUo5uWwvXEl2cmGQKbh?=
 =?us-ascii?Q?Rv3fnnPawFQ5NuQd9m2EQP5FtRUYZF0fuXUSyWexiwD4Je6Z5Xcug7vywTEV?=
 =?us-ascii?Q?ts1UWqEi9PEftw3j73U45Y18RgdLG9ej6VmouSkGj3TpG+G39RuT4zOR+41e?=
 =?us-ascii?Q?xJTdVoY3Bw4WqwesoN+CrrbJLyPSFosdePcl/FvcPPh5j3ZPVv4JOrGf5G1a?=
 =?us-ascii?Q?OJuG3fZPJF7hDWt/KrT0DzFkpsWs69lri18nCy1f7T9FUTB4UG8LcGHcpEFP?=
 =?us-ascii?Q?uPvR2/WhK6vGJG45Zqa0X/RWeUMErXcZ1jmcgGWqKuX7RbMPJedkOkiMG/+x?=
 =?us-ascii?Q?C3Ih602e+kSOOApk0AAf1v1zPCRpGaROQ+BIohpGJ2HdDp22PCIbxrDhXxh9?=
 =?us-ascii?Q?EvUQp/owv4hzeN5jP0Ldo1oZJCFj5D/jgznN/ovBvx23nWenXj1x52c0Do8q?=
 =?us-ascii?Q?H2b7jlN5Y4PQ3LJ2Pt89ndGWWNB/kg/gBJLntfJcCfrqHT/ouyrYaD84JgtO?=
 =?us-ascii?Q?X+eqC5Pwc5SkgoBEOm39LbnnOPvjhjkVlnSOfIRto4Oq1Ua/PeB4gyeCQSV1?=
 =?us-ascii?Q?VbALbpnFmWEucYXRawWuZQgOQ1i2ceTPOuhlmJ8Jk2Eem7Jdg7ksDIngWPZD?=
 =?us-ascii?Q?HeFcdxbC77kUYWc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ie2Bhy9+MpSxn5cVbYUe7cW9aoQ2VI0od46Po9EHJnTqyzmvrSmzF4LlcM+Z?=
 =?us-ascii?Q?b/fG5GbAhDZ8WslLXmlgS8TU2piKwIvkt2HIFh/Ctr80SDwYMagsxPaH94xm?=
 =?us-ascii?Q?SRboJw2B53MLfexOUjOgFNMiwgi9Fj0oxcVvy931etU5ZjKDRu+MjS5HxAbI?=
 =?us-ascii?Q?mm9odSTTCpSkg0tvrYynn6HiR8K9nTS3JROHZvJM3UveApz7ba/3sH4cBRHL?=
 =?us-ascii?Q?SnNO0PqXspbV7pX6s2x/mZe01VLKDSOM4xQ19feBMhFHabQwM0iGdQBssOW2?=
 =?us-ascii?Q?/ColJJtv5nbDwtTnWEi5bQmfA88sq4EpCcm+aA4V/Hs7YKSjK3mGFAlpp5PG?=
 =?us-ascii?Q?0p8HFGHWd9vvLkGY7ZOAGqTJLTeBBGuLvYOG9Dbjcml08g/RZETmInC5zOmW?=
 =?us-ascii?Q?B441pS7julrdQyP4eJEKVJXV45DYbMp7si0mvcwWCEuJXWfQmO/5TpsVmbIN?=
 =?us-ascii?Q?/bJHx3NsW/+lRBA1Q+ZpGYf+ccOcrms5ERDXsDE5ol0CVNH1XdKuTKWHy980?=
 =?us-ascii?Q?d5y/9/SDwqgsnQG4cP7tkQmU+SNN06HeWcLUlr+//621DnY+mtU1vwtl7UND?=
 =?us-ascii?Q?dKkDMlOZXUEd5ACRVKfVuJZG7rKA+asg5/t26XkVuJ10uiMNQejDRnLuLBXk?=
 =?us-ascii?Q?KoQYCtYbXQJuomCG+L6e3hZ2jtgsGYqivPa0jUcUiQhfLTuE9JGniWp5jjPl?=
 =?us-ascii?Q?g2TOEALEevL4pkN/TSHegrh/htVeHoizbWryOitNAbbyMooX8l8YyN2+MUWY?=
 =?us-ascii?Q?SSkEVt3maDP9W6PMMWwRf16DKAivpoihUs5iGkAuR+CI5hk/7cEen0dw05xp?=
 =?us-ascii?Q?AbSmTJTWEcnTNr+zQVMKd24GckhjmV49h9OaNt1jZMpNd14bPwg6BVnYMlQm?=
 =?us-ascii?Q?O96G4Vj/2UjvqZyLQVbRHYTdqBn6RwBoCWPzQdKU9hUbLeuu0AvyRifORV+L?=
 =?us-ascii?Q?d7nysmr4SxeoURi8MkUJBKvcRphlGC9N0LWUW4GINTfwkvpT89XTA049BXPx?=
 =?us-ascii?Q?HZkQpFkscW0smf95IMIF6rADNB5qnFensmXS0iW9jrlYuNP9Jjh500+WUWko?=
 =?us-ascii?Q?pHE0FobxDjRlM3WSg+hxPCvXbuJ+HWuEhX/6OZNVQy9UA9vgKa1cOTi9Bo28?=
 =?us-ascii?Q?2HJ74xbnB1AL5bne0bPXTW6lx67CeHSWRu345eBhPXWSRfb3ukKMOhQVxeum?=
 =?us-ascii?Q?PAgIJtbCwG3Mrt134PaRvLxZcSiOHgoE079JnA3+gyRQjsHpFO+V1fNjafUz?=
 =?us-ascii?Q?qxLroytmosrc28Y75Y14DOr6RzGAB1WvyE6PtTrVCZZqaHvh0ohpPl9GnvpX?=
 =?us-ascii?Q?vunjIeIgUsnLtF0oetELV9Z8WXCzibWehNxg/FPYxQMdpA77L+8gK6k5kRY/?=
 =?us-ascii?Q?HeZYOKS6emtxQB9aZfI0iQnP/TGGi2cG6bbxEsmZ6+ibbbvPPefe1Lxgk2NX?=
 =?us-ascii?Q?3TZoi2IlrSFG61Nouk/FM1s4KtqZLeMWBQ3DvHUbRzmbakNOJfLvNvBNFxMQ?=
 =?us-ascii?Q?IILkRKlI61HoBMLnkl88zodP+/XL603urlddbTvTVSRpu7Y6uBgXLD9hXztE?=
 =?us-ascii?Q?S2aPkRCOa5ruke4Oq2bNL+lwA9h8OvyJ9vIZBCwh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb0d4da8-9126-492b-7a79-08dda1e8a75f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 15:17:56.8793 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2SwuUeYUgVEyCLTwsi5uuej4zrFYyk7zW7qUR2evTP/R33bxJaDidxH/ug7SbrzrD172FmOh7aly4DbufZ1RxR4H5RK8cobvbaiL+nUNFZM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4583
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Monday, June 2, 2025 6:01 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; K V P, Satyanarayana <sat=
yanarayana.k.v.p@intel.com>; igt-dev@lists.freedesktop.org; Ceraolo Spurio,=
 Daniele <daniele.ceraolospurio@intel.com>; Vivi, Rodrigo <rodrigo.vivi@int=
el.com>
Cc: Dugast, Francois <francois.dugast@intel.com>; Harrison, John C <john.c.=
harrison@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all error=
s while injecting fault
> On 29.05.2025 23:48, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
> > Sent: Thursday, May 29, 2025 1:14 PM
> > To: K V P, Satyanarayana <satyanarayana.k.v.p@intel.com>; igt-dev@lists=
.freedesktop.org; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> > Cc: Dugast, Francois <francois.dugast@intel.com>; Cavitt, Jonathan <jon=
athan.cavitt@intel.com>; Harrison, John C <john.c.harrison@intel.com>
> > Subject: Re: [PATCH i-g-t] tests/intel/xe_fault_injection: Ignore all e=
rrors while injecting fault
> >> On 29.05.2025 15:31, Satyanarayana K V P wrote:
> >>> Currently, numerous fault messages have been included in the dmesg ig=
nore list,
> >>> and this list continues to expand. Each time a new fault injection po=
int is
> >>> introduced or a new feature is activated, additional fault messages a=
ppear,
> >>> making it cumbersome to manage the dmesg ignore list.
> >>>
> >>> This new patch automatically ignores all error messages from dmesg, e=
liminating
> >>> the need to add or maintain a dmesg ignore message list.
> >>>
> >>> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> >>> ---
> >>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >>> Cc: Francois Dugast <francois.dugast@intel.com>
> >>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >>> Cc: John Harrison <John.C.Harrison@Intel.com>
> >>> ---
> >>>  tests/intel/xe_fault_injection.c | 35 +++++++-----------------------=
--
> >>>  1 file changed, 7 insertions(+), 28 deletions(-)
> >>>
> >>> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_=
injection.c
> >>> index f9bd5c761..0dffbe5da 100644
> >>> --- a/tests/intel/xe_fault_injection.c
> >>> +++ b/tests/intel/xe_fault_injection.c
> >>> @@ -64,30 +64,9 @@ static int fail_function_open(void)
> >>>  	return debugfs_fail_function_dir_fd;
> >>>  }
> >>> =20
> >>> -static bool function_is_part_of_guc(const char function_name[])
> >>> +static void ignore_faults_in_dmesg(void)
> >>>  {
> >>> -	return strstr(function_name, "_guc_") !=3D NULL ||
> >>> -	       strstr(function_name, "_uc_") !=3D NULL ||
> >>> -	       strstr(function_name, "_wopcm_") !=3D NULL;
> >>> -}
> >>> -
> >>> -static void ignore_faults_in_dmesg(const char function_name[])
> >>> -{
> >>> -	/* Driver probe is expected to fail in all cases, so ignore in igt_=
runner */
> >>> -	char regex[1024] =3D "probe with driver xe failed with error -12";
> >>> -
> >>> -	/*
> >>> -	 * If GuC module fault is injected, GuC is expected to fail,
> >>> -	 * so also ignore GuC init failures in igt_runner.
> >>> -	 */
> >>> -	if (function_is_part_of_guc(function_name)) {
> >>> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> >>> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM")=
;
> >>> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM")=
;
> >>> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-E=
NOMEM");
> >>> -	}
> >>> -
> >>> -	igt_emit_ignore_dmesg_regex(regex);
> >>> +	igt_emit_ignore_dmesg_regex(".*");
> >>
> >> that will filter out all messages, no?
> >>
> >> maybe we should look for KERN_ERR level messages
> >>
> >> if IGT can't filter by level then at least look for our errors:
> >>
> >> 	xe 0000:00:02.0 [drm] *ERROR*
> >> 	xe ... [drm] *ERROR*
> >> 	[drm] *ERROR*
> >> 	*ERROR*
> >=20
> > The regex for that would probably look something like:
> >=20
> > igt_emit_ignore_dmesg_regex("^((?!ERROR).)*$");
> >=20
> > The above regex should filter out all CI warnings that don't contain er=
rors.
>=20
> I would prefer regex to match as much as possible and thus include DUT
> BDF to avoid filtering out too much

Uh... Okay.  I think the regex that filters out all errors except for ERROR=
, WARN,
BUG, and DUT BDF would look something like:

"^((?!ERROR|WARN|BUG|[0-9][0-9][0-9][0-9]:[0-9][0-9]:[0-9][0-9]\.[0-9]).)*$=
"

At this point, we might want to consider a constructor for the string:

"""
static void emit_inverted_ignore_dmesg_list(void)
{
	char regex[1024];
	char store[1024] =3D "";

	/* Store all errors we want to continue reporting in store */
	strcat(store, "ERROR");
	strcat(store, "|WARN");
	strcat(store, "|BUG");
	strcat(store, "|[0-9][0-9][0-9][0-9]:[0-9][0-9]:[0-9][0-9]\.[0-9]");

	/* Invert store list with regex and pass to igt_emit_ignore_dmesg_regex */
	snprintf(regex, 1024, "^((?!%s).)*$", store);
	igt_emit_ignore_dmesg_regex(regex);
}
"""

>=20
> >=20
> >>
> >> and we want to catch/report all warn/WARN/BUG without just relying on
> >> taint (and WARN will also catch our xe_asserts)
> >=20
> > If you also want to catch WARNs and BUGs, then the filter would look
> > more like:
>=20
> we don't expect any WARNs or BUGs so we do not want them to be filtered
> out, but highlighted instead

My apologies for the misunderstanding.  When I referred to "catching" the
WARN and BUG messages, I was referring to catching them "in CI", not
catching them "in the filter".  So, the below regex should filter out all d=
mesg
messages that do not contain ERROR, WARN, or BUG, as per what you were
looking for when you requested additions (or, I guess, subtractions?) to th=
e
filter.
-Jonathan Cavitt

>=20
> >=20
> > igt_emit_ignore_dmesg_regex("^((?!ERROR|WARN|BUG).)*$");
> >=20
> > Would either of these be more amenable, Michal?
> > -Jonathan Cavitt
> >=20
> >>
> >>
>=20
>=20
