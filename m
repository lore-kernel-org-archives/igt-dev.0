Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 932C7CD5BA0
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:30:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC5810E82E;
	Thu,  5 Sep 2024 09:30:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DAGZgouE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25EC10E82C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528616; x=1757064616;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I4E5Q0wkII/O5FEk5QvM8h6VRl35W+wzUVGR4D05wvs=;
 b=DAGZgouElSx9ZRRcs6c8/dy4dUJfPQAiuPRqxNIzTS/5f+22Cls7VFHD
 5hkAitJZHZgFAHYbgyZ41RbG7IakDY8BIPZTnFk3pUZWFJ+4DvK0d69/A
 ykSMFQxWaJuSsDsVD08cPRFznYSJ730tnFf+CRLrtt/ZH04RriZhvWqL+
 fbPf0cPpuzyEALBqUQt8cK/ZAjq426jMFl4mtUMBg59mHQaWd1Q+RslqD
 JCGCgZAlBGRR/TQu3LbPD/3Y3As6ycNDpqN9jgWoeFGyYi6goiypk/MAq
 u5RoJjJvOCSfVP7E7YzidyTshUnz0FtnRJTumFFJCscGvJAxQ25vXCpWv Q==;
X-CSE-ConnectionGUID: JIY5XOvmQW2cLd3K3hnALg==
X-CSE-MsgGUID: WeBdseA2TU+hh+9SwzBFMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24096534"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="24096534"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:30:07 -0700
X-CSE-ConnectionGUID: Ni8VI3+QSc6Y/SEwFhjj2w==
X-CSE-MsgGUID: 8Tx4Lg/5Qse6FX2PZxxGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="66083845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Sep 2024 02:30:07 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 02:30:06 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 02:30:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 02:30:06 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 02:30:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C8J9mYu7BWAtCC4k+NYtL08CtO52lLEhQ4VQa352piv0oF9s7shmbUwRvPnR83Ru7icvClqLj2CoCBN5PzGwq3fGYmvASfZAnsdZEz6/aJskaW00I/oHEoJuKC/fgMjl9NJfgSBrkta93y68SUP8OqAuxmfD9A4c0tknPWZpBO0n0WQrlhWYqhNxRElBSYKtO3QpecjHH+14SfzGL4PA7rlDJHnoozq71sPlH4Xv1zNO76LfCrkRMfkBAEm5xmkOvpAEpM12rS9YU/r64x0TNNG5+wMBuOVkQmQAXLov2vUy6PQJHk14Gpw0zIvS7Qy8PbRubkCr2P2+N0dEwmCylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bfULni5B+QXRpqaVedtBQWwrL6iWuXNwr/LYz6al7Dc=;
 b=xN0NLrBYiPFy5l6hV4rdgeGZl30DUAbiA6cHjOtdxuL1CQG3x1fI87cBmBmM5BtGcIEk7t+7nJCQ09dP4T007fp0VDegb9DzzECPj+LVFySVH5X2oyacEAnkbjvZrb6CPZnVk2XgHqoEmrWIKc1VxMDymw+/0/LtMu99pBYGDA+8L3Rr8CCRNJb2VRlacKYJ3+ZlikIgQqP3ZtMXjplE/p+X9OsCmtsPCW4ReNdjAcyTjGF13A/lNhmMSQodRrRqzx5Kz2/gkrYMYEgcadJayOSF+v5gW/Eqdr1sxJfp3PwRedGi9JUTc0mKSXTm1835pjwodZq2klVbjRycxrWIbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SA2PR11MB4794.namprd11.prod.outlook.com (2603:10b6:806:f9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 5 Sep
 2024 09:29:59 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.7918.024; Thu, 5 Sep 2024
 09:29:59 +0000
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
Subject: RE: [PATCH i-g-t] tests/km_pm_brightness: check for flickers while
 adjusting the brightness
Thread-Topic: [PATCH i-g-t] tests/km_pm_brightness: check for flickers while
 adjusting the brightness
Thread-Index: AQHa0rezj+Bbvv+YK0+e/9qmYiWl17JJRLwg
Date: Thu, 5 Sep 2024 09:29:59 +0000
Message-ID: <PH0PR11MB48065E3AB551170F193A9F2DE49D2@PH0PR11MB4806.namprd11.prod.outlook.com>
References: <20240627030211.164110-1-santhosh.reddy.guddati@intel.com>
 <20240710105422.211273-1-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20240710105422.211273-1-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4806:EE_|SA2PR11MB4794:EE_
x-ms-office365-filtering-correlation-id: 11659b01-347f-4c20-1ff6-08dccd8d4fc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?1QbJ4wMJ2JhpwHF2AVcOZPzTMUcPIOEHAa3erKmxpaQTzRmTSDOC6VCIpyMl?=
 =?us-ascii?Q?YfLxMzhebXyQivu8f0xRimtxLmkw1cm5iW5UUrs3R/jSvq59RgAVBwWD75Pr?=
 =?us-ascii?Q?rwj9lOuRjZzO0JOm9y81JEyiCoMMJ5GXjTd3SvDFelM7RDmdc7m/d28aWJGl?=
 =?us-ascii?Q?mq9m4ZUMmBspiXjWTz5L2KIIpjJ9V+mtvadRh+8Ra6o4UNPfmp/kzyVQkAIW?=
 =?us-ascii?Q?dZ0hnXxfD31XB9xjEdWQUxMqyPxY6hB7QCL+Db6a/O6BWSkTzPR3pkXNS9EU?=
 =?us-ascii?Q?QJlMNceUx3v47h8vClxpLXibo75oaYGBbcm0HqqkpMMzpHEwjXPHSTxYHbhr?=
 =?us-ascii?Q?OezhCVwjQviHI3rOp5h+8qMHQxbbpTSEgduZSR+qfVYvV6HV4K5f2sto5wyD?=
 =?us-ascii?Q?LCNuZjKDYhtbxzIZChAnsj8ihhEdb5bCJ34j1I2G5ATU83Rydhn/F71DdaH9?=
 =?us-ascii?Q?d5iXuaAmKA0r0D17qdvW3dKEjT1qT7rDVLgHYEuVbdgXAZ1Ev4P7FJqEs2VX?=
 =?us-ascii?Q?0uktd2YrvYqvPVQuZ0AUWLfMlSi7KNeahc2e2F0CKpGwtAGok43q9VvmHnYE?=
 =?us-ascii?Q?OMq5GPBU1hEGY43LkpBx4g7FyLznrTKer27N+N/fDA7qcLqarG4FIe+a5g7A?=
 =?us-ascii?Q?g9gcsZdf9DSYJJw/uv6Nox5aUaBpIgs56rBswdC3WaA2RUEXPBd3280gzX3j?=
 =?us-ascii?Q?U0OCHZntklSr3uQpT2R/slqt1Hj9XrF+lz3UlTC/utL2oLe/IoGFad3p0Jqf?=
 =?us-ascii?Q?UUtENeIsVphFK4JdVtaBX/jmz2VwgO+nB7dQ3t5lKcpUqfj1Qw6l33BA282z?=
 =?us-ascii?Q?gXULyhgZN48CVhfN2GAQke1l9+zbKUiof8Oo6+DFN8dK9HZ66G6CKyJcTE8a?=
 =?us-ascii?Q?EV5b/4SoylCj79gdkdA7hMXeFbCJDZxv2NwRihZsCk/spwd4vRSwLTFJJJIB?=
 =?us-ascii?Q?yHqkF6TvHyOacQaKpMwTCzo6gll2Qy4kHrDwErigOR1C89xBqDoKWtSe8YfJ?=
 =?us-ascii?Q?0w63Fcix85nbkxi91SxP+pQp/sPb21GMcaSabhdnlidQjoAvGhn3JUTfZT0C?=
 =?us-ascii?Q?R0XXNK1cQo2JEDh0m2aApwBsjzh9blYNjKC2j8j9rVVN4l4Hrh7ivuA4wO3D?=
 =?us-ascii?Q?qzT4cTfn2c5f5SMYS3qo8U/PpPLCNQ2fwXbIdgI4BKe7Trc093Dcsec+eyLF?=
 =?us-ascii?Q?mwDCQpMgTNHTArAQxxRzl0LQ2/pskloMPYm4epHZuAs0utf4PRxLbf/XLpVb?=
 =?us-ascii?Q?G+CYHxmDMNTzP/UmGsr2lKcWLaNrf14wvqX4MBKw3BJFvbWezkUS914YeRvk?=
 =?us-ascii?Q?uYa4xCLD0s3odmhxCDU94xRT8EtdtvjMISvx2mC6zmzzuXhqd01Iq6Yb3Gcz?=
 =?us-ascii?Q?AqOrS5+lDF8f68vcunKhy4d75J8ZrnWiCkxyHaTwho5WzZu2Mg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rPf2mnvU0P2Eukic+7dMdv9+uEqnD17pkRaxeWOguOgFXMsTnSGbn9o3qGay?=
 =?us-ascii?Q?Hlbt0QUbaUUOM5Asa01R06ZQY5uZ7rTJ3shSYt+GqAwoT7oIOQe22khPEWEx?=
 =?us-ascii?Q?flJNss69dpBblXXiwrwCFAcWs9DYZPekyu93cy5rfgABUCoNCacekDs8fAAr?=
 =?us-ascii?Q?6m+SmsAL3+2jDCgqQpmcGHOhvx6doy7xwXEYsSJ/TR7Exmxzk6Aw1LbJy4wS?=
 =?us-ascii?Q?c/cIBaloMTWs/jAS4Jct4vHUavwwHuAWN0AE+/YNBYgBNHl30OvjgjVXF48f?=
 =?us-ascii?Q?LO7vPXYJKZQ6rVhfFwXTAGOUGJXTtbiFpdYKPUHTPbPCh6xT4bLiJiB/Z91q?=
 =?us-ascii?Q?9ndjOEvLADIXX6K1bQS6Hp5fXy2Jww5tHKwbnFcGQq8UEx7VkvPqCJVeg9Pq?=
 =?us-ascii?Q?IJhX15ufp2QIP3AUE+cFLd8YtbZzdhzmojxBNAXadRhbwCgQVi8ihlZGM4rO?=
 =?us-ascii?Q?4YLqt5bTisF0RkxtgCH8v8lImlOIUd1FSVpky/x+PDjfcfXHyE8GG4TBFUHV?=
 =?us-ascii?Q?IoZ/4QGzJyYZK+++Nqy3OO64T97SIWuBTKUdDXkuVqRz1Fw8OBtqLa4kgtjs?=
 =?us-ascii?Q?IJ05c/2VjUAxC6IGAwmJCeVglRYNHiB4qcAzyoQvETrQHYcOmAT8ZuS16DM3?=
 =?us-ascii?Q?Fk08CujEuEbbkIblZvZ+7OTG9b+/AX19+SYzRa3VhlPB6idoDEXkr36NZP+B?=
 =?us-ascii?Q?imMu3ChkxgLcfshRF3/U46XvckWeGlILGI9gctWPJFP794CYemwCRFDkGy/i?=
 =?us-ascii?Q?/sUfg+bfJPL0ZaS9v1EsRWqb6GmldL9C+AOlDf18Sm8joHUfGcdBc9EmbIQI?=
 =?us-ascii?Q?Wq9u6jJ8HAlgsu3+rZ0fzVK687PrPyru+/zdXSPiNql6ifzRvDn5GInvYrf0?=
 =?us-ascii?Q?Ot/snHga2SYcg7wSfS2eGN2/3mu2A6vcUd9AdIDemW7jPQqdNwfxV7W8YO91?=
 =?us-ascii?Q?8iSfbPzj5CwQhw0Ts2zaVFrb1e7tMLEsE6gMfAh/XSoNz4F9ELnmbSSWXNJl?=
 =?us-ascii?Q?hJxh4rRUW9WLOrr3sAxi8Iq0v7cChC3vo8E0mdKHCQsmh+0n5fyCfUCeMxqg?=
 =?us-ascii?Q?faeoOGR5uR9KHe6Uw7Yw6qNlfYXHtz0droUgHv4ikESnmuGtTfCuJKkEozEN?=
 =?us-ascii?Q?LASGRseEhHWQHup51ud8LtI+/aLcNfDs3TY0eokjKt+9qPRcJGYexD/+g9kt?=
 =?us-ascii?Q?AjwXcjfRDfLCZm3dT88sW0exexQRk6gQvUkZNIyrmGRWrVFkp7UuCeh9qLmZ?=
 =?us-ascii?Q?HJLr6Wh22KxBGFFapZdfsGrepXQ7Oo0yX+c58hLv8hAoXAeW4t249W2rn+Gv?=
 =?us-ascii?Q?EPh3iZXaY7nOd1gmM7WRl3Txqhl+PnQ8N1+clnkpAr1VZeDK+IQmeZ8jrvTb?=
 =?us-ascii?Q?+jYhkjllb+DZHBrY9v6EcpLtvLUJYKSrOL+O6pMEOyO4OXpVo9aEICO4WaPQ?=
 =?us-ascii?Q?HutFNqUjZ2ni/02JGymEEnpG3IW/1clM24BjJs8iH/ADPBWB9aujcSvEuKc6?=
 =?us-ascii?Q?qsWcuKn21E6KHSZqAbpm6p/DMbeQvl9e1bs96GdesKKq+9OHuKNZRYErvvU6?=
 =?us-ascii?Q?5IsxIVQzdsl8+rqyIkz8drNA6rmdKRV0UKtD7pOmBAqLCD2pWG3zqAIDm+uU?=
 =?us-ascii?Q?3A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11659b01-347f-4c20-1ff6-08dccd8d4fc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2024 09:29:59.1609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qLQzF7SFk5oJAezUcigxgWV9qKwcQVG+CsM2ZBc1DVSAzHU1T6YP0REo1Cy/0qCAg54WHaLraCRCqPVgwyIngwlIUvVlhaPWo3epP73vsDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4794
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Santhosh=
 Reddy Guddati
Sent: Wednesday, July 10, 2024 4:24 PM
To: igt-dev@lists.freedesktop.org
Cc: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t] tests/km_pm_brightness: check for flickers while adj=
usting the brightness
-->Correct the test path name and=20
-->Subject name also like "Check for flickers while change the brightness"

The test is added to check for flickers on the panel while changing brightn=
ess.

If there is any flicker observed on the panel while changing the brightness=
 then crc will change.This patch set is trying to address the flickers obse=
rved using crc when brightness is being changed.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel/kms_pm_backlight.c | 43 ++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.=
c index 8672afa7a..a7e8431e5 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -64,6 +64,10 @@
  * SUBTEST: fade-with-suspend
  * Description: Test the fade with suspend.
  * Functionality: backlight, suspend
+ *
+ * SUBTEST: brightness-crc-change
-->imo, it should  "brightness-with-crc"
+ * Description: Test the brightness change with CRC.
+ * Functionality: backlight, CRC
  */
=20
 struct context {
@@ -255,6 +259,43 @@ static void test_setup(igt_display_t display, igt_outp=
ut_t *output)
 	}
 }
=20
+static void test_brightness_crc(struct context *context) {
+	int min =3D 0;
+	int max =3D context->max;
+	int step =3D (max - min) / 10;
+	int brightness;
+	igt_crc_t out_crc_before, out_crc_after;
+	igt_display_t *display =3D context->output->display;
+	char *crc_str;
+	igt_pipe_crc_t *ref_crc;
+	bool crc_ok;
+
+	// Get the CRC before changing brightness
	-->imo, we are reading crc object here, please check it..
+	ref_crc =3D igt_pipe_crc_new(display->drm_fd, context->output->config.pip=
e, IGT_PIPE_CRC_SOURCE_AUTO);
+	igt_assert(ref_crc);
+
+	for (brightness =3D min; brightness <=3D max; brightness +=3D step) {
+		igt_info("Brightness: %d\n", brightness);
+		-->remove above line it will print brightness values while test exec..
+		igt_pipe_crc_collect_crc(ref_crc, &out_crc_before);
+		crc_str =3D igt_crc_to_string(&out_crc_before);
+		igt_debug("CRC before write: %s\n", crc_str);
+
+		igt_assert_eq(backlight_write(brightness, "brightness", context), 0);
+		igt_debug("Brightness after write: %d\n", brightness);
+
+		igt_pipe_crc_collect_crc(ref_crc, &out_crc_after);
+		crc_str =3D igt_crc_to_string(&out_crc_after);
+		igt_debug("CRC after write: %s\n", crc_str);
+
+		// Compare the CRC values
+		crc_ok =3D igt_check_crc_equal(&out_crc_before, &out_crc_after);
+		igt_debug("brightness: %d flicker: %s\n", brightness, crc_ok ? "none" : =
"detected");
+		igt_assert_f(crc_ok, "Flicker observed for brightness %d\n", brightness)=
;
+	}
+}
+
 igt_main
 {
 	int fd;
@@ -275,6 +316,7 @@ igt_main
 		{ "fade", "test basic fade.", test_fade, TEST_NONE },
 		{ "fade-with-dpms", "test the fade with DPMS.", test_fade, TEST_DPMS },
 		{ "fade-with-suspend", "test the fade with suspend.", test_fade, TEST_SU=
SPEND },
+		{ "brightness-crc-change", "test the brightness change with CRC.",=20
+test_brightness_crc, TEST_NONE },
 	};
=20
 	igt_fixture {
@@ -288,6 +330,7 @@ igt_main
 		 */
 		kmstest_set_vt_graphics_mode();
 		igt_display_require(&display, drm_open_driver(DRIVER_INTEL | DRIVER_XE))=
;
+		igt_require_pipe_crc(display.drm_fd);
=20
 		for_each_connected_output(&display, output) {
 			if (output->config.connector->connector_type !=3D DRM_MODE_CONNECTOR_eD=
P)
--
2.34.1

