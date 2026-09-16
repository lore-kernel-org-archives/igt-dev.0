Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C49C88E77
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 11:42:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B73310E170;
	Wed, 16 Sep 2026 11:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BpAAGzUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C037F10E170
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 11:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789558910; x=1821094910;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=b7+1fAovmRIAdUGjq9sGe6UqtQTu1/vrCNVqqg71Nko=;
 b=BpAAGzUMIaHLY8iLOJU7LYqo7/BggYP8qluciCkkXn0TvmLcTP6c6rOs
 grcxh3oAFVWxYW/2SEBPR+qR0q8byxED99j3PgczS+5n0S4ro8jMU6Pt9
 U8FpPs0j9yfXRQrEV/6msezHhWJZQso9D8qqGM+fz3+f7T3XpEAk4gvKk
 kkhVD3h8ilB3+a2/Y0dtlLVl4ApsUlIjdJcKUBUS8JfTMU2WrULrPc/+8
 o858AlNyf4kd65auaD9nJwx49rbaxakrHSMlq26ABfcWZo9IB3v5DT5/R
 vSm3a01EN8ysSFjLzLabMFx+pAa1aefzWRA2+htWYOf3M2g0Iomzis2Ik A==;
X-CSE-ConnectionGUID: TJtVhK42RlevpdNFlY8LzQ==
X-CSE-MsgGUID: hM6BWLHxQI6dT5YZ06QwNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89956369"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89956369"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:41:50 -0700
X-CSE-ConnectionGUID: BmsKDcVdSySDyod1EzYgnQ==
X-CSE-MsgGUID: EdhekulWTv27UJRIUOv9kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1539527"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 04:41:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:41:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 04:41:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 04:41:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JcAozE7ZCJcmHVwfiYtlQtw28wWUttYfMcqvvHBIgAYVp40gNLRrEGxWCtTbVOOrNEsTrBbl7x6sExWWRiM2RiFUl5aek/nGtcSxOvk0U6ssj2ODz9n8xExYKeSkInKbH6yDzrpLg8KgnelT2AVdwQ0r7nkgnn4yOjIaZwcne/IFYVOuxr3XKvJWibiUqTvQXbkIYAxD6116PDBMEWLCxE28JS5mQIsofY32TRC8Tz8AG5Sc7unlLFpW3gmtaHaf184R2J+ex+97lNsO7C47TQq8YyWouUowhAJmZVg8IyF2Q7V+mKrouSS0yYasJU/r2VkB5oNgolcixShDhbXiew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stKyDDMXA/Ux7XdilPYzChsTgB1wUBZEhzCDq0IauN8=;
 b=YpGauXFkdHJLLfclTcmXruKEOE4gzJLvtAViUTCEN9vT2r3XqbFjMBn9jqtxF+4m1NweMT9L4s0MCiEFU/J5C3gtMi+69RqrEAx0zJYG39eZKCWDhbZg0/G2ltxwohDm7Rcku+fZX73fkvhxKGSDIVeGHpQZP/XCwMw4hESRAJ95BykrgfxXATasb4XcF5XhLECr9tbp1H+BKr/0E6ScmpKLCi78t5EkDpYFeQ357eygZGDc0HVcrt0syIyiovmEKJYls9F+ekpUhYNYwv9iyabUeJHBKtZiPbOL1aLnt7EuONfsZ76WimdrXvD9ijzjsuvZSyUUgVmehi0owRE43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 11:41:41 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 11:41:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 16 Sep 2026 13:41:37 +0200
Message-ID: <DLGPOO17FPWA.1EBISH5KQLX7A@intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Petri Latvala
 <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v2 0/3] Bump debian version to bookworm
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.22.0
References: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260916111902.73626-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: AS9PR06CA0539.eurprd06.prod.outlook.com
 (2603:10a6:20b:49d::28) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|SA3PR11MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: a5a266b9-41c5-48a0-f890-08df13e77a00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Ov1DMyGvbqwFV1JjgiL6RzWvH4aXQE5LxSMOMEk9EUMLhhUi32hLvdvaQZ4ycAsWLms8io9ED9Jy00VMAzFS14zRjz5M6+XvGNXnd4OQ8qD58+dt64+uo80uDRKWfRfe7KhUKamErZMBrYyndArjq4OZbw+VkxDl9Btt7oEQljypE1KUvTWq2BCcQBYv+pdO10E8nVQ8rZyRoefsQzhKdhI62zijtbG5sMhNVGooRUNAAsGQuzAClADifxWLVbcFA+J973m/lEzsRATCX44OIjHIAG2wXK5HUBHdwwO1Iust5j+oa0xs5xLyyKoLP6yR4gFtw10Ivm5wjbHPH9awgtmDJh36Ndp6N2s1GYUVZ1L0F1jcT9HOmiURdxg/JW3xfsjq6ok9eod20RQXaavDIu6oGyArbqJ8NpQc1XsuNwmue+LvYC72Ygk5C2WKYYHZH5TlISLCK0NP9X10Cv96E3o9i+q1tZx6G+tyrTj3Ygh0lHlwF8dTvS5vbSzW5SliJc8Twc0GbOivRdAmr9kynMwCFO09iVGj6IqxUhFQoyeaS3sE7OfNSlDxXNgX+PMx2gTgck3xNSHclr6xHilvPj52X4S97juQUitgbkfLGAdUMWi+mE8QUp2rK9xlI3RolbOczjkvLaImYZ6W8ow+Xg9qqC2r/+1Yru/eAoRBjfs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REdTRGtSQzdDb2piUUF1TVIzaHdpRXJ5c1RDZUxFYUwwUFJ2Q2x3NFcyWm54?=
 =?utf-8?B?SVQyQ01VMVJEVWJOb1F5U0xhVmZWSkJyZ1BiOEdYb2c4Njk5Y0w4SUh6OHZZ?=
 =?utf-8?B?RUd6QXBMRkViTi9mSjZEL1lQdWd4TUE1YXJMa1kwSzh2bHAxY241ejc0Wity?=
 =?utf-8?B?OFVpQjRYb3RDaDhRbEVaN1h0M0IyYzhFSk9MQ1V0Wk4wU0xteWZCMjlqRFY5?=
 =?utf-8?B?WTRSanQySjBHNThOYmhzeUNmTzZ0QXBYcXlrK2drV3ZkUUlsY1dNMjN5d1E3?=
 =?utf-8?B?Uy9sRVhwOGJ1b1U2LzNVWkd3cHN0WTBmNHUwT0RjL2xWbTJaSzdBNGU0ZnFX?=
 =?utf-8?B?VmRkeEtHZWkvdzNFOHZCNjl6d1MxU2Z5MCtqOWNxcmtMV1RoWE9xdEgwUFFH?=
 =?utf-8?B?ZklHRFJpVVQwNVVSZ1piVTdhVVBHUGJpRFNOejVNczNrcUdKYkE5WGdQdjFX?=
 =?utf-8?B?dDBMbjhsOTVpNDI5cG1jcWliVjVXRUhxMU11eVpLdHhKcmtjOG9heGEyRGxJ?=
 =?utf-8?B?bWVuYVNoWmtPNUl1OFVpclQ5ODROU3VObUl2aGJPczF4YW4yeXMrQnhFRjRT?=
 =?utf-8?B?bVB6K0NEM3ZlOFVSemhZMFk3NlFLTjJNZXVJTS83SXhMaUJ3d1dzT1lERU5T?=
 =?utf-8?B?azByK0g5OUlWNjhCUTJmcENSM3FGemRxNE9vMGp2NmY5RkcrZ2VueFBvWjVt?=
 =?utf-8?B?Y3hZcmp6VEFQdi92UmF4dkVSVkYyYWg1eitmZzhsWDVFQjlvYWNWa29xcVdy?=
 =?utf-8?B?RGpsQlo4L0FhVmZWZ2RDdDRpKytVZjJzN0FKTDU4QTRJVysyYXpVazZCcERr?=
 =?utf-8?B?VDhwY0J5dzZGOWd4R0MyWGRKYUZZL3ppZzdMbWtCTGtpUUxyMnhqelNDcVBt?=
 =?utf-8?B?L2djYzJabjZtd3NtRk5SWkJDNHcvUVlCZHRDYXExQjRQcG1Rb3RCRjFEZ1ZC?=
 =?utf-8?B?Tm0rSXozNnI2Z3JZYm5vWkN1ckY3UTdUTDFwMFJKTmUzMmlBc2J6MmlqSnJv?=
 =?utf-8?B?RXlXczN3Z0tFVVVNMDBtYXVhL2RMUDRvUVViYk9pWnVLSmFGU3UwY1RLQkdO?=
 =?utf-8?B?eXNIYTBJQXNJalhWRDZ6NGpETVdjL0UzL3lzZURXWDQrOVRJWVZGSUdtQWJ3?=
 =?utf-8?B?K3BMS0h4Y0hobEJmS3B2MjRYQlcyNURkdjV2K1ZmeXpqQ2dONlFleC8zM0pu?=
 =?utf-8?B?WlQyTng1d3FDeERIdmMvSnNaWDZzTTA0eFB4TVdMTWhzKzVBMUlpZ3kyMlk0?=
 =?utf-8?B?aERjMUp6bVdtUjg4OUJFNDlPdm92cFN1ZGF2VGloLzFEV3VUU2hsdXA0Y1pv?=
 =?utf-8?B?YlZ5ME94UksxcFhyR0VqakVoOE01LzRjZnVzYkhHVUtiMnR0MkpSOVNoMkpY?=
 =?utf-8?B?U2NOK0RhU1lSbEFjaFlwVlllRjhaMjdZVmx3QWZ3bmJZUEdtYWd1M0NMYTRm?=
 =?utf-8?B?dE1FM2VxTjVnTVpvT3I2VE1NcTFLY3NEZVF0d2l0QjhIam1vUXVMSGZmZnBz?=
 =?utf-8?B?YnJWd0wrRkFmaEErSnJxUlFOOWFxWWg4eTl6MDBPNjVGeTY0TXp5LzJ1S0RG?=
 =?utf-8?B?Rm5jYnFlczJLSFU0UU1wMmVsRnRQcjNRVHZ5bXRMbEhteCtvdkNZSzk3a01p?=
 =?utf-8?B?TmpzU1NyRGg2YXRMQ1hHRlAzYUppa0lNcG9qQTMya1JweFdEbUVtY0E5R2Nh?=
 =?utf-8?B?ZVdQSFhFcmVOUTYvdVZ6OW5UcG5CVmFQRkVXZXE1SFM4NmhJcndoWC9mRVBz?=
 =?utf-8?B?aTBUVUQzTHduQVJ3Y2pzcWszckNVKzZ2VlZSdk5SKzI0MmFmTDR1dVp2VENL?=
 =?utf-8?B?WnZjKzZKWThpd2s3MUlwaHRzNDlXUUd2QVpLZ2dhaFpRS2Z3SkxwYVNtQ2dM?=
 =?utf-8?B?Mmx0UStRM0k4SjBDdS9xc2NRV21HaDArOEE2dVBmc3hPRE42emMvZlJucmt1?=
 =?utf-8?B?OGZqSE93TUJGc0IwbzluUm92aDVEOElKYUd6MmlVeTVhcVJENW0wanBySGpE?=
 =?utf-8?B?NGl6bjdnemJSS3RzYzlnV3c4QkJTRnd6NmJtaDhVQk9Ddm1TelBNK0pGNmt4?=
 =?utf-8?B?cUZFc1Q1elg0VDNRZ0hIK1NYcno5eU10VWZ5SytOdDBNYkZ5ZFpvZkwyeTZ0?=
 =?utf-8?B?VkUwckMzRzNpU1kvUExBdUtQTmVlaG4yN1V1QUdHUW5RZitoUGFNTXd6UVI4?=
 =?utf-8?B?dG5rRFMySG9GS2pEVEVnSFlwc1J5dDc1UlpSVkFLRDdkbjFiLzI5NDFsMUQy?=
 =?utf-8?B?aENTdFlLdnNNRnJsdjZEajgzbk1WbCtvQ1dmM3VBem0zaU1WUG0vanUxZzlQ?=
 =?utf-8?B?YmIxbGJIS0NPTmdvU3VnbUlzMTJtWmloelpLV3F5UUJmRVNxOHdBb1hZZGEx?=
 =?utf-8?Q?HkpNHsjmsJNiS5sI=3D?=
X-Exchange-RoutingPolicyChecked: 4Mac/lTW4RDHgRn3I4+NbHH+fj3N+iYKKCw5r6xvIudwVUbPnHR49mpk0CvgkGp8NW3r74ZNIfMfWwI61c1r/KHJTkPPiLWR2XPsFkkV+pf+eerlNKmaKX1u1fx1rzFW9cR5GVnzfcDwHKUWx3AlGrUXPBL3rX4Uu8PS7F5HS7MsXRdWUgd8RYIL505xHTEtSSAfarzFgyp35lHm6Ez1Fuq9+TSNMTdetlBeHbNcYlXT1DSitxAxa0yZqrxYinrgFt/t1WtrquMUuTG0/yX669Kn1c+3GG0ntkAs0MMWhLHI9aHMbOnA0ZQp7rg5oYKVKtIXmqcF6XD3xWgJ2Pmigw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a266b9-41c5-48a0-f890-08df13e77a00
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 11:41:41.7407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwt98L356od0EUodOg1FlOuUuJywf+NUcrue7++BPnDF6KavfJE/80GaS0GOYyaAo2Od2c8lvN/K1c8h+o/gSwevwT67hLHNWGzLnOJpldg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
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

Hi Kamil,

On Wed Sep 16, 2026 at 1:18 PM CEST, Kamil Konieczny wrote:
> Bullseye is EOL so bump up debian to bookworm. This is needed
> when a rebuild of debian containers is done, which is the case
> for a fix.
> Removing also libproc/libproc2 packages, as /proc parsing was
> implemented recently in igt_aux lib.
>
> v2: removing libproc (Andrzej)
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
>
> Kamil Konieczny (3):
>   Dockerfile: remove libproc packages
>   Dockerfile: bump debian version
>   gitlab-ci: Fix computing sum for debian image
All 3 patches looks good to me.
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

