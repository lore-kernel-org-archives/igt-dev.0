Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F3BACAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 09:37:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD6D410E191;
	Mon, 22 Sep 2025 09:37:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/4z4tcN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACAF10E191
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758533863; x=1790069863;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o8e5Bw7wAsroIOSnQ2PQLzeW+O9Kd+Bv6bgHLnjTLIE=;
 b=d/4z4tcN/49DLTCHAJPTkXJfe3VqZ9L14M6RfPEo4u66zqlkmUEvu0+y
 qentGxZxwnuLA1a2Kyqo/mvpLc0pna9kOe8OoVY3SGVEy+XuIaZPBbKuG
 bbseuwEpEwKMrL0D+IZbjchBPGorxKv2Ut1O1UB6uPR1IwMCDWN4bFtvH
 lN48TYMTCzb4Mxq9ncskk/KNHKoiqXxcC+ZtQ9lmYH1YPuy7qDXnTBOvi
 PI4J3/9fZvhbqR0JRSUygGUcSX3TcdPLUdpq+zKDghwOM5fxraduvyFAo
 Kjl3W8GsfSTCxaZ4VFQw8IjpUYeTzEezBjznFnHNLpc6sEq4W63RrMIZH g==;
X-CSE-ConnectionGUID: i1qX7TETTj2ro9R+kTjN8g==
X-CSE-MsgGUID: qMSqmEkMTj2XSUA0X6IMtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="59830908"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="59830908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 02:37:42 -0700
X-CSE-ConnectionGUID: PBQdNmm8QGmp+CzFLIHilw==
X-CSE-MsgGUID: F2dbfMqAS5muK0/01k8mng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176044620"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 02:37:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 02:37:41 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 22 Sep 2025 02:37:41 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Sep 2025 02:37:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWbUh9aSXx4evT9EuYUFQK6d2NIgqsCHzu2hVp3u4pw8Q7dzQBK7x/x7ec2Cd0bkavrfAZLFHo0J0+pZQc7gIj1TbkW9tit6RB0m69ZZjD4l9J0uZyGIPPUNYc5qwa3JimZLN/qeFoq+e0y8juImKnA64jMR4d/34u1XEruNztMFAIqsREKdy66FOrv2da7TZs6priiAKPjncQ8HY75kWx4OcnGryfOs5W7YwKw6JrjRbotukjmk/9C6VGm8QXsmuUe5M9ae03dNo/XrJkVRRG0CYgDz0B2k8ouwl8lLaylpHgPKN5Zbs5nnJ3uaAocnjfiU3+F5UfL8RwQeH6FAzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiiiZuS26TX8MKU79uEpPKPpkdFwD3fqzGxUyGd2a7A=;
 b=qP1FD5uW0dN0+w3Wy+5MOijGfG3+eJ7K/qXWIRWK2GRMf+4FVl0UBvkp4D0uS2C+N7YHb7kvZd/lHV7RTfBtaEpbpudLJbZS6KyvhgPsZ0iF1lvjn4Yfw4n0hBprxTKTOc2DQcUr0bKVFvnwxepuN99rLJ1INRoHOG7eiSV/HSF/lEM6H9wJFzF64UndPzLgdxxI++nM/jbKrhstpyyV/BrkLeE2DNyUvMDnXTRPOI+U61Uc2LCc3l4RsoxRYmDTYOhZvmACvq1D2k7RAmIK9LsaFl+jYkz5x/cArST06N+iY3vddbMuPuKZhv8elbMj9WuFNHogOGk9OthkubHhkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 PH0PR11MB5125.namprd11.prod.outlook.com (2603:10b6:510:3e::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 09:37:34 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9137.012; Mon, 22 Sep 2025
 09:37:34 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Reddy Guddati, Santhosh"
 <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t v1] tests/kms_content_protection: clamp fb size to
 output mode
Thread-Topic: [PATCH i-g-t v1] tests/kms_content_protection: clamp fb size to
 output mode
Thread-Index: AQHcImzjXOna0H0NuUWMI2+owSWbELSeyrvQ
Date: Mon, 22 Sep 2025 09:37:34 +0000
Message-ID: <DM4PR11MB6312BEB1F6AF79DE3CA74D3D9012A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250910160413.254034-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250910160413.254034-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|PH0PR11MB5125:EE_
x-ms-office365-filtering-correlation-id: b06d3437-d567-4187-0701-08ddf9bba8c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GPSj9TB57Pd88R29kCrtcbX/08u0BEpc5VV1TASyotNLDACBDfPboPJkZ0AG?=
 =?us-ascii?Q?sk9vxfpYRTp4+GntsDFsg/lk/bz3EFkobokiMgRJh16IMSyFgB4VqbqVZlq3?=
 =?us-ascii?Q?qvuUW9bkU5KO/Gd7GbnQjNLhB/rWjU5bxj6BdMSqVygGPtfbxTTFJ/TrXo10?=
 =?us-ascii?Q?dxRVzv7h6OACDxXqS/T9xaiH79BpNRcJt+x8KwZIBXAc/P/Pn1141IS1C9T/?=
 =?us-ascii?Q?4RFY23LZJ+GJabUifACvdVWc+1ejjkGxRjLJcJ9QtmXkLHuwKzeZkv0WG9fM?=
 =?us-ascii?Q?peHAWFbN+M2e3VdQJ2NBH79VvmtV6VLtf+wvFLh2EaIr0ysxE8Ko5KMH5Bm8?=
 =?us-ascii?Q?vmqKGjnW1m8E0q8Kyzk7lNgOOtzJ9uS5XT0Ft8V03Y0FKCU0VzdGhcgV3Gog?=
 =?us-ascii?Q?XLspeQRHCCnNTz3NZv7fCj5E+6C1/m++6L4NlDJ8ErbESUsBeXPOdEULUQpa?=
 =?us-ascii?Q?Dx77P1ny0BCNX5uMmF26hWO6wskuqe10MnepC8zYAJ2dI1Sjw7M0QTV836dg?=
 =?us-ascii?Q?IzeWMz23sTExjva7Jm5ftvwAuw8Jd+w+fhbNpPZF4UYrmZz4hg61c+fM5mu7?=
 =?us-ascii?Q?edbvW6I3GhnhI68N/0+/bsIjLP6SyR/TB/vFFp4v4MhMlkuGiUWlr/1dLthX?=
 =?us-ascii?Q?5/mkDTCCJbjupv3yshh2ZILEU7jGDTrRZ7RZ66K61QcdfbwbR0kSyZx+F2rB?=
 =?us-ascii?Q?YIbnyllIwW6rPrZeMw5zjO1CLRBi216jqDfJYBX4gxnOLggzUga4652uaH05?=
 =?us-ascii?Q?+21UVeiVknY5NEvPmSLIvslnDB4/qcy1LA7tEiHoktJ4LxKnl4qlOelLhojf?=
 =?us-ascii?Q?FFSuBPH82m44/BKisQUvYxN+ua0QNAwCHMOTb8mK6nw4drJ99rYVkWpt6xrx?=
 =?us-ascii?Q?z59LzW1ApRRRatFI2k7trSAm+Qp6QW7HUHJUwUdDHkMr/pKmbeI0VWZxDzWB?=
 =?us-ascii?Q?RRN8y1JMCE6LRykeFShQmt4k4F8YfxQSi4/hqSO4M43cvRmpbtc3+Rklz73a?=
 =?us-ascii?Q?rSnxk2yTm+UGR5fbGpLGewAdzAmmbHtSwc/kU+jSxN3+VQDPvlFjOVfhxJWx?=
 =?us-ascii?Q?XcR4Yiq+jRDDUmu4DaZM8u0LzoQ+18shy2igi9Pcj5t840996XeDAWHtYQ32?=
 =?us-ascii?Q?LtGnZ+2v/c2mYA0kGLW+K6J7wyA/xruGBjPVyiilfXb2OvV10OLxqMY+3Aa+?=
 =?us-ascii?Q?8gm8ywSZ4E/tJvWacNmm548S407MoJy3ukFRzWjHQzftWuU36JKxMlwLoz0l?=
 =?us-ascii?Q?mm9SKQ4sRTvrdgGiYc+l7NU5KLScNg0inak8hCcLE1EsmHKcEIMlQHYuvb4C?=
 =?us-ascii?Q?kCFgpMCTtiglfF89zrnCSWm1L/5luL8Y/t7HaQDwZfC8GKBDROXbB7awACf6?=
 =?us-ascii?Q?91Mlqi1H0W9qUpVuKETjfFEZfdFyU/CxQSj+APL1uKvJnAIKhirsVoX+Zs+u?=
 =?us-ascii?Q?a3v3tezZsSCt2SvMktUiG7GOB1AOZcPkx9ZVDY/jymQODg6XWyrPzg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?G8aIa/oAOiYF0r1EPMMHPaGgdgtZvoxOdieeSQS5z5WhbCmuK8loAcUb5wkC?=
 =?us-ascii?Q?/1v/aIseWRBtpuy66MuLg4MEh4+jQw0fzvdYRgyV3mzeHjK2D6HFG+wrCoHT?=
 =?us-ascii?Q?6kNQ2gL/eyEuZEXs4Uj4hn0+I/QxlAPEvd9FScIlqXaKIfsVCOgDm/W7yqtJ?=
 =?us-ascii?Q?OlnADaVCY65fLfJO+DXa7vKPAl0LcG8/lxEFQ89fwJZoptfPx1ngqK9eIVT7?=
 =?us-ascii?Q?lq24l2DkIoP6mUy5l+O9HbIYxHeYsectQXtNe68N3cTsB+s14opN3aT6G8su?=
 =?us-ascii?Q?FepGKeIBNPlwRvjPCN5l8X9VLj52cDUhBD/cGjtPtCNAsrRrw6sQYge37/eK?=
 =?us-ascii?Q?/ZKNZLBXvT511skdyk7l4blSrhidglYAj8UmnLSrx1FI53YeAaXAJVlLlva8?=
 =?us-ascii?Q?PLyR4uZcCHM9GmsAPBu4pagF8Q5XZsHMZeNdvJ1v64OF/9DjP+d2HTRsxlnN?=
 =?us-ascii?Q?e+xlORROk3FfHC8eondGgZHmfVQglJAUtuRJSTX6ta2RYNRhLUxPAwwCCZ1b?=
 =?us-ascii?Q?jXi883sTwV89AS2kOlQ+Lu7QzD3JiAePOoWC1YB9Co14ovQOkZAQQdDTiB9f?=
 =?us-ascii?Q?+7z/jJcGDAAjRYt++2KDokW/HzMDGCfWn39x2zQFQt5ISEhWtPfND6/tuXHN?=
 =?us-ascii?Q?P9kL/rfSNvqNj7RCctZ0SxzdpVlhvKcrQjSlgiFeMqpQOH00f8jmUFYbYnyZ?=
 =?us-ascii?Q?W8nR4uJ5YBfKizyCD7cX3svTkslf8uX6ZqX47iJMXFU98oIBM0ukq2vCBSS1?=
 =?us-ascii?Q?jgOkRf5ThYrdtuQva+udF+cuiFT0XAQnG5OT0xqgdMuqSJmhx+5O+ZDPU84/?=
 =?us-ascii?Q?TSubGCmTo04JIivjZ47CdATpLAybbzQOS4hKhYrbXkRs+g1dLGUE3aO7cDzo?=
 =?us-ascii?Q?LSGqXpCRvdPyOUqk3yNKEvjSlc+8yH2tgqqO8TQcOhlzsX982eNVDMgoBak1?=
 =?us-ascii?Q?rQAHxFmZYSspAIk/NuEbxqP54w0BkTZt7d0V1tqD2JYtuR1ZIsUmmHmycBPF?=
 =?us-ascii?Q?YSsTyU6BU4fSp5+AkvEslP6fFBhuz/yvP+0w/JL8ZVqaJ+6Zdu+ughXsEr5d?=
 =?us-ascii?Q?2uI749ZlLhB0joTlGauVepo4VRCcrCz4CQrvsdPZHiI7if2n6dkecMqgz3Ms?=
 =?us-ascii?Q?KgII1axjEAlTm66OEizosc9W9uB/79TkKpOKLZoFyOIxjWXjoRA5eE9IF9Qk?=
 =?us-ascii?Q?9HCX4NFhivu9sWbRDhgFzIWyIGUKR3lADQHO41gSVmPLHePrtv3d5wY/wzfA?=
 =?us-ascii?Q?NDj+DSSTo6iF6r39KqDyq8OAlQm35eJRFVxTKo8NELKpEMfUQqaAKD0d8yUt?=
 =?us-ascii?Q?Wi2P8oO2z/agmPtASkafQ9DAXwFvPoFdOYQm5EED2UReX60BiMqf/Q/4GGnF?=
 =?us-ascii?Q?XV3ZQcKlbc+TWt5gU3wkYW0y2toahzv9qDg/N7KqE4hSrCEITUNb9Co4e8qL?=
 =?us-ascii?Q?iCSoUxEIc1WDrKj0JtTBIY4YrAx6tM+A3/KUs9qyfVRQ9v5dor7PgBzBmGsi?=
 =?us-ascii?Q?KlY1CNrCA/YO0008iRx/JggtLXQr2yWz9pettv12tvPO33hEqBNzq61eJbDF?=
 =?us-ascii?Q?DFFzfJsygfqMQAy8BrfolKBy3H1J3mgxlZNKbuzv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b06d3437-d567-4187-0701-08ddf9bba8c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 09:37:34.1864 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r4HWy8dsgj8lGstZuKEMnJmYxNQ1eBPa2oCQdzpATsU0BWsG3qOKvuT8OW1D2Ru5Qeem+J26Yu8vBMYGAhZdAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5125
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santho=
sh
> Reddy Guddati
> Sent: Wednesday, September 10, 2025 9:34 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; Thasleem, Mohammed
> <mohammed.thasleem@intel.com>; Reddy Guddati, Santhosh
> <santhosh.reddy.guddati@intel.com>
> Subject: [PATCH i-g-t v1] tests/kms_content_protection: clamp fb size to =
output
> mode
>=20
> When multiple outputs are connected, create_fbs() allocates framebuffers =
using
> the largest width and height among all connected outputs. When performing=
 a
> modeset on output with lower resolution, the full fb size is passed as sr=
c
> coordinates which exceed current output mode dimensions and cause commit
> failures.
> This patch clamps the src width and height to match current output mode.
>=20
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tests/kms_content_protection.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protectio=
n.c
> index 51fc1d3be..d44865468 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -243,12 +243,19 @@ static void modeset_with_fb(const enum pipe pipe,
> igt_output_t *output,
>  	igt_display_t *display =3D &data.display;
>  	drmModeModeInfo *mode;
>  	igt_plane_t *primary;
> +	int fb_w, fb_h, width, height;
>=20
>  	mode =3D igt_output_get_mode(output);
>=20
>  	primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
>  	igt_plane_set_fb(primary, &data.red);
> -	igt_fb_set_size(&data.red, primary, mode->hdisplay, mode->vdisplay);
> +
> +	fb_w =3D data.red.width ? data.red.width : mode->hdisplay;
> +	fb_h =3D data.red.height ? data.red.height : mode->vdisplay;
> +	width =3D mode->hdisplay < fb_w ? mode->hdisplay : fb_w;
> +	height =3D mode->vdisplay < fb_h ? mode->vdisplay : fb_h;
We can use min for better readability.=20
width  =3D min(mode->hdisplay, fb_w);
height =3D min(mode->vdisplay, fb_h);
> +
> +	igt_fb_set_size(&data.red, primary, width, height);



>=20
>  	igt_display_commit2(display, commit_style);
>=20
> --
> 2.34.1

