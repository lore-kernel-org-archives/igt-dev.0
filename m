Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA71C0218F
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jan 2025 15:58:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128410E371;
	Fri, 31 Jan 2025 15:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jdriYm1F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053F410E374
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2025 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738339128; x=1769875128;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cWNc7Gcm7b4jtLmMy/q84bytwnFpk0c65wT6YuAwCJI=;
 b=jdriYm1F5dL/TGn3cdUsj2pUCsvQwCRNdPF52lkCZdNZlXtnBnmcRh04
 R5intcyqEGYT85QfUk+GFXYL9oMp2PTRlgELwFqXz6+gR9RPFIfjHGmE5
 Dhy5ik0DdQrG2gLhyOMahhqUW889Vv+z+aOJU1YXsGDOqVTGO/UhsVVpE
 Lp+Wn1xuObboP1j5ZTqA3STYLbWqqjNvqWWYgZM3idZ4sn3m6yBknpRtn
 GQUhdTzRXf/6BhlIprdNecs+CFtjp41xm7J7QpJ/iBFAKDCh21Uq/vqA5
 CCqVkRMrA281tZerxNfg4bBdrSLp1Tf3hdh2KYXn56evl1IP0aElrf7+0 A==;
X-CSE-ConnectionGUID: VXq2lq7pQgGdzhgLzQN7KQ==
X-CSE-MsgGUID: aluJOKRRQHSCb4h2KbzitQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="64272437"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; d="scan'208";a="64272437"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 07:58:48 -0800
X-CSE-ConnectionGUID: PpfJzUJuR2qOHo1nbTj4gA==
X-CSE-MsgGUID: vBPLSJ2ATHuQjjkKRLT2vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146851649"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 07:58:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 07:58:47 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 07:58:47 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 07:58:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRBeFi2abvK8gqMwRzRPBg5jSIjjpTaD8NdlOY0Hcl/MvB/VZFNIJ4U7JpLddFZKAhqlyPOZWqFww1e9xWHMzcnT4YJgZ3adaZJhAFxccM4mJQ0y7ahXAtodfKXWbDlpNb/cNBS7YsB9crnyMywZce3SslyDHA92ug3DSIEBd/VwNEJZRmc51f9qifxLh5XVolmItWjzqM5465q7oe8ZFpz8LDWYu1ihgA0aiDOSo5qMzkISqWXD3Wn2LSFCuIgeySX/Uq3w5YyI7YbfTsmDQ3wCg/qPdajmSZMCHv/NDhwoLSyEwmxfcsaydmVynT+I5E3npHO6qcsBt27lXDDNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=om/ncqDSETgiH/+d0BngQhdTO2LJHov0PSgWSUwDr1E=;
 b=tMJT3mrr0gAtkKwk3ii5UjMyJXcQwnh91dXggcub8W4UaqfPL5SC177jdfZuBPHePaImD9TEqI3Qv+3hTIAZGTOX90HutNHaj6UCc4RwaS/RPCinP4l3R6ckViEMSYfKKXQuhP5AmRf1ON2imMPjtkSM1a3vkduNFNzunHFukU6prHrsixA9BL3td1GQy635rI9Est5QSVw/wlKu6TrLR5yPxut7jKkfjXJ6rZH/9BiqI67HeccgMn1rAVHVmGxx0zP/xQULb9ZeF8l86bRGViyaPNQj5acJS0YiSrk+rcjWIJIigWDYmT4s76E1wSC8nY3KOfa/xjGNp/R+X66HCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6518.namprd11.prod.outlook.com (2603:10b6:8:d2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Fri, 31 Jan
 2025 15:58:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 15:58:17 +0000
Date: Fri, 31 Jan 2025 09:58:14 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Gustavo Sousa <gustavo.sousa@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Petri Latvala
 <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v3 07/10] runner: Fix use of newline on arguments
Message-ID: <yeb7toxw7aqtrwlncbuhsuhdlpmckwve2iwhz2crep62fqdifn@by2yiutcan4f>
References: <20250130172149.3657144-1-lucas.demarchi@intel.com>
 <20250130172149.3657144-8-lucas.demarchi@intel.com>
 <9d00ce60-74a0-4392-87e8-9107a76e644d@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <9d00ce60-74a0-4392-87e8-9107a76e644d@linux.intel.com>
X-ClientProxiedBy: MW4PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:303:85::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: a3eccca1-66f8-4997-8b15-08dd42101390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lzw10ZrUKEZvmsLgU8MR3fFj5+BjD121dESNHP+6sijRNBZ1DlQt/Q3Nq1Qj?=
 =?us-ascii?Q?LBG8V7+md4NP29tvWfB6HZgA0/gUpQDWT+Fo+x7qVWQ7V15Fh3ZcL5+c+m1J?=
 =?us-ascii?Q?rNnpP4Rm5s9Ah8fOw9l228tkihfxy5LAWqPioXYXUAmCXZDn841DYGVuh49N?=
 =?us-ascii?Q?48qRc0Hh0aSCbuVlKGnr5tqRdnZSkqj75aS0MO1l2ApIENPUR7eGMasYq7kK?=
 =?us-ascii?Q?Htr5teMpySs1nbF+dEtNLE9Bc4C1edNBxnka8qZwXWTLxKFRjE/vwp5JAuZ9?=
 =?us-ascii?Q?6v+pfW/Vo1MzmdqBGFWBWuUnQODhrRGpTGk8DWTslcgfSdZzXUulF4dEIHbA?=
 =?us-ascii?Q?O4L7mAE/T9BJ6z2NeYXTRXwm986EB/CmE24v0UYg1UGV6GVF1QfcySZfm9mG?=
 =?us-ascii?Q?HpoloYiuNStOrR/tdfLnKCuWKTpaqD4Oy+xm1t92GH5YS03zcnXvuTkdTrHo?=
 =?us-ascii?Q?oIabMWN/ag8Mp9bavOOAlXL6YxsqwmDFM7oiBxLghDl0xt7twTW/O3QXx9Wh?=
 =?us-ascii?Q?sO2rsxIa2m9V/acO0kY2LC7wfv4iUZuOrVxb20IuEcSJIbGY+JslGDNC8sBW?=
 =?us-ascii?Q?pMUUbzR4O1W40hkWUGidQWs5PXFHkHhnhM2wuw+5TGBSGtMGzT2iGP7sXQNH?=
 =?us-ascii?Q?5tuICn5UhIWGuhNF5ZWMCXlhraAiSa/LdZ1dZJJwLqu7rc4o0kDa3a2Vw7ix?=
 =?us-ascii?Q?Lp99HmMhBtAloS9ZDDng1Rdw7BFUZhxSAtr9YItszPh8//09ii9QVTrnKrCY?=
 =?us-ascii?Q?WnPObLk2Ebtj+pyi95+0TMXPMja1qlY0MyusSKeMverfA5w0T6zfK+9QJKw2?=
 =?us-ascii?Q?GZ0XYIQlEiPmROFHu/tSfaSa0qCyjnvlFoRguq7ZjnxZbwt6LburdPX+oopE?=
 =?us-ascii?Q?2vw3S+9YvPRou8bZsRI5AlYbsHD9X8/DPzPAD0qpD8i4slZuHer8MvfPn54I?=
 =?us-ascii?Q?NMMecsBWJUfOn+pN4X/tZmkJlMlJiloi7aExyp/w48DsNDUyDwCErgCCXRxq?=
 =?us-ascii?Q?y0po1EI9pQky1kbHxE/486k5iP5AaW2fjqnS4NdaE47j/xlOzA2aeW23nUYe?=
 =?us-ascii?Q?l6llMNpr+5IaitQj7IiUQjOl7qNwQlC7jdp0ncGhQlND/qZCW2pZPjKVun2S?=
 =?us-ascii?Q?g0IB0QIjdBpOvOjgfz+p6wmY5OrLgIufWCeO08dZNwYLbPccxYzYOp4LujDu?=
 =?us-ascii?Q?EGcNaXviUJwONd3p2754tI8QUc6jg/x8Mmto03eC2Syzv85XBMkGfQG5b/ln?=
 =?us-ascii?Q?8svLxUtkEGgII1GCKVC1a3tIEeYfFA5hauNCHAygUg9ApyqTONydDRe9s8Jz?=
 =?us-ascii?Q?6dS+dDHxwz9Ek4hrCYodGQK5bj3mUtLapgVksisr96i0bFdiQNY9FCxcuucT?=
 =?us-ascii?Q?lSmosOYGAMER/r0YBJ3Bk3+QZyvb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cYUeDa+lJ8TnzWlPF9oiNeCj2KMf/Y08GoCopXWcgHlH3OYFg0JTTJF/sPv1?=
 =?us-ascii?Q?ClsYqMc6z8W3TNMUut5h+lWWI1s/pRc4tcX5Aum086tL6q8ACXgDIFtF9L5w?=
 =?us-ascii?Q?YV48SwH/Q5pKFVk51/wWOzPKfsSIem9zK7a8ue31vEIwUnTaEdqrM2R0mxjj?=
 =?us-ascii?Q?75nuS5hUZq8VEz3X4V+9rC0BZr6vJR7HHn482ryQDkeK0dxSpd3ic9otw6LA?=
 =?us-ascii?Q?5YS3GImJu9pKJRXuBfLw8tFmq2X0uSzENyb/e8aVPMUy14eVDyWmXMigKGNd?=
 =?us-ascii?Q?12Wxi53c3R7CMnv8FvSsAko/+C+CwCfn92GX2WKmnR19+b32xI/w1mjgr50t?=
 =?us-ascii?Q?3149MUoEE4O6yVVATKeffZisfa49TOh2QDqwA2EXJf8QVSqy5EwpmqXat/Ri?=
 =?us-ascii?Q?ZBZJBoDnaqfSsMamdQvbJG62df97XMn89PJ9ZvXmTjeGMpcpYQcYrLJgioH/?=
 =?us-ascii?Q?StGJ/zpZEq0oINEQjI516OqJ0yWxzMONqse95XBZwSEYLIQY5Z0BylRD0qQA?=
 =?us-ascii?Q?wlbwElBNNvwy+GeKVyuBuDhEvKyYcjesuwigiybhUvkZaDvkkdKqlRr2pc8P?=
 =?us-ascii?Q?CuzNg2Ee6KQ7bQh3axbzmFn4dxv/qhDH8UIY0LFISqe/5Bf0KCkzreLEfxeJ?=
 =?us-ascii?Q?dDjNhJd9CF6WUjh5rERdWkrwfFKzz4O9jiswbtahdiPRcRRlyGKtB05OCkxS?=
 =?us-ascii?Q?rm3it/CHWVBNwSgdZiYNaFYKZe2PcJWJ+dMgd9pqQc9dlN0QAPSLos8jBhGZ?=
 =?us-ascii?Q?vLMpUL7jsJcvrUsAjnKcEpAKiTYBR103A7I2321oFy9uPq9a0+OdOzC+Nimw?=
 =?us-ascii?Q?K7/ybhSwjfzOtqZXp32Hs+rDLvmZq2y864DFQfAuovBlKSqdix1QDG7T71Ee?=
 =?us-ascii?Q?kpT0Uxjs6eLpOZSbSjwNmRQ7T9OmKmD0fjHNc+psbDSo6H6paLW320yde5NE?=
 =?us-ascii?Q?BL9DhKc+46BQkoCYGwkvi0VKNFJSRsMVpag5U2GsGIZUlsaiL4GXzrUXDO2y?=
 =?us-ascii?Q?xFJMqiAp3Me4jqDgUJlOKjcuUVnztUDbtASmd93z/zO0Rm12V8PQZfgAfNbn?=
 =?us-ascii?Q?XOH/pcc/XXTaXfftXuDrEr4+Lto1+9l7lzMChp7h0YKRwFjnVAzvT5Y9Mw2J?=
 =?us-ascii?Q?wNhaZ3ACH531VoaJnjtpXVXrGGAOuEwZd0dVAnIr+84qvidjg8lvvPxQj+r9?=
 =?us-ascii?Q?hu7JtfC4AXPISbCbWCL3FZ4SPgvdk5L8ajvgAEbM63G0xKD1XcVFd1I/zFYK?=
 =?us-ascii?Q?ipMUNvxHVneYtUwDkNRI2qgrBNUWkRn96Ku6BKG2UD7rWU98dR7qr94KvsoT?=
 =?us-ascii?Q?dW24hmRye7N6r88PxgNyg94jXjC7vRcpWS7AQF8AyussEA/J/yzYS6amP10v?=
 =?us-ascii?Q?sXVs1ldtG7fKA6WEW5NWlRzFAgeaxHDNK+2+Q0cDnbFZzsZfFjVLAJ6QuyUG?=
 =?us-ascii?Q?pihPpVzgsCIHnDmqRz01DwwQlVGqxxoJQswvASBUR3fo2KRHKbpbIQWH0wzu?=
 =?us-ascii?Q?nhpH6H6eh3q1fX/KclMkLCqOKW5nxTNUibdVYBkvPZhT/mgTx0SUcIN/edSC?=
 =?us-ascii?Q?cqnycYmL1oNpForqaYMBcR7oyb8dFeo78BZK9vJV35NSCVPa4+vMsh9J5JR0?=
 =?us-ascii?Q?xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3eccca1-66f8-4997-8b15-08dd42101390
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 15:58:17.3257 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKEm84UtMQHTOqHdUw/UzE70u3KKIY/++0SksHANLiHdDLvM3exxdszJ2zPDADpSBwJhvlg/FTouBr2oI0ArLXQGs8aipI9AGpLy5el21zw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6518
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

On Fri, Jan 31, 2025 at 10:21:33AM +0100, Peter Senna Tschudin wrote:
>
>
>On 30.01.2025 18:21, Lucas De Marchi wrote:
>> Currently there's no support for newlines on arguments passed to runner.
>> However it's also a silent failure:
>>
>> 	# igt_runner --test-list '/tmp/test
>> 	list2.txt' build/tests/ /tmp/results
>>
>> 	# head /tmp/results/metadata.txt
>> 	disk_usage_limit : 0
>> 	test_list : /tmp/test
>> 	list2.txt
>> 	name : results
>> 	...
>>
>> 	# ./build/runner/igt_resume /tmp/results
>> 	[9840425.334900] All tests already executed.
>> 	resume failed at generating results
>> 	Done.
>>
>> Embedding a newline like this is very dubious for test-list, but it's
>> used for e.g. hooks. In future we will add the command line to the
>> metadata and possibly migrate the hooks, so add support for
>> escaping/unescaping the string on save/restore.
>>
>> The method chosen is slightly different than the one used for hooks:
>> instead of adding a escape char and keeping the char escaped, this just
>> prefers using an hex representation of the char with a \x<HEX>h
>> sequence. This makes it easier when unescaping since the reader can
>> continue reading one line per iteration. In future this can also be
>> adopted by the hooks or even migrating the hooks to use metadata.txt.
>>
>> For compatibility with previous parsing, it still prints "(null)" for
>> NULL pointers: ideally there would be nothing printed to avoid the
>> special case for this string.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  runner/settings.c | 77 ++++++++++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 76 insertions(+), 1 deletion(-)
>>
>> diff --git a/runner/settings.c b/runner/settings.c
>> index 693c5484e..b527c01d9 100644
>> --- a/runner/settings.c
>> +++ b/runner/settings.c
>> @@ -1052,10 +1052,79 @@ static bool serialize_hook_strs(struct settings *settings, int dirfd)
>>  	return true;
>>  }
>>
>> +/*
>> + * Serialize @s to @f, escaping '\' and '\n'. See unescape_str()
>> + */
>> +static void escape_str(const char *s, FILE *f)
>> +{
>> +	if (!s) {
>> +		fputs("(null)", f);
>> +		return;
>> +	}
>> +
>> +	while (*s) {
>> +		size_t len = strcspn(s, "\\\n");
>> +
>> +		if (len > 0) {
>> +			fwrite(s, len, 1, f);
>> +			s += len;
>> +		}
>> +
>> +		if (*s) {
>> +			fprintf(f, "\\x%xh", *s);
>> +			s++;
>> +		}
>> +	}
>> +}
>> +
>> +/*
>> + * Unescape a '\' and '\n': undo escape_str
>
>Nit: there is a specific format for documenting new functions. I have the impression
>that the arguments are not properly documented.

For external functions for other parts of igt to use, the format is
kernel-doc. That is not the case for static functions.

>
>> + *
>> + * Exacpe chars using the form '\x<hex>h' so they don't interfere with the line
>> + * parser.
>> + *
>> + * Return the number of chars saved in buf and optionally
>> + * the number of chars scanned in @n_src if that is non-nul.
>> + */
>> +static size_t unescape_str(char *buf, size_t *n_src)
>> +{
>> +	size_t dst_len = 0;
>> +	char *s = buf;
>> +
>> +	while (*s) {
>> +		char next = *(s + 1);
>> +
>> +		if (*s != '\\') {
>> +			buf[dst_len++] = *s++;
>> +		} else if (*s == '\\' && next == 'x') {
>> +			s += 2;
>> +			buf[dst_len++] = strtoul(s, &s, 16);
>> +			if (*s != 'h') {
>> +				/* this shouldn't happen */
>> +				return 0;
>> +			}
>> +			s++;
>> +		} else {
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	buf[dst_len] = '\0';
>> +
>> +	if (n_src)
>> +		*n_src = s - buf;
>> +
>> +	return dst_len;
>> +}
>
>Have you considered  json_tokener_parse() / json_object_get_string() ?
>Glib' g_strescape () / g_strcompress() ? Not a fan of Glib,
>but it is currently used anyway. Or even libcurl' curl_easy_escape() /
>curl_easy_unescape()? Meson probes for the lib, but I did not see it in use.

depending on other things I'm working on, I will evaluate moving this file
to toml so I don't like adding another dep.

>
>My point being that it would be better to reuse instead of reinventing this
>wheel. If you prefer to use your own, please add unit testing, I found at least
>one issue:
>
>Lorem ipsum dolor sit amet
>Lorem ipsum dolor sit amet (26)
>
>Lorem \xZZh ipsum dolor sit amet
>Lorem  (0)
>
>Lorem \x41h ipsum dolor sit amet
>Lorem A ipsum dolor sit amet (32)

sorry, but I'm not following the example. What string was
encoded by escape_str() and decoded wrongly by unescape_str()? Not sure
there's much value making it very fool proof.

Additional tests would check that "given a random string s, does
escape_str(s) -> unescape_str(s) produce back the same string?", but I'm
just relying on the ones already there for hooks.

unescape_str() doesn't accept random strings, only the ones escaped by
its counterpart function. I deliberately didn't bother making it super
complex, see e.g. `/* this shouldn't happen */` above.  But I will see
what additional checks I can add.


>
>I guess you want to check strtoul() output for errors(can it cause an infinite
>loop on error?), check buffer limits to prevent writing past allocated size,

output is never bigger than input when unescaping a valid string.

>and using error code such as -1 instead of failing with 0.

yep

>
>> +
>>  #define SERIALIZE_LINE(f, s, name, fmt) fprintf(f, "%s : " fmt "\n", #name, s->name)
>>  #define SERIALIZE_INT(f, s, name) SERIALIZE_LINE(f, s, name, "%d")
>>  #define SERIALIZE_UL(f, s, name) SERIALIZE_LINE(f, s, name, "%lu")
>> -#define SERIALIZE_STR(f, s, name) SERIALIZE_LINE(f, s, name, "%s")
>> +#define SERIALIZE_STR(f, s, name) do {	\
>> +		fputs(#name " : ", f);	\
>> +		escape_str(s->name, f);	\
>> +		fputc('\n', f);		\
>> +	} while (0)
>>  bool serialize_settings(struct settings *settings)
>>  {
>>  	FILE *f;
>> @@ -1171,6 +1240,12 @@ static char *parse_str(char **val)
>>  {
>>  	char *ret = *val;
>>
>> +	/*
>> +	 * Unescaping a string is guaranteed to produce a string that is
>> +	 * smaller or of the same size. Just modify it in place and leak the
>> +	 * buffer
>> +	 */
>> +	unescape_str(ret, NULL);
>>  	*val = NULL;
>>
>>  	return ret;
>
