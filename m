Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49420D2C11B
	for <igt-dev@archiver.kernel.org>; Tue,  5 Nov 2024 14:58:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FDC10E5C9;
	Tue,  5 Nov 2024 14:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+zTR6Mn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5976910E5C9
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Nov 2024 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730818691; x=1762354691;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=W3kbmQfAt+wNDz98FpXSxlnvuDf+uZyt/4rksVoShIg=;
 b=f+zTR6MngyHdMgkbn5J1ltQPibet4KPQxs3RLQmA6iRE1m41VF3RkZNg
 bFUFIQt3zN+oh5jWvDaiGVVfW+ftnRP0UHabd+eF1wwXOLrcxksDLkRc6
 cWOjfnbUB+HK6yrutnykXC/abU96xZdQTicb/yAKBgLxmdT0kUTU1TOLk
 gg6uu3TDzQdMFu+fUvIVN9N6n+qKoeRRaXL7KBBXw4SSnFbY4SvO3rkKm
 j9Z6cnu/a7B8n95U5RBe6hJx+P+FAO8tVJPx6fBXPkIo8bwZP3p0RXgK/
 3bk0b6lYgOgo0ICG7OPMN6+3JFrlPS8z1+yHRFCULMAOctOecOGQRtFHU w==;
X-CSE-ConnectionGUID: SWaP2jfyRECwZ316skXIng==
X-CSE-MsgGUID: siTNfENKSEO9m/qrYj1Ang==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30685640"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="30685640"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 06:58:11 -0800
X-CSE-ConnectionGUID: vxWlGQDsRHWnwVq8B6d23A==
X-CSE-MsgGUID: viFHcfUHTde0KeDgCVspKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; d="scan'208";a="83933861"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 06:58:10 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 06:58:09 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 06:58:09 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 06:58:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpG6kNmuJhiUatJcmgDp8R6PrnGZkZH2mFeBIYKZSCFRaFNKoT00cRZ5kKNlFHOHgg7/0MZXuRuNWOFbqPJNIivC3hI3jafo0PG9AliW4WRk1oKiaSOkJhV4u8vcDDoElwhsRLJoYYhL6fyhHbjrJ4nYPPqtbdkqdYFBxEZxu69mB4kZvai1n2JyScCU5dNzr3XAGhSu7iSPu2gJ6T9uTR1Q/UkElvRPxp/p2/7NTzGsMNoAOWYuahb+EDcZb/UB9oomuBh4MDiYYASV2fa9xAYHVs/7szKrvt3h5ou0K3ua4+CXqu8j0qaDjZsbhwJvJqV+7GZkU5buQD56kYoSFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBOL8V1aweyIFRE7+yyE2Ra6Y/ljKHVz0Y3OP2fvZh8=;
 b=BWXtXYYpC3i+hnroBSNhgXvQvKuZqylSfYvI/KqnSd7g7P/x9apM9tOrODd0cGh00mHd6Z9Gj4VisAZZCiTZkOC+s+I5f74eZkY/hqDEyv6Nx/nAyOQPW7iYzJWJh1rDHeCOfmBUOL/P/ufB+s3iClArTVqjEJ2qBZRmFTwDefnU14pyVgqYT4q+Vm2Y2qBB/wsJFnkF17AaqUNtDr7a1yPISKv+bgWIcXxQ6WHpTxcg+VB3Lnpir0tQzjXSY9+5CZ47TTGAmYyKJJDhYF+brKbSRCsYkhVc+G/xzQmfzN8ZZNlZGZ889I7C2c18fuC7yakSgDJHDeuN45wsqGi2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Tue, 5 Nov
 2024 14:58:07 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 14:58:06 +0000
Date: Tue, 5 Nov 2024 08:58:04 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/3] lib/igt_kmod: Stop handling _kunit suffix
Message-ID: <zjfjvp4krbqkac635t5t6wxz547lkxiagxnuayzzsckvprehlj@z4janee7isde>
References: <20241105055255.2466236-1-lucas.demarchi@intel.com>
 <20241105055255.2466236-3-lucas.demarchi@intel.com>
 <6684395.tM3a2QDmDi@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6684395.tM3a2QDmDi@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0272.namprd04.prod.outlook.com
 (2603:10b6:303:89::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB7829:EE_
X-MS-Office365-Filtering-Correlation-Id: 25e22224-c036-4c92-bc41-08dcfdaa419f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/a4XpR+xck/1OviOAOjDmw9qKuqwirSuGFEHXfOYG/E/nm9NRVZadCKmQUn9?=
 =?us-ascii?Q?0vcUFh6ZNDznNsn5OIThd/qD3nNOjJfgmjxywKuPZIrNqDXmxOUPvPZ77GLP?=
 =?us-ascii?Q?J4P5mZINcJfLj3oPsvPd4klyio2VpsT/5KrQt4rTnJZf6V0t/wWKQdJjWOzR?=
 =?us-ascii?Q?q63ELpHypAUxaXM8JA1PnXT9wT0CWxtSRjIJAyRBkLe01u7q3a0CFvLBZdIr?=
 =?us-ascii?Q?Uu/MIBNkEXISRUhcLEMN9neqbX4uoq5WArTrzfz04NGzH7K2oroe7lOt58aw?=
 =?us-ascii?Q?X3/TU/g5/k62th7TQ3TRxF6NmBH5YWy2JdXWhf1t8O78M6YjOO5bQ+Ztwp3P?=
 =?us-ascii?Q?e5/fOXCyVhjcAgwQ55n5XBXHA8H5mGuhPbNf9Htgf09Hpdlc6RTeS6bwIOMk?=
 =?us-ascii?Q?kWxH1xbXk7vtb67VxePtqlfxV9h1zJH4QkQA41BA+wVIP4l0EPWYqfrD9i9d?=
 =?us-ascii?Q?ZwzPUwqXxX9jdz4hVZOLcqRYvA2yj0pJ5rTtxfIH4cXMkRglPt7J069++Y1z?=
 =?us-ascii?Q?YgtUM+GOnr0QX695FHRxLZ2RRlGn6KUOg6xH55A9Zfyp2oLxJGiXopjnH/+J?=
 =?us-ascii?Q?Prg0ubjPz4vTCwVq3i1zwBFwR5zBkA3f5DsOSG81AM/k/LtNjfkARAbOc2nD?=
 =?us-ascii?Q?4LfBRfCMd/fdVaEqPZJBcu+7uiB74Ah5/gQv8C9+dKbAcFnIntFm5Ms7/mmg?=
 =?us-ascii?Q?FngoQ2RoKsfS9VuqhQKuUY0K+RkJvI00KgihU9rgTG4JBx3fXffQ8fHNyfGs?=
 =?us-ascii?Q?Bj6DL5Ef7MfJjR+o6K8bTOevojnus3nY+4c+Nysqy4c0VY0KLxnLcKZtuTuM?=
 =?us-ascii?Q?/lJw0h5/o67Bh32e7dvEnkSIuYakLMkkJ+dhHyluavmlAeEPLby9kobCgdE6?=
 =?us-ascii?Q?xsMJhy2d75O5tgyGMNsb5dykVBr/3UBuRpEfZjZO8NbLdBHVKkgZJCnMPmiK?=
 =?us-ascii?Q?8aaNajfK+A7OCWb1Ne4+EMZYqgKBZ+R7S9lr0828CsGsY2IyoO/rMYq9RnA7?=
 =?us-ascii?Q?lKbkchaULJimoQA5ih9+aRnjxq/RqzWx245JMlvBP+VZUJhMy5ZBF6wgUikh?=
 =?us-ascii?Q?N6xYf04xlNs7CDX4Do9Sw1vVLGMoKF4D5vKAQvRCPZdDN2BjG6ct89ZNZ5yM?=
 =?us-ascii?Q?Dm6bbvcULmvWBMtMMdLTgxLEuW4Yvdog5bsnxrjozAfWDLS4ZDDr4cgLKXnF?=
 =?us-ascii?Q?vhlThpfvy8+etZQnbUoZJ06cRI9CHpvRzrH2/bAYLeru3X+Wn5TwHyNmbntM?=
 =?us-ascii?Q?jFGZwE1G0XtnvJBJvU6G0wZOiugotIYXoj4+kBA4YOCHQ2cPcgzktR5CvYHZ?=
 =?us-ascii?Q?mKY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ETmlHsSV6DvtxKd0lck4HBucYbLY1ilvDDFNk1ShEdjhr2L1L0xRkVxXD75p?=
 =?us-ascii?Q?F7luqzI3BGsTPnFUy4WSeCiwlNEbTVMWH2GWFXjYLlvoXV2qFMVCpZ06kNFd?=
 =?us-ascii?Q?FHfpqZEZnxSfKJmpSa4+B669ClojeWSiXuGkQdx4f6svRew6SSQj4k4OcCIM?=
 =?us-ascii?Q?QPJ2o1AYz5TpPlmQu03IKnOAGy5A/SCcsfKAtikXi6dyiOO/Cg5yvw892hzR?=
 =?us-ascii?Q?eph+4w1QbZJ/irvW+zRWqzjj6IhImZyiOTg/p91S4+wlx9xM9WQI6VL80VGq?=
 =?us-ascii?Q?G6FmBBanms/ZgCA9VX2CRmHqRmscK1kXeKUyNHjpuYvc5RXsx747hi5kbJuV?=
 =?us-ascii?Q?VSmx6/78DjErHbqNPLmXZSu8cIijjYgdAJSR4Gm5dJZqD+5v2+p0mqSlkTjA?=
 =?us-ascii?Q?3H5kcXtcAF78KEtCUrOVLGQSYV61If3cK7G0UFQ1sC3Opu5Li+sHPmtM9HfD?=
 =?us-ascii?Q?YfvfkPFq9wPuTaPMfm7wtX5GjMT/o/DFor0nY0buwfoi1FP1iyY4Fi1HSLmc?=
 =?us-ascii?Q?jjB9/w6Fn+bMN46dM4yWk+mUCVcsYe/lGrYVtBGOEL9hGdchPZcPVUA3XU9Z?=
 =?us-ascii?Q?A7kH8qx6/dBlwVsAVtvjP2RY5m8/Lu3p48E1sGfcr3/17OGSdjBXuwOZbvNp?=
 =?us-ascii?Q?eNHsXk+xV/fW4dzVOQCXA4rxYi3EcapC8zRSv3adDdgNh2s05pbAmcuSY8FM?=
 =?us-ascii?Q?rEe1y4Vx5I/Udt0bZlwUzeX//hPNvmToUANygVCsN7zsLEOyhXjtmxpFSAjk?=
 =?us-ascii?Q?kPkWYt4mwqcyhNb6Ylp/19ZjqTdQczYw8VClEqkhUC61WX2kaju+Ee2DZh5r?=
 =?us-ascii?Q?NN+l+wdIjgs+LmdAuFKcCT79CHTJnAEv6mOK6lsUIVne3m5bCbBrsOr+VmIR?=
 =?us-ascii?Q?1bLlJe/s03R/G4cG5BArTQ8KXejQ/cmzZkB5jxDegWsTTwj639GqWgiURam1?=
 =?us-ascii?Q?kLWQuO8LaZzVnSIThU7pNSoozn60TNZIBAIyF81ztxSXcTyUkpIlMEXyJnEn?=
 =?us-ascii?Q?h50OArsZVmMcNLcfRJ487T8A6SlPrIJJY3vYXwIA3hIG9iZgmGaD+hnRpMGZ?=
 =?us-ascii?Q?Br3PWkLOXQJMe395MMydyF+BvBeFvwf/3wCrFWhi8dS6zQkKlksfQ2k4aEw3?=
 =?us-ascii?Q?HLPYr6zIttHiFCc+FUnk6qCtlWkrAtnk877nXXucZ0jlcCMewvzlFoVQlACy?=
 =?us-ascii?Q?FMXKAKdANvvYhnBDJBO4Qc4gT6LqTsFuqPoWApojrVZRyESF9El8quZj3VRo?=
 =?us-ascii?Q?g9xX5Y3AaZdD1meyKbc0obrrz9McM5S35wrFIviCVR0To0RlFbK4TqVO5ck7?=
 =?us-ascii?Q?Y90ILwBFZe8oxy1t6htvlPBe7uVLg/bR4oLGKn+EMtq0I1SCnn5DWxesf0R7?=
 =?us-ascii?Q?zZb4Uh/GyDSK143gNr2xd5otivhwRxh/CCMw2DlLu4NK5ng0uxd5Im+TMrlY?=
 =?us-ascii?Q?52BZyFcFXIa8Oh9i8vWx0yOCXoWFPnL3XTFUZCkvTqjpXuKXvI77++9r91tt?=
 =?us-ascii?Q?R/MoohP4YY5ygCpw359AhIelzHcFmtC28wH+CLbvA2eGgA2jS1aCTTjA9UJG?=
 =?us-ascii?Q?j2XTGnlmbJueE8hffL7KxCZ/6KAkIpVwoxP2mrwsvaVrLo4A4X+NRwrwZXvc?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25e22224-c036-4c92-bc41-08dcfdaa419f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 14:58:06.8924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JaIzjVz6q0ktwsl8F2/SLkySszSn7RkTFuk1sf7wNv0V6m3sqPwByD+F5fl0lQRsyVmlcH1QIPkXEgfe0y6pbQu4aQuD/dtOu4nG8kZDQG8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
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

On Tue, Nov 05, 2024 at 11:50:05AM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Tuesday, 5 November 2024 06:52:54 CET Lucas De Marchi wrote:
>> It's not used anywhere anymore. Remove it.
>
>I'm not sure.  I added this option based on KUnit documentation.  Has the
>documentation changed since then?  I haven't been watching it.  Have you

I don't see a suffix _kunit for module names mentioned anywhere.
Documentation mentions that the config option usually ends with
_KUNIT_TEST: https://www.kernel.org/doc/html/latest/dev-tools/kunit/start.html#configuring-the-kernel

looking for modules ending in _kunit:
	$ git grep '=.*_kunit\.o'
	drivers/net/ethernet/microchip/vcap/Makefile:obj-$(CONFIG_VCAP_KUNIT_TEST) +=  vcap_model_kunit.o
	kernel/Makefile:obj-$(CONFIG_RESOURCE_KUNIT_TEST) += resource_kunit.o
	lib/Makefile:obj-$(CONFIG_STRING_KUNIT_TEST) += string_kunit.o
	lib/Makefile:obj-$(CONFIG_STRING_HELPERS_KUNIT_TEST) += string_helpers_kunit.o
	lib/Makefile:obj-$(CONFIG_CPUMASK_KUNIT_TEST) += cpumask_kunit.o
	lib/Makefile:obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
	lib/Makefile:obj-$(CONFIG_CHECKSUM_KUNIT) += checksum_kunit.o
	lib/Makefile:obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
	lib/Makefile:obj-$(CONFIG_SLUB_KUNIT_TEST) += slub_kunit.o
	lib/Makefile:obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
	lib/Makefile:obj-$(CONFIG_IS_SIGNED_TYPE_KUNIT_TEST) += is_signed_type_kunit.o
	lib/Makefile:obj-$(CONFIG_OVERFLOW_KUNIT_TEST) += overflow_kunit.o
	lib/Makefile:obj-$(CONFIG_STACKINIT_KUNIT_TEST) += stackinit_kunit.o
	lib/Makefile:obj-$(CONFIG_FORTIFY_KUNIT_TEST) += fortify_kunit.o
	lib/Makefile:obj-$(CONFIG_SIPHASH_KUNIT_TEST) += siphash_kunit.o
	lib/Makefile:obj-$(CONFIG_USERCOPY_KUNIT_TEST) += usercopy_kunit.o
	lib/math/Makefile:obj-$(CONFIG_INT_POW_TEST)  += tests/int_pow_kunit.o
	lib/math/tests/Makefile:obj-$(CONFIG_INT_POW_TEST) += int_pow_kunit.o
	rust/Makefile:obj-$(CONFIG_RUST_KERNEL_DOCTESTS) += doctests_kernel_generated_kunit.o
	sound/core/Makefile:obj-$(CONFIG_SND_CORE_TEST) += sound_kunit.o

vs:

	$ git grep '=.*_test\.o' | wc -l 
	87

I think the behavior is a bit surprising because when passing NULL it
actually runs *all* the testsuites. It's not a shortcut to handle
modules like e.g. usercopy_kunit.o / siphash_kunit.o
that have the testsuite called usercopy / siphash. Instead it's
a way to group the tests for igt reporting purposes. We could very well
just keep the suffix or use a hardcoded "all". Or did I misread the
handling of this arg?

Currently there are no users in igt for modules ending in _kunit and I
don't think we are going to add one any time soon. We can always come
back and revert this if needed.

>checked if core drm doesn't use that suffix?   If it is still documented then
>what if we decide to run kunit tests from other subsytems (dma-buf? iommu?)

Using lib/stackinit_kunit.c as example: we could do either

	igt_kunit("stackinit_kunit", NULL, NULL)
	or
	igt_kunit("stackinit_kunit", "stackinit", NULL)

The difference would only be the name of the igt subtest.

Lucas De Marchi

>and it occurs they still use it?
>
>Thanks,
>Janusz
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_kmod.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 4eeab79ec..58edac8fa 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -1189,7 +1189,7 @@ static void __igt_kunit(struct igt_ktest *tst,
>>   *	   if NULL then test cases from all test suites provided by the module
>>   *	   are executed as dynamic sub-subtests of one IGT subtest, which name
>>   *	   is derived from the module name by cutting off its optional trailing
>> - *	   _test or _kunit suffix
>> + *	   _test suffix
>>   * @opts: options to load the module
>>   *
>>   * Loads the test module, parses its (k)tap dmesg output, then unloads it
>> @@ -1213,9 +1213,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  		if (!igt_debug_on(!subtest)) {
>>  			char *suffix = strstr(subtest, "_test");
>>
>> -			if (!suffix)
>> -				suffix = strstr(subtest, "_kunit");
>> -
>>  			if (suffix)
>>  				*suffix = '\0';
>>  		}
>>
>
>
>
>
