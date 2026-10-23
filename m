Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6549606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bI9UxC4e
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7810E5F6;
	Fri, 23 Oct 2026 09:04:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90FC6112A46
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792746210; x=1824282210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qSMD+Nomr0r8AhxHyEJD2ugfeJNIToG+EgRUCRdfyiA=;
 b=bI9UxC4efoBa2zbg3M9ywNvlWD1WuHrWm5EvGNaIi7cu9h7jbIiD93fp
 lTzwVZNcFqil24Y5qOJ+GXkQSQBPWBRDp6YFn/xRtyFQa1WKc7DeLEHOj
 EwtEEiIpj8+WDA9A7QUlOdlAXB63owEAiXbErU9NMS3EO5vBz5vff98zI
 tdO2f57H+feIaMKluB0VFLm5Av1R41p82HsjHxjRLmhvRvW4+LlGwKee0
 vtyZLxN/NUEslBShqeF35qBYyEx0tAV6u6Eim94GOifVVj3L4OIyAwpgV
 1A9TfR8WJj7yeklzpMcy2wZkNqHbfBbk3GT9k8d614RhGLUbt6uAbE8j3 w==;
X-CSE-ConnectionGUID: g7oIzAdfQSWtnH8aDinAKg==
X-CSE-MsgGUID: 8HJJlCbHRPmgqh4JVXfJ/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1392808"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1392808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:03:29 -0700
X-CSE-ConnectionGUID: EAwua+kLSeSCzFo0K5R2uw==
X-CSE-MsgGUID: 7mwXRiPFR7ClgbVyfAX8qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3943987"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:03:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:03:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 02:03:28 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jn38CuQOGU8geV/H2627tyd3BUvc1gFTpbI4/we4pNGorEQqTN5OIE7M2xi6kRXfJNlAPJaEM7fKBywccqdsGjykAojwa2INRow1JWmgHUb97bvN/aWjWPGkDvVDaDFMyCqjOedz3nCTZ1BNHx/0Q0V7AkX8y5CDBfaluRDZYkuDYIGjq9/fQIcDq0OIQrfiB5tpwtuS7sDdwYEIYc9htLt4X7kASax2KuWTEyk+CVGr+l9s09QsT8WfcHg1pOPHw5/WfZPj7TGfs//Ms/nRj3zs/59eILktfPFCpVeEGgvYFWrqE1noUcgYszPp/daWAiLgKbSmIEFAZYxUsIYkqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+5z/8R6Mnav1H12l9J9gU0pbvPBT+qnHJGVQm25WOA=;
 b=oSzHBpSZPMNF4I2SM68VQzgQ7Rh87aX032F9s0sj0Kgb8wuQUQTq5brBWnEBzpIygq9f/EnOrYOILmTPhnSCt8mynCSYfDp/xe4HGC2fn0k4zEKoGf1eiKvQxguzNyWiXgm3T5ODccrD8g4JNTIPKrDqLlehY11eFwBnss4ocRlakQMKe1taLAGsl6M0kqy5WQ8Hgx/gmrwRYX+C0hMw6AYFfcbEI1DkLMkPqYFvjXRcBBAeYyRTdWbWzqPaUvX1wskFRpaExuv6vaTBRo/iLS+iwNx8s+PCupJQe/xH8sINkUpYfl4uFcDp7/8tKa+Wsi3AkXviX7BwAmKk8eHdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PR11MB507330.namprd11.prod.outlook.com (2603:10b6:8:503::18)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 09:03:21 +0000
Received: from DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4]) by DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 09:03:21 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v3 5/7] lib/igt_pm: Add power/wakeup_active_count
 accessor
Thread-Topic: [PATCH i-g-t v3 5/7] lib/igt_pm: Add power/wakeup_active_count
 accessor
Thread-Index: AQHdYJ0JlGcuyR7H0kSlzwDeMr2ts7cK2Tkg
Date: Fri, 23 Oct 2026 09:03:21 +0000
Message-ID: <DS4PR11MB5073305F434B604F4283EF886CDA642@DS4PR11MB507330.namprd11.prod.outlook.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
 <20261020141151.753331-6-pranay.samala@intel.com>
In-Reply-To: <20261020141151.753331-6-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB507330:EE_|SA1PR11MB7112:EE_
x-ms-office365-filtering-correlation-id: bf17f6c8-9b8f-4990-39a0-08df30e47ca0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|261021123027099003|261022105027099003|261009223027099003|38070700021|261022075727099003|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 8yhLnkDSNdVEkk+V7la/0BBxkYixOH/vZmdtHYwLg2fe0/zP7kok1b6JVqMM9q6h/yOGuYOwI/Vw6aGHKcp+X7tN5hHpXvI2A0Y/AtR0xvCAYi3QXqF8q4erPrbHPASbA7TjPQOUA+SR+M3lrvEDPjMby2pPQkRt0t3hzM8iu9dfxVyYyGT32WdJq0p9NgtKeT7JiW3iX8XKkY//YWzr2NrR+RzLQMChXR+C+ZD6/uUJdXEZFVzKrf4gzA5otFAe97UwkpRYXMHihtPqcW0CKWRjYOJN4whQyqLfds4WnJ6dkm3AczySLte9EgJr6aOEzvPpgJsG8/Drjby/Ibzvs6HaqOGypXoeVf+E8isYoRDQ5Pva/z1OPww/K5lc89eGV0q6A5QnflS41ociEd3ZG/dvN1fsaDgHtWxv21M6C9V1ZyqL12alUuJecmzwk+Hz6/QcCDmwskfovv5YHVqiQmCSN1zb7SLUG6Lewo0rQNP9+gHS25TC3lbPUYr/TUuCVCf2Rxgk1sAZu+cikdkdITfrkqhqSoMtc0Ojui2a6y2XH88bH0gT7zKNIAI3wB9Kw/cqNy5fz5N69Ah9kRUoipe5V2n/leI443+evfFh2NsJR5YjUDZsoQpdaD9o/L5lu07pVfrDrOBwvro2GpQy2hlh0aK1an4G3deGGGG3hyqxM+GVh7+EgJ7MBPUIDFko3vmjDsllZOi26aVSguj1YBRx1lgbmlvzQYlV9p29qOU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB507330.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(38070700021)(261022075727099003)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RulPCfDwQN2igaz2witJ44zbnf4AhWGCtd59HrsSXefpibJXfsxaX8fYxQjA?=
 =?us-ascii?Q?v3j45KWpPVmr7JjrfAIH3zrQJYeYsn22X1VBSX4DFEqgnBOqqOJUNVhjtXSf?=
 =?us-ascii?Q?BV4BA5C/XZcdMNuUOAEeJoba4o42wK4ub3f4Z97/6ekorb+BKuGxOUim3M4E?=
 =?us-ascii?Q?wZaqAOcxl3w+opv0wB7cYQY0pzFjtnx2pZvGYJiM7pxL1OCDo4+EsZgEB1Zf?=
 =?us-ascii?Q?Dg9v9DnoEweQbLpCIMNC23Qe4jgilDkm0an5v/sV75e7Px01umKXeAB8kFg5?=
 =?us-ascii?Q?pYznGuJ3fXuPImHTUKjbYrjVhe4omR/ndL8SKQvLkipVfjXq44fkk4KbzV6x?=
 =?us-ascii?Q?GF5GlfcU5D4j/XYT+edqGH7Np8et5E5aoCV893kUL+YVSw7QUqkY1wlgRYqj?=
 =?us-ascii?Q?KNUkqcUpcQFs/NCdmoGr8s+aI3heSHvciJ2LQJm6LytXDyCmGDoBd1E+cav5?=
 =?us-ascii?Q?UL33boViEJpPwj4BVYPcPLInHd+sMyCl5NzxdExta7ZaDo5WPobh+KyRfy+n?=
 =?us-ascii?Q?Vx0vtFZoZDkAQdd4MlIs6ui0XX6y8bxUtR6uHT6OrmCGcUgY4AsqAh1anZE+?=
 =?us-ascii?Q?UAYhyvtkLfphC6quOawWi4Y9PScBxw2Z5eBVwqXYQaiRFqEpCa0MiQbT6Jle?=
 =?us-ascii?Q?FmSIULfCoFmHHV6AIqqifCHoFgLXyDsnChPAmk2oVFx8LZ5WCak+gUPtknhP?=
 =?us-ascii?Q?Ih5z6cKs3Voklenucgad2bol/a51nTlvbr3YnqjArUy8QFdoe5zRK6RZatgq?=
 =?us-ascii?Q?9n4PjoVjFerza8WtMB6QPIvRO1XiRJPytHgoBlL2sXVpXKbPbWZfAGXgX9gn?=
 =?us-ascii?Q?jQr4nyeI2DxFMONL3EVyYABqAK1vJNJoVETzMAVxn2xzbjg3od5Ef1tOoB3z?=
 =?us-ascii?Q?XsCMPw3lmjcZKsqOzcgIVGCFoJrkg6sBrm9NPEjP39D2+wYfq3FxVIEIn5bW?=
 =?us-ascii?Q?XAw4Bo3UWUIJN5gHNiPQxmzYPRRAS6hqHkUYqjADQJmwd2A17xcPQxAMxPjV?=
 =?us-ascii?Q?AfdgtqlHjz2GVxInpS+D6Wp1NftGXgtuYA3LIHSyN9pOxikdcxCg/1DzKOVB?=
 =?us-ascii?Q?RA/WDYjoAXwWj8FbrJqjxBSjP+3W6F/aVtaSYD0aD+Tn3ogUgjAhHMo7G4VX?=
 =?us-ascii?Q?CzqSgURSWFyIwnYh1cTZA3P2SsPafyboHcF63d7B7b1NC0+Wpwr8V5A9BUzS?=
 =?us-ascii?Q?W9t6+n+Kw8r6zQWoSGoJLtfp9AHoju9Zdo3aHhF0owcbYD38e3nCDmjoJ2BA?=
 =?us-ascii?Q?70+8nKC8XENfhySVtEYqCbKhSRTFlvQX3fU+NhpQOmvqEvbengm71OtMq5h+?=
 =?us-ascii?Q?ZSBJF8YEh2J4vgROC978qy4hKbsvB8Ud1rBuUJiFbGtaDr0AIiCsdiJCLRQH?=
 =?us-ascii?Q?HnGLxQY2NN5pjjTyGBDLFqbFt89RMVUpEpYAEXOwrJYsc2BS6oUat3M1ey3H?=
 =?us-ascii?Q?gnnTLBCOy3ZmKr2/cBAedOlOlmmyKm7pLTpZxLVyC7yMwBOARSUHazWDBVKd?=
 =?us-ascii?Q?YT1j5+if8T/aN5TXHvOD5FRpqTiuLEYWyWTjTLVEnDUqRUSJLmUqWtAH2s6E?=
 =?us-ascii?Q?IRz+ej9BYGHUBcYfxfYxRwtkburq7u7l+6HIdkekF4IWc/Ads7EEPCDA5zKe?=
 =?us-ascii?Q?JxSou7peUI6fwmUADGpzFzR0ed6jtVM/c28n5raEtVEfAX3w8sl5VdU2JHVw?=
 =?us-ascii?Q?nYdrqNekKwncPyuoa9wJvNN+Fod3vPg3RDYGn/DWs7ysYGjGoiePhCoWUXXn?=
 =?us-ascii?Q?9kuVoy8fhA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: l5qV2VDh62Km6PlmUA4wojQNdxFPhPjXeDUgP19ifYmUUx2lYUnyWwJ57P6xB2PubdUjhcDPZp8DNObJki0l7o+EenmPx8aqkaPKElXAXB+3Lr/HayghYo9I7sw9Xiw5AzM9Ry6WKDsfH1YZkVUhefFCMmdAkL5bu85NhJyWJPvomDVjKQdw9o2O8bqeuV4rRD8Cxi+Ulxi8U7vwCeyFERxTzoCL7mHDE1FxPawRPh4gGBl8o0EIPhz0t+LT9nnYh8XZbjJFOebWWHNy6+3U2XEH2FjLzvCuTS3ImtQQ+h2xeTan4tarqHUiR/iSrOsbo6BiwfdmKsntCblD8yzqCw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB507330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf17f6c8-9b8f-4990-39a0-08df30e47ca0
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 09:03:21.1133 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44khgEbWoxZG7tfukYtXv30nvDjGGlxnYi0cs64kfy/s2+TllVFXygh8jR7WqczfGdJsdCyM4JPa39MSuEpd6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7112
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Samala, Pranay <pranay.samala@intel.com>
> Sent: Tuesday, October 20, 2026 7:42 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Joshi, Kunal1 <kunal1.joshi@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t v3 5/7] lib/igt_pm: Add power/wakeup_active_count
> accessor
>=20
> Add igt_pm_get_wakeup_active_count(), the number of times the device's
> wakeup source was activated.
>=20
> Every PCI PME delivery route ends in pci_wakeup_event(), which bumps this
> count: the native PCIe PME interrupt, an ACPI GPE, and the PCI core PME p=
oll
> (pci_pme_list_scan(), every 1s), which is the likely route for an integra=
ted
> GPU without a GPE. An increment across a suspended window therefore
> means the device woke itself with a PME, rather than the host waking it.
>=20
> power/wakeup_count does not work for this, as it only moves during system
> suspend, and neither does PME_Status, which the PCI core clears while
> handling the wakeup.
>=20
> The count is unavailable while power/wakeup is disabled. Since 0 is a val=
id
> count, return -1 then, so callers can tell "no wakeup source"
> from "no PME".
>=20
> v3:
> - Mention the PCI core PME poll route, and correct the PCIe route, which
>   is pcie_pme_handle_request() rather than pci_pme_wakeup() (Kunal)
> - Return int64_t, -1 when there is no wakeup source, instead of 0 (Kunal)
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
