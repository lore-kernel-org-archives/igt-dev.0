Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF699ECE582
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 09:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBBF10E754;
	Tue, 10 Sep 2024 09:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DpsL8Gda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AD310E754
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725962265; x=1757498265;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ujGSOPgYraKDX5o5oONPWaE0A5cAoLfbSvWWdjfN5Us=;
 b=DpsL8Gda5Yn+mlbihQO+bXwSN3QJcyiLs5x0MNioj8NJwrFXObLRLq3o
 3668wZO4TUOBejSrQwNl+voifSX5f1DcZD3IJGZvVNor27UbytaYlKm09
 UA/lkzX6O02NJM0RaXoakjc41qgES/E170OyXhBwtA7+WEeiXMpItOsE3
 dczbM2GW2kDEaNb9fRoatxaK9t1E5+SrOnZzhumyQ0kQBA2TtRgU6Oede
 gDVDvM/xRTKpVbXf6/6IM8cZdjLW7sTBZ4EPtszL4Nyenh0jIi3il8n6O
 s5+RblkXEZSgZTqUkYvtNIK9D2HC8IA0nmEIk7TgqvQ3mHyTU0kIe0o8c w==;
X-CSE-ConnectionGUID: UofnmVT5RvyilfoSvd+i2A==
X-CSE-MsgGUID: T3fawNGOSuuXWL+74pd+hA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24848992"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24848992"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 02:57:45 -0700
X-CSE-ConnectionGUID: 6iF0vXFTTRaEFBWQhKkOTQ==
X-CSE-MsgGUID: sxUUZL/vTmmi/jHeCeCbQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="104444710"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 02:57:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 02:57:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 02:57:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 02:57:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 02:57:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v0yTN/YEqtGjVEy7vNQmIhYhvLduaR1HyXVIsY+U7AN0HpaBFA2ztyfrNqkPrKTn8z4YialeYQDFTedBEVPvwh1pDjs2rejcmsr057IIqLqsEYl3rjOWP3S1SVe5WXVJFrwNMd+RtrasnLdlxR+RPbrSVdZTeAVq9Jl1xGZz9GYY5bpM7RPllXc70eHkPufKj03UTojaytCBmJJrabqqEimrzIw4JTDGh8j+o1X+Xdse7f9Jf9DhMA//RUKgdRQ7SGz/vWdM6B80EFXtTsApj1zrULU9rxn8nal1SYWbFU2AvYoEp6cKtKajLcVlbNbCOI7s6cSQ9qQZPXNsAlxhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQANN9Txmipb+hP1FRuODr9gn/NC0Cav4lt+htsTrsE=;
 b=Oid4dqAL/a5lsD7AmzDgip2a/Mb6FEZrpoM/pqNT9WBvioFo7PcJGatrDvRCg302TRjnfVsxuAH/5ze+zH3PpGLEGFv8VNckPf6wlRLP187xsWSe4P3zBDlI5Z9Iru5OlswqA+cZ+V06Z3/DzFLYIM46/OgR9FraVLB3bPJ6Cdnunnwy1DCffL1mHBf3k0kUbltfyhuN/aSdzj44i3337ndPBe0T0ljeeAlDB0TXNoUjVjhl02gDR8rCHS/eBrFXz0fe/eZJt1QfPFiu5jCEP7INKpHG/ZJ04UCXlphCKMqUjfgLLSIK+rfj/Wi9+5hol9//zllVx8K3h7iTSpB9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Tue, 10 Sep
 2024 09:57:36 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%3]) with mapi id 15.20.7939.017; Tue, 10 Sep 2024
 09:57:30 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t 1/3] test/kms_content_protection: Fix variable
 declaration
Thread-Topic: [PATCH i-g-t 1/3] test/kms_content_protection: Fix variable
 declaration
Thread-Index: AQHbA2aIY0/H0QyRpUWRInqyRnKivLJQyLfQ
Date: Tue, 10 Sep 2024 09:57:30 +0000
Message-ID: <DM4PR11MB6312B7DB373C8E5AF63B41F4909A2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240910094529.545064-1-suraj.kandpal@intel.com>
 <20240910094529.545064-2-suraj.kandpal@intel.com>
In-Reply-To: <20240910094529.545064-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|SJ2PR11MB8371:EE_
x-ms-office365-filtering-correlation-id: ec989224-5c5b-4bb9-e4ac-08dcd17efc34
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?52PXNkL7Ja90HysfvhUVMQhX5K72T6jlsGfFkdQUr4C8s5oNl0dV+HkNFbMB?=
 =?us-ascii?Q?C9WB8lKDE/QSi5xWlmQ4AXlcEm80xBcnmDkFt7oH1KYhTrMDIBROBzzHhNAe?=
 =?us-ascii?Q?HzHYVHKRmc6T95RmlNhf8zfJQFfL7OCRTEkPwMhZnWB98o0mX8cU0pffzvL4?=
 =?us-ascii?Q?/bzkZcNQ0r4TsYQO+O/YaVrcQw1FupS9CJKvMq/3DddEKsDgeX8YcVaB/zNh?=
 =?us-ascii?Q?B3w3KfATtOHnebjXAOQ1r7M+hH1HItl0yJS2keDtBPf/ZDxxZpXY3HfNo+Eu?=
 =?us-ascii?Q?SN2i5Oq0vfp39Oga4sqjta6dDa+C0rReMM97qu8TXr5/hLL9bBKlu2gxAfCn?=
 =?us-ascii?Q?jE/v8hroKPeizbjGO93rQeK7cnfPNqSIVI6LTBVdFnvyCUWx3dJmRoyWfyVq?=
 =?us-ascii?Q?RHrlgqAEAB/dbBhGayjSeKCE6UjqsVGzj+4/CB/wMz3wQlX3FVMvNtGI97Zy?=
 =?us-ascii?Q?HuqdEoaq6EsowGbyEX4cZNFVRKHFIE/mXr7My4qizcxU8SO/eZD9YhNyBly8?=
 =?us-ascii?Q?2uEKxKIjiuAs4rl/zX12pX621/2UfvNUYG77lRUZErJiMlOqZyg7iydxfYFU?=
 =?us-ascii?Q?qTEqcwAP1hTyEC2iSvMMp4tkw3/4E+ny/3hM5HB2m8u5VCCqcdd7P2wZ+/H1?=
 =?us-ascii?Q?n+W/nDSCzJ841NHIorzUWSSJZ1T7I/ceDeO41SEBqtPX1u2fLJYLpQEL3S4E?=
 =?us-ascii?Q?kUc1pHcIw17NP1uNLe9AnE+pUXyZ1AIwh5eY1iAJYtHfOh91oUgSGMAcOGW1?=
 =?us-ascii?Q?sI6qNG11X+vN3T9C9Su0aSop1yYVEvnNytvHcGyWX/gKwbsWebEJULzNVAgD?=
 =?us-ascii?Q?t57WouugQdUVtMDocNBFZyeVCn40M1VWVAszdpijXJiPCis7gPHmP3Y38Q3m?=
 =?us-ascii?Q?EoPFDji2a+jY+EBaFQJlDuURRfWr1Lyf6Z7pKu+EtfVkJyYhyUY9kjfOs3xT?=
 =?us-ascii?Q?71u8LROrYLbQc0RPKMkfWh2ivYz3OhJfebOuanzbtZI8XhMypU4guRj4kEsQ?=
 =?us-ascii?Q?2L6g57Zm18nbo3ectmQxxbdvCNUdLu0XKMXQzHSXqlQ/DekLjNV4hFnVaSWB?=
 =?us-ascii?Q?HGeiNmepHIKMsjPfb9Uwj/zSTMc/rooxs5KIV7ys3sUL5XsDy5VNYeBuREp3?=
 =?us-ascii?Q?V7k6QOgyqUTpb6P38oDMTitkV5zv1n5PwZUoW0Z8Ti2bc8fuc4fMXhbB4KYn?=
 =?us-ascii?Q?D27pbTzRN7puvpCVH1ck3lLnwnoa28zBswQviPLxeEGaiFDJwMXDB9VpZEHD?=
 =?us-ascii?Q?ZbI18RgupRKY3jUYpFq6DgyO8BnxayH6LjNfdoJurV5aejUAYiOWHQvjg8Wk?=
 =?us-ascii?Q?q6sqGnp98qBuud8W/LWX5AZpYZqQPGp9sDiy7+JQVKH9+qwOtwJ/9USTq08i?=
 =?us-ascii?Q?MFM0HeHUmP/kfteMtzL2EP6IKeQAFM/Gyuih9h9nTzJ7QfzqXw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/TkCzTqZkt8ISM96fiDyJOrDMoYSnDwaIqFNUCiQ1vqoc/r9iws7h4DK/xpZ?=
 =?us-ascii?Q?Q+0hVRjEUDR12pdLS917kMHmcC2XC945h7eKErrxSrXR3NkALPLHfN04JZR1?=
 =?us-ascii?Q?3oe99jRleFOqttwbPx6LPeXdBKKPwNupgKuWyhDE0m9RNVVqA7l85FfNiejH?=
 =?us-ascii?Q?uQOZ4f1mVazMEfoV2m0kz8zYLMZl6U26wxDS+RrwutfPzaZ70BxArMMBsXO2?=
 =?us-ascii?Q?cdlXim4aNkWD+XqdS78FOXW6eSmnEWNZtlWy/cTkBaq4gq7UXlHFN75TrwE1?=
 =?us-ascii?Q?7AaYwfsR16nMzjbNK9pEeNvfY4Aohevubs33ORV8kPPzxi+g7EJRqi9sTKSC?=
 =?us-ascii?Q?sh8uxI/cwFuHppIYe93fscaIHowtrYeKPjBKzbaxsCRZQHbrJNgKngEgzl9V?=
 =?us-ascii?Q?9TJhObkWfHAg4l5YV4/6nVX7+pR5FvVSpZOY7yieUBTeCaOZvKYNSizySxaA?=
 =?us-ascii?Q?E1z6EmXohLRlTn7gEcVVCNlQMfRLeKkCaaWFU0H07hJQDkSvm4DZZKzk1xEb?=
 =?us-ascii?Q?dsvWPM9ctByyYJEHcCZxflHNC5/q4vEIF0ykc9MNlBpEKh98DCwQM6Cr77qo?=
 =?us-ascii?Q?UT6JVNv9cIp87Y5DYcBhiqTDZaGIO64ru66dkqqAQ4zXaonbGUA0rCQSaSJR?=
 =?us-ascii?Q?IHg7UqrZ3Z+9wVKXT/F7zWLWl1CP7rkbvH3TqNH92qZuOONp10scI2tNAJzx?=
 =?us-ascii?Q?cyu/5pqEgwkyIjkrHMh3Z8EMxKz8KMLNRVnSEGc7MnW0N9jEiAOAEljGicMJ?=
 =?us-ascii?Q?cMt1dCYdUsu2TxlVf44Q32Xk+9vA7AYfuMKM70rYwOk5h+4skgxe9YKJqGgZ?=
 =?us-ascii?Q?PoyFdD5NgAlCXShTYdFUADZezm1IpbR8ddd7lRy9iW735cO7un3N5vsqqgsx?=
 =?us-ascii?Q?/VdCDDA11QI2PgM7xsDhPAn1unTyZNjjiW0Q0QB8ctJsfve49faSsv5tG1UY?=
 =?us-ascii?Q?+c0F9dZ8+CuUtlEFloy/O93IPFrs/vpf1ougI08lKDyr4RC4QO9+oLjLJkvn?=
 =?us-ascii?Q?0eNwOGHu3dcpiKU1pyXRT8S9gJtQ355FlfFmBVJIvRmLOyqej4/gjRJ5748C?=
 =?us-ascii?Q?1DMgoF/3NyfO74RRqlwVHdvU/acx7YOvJpFmB9jNBDVCxMBDaNdtKRPmszIu?=
 =?us-ascii?Q?V7tUyYqUcD4B7txsqxsL01NTQ4jMn09YMHZ2KAFiwF6zX7plZ9reFx8+NTUJ?=
 =?us-ascii?Q?tvrERCxycXzAEnOgBUVW6vi87PXLfDy3pRYGwmfrw/A2Z+nDQjvTQ2cx+alD?=
 =?us-ascii?Q?e5XRKJ+0XE34B1iPcDujeyZHDBr0WWV6quTBKWkO6Zi6F0j6f4c5FW+hbQCJ?=
 =?us-ascii?Q?FPlXrg95BUWyiTT8YF+5Moe6VrZfalUCcepvbDW5ddpvp/KO9OArSP9SYTzN?=
 =?us-ascii?Q?Qa8rrhQhTBv+BIuEYTvbcsJRi3iEidtt6cZ4ad/Im5DAl8GF8tx+EBN+qZHd?=
 =?us-ascii?Q?ao/9Lgc6f4Z/v1lVG+62eg8RBphTbpVu/FIp/3yPs186ccc7LoivRDAuI9PO?=
 =?us-ascii?Q?EBq71gF7tsZmLfs+9B9cgOEy1tjiPSUs6dNrKIzbj10QoI+Q80yuyytYgj/6?=
 =?us-ascii?Q?3JiD8DeNrDS8lk9E2ac=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec989224-5c5b-4bb9-e4ac-08dcd17efc34
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2024 09:57:30.7046 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhKmwSHMpTLnkKgBuBhukGrDbhi94ANIFzRnAVp+PPIW8vw56zGoXvMnxN/diwrPNowGQnWnmd4jHGnNSeMnFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
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

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Tuesday, September 10, 2024 3:15 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; B S, Karthik
> <karthik.b.s@intel.com>; B, Jeevan <jeevan.b@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>
> Subject: [PATCH i-g-t 1/3] test/kms_content_protection: Fix variable
> declaration
>=20
> Fix first output_variable declaration to int as it accepts only a int arg=
ument
> and not a bool.
>=20
> Fixes: a6c718174 ("tests/kms_content_protection: Add MST subtests")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  tests/kms_content_protection.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_content_protection.c
> b/tests/kms_content_protection.c index 2d9f3eebe..cad8811ea 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -646,7 +646,7 @@ static bool output_is_dp_mst(igt_output_t *output,
> int i)
>  	return true;
>  }
>=20
> -static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int
> valid_outputs, bool first_output)
> +static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int
> +valid_outputs, int first_output)
>  {
>  	int ret, count;
>  	uint64_t val;
> --
> 2.43.2

