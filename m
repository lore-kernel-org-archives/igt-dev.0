Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD607C4345F
	for <igt-dev@archiver.kernel.org>; Wed, 24 Apr 2024 20:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D63E11222B;
	Wed, 24 Apr 2024 20:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkVfmbNp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1878B113D8A
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2024 20:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713989977; x=1745525977;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Yry0BaSPhqMr61OuyPGOBEUz9JYeMPExYTkx3rpkr6w=;
 b=VkVfmbNpWGZtkNIWStZJgfMkGe/K+RrBJe9WvFjA0yFWCIgRc5wUawTs
 iObxDe7szQAl+WJ1gOAmAKvQgN6syBBIB7BYy2JLeJK83TkDcCdrtpVgb
 dsS7uPHiJmH2j1Uv4YeeZg03iE4gzlbcUXad5mfNnG5It5UolT8k47chL
 0yflEFFIDadj0vb1Jjp/LYr/pmKNtmHeA0z9mm6Fx3qIkQZUnbFdgF2mN
 0CWmLakwL2DiamoaUvGaaNYwRo5esTxRPREiwRlMg9RQaU+yK+IbDPVz5
 A86pbyvH/Btr2c6+A5ALY8pAA1ZAEXFmW1oSj4Ix5MtRdaAb0Byk/XnlZ A==;
X-CSE-ConnectionGUID: ZtYFlI+STJSTfesXkq4+1g==
X-CSE-MsgGUID: LWERo2w+Q9i/wsTiINzyQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="21069017"
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="21069017"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Apr 2024 13:19:37 -0700
X-CSE-ConnectionGUID: Kfyr9quhTdqfXd00UZjQoA==
X-CSE-MsgGUID: p67xE6StTGqbvRfhKoAbwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,227,1708416000"; d="scan'208";a="24899753"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Apr 2024 13:19:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 13:19:36 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 13:19:35 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 13:19:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Apr 2024 13:19:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LTU2+wwJKswSJojQ2enKRmbRtW/u9pazmJB2cGG41hSsKbqL/cXd7l6FfT2/fMLQ0uAO1+s381K5Hz91h536IT0HGeP67QfhShWJV4qdIur0ekQ/Q4Uac8v8eSGckhwFb4vVdeRadB1F7v+tnHmsQrN3NyR1hEto/koYCvYt2tUgQKjrVHvo+kyPZCpQl0/61Bij+cDsz30Pv3od8mq2uHVHZi8MLH0F0FElgLYl+3+1jjIS+W3z3iMTE2g72TPWWcEROwh9ttWPCv+j2Ohmj12cLrnU5EJEzccWLp9SSnfxkpothBLSRqCLnj4seTteBmYYw4rXEq1afWl0sdu1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdpwuJoH8ImoUI1sFdHJcNbZBFIRIW20bukG7KGXmrI=;
 b=iL8zM3GMG1uMSb3ZXOan7S8g20IF5UEk37mKIIR8jt2A8jj8dWExuoLxNKXhnQMNsyLxDM6PedxWQkpZbXvdK8Et1rrXb+P538ynaShJywUe7GNHASZSG7DtIDpKz2Jhsq2xH9Jpt/Mrt/YJzNVyJ8W4HjOi6KXiZ4lwGEcTTmCuJR+Y4248ZLDcIzH3xJnfyd5k5tOU+aly+dnljwXTFZ6s70zObyXle5+oatdIucWAIFLG9LNbkLhl7nyV+di+dallBSnNzbeqfhAVlJJQiJIXQOdhmpbmU9r4qXuPOYE11AZqi5pHBXMGIJwnNfsPLFy6u5Eu5zxwv/dAl9Ihmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.24; Wed, 24 Apr
 2024 20:19:33 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::82d7:c202:f53d:4dc%7]) with mapi id 15.20.7519.023; Wed, 24 Apr 2024
 20:19:33 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Subject: RE: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Extend gt test to check
 mocs entry
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Extend gt test to
 check mocs entry
Thread-Index: AQHae6IC/WPYov/u5kyaH/0J/2n9qbFERbAAgDPKF/A=
Date: Wed, 24 Apr 2024 20:19:33 +0000
Message-ID: <MW3PR11MB4748C2AB1AD436E4A7FBDC68AE102@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240321151637.3320911-1-janga.rahul.kumar@intel.com>
 <20240321151637.3320911-2-janga.rahul.kumar@intel.com>
 <20240322211826.GU718896@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20240322211826.GU718896@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: matthew.d.roper@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SA1PR11MB5897:EE_
x-ms-office365-filtering-correlation-id: ee90035a-7e36-4647-ab8f-08dc649bdb07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Wb9n/qM88OH+a0Iq+4S5CF+rczqOoNEM3372S9tmgyU6wfUqmCB1/ZA/pHpF?=
 =?us-ascii?Q?hX3ywzGMc/qnEf1Hizzc7ZfTm+oLzpVf2cDu+ScoTxr1CggcR3Cb6iRJ17Y8?=
 =?us-ascii?Q?tnOuT2Y4m9HyIGY65DziMK2WQ5D3ijMNaHa65V2gmq46bAUP+JE/YlvMIbv5?=
 =?us-ascii?Q?JpayjkkkOgJGY4Y7kn/CahYRt7UUTwmX4OHVo6JjlbG3+gwd+U98+MhrZKOI?=
 =?us-ascii?Q?w0xrL6kz29LN7s1DWwY5yOjgBT/Hx7KFk3KWlO6Iq6g8wun/noWBP32h9+NA?=
 =?us-ascii?Q?Ze2eZjkTve4ahzak+hMXVUonM/FddCPIpJ8Cxeh00g9prn9Ko0CHeaAvMCLg?=
 =?us-ascii?Q?irMSC0pmcvu3I8fQi6Bd5cF1asTyWty00Kzjsu1XQCqVLTTAngaIs6K+s4p1?=
 =?us-ascii?Q?X6H7oAdBhynpE+NSbH8J2cZ6p5igyc8oU3MlVtrOi0kO1ZVS5ekDQibJrWJV?=
 =?us-ascii?Q?NC30RQYlAWR4ZbQRSIGlfivGYgQtcIGk1XlOCvp+pF8VYN6JX231RHZlH4DD?=
 =?us-ascii?Q?iFGtX5VeHAxEHngLh5hlCfBZgxHsdUOBnipAc4owpo40N/VCx3jWfb/z3XOS?=
 =?us-ascii?Q?GVvm3u4vWrURnl9XI8J3gMnfbghEVwBD9hXrfew8UrFZFN+xq0X4djkRj9Ah?=
 =?us-ascii?Q?laXRTuKRNrLRqraBaeezQeo+QGVO3LbzSbX1F6XaBC+fxodkLB6bIBuz+kBq?=
 =?us-ascii?Q?iIuZVOv4j9LZsUUAyPvx3fwt9UVuU+TTChtBVZJVt6P2P+kWfWj8elpOQzpb?=
 =?us-ascii?Q?br+TcVfMvEbmBioxYdugXdkUBCUPQmoZ0tNQSc+LyZVjuEk4XYBt9Ct73riW?=
 =?us-ascii?Q?Y37g1zKGI+kT4eneBToDl27NFY54gNYFREcatEju37xfSkOgq15dMfS8gAs2?=
 =?us-ascii?Q?4kdrnEz8kxO0rIE3+VAM4Ks4hASj86AE2HoSDcfd/TV0Y4CSgNObfwqnvB46?=
 =?us-ascii?Q?z1l+3pVA7CQSK6ZspunNfqb7GvVdWZgNmCaoTTw+aWUfrqpO7tR2e7JiVWnt?=
 =?us-ascii?Q?vzRoFMK92SQoX0KxoPb45dJBiKrahcCgxw8Pe5EOh4uIc5LuWHu2x4rQ/lQu?=
 =?us-ascii?Q?IXdw+O2bDiSKDkMnAG75wX8AKhUbEhVgPsEqFe1jZv7fQyEjmOggZaYnKn7B?=
 =?us-ascii?Q?e80237KN7f6J4pr9qr2/J5Co5wLDrEuEWPSSQGsJKl1zywewE0KVb4e+5ykU?=
 =?us-ascii?Q?GTlN7ZENWZT+dSc4YdRGaU2j1iLUDnDeGx3WhVd/Sq3Qg3oWt8y5OkrcpyJY?=
 =?us-ascii?Q?JLZNtHvxMz40+cPM7BjCXJPshPMNQLHPfFBrI2YVmEWF615mgt8RDKxlFAUe?=
 =?us-ascii?Q?8LCMldXGaI6uQ5UpU6+eXpL9/Jkeo1MIf7wi3jqx2Oo9AQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?zt046WF3A39EAuCVFxhUUSEiAGTDFP0lIMXoEMbPntM/uLrOcpL2pk0vvbGz?=
 =?us-ascii?Q?P9HI7CIJ9YLRRWeCrg4ZA6k8/IJXj9v8ujc1wGWygjYdOZe6itR0KRxfN0LR?=
 =?us-ascii?Q?7Wec8EO7BGZxSrHAq7QB8DZXx/fsTREMA3FYb+73dFwpshFH0mEdB/b1gOo9?=
 =?us-ascii?Q?5doSnJbeYf/HsxbLxh2WBCbYBoW5QDDvYJ9XEiwIfNji9+u2YbEj8T2mgQED?=
 =?us-ascii?Q?u0eVNCjE2c2TsBiTZf8w6EkjjYAG5jZU7gdGkbwGPzgLX/5V91rRqsnbi0P+?=
 =?us-ascii?Q?D87Sv6qyIdLGIQJyf8DvggRigf+ioYnpWJJANbDB1pWcyRuuIO3jY0cUnGn0?=
 =?us-ascii?Q?lzDVjUtzGUW44pDXA3yWchKI3s/F5zgSOFT+JjzyJ0vKMWDfrpoW3/+3WK7x?=
 =?us-ascii?Q?DCVS5POEGsQVaTXGjpnNZ+fZsT5pahaQr10fTK+0Z0sth3ZJGw4G3M3ns0d4?=
 =?us-ascii?Q?tI97yZlHghw0NqbwUb0MN9Y98dcf+j07ZqzJ+4JLApV76TAzKtmNBG2HJmlO?=
 =?us-ascii?Q?I4JwsSxKc6wglljkAzmA6jy3jSzrOuVN6grAxYcGYcVrORaMTqWtQowOGCet?=
 =?us-ascii?Q?dTooIq4kuDXjk70SxsRfA5ve+aP46QtYu5i3i2zCtfkjFkm52HmY+/ELi83X?=
 =?us-ascii?Q?A6iHLLYNl1CC5nxSFpegxYDTXB5yApSeuBnO6ZDta16xcZh6QzElkulxOtJy?=
 =?us-ascii?Q?Jvtovmm1pW1YldrfPZ5ad2GbrcdyZK16A97Ut0JmES9R9J/VwuCr3ttluJAO?=
 =?us-ascii?Q?yvS85nchv1ZdSctDE4+OU6SHw8BvUWKF1zqHecW3k/mulkDvKlIZvewYaRoQ?=
 =?us-ascii?Q?5NefDeIv2zQ9KqggTCVLmQl+TI9TZRmUf6rxgGibThiy13Z603ekj9SklR7o?=
 =?us-ascii?Q?qTycP+pKa6wnv/gFpkG+sSrhOzKmAqMItXlExYQ0y2PkyznsXR55AioKJAxX?=
 =?us-ascii?Q?9NhhZWaCccA5I/vh8iUV/nNaMe7NFM4A5bWqSKKqOJZzpQcNCMQQseBMSEY2?=
 =?us-ascii?Q?nyS4rLKa5i0V4ZJV3VybUzy5XLskQh8Dc4YQ9cgV+o65yYTDsCppcFwkpZVw?=
 =?us-ascii?Q?g8exOLS6VOthnzepXqOUUpLL6uZvlpmy6WG8Wwj8gaMOY6IDyLVw4+OjChw/?=
 =?us-ascii?Q?YMsb2lcG5f8ztapGW3Fs9KuqDYlRGfgzaRslvluBSNfcNJGvYP0gjEjdJWiq?=
 =?us-ascii?Q?zW6qtof6zvwvGiWeoTPc9p0EIAYqD+tVFmAWC3jb3T26yWnwWRbyAh7hzVQV?=
 =?us-ascii?Q?vo6exZ6Wz4nwchJY+H1J7n7adNjAul7jU7Sxp8Rf43SAQ/tqaNjnmeVZdsYe?=
 =?us-ascii?Q?VQsEgzm7a9aERqnmoHxLOfR4PgLh/B67kDvEctuSYhg79fpdJWVcXiAWjRrs?=
 =?us-ascii?Q?dN5+JWkbJT+Sqqcw0be8cq7ofjNH+xHidDrDji1Gz+ekKMHD6elSZseXH8i7?=
 =?us-ascii?Q?uF0v9eYG0V27hHcSti1+1+7135jQChUhEUDMTT46+jB99m4soe2G7PbjdRQ7?=
 =?us-ascii?Q?Vyv466RiMpHBO2aGF+PSyBbqj/x9X6pA1FqGOqUuh2itcuxDEN466DgfjmDT?=
 =?us-ascii?Q?k5eANJCLF0Q8Xgw3hcgE1Wk/BIHGtOHX5Yw+HS2Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee90035a-7e36-4647-ab8f-08dc649bdb07
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 20:19:33.6822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xRZ+BmkHOY05BDHMuHbu1LMzWeDbo76ewL1t+E473Ot+E6dNI9PDInajMntyjjgQuVqrqIS6f39VazzQpJBmdFqqctLsRgIJYjjRcqtAmjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Saturday, March 23, 2024 2:48 AM
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_debugfs: Extend gt test to =
check
> mocs entry
>=20
> On Thu, Mar 21, 2024 at 08:46:36PM +0530, janga.rahul.kumar@intel.com
> wrote:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > Read and dump mocs debugfs entry.
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  tests/intel/xe_debugfs.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c index
> > c5a586e9b..ba12f6ccc 100644
> > --- a/tests/intel/xe_debugfs.c
> > +++ b/tests/intel/xe_debugfs.c
> > @@ -158,6 +158,7 @@ test_gt(int fd, int gt_id)
> >  		"topology",
> >  		"sa_info",
> >  		"hw_engines",
> > +		"mocs",
> >  //		"force_reset"
> >  	};
> >  	static const char * const expected_files_uc[] =3D { @@ -183,6 +184,10
> > @@ test_gt(int fd, int gt_id)
> >  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >  	igt_debugfs_dump(fd, name);
> >
> > +	sprintf(name, "gt%d/mocs", gt_id);
> > +	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> > +	igt_debugfs_dump(fd, name);
>=20
> Rather than just dumping the contents to the log should we do some very b=
asic
> sanity checks (e.g., make sure that the values don't come back as all 0's=
 for
> every entry)?
@Roper, Matthew D, I have tried checking for some basic sanity . To check a=
ny mocs entry is "0" or not based on the debugfs output format.
Made below changes. During testing I have observed that test was failing on=
 few platforms. In some platforms few entries are 0.
To ensure not all values are 0's we can count the number of 0 occurances an=
d compare it with the mocs entries for that platform but it is not maintena=
nce friendly we might need to update the test for every new platform. This =
test ensure that the debugfs is created or not.
We do have self test to check the correctness of register values with mocs =
entries. Debugfs dump is generated by reading registers so if there is any =
wrong register state it will be caught via selftest.

Code change:
#include "xe/xe_query.h"
=20
+#define INVALID_MOCS_VALUE "(     0x0)"
struct {
        bool warn_on_not_hit;
} opt =3D { 0 };
@@ -186,6 +188,7 @@ test_gt(int fd, int gt_id)
=20
        sprintf(name, "gt%d/mocs", gt_id);
        igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
+       igt_assert(!igt_debugfs_search(fd, name, INVALID_MOCS_VALUE));
        igt_debugfs_dump(fd, name);

Thanks,
Rahul
>=20
>=20
> Matt
>=20
> > +
> >  	sprintf(name, "gt%d/uc/guc_info", gt_id);
> >  	igt_assert(igt_debugfs_exists(fd, name, O_RDONLY));
> >  	igt_debugfs_dump(fd, name);
> > --
> > 2.25.1
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
