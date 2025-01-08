Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68574E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 23:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1875510E092;
	Wed,  8 Jan 2025 23:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ITB4fp5n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5735B10E092
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 23:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736379509; x=1767915509;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=26HL4lguTcUDntj+J2EW9DHzKvIA/ksYLdfYFdc1ILA=;
 b=ITB4fp5nV75F4KWLl597cVywUtoVg2Up8F4aJJuI7xH6sEqK4PN/6ygp
 nWz1oTQALVO07BY5+UIzRdf2iBazynafFESKvZfBrWJYBkdmLcaDMTN5z
 lDGEdvlgkOwBVbeA45ZaJRD/x48FeHyiiQJFH407z9/ef6dfHQR1yMbYA
 yeTTf9fgvfkij1zx7Ahxs+0c66+vf22RfsjoKJQYbHlJ7sXuNJd4NBzBP
 R7lLARav4/yIlhkZNPv+pHPufPOIVKqP+xwvQx6Ysqb93PrZ0qTF0NfEb
 xTgmaZR8E1xrattAr7S7ZmtzKQmbkOjiA/a/S3+gCDnolm3sV8s0L5ikp w==;
X-CSE-ConnectionGUID: M9piVPPkTTiMCUSEYuWjkw==
X-CSE-MsgGUID: DCMWqehiQkm7XoEwIu+V5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="24231867"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="24231867"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 15:38:29 -0800
X-CSE-ConnectionGUID: 7F9Vsv7uRYC9UEYAXuTLtA==
X-CSE-MsgGUID: SgVVvEriSTu/jUO0KQmNwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="103441975"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jan 2025 15:38:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 8 Jan 2025 15:38:28 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 8 Jan 2025 15:38:28 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 8 Jan 2025 15:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rWtvDMLRIUvjpumPZOTYpIjOTcFAEekAqe7RJpFLyCp/NHo1K2y1eSTsJIjwohqVOnmJygS2XzstM3Pluay5pV9FPVMJbP4KV4Qr1lDrJETt/3lyCJMcaJ6ZjLAGcDfYBcLvgzjR4SimHQ/3w/GbhJm/7ZVOcdCNxvLi/U84VgxQBWKqcet91YQMt8E21c4NWzHBuLbKncGNbs2qCFX685C9IrkfdPb7hqHNKcqLZqegHMUuNcd+r5LqrJpHduKqLD6WBmuCqQvXfLX3pJS9FEwFsSOrZQ8ZpnuC6ni7a3XSlcZd/aFZGlPuLMEK8LL1+fYdWc+9tchDurDu8ZhBSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rvBCKvsJoEfY0K2rDOi+rOMQb/gDGe4hXoSkDyJoXQ=;
 b=yX6PxKjNjyrH44xwFDZ7OCymaj0wcb+jPXnd0ZP0MHekPcj/T8aqUDb4LAlryliO5b3i6c0h2qXzhA16fCfEXjxsTvIHuaBaSJDBVoF8V5wCZoroLCPgEWwNWz63kXBONRMnI+mn9zQ5xN3WhSD785wskGfSiwCD5WhZgkBIBWDNGF+M6RtxjAqpKJb+Kye/DWeS3fOtkrbPhY5tBpE+M6KZI7eFXh+c2F9ypbji3JWsToe0WzTI1rEYR+OkzMJDOWbe+0QVAT5Buw4tRvgigIed+9joDjU/LqKpRjONH/crI10aMkQlvzpM30e5JUiMG04t36iA1ky0vEz3jc7RvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 23:38:24 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8335.011; Wed, 8 Jan 2025
 23:38:24 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Summers, 
 Stuart" <stuart.summers@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after
 the stress test completes
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after
 the stress test completes
Thread-Index: AQHbYiBTkMHyUU3GcEKvDFe5N1+fPLMNhwmQ
Date: Wed, 8 Jan 2025 23:38:24 +0000
Message-ID: <CH0PR11MB54443F5CD1871591FB85DC4EE5122@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250108225424.95051-1-stuart.summers@intel.com>
In-Reply-To: <20250108225424.95051-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MN6PR11MB8103:EE_
x-ms-office365-filtering-correlation-id: 2598f988-34c1-419e-8e22-08dd303d8b17
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IQQ0mZbuxRSGdJZfUzz2lGcNnvHF1HgkveBgI726toewUMJRu0Whv8SmS5jt?=
 =?us-ascii?Q?rukoTpHU4Bqwa7XwEFAq9dLFpF04kXyOUSsYGuZ4ZijajDzD7p8XnRtlIn2K?=
 =?us-ascii?Q?kCWoe3ocjgBSAtQlGgLksGAAsk8amUIsBp7I0nKP+mhEyCVZZsxOCPecEmR2?=
 =?us-ascii?Q?Mf0ELcYGN4SmAX3irwyTaTartAnWHqMqSEAivRLuwBieFCd9MKu0a4oOYQ8e?=
 =?us-ascii?Q?QSraHQHulF3NQfl1b5pjrRmvTD+58IDi3LDvyESeE9dV2kmqEuMma95bG2gZ?=
 =?us-ascii?Q?rm8Yst51Tny1teb/Wh0hOWy1M+CeFgYWOYrzt03mTtasxknJwWgOJ1OO8xMs?=
 =?us-ascii?Q?U1Prc+YMcg3W+sEJclvQdizVzDE2a55B0/LZnlHYz81t2FUZJ6AUXHhAw9qn?=
 =?us-ascii?Q?N3sMiWB7o6xsIH2V7r3vbxLdqHs6kNlo0dObM7X18Ok0gHz3++VsRvqLjNSe?=
 =?us-ascii?Q?mk3sbkgg2lfw4tkkjZ9HnvKexFORtdTdNdztBi+AsqNa+vTw21RkfMurOvlt?=
 =?us-ascii?Q?VMJ1ncED8sQVngAXfRC7L3+CCNIcTB075X8HBMHFzHfdBzn6jKOjQqdHhZLu?=
 =?us-ascii?Q?aBnSWMU80ou40j886M8iIzj0qjFrqT8rIVsvbia7zAmntD3sLKrQF/HLmknl?=
 =?us-ascii?Q?tklM1MUijeJEeosYkZYt1q0SPyvADZgZNpRzQCat1zv3OdGISJAqha8mkSS2?=
 =?us-ascii?Q?hPiMlJm1zBEmk7ItgzZdHcABrmFfe9iKJQ8HQvvEI8hPdrh2vmabVEneEstC?=
 =?us-ascii?Q?mnhBvC2rlrN/HOLbTcnzd61h2Kye8T1qVfo66xo68+N/JYObkIiBe5D7GzfZ?=
 =?us-ascii?Q?EnTNrNm17aCodnKJlQzXv26x5CuXGSH/K07RHl7/SPuDkN5sI5DhAjQs8wR9?=
 =?us-ascii?Q?jzptxfNmyOEFZVwp1/M5SnpG7R34rc0vdYwtXfxEbCTr+LJl4lvMU1xLm6Ed?=
 =?us-ascii?Q?rQNGTOT0Ysh7iBU1hhTjuXDV+TxfLFcpwRPc4t/mEE55CYQFcZ7/xQLGJv5/?=
 =?us-ascii?Q?IheC98Ga7MGwg0gmUmH/ENEx2mk4sR5PxahEq2D1J1vRW4mUOnBMaL995doF?=
 =?us-ascii?Q?ikVR/PwufSvh1VftKumR0Y1Of1NXH/fuI6QL2TuU1XimckGWRUiClx35lMln?=
 =?us-ascii?Q?lV2mEhjpRNiaDQru0ly/fUtA6yTJHzQ0vdyjgT5LqSQyoSeQc+LO5KC6eC8u?=
 =?us-ascii?Q?SKRH6m9RXBZtLrn8K7WVt1fEH9EEzwKsM1qTOlnT4X4cP3hjKXIDcmjeVAhU?=
 =?us-ascii?Q?eugFjN2kHF6vZM8gWnxFUTQDlKaWMoEoo4Y0TainhcR0l8K/gfVuR+4VTLga?=
 =?us-ascii?Q?4KcgIv2Gipq37fYHXq7bmy5M4NcHKnlIGzYcpkt7+wZRJ9ZkhFGDO1GpAPBq?=
 =?us-ascii?Q?JUgXfYKuTfhsSbN6WCw7SnKpYc9Heg3/SGKHQA5MJVGCFOczcw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I5B6E2MdD9sR6IFDJLPO0JLAwFm/bhj5ZLUT2dt4JIir4cFuLpLaQj5k+B+6?=
 =?us-ascii?Q?R/OhQzKpR/idD8YBRPYgsCis9rQ3oQji+wH0tPkUWxLGs7/AMvPsTsUxqUcZ?=
 =?us-ascii?Q?iSUgf7yxTrjK00GcGTXLsSnsacdKwN4XMkR0T0dy4LToTBJ0sbFh7Rr5BrSQ?=
 =?us-ascii?Q?COKMSQcxPPRRhLOIT65ZJjLTjo1DFgY03JyLVpYa2jRSfD3tEcpE1922fsoi?=
 =?us-ascii?Q?+SFXORjjuCl8S70vTJWTbZw347GAhIgAYfcyzodqsgp/AjfW/ElVuLW9NiRe?=
 =?us-ascii?Q?TIx212Ouq3d68l2ipiCGPVDVVBxVRmIc+vJXf4BPV7d7AL+7TvET9fi3N5Yl?=
 =?us-ascii?Q?5mFYbA5ajHQ7ECz8B53yWKuXYmxE4ea3SBHZUnSoHVR+P7XdL9x7iZ1hey1V?=
 =?us-ascii?Q?ba7s3tpLCASzfWtvdpyFHApc80Jln7EAGQlsYB5FxYcLrUGfUnPg0RvZpy2u?=
 =?us-ascii?Q?mCc4gR/NzG5qDg3KX2BwgnUh6XbdvSusF8WZv4okPjqzdiTpi75HlGn8cvYD?=
 =?us-ascii?Q?I+ENWEj88kPipNVrz8npY9kQyLlab0/U+nrhUgy30DTvI5ckNc8C40qqEDg9?=
 =?us-ascii?Q?R4n4kY0FVQZge21yqG/P57CFAaMVBoGRGSbhmK6kU0jULInVpTYzBEsQ9K8s?=
 =?us-ascii?Q?dFbI3NXHs2qh1hYWh7eauA18F4fFYjRS9uidEi4E0GbQob9WqPxE3s225TLs?=
 =?us-ascii?Q?uYjhU8EWg0o2VwKjqcFBUZWQE2alJtUSerq9i/PYZUdlMfQX8wQUIarJJ8m1?=
 =?us-ascii?Q?1QbBnMiCPdSSiONWFDO+17UEokgSH8b0Ioa/BUea3hYEcW/EWqV0I6Hq9trl?=
 =?us-ascii?Q?pt2RtkHYFTRjAbA/Ht92HNfzWWqLREO8npQvcwDwtZglfxp6aibERcNS7Cc8?=
 =?us-ascii?Q?b48cRPlyOu955miChy76em6+TL+zBakdLTH8QcM9iEgGg+NRiOVtulyl6mQ0?=
 =?us-ascii?Q?9DFo1cvfBFIQcPawPoZaFybbW+VPrhYQ1+utCK6A7qmy6gASnauIEkbjBXai?=
 =?us-ascii?Q?iJuVG3sbO5+jtDnlvVsHQKbRW7KTOrPDcq5ql5MVbYT4962ydfOzD5jl0sgw?=
 =?us-ascii?Q?5dEpqFBRSC3xdAWh7Uy84scvYvh18Fql2PMtLEYbtYYi6XYCXJ+G7beP1CGT?=
 =?us-ascii?Q?BSvfOcG1IlibgUHyryjPNN2luntRFJqZss7Y+cHSl45w39dzDqsbJBhlNNhQ?=
 =?us-ascii?Q?9BzaFv/wbfUZ2bc0mklptTY70j38BDUh0xSSHaG7EtCbmOPnckIa3clz0u5k?=
 =?us-ascii?Q?dZaqFSjD6LmDlQ54UEO8JAbn5zcj0Sov7+3O7EmkaaP+12jRDA8YDP/IZgsB?=
 =?us-ascii?Q?IjWYnLJ0F1ET+09+qsrnQhb8u/+zWBCtoim428YitB1WEcVkP8z9K8BOAExC?=
 =?us-ascii?Q?T7cQwwDjG8fcd56ffoPyJGPo7ZmOPXnmOmbmERn5ySiJAJ2rrHLMEWnGopwO?=
 =?us-ascii?Q?tFatPV7zD+OzbfmMarVDYxBhzm9RifyokJb9LthMk449WKbTrWutmmAy9l6m?=
 =?us-ascii?Q?I1iyRFd61SvzLspteNus9ld0NiYnyXPF4f1hVZKNxUlqDqYT2cGP6Z7NGZBU?=
 =?us-ascii?Q?C5+oz3KD+6kztNGTIWdK7zkCAGUoIOXyDh6BoCCS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2598f988-34c1-419e-8e22-08dd303d8b17
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2025 23:38:24.0691 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YlpVl+jo70RBv0YRNiZeVsTwx+vNFtEo86ENG+kRXVvHz2Xo0qsePmHReNnZRxlAcfadJalEAo7fYGPmSqurF5UsGfr27VMgKyYn5hs2B5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Stuart S=
ummers
Sent: Wednesday, January 8, 2025 2:54 PM
Cc: igt-dev@lists.freedesktop.org; Summers, Stuart <stuart.summers@intel.co=
m>
Subject: [PATCH i-g-t] tests/intel/xe_exec_reset: Add a vm_unbind after the=
 stress test completes
>=20
> The test is submitting workloads in a tight loop and then
> destroying the exec queue for each of these. There is a
> potential that the GuC IDs could get used up during these
> submissions and before a GT reset goes through. If that
> happens, the subsequent submissions will essentially be
> "lost" in that they aren't submitted to GuC and just wait
> for a submission timeout to happen, at which point we do
> a reset_async in the driver. What seems to be happening
> however is these workloads are lingering beyond the
> completion of the xe_exec_reset test. Then when the
> reset_async eventually goes through, the submissions
> from a next test can also hang (or possibly because
> they too ran into the guc_id exhaustion case).
>=20
> Add an explicit vm_unbind before destroying the VM
> to give time for those submissions to complete
> before the test ends.
>=20
> https://gitlab.freedesktop.org/drm/xe/kernel/issues/4015

I think this needs to be:
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4015
But otherwise:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Well, assuming this works, at least.  I might be reading a bit too far into=
 the
commit message and kernel issue comment, but it seems you aren't too
certain this will work?
-Jonathan Cavitt

>=20
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> ---
>  tests/intel/xe_exec_reset.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index a3eaf8bbf..ca5566d11 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -645,6 +645,8 @@ static void submit_jobs(struct gt_thread_data *t)
>  		xe_exec_queue_destroy(fd, exec.exec_queue_id);
>  	}
> =20
> +	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
> +
>  	munmap(data, bo_size);
>  	gem_close(fd, bo);
>  	xe_vm_destroy(fd, vm);
> --=20
> 2.34.1
>=20
>=20
