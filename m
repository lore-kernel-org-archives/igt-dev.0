Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD909C2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 21:03:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5492710E671;
	Tue,  9 Jul 2024 21:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRcdjAAX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E6C10E113
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 21:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720559017; x=1752095017;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L0pKTg+jqnTkI7A6rm3Gk4Oy+vB9y8xQn9KwWz7YztY=;
 b=kRcdjAAXeWDiiyQSVDFiQ/lOcm15rDDdQMhFSlOmpAiebp+Ii4uofBs1
 R55NNuAR+hlm0Yb6LlkgdLY+TgQrNhLFikmGX3zTOA6FU3UH4qXHI0l4/
 bWAH/gyEQOvEITyZslsn+OjatDD/OvOH8m7Ib1PMHlSu4tIoTamQL7LD6
 H6aBOelf4uR/ktOfmfPYlEMTZh59LgkG7N10jO6jelObXJylpexW3W2gl
 W+W+Zq+sIQ27jQDZqhg63zNW9kAslAhLTg3J4KF2bvHJRHQZg/LjCVo4c
 zOIxnP5r/bKK/O6MqSGlqEPyim+nTo97ltlgGoezObv/pI3qdF2mSh96k A==;
X-CSE-ConnectionGUID: KneDdSjkQ3me6W7jG38JiQ==
X-CSE-MsgGUID: rJh0lIBsSxSwkz752z5O7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="28453199"
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="28453199"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 14:03:36 -0700
X-CSE-ConnectionGUID: U6yZzwNZSI2HWbFqDMPc4w==
X-CSE-MsgGUID: vvUj+/lvSPOF0mcQ8DuMHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,196,1716274800"; d="scan'208";a="52579806"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jul 2024 14:03:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 14:03:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 9 Jul 2024 14:03:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 9 Jul 2024 14:03:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 9 Jul 2024 14:03:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDAX6UPI1UH9JZqSFVBYMPG1/xo5Gol5ikbSMmyV6cyItPmpVO7B/cr0kWx139nhBWwhZ4G0lo0zJSapn/qDDYpu4rr3LZ1ZFm1pvuHDrJzWlYfEhzjjzgigc7OccS5HPRmIW0g1dbleAvGiURMz94FqOlihmaw9uvE/gthO4XUoEZcVtkJF5wyNAdstGbQCET2JcW3JQr3eoMj+p7elTeBnDm12D9K9RHFfizPWWbnCrmC8mUN9KEsmkJ/NCGX7jkE+WP4CU6DtB+2n9IPjXv+BSE7OUNJrfcjCQJ89LKzRLWAnDdPlRFmSXyD3vLlOkDgPcAp79zcgkFqhoT1QVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhYgK+Ds79z8qbZi2pzaaHfL/cMOBDP3a21nlLTVm8U=;
 b=hAblibLT/ftf2PCqBws3jYhXIy2b6AK5SQWfl27CwevVhQUGrOlRhZnRuSs7X/p44MsCrfMyqvxC8y4c1oeYb2oQ/5TvtSiGi1yEn8gJCP4617lYtrkvbssmK7FgFrYlwq47pEFJuumH9UoiUqzCTL09SyIwa6rrxRJLX7vEOYV5u3Y5CX7al4UXY6Vwt9k601rD0mo7ZyE3KbB9oaHkBMqyXQpEdd8yH5kOFb0HzNaNeUJdupvZw1FD8mOU66qb69bnsL17APQ1D9LVdzy9Ff4mEFIJST1UsaEAgMy/Bb/fWJYdnrwLmcHpLJUYGnCKvNmo/j8Q/gByTZzhrAS6Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 21:03:33 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 21:03:32 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Yang, Fei" <fei.yang@intel.com>
Subject: RE: [PATCH] xe_exec_reset: Wait for spin batches to start
Thread-Topic: [PATCH] xe_exec_reset: Wait for spin batches to start
Thread-Index: AQHa0ireXhZLIYIrO0OHrylsVNiSLLHu4lIg
Date: Tue, 9 Jul 2024 21:03:32 +0000
Message-ID: <CH0PR11MB54448C2F3BFE25DCAA5C7879E5DB2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240709180726.1033327-1-matthew.brost@intel.com>
In-Reply-To: <20240709180726.1033327-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SA0PR11MB4669:EE_
x-ms-office365-filtering-correlation-id: 76cd1eb7-80bb-4ae1-ccf7-08dca05a974e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?1HiJAxVAcHJ2eDuyF1NX3PBUM+QH6PgfWjwXUO9rR0/mksP9dgPZg5ukE5Lc?=
 =?us-ascii?Q?zDFCvfX5Ek4OqQ2gykQxKooSvbXtS20k16VmZZkZGpWuVFPpnKqFJyIYTzRC?=
 =?us-ascii?Q?kS4R3gn1T+U/q/iNxhEtezOpfTfkL730ND+x/RnPoXqf1hwh5wiOog/J0NuT?=
 =?us-ascii?Q?2x16qh5iYQmcE/7MHnmKkASILSxlbDN9ffi1n7GrB24cWNv6oq8axdUbHueo?=
 =?us-ascii?Q?egaW8ueFCYQyIngTfLmCrajLavyEfPyUURYxDVkdiqbdeQskDOCZ/mZXBQ/7?=
 =?us-ascii?Q?M4YkIGtZ7M8wtnE6xffHEx2UEJN430NLR/seA513RVIPnJVfNjxVqzbjMpCf?=
 =?us-ascii?Q?5Y/4IScdmtMJDt8yXnE5+mXDFFgb9oKp0dk0irUnldGwMXjspNiz0X1LFhYR?=
 =?us-ascii?Q?FfuzJE4WLKqhG8O8GkHjAyZxavhV0wo/Skx7EVVkWLnfdZpEmsIBpO2VrQIp?=
 =?us-ascii?Q?lrleqaXTNsdBWvNwKV+qkV9iz5yuwcuVmFZberYot5p7eTW2JezEtL6ISsFe?=
 =?us-ascii?Q?tI+aaTVhpAjjy8Uh52WwyeMAjP1KU0mh0sKT7fqspHEwcSgHr0rsmlxOk7NW?=
 =?us-ascii?Q?TE7V+nrUnecBg/YKMA37qdcRuPiSoCnUyVf/fuv0C2uWDjW3gLWdIkUxqpMi?=
 =?us-ascii?Q?UpVLz1XyitdxtEb477BH9ErzOdtZBDcwLrZY/zum73aXQnT6LX20HCcAhvwp?=
 =?us-ascii?Q?yfZd5jV6G5rJGqGLQtkPetaJ7WCAf4OIw7fAyTcAYxI5M0GVzA7A4ADE6DvR?=
 =?us-ascii?Q?8d0yPbzWFfM4D5PeXaG3MG4sGpObQ8cx8iCZ3Khy/7slwXpSD2W0IA1A1JTT?=
 =?us-ascii?Q?GPZTUV2wzo2tfcxKPxmJ2mJ+uVID+DvIquNBKJf3x5G7S0UHailNA20eIqY6?=
 =?us-ascii?Q?/N8Clj1Wv6/SwOgVFnRM6bb3z1hJ23VvSXY0r4oCs892HiX2EuqQOs5Joa5E?=
 =?us-ascii?Q?nmMOxG1HYz1s1AOXQZ7zST94e41+ctqq2/C51q4jsqWmbrDxfH2/C8fpfKqn?=
 =?us-ascii?Q?dlTD5mtSxzP6P/fAh1l0N//qMEUZTmFeAZoe5cy7QQLkB6aIrahA0P7JKdHT?=
 =?us-ascii?Q?CLqT9d3TsoCmEIrzVCzzI6/HZouQ0P8ZJV9sc4DAyErwHBh5qnUj2877Rw0E?=
 =?us-ascii?Q?HEFTHrRLDEyhhCUdOLZxPY+Jyu3+Q4C+aGsaBBn88DwbBO4MhlxSAS7CW7LX?=
 =?us-ascii?Q?ohaJIutrhiQCVnSLMb3z4D3iNEanqcmcaCRRnA/L1mBrz2i/YV6qVsOQdP4U?=
 =?us-ascii?Q?ubLTqJOrN9noOrErQqQz6ekquFGliBopR2w9bVcT/jaRmQPc/+Lp7qYQ5W9C?=
 =?us-ascii?Q?sUNLKMX+cVeZ+AZk/IM4tWc1zEH2UDQHoCDpy0TCIS/1ialYX1DyBQmHvZk3?=
 =?us-ascii?Q?VyAMBvQsRqRZmgG2eRQ98z2HGNdmBBPgpFPONgzxXIDxPHBbTg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VxEzzNOBu0JCjvsjkMbUYwUJ2BfXee0OGk2upKhmIDYoS8CzxiUDXtLRXvph?=
 =?us-ascii?Q?Fi+WxQVEVEtx744qN+CuyEa+0+0W7Ab+bLBlcdoIF1PBsGolPnzUaEphbgmv?=
 =?us-ascii?Q?ckzFpUBrW5vSA0xTCcAkyKCQgBQewU7yV9cyfMOzGN8G22Epg4foYPir0TaI?=
 =?us-ascii?Q?kRcHzWLt7YVvxQW9JAFXs69vI3y6pRWsYOdXbobi+vWc8eSaya5aD1YzEc+x?=
 =?us-ascii?Q?Y2xFqQCcIUtKTl9OJAeA8xSMLAIDvkQ+HpUCQeZVnoeyCfjd9UtWjaX+c6bB?=
 =?us-ascii?Q?TJjQDARJBvzabfgtVXliF7uJlHLPvgoiP5Xof9s4h8w51VXwyeo99WlFIgvO?=
 =?us-ascii?Q?qom0Jox8Nm9MOCFWh/yVeImJQeIJd+9OlVPuuFLxgWYThzz5ZoJtSRoZV+ba?=
 =?us-ascii?Q?SnRVZpx6fZ5TVOp4RedW+OM129jZtjWI8LW94K/YWqyvO3yKQMEjELrF0hd7?=
 =?us-ascii?Q?jAOO9Ok8hqpJYE6Ygr8Mero5ERe8lcx3/HSvCy7HSpZevK3dwMj44/VEAnOE?=
 =?us-ascii?Q?fg9DbJi6b76B1uxkD+mbVulC9lV8Z2JUV7FypLv5eIOGSJOUx0OIEANChXt+?=
 =?us-ascii?Q?X+NZQtAFCZxOPjIYiUHShs1gbsjblNkCwzgL4CCL2kQjtNYBjuitTm5lIwc5?=
 =?us-ascii?Q?+cbU0zWH+bEB4CCI5NrxL7WEBivLFkLX+vbUGZ44NKaGsXJyrPt6Ae7jtXsI?=
 =?us-ascii?Q?ZTL9+u/dMC0s4OJ9YT+VeZj4iVgNF/2AmUqRbyb8oMqMqpSsfZTc3qx+0air?=
 =?us-ascii?Q?ngg9PAFtpsl4ZpbxjHy7sp1TR4Ej1/h5C6ZmW1rn+6I0o8Ez94eClkRFI9S8?=
 =?us-ascii?Q?luWK5jTMmd7uXShMxIlbzgiT7OKqheD+Zby72T5X01wYncLb67iD6757W9eU?=
 =?us-ascii?Q?umZCvrWWNOaQo6nW315Q38xzY/KUPY56DAki5vzq4jhZNiKeCwy01Bc1izNJ?=
 =?us-ascii?Q?94uApIZIAVWZ1wmPRRRbdxMB44j4fZCw1Eu4ki+HPZ8e3kbGDKV8YosX2b82?=
 =?us-ascii?Q?pdnUwSb7gsK6NGXIOfd8/k8uicB0KxcMiS4RJM/dfrC2TYHK68Kl9ijctKuV?=
 =?us-ascii?Q?9uGeiXU04xlkcQLNccKfLrsWrY6dG83GS+YuWxeXPJ4Hk4neVxqLRGWNAupN?=
 =?us-ascii?Q?32cYpRN+uAgYubQTrq+l2lHvqJnNi4XrYW06xGLxOfo8setq7EwbimVC9IpW?=
 =?us-ascii?Q?FeyWaQoxRqGf9Zp5l+cYzZ0W2dlu55k1NWXmf2EzL37q5XE0w5P7WqaB2gtL?=
 =?us-ascii?Q?DxUHZYi2SbWE6nubh8Ew+pxMk1tuZTLBv8MyjF8moBzd8+VjoZhmNQB8Md9j?=
 =?us-ascii?Q?O94afk7qVQpgDcM3DGM57r26lJxQxYzfn+2y+u5kav/RjzyHd4htcYY/k9Xi?=
 =?us-ascii?Q?nxIoWSnjrcDNljV6+CqP1+GaudyXgnTG97BkH5WC32HjT3TQId6QFyBRLCv8?=
 =?us-ascii?Q?14YqD/mMgjcRZ4gjkFGx+tcT7LBHOze69yQbCzFuyGJCbGaX0iZZcelbvDKE?=
 =?us-ascii?Q?x0mvqwfT5YNTpdDNmw3cAyEYPu4g1RzdFGsAtLBMeNJKmiXD7SCx7Cxp+fOh?=
 =?us-ascii?Q?EwFCuliF5CUGeRYxoqrD6J2vs+lOolpCIfsAYDYD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76cd1eb7-80bb-4ae1-ccf7-08dca05a974e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 21:03:32.5194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eeKNPspk4/E5gDC1riWvE21pLckw+wgo4RANSjLnMddb6pOd9zVtU6J/YCbUa2lT0olqvU4ApxlxH25L/xiNLqgvD4qXQriJgDhKj2Ks8Xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthew =
Brost
Sent: Tuesday, July 9, 2024 11:07 AM
To: igt-dev@lists.freedesktop.org
Cc: Yang, Fei <fei.yang@intel.com>
Subject: [PATCH] xe_exec_reset: Wait for spin batches to start
>=20
> Ensure spin batches are running on hardware before triggering any type
> of reset.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  tests/intel/xe_exec_reset.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 817b82cdef..dcb22f275f 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -236,6 +236,10 @@ test_balancer(int fd, int gt, int class, int n_exec_=
queues, int n_execs,
>  		if (e !=3D i)
>  			 syncobj_reset(fd, &syncobjs[e], 1);
>  		xe_exec(fd, &exec);
> +
> +		if (i < bad_batches && !(flags & CAT_ERROR))
> +			xe_spin_wait_started(&data[i].spin);
> +
>  	}
> =20
>  	if (flags & GT_RESET)
> @@ -380,6 +384,9 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_i=
nstance *eci,
>  		if (e !=3D i)
>  			 syncobj_reset(fd, &syncobjs[e], 1);
>  		xe_exec(fd, &exec);
> +
> +		if (!i && !(flags & CAT_ERROR))
> +			xe_spin_wait_started(&data[i].spin);
>  	}
> =20
>  	if (flags & GT_RESET)
> --=20
> 2.34.1
>=20
>=20
