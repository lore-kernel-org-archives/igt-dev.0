Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309B4C5321D
	for <igt-dev@archiver.kernel.org>; Mon, 26 Aug 2024 18:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCFE10E22A;
	Mon, 26 Aug 2024 18:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zw/DPgP5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A41010E22A
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Aug 2024 18:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724695224; x=1756231224;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=IpGV6clh7X2vJhjIPOPPQAWPOYGHIXYDnhDk7qBqlWw=;
 b=Zw/DPgP5/z9+B2VBtRIUQk30bH08Uw4uyfkWX4goiFQpagF9g9xwQ2VM
 7eQLpWZ7b14IYOEFL74YI+1XaYGe1WhvXqSekcgwqyYxOqiXgw+Obzdev
 hruzsLBceO0S4p9Q4gg8GOgrhZSwSMhjPAZSOCd24LSenyNIINKgS+kcA
 cPnqhuY7gO58hoAnykl6s/bvY2ysw92gr4QbLo1R/tukDaaRJO99xqTYM
 jps8iGeYw+KVMedl5XYa7c25PdWDOyy5Z9Uz+V8Hz8u1HSt4i73mjZqbn
 AdoKU4nRg3l5TBQ2G7/hw330/hXP7A6ckGZgN4Dev0g0Kn5jCdGVhzHIL A==;
X-CSE-ConnectionGUID: rRddJmW6THuBLozoNvQoFg==
X-CSE-MsgGUID: 08NfIcm5TQ+xTiAYgpn3Ew==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="22656457"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="22656457"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 11:00:24 -0700
X-CSE-ConnectionGUID: X1LcRaahTFCKj7AtWm71HQ==
X-CSE-MsgGUID: DbMGY/ssRtGaddagKwxsuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; d="scan'208";a="66748484"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 11:00:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 11:00:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 11:00:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 11:00:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 11:00:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HsBGemOlMm8pZhFAxbWeca1I8hzIJKn+yUSMCgbhcZtOe8PqnVAeN3MKt7Lw1BaGgrEivdZf1D8FNPIWnBmokBQWh7E6iuCA69PcsxjpTAfybURW19Z/EjAEIhFM7LZUqDUWkhnIwVhXcl0avgVVJZxDg3NeebZVG+0RjcMGkuXz+JWsLf+HWapCsHxVFXcOCk5KIDEwdmRZ0sWYA3ey9uwxPm/+I0FqRLnlwhfrSlADUmBOpVkxcG/n1H8Dgf4GLELDNtfdqvzxRs+lH4SKz1pd38cUgMQuwv8E6M4npsQVIhTOiCLiCmCELdrMfZJmcmFYddK02mTFGG9Ial2Z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4nrqUdMw/IfPTVX1Bz6Didx0PGTXljSNKiTPMimktQ=;
 b=xiFl6ozVXaq2zRxvAe6yPX1XyMD0a++GpRhUH/l7y0btT4OAJDkH+5VEqe32TbfrZ4Wtqe/W/T7KwlwHtJF/eZbNRhtBXGY+Ee1p0YVPl8hi3tLq/Kfq8brd+idXGcP1jIJizt6cZw7Y0GCfmK9pPoOB27KRLtA5wwzHBFx20q/+9y8ArL1wtktAKeuFGr6gJmyZUR0LH5Voi6QhzfthYu8CENqDUAOJPRE62OwwvV2FnKwIDNacZOdyDIdh1y0aogJYzXHeEH63bGQRbl8OBYYaECPdK3kqMr7vSSFzD0VRdmUt9vTx4zIj2ghx8kTWPSmBHFHe2TA70XIrZhRHqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB6560.namprd11.prod.outlook.com (2603:10b6:806:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 17:59:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 17:59:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240826152656.1306490-4-lucas.demarchi@intel.com>
References: <20240826152656.1306490-1-lucas.demarchi@intel.com>
 <20240826152656.1306490-4-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v3 3/6] tools/intel-gfx-fw-info: Embed fw decoding
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Mon, 26 Aug 2024 14:59:40 -0300
Message-ID: <172469518072.6014.2013452589619169263@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0055.namprd04.prod.outlook.com
 (2603:10b6:303:6a::30) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB6560:EE_
X-MS-Office365-Filtering-Correlation-Id: aa74f596-af08-402d-d642-08dcc5f8e0fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aWtwMkVCZThMeWFpMU1KYXQyUzRZaEo2OXpPYjFkTzh2MmwxOHFlMTkxdTJn?=
 =?utf-8?B?bG5SM1JTVkxjZ05jZTJIZWRmRlNTRm9kalFxZXVhRTMvbWlRaDAyWkhYY0Jj?=
 =?utf-8?B?VGlNYXNkdHcvUGI4ZHFvL1JQaVkralVoNDNxYkxnR3dOUThrdm5LYU9QN0dH?=
 =?utf-8?B?S0kwWXF4dlY0ejRkeThXbkd2d2xWQmdMbGh4cHdOUHh1RkNpcEoxWmMyTjRy?=
 =?utf-8?B?Vk45UnhwRVBvVWQ0N3RSeXBrK0lHUlYreG5lbHN2eTJKMHlOYUJENmJRMmF2?=
 =?utf-8?B?SVE3aHZrbnhnWkZZZmlSNjZhTWw0TnA1YWlsZHN0MTBzN0w4aWEwREsrcXdN?=
 =?utf-8?B?bnNnS3d5WUpMcE4rbnNzTlkxQjRsbHB3NmVmNlhXaDgvRkVhdndwVWNBYnVi?=
 =?utf-8?B?ckpZRjBDVE1iWisxcVpGUzRYSlpnVTBxbVdsS1ZtSUV1aE53azVkcDB1TVFp?=
 =?utf-8?B?VFlVSTlFWjh6bnRBWVFZME1oeGpiYmpCYWplaWY0UmpGMVdMMUZyVzNiZXlp?=
 =?utf-8?B?ZHI0Z24xeFFnYmd4QzAzdEdFWEkzVnJUMVpmdDdURUorZ00vOHV3eXdGZm5k?=
 =?utf-8?B?U1hOdTdNbXo2djdMKzZyNldUNTlrc2FCRlorMG5yR2hTbXZIUm9UV1M0d2ov?=
 =?utf-8?B?RWwyLzVDcnRHRTFjMHl6ZFp0amJOVGxCZWxnZ20rM3JkWm51T3pTanAzSDk4?=
 =?utf-8?B?Q2xqNS9vY1ExNnRvWVpaQjB4OUxIQU9na1BOcjZodjdiaHBMMGJtOXYvZGpD?=
 =?utf-8?B?cVl2QXFNN3ZxZVorZkg0VkRONUY3RGNYQnlqWFlWNHJ0cVdDZ3p6aDlKZFVZ?=
 =?utf-8?B?ZVNoWlVtUzFZZ05JQzJoeXFLRWNaUk1wZGQ5TXZiRHZZekF4SDhsL0s2ZkFG?=
 =?utf-8?B?bWovWUpJWjJvaE5rQzM5ZG9RUCtocUI3Y1FIbWhMMlpXQXpibTlSaUxBY1pF?=
 =?utf-8?B?RFdPN3BlU1B4WExEQ052RWNCUVh1OXM2OUxQa1RXRm9oQmZwQVZ0bU5PWnhZ?=
 =?utf-8?B?TUVZWjZqMlJ2OGtKVnpEQlVmNTBNemJ6U2NGVGtDMTRyZklEOC9qT3Nucnd4?=
 =?utf-8?B?V245blViM3FkeTFLaDl0RG84U1picWV4OTZXUzNjYnQzeG1XTUhKWDMzd00r?=
 =?utf-8?B?M0xmR2pTVXBYVHRnSDRvSG51VUN6UXJMUCtVSTRrT0dSWnZUVDRFanZ1NU5y?=
 =?utf-8?B?bmJNNUhWZTZROE5semxSQkNzNTErQjNaMjlNSEZvb1I4QzBrZlZsZ2NrSzJN?=
 =?utf-8?B?TCs0Ym5Wbm1rRnRmSFZkSFJza2E0MVVVVUJUV085UFdXdm0yanJYd1Q4c3Qv?=
 =?utf-8?B?UnhTOUQ5dFlMbkxaSXdJUDFkaUEzRTRET3dQNVU2dllCUG9ZaU5rK01vWUVS?=
 =?utf-8?B?UHNqM3Q0bTlHZEkrKzRkbEpRRDZsMmFoVHVueTN0RFB5WXljZVJxK002U1JI?=
 =?utf-8?B?aERYSHBLTVdiakpEZEJBdUd0Z1RFRGhmTnZHYkZVZlNybFFpQVU1UDlIdnd5?=
 =?utf-8?B?ZXduSktvQjBDVU5SNFlySlRNRk1tYWhqZUp2cEZnMWpIWFdIRThESlZaelo3?=
 =?utf-8?B?K21yQ1YydG5KZVFBS2t5SERtYzY0TXdPZWltNnEzR2Mvc25mT25xRmIvcDF2?=
 =?utf-8?B?dGIxa1JUd3JzVlJTMzVWckRPeXZ4TzlxWUMyeDF6ODFDYjZzalFKTnIvZHRS?=
 =?utf-8?B?V3drSU8rRVhuNEpsWE5WY3lQb2tHbTQyMStYT3NvWGtybENHallaL29HUzhF?=
 =?utf-8?B?cjNCQzMyVFNXaUk4MjBlK3Jva0JQNEpvTjdVQ0NhRFpkTzQ2T0M4ck0vQXh6?=
 =?utf-8?B?U2Q3UjZwY0RLeE5uVzMwZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUVINStMSDJLVURLOCsxL0FZT0FXQUdVZndibHhwWUVQNjUwZHdJSEQxdXZ5?=
 =?utf-8?B?amVnLytONFpyVElvVG55ekRVYVlIcXZIcFFXdHVyZjJrME5vVEVhNzFaNzVO?=
 =?utf-8?B?eG1KcjR1MWp0N0dkOGI5bkhhSXFtdFB2cWtkRjdFREh5TGJUVUtFNEZrQnZm?=
 =?utf-8?B?QXhqbFMxaTh5WDlqcWVCL2RUbk9ZZTVmbGJkb1ZJUDEwcXZKb3JPWVdHbUJx?=
 =?utf-8?B?RTN1WUFMZDhsSzU5NU1Rc1JCOFZVUmhrc21Sb2hEaWQ1dTJjWll5Snp4TlhO?=
 =?utf-8?B?MUZleWMzTU91L1pTQ1p3ekVlRW1BeWdsQlg4UjlZV3kvbXAvKzVhL1FSKzVR?=
 =?utf-8?B?TURwMlVrMzA2OXdPc09pVmJGQms4M0dEZ2lmNTBvVHgrSkYvSWZzQ0x4ajBw?=
 =?utf-8?B?RlQyS1pHSFFINUdkYUR5YTVrT05TNFduZEcxVVFzU3NQVTk4VjB3TTRhcHA5?=
 =?utf-8?B?U0pFZmw2aHZ4VG1KdVorRGt4aFV4clJYLzR1Ly81Y3JBcXZRUms2MDNHUEo5?=
 =?utf-8?B?NmRkNjY2NEhmWTU3UW9MS2hFY3JoaXA5dFhwbVVqWHAwK0lRLzFxdzB5NVJY?=
 =?utf-8?B?TGVQRXN1RW1RYzdDWlRUeFBZUE93cUMxaEF0citpNXNaTWNBVjVqNTMwdHdq?=
 =?utf-8?B?VVVHTnREYm9uM0JMSjlvZUtPbm5BR1p0aUhpV01PcXBEc09uTjVmTTlac0Za?=
 =?utf-8?B?TUpHMUd5d3Y5MjFZb0tTWEFNakpCSDZZZlFtYVJUMjU0Ui9KOGw5bHpjTE5w?=
 =?utf-8?B?eXVGV0FMREJzd3VrV1E0S2tQV1oyNTRFSWFuZ0N2dXpnaTlYTzVRcmZuQjhC?=
 =?utf-8?B?UENZQUwzaGpGVzg2a3J4MnRVOWVjdzRLWkgyOGpnT0JtTUhSSmlwR01QeHow?=
 =?utf-8?B?aGw3TnhQakJESzVwTzdjQTlVRFBGbWFGb3FJSmJrbkNSVERTT204VEF1amI4?=
 =?utf-8?B?UmdxeUIzQi9DeVB3Rk1RMnRVMXhON1FBSEUxNnRZOG9xWTBGUDNsQUpvREkr?=
 =?utf-8?B?RmJkcVN6cjd3NEVCdlg3Y2xudkY3WERvL2RBZlJwQVREZ3NhTEhaUU8rNHJK?=
 =?utf-8?B?RDErYnFWb0E4MHlPMTNxVTF4OVRFYTFvdWJHMDV1Tk5rOFN6VUNxNmpuQmsv?=
 =?utf-8?B?bUZUN0syNUdDZDB5bk1lNGU2VHNxVWEvUDhxcHpRSU9SY0xqQXVGU1JqTjBj?=
 =?utf-8?B?czgydG0razl2N3dxbEdLM3p6OWVRMUl1cWRmK3h3R1YrSTBDWUdETkNEcEF6?=
 =?utf-8?B?ZGp2SENHbkI0T0xYWXh0MW1iQ0pSUXJwemxjd3BIWTNyL1FMYzBsRVMwN3hE?=
 =?utf-8?B?UWN1eFJnQ1h2SDdqVXY0c1FTenQ4d25mQTFITWIyRGxkTk11MzZjTVVuY3BS?=
 =?utf-8?B?bzNSNklWOG1oaEZXUmtOTjZKbG5rV1VmRFMyb2szYTJlaHA2SFI3d2V1VjdO?=
 =?utf-8?B?enFiTTFYMlRzU3VicDROcEQvT0FxU3YvLzl3SGZ2UVROWldVd1pQUHp6Wk55?=
 =?utf-8?B?a01FeEJLNW16V1l0SmVqeXNOaEU1b05XREVFcVVIQlNyWWh0WU9oQ2p2djNR?=
 =?utf-8?B?UXc5U1JrallSM3M3aThRaTBVa2NETnlpTmlqTUJEaGFOc2ZKK0dxRmxSTk1m?=
 =?utf-8?B?cVd5SXlqcGJTSnhCOFNPZDY3WDI1MEdCa2lEUUIzRXM4TzAzR2p0SDEzYW5Q?=
 =?utf-8?B?YUgycU9IRlV6Ylk3M3BNck1iRmpjSE1yVVB2MlI4S0Foc1N5cEwxblBORi9C?=
 =?utf-8?B?K2JDOFVTeUxUUGVmK3VxeEZDK1RjeTRYZENxU2pqeFlubkxlazROTWpCNWJv?=
 =?utf-8?B?VGkxRlpOMGZSdVJUMlpvSjhnR29JbTVSZjZlK3grRHJBbFh2YkVhdXpGN3ZQ?=
 =?utf-8?B?RjJBMGtpNXVNTmd6UTk4SjBMVVhsY0tsbEhwb2g4ZkRCUmUyR1k1Y013dFJI?=
 =?utf-8?B?Ni9zU0owVVlJSnlVSmhuT0dxcVVQZFNBV3N6dm1Fa2ZWL2xIZnlpVDJTQVRD?=
 =?utf-8?B?a3lnUTErMlJGaFVDQ0JJNHhnU0pTUUc0NS9PNkNqMkhwODB4US9mUll6RUo0?=
 =?utf-8?B?Yk13bHhIVUEyTUNyYmdTVzVoMHFVUDBTa0hocGQ4d2FIUmtqbHZkNjFOeVdt?=
 =?utf-8?B?ZVVHOG1SNUN1eW5Oa0RqcUZYUFhiZDRIZE5yS3c3SmFVZU0vemxmNU9YWUtr?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa74f596-af08-402d-d642-08dcc5f8e0fd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 17:59:49.9286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rPyo/TspTifvSf4o7v5tDz33POMiYUH02E90+NyqYvc3j0jle+4Phf8Bqrfv4NBMB1LgoEdO8yJSB8tITxLnGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6560
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

Quoting Lucas De Marchi (2024-08-26 12:26:53-03:00)
>Use a factory class method to decide what class to use depending on the
>magic and embed the calls to cstruct in each of them. Main motivation is
>that in future the decode method will need to seek the binary as it
>can't really know the version just checking the beginning of the file.
>
>For now, keep the open/close of the file in the main function, but
>eventually can be migrated as well.
>
>v2 (Gustavo):
>- Fix s/kw/**kw/
>- Remove unnecessary seek()
>- Use a constructor variable in create()
>- Squash call to sys.exit() that was in the wrong patch
>
>Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>---
> tools/intel-gfx-fw-info | 74 +++++++++++++++++++++++++++++------------
> 1 file changed, 52 insertions(+), 22 deletions(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index 3105144b7..a4b9414f2 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -105,8 +105,38 @@ def FIELD_GET(mask: int, value: int) -> int:
>=20
>=20
> class Fw(abc.ABC):
>-    def __init__(self, fw):
>-        self.fw =3D fw
>+    def __init__(self, cparser, f):
>+        self.f =3D f
>+        self.cparser =3D cparser
>+        self.fw =3D None
>+
>+    def checksum(self):
>+        self.f.seek(0, 0)
>+        return hashlib.sha256(self.f.read()).hexdigest()
>+
>+    def dump(self, **kw):
>+        cstruct.dumpstruct(self.fw, **kw)
>+
>+    @classmethod
>+    def create(cls, f):
>+        cparser =3D cstruct.cstruct()
>+        cparser.load(CDEF)
>+
>+        magic =3D cparser.magic(f).data
>+
>+        constructor =3D None
>+
>+        for s in cls.__subclasses__():
>+            if s.MAGIC is None:
>+                constructor =3D s
>+            elif s.MAGIC =3D=3D magic:
>+                constructor =3D s
>+                break
>+
>+        if constructor:
>+            return constructor(cparser, f)
>+
>+        return None
>=20
>     @abc.abstractmethod
>     def decode(self):
>@@ -114,8 +144,13 @@ class Fw(abc.ABC):
>=20
>=20
> class FwCss(Fw):
>+    MAGIC =3D None
>+
>     def decode(self):
>-        data =3D []
>+        self.f.seek(0, 0)
>+        self.fw =3D self.cparser.uc_css_header(self.f)
>+
>+        data =3D ["header-type: CSS"]
>=20
>         CSS_SW_VERSION_UC_MAJOR =3D 0xFF << 16
>         CSS_SW_VERSION_UC_MINOR =3D 0xFF << 8
>@@ -137,8 +172,13 @@ class FwCss(Fw):
>=20
>=20
> class FwGsc(Fw):
>+    MAGIC =3D b"$CPD"
>+
>     def decode(self):
>-        data =3D []
>+        self.f.seek(0, 0)
>+        self.fw =3D self.cparser.uc_huc_gsc_header(self.f)
>+
>+        data =3D ["header-type: GSC"]
>=20
>         HUC_GSC_MINOR_VER_HI_MASK =3D 0xFF << 16
>         HUC_GSC_MAJOR_VER_HI_MASK =3D 0xFF
>@@ -167,40 +207,30 @@ def parse_args(argv: typing.List[str]) -> argparse.N=
amespace:
>     return parser.parse_args(argv)
>=20
>=20
>-def calculate_checksum(f: typing.BinaryIO) -> str:
>-    return hashlib.sha256(f.read()).hexdigest()
>-
>-
> def main(argv: typing.List[str]) -> int:
>     args =3D parse_args(argv)
>=20
>-    cparser =3D cstruct.cstruct()
>-    cparser.load(CDEF)
>-
>     checksum =3D None
>=20
>     try:
>         with open(args.filename, mode=3D"rb") as f:
>-            magic =3D cparser.magic(f)
>-            f.seek(0, 0)
>-            if magic.data =3D=3D b"$CPD":
>-                fw =3D FwGsc(cparser.uc_huc_gsc_header(f))
>-            else:
>-                fw =3D FwCss(cparser.uc_css_header(f))
>+            fw =3D Fw.create(f)
>+            if not fw:
>+                logging.fatal("Unknown firmware type in '{args.filename}'=
")

Sorry I didn't spot this earlier: we are missing the f prefix here.

With that,

    Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>+                sys.exit(1)
>=20
>+            decoded_data =3D fw.decode()
>             if args.checksum:
>-                f.seek(0, 0)
>-                checksum =3D calculate_checksum(f)
>-
>+                checksum =3D fw.checksum()
>     except FileNotFoundError as e:
>         logging.fatal(e)
>         return 1
>=20
>-    print(*fw.decode(), sep=3D"\n")
>+    print(*decoded_data, sep=3D"\n")
>=20
>     if args.raw:
>         print("raw dump:", end=3D"")
>-        cstruct.dumpstruct(fw.fw, color=3Dsys.stdout.isatty())
>+        fw.dump(color=3Dsys.stdout.isatty())
>=20
>     if checksum:
>         print(f"checksum: {checksum}")
>--=20
>2.43.0
>
