Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3FFCCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 14:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E9B010E3EA;
	Mon, 10 Nov 2025 14:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ltbZV1oI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A30B10E3E4
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 14:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762784706; x=1794320706;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=5iURagAiSYtkFXeXbTci7rPQWWdP9dVgijSMmyy7w6s=;
 b=ltbZV1oIZPg/37SF6zTW2HYSC27ejbz3BQXyjaos2g8ZLGn1NT1yh45D
 tS2u6dfrvEwZLOY+iimQu2Ed1c8jdHUZyZ9m1XUqLhccHEpA60gQWH9SG
 lrut1FfbIuz3SHwHOfpoJenyasmE1NyhRjtHYigXA2XAlcne/W2oOjBRn
 Z9l+JIyAx5s2yk4eaLsLwYRs9SNrAzqGpa8zWdDeVDkAhQQ5/uUwUB0L3
 a2ezarp7Wya0NbazSvpjkwdc9YfUI6Mbc3W2eTdIBLk18McXqLHoBDufU
 qFd36GWKo0zyum7sRXFb0ZN+3tLA0Nu3/C83vqHlNUMCBZgAFc+jiGfmQ w==;
X-CSE-ConnectionGUID: nShzmfNoTtOtgR2iPlfqIQ==
X-CSE-MsgGUID: PZfyQXEBQEafI0NTBni1lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="67439983"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="67439983"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:25:05 -0800
X-CSE-ConnectionGUID: nSBJ7xYyQ6m2B6pjJ9GXQQ==
X-CSE-MsgGUID: 5qipwFUxSUW4j3kUCVEiow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="192795897"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 06:25:06 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:25:05 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 06:25:05 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 06:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XU7tP2GsvCywOIyUgFDWL2zpexUCicZe81nhMKXdgu2KlopPnoq2CcCm5wBkccfnFXvcFHgi3+/naIRRKEP/2jUsGoj+Ai0E7N8o/Eg2QxyxwCqD8ZO7T0FDCP5V5BFwxpxsnlsfwq3OoiHE+OD7zq4NZ4e0/Xwi9lKx/vOan7Nc/LZso+OVozcZKQDtPxo+BN8nwUVJMg0iFX4W84qsZpitihTZOo47qLeHUXDKkq7hTsEnL1nVc+r9MQZ09EJR0bp/TC9Esz413E6RmrAqhY4DVFXtTdfqbRwpV3bT1YP8U+tIZEmAQR4LVOT4gmN4x6R8KhEdU5YJE9t7AR0J6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tab7I/QU28+Dx1HzsdrtZ6xMiicCLJJiA6Js9hjDSmM=;
 b=kPBy2ox71D0J7Tjel0K9UeaVFagoLEZsbHSqfNXdvI09hV6hRI1EMCXSLVlmSf/ZzeGVgg3jkj6Iil1go1+BW0HBmnM7H7UFJhCcT8P+KujkZFDzBASka7XX2/S/fdiCRMs3k393TWDjoo+Xe+yNmHjCOGSQODR5oHN/odNMxLafqR8h7VpoOJdFJpyv8ONmtVmuz4/eSI4V/wqXbRdtzoVhpOZtjzjiN6gZzGj1x9PizmC6dd8hjPb59SNqZthgCICR8XIi/tQ89i1OPPTRxPy+zRmQXbETbOf1sfsbyR/KtTAlk67ohXWEBJ6ByKg7AmmWhr1thd6sCl8YtrRNQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB9013.namprd11.prod.outlook.com (2603:10b6:208:57c::9)
 by PH7PR11MB6954.namprd11.prod.outlook.com (2603:10b6:510:205::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 14:24:57 +0000
Received: from IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563]) by IA3PR11MB9013.namprd11.prod.outlook.com
 ([fe80::112f:20be:82b3:8563%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 14:24:57 +0000
From: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>
To: "Girotra, Himanshu" <himanshu.girotra@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Konieczny,
 Kamil" <kamil.konieczny@intel.com>, "Chauhan, Aditya"
 <aditya.chauhan@intel.com>
Subject: RE: [PATCH v2 i-g-t] tests/intel-ci: Update blocklists for xe
Thread-Topic: [PATCH v2 i-g-t] tests/intel-ci: Update blocklists for xe
Thread-Index: AQHcUjs2eJIo9jYOZk2BPYR527njr7Tr9umQ
Date: Mon, 10 Nov 2025 14:24:57 +0000
Message-ID: <IA3PR11MB9013334812AD3744493CC9D085CEA@IA3PR11MB9013.namprd11.prod.outlook.com>
References: <20251110121225.8849-1-himanshu.girotra@intel.com>
In-Reply-To: <20251110121225.8849-1-himanshu.girotra@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB9013:EE_|PH7PR11MB6954:EE_
x-ms-office365-filtering-correlation-id: 512aba21-c80e-4393-a490-08de2064ec93
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1XrzO26oGswcmN4GwJfKDI2i3cqLN90NjUmS3PuqN4Co9bmV/6K1qJU02diH?=
 =?us-ascii?Q?BRFOgwQydtPYZzeddDMLKbjFFDUaItuAYNvhY1/C9krMiJD+1RzqQ3EoBMkW?=
 =?us-ascii?Q?3HSdPfPYRvkhXINi5bIp7xNHed9/rnRha3ZDmZtf4CK+AG69qTdNVt40JrVP?=
 =?us-ascii?Q?zHsIgsluG/UmlFrci5l3a37qPaJKUWmMwrsG8hLVFf4U6SEI356ON3fjbxpu?=
 =?us-ascii?Q?Z+ryVCaW8WFTFAKSR1A2+QV0f0Wt4oZHE5ewaAJK3T7b7T/gaflcwvZvmu5H?=
 =?us-ascii?Q?FixJkpwv1TkWoo63Tk++c7sazKGmSiBp8+EaZWCwQbD5LDxPrlKKV1KuAtd/?=
 =?us-ascii?Q?g+C6MQXIUH/RqaHTzcQ/d7URRGgbNWE0WG+Prj9b+bB3M9x/5MdfyqjMwMxj?=
 =?us-ascii?Q?xn3Pt2bjRzmGAU0DUnaFyeStMgotSE6wq6RpCHgnvlxJ0HU7Fti55+N1oNTH?=
 =?us-ascii?Q?WONLQoQvy0YisBVXGza4iFcdH/t4X861itSQJZF99FkLHhwh1EZJbGHlivLR?=
 =?us-ascii?Q?XOLMZkrK9+coGSI9/KbKlJlzqdU6aTf0RLQTLvMSyTrQUNYl5YkJh+g8qoED?=
 =?us-ascii?Q?ql3vKeQT8QgJcrMljrIj/+m29vMS08a2OfV8PaczgZncYwq+myx/v5nE8ago?=
 =?us-ascii?Q?lnJxPzBsDvIZ0w/HTrsTQ4/Cq8fOGby37/5ti5V/g++JaOS+hYT9l2clFl99?=
 =?us-ascii?Q?JREs88SXmlqNWUWyapnxJf7gMQ5ArbEql4Z2OVyHjRnkv2cE5isbijd+ijv/?=
 =?us-ascii?Q?G/JhgucO5/nPh/NmXOd/eHl+3CQm4FfEhBlJ9xu8H/LeWJhez+pPnfZAtJWI?=
 =?us-ascii?Q?sqI7IY2xmuXNCsB7KD4gZGmzFE+mpOFa+aTlfRtMS8AeA0x3Lo6xp9+bPXDR?=
 =?us-ascii?Q?24pgiGHVSg1zUZcX/1tiwbvYg+HbUxig7Q5oxC5JEyFqg0c/sHvUxYo7Qoqz?=
 =?us-ascii?Q?JKYDhKc8fKK7TIUrteEjemQCiEsvc56mOgU9G5qar/YTFgEf8p3ZJvgzyaO6?=
 =?us-ascii?Q?sQPMvSsGH2PsF4QY2krebIFfQNjkIOp6Wsi08QGjwGph7hakuFoWevkyBALD?=
 =?us-ascii?Q?AKcuoXj82IoGlueHRpCn1Ck44jwoV4BGWRcg+HRVFSf4wt2dUPsnMRE7XPO/?=
 =?us-ascii?Q?PxMwcoDxDmxNq7OuBWWFex5c4nmy9cgXY2LqWO4dVpXSzcB5i6uZ7Y2zPSe8?=
 =?us-ascii?Q?glM3INB7TvO0PApd2wZ51K1q9YEAkZMRbPmMTiDCHhSuQso/Kplrk+eoUMAS?=
 =?us-ascii?Q?yZDwEcnPOfbc0mh0b2H437D04hj0Uz08LMwCmPKqN7g1X624HNK7WnMUasbn?=
 =?us-ascii?Q?I7toOsKxQmMlLHQvKRLEa1nzh0JgameNbYarReA9Jmr2umrvlXxto4qhYFID?=
 =?us-ascii?Q?2Qx9O5+4uZU9/eFpmoPUpou9fho1wb1yyJwzq4zrS0a7juFyoRQE60uQ/4lE?=
 =?us-ascii?Q?gpGKipW6FGe2quOIpzN+3jkI/xUnuLl7RKrSDv74JXaR7eGAgjqUhgT/Hh20?=
 =?us-ascii?Q?Uo9zCov7GTDONS2QzIiJ4nTjn3pT4+6mudMC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9013.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Seyj0Q28umPqSVoreUWAicgrp1D4PW3jooyOiDBWdXh695gjy+bI+rk5XE5i?=
 =?us-ascii?Q?/mAPbfTxVBkkJirEOlbbN7V0ITyZLmwXOjt3u1JuVFp7p0o/0Cbfvk6v67nW?=
 =?us-ascii?Q?VhwXxrP84rrW1qeIsk9fDQuNhY5eR3NpfON0krLBXMiOJc8oDrqQJ4ZDkdhk?=
 =?us-ascii?Q?WMLGfJHHFKm+hiLceG8bZ55US8a6y4G+t7mak5W+qEXHkNedyWJN809Mn1s9?=
 =?us-ascii?Q?Uesefm+MnsmSjBN7SGdxSR8jyNCBzZ48ao25qdYjMb6cC9/lKk3N5qphgprF?=
 =?us-ascii?Q?LMKWU0dOS/FseIbK6yFZ37s0FcE5V38y7zCWBr1soRRkCsPY//8FpaJQ/pzd?=
 =?us-ascii?Q?cxASm+TQ/oi9/Am8+VKBgUCR+LI+G/PXBYJtjaabNJnOvtHOqOAMzta9EneI?=
 =?us-ascii?Q?SptwR+e7WLDsCJ0o+84OGle4jlQoLVjSA8hu68EcjKdNmG/uOkBT4LqZ/Kcn?=
 =?us-ascii?Q?tyxOLr3UvqsRxFdisMGPyBT4qXkVDm/a0AbsZmoDJvA4uOWbknhpkyb3YGQZ?=
 =?us-ascii?Q?nGpuRAKRzw4AdvmkM5eSAQfp9yije4pM9so2uofdadm5UypdCXZq5ku7ze2/?=
 =?us-ascii?Q?a79MQS43YDfiWhyrFoaPXiGo8y55Aix5Y+Vfx1l9cWGg/thtryrAHJTjwDYl?=
 =?us-ascii?Q?ygcXw2A4m8/cUhyx4Ml4MXZAWW0j6p12S5qzYpBp2Nkpx1LXr2u0XCyK6WFO?=
 =?us-ascii?Q?HZE6I/Klw4FU1OZzlRjD9fBW+aZQkbiVCLFdBHG7sIDD9iGEuDfhuZpInmvO?=
 =?us-ascii?Q?3B2DwTTMwdYP7bAMQyeZcts4zuVPHna0rNc6NtzA0j4+drNTj1q5wgso69+Z?=
 =?us-ascii?Q?g8277ouP9k17QZCahZAnZZP/p4j/lZG1WuJv7eK5YY27RyDZsI1PIFB0bk+y?=
 =?us-ascii?Q?n47KrvkQSQKcvmXFfVpgdcQTjrN8znoSKHFI4eZATS+yfo4ZZ2XIguQDHY11?=
 =?us-ascii?Q?UeOcHs4lBWyekS6reAu3THj13TBgqv97GDkaLlK8TwvEV+tRbuqfVwsRgUJe?=
 =?us-ascii?Q?IbKw+4Ua/EO7qVr/Cx+bIuXblkAs5DYtj+xOm7j+I1GuSwvsy2PwlmXAmlfw?=
 =?us-ascii?Q?uKeMcXyM3beVGjFO5w99cYkhmBS1WoN+jmNy3Q+OMDlvXmDD/WSGHyjQD32O?=
 =?us-ascii?Q?TtpX70R7OKmCdk9ywm1UdTdBNaMa4u8w3z0dofuGbRTvOmy9ADZAq3bKdHtB?=
 =?us-ascii?Q?gxF3DJU27C4W4FS3iaOSheoUfKfQZKlfpLTDqOEWy7w6He3GWoewPvA8aAaY?=
 =?us-ascii?Q?rK5bXT1MriKdpbPjsDTF8yyptCRs7TlRaQ7jbU89feEkYmcGer7WwPmWxxOb?=
 =?us-ascii?Q?AV8m0ZZ/gK4go7L97Omu3rf58ZoxOUgm1mhVMGuvRDhWwOSliNQRQDGwzbnf?=
 =?us-ascii?Q?vDqX2i7oNhEDzFR8ku03Ege+VOSmTXMc8+cc50BDZ5nrZjlAwxqGegiLge/9?=
 =?us-ascii?Q?hNrtFxbAUthymOEO/CPQZo5bQ82ZrJKSXeDWabtDoOQU5aquuFjPqt1ucwDl?=
 =?us-ascii?Q?+R1MQMm3iZkEmPtzgUuEETEVSY1/deJ38ag4AWn7QhIErwBrtAyLXez7YrrF?=
 =?us-ascii?Q?jzkDgfLukxd0fe+JGoVIm/PQPBvXIBRSwa8BsS+W?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9013.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 512aba21-c80e-4393-a490-08de2064ec93
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 14:24:57.0994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRmhTwQNDJtSRiZBZvvUu7P0f6ZXL2h8WWiavx7a96DG7PTQZEFrB24VIwiaGonDSzPbAqB6B0gTUe3CtgXaxN1chg8fEdrLkKsgTTVHMig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6954
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

LGTM.
Reviewed-by: Gandi Ramadevi <ramadevi.gandi@intel.com>

> -----Original Message-----
> From: Girotra, Himanshu <himanshu.girotra@intel.com>
> Sent: Monday, November 10, 2025 5:42 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Chauhan, Aditya
> <aditya.chauhan@intel.com>
> Subject: [PATCH v2 i-g-t] tests/intel-ci: Update blocklists for xe
>=20
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>=20
> Blocklist non-intel gpu tests across xe platforms running in CI and updat=
e
> wise Blocklist files for BMG and PTL.
>=20
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>  tests/intel-ci/xe.blocklist.txt          | 1 +
>  tests/intel-ci/xe.bmg.core.blocklist.txt | 1 +  tests/intel-
> ci/xe.ptl.core.blocklist.txt | 5 +++++
>  3 files changed, 7 insertions(+)
>=20
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> aa480c6d2..8706721e3 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -13,6 +13,7 @@ igt@vgem_.*
>  igt@.*virtgpu.*
>  igt@vkms.*
>  igt@vmwgfx.*
> +igt@panthor.*
>=20
> ################################################################
> ##
>  # Exclude all i915 tests
>=20
> ################################################################
> ##
> diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-
> ci/xe.bmg.core.blocklist.txt
> index 15dbbf2b8..3a127f780 100644
> --- a/tests/intel-ci/xe.bmg.core.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
> @@ -70,6 +70,7 @@ igt@xe_evict@evict-(beng-)?large-multi-vm-cm$
>  # pxp support not available for BMG
>=20
> ################################################################
> ##
>  igt@xe_pxp@(?!pxp-bo-alloc$|pxp-queue-alloc$).*
> +igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>=20
> ################################################################
> ##
>  # I2c tests needs AMC capable BMG in CI
> ################################################################
> ##
> diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-
> ci/xe.ptl.core.blocklist.txt
> index 811062449..bb8587656 100644
> --- a/tests/intel-ci/xe.ptl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
> @@ -69,8 +69,13 @@ igt@xe_pm_residency@toggle-gt-c6  # Expected skip
> as PXP is not enabled for PTL upstream
> ################################################################
> ##
>  igt@xe_pxp@.*
> +igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
>=20
> ################################################################
> ##
>  # System allocator feature is not POR for PTL
> ################################################################
> ##
>  igt@xe_exec_system_allocator@.*
>=20
> ################################################################
> ##
> +# survivability feature not applicable for PTL
> +###############################################################
> ###
> +igt@xe_survivability@.*
> +###############################################################
> ##
> --
> 2.50.1

