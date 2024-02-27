Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FC7C54798
	for <igt-dev@archiver.kernel.org>; Tue, 27 Feb 2024 05:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E802510EDF9;
	Tue, 27 Feb 2024 05:26:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q08GjZg+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5726C10EDF9
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Feb 2024 05:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709011617; x=1740547617;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=re0gDN8Ml3U1MtlejTomjtV9s2Xs7j5A/YkeK470ihE=;
 b=Q08GjZg+LkmDrrzrPhbijo5g6opq1W/GA3TaxVu7xxF2YqUTbgpbx/2/
 4HgLk2x/kYvZvzzPoud0XttnMuEayw+4QD4IiMkzAZZi/HJ//PXi6WmEv
 QuTNw27Xn+/YKAeeiTuXfCbk5dS9s0bzGONxefBI/bS5gLZS+FsmIjt97
 raOBGe6yOhmMWZvRLfOB9AHBdVN7zIGebJiHpK+/FwWUIg9Le2T0sYHQB
 mEbg0VpzQu2GK5sNYZn/03fuMtITR3KR6jRayYNHQKmrc1qw3dsEFEV3m
 N7RiI7URco/XAh+52uEinaOGUHWM3ayEnbmSvnErQSnVxUbZclFHTCWXe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3196937"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="3196937"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 21:26:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6855724"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 21:26:55 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 21:26:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 21:26:54 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 21:26:54 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 21:26:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEQesyuca8Y2cLtX88jDrtB7FSWAKUcIBpUdb/66qwGhZN77i1rVbTkMaTqaoBihMmujk+H8zStUa0TDxMJTVVU3Cmut5Phhyq2XuCvX5SwFw99VdvAFCxYmuP3xc+7MZXew0ESODBwBiDNc8vmMO9rdZMkaGoKCUOQbd2N2tps5FFcRT/z3TEJZmVXvRZBDLIOtVreoleaCgPkPyceenKXAg5rAZ48ZOJbx8BejtrJCEWmaA9jCTHHa2WaCEhp1MVirzWx3EQZ45J62gGxMpOdm/1cq2MpDKMXzqbDCJWeUYkxq45E1EkgMMGpTQN+/+JJ6EtHf1pQm26QKvJmpvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5WNHwynqI4XfX7QCvGurrhbFE68HYq/5kRP3uSAz5Z4=;
 b=ZWAfFqdOITmoC9VEX/QdPQ8aOq8k6niy3wrh29jjZGLTvyKjI9bBW/6iivtBAwM9PMRpVEOFa95H/ZObDGzRzeRlmp8d1gemn8yXV8or5fbYx5KTa+tgVZOTSokC7vF/IDpVqBwLHlawfQ1TMUnv3EE48Xopo9KV5KnK4X6Pqsp3qN3qqJ7OsPD4YdjWwT/9Z/uRNJFNsc3v6Px0c675EhGXMGTzovi3PS6QDIWlN648dZGTEl5tWtd8DMKat7YXY6ljbPYz+qnc1WLxTwJbhy6klzVrcG2J9kg1qRK6Z8EKfmLWHSA5su3r0d+lWOizzBK0Kl6Tdee+D6pgqwvlPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB6925.namprd11.prod.outlook.com (2603:10b6:510:227::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Tue, 27 Feb
 2024 05:26:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Tue, 27 Feb 2024
 05:26:52 +0000
Date: Mon, 26 Feb 2024 23:26:50 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v2 2/2] lib/igt_sysfs: make sure to write empty
 strings
Message-ID: <ugp4vaysqie6uz4f3g7ucfkyhyutw6hzusrcblsrbdus7pqye7@j7fk427yhw4x>
References: <20240222193326.3004623-1-lucas.demarchi@intel.com>
 <20240222193326.3004623-2-lucas.demarchi@intel.com>
 <1878663.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <1878663.tdWV9SEqCh@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BY3PR03CA0013.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd4d67d-a2dc-44ff-5ac9-08dc3754b45a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: orHtzakCMePTzpqsWU99QTZxpvkAKbAkykiGIZA0UiMtua3I9+Y62GenVwLKxfn8QjE6UwwML1+5/KLR9uyvRA56C06XeYSqhWPp4pg/2TUHgb9sy+5nu1DV4F3PWqINWtdKZGopLJ7gW/AAD65G0v3EPZTEi/jTVi3TH4z1z2fLO0uP7qR7547RqnEQkP67whModCXL5AtLKnktGxPVdYPPLKPk3J2eLqIgJvkDRmRYcJXSPqtRjiqkn50opb+rH6ocwLBg3oAdxhgF9YJlMYFe8IRehKChnG4/fa/BIQeDcXQtjjBH4Z97Eaq5IE7W7Sbsi5r2bBZwNpDUnblUdXYfHKwGuA1CveuJQz2VWgqK1DjY+ZPG0QCCitOc/9/8nt5STA/TZhQwnuCAtwFmSMMS20UxcwBeR3NYPJ20RtLdunpzPAHS4i2F963iGcJbCKWHIMEPyI1AT8AefRs3JKvo8PG6Vh6dwgTgMF+fe7tVfXYkd5vR9dXfszWDiU252Oa4bXbTqEZaBNonBwYr4KUgw7WH5e+935neljS67eWL7wWgz2DC4mC27Q/aRqJ49t1yaffSfneD25kuAOOqQ/nYMZcN7a/3fllk30ZLh4ueopGQ+JaUbRWmxtIqNyp8fs/O7A6EjLLj7Jx+5Zp+Ww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XqwtvaBXS0MMkrsjNnK3OlmIK309O7OeeexSulgi1SaqU+C8Yn6iOxitBilx?=
 =?us-ascii?Q?Gr2BoGhMOzGrWlK1fSYMJ/ogI9goi7yhYhdCetdeJpUVCJn9uq6yHMmsgMuS?=
 =?us-ascii?Q?l3OnWmgf4KHsesSJHBTPLqfhrVQiI5ur54/eSD4xcbG40vjscwRdyky02QFG?=
 =?us-ascii?Q?/AyTmcID/XsxuKppT3KVBKYyZBakLIBm4KUlvqpwKwQYDPZ79nWSpPx2IUp/?=
 =?us-ascii?Q?8KN5hay+35YfeTWZ2GqB4U+wJFv7ePLgUsOK9f0WXG/JouvGggRKGuppvwSA?=
 =?us-ascii?Q?aRWEK3r5eDaGJRo7ck63qpnjJgs3bufBm+LE+f7Hsp0gTUnIBNzjoEknsbd7?=
 =?us-ascii?Q?P3J6SwElkrvEe6DxtFTffFEIuWhgpgchxNey1oCBToGwVYUr4p47+qzBi6DQ?=
 =?us-ascii?Q?3nJMt7XZ8tUKWPhMw0Ty4aEObWvvQTTdlxThJUTWVTUrbnayH8yUokHt4v1v?=
 =?us-ascii?Q?G3JoV6F5T8zgrNpSLZVQRYDVrQGtZ10DjglD2a7Mjg6yG0jbrdX9QuWPXuUm?=
 =?us-ascii?Q?5TP08ARZu150JHezcHFTLOXLCPxQtScG2TAx+GmEP5YEIPuQhnVMl+1NS9xL?=
 =?us-ascii?Q?jIQDsw1mcS6s7Z/siEcIJJSpxgTjGakRVEE5QGLFytYs9YYOo3oAoSqw0XbL?=
 =?us-ascii?Q?es5eEhDN/UY6ojMM18leGACH5AkmGslrSmC7h71UrfFE+j7kwec/M3ZrKICD?=
 =?us-ascii?Q?E0g/HOfjR4uj5yDgoevoGLDHctv6Ag9vVU/kKp7T0/NZa/c+xeveYsfZn56h?=
 =?us-ascii?Q?ClPEMAl96ijC+1Z+vS9SKhjKyL7cX6c2iQup9fOB+JQziXyZEJZA0+5iXJXf?=
 =?us-ascii?Q?3moH+a/ADX6qiN9tFIk8P6pKPrHEXwuGTJuF3go7x0rr/ccvvS20GvcOR6ig?=
 =?us-ascii?Q?qHA6tOs80CY05JpBoRmkmFdqKNk+LemOIaguATpJd9Tu68Fhsg1iiY9LYUs3?=
 =?us-ascii?Q?LlCWgCcQ5R0M1NtGhj9XYEsBxPKUTGQjRtyiA2FWpNxJ3lA+pgj5c0HJXkU4?=
 =?us-ascii?Q?yBd5JL3IBc8YNLrD4Aag8fmZEyU6FjG7zkIGTdRnKdyR34y+TNZ75KC/5/7A?=
 =?us-ascii?Q?8VeyYdz7HSkIkHK/4z50HGjBFowJIExgU3+Ft7k7f5qTCq9mDWq+52JiTi4d?=
 =?us-ascii?Q?pPK12bL1MjUZEIOC7VcWEFqSAIwbjtibq2a/Zptv0IemZloSPFmCkmiT4Wif?=
 =?us-ascii?Q?hmBt0TCN/JtErhfgJNY4F52fKvFp7bHjn7322P0ovVoZZLtinJNvv6QWDf0c?=
 =?us-ascii?Q?urBTgfUDFkRVzJbE0EQ/r7DR7LGB1IGHPH6xvrnll+mHUX/f92iDbA8R6G4n?=
 =?us-ascii?Q?Uzi7K1cT4RV6wrrYqJ3GkFlok25LQf0YfzZYV4IvDO96K0PhfTL9KdVYFvSv?=
 =?us-ascii?Q?18BEwfus6VnUDGwWuLS8FBb6qlrhiXOHlNghW1vea0m+/vUTNkcMbgv5u866?=
 =?us-ascii?Q?0gTPPZXtysSxtZq+oPdU0Rm2nNSI5tSxOKGB9jJcSOoZ+sGCV06ymcLvuDcW?=
 =?us-ascii?Q?8LpSr9mOV65ZqAF/PxV2gUU6lYkHwkV7ikBXAeE402ZHiG4T0m3u1M8VavCt?=
 =?us-ascii?Q?tsb8IbtvcUpf6mINh2B9kyFirkc3KvEDabz56c7tapvFho0q2oOYiv6YIYg5?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd4d67d-a2dc-44ff-5ac9-08dc3754b45a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 05:26:52.3740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B5jIwk14Jpmfcc2jcliNb4dkccsWvcrn7Qu7au9gTZ6nN1rvV2SgzrofyteOSTTuX0B48UYapcaeqT/FfUdHQVCCKSGNohw9BZD/fPr4Y5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6925
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

On Mon, Feb 26, 2024 at 10:11:05PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Thursday, 22 February 2024 20:33:26 CET Lucas De Marchi wrote:
>> 	echo -n "" > /sys/module/<modulename>/parameters/<param>
>>
>> doesn't really work as it will just create a open() + close() expecting
>> the file to be truncated. The same issue happens with igt as it will
>> stop writing when there are 0 chars to write. Special case the empty
>> string so it always write a '\0' and make sure igt_sysfs_set() accounts
>> for the extra null char.
>>
>> Shell example:
>> 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
>> 	# cat /sys/module/firmware_class/parameters/path
>> 	/foo
>> 	# echo -n "" > /sys/module/firmware_class/parameters/path
>> 	/foo
>> 	# # make sure to actually write a \0:
>> 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
>> 	# cat /sys/module/firmware_class/parameters/path
>>
>> Same thing happens when testing igt_sysfs_set():
>>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>>        igt_sysfs_set(dirfd, "path", "");
>>
>> Previously it was not really setting the param.
>>
>> v2:
>>   - Fix return code from igt_sysfs_vprintf() to differentiate between
>>     writing 1 or 0 chars (Janusz)
>>   - Document the behavior of igt_sysfs_set() as being a higher-level
>>     than igt_sysfs_write().
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_sysfs.c | 28 +++++++++++++++++++++++-----
>>  1 file changed, 23 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 2b0225138..d5d5b249f 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -349,6 +349,9 @@ int igt_sysfs_get_num_gt(int device)
>>   * @len: the length to write
>>   *
>>   * This writes @len bytes from @data to the sysfs file.
>> + * Contrary to igt_sysfs_set(), this does not automatically add a
>> + * null char to terminate the data. It's caller responsibility to pass
>> + * the right len according to the data being written.
>>   *
>>   * Returns:
>>   * The number of bytes written, or -errno on error.
>> @@ -406,7 +409,12 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>>   */
>>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>>  {
>> -	int len = strlen(value);
>> +	/*
>> +	 * Always write the null char at the end, to guarantee the write goes
>> +	 * through, even for an empty string.
>> +	 */
>> +	int len = strlen(value) + 1;
>
>Since pre-merge results indicate some sysfs entries don't like that extra null
>char, I'm assuming you are going to submit a fixed version.

yes, basically I have to return back to my previous version, changing
the behavior only when it's an empty string. But this time I tweaked the
return code so we don't return 1 when writting an empty string.

That's because some places in the kernel try to play nice with a
possible \n in the end of the string and do a strchr(s, '\n'). If it
doesn't find, then it considers the passed size to be the len and then
compare with possible values. However now the lengths don't match and it
fails. Example: pm_test. See kernel/power/main.c:pm_test_store on the
kernel side.

I thought about a quick fix on the kernel side that would basically be:

-       len = p ? p - buf : n;               
+       len = p ? p - buf : strnlen(buf, n); 

but it would be hard to know how many other places use a similar pattern
and would start failing.

Lucas De Marchi

>
>> +
>>  	return igt_sysfs_write(dir, attr, value, len) == len;
>>  }
>>
>> @@ -506,7 +514,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  {
>>  	char stack[128], *buf = stack;
>>  	va_list tmp;
>> -	int ret, fd;
>> +	int ret, fd, len;
>>
>>  	fd = openat(dir, attr, O_WRONLY);
>>  	if (igt_debug_on(fd < 0))
>> @@ -515,11 +523,12 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  	va_copy(tmp, ap);
>>  	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
>>  	va_end(tmp);
>> +
>
>NIT: Not related.
>
>>  	if (igt_debug_on(ret < 0))
>>  		return -EINVAL;
>>
>>  	if (ret > sizeof(stack)) {
>> -		unsigned int len = ret + 1;
>> +		len = ret + 1;
>>
>>  		buf = malloc(len);
>>  		if (igt_debug_on(!buf))
>> @@ -532,13 +541,22 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  		}
>>  	}
>>
>> -	ret = igt_writen(fd, buf, ret);
>> +	/*
>> +	 * Make sure to always issue a write() syscall, even if writing an
>> +	 * empty string, otherwise values in sysfs like module parameters don't
>> +	 * really get overwritten.  vsnprintf() guarantees to return a \0
>> +	 * terminated string, so just add that char. The return code is still
>> +	 * the same as before, to abstract that from caller.
>> +	 */
>> +	len = ret + 1;
>
>Potentially the same issue with some sysfs entries, I believe.
>
>Thanks,
>Janusz
>
>
>> +
>> +	ret = igt_writen(fd, buf, len);
>>
>>  	close(fd);
>>  	if (buf != stack)
>>  		free(buf);
>>
>> -	return ret;
>> +	return ret == len ? len - 1 : ret;
>>  }
>>
>>  /**
>>
>
>
>
>
