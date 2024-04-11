Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEC0CD128A
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 12:48:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB8410E0F8;
	Thu, 11 Apr 2024 12:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y49vaV6q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6B210E0F8
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 12:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712839729; x=1744375729;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uYOQ+rjw1ZHYWXrnbylE+GSGZ9xIthVf1V8Kbtp1cB4=;
 b=Y49vaV6qibmIAP1M+gCxAHe8LImDRsOZQj1+5P3uaRXjUK5t1ETlW83L
 Mny1F2yFAqQbFacShze1HNE7ZKAGjVpsWorb9vjnDNuWkOHIKJJ3kk/n1
 HpGqh6804Og/rpDjIhgmrH3RUcu8yjXfW/K8GgxkMzfNxO7ng6epvvVpD
 SDZMaOu6w2unfla7qNYIpX+WU4NTkNOnsTxuEKBKZpGgQ9xcmK62vBsbX
 7vKdJGYvdacg7v/2gFy49pHzjDQpTLCq2UnwFOpuBkqgXz7kHZ5uVleFs
 JXRJ2/0NlXEYmUN+wk5StgsmgNKX2odj2aOfq+dEi4Jg81X5COsJ1w3l2 w==;
X-CSE-ConnectionGUID: AX+NCOwuQ7O/z69QYdUSVw==
X-CSE-MsgGUID: lBcLeQ3UTba3yNvgcRqX9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8162735"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; 
   d="scan'208";a="8162735"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 05:48:48 -0700
X-CSE-ConnectionGUID: zgSaev5MR+u2NMn6J/ychg==
X-CSE-MsgGUID: kPrZwg0tQV2zxiFUfxHEmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20792988"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Apr 2024 05:48:48 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 05:48:46 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Apr 2024 05:48:46 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Apr 2024 05:48:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 11 Apr 2024 05:48:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NB5JeZGu1m3KzpvJJnbM3WlTRDsYLbmoZHWM97ibXCffT4s/tHJ+Etteapp6olp/MSR19qRbEYbiszJ9P4AD5L4etZ30PbHCaF2rlol3WCNf1hJT1YqoPYFrI471yc57wCYeFIT5EFtdUlriumehv/iELtdnm2jjdioeEZETikB1Ugn3aFnUt3iGfBHYAdZ5KfnsafZfb3tkvOXbO2DXGRw5qRMExX3c6gFG/rPe5WfJwr6dWrl2zqADyUJI6RQnVxuczMgreSo5VondZldnHko9+F48+3nK0KLt9D+h2iev5lutZ+uTmRj9CL/z7XaEJOF3Tp74LCD4enRmk5K2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yKWIlmXcuGzlu2FBokZCo4RMWPTRoaMZiriSQDE7bWE=;
 b=QzvckonBhptIlKuz67PKo0WQ6QacRfTemUq0SkqrqmH72dbCZalXPLPReyTE/gXfnYEW7cmNKZ+6yebkYIQhiMq5BatYBQZE7RoOWtQg3SuBregQBMURzZU4KiZrkjtqDZ5x97RIbS1KyU1qtMgOLV33A10lm+aUAuVVPGXSdz6sob1ch/gVYrKX5EPfyrybrY/4GwL/tg7DcuX2yResCWK7Kt4PIbMBQQLt0CAfB1ZeHqtJRrkHaCVr2seYwKEk/Qu04vHpUuaLjBZ+tTW+toQAjDg1n5eWUxae2oKxlW/mLD+39xS0Z679quDvZmbW2oRVT7mJY70P4q61Vg0nFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Thu, 11 Apr
 2024 12:48:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Thu, 11 Apr 2024
 12:48:43 +0000
Date: Thu, 11 Apr 2024 07:48:41 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
Message-ID: <bwwkqrnrd75zdnllhhtw3bapgz3fzdv2gjestlahdr4rxohxx5@5xgdosdtqwsa>
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
 <87le5k7028.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <87le5k7028.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: e7858a01-d402-43e1-0ecc-08dc5a25b83a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OeTE0Jw+EN+zR67DUvGDxjJNN630GoVJoqYN0KrdZEFayKgQ78icPQm6vSoIXgtSgp/KmHO3HfeiZYYfPoRyV3huEad3NFfTN4Yab/OwayivIlgvm2v0Nn1h+8rQg4h9cExI8RZQStawWJrdYcaTxFmEUGJ3MOzW/gC1JzVvfiBwrlF5z1PyOw6ztxn8P3CJyz9YxImG4yTIy1eSbqFg5QI9Rfb2zFac1Opds/Ie5pJIDsZbIcwJY3iSuN9sWow0pthTwaupeAql/YSTjo7FLxcnd3zhXDiOJ15BoKxSvG5V4obxwSBoTP9juR8tlGdcbfl2jLVYjHFVZ8zfh9yzILbNpTareZr7EQe4bUa/bCiQlPVFw3+WZlNB9bEaG7bbJF5Yn5JSkGj49oEKPNR36LZjsG6UMlNh6xozOgMUMf1su58t4wt47kz2RlMQwnZNW9UMeR1K+TtYzdlDB5fd3EGCj6eNwV/EZijz/uhrZgKN9U1y4uDwxz9L+dCqAgzZivtXrQKeTtKwRRuzGpwhvF4yL75dDhW60HEGQhAPPpfoR52NBisskwQc8trCRkZflWzAW8+ZehY04oHHt0l1+j2f1NCI6gdQwX28HG+L1ptzQ2l8UR7h1NsqPHkkT1YOdW79dMhaleL64vPyZvXg02bteL0FbliQueluSS+mRgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6bS6Q32ZhYz96topd67/OGiC+fgLWtY6IJfK3XgaHXkNpsmS021MKF3WC031?=
 =?us-ascii?Q?K00w4QKWPIosaI3Xr84YPJb66WCp05akJFJgfzqq8FO+OlXQmMfTybWXaHsm?=
 =?us-ascii?Q?oZfJTo7u539cCI1e3LkGyK85n/utHAEFaCl4uDlvEkWfs8NRUbjdeYqdmotV?=
 =?us-ascii?Q?EKRALmcmIux07ddXfysBp39UBmhxkCQ72Lu4TUgFU4DXxIb4kKKRbQB/dWem?=
 =?us-ascii?Q?zjtyqPl4zJsH0lUd3GuD15uJfcLzl9L8+grEWaoWvn9BJGFmLu1RgbmmgkD4?=
 =?us-ascii?Q?+K+xUvVNWuX83gQ5l+j59CSAReLV6fkgvfTVvLzy+M4ZNuo/CHA3wOIve+Ak?=
 =?us-ascii?Q?7uu4DMXChG8tRW+veMs0NlJ/MwOEGFtbYaQyxzlhYBKT9NMM2MEcqb2BQL8D?=
 =?us-ascii?Q?LyS3ibytpHS2QoqPfJuCrzWP6tfmP6WPYr/1W2N9Hjb1/AG628nSQi2KlMC1?=
 =?us-ascii?Q?q5AZPz82ZY1s4hh4PqRMM+xCmz+frP00bz/DzixgkeENlRrgN5NU3xAeUrub?=
 =?us-ascii?Q?sHSDZEWFUSjB5pqLoAn/YH/Bh8xSs3KqY/g6ORfxCiBVXUMyvlhQXfwFN8fF?=
 =?us-ascii?Q?qEWKzLNa0fu57H5KehW3UgBn8Nu4LzNK3nH3Jmxttm8WTg/XHmA6SjP7X+BY?=
 =?us-ascii?Q?3pCEpTuI9Gg//7dx/h+E91FhR5b5uCmIlY4mEJqQZ3Jzw/aHXNbVJ0sSlTLE?=
 =?us-ascii?Q?dMQ/KGkdcMeUg3sU0sDLj7ZuL+i5ZmhyjtW2eG7DjfgcXO38Q7At0gYMFBYd?=
 =?us-ascii?Q?m4OHuJ/O87FPylMRcBa7OniPFGPwHxpO1J6xmE8sSJU7qg7Dt8TfvlafgV8p?=
 =?us-ascii?Q?I8l/gEnR5+ogTySDyY3E2ZS37vSH0CObPK68kKlQgMxIb34lZ+4J/S6z+5us?=
 =?us-ascii?Q?dAixbAS+1V90E1ddNs+rcDTMJS7JzUdkN/YRzzXvm8wPx1VAH6mQGNcOgJRD?=
 =?us-ascii?Q?rOlamJERcoQZQS80kjaMl/k1onyse8TJc1bXI2n9o3AOhLkHFMh9SfqIMU0U?=
 =?us-ascii?Q?VO2ha7z8XAQ0JMUNH4fFk8t0o2AilOAwGd9szT45fE4hVMdoLCuC46f35Iax?=
 =?us-ascii?Q?TV0fApus7Y/jVC8sr4PE70dVrRA7NLNYgGbPIOD2VX1F3DYR0lq8tN1dKz0q?=
 =?us-ascii?Q?CaJy3WDXOeTNT0glnNlG/uF+Idj9S+kmXna2B/5+HKfhORlo2JbP1EIlUyfH?=
 =?us-ascii?Q?c7FyZFZ0AwtwQgk1bIl7/6UKP0T7wAnGJ7V55tOVZfN1wZihejh1SjBbGEXH?=
 =?us-ascii?Q?SD/cyW/sSc+SP8FJeiOLIPXDptT5qhUK/aNiu+8gu2Fml9SvN2WFyLyrTpRf?=
 =?us-ascii?Q?FImzQwoZM2Q31uqtaCIwXXN5zl3jV3xyUfUN4gibpj0s9ZmD93+iv68YpP/m?=
 =?us-ascii?Q?uhC3SZ60tuh6XPucdFuruOd8zLvlGRm96OtATZSqYS7Mr1M7M+gNRD4aW/N+?=
 =?us-ascii?Q?9p4aSV4wQ4qlWWLPcr5DoIhNbpNVW3Tl+fRbi7H8sx6ueJjB9jhsk45LoY2z?=
 =?us-ascii?Q?rSOOGdlC1TwEYXBQgQ7yKxaW3LC1i4m4YTFw9HrVQvfTSdZt9aGg7zwilxNw?=
 =?us-ascii?Q?ncM8GdOj5skkR7y4DZ79wq0GW9RZRNqTyCTqPHE+kFG4+mdzQAz3DNbuNJUD?=
 =?us-ascii?Q?aQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7858a01-d402-43e1-0ecc-08dc5a25b83a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 12:48:43.2022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4MXxTdYxXk1sKT+DEPaYPfS6nSthQR1qAVvEJ23j/nFIdUgQ/Nbj8t5ItNXy9MNjb8roLl/lVuDWnmqvq+ukQ0FSu0KH8OElxNulpaEy14w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
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

On Thu, Apr 11, 2024 at 11:53:03AM +0300, Jani Nikula wrote:
>On Wed, 10 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> Stop suffering when using igt from the git checkout, which is the case
>> for all/most developers.
>>
>> 	$ sudo ./build/tools/intel_reg write 0x2358 0xdeadbeef
>> 	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
>>
>> Pretty annoying when you have a bunch of commands to run and don't want
>> to simply ignore stderr.  Keep the other warnings as if the file is
>> there and can't be read for some reason, it's good to give a warning.
>> However if the file simply isn't there, let it pass.
>
>The TL;DR is,
>
>Acked-by: Jani Nikula <jani.nikula@intel.com>
>
>---
>
>We have the "register specs" in plain text files so that anyone could
>update them at runtime without building the source. And conceivably they
>could be generated from a more authoritative source. It would be nice if
>we could incorporate the info to the binary at build time as the builtin
>register specs (so no data dir lookups at all), but also be able to
>override them e.g. using a command-line parameter if the user wishes.
>
>I don't think that would even be so hard. But it would arguably be a bit
>wasted effort as long as the register files under tools/registers/
>aren't updated for newer platforms. (The current builtin register specs
>are completely out of date.)

I don't really get why one would want the tools/registers actually. When
I'm using intel_reg I'm already working on a very low level interface
with the hardware and can simply pass/read the raw offsets.

I think a reg spec like that is nice when we are e.g. tracing, so we
don't have to lookup all the registers that are showing up. I think
Gustavo had something wip related to that. However for intel_reg I don't
have a use case.

Lucas De Marchi

>
>The tool could use some love again. It's been almost 10 years since
>commit dfda0b6aecce ("intel_reg: introduce one intel_reg tool to rule
>them all").
>
>BR,
>Jani.
>
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  tools/intel_reg.c | 6 +-----
>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
>> index 6c37e14d1..ec311a05a 100644
>> --- a/tools/intel_reg.c
>> +++ b/tools/intel_reg.c
>> @@ -1114,12 +1114,8 @@ static int read_reg_spec(struct config *config)
>>  		path = IGT_DATADIR"/registers";
>>
>>  	r = stat(path, &st);
>> -	if (r) {
>> -		fprintf(stderr, "Warning: stat '%s' failed: %s. "
>> -			"Using builtin register spec.\n",
>> -			path, strerror(errno));
>> +	if (r)
>>  		goto builtin;
>> -	}
>>
>>  	if (S_ISDIR(st.st_mode)) {
>>  		r = get_reg_spec_file(buf, sizeof(buf), path, config->devid);
>
>-- 
>Jani Nikula, Intel
