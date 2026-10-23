Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D082606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M6RrqwKT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 103A110E5CF;
	Fri, 23 Oct 2026 09:08:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5449210E5A3
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792746433; x=1824282433;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yZEF3ruLt7SgsipOJKZWv9fVCJ9tnUegQtjV8oT3Qfo=;
 b=M6RrqwKTKmlrhiUmUhomIBLpMms4FZhlHVqNDXNeGzKYCjamEvkPlLGS
 rSLsH+rxen0aIAaZIOIqmEHXSERmfrQnmBsuk5IbV3h9rrzG5dbRVH3Pd
 i5W0960+zSiSIBIbPBbnPBZnZfKmo0N/+BNrSv6gdE/KGDuKRO2muUJIe
 /CQ5nfYcX4cV77fHttVLdkFmUUBWNZzP/D4UCZJvf3ukopLArALfGDGr5
 HM9fAh5WP7QHtSc7MLBusbCDbLPJUZNsgTXMjHMzHY1kEJwHLzdc8ykJ4
 HswPTv6s/+BrTR6su8i4ud0zYKa5y8ko8h7xSOknpizt5K/5CQvGde5t8 Q==;
X-CSE-ConnectionGUID: ItEeBy1aRTu7aX0hIqdMUA==
X-CSE-MsgGUID: O8WVgQ34TTi6m1qQggPgXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1393133"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1393133"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:07:12 -0700
X-CSE-ConnectionGUID: aZo5EP/ZQ0S71G+/97VtKQ==
X-CSE-MsgGUID: NuQ5zEmYTyqIkviJM/72xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3945053"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2026 02:07:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:07:11 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 02:07:11 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 02:07:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzSAx95IiHIq+GL4DzQRz/eMtD7XUsjZ5D//fJKtDbayqiSzA3PjNDihW2LCfpK5OSqXnLgzq8v463M5I1JzYRP1fAPS4jtmMvBT0VuPRhe36niOfpiLPuu8qodPFEEC8qnarwMXpIaR7zaKlNM7FJftgNg2BjmXrL1G2nxF1nEOiBviBk75HIrWEPE97Ob3eF9CZBFSIVaqt19+heKbCS15F18RWxviNujm3bbAs8immrTNVNpEIHR/S0/tZxcbmqHvbicc+SMnzsXAj6ADO5wpeqNW+6VHOp1FUIC04xqhRIeizrDkcNXtJzZeGcCIKq2dgretW6U7yN8wC+jV1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdWrvS2CRoDrt1LxKyZyoC7DouHj7nZf85/r3FwpEPw=;
 b=J5g6McRqcybhOSe3W50GKFoZcGxkNL0fqWAiEVc/x5YPB6SM4sxqEO+LbvmXwfJBqty2gxii6w7IBwKaceNv2A7c3ybK0RTgZMykkSa0EobclV9BgUEaImNbUP6YYjvV19+kRH7ULUer6iRUFFCt+CA1164YBScN58N8RmU7y3Bysx8hniyBT34GhEPXJLX1/lms8IKBC4NI0Qe706DZ8pf+853Lp47PVMpvfiKAeBs3q0QY93XOFxL9zTbsb9mUvmt0ynQaWqUXttXJOZ4mqkMZcGW+abNmVWlYIQi9muIMsWW73ge1vt51TlCtQKUxkkQSWvGFb5mSyvDApbyQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PR11MB507330.namprd11.prod.outlook.com (2603:10b6:8:503::18)
 by SA1PR11MB7112.namprd11.prod.outlook.com (2603:10b6:806:2b7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Fri, 23 Oct
 2026 09:07:03 +0000
Received: from DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4]) by DS4PR11MB507330.namprd11.prod.outlook.com
 ([fe80::5d1b:9fb4:12bf:30f4%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 09:07:03 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Lattannavar, Sameer" <sameer.lattannavar@intel.com>
Subject: RE: [PATCH i-g-t v3 7/7] tests/chamelium/kms_chamelium_hpd: Add HPD
 from runtime suspended D3hot
Thread-Topic: [PATCH i-g-t v3 7/7] tests/chamelium/kms_chamelium_hpd: Add HPD
 from runtime suspended D3hot
Thread-Index: AQHdYJ0KHHAivX0MuUCy/JSeGskP1rcK2kHg
Date: Fri, 23 Oct 2026 09:07:03 +0000
Message-ID: <DS4PR11MB5073307E11E54B012947936894DA642@DS4PR11MB507330.namprd11.prod.outlook.com>
References: <20261020141151.753331-1-pranay.samala@intel.com>
 <20261020141151.753331-8-pranay.samala@intel.com>
In-Reply-To: <20261020141151.753331-8-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PR11MB507330:EE_|SA1PR11MB7112:EE_
x-ms-office365-filtering-correlation-id: 008f67e0-66e3-4117-6f80-08df30e50123
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|56012099006|261021123027099003|261022105027099003|261009223027099003|38070700021|11063799006|4143699003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info: zB7QICkVSPoCQclXEzBhAScVssf3+xiKKL5g07v4t1sYkmhETI34ZlMXYfaCA8UbL32FuRHf9enE+79/FL3tSF+95OMVG2C6kPuyMhEZfa/WdDGHcNNorcR7LOokkDfvvHSY1Qq/wD6hV8XEhxGeCDEWr+/k+PKDUvQa0QtJnTjN09p41U2HL7Nzi8dMQWHnV2xijp3g51tdFm2xzzPXouttup4ip6OKHgRAO9VxbKvEJvJH8W7Y76pRaKYQpgOr9do1cMHs2ZgwlANhYMAgB26bEk0nb19znqpnpqAOrHuRfunlR5L3FmZ0RMzmxcGbFWZzz5rF7X3Up3JJyeIEmFSjMPOb2fSFE/IWFuAmw+XCit7waJgAaD5JxoFkK5Y7n42yRSMqMPn+DZslpn/lCdE0KEG3HvIY8zlXScvhCfgcmwAldEzmaO9x3r0DDl3UcET9vQz7DB+HY4dK/zlTmHjCuoCSR77vGv4J8/esZLGwoNGeKmf8CotHn7tquBB5oUgacJ+9+pSbygB1J5F5Cqca4hBC6ZtFRIma1G8AB15FXv2acyzasQu+1DCdRdvGRAHOGztOfhZg9V3u5vIuRPfrpmN/p4bp/CQtVaS/5BP0Fm8+a0t6PwW18gRhWzlNCoTIibXOuejQCU6FwpEXIUpzKQUwIVPTkjYk4e4R4EAL5141o68tKUqlTodA9TS5C0av3aJ7z9BBOQKXPqBBbdp6Wz2QsI0dmBCt/nt42uw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PR11MB507330.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(56012099006)(261021123027099003)(261022105027099003)(261009223027099003)(38070700021)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1J9trmRNdG1cFkRq1sIYyUY5g0A0LbJjD1OtApg5P9VJX+f1rl3SgFZxHFMA?=
 =?us-ascii?Q?BaP4yPZtn/m3lsGNH9daT5CpmyIZtVsIjnA0Wt7FaP1jOLg0VTlKHMB1CCNa?=
 =?us-ascii?Q?8wLmJ3hahdQuzzunlbKh3Un13ftzDIa5vUh5rgmdi2VVxK9uywn+6mNH5XxZ?=
 =?us-ascii?Q?9raoXPpBKP3BYy9zm2znw7VMGC6vDAXQtbdpY8t61YkLaYgsJspBF5AcMSOE?=
 =?us-ascii?Q?KO6H68DH9JoUBHmdxpHlYzsvfX9kzRBVGMx7SdjT5d2ZhBqf6BmbjiCmFR7c?=
 =?us-ascii?Q?YUr9ismeKAN6y1+1V6ry0PltNHpqKBlMEBY9oVZAE3kLLXra1ZjbyR/zCAko?=
 =?us-ascii?Q?1RrAjwnh/+MVY7rAhJEvsDkc+K0TTg0beiTfhlkkxWd4S1+iaoRmglWV/d3M?=
 =?us-ascii?Q?An8XfVoGajG6kU0ZG/pLRiBfQH3p0ajaq1yHtDEfzIgcEwj9zb82f9PVrZes?=
 =?us-ascii?Q?Ok2N4vx6l6zrBiOX3RDnXpjqb1von4XqdSO4jXF5pOmXkAGCV/rsUpIbnBHc?=
 =?us-ascii?Q?hL5Y81d0+MUXwTKFEq7QJcTOJQugmSNCE4gJoRGga9fqgEj9uSKM11NchHp8?=
 =?us-ascii?Q?3XpUrm0jIqH+/bTlA7kTrT+skWTHpqJRvv5trmfgQBDxrN4ncaQyloZvrGt3?=
 =?us-ascii?Q?WqkyLWl2I7pelQZYiRsXXwrB6ngfJ0YuG0kP7L1jvG/YQmHHKz7fapoMS7Gx?=
 =?us-ascii?Q?FvJ4Y/u3pqNK7jKFdPSgOrRS7T5DoRqcrlI3gsTvXPutTNk21MuxJ4BpzwkF?=
 =?us-ascii?Q?+yoho6asmRdxjjKPupmJZ8xkfVHqT4WvefRXlYR6scV9/7K3OOfaspLGMVWp?=
 =?us-ascii?Q?tj9m8iQcvQuhLw/6EgBS/Bvdd0cBFwmrNrOujEYFk8uCvTjnz62ysSGbqmQP?=
 =?us-ascii?Q?hLvWLXObMPnGV1ytfldTXxFZVFDwEL7pXrF66tRPpI91CXh+KpC9fj6DpVlj?=
 =?us-ascii?Q?1Zp1xwImg0x1O0SV/Yc6iqyahxTMJA8NZWAoLrhz/fPt7mz1RTfe+jRTUIWH?=
 =?us-ascii?Q?OA/QJ9omG/fbjmnfyGAlJ5ZmlqoPKbkUOrjxqzJFe0iVFzOSiRXZz0TMXhsU?=
 =?us-ascii?Q?wu2UQ8lp2DpMobqNeFvgdde25sUcIkmQk90ft/AaNHXZ/d1lpiCuQtpottOX?=
 =?us-ascii?Q?R3EeZCTHw6NTgrKoPjfwOK8Nj0cJFihy8IKC77PF8bMOpeuCdf8Ltgvwy8qn?=
 =?us-ascii?Q?1piX0u7LG03ydd/Q4ZP9FAY4lHr/w9DMjU4fPIG922tC/I93isFcjPu4G80j?=
 =?us-ascii?Q?8dKK9seFgVoaluUfe6tregP1GWuEPfI/P8i0O/l/74gR63P7T88Vdhew7i/D?=
 =?us-ascii?Q?Oh2UCdnxKCtdAGyb1DgzNMYRVo0WWDC6AkdIKUhb4d/WwGQvHSkAIyk7V3XB?=
 =?us-ascii?Q?d4EaLFCWSqbJdFXnZi8k2SPIofFfqqPVwi7x5gmWTQvteMIftp1ilHUSXHOT?=
 =?us-ascii?Q?FNY9tWTuuomyba+yDfxk1Co1hv/NlqS5nAo8ORmgtG6mjbLJC4QRClJuhzSo?=
 =?us-ascii?Q?2CxB437e6j/aCZCJ1RTzVVUUfxOuF46w22TuIBXr1Cdy9zwof9vumkSDz3QE?=
 =?us-ascii?Q?gdDjTvI4nWP8vdkyHHHWHOiftAiSSzISMV51uTexeLeC/PfIlfgUfewdHAGb?=
 =?us-ascii?Q?BHZ6Jgb8MSMDWPtYrKZ4fKIRU+nkLn2mcdLrB2fIzYDXq3v05uaE0MZQu1lZ?=
 =?us-ascii?Q?Izgq5bFIQhUnSNicljdwrBv9EzKipim2FBosH+Fc3hkUIvwXTiVT38Gs4U5w?=
 =?us-ascii?Q?Qn+f7FfbgQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: J+ggRbIArnarkQ4ov4LkMNIb5X2n5I03cU/Qy3qtb9rSm3mKeAly2Zbfj1K/iLy8x/MUep4FMAgDww+jJICK6u+irz9NLbWQYmRq5dYHPku+RJOItBDJ38MM1tXjnqm9Qw+wyFSbyEj4XH/nVJymoSJSgGGhxLdfeY56Gt3cOIbxn0IjmkE+HuSaDUgwxgvsfIm5WdWnDlPk2QmVSsIVUyQXDHfCdVgAyyK2zaqck70mdAtf65Jd5sPkG/P5RMdNVmb0RKShgGkpgGi4BOrkrmy3ko0YKnoAHNAzuY0JA874SIcPeJhVkoWcVkiUWmJg6enbubSdNyyIyyaoFGfbHA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PR11MB507330.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008f67e0-66e3-4117-6f80-08df30e50123
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 09:07:03.4339 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ESCQXnLYuylfK4bNdc7ll/M5S5gS7DUPez7Ga91hsqNpS9rwVN09LJkevAuYxz39UBx6cWeRc55UTj2cEp9y3A==
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
> Subject: [PATCH i-g-t v3 7/7] tests/chamelium/kms_chamelium_hpd: Add
> HPD from runtime suspended D3hot
>=20
> Add dp-hpd-after-runtime-suspend-d3hot and hdmi-hpd-after-runtime-
> suspend-d3hot, covering a hotplug signalled by a PME while the device is
> runtime suspended in D3hot.
>=20
> Checking only that the display comes back would pass even if the driver f=
ell
> back to the ~10s connector poll, so the subtest also checks that polling =
stays
> off:
>=20
> - Control: with power/wakeup disabled, so PME is not armed, the device
>   must be seen to wake from polling within two poll periods. This
>   proves polling is live and the wake detection works, and measures
>   what one poll wake costs. Skip if polling is not running.
> - Phase 1: with PME armed, the device must stay in D3hot for 25s.
> - Phase 2: an HPD plug and unplug must each give a prompt uevent, an
>   updated connector status and an increment of
>   power/wakeup_active_count, showing the device woke itself.
>=20
> D3hot is decided once up front, skipping if the device suspends into D3co=
ld.
> On failure the D state, PME_Status and counter delta are reported. All st=
ate
> changed by the subtest is restored on success, failure and skip.
>=20
> v3:
> - Decide D3hot once and assert it per try (Kunal)
> - Settle before baselines, watch the idle window once (Kunal)
> - Add the control run without PME (Kunal)
> - Flush uevents right before the toggle, assert latency >=3D 0 (Kunal)
> - Check requirements before changing state, restore on failure (Kunal)
> - igt_fail_on_f(), igt_assert_lte_u64(), intel_graphics_ver()/IP_VER(),
>   fix the latency, D3cold and IP version comments (Kunal)
> - Follow the lib changes: error returns, int64_t wakeup count,
>   igt_kms_poll_*() names, xe notes moved here
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
