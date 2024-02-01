Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0053C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 14:03:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C62E10EE07;
	Thu,  1 Feb 2024 14:03:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="coAdtUMK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0677810EE07
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 14:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706796216; x=1738332216;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=FgOhnaum/PbpIC0OtNowVRV/YYKyWhpXc+RlstSJtBU=;
 b=coAdtUMKpPRig4e/IP4tDBxlb9hDp7qB0hyvcgwaHRn8cnfnViv1+A+N
 b9B5JQz5pZBsGuQhrF6VlU+IYosBrWGyeLTQcSKzG68q1PekPG4PCteV+
 /NfAVyQsXMV9NoRM1MEbXACskc4gGz1XjQrPf+qbOidNWpFCktsLiB6cT
 nl0k3fjCqDiuHazk4IDDkMo8MQW/A13cLJhAiFX+QCMHwGc2U3JUl4RKX
 BHlmTvJIi8duQta+b9u+ywffsLcCaRXItw7JK7oYim3hIoqqvQaBtgxDa
 tcvsTw66wf9WnllFvb+2uc0Wbek6IDX7xIzLGlht5fDNBohbJpzapRpGR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10998873"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="10998873"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 06:03:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="23107155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 06:03:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:03:20 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 06:03:19 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 06:03:19 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 06:03:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJxYXuOZg6GNZsqsVLTaQ22Anp54LmVXF7bWX+uR75Xz1AuybHTLP7znNio486HHMDy15NAc46Hsau8qtQQMYT8bVWmAfzTAziyJgnSTmjkapYjhqOkb5plb16RMnDsCAvAga/3jtKu7vlUJQleLCMewBc+zOZrt9X2gyEDw7RZJj4wMSqgSA88pjU2hQxgyonx/Hulr+DpbAXZzs5ce7oUdfGiRxX0T9aRAC9MkhswchXn4mX9kH75L7GDRSe9TUuLyPyOijTP3Y+VMGX1AD392Z9sh5+7U8rcWeL635rMfQJ7443dl3xphWcfS3p2gYA7nK0ihxEViC3MlwIhAxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0N54/UUf8Js6W0+DfHZpyd9i27JE+/0TCHeTH16eoTQ=;
 b=mW0ypWCNy/q0YND6jD0HETkgcqTq/lNI8wWVVwUqgsSI/nqx3ncsTZl74FtFE0kw8NPY4LhNfZY4NBmhwuNe5auOd3VGlv8v96O4V28gThlyzcwdR/ov5zcHEpKfPGB/oqnobojj598Hlq0mnR3SsVswRaswN9c9hADzl3YJnQNAK5T+JBI6bW2Al4fqVX7AxRShrVnK4P9vwMQGutKCxTkEt1i+bhuFCc62o+Y+HYNJOpOR++8QX0udRrf0yfCxq6I9rxfzJkL9SDMhkpLcPKJlzNjSOkLx6YOpxKG6ceP8lkIeIxC3dMb5plep15cBns3UcWKRg7KN3bDt4QVfUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6126.namprd11.prod.outlook.com (2603:10b6:8:9e::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.28; Thu, 1 Feb 2024 14:03:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::9f32:ce50:1914:e954%7]) with mapi id 15.20.7249.025; Thu, 1 Feb 2024
 14:03:17 +0000
Date: Thu, 1 Feb 2024 08:03:15 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: Re: [PATCH i-g-t 1/3] lib/igt_kmod: stop using KMOD_REMOVE_FORCE
Message-ID: <sdyud72vjztxh32ao3vl3sq2jecb75luovqgmhw35ucb7yiqda@sqoixrpxnm4k>
References: <20240201005115.352192-1-lucas.demarchi@intel.com>
 <20240201005115.352192-2-lucas.demarchi@intel.com>
 <20240201130510.gxxpk6olc6a75bpi@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240201130510.gxxpk6olc6a75bpi@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: BY3PR05CA0056.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::31) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: a1e3d318-d6f0-40f6-4566-08dc232e8a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35te7IYH4QUW+B4l0wGczHgJ2DSizdtV/NVHOKT8Em6fPbE6Hs4ikTx7hJzqnZRban8QV2gF+C+9qJmcg58NCf+pfHtq2iQkmvC8b9ho3oJiFsA8/e7UodrjlVxcsY3sHpq78zwnN3YndIyiNGmivyX+cD+q0Y7y8AnuYDNOAx1L+5UrUFn5hnoKSCjmG7QPXa8KCY3FkOa/CSAFi3pOdMB4kodvF58ruu6WSAJ7E7erUPqQTPJ5fxvOikly/ZJnr0n6X7PTxKQnJTRlaQqJQYtEyf7vZ+aFR3rvF487QvcaZ/j6N8xLpDttiHP0SBYIf+geGF8OKK0yG5mtN359NeXT70oM1J3Ldp939k3UtFSnrvIM0KINT1kb9u8fPF9MvpUuErjoVjUcu0/fsDixkNwH9nR5TEiZbpYfhjXCdJCn+zC01WMhUMM9sbk4J6rNb8vHqXoLaXaIj+TT2UJxGJmxZcg9yvNXi93YB/AxlLXerspEReR2DGKYk6cr6TCJ37mv8yc1jnvRtEc7Ta+mXuczw2uH1yA94nF5Or7BDdBboll51Lm4h9siR5d30+XsD0OBK3sOu1PLmN+YCmZt3ppKRWvUNefjbqzUbx7htcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(396003)(346002)(136003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(9686003)(6512007)(6486002)(86362001)(478600001)(33716001)(41300700001)(82960400001)(26005)(83380400001)(5660300002)(2906002)(66556008)(316002)(66476007)(6506007)(8936002)(38100700002)(8676002)(66946007)(110136005)(21314003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MVq/7146Ia3KiGmEBNSkJhLjiPX+thpJRR4UCi//JAluedwC3nf6tsgFDOjK?=
 =?us-ascii?Q?/QVNesjXnmgeI1ve3OlKrNaqK1g8VpReQXBCVB8dyXuH3ebxjIzFGwvpSJBG?=
 =?us-ascii?Q?ya9ESL3VO8jlUB7ahisame+yp0SlLoQ3tMc1BJ51gzYTp1ISZp7hf4sL9hET?=
 =?us-ascii?Q?NJhLNY74vxK/fqGi5IPT/TIH2WU65rKVejPaCiqAGD4apLhruTJHh90BdVrq?=
 =?us-ascii?Q?gWAWDwHGRcLURNm+2R4D1CrTQBOH94sfTNItKEuyfurB+VMHPBEBqqx/04gN?=
 =?us-ascii?Q?SywQUG0fg505KzRA6jWWx1JSLqUlkT40Fm3T8hNDBj4eyog6vTQq6oek1bcF?=
 =?us-ascii?Q?HNkHdZAzdvX7iVk8pJqj0ys+FkyGODa1vZyngCQEWvABrVdJmzHlMihIsxSl?=
 =?us-ascii?Q?4AjNP5zx0YJeKs5WuL4XIFVX70jZksER5WVfMrZuPD9USTwyveLjA6DN3nEL?=
 =?us-ascii?Q?YZQNIgU/NY/jzaKzkQ7GMixiRNu5GLDNn6KOvCzXXAQvJD3CHbf1oGjpD0Kc?=
 =?us-ascii?Q?3HmZB3alAIpNJYzgw0vHzzNQOtlDM0E9M3Uub2idYuSmAcSEevvMbpHF9z+V?=
 =?us-ascii?Q?jL+a8hOCLttkm/VMfV5XDm4yTTVAMihtdOXMPWedVP0WxlmWsQN6IZ40Jx79?=
 =?us-ascii?Q?L6mc2Z/Xwd2YbZ+pxoDIqMbKmkPDUunwU5rSnkD7HLx+UeNkKhj68SW3ohpD?=
 =?us-ascii?Q?a1Xz237s542pkzR1nC+3lJ/EPqtR+5asYDiAVwwctFItwmm9fwfxXZCIFz/1?=
 =?us-ascii?Q?Lx4HDS4aIoGDRV5B2HVCqIZkg0LzPnjwhYLvg3Pqv3VxtumQ/DcZVnbXWGfy?=
 =?us-ascii?Q?pFeMZ4v19WNYPTdW3VUBWGVivIDrvRutOTOgDTJGgYqSppjftn33in/8JNRb?=
 =?us-ascii?Q?ljbUxuXaQ5haeb3ohQ4cGsNxE+7tUe64apFApcVuH+2zzYxfQEkiximRmVh8?=
 =?us-ascii?Q?1BfXGnXRHYXIwbfdsMrfovBpKz7JdP9UVzdqV/hn1faDoykNXj/jTpFcKv8S?=
 =?us-ascii?Q?vQ8wStb5h50iMtsX7ziyfWmqUlyRBZE4WD2rO37b0Att0eIoZNvCpLpOG5pC?=
 =?us-ascii?Q?0HJdJ4CUd05r/RnTPbogGnew706FKN4yghkQfSm0/NOFEMUKnaLX3L9LUjm9?=
 =?us-ascii?Q?R3I8sSgCHJ3nYRouVpZBT/ZS0BMggyz5eQnoUVxD/d7cJnyi2VheN7y9n/6F?=
 =?us-ascii?Q?RTUnCaFocVR0eT+F3AkG0zmi+hRyY2nNzrVPwsR46K9yWEnvq+ZS5OzVywM/?=
 =?us-ascii?Q?58LP50smr8EisEGiMFwQchPqxVVE/Mc3YyT3pnnod8xN1x3ZZ/oXNP8Q+NIH?=
 =?us-ascii?Q?RsCHsCjnmRiHKZ12EXTaUgOvtXUkQzjcsWlQRwc3x9xkksk+h9kyx/nv57ga?=
 =?us-ascii?Q?RdcgONp9fpSxedjJMkgjKhPSpVoJ7OiEatFflbU4Zzi87FqMdWOa7nOHs4RJ?=
 =?us-ascii?Q?hcY3v8CUH1XcnYV1hCaUdxbnSpe1qhC1sEDEZn3rlzkstQQvNpyaiN+3jJgc?=
 =?us-ascii?Q?IWEGUakFwfwRAf2TYZdIHjGbqD+Aq4vTP8iRLRdTUFxnF/nz3WSyyVBOfDl/?=
 =?us-ascii?Q?afN/J3TXjSff7AZ7DkOhRxJ6INJ74oLUsUfaXT35NkDF39fwTUy9NinQjGhc?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1e3d318-d6f0-40f6-4566-08dc232e8a22
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 14:03:17.4390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zk0z7NcNUqVDRU7GB1ugNcJlzz6l50uNQHhkvZZEQHTVoLn117/BuiODPDweZ4JI6hQjEXkOMl9KFMt/YfV9ilF4hwOIR3vs56aD44AMy+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6126
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

On Thu, Feb 01, 2024 at 02:05:10PM +0100, Kamil Konieczny wrote:
>Hi Lucas,
>On 2024-01-31 at 16:50:28 -0800, Lucas De Marchi wrote:
>
>Missing commit description - please add one.
>
>Do we really need this remove?

oops, I was supposed to add the explanation why that I used in a
patch review and forgot to paste.

I'd swap the question:  do we really need the flag? No, we never need
the flag. If the kernel ever resorts to honoring the flag we will
have a tainted kernel, potential leaks and memory corruption. It's
better to just handle the error returned by libkmod and fix the root
cause.

Lucas De Marchi

>
>Regards,
>Kamil
>
>+cc Janusz Krzysztofik
>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_kmod.c                 | 42 ++++++++++++++++------------------
>>  lib/igt_kmod.h                 |  2 +-
>>  tests/intel/i915_module_load.c |  4 ++--
>>  tests/kms_content_protection.c |  2 +-
>>  tests/vgem_basic.c             |  2 +-
>>  5 files changed, 25 insertions(+), 27 deletions(-)
>>
>> diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
>> index 5709138c0..2fed6ed54 100644
>> --- a/lib/igt_kmod.c
>> +++ b/lib/igt_kmod.c
>> @@ -258,7 +258,7 @@ out:
>>  	return err < 0 ? err : 0;
>>  }
>>
>> -static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>> +static int igt_kmod_unload_r(struct kmod_module *kmod)
>>  {
>>  #define MAX_TRIES	20
>>  #define SLEEP_DURATION	500000
>> @@ -272,7 +272,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>>  	holders = kmod_module_get_holders(kmod);
>>  	kmod_list_foreach(pos, holders) {
>>  		struct kmod_module *it = kmod_module_get_module(pos);
>> -		err = igt_kmod_unload_r(it, flags);
>> +		err = igt_kmod_unload_r(it);
>>  		kmod_module_unref(it);
>>  		if (err < 0)
>>  			break;
>> @@ -292,7 +292,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>>  	}
>>
>>  	for (tries = 0; tries < MAX_TRIES; tries++) {
>> -		err = kmod_module_remove_module(kmod, flags);
>> +		err = kmod_module_remove_module(kmod, 0);
>>
>>  		/* Only loop in the following cases */
>>  		if (err != -EBUSY && err != -EAGAIN)
>> @@ -326,8 +326,6 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>>  /**
>>   * igt_kmod_unload:
>>   * @mod_name: Module name.
>> - * @flags: flags are passed directly to libkmod and can be:
>> - * KMOD_REMOVE_FORCE or KMOD_REMOVE_NOWAIT.
>>   *
>>   * Returns: 0 in case of success or -errno otherwise.
>>   *
>> @@ -335,7 +333,7 @@ static int igt_kmod_unload_r(struct kmod_module *kmod, unsigned int flags)
>>   *
>>   */
>>  int
>> -igt_kmod_unload(const char *mod_name, unsigned int flags)
>> +igt_kmod_unload(const char *mod_name)
>>  {
>>  	struct kmod_ctx *ctx = kmod_ctx();
>>  	struct kmod_module *kmod;
>> @@ -348,7 +346,7 @@ igt_kmod_unload(const char *mod_name, unsigned int flags)
>>  		goto out;
>>  	}
>>
>> -	err = igt_kmod_unload_r(kmod, flags);
>> +	err = igt_kmod_unload_r(kmod);
>>  	if (err < 0) {
>>  		igt_debug("Could not remove module %s (%s)\n", mod_name,
>>  			  strerror(-err));
>> @@ -525,7 +523,7 @@ static int igt_always_unload_audio_driver(char **who)
>>  			if (ret)
>>  				igt_warn("Failed to notify pipewire_pulse\n");
>>  			kick_snd_hda_intel();
>> -			ret = igt_kmod_unload(*m, 0);
>> +			ret = igt_kmod_unload(*m);
>>  			pipewire_pulse_stop_reserve();
>>  			if (ret) {
>>  				igt_warn("Could not unload audio driver %s\n", *m);
>> @@ -583,7 +581,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>>  		if (!igt_kmod_is_loaded(*m))
>>  			continue;
>>
>> -		ret = igt_kmod_unload(*m, 0);
>> +		ret = igt_kmod_unload(*m);
>>  		if (ret) {
>>  			if (who)
>>  				*who = strdup_realloc(*who, *m);
>> @@ -593,7 +591,7 @@ int __igt_intel_driver_unload(char **who, const char *driver)
>>  	}
>>
>>  	if (igt_kmod_is_loaded(driver)) {
>> -		ret = igt_kmod_unload(driver, 0);
>> +		ret = igt_kmod_unload(driver);
>>  		if (ret) {
>>  			if (who)
>>  				*who = strdup_realloc(*who, driver);
>> @@ -629,10 +627,10 @@ igt_intel_driver_unload(const char *driver)
>>  	free(who);
>>
>>  	if (igt_kmod_is_loaded("intel-gtt"))
>> -		igt_kmod_unload("intel-gtt", 0);
>> +		igt_kmod_unload("intel-gtt");
>>
>> -	igt_kmod_unload("drm_kms_helper", 0);
>> -	igt_kmod_unload("drm", 0);
>> +	igt_kmod_unload("drm_kms_helper");
>> +	igt_kmod_unload("drm");
>>
>>  	if (igt_kmod_is_loaded("driver")) {
>>  		igt_warn("%s.ko still loaded!\n", driver);
>> @@ -682,7 +680,7 @@ igt_amdgpu_driver_unload(void)
>>  	bind_fbcon(false);
>>
>>  	if (igt_kmod_is_loaded("amdgpu")) {
>> -		if (igt_kmod_unload("amdgpu", 0)) {
>> +		if (igt_kmod_unload("amdgpu")) {
>>  			igt_warn("Could not unload amdgpu\n");
>>  			igt_kmod_list_loaded();
>>  			igt_lsof("/dev/dri");
>> @@ -690,8 +688,8 @@ igt_amdgpu_driver_unload(void)
>>  		}
>>  	}
>>
>> -	igt_kmod_unload("drm_kms_helper", 0);
>> -	igt_kmod_unload("drm", 0);
>> +	igt_kmod_unload("drm_kms_helper");
>> +	igt_kmod_unload("drm");
>>
>>  	if (igt_kmod_is_loaded("amdgpu")) {
>>  		igt_warn("amdgpu.ko still loaded!\n");
>> @@ -1158,8 +1156,8 @@ static void kunit_get_tests(struct igt_list_head *tests,
>>  		free(case_name);
>>  	}
>>
>> -	igt_skip_on(kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE));
>> -	igt_skip_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>> +	igt_skip_on(kmod_module_remove_module(tst->kmod, 0));
>> +	igt_skip_on(igt_kmod_unload("kunit"));
>>
>>  	igt_skip_on_f(err,
>>  		      "KTAP parser failed while getting a list of test cases\n");
>> @@ -1362,7 +1360,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>>  		 * unload may fail if kunit base module is not loaded,
>>  		 * ignore any failures, we'll fail later if still loaded.
>>  		 */
>> -		igt_ignore_warn(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>> +		igt_ignore_warn(igt_kmod_unload("kunit"));
>>
>>  		igt_assert(igt_list_empty(&tests));
>>  	}
>> @@ -1395,7 +1393,7 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
>>  		kunit_results_free(&tests, &suite_name, &case_name);
>>
>>  		igt_ktest_end(&tst);
>> -		igt_debug_on(igt_kmod_unload("kunit", KMOD_REMOVE_FORCE));
>> +		igt_debug_on(igt_kmod_unload("kunit"));
>>  	}
>>
>>  	igt_ktest_fini(&tst);
>> @@ -1438,7 +1436,7 @@ int igt_ktest_begin(struct igt_ktest *tst)
>>  	if (strcmp(tst->module_name, "i915") == 0)
>>  		igt_i915_driver_unload();
>>
>> -	err = kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
>> +	err = kmod_module_remove_module(tst->kmod, 0);
>>  	igt_require(err == 0 || err == -ENOENT);
>>
>>  	tst->kmsg = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
>> @@ -1486,7 +1484,7 @@ int igt_kselftest_execute(struct igt_ktest *tst,
>>
>>  void igt_ktest_end(struct igt_ktest *tst)
>>  {
>> -	kmod_module_remove_module(tst->kmod, KMOD_REMOVE_FORCE);
>> +	kmod_module_remove_module(tst->kmod, 0);
>>  	close(tst->kmsg);
>>  }
>>
>> diff --git a/lib/igt_kmod.h b/lib/igt_kmod.h
>> index 990e5309d..efb46da12 100644
>> --- a/lib/igt_kmod.h
>> +++ b/lib/igt_kmod.h
>> @@ -34,7 +34,7 @@ void igt_kmod_list_loaded(void);
>>  bool igt_kmod_has_param(const char *mod_name, const char *param);
>>
>>  int igt_kmod_load(const char *mod_name, const char *opts);
>> -int igt_kmod_unload(const char *mod_name, unsigned int flags);
>> +int igt_kmod_unload(const char *mod_name);
>>
>>  int igt_audio_driver_unload(char **whom);
>>
>> diff --git a/tests/intel/i915_module_load.c b/tests/intel/i915_module_load.c
>> index 9fffe93d9..b72f3252a 100644
>> --- a/tests/intel/i915_module_load.c
>> +++ b/tests/intel/i915_module_load.c
>> @@ -216,7 +216,7 @@ static void unload_or_die(const char *module_name)
>>
>>  	/* should be unloaded, so expect a no-op */
>>  	for (loop = 0;; loop++) {
>> -		err = igt_kmod_unload(module_name, 0);
>> +		err = igt_kmod_unload(module_name);
>>  		if (err == -ENOENT) /* -ENOENT == unloaded already */
>>  			err = 0;
>>  		if (!err || loop >= 10)
>> @@ -259,7 +259,7 @@ inject_fault(const char *module_name, const char *opt, int fault)
>>  	igt_debug("Loaded '%s %s', result=%d\n", module_name, buf, fault);
>>
>>  	if (strcmp(module_name, "i915")) /* XXX better ideas! */
>> -		igt_kmod_unload(module_name, 0);
>> +		igt_kmod_unload(module_name);
>>  	else
>>  		igt_i915_driver_unload();
>>
>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>> index 3fc575634..6858b22e2 100644
>> --- a/tests/kms_content_protection.c
>> +++ b/tests/kms_content_protection.c
>> @@ -396,7 +396,7 @@ static void test_content_protection_on_output(igt_output_t *output,
>>  	}
>>
>>  	if (data.cp_tests & CP_MEI_RELOAD) {
>> -		igt_assert_f(!igt_kmod_unload("mei_hdcp", 0),
>> +		igt_assert_f(!igt_kmod_unload("mei_hdcp"),
>>  			     "mei_hdcp unload failed");
>>
>>  		/* Expected to fail */
>> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
>> index 63c5c0971..cfda908bc 100644
>> --- a/tests/vgem_basic.c
>> +++ b/tests/vgem_basic.c
>> @@ -438,7 +438,7 @@ static void test_debugfs_read(int fd)
>>
>>  static int module_unload(void)
>>  {
>> -	return igt_kmod_unload("vgem", 0);
>> +	return igt_kmod_unload("vgem");
>>  }
>>
>>  static void test_unload(void)
>> --
>> 2.43.0
>>
