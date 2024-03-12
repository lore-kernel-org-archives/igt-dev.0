Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5ECC54E66
	for <igt-dev@archiver.kernel.org>; Tue, 12 Mar 2024 07:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAAA10F0AE;
	Tue, 12 Mar 2024 07:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dzsaiwS9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A5410F063
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2024 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710230345; x=1741766345;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ICLG+wNckEtRjIE3yaHNXDf8MZsSLdg0w/bBuMq2uQU=;
 b=dzsaiwS9pVz7Qv2fXt3hShnb2emln2OOmIdoMe796yTtFd0mnoWceBVE
 Qm6Lo8PixRXB5vjX0xACJ98n9B3FMEy3DqDs2BTmm6XYfjNqoVC8W1ED0
 9lBptk5WvMt3XAUGAjcDnszCEtu3NaXGsGN/aMMY1mFhrARS8sImVoYBI
 pxqM7GTP9rlSsM5/SNg0Q1a4m1Cx2Z8c2OgR6zLpRqGzQ6tnIYG0V7sST
 jV3pbZ07qEiA0lC6y49UAWENM8y0UGgwxCP0zoeTlnLXZdHD0kX0htTtv
 AXGkxInJeRfjjRyNgaZTAqPexdIPccEdGxUHB8hhmPaKSFA4rSvQXElO+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="22381533"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="22381533"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2024 00:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; d="scan'208";a="11526487"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2024 00:59:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Mar 2024 00:59:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Mar 2024 00:59:03 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Mar 2024 00:59:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nK+1iAXVbKQvQI/5bRcXGv+PBZTyew0ujqn50UGW2n4DF2D5fVUQzYL1dJFEdu+WCB0cu0gPr3IklpJjKwWSmEuycoTnJ+j2FC2esLdNKEdbSI/FGYp1DmRskXrAGhUqKqxkJM3dDIMEvzjFKok7fqLlTdGZ36aDkr19aSz9IJzLzpQ+H0kNeY8OL2NMqUh+ZCZqQTr3PkXCsjevYtd3IgxRRvkVlVV/XVRGdJZtASr1jMyVtgmb49MAqgb0RHIaWvEypkcVNtqS8h6eQs9AFky98UbvQi0+DOah3xSlB/qyq7l134Oo0nxSDNvfa9OG0r+ooamCuqSYAKnMA5CSfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGWbcWN63vMk36NVthyTgvrdy6HnZeT+zZO3PCPQ8w0=;
 b=hlzBjRIAsBfFlHaOpHBtWBM/gzPw7B3/JBodz1gkiMeFNceXDTxuA7JWRN+lfjJ28bdv5NpLazAGfex16ZKFTI4QaI8tfrpH19BRHe8oBbpt1M7wueZmcmTITvuxVk8TAMjY8CnIeYD0fj9aDMlyZbZtVTDjzGHC4AdoqkgLtM00+fYGXO86NPiNCuM7POwNwonkBmFaRXQ7rENLHdWdtByWa54yxADzAPoYDWgTOOf5jnIJXcmyw1ZGWqzy8byTozMV4aMXQLiKveJ/WiXLi5j1pQkjmFyyYAT46DIDW8G/mLpI+SlqDJtnNIYEaSKgsDBiJg+0kSMSfjIy9CAE3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Tue, 12 Mar
 2024 07:58:53 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::2d99:e524:71bf:8b67%5]) with mapi id 15.20.7386.015; Tue, 12 Mar 2024
 07:58:53 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Mauro Carvalho
 Chehab" <mauro.chehab@linux.intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH i-g-t v2 25/25] tests: Update device_reset functionality
Thread-Topic: [PATCH i-g-t v2 25/25] tests: Update device_reset functionality
Thread-Index: AQHacTRmIsrNW0ZhKUeHyjsvd+q98rEzw7fA
Date: Tue, 12 Mar 2024 07:58:52 +0000
Message-ID: <CH3PR11MB843486AC5E7B94DE669837148D2B2@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20240308083657.1092049-1-katarzyna.piecielska@intel.com>
 <20240308083657.1092049-26-katarzyna.piecielska@intel.com>
In-Reply-To: <20240308083657.1092049-26-katarzyna.piecielska@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SA3PR11MB7554:EE_
x-ms-office365-filtering-correlation-id: b3ca65d6-df59-4433-95b7-08dc426a428c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yMaaWJNqDYV4+sQhotm6wTcfg52qTTsJsqUjIl0d9x0SJN2cDswTNgWu254xQUNNp8t9S+1ZGtdo7G3CEQWiSO1ryC0DPSKrKKPsoCUEaefWzdhVGoB/BDreRsnb54ZsdlcDjMK2f7Wq35daDfih68LAzXHY/7puNy9eh4YZXMoQmFbTNJ0Xy3cW5/OU/WhL/DHG2xlitmljBjNi0IgX+tadubaOhSqoE3mRFLeyMoURMaKAASW8pN00Xp3nN8jvWp8cJ2x2IU458fcEY3buuQCny+9mt/nCU+dJZB8XYAKYFM/dzBdURhlGPQqxYh5dc/VT+6Mb107N1XSD6foPG+5b1FS4ALCXiB2eCQ0o5Ct0bYhOPYfLdYTCamcrPVx9OBS0UTQEvQWMVOo3PZJNwinnxwok8uGrSzGvpXfSCthVFDXj8oCptbxWvPVRvn5+DLKwrZu5q1iAgroSI+MCh3Ao2KdvlrWa3qucVodM6z4E+z63XWpeue2AVjjKfx5QvLIf09XtcF+zOeK5/g+xUcbkZUpl9AAOfpGuEnX1x0MJsC8QRCituHNQUUB6A5xOdaN6EB4TI8DIS+LJ4iadIe7qAUVmrML6ZbIDV2vsSBgqAumZbKtuWuk+AVtf4vzH2bL91PzxFoJDojZCE8epZ3sMjs+QFZbiS+IqME325aU9HhW0K+mlXVmuSgvcjLb2WiT+GIejviYslDObVyJucQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tkteJVaPMko+BrM6phRb+Ko4/16sne7fK8YLExBR25Y+hCxGVRXJQVzhOdjE?=
 =?us-ascii?Q?I8wYxKsAQtqi2l5ZJ3jiJL79RRX/PtXXxqvBcCDFf3YzD+JVpiv7EcFS4SYu?=
 =?us-ascii?Q?Fw84G/ob1B11+IPYQ7BBFSSGGg5TWvwwIAblt+LCxTb+oB+O1Xtt6JdPGzMN?=
 =?us-ascii?Q?T3B+G5IF5a8cD2j9Z0uyGTEqgXocDz/kw/SpxcLrU7hsW5MCfs7eE5IclhYV?=
 =?us-ascii?Q?gHmbi8opBzY3seF/8lm+NGVB+5K8NAz8uwGS7IqPd4Lpo8m8y/CVvshIoPng?=
 =?us-ascii?Q?e/IsZF0xO6W4FnT9thXoRdZLALnbsT5/7p0acccsOjOzMHSIJppTxo9b4cgs?=
 =?us-ascii?Q?6jXEwBwKumral65rtRw3ltv3PwglRW44YjCFdZlXULjD1bfaDHKSlnN8aQ7l?=
 =?us-ascii?Q?8gjTtTtTOfJC7VuWFVZtUHkAziMc9qC5/t736g94QWlzVZaeOsfulMcverab?=
 =?us-ascii?Q?oYIcglQIV6HAkX71M+o3ejxGRvExjZ2tPHGIlG0UmqK6x/qJCh7lGql4YC7B?=
 =?us-ascii?Q?qGCsbySiOlzUSTyV3bIbnZkPoFZPL79kHR/NFLmmH6uENZmM4i7pm87O1rfW?=
 =?us-ascii?Q?sgVlOdTu3wyLq9LRtj3xcdNUYa3CPwHEMUJRwmCy2HY37po8v93QHrglTZl0?=
 =?us-ascii?Q?vOLb9fklwZBWxzCIH+R5hRHgpXJWJT6kV9FyaBHj14WA56HdRjjHOd8RRrTS?=
 =?us-ascii?Q?Spno5MxNzw9YJd9srtEDKXEXCGFxTZSluTShyJoHgCd+e5pDNc0e/j9O9Jte?=
 =?us-ascii?Q?8Xrd+UyqviLAjkx5rhrdmsnCGdzHELpMITsbyQnQMMtvDl0FbT+dKUleTBO7?=
 =?us-ascii?Q?uMK1LUBA8w9Z0tvNWj1ZyGTlZ4ZL957zjEjSFM3N+ohjrQ6GyGMp6NXgRYkz?=
 =?us-ascii?Q?O2li2lHrtMbLuhjQn++CFSv9MEGv8a3HBH6oHe4Lsx8nuoFmr1pDCh7xA/Pt?=
 =?us-ascii?Q?HjG4K/hRvOPNNANd+bbVnCURm7/ME9r2KChr/G32i9/jwpHq6/y8NiJ6H5GD?=
 =?us-ascii?Q?MNTs708X4ROPPmFwUZs7Msp2pWM4HzJ4TSnUUc4GQuuZT02NlnfdrukrQh/N?=
 =?us-ascii?Q?pR8P0zvOQUo8Hs9Set4iUhZOtpyiTpdWZbKZhka8FLQlhR+723chzQeaCt6M?=
 =?us-ascii?Q?1HWAzt1iw5BUmbrnWVHfy0xg1ivpQWzbjxjKryQ+Lo/1tpcCm0KUnN3G5Sy3?=
 =?us-ascii?Q?jSUs3x0m/vLBB0ssMnArZQcys/MEEYQaBdbrqhmpFH/9GC/vfzbKbCsUqEe2?=
 =?us-ascii?Q?7U4HzByizS4uaXpgIIJcVmx+MZ5QyWiNHqU3vADOMmixWuVCQQLH5538ey97?=
 =?us-ascii?Q?uX4a0LNcmgAQryQmQMYk1sw3SGJyT2H0xRuLuS8EIXxGwM0g01VpR+o82Mtu?=
 =?us-ascii?Q?vCYGBuW/R2U4ShDvp/SjFyyjb6pM8SikB1XlZpjgIR+D/bUX/LatAK0useuv?=
 =?us-ascii?Q?GCO0HiVCauiSLqyIirba00iXsLpncRqOlArA/ykfnE4a6uXM0CLfTrf/l+LR?=
 =?us-ascii?Q?UOky+0JdYl2yfHJ/vtXvtoBae/KOOmHY0RlbVHhoHrOJzty1lsWUl4Twa5Ei?=
 =?us-ascii?Q?v0dfv9SHr3iryULkuD29IMKztEz8C8fsiuTDB+i6mOFWM6zsRLIUbR0kzSmL?=
 =?us-ascii?Q?KA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ca65d6-df59-4433-95b7-08dc426a428c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2024 07:58:53.0027 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 21vWuqXlM0NuQOEIyjbvRMIpSJuL6dWX1xtdoGhT8MBMXAQAy4ujZ7z4lTCXW3yzhMrJLxi4Gn3DtKxwjxh4HinH3sUyUK+CQVr9w+dzFv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7554
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Katarzyna Piecielska
> Sent: Friday, March 8, 2024 2:07 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Piecielska, Katarzyna <katarzyna.piecielska@intel.com>; Mauro Carvalh=
o
> Chehab <mauro.chehab@linux.intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>
> Subject: [PATCH i-g-t v2 25/25] tests: Update device_reset functionality
>=20
> There is a need to keep Sub-category and Functionality different, so
> automation tools can work properly.
>=20
> Signed-off-by: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/device_reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tests/device_reset.c b/tests/device_reset.c index
> 018c8a9ac..d7163b277 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -20,7 +20,7 @@
>   * Description: Examine behavior of a driver on device sysfs reset
>   * Category: Server
>   * Feature: reset
> - * Functionality: reset
> + * Functionality: sysfs reset
>   * Sub-category: Reset
>   * Test category: GEM_Legacy
>   *
> --
> 2.34.1
LGTM
Acked-by: Priyanka Dandamudi <Priyanka.dandamudi@intel.com>

