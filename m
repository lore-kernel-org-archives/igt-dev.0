Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242CAC4725D
	for <igt-dev@archiver.kernel.org>; Sat, 20 Jan 2024 01:28:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EBC10E1E6;
	Sat, 20 Jan 2024 01:28:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF2810E1E6
 for <igt-dev@lists.freedesktop.org>; Sat, 20 Jan 2024 01:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705714085; x=1737250085;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l1iFWsgSL2tmothnnyDcc0JKBF8bjsWfeFHlOyzzcKo=;
 b=Vd/eyeoxZHwNn1xoymVAsAsY6r8AMHolemAI2clOtHAKDM4GVQKSlLl3
 qER2yEXfHjOaWCOlDBjptbDnx4NmkZy6js4J/uGeNwXFJzcLVeMsDNvN4
 Yui5Sa9lche4NxzSlkiSQGeZP8PGF+xrVdWDoFWrWNG3EPWayXYF0crfs
 gEL/H1jSzB0BfdQ3AuLTy3qgyjBLDaw7qv8DMdewYpmLT86xKGUFRX683
 9LFUkgo4op+LIoPC9NZrqEr1cuzafUnozHHxEblbC0IUyM3k6fgYkMaAr
 k+BYlCjcVtJk0zE7o7crZvD4KtvTsGV9sEi7xHLq2tS3heL2cpca9nyYl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7588530"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="7588530"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 17:27:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="808098"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 17:27:28 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 17:27:27 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 17:27:27 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 17:26:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2G5Xle/FD4irVqle0+cvbv28slZ5+PUEn7l7yPFZFe4938TQEt9JVp1bSJcBGJd3idhiTGjhtI/+hNOmJgxdQiYRWH3x6Py7ruOCKOPf0Qzg0Bz1J6dPjxuQyuR3K5omPJdVQxxfwcAb1Cfjbnvh70C6Ofql6vrtrE3bXcjBnUaA6EBSiP6K51Xc2HjfGSI7ReSn3VscatwWOfebTPJk7cTIq7OwGUx0I2eeIdlR7/cLUbv1qvLeTDIxodPcmKv7czj/LBmN2IwWMB36jZDYEQBap5VeyEiYLkEtNpnT7tm6Ky9usXgtOAphFK5PMCLT+D9y1DkTqnlTsHjaiwtsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et5DMK4iOHk/wC0K9m5JtqiplXk33THGeHl8VPmU3Bs=;
 b=ZH65VPm9xn9R8RNC2KTZtrFHVJvL/gLlQoZR4EEy1V3vllgih5u2e7Tg88lajyUheBIMf9OfvGlquoEMPklC+rOmcK6+Y5P6ropDti3e9ZEPHzrLnRHy1GAxRDcqz+Xv649Hu5iymoWP66YmRMtB4EdwDPyUBUtEKmrnJuFjIR+jI+2VWn4QguMxQ0apZ89YF9uejFtdCVth/L00WU73BbBgQG9KezLw7SLf09MgLcO5rmFKXBSCO9vrb/IVOAAMYqdDxou1O++iTxY4u9627lPIpPrsyNN3/zIcS9uNH5hDp/k2knER1W/qzm2K4ALDdhWdqGgEfSa3wu7/s3sXuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SN7PR11MB6602.namprd11.prod.outlook.com (2603:10b6:806:272::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Sat, 20 Jan
 2024 01:26:55 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3%4]) with mapi id 15.20.7181.019; Sat, 20 Jan 2024
 01:26:55 +0000
Message-ID: <e89a67b6-d35c-4e17-b272-9d8f9cbefd8d@intel.com>
Date: Fri, 19 Jan 2024 17:26:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_gt_freq: Skip GuC PC tests if
 GuC PC not supported
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240119170448.1889777-1-badal.nilawar@intel.com>
 <20240119170448.1889777-3-badal.nilawar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240119170448.1889777-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0073.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::14) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SN7PR11MB6602:EE_
X-MS-Office365-Filtering-Correlation-Id: 90711baa-be2a-48c6-647e-08dc1956e38e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7qWfUermeL9deXhSEPONMHPklmS2SCSbfaI+sBz9gX4qFzqrsLK7sndeA40xex167m8haxN8d2naLsftq4OPrY+6HBy5/WScT7VqXvA44a5BYmQZS1CKqYUZe+EanS3Woyy4nkGGMt2aMF1Gp+MTlNns1AtnO+z5Sz+pDVrPZeYoNQ5tveMkvbLm1ACKSfD3JWk2jrP5oQZGL9WXB4zu51mmUKh0Aub5glFZFMblVvn2IB4clhAsgl05UsvEH0EfoeqIDliKNhxpwUf/wh3dj3NWw86cgxsw5VW3xmM+WAoCyRuqxjmLcWWCmPDiRUOd7YdSwy22uN4+I1e8qgq3hLpVp7YT8O9DpzZM38eKBe0sqFW1HacCxq17/87+LFP9RgVavNs9hh49P4Lx58BRiWHFh68ckeCaG5ekoo84iFB+j3fcPczd55cY2we4b6LP3hinYfPqfSi0c2kuAg74d98WesQRzsXhKIahm/GuJLRTXjD1uMROptY27V9TIicIyOsTEFJVnSyZ8MHD1eQDvS6Bu/EyL//3Ix9M6pFQkcbaHWGPYt0mR8t/usw/cKG5jghV97SkACgF3TSh5PBK+A/3HEkB39gSS61dXOAf+wGwHhEM1GfmFqArOgQtsBvW6/7q4shBxin8Ak7wRPI5tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(26005)(36756003)(31686004)(38100700002)(83380400001)(6512007)(41300700001)(107886003)(53546011)(6506007)(2616005)(82960400001)(478600001)(6486002)(2906002)(31696002)(5660300002)(86362001)(316002)(66556008)(66476007)(66946007)(8676002)(8936002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTRkYTJQTlBocVQ1UXRZQ01lZytZaFpIdUdqaTVBOTBKelpNNXhyNkR3VmtT?=
 =?utf-8?B?V0tEYmlvMWR0Y2Z1NEFkRG1uays2SjlvdDBlblFmNzdRNXN6N0lIUWNuTFBT?=
 =?utf-8?B?L0g4WGRjOE1iQXNBK0FTZk1TdDN4dFRnNWNmRkd1M2x5ckthWVhmK2pjT1lY?=
 =?utf-8?B?TlU3MFpuL0ppMktHNG1lT2JoNU1DOGgxb2c3M1k3NGNBcE9zRDYveHFjRTlp?=
 =?utf-8?B?MkhTcUovMUZXLyt1QU9YSWZ0UWlKbTBuSEx2QmFQa0dGZ1lCOUpOZGQ3MVAx?=
 =?utf-8?B?TG1VT0xhamdGRGRvdFQwVXUyb1lKVllHTUx0TThOUnhlRlpRbWdKc1daVlh5?=
 =?utf-8?B?engyd25zbFQ4T28rdU5Ebm5uOUFleXBwVnpQQk96SENVQWNma0daWkd4bkpm?=
 =?utf-8?B?dE9zTG9UVENMbEZjY29xUlhleW9NWkJlZkhQOWVNVlpKME11YURIQVVYMDRP?=
 =?utf-8?B?cXlKdURTaXY4OU1EOVFlQk5meVQ1ZThkb0FnTGUxMm40ekNoSmdMdXl5aGVZ?=
 =?utf-8?B?VXhHbVRJanpqQlVuWEgyUmRxZlZ6S2RBUXE5MHBSdnJndTA2TzhqOTFUVTBX?=
 =?utf-8?B?Y1MrSEdEQm05TUxkZ3NDZzhCUFAyMmhkeHJabkhKY3grclArZ1FJc2hSY0dw?=
 =?utf-8?B?cGl5ZTMrYkZGQU56US91bkFMaXV1aW4vRitRL2d5MEdURzFLTjRQZGowUjlL?=
 =?utf-8?B?MERjcGorcGRLRXlOYVNWcWpuR1RuelE2UEcrUjY2SWMzSnFEbzk3Mk82RmFk?=
 =?utf-8?B?L01nU0pnZzVJbUZZZ1UvWTRTUGJxOVJ0WEVWdWkxTWVtQ1FRb2pJZktXYVZP?=
 =?utf-8?B?NWhYa0MzTTdsV2VhYzN0STN6WEh5ajZNTFdidWFRN1ZBZ0JxRkJEeUJmbmo5?=
 =?utf-8?B?T01PdlFGMGQzVU5wRWFiUWU3TEo2VUxPSGNtWldESzNVVkhycVRYSnFJR3hw?=
 =?utf-8?B?azFlOTFDTHVSSGh5U1FHTnRweTYrM3p6ZzRhQzNlUDQ3SEVqNkU3c2lWdjFE?=
 =?utf-8?B?M0Z2NFhwUUxCRm9ZTnBKL0ZlNU9SUjRSS3hsV2hnRmIxSm15QWtGbk5nbDdw?=
 =?utf-8?B?eE9DWWlUV0M1WXQwVHdSWkpLYVdXazZURUN3K1A5dGMvMzZKY3VkTmVEbjJZ?=
 =?utf-8?B?UEtaZ3dWYmdkbkkydlh4enRZMUhFc3VoWW9QVHVkbU1VWEJsVDMzbTI0dDZI?=
 =?utf-8?B?bkNMaUNXRThBRzBJRDJINHFXMllVMEFkL240d1c4Qks2bFo2NmdtYVJyS3pl?=
 =?utf-8?B?b1loNWpSM3ZkMTQ2Yk9Zb1kzTGdMNzcwN0p3YXVNMkU1cU52MzMvOHlSRllt?=
 =?utf-8?B?eDFSZ1EyMVYraUVpSjRhZDNSVGIxd1dFcWdNV2Q0WXRxSXVIQS9OSUhVTjNK?=
 =?utf-8?B?RmVuUm9iV1hZb25jcDBpS25jbmZNbEk2Ny8xM2o4Y3JOdGY5dUs0ZHVjeStF?=
 =?utf-8?B?MUE3bmVTMTkweG1PTkpndDRzcGNNZDczbzRNdWtUZVc3T0pOb0J1bmI4NHc3?=
 =?utf-8?B?eVQyVThpa01tSFFqVUJTcGlITW9TVEdMbEZJalFmUG1qdmxxbUkwVXVoVjAv?=
 =?utf-8?B?QnMvcGRobW43cENHS2x3YnYxN1N4UjdxcDJiNXVWT3hBdXhOMUw4Mlg5VmVP?=
 =?utf-8?B?Z3V3dWE0ZzB2Z3JBTzVDR2NIZkZSQ0lwT0s4V0Q4aUppbUkwYlRvelhHVzQ4?=
 =?utf-8?B?bXZXOVl2MTQ1MnJQVlB1M1F0MU9jL2Q4MHp5L0hSY1NRSUxwSU56b01WRkRI?=
 =?utf-8?B?eUk4T0lWajRSU2lHWGJ1WUo1VVVITmt0QnRRL29XUzJFRDVZTkNid1hBQnJt?=
 =?utf-8?B?QjU1UHZDNmpmZVhDa24yWm1oQlRNaWdxUGk1eXIwL3ZTMUFMQ3B3UDZ3Uk83?=
 =?utf-8?B?RVZ1Y2l5V29uQzNOWXBaMVVwZUtBSjhLRzZPbFFLZzVpZGgyaHhNWHN4Q1Ba?=
 =?utf-8?B?dVc0Q21NT0lTTkhTZkFmVit5VzBYaDR3dWcrZU1aYzBsYSs3aDlSbkR5ZzYy?=
 =?utf-8?B?WENyU3gvaDJVWmNRSkl2T2t6M2FvZFl1TUxvWEJTREFaKyttVzY1NkxlUW5I?=
 =?utf-8?B?S0xHYjY3Y3I0djIzYmltdWl1enJKaDB6T1ZHSGV0ZUVDYlVSeWJ1T1dxUDQv?=
 =?utf-8?B?QlNQVTVIekdSd1lQRE9VY3lpc3BNZVJYUHlEUzEraDlkWFJzbGZQSlJQTWZi?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 90711baa-be2a-48c6-647e-08dc1956e38e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 01:26:55.6652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGnjVZXhh9RloKlo2y80gg3Lwk5Qdlxky0a4aGhITsnGelLYW4N8JEugfduef70rt59I+TTONOVcUEHPDXZebOEnIqPQ43iCw0EIwzipURw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6602
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
Cc: matthew.d.roper@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 1/19/2024 9:04 AM, Badal Nilawar wrote:
> Skip GuC PC tests if platform does not support SLPC.
>
> v2: Use scalable approach (Anshuman)
>
> Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index bf63e4298..6c4fc81ae 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -319,6 +319,11 @@ static void test_reset(int fd, int gt_id, int cycles)
>   	}
>   }
>   
> +static bool xe_is_slpc_enabled(int drm_fd)
> +{
> +	return igt_debugfs_search(drm_fd, "info", "skip_guc_pc yes");
> +}

the function is called is_slpc_enabled() but returns false when it is 
indeed enabled (skip_guc_pc = false). Might be better to search for 
"skip_guc_pc false" instead?

Thanks,

Vinay.

> +
>   igt_main
>   {
>   	int fd;
> @@ -329,6 +334,9 @@ igt_main
>   	igt_fixture {
>   		fd = drm_open_driver(DRIVER_XE);
>   
> +		igt_skip_on_f(!xe_is_slpc_enabled(fd),
> +			      "GuC PC tests are not supported when SLPC is disabled\n");
> +
>   		/* The defaults are the same. Stashing the gt0 is enough */
>   		stash_min = get_freq(fd, 0, "min");
>   		stash_max = get_freq(fd, 0, "max");
