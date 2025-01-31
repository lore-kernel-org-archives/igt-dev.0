Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82016C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 15:39:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDD410E389;
	Fri, 31 Jan 2025 15:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aTT5rCsP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70D910E01F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738337994; x=1769873994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SYyGV2kyfKpZxqSUVDj8xW8FgLzCjIviVi8nxHhzrNo=;
 b=aTT5rCsPzQ1gd8uDNL9TOtDhMJ49ENifswvheUxLpO4qFPKoOs/oHooo
 /xAsW3kbK5b0LvDmzTBoT2qZg4yKwTAPsmDrybXDP+GnCOAoTv4vCniRd
 IXYSSVO8hTqPOLjOioD/tENX1IweSg+F6Nrwb4+/xrjdgH+mogzh6d5lR
 50YK2cTOIlRVGcOkYTRWi9RKwdopTYFqOnjMqbI1vO7B7Rq3IZMhl2/jY
 79ou9753EnJADlRIO5VbAa+63Yv7P8LdtD+z5a9+ccrTQdxU6e6kSIgC1
 BtHCqu2i+ya0wbGBcPf3RV44brZRFV/qLJhCDEXPNklM1v3qdCrSUoT7j g==;
X-CSE-ConnectionGUID: d08ir/BbRf6KpfEIsnvQHA==
X-CSE-MsgGUID: VcwWZnRDR4+rNsPsRlGB5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38937243"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="38937243"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 07:39:54 -0800
X-CSE-ConnectionGUID: Zlw31Tz4TxqFORd4v06MjA==
X-CSE-MsgGUID: DWSb3JA5QeizQC9kqCjAgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; d="scan'208";a="140545100"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 07:39:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 07:39:53 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 07:39:53 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 07:39:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1n5bzn30yiRfaxSM8U61KX0xhFso4cWKe6STAnC4CbAORrAj29n0jl5oybwKnl7Aq7EWw1hFJPhlun30y6ff8zhCPRq/+bjasXMR1CfxQf0876ach9u8rYp7MfbWbZzokBNMeJ29JPZwMVsCyvTQEAjJmZ+eF0xuKWfEidR0K//+oENp/GwsIADIYnWYVI+mHPIMTtVYmLJ9VMCB89UF1gT0nQp/tL0ZKpGceE7RqT2Y0Ti2gOmHjdrz27Lv35OATxhzlASWXHFkf+1MyzUlSYA2R+vWPwEXB8n1+JeJIaXtUNuLTsdmrqlJgzzVArFsTp5MA12M6Q2s1Y7j37UAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyY8dwyBqAaBeFafWXPqTYaFRs74hMUuCTooO+UILMk=;
 b=o+PNHASDTFj5WaXdBwztd/6MWtrXYnux0lkNkT5fBKyJTvdp1KxqRRh8aY3+r1TSkrS2LqNwafmmi1ZKBmAPN5H3luSASA4WYm3gN257CEdXQT5xFg3BYCUlzQ5BxRDQF1sIfSKZiPuWXZ7JB1A1uWaiTRmrU44hLMA387+fnzqSCa3MANLOcW4EHROQieUZW7jXK0fASVA6sYMJap0DKJwhpV/Fx9AsIhCbhSegjj6c8iNV71DsXUykNfgiQRWBhW6yVo7HilUP/k13B5WIgtV1GnQyxZtd84GLeBRp7/BeeRmjlSldLKoneoj3CUDztMc1SDVb1dBQ3B74csAG2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 15:39:51 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 15:39:51 +0000
Date: Fri, 31 Jan 2025 09:39:48 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Ewelina Musial <ewelina.musial@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, Petri Latvala <adrinael@adrinael.net>
CC: <ryszard.knop@intel.com>
Subject: Re: [PATCH i-g-t v3 10/10] runner/resultgen: Add cmdline to
 results.json
Message-ID: <vczm2py6pjsucj2hknasbmoxtzbhmn5lcdunn6fcfaiiztvoa7@fjayk6egvaq6>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-11-lucas.demarchi@intel.com>
 <20250130190055.qn4xxd4y4za6ehuz@kamilkon-desk.igk.intel.com>
 <nhqlawqsr7kwrsuvwtxq5s6yafbcmtawotaxarp3amng5dospx@n6i3bf7zp7jp>
 <20250131121619.wkjj4isz2cjdjilf@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250131121619.wkjj4isz2cjdjilf@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MW4PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:303:6a::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: bb43b9b5-4d7a-491d-e736-08dd420d8033
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uGnOULlgPnpuRYKboSVX0er+GlFrWJlf1iqP/NJH6KjzyxT+J3lBT1Pnbd/E?=
 =?us-ascii?Q?69JssNF8vppy6p1Mhf87RJcfa/1zlbxAnLI4S6JMX4lhCFUq05ShRJ3hZWp6?=
 =?us-ascii?Q?dF7r0QNf9eM1cPEf/KAs2xOBcITTbhYXNwsKLnQ5DuwrgSpZ0mgQLYTLcc2A?=
 =?us-ascii?Q?DgX+b3WiWmyOjavNLQjYsr2sRDRxhZIj7x9TkglNmu8Dbg7qSm/xkilXyh/N?=
 =?us-ascii?Q?7Kr+DjkuFMZocDP11/EDb2rI47CJV2MkI23GNilzDjNlpRW0ZCiNejIdvkcW?=
 =?us-ascii?Q?kKjm3dQdwLU2Zj0LMP87JZSgPg0FDKagZP/cO81q5j/mAI/lC7+On2SigOQu?=
 =?us-ascii?Q?WpYET6p15SlOQGVS7aCDV1V6+pPt6xLOLvM4HZwOdYveM3ub8D8h2YIDQObT?=
 =?us-ascii?Q?EBqnPyiTKtr2lA1pilx/Et9nen/+QnPNrsQnhVyPCiyK3bjLMBgg8xAha5UZ?=
 =?us-ascii?Q?y+xKo0yjVFzXSCIrSqJDGhliPeljUdF6fZe0aqCoK3LJO1T6bocY++41Hz4I?=
 =?us-ascii?Q?YYLsmAM1x3ZXfifOiIbEiACGOp6tmmkjAGBjlidvkQPVZWLYMlx1X0Lp7b8P?=
 =?us-ascii?Q?HDAzLI32LNXMI1EvnIqnUYCLYPCtGf9sr+sLepRuK4lT9oxLvHqL326/sto+?=
 =?us-ascii?Q?CV8huPaT+agg8bpiUCW9+YCwoGrrzAqbKCu8bh30Ai1socccsqy5SGdCmtSx?=
 =?us-ascii?Q?DCBBKbhFXenxSi4BFwNurCV/INzrXNdTtTVC8LowkjaWP9H+K9fhYbks2zDX?=
 =?us-ascii?Q?DDZ9lkixEh2HOevlsFq/otjn9wVsdrTWigILzLeUMP9lW9QJ1vlC5gCgKK9V?=
 =?us-ascii?Q?ZH24vxuVkTyOJOAfkJogOcysiMy6BmOQf+0ic3rRJYaGkwMIzqbcKvrtTj4A?=
 =?us-ascii?Q?fUnPOs5ZIEK7fX5Xptt47InBXpkGkT7jV4WfQDRtZd7nJnf6hVQ6SPthVRYr?=
 =?us-ascii?Q?eXUr7b57GaLdxmhUUP4bSagrMxzxG2BgbjMUc+ds7jHiLOiQrDHLisWei72L?=
 =?us-ascii?Q?6XrDg6JAAv8p2Lyx20iHqhtAM0UuYDuFjedf5OHgYQqX88KYKa18sZKOAhEE?=
 =?us-ascii?Q?18mZd3XfwQ9meYLhsLxb76b969WlM3GT/juJ8YqfvlHiSRzE1XQqlUmt8+q+?=
 =?us-ascii?Q?OAkuP0T5fBaaS/F6cdHZBJ77GtoSCiNexYWsZxn8/F/1JiaEEmL8tunpL18x?=
 =?us-ascii?Q?CrTfTQ803qwxjRJdu3NqkaIx3ZIb9aPUz9MFToxJfoGFvN08FsD2uYpT/nx9?=
 =?us-ascii?Q?RdqiM+cZKSOCPPD2RKXDWwRspwkKH/NYbYTxjoVhVpZafLHldWD2IZbNes52?=
 =?us-ascii?Q?rCtHjrIyMPCD59O8pJ6RU0QsG3UA75GHDc8jSn6W6xyd0A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AkipNfnVP3jJ1SKwwWhYw3hUghK5GdvP0qufz6sj3fTAgT7lpNPGmJFTdi0k?=
 =?us-ascii?Q?QBRqolv9vWZbzuwRS/QlrKqZoyXWfjspISOhVEFcFm5Kfzs3H7wabRiF4M/+?=
 =?us-ascii?Q?OhydBU8LFRnQmiF9V0JQyouXOprornHkcnknk3m+SaCLicsqV58gMVQypURG?=
 =?us-ascii?Q?+L1NlalDcUMCZszUPh6HnvrsK3rOQo8KWBEUUBFBSzbXmEGAiT/J0P+GirhH?=
 =?us-ascii?Q?iU9rxicXhdt9hnHAHTtjnW2A1COvzA/0bDbaFvnmakWMHt7lfTcjxirO0o3m?=
 =?us-ascii?Q?v9Nagb13hOuhKTer9w5povQNU76jKZ1LuXcK4fpkiYu5kJ2AzlZs4BPDr6Ey?=
 =?us-ascii?Q?mvSXudgCD8AzGIoaDTh0anm0lyGG3xl4Nqi8FSEPynDzv9Lt5sIy/1m+hKrw?=
 =?us-ascii?Q?ZnwhZQ2VXrilpoCYugTawgR42Ngz1wUwCZu/uQz4WToIE6wrWtl6Dm7L1v9r?=
 =?us-ascii?Q?YFJpFHCCkLHX4SYJHDgqA2ZP3pwHlfeqr23EJS9RvTYmMKTwjzsYPSK1cZdL?=
 =?us-ascii?Q?HXIBqXqgrYM2x07FH9GEDquzR5AsO8yMSiXxRc8KEN+0shp5oB01hkx/4K2g?=
 =?us-ascii?Q?ryJU640nLh1T6pEl5QfMSNWIWOq8I2Fz71C8/yadnC9tYapI0T1gdIuxZr6+?=
 =?us-ascii?Q?3sfVfnwVK8XxrWyWibFu3Iw6FhcLRPOO68tHCs7vyok3KVcvqygH3TlceU52?=
 =?us-ascii?Q?37/PwGcJGp9WOXTb/tf6BrG+x6CKE9P3Pg0HeJb3u1DzY7V7N9cYlCp3LNHc?=
 =?us-ascii?Q?683QfekgqvulAGTej8LgtuUXhqiklmj3yM6Jex9Jkr+8FIalu9wqtl5krmOA?=
 =?us-ascii?Q?bQiQFa6f/Ip5WXRT2rUq2GBclhoxp67PeOIm4XazOhCzLc8IGoh6tF4OUnA1?=
 =?us-ascii?Q?+W5T2XpkMJMuV0h5zPRbYA7cmiEzzLvv40u4Z8K/tntpP98Y3KFkS/XFZZ0W?=
 =?us-ascii?Q?azmE76pswlfQj+U6dcVeURAZZy7OiXmZCA7gYyOx80OPUkpZ42TJBrH001ke?=
 =?us-ascii?Q?gj6ARGpUOJLAO205CLJOhv9O1wPGeT4YPEKumebyV1+lvxMpsA8czzN8jhwm?=
 =?us-ascii?Q?gwmZcl7/2d926XSB8BAszEeaaXeU1s8v0556AUFO/9Ww63MWj2iPYStZF9aK?=
 =?us-ascii?Q?+2rOW00zgtH5Ep8vRRh6HCSrHd6eB2Glr49zzoeq7PUbLEEZ6VDg6GYauRqK?=
 =?us-ascii?Q?ItLh/Ci+rmk1Z04yQnO1UXCKLdfFyeCh5ZUdKQ3xF9fOkPdlAtwlJcQJ5Iv4?=
 =?us-ascii?Q?8sA1NlzEDS0xBMCZ7Oyi6dCwhhBWS6COKnakdJGDTS30HRcL4Wat3X1u2/GS?=
 =?us-ascii?Q?0EkqTtMswuhs5rBmdK65+Wd+Sh9tMgrLo1MjNVEfFQmy3mPmJSEoHEtzzhZT?=
 =?us-ascii?Q?1iXFJ49c4CaomxSphZy9Z4U8I/rgFrS+A1oYc+yeGmkO3cn2sEAT8YmUj1Yx?=
 =?us-ascii?Q?P8/xKPVUMHe4LjgUCW6LrE+zMEAr1ITNPEB6YiyjZP6wh2Co/xIX1oks+ez3?=
 =?us-ascii?Q?9qPUr097LKVOV/44lID8aCgOVBxoIswVDdeAk+3jZzYpEcmVdEVMUFPwD9jn?=
 =?us-ascii?Q?Y1Hto8TsU3/scF9jrOHtULVoPOIeooVaO4B3K2KaaTpXHWMUsxWWykyg5U6Z?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb43b9b5-4d7a-491d-e736-08dd420d8033
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:39:51.1286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rqmmQiA+pF6q7Fq2uBnQyW0ttfU/ZFn5gPtsgxLVJt+5onXuzMqCMR4M4nuSybJmOAbqnDE8A2yGn9VQMFdSqBTNFt8jNypUkwgwp98F170=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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

On Fri, Jan 31, 2025 at 01:16:19PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2025-01-30 at 13:17:11 -0600, Lucas De Marchi wrote:
>> On Thu, Jan 30, 2025 at 08:00:55PM +0100, Kamil Konieczny wrote:
>> > Hi Lucas,
>> > On 2025-01-30 at 09:21:49 -0800, Lucas De Marchi wrote:
>> > > For easier repro scenarios, add the cmdline to the json: one can see the
>> > > exact command executed to try to reproduce a CI failure without needing
>> > > extra files.
>> > >
>> > > Adding cmdline to the results.json doesn't need a version upgrade:
>> > > piglit can still parse the file.
>> >
>> > Why not just printing this into stdout before executing test loop?
>> > The same way which is already used by igt_facts, so it will go
>> > into runnerNN.txt log and will not be duplicated in each and every
>> > results.json
>>
>> igt_facts print things that is happening between the tests. It's
>> monitoring the execution.
>>
>> I don't understand the push back here when we already add things
>> like version, uname, execution time, etc. You could use the same argument and say "look at the runner.log"
>> to see the execution time.
>>
>> I want to be able to see things rendered in the final html at
>> https://intel-gfx-ci.01.org/tree/intel-xe/bat-all.html,
>> make things discoverable and also be able to download the .json, process
>> it and come up with the answer to "what do I have to do to reproduce
>> this error locally?".  A script `repro-igt.py <results.json|url>` would
>> be very handy and made possible with improvements like this.
>> It's a huge benefit for reproducing and fixing bugs. I don't think the
>> extra few bytes really matter.
>>
>
>Well, what I wrote is not a blocker, I get your point so
>
>Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

thanks

>
>> >
>> > Adding also Ewelina to Cc
>> > Cc: Ewelina Musial <ewelina.musial@intel.com>
>> >
>> > Digression: for repro it could be helpfull to have also git logs
>> > and kernel config but this also is one-time info for whole
>> > bat/shard run, so again no need to duplicate in every results.
>>
>> they are already there
>>
>> IGT-Version: 1.30-gfafef52e0 (x86_64) (Linux: 6.13.0-xe+ x86_64)
>> 		   ^^^^^^^^^
>
>IGT is there but not the kernel :( But that is for another discussion.

yeah... CI used to build the kernel with a LOCALVERSION env var set to
"-g${short_hash}", which simulates what's done with CONFIG_LOCALVERSION_AUTO

Ryszard, can we bring a similar behavior back? I think the main reason
to avoid CONFIG_LOCALVERSION_AUTO in xe/ci repository was that for
local/dev builds, it's an annoyance when you are updating the module:
you don't want to keep changing the commit hash since then module will
fail to load. However, for using in a CI environment I think it makes
sense. Thoughts?

Lucas De Marchi

>
>Regards,
>Kamil
>
>>
>> The kernel one is not since we stopped appending the version,
>> but it would be good to bring it back.
>>
>> Lucas De Marchi
>>
>> >
>> > Regards,
>> > Kamil
>> >
>> > >
>> > > Tested-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> > > Reviewed-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > ...cut...
>> >
>> > > index a2b79da9e..2c483fdf5 100644
>> > > --- a/runner/json_tests_data/warnings/reference.json
>> > > +++ b/runner/json_tests_data/warnings/reference.json
>> > > @@ -3,6 +3,7 @@
>> > >    "results_version":10,
>> > >    "name":"normal-run",
>> > >    "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64",
>> > > +  "cmdline":[],
>> > >    "time_elapsed":{
>> > >      "__type__":"TimeAttribute",
>> > >      "start":1539953735.1110389,
>> > > diff --git a/runner/resultgen.c b/runner/resultgen.c
>> > > index 87847bf5b..0d3a569cf 100644
>> > > --- a/runner/resultgen.c
>> > > +++ b/runner/resultgen.c
>> > > @@ -2281,7 +2281,7 @@ struct json_object *generate_results_json(int dirfd)
>> > >  {
>> > >  	struct settings settings;
>> > >  	struct job_list job_list;
>> > > -	struct json_object *obj, *elapsed;
>> > > +	struct json_object *obj, *elapsed, *arr;
>> > >  	struct results results;
>> > >  	int testdirfd, fd;
>> > >  	size_t i;
>> > > @@ -2319,6 +2319,11 @@ struct json_object *generate_results_json(int dirfd)
>> > >  		close(fd);
>> > >  	}
>> > >
>> > > +	arr = json_object_new_array();
>> > > +	for (i = 0; i < settings.cmdline.argc; i++)
>> > > +		json_object_array_add(arr, json_object_new_string(settings.cmdline.argv[i]));
>> > > +	json_object_object_add(obj, "cmdline", arr);
>> > > +
>> > >  	elapsed = json_object_new_object();
>> > >  	json_object_object_add(elapsed, "__type__", json_object_new_string("TimeAttribute"));
>> > >  	if ((fd = openat(dirfd, "starttime.txt", O_RDONLY)) >= 0) {
>> > > --
>> > > 2.48.0
>> > >
