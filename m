Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FC7D6A22D
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 20:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DA810E377;
	Thu, 14 Nov 2024 20:58:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kNZtf5cG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17F610E377
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 20:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731617937; x=1763153937;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BrQ7ePBYVGMsVEhXSuPTyAP8HhBSlnV6PXPg6bFlBJM=;
 b=kNZtf5cGnWEnkxwQBuypldsVyQoOET6jrba2xJQHV0QXPRaXyNVm94Gk
 R/BBlS6DbIqbmxi5gHKed74M4x0W47wk5Hn2NBOKvEjLo7Q0CFlwCQ+ln
 pcHf36CebYKdz85AsA+x3ATEnd4ltxm88TsIrWuEAfXfYttVklEZxWlZP
 H9w1O+1mJPdMTVMZEOn2sAUN1/5RDGCBCcBnnyZQrL2pbXUYxOsXNfhJ7
 xMNg1DZ4bsDphTwPTGCynMNbTJWUku+P0W4yTcO1JkVwnll4465P0fyEd
 3ZGmbmv1MjRA0rTTdJxcJ0ITpzrcvJXw/ThmGeRK4QcLVtk/+RA0oXMN2 Q==;
X-CSE-ConnectionGUID: SZa7sOMiRpCnzoBCvrKIOQ==
X-CSE-MsgGUID: SONEeegoTfarUpls/WWqbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42982097"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="42982097"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 12:58:56 -0800
X-CSE-ConnectionGUID: MIoST7wZSYSwbErBkhZsBA==
X-CSE-MsgGUID: ySQ/lkMtREOI1dSXgUNLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="92761865"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 12:58:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 12:58:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 12:58:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 12:58:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzV6qla0MUgWU70RpLeyE6llRSazaG8i59ATcjAuvunljAvXcKmuUltXHt2y+lSzOvHOLjRs7+85qPJoJgxv7t2RHkLBv9LmHaOHvH2cH8jO1rXQo3Oe6nQhWL3TwPVls51kFmJ13Vleb+Yt7oHGdVTUAjujDBMJ0cJVidr5eIn3q1apr62jqoofrp8oNc2Qj0mHP4jZjei1mj0cGuUiqib37q1RdzcgU73N/VA3xemRxSejI1ptEL5ahfTn/UICqhnvEJMUSeKQ9MnAj40+G/T4DmG+X+0ejmJovk7/IJkbR8zDRSOCzetw/PvhOTIM2K4g9kPU5yXGodNkkhgUkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P9FYZzmqlc1jx5aX1nG/QzdbabLoKL+bRWj9cqiO0Y=;
 b=ofr5QQI1N/1/bPEBeqYncMfJzfMELq+CNQAWNpDRULMMYuJ/tWnBh9HjDWf+OCjAylKN35BRL3qBNoggJiT7mDejoPYBx/UKdCyl/3lPwYhInFa6xnAfWYauuSZO8RcTzpeIk11YPrOVCa2ARWYJreIunBbcVuSYn0NfPEM2FHh4Ip0dBJ0R+Es7EyGatUhA3D+AMusIAjEB2kPSD2x1fTcbsTg2FWmtn01iJ8DWr30qYA1dLM2muokTH+caXGNFewPX8AXs+TXgRs1jHv4wnTGcDdMPOb6P5WDYd+oayWl1Jdl7RdmKlSqypUpQRxJjkXlVG1Zdr75T4Xeg1aR5Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB4916.namprd11.prod.outlook.com (2603:10b6:303:9c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 20:58:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 20:58:52 +0000
Date: Thu, 14 Nov 2024 14:58:49 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 3/6] lib/igt_kmod: Stop passing debugfs_dir around
Message-ID: <yjqplst5ycsfcggndbipsgkeke75n6nqao3rthdja3273u5xju@agdth5sqx7pk>
References: <20241107055254.3129207-1-lucas.demarchi@intel.com>
 <20241107055254.3129207-4-lucas.demarchi@intel.com>
 <6824673.31r3eYUQgx@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <6824673.31r3eYUQgx@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: MW4PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:303:b7::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: 16072654-cb3e-4be0-e52a-08dd04ef251c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3Y4jrR+KvXElJRgt3213OAh3is7kEwPSH+JIrLdvTQP9rLIPduhKor8x/YpJ?=
 =?us-ascii?Q?LSy2QBePwxo3rMbQ0pBCkxZD9OsRyMSxxrTdw+DMSA/tv6MtBu6nqy0Lmz80?=
 =?us-ascii?Q?lfC2tR12BiaBT/r8bGhu3b2eI6ULF8X7EQI9FRVp8NLOOoitIT2hlGL+OFH2?=
 =?us-ascii?Q?bfIB2Oho+WSicWmpQ5Vxnz0/tjWKmro5dXXHh8SVvgw+0sNTxvn/xY+lc1ZE?=
 =?us-ascii?Q?C3Hsyo6sp+IQT1ea4H/17otoy4xOyi0DjvAJcTbOeckxviU09s4Ais7RaGGg?=
 =?us-ascii?Q?QPKG9J3eTNj6mYHLDQ6o7l+HKAEOs4dsutRQbfbNYUxp8wMArlRNpHJgk/Sl?=
 =?us-ascii?Q?Fh6hPTFoEKIHSxjfHAJ2ofH4YHd/jMRwJgK8vD45ETnW7tigUWDGwsl8fkeD?=
 =?us-ascii?Q?PE48uJDa0KarcnS39QhHpfKMoULLFWbQaFK4SPxaNyWHO48GwYS+JowYVae6?=
 =?us-ascii?Q?KO1njxhmBLoKnVUGfOGBqHwv7N+T0BkucviYSgio0qi3FTTmvJGsJFgyuBUJ?=
 =?us-ascii?Q?o2XXJhvfEK0KTzV2keBhXFkPK/Jcb7Rg7waBvv2QEeFzBIYW2LcUxAkvIUTi?=
 =?us-ascii?Q?Y85LDnf0yr1mTFQw0Z0Zhw1bhp/nYBmUGpNcMqTLdkpB4/UQW5GDBGtihLPl?=
 =?us-ascii?Q?OByiThLutQw+7A3Otpvo/7hinmdUSblD/rsOZCn7Bb4Wwsfqh3SrMnb620+8?=
 =?us-ascii?Q?ZAV3zaW5mSnRPs7QCeR5qq2njUQ4wWGvB/L/wdpEu7rUR6top3G6sAGRm79+?=
 =?us-ascii?Q?EbNF5rxm0IW9G1WHG3vslxnDG2lAa7WwU9nIMeQlpL0da5fGvV2nAdnitUoI?=
 =?us-ascii?Q?Qx1NpPWbYzydVKAc21IDmUoud3+D35AvFgK71diH4rGiSXpPPMVPMPh3wF0B?=
 =?us-ascii?Q?sVbIfSksPbhN8p+okKtYP6jjnBj5qk+HmUrhTw8s73OKpTqyie73G0e4UTdk?=
 =?us-ascii?Q?cTht4cbDKEjGy+gOIMCSu1/iO2/n3APJMT4Dq1xdiLzbGWoOBQkuF0CHFoFz?=
 =?us-ascii?Q?IspJnQh/OP4pdgCilGU00cqcC110sSg5VhBg2XAkgWhaN1fJEOmPZRYxDeHE?=
 =?us-ascii?Q?9DCcbXvi7I1VoYSAyR3s7C4iC1c6MJ3UEse/4Dc9uJLGXNhxlF3leLKXvXZ4?=
 =?us-ascii?Q?Gx+z8T/pHhpJQl8guXrrcNspTJ+TIe28gYDwY9dAcEDcL5AUxu9m314Yf2AV?=
 =?us-ascii?Q?grJdcA3nqVfbrK0y0Oh2LR/D7lF0XFDAUpOXYd48yA1YDNUUgx6svxeg7hoi?=
 =?us-ascii?Q?5rG1iO8ANcqvZWULUeGSIx1B3QyG+93nFe2jHb7aB0Q/gCS5ulxEuFw9SMr0?=
 =?us-ascii?Q?kw/MgtBaQAZgS3pu3j8hJoA0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BJOwjfSq0k4TAiOQRh9qF1Q6/85MXYaT/hG/FBtlSNDCuX288fH5l1HBYUUp?=
 =?us-ascii?Q?82YNJb5qm/drbFfV5Dmizu3IiPM7/H25KFxmNf6haKKq3YGd+Xywe+bIdh1k?=
 =?us-ascii?Q?lSk4D5UdoeK2axtVspQNRdqo1dBwomOJsrljLasjdNXbPk6whl6HWL2NdPa/?=
 =?us-ascii?Q?E0CjGOG4tQbctKsYGvunBPRxprjHrpe1wQyVVAJXttNtAvU8EhVk4xFo6NrX?=
 =?us-ascii?Q?2GzT0xT2nGECD6je1JN6p2Xc/i6od0SSt+FY50SM3IoQXbsCOjnXhhCcA3eJ?=
 =?us-ascii?Q?ldgsmzD+QfZP+mowrueHin3MRHDY76cTvTwb8URaKDu8G4basRL0G6B930f/?=
 =?us-ascii?Q?nXAQ8/GRp5EI9mUFDwbsREikzfHd+30XJp5xdrpAMIqOgmMgPlJ3uS+s9xTV?=
 =?us-ascii?Q?IEOIWM+15PxVTnSLI4KdVkXD0rTgkSItfMz0KEHmWPsmNacO1+IhOviLpblt?=
 =?us-ascii?Q?1A0P+A4x7tOqevjgk3k2fqohsd/gZ+t0+iZjdBkgAzAlVbTudLkYpJvpqyTU?=
 =?us-ascii?Q?XZM86dLH9kPKLN997gPfzqZks5t19/VBQeJe2he4zpMeeWdJPHPyURASjgoc?=
 =?us-ascii?Q?HnZFVnooFuR2vvId2QjTw4ri0xBqFPKV6l3ynIoJPgdBJvtpWvu/Z9yKclay?=
 =?us-ascii?Q?NoWEyOrOHT9maovVHtLSVFJxNbqBMAxzULXhsKrOZZ79qk8Qpo12kW9amefE?=
 =?us-ascii?Q?wugS8UonRFGG1Tcm6GY+sWTnc4VcEu33DGlsittfMGy1+UjGIwCXYEobIARl?=
 =?us-ascii?Q?KNNfcT47ZQd/pLdJ7cObhdgRsghHUSY7pME77ood/54DFUJWLMqQ2E0HDU2T?=
 =?us-ascii?Q?Z05goSQ3I0fEmno0NCQFWa11eZ8fMmU13srw6tj2PLZbsyX9VadSk0sSjKAy?=
 =?us-ascii?Q?mdwT0l3YLPYXH1Hp6n+m1UYw77h4UNy/8FjWXgbT2hzqEMZVEA2c4KulqPY0?=
 =?us-ascii?Q?eo4M3VGlcaWBaaeC2Jl4dtfnq+lpIAFJiNDiBh2G03RINw1uabUQYjB/SP6X?=
 =?us-ascii?Q?FPNgIXWtVsIIVhAEWDqFE4cZglgGpXumU4CFkntHGSjgal9Hhhxo6DSabJdQ?=
 =?us-ascii?Q?k+QuqiIoBqH7a8WiZHFDTMLe5Tq8QigaBERSgvGbaKSiM2qGbo3Y+tl8rSsf?=
 =?us-ascii?Q?F693Q+1q/gyMSWGoxn9lYykN4g3tOTnyMYa6eAlOchWsEmaGsX2zdXgGYkkI?=
 =?us-ascii?Q?r89TfAmiWPeXPnqtaZTBrQEthIOMOcSUiIQWzOr7o2CGIXDynDdNTBc4Ie/I?=
 =?us-ascii?Q?Ri/a6BB8CotXwnJUxo7tL/JfFlv/wLLWmpfySfljvm12fpfOlVeM0UEX2aQh?=
 =?us-ascii?Q?gdcBEnlgB7U7dyAi+3aABXHnqG7rkA+LjXPZMZB+mTk4VAvmZLS4dEG66MQL?=
 =?us-ascii?Q?9JgkKQrwjESCb296ni4jfMOVZwowkGjl4m5IkrBb1h5fDDzdDxCH1THt2exd?=
 =?us-ascii?Q?6FE8FKtkpSlM59rQa3m8P3iGz0zqrViEv9BebXo8wLAuJqlSal63SREoHeKU?=
 =?us-ascii?Q?Vv1az6bM603UVAo+SGehVqvNM8RHsBs2t0N6Exapc8q+80i/GRd5HCea+rh2?=
 =?us-ascii?Q?1Ig5/bsU7nRHsSL1Xy8Tqq5LgHR5NWx7zCY3uCRRH2fjtGuI+iedMU06Njh/?=
 =?us-ascii?Q?LA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16072654-cb3e-4be0-e52a-08dd04ef251c
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 20:58:52.5237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wQ3vnLhCNaugbvUj8itIt2Ir+ANS2V/4O9wUH2AoaUqVCs2w61ilz3Swfg3s3QVShel8oXoLltASgoAr8LrkCaLekBkcipMRV4dB36TiXY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4916
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

On Thu, Nov 14, 2024 at 03:24:39PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Thursday, 7 November 2024 06:52:51 CET Lucas De Marchi wrote:
>> Just open and closes it while getting the list of tests.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_kmod.c | 27 ++++++++++++---------------
>>  1 file changed, 12 insertions(+), 15 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 3729a053c..36578aa68 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -1038,15 +1038,15 @@ static void kunit_get_tests(struct igt_list_head *tests,
>>  			    const char *suite,
>>  			    const char *opts,
>>  			    const char *debugfs_path,
>> -			    DIR **debugfs_dir,
>>  			    struct igt_ktap_results **ktap)
>>  {
>>  	struct igt_ktap_result *r, *rn;
>>  	struct dirent *subdir;
>>  	unsigned long taints;
>> +	DIR *debugfs_dir;
>>
>> -	*debugfs_dir = opendir(debugfs_path);
>> -	if (igt_debug_on(!*debugfs_dir))
>> +	debugfs_dir = opendir(debugfs_path);
>> +	if (igt_debug_on(!debugfs_dir))
>>  		return;
>>
>>  	/*
>> @@ -1057,21 +1057,23 @@ static void kunit_get_tests(struct igt_list_head *tests,
>>  	 * we already can do perfectly -- seems to be more safe than extracting
>>  	 * a free text list of unknown length from /dev/kmsg.
>>  	 */
>> -	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip")))
>> +	if (igt_debug_on(!kunit_set_filtering(suite, "module=none", "skip"))) {
>> +		closedir(debugfs_dir);
>>  		return;
>> +	}
>>
>>  	if (!suite) {
>> -		seekdir(*debugfs_dir, 2);	/* directory itself and its parent */
>> +		seekdir(debugfs_dir, 2);	/* directory itself and its parent */
>>  		errno = 0;
>> -		igt_skip_on_f(readdir(*debugfs_dir) || errno,
>> +		igt_skip_on_f(readdir(debugfs_dir) || errno,
>>  			      "Require empty KUnit debugfs directory\n");
>> -		rewinddir(*debugfs_dir);
>> +		rewinddir(debugfs_dir);
>>  	}
>>
>>  	igt_skip_on(modprobe(tst->kmod, opts));
>>  	igt_skip_on(igt_kernel_tainted(&taints));
>
>How are we going to avoid leaking the open debugfs_dir descriptor if one of
>those igt_skips triggers a longjmp?

ugh, you're right. I hate these longjmp :(. I wish the require/assert
would be left to the *tests* and lib code act as lib code :-/

I will drop this.

Thanks
Lucas De Marchi

>
>Thanks,
>Janusz
>
>>
>> -	while (subdir = readdir(*debugfs_dir), subdir) {
>> +	while (subdir = readdir(debugfs_dir), subdir) {
>>  		if (!(subdir->d_type & DT_DIR))
>>  			continue;
>>
>> @@ -1089,8 +1091,7 @@ static void kunit_get_tests(struct igt_list_head *tests,
>>  			break;
>>  	}
>>
>> -	closedir(*debugfs_dir);
>> -	*debugfs_dir = NULL;
>> +	closedir(debugfs_dir);
>>
>>  	igt_list_for_each_entry_safe(r, rn, tests, link)
>>  		igt_require_f(r->code == IGT_EXIT_SKIP,
>> @@ -1197,7 +1198,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  	char debugfs_path[PATH_MAX] = { '\0', };
>>  	struct igt_ktest tst = { .kmsg = -1, };
>>  	struct igt_ktap_results *ktap = NULL;
>> -	DIR *debugfs_dir = NULL;
>>  	char *subtest;
>>  	IGT_LIST_HEAD(tests);
>>
>> @@ -1244,7 +1244,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  	 */
>>  	igt_subtest_with_dynamic(subtest) {
>>  		kunit_get_tests(&tests, &tst, suite, opts,
>> -				debugfs_path, &debugfs_dir, &ktap);
>> +				debugfs_path, &ktap);
>>  		__igt_kunit(&tst, subtest, opts, debugfs_path, &tests, &ktap);
>>  	}
>>
>> @@ -1255,9 +1255,6 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>
>>  		kunit_results_free(&tests, &suite_name, &case_name);
>>
>> -		if (debugfs_dir)
>> -			closedir(debugfs_dir);
>> -
>>  		igt_ktest_end(&tst);
>>  	}
>>
>>
>
>
>
>
