Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52A8C3DA61
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 06:49:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5830210E4AA;
	Tue, 30 Jul 2024 06:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XWYQfgXZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B8210E4AB
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 06:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722322194; x=1753858194;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zyhFW6P9VQO3Ljg+2JQvMvvtnuyhCdklx+m/gH4WYbw=;
 b=XWYQfgXZIaEPImsHSjSV+RH6sheRwmAYO1XtPFF75IbPHJ8tbklG++5h
 8UXJMmfG7ggE32xJ1Psk91ybngINlGds19lRChyH+2V01g6YACPFUs4XI
 D/542E+JKaMfyLHlIKn+P0m0OkFOEmDX7fKqWjxfbTTfpwHmUBJzapign
 0jUftwHh3tZXVzIqOIj22CucGyu8uEHDVeykIJLJ2JmFq1p5dJtWUwOJw
 YskuM5p4FnXf88ALAJD029GeA+3K0lnFwmGXtRa3nxpleIuVPF5/ow+T2
 TE+mYkwTakZHjb3Ywv4yauJktWfb5x5RhJqDdD3tAqGiydBnQN/zUfMyA A==;
X-CSE-ConnectionGUID: grHNBAM8TqysQVpOhnRF/g==
X-CSE-MsgGUID: Z9pS4qj4TQCOb+btGwr4jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="19820774"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="19820774"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2024 23:49:53 -0700
X-CSE-ConnectionGUID: JtTYcS1fRtK7SEUwxQq1TQ==
X-CSE-MsgGUID: nnvg2PQWSJKOlFRZEIkr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="54823490"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jul 2024 23:49:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 23:49:50 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 29 Jul 2024 23:49:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 29 Jul 2024 23:49:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMck8zZDiV+l2UbcEuvN7S3wS0Ke3EvVd6sz1hRgpoglw0aBdZk5Wv4suFxkrjidPLu9JwNEWZHL1874EHrX6ucM4G3Orf4jUMVHmrhMzT3sX8nNtrjRiLpEbRtWvzpgArGSEGegm20akOKlR/ihJ0uuR+dszi0xslelAX4N0PxleAvOZGHkl0x7Ntc3afTEmvgrHfqS7C9vy7kjZK4wSeSotSh2WYSIe0Afe8dZaItpdwEToubZfaG7BKooqe8KmeGb1aAiTtiVDk7pNRWgu2rYkCF5TDkhez8Yv8Qzl2jQsJhWezaf6ymAqJfUN+Fk/naa+0YP/XxW/1mzZKkiiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NYqq+mitLr8lkC/fH72UrsOdDq4mzr5d2deCLBB4PqU=;
 b=FULZorRbW1qJyhj4nRoGC/WQP+ULu0bO9FHtaxTMqoH7eY1+MntctnunozPNC09YTqzV6A27NQb/NY1bQvM+M1nAH5OZpcdneDmIuJRVmHEZkDZM1O7KhELIJg/Vv4YXvZ/O0XLIzDpUro5tv3BB0cyPYezQl0DAdc0N/UpS6xgShVaWr9vRNWUwuiPrgS/y/oDhqKxD8GZ2k4kX/L+N3cH1e/bc5dsXLdE1+SJBhkYlc9sI7e2OaGFIpYXX11IRaMAcoRK+9lqzQ3wLE4p6ndFqAy1c9UN7iiXvMg7N3OMLgbBR9LsK4gEVLYsPIOdo4zSbE31/RmmbMDiB1/uhbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 06:49:48 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%7]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 06:49:48 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/2] tests/intel/xe_vm: Add bind array conflict tests
Thread-Topic: [PATCH v2 1/2] tests/intel/xe_vm: Add bind array conflict tests
Thread-Index: AQHa2hRFMV9bmx6bm0WcxQhMEdcGabIO5G8Q
Date: Tue, 30 Jul 2024 06:49:48 +0000
Message-ID: <MW3PR11MB4748006E3D11D0BEF84EA1C2AEB02@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240719194613.1549550-1-matthew.brost@intel.com>
In-Reply-To: <20240719194613.1549550-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SN7PR11MB7466:EE_
x-ms-office365-filtering-correlation-id: f37f4e87-fdbd-410a-4d29-08dcb063ce0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+6ZqpK3KRJcvPDcXSI4Pg32h/cri4UYoISFWmPhUrhCEVnUji8yOzLdqU14E?=
 =?us-ascii?Q?mkmruZPkNGIOCgvpnTEC5VwJsKrKLhYq/pUSGcxGpRpMD9DOe7qI9m9pqvH1?=
 =?us-ascii?Q?M/Vj4A73QdaFlWC+ixzc4DQzyQi879Gjn2yp29MNN/Ky9ZoGQnc4vfkMJBn/?=
 =?us-ascii?Q?AU9FuCOH+U7unb2Tze/Uc5wcXlyAL3QVo/swJr/hw7fLf6gYSuE4cSJhzMTE?=
 =?us-ascii?Q?FikeAc8kfVVnmjIMtuuEauAeSZR8Bga/EqopkFVZFzurfe8oJiND1Xbc4zU2?=
 =?us-ascii?Q?N4BvChKtudnmIiotlli8r3WlvBI+gTa9XNYVT7VD+9o0WEaXzCAUs4KnwXO3?=
 =?us-ascii?Q?HUKfjnqFoOvmu4wvAofUDLTg26O6Cxk5VORsCB+7Aqy4lmU3akhp+dEXDIEY?=
 =?us-ascii?Q?0e9eNDVHHRCJrmmRKt8wx5bBgl+om5yop/Swf2xiZtiLTBRfBfePDWtMsvA4?=
 =?us-ascii?Q?xJmWyzC/3mxqGmSpOcGyKFIWoLuOo6X9SBQVftk1DqlY3MTouzpENrqKcaGb?=
 =?us-ascii?Q?yJ2qHj1PKnkWbVeLn5nWzKl3bmxIdpFz13QiLOja21y1FgckjatMQrNn+Cwk?=
 =?us-ascii?Q?8rjAwZKYy8sANWaBKnBc3s570NP4HJ0VI3fqPGt7J8AYXw+WRDSz0s412cNC?=
 =?us-ascii?Q?Huwjlxi44fAUtWKJ2G/y4hhXN7yiGOxkfJEoiowk+4ZBEOJFzmg0ii9R2jwn?=
 =?us-ascii?Q?dCF/IaN9aPEKwynfk152U7zZ6TAeIlNSUgfHP0AiGPVG9I3Ljt8YGXhXHtFc?=
 =?us-ascii?Q?B/fULrEwAPOwDR3LQjCApkdW4quRjj/Y2kjLoSWvmfrlKNflzrpCapjUIemk?=
 =?us-ascii?Q?GTTU4CgONjmDHBA7tX/meCX/sus4mcySGC4r1kheA74Fhz1z0Q/Gfm9mZ3gM?=
 =?us-ascii?Q?jydcY3mnZqXlK6SmbvMmcJoq7YihqEv1G09JTGN3HUaP6m4XkFwGWknI/hY1?=
 =?us-ascii?Q?jmLaNa3BlQq7HuuHHzchbksPJ1q5xKtTk4ehBaN5JgaovxMkvMdCJPGc+VD1?=
 =?us-ascii?Q?qVeW8N/B/QQRj6WZL0J7vMXER1e7B7xpjcAcFv5kn4avWGoJpkRsK0eXS/Sg?=
 =?us-ascii?Q?R+M9FhaDEcRxMRgh1b3e3Fl1sKr7G18GeDJhFhkO38GXQFxmJZvB9R7aAwal?=
 =?us-ascii?Q?AqwcuDou7193Mf3wRUFFFn9DfXVEuzttDLWwY8qZauEaf+RkuiYU0Nyypqdo?=
 =?us-ascii?Q?5YU066xjBOhvRpo6XB8HPszBqGrabqwHz+v59Y90itQ4fXCMi19u0zl9N1d1?=
 =?us-ascii?Q?uneRaQj62gs8wCUC8i10RhhLnNi5k/N7jOZsw/+RdUOVzt8xVtunAuVRa+BW?=
 =?us-ascii?Q?enwnLbqEjexWTfR/8Lsv1s8R7kHBvZeUWOEzBKDnb5+Rv3Ef05q90gULK9p6?=
 =?us-ascii?Q?3mHU2YJ2qrEY6EGt552PaZQmFWV1Nzu3tr5A4YQe8/8jyrXTXQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?O5c4rIq+IwXVfUfBH8+eTFOT4/sJl9gtARmVw2esGtU1/p/L/+bTGvhXM7tb?=
 =?us-ascii?Q?hQvNB2OIb3xpn/cW/OB/+C7E93MqdMicdWs27IX3+s8NwMRqRQKZuGx+xXCs?=
 =?us-ascii?Q?s0ZxdpaqQZ3d3DcAmdj5MWb91UWTzsbONRJiEKppU53S8/fZjsBlAZODJnz9?=
 =?us-ascii?Q?HJXXjFhkuM1Nws0UAk+djRNCsSracLNRPaXHh+6Bp3A5yrxhQX/UyuhOAlzq?=
 =?us-ascii?Q?2xLG4IFP17T0BjlCCdokcP2ilinQxvEVJsiQNn+mszVYf/62d60ab6i4PaaL?=
 =?us-ascii?Q?m6n4oCDIn7/JPYTmsVy30ZabA2qL5ZYkYiiv2+jnxatg9dfTsbYQaMo0/JOy?=
 =?us-ascii?Q?ytDgYawfORwKyEI92DLFPpjbHAw6WnShx1TUPNE1hMFrxcFnEMujs4ALoHaJ?=
 =?us-ascii?Q?1AUiOx8jnyK1LUjTuFsVFAqzpjkTk2zsGSOzrcW20oCIUGj/4SDsOj4604Fy?=
 =?us-ascii?Q?EtPXGhsVfq7zWM9VgSgE72ywsOn0TUN4fnlcI2Dl6PPoKig3yJB3UxXz24q5?=
 =?us-ascii?Q?hoBHWiC1ZM1fRYjHI5JpopRIbBSGPQmBAo2/xvteO9Yr30k/wsfMsxpdRfH2?=
 =?us-ascii?Q?ubtc1+C3FDvbNd9cj2J+PmdyJCh5IkZpRpDFddeRl++2zDD8ZeVUW32OdhaA?=
 =?us-ascii?Q?kL1eeENJFT2POO7X885rwsjvof6HTlbxjlgTbc0gJ/x72FyF/1P0IvCWe+7M?=
 =?us-ascii?Q?8C0qiExoLHBckOxtIjozqDbe1TMPjWZvylRRsxpX3WqBKktXpUD0upZBz7mH?=
 =?us-ascii?Q?ijfsKTdR9B86IvQBSsR1yURzomyd3lmN5L09O+B45LfX2ZmfkVJi+nGaoTaP?=
 =?us-ascii?Q?WZnJxv7St6UzwTvC6kMkmdBDIk7WyGgERRq3BZuyTQ7mXCAjjAiOLKR+kBjz?=
 =?us-ascii?Q?RpZ5FJu34lWxDHrepUs2jWqyY6K/tRsH0DIrxDfr+YORQyZqWZ13kq+btjHZ?=
 =?us-ascii?Q?YZDYor3pcyzzaSi+UIMs5iF5e3RnAswaiWVQQ/Shbp5CcvzjFYVpt+5FG6pV?=
 =?us-ascii?Q?FbCA8KMCadeLQp16MNcHN7fjvW+VnXpAKa06Iv1vIwlaTMLuP23m+8RTm7gI?=
 =?us-ascii?Q?ohS9/dFdUoWydNIKH1vgULdBMTXVZ7+njzfPAFeqMjU7De8pV07AAlvxXG6+?=
 =?us-ascii?Q?7nkyo+qGdmcmoHuWn2Is8ZDlbJbYmg8pBWEabAWB8D2hTWRMwFOYJx4GBD25?=
 =?us-ascii?Q?Djq0LTy6kNh6B9ZqDH+Opl/KSf71CflPtKBNjCA0+kwzuZ8/2xM6xC9pQpgR?=
 =?us-ascii?Q?PCfl+JYoDMDJ1t3sJ5V/oCR8cx/xugevcdXSOvfWyFAtNdDAMXRmbnVtnpjz?=
 =?us-ascii?Q?vrcVuI2S3O6NMIzsewk2AdD87r6Ovl7H+Tx/NLWIem40h9Ntn/zAI1DtW8CX?=
 =?us-ascii?Q?EXz1Jt3mDJmRbuNn0yJwi0s6pcUW2dNhTJRlFvqDVdIcftiLh31fEVMaQyYW?=
 =?us-ascii?Q?JSaWmJl1vduG1Xo1qRt9UTiSxaFqvLhIhgunxayV3AwoG8twHcWsbWo8IOlI?=
 =?us-ascii?Q?oxVmJOa199Fkix30UQwe2OF/1MqLOpBGT8GSTC5x5km25hWtPXpqS8+xCpkT?=
 =?us-ascii?Q?nathidPdmAQLLLuiwcR2jGZvXMtsQh4pqstE6tf2weRF0vG0bu2r+kBN9dQD?=
 =?us-ascii?Q?7w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f37f4e87-fdbd-410a-4d29-08dcb063ce0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2024 06:49:48.4974 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Tr9CNiH7x3z0kMUh/iFj3iqLtwUlEwchD+1qMP/vyf2UmH5j9i8Y51sklzMGTuySML2o09dgmFzebjH8xwBW24HUYCokSCVtdv0VsL7+jCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
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

LGTM,
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w
> Brost
> Sent: Saturday, July 20, 2024 1:16 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [PATCH v2 1/2] tests/intel/xe_vm: Add bind array conflict tests
>=20
> Add bind array conflict tests which modify the same address space within
> 1 bind array. Not a use case but stresses the driver logic. Also add an e=
rror
> injection section which tests error of bind IOCTL.
>=20
> v2:
>  - Use do_ioctl_err (Matthew Auld)
>  - Move xe_vm_bind_array_err to xe_vm.c
> v3:
>  - Fix sign of error usage
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  tests/intel/xe_vm.c | 281
> ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 281 insertions(+)
>=20
> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c index
> d507e7cb16..a5f25acc7e 100644
> --- a/tests/intel/xe_vm.c
> +++ b/tests/intel/xe_vm.c
> @@ -850,6 +850,24 @@ test_bind_execqueues_independent(int fd, struct
> drm_xe_engine_class_instance *ec
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +static void xe_vm_bind_array_err(int fd, uint32_t vm, uint32_t exec_queu=
e,
> +				 struct drm_xe_vm_bind_op *bind_ops,
> +				 uint32_t num_bind, struct drm_xe_sync *sync,
> +				 uint32_t num_syncs, int err)
> +{
> +	struct drm_xe_vm_bind bind =3D {
> +		.vm_id =3D vm,
> +		.num_binds =3D num_bind,
> +		.vector_of_binds =3D (uintptr_t)bind_ops,
> +		.num_syncs =3D num_syncs,
> +		.syncs =3D (uintptr_t)sync,
> +		.exec_queue_id =3D exec_queue,
> +	};
> +
> +	igt_assert(num_bind > 1);
> +	do_ioctl_err(fd, DRM_IOCTL_XE_VM_BIND, &bind, err); }
> +
>  #define BIND_ARRAY_BIND_EXEC_QUEUE_FLAG	(0x1 << 0)
>=20
>=20
> @@ -992,6 +1010,257 @@ test_bind_array(int fd, struct
> drm_xe_engine_class_instance *eci, int n_execs,
>  	xe_vm_destroy(fd, vm);
>  }
>=20
> +/**
> + * SUBTEST: bind-array-conflict
> + * Description: Test bind array with conflicting address
> + * Functionality: bind exec_queues and page table updates
> + * Test category: functionality test
> + *
> + * SUBTEST: bind-no-array-conflict
> + * Description: Test binding with conflicting address
> + * Functionality: bind and page table updates
> + * Test category: functionality test
> + *
> + * SUBTEST: bind-array-conflict-error-inject
> + * Description: Test bind array with conflicting address plus error
> +injection
> + * Functionality: bind exec_queues and page table updates error paths
> + * Test category: functionality test
> + */
> +static void
> +test_bind_array_conflict(int fd, struct drm_xe_engine_class_instance *ec=
i,
> +			 bool no_array, bool error_inject)
> +{
> +	uint32_t vm;
> +	uint64_t addr =3D 0x1a00000;
> +	struct drm_xe_sync sync[2] =3D {
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> +		{ .type =3D DRM_XE_SYNC_TYPE_SYNCOBJ, .flags =3D
> DRM_XE_SYNC_FLAG_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.syncs =3D to_user_pointer(sync),
> +	};
> +	uint32_t exec_queue;
> +#define BIND_ARRAY_CONFLICT_NUM_BINDS	4
> +	struct drm_xe_vm_bind_op
> bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS] =3D { };
> +#define ONE_MB	0x100000
> +	size_t bo_size =3D 8 * ONE_MB;
> +	uint32_t bo =3D 0, bo2 =3D 0;
> +	void *map, *map2 =3D NULL;
> +	struct {
> +		uint32_t batch[16];
> +		uint64_t pad;
> +		uint32_t data;
> +	} *data =3D NULL;
> +	const struct binds {
> +		uint64_t size;
> +		uint64_t offset;
> +		uint32_t op;
> +	} bind_args[] =3D {
> +		{ ONE_MB, 0, DRM_XE_VM_BIND_OP_MAP },
> +		{ 2 * ONE_MB, ONE_MB, DRM_XE_VM_BIND_OP_MAP },
> +		{ 3 * ONE_MB, 3 * ONE_MB, DRM_XE_VM_BIND_OP_MAP },
> +		{ 4 * ONE_MB, ONE_MB, DRM_XE_VM_BIND_OP_UNMAP },
> +	};
> +	const struct execs {
> +		uint64_t offset;
> +	} exec_args[] =3D {
> +		{ 0 },
> +		{ ONE_MB / 2 },
> +		{ ONE_MB / 4 },
> +		{ 5 * ONE_MB },
> +	};
> +	int i, b, n_execs =3D 4;
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +
> +	bo =3D xe_bo_create(fd, vm, bo_size,
> +			  vram_if_possible(fd, eci->gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	map =3D xe_bo_map(fd, bo, bo_size);
> +
> +	exec_queue =3D xe_exec_queue_create(fd, vm, eci, 0);
> +
> +	/* Map some memory that will be over written */
> +	if (error_inject) {
> +		bo2 =3D xe_bo_create(fd, vm, bo_size,
> +				   vram_if_possible(fd, eci->gt_id),
> +
> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +		map2 =3D xe_bo_map(fd, bo2, bo_size);
> +
> +		i =3D 0;
> +		sync[0].handle =3D syncobj_create(fd, 0);
> +		xe_vm_bind_async(fd, vm, 0, bo2, bind_args[i].offset,
> +				 addr + bind_args[i].offset, bind_args[i].size,
> +				 sync, 1);
> +		{
> +			uint64_t batch_offset =3D (char *)&data[i].batch - (char
> *)data;
> +			uint64_t batch_addr =3D addr + exec_args[i].offset +
> batch_offset;
> +			uint64_t sdi_offset =3D (char *)&data[i].data - (char
> *)data;
> +			uint64_t sdi_addr =3D addr + exec_args[i].offset +
> sdi_offset;
> +			data =3D map2 + exec_args[i].offset;
> +
> +			b =3D 0;
> +			data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +			data[i].batch[b++] =3D sdi_addr;
> +			data[i].batch[b++] =3D sdi_addr >> 32;
> +			data[i].batch[b++] =3D 0xc0ffee;
> +			data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +			igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +
> +			sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +			sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +			sync[1].handle =3D syncobj_create(fd, 0);
> +			exec.num_syncs =3D 2;
> +
> +			exec.exec_queue_id =3D exec_queue;
> +			exec.address =3D batch_addr;
> +			xe_exec(fd, &exec);
> +		}
> +
> +		igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0,
> NULL));
> +		igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0,
> NULL));
> +
> +		syncobj_reset(fd, &sync[0].handle, 1);
> +		syncobj_destroy(fd, sync[1].handle);
> +
> +		data =3D map2 + exec_args[i].offset;
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +	}
> +
> +	if (no_array) {
> +		sync[0].handle =3D syncobj_create(fd, 0);
> +		for (i =3D 0; i < BIND_ARRAY_CONFLICT_NUM_BINDS; ++i) {
> +			if (bind_args[i].op =3D=3D DRM_XE_VM_BIND_OP_MAP)
> +				xe_vm_bind_async(fd, vm, 0, bo,
> +						 bind_args[i].offset,
> +						 addr + bind_args[i].offset,
> +						 bind_args[i].size,
> +						 sync, 1);
> +			else
> +				xe_vm_unbind_async(fd, vm, 0,
> +						   bind_args[i].offset,
> +						   addr + bind_args[i].offset,
> +						   bind_args[i].size,
> +						   sync, 1);
> +		}
> +	} else {
> +		for (i =3D 0; i < BIND_ARRAY_CONFLICT_NUM_BINDS; ++i) {
> +			bind_ops[i].obj =3D bind_args[i].op =3D=3D
> DRM_XE_VM_BIND_OP_MAP ?
> +				bo : 0;
> +			bind_ops[i].obj_offset =3D bind_args[i].offset;
> +			bind_ops[i].range =3D bind_args[i].size;
> +			bind_ops[i].addr =3D addr + bind_args[i].offset;
> +			bind_ops[i].op =3D bind_args[i].op;
> +			bind_ops[i].flags =3D 0;
> +			bind_ops[i].prefetch_mem_region_instance =3D 0;
> +			bind_ops[i].pat_index =3D intel_get_pat_idx_wb(fd);
> +			bind_ops[i].reserved[0] =3D 0;
> +			bind_ops[i].reserved[1] =3D 0;
> +		}
> +
> +		if (error_inject) {
> +			sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS -
> 1].flags |=3D
> +				0x1 << 31;
> +			xe_vm_bind_array_err(fd, vm, 0, bind_ops,
> +
> BIND_ARRAY_CONFLICT_NUM_BINDS,
> +					     sync, 1, ENOSPC);
> +			bind_ops[BIND_ARRAY_CONFLICT_NUM_BINDS -
> 1].flags &=3D
> +				~(0x1 << 31);
> +
> +			/* Verify existing mappings still works */
> +			i =3D 1;
> +			{
> +				uint64_t batch_offset =3D (char *)&data[i].batch -
> (char *)data;
> +				uint64_t batch_addr =3D addr +
> exec_args[i].offset + batch_offset;
> +				uint64_t sdi_offset =3D (char *)&data[i].data -
> (char *)data;
> +				uint64_t sdi_addr =3D addr + exec_args[i].offset +
> sdi_offset;
> +				data =3D map2 + exec_args[i].offset;
> +
> +				b =3D 0;
> +				data[i].batch[b++] =3D
> MI_STORE_DWORD_IMM_GEN4;
> +				data[i].batch[b++] =3D sdi_addr;
> +				data[i].batch[b++] =3D sdi_addr >> 32;
> +				data[i].batch[b++] =3D 0xc0ffee;
> +				data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +				igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +
> +				sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +				sync[1].handle =3D syncobj_create(fd, 0);
> +				exec.num_syncs =3D 2;
> +
> +				exec.exec_queue_id =3D exec_queue;
> +				exec.address =3D batch_addr;
> +				xe_exec(fd, &exec);
> +			}
> +
> +			igt_assert(syncobj_wait(fd, &sync[0].handle, 1,
> INT64_MAX, 0, NULL));
> +			igt_assert(syncobj_wait(fd, &sync[1].handle, 1,
> INT64_MAX, 0,
> +NULL));
> +
> +			syncobj_destroy(fd, sync[0].handle);
> +			syncobj_destroy(fd, sync[1].handle);
> +
> +			data =3D map2 + exec_args[i].offset;
> +			igt_assert_eq(data[i].data, 0xc0ffee);
> +			sync[0].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +		}
> +		sync[0].handle =3D syncobj_create(fd, 0);
> +		xe_vm_bind_array(fd, vm, 0, bind_ops,
> +				 BIND_ARRAY_CONFLICT_NUM_BINDS, sync,
> 1);
> +	}
> +
> +	for (i =3D 0; i < n_execs; i++) {
> +		uint64_t batch_offset =3D (char *)&data[i].batch - (char *)data;
> +		uint64_t batch_addr =3D addr + exec_args[i].offset +
> batch_offset;
> +		uint64_t sdi_offset =3D (char *)&data[i].data - (char *)data;
> +		uint64_t sdi_addr =3D addr + exec_args[i].offset + sdi_offset;
> +		data =3D map + exec_args[i].offset;
> +
> +		b =3D 0;
> +		data[i].batch[b++] =3D MI_STORE_DWORD_IMM_GEN4;
> +		data[i].batch[b++] =3D sdi_addr;
> +		data[i].batch[b++] =3D sdi_addr >> 32;
> +		data[i].batch[b++] =3D 0xc0ffee;
> +		data[i].batch[b++] =3D MI_BATCH_BUFFER_END;
> +		igt_assert(b <=3D ARRAY_SIZE(data[i].batch));
> +
> +		sync[0].flags &=3D ~DRM_XE_SYNC_FLAG_SIGNAL;
> +		sync[1].flags |=3D DRM_XE_SYNC_FLAG_SIGNAL;
> +		if (i =3D=3D n_execs - 1) {
> +			sync[1].handle =3D syncobj_create(fd, 0);
> +			exec.num_syncs =3D 2;
> +		} else {
> +			exec.num_syncs =3D 1;
> +		}
> +
> +		exec.exec_queue_id =3D exec_queue;
> +		exec.address =3D batch_addr;
> +		xe_exec(fd, &exec);
> +	}
> +
> +	igt_assert(syncobj_wait(fd, &sync[0].handle, 1, INT64_MAX, 0, NULL));
> +	igt_assert(syncobj_wait(fd, &sync[1].handle, 1, INT64_MAX, 0, NULL));
> +
> +	for (i =3D 0; i < n_execs; i++) {
> +		data =3D map + exec_args[i].offset;
> +		igt_assert_eq(data[i].data, 0xc0ffee);
> +	}
> +
> +	syncobj_destroy(fd, sync[0].handle);
> +	syncobj_destroy(fd, sync[1].handle);
> +	xe_exec_queue_destroy(fd, exec_queue);
> +
> +	munmap(map, bo_size);
> +	if (map2)
> +		munmap(map, bo_size);
> +	gem_close(fd, bo);
> +	if (bo2)
> +		gem_close(fd, bo2);
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +
>  #define LARGE_BIND_FLAG_MISALIGNED	(0x1 << 0)
>  #define LARGE_BIND_FLAG_SPLIT		(0x1 << 1)
>  #define LARGE_BIND_FLAG_USERPTR		(0x1 << 2)
> @@ -2144,6 +2413,18 @@ igt_main
>  			test_bind_array(fd, hwe, 16,
>=20
> 	BIND_ARRAY_BIND_EXEC_QUEUE_FLAG);
>=20
> +	igt_subtest("bind-array-conflict")
> +		xe_for_each_engine(fd, hwe)
> +			test_bind_array_conflict(fd, hwe, false, false);
> +
> +	igt_subtest("bind-no-array-conflict")
> +		xe_for_each_engine(fd, hwe)
> +			test_bind_array_conflict(fd, hwe, true, false);
> +
> +	igt_subtest("bind-array-conflict-error-inject")
> +		xe_for_each_engine(fd, hwe)
> +			test_bind_array_conflict(fd, hwe, false, true);
> +
>  	for (bind_size =3D 0x1ull << 21; bind_size <=3D 0x1ull << 31;
>  	     bind_size =3D bind_size << 1) {
>  		igt_subtest_f("large-binds-%lld",
> --
> 2.34.1

