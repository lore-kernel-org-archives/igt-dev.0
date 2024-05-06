Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ABBC10F16
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 14:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE3710F08F;
	Mon,  6 May 2024 14:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hf3UNYnX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB0710F08F
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 14:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715004753; x=1746540753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=BPkCNnIuAnc1kx0/oTgPYMjARBT8kUnNXX2XWblUdbI=;
 b=Hf3UNYnXfeRuIDHoxRSzEqLWCROkOSmWaOnbAPBHHU48BAZiAxjzuWtb
 YySRu5/gyHz3qWK92Jx7L9uDMGQR0W3CNweHcbnuRlnhYNt82qFiB/6KH
 /46VjUjf25RtbOg80d9itIgtJ/G++7XRaMYihdsWS/Tg6k0BfkHmm8JNF
 uJ7FkAHHiP817P9c+uclqFi28VC5inxd1zsmI+xb8C4uPoXlwKHJarTPX
 MU6hKGXihn8AIeJqBIw5WSHbpr+3ykudnjT598Fsyg0auh4qyHaDVIyV4
 kPQUoPSgyZld4CONk1vroMq6vDLptSaKDyYLTA+HDbJqkaWAfLiBdB+KR g==;
X-CSE-ConnectionGUID: XncGsSllRVS0mtWP9qLNGw==
X-CSE-MsgGUID: UdmmVVOpQ36Ti/cDByvAgw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10966641"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="10966641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:10:17 -0700
X-CSE-ConnectionGUID: 6g9YRv4QSm27OMoIht5jOA==
X-CSE-MsgGUID: SbjRoRBDTI2gTPWcYRpShw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28265175"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 07:10:17 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 07:10:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 07:10:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 07:10:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNY6v7fYh/2FanvUUfIxA6gCm3PNk8uvD13zZrqS1lWGuZTd/JXYvw+cMwlv+19dqm2FGLFSl+84TBUDvP2VWHPmyvi+KMy3zJ4UuiyjRPizGEDIIzAfosWsBinlWycZOKeUpAlDAMPN0+KJIQt9zDT7anZmpvFuLtgmMMxDxWB83MIvbZXZU3PkiMtwlE7OM9j3heeBNfrAXtCgq58Li1atxzG86YjOWxWTgJd6tuhPSCv0aXJZvBaeiCxlCB7VNwQlRnAKKsZvDGBebwRLEXxN27wkzhh0z4I5KbBSVoDVJAwckQHpHllO4kfughhdrFhx+4zAq+ES+s8r9IR77w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWMbjB2vSf2oHkBZEK4YYvgrgOu7o0g/dfNKUKZmgF4=;
 b=E3bV7OAhCQZHblptGitAZOmnvsiNiWCTsKblPoh28RjZM8p5eScjhD5ue+McW7mn75WO5FHrmoAYs4Np7uG/+GcdQZztcC56BQMu8n7UpwLkEQiANd8JAuXj2TNkNuieAlTp+WYkxTjHj/pLIpClLGuaSUE8fU3ta16iAwXZquj2zE0vYRE0xEUm6L5OFGS3WPiN1wFVRkWVhH8hhX79L4sf7I9mhRiQ//HitVbjfd0mmKDGwxXRBpQ+Clme93h+AB4Nib5aoOJqx3igk+pDAVh0TGm15dUUZue4j/NTJwepFoccxx++3dNnHZQNVMxRFwToEafl/ltW4dRRKioCIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 14:10:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 14:10:13 +0000
Date: Mon, 6 May 2024 10:10:08 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/3] tests/intel/xe_pm: Reword *-basic description
Message-ID: <ZjjkwOV6ZOFwRgTy@intel.com>
References: <20240503224745.14890-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240503224745.14890-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW4PR03CA0007.namprd03.prod.outlook.com
 (2603:10b6:303:8f::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd67182-d863-4b32-cef5-08dc6dd63eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?16YVwU4WSYUlihmX4xuBfagp4mUTxiH8IyFLHXHhn/0/Jlqbmp1Z7YEadg/Q?=
 =?us-ascii?Q?1ZUbEk7MaffJLeKxUrgAy5yy/sVo6FOKqPBStEcQmKtzRMrnN71gsX1rdw2Q?=
 =?us-ascii?Q?X6CA+mqr3jB2qPW5S5APqjmGQ1H8Gg0x50ABkzO4EmVbzt3jk38/S3rD59td?=
 =?us-ascii?Q?sB+Dm9tp6wJr/TnMt6+UfWd4u+Er9HcozbkvO+q4Z8vNPCgVwkXa1oVniBvY?=
 =?us-ascii?Q?fOGE7uQjFXKIcG+X00qPwAPk9daSVE9KBdq83kXbgvDo37Dt2pdyQJ4tjDlG?=
 =?us-ascii?Q?ZlpGDMDRlfyyQUXmIndW+9RuwveFkY34mdSnwGffvvC1wwWewwxnbT/6/0Hg?=
 =?us-ascii?Q?XzugTZvnHIPo2O4qri7RzZN3f5A30UD8Y1a8xNReGq75gRISwLZ7HvvLqBTA?=
 =?us-ascii?Q?PUZ5P2nUAtJNgZs0WYqZIrwFsb7ewmyo3LifJFxDZpfQpmiQtokpeYv13O0X?=
 =?us-ascii?Q?qyKxmT7nfEGK4xOSc5GQu2wXUSBkpICneOpH4Lewd8Atr7MuRnGrrrOB8zy+?=
 =?us-ascii?Q?QROys91ft6tJMgA/qbexPNQQYzTnhJY6YIrwAg2PmbC5z5xKkzsBVXTDtQ8H?=
 =?us-ascii?Q?BAnebkVmFc+6PWDKYc8O2V6omlVZTyuaCbeQVcgP96HsnfT7CaykTWjIN8fb?=
 =?us-ascii?Q?wBl0LgHL8SkblrgEsmgUiesfF4FFHm8uDG97/6pw5UOf3KdcBc1gtax67fVy?=
 =?us-ascii?Q?WbSZJh6YwOGZ2ZXezKcXiyslZskJjLgqJL5QqV+g4AQ+29GwrPCGpyI3doUl?=
 =?us-ascii?Q?K6tbfQCaMIcrxV6Yf1JE1wHIIOAo8Fd2gpOirXRow5sG7wI+JuK4zjAFPeTp?=
 =?us-ascii?Q?41xW4nfzei/h7xIwTta5GuRAhI0w6uAqdKCsmrTNgriehhxGf0oNR64xAars?=
 =?us-ascii?Q?LMxnlUvvSinIaZ+E00RPT1mIsILg1Wz02G2cjxawxWuSURo+6Yvl2daee3KQ?=
 =?us-ascii?Q?INO82izH7djTd71D8P2d8R9RlR3xNSGk7ExicBzQj1fCgSpXf0SnKAnAdLQY?=
 =?us-ascii?Q?4sOWF47ONGFUQSkP5M+1cZ3pDOla/KTp4YOWFipfMmVnFkt+JFjg6k4Xujwv?=
 =?us-ascii?Q?mvP8b2FkR06ONuCchtI/aqVP90bTSW+fr/Qg2PhJME2fBJr3kY8K+TFi4GDH?=
 =?us-ascii?Q?oxVzhLZSAKPsTluhNzb0Z5g8bt1Eh4DJve9VzoUHf/NmdPZoZnIEQDDK+ELc?=
 =?us-ascii?Q?JDfJiXgVK7Qw6TYlkLnMsrwhxr85mW+unPg4FgdfQf/Zz3AM4cjeLXotOv7b?=
 =?us-ascii?Q?zQEAyxB1QXYygtOt9jpfgaGFSPVVK2K6V0oVA20OgQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j+g38sr1n12oMGVeW1xelRst2uTt4qhsY6/6ktz6swJZ7zKAtVJE8o77KXMC?=
 =?us-ascii?Q?DWsqCwokEDLw1aTgLtS8wnS0I4Ll+tcnJd7Cre7O3SBHekmtYkXaOQOLFqEo?=
 =?us-ascii?Q?mfthva9wNTDHlefWfO+WW5W+hrqzXE4aehCO2Lgl52teZ32IQjZU2paS1jCa?=
 =?us-ascii?Q?gtHNK9SgcEtKFjIHAH3XqradcjpAhjshh4LL7gmyBnBBSZ4BY+OriSf0m0gn?=
 =?us-ascii?Q?ROh84GexU/NI7+kkPWuTxjYGt3Ha9is9CgK0K1pYP+PKqWVFFcaMk5fijOCd?=
 =?us-ascii?Q?oEH0Wddn77tZIKoU4/PBiZqa76FUNOFwwsfpF7+dk49+a41YxzsK6/ZUqtlq?=
 =?us-ascii?Q?yDFrZz1gLTo4GhXj92MkTgM9ouONopfJp4vs0ZEJndOyJt3d6yyF3iYvE9mA?=
 =?us-ascii?Q?dc/wET6d5aC2O4dO64K13zHt76LXWrYWIL2vNoMPcepq8FFvBS9l3t1IiHrk?=
 =?us-ascii?Q?OrGjEw/jXBje1/Q9sJoosxyJ9ngdsTUIdAIrosMBjEmwPiWmG4BPsDYec0wU?=
 =?us-ascii?Q?JEA4P2j+/fSXxy/QQvc8WNfZ1WkT4mOpOJ18rxvRljZ3lbOlcNwvw0ojZMzC?=
 =?us-ascii?Q?MYE8+BokdQubX3XkDLh3wOT8Ox6sce7UAFfVR04oQ7w3SoS3itCp3ZbmT0AZ?=
 =?us-ascii?Q?Drs5M23AFXfISha1f5I9P7qPvDx9kKx7xL+AwOs82hbXbo7ihuytNo4oF1jH?=
 =?us-ascii?Q?WwGho5jV1Le1aZNegzSJe3FozOo1f9ZQG08y2fPw5PMPYXE2HTk01KuYa42e?=
 =?us-ascii?Q?DpmC6ZId4HDIlVD1KCPHNZbZ874gqU9W/NMgQSAk/FIbWlPzfDet41TyJ1Lx?=
 =?us-ascii?Q?MwC8Eqxb3FaPH8OOQY4syDyYt7LcDfh69OQBCRjIQPWrSDLNIRIPZ2bii4om?=
 =?us-ascii?Q?VPvRBxPHycjX0gU5+q4xDDpFm/PaUnCZ58Z+JqCson6SRG+dgf2qZxkItM+l?=
 =?us-ascii?Q?zJ03wf1L5cbajrK4HdrJ4QnjooXI9UmurpBADhb70Bc4mJY2XXJU0LCqbk7D?=
 =?us-ascii?Q?vol7A7jigNZjFJ+rszgwbkDJ8COO5/amHDT3FM0uoSVDRE2h6z3ZmOQ9A0di?=
 =?us-ascii?Q?T/jEdT71R2XqVDIymFWYTcsrBmySByH2t+FKNfhMV1IoQrIkGMoSd6hsAiLR?=
 =?us-ascii?Q?SBjlpBPWzUa4/VYuaJfcQ8WHkMqIpafZ/q6uH34YwMGL5anvoiUAL40rhfCv?=
 =?us-ascii?Q?l/G+oovtSn6hj9SjdrWA/hqOMfHxYV8VqW4u8rDgxQurd9YkzI+4gLYfi2e8?=
 =?us-ascii?Q?zGTuiYUncI9ntmF6NqImTa9XXitcm5aBfD7ULL3nHPIkKcqVmsM64rxcB7dA?=
 =?us-ascii?Q?rgJgujrkVLYXtQqnngjaJ+97MRCVH9lfGYaeptzTdfGXbjxcWSUqgeDtqMrG?=
 =?us-ascii?Q?JxXLMCALusVy/MqCKL83YyV9Ev+awHF/q14wza7mBoTkG1E22BvYskFOL2k2?=
 =?us-ascii?Q?Wn9GSc/MfDWbRi67NOMHzrI7J3VAcHzc12mD9vGPaCCWKEeR9CvfeSRgP7+L?=
 =?us-ascii?Q?l9U4PYEbTlApHAIlhUEf6zd47LIZg98Rl8KeWSgCLhC0uP3Z7m/wpADkQ8RV?=
 =?us-ascii?Q?DLgUDqwf88gy9dwtUHucf5mm8w/tsWAFZNmOKSLP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd67182-d863-4b32-cef5-08dc6dd63eff
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 14:10:13.0462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuHc0WwDpvO24hU9sH3A46X42O+QfizFxJ/2OncRKEiIRzT9KRwG8uTE8Peze+HdvIOtovSTsLeiUAAHjGwkBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
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

On Fri, May 03, 2024 at 03:47:43PM -0700, Lucas De Marchi wrote:
> It doesn't make much sense to say the CPU is going to be put in D*
> state. Reword it so the CPU and GPU states are better captured.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  tests/intel/xe_pm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 51442537b..5e79e80ec 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -223,7 +223,7 @@ static void close_fw_handle(int sig)
>  #define MAX_VMAS 2
>  /**
>   * SUBTEST: %s-basic
> - * Description: set GPU state to %arg[1] and test suspend/autoresume
> + * Description: test CPU/GPU in and out of s/d state from %arg[1]
>   * Functionality: pm - %arg[1]
>   * GPU requirements: D3 feature should be supported
>   *
> -- 
> 2.43.0
> 
