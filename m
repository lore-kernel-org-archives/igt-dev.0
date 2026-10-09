Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FB7CA5FED
	for <igt-dev@archiver.kernel.org>; Fri,  9 Oct 2026 05:48:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA4C10E04B;
	Fri,  9 Oct 2026 05:48:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9OG2ZUi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D817C10E04B
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Oct 2026 05:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791524860; x=1823060860;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Du3np+LcvoPX4LxKptX0VkriOPgUXX/XA+xhijzwuzM=;
 b=I9OG2ZUiTgZPJPhvWxR1Z/mbIiasSU6osqqBHnJ2eolCl7fcC/tOVfwY
 Vk1EvqCXjA70NWDSOhHFr4aNfri6t6BuMh+94aSe29tQVqUP5DpTz0cjP
 uE3l1GgO3TcXqS8iqHuRzUVHXWgLNuSKXYE/MusBM2C1ylUX6vXMIpapf
 Zp2YvjjaOYvci4LVkjOK33aWYTqpyfyTghzp06ddfWwrReK8jxcSnLj+Y
 sikNQPTJmBtADF9dU0qjEDN2TCgRJpF4x+o0k527UvL0/zHSvfedJaie5
 x4RZ313S0Cot0DUArCGmkwaW2Ox93gLOq2lhZ6Dc3+V9b8EtVl7by23LY g==;
X-CSE-ConnectionGUID: vmB9EjuHRL6Y5cNU143W9w==
X-CSE-MsgGUID: 2D0ChjWuSoamGwA772Kq0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="319093"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="319093"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:47:39 -0700
X-CSE-ConnectionGUID: tXwyGNwrS1uzhe3ap/NEbw==
X-CSE-MsgGUID: o49qqxHsRlew7ckEYVKj/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="552162"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 22:47:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:47:38 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 22:47:38 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.58) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 22:47:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btEhq2Jg8nE8+zfdIcVQ8P0ccfiejX71WQhm1x5qvA0IBQ72tvtrtC4nsdNLkVjcwvHaxnpQ7yhdO7HK2nYTPZcnq76CSexpN6nRLPtGTUN1xUoAfm2I7GXyGViPJS+mQKNopzEpiokbuX55RzKyMGxj1CXEQihzPzFPUXa5jW3AMlhNuMO5bBNee/EOszX75d5xVTKSkssmHzGj//OVi0/IaImFn2hfa89wA1LyZ2hckCDnc/Y4+VWpJEdjTiScqT7uhxHQFf4Jxfgz4iAadViIxw+NgGkjn+kPnS40yFfDfMyZrjeSSrp+y5M/IqZG4JYtauMe1b5NQxVMyeViDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Du3np+LcvoPX4LxKptX0VkriOPgUXX/XA+xhijzwuzM=;
 b=jt2rTub2PKRwHRBULNJ6NJ/OP6Ak3TotNEfwmqw48s/EjUnMygAza6aq7AqbdpDKHx/P/nEvX8QvCXbyddhviy4LqwNEk1Z09AqIQZ/5/BqKUGpWSHRJWxMNwHr/cW2sO53M/xztinrG4xYRgxyP14TNVlE5A5UJWrllOLub7MOdK8kwTjoYFJS90Ube0gnm8/1L/VFlcBta5bjPEtopjNLRpnA7S2SYgSbJvBDyDSHLfNBBrfY19rT+qFx1uNMZUDAdMt7bQAfYNzqnTJl1MDmLi5o6wJmfgkF360u4qFD5tqDKxatdyVSMX9MhZ+ikaoUq47d8y7C877U/SivKSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB5776.namprd11.prod.outlook.com (2603:10b6:303:183::9)
 by IA0PR11MB7306.namprd11.prod.outlook.com (2603:10b6:208:438::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 05:47:36 +0000
Received: from MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e]) by MW4PR11MB5776.namprd11.prod.outlook.com
 ([fe80::b568:69e9:7abf:180e%5]) with mapi id 15.21.0496.010; Fri, 9 Oct 2026
 05:47:36 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v2 3/7] lib/igt_pm: Factor out power attribute path
 construction
Thread-Topic: [PATCH i-g-t v2 3/7] lib/igt_pm: Factor out power attribute path
 construction
Thread-Index: AQHdV67OcY1rFD1kKUuR2ibSegU+ALb0s9lA
Date: Fri, 9 Oct 2026 05:47:36 +0000
Message-ID: <MW4PR11MB5776E6AA6F22D9FABBABD596DA922@MW4PR11MB5776.namprd11.prod.outlook.com>
References: <20261009052625.419259-1-pranay.samala@intel.com>
 <20261009052625.419259-4-pranay.samala@intel.com>
In-Reply-To: <20261009052625.419259-4-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5776:EE_|IA0PR11MB7306:EE_
x-ms-office365-filtering-correlation-id: 0b6b952e-6e54-482b-9cee-08df25c8d27c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|56012099006|11063799006|5023799004|10067099003|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: OeZ34OuI1aBzkcKhwHeS6l1jz1uK1p0n7dA00McjACjQF1pAxUt2ErAy7gcg0WK1dxQU+jlzoxGjq24QcBDQ5iixuEkirJtqtq5xGMkQFFXH4ctDGsvNDayvluQXh8KnfYuOu+4M3+yZIdLq3MkdLO5RrZR0KdxFg5e2ioPe/LrUIN6mmccyxZgEy0KG3/+QQAaKsOGglG7K2hE1KjteNEs3p9iSjTP37mTt/8boX9/kZjoD0G/m1tMRR/LfUr1mbOH6NxEvh6B9B5bLig1vtp3D3xxvxWMc1huNJUNP0e6IRlz+BbiIKAdkvDcZTbLKsUYEIeURMNa4Gf26XDSBjxLROKGTkZHjc+0Qrxdh0WcSUIjE51YL4bqelwzxudOgzq2lrrpVJ/3At1kXGSJAV68WNjI4Thd4YWslAqfqSh5yloPdgeMTSQ0hms2WFPlF3oP4jOXHLb/OhJnERkRIJYDv79PWHFaN2I1SJBFL0v4qEVF3kq2hOkLAinxdYs3Se742pREz4TLOefuO6hroIXVgTjDC4SDQQtzj9D1T/wQTSXqB+LKXKoRgmGVjbf3FS4tulNUPh3/4MpdRXvgI1RIYDcosRjMoxJ4SGIC5ycjKqTqM3u8IKpIEYWf61KO7+nwwiTonqWDW+Da06i1gPNfk+NVIlTA1/bHym68CzClJyiHtX7PyvtUr6EVz3ksm81O1RTXJ+Can/L4/4bjOTx6IEp+IWsDz2Mcen22MX7M=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB5776.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(56012099006)(11063799006)(5023799004)(10067099003)(4143699003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+AmD6COu/oERXn+anKF3XF1QaZvWP8XMpe6VOQq2/hpl3cOOmmz6cPHxasSF?=
 =?us-ascii?Q?siiuCrkA4QpfHOesy8K816x8cIKffGtnu8Fm3X1kkLW8RWFlWjjTEvhOlWZV?=
 =?us-ascii?Q?1KvwJVlqZi7CaVGMDEDM38BLd4L2GR1vxnw7sR729QuI25soLe3x4PVQn2FC?=
 =?us-ascii?Q?divghVWmX1rsDFGv+bNDec0OfwnohBFNREJhyf4Hxms92lCBwihgLMdqlBEV?=
 =?us-ascii?Q?ca+DMCHr6OeGRuRPtl7EgCZCWQXf67DvA1F+omrIF8nC3Lt1Sz5NntXfY/5j?=
 =?us-ascii?Q?H3/7rUM1H8GbXR40DM7pB732Sh1BCXNknO2cmGy/s6P7oUmtopjl0GGyhfjW?=
 =?us-ascii?Q?XQoA9OmCRq9yQThx7dpJccjm1Mevl/ScUBeBBYr8xViYtQB409aqbJfGQVDY?=
 =?us-ascii?Q?CL1osr6OGdmt7EaSnH9DNk2G1a1wda5/2TenN3aVRw2dE+fpkHmHUsYEDBxk?=
 =?us-ascii?Q?gAyOw/t5fRcLIumo2imqUoMU5HwoRF5YizkFcG0r3jplOidYtAeRU9HjB+wK?=
 =?us-ascii?Q?vvVC084bVGLOWCF/y1T3VSi4T9c4KKhosNqmpkl9JlrVEugI6c/GbpYnTTML?=
 =?us-ascii?Q?5D4A9aOtK7LDuKLY9Bn60KxHY0GGazz1QAeb/wck3q3/nsgT8HoHolzhgbj0?=
 =?us-ascii?Q?gkQdu/bqEt8H8liAj9psdPK/Ad0+/2XbAhl0rG9kqcp9vnKdg2Q8uXEkmmlr?=
 =?us-ascii?Q?PMV6HVmt94gNylkAxl0FsSg3bOAq8fdECzbHX3ll81fRMQfLPYBd32rIpRhy?=
 =?us-ascii?Q?Ch1UStxh694EzZ/NNJCYArw9awY3EwYn2iClJrGt0t7+tzZEfJ9u5PXFKv1X?=
 =?us-ascii?Q?1vvsgd0ugAzM9cAg5Vwsa+7DkNrcEDF72VZwCMeRZyzQFZJHs4D469m3/993?=
 =?us-ascii?Q?YOCet11MIluQspmwevhOgFN3epc1KYyVH4Ftox3+i2q8uAFnB3myT6XseCq0?=
 =?us-ascii?Q?Mosl3GD8J1HW8rfYhfZ2XxMRRCf1DR28yCe7WYY4brBkozs06/w9XT3VrT2q?=
 =?us-ascii?Q?czgI2NhXvki7fwWWkrs7pLZy41cZDd+NUADNlTk8wV6ca3OTQfdPrvg4Ydtm?=
 =?us-ascii?Q?7CrvrJQ4jsPUDqDxql0iyCofXGI9ujbsbWvQxp8TbbHkGEFJSaQ/abns+VId?=
 =?us-ascii?Q?/gAeiMIq37+vK4Jb3KEqWMYta3Ic8yZW+IPAdKAyo5yu8a1Pe5Cbc5AhsLbB?=
 =?us-ascii?Q?Al9tweJO1VUTcGjZncFKQa6ReBUV5N3Yz3y3MmG+6wwHcKUSRLLhNi5rBW4f?=
 =?us-ascii?Q?BsRPo/kRKY0prqdjOmYheJv58EdhIj7waco+g9tVDzzntSF54v5VEa/cDaym?=
 =?us-ascii?Q?fmm0g1PAbDRdWWJ5r42XrbEnrZmw1Uwxe+vyoNLvY4iT8DomVDjXAWs/zrhL?=
 =?us-ascii?Q?3LdA4Hrx/VO9cBeZyaaq1noQNLg4/s1/YQbJERVOaLsfq5HiS9Vqm4Mcka4E?=
 =?us-ascii?Q?DlSfGafK3wBmDWLyWebmJMtt5r3th9KwnQDIMlXNVLrLzZmvc4zs2FNeCMuA?=
 =?us-ascii?Q?UdnbbUdXkwDN3mbJWhv660QmftL2a8zk/ir9as3HHto+uTjOYlz8nK3SkBMB?=
 =?us-ascii?Q?GseO/MoycRiWkMbqfJAHb/Sys3YF/pRLcoNcyUYmW/m3ox9TEChNfeB+EPa2?=
 =?us-ascii?Q?Io3JRAtiHCZUyippUwLJHigv2G1tsKpUowTXBTi3d/jwk9PwLGG7tf2G1f6x?=
 =?us-ascii?Q?rooFJoMPo9pqEQfDwTBqNLCHIYQRxH24xw0XnU86AROQ5kW5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0+ACk/NkzXi8VOd/hzOaJ2Oebw1jY4kGBl3q0p5vrOWYkwwuVPn5H5C1X60rMQR36B1Btw2gaxIOY+d2ktj5WXSda4oGpIJLeVBQIsUDjh1agQRzKPE91QgATrtC42qNKZc7XYjQZLvlpJAnSMsXQi0cs+zLPl9dr2U9cvyEJ1mxiXKtzqhe3wzQjGr5J0y/wH2eH3mJTtsGVzXBTaQ/k5mG+QzWnjNJc4UvmoL/lXWT5BiCeH9zKO2GHBlSWW0e8F0ZdEZ88K/o0nfeojI2Kk2iq9JeWDEqwlrIEliWvS/eqL/PgW0czLnGLCU6hog+/wCVunuvCwjQbLj/oCQBkQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5776.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6b952e-6e54-482b-9cee-08df25c8d27c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2026 05:47:36.4836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I74eS5uqNZZhApwV2MoSA8ppSI14hj2mT1x+1ifsFL+pjeFXfneHGhdNI3E8Buyr9cQZAGrZOIwzdDdSbAuBqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7306
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
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Friday, October 9, 2026 10:56 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v2 3/7] lib/igt_pm: Factor out power attribute path
> construction
>=20
> igt_pm_get_power_attr_fd() and igt_pm_get_power_attr_fd_rdonly() build
> the same sysfs path with the same snprintf(). The only difference is the
> open() flags.
>=20
> Move the shared part into __igt_pm_get_power_attr_fd(), which takes the
> flags and returns -1 instead of asserting.
>=20
> Nothing changes for existing callers. Both wrappers still assert, so they
> behave exactly as before.
>=20
> The point of the change is the -1. Not every power attribute exists on ev=
ery
> device, so later callers need to ask whether one is present and get an an=
swer
> back rather than failing the test. Without this they would each have to r=
epeat
> the snprintf().
>=20
> Assisted-by: GitHub_Copilot:claude-opus-5
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
