Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1E1C0218D
	for <igt-dev@archiver.kernel.org>; Wed, 29 Jan 2025 20:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBBE110E186;
	Wed, 29 Jan 2025 20:16:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JEY34O1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534E710E186
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2025 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738181791; x=1769717791;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=2eJjWvkfQgb5eR5CsGXSikYj8rSOhQDp+UsJo+TkecQ=;
 b=JEY34O1QBIehdR8XunWxVbhRaOIUQ7Y0qWg9z2wnoTMkU8jI51hVhZT/
 fYxtR/W6QXxQWt5dSrLiB+nCPsWe7pbR/YWmCIKjMwFRSrIP6fuB45LZs
 VIZ4ew5etxf1mQLBiJQYPhLNWEzgPQJYdBK7oeO9VsQvQcAStEYQ2Kx+6
 AKvhFeOQ0/vEQ4FfO/stSuLhQf1vkhSjQDCORTwxe+6gvMjUGEqV5eojA
 qn0FDinye0vGuNWCLMqd2uKYg/l21gihmttJwGbdG8h+LHk2mfbbkcfaS
 MD+ZVLqoH6DYQYC6BtVG0atGI6XxOnlELZQh3vXKCKo+2+4zAllBx5fzq A==;
X-CSE-ConnectionGUID: 3XFUzoGzT32OhC830GOghQ==
X-CSE-MsgGUID: LcGcESGPTFWVDJjRyS+Ckg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="26317614"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="26317614"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 12:16:31 -0800
X-CSE-ConnectionGUID: Pg900CrcT1yE8qL706P7kQ==
X-CSE-MsgGUID: D32gQPUESFqY/+0Qq5GcFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108989000"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 12:16:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 12:16:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 12:16:29 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 12:16:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyONYSwwCicDOhcWWS8LgNfkd8+T1tcRQp6IvWOfrezPzcCfjy5ez8MTWd+ZolkRbzY6iVdYef2JyoNMH1AX0lOQcD/emZhk//z41vy915y3iUeJADlzaOH3ow1r5QVVmGIvuJjtjoGLBIyil6SeD3eiE7zGi/W9lPxdKEMavRAXVmU0sGIxY6oUURVzzcjht+3IQslmkZBRQgDtvr3ThicWigy1NmURNMr0F8siq9blyVfeDFJGeZi0E3P3zLle35wqFqpY66c1eeo0ZpohcvHV0E5YCPXzD6IZIywU4NJ48WNMTiA7wMPmbx2qydAIcoUfXt2MjjAn6OlBl47OIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K473tuaElwnxCXlB0vgBOXnpJgSGsJhQsHr8L62eOLw=;
 b=RM/mr1x4+Vj1pTWndMyIxzWSiwcoNAR/D0hpxA4RMAWAUEyM+KqhSAhd6bhpQX9JbL6Mvon5mKtoCncnaNOIcbjbRjsIue/bZ9zbmdd4S8sT2V+hLsFFjdfUimixSKsmTmWoS1bnGc6GCCyUP4YZPQWR200xyEhsuIucFdsxLTdGXZbJW9qAbkug5y1p5VNFaGQ553MqfwZqT3edimRW9DLXhMDvrrRYYTD7aP/Xr2XWSvBXnfz77aGKreX7u12SWM2KzaEbskyojRSxhKsi3KmoM64YfahdDAdgFjY6PYn5m44Sc5wIKzi6tTSOQ/8SBOJDpbSoQZgTzyrzTADXaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 20:16:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8377.021; Wed, 29 Jan 2025
 20:16:00 +0000
Date: Wed, 29 Jan 2025 14:15:58 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Petri Latvala <adrinael@adrinael.net>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Ryszard Knop <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
Message-ID: <7j2rehyrib2v2klagbm2uzj6iguyc3ke6ewrrdcky3k5qq32i3@o2nduv2fhll3>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <20250128183744.zegxv5uougqwvc4a@kamilkon-desk.igk.intel.com>
 <wfzokcb257qutd6324fku62dkdxkm552xtcftue7m2zaxdryuz@e5sdrclgnjxr>
 <20250129172348.x5osrkk4yocdmdpk@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250129172348.x5osrkk4yocdmdpk@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:303:b4::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f51eac5-7863-46e3-3560-08dd40a1bf93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xnu1fyFD9zDnwilQhdrXR0lhdw9Az6/P6iX7rWyhTzbvKqHM5KPwSTPXli7g?=
 =?us-ascii?Q?jKmNAX/YU3sNNDDYqXeyBBcFuygGLfdzplvwVoBa4iIT6XOOTJDczD0cyj1K?=
 =?us-ascii?Q?3FkrMHqSw3a+6zM8gziraL3fHuzNqKRdDB0GsabzntlKpy9RFWqshRKvL2A4?=
 =?us-ascii?Q?zAAQtEoOdtnkY+hjRXXou9LbwC1SQiiQkuNya6FLqndn2QNQf9p0YFFntPEz?=
 =?us-ascii?Q?ivpZdyNyJHCbombFT2BTisLyKGAGeeInQ+AKW/NKajsx8L3bqKpVuFVD8XGw?=
 =?us-ascii?Q?2FpuhWexdUjip4sndLWcCU2DpdGaWKgb07Ji6aKahvqDvF/5e0LaIkJpydiK?=
 =?us-ascii?Q?23Q6GA7cY4rn50aJYpjNkym8IZdjDs7pyntnNg24IUxXPiKpTERECbCeNzsQ?=
 =?us-ascii?Q?FZFCZed9fD0amxy9CF8uBL42E7Gld7iP0tmGWc5GpIK0JDQSsiVd9E4n5Q5R?=
 =?us-ascii?Q?+B1NhdoIru3SwxyU9ruZw4M7PTwk7d8a6oCXkXgqDeT/fHrOUNtAiO1EaaJr?=
 =?us-ascii?Q?C8GT+uEDRi68fesn5CPsux074rKHwkfubpkSIZOSjbT+zTCHKsvvblFUpJmx?=
 =?us-ascii?Q?TqhYSBH6sSLuFhtqYV8+hnGmF6EYkmzfcYgalc1BDjhw1SjdeS95j4D9ofuG?=
 =?us-ascii?Q?ZgSCYPU5MwlZ/KzUv8BZL6BoVDhRvlefmI7vi0pVLeLB5OBcga1AnDF5VyIO?=
 =?us-ascii?Q?RDAgVbfgBXkcLn9j1fcIsMlTQwTlbPaPozC8syzNWDMdwp6ZmRoX00Mhn1U4?=
 =?us-ascii?Q?YwGjN4+AO/8OpQRQ8q1SC+hEq818dEU8pcBAPXY/GH+Rx8iArq3MKN0ST2Ly?=
 =?us-ascii?Q?IDSbTq4yOt9oFGvJysLpljPelDdRWNdg1alO12XS+rWbefUWL3iSjkW8flQw?=
 =?us-ascii?Q?Gh353KeWeNcM5arNJPyPbn80Kc/DWPBysZolvCAgO4XlLnMxly24iPcjYblW?=
 =?us-ascii?Q?mceItEg3Uyj38X5p2C22BfEELABjZvrF6+r2hC06ONIZ+tRuhTNwsH1AEh9r?=
 =?us-ascii?Q?JMxms6XisKPA1p2Bqnh5R3nrssw2y7ahByjxkMuNXtRO3Na94hYNNnNaWfzj?=
 =?us-ascii?Q?SZmhTgk/gRsipjpFZVBEeM/0093bgHN5iWALhPeX2x8LEP9f/z1Ild3V3EDw?=
 =?us-ascii?Q?7+gj+3p69ZftZCLoAe4Tw4pdWcQOL6oTOAlPwcHXLpkOgDdOYmj9JYwJmPqW?=
 =?us-ascii?Q?hwWamFcuMdhrxmvSaRUaguM14G+gqvK6C6RMnT1E3DcGxj3Zs/ytMMkvfPW1?=
 =?us-ascii?Q?dgg3EBXGus7q/clx4vHsgWFJ8RmVuKynXxibR5FK3Eel0xU7yLdttfW7Q600?=
 =?us-ascii?Q?St4EmVasQpJwLmDsjqChrNfYcrAd3OfsYeZVoTEJi7Q2boN2cH8o9UwSY3+f?=
 =?us-ascii?Q?KfhccNhmA0HMiD5SyrcbPcOSMAR5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0Lw3miaSP/jtocJUsYApD1IC1vpkBJI2EYm0lfxOkVxmt8azUDniawAiK1dm?=
 =?us-ascii?Q?W6rVd+XKqotTZcZRzQ4W9ZgYAn+UCOQi9spDu8WCn5+hJhhhn+NDBJVnV1aj?=
 =?us-ascii?Q?3fw9WO1LIL3oS3pxsAjnbNyoefly0J2TFL+W+lgrp1LwKdAAbrOJPb+VvwNP?=
 =?us-ascii?Q?ZPaLl4GKcvtHmKWOkPml+XtfCe/9TxYTYJZy8S3yJS88gNoLuSwVGzPdhyFw?=
 =?us-ascii?Q?Z0iMajEDErJxvcPnF/5RwxkRczWbILFbtr0+gudptHaOVRno9se4EkNffK+h?=
 =?us-ascii?Q?1bMiXjE9sqC44CRE1e/n3SHs1iJQnD+MssLETOALhNbhPSditEbaST/60P15?=
 =?us-ascii?Q?HzDbfoYuIr3p+3w5UirIBAWVhH2KHUa5Kc4iPqiwOtKrDA5XfxX6cV+xPnld?=
 =?us-ascii?Q?h6i2jMnwB4GQ0BdJ567cQk/XL3e8Su3ERZ51KVlxv9Ku8gaqcEhYMkQINicF?=
 =?us-ascii?Q?my261RBOnRvvtNhH1EzOykXbo+ErXCKq4c/z2PSy7v2tPOC5bRyuWAW8jhfL?=
 =?us-ascii?Q?S50KGtXHfULZrcVCmliz7d713h/MU55Q3u7BMakmXgxk953y6DnaBCuZtMBE?=
 =?us-ascii?Q?ltsb/zr60EU4vkUBwgClFIVrHpqg2TlgKiJqfrwvOYZupenKoIl1IhvWXlcR?=
 =?us-ascii?Q?iqwGmg7Uign1PfI49k5c08Bzg/qamut7I42ZsjZNMMUFyKGusv9gNVxpAnis?=
 =?us-ascii?Q?yvxYvMBgFTqgQpqQhFn6wyihrK+RBaynRkv38cd2i7AfnFCGD4IOlbkTkwv7?=
 =?us-ascii?Q?gaSIYFmh17waf85enAzZwcpFeIaAnNRrNHRezg3sTd86iiXUyXi7WmI42IQR?=
 =?us-ascii?Q?qMyCnolrNlCTcbzUEySkbayPHxubvsCpRsbu4eO9CCCszLWyXlP35vHimrgT?=
 =?us-ascii?Q?1L0RSE+KKbUmRzMyynoPLujD1LOu9+FZzbZkPajVBwQZ1RpOssSYxP0Qh2iN?=
 =?us-ascii?Q?LrMvv+7gyBSA2ipLZbn6d27+z+vpcyTS2bam9HnbVHfYrKoMYF3939HXggOj?=
 =?us-ascii?Q?SvxTPJYhArcL5jQ/raL/5hZW5jCGjKyPcqEGpVcX2S0+5RHijS0RwcJ/VZgq?=
 =?us-ascii?Q?/ZGEZCnuSFy69BXMX930njiuGGZDWnZUTDysvn/WHNYC0t4eIUbWx+A0JCwy?=
 =?us-ascii?Q?aJP4BFDZAezvaLJmpu7hPV6o0sTz2n3gsN7lyZRe3zBsZ4naVkrPMxFKDwXU?=
 =?us-ascii?Q?mefVLgTGAG4K8Ai7bK8jEwWeQnTsI2VaKIRaf6MiywmSgOW+txqRbqpJ+mXG?=
 =?us-ascii?Q?fNaxkSBC45/pj1K7MDdRNV2DYDSN4037xku7p0rql24PG5jHCUn6SpTEPedc?=
 =?us-ascii?Q?nghYgK1NMrjio0Wlz1AxvPJkEW3Kp3QecWL3tqxTGdllyuqWZRfHJ+4tIuLn?=
 =?us-ascii?Q?+cyru/uJcQ+xclXl14K9JDRgPeSmOvKPIC3aTmqw9B6SkD/0cna9Ayz8Z0DH?=
 =?us-ascii?Q?KGDOMjZHw6kJ9yZtIi8buaIR/hDcl4ufOwOIGlm0rjqAWiQ5VEDrXFk9/XhW?=
 =?us-ascii?Q?+OsgWX9FB6FBRf9B+HSsM9jNb7QyV+dNA3LCrzlNKSET3tD0EVETWVQhxPDf?=
 =?us-ascii?Q?Hs46itgWSVsdvLdNCsciU8MV8vtgahVaugouGPgenGRqwAN4BOuYKU728lrg?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f51eac5-7863-46e3-3560-08dd40a1bf93
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:16:00.6170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DbSrNQoG70AH7ejLRE6+6DbvPzLwlkqJnFeYwwsyxqCCGJ/t8B7n0T3dAwK5VUvftYyYql869v3fJFNhdysNszo7KKJvtvB0xGn6LjJMKWc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
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

On Wed, Jan 29, 2025 at 06:23:48PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-01-28 at 13:34:24 -0600, Lucas De Marchi wrote:
>> On Tue, Jan 28, 2025 at 07:37:44PM +0100, Kamil Konieczny wrote:
>> > Hi Lucas,
>> > On 2025-01-21 at 14:57:32 -0800, Lucas De Marchi wrote:
>> > > Serialize the command line to metadata.txt. The expected format in the
>> > > metadata.txt is like below:
>> > >
>> > > 	cmdline.argc : 6
>> > > 	cmdline.argv[0] : ./build/runner/igt_runner
>> > > 	cmdline.argv[1] : -o
>> >
>> > Sorry for late reponse but imho it should be saved for debugging
>> > purpose but not for reading this in metadata.txt, especially that
>> > this option '-o' is 'override existing results folder', so it
>> > should be used only once by igt_runner in setup phase but not for
>> > igt_resume.
>> >
>> > From igt_runner --help:
>> > -o, --overwrite       If the results-path already exists, delete it
>>
>> if you are using -o it's just because you don't care about the previous
>> results and want to completely overwrite it.
>>
>> igt_resume doesn't have any option - it doesn't have a -o and it
>> basically does:
>>
>> "Load the settings from the state dir back into the settings struct"...
>> igt_resume will read it back and create the settings object.
>>
>> The results.json as architected in igt_runner discards everything and
>> is basically a conversion format from the state dir to a .json file at
>> the end of the execution.
>>
>> >
>> > imho we should save it into some different file and include it into
>> > results.json
>>
>> not sure I follow... metadata.txt has the details of how we are running
>> igt_runner and it's basically a dump of the settings object. I don't
>> follow what's the relation with the -o option you mentioned above.
>>
>> End goal is to have the value in the results.json, but I see no reason
>> why the intermediary state needs to be in a different file.
>>
>> Lucas De Marchi
>
>Well, what I try to comment on a commit description:
>
>> Serialize the command line to metadata.txt. [...]
>
>imho this should be written in setup.txt and setup.txt should be
>included in results.json There is no need for igt_runner options
>in metadata.txt, as it is used by igt_resume in shard re-runs
>after a reboot happens in a middle of testlist.

it's a state *directory*. It's not only metadata.txt that is part of the
state.

Lucas De Marchi

>
>Regards,
>Kamil
>
>>
>> >
>> > Also +Cc Petri
>> > Cc: Petri Latvala <adrinael@adrinael.net>
>> >
>> > Regards,
>> > Kamil
>> >
>> > > 	cmdline.argv[2] : --test-list
>> > > 	cmdline.argv[3] : /tmp/testlist.txt
>> > > 	cmdline.argv[4] : build/tests/
>> > > 	cmdline.argv[5] : /tmp/results
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  runner/settings.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>> > >  runner/settings.h |  5 +++++
>> > >  2 files changed, 47 insertions(+)
>...cut...
