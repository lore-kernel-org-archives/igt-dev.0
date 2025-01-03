Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F510E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 08:09:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 181FA10E81F;
	Fri,  3 Jan 2025 08:09:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHp19gj3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4849B10E81F
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 08:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735891741; x=1767427741;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UqWKGZ3+xx0763HhCZLOkWs+rzxEoVClkyZGmgDA1/o=;
 b=aHp19gj3zSt7P1PyLPswRbZF7S2YYthyAvHOBwKXZ69HWGbpPIST4ZFu
 WbkAMaPBZMR/HOJK03zOkRQ0zwXQ3rg5kRpuVFqPhT6opQrSRoOUrFmp5
 z0jLUjfhTk0H26A6VgSTqzviKLQ3N52cet4/YT2AYxmrL82JMwmQiEGV1
 uACDZb6aT/waf0PJ49TJ6hUCbPd/z6IO6QSbY5z6ynuT+mN0cw9pg7QZu
 Kf+9bKUKkqpu7urqI0hcUroKyye2NSsJHTxzlApxycdb+lTyoItjsoPgs
 0LCHS4CA/QO1HzMJfczeZHX3fUnHbADJxNqarM8rkzqXTlBPoNU2HEeUT g==;
X-CSE-ConnectionGUID: HOGvFpIIRPKBtKe1GsZlng==
X-CSE-MsgGUID: 4NfYsGr/QEafA+CHR/bDzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11303"; a="39906612"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="39906612"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2025 00:09:01 -0800
X-CSE-ConnectionGUID: CNQR7JhSSyiiqhwxJONzkQ==
X-CSE-MsgGUID: wJBjZmx+QuGmp/c9NKs2Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; d="scan'208";a="106592625"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jan 2025 00:09:01 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 3 Jan 2025 00:09:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 3 Jan 2025 00:09:00 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 3 Jan 2025 00:09:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r8oTtVijLDZqfs9h8e+hTZCPSKfmKKkofBe3RbXleAK2ERanWl4Q6EPJEtNbbMVJCwjfd0kqGAomnsP6B4zutHwyj1cPFUo1YqRrJ0ByjfTQJP4qQMV9mgz5W+dwvloYZbDljN8HNS6VBIBfEO/rnlPGAIoeQIkIgIPbK4H5wOJZSJ3qLvfj5pb01PhlQnaqdsVoW+brb6BpR2Q7b8PNtf80THTLcwS4canonP2oDLBzv3pG3PMB2bVNorMdGTN22a+9kOTw8/7H0wc4YzQNpeYJ/v1eAyC2yDIMGzXLjrviVXulgwiE7ewwepyL3H3guNsn24RMH1JUumhaorviog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG+a4MdZykogaPC/7+QdAksQlbFpJvh42LUJrSeLCeQ=;
 b=ZLT+TeylCSEGurTsOy98DYQ8vcGJr391edIhjwp4DIbNgTnefk6ed8AyLn5HPuROsrzkKnTNAbHwgLD6kst9sGq5CeCWvCSZ/IhdOWBVDPDdpbIYPeQxkUyh5iQw9tidfn3Mu+lHCuEnhhauXr20S+1Ruw9FUkxvt2FD0HtwQ8PdlSMotASbaU9VI8UrEdc1DtHmNazfIHJdy92WaClt9ZtSTyoeaVF9Zst1k6S5WMH5iqL31JSLSkmZH3NggHfDt2OfQvc1K+v3rS4/yEiAiwUhW1z6CdsXGiZNJn8cRoJ6pEq62Dj+cXdebzc74FwnNDmOm56rcwEC0rYfRilbKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8314.13; Fri, 3 Jan 2025 08:08:41 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.8314.015; Fri, 3 Jan 2025
 08:08:41 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dirtyfb: Add logs to skips
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dirtyfb: Add logs to skips
Thread-Index: AQHbXRdbxnYVAnns/U6fcFza01c3VbMEscFw
Date: Fri, 3 Jan 2025 08:08:41 +0000
Message-ID: <DM4PR11MB631220D7A63480D54E95144190152@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250102131247.258388-1-pranay.samala@intel.com>
In-Reply-To: <20250102131247.258388-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CY8PR11MB7395:EE_
x-ms-office365-filtering-correlation-id: 24163bf9-048b-4df8-7c85-08dd2bcdd5ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?JgUk2UYbrzwD7ksX6B3uAGk4UdwLGKo8TViC2Bs2WEJrmbH79BoxY5bBJUaL?=
 =?us-ascii?Q?spBjxqxsvVcfEPK5FBCdYJ5qQaXHMeUdJOxBcbq1NLLF7Uf4JyJZNrQGKcwH?=
 =?us-ascii?Q?eZPKoIg6PmPhOYufeKbFpZQbJOqz8jbiJ7+11S1ikyr9Gf2Fc8WbToj0LZcP?=
 =?us-ascii?Q?rgFxYnrSkFxNyblTnQGdDhaMK4FPY7iCpKm/h4rOnhat58GCdIt3NKFCorYD?=
 =?us-ascii?Q?B6XEHgmly8MpRyG6b2m38MPis+hjIdMOHhFSW+A9DmjblMEX7ZKWJXju11Qs?=
 =?us-ascii?Q?5LFUMKqyA1oJHpe06pzTWxAQ2k2Ot91mST3gCdqx0upPGBBuUCKDIhcMhVrB?=
 =?us-ascii?Q?s2eK8gAtnGSQfG7RkMc9SROOdJdL7lsDncNKOqyImiaTTNRn2wMLR+tk3dCv?=
 =?us-ascii?Q?y6q6T+QB84bUorTGX+RFtBPTBeoQ7lWqQwZpKAMj7XjU474b3M1sOc00e2xY?=
 =?us-ascii?Q?mrMTkIUYvZNs0PsYPivIhvMcc1GHLWQREGU0ymjGihedKSqOlljGOmuIABPH?=
 =?us-ascii?Q?OrqJ++tQ51gQi2y8OuhUDestc/ffQh1eSrICbl1bUOWYWAR0JZx55z5r3ocJ?=
 =?us-ascii?Q?YZ+2LGIOpjfqIJcAY9YI4yWlV/GrVNC1qCx+lWEwrgyH8AUtsFULGGv4kvRh?=
 =?us-ascii?Q?nzw0P1I7CJq9qNJQxadm/8NLd1SBswLcA1A9zzIfvrgfXRFjtHroiwfQHYgt?=
 =?us-ascii?Q?d/qaGg6UrtrtJX2ZJlJdpKvImUrQiaLKYlEvP51tm+093fDnpD1VUJ5PYw2d?=
 =?us-ascii?Q?CJBnFLhWZfQq6xuIlvESw76hGtm87NH5nkgwN36aXnSoc/1SxWf200MkRDIr?=
 =?us-ascii?Q?ZSW4j8/rJdMLBdlcPjGN6rLZiG6ViLs4tq5f+IrwHFob5+R2SNx1u9aYH/b+?=
 =?us-ascii?Q?oxKKzk3IZNRsTJ28AK9APl+S+e9xOliNlUZfPD2uBvsLUiJ0aClXbTnaj9v3?=
 =?us-ascii?Q?SbvObBiBaNSyqyzf413AxkPgheU2/0IcmIaP1DWM46kuePDD8vKvWciP1iVn?=
 =?us-ascii?Q?nWO66varmZXTFn+0ctC9233IEU6Y79AXyD4C7Q4Ub9624+P12wM2zq3nh8iH?=
 =?us-ascii?Q?WMA4Q3NnBTncgvKNBaJmSIkMLEHoYUQHeb+4g9Fq3t5HWBeVuxrIUxQJPiyf?=
 =?us-ascii?Q?UEaO1awXXhPs3zuWbNPcHlYEtCCI0xQe9npQl/7KsMZJk8hSHw/rpXmA45sz?=
 =?us-ascii?Q?/2YPgjD4fvLOny/x4eJdQxAMvikSy3WLJsvm+1cKJL2RN32AUJMrYe6m3eHR?=
 =?us-ascii?Q?plfPRpMa9pRtexQu3O1or4kV1bQkJ3mhANHNQOLudqn5TGDcDUrFi/IkA3ge?=
 =?us-ascii?Q?H8lZvP5cB6qgKQCeldoIRib0odEQbsyEYzGdaXOfs7sNcSgA+UJJMJa7T8zz?=
 =?us-ascii?Q?1Z2dkxF+oUwP0vza9OMO0phiw/P+UNWzJkGhnsm9Lrac/ru03iXkTPW8RVMh?=
 =?us-ascii?Q?j0Qx0wAcwMbzpR2hDBQlnAzHCUX+3PMC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?a8VEj5iYMINQHmpZDSdjhYhCl0MaLTLmjWbuvqdIzx9akkBLfZ4Zrwc88S6Q?=
 =?us-ascii?Q?f1tFT+G1P+v93bcbwomYhSXprgbM5GQuhkrGtKW1Q9KQ34p0BbOa2eNch5Nb?=
 =?us-ascii?Q?dd199X+2CTyIS2YYuADsSO9rRp8cbfGnUgLo42S5FwMWF4QeRuKKM43eH3i1?=
 =?us-ascii?Q?24yg5+ihRURoIrejcnLHYblMjsuFc2M421AJNAvTwcD3kIzUF/vua1lNkXzE?=
 =?us-ascii?Q?iWXCWMoHkpAVcj0S7UIJAyPj9lI8i9eUO1dSlZ61iumY6zd578wvqJwwG9j6?=
 =?us-ascii?Q?0Is8kf1E8iFLCIbXNh3HE1RDptjFVi/BblA1YMbWBTuAzlRJmhR0vVEZfFGP?=
 =?us-ascii?Q?ewwjEvbW5NaeHuSWsCWwO8m8+wGMXrd1AQhoqLy2He5ZP0Hhd/cigILaTwjV?=
 =?us-ascii?Q?47S5tU8weWhfAjAQtxZVK++dRoMJ80crRugsxdPezq6DwJo5ZHE/dRncpdoB?=
 =?us-ascii?Q?q1jvqVF3Jw1pK+la+bVGNI5kw5hI0NEM47hcaAIXSrs8l6/ycpZ+92xMrlT4?=
 =?us-ascii?Q?IQOPFjkliDedhh6r68eTx6ZPhxYoDFnv9slh7eeZ5CMRhV3MA0AdpB5CQYOx?=
 =?us-ascii?Q?WfZjW5brkMOGOC2SOMMEmGVBXBiZmVPCPWWk4RICIjBZ5186XaMzQJTbZoSN?=
 =?us-ascii?Q?OaiSXUf/QkBXWAGBImtzByjHaRyUQb/alNVMcXV4f+kCZyN9I+kx/C+/XSu1?=
 =?us-ascii?Q?OA2/hyt5n66l5lO1L/NeZy/glw2sFSyyJoxENI8ncrx8AmMmNosdJ0B3eX0k?=
 =?us-ascii?Q?f7FwJFwYExXmQilgq1bb4vfJM6hJTGW5My0Z3TAzKadRUsDCSKA74BHynhfw?=
 =?us-ascii?Q?PWOIZ1OfFjhgpRn9y0ZUBt4mxdgVeWVLpKGsemO6olEsqWVz1vtTpAGN1p1Q?=
 =?us-ascii?Q?R8k1k929HO+fGgFZhU0vBsbJ8MNcRnei3oXVD/YwR+y3XCjlgeHKWL9V7piN?=
 =?us-ascii?Q?PSaiR1RxUYWP1g1hzT3g8MKn7ZGphGdyGbVMBXR+BDWegp6zp9ayepM0VNoc?=
 =?us-ascii?Q?k8FsWtG9Z19iCGLJS506ZY2iFAf+gNoXN9o//0enKHt7K3AgYAdQ2RkTXW38?=
 =?us-ascii?Q?qkknlG9hIlfEbfoOb1mR4mQ/2m+oQCCgephAgGXuM70y/7qPasegIzMJzvOa?=
 =?us-ascii?Q?X5+6cOiYgj45Q/V+MaAHkeEmWxSxPlLNeiuOy7GUZNLZwjC2Xo5ld1ZQSJQ9?=
 =?us-ascii?Q?BeKUInJTvAavsvS9bNBhHpRMe3bFLt4VnNcl25NVe76JqGzr3BoEljKBPj43?=
 =?us-ascii?Q?C2oILsCLoEjDJi54X9Y/20o8FTDHI3930vmyIpUlyCDWKf3EKNsawZrPoruc?=
 =?us-ascii?Q?qF7lMLxsZ0C63nM23NMf+hWz7efjNkZJ1swhq0WWTO797uAZ+r8/hAnMJ9a+?=
 =?us-ascii?Q?WOlAqHxbQ2NGVr3T5D7AOZVyJirC+sLPE0vFmxU7UcKgtE7QyMyfL0AA2obI?=
 =?us-ascii?Q?RUM9Swx1u60kPKvoXtxFTk6ogVc4R0KQQhQN1fyIOiVKsZsoJ9cfP7JGVjfH?=
 =?us-ascii?Q?RtZu8Lcqf1/f0unm/1pdVZ7j7MJLgYpkvVKQx9aK+XiINcmJdeO/4Rvw1zA+?=
 =?us-ascii?Q?00kQYoE76P3Oy41Y5SA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24163bf9-048b-4df8-7c85-08dd2bcdd5ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 08:08:41.1389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P8lA8MGcjRU2N6jy4/F/TmlutPvZ72HzYljn+QEWBt1fjr1IYs5ILcQAHgECIwEn6KSAf1jD0tIEwzmT51CtWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Pranay
> Samala
> Sent: Thursday, January 2, 2025 6:43 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Sharma, Swati2
> <swati2.sharma@intel.com>; Lattannavar, Sameer
> <sameer.lattannavar@intel.com>; Samala, Pranay <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_dirtyfb: Add logs to skips
>=20
> Having some logs for test failures & skips would make debugging much easi=
er.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_dirtyfb.c | 37 ++++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
>=20
> diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c index
> 35df9be3b..19dd283d5 100644
> --- a/tests/intel/kms_dirtyfb.c
> +++ b/tests/intel/kms_dirtyfb.c
> @@ -102,21 +102,40 @@ static bool check_support(data_t *data)
>  	case FEATURE_NONE:
>  		return true;
>  	case FEATURE_FBC:
> -		if (!intel_fbc_supported_on_chipset(data->drm_fd, data-
> >pipe))
> +		if (!intel_fbc_supported_on_chipset(data->drm_fd, data-
> >pipe)) {
> +			igt_info("FBC is not supported on this chipset\n");
>  			return false;
> +		}
> +
> +		if (!intel_fbc_plane_size_supported(data->drm_fd,
> +						    data->mode->hdisplay,
> +						    data->mode->vdisplay)) {
> +			igt_info("Plane size not supported as per FBC size
> restrictions\n");
> +			return false;
> +		}
> +		return true;
>=20
> -		return intel_fbc_plane_size_supported(data->drm_fd,
> -						      data->mode->hdisplay,
> -						      data->mode->vdisplay);
>  	case FEATURE_PSR:
>  		if (data->output->config.connector->connector_type !=3D
> -		    DRM_MODE_CONNECTOR_eDP)
> +		    DRM_MODE_CONNECTOR_eDP) {
> +			igt_info("Output is not an eDP\n");
> +			return false;
> +		}
> +		if (!psr_sink_support(data->drm_fd, data->debugfs_fd,
> +				      PSR_MODE_1, NULL)) {
> +			igt_info("Output doesn't supports PSR\n");
Correction =3D> Output doesn't support PSR
>  			return false;
> -		return psr_sink_support(data->drm_fd, data->debugfs_fd,
> -					PSR_MODE_1, NULL);
> +		}
> +		return true;
> +
>  	case FEATURE_DRRS:
> -		return intel_is_drrs_supported(data->drm_fd, data->pipe) &&
> -			intel_output_has_drrs(data->drm_fd, data->output);
> +		if (!(intel_is_drrs_supported(data->drm_fd, data->pipe) &&
> +		      intel_output_has_drrs(data->drm_fd, data->output))) {
> +			igt_info("Output doesn't supports DRRS\n");
Same goes here.=20
> +			return false;
> +		}
> +		return true;
> +
>  	case FEATURE_DEFAULT:
>  		return true;
>  	default:
> --
> 2.34.1

Apart from these LGTM.=20

