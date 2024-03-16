Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F2EC54E67
	for <igt-dev@archiver.kernel.org>; Sat, 16 Mar 2024 00:47:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E578E1127A9;
	Sat, 16 Mar 2024 00:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CAJTLY82";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32C31127A9
 for <igt-dev@lists.freedesktop.org>; Sat, 16 Mar 2024 00:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710550058; x=1742086058;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=VihnGDyVnKBm5BG0Z64mg5s4wxG4g94bGoRSH1N1z3c=;
 b=CAJTLY82kaCdgHpNP8z6AsP6AQpkicU7zP34pyFtNcD+IhP2PEFYtB0b
 Uzt63Z9wRM68sGcLjc5XRT/7CwDkLVNIU0fWEznv4IYlqmCONCr4fZo9T
 K3M8Z6siCns0bUy7aRXNBt9EF/8XO7+KnyzokDaGOZeY5IaSUwN2y20Ds
 2jGG6fqb4wsSO+JqiMCNxqTdY8kFIMGOrYm8zbZZSflf5lJf3R95LxbHL
 7V+D/4QnBOIVIrKcQoDzGNKxbODkYHe4d3waIpl7bDNSH/KdJaJW8Cppk
 PlPrWnKX8OW6lfh5G1mZd1A1G46KKweVF7swuez/Znpis7IlhUGhOPqAp g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5647401"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5647401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 17:47:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12894176"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 17:47:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 17:47:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 17:47:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 17:47:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tqof4yHji427PKOEjIAYLn0ZXwAOsE6LQMhA4yR/QW9TbElIw2RhB7z2BSpm2351FQFt5m8DtIdoLUyhqVxPDH/+b4L9tMqUmOT/vh47p3aMzxGN3ZaVnYcAxgooHuCuxrx3FGrrS5Fto/a6nujc19HhOIqU63XCsxMDSA5xWv1eCJ+NBrHg1QeATNQtW5m6bT8zGLWf92uQ2z4dNcGBjbxa+S2WkJdvKM5k6sxJc48IWScVfJ6sE6IcLT98tfZ5A4gFsv4hoho8YtftjHzBjAPNf6rEzZIXvUvNhoyBo1xMebU3wUXxFtqDAcEFZWWBaJrmlvGuq3FNnySFbcRhmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHX+HDQDwx0ExQ9oAcOGrHzjBKmL8bYYdxKxVllVvzc=;
 b=UuYVl1qqYiRKjCsiYmFe+lz9aWcVtQMAUJQq93Jy1i3gfE3h1GoRNa5yNyMqHTiOi58NKwuoN8il7mpXjSPztj5l5TbJhaLAj2wOXcwtwlNJTKcksgfU2cctypf0hX5q2KyGO6y/WYp0MtW81LOjCNm6GiGTFGYdmMyrtwCLY2q8wGEh2K0cZnviD0yNBvOLWezhTEdyxNYZmWM20Y77WAHspGpNkGKwnbXWwi4WDVSksocC8IJzTEkXtYXmYYgJb4dxS9Lyi4IPPJgCkunveEmhTwNkBVAUvNtsABzIN3IDcbFt4SRnFoqaQAOOErZ6jmo+LmuVGX1bB2RLkxJ42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6556.namprd11.prod.outlook.com (2603:10b6:510:1aa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Sat, 16 Mar
 2024 00:47:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.017; Sat, 16 Mar 2024
 00:47:28 +0000
Date: Fri, 15 Mar 2024 19:47:24 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3] lib/igt_kmod: Allow to load kunit from alias
Message-ID: <wlq64c3dh73ohuumps5czq5egkiquqkeljnybfyjwn3ccpwjrh@rl3hqavdpjjf>
References: <20240308193149.2220807-1-lucas.demarchi@intel.com>
 <20240315071551.0661aad9@maurocar-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240315071551.0661aad9@maurocar-mobl2>
X-ClientProxiedBy: BYAPR07CA0049.namprd07.prod.outlook.com
 (2603:10b6:a03:60::26) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e6677a-8dc3-4838-ae19-08dc4552a7a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P44nU8YKWvenzHbU3dHUEW3Z7+BxVblw1zBe8yyO/TkhlX4FCvlqkMnetGosWlrFeAXr+DInU5bw4Tys0EKh59axBn+IgeP+4+ZxIYAXXDTyYM7J+CKhFWrEwbC/1iJ8YfV95tYixUd5KWCGnxyBD+GAFZmfVKHWKcBBMaW5+Ik/JMGBNGN7EjvFX3gN6MQGv56dS6JIPpdES26tO12gnUhLxwmvJr9ndvW6hRwx9HbMTEOUD0K9vPuR88Yee0ZPngrfVVJBUbgLLrPA8dCSfgzR08Sk0qtDDRcN0EH9u1W5TiqBcbz5Yx5t35QeQMasxweGg0hTgw70oOQ+uS4z+/gpXi2ajq49zjJltR70BQtSgSN6p2C3/WNudGPAtqYn75eWrTJf2cSw2ckJuMg2OvYq1PU0qA/IKPn0gBtZoxuZWSfoJijDvCjVkDwDAGk3QfoMGFc5m4yBuF1+rJwyGKBUAakW1RHYZLQow5RBEcV6dCnzb+TMmJ22+Kr/+7hUBS6MvQqHbFxDiy7KY4T2FHXokVej7gzb9ehNQ7zpOgKQkufOcMyss8TI+Mhwal55/R7yAVoITmx5qPNg+AIZCrkKMyx3ua79vd/FrNWrH7eaSFADyNr6+sH9o2j3803HIAxboaHvgAOf+nYLLC+5hCE+xH9UqHsAsXHQjxD6XBM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R/j9ijbIddDUEHi4pvxlgoZiLoSbOmaJP7jg6jbwv63rrBQ7isWxygVdYWnn?=
 =?us-ascii?Q?ymsnEFZhwTjD7QpFiMb1/tvgR835ZV75PNHp0JjeocJd/fHEle1h2YX5Vnzv?=
 =?us-ascii?Q?2tESsHrLjyRaGlf6ej6LKAKwPSBtUv74UoH+3EZ6VuvYOjJD8CEcq2OwXSKn?=
 =?us-ascii?Q?Wdp7LWxaIdugtEzt84CpA8HUOAb+JcsfPxjuBYgvyMT3P2JKTkZjnjEl2Po4?=
 =?us-ascii?Q?Flqqz4T+lx3+56urQKrU4LulhPF7SfN4I1yn1yKOCVrravXO5FPnFxzkcDB1?=
 =?us-ascii?Q?p7zZzh12V8JC8HvqkpPJQgMSsjZloPxzB0XpuCu5DKJs3Dy4pA1kS6haIY09?=
 =?us-ascii?Q?h26SkweqrXgMeHH60Dhe8Ktkg/ll6dKO8r2BeXAPldAnljhSkcSultgvesj9?=
 =?us-ascii?Q?/rZC3ejD6NtZUqudAP1QRlfo6E7TkpZZMhJNRxi2gS1qn9VM+SlI7Kbqqm17?=
 =?us-ascii?Q?7fVuaA4MY6oPsh3lc3YhCOqqdhMy6W3SK2MYiGLG9/+X9EIiFZywSLE0lG0F?=
 =?us-ascii?Q?xpQ2vwFZ2LKRqcyWzSWcLfPqgMa67dp5Lz7bZqahDLhM6X4rVZigrKSuOrlN?=
 =?us-ascii?Q?m7fuYEwRg9g6aYvFSyK0weN95denrOgMpCyCbCJWi9mH7cXBkBEQmwTXwrXA?=
 =?us-ascii?Q?GEhlEn8AmEbyvgJyCPz0JXlB0RezjiEVvLSjh4nk/vbcZXH3GKNu3pb626XE?=
 =?us-ascii?Q?ijc6iL3v3CM4MJWKd0qbwDgPs5W8Nqb/WjhIc+9PWwOy8T7A7Y2a61WVz+6Z?=
 =?us-ascii?Q?m9mqm0+Rds7sF3P+VPFCBDiuIE9rS9b5yZlyDltzQmc19pzVt5HhJd1npChT?=
 =?us-ascii?Q?rPb9wlvOsBb7NL8CZtlD3s9+ioqgl4WaqP6E6AVlNyred6AuyDQlqX7qu9XL?=
 =?us-ascii?Q?ee/KDGoWOMvwDX6PoSP2gmum9yqNMVmtrRGJJ0GIkL4pDSaqQ2tkyIksHle0?=
 =?us-ascii?Q?SNorhR9ugMiB8Mv5KFwxNyoEsnUsQOhPjphzT0ix8RtYAD4aXW0D4aClh1BW?=
 =?us-ascii?Q?4L3QLhPdnS/6Sg15pDCAiHe701MN7JQzMYZEksCiv7HlIguock3XylgUiw8Z?=
 =?us-ascii?Q?mEWA6U/ukflcp2/forCryfrXy1VDNWkJWQ4DFjpntUMmNxlrwXWvbNnYdatz?=
 =?us-ascii?Q?twA1XnJyMsOVkKoffny5PZe4feQBEGAVBdwKhUEb1rDk1OogzEHuQBVk3bJr?=
 =?us-ascii?Q?V/cYKrVSsPvX7hULfNgayRMFd2VLe2jlQ1WH8LoRHZC9+iy6Qa9D9UNHiFzu?=
 =?us-ascii?Q?L6kfnZofX8Xu0cfxFNJRo0WoVhWDWaz9jH/ZRFEvHQGWwnX0BZfyTVle82Aq?=
 =?us-ascii?Q?YoXryq8nUcPODYVb59jqqhbDUWVJv3mRzvXxNwYz9MCw+fIDxsTzRFgIYuRc?=
 =?us-ascii?Q?xHIkxvJXoPswlHnUIhfNnMHFUS+f1e4VmrhaCvqZKoMevj6ErWuRtPzeYO84?=
 =?us-ascii?Q?7FBtvIm3QyOMx/slUg1gJq+99JNeYf5ViTNFgwmPlmOyumFP7eubwb7Att4n?=
 =?us-ascii?Q?6UBm/R3u8k2QqPqmsqyMa1yMhEDh+9x5hLzY2bKT4S0FovD8BwzagMwLuNhk?=
 =?us-ascii?Q?eQ3thc5ke/Hi6On+b8F5Ll7mP3qIAWHPViLgZjLFmTd/5Y+k6THoSAI4/SB5?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e6677a-8dc3-4838-ae19-08dc4552a7a9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2024 00:47:28.3828 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GChFkpZ3NsM+fNfd5lp7EYu9PiSZZykc3VC3QLG99Cv5F2LyDrwjRhbO0orUEZdZeoq4qppZOMdugIJ7nY9sSX2mGX5NUNiRimSYrC+o2nY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6556
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

On Fri, Mar 15, 2024 at 07:15:51AM +0100, Mauro Carvalho Chehab wrote:
>On Fri,  8 Mar 2024 11:31:49 -0800
>Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
>> Instead of only allowing to load the from the module name, also allow it
>> from alias by using kmod_module_new_from_lookup(). With that a user can
>> have their on aliases and the kernel can also export a compat alias for
>> future module renames.
>>
>> There was a bug in libkmod <= 29 that would make
>> kmod_module_new_from_lookup() return prematurely after a failed alias
>> lookup when we don't have a modules.alias file in the modules dir. So
>> add a workaround to check for -ENOSYS return code too. It should still
>> be compatible with what we are doing here.
>>
>> v2: Fallback to kmod_module_new_from_name() since the kmod ctx is also
>>     used on builder machines to determine the test lists.
>> v3: Add workaround to bug in libkmod
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_kmod.c | 21 +++++++++++++++++++--
>>  1 file changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index cc242838f..d581f9073 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -1443,6 +1443,7 @@ void igt_kunit(const char *module_name, const char *suite, const char *opts)
>>  int igt_ktest_init(struct igt_ktest *tst,
>>  		   const char *module_name)
>>  {
>> +	struct kmod_list *l = NULL;
>>  	int err;
>>
>>  	memset(tst, 0, sizeof(*tst));
>> @@ -1453,9 +1454,25 @@ int igt_ktest_init(struct igt_ktest *tst,
>>
>>  	tst->kmsg = -1;
>>
>> -	err = kmod_module_new_from_name(kmod_ctx(), module_name, &tst->kmod);
>> -	if (err)
>> +	err = kmod_module_new_from_lookup(kmod_ctx(), module_name, &l);
>> +
>> +	/*
>> +	 * Check for -ENOSYS to workaround bug in kmod_module_new_from_lookup()
>> +	 * from libkmod <= 29
>> +	 */
>
>Hmm... if the bug is not present anymore on more modern libkmod versions,
>shouldn't the code be verifying the libkmod version?

unless we block the build with libkmod <= 30, no. But that would break a
lot of the enterprise distros still stuck on older libkmod and upstream
CI - I saw some using versions as old as 26.

I don't think it's a good practice to check version number in runtime as
the fixes could had been made available by distros themselves. We could
check the *behavior* and adapt, but in this case I don't think it's
worth.

>
>Also, better to add a link to the bug inside the comment, in case the
>workaround would require maintenance in the future.
>
>With that, feel free to add my:
>
>Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

patch has already been applied a few days ago, but thanks.

Lucas De Marchi
