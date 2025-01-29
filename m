Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E64EC0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 05:39:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82B2510E0B6;
	Wed, 29 Jan 2025 05:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrAlJcXc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DB8B10E0B6
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 05:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738129174; x=1769665174;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dfl3Z0CSSuPpmxl23bMAbdCmcNJF2wxCS1Wfj6mEHQw=;
 b=IrAlJcXcwuwM7mxZ4P2hcbSUl1RqFUJXeSuiSuxzWfHTciS0hKOdJy/D
 x1bPPRboBpiQHYvpTbw6aE38/yO8sdc04jqQFULF8BpXocyRLBA7g+lw5
 ESWYOjxAwWUlz7XmLFEu4Y+zcccHFK6Qzh838Wpg6lBEKRMEld41vvwUk
 NwAnB1Zmuk71/50ktmMTN4mR6/Cz2k6Krznr+G4wermrzvRKkbanng5gy
 l8uxGGlKSn4StvqvT296xm2Kca795IwbMAgnnLK74RUCPoGPvtGThzMUe
 3TJYeFl2ifJMqGpUW1K5PysE7lzep6yCW7GAQ3Dcth3yG4LXD7yHU+5SQ Q==;
X-CSE-ConnectionGUID: XAZhfw0CRC6Elkixy6ZPGA==
X-CSE-MsgGUID: nUhf1kYERhu6cCZYOBF6Tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37826391"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="37826391"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 21:39:34 -0800
X-CSE-ConnectionGUID: VJiEb5VOTf+KOvSDvbD5Vw==
X-CSE-MsgGUID: 3wUlfjTOT7WZODCOOSU+Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="113560220"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 21:39:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 21:39:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 21:39:33 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 21:39:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dl5ueQ94nq6SliEefT5cijl2lJJNmzzv3ycEEUr6MUFyzohpBEzCmV+oU7E0Ravs8AanVhgqVMWocxltdSBRho00tV2YfxVBbSqFAqYKeSRz8mzxsgJsw6cuIXQVj4yVUe95bWRXR/yQT3Yr8kE74icdxDwHi/LmvAsFU/ggLsjhmzM/9sDcNGNIUKmO6ja+3E6fEZ1ss91NlYWou9zQa5tmiPVnd20HLHZzyIXFus7AEcai9Ys3aNUAQ1C2fu0xfknDhA0cxBf3kSlQYmB4nTPAIa0fhcO0p1PX7XodNWBkw7Z6HOXxFK8v8NTZHGZ9REM3+mN+RM6Q1rxd9FmW7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+1NDG9WF6rqq1mcYr2lZxImCaHbIrjGOxtZIs/kGKs=;
 b=FZiFR7Cd4xWsVNrKpenZxB7Bq6pfSTonrMjk+yL+6N1T8cvcfWUD/t0wwgeU3ppsdioqHsWncVWId09sqcLrDfGA1yyk1iZJa8Ls7yzyM9hUIorOywZXPTyIDSjwL0yIYoxS7usVPP79/wAQ3nnSR2wa2h1JgunE0RKwKwdUMSUmu6eSbl61vuK878uVph2G89Og4q0/SJvqddSDZ9TYgpDlDh/jVN5gYCAPdkkx/u8yReZQxv7K5Bb8xg73KosPkdtEVfgilIrxG4UxRDIDGobG4BdsinNWEtOYhIIMN2y8uSYLGOO9qRw8sY5Phfa7adF/G+gcJZkQp9V0roFaeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ0PR11MB5815.namprd11.prod.outlook.com (2603:10b6:a03:426::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.22; Wed, 29 Jan 2025 05:39:30 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.8398.017; Wed, 29 Jan 2025
 05:39:30 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Joshi, Kunal1"
 <kunal1.joshi@intel.com>, "Lattannavar, Sameer"
 <sameer.lattannavar@intel.com>, "Samala, Pranay" <pranay.samala@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce debug
 loglevel dynamically
Thread-Topic: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce
 debug loglevel dynamically
Thread-Index: AQHbYrhQGQYg0n/dG0mLmEH1pnIB4bMtWpew
Date: Wed, 29 Jan 2025 05:39:30 +0000
Message-ID: <DM4PR11MB6312EC7D5F28BF763D54292390EE2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250109170729.47646-1-pranay.samala@intel.com>
In-Reply-To: <20250109170729.47646-1-pranay.samala@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ0PR11MB5815:EE_
x-ms-office365-filtering-correlation-id: 30e81f4a-49df-49b7-a8a5-08dd40274d56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?WqymuCdw4XZGR4MG7Fd9J+3LpjRYSkEFmIeco6lHhitRZ0+w8W76oyemMsHB?=
 =?us-ascii?Q?PnOQJkDR6vG9q3ww9s7/gnGWcsapz8ZxR69xVRah3yvZqRf0jswfsHyLlPvU?=
 =?us-ascii?Q?0ev1sG/g2JrJ5VR24HLEdIw/52bfFfBJfAN6ADVLwF6uB+BR1dAt9QF9FQL0?=
 =?us-ascii?Q?VOgGvqJwuzz2lgBmF3VlSrUFfbG3DNq6l8OfDzGhJjcK/OnagsChLMGVmHB2?=
 =?us-ascii?Q?7oFKKdzOJU4dqB20LwM2MB+xH9LTSnSFfB6PPACnAdlHVPUfpkJ+cIYT1nnN?=
 =?us-ascii?Q?zqmgpDJ2QzBhuSqwEZbU9wOwquc9edPw7tucXZ8heweT0SSQU18QqJKmYDks?=
 =?us-ascii?Q?tKUArLkrxfXjjykKh6+XEKdLWEd75diXmR3cgunFazTFgLWC7xm4CrYudOrK?=
 =?us-ascii?Q?s3CIZF9Pq/8qMbFKPLhf/jVlCSIJmQDOVNZR87VUV0+EnHtrRUaNqoDShdVX?=
 =?us-ascii?Q?UWOyFwSlHRYbLwkrDNb6glUxCBJorE+UaR9Cx69n54+sn1df0o1qjpLHmuAt?=
 =?us-ascii?Q?adcqY1eyfhRl39z/aEuIYrGIUngSVhrzGByZr9b01/aNChhnQbHsVbvd/Rr9?=
 =?us-ascii?Q?4b4hT5INVkldeHFM+WBxSDCW8IZDKK8ErU9wD7BouWm0Bbjkt09q7shr8yRU?=
 =?us-ascii?Q?beg4Z2rc6/km7F6VoZKfIMULxo9alyU4u1cr9vqPnrcqBH2yknCJ1p3LgZA3?=
 =?us-ascii?Q?tZpF4w1hRdQIxJNoJXL/5nhdjknKzoniI6FzaNOJw97BavrodK+Jc9fgfVbm?=
 =?us-ascii?Q?9uJSwyJnUcWNKh0ycs21Xx54txAlNWQ+/pa1OhHGv8dlplrE3WE0kBgL43DC?=
 =?us-ascii?Q?PnvfOmnX7WuV05/+7yD9PjWnMTIYpz1WRYYz1XCukerGsVCkPednebtsfkkH?=
 =?us-ascii?Q?BxkRgsEC8WYC/8XHChdINRhyLaVQ4rVCEGPR8/c9B4YGnYYbwhqkQiyV8Dvw?=
 =?us-ascii?Q?D8UfBSRBKmA2mUdYJCZLKd1qSGHSEBj9ZHdFr/M1S0vQUH+EfpYMWo6/wst9?=
 =?us-ascii?Q?cS+UIzf7Y4FW1O3l82BxZUlWU3exazCn/KQu+B4POW/ebceacXAxZCQ4WkbE?=
 =?us-ascii?Q?yB//wzqBUU/PJHNrjXkvi0NZXZ5yASsOeYQTNjBOCVT0WH9XYj7iVVk+NbEC?=
 =?us-ascii?Q?yQ8VfT3wlH6ieRYvAhSSSRdNW1jmxrrYrhelP5pdmkaShAAxu+xvzckHKqm6?=
 =?us-ascii?Q?bc4tb36zJ0fzAeXUI5gbRHKJ5d1Oy9lf5BJNDfWQIn9w2uaPLFFnR5vOFyfL?=
 =?us-ascii?Q?GuIhfDDlwPKDVVSCLZNFhHiv5KdQj123qCkboeyJRxeKSjeHf/qVe2F7n27h?=
 =?us-ascii?Q?b5OzOZdtoNNuNect6UumR17HFd9bS2nb2jzd4o/b5azy3PunAXup7WX+xySg?=
 =?us-ascii?Q?s5ePLuA85cVTaT4PSHwq37rp17JRa12AOjZFjSyBd3cMwZ4xr6QGZ+k+RoBY?=
 =?us-ascii?Q?/G9F5kdl2G6UrUwuWPqSrI6ibYtIBhEB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P7Tr64sX2UfkHiPg+mh+foOmVCJQ4njiCGtj2hXQB6X4CMjII820K5cgACHL?=
 =?us-ascii?Q?TCQ+muOsW6K0dA+eoUTTSyq02FskaCEPBs6jWi5BL0Yg9qrqQpzSru5Pfy5U?=
 =?us-ascii?Q?47RWFyJ70/WIo6fV7Pp2JEQ//h5mv8Lg7koLx43Yqbm0vTwOeaMj1PqKsgVt?=
 =?us-ascii?Q?Qsx5+vi/SoqUTv5QKKSW3bsa+GUpvA+XZdKp2OY+dS1Ugu+5U2VzVNqmkBZ/?=
 =?us-ascii?Q?v1TYypyLlBk2gfaYALKZyl5/Zao1FeE/NKHHEVO7KDZmWCGI8P9YjWM5j5or?=
 =?us-ascii?Q?XLrgsZztHGeTevHNy1774QdzZz+0cPMpTReIp8ULm0LLk6crT2VZNktohV1j?=
 =?us-ascii?Q?fYk/t6Oshq7t4Mi++dKAgHQ/r/5ELnrzPBt2gOV2Mea035aiV213P5O+fjhM?=
 =?us-ascii?Q?fuah2IV0fK6G1LgMksPktXdyEo5CRaPvbrasAjewvJxuYfLKLUkZRlbLaXZk?=
 =?us-ascii?Q?ZJlNKo+E8jKF4j4ERoZel7W7j7JGR+YrZppnJtZeBBNStbwcV92DK38MnKEX?=
 =?us-ascii?Q?h1ryYzRG21E4xsDnvkFMBHHt9/tYCf6LNkkYOMTbNddIrrK6RRorPSN2QYha?=
 =?us-ascii?Q?Bh5QTeDIckq/XvDy8WdEI0ZM8oL376TK8KCG0mtFPq+csKY5KTgE42AunQkf?=
 =?us-ascii?Q?hKzeIBkmDppFOUYh7LRFiQ4bwK7pqyYcJtWflNM40UcNLcfgxbkx/1WAyFml?=
 =?us-ascii?Q?YZULVOQD+T3ZP87Ty4Uo5BC2lrciUqBA/lbCJPmKtVY7lJd0Ck4FNe2ROw5V?=
 =?us-ascii?Q?+tHnx7ZvCAPZmUKJ5sOE8bCjEeufaAF/qiSFxKey/FpDS3JKArkp3wpbPbvs?=
 =?us-ascii?Q?abXH6eYJL18WaNfgYs06Q997SPSo3gAjfoANANWvG02JxM+hOWH/lxcU/wOb?=
 =?us-ascii?Q?vnQp6prfSU4/C+nkDSi+u6esvbSri/n1ByE1FrzL5jMC8yLYkAdeiFv8F3os?=
 =?us-ascii?Q?uSUWiU0BSsgzQ0pDSh9eUvEThG3YVk6381NI3Xvc5YDCtYhlKCYIz4Wahlzc?=
 =?us-ascii?Q?8GDC4fie7yDk5Cs7VBXvx7XVVJqvM9Ub8qAbl1bZx3rZlmzN7diexUVztrfK?=
 =?us-ascii?Q?TWJKMtqN8sOB942cFeDkvUXwpY1foWa0B7qfWC7qHYZhLFE9dwws9VVwfjrn?=
 =?us-ascii?Q?xpkC9faonhZsS7TknYXk6Bfy6rxLc+6xiHCHuimmmQEETX+2Pr8XNT+FhNMa?=
 =?us-ascii?Q?KYa2oRvoJaykdfNlFO5nhQ82NL+YteZYbgVftn/MdIuAQbNoudeBFIrNpp6g?=
 =?us-ascii?Q?7tlw9dubBH1WUDaaMNka6MBHRVVYuwc7356oaN0bw71pIT3eNEn3Kvvz8iZ7?=
 =?us-ascii?Q?4HYt2klgJdVA76cTgiwCGOd/JZGlYGRkSsKhJtCatt4lSJuZTdTyF3N3e7ZN?=
 =?us-ascii?Q?tH6phNPhOw/EdhUr5WaUnc6LJQAwz/cCTHuA5lURneCB629imfpTxLaSLqCB?=
 =?us-ascii?Q?nvEfyEsQvfPQFaausRpGfoxQHU6eVfwuMg1YRz/O/muZa06RzQpbe18lDjDY?=
 =?us-ascii?Q?MkqQ1Ay3GryKVnXNjCeC+zQ1rPVCUMM+UsN9kbRbI8v9C9QvLW4xfyZAGngm?=
 =?us-ascii?Q?SwxoxdT4PXFUqK32TXE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e81f4a-49df-49b7-a8a5-08dd40274d56
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 05:39:30.1600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lm7+UpDjDjqADIzvqvz1gDI/vjV6JWVocLmDWNdrRUjVRpORA7B019PGjz5nq0g+HUmHbDY7vPWPmeKmXzE5dQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5815
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
> Sent: Thursday, January 9, 2025 10:37 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B S, Karthik <karthik.b.s@intel.com>; Joshi, Kunal1 <kunal1.joshi@int=
el.com>;
> Lattannavar, Sameer <sameer.lattannavar@intel.com>; Samala, Pranay
> <pranay.samala@intel.com>
> Subject: [PATCH i-g-t] tests/intel/kms_dp_linktrain_fallback: Reduce debu=
g
> loglevel dynamically
>=20
> This test is getting incomplete on CI environment because its logging to =
many
> logs.
>=20
> So dynamically reducing the debug log level to 10.
>=20
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c
> b/tests/intel/kms_dp_linktrain_fallback.c
> index a05e2015f..415005774 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -14,7 +14,7 @@
>   */
>=20
>  #include <sys/types.h>
> -
> +#include "igt_sysfs.h"
>  #include "igt.h"
>=20
>  /**
> @@ -391,6 +391,7 @@ igt_main
>  	data_t data =3D {};
>=20
>  	igt_fixture {
> +		int dir, current_log_level;
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL |
>  						     DRIVER_XE);
>  		kmstest_set_vt_graphics_mode();
> @@ -398,6 +399,14 @@ igt_main
>  		igt_display_require_output(&data.display);
>  		for_each_pipe(&data.display, data.pipe)
>  			data.n_pipes++;
> +		dir =3D igt_sysfs_drm_module_params_open();
> +		if (dir >=3D 0) {
> +			current_log_level =3D igt_drm_debug_level_get(dir);
> +			close(dir);
> +
> +			if (current_log_level > 10)
> +				igt_drm_debug_level_update(10);
> +		}
Once we have completed this test we need to restore the log-level else this=
 will affect the rest of the grid.=20
>  	}
>=20
>  	igt_subtest("dp-fallback") {
> --
> 2.34.1

