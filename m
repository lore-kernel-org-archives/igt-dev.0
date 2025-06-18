Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5303C7115B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 07:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F5C10E1D1;
	Wed, 18 Jun 2025 07:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VoZSoB4Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ABD010E1BA
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750232214; x=1781768214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SNPLr/VvQBNoDLHNwTmJJ9dLAQ8/bLMNcMGv/BVrfpU=;
 b=VoZSoB4YygDBLBHxyIhcj3eAZjsYEiicSUfkSfwftkHRrnbneVTd4u2p
 xvDq/itQPq8EeXIefr0tvfXt5gQAwz8FnHVatMs26JX4BnSIbjC/hdor9
 e5CQvQ3UDzHSRhK+/AjQi/u1XRCXBBI3nKRv0GsMdzt9UtrYna0Dq9YRE
 Zcy9Y/ulFhY/UuxpCinomhQ+taAY8SqprZ4vAfxGfm/Y7QL23P1OUBzmr
 HYMHWNqvRwzsCNcQhJADPtnHaH0PI+CvPSkO98ILhuSxvR0J+4nWb5f8d
 mESdZuV8KovZJ6fhR3WwV0wssYaNfVvaQHt/DPVxY+F6RiOoHjYJDTynH A==;
X-CSE-ConnectionGUID: iKK3C5+DQF+Q+nw3HP0Z6Q==
X-CSE-MsgGUID: UnYgCFP8Rya+tBU1VZCzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52306752"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="52306752"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 00:36:53 -0700
X-CSE-ConnectionGUID: rNiS3hD+QZu/0eUjKAWrBw==
X-CSE-MsgGUID: NEul6TytTT2VANifa0Tsdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="172675597"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 00:36:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 00:36:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 00:36:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.77)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 00:36:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EphmsHL8x9vrDXwUPczGjBQSHy8oQ0gwBQfI/4xGV+S/tVJO4J3dCU83CY7IeTuGH9YTn8WmqEDOquWiJrmEyvmX4DTM+QZDufHtNfM6Z3PCWuKIJ0uHtYEwdyW5L3c/84SnEh2UjeJbI2b9nztAqv2dU1Lk3mN40fs5bn7102wTMuWwpHzLathvd+GgvOPzIzW4tdstopZj8K2JucDzb7drxQMEwK5hKmulLiHl1at9pR2riSCDbf9wqu3VHPPE8OUxWAAY9tJqnW5JRhWOcigPCRWlmdb/hejZcYI5EHmgO7dC0eLtGI+DvvM5NaX1FRkzoJe6/uVm+DJeqyZDhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5n4cxQrdGH6X5zuYlWpd/TS1Lre8h6O/qNmnehQ/s+4=;
 b=vuhS6HJRXSRLZlMp8998jLD5lmtYpXolIolWNh0cvaxvNZlFdlYZ/SYBi5HMmrEHMIuLZPTRHFGhuiAsHNzJHnIK3ihPWGqLLzIsjjakXAhAMfX1uiBdrNCOtwzMoNKcEL7LUX3hstEmlluT0ko7+newNn4QEZ1AcA1vWveGlP3KkLRtB3Rk/rroNkdmtD7GaJR+Clcfy+y/7u7T05ko2Y5q85+uDqi1bUEobVLXCsIkmnzlSqWHvyaQyZwNr4QIvdnYHXSycSMfrnboY4DNqNUfhuuQ3rE6+FOUdje7XK1Lz4rrm82WE4qm8nD6CF3S5oTVdd+6pHpsFGxoHcCzEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ5PPF06F7EC6B5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::807) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Wed, 18 Jun
 2025 07:36:20 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 07:36:18 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Auld, Matthew" <matthew.auld@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>, "Laguna, Lukasz" <lukasz.laguna@intel.com>
Subject: RE: [PATCH i-g-t v3 2/2] tests/intel/xe_exec_atomic: Fix incorrect
 GEM create flag
Thread-Topic: [PATCH i-g-t v3 2/2] tests/intel/xe_exec_atomic: Fix incorrect
 GEM create flag
Thread-Index: AQHb3so9WmeQSAPwoEi2IIR0a4S3xbQIiaKQ
Date: Wed, 18 Jun 2025 07:36:18 +0000
Message-ID: <CH3PR11MB8434DEA4F08F7A43DC4A3F278D72A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250616142259.19124-1-lukasz.laguna@intel.com>
 <20250616142259.19124-3-lukasz.laguna@intel.com>
In-Reply-To: <20250616142259.19124-3-lukasz.laguna@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ5PPF06F7EC6B5:EE_
x-ms-office365-filtering-correlation-id: f796c2af-61d3-410c-2ea8-08ddae3ad0a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jtk76x6AHKurf1LmKQAoBd2Ly8E99wY06tEpCf6Uj/Jy+mOTfrBy3yo4CaFo?=
 =?us-ascii?Q?FpZZu3xTrO6gqUo/M4dANwAXJwnDfYXMEppyITOAke8eFZvcy+AZLe3Q7HqD?=
 =?us-ascii?Q?Ff4MhWDdU/ja/vrWES5XH82lbL8h23CXyhEMPb2TG7qfiyo4XF2r6kx6Oqrs?=
 =?us-ascii?Q?7dU8iQnxCN+r/BIN5getek95Pf4qLrCGgVsj++iDGJha28a7xAfe4AWMP970?=
 =?us-ascii?Q?x4dA4y2Hvi+nQrB9s5f5mAGW54j6nRfUXIMc6DJZSVrNYffzvelGUJNb+MET?=
 =?us-ascii?Q?Q4OrLvCXMjuoCEdxbTxNw3DhlyRwW3e3jM9N8QDLsXUFHC30rpVtjHKUok9U?=
 =?us-ascii?Q?HkzvVmsUgqllLFJMZ6lYndXpi02eXLCqW/NAhHt2F1Ar1+NoVN1ORuOa8fwE?=
 =?us-ascii?Q?VXk62tDs4aIsmMytg3hQRz+YMJbkTkal1DFITMvunKZwytyauyrCLrbs5Kaw?=
 =?us-ascii?Q?tPG4W9MWq4lCml7jYbup6xGisVN2XUhdLtnLz3NHT6KHpEpGkX3YYU4lkf+d?=
 =?us-ascii?Q?GX8rmjxGvDrlt6M8a8vpfBMjDinafmkta/Kck65C/vF4pVgsMvl1gVRZFbdo?=
 =?us-ascii?Q?SJg0DNgCutEg2aBkqb9VuOmMnnZcb5IyekJqYMT70iE/AhcjV/EtT4uZUN+c?=
 =?us-ascii?Q?Cp3AmZEKrJNiLdW2kIgb1RvGGZUT5oJL6C5IGSDbyl2aYzvpEnyX2Rb298hH?=
 =?us-ascii?Q?fA9zsk2VG7CYKVLOZzVWAooxM+WkrP6BHnzWs+OwdAx7w+DZAHrkqCvkV8mK?=
 =?us-ascii?Q?pH7mq0KUGnXF+4c0brvCInK04J2yMbaEDzyveKB03fnoByD3Anunz97LSpx9?=
 =?us-ascii?Q?1tcE/49xzFZC588jMMD493wGEWHt9B23v7kNaezK4ES87OXc8Nv/HvGLqt/u?=
 =?us-ascii?Q?VLausYMJPYExdYxIUU/MAcLHTssCBpp8Z0lK6vZ9Hqx1waQ56KHi9DTpvSS4?=
 =?us-ascii?Q?Y8tI7rOTrjEl1YrbD8koTngJq6rdKyC7KLExayID1BQn7uUeDNNdoRCFUIfq?=
 =?us-ascii?Q?wUxzrf44qpAKp1vul/4hZuwTdbXv+vqRRFD1cpfqUPjwbz4n0OC30DVj1j7Z?=
 =?us-ascii?Q?sP1II5tlfoGlsYR3HFYNr5NGwtXx2aa6wY7PQ/GKaYtM+QVvBLwxe1Z1rIxe?=
 =?us-ascii?Q?+AjlRIHWda7CEggWiTB8Q9pAcYPCH+4HpmjUfQtJSmxqrNlSJtDrLMLZS+Qu?=
 =?us-ascii?Q?mq2yTmp/BUNJjW3HPZq1B7LjGlradxUvoigMr0k7EKqdGrYUptJh6OriVgmA?=
 =?us-ascii?Q?JTn7m3L7sSP1Rz0ATyaYsyxOdTe1WO6fkdRYfxh3EMaCruHD/RmSxlErcwBs?=
 =?us-ascii?Q?N9l2hDdr3u3SfOUv7r/he/SdRcNzqQnd1RNa+uG++cm3NGb1Kd5go8Q2scm4?=
 =?us-ascii?Q?p1Jl3Mur3GFYgjPs7lLg0v1K5TKc7ymQxuShZ9htTuY5ziUYv7C4pzH6qwOy?=
 =?us-ascii?Q?voRT8dGSyCLgVEmThBi+gUoMw2LcIq6WYe76+U9lcAglUHbiHW6vh1OWeSun?=
 =?us-ascii?Q?BY5JReD17ONJlUc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1tMPkU3a23cMDWxXdbb37296SNROCw/0C3dMAG/Krp50ILX2j+qNvQVgY8s0?=
 =?us-ascii?Q?j7P3XPr94HvwjdvBQigktnIZgz/DMX9HAk/IQ/cpbubf6KyJIkjzR6/5ZVMZ?=
 =?us-ascii?Q?3kBoabYnovHufsbuHZysUjM30gulaVV9usk4X04N5bbY9rn84LoopB3Fsm5x?=
 =?us-ascii?Q?2UqyxO714d+mca1YfykXwVjrF6cTej2/yzXb1CWQVA6ccc7hiB1LCiZraEJ/?=
 =?us-ascii?Q?/5SFQcYdG1To7NMWWjCZ2u4+QC/Syod2Z15JdiflYpAGcFcaO/6QQEsddmhU?=
 =?us-ascii?Q?eeHpFiXojIGmNQ7GLiBNVWx4vf/wLLZN0giDgRPp7T7sSZoJYJjqBaKagEUu?=
 =?us-ascii?Q?e7JVjJYwNcm6NMNe241O8wl/1At3W2zN5CA17X2Oe1wn02nLNuoz7u1Vk5up?=
 =?us-ascii?Q?d0u/GGfq/wvIwg47KhwOd8U5gzV3vKed5lvDPyd4Uqtcd0r59NQ43iwL4iX4?=
 =?us-ascii?Q?csrMbAW2hrCZtLXNWn1g6CkEyBe9ObgIK4G/1BjEB64Uf0i4lZOGQgH4j+WK?=
 =?us-ascii?Q?2nn7Mb3CIaWZz1PnR5Gbw9X6pBleQirnIfANP911/cg4hEnvixFwF2DmEpAT?=
 =?us-ascii?Q?iHEN5qqai38jBLbzeekxloEPaZX+OPPVVAGHgS9Vv+0zHnqWNyVkv+GTnnF7?=
 =?us-ascii?Q?LTrLuUYWMWVbTOLh2W3Jk1ZlEP093W3x4M6QMGB/F+QCqmVRSQrc5JoETTky?=
 =?us-ascii?Q?kxRaWRHUelxpXRBUOjM5r4QwqpCvvHTJdpK0hme4utmCLnLfnZQhdJy9RqWX?=
 =?us-ascii?Q?Gm3v/NDN00S+5pEf3lDw192a1c/qiREK3gf7l1yeuCPyEdxzXGOF4jhTtAyX?=
 =?us-ascii?Q?vxZeU7bKBOWAGqIayuKYUadNqWV/pAQObUKDtV3+jw+OGbwqLMYvNxI3w+/m?=
 =?us-ascii?Q?lg6JCdBS3053u6u/6dHb0lB9bnMODwrZuLdBTXxdVdwbMsmxebURy7TwWQ1f?=
 =?us-ascii?Q?3GcrAysl30KxOnZ6sSE+95qReZrTQmrTSYIeAfIe25aDVAHfFI2yfwrFf273?=
 =?us-ascii?Q?Ek8v8jyoFkXvV/8I10CxSmqaxaw6Rk1aLJeigdUV1zEfPqFaS9a51Rqikyhh?=
 =?us-ascii?Q?3/mS3fxsOSpN6gCZP4a3OXDVQa7Mw5UKP+9gPPjotrCp31v081I6w02OXAFe?=
 =?us-ascii?Q?vO5oPwuYy7HeWB9JeXH9oRmXm9oFnxFeDSgDkPW8Mv9DnrsiHGldgEa8P1uV?=
 =?us-ascii?Q?x1p90L5gpglXy7T/HiP3IvO+4vnX2fi/2mOdtfJWByAypB16rI151hwyMfV/?=
 =?us-ascii?Q?OYWUBzdEAQ7IwMZqcr7h3cUJA0j3Az8q6cV9pq6O4RtALtOKCOjiGeVM0NlB?=
 =?us-ascii?Q?+tGPKSsBYb0Izdvod4Abwq95/e+QX4D6iNI9RXif1CRkE7iAe7hJttTJjXHz?=
 =?us-ascii?Q?ipF0ATcx5tUhNneDsOiiyKSe0s9K67bO0g+s3e6Tz9qqnym2ykUfKV8rj2Ei?=
 =?us-ascii?Q?l2Zpbn7h92/CGkY2iXlCXC9itbJIP+wpcgZWOmnnhIWQ1wKZNQFPMEVdhthY?=
 =?us-ascii?Q?k4Q8pxErQ5TcJylUfc5JibOSBHCSoEulrfzfEHDs9xfBrV++s48J55fjqavz?=
 =?us-ascii?Q?iLlXiqbjokx1vC1hsl4jIzdEyC4WGXc4vFGUC8qss7btCyyma8bVNqffWuGH?=
 =?us-ascii?Q?4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f796c2af-61d3-410c-2ea8-08ddae3ad0a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 07:36:18.8138 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 15l203HRPaXvTT92eBLM7wTpzLY+NvFXfKUuFZqZwig1tU4991nCLh9qZ23LYDZ+s7gD6rA5hze5sxQ67CnCAMmo1yyJOnniEntqeLq0WXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF06F7EC6B5
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

LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Lukasz
> Laguna
> Sent: 16 June 2025 07:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Auld, Matthew <matthew.auld@intel.com>; Konieczny, Kamil
> <kamil.konieczny@intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>
> Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_exec_atomic: Fix incorrect G=
EM
> create flag
>=20
> Replace I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS with the correct
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM.
>=20
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
> ---
>  tests/intel/xe_exec_atomic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c =
index
> 825d7d190..39c739b64 100644
> --- a/tests/intel/xe_exec_atomic.c
> +++ b/tests/intel/xe_exec_atomic.c
> @@ -85,7 +85,7 @@ static void basic_inst(int fd, int inst_type, struct
> drm_xe_engine_class_instanc
>  	bo_size =3D xe_bb_size(fd, bo_size);
>=20
>  	bo =3D xe_bo_create(fd, vm, bo_size, placement,
> -
> I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>=20
>  	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
>  	bind_engine =3D xe_bind_exec_queue_create(fd, vm, 0);
> --
> 2.40.0

