Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3845EEB593
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 11:15:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F52310EB48;
	Thu, 12 Sep 2024 11:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ahr7NGfa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0848010EB48
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 11:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726139750; x=1757675750;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gytFfkcrKDjeFt1Gvt0fwkqjK6LI+BtT0zKbe0bTv38=;
 b=ahr7NGfayzPcw3GFl/KmP/y/QSg9VA6vWd2mdOcSTq0SBOTlovhfMHuQ
 oRv4YO1oZKT9vkMLmJ58aDgXdhx8kbJL1HuTX6iq48lNSLku6ITMs5cI0
 IqCkr1Atqrfwdoe2hoaZj8tX4gMasrCmQeVdC41BXFpo+/S/qDU+mdDkL
 xrq1o1B9HkruXWaB6o+/rtIF1LEZaBgokm6T7xjGllYIUrL6RBeDuX5AE
 cC0YcDVPYKQnhYHlI+dBvKboRHLOaMD+qJxMAQ5V7A1qfEuxL48+vF/j7
 ft29RchDS5DVfJkER0sbx21A+piC8V/HHpOn4DYbgVG0Xs5JWzesI+w+I w==;
X-CSE-ConnectionGUID: Susk2XNjRxyDZfbp4XwamQ==
X-CSE-MsgGUID: IfCrujS+RIONAHSNOtLzQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="27899508"
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="27899508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 04:15:49 -0700
X-CSE-ConnectionGUID: hdbLJATsTZy7QCX35rXr7A==
X-CSE-MsgGUID: aMNBFgp8QzSrvOVkQJToWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,222,1719903600"; d="scan'208";a="105125912"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 04:15:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 04:15:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 04:15:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 04:15:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 04:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rncqN9ljsrshGn+z2iCCAN2s+TCPGtP1sDy51H83m1dJ66BP3MfhObqCtxN5FhqURutRfxqzkdnC6MzpvsWYT3WbcXu6uZ1U6W0rhbODAWsC+AviDqo7pYDmfc28Te6YYnPMWV8U9psHo2ePnoFsHsZIFDYxZugoH1KDH1lFEkdpWJ88qCz+gd3Xbn8A5HG220yheNEHCXdpNnlJV+wNsu4EnalfD7r9ZDYBKZ+vTP6OWCkYawqDkMs7u1Q0qcv3lRSWvdjzUQhXiBXmi48e4tyakji+3fm8zHuiqN6294ggD7EFM6UWIA5JeyHsFLzsCvIktKTqX7bq0qP78ZwEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBvP7Z3+arRXpLyPkJyELD7nz/omOnBY7M4RmB6CjEI=;
 b=vj7NQ6z86/G/OlKyL/DCWQ47I+eGhjoAtFBt8UODKoh7WnXZ+zih8NbRAD0on4Y4cFes5N+eHDBXz7qSW03ekMFCgmXSMWKsMyV71j+Cq/Xc6vH5iWKLBbVwnP5oCe00FKCWg1TjHuzANC1uL8MOEozoz1jTkCFdQsMWQXXi7vBuciFue0kbXbBQHubIWTEqqMp3jF/YY9EtAxEsE/Q1bRzkVu6T7zqH43O5q57TuC8AqDsPDxZU74r/BfxVllxRCLvPK+FFtxna62IMnrNw2kfo9uxKiRRU9krRyVbBuI1c9i6eo42AVamnabIaHUchNGPFLcIhfjTbNAXZ9Y0CTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 11:15:46 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::9ac2:ad6:3670:2d7b%5]) with mapi id 15.20.7939.017; Thu, 12 Sep 2024
 11:15:46 +0000
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Deak, Imre" <imre.deak@intel.com>
Subject: RE: [PATCH i-g-t 1/6] lib/igt_kms: add DP link management helper
 functions
Thread-Topic: [PATCH i-g-t 1/6] lib/igt_kms: add DP link management helper
 functions
Thread-Index: AQHbBNte6fAeF6zDx0KbEkNoIH4bkbJUAAbA
Date: Thu, 12 Sep 2024 11:15:46 +0000
Message-ID: <CY8PR11MB68892E7AF06B7B11279048A8DA642@CY8PR11MB6889.namprd11.prod.outlook.com>
References: <20240912062839.760661-1-kunal1.joshi@intel.com>
 <20240912062839.760661-2-kunal1.joshi@intel.com>
In-Reply-To: <20240912062839.760661-2-kunal1.joshi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6889:EE_|SA1PR11MB8374:EE_
x-ms-office365-filtering-correlation-id: 4220cf39-925b-4854-ef22-08dcd31c3ffc
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GM69+2r3gipjJUM+oQDp1EpaLmGYXJeb4+zIU2S4MHFrW3v7canP2o0iLRyx?=
 =?us-ascii?Q?mcOr4cXWmJJ7fieUQYzqLkDXkt5mjtMcAJo2dpI/bm3beZ2E+VRdVoXbaz6/?=
 =?us-ascii?Q?rCvfBqZg9l+8F5oxP/hty7rqErJeeirc5oOzhJ+RmecRGWPJdpaGWyN90buQ?=
 =?us-ascii?Q?J3mQshDjeRgPruAhaHPowseNnp7XLijB6BzwU1XZA8pVXgNgpQmwF564fG3h?=
 =?us-ascii?Q?+UqliDzFPgO1UUz4QtVPlaxM9wyEf7gFveSZc35YdvZPeXY1O37pd59e8pYy?=
 =?us-ascii?Q?z8QiVV6ATGQc7pU9wrr3QNZApJE0VN3GUziOLEE96ZbxIl4l+zRnR9BSaWLe?=
 =?us-ascii?Q?auyWI2h4vz/UJ4J5jjzZNaLsj1JOr2YX6Yl4GS12n+9mBRFFZFlDQm6ua3rM?=
 =?us-ascii?Q?heDk+x72isJZerKB7+LMztDqt19qc2LIIN4RA2KUATi23bAPQDWOdZ0YrpwA?=
 =?us-ascii?Q?7JIEnqugY2IondllhhYdOv4stIUBxIekmfL1yqBlEXXgxx5XrJ9lJ6whA9ny?=
 =?us-ascii?Q?ZQChS9OzN+auyuZpW5gZXd6c2JZ9VjpkOdh/PpOhiikU6ZWkBZtC0G14N8RG?=
 =?us-ascii?Q?weKX/JpXgKjxG9+e9O9Ynif57SIZMgw24mqNvHlHM08gNF8YhSEvc9AfwIJJ?=
 =?us-ascii?Q?z3io1iPkK0oq7b2VdfQnP8/eIK9GgMBHBDKqGiUqwT7PfG4EZAlmNYYjlcUx?=
 =?us-ascii?Q?mOOreMKO+kSzQV4DSo6zFfTVEUVM7vm5Kbs3gUpPuFshkOYqBeUXk0iQ+Wfd?=
 =?us-ascii?Q?RHxuQrQNFOzCAwwjoILddI7wY1E3y85hVDKIBYSf88MoUmEuFLUvrRaOHeDT?=
 =?us-ascii?Q?3aK4FYTa2Eax9BExsapAjPvikNb50aEJKafCCjSMCYZIoYy15ZdR3TL6fA2q?=
 =?us-ascii?Q?8322ysrKV7ovrAIooLgZAUFHdQXrL8yIUAbOOCb4SBTjkFgjK0AkG9qfMqaE?=
 =?us-ascii?Q?3VYrZedXaLiZLB25wyFFsqgBiEUOmGR7eAfqTOeqRO5KkaraT9lj/LZFYzjk?=
 =?us-ascii?Q?Kwf39r/B/GUkpJCxwixTIhGWpRA3urSah3/AoXfMXrMVBdqJvG0gzIH4km4i?=
 =?us-ascii?Q?R7By77GGlGJXZRf7/6zwflsBeuB1YADN3ZKzyDCKGe3b6O1CCIXHyYplzuQG?=
 =?us-ascii?Q?kCzAJIWzalXIeBa1g0Z9qy6xNNOE1jzy2VcJA3tbgdWPaD5qQuNgqe+Hdaod?=
 =?us-ascii?Q?bxmEwHBLkM4lhxHwxUd/LCCdGUrJDptVGVF5FrzVL346U6YGQf+3dUi7erVR?=
 =?us-ascii?Q?WfYwbA6UzqcSRTEDhw2/W/1CDv4LL/Ja6xKkAeWXyNLUUBJRkFpqFAousFNA?=
 =?us-ascii?Q?p8YhSAYlcCGe0uRtscubLJM/8/kXAehY32tmxIAm3jyRbgEucXIDsuf7CzNU?=
 =?us-ascii?Q?XekmBAlXhSR4JSEffLsOUFX3hD/R4Itkw7cpV48YIjKUCLtUGQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?f+Qd43cX2TWWyEfMrt1VtoSiUHKsqyt2c0uhIY5pVoPAqaGER+bSMOeydDFd?=
 =?us-ascii?Q?rhredjktfB/eEEtz3hdz2qdLpOzTDJ5+bhBEhwA2AcvGCbBiactXL1n85aO6?=
 =?us-ascii?Q?khIbuUjWIzV/+x6mPMpzE/0etDu25MuI8Xvk+Pyu7YuHP1CCAJ8xGPMDdTWo?=
 =?us-ascii?Q?CStymnJiBEI8+H65KMTtOP4KSAH/mZhkR4pWTORQjlEfThG6+5R5LObfnHLp?=
 =?us-ascii?Q?WxOi1cLj+maeZRvwUgSWka0SH/0ZdSmH6L/wt8k19LA4SAaXYS8IYKLjIwUz?=
 =?us-ascii?Q?2y3lLi2MTIDnqraTraJDML/q6riGQEl02s+1YYaAw86ar+HW/yCANmpHreIE?=
 =?us-ascii?Q?guOE9daZToB6pDpAmcN79rWvP4xNt6+YFYyx5ozoR3hnLisg92GEQrvvMI8c?=
 =?us-ascii?Q?NisFh0XdHR9sR3U7ZSF6GOaWqc3jNdVqVRbl/FqJR9RPHHbYFkf/d4aSudub?=
 =?us-ascii?Q?21+sEwo8Buw5PxgZ/lPQ65pZFNeHN94aMZp//mdA+1ikL2X86HQW+97kfiGx?=
 =?us-ascii?Q?W1yQTIxk2w/046oMoUNH8Im5TdtSmdSpBbmV6rspVc1bU8GU2wIkSMgRURYM?=
 =?us-ascii?Q?UxILVhsRPDDEN8nqHR2wFlM4DW5BXJBKa0qbw1S4NEZHjwUuzsKIYDkObntJ?=
 =?us-ascii?Q?OKdlfI+OdgUsuKizxEGzs9lWqK3rCKYgNQWePzl7VRVvWBUiXLGxNUrG1BwD?=
 =?us-ascii?Q?Gs74dVT7xVAKPZKyN5LiZKg0A7qKUBRXR1UEmCdTgaW9CqeXQckMe3we3Mli?=
 =?us-ascii?Q?+ZzREs4T8JNF8csqi2YHn7xJDfR/XGizGjUQ+8FpxSF8cejrr8RZreu2+J2l?=
 =?us-ascii?Q?Pade2cAJ5KBtNN7joLA0qQUy/aeL6UYIHSEb88VN5z6zqK2BO52gYjTN1nGi?=
 =?us-ascii?Q?a2RQJCX9wIKodw+RSQOerQL+T0Vb5lEZ5EEyu58V95hCdhWY4oS569n7O4EC?=
 =?us-ascii?Q?j9oWYBt37uFZd6IDPJLbx5kWjgvjzGtgY8rTwoMFoFKsZDssQU7F2UxwFbfk?=
 =?us-ascii?Q?LiGjf208ztkGh93L6oVA+DNbbmq1uKP6qrHoiIxP21Cp518bXBB/ZhuJ1Kyr?=
 =?us-ascii?Q?3qshJvX7HPrMjM28brLdJ7YeUmURP2BN8pXQGM9SiKleoqnu1c+vE2ssBmRI?=
 =?us-ascii?Q?PbmIgHDaw/xIapTamVMrbXxqSd3wxS20R4Lyj4VOVfZXTPPJ50QRqE/zWjQ3?=
 =?us-ascii?Q?pKCbc/lJu1+KQhFSqhlBvi5U0M5xkAbwnCxzP+hEMfdBRGUfj/TyD3SotiAV?=
 =?us-ascii?Q?42+x1B+p9ngsl6Gpy6G8kelFHq2EM8GIFyY4VDTs3EWZHPPVUI+xl9N3Unqp?=
 =?us-ascii?Q?mIpRZpoaQcJAv+CDrnSGR7wk4MaZGGICeMU0Ivm+l5gFbF+px0k2C6ORaIkm?=
 =?us-ascii?Q?qALlXaR64ME3phvHSEUnEqNUIpay+t0Az1awM0DLNVVdnOEePqUSR1qogqde?=
 =?us-ascii?Q?xq8Gjcveke5Ipdd0QkkXDESHVPAwu1+hhzuW20v3cE7WuMvlSMS4l1MMWJGR?=
 =?us-ascii?Q?jGzMBEIjXHfJmZqCha1yAuPnHoO1MSbosEU/hIceU8WkTMqpqwRNFGUqT0oe?=
 =?us-ascii?Q?5kKuSQM5ZtV2F9bpjaQOhs4nkD5nfCVXYYG36WhiWS+E1AzBX2P9WCTDfC7d?=
 =?us-ascii?Q?6AveB69SfXFoUfW/Qilozh2+dzATYcXGTAsSRm32Te0M?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4220cf39-925b-4854-ef22-08dcd31c3ffc
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 11:15:46.5671 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zlj2AxnCuVpNtpnE0CondhegdQVQ0csveLUG7IfpBb38j7Me+yHoiac6xPePBqbrRJj5UlJYmaPcOgFmBaB0nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
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

Hello,

> -----Original Message-----
> From: Joshi, Kunal1 <kunal1.joshi@intel.com>
> Sent: Thursday, September 12, 2024 11:59 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Deak, Imre <imre.deak@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [PATCH i-g-t 1/6] lib/igt_kms: add DP link management helper
> functions
>=20
> Added helper functions for below
> - read current/max link_rate/lane_count
> - forcing link retraining
> - forcing link training failures
> - read pending retrain
> - read pending link training failures
> - checking output supports forcing lt failures
> - force link_rate/lane_count
>=20
> v2: combine all link training debugfs in one patch (Imre)
>     remove unwanted valid output check (Imre)
>     return link_rate/lane_count marked with '*' or an error (Imre)
>=20
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  lib/igt_kms.c | 210
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_kms.h |  10 +++
>  2 files changed, 220 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index dd530dbab..f0ac1e5dc 100=
644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -61,6 +61,7 @@
>  #include "sw_sync.h"
>  #ifdef HAVE_CHAMELIUM
>  #include "igt_chamelium.h"
> +#include <ctype.h>

There are some warnings seen in pipeline
Will fix this in next revision.

Thanks and Regards
Kunal Joshi
>  #endif
>=20
>  /**
> @@ -6705,3 +6706,212 @@ int get_num_scalers(igt_display_t *display, enum
> pipe pipe)
>=20
>  	return num_scalers;
>  }
> +
> +/**
> + * igt_get_dp_link_param_set_for_output:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @link_param: 0 for lane count, 1 for link rate
> + *
> + * Returns: link_rate / lane_count if set for output else -1  */ int
> +igt_get_dp_link_param_set_for_output(int drm_fd, igt_output_t *output,
> +int link_param) {
> +	char *star_ptr, *param_ptr;
> +	char buf[512];
> +	int dir, res;
> +	int ret;
> +
> +	ret =3D -1;
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +		     igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, link_param ?
> "i915_dp_force_link_rate" :
> +				      "i915_dp_force_lane_count", buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require(res >=3D 0);
> +
> +	/*
> +	 * Check we have a mode enabled for the output
> +	 * If so we will have current  active link rate
> +	 * marked with a *
> +	 */
> +	star_ptr =3D strstr(buf, "*");
> +
> +	if (star_ptr) {
> +		param_ptr =3D star_ptr - 1;
> +		while (param_ptr > buf && isdigit(*param_ptr))
> +			param_ptr--;
> +
> +		param_ptr++;
> +		igt_assert(sscanf(param_ptr, "%d", &ret) =3D=3D 1);
> +	}
> +	return ret;
> +}
> +
> +/**
> + * igt_get_dp_max_link_param:
> + * @drm_fd: A drm file descriptor
> + * @output: The output to query
> + * @link_param: 0 for lane count, 1 for link rate
> + *
> + * Get the max link_rate / lane_count supported by the sink.
> + *
> + * Returns: max link_rate / lane_count supported by the sink.
> + */
> +int igt_get_dp_max_link_param(int drm_fd, igt_output_t *output, int
> +link_param) {
> +	char buf[512];
> +	int dir, res;
> +	int max_link_param;
> +
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name,
> O_DIRECTORY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +				 igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, link_param ?
> "i915_dp_max_link_rate" :
> +				      "i915_dp_max_lane_count", buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require_f(res >=3D 0, "Couldn't read i915_dp_max_link_rate");
> +
> +	igt_assert(sscanf(buf, "%d", &max_link_param) =3D=3D 1);
> +
> +	return max_link_param;
> +}
> +
> +/**
> + * igt_force_link_retrain:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @retrain_count: number of retraining required
> + *
> + * Force link retrain on the output.
> + */
> +void igt_force_link_retrain(int drm_fd, igt_output_t *output, int
> +retrain_count) {
> +	int dir;
> +	char value[2];
> +
> +	snprintf(value, sizeof(value), "%d", retrain_count);
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +			       igt_output_name(output));
> +	igt_sysfs_write(dir, "i915_dp_force_link_retrain", value, sizeof(value)=
);
> +	close(dir);
> +}
> +
> +/**
> + * igt_force_lt_failure:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + * @failure_count: 1 for same link param and
> + *                2 for reduced link params
> + *
> + * Force link training failure on the output.
> + * @failure_count: 1 for retraining with same link params
> + *				   2 for retraining with reduced link params
> + */
> +void igt_force_lt_failure(int drm_fd, igt_output_t *output, int
> +failure_count) {
> +	int dir;
> +	char value[2];
> +
> +	snprintf(value, sizeof(value), "%d", failure_count);
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +			       igt_output_name(output));
> +	igt_sysfs_write(dir, "i915_dp_force_link_training_failure",
> +			     value, sizeof(value));
> +	close(dir);
> +}
> +
> +/**
> + * igt_get_dp_link_retrain_disabled:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: True if link retrain disabled, false otherwise  */ bool
> +igt_get_dp_link_retrain_disabled(int drm_fd, igt_output_t *output) {
> +	int dir, res;
> +	char buf[512];
> +
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +			       igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir,
> +				      "i915_dp_link_retrain_disabled",
> +				      buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res >=3D 0);
> +	return strstr(buf, "yes");
> +}
> +
> +/**
> + * Checks if the force link training failure debugfs
> + * is available for a specific output.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_force_link_training_failure_debugfs(int drmfd,
> +igt_output_t *output) {
> +	int debugfs_fd, ret;
> +	char buf[512];
> +
> +	igt_assert_f(output->name, "Invalid output\n");
> +	debugfs_fd =3D igt_debugfs_connector_dir(drmfd, output->name,
> O_RDONLY);
> +	if (debugfs_fd < 0)
> +		return false;
> +	ret =3D igt_debugfs_simple_read(debugfs_fd,
> +				      "i915_dp_force_link_training_failure",
> +				      buf, sizeof(buf));
> +	close(debugfs_fd);
> +	return ret >=3D 0;
> +}
> +
> +/**
> + * igt_get_dp_pending_lt_failures:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Number of pending link training failures.
> + */
> +int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output) {
> +	int dir, res, ret;
> +	char buf[512];
> +
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +			       igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir,
> "i915_dp_force_link_training_failure", buf, sizeof(buf));
> +	close(dir);
> +	igt_require(res >=3D 0);
> +	sscanf(buf, "%d", &ret);
> +	return ret;
> +}
> +
> +/**
> + * igt_dp_pending_retrain:
> + * @drm_fd: A drm file descriptor
> + * @output: Target output
> + *
> + * Returns: Number of pending link retrains.
> + */
> +int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output) {
> +	int dir, res, ret;
> +	char buf[512];
> +
> +	dir =3D igt_debugfs_connector_dir(drm_fd, output->name, O_RDONLY);
> +	igt_assert_f(dir >=3D 0, "Failed to open debugfs dir for connector %s\n=
",
> +			       igt_output_name(output));
> +	res =3D igt_debugfs_simple_read(dir, "i915_dp_force_link_retrain", buf,
> sizeof(buf));
> +	close(dir);
> +	igt_require(res >=3D 0);
> +	sscanf(buf, "%d", &ret);
> +	return ret;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 25ba50916..895bc9d04 100=
644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1224,5 +1224,15 @@ bool
> intel_pipe_output_combo_valid(igt_display_t *display);  bool
> igt_check_output_is_dp_mst(igt_output_t *output);  int
> igt_get_dp_mst_connector_id(igt_output_t *output);  int
> get_num_scalers(igt_display_t *display, enum pipe pipe);
> +int igt_get_dp_link_param_set_for_output(int drm_fd, igt_output_t *outpu=
t,
> +					 int link_param);
> +int igt_get_dp_max_link_param(int drm_fd, igt_output_t *output,
> +			      int link_param);
> +void igt_force_link_retrain(int drm_fd, igt_output_t *output, int
> +retrain_count); void igt_force_lt_failure(int drm_fd, igt_output_t
> +*output, int failure_count); bool igt_get_dp_link_retrain_disabled(int
> +drm_fd, igt_output_t *output); bool
> +igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t
> +*output); int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t
> +*output); int igt_get_dp_pending_retrain(int drm_fd, igt_output_t
> +*output);
>=20
>  #endif /* __IGT_KMS_H__ */
> --
> 2.43.0

