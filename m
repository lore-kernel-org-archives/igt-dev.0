Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97822C4828D
	for <igt-dev@archiver.kernel.org>; Tue,  6 Feb 2024 17:13:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30BD6112CEE;
	Tue,  6 Feb 2024 17:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iU4OEuN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2B94112CEE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2024 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707239601; x=1738775601;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yzt5QN9nlGhBbZZGllXOU3fUPI5ltuweIWlNv77QFAw=;
 b=iU4OEuN+HRt0VlJm+1+N9JqFIONmFQgG1ehxTcP34pJEH1MZQRXh/BEl
 CZ9P4ZiY9J1kYKpNtUAW5Iec2+wYd205za5DL2eTeTQfMnnEaQ1zfJgli
 dfDF6DbXHXvkDa8r7iQmAUeREttBWUIf7jpEi1ckJxX8U2UR4XMCWuo/y
 0gQupDG7VFil82LOQHM+1yZaALGKQz5U1Mg3qosymdV2Xh+oti/CdPpmo
 zuDv1gvUARRF42GZsm35Lj/D6tN2JvfezrYSuoKHfNHkArJza6QEhYgxT
 0WE5Tvm2c9uMqrsfkDwR4VsVv1bFi6lyBveLpnLUi93wj0zjs2m64PM5H Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="18314312"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; d="scan'208";a="18314312"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2024 09:13:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="1392066"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Feb 2024 09:13:19 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 09:13:18 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 6 Feb 2024 09:13:18 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 6 Feb 2024 09:13:18 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 6 Feb 2024 09:13:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j45fsME64FFu2HRr9Iio8ipDoCPpCGflj4bc6NJaw8O/m6h6myl2KcuQzMVXYCnHGIjZrNYhzJ8l7GKFh71ZnwfJkuN9OCh7gNmW+mhaPOCZ69Amk7xMEEBRjUqplLfqy5admxzoDq1nZscKj9Z0nfWf9qco5r0FHzD8kwWiMedBrF7/+pats4mG2COsynjVxtjaL1i75YwbEHqHWt1L+LJjLcC+T/SUsCO0ihUdH8E9zeNz8rn4b/fM1pLakSLsnoiEDFtnCZJ4TwPrW8gU7jDmE6P2nW4/q9IvEGeIbyEZEcukS7luIVa6NxUPwrqx9s2TCU1Ywl2F5vDkPTn1qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNKUVZqF2AH+cD9yYF/TsviBMPcTUoW6dCAhkBsnSIY=;
 b=gBfirZb3oxv3Y89t4A2V5HjTMmzj/GMiu31K/V4lHgzOVte3WagnZ/2Q9Hq4TkGJd8/UMfvbdy21drNMmJk8E9hX/GKE21ZnOqopc2yI5+/KOLeffZCgd0uOPG78qqSL51LIWlnm0NGE82G3DouUDaCUq44lsGAumot+zRpml1qSfNsCNxdyAw5rJcYDp7TAqvfAMXlTg5ySqjw3SmrUkKpguxA+C2RcU4n8BjTPzllTFwuHIm6QGCtJtfok5ileYc7H6tmJleGg1pK9DWJApzZOghop9hqrfhCqf/A7Bo9Q9egG0Bo3gqKcCxopYB/Wyr+6HY6aIVGIGHwCqHNzDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY5PR11MB6257.namprd11.prod.outlook.com (2603:10b6:930:26::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Tue, 6 Feb
 2024 17:13:15 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.035; Tue, 6 Feb 2024
 17:13:15 +0000
Date: Tue, 6 Feb 2024 11:13:13 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: Re: [PATCH i-g-t 2/3] lib/igt_sysfs: make sure to write empty
 strings
Message-ID: <puqmq3gabtwf7xnm2quv3u7tnlqkkjrr3zpregdz55whjyn2r7@ayuvzgewlgpo>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
 <7831979.gsGJI6kyIV@jkrzyszt-mobl2.ger.corp.intel.com>
 <kb62dcczkzw4jg7prn3gx4dk2hzuvcd2gc4uk7ml33j7u5ec26@bd5zugzastmi>
 <2377109.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <2377109.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR13CA0104.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY5PR11MB6257:EE_
X-MS-Office365-Filtering-Correlation-Id: feee6718-e907-4e86-f715-08dc2736e7e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZXQueVGyCRxAC0AQqzu8GS7f/0h6OWio+sDqxqBMpoTPMlAV+brY7BzI7KMjEku/Um9kTkd2yazui3TDOcquES0QVY9YhbaX6RJ4CGm8S4ZJpjvAznol++kta3fGePGuashccniii00/H7wHeQCYKMZqJpMtXrT4ncptZbJ6VxHWXVYmWqRkEM/335INIpLOcEE+auO7eSdWzWCn7hKtKzCgBpUBBGH6TE0UtIn2qaNJzhnlaZM2L0fjtgUF8/UjTf/KvbWu8ZAv854TLR1TtDxZc02m9UI73B6aEEpa3QFM387oxX668+L5eOp8F9MBoXOF5zxMnSeL6y5ahlQIbXnLNcClbusmdKHM+CqDYIOrBXfKb1TfLLo6U/ilVisg+qk2VsLszSVZ4oRJHSSJEQQF+9jHS+2a7kOLu6tQUW+vkLghqpoU1lujISxoe6IDgj/HveLHpqutegNtwrESvwif3jjUAZ6bgImRac3hOuOIfjcpnvfEFhocFM+I0q0hFhB90Fc2AYy8QBlli9iTpZiK0m5USH3Bd5AzTmfq4pTYW7ETmXrGwSKlt95eqlcbwEUeUsd0Ado9hdfFZvD2jAm2SrEG6CY0QpnmCdgJQTiVFFpDJW2M5eBxvFRPbOMA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(366004)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(8676002)(66476007)(41300700001)(66556008)(66946007)(66899024)(316002)(6916009)(5660300002)(33716001)(4326008)(8936002)(2906002)(83380400001)(38100700002)(82960400001)(6506007)(9686003)(6512007)(478600001)(6486002)(26005)(86362001)(27256008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rD/OWEN/4hr5785IIxWsXkDJAecCYARNKS4ltbFswCiMLPT0YSDmo2rU8tl5?=
 =?us-ascii?Q?vjJ/IFnBGtzt6r0k8StE1G5FSAG8iJwtLoPa8qJmDwNsImpwjCvrmjkUwXtz?=
 =?us-ascii?Q?CjxvBZcuk0ZVNGBdt0yANdajPdIJHR7yyp+XZDUv6QD9SLt3m0TA9I7LwEjA?=
 =?us-ascii?Q?vaQk2km60fMGiSApnrFBqofYHk/h80MTWIfF3sW5ujmtK7U7W2d2pR9KSdaY?=
 =?us-ascii?Q?JbVTdb1tH2yZTrsT8phnYBfhb0g/sokAbvHzrNLIvgujrHu7FAdy/PRwtucQ?=
 =?us-ascii?Q?/l1lA/NGqRcbChzWbuOeEGzmZGrDkar4/USyWX2JMCeDpT+jBLT7n1vcCeYL?=
 =?us-ascii?Q?G0OTSyVgmX5VRU46XlrHVbG08VfEu/nu2IWaapbnBHxsQDJVjoxZOLye189x?=
 =?us-ascii?Q?3x68e0A99zEQUOB4KA+Yd2OxzJ5n0ETQg0UYLefBF65Gv41Zu+VCcXcypaQZ?=
 =?us-ascii?Q?8H0UZxkxumpfGD0fgag2vR/s4GzZXIEAHm7nnoIvr230szpRy5CUV+xIdy/W?=
 =?us-ascii?Q?c5lPAvaS6akHTF4HH7G/ZiKVzmgoXbSGCLXEpK+ONMnhmByNi+zg9jtW/ss4?=
 =?us-ascii?Q?oME2ik/hCE+pBvL3HSO1qA3MwijRR6O5BgaoGxqsmNMbdKhegVzr/uXaBhh0?=
 =?us-ascii?Q?6y03er2sS1T/BmUeyUhXgbtloe4aZdktuwFtjdIJQThAZ98ObSHFzvqUSiZn?=
 =?us-ascii?Q?zymP9LLVlbJiGHCA7O4+DivzOmze3uXwAs87t++XUcBPTsxw7DTMXcHNkXAa?=
 =?us-ascii?Q?Ive54z/a1niQ7BwYEGzXDwd3Lf2/OrqgSEohu/ccc80UuddPBbw1kyyb9FvB?=
 =?us-ascii?Q?MjXjd0EzZ6sLeM83tpTs1hZ212tvY2QolVVymfBi65YBR2YuY3H4GDfA7Hki?=
 =?us-ascii?Q?JDIE+13ISirw9NqQmy7TiasraKamFKC2lvxy6Q1fPJ7AARCexhnQEbTagAuV?=
 =?us-ascii?Q?veNsSMwqxq/VkLVAKXMu8bJqy7wSVKdx+ivmnHpfN/wAcUhjEnwX90vpDnfN?=
 =?us-ascii?Q?RoUwLVwbBd6ZMmwcjntAdpaIj+EgwrK6WFMFS074JbXQQTknD5BqkbjWKPhI?=
 =?us-ascii?Q?8bY+aVlt2eAprlRw2CSDMl5F4bsspcZo7mAbRRDv9Pq4hB9Dm2b1cWFdyuCk?=
 =?us-ascii?Q?xZyFgNyXn4hd1NON5iZmf2+3RhAdsskt+zkkzT9SXoxNCFwYP1bwqx8U2q4g?=
 =?us-ascii?Q?vD1lLrD6Eh40j4fatuLohF3lbEjxgm+Qa/dDsLqxBr6bbWMowW7R5pLo6+in?=
 =?us-ascii?Q?sIV+mpveDY/R+LMrk2HjTal2j67TDDOw/VExZl0fRA51X95nfK/gWmtbn4BO?=
 =?us-ascii?Q?E1RfF/6xDkS2PinvqVFBfGrlVl2l3uLsIj/TiH+reLz9tsqNUFEaiRqMWcUK?=
 =?us-ascii?Q?4DPfXBbUWW/XaXvCjsCoyoShfuAasPrMJSxmhX+/F8pyckErsjg0RYBVwImK?=
 =?us-ascii?Q?UiXjqzckF+bWw+NhJjUjf6UFNhbn487do26sjGrIvQVoNhyXap+oqWZ2n90C?=
 =?us-ascii?Q?k3LJCsGe6gD2fM3xwagqq72lJtIzpDkSlMuShqFwOqIgz+q62yP1yUwW21y4?=
 =?us-ascii?Q?f7ylx7oAovtKIgCObbrTfvM171qOIQa6oyIVAWaXaSZqruKw28FCaK5g/dck?=
 =?us-ascii?Q?zg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: feee6718-e907-4e86-f715-08dc2736e7e8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 17:13:15.3757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D76eDctE5vMtIwrnqxRG8mBCx7u1cTWrle/AQztj9Ev4itFII9UamdFzrxMCoPy8h8GcqfiPvrXlp/l+lGReCDSgeVeI7TXQarJVkcRzQWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6257
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

On Tue, Feb 06, 2024 at 04:25:16PM +0100, Janusz Krzysztofik wrote:
>On Thursday, 1 February 2024 14:51:26 CET Lucas De Marchi wrote:
>> On Thu, Feb 01, 2024 at 02:15:53PM +0100, Janusz Krzysztofik wrote:
>> >On Thursday, 1 February 2024 01:50:29 CET Lucas De Marchi wrote:
>> >> 	echo -n "" > /sys/module/<modulename>/parameters/<param>
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
>> >> 	/foo
>> >
>> >Still not overwritten?  Isn't that a mistake?
>>
>> in the commit message. Yes. It was supposed to be show the real effect
>> of that, i.e. we do write  "".
>>
>>
>> >
>> >>
>> >> Same thing happens when testing igt_sysfs_set():
>> >>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>> >>        igt_sysfs_set(dirfd, "path", "");
>> >>
>> >> Previously it was not really setting the param.
>> >>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >>  lib/igt_sysfs.c | 12 ++++++++++--
>> >>  1 file changed, 10 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> >> index 567b4f6d5..814220ddb 100644
>> >> --- a/lib/igt_sysfs.c
>> >> +++ b/lib/igt_sysfs.c
>> >> @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void
>> >*data, int len)
>> >>   */
>> >>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>> >>  {
>> >> -	int len = strlen(value);
>> >> +	int len = strlen(value) + 1;
>> >>  	return igt_sysfs_write(dir, attr, value, len) == len;
>> >>  }
>> >>
>
>If you agree on limiting this patch to the above chunk and dropping below
>changes to igt_sysfs_vprintf() which look problematic to me then, with the
>above discussed mistake corrected, you have my

humn?? why would we leave the function below broken?

	const char *foo = get_foo_val();
	const char *bar = get_bar_val();

	igt_sysfs_printf(dirfd, "test_sysfs_file", "%s%s", foo, bar);

why would we leave igt_sysfs_printf broken, forcing the user to check
foo and bar and fallback to igt_sysfs_write() or igt_sysfs_set()? It
seems even a higher level function than igt_sysfs_set() that should
really abstract that.

Lucas De Marchi

>
>Reviewed-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>
>Thanks,
>Janusz
>
>> >> @@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const
>> >char *fmt, va_list ap)
>> >>  		return -errno;
>> >>
>> >>  	va_copy(tmp, ap);
>> >> -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
>> >> +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
>> >
>> >Looks not related.
>>
>> I will add a line in the commit message for this sneaking in.
>>
>> >
>> >>  	va_end(tmp);
>> >> +
>> >> +	/*
>> >> +	 * make sure to always issue a write() syscall, even if writing an
>> >empty string,
>> >> +	 * otherwise values in sysfs like module parameters don't really get
>> >overwritten
>> >> +	 */
>> >> +	if (igt_debug_on(ret = 0))
>> >> +		return igt_writen(fd, "", 1);
>> >
>> >I think users may know that an empty string is going to be written, then may
>> >expect return value of 0, not 1.  Also, what value should we return to the
>> >user if (unlikely) we got 0 from igt_writen()?  write(2) says: "If count is
>> >zero and fd refers to a file other than a regular file, the results are not
>> >specified."
>>
>> we are passing 1 so we don't fall in the case of passing 0 that write(2)
>> refers to. If the return value is 0, then we return whatever write()
>> returned and the user deals with it like it had done before.
>>
>> >
>> >While resolving two instances of one and the same issue, you use two different
>> >approaches:
>> >1) always increase the number of characters to be written by 1 when writing
>> >   strings, so at least the terminating null byte is always written,
>> >2) divert to a separate call to igt_writen() that writes just the terminating
>> >   null byte when the string to be written is empty.
>>
>> if you look with a different angle, both are actually passing len + 1.
>> One goes directly to igt_written() vs igt_sysfs_write() because of the
>> arguments it has at hand and is consistent with the layer the specific
>> function is operating on.
>>
>> 	if (igt_debug_on(ret == 0))
>> 		return igt_writen(fd, stack, ret + 1);
>>
>> to be similar would equally work, but slightly harder to understand
>> what's going on.
>>
>> Lucas De Marchi
>>
>> >While both methods can work correctly, I think it would be more clear if you
>> >selected one of them and stuck to it, or provide a justification if not.
>>
>>
>> >
>> >Thanks,
>> >Janusz
>> >
>> >
>> >> +
>> >>  	if (igt_debug_on(ret < 0))
>> >>  		return -EINVAL;
>> >>
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
