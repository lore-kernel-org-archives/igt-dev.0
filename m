Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D0CC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 18:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2100B10E1C8;
	Wed, 28 Feb 2024 18:07:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fkh9BEAv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B302010E1C8
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 18:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709143659; x=1740679659;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3xSdLki6zPt/DSHqfdppkw5VW9/vBuhF/YWDKQT5wDw=;
 b=Fkh9BEAvneiFAVRSH0k1+WhgCTHDcMxbGgOTnQYTix/+4jfxmMkZOJhJ
 4HW6Zb/Ls2OOViwBngYafZY/MeE88XAkzx6ot6rm9gGPEgRhBmLAV8MUK
 V/VOhQRqYd85Dou3Fwl0YbO/acdoPh8KTSkgOuTWxLBbaf7hqvgLXO49X
 NyE3SMBnYsOUCpmHBnrH4kUFA1+vqv2cceGAGxaHzzg2A537eAUSWrV6C
 ab8E1TtpjvWrImCDaebzOP3gD0oeCoXDg2hIqNDTxokxepWbiSSCYDaTX
 8/9Lf4yA2OCwx5PTFAbgN78Abj0FhPGVotCU3NSqD3/SW5efN3ectJNAO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3726650"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3726650"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 10:07:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="12056196"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 10:07:37 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 10:07:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 10:07:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 10:07:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 10:07:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccrbHDJi2LcxdxC4xBonhi0U+9gyAxa5ybCBBOANvFOdx931R0d+z12wl5Y5CcYt+dRoz05FnVFpmsaD0eNdXD7EToqBRpUhU0YwX0lV12bqpmbUMd1YwFDzp/8iU2hdVpvQRdmLOvecKNToVePldH910e8Vhs0dFk+muZaMregpDQvL8jens0f9pkYGXdVdlp+jxXVzM7cVXn7bnB2VAisdbko+U6xvt//NDcmy7nnPkDDATSWpPz2S5vskWwH0K3QhEUSDCaHHUPaTRfzYtY22KApw4DTweFZyg8Sf/fnesia070GlzcnO5YJUkPecIrE47w27l9xNTUZF05ubOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xwU6gTVllL5revfUHURlUJnrchtfCSrQ9moDddJXOds=;
 b=bXHSGoWttxNxsT2fQF7e0eUXbDS+mSdeNBwdgiRqPU3AOXld3vgto21QPrVCCC0cS/2bd+G18K99STRcRZX/sidstQ0mlfLYj/m/XmCUh3Iyb0to1o+gpvEJMedLFiazDs9wEwu32UmPd7BkjIzQ9M8Ty8h2Pon1MeQWVsDJ4HhmJHG3wZ8gwsretGrnbJmVx0T0u+X8QFxj1OnYpjJ2IangrwIWUKDTEoRNiWuGQaIO0hv3nMvxvdto13baVfYN1GFeOTZxSAW3hBjylcK3dHkbacF45Ij/1rPpO2kTM3fIlrtgwSUn3aIlcpNCwWxzhwaEjdw4nr8clf3alWvvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7620.namprd11.prod.outlook.com (2603:10b6:a03:4d1::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.21; Wed, 28 Feb
 2024 18:07:30 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 18:07:30 +0000
Date: Wed, 28 Feb 2024 12:07:28 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 3/3] lib/igt_sysfs: make sure to write empty
 strings
Message-ID: <nl3zfaibo2wbtvm5s7fuexf7rrs7cfwliw2sp6zzz62h2mji5i@k42a4jzwxvm2>
References: <20240228063211.3662862-1-lucas.demarchi@intel.com>
 <4978543.0VBMTVartN@jkrzyszt-mobl2.ger.corp.intel.com>
 <3ciefsqutvjv2b32gdd57fm2pcqkt3ht2uzlkzbk6xqsevfndo@4j5bzgsku4ue>
 <2120220.bB369e8A3T@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2120220.bB369e8A3T@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdf94c8-3027-4d47-3e3b-08dc388820f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLpbDb2KIZSvgT0nWhqHWtMM3EvQJJHTcpNWGDyoAjnIaqyT1xHJ7Au53TBQtevrKNOXxk0U/6YErt7bV25xjTQBAQVFCBKP5EQzuWD7RS6WXJOd0sFHyatDldPgBhyZetH1J9dL912EOF93OAyvvfFhV7K9A2HQPi2VIYLXXHuyhu1yB+K8TTkN65NoWavzwzAOFw4uBDeoOd5rB5KRFnzqnDhGmWglrF5vHHkZmXmiSf6o3ebbmm6z6XLmknbnlikhZF5MK/Tcrv9Uz6K1zEzzZEyejNrelYd4XmoJgzyfZ9LVZrEx1EITXaEj0q4VlgVhcT2ZUL2OAsypLSaTkr9Nn4dEfJFqUt0MQ7iCczhbsdXzdCQDKqN176xypMzbWTBxbz/BZs/lLaGr1Nf0lNLg3NH5e93FzWTQNDJaCKbRLRiOzyQBxWrhn3vLASN7WQ/TckoVaheNtg6yQtlaRMQETwG7R+Q774QvzFy2/mDmbFx6VV/2r4ZQttRCL1DLMvHA5UHvLBjA1AUvNxgX9U82duB0gxwOlgoR+Qq/Xku9OfZFTprS8f4oc3TjNsV5W7/qIYKdafH+YhOrdkz4sgGv3XXTcc5avQucdcKWUVgtWBpsRYZjObExvOUKB8NudWD8IhvRMlenygNfs5FkCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dI6qeeHu39MCAqaHmb+r54BL4tsIt6fdggIBz1zc6/g2WZXVKAwDxszpgtlj?=
 =?us-ascii?Q?2O3/XxV5SbiOkX6TcHVYj8/G8W1aHF18nVIi8FODoDOk66gI7ERSAbqCVSOT?=
 =?us-ascii?Q?oziRM3B50DYBOKDTnT7b+UFCrf35uVjmYiubIXI/QJGQPfKiZaSsj/0LrzxS?=
 =?us-ascii?Q?cJ40c/ngJo/+xYcPlSDMRwfSzHN/09jd/dmfyVfA9+w7SbZa8a3i5Wu4SYRr?=
 =?us-ascii?Q?m3xeA6XCQvTaLdo7Ffeu+W9KOzqfhS5BAh5WF090Ysq5I420yfAo/LF7zXFO?=
 =?us-ascii?Q?OAly/+6E7UZ0nYEj0jqM3QXKZnVkTt4gpOyn2NTmiyjK94f4SiRMxjxqTDVY?=
 =?us-ascii?Q?F8ay+X2GzmwGVi189PtsqsY36BJs+ayP+rNWAMQGvP3NKKW4tDuAwq2Ekrsv?=
 =?us-ascii?Q?QFSVPu5UCjAfGyhaIZDM24EXaoqT4NpRnnEvKnwicCfu64ok3LBXY1y7yFEk?=
 =?us-ascii?Q?bGTpzcih1YC2MZOByGmQjqHcJlWqZyjoy8uDglHNT+hbnPooRha+xwho5dFF?=
 =?us-ascii?Q?2yxhu0UWo4B9ThJw9ZUlRhASeBTbm6ntqJY3nGtLvCRGGlrsrJpvVBm3rk0M?=
 =?us-ascii?Q?2eNWnoF+V47zAdQuABw1bJnn/emDlXAGouqzflElSPkDSsXOCYowKs6pvWdr?=
 =?us-ascii?Q?iL/5Fzyqv9B0w18EUH2jt7pAE5yI/CX989ZwPxkqfDnfrc+2jllaA8fV54Lb?=
 =?us-ascii?Q?EO3P0ptvE5/4C8A2VAps2yd3CU9JHXZAVzw5P0YXot9RbLRXoXeGM9C6PsoK?=
 =?us-ascii?Q?dHLtbe49Zr4S0EakQNOwhvsViiNpFvEYy0M9FC1VsCYnJCFRxfxfiPkNXc6r?=
 =?us-ascii?Q?APOuW2MHHKN/7wy4d9/KOmzSCvaV2Ix+6LgbRwVw1thkHc2DSgB5Mv1SN4Cu?=
 =?us-ascii?Q?376sfFWaot6G32WBVqj37QJ0G7iexkK1TDukHFwQGb9zTxINlzL752YWB1iZ?=
 =?us-ascii?Q?DPy53eqFX+oQCyzASNRd5CGwziEoICdQQQe6A8eEoZwXH6c2UQyemVt7FhUK?=
 =?us-ascii?Q?kJoCGtIPitEGNSql9kCKz3nzAHH+DcoR8QpGhW0JaceFoGQq/fMUEXh8xJBK?=
 =?us-ascii?Q?oDXMZleqSBbXiBZvGFiRjZRDsC6gFRk0PxC2JQwAITLoK3/5AAWWvMBR5z2D?=
 =?us-ascii?Q?hanP14850IFQSKS/uG6M3Eg/IoeycxB6O4J+XAZS7BpI1dwwpHXUd5eF4FhB?=
 =?us-ascii?Q?8pKa1XQH2xYND3rqM045e86ORHQ6QQETei5iN5nrPdM8cNUfzd1JL9A4gWgl?=
 =?us-ascii?Q?8ciwrL9PHjWoKShhHDk/fZeNtnp7Wy0EmdJY0MYfNowlyuqMU79DFYeM0nOd?=
 =?us-ascii?Q?VQywAlOBwj49lGOxxkCZZi6ZWVolG4LfIyYFNdrGZLIWiXEu38+Wx70FB2bK?=
 =?us-ascii?Q?PTpEjb9R1DIrIoYpfHZkukLx+z7eijZJfkKYNRY1qawwEmJG7k/Uq+uLd2vZ?=
 =?us-ascii?Q?BDSC8tLviEAG8mMYy5qEuXk2GCOBpHIJ0BWagJvuDVvHm6s8x8Nvf1VC5Mo0?=
 =?us-ascii?Q?FCTY97EiPHkvaZsqVFxZ3raeBRarTc/scKuQlILzMFkv1c8GUCxLatYDuBau?=
 =?us-ascii?Q?+IhrsJfowXe47vBaOUS+lRQNAZngdya56aJd/NZ0oKZ145ELou+y6/NhOrcG?=
 =?us-ascii?Q?ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdf94c8-3027-4d47-3e3b-08dc388820f0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 18:07:30.1044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DMjjmFmIEeEGWPE1gsCc9QCLzDda/8R6/smse3rFZ05IdfAYMdS/xnWkC6ZUg4BoTrDMSpg6vOXaKV9d0o/sQNUvk42JMJKQ5Qtm1k52768=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7620
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

On Wed, Feb 28, 2024 at 05:07:52PM +0100, Janusz Krzysztofik wrote:
>On Wednesday, 28 February 2024 16:54:59 CET Lucas De Marchi wrote:
>> On Wed, Feb 28, 2024 at 12:13:22PM +0100, Janusz Krzysztofik wrote:
>> >Hi Lucas,
>> >
>> >On Wednesday, 28 February 2024 07:32:11 CET Lucas De Marchi wrote:
>> >> echo -n "" > /sys/module/<modulename>/parameters/<param>
>> >>
>> >> doesn't really work as it will just create a open() + close() expecting
>> >> the file to be truncated. The same issue happens with igt as it will
>> >> stop writing when there are 0 chars to write. Special case the empty
>> >> string so it always write a '\0' and make sure igt_sysfs_set() accounts
>> >> for the extra null char.
>> >>
>> >> Shell example:
>> >> 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
>> >> 	# cat /sys/module/firmware_class/parameters/path
>> >> 	/foo
>> >> 	# echo -n "" > /sys/module/firmware_class/parameters/path
>> >> 	/foo
>> >> 	# # make sure to actually write a \0:
>> >> 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
>> >> 	# cat /sys/module/firmware_class/parameters/path
>> >>
>> >> Same thing happens when testing igt_sysfs_set():
>> >>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>> >>        igt_sysfs_set(dirfd, "path", "");
>> >>
>> >> Previously it was not really setting the param.
>> >>
>> >> v2:
>> >>   - Fix return code from igt_sysfs_vprintf() to differentiate between
>> >>     writing 1 or 0 chars (Janusz)
>> >>   - Document the behavior of igt_sysfs_set() as being a higher-level
>> >>     than igt_sysfs_write().
>> >> v3:
>> >>   - Partial "back to v1": include the \0 in the write only when writing
>> >>     an empty string: there are some files in sysfs like pm_test that
>> >>     don't like
>> >>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >>  lib/igt_sysfs.c | 33 +++++++++++++++++++++++++++++----
>> >>  1 file changed, 29 insertions(+), 4 deletions(-)
>> >>
>> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> >> index 2997925e5..2d574cc17 100644
>> >> --- a/lib/igt_sysfs.c
>> >> +++ b/lib/igt_sysfs.c
>> >> @@ -349,6 +349,9 @@ int igt_sysfs_get_num_gt(int device)
>> >>   * @len: the length to write
>> >>   *
>> >>   * This writes @len bytes from @data to the sysfs file.
>> >> + * Contrary to igt_sysfs_set(), this does not automatically add a null char to
>> >
>> >Should now read something like "this does not automatically write a null char
>> >if len is 0", I believe.
>> >
>> >> + * terminate the data. It's caller responsibility to pass the right len
>> >> + * according to the data being written.
>> >>   *
>> >>   * Returns:
>> >>   * The number of bytes written, or -errno on error.
>> >> @@ -407,6 +410,14 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>> >>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>> >>  {
>> >>  	int len = strlen(value);
>> >> +
>> >> +	/*
>> >> +	 * Always write at least 1 char, the null byte, otherwise it
>> >> +	 * won't write anything on sysfs.
>> >> +	 */
>> >> +	if (!len)
>> >> +		len = 1;
>> >> +
>> >>  	return igt_sysfs_write(dir, attr, value, len) == len;
>> >>  }
>> >>
>> >> @@ -506,7 +517,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>> >>  {
>> >>  	char stack[128], *buf = stack;
>> >>  	va_list tmp;
>> >> -	int ret, fd;
>> >> +	int ret, fd, len;
>> >>
>> >>  	fd = openat(dir, attr, O_WRONLY);
>> >>  	if (igt_debug_on(fd < 0))
>> >> @@ -520,8 +531,18 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>> >>  		goto end;
>> >>  	}
>> >>
>> >> -	if (ret > sizeof(stack)) {
>> >> -		unsigned int len = ret + 1;
>> >> +	if (!ret) {
>> >> +		/*
>> >> +		 * Make sure to always issue a write() syscall, even if writing
>> >> +		 * an empty string, otherwise values in sysfs like module
>> >> +		 * parameters don't really get overwritten.  vsnprintf()
>> >> +		 * guarantees to return a \0 terminated string, so just add
>> >> +		 * that char. The return code is still the same as before, to
>> >> +		 * abstract that from caller.
>> >> +		 */
>> >> +		len = 1;
>> >> +	} else if (ret > sizeof(stack)) {
>> >> +		len = ret + 1;
>> >>
>> >>  		buf = malloc(len);
>> >>  		if (igt_debug_on(!buf)) {
>> >> @@ -536,7 +557,11 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>> >>  		}
>> >>  	}
>> >>
>> >> -	ret = igt_writen(fd, buf, ret);
>> >> +	ret = igt_writen(fd, buf, len);
>> >> +
>> >> +	/* Caller shouldn't know about special sysfs handling, just return 0 */
>> >> +	if (ret == 1 && buf[0] == '\0')
>> >> +		ret = 0;
>> >
>> >Hmm, now we no longer support writing data with null character embedded at
>> >position 0.
>>
>> why not?
>>
>> igt_sysfs_vprintf(fd, "foo", "") will cause vsnprintf() to return 0.
>> igt_sysfs_vprintf(fd, "foo", "\0") will cause vsnprintf() to return 0.
>> [1]
>>
>> which is also true for both if tried like
>>
>> 	foo_val = "\0";
>> 	igt_sysfs_vprintf(fd, "foo", "%s", foo_val);
>>
>> Is this what you are trying to differentiate or did I misunderstand?
>
>Not with just "%s" (you better use igt_sysfs_set() for that), but possible
>with e.g.
>
>	igt_sysfs_printf(fd, attr, "%c<more_fmt>", c, ...);

ohh, right... there are indeed cases where this could happen. Thanks for
spotting that.

...

>> > -	if (ret > sizeof(stack)) {
>> > -		unsigned int len = ret + 1;
>> >++	len = ret;
>> > + 	if (!ret)
>> > +		/*
>> > +		 * Make sure to always issue a write() syscall, even if writing
>> > +		 * an empty string, otherwise values in sysfs like module
>> > +		 * parameters don't really get overwritten.  vsnprintf()
>> > +		 * guarantees to return a \0 terminated string, so just add
>> > +		 * that char. The return code is still the same as before, to
>> > +		 * abstract that from caller.
>> > +		 */
>> > +		ret = 1;
>> > +	} else if (ret > sizeof(stack)) {
>> >-+		len = ret + 1;
>> >-
>> >- 		buf = malloc(len);
>> >+-
>> >+- 		buf = malloc(len);
>> >++ 		buf = malloc(len + 1);
>> >  		if (igt_debug_on(!buf)) {
>> >+ 			ret = -ENOMEM;
>> >+ 			goto end;
>> >+ 		}
>> >+
>> >+ 		ret = vsnprintf(buf, ret, fmt, ap);
>> >+-		if (igt_debug_on(ret > len)) {
>> >++		if (igt_debug_on(ret > len + 1)) {

shouldn't this be 

  		ret = vsnprintf(buf, len + 1, fmt, ap);
		if (igt_debug_on(ret != len)) {
?

what if ret is negative (unlikely, but it seems before this patch it could
happen due to an off-by-one in the sized passed)?

with your changes + these above, testing igt_sysfs_printf() I correctly
get the results for:

1)
	ret = igt_sysfs_printf(fd, "path", "%*c", 130, '/');
	ret == 130
	$ hexdump -c /sys/module/firmware_class/parameters/path
	0000000                                                                
	*
	0000080       /  \n                                                    
	0000083

2) 
	ret = igt_sysfs_printf(fd, "path", "%*c%s", 130, '/', "foobar");
	ret == 136
	$ hexdump -c /sys/module/firmware_class/parameters/path
	0000000                                                                
	*
	0000080       /   f   o   o   b   a   r  \n                            
	0000089

3) 
	ret = igt_sysfs_printf(fd, "path", "%c%*c%s", '\0', 130, '/', "foobar");
	ret == 1
	$ hexdump -c /sys/module/firmware_class/parameters/path
	0000000  \n                                                            
	0000001

4)	ret = igt_sysfs_printf(fd, "path", "%c%s", '\0', "foobar");
	ret == 1
	$ hexdump -c /sys/module/firmware_class/parameters/path
	0000000  \n
	0000001

5)
	ret = igt_sysfs_printf(fd, "path", "%c", '\0');
	ret == 1
	hexdump -c /sys/module/firmware_class/parameters/path
	0000000  \n
	0000001

6)
	ret = igt_sysfs_printf(fd, "path", "");
	ret == 0
	hexdump -c /sys/module/firmware_class/parameters/path
	0000000  \n
	0000001

7)
	ret = igt_sysfs_set(fd, "path", "");
	ret == true
	hexdump -c /sys/module/firmware_class/parameters/path
	0000000  \n
	0000001

Lucas De Marchi

>> >+ 			ret = -EINVAL;
>> >+ 			goto free_buf;
>> >+ 		}
>> >
>> >and then:
>> >
>> >  	}
>> >
>> >--	ret = igt_writen(fd, buf, ret);
>> >-+	ret = igt_writen(fd, buf, len);
>> >+ 	ret = igt_writen(fd, buf, ret);
>> > +
>> > +	/* Caller shouldn't know about special sysfs handling, just return 0 */
>> >-+	if (ret == 1 && buf[0] == '\0')
>> >++	if (!len && ret == 1)
>> > +		ret = 0;
>> >
>> >Thanks,
>> >Janusz
>> >
>> >
>> >>
>> >>  free_buf:
>> >>  	if (buf != stack)
>> >>
>> >
>> >
>> >
>> >
>>
>
>
>
>
