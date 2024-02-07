Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCA1C4829C
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 16:46:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C441D10F0E8;
	Wed,  7 Feb 2024 16:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KShtybbj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF29110F0BD
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707324396; x=1738860396;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=x7no0xrIVYIpUCC0cj2694EBryRg3FHIQIBD/auzw4c=;
 b=KShtybbjPUwG9jeM9Gavtx8ki8FltLFkWH+gbqKNd4qBujJmPGTUUgKf
 /tck/ookBQbV8STQR7FT3gKenhJJTOtjqAKqOCkCHVZ5jmWJYveJA/Iji
 VeBJ5Zx9bFHoU+6XMuGNac2Ld9FQArwV+MVMJ8nQDOHbuOCpa5yi0rkad
 LFi7KdsAUo4Ae5k31cPnvOn1XAXr3jVbOIbdHD5D5HoufiVQUwa0aMHTW
 06lg1KnH4xpI73KBOIXYKKuGt0kGGXbmTbxhZhU5NJlbuWZeBqm1inF58
 tbtCQLlG9706th9FsRj56S72GucYQkQDMLZtAhmjk4ay5w1sNSnXnvQfX g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18544254"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; d="scan'208";a="18544254"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 08:46:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1403634"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 08:46:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 08:46:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 08:46:30 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 08:46:30 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 08:46:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gOoxUBj7UWsJu9If29zHUYi0i8o8DXUJ+r1ma/D/T/Kg5d1ab5XX7ci9sL4jpsypCSCWXY44/RwZZzF8OJJjndDjpwZHXTZyCP/uFfJ5OVHGhdRv1m74OSdprYImhRSZWdOf1uxAn5/6zlGVhwKoAmbs2Ojh4gKC8slixCx+qhfDuKP2OkKsOG+FfdDYH9+4TKMrorVi7Nee194l/D0ap5rhZQez78/LQhQn6J28ZkjHwcWNAk15a6fRKdBrU78ansWsPa8GMIMyV17uzq/2g/tv1ujLvZBEbo6nlUcFg4fUl8J701rEuHrLGfN8rbETUK2L3U40GNnZ+Wet1uGOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6bp2i2UrJDTqU2g5PQUzyxy/UaNoOlm3eu4rTl5OC8=;
 b=GrJIPmZv9LsrI+ZR5u2p95O0avGXCiB/qE5q6Uq1K9MPCWExG5U4bQtkO7yEZVVu5+aKFivNFNehWwqB4xqkhPxpMinSjwAB5yc2LwoiitoqA4FmptlReGp+LTdi0RG0U/6cZcLeZTgZS+BJwvtPlOFKLsgw57KfXugrdZh7qOfbFjiKWVrHhorMfOOos2uaFy8KcfHYUzf9d1VgnW3nLPt6kxglP/jEnsT9wbeKueBz5yjVIBfc7MbEARtFWn7y0TqF48B7eNaBt8nC6U4Wglqwy+4HUmVPh64dDXuaP03T6+pOUJDRPi+PKUkDEE4ZSrKsrjxNdzADB8W9LiWg7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB8352.namprd11.prod.outlook.com (2603:10b6:806:377::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 16:46:27 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 16:46:27 +0000
Date: Wed, 7 Feb 2024 10:46:25 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t v2] lib/igt_sysfs: make sure to write empty
 strings
Message-ID: <tgahbddpda77yk4kzxdnzvek3m2ktkz7pehq67x5rfkuik7f5r@jf4cicjpc6xz>
References: <20240201005115.352192-3-lucas.demarchi@intel.com>
 <20240201031156.352973-1-lucas.demarchi@intel.com>
 <20240201131204.7dlfp2ny46stzc2y@kamilkon-desk.igk.intel.com>
 <20240207161830.rzmcaujo2rcjb5jz@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240207161830.rzmcaujo2rcjb5jz@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: BY3PR05CA0060.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: a6283e86-472d-4e81-ac77-08dc27fc53ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xhRmPpvGLneK/0Gmzht+dpQLVZeIa7k/4O/TF1WEfddlJP5Z9sDmEBsb/8Osw2VdWlOxLuMHA/yBOrfTPYdJw1a5xgcw6iLIJP3/Xt7/MOEAzcEIO3RFTH+RcjfF8APeJihGH2NXFqM2AT8Mi4A7dlvPQyWVdjN3aH9ushj9c3/bKfCLIRD1wnSEOvjqIR3TkWIheGuLnziD7idzSUTrY3yLtlA5bidi82zDWfYyZtknkPpdq8qdIQ6SWdfEe3TlIN2OhxFmq50BNFc2EI5jvJJ8s9WCWltHHYZOXOmEZhv0yvSe4ujdeUp8mJp8M0/92DQOmKG336Ji53WzY/dNkEMWNGEYBbz++iwUPifCKvHEQWTz5ovQrGpH9AAOv+DRKDqlxI/LNe5l9pUG7e/nOh+Je2gZYchXvbHs7I3I5F1kzrZJJmChmp/OlziwB99qzHCFpsCLqPTg0Cv7gozp/hIlg+x6CN+vxwh/mCvZznCAqTvkhwOauLTphS9s9cLF3wiIfssEla3dROo/97CgyJN+bAk6+gEewPRaJ3xx00EblhhT9CRMUkI3xz+K0ZlG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(2906002)(83380400001)(82960400001)(38100700002)(41300700001)(33716001)(316002)(26005)(110136005)(66946007)(66476007)(66556008)(86362001)(8676002)(8936002)(53546011)(9686003)(6506007)(6512007)(5660300002)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wFQHaZNBF9rDDv1Fk8h9pDDkIbkOYVhlxaGrmnAgi/LSTdkjb+4h9j+AqZQx?=
 =?us-ascii?Q?mYVYmONdbzYgf1HNWDbiu7l9c9CpqHANIZkisKvt+rPnLT4qQQwKTx9EIw00?=
 =?us-ascii?Q?QDoGZc36kZ+g0gMIZTJoUxWm+bzMYPf8Yy020FNEtHNhfTYo4tW+6BGf3owv?=
 =?us-ascii?Q?ufOtOnVqhA3+1lbwaZ598yJR6rVTqFW75cdkX+DorwAicpC4MS9rwMAyjWKT?=
 =?us-ascii?Q?0qebD41NDgt1AwzM4X0k2j6Q/6JIme1h9wjvdbwMQlH13GjYqjo74JrdXpKp?=
 =?us-ascii?Q?O1eWWsZDMDWvO6VxpckYQvwd8LEPhvA2dVTKvZ5WTlsmDSE7t055aGmA0Iq5?=
 =?us-ascii?Q?PYphwHjVsbBzLMkmzlwml4q0C1fobb8nzIMZsQw9Qm2ZsF27VGl710Qbf18a?=
 =?us-ascii?Q?SfkBoy0gwhpM40IgZ7UtCKip5CL6Gc0JjqTE/5Yoz9uOy/qwA201Ahf8Ae2m?=
 =?us-ascii?Q?jMw+0F3REsuofXv1d6Pa2ThejrsuhqEAbUmGsQwjnjAl8aOKHZ5uh8E/j0X+?=
 =?us-ascii?Q?7sPwb8cZSZqUaY7j6s4TYcoUHQglz8uAOeoIEeUtzkC54GPidMQjeqc4YjTL?=
 =?us-ascii?Q?fzxHliGk+R+vdArau9CPGUZwvt5TRiy76N/3U2xyDvJBPoItwfiwP/pb2Z8s?=
 =?us-ascii?Q?4lKChpDfBZfPjlQtwx5VGgC1yKqAX1K4kpTq97NCwkMI6gDwkU9wRZ1FtyrX?=
 =?us-ascii?Q?/bGKQuEc8AgeIujwOX8Zzx6ENNkOuhJ2doirxSggygHEXvC+CLibaDtS2YEP?=
 =?us-ascii?Q?AUxjsHM5pLQVCoaIPereXsrhd5afPidpNvxVB7ySxznA1kTvDjlv9euedbzn?=
 =?us-ascii?Q?fMmifdydlSAZLwZA/QuU/hqLSaV8LYWGz76TI/FQFN+1sT4wr0Y3Qg2vrdk8?=
 =?us-ascii?Q?Du+iCEqsRelC0XbEO97G7HrftJM8u0Fap3ChaRDtrhlN9b7hPztzYoCCLg+8?=
 =?us-ascii?Q?4hBeDxm7iKKBlRGg2ffcldc8jCzfX6lqqHGjUVDvhSjZ+uPxa7NRTzi5AUvr?=
 =?us-ascii?Q?d1FrZXjhCg4qDYEorbXGULsS7pJbM7+uKqDXsS75H0VQ6APY41UqTj4gjE4I?=
 =?us-ascii?Q?UEwwad9Jj7nOcx7ICJt/lvtvSDAHegyGYTKPDBsAvewPm9gRIs9D5HNCbk01?=
 =?us-ascii?Q?xiDXq+T3UGOEYyKka0I5sUM9Ju76qCJxVTsTCS+CCchzcimOY9opYqoEydwL?=
 =?us-ascii?Q?voTODNSvfebcLEbzLxTGgwxldfX8gFXD+Zxy2hqicHukCJUzEhbNdf8ekopQ?=
 =?us-ascii?Q?OcUbrws5klNOXlQ3iDsZb6b/cJcof60HqFc4f+E+lJbpvFeVuRWQ9Dy81QQR?=
 =?us-ascii?Q?lIqq8RDRE1rK3Vk8KnUB5dp9wOlFC+y5ti3IKx5iq86px2yaSnckG+Ik+XmM?=
 =?us-ascii?Q?ZkE1LfvSbvYps9b46m0ioss/d5MKrI4HagL/yL9w/JHMmT5A1/lT3X9zx5cG?=
 =?us-ascii?Q?ZHg5i/Hx0OtCueRMf2EZGfsU+Us+0mo9ookrjXvT6+YQhiIgQO2fPFYBPoUq?=
 =?us-ascii?Q?uKkZ6xx9h7rK9zja1MFKLHQgqwWj7Sex9Ams+dZRN4TS/+dqEoF2NeZ+RJWC?=
 =?us-ascii?Q?/eenMVX4E/hsSgRUSTc5nF0e8OqLOVtnGsr9/Og6EXC1SpuHKlW2kFXl0SAE?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6283e86-472d-4e81-ac77-08dc27fc53ea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 16:46:27.4190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /HB3Za/tnJL3KM2qbJK2RXFc+52mpAXsCzm/8VLvKHW0HqX2VEKx3gpa/QLl0VEpOZZV8KZBmrIHG/MnPkQtiw3piMsg17eVYgFUUKXTyoo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8352
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

On Wed, Feb 07, 2024 at 05:18:30PM +0100, Kamil Konieczny wrote:
>Hi,
>
>On 2024-02-01 at 14:12:08 +0100, Kamil Konieczny wrote:
>> Hi Lucas,
>> On 2024-01-31 at 19:11:56 -0800, Lucas De Marchi wrote:
>> > 	echo -n "" > /sys/module/<modulename>/parameters/<param>
>> >
>> > doesn't really work as it will just create a open() + close() expecting
>> > the file to be truncated. The same issue happens with igt as it will
>> > stop writing when there are 0 chars to write. Special case the empty
>> > string so it always write a '\0' and make sure igt_sysfs_set() accounts
>> > for the extra null char.
>> >
>> > Shell example:
>> > 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
>> > 	# cat /sys/module/firmware_class/parameters/path
>> > 	/foo
>> > 	# echo -n "" > /sys/module/firmware_class/parameters/path
>> > 	/foo
>> > 	# # make sure to actually write a \0:
>> > 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
>> > 	# cat /sys/module/firmware_class/parameters/path
>> > 	/foo
>> >
>> > Same thing happens when testing igt_sysfs_set():
>> >        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>> >        igt_sysfs_set(dirfd, "path", "");
>> >
>> > Previously it was not really setting the param.
>> >
>> > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > ---
>> >  lib/igt_sysfs.c | 12 ++++++++++--
>> >  1 file changed, 10 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> > index 567b4f6d5..64c2aaabb 100644
>> > --- a/lib/igt_sysfs.c
>> > +++ b/lib/igt_sysfs.c
>> > @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>> >   */
>> >  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>> >  {
>> > -	int len = strlen(value);
>> > +	int len = strlen(value) + 1;
>> >  	return igt_sysfs_write(dir, attr, value, len) == len;
>>
>> Why not adding write "\n" at end?
>
>So what about changing this only for zero?
>
>if (!len)
>        ++len;

ok

Lucas De Marchi
