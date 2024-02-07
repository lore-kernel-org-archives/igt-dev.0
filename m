Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BA1C4829C
	for <igt-dev@archiver.kernel.org>; Wed,  7 Feb 2024 17:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB2F10E8EF;
	Wed,  7 Feb 2024 17:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jAIb+tFc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60DE810E4EF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2024 17:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707328216; x=1738864216;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=i9HY3gxxjEBoYIFfzQ8qAW5tEFHGm8+L4yxIrd1KK6Q=;
 b=jAIb+tFcGRubQ0F4IBJWqAGNETt4TmhN/dQuRm+MVV9LXi5NOIamMv8j
 goAUzoYhbBHCYb0YLlfs9pNxcnwXa0Wdb3oJQGilBk72lLs9lm76KWC7n
 LnuXdAhlLKFY62VATCZKFI9OfT1FhfZxeNHGNA6C8fd1tq9/e6T6mysIk
 0HBjutc8tRj9ERMxca1yy2AxOy7c/OuZF6pP/YEry2R7JwaY7LIH4u6xK
 DrXHEuTfkqV+TRua0IWQVB1CiU7Efma89dOMCjJ1E9Mbo50JE3IX4KPIE
 2iWvDCLI9fhNOLXvOqer7ofEYCRTebKqzfnyGriLzTfvwU1MfVGCKyIL4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1322053"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1322053"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 09:50:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="6019094"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 09:50:15 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 09:50:14 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 09:50:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 09:50:13 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 09:50:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7Abyu47XS9aH10Uy7U4oAs0ifTWmKvu/WA/C4ibX2U6PBtWd/rxT9ZxHD8/zWKq0VuxQQbCuT9e8g/QvZqPx7kbPp3xnVAn75koXbPDchPw4yrhrSnnHKbEF5JjWrfoEQwcfwJc1b24HLXIqPIAmp7mxpfN7WrDnGve29yoIsfd2m3gL7bB3g/5WIk2CaivifKRhmC/M4WMN8IxO/3HIuFgnigoiryVRQOM2CnOYQCAzIk/vJXnWzWOIIpurCIbjCwlL8N1rUtrYaeMzeMiHRqRfFv++jzpWi+t0aePo7qkbr41cUZQk1gH6gFl/WY5qtJorL5dGrdM7U/xC64Cfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZo3VDZ85G8tVqHbzY/QxNKiQbAWhPHK9OMLn7eXEy0=;
 b=dKP0VQnCj2N8j2qEDO5xH7b3UEO2mqO6j4d/4TSlUqo/iq4676ioF+O67wCN1QvK07TQj5Dgq/MGmsqlMEuvi+nWlQBw9MiB0waCsjwGnbDuPxE7kqRfnYOS8oFUJZftbgmqCjCnsuclCzHREQ/hb1tF0zv5+i3ROJT0aWOFrR+olsWrK8ZxnAYIU0D8m+4YJ1/6UgnZnPPuN/RQRzfF6mxWLA/oGVPdxSQJrOoApSU9UgeiYEzZhBniZgtmrwI+Ajts0SRXqfTHmBPQR5ZI6nA4hpNWqwPn7weVH+dfUHCc4LN9CVldHoHq5phYKDjEBtwt+Ufq9MRr+XeGDTt2OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5451.namprd11.prod.outlook.com (2603:10b6:408:100::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Wed, 7 Feb
 2024 17:50:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.037; Wed, 7 Feb 2024
 17:50:10 +0000
Date: Wed, 7 Feb 2024 11:50:08 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
Subject: Re: Re: [PATCH i-g-t 1/2] lib/igt_drm_fdinfo: Use longest match first
Message-ID: <tsybklkeuyt3jvwcnnjgkcnlfpmxjmrzbccba2ujhr4frp2flq@xerfdtftqh47>
References: <20240201004744.352041-1-lucas.demarchi@intel.com>
 <20240201004744.352041-2-lucas.demarchi@intel.com>
 <20240201124321.53t4qbtlswisipoe@kamilkon-desk.igk.intel.com>
 <4givrfsdv4rnga6f4ezqp27huz5dvlgxkb65wmr2j3hx5yh3vk@wbi7soq6dihy>
 <75d148b4-7227-4757-9e67-5558b087c1fb@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75d148b4-7227-4757-9e67-5558b087c1fb@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5451:EE_
X-MS-Office365-Filtering-Correlation-Id: e9a688bb-c11d-4ea2-a6ad-08dc28053a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eSO6kPppyLEhtNSJOm61hYIWuwTC3g1IquAq3YZN8laVGu0yN062fWt/i649wYP4O1g8UfsKFybht0yP25u9x0vI1SIsL2seW4qPqazyItdGIZy/hgS27Q24WLYO9JD87rMFmKWDzpSik6VknfNNVexIPNAHxuUqPcB8aOf+E+vOL0dPER06tgR6iEYDzaErLepWsoPBMTnJJoQbkcsoBPj1cjkkrd/pD5RpgAGU6hGPYN7pETom0ZlJK0Sj97g8rlcv5J4kMLSoTDuGL7TYCC9wbjFQbCIxn+kIQRcPd+Ay9GhCQ8lVmsqEfmBkJw9kg0dbKEIJX2wXS3qV39Lay3km8uj4LTq2UusbmONsfcT/FOhNtBCavHAHmYnz7M+4V4w7XiSNfTyLVFCYa4KWlv+8UA7V1QYjq1SGCgUhYF8dShNYVuI09g5CUqRmqAhaijX1512tyTmjNCLqVhbOKCKk/XZ6DebY1Z3R1KsXMfOmn6uzRvZGQRYZma5uWVcpB/apiU1stu1vG0K/dOyBW3r0IXIdZoQdfil8D+maBFJX8DJ//BwQk5JrA2HkT2DU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(376002)(346002)(39860400002)(136003)(366004)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(86362001)(41300700001)(8936002)(82960400001)(316002)(8676002)(66476007)(66556008)(66946007)(6916009)(83380400001)(38100700002)(33716001)(6512007)(9686003)(26005)(5660300002)(4326008)(2906002)(6506007)(478600001)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/rUOhJKuM3i5CUhji6lEFKnFjOfzTPCWfwaGz0DiehHLa3vv4SrDV3g2au?=
 =?iso-8859-1?Q?wcAdSal6nPkAGuEhV6qa/K7wQOwtHcvykDor3WK6FDDLzmbG/+atTCiBjd?=
 =?iso-8859-1?Q?LoVlREZgpGdaogbDgGPSBoTWpf+xcDU3UVMHtg/VJtE9Kr6JPW9QH6hkAJ?=
 =?iso-8859-1?Q?dOrfj4DbDfZP3Yhh3jHM30hOMBe+Uc/R3Z07QA6dCOcjVsNp9V/JOn2390?=
 =?iso-8859-1?Q?EnrqrLODjhcbReqcifae6YuwkNIhRo0krpNpGn7L062XrBwi7fMNTjy0Ni?=
 =?iso-8859-1?Q?gd1/XY3sPdL79M1+V/z1WAxJNx9vqRfBTHpnHMnFvTAM82Roa2ujj+LDgZ?=
 =?iso-8859-1?Q?3N7FptuqgJxt+ps0Uetj+VvjKkqW7i8i7aBw82r6V9A7jVest0LfFLeVrY?=
 =?iso-8859-1?Q?WDW5EmbhIOyy9eVYXt9GJ5Q4lJJCzzDX/0ri4+J0Htqn5s56bREbwRJcsj?=
 =?iso-8859-1?Q?7kP01p3B/V+SHVJz7YQOX2mtn6veYDYkExTQ4iMcsxEctYT2OOhTfJBnX7?=
 =?iso-8859-1?Q?XWHlakk/8QhQjdTe9RAwrWnnZP9+V9WFO1YsDHuUEQymOzyuUp1L4Y5Ygl?=
 =?iso-8859-1?Q?ctIOorTWKc92V8MR9RXI0VTS+2XUb22nfOl3312gO3nmI4asd1x+rjKLHz?=
 =?iso-8859-1?Q?WecJ24NdBOAHqzi5uFriFimK+9V4k4bX9c8I8TmDB8fTXw0CUlSgT337EN?=
 =?iso-8859-1?Q?HvVhpUjxjfDc6X1DrsCbgM9hwFgKRehhdFiXwGv7r2e0eO/SxrtbPUlN6Y?=
 =?iso-8859-1?Q?wrl5SG2K2HaM1/+oGYR+tzuo9V+56Tz3yZx20xOHuRihJiKq2l5i9IXTiv?=
 =?iso-8859-1?Q?hBmWBi+OGgag7DK6zgzTL+R6wGxrA257JlDvebwX4ch5l08lESquT9CsdE?=
 =?iso-8859-1?Q?Fis04JHO6zYG4I8iVhq1BpqTQwDJ9FtsofWdR5lnyJ3/kRwJaI74VUqED1?=
 =?iso-8859-1?Q?xg889sPn9Kh4b+mg0oUykrhRqfug1faicWMgFVhEAPpkYypGQENwGjFmW9?=
 =?iso-8859-1?Q?OPbyFXhm+JjeDZm+UEezNqhlxalFxcdvqy73lWB1IhblMDd36CiPkDsx8o?=
 =?iso-8859-1?Q?F7DtzTfLjX2+4r+6hk38KhYw8KG5DOghiYgaCH98GQVV7dRwHpVhAnRvti?=
 =?iso-8859-1?Q?AdwbQdc1/FsI3SsY7yeh5Z+DRyY1Q4vgLl7vjy3e/PmS/JsgN+K2rhOSrg?=
 =?iso-8859-1?Q?QRCvWnBssyDiftF4J7dR2VWFu0Q31iMbQeEQ8jt41LASbdJDLr60M6xHKD?=
 =?iso-8859-1?Q?2hpzRE7SxmbIqqpf4efkypkPIiwMaCrhwrUlr0BXrYoo06huTWgHrgiaKo?=
 =?iso-8859-1?Q?dc6jcZVjLaLeHEgrrVcB8lkDvhojsOgjCy9bV7GqVwWE6P10/I+/iVUZM8?=
 =?iso-8859-1?Q?sIcz9fjkTC0w0RRXqy/2XVT8NnLWRWFyVtYJoC33GwoTBMwkUGFefhUPKg?=
 =?iso-8859-1?Q?2P3hDVKpHuxg1exsOejYTHsFhlzCIET8yS0ATP7wXU7UjUClXpDt2sNlpz?=
 =?iso-8859-1?Q?vP01qwZocAvKQL0RYO3xdK4wWr0nqLC+BB4ImdeZsDk1yXXXv+JvBIMtRp?=
 =?iso-8859-1?Q?wxn1+wWLegCxVuBB+i/SVZgm3flU+qBuE/2f8ZvPiSnCI0AZjCWqPuf7rx?=
 =?iso-8859-1?Q?dHh1UH/PKl7JoKyTTHgPSHyRZotrftqBA411U/u8eELGJFsZoqAcssIw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9a688bb-c11d-4ea2-a6ad-08dc28053a8b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 17:50:10.4560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jy/rRiS8j0OXEVfpMjppxuA3lmXnrvBHz8Rb5oTYixt6u8ntChFRoznlMplERc40QgwrHfj5P5OSazDYCj8Dxmy+fVRLNm9Bm/ofVh+NKYc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5451
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

On Wed, Feb 07, 2024 at 10:32:24AM +0000, Tvrtko Ursulin wrote:
>
>On 01/02/2024 14:09, Lucas De Marchi wrote:
>>On Thu, Feb 01, 2024 at 01:43:21PM +0100, Kamil Konieczny wrote:
>>>Hi Lucas,
>>>On 2024-01-31 at 16:46:24 -0800, Lucas De Marchi wrote:
>>>>Instead of checking twice the match, just use longest match first.
>>>
>>>Nice catch, LGTM.
>>>
>>>Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>
>+1 looks like that was a confused change I did when adding capacity.
>
>Going forward feel free to copy me when changing this code, given I 
>mostly wrote it after all..

will do, sorry for missing that for this series.


>
>>>
>>>>
>>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>---
>>>> lib/igt_drm_fdinfo.c | 19 +++++++++----------
>>>> 1 file changed, 9 insertions(+), 10 deletions(-)
>>>>
>>>>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>>>index 222ccbfb1..5c0ccf624 100644
>>>>--- a/lib/igt_drm_fdinfo.c
>>>>+++ b/lib/igt_drm_fdinfo.c
>>>>@@ -239,8 +239,15 @@ __igt_parse_drm_fdinfo(int dir, const char 
>>>>*fd, struct drm_client_fdinfo *info,
>>>>                      strlen("drm-client-id")))) {
>>>>             info->id = atol(v);
>>>>             good++;
>>>>-        } else if (!strncmp(l, "drm-engine-", 11) &&
>>>>-               strncmp(l, "drm-engine-capacity-", 20)) {
>>>>+        } else if (!strncmp(l, "drm-engine-capacity-", 20)) {
>>>
>>>One more thing to eventually fix is removing "20" which is exact
>>>len of string, with something like
>>>
>>>bool str_begins(char *src, char *pattern)
>>>
>>>One source of errors is counting letters in strings or changing
>>>string itself without changing corresponding len. This can be
>>>done in separate patch.
>>
>>I had a patch for something similar. I usually use a strstartswith()
>>that's commonly used in other projects and also matches the python name.
>>
>>However I decided to drop that for now. I may have a bigger refactor in
>>this function soon reworking parse_engine() and other functions: Worse
>>than manually counting the chars for the strncmp() is to call strlen()
>>in the same string just in the line below that to feed to parse_engine()
>>:-/. As I said, still undecided what to change here and if it's worth
>>it.
>
>AFAIR hardcoded strlens were because strangely const strings fail to 
>be evaluated at compile time and when I tested it and strlen was 

humn... strlen("foo") should always be optimized out.
Testing with gcc 12.3 here, but it's something I always looked at:

	$ cat /tmp/a.c
	#include <string.h>

	int foo(void)
	{
		return strlen("foo");
	}
	$ gcc -c -g -O0 -o /tmp/a.o /tmp/a.c
	$ objdump -d /tmp/a.o 

	/tmp/a.o:     file format elf64-x86-64


	Disassembly of section .text:

	0000000000000000 <foo>:
	   0:   f3 0f 1e fa             endbr64
	   4:   55                      push   %rbp
	   5:   48 89 e5                mov    %rsp,%rbp
	   8:   b8 03 00 00 00          mov    $0x3,%eax
	   d:   5d                      pop    %rbp
	   e:   c3                      ret



>showing in the profile. Given how gputop sucked with CPU usage quite 
>badly (relative to top) I was motivated to improve it.
>
>The "top-level" strncmp checks are the more expensive ones because 
>they all run for all lines in a given fdinfo file, while the inside 
>the branch strlen runs fewer times.
>
>Nevertheless some cleanup of this function would probably be good, 
>just while doing so keep in mind how bad gputop looks compared to top 
>in the profiles, not to make it much worse.


will keep that in mind, but I'm not sure I will be able to work on this
soon.

thanks
Lucas De Marchi
