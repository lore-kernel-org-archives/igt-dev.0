Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04271C4828C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C3610EC35;
	Thu,  1 Feb 2024 13:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkZzNSXI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC3A10EC35
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706795979; x=1738331979;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=+/MZ+ztLXQ8paJevECEs4xQRQr7wsQJCMuTazEl4DDY=;
 b=RkZzNSXIT92z8GCj4FFCCLLyVCwnZt4Zdch+8F+RjKmg0pBDN2z3FJe+
 1FtGFpxMcotDP/BN+uSB5j0WZbUEA36Xh52DWXwntUVDeD5urUcrMKpdi
 0rV4jbf6Sjjr3Kg7nxfi90a0HVo2UvSgtrMD1XPMcSCetImyYcdPVZeef
 ADTJwUjn9GtWSFnlMgsTQ5snU7tylair++9aswPzlCL0cBrYZa0ai8V8p
 oDeeoOgkAzUWmNIylF7U0aROzKl3ca8YdvQFB/YE8f7ycGDWactnAdkTj
 PGDeNjlfYTMc7IE+igxycIMVMgsBjVnFffAaMAkdPKUupN9huikE4Jrsm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2833855"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="2833855"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:59:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="879110894"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="879110894"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 05:59:37 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 05:59:37 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 05:59:37 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 05:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VhpPQVauZEL5mkcoghvsFce95rwNOjViGFFbncsXSqKAjrHxo+HRJKy7dBPPLiFjguM6bMAjJp5kIpapix5DEZ3BBcEuzQrt6Ue2KDZ9IqQlumvzgnMZrlGdp+UyP3pJDIe+gD6SNwZaYSBPfRrIWQJeq4BGAzlTKYK6xXCBuo+EjrE8e2XiTZefk+SdaEsL7OLsAuFA2jhHOZQQApFWrDpPTZYXWagTyp5TBqI1AfyAc8nwQAl0blN5mN2btu9P71BLOGb091Ajjxz3qPc2VLpkUbi5hJRvsKOwxi8Qya8bqRtZYyOS8uDHW/UfwOfSwQeyKKB7l/clqLT4i21lFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lTRgYdmx2PJu7qzLpB9Ubsxk76skYh8+Rt75nrSDubo=;
 b=ZxCT9tq3kIFKxhUT6q0+lc1rbVtK+GUroldj4oT8PV98EaZA2bQYLrgk0eSP0pfgvE69+vbfoZxE/+WpBAjtPmvYEx9n9v6lZ8E4FoKJS6vEIt6Uh2xGLBUhCfI5p+l0genGJOPbApYf2qnFvIvcZe1XImai2kOxqIsiFDwFh5kqfSYKjrtugidRi5eJUDUlL4eXtraL/rETBy3Etjx2xFGFxjeybmlqi2ahXRT2QAo4f0k5LhBuZL968sCbDWUMnhMqoe7NOzcjAX/WQPyqsThMYRReWZNBnHX9+wv11cIlFtbxAsQknxXG1EinGTEezMabdLJlIjM/xXhuID3XeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.23; Thu, 1 Feb
 2024 13:59:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 13:59:34 +0000
Date: Thu, 1 Feb 2024 07:59:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: Re: [PATCH i-g-t v2] lib/igt_sysfs: make sure to write empty
 strings
Message-ID: <l4pirkkutxred4zsodvfscd6qhd7b7jc47yjoqszqsulu6sj7q@l765os7sur55>
References: <20240201005115.352192-3-lucas.demarchi@intel.com>
 <20240201031156.352973-1-lucas.demarchi@intel.com>
 <20240201131204.7dlfp2ny46stzc2y@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240201131204.7dlfp2ny46stzc2y@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 66862f50-6fca-48d7-57f7-08dc232e055d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JETtUMituXaU4j81cfwgxMYqY41DiG2j0YCtEWh2M0BisTa2PgMvduBFR0k4PkcS92YIn1Lk19/5M6iViu5bj+SohZN7zq4DBVZfLJV354mtbeoL3ZljmSQFfthAUgVlTrAKcDsW+D4ZkV1waq7Aonf2nrY8CxXZqUXKqh2XeuqbCRMsqRzTEfutBLluNNuduKMGlwkQgCEx1taNRJy8qYXsvRLxfhyEBHHhHReXPzU5Rdv0i0h3VO2z2Q/33oQr5/yMpIXjJvnbbyfBh2sBBrn512vLNhIMrXep9sFQgDtslffLlKyhch5yqJGu2YpCyoKBUBL+EDcEWRsT4l++yd70MdIwluzNvpnITu+JgeBSQ/nTnLyXbJRxrnwobKfS2LIsgT6XDXx0sPlykhfoI96+xgaOv59KBZJ/rUX4hOu94vfM8SfHwS3znihqU3rotfmEMDQMeV/yWC4kh1b1mL6BebbAWbDKRzI/oMjAJ26/O7NcKvqADmVDmGJkvReh3+ZMj9SyKNzXzsTkPnuJbSAGiQWWmhvSMALliD8FyBy+Nlo1Yqxt1lln4KaBwSSO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(316002)(66946007)(66476007)(66556008)(82960400001)(2906002)(9686003)(6512007)(8676002)(8936002)(5660300002)(86362001)(38100700002)(110136005)(83380400001)(26005)(6666004)(41300700001)(33716001)(6486002)(6506007)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7qGEOds/SMoUGZYadnF4Pfa1n4fXExKd3SPnz2/gBket56iRImCySMZ0IaUs?=
 =?us-ascii?Q?BHalfHacFMb64gEl9mRjptwT4C+3UE+TiLsD4FvWUUTGiJ1ySiy/ZlGKlRM2?=
 =?us-ascii?Q?QVH+oEXVPpYhYhl1gECaFqKkejDFZO+7t//GOK3TVtEoCc9ew7KGep0HsrQn?=
 =?us-ascii?Q?tpoQ1HKzoQA2IYFGNvKokgMtNY46GFfRbEDZ507KkHYPphy5PV9xbItOTgt4?=
 =?us-ascii?Q?89+gFlVdKMQBc6ojpX/1rFfDfeHK2D3HJrzVJrCfhWSHR5u8lfMQSRZI07IY?=
 =?us-ascii?Q?Prd3/pR0n54Gf8j+RilARy0yg355kTdfIp3hHh/hQuJ6BkGMcNn1a2QQRAFg?=
 =?us-ascii?Q?QIxmKsHnHuzvxtFLR1wRIcM79YekgBGEbHL5FAExQ8i4jbzfk9Rf8+viTKyS?=
 =?us-ascii?Q?sK1qv5vCeP159AopMML1ozjxNEBY2g6OjTKF6GlLvK3tgIqdXBsWiC+Bl2K1?=
 =?us-ascii?Q?SFBcRnUBh7Be7qA6rtmeXdyPwLnWq7GHHSlhI7BLRw9syhcB72HmB3RE0wV3?=
 =?us-ascii?Q?rUFo8+iRaslFqU4ID1mS/JzHzuDO7bz8peLCptucvnV/P87cUPp1NWHK3ca+?=
 =?us-ascii?Q?rGaLvI0Zf9HTNdLV3Lxn7vt27zN63eXp8cEzsg0OL0Sf37JjecJ6VAlG5VbT?=
 =?us-ascii?Q?sG6hTh0UN99cKUeWAhylWzi2lZO+mjHoNC5vClxRK4RVpsaPejJANVR7869s?=
 =?us-ascii?Q?fk+xMUB4GolDEDJvlmqs9YCXcoQHORN7b238tZ3k7PHDB8NApn/2z885PrLa?=
 =?us-ascii?Q?Yt7U4x9h95lgfWtv+OtUc6UPItKi4g+3LqUutIPuI6406e8dVNUT5tjJjPQh?=
 =?us-ascii?Q?L6EcftlwEYmaWGju2hS5XxKYwgRWd3MKCfnHsU5wiCgUd/ol36FH/52pdcIh?=
 =?us-ascii?Q?ds4AONu+fWq7wOlcO1hecmBtrCAWhPTFs5K81lgMJ4d58cAJw6SKMy5rxdY/?=
 =?us-ascii?Q?2WRE5T60TKmt0BKUbyY3E35LlIjTF15tIdvVS9NgLx1ES32h4weu4yTizn6T?=
 =?us-ascii?Q?eHcimqD9yacFInONGOvu2anl3hYMLBzWPf7lwGsWz0bqWMx2wUJy7ZbDbGrT?=
 =?us-ascii?Q?4eP2MYq1E8pU0SqC1vBGqiFJZ10LPcujAJ9BqQzH4//HJcGTdryYjyovbMVT?=
 =?us-ascii?Q?N9q6Ujzyz/S5Yn1UKApBiOWXTmZWUXBA5CRjtLMt1dl0Lcnm2r1w09d0qvrp?=
 =?us-ascii?Q?9ten1vUniuHuxjATUG465hh7R0TjmVO8SOzKG+9wAvWdaLEL2aVsz2Hks5pD?=
 =?us-ascii?Q?XAvjkplXVYtd7rbTumol08loG29B6iGkNCxm22RCRDjQTFKy6ZNDiW8ln5NA?=
 =?us-ascii?Q?RZLYIGBmoFrgomTxu7Wc4pl6adrGVYKVwAeh2PPIZ58Vxah4iSxzgEaPJQ19?=
 =?us-ascii?Q?w3G5n/IZbAAP7bS2LVUOX1HGbGNSfNhzzqMBArwemyncwI1QTnEB7btL/W2F?=
 =?us-ascii?Q?BN/T30Fusga8hZFO0u3c9RZIUiU1snoEy2gIfh+cKoCmmwHP4a0eS0hakUJL?=
 =?us-ascii?Q?1AQpnzexliM3wNulkj0+Doq97BdZKzPnebr3xO/MiWoWOXytmZQ/kHaF/seh?=
 =?us-ascii?Q?y/hNCrXPEAOle2PHXRtcF4I8AzrjVvAK4kk1HcmRNsIH7DXVVTfVHPv3PWMk?=
 =?us-ascii?Q?WQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66862f50-6fca-48d7-57f7-08dc232e055d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 13:59:34.7490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgAV69s9qUr64umhTsC+Qvjlcf6rrGZ1i6b7vb9iHPhXA9gx5R72KDiZS3cnsb4xdkTtzaCtmlcSLq5rkqpPAvRHyVzlaZQ3J6G5pOULDzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
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

On Thu, Feb 01, 2024 at 02:12:04PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-01-31 at 19:11:56 -0800, Lucas De Marchi wrote:
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
>> 	/foo
>>
>> Same thing happens when testing igt_sysfs_set():
>>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>>        igt_sysfs_set(dirfd, "path", "");
>>
>> Previously it was not really setting the param.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_sysfs.c | 12 ++++++++++--
>>  1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 567b4f6d5..64c2aaabb 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -406,7 +406,7 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>>   */
>>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>>  {
>> -	int len = strlen(value);
>> +	int len = strlen(value) + 1;
>>  	return igt_sysfs_write(dir, attr, value, len) == len;
>
>Why not adding write "\n" at end?

because it's not what we want. On the kernel side it will have different
effect depending what sysfs file you are writing to. "foo\n" != "foo"
and sysfs won't strip '\n' (while it always guarantee a \0 at the end).

Try this and see the extra newline at the end as part of the value:

	# echo -ne "/foo\n" > /sys/module/firmware_class/parameters/path
	# hexdump /sys/module/firmware_class/parameters/path
	0000000 662f 6f6f 0a0a                         
	0000006
	# echo -ne "/foo" > /sys/module/firmware_class/parameters/path
	# hexdump /sys/module/firmware_class/parameters/path
	0000000 662f 6f6f 000a                         
	0000005
	# echo -ne "\n" > /sys/module/firmware_class/parameters/path
	# hexdump /sys/module/firmware_class/parameters/path
	0000000 0a0a                                   
	0000002
	# echo -ne "\0" > /sys/module/firmware_class/parameters/path
	# hexdump /sys/module/firmware_class/parameters/path
	0000000 000a                                   
	0000001



>
>>  }
>>
>> @@ -513,8 +513,16 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  		return -errno;
>>
>>  	va_copy(tmp, ap);
>> -	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
>> +	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
>------------------- ^^^^^
>Nice catch and looks like a separate bug fix, please send
>as separate patch.

it's not really a bug as at this point in the code they point to the
same thing. However it is a bug waiting to appear.

Lucas De Marchi

>
>Regards,
>Kamil
>
>>  	va_end(tmp);
>> +
>> +	/*
>> +	 * make sure to always issue a write() syscall, even if writing an empty string,
>> +	 * otherwise values in sysfs like module parameters don't really get overwritten
>> +	 */
>> +	if (igt_debug_on(ret == 0))
>> +		return igt_writen(fd, "", 1);
>> +
>>  	if (igt_debug_on(ret < 0))
>>  		return -EINVAL;
>>
>> --
>> 2.43.0
>>
