Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD042C35FFA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Mar 2025 21:51:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B60910E170;
	Wed, 19 Mar 2025 21:51:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BSkWjqZs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B91610E170
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Mar 2025 21:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742421094; x=1773957094;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ogD9vWSpDOY+kBjkNRLGcI6GAUu0BnKOlsYKm4AwPVk=;
 b=BSkWjqZs0n1Ebwj1DxNmFsSTVzjLg/raufH3qXvllaATdEOVvn4jLqdm
 5OVjmYDeW9SbUEBw5hPNt/dch34AZn5u5wLOkMUuaZyXad3mg/ErL17xn
 OPBTGxXzceLWschhVr/jSiJcOkIAndMRq+vYriCqXejn8uYNsBnJSGJ3y
 +ecmO2Pqdht3SwXqKuy/Wk5Ts4NTbmnj30focb3Wm7jCM8QmybCVvyidH
 SoJKFKjbg+UnhhY0hb5jNus2IqkFRif8564z4/eeUn5YhuZBbG+ujeogr
 pSyerrFU4HSD740whUGxB73X05nZP6okV7MeRBqy1aC715Gbwek03Cr45 A==;
X-CSE-ConnectionGUID: f3i2Rbp9QKiUKGXXkcRK6g==
X-CSE-MsgGUID: rVJiLm3uSi+uW2Ugs5+Bcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="43817871"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="43817871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2025 14:51:33 -0700
X-CSE-ConnectionGUID: yspQz5erQ5yBwAXYSyfaYg==
X-CSE-MsgGUID: GPGwS8rHR/ytoX7+WR62Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; d="scan'208";a="127012661"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Mar 2025 14:51:33 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 19 Mar 2025 14:51:32 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 19 Mar 2025 14:51:32 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 19 Mar 2025 14:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwSoeNCIdQT0xhGZ7l2jeqxcM4onq7o4uYuZoG+KNt2lYjAN4UXlC4ryJ08zyq/908F9c1CaBZkkRcFtZ+dJLQMJ2RpuqFhMeMCyVeUwffkHWTwfelCGWvuSImLL3ZCWhq5BDFRM4c8eEeKrmgFJfgLo0yvmVt1samMmSpdEvMvR0VrR3sOdtq8DwrK2zFq1eGBPBnXzPI9acr/drXGYvbFdcZCxIFI8Lp8zYigLYi8lQFQbpI0fHg0U5mSv1VNsGEIZ5umAvN03+i/K9/gxfZ8YYzg9pNo+f3LcaXwSVz8sqHRUiUddpb11kS5eag/bpsL/IPXscYdwF8Gm4HMu4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKftLgmgar2exNgOwtqTxGuRMleGP8J+X/5Huv8FquM=;
 b=qxXZSQM8wlA8AoK6OksfuaZcjxUjK8e3t/9glqxjFqZm+YhqZIZK+asWTl3rWCbe4nuzbEv+ssn/4XOGcmOmlvyKEZh1ui37YuOLzYaFz6mm3Ya5QH/8ZkdVgbj5QXv6Q8vFSlEyjKdrXffqoWNgKbRO3+fsBO/gXVVPsi8bxFi5n+MK+gj2nDRmKyoP6wikjSrg0/QDrgq7dxhINftjCmumw543YgYOUA4788cL6bdpWPSF7JUaC9V7uGNoCjuuZDArn9KqohBFzOWiZWDopLVNHwn/GDM67uz1wafQpaB3tOahY6hEkzTza43QIYQoCIMuzEnJiM2P2vrlozVQYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4728.namprd11.prod.outlook.com (2603:10b6:208:261::17)
 by PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 21:51:30 +0000
Received: from MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf]) by MN2PR11MB4728.namprd11.prod.outlook.com
 ([fe80::2fe8:64e:97a1:b4bf%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 21:51:30 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t v6 3/4] tests/intel/xe_vm: Exclude invalid_flags tests
 from LNL and BMG
Thread-Topic: [i-g-t v6 3/4] tests/intel/xe_vm: Exclude invalid_flags tests
 from LNL and BMG
Thread-Index: AQHbkh1HOVL8Q15jQ0CD1RKYW6vrSrN7DRVA
Date: Wed, 19 Mar 2025 21:51:30 +0000
Message-ID: <MN2PR11MB472806C5FA68BD665B7F7F2692D92@MN2PR11MB4728.namprd11.prod.outlook.com>
References: <20250224174010.594192-1-oak.zeng@intel.com>
 <20250224174010.594192-4-oak.zeng@intel.com>
 <871pv44d94.wl-ashutosh.dixit@intel.com>
In-Reply-To: <871pv44d94.wl-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4728:EE_|PH7PR11MB5820:EE_
x-ms-office365-filtering-correlation-id: c393e9e3-4852-462a-be08-08dd67303506
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?q9kV9n6z+jHd9i9Sffrfaz9tPZgEbbnQyhTWTldjDcfYoPj+G1ODVZUf7iqN?=
 =?us-ascii?Q?NbR+gIDocDif65UKmLTGblpt897a6jCugU1rXyMUtXzCVAKnRRgVGRWmonhd?=
 =?us-ascii?Q?gHxFwC3ugB4p3WFo1r01lG8+k7T/oQU42qH0TzXugGKO6Zle+Cl7T5UvrCzm?=
 =?us-ascii?Q?OzbPTEaVD/egzri2GmGDOg+rC3xafnM59Owqd3MARpU1gd6vXNN2QNfz50So?=
 =?us-ascii?Q?nl3Zb0WqDKUtLcLREek6ABe+G3ZeEanCGSXn/GvK04BpKryhRLG0xGDmu+26?=
 =?us-ascii?Q?Vq+GwBmgFbQt8r2EW9icO8y3P4RK6S/u11c9EdUL/EMb9JOSDcfQOvu9hAIJ?=
 =?us-ascii?Q?Mz++Gk03LMT5r0Wqc6WJ0wiLrZgY1wzheSAdXgjHU6ETbmIGFQ57y98JIqzy?=
 =?us-ascii?Q?JJnd205KITX6MvT05AK7i+d08krXpZ2AfXcwUdScE68cIO4uW+wIUQioK6IL?=
 =?us-ascii?Q?4HyHSzV1oz7WlGOf8LkadGJP8ps9hR9iVcC8vhF3/wFFS+TNjxDeSvciJNfk?=
 =?us-ascii?Q?AIENPzSdjIOJnWiimW2Pjhux6hRj61Ab7NbjLb0MSwMJpRZ0Yc5XgtQJLcj0?=
 =?us-ascii?Q?FNqNxNPMqmGhKfm0YpdzDAYOYtoDTpRG1LmSCw+MnyEG8OS19FymiB7pmpar?=
 =?us-ascii?Q?8k5IjryjfAqlpEupbyqoJ5F9P03eWUU9+RUwYnR7IxgK/4mne/Da2eJadya2?=
 =?us-ascii?Q?Fxt9KnBWWJsj/9KxrgrGlpSy8gcIB0RlL4MhJOMENw9C690Vie99TdTTetGz?=
 =?us-ascii?Q?JvOHAigIHANPbTkA21KLieSvgXFUzyBvKV7nm9rxqSirXN4psjH2IWyQcCE/?=
 =?us-ascii?Q?b804/ecfg28teLrBO8TJ+qmxF87E9YJ0Lf0je701d/AawpqCOKHzABjQI2y0?=
 =?us-ascii?Q?QYBiLouQDlrzm3/xR0if8QCZ5CogIClVPDLAJN6Bpe6E7Vx6X6ctXdEI7BrG?=
 =?us-ascii?Q?Oj7wS0bI76wjAxw4GNIWQ4g9BwcCCk3URswF5rpaUigpF5FpxaxOske9Mh5v?=
 =?us-ascii?Q?kdJJsI8YN03mwWYT9lI6oZekei85LjTfHtahTldHejw/08QRn/cEa/Qv2Xfk?=
 =?us-ascii?Q?twGLzGn34db69c14Ss6K5N79jHoVVUQBipUu61kjJj+yJ+Mf0FyARt3ofzhB?=
 =?us-ascii?Q?giDCK70qawJcOJ1MOEQng3A/A2wfHqxaJ+m44EdDIZ1tfpxkmVSyUKb0r0vI?=
 =?us-ascii?Q?soRD9Xd0JOQk/7ma6RiIqFgGYFrvcNup5+Q43HkFk6jJz8HTdGIDI3LHq2jg?=
 =?us-ascii?Q?1M5Y5FmcAd69WagO4ALXMGIzSlxifRWdueYQ3GARMh1wYKxx02He2m81WRK2?=
 =?us-ascii?Q?5WtAQjse8UGWtKxuqNDecu6BykZIPDgdTDHLPQ7dpLsbY7i4E8lZfF1qevQn?=
 =?us-ascii?Q?qnTh9r2BIZvNJKo18J06SH00fK+/ilICnhaovR8leSay2amdPW5vex5C5FmO?=
 =?us-ascii?Q?RBnQj6P0f9XFi/LSVKPzR07j0gMmRPfp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR11MB4728.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?z839L3ET7uWU8Mg+dZVd2z8oWvEjuiiJRDA45SFI6v8wnW+MFxXsfK7E5RG2?=
 =?us-ascii?Q?d1pGNmRMck/kowIWLAoUeC2VGlT/YL6/vKYD6VAQvsqwPuByegzjByoSOw4n?=
 =?us-ascii?Q?qKSnXq7718m9RACCYRD63A9tsmskbttCM8fm9ENCHcONtREDTntH8bSOxqCZ?=
 =?us-ascii?Q?ndGFkT0F9Zb2wiB8WXGmK9YAsVcwg6fs97Z6cBLflnk4mUUn/Ugxh6LtDvPN?=
 =?us-ascii?Q?Zdxkx6+i4EMx7Xx6A90B0kD2FpbadsqowapYsxwnQIZ3n5W7Y46PtyHWO48v?=
 =?us-ascii?Q?lHReYUGGMywj5EUrZOxsptC9SJYLzfJmMrvQH8Y9O5hsR5Mc1T6VMt02LP8d?=
 =?us-ascii?Q?smyBpoan6BQy2bLYexYsMpNy5avCXHFCY/bonl1UKPT0KbbGHUzLMiC6QFsg?=
 =?us-ascii?Q?lelkF6bahXJLpysTZqc1kYauhfkOyD8CQjQBe9daKtxD8aOHx9rDRMA+XjoT?=
 =?us-ascii?Q?5Pf2jidmL8o+qwwq0YFSLUjBb8G1BABJ9xEyoGxAHGb5/eFcrMZu3PgvzpOa?=
 =?us-ascii?Q?32OBiLiow6JmT9o423/iB8QYMzUa4vFfUXpdrGM+pYDtZSDOvIBdjNGbpX6J?=
 =?us-ascii?Q?guZDlB+hOlirWtYt5awy2hPoa87FHd/PcYHxEsDc0GSkSv/IOVz+ZbALL/04?=
 =?us-ascii?Q?RWNZotppZB7WWnEh47JQfvHsmqBXLqg3PEfCDq1QH2f8l0G2TNHXXzr/V+6O?=
 =?us-ascii?Q?iaQAZMteP4ejsUIQss4+SYiWpS54I1V/F+y0hsm3PM28cG/tCGl87eRyCnAc?=
 =?us-ascii?Q?Cnc2EIkNwY71OTI8FKCNV//uiB0OWH0hVkVfq24fx/AVEe+Go2+cvdgQKL3o?=
 =?us-ascii?Q?6b7RcU6vHHlzSmQMOa0BHEj2Nte6ZfyX7OGYo9moO5P6JvGGTKuhX/jfcdVv?=
 =?us-ascii?Q?YAtQOUAO8rumcBQ6fEJRaHPRR+ymxbyQ4SOoXl8jQ1q7l8IAe7yVW86+thY/?=
 =?us-ascii?Q?kN7AGKyEIuO3VSs6myl41kAwflj76yG4AMot3qYhk2bmnQWHM3F7uzT8viGe?=
 =?us-ascii?Q?/37VBlvn5TN9j3Nheq23YmadY0bIZAzeq0j7oSkcTBMDX3jegEvnD6xirXow?=
 =?us-ascii?Q?OeLFbilDyQZiVqpekHpJAhhjAQUP7kJ0fKrkhpDrmIEejW9jGBftid/X1pV9?=
 =?us-ascii?Q?rVJijGrG460UiI7Ts7ZbXYxHEGMsQlgYR51QzYYFzeSAeVHzhOvu91igw++z?=
 =?us-ascii?Q?xFp0iVfBomLa6+4Hs/4hqBNL5qDq2E6bInZUnELaEPp4qGshdCpbgXwDdO3W?=
 =?us-ascii?Q?WZeLUZCtmCbcO49uXOMStm6D430kUkXTYW2ULPeyVWX9CQUTzbxK2DUbjIiq?=
 =?us-ascii?Q?6OlL62a82TEh8LXXS/bScQCFuUV/nL82h4Wi3pDxsqkj4Jguro/+eub+/rSL?=
 =?us-ascii?Q?iFm1G1kPorcw9R1AA3jgwwPo5V1V65yR/V0+dmWTOQECiy8kGaW/hG+fMjLs?=
 =?us-ascii?Q?y8p5ZUQPxGjxiXbhpGNWwvObo1t1ytJaKWyjDow5ziuHAxc4tAXMYNXHMOG2?=
 =?us-ascii?Q?kYE94M4KhvUWwjX0OSbDpshZNgYXfk1Ki8bfnoNdCBiYFa7wKpmcEE3HLrSs?=
 =?us-ascii?Q?QSUVfwZWC4F5izy4wkM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4728.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c393e9e3-4852-462a-be08-08dd67303506
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2025 21:51:30.2120 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVXjVrPQv6+Nvw/voec+R6ps7QeFMbvtWkfQEarRBIran9fwMr8/ZGbA//DVKTshdCX+SzkYzuThynMLsDwUWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5820
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

Hi Ashutosh,

> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: March 10, 2025 8:34 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [i-g-t v6 3/4] tests/intel/xe_vm: Exclude invalid_flags
> tests from LNL and BMG
>=20
> On Mon, 24 Feb 2025 09:40:09 -0800, Oak Zeng wrote:
> >
> > Due to a fix of out of bound prefetch issue, we now allow scratch
> > page coexist with fault mode on LNL and BMG, thus exclude those
> > tests on such HW.
>=20
> Instead of making all these changes in this patch, isn't it cleaner to
> include the platform check for
> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE in
> invalid_flag() itself?

Yes, that is a good idea. I will make the change.

>=20
> Also is it just LNL and BMG, or other future platforms too? In that case
> instead of using IS_LUNARLAKE() kind of macros, use
> intel_graphics_ver()
> checks, so we don't need to keep adding a new patch/check for each
> platform.

It is only for LNL and BMG, not for future HW. The reason is, in future HW
We plan to have a real HW fix of the oob prefetch issue, thus we don't need
The xekmd SW workaround (of enabling scratch page under fault mode). So
In the future HW, we also don't allow the co-exist of scratch and fault.

Thanks,
Oak
>=20
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  tests/intel/xe_vm.c | 47 ++++++++++++++++++++++++++++++----
> -----------
> >  1 file changed, 32 insertions(+), 15 deletions(-)
> >
> > diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
> > index 0730dd3d3..834e0afd7 100644
> > --- a/tests/intel/xe_vm.c
> > +++ b/tests/intel/xe_vm.c
> > @@ -2349,6 +2349,7 @@ igt_main
> >	struct drm_xe_engine_class_instance *hwe,
> *hwe_non_copy =3D NULL;
> >	uint64_t bind_size;
> >	int fd;
> > +	uint16_t dev_id;
> >	const struct section {
> >		const char *name;
> >		int bo_n_pages;
> > @@ -2441,23 +2442,28 @@ igt_main
> >		{ NULL },
> >	};
> >
> > -        const struct vm_create_section {
> > -                const char *name;
> > -                __u32 flags;
> > -        } xe_vm_create_invalid_flags[] =3D {
> > -                { "xe_vm_create_fault",
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> > -                { "xe_vm_create_scratch_fault",
> > -                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> > -                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> > -                { "xe_vm_create_scratch_fault_lr",
> > -                        ~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > -                        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> > -                        DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
> > -                { }
> > -        };
> > +	const struct vm_create_section {
> > +		const char *name;
> > +		__u32 flags;
> > +	} xe_vm_create_invalid_flags1[] =3D {
> > +		{ "xe_vm_create_fault",
> DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> > +		{ }
> > +	};
> > +
> > +	const struct vm_create_section
> xe_vm_create_invalid_flags2[] =3D {
> > +		{ "xe_vm_create_scratch_fault",
> > +
> 	DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> > +			DRM_XE_VM_CREATE_FLAG_FAULT_MODE },
> > +		{ "xe_vm_create_scratch_fault_lr",
> > +			~(DRM_XE_VM_CREATE_FLAG_LR_MODE |
> > +
> 	DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE |
> > +
> 	DRM_XE_VM_CREATE_FLAG_FAULT_MODE) },
> > +		{ }
> > +	};
> >
> >	igt_fixture {
> >		fd =3D drm_open_driver(DRIVER_XE);
> > +		dev_id =3D intel_get_drm_devid(fd);
> >
> >		xe_for_each_engine(fd, hwe)
> >			if (hwe->engine_class !=3D
> DRM_XE_ENGINE_CLASS_COPY) {
> > @@ -2715,11 +2721,22 @@ igt_main
> >		}
> >	}
> >
> > -	for (const struct vm_create_section *s =3D
> xe_vm_create_invalid_flags; s->name; s++) {
> > +	for (const struct vm_create_section *s =3D
> xe_vm_create_invalid_flags1;
> > +	     s->name; s++) {
> >		igt_subtest_f("invalid-flag-%s", s->name)
> >			invalid_flag(fd, s->flags);
> >	}
> >
> > +	for (const struct vm_create_section *s =3D
> xe_vm_create_invalid_flags2;
> > +	     s->name; s++) {
> > +		igt_subtest_f("invalid-flag-%s", s->name) {
> > +			igt_skip_on_f(IS_LUNARLAKE(dev_id) ||
> > +				      IS_BATTLEMAGE(dev_id),
> > +				      "Skip test on this platform\n");
> > +			invalid_flag(fd, s->flags);
> > +		}
> > +	}
> > +
> >	igt_subtest("invalid-extensions")
> >		invalid_extensions(fd);
> >
> > --
> > 2.26.3
> >
