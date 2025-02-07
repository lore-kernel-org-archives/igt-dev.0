Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704F3C02192
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 03:31:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D9010EA10;
	Fri,  7 Feb 2025 03:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h8bVTq3s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39C110EA10
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 03:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738899112; x=1770435112;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=efKTukiOTSPmwOVmtvjIM2HiUsjWRe8T9iVdpIjWat4=;
 b=h8bVTq3snhOdmfdgHGdYUl2IOtDJWjOmfUlPFQW/4rzHhNgTdnqTf5XG
 zupxuNPnxoPtcxh1qdw9fQXBMTT3e/VYUPR2g/mqNcZ5lsbHP2brxCW8f
 onK/WGT5D4rbKJ9wJw3D7/2C1Fjlw/PJ0H848s+my4zk3BzuHDIANN5Jm
 AiuES7kWjztWjenht90J/LTS3ZhUx41e5AnKOZMKC1L6jzDOsf01ZPFJ6
 9ZbV6czNWPoYIIR3OqpqZYdlcUD1Mb/wWU3moyt4oPH/VLy3OfxUfFQm1
 u6Lq1oY5fl0YJeIixaeLQjXZ7Pn0q/vC6ZuEK1ZyvkieNzqg9VxSeYOm3 Q==;
X-CSE-ConnectionGUID: tMOidKJ2ToSv+BdpGopoMA==
X-CSE-MsgGUID: VmyVlXSFQ12YGsK26VO6HA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42368114"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; d="scan'208";a="42368114"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 19:31:52 -0800
X-CSE-ConnectionGUID: fs+W9F8VSrOmQeDEptAs7Q==
X-CSE-MsgGUID: jAGYxgq7TYO4bLQ+msL2QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115501178"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2025 19:31:53 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 19:31:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 19:31:51 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 19:31:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWTgAdEc51SNh5SaYfzEV+/MaC0jEzlFTRdDKGZ6g8kOKxCtWWziCxxZpFIIuLD2VaTuyYEkpAR94VllYYeyQIzWeZXL9JsnlTc0PqdMCwQ0AAyryHgiBTKdrbl6NvYcIq5goQOu8/aW5ytM1bWqn468dt2f1UV53HrAQzp3szaxkPY/v4YZtYmp54C1253RM0IDCwGMiEoFzYir/UflywcCXFyyiPwDJaxgjwvc07kDxT1cfwq65DfTjQPbyv2OJs0SijDCKYBG3Qa6iMo0r9elWi2MZssfa1g0mD8iCulFalySmCYsizA2tkqwxWEdN15BHdAqZmgreYxylUlIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LyQRQvDtlnSESiKNJTO3tK9veELeyLzv+x+vET2Dbe8=;
 b=t4OZwpC0nhlBAAXOR40jTk5Nd3BNlEK3a9SvGhM26BIxFIO6kGK6RYOVZE9+iT0SOABVEebs5sjQAt/THq82uN8MAAOejU6R+qVlqAX1cxLuGoe8bvnVEhZimvZ9dj4yeOwzgbH1x1dUuZxGvo/svRwVxK5txMf7JxRPKesY726MzPeafAAMUnov0fWjq825NWnAFVAFPKqXmDoBbwMq1IaLyUMEzfXaOzCdXVj3FRtRHzdqXEnJ5bsX47dKfiEbX4HEa/ddGQMuP8zGfY/3wlvjxeYkV8KFJzYIzd5RtniXAS517ci9RqCgd5ZXDP4TwdQ+YQA+a13XkxFyL26CLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by CH3PR11MB8414.namprd11.prod.outlook.com (2603:10b6:610:17e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 03:31:48 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::4a36:b210:9d85:d13b%6]) with mapi id 15.20.8422.011; Fri, 7 Feb 2025
 03:31:48 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "B, Jeevan" <jeevan.b@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_display_modes: Add logs to skips
Thread-Topic: [PATCH i-g-t] tests/kms_display_modes: Add logs to skips
Thread-Index: AQHbeKkHy6wfqpg53Ee3QjAHVx6cC7M7L1+g
Date: Fri, 7 Feb 2025 03:31:48 +0000
Message-ID: <PH7PR11MB6053A6B0A03F9889F453BEDBE7F12@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20250206152348.972063-1-jeevan.b@intel.com>
In-Reply-To: <20250206152348.972063-1-jeevan.b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|CH3PR11MB8414:EE_
x-ms-office365-filtering-correlation-id: 4b9ccb2c-d09c-4f87-d517-08dd4727f448
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?q98YYpx1Duy+uWKbYaIhRbSCfomDEx/MbWihoTHMUOO9iL1XEzBly2pY2Of9?=
 =?us-ascii?Q?DmTBEZaD/znnpHD8wmmdLAqUQIFxFeDAYHT6K+sHbZy932a7NLAonduJTGcc?=
 =?us-ascii?Q?OOhJuH1ztWG45ZVNRW1GKho2rwAsZhIj5zuTKuxDsWgIkm/aGIc0klX5P/3m?=
 =?us-ascii?Q?/SHhHIn6Cj0VCd7xxpW0kWPHLCzO5uiStLV7i/kXAvGZyaeFJV5v7SDzC/GM?=
 =?us-ascii?Q?+h1itWIByBXdxlGWVjm5kQNZy8m2U2pSHlCZz0XkJMeBlRDuByhtF1CPq6cH?=
 =?us-ascii?Q?66IqqAk+qjzqJcI62s665C/Zm4XjeZi/p6cPUaHYfieecDZcqZu8T856ff00?=
 =?us-ascii?Q?ejy3HZzD2A8LnxX+W8hyj11HPAvtiGJuyrC/KoyRcQsu9+yCtwSTGFaVqp68?=
 =?us-ascii?Q?KUByMQZQ4/+ghAOEP1F6hTi+ZgGgaOttiOLAU0KozaILoJVdbu4INELCI12q?=
 =?us-ascii?Q?kQQPNGNnWKmAMYZLKeEMl0DXFgT6ukuxZr3250ETYjKrGax/TxtgjmzILmdw?=
 =?us-ascii?Q?jsWBuuNoiufGvKWJU9TiZTOwpTcRaBOXcT7CrW8pY558ClVkbnV22CV52X7b?=
 =?us-ascii?Q?OYzchNHEYv03whb4r1DjApIMYXzmfKX+f7emNdovuqh/Cifa6/x7ErkDsuTl?=
 =?us-ascii?Q?S3QnBwTyuTh5+yI3CQXE7k4SC1NDgb010hgnroZpVlu/dp/X9/rnUFdPzFk3?=
 =?us-ascii?Q?RvJw/3LSJv80pFrJzOCvL+40DV3sVF5dSQWkYbsb1X2yPY1bKYFDcyoMV4/A?=
 =?us-ascii?Q?JvhlJJ7kDN+odHDb5Jltm++ZvPRgMgpBR0V0UXA8vWlJFxr3ETexwmA/6weo?=
 =?us-ascii?Q?JaSyYUkyhFWwLbAh8AHsB20Qumtl7gk8pCmtYEVoOJCgh0APQ2Ep6bgFbzLv?=
 =?us-ascii?Q?ST8xWb/7CBtmrsPxyNnvvNLkzDpfsJOKARy2qWLQSJVo3+4ZXUpvGaZIR75H?=
 =?us-ascii?Q?2U37A968vMMzHAJwA/1UM/dK1+AP116995BlFOtVwXRsMXeZnVFOR/mi9lY9?=
 =?us-ascii?Q?QrLppy1/cuwtVhIvBkci1NyVYI2/77cWowZoRlNUOF8kUGLz+cWHoyXJG90u?=
 =?us-ascii?Q?eaZDQRV3PR6ki+PH/Ht3x8jF+e9n05ZJn66SdqXnRq9CcPcjo24De0CBLPM8?=
 =?us-ascii?Q?zAbnTxOtUNUIqKxfyWetqT5GH2ciB+qLG7bCfFDtEHT6lH8eHK7Zg+crNu+8?=
 =?us-ascii?Q?8YoDm6T35HVOUvBmeCPrM3FQR3zA8+1iNkj17B8OEeUjUr79mo5SrAJIVyMo?=
 =?us-ascii?Q?WKENZdaTuQ2tIU46SbPS1gvaKBDKy8hUtjCWWojsLt11rscQyRFihVe0lDbi?=
 =?us-ascii?Q?i0Ia5e8lFylqJhZ5BBPDmTyQNqAX2C5/QUKXGI6PwhTekovLdyS5QDK2y3Py?=
 =?us-ascii?Q?Us3HK7d7130YQLofMl9F4MRY6/g1xZUN7h4gFdbpySTt92SaEVlmTJfK/iAV?=
 =?us-ascii?Q?B8TCotHApzc1Wz+dCTxgIyw1C56GQCvv?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pJltk3+WTHO7Rs6ayQ4TYu8RJMci+6j4dquPsPFE1R6pR5nrqbVfoHQFO4eK?=
 =?us-ascii?Q?cWaByxXSlRYr80QLTGXkvbD9uB32y44YNHmFaGChu6nskUibB4U63wQw6Wxl?=
 =?us-ascii?Q?PF7ezhNCvuxGp+08QH6MlDqhvF4HpbYSDRzFxHiHg5D2hLXT9CFwOyHSoRhg?=
 =?us-ascii?Q?2S5G7d5vhvTv/Yw6QYgaV07wRt0LsENQzVKqg3jJxnENlf5h5RqcO5V9nzIr?=
 =?us-ascii?Q?iI/UHNLVaReRtGE35YMeAxvIpy9Y2nbYiTdBOgs4IxlI/1VdrlJnGQgP++8r?=
 =?us-ascii?Q?ZPRR9AT5hcoedl+uZjr5sNk7dF4omhgN7lqXwfiaTVlLeaxK4gQjFSXVVPh9?=
 =?us-ascii?Q?XjLepEGYmFjocOwcwkmd0BRrvD9FAJdeIgQVwSHruo/fpY/WpiQ8rx78GT0m?=
 =?us-ascii?Q?hQwJM7tCiHT8UKIUqlDrYFPTfrRCgvxYha8nToOp5gEP3TFevTsmWndxzqM5?=
 =?us-ascii?Q?GdQ5EHT9Vjyfn8qlpEfXy0TJqVkKEpC8QzKTD7MBRDpm1jbPl0vM8JHk5CN0?=
 =?us-ascii?Q?h8hJkiFRPPbOQ97ESuQULuLG3ps6+3F+Odxy3eVhlpBxLCi11yTZfDfElRCa?=
 =?us-ascii?Q?2slfhQecDfto1DgWtRk/M8WM4eEf+Jj0/nmhZtBZOJmOhq5fOsk/nskzOGfq?=
 =?us-ascii?Q?3nLMZ+Ul/6qWJ0AOCSRs6tEAa2szpVgdrSEFhb9YsbeBUKrWROJnzmZSgl6r?=
 =?us-ascii?Q?IA8dfZTw6mcaSRJf0I2qab1ugL/2jDJ2xaig0MULedp5wMeLgHrGsXnCAOk6?=
 =?us-ascii?Q?SiM9Di8JXJ5VknhBZMa8drizYgdxmDY4ier9CZh/+qDUY8difX27+J07VvkF?=
 =?us-ascii?Q?0Dw6OqBXQmN7biVrDsxTp+HaWXKwoo/k2w5gbdu9JEh5ByaHKfjSZY4PT2xJ?=
 =?us-ascii?Q?WCQxZ1co+yr29xWaLT4GhM0/iEl/A6ruxpbV4Q9L3cqaT5V26L0tbnU71gGF?=
 =?us-ascii?Q?EcBDAeopToSGi8gmM2DwH6LZt8LKz2zq5KT2wCN475KfwVn+f6e/fyiYT/0Z?=
 =?us-ascii?Q?5v8PxlY5VW62gNarUh1omipd5WjGvwPT4FjYoWw+Dj1pD7/ksrSN4pn70CxB?=
 =?us-ascii?Q?ur+kbyoVWZb913kE01zEMwXd9dMZMSAfWzqfGYGZTbLT/JnrlcfO5JomUAEp?=
 =?us-ascii?Q?Y0Mef0+D1XdavncJLfh0S77mUC2+sl8UTxr0vZEbn75Xm6M2fGtWRX3JcNLQ?=
 =?us-ascii?Q?gF6nhc88EGN93469gIxrEOim8BoEJJ8gvPkp6hvaPK2S2F0lPjK35ucvPIMJ?=
 =?us-ascii?Q?xA+vTAukoEnk4muxZ5dPxinTpI3/za9s72T1g7jZdD2/KeuX6x8YpzVXeMWf?=
 =?us-ascii?Q?e5DZ1Wh/UmS2RFTB7WaGjxQ8j10giOckxpHs841fVIQeubAgf5IjcR6pHgJy?=
 =?us-ascii?Q?SZqAiwr6BLss9/Msd1FoDdeYehIpXnvKFNga9o243xHvJOpy8vwdiWcSJ47a?=
 =?us-ascii?Q?M5MFP7AMfNtT5678ErSpoPtghhOrC3o6IViybtMM97VNj+rqUV57QGaYdlGG?=
 =?us-ascii?Q?XzLzIZ/hBaRXwyfccAtE/dMakEXk2MECTN1Lk8ZJKEO5tpxye+7tuLUn4Or1?=
 =?us-ascii?Q?ymXirHj29SzHOKJWJjSWOUovFw5AfrbTemyPGWHH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b9ccb2c-d09c-4f87-d517-08dd4727f448
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 03:31:48.3597 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VWWOWCJxemikkHZaWyDhjS7985q8mCUhC7COAa7RjhyNqv3PLDtZBXKSHOr6qSrGa56eQkAkpCMOtP37aKewDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8414
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

Hi Jeevan,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Jeevan=
 B
> Sent: Thursday, February 6, 2025 8:54 PM
> To: igt-dev@lists.freedesktop.org
> Cc: B, Jeevan <jeevan.b@intel.com>
> Subject: [PATCH i-g-t] tests/kms_display_modes: Add logs to skips
>=20
> Add igt_require check to ensure that test criteria are met before executi=
on. If the
> required is not met, skip the test with log.

This commit message looks like the definition of the igt_require check.
Please define why you are using it here.

Regards,
Pranay.
>=20
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  tests/kms_display_modes.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c index
> e41c60cc0..117f82325 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -335,8 +335,10 @@ igt_main
>  	}
>=20
>  	igt_describe("Test for validating display extended mode with a pair of
> connected displays");
> -	igt_subtest_with_dynamic("extended-mode-basic")
> +	igt_subtest_with_dynamic("extended-mode-basic") {
> +		igt_require_f(count > 1, "Minimum 2 outputs are required\n");
>  		run_extendedmode_test(&data);
> +	}
>=20
>  	igt_describe("Negative test for validating display extended mode with a
> pair of connected "
>  		     "2k-4k or 4k-4k displays");
> --
> 2.25.1

