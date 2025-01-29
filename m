Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27A68C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 20:30:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A2010E12F;
	Wed, 29 Jan 2025 20:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IU7IH6nd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6973710E12F
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738182612; x=1769718612;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Waq0kK6fnsJmR6yknDNx0W7XfuD4znicZ80j3Te8pKY=;
 b=IU7IH6nddi5kVV0HAkZQcAVKPpGPEABpraPjSJKTE/QKXDMNPWn2njby
 sECFP6tTl9td4MpDLv6jwJTjfBNsDJsvQq5CnlzmMltDFYeKgP5UZx2gd
 IjcaGwm9uCr72YudWCmqDL9t88iW2bYNZA7j7CR6IO7Acw8EI09lL3pim
 uX48LbRY+EZbVdpYyEfrsa5nUbZLMUZsMt4Zw8ewV9KuSLMkezXidXB53
 zZ1VqhWk5jZnj1l3E58HUjvCzHSZsG29P7u2HBGL978izw89oLe5hx20J
 7QuxHXOCC1uQ+8dpYcgSFEwnU+pHFt7kA7a05Q3ifuojSJPvQhWRymu7E w==;
X-CSE-ConnectionGUID: eebRR+40SSm1uAiSJ/VUEQ==
X-CSE-MsgGUID: wEP1QAz5QEWVp+fkPvUIEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="37915775"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="37915775"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:30:11 -0800
X-CSE-ConnectionGUID: YdDCH4P9T86i+A7kE82k/g==
X-CSE-MsgGUID: eC2wWPSPTLOqpg83h8AIOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="109688281"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 12:30:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 12:30:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 12:30:10 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 12:30:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hzN0GxYWjy379e8pN5sXWagbQMmi5kj+k6dlPV+6hNBv5A1/2losgMufTp0R4JE6Mo9WYRb6E09CojJk3O6joZemKHRsikf1fgyvPJjFyC1LVz+7e6Sx7/bhry3ITNRMabaoO/MyuD9lRTRAgOLkegHpvRQ5WEXm8VzU5gm/Il5mk2Qi1mb2W7NV7P3QoOVj7ts7/Pe+CWov4u8xao1Fm2WLGze2PmA7hs5Ye2BvfCkHUW8bkd/yWo1Lk2xf6sYN7rF2hvvdaQuZN76HCCybzXSIZd+DoISSgBKnqbg+2Ys5hQCEuSip7AK2vLTmynOxZKYS7JRmebjoT09HhV5sOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SVU4ifPT22PPLdee6UrGPeC223HXD6gOBvgDSfr4WHE=;
 b=F9zfF/S8iGntJn+GoW5Ga4ewkR6o7LA1duRhCbCR6R6yNXEDgEeoI75jQqtyc8EdbXaYfOJXndwVjXjVdKc0Xn6KcwA6CN9/nbn0YGKvfqYZw8EdOh24VFZYImInYr8KH2nhqBo2b8xMISIRTWelbx0V+rTTN8WZAwhE2XM8OCBJZdeIU9rS9v06CLB4mdvf0Mg+59E7FbONhfIgovgEmQaynDuU+V9DdZJnLSQTpnKE/lC4a87OytuMRkg+yk6GXyhrehk8m5clIL0sDDsHeJd7wZZGt/kjCYEcGWakc2cKNFCSn2x9XVxCLx5bsTWqls9HTS6YVa8vApfzH3V4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8436.namprd11.prod.outlook.com (2603:10b6:610:173::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 20:29:53 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 20:29:53 +0000
Date: Wed, 29 Jan 2025 14:29:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Petri Latvala <adrinael@adrinael.net>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Message-ID: <ch5wp3ziv2552jmvjiyp7izyykj3b77taki2bf5uki6s6yzhbk@ddr3vf2d6h7i>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <20250128183744.zegxv5uougqwvc4a@kamilkon-desk.igk.intel.com>
 <wfzokcb257qutd6324fku62dkdxkm552xtcftue7m2zaxdryuz@e5sdrclgnjxr>
 <20250129172348.x5osrkk4yocdmdpk@kamilkon-desk.igk.intel.com>
 <Z5puykM91cje2ki8@adrinael.net>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z5puykM91cje2ki8@adrinael.net>
X-ClientProxiedBy: MW3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:303:2b::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8436:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a91363-22ed-4218-c135-08dd40a3b004
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OK0SCnLSW0jPy8pQOG1eMhuGzIrgUKytv6PPqiNVArCL7bWUamhk5QHCro7C?=
 =?us-ascii?Q?81TZB5N64lHDTs8QRZjwIwsKLwit1nmbVw5esajRIjrOtD7D8tMKbQDwozrW?=
 =?us-ascii?Q?Hkf2PNditvxNvmz1UukjqhwDNKqj8eZ3Qkjat8xCCeJ3ZJqeoPN2TaZwO01K?=
 =?us-ascii?Q?fO7YFEJdve3IQiSrHZohQZ2COtLGGSPpeURTrd+8e3m6Za/WYrdMBfr4TXqq?=
 =?us-ascii?Q?79jTfMP+vF45trHPSTQBsZtOqYB/gUOWCVeRenKonWsXLz/5V4d/KWqGM7SV?=
 =?us-ascii?Q?Qx9fqhoHmogyak+sAQet1B6iphb4QMsi+a4mP0Mg/WyiDmF23j3PdqMKlD+c?=
 =?us-ascii?Q?sj1RXN5XLhcVXdVZJv5Y6W+Sad/4Lj5HZxq6UYRFpv4vS9NDukKA0S4UEc97?=
 =?us-ascii?Q?YfA9Z2kx0O5i1RtypD9pzSFE80bugoN19r0uezAWjniw3PYIdK2kHqLCzgRJ?=
 =?us-ascii?Q?AKQm7Yc23rUwjsClpTBqf7vAYOB6v3oJbt521B/Sx0FeiiayDXOQKun8xB3k?=
 =?us-ascii?Q?KRDHD1FSW2MueHJqAu6jnD5uKWPK//UQ8HSXlvNTTUEbNyTZcS7ShTg7SoG9?=
 =?us-ascii?Q?O0YPXGtOpqlfiorWacCG6YUolYTO4bTz6yOL3Y53hQqd/c12bWKva8YGOK2L?=
 =?us-ascii?Q?Bn5g5MLUkDfMidDke8vdeRxK6MLHw9m6smHpaTSkliXjQIdOWHAMkxF4ycpg?=
 =?us-ascii?Q?n1oPscGaT1NsDkw8hSARirEvC2VmTRk1Wy12UJAKTJzarlEmD6N+c5jJ383N?=
 =?us-ascii?Q?88zwOKzQ9oTD4Vov6hKQNorxg4PpLOA9WNjmnEKzRQh/oNB6808vpjSMRBSB?=
 =?us-ascii?Q?vXua1E+bVHQzW8FdsJ3BHJUA/IkwxKQXYEaTkbo8XLTJGY5wSh8Bbrxo/S/V?=
 =?us-ascii?Q?iDEybngLwchn5JTabLmbCaS/J1hyoAD8tfwkCK6mVpZYqjIquQvHp3bZmxzU?=
 =?us-ascii?Q?b/a+dGMQNVM2o40ClyfYytQzuI2/3LfcZgvuz94GUJynmWJdqmbTXicoiSEz?=
 =?us-ascii?Q?lg57D/nzH5TAmbH7YEzmjYo6jZDCwC+3XnFKqEmmFoeP5PiptCLMabaZuzdt?=
 =?us-ascii?Q?MBh4Aw291b1zPoTdX+ANcNRv+/vMuEXO/QnUoGPh+rMGWDbalTG5Z0ziqkIS?=
 =?us-ascii?Q?bF3rCVaN4aEbUhgkt/6tuGrIirXfgDsktPmCNRz7zkmxVvPnmHTZxsA2sBpK?=
 =?us-ascii?Q?rH/Dsd909AnPjuzJzmQaiN5Z1lWBNxu7PYRLArlwBmc+fvww1zmGtw2vWrSJ?=
 =?us-ascii?Q?bzDYAg2yk3lvf7eHJ2XSFukmvMLDXUpY6HPvjDn4QJ3e/9ES7Gqa+eY4cBrE?=
 =?us-ascii?Q?qi/hlLKXMDQ9TtZJjZ32CtlFBtDLIkNbkmvm8Dw+SkoEPA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(13003099007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/qQL3/22PkVY2Zk8rrxC1deGM6jr0a96QqPHXc3wKrTPefWLvJX8+CbK5pt7?=
 =?us-ascii?Q?pLy0NrG3lUyTldzf7cIOBcZ2Wd3KT2FE5oaGOLWAkzlbJVfWsbQuIbhwG4+F?=
 =?us-ascii?Q?oC2rFj4pYuBZjz5RXkz9XBqW2Cq/yGDn5BbHRUZMSmaV5HiYGM37Nl/OWV/1?=
 =?us-ascii?Q?QC9wofRBq+kLVxKPfev8ulwL/sIJQuguABAw/NDbzQWpkNSG48ddR1pFpgiR?=
 =?us-ascii?Q?daNLlz4BC9Z1kuWxcueZNVRhjmANeg5qozSh3KF4H3IET8MIUvMEDwXKsIyJ?=
 =?us-ascii?Q?Hxva4SMbBtqP1KLgZ494oqICab9/FKoOdONe0pvtNOEO0X/Ge7fAIoIgaEcF?=
 =?us-ascii?Q?HeP6VCMCqNOBGE77qw0c/MPR/uU7b6jmUc7+E8HN58e2/TyLzuwMGsvU7IRs?=
 =?us-ascii?Q?xs/s0Q18mFFrB53EI0M7NIKhp5MZwW5T5rS0KhOAQNgxthaK6MXONq9uvQde?=
 =?us-ascii?Q?63SRbotyp72XgXpGmWsHhwonWGWyhWSA/54GvcgasCxMnOHkhxfZlkC3ztdD?=
 =?us-ascii?Q?Jmj90aaKnFxmtm9tmiGfK6ZTPsdVYB3yqAILSgvlgTjIwN6Yj6tiJC2vXaZE?=
 =?us-ascii?Q?DWvvXbWVRvp9nBmcaKC5uXikED0xs9lvrNT94UykMnf1bHtZw/W36o8h9VpM?=
 =?us-ascii?Q?PUqbHjDhI0zpo8fTnPl5tfz+is2Oweu0QYvI0bzCJm4Wt3O4oeyM53J6MIRs?=
 =?us-ascii?Q?VF1DpgZ3ihhCZFp8uBCHBGWJhsJ4T1dETx8O3jXxtpZywA9X7Uqt7DCFPiN9?=
 =?us-ascii?Q?H1ponn4JKKH9nD6at4Efn5x9l0e1177e6GR0OexeLS7X2BgJTxKq6o6BpEVX?=
 =?us-ascii?Q?qjYpu5KeGrqJwNzqzoarP9NchLB1Tl1ydOjeljLc8y3cEDbaK9QhA5d1fhqj?=
 =?us-ascii?Q?tbgZoeFtrU94dJ+FYdx1Ct4HQ0QwuFaRNJN/zoyEwE8x4rtoVPEEMYO4OuXo?=
 =?us-ascii?Q?FSBVLC7pRIIUYKwdXzMffCBKwwupXP2WBrLIWoZkryNkUSQU4yaAsOMHBbHK?=
 =?us-ascii?Q?I5/gm1fgAg4oqvgK6hz6HNlSkITRoNJQgri1rXcb4b6OTFfYXJcF/K6i+oji?=
 =?us-ascii?Q?SMvBK11VJHj3N04mx4JjXQWzaT4k7hGOqYVcfuPK1IybBEIWMrJGosG9oRvv?=
 =?us-ascii?Q?aCwV/yejVV8Vpt79EgxXTV6XrVMVdlb0fiq/3Vobws6qAekxRN71Lz9b5CAj?=
 =?us-ascii?Q?WFeuC0Xu8+vG2ZCay/sR3jRvnHjGdzyUPEy8nqZYqnNg9DpX9QoLqC6Px6xV?=
 =?us-ascii?Q?33EMN97EGP4fSX6kyc15Xw9apG0olvBn1ZUhGv8AwQ1ymYjd/upMt3/+YhQf?=
 =?us-ascii?Q?wX/H7nOCDu1CN8Edx0RVEKFfsClHrCvyg+NDCAfS6YidYkxL8EtXBYAqJdL2?=
 =?us-ascii?Q?oHRN5EEv8hoDMV1EaSCnOHe+hWw2faFGE04xDR1vyWJpSxNt/SdDlWJ7HIyy?=
 =?us-ascii?Q?Lyo9YE7CEXX8TGY2TQql+5y/Vt89RYeLw3KPpxrF8NTWyJo6Ep83cGg7CH6w?=
 =?us-ascii?Q?YjX0uZUnoyZoejyo/t+BgQkIr/7bGdKI0BCZlnD0ZvU0dHvM+szx5otd5VBf?=
 =?us-ascii?Q?DbIeC1RiIeyH921QEV8JXtp5i59K7l+laHXZUG8VoFToOGYpoCJAjAZTLqUO?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a91363-22ed-4218-c135-08dd40a3b004
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:29:53.5113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHyad0ChO5mo5tX6GnsnxoWVvZJy+rJ6SFzx+KzpndEAqRlzatTmYrv1k3IbZw6KPecEmptpIam2VtekWFTSZkEKd9jj42zMzKqO7HMvWQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8436
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

On Wed, Jan 29, 2025 at 08:09:14PM +0200, Petri Latvala wrote:
>On Wed, Jan 29, 2025 at 06:23:48PM +0100, Kamil Konieczny wrote:
>> Hi Lucas,
>> On 2025-01-28 at 13:34:24 -0600, Lucas De Marchi wrote:
>> > On Tue, Jan 28, 2025 at 07:37:44PM +0100, Kamil Konieczny wrote:
>> > > Hi Lucas,
>> > > On 2025-01-21 at 14:57:32 -0800, Lucas De Marchi wrote:
>> > > > Serialize the command line to metadata.txt. The expected format in the
>> > > > metadata.txt is like below:
>> > > >
>> > > > 	cmdline.argc : 6
>> > > > 	cmdline.argv[0] : ./build/runner/igt_runner
>> > > > 	cmdline.argv[1] : -o
>> > >
>> > > Sorry for late reponse but imho it should be saved for debugging
>> > > purpose but not for reading this in metadata.txt, especially that
>> > > this option '-o' is 'override existing results folder', so it
>> > > should be used only once by igt_runner in setup phase but not for
>> > > igt_resume.
>> > >
>> > > From igt_runner --help:
>> > > -o, --overwrite       If the results-path already exists, delete it
>> >
>> > if you are using -o it's just because you don't care about the previous
>> > results and want to completely overwrite it.
>> >
>> > igt_resume doesn't have any option - it doesn't have a -o and it
>> > basically does:
>> >
>> > "Load the settings from the state dir back into the settings struct"...
>> > igt_resume will read it back and create the settings object.
>> >
>> > The results.json as architected in igt_runner discards everything and
>> > is basically a conversion format from the state dir to a .json file at
>> > the end of the execution.
>> >
>> > >
>> > > imho we should save it into some different file and include it into
>> > > results.json
>> >
>> > not sure I follow... metadata.txt has the details of how we are running
>> > igt_runner and it's basically a dump of the settings object. I don't
>> > follow what's the relation with the -o option you mentioned above.
>> >
>> > End goal is to have the value in the results.json, but I see no reason
>> > why the intermediary state needs to be in a different file.
>> >
>> > Lucas De Marchi
>>
>> Well, what I try to comment on a commit description:
>>
>> > Serialize the command line to metadata.txt. [...]
>>
>> imho this should be written in setup.txt and setup.txt should be
>> included in results.json There is no need for igt_runner options
>> in metadata.txt, as it is used by igt_resume in shard re-runs
>> after a reboot happens in a middle of testlist.
>
>The command line in metadata.txt does no harm as it's just
>informational text to be recorded in the final result. It's also
>supposed to indeed be a direct dump of the settings object, and thus
>should have the command line if that is to be put into the settings
>object. But I suppose the pertinent question is: why does it need to
>be put into the settings object? There's already things like uname.txt
>and starttime.txt and whatnot, written outside of
>metadata.txt. Consolidate miscellaneous info dumps to a single file?

yes, ideally we'd have it consolidated in a single file if we can, which
motivated me to improve the load/store of metadata.txt. IMO it's easier
to have a single format and use the same functions for dump/restore. It
also allows one to always fallback to 1 file when the visualization is
not updated.

Example:

For https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/bat-lnl-1/igt@fbdev@eof.html
if something is missing I can simply look at 
https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/bat-lnl-1/metadata0.txt

and get the missing information rather than figuring out the right
intermediate state file used by igt_runner.

https://intel-gfx-ci.01.org/tree/intel-xe/xe-2570-bdfc862a5c719d934efbdedb050ef891b9feef15/bat-lnl-1/metadata0.txt

thanks
Lucas De Marchi

>Do that when serializing command line _somewhere_, or perhaps later?
>
>I have no opinions to offer in any direction, just drive-by commenting
>here...
>
>
>-- 
>Petri Latvala
