Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AF8C001CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 14:29:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A3510F113;
	Thu, 11 Apr 2024 14:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TREQ/g8m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEE610F113
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 14:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712845759; x=1744381759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7VMlrYQfbpdez/w4TcbfluhbmT6X9yUywc6ADbDpua8=;
 b=TREQ/g8mKpl73Lex+Sqr8hMWsZoiVjMGaEnZhKnOBlH7kAvusnXnF3EI
 4pxvK9oElIto1FBn9Tr9SmQAXSUNIWemB956fd5ZiOj45eujv6/2w/RPP
 qedI72Y55uc2gxSBId7vAactVq2wCvD+Ce9WVoHZdLIjPPSvQppWYOSIO
 Z8Fg9v07b7H6/0pzdHAnXCXYHSaWfWZP1oC3qDGa5BUsHFupOfvLhgVpA
 Ppa2oJpF4E+ZkCWOZn1jwrLwjqj9mHRVSLnr+ifShYHemdCzkrgqDSOvO
 lVmLEiUguV3JuM0FC82e6HCkIR7SdKjXJwlZ4adxMEYTTauKAonE9VAtE g==;
X-CSE-ConnectionGUID: kBY3EHp+Tsq98b6eKKqwHw==
X-CSE-MsgGUID: StueWks7STqCdoTQdzoTJg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="25712293"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="25712293"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 07:29:19 -0700
X-CSE-ConnectionGUID: WK8+ghClQ+ODdTZ1z01oWw==
X-CSE-MsgGUID: ldYJ/YddSP6b4rGZO4ymQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="21357448"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 07:29:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 07:29:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 07:29:17 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 07:29:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YR7e8DdTDMhoGUl6QznrwuVlDI2+sipnke77DOeBeuHYAbD7jV/8YMTMBidBE7+W/EQ+8hpZPNjg7xxes9yGmkcc67YTq7niayrN7L+mBAiXZyl3161KFw540XHUO/S/SU60hl2Lt9FwBzsAyAl0nqwTipZI/DXGNW5E7FXQroqPZSrcmELpTGKR4if07sfZOwu09OMYUaDNAPfbBrLu5QlXNZo/gHtXp21ZjmZ/9bAnxHaqyyNP8K9Rv2nb53qStO9VheabX0yVakVB7ewWC8eRF5mjR41evwxsPO17WjEz9cfXAdMQEVD8QEMZDw3mgMYpRG9pCPd4MCApCOJfbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XokeXcflGunyX/eru02eteVUf9f7cm2LtHdd1yuoTV8=;
 b=UVIaxAqdAm4xAiMz7dtn16ZkLld83dFT9Na6Af4xZ8S/kZZWIfdeL8RmmFRtqZF+ma+WRqq/BEcgWDQLikKKKb7a/rt1gRZt68i+22py4aPtkxjvy//iRR1N68QVTCvaeRpjGr3M4XrzWGxlbrZve90ejELLQwfiNlFSPzojdeylG0m6agYpJ71Vur34dMn7H4zy8GMRp32/qEtuqkFWfQ7UAaiR94giBTypIMWO/oqg+CbpwByVhAhyPHbaJ63yi4VQKxENv5vxGlYKccGk23yoF4XSlY9fuSCMi+5WFs8V3Ctc1hgQ9NvAdr9OqDz2ZH64ZrqWYWJOBfvoVHUaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6141.namprd11.prod.outlook.com (2603:10b6:8:b3::13) by
 PH7PR11MB6450.namprd11.prod.outlook.com (2603:10b6:510:1f5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Thu, 11 Apr
 2024 14:29:09 +0000
Received: from DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::2875:354f:eb25:a4c5]) by DM4PR11MB6141.namprd11.prod.outlook.com
 ([fe80::2875:354f:eb25:a4c5%6]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 14:29:08 +0000
Date: Thu, 11 Apr 2024 09:29:00 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
Message-ID: <75oqxqfgpu2gop5zq37hctzul7ztx2r2gwigxvl2trmwomn2lz@zqcsidtq627p>
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
 <87le5k7028.fsf@intel.com>
 <bwwkqrnrd75zdnllhhtw3bapgz3fzdv2gjestlahdr4rxohxx5@5xgdosdtqwsa>
 <87cyqw58x0.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cyqw58x0.fsf@intel.com>
X-ClientProxiedBy: BY5PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:a03:180::18) To DM4PR11MB6141.namprd11.prod.outlook.com
 (2603:10b6:8:b3::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6141:EE_|PH7PR11MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f55ea2f-9c02-401a-8313-08dc5a33bc9e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e69Xj2x2pHqy+xEyzKwWnTZetzq1SEd+/5ywHfROrOFAb56Y1oyt6GL6yPFBDtzIZsx9W/ZP66w+8K9yNBCgNSqwxxC9sN0V3EhjRLcrSeNI7M52p/MwNC0P5kp5HhYvDm6NA72BasoU2fuNmHY5aX/OZ3UkjnRpNVDCJfHXBjx6sX/Vb/DKdgoJNTcTVM81W4GEc7ARnDZQ2tuMXnwfqbHXgtEZte08ONIqJQt3Y/nrmprOS/vaEm2L39PCUThCm5WFotsifEA2ELqZpwryFTSFwTgzSRiAFXqSJXbDLOXdmb+CT4gFSzUMNp9FjZVVHcSnsBpm6SBpobPOnJ9gDx7+Ts6F6saVbpgFP33Q1CAGqT9wWQ5Dyw0FWXrM1v+YnyOo/KljWdhh7X8UdDeX6ekbse3hyBLUlncob3ee6CEL5zFGhiZLS21LZ9mGLax5+CXjVdPxvfV7tkcWsH9NNMW0jbvXfMb3P8MpXrL+n6AagCwmq38Yk2oFtBVI06wSM4i/zM9my9q7g8UMOv8iSHIA/j4F5RtNFdQO8nvBVtgBE03K7zb8gcHQLqUx66BUKyanJ+vUtdx6WwkWMIbYPQFjpmyZa72/hN/Uc4+eEDdM3NEZcJqnTrZYzBwPWu3tHw2nfNgr2dVUvGEN3CAEDukshS6HiaDP+tD/md9Ka/k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6141.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RE3imgyJNa9V1eWYu//O4+uAEfYhQMM/XwRP410g/L3Op3YJkFQBT1wve5pF?=
 =?us-ascii?Q?PMBcXU/ONn2znNTWsgl4W+1D/q8pz9XCEDteYYtnOMPsR8145uZSFRinJnEA?=
 =?us-ascii?Q?j5T3IWEuTOLPCEq7XfGiyWF3rtVEIm6lFlljtP9LnaHeumyiWLNgU33xz5xM?=
 =?us-ascii?Q?a8dl9B5d7HEviaTnE/91T2eUiSUPQZIANZGqdN7EI5QX14JCh48h2QfePD0P?=
 =?us-ascii?Q?wUJGVyl696jLQhx6cz48lYvzIMJHdm7X9Wf7T5Zbtmh625RW0u9v52ufYiO3?=
 =?us-ascii?Q?RmrNLARRpVqUy4CA4nLORZp11rFoAOH4r7CO0duBGErM8H69cgV0U2CvwaVP?=
 =?us-ascii?Q?tT7zutmXcRLOPHNCd8kK+ZuNM8tkQq7ncI6y5T1ecnRb68nUKJxgmmsFUtGz?=
 =?us-ascii?Q?J4mxhcsZniz5c2U2PhGe+PkhoHI6RjdaI2wuHX0d6heaasPE8QIZbxq09EfN?=
 =?us-ascii?Q?WAIXRC8QEtzG2N5/IujBFAm7LbMfK4nM/kwIJvSMtTeogeUOx6pbWisDBr0k?=
 =?us-ascii?Q?XPcdb54heDOzySdQKslklLkWIAqnciJEZ2cFcRt9INVWvJSr8p9liXJL6KiC?=
 =?us-ascii?Q?QeB8JM8jr27iPvNDzSRqzIOxL2AeTzVejJ0o3k+N7BWvMW4ui/JbRR/a3Wrq?=
 =?us-ascii?Q?7b6V5G4TkwH4C2Ma+lByeP8xVd5Arkp0SSyERpQ1D5dIah3oC1Gbpd49mcsf?=
 =?us-ascii?Q?pB42Aa/LJXrUDjEQBooytNvpOBXWVZhgqBDFxKw0kdN9P9lUBNEEStGUmU6n?=
 =?us-ascii?Q?B8x013H5Ft72kGIzMyFLtwnUEf90ujiqcw4qySvm1oaMFSQxsRg4H4AbrjgI?=
 =?us-ascii?Q?wP49s+H8R74423PYfrsb0T2GHtRqiUlMEwCly8judApai04FvB2eeb9V2432?=
 =?us-ascii?Q?H7+siUxRRCwkxDOs6aQ4STWJ24NWe/T1Dc2h/HTOD5uHhnWkwgFULic/FknM?=
 =?us-ascii?Q?o0kEvJEsxlJI7c4G+mLfuwRqZUQctk1Go22IsyarKS2v5UKrnI3bxgMvO90b?=
 =?us-ascii?Q?t7C++m/Skfmxe5LA1phEWz0Y5TFcdQXTt3oLTSAeoq19g9wwYWdUvXQksZ+9?=
 =?us-ascii?Q?uVcDTlDz2foPm/jKzaHBdXlHqTWZ7lIAxkeLHU0iRiX4ZBk8/fkB0YhiUGdC?=
 =?us-ascii?Q?EPg+SGo8d2WiZgnnmVbrOdNKAUQBCsK8Rm61/ywABObOWrDFJhphI9c6r44D?=
 =?us-ascii?Q?8IY7Oy8+V6BRsJEyKRmzcODSJ3JdbUnRZ3uKgg8f2/kreXtFGndIoGTvPT/h?=
 =?us-ascii?Q?VA1AEmwvritQSyRbJdkX/KK1GOP42+P/zpPN3pjOidbI25g+C9dyO9ERXNm6?=
 =?us-ascii?Q?4CFfyPShI16m0mw6wKVPs4pMQz9OuRgbpYpcPBAJ19+IZzcupQwPaD59F7RG?=
 =?us-ascii?Q?pNDLCR1y+4pt7Q6AtOqVibX+AuSDC/RT2pOWppKTMdhp8wXgbVrkpMWZTXuI?=
 =?us-ascii?Q?V6eyJ+fLMwQrdF6M4m/PquLydCOQPwvuzWX4HyGUzlgVnPoWMo0HpgFZnFwC?=
 =?us-ascii?Q?Rf0OA+z3vj3v8CvTOpdpoz0kEs8DbEAvvqrIwMYPst772M6RWF8e96T8vaZC?=
 =?us-ascii?Q?Lc1AlRqveTEry3I/CXIbuNQLZK4E+NnLhbG2ipLtiWgoo3UJ+Zf9TSU29ZSK?=
 =?us-ascii?Q?FQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f55ea2f-9c02-401a-8313-08dc5a33bc9e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6141.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 14:29:07.7181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjCFvtexEOMO+lMNTBg9u3lEljfmFRMG5zQsZcFgohTPgjh7vPxaF3YHdMmRg22TNXURzRD/i2swwMXxY6cm/Z57vmNdrm94/1mnMRFYuQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6450
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

On Thu, Apr 11, 2024 at 04:24:43PM +0300, Jani Nikula wrote:
>On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> On Thu, Apr 11, 2024 at 11:53:03AM +0300, Jani Nikula wrote:
>>>On Wed, 10 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>>> Stop suffering when using igt from the git checkout, which is the case
>>>> for all/most developers.
>>>>
>>>> 	$ sudo ./build/tools/intel_reg write 0x2358 0xdeadbeef
>>>> 	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
>>>>
>>>> Pretty annoying when you have a bunch of commands to run and don't want
>>>> to simply ignore stderr.  Keep the other warnings as if the file is
>>>> there and can't be read for some reason, it's good to give a warning.
>>>> However if the file simply isn't there, let it pass.
>>>
>>>The TL;DR is,
>>>
>>>Acked-by: Jani Nikula <jani.nikula@intel.com>
>>>
>>>---
>>>
>>>We have the "register specs" in plain text files so that anyone could
>>>update them at runtime without building the source. And conceivably they
>>>could be generated from a more authoritative source. It would be nice if
>>>we could incorporate the info to the binary at build time as the builtin
>>>register specs (so no data dir lookups at all), but also be able to
>>>override them e.g. using a command-line parameter if the user wishes.
>>>
>>>I don't think that would even be so hard. But it would arguably be a bit
>>>wasted effort as long as the register files under tools/registers/
>>>aren't updated for newer platforms. (The current builtin register specs
>>>are completely out of date.)
>>
>> I don't really get why one would want the tools/registers actually. When
>> I'm using intel_reg I'm already working on a very low level interface
>> with the hardware and can simply pass/read the raw offsets.
>
>Something we wanted but never materialized was decoding register
>contents, like the builtin decoding does. But I think with the pace of
>registers added and meanings changing from platform to platform, etc,
>with no automated import of the specs, it was just too laborous by hand.
>
>And there's also the dumping, and it's kind of platform specific what
>should be included. I think that's where the tools/registers files
>originated.

I don't think we will be able to invest time to manually update them.
I have a dream of being able to partially generate the regs/*.h file
in xe. Maybe if we ever achieve that we can think of using the same
source for igt.

But as I said, I think we are far far away from that. What do you think
should be done in the short/mid term?

a) this patch as is
b) keep the warning for verbosity > 0 as sugggested by others
c) just remove tools/registers to simplify the code. To be added back if
    we ever figure how to autogenerate them with the same source that
    autogenerates the kernel
d) something else?

thanks
Lucas De Marchi
