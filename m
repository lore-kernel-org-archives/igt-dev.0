Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91C1C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 19:37:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BF910E1FF;
	Wed, 28 Feb 2024 19:37:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gB0uMqt9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFE610E1FF
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709149056; x=1740685056;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z1XGdjjy5SEH+5fYPu9a4PXpq/f/in9pRccBhDTTYH0=;
 b=gB0uMqt91fNRA9GhbNtXuhN6KxKAYg6CXCGL7ZHHp9aVD8mBi72yzKGe
 FT5rX6THzw+YyET+jRcLz6PD8MF07OKSS3sh96xgw6TYzxK0kZIy2GgV0
 XFR+Lq4GTAyudSgFVMjntSirH8zlRnyyspCFgav/jiUbI5vPxldq+tRYo
 IWKl6wjfDLnNKEfXAdaeYwe8XybmM4fA8cfLcKa7KQTsv/n9Tu0kKRAQf
 2xFOHHilotod//7MxTjjZRhka/29C+jZsZscJOEoP2Ov1ft1tpa3HHtj4
 lk4pPVfi8fSpjiB4vf0TNE55B/QmQrAvlXaTg5GP0PeDF8eB2jbGE8Vjh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7356999"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7356999"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 11:37:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="38575763"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 11:37:35 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 11:37:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 11:37:34 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 11:37:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aR++fLIGSKXbURI7iXXsuflviopgG25h05TSASDEzcY91LiTabCw80cVADFcmN0RxRAc268ppIA2Th74foAjRfsxf6tcdF5eYbYB+NshVml9zlPwMVwFhzBp8WI+1kWSBvOs3SYC34RK/xdzzVvaqwGe4bPvcME6r3gioQK/SVP4Z8yP6z3p/NRhQNzSdsMYrJQE1dSTgmj9dp6KG4CTB9Wfupc7kavb7sMY1/j1CiR2maWqRngz7NjX+DEycdojc/EduwKT8w9Mtqdex+8eipyzqlDAudI6MUWiuZ7k5ldtjDMr7jB7rctnvhRGGxYhZaFYvdBkgZhljs2IXRI/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gjw0ljvX4VIaxYv/zpRGLCgl5l7FcWNr1l93fM+10BI=;
 b=M7ck6oS7P9aesLk8P7+91WMTX8284FPBeoMDxBfv8eTnrTfgcolvW/8xGpx6SH++KLtwre0ShyVu5cdjJ7ONomorCvunKEzVk5hrGgWof38m/LzmkIdB0aB8eCsyeVzdcCdfw5AoxxvbY9K7/hVVJQ2yHgV4WX4iZExq12splRE6vmz+k1nAlrASEgQyBHXgdrTX6KqUj/jnPZFsPVLM1yvI6Hf0qLSH35CDa2/BTVYLeeJrzUb+AIIXkVMkzn6ykLdcAXE2I0yTPF3mCjogU3q1B9V+vawlZGUV3mH5mW9gVMnvcZxqXl8/YrgE5OFq+K8DKmO/wMFrfZJBEq+a2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA0PR11MB4528.namprd11.prod.outlook.com (2603:10b6:806:99::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.12; Wed, 28 Feb
 2024 19:37:32 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::45cf:261e:c084:9493%5]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 19:37:32 +0000
Date: Wed, 28 Feb 2024 11:37:29 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Invalidate
 cached stuff
Message-ID: <20240228193729.GL5347@mdroper-desk1.amr.corp.intel.com>
References: <20240209135526.135380-2-gustavo.sousa@intel.com>
 <170845211015.44184.10125779397878338003@gjsousa-mobl2>
 <cf373084-45f3-4c85-aed0-9fa97d84a3e3@intel.com>
 <170851900590.23070.10525095367187353126@gjsousa-mobl2>
 <ffee3004-32af-428d-9dee-e81ca9a354ce@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ffee3004-32af-428d-9dee-e81ca9a354ce@intel.com>
X-ClientProxiedBy: BYAPR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:a03:100::36) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA0PR11MB4528:EE_
X-MS-Office365-Filtering-Correlation-Id: 761d665f-cb8c-4cdd-9c2c-08dc3894b4d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6emNgsIHe3F5rg/e0b2q8gAITLsNva69aLmhj1Xbow6+L4BPxmIvIQDNBLqxocecopHE6Y1vR0KrumGm7RqA9UMcbIf3AV4sSM1+REGC9n04/hyCOr8TEmyJLS+L8RwZ27sizdCXXC4QUZMPDd9MPtfZvtuEiug75vJP7+3E0k4Mb83gnma3nk63b4fVQnVE6FXBBi5/1PcO+VzvZZfuLP0jY3gD1TRsg4YjrhloTvoL96bc8qQZq9a14qg32tv9nhttwxHUmxU26qldU2G/cqhQGMfwUpefU6lIoZvYvWs+ju8w/i0wNAZzRr3dCBdX/UQ+k43Sn+Ej9hqy1X+m3jpe16DfM8PoTKohwo1T6N0jGbb30P8eizqJCD+q4ipNqqdb4k0S26LnIfgx+YT3U79s6jIQWkPBj4VMj/Oq3OYXvi3NFa2rX+CTQFkKL/TUc474cx3aZT3An+S1SXGUfyzZMNGq5nk/1GLihQCfMbmRt4HRAgqrx/bMXSBn1NH+vAIcVlAd66Ql1evr6Q/Bwjpw5GJ/Ht58bZi5UYTvROfjXBKVBu+aSKGbURUiJMQKzN/VU3cVp0nnjJDukdu1gmQdS+rkpgtxH/TEZHaA0aaTUB0bNTludIElvYBMvOtWi4Lgwc73fdwgNhh48u5YrQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FFs83bRjNVAAgM4gEerPvEWfZqfRGLLxOz5Y5WWrDVDjR1zklQVjEnQ+U5Ed?=
 =?us-ascii?Q?2jq7GgPBuvxXZe8k/hDXIrCTFvO4W4FnM9oxOiZckFzbZcBu8ag5o6mtlHxM?=
 =?us-ascii?Q?7AgRWOGNZMSKkmlXADMPAKL4MiwfgYKeDSxfFtwXpgXAm0vfuM4oQED0UtsV?=
 =?us-ascii?Q?k+7ZEIa0JEYuHmbQ2KHx80+94g3dL6pJfZscPJgGThRKqUvKHvftvLkwwnAB?=
 =?us-ascii?Q?3CEj6LUheyxy5O292uJqpco+wfvNP3KRyJImuojgMpVWyib//K6gKhvbUht8?=
 =?us-ascii?Q?lkezXmTcwKOvVOTy9gjUEKk3yVISVueXh33shCTbBZXYJxwPCZBgLZ+ZOi3F?=
 =?us-ascii?Q?SufdOv/pV+s2G27wsoOD+p7H7t2OHxQEPGIOYEQrYYzmLZL2qUZn3wRw/O6N?=
 =?us-ascii?Q?3JNBT8deHnFmYGsNlk2TKLSLFRz9UxvYehAdLgOW19HItCtBy4Vl1RoHN5fF?=
 =?us-ascii?Q?oaLOGaiIEzGpU8WLiVfm1zKnLNHvoxWHl3Iev9ZYFlGo0vI2XUzZJzWXCAuu?=
 =?us-ascii?Q?IiN3oL6FCXwFjrJG6srIAqc4iwtoZ91D6ImTHser2vhvD8mOQCPkcQUKATq2?=
 =?us-ascii?Q?JBgseM37PWChjVjgTbSU7DLAezgCZtWiwVp/3F2r3as8uoZfw1QtXKWUCP3N?=
 =?us-ascii?Q?JFqMRhadexN0/sLaLxo31JDfLeg53A0Sf+tQU4czr/IZmsQgdL0pCkOBmUjd?=
 =?us-ascii?Q?wWNu4ktQk/PgFjty1fvnN3GunHvNLE5Qdepi9vZK5xcDedZnk2MpCDKdyQSA?=
 =?us-ascii?Q?FaWf7Ft4PB5kasTl5vPFhov/eJvOPGqsJjKnahWN0SXSnTmueq5nc4xrYhJa?=
 =?us-ascii?Q?Y9IPSZ0wLpjvQsvbN89WMrs1c7jMYQsUqeCypv2Jxa/ChkyJQl0czOuKfStz?=
 =?us-ascii?Q?t0hxq/Kvc6Pv4jN8ClOHwsKz7YLrM//jKDcZ/xdty6T9m1T6Z+LhW25gkUeO?=
 =?us-ascii?Q?KRH3vVY4Bj5qrdeIGI502/L4cPO2UCLDMjbnTJE4WkPub739JBFaZjBnYwj9?=
 =?us-ascii?Q?VUi0LFo/GrQjRLopP2UT5E4cCfpPzpmY2rLALk+2jJeZ9ahNomDOIzIzh7bD?=
 =?us-ascii?Q?dIrEbf+FbCqBgKmTi80JJcnH78BBlf0uLHAH6AdJLXSMtK4kUYrm7rGAR/V3?=
 =?us-ascii?Q?v3AeBu3ikWt1MAzhaZyoX18cqs0OT5fLL/bfbkmN69gwXDeuqbH6QOMY74Lg?=
 =?us-ascii?Q?TydRWvyjCnRJ8z8qAQ9GOav0E+3pbcU4EUPTsOguORcmaSaFJHAXmKvCU2bZ?=
 =?us-ascii?Q?3EIxL+Q3Qi1CEk1j6yAghHdRc7yl6Wd72Dh36b0KGIqtipxhI1EBpNYfFoiU?=
 =?us-ascii?Q?c6mkiaURBdtMsslVhsYAhPQvZszj+bkVCb4pXeNscwG/7Y53EQZQaDAiTtRO?=
 =?us-ascii?Q?jPYv2zUSnK7TN2yBybDQQ+ijUg6WyTzgRDdVDoMVvTXHEk3q+ZQ8vaL6R5mP?=
 =?us-ascii?Q?lM7xcTFS0jnFcwCBvM/t13QHMJ9ArSiRZBPQQQJi9nMgyiezB0b+9/u3gjH6?=
 =?us-ascii?Q?ISXRFs23QwXPWYaJw9ONg8wrykIwguuScLhLjlLFyjJQEnrmIQcqZRAMZ6QY?=
 =?us-ascii?Q?purm5mSjKvCX4i/9egdhNzQKfJpnuHcNRr89OinyRyInOBCnhreRbs5I8G4x?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 761d665f-cb8c-4cdd-9c2c-08dc3894b4d7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 19:37:32.3057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3v368ZdeeoSsFEA8VKwOw7yoe7tRH5xwuk7gxDBMJvk4nEa1FQNrPcX+v/EpNvWyI/kKveg1pgIt35sxwjzF5wahjitqd6jyeqDqRLYDd6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4528
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

On Wed, Feb 28, 2024 at 12:05:48AM +0530, Vodapalli, Ravi Kumar wrote:
> Hi,
> 
> Reviewed-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>

Applied.  Thanks for the patch and review.


Matt

> 
> On 2/21/2024 6:06 PM, Gustavo Sousa wrote:
> > Quoting Vodapalli, Ravi Kumar (2024-02-20 15:10:22-03:00)
> > > Hi Gustavo,
> > Hi!
> > 
> > > Below my inline comments
> > > 
> > > On 2/20/2024 11:31 PM, Gustavo Sousa wrote:
> > > > +cc Ravi.
> > > > 
> > > > Quoting Gustavo Sousa (2024-02-09 10:55:27-03:00)
> > > > > The test pipe-fbc-rte updates the primary mode parameters for each valid
> > > > > dynamic test case. Because of that, we might endup with invalid cached
> > > > > data due to differences between the initial state of prim_mode_params
> > > > > defined from the beginning of the test program and the possibly changed
> > > > > state after pipe-fbc-rte.
> > > > > 
> > > > > As an example, in a specific environment, the command
> > > > > 
> > > > >    ./build/tests/kms_frontbuffer_tracking \
> > > > >        --run-subtest pipe-fbc-rte,fbc-1p-primscrn-pri-indfb-draw-mmap-wc
> > > > > 
> > > > > would result in fbc-1p-primscrn-pri-indfb-draw-mmap-wc failing because
> > > > > it would try to read CRC from pipe B while the test was being actually
> > > > > done in pipe A.
> > > > > 
> > > > > Another potential issue worth noting is that even pipe-fbc-rte could
> > > > > similarly fail if the set of dynamic subtests spanned across multiple
> > > > > pipes.
> > > > > 
> > > > > Let's fix that by making sure that cached stuff that would depend on the
> > > > > primary mode parameters gets properly invalidated when prim_mode_params
> > > > > is the target of init_mode_params(). This should fix the issues
> > > > > mentioned above and also future-proof the code for any future test that
> > > > > would need to modify the prim_mode_params.
> > > > > 
> > > > > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> > > > > ---
> > > > > tests/intel/kms_frontbuffer_tracking.c | 13 +++++++++++++
> > > > > 1 file changed, 13 insertions(+)
> > > > > 
> > > > > diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
> > > > > index 912cca3f8d45..17f74990979e 100644
> > > > > --- a/tests/intel/kms_frontbuffer_tracking.c
> > > > > +++ b/tests/intel/kms_frontbuffer_tracking.c
> > > > > @@ -1484,6 +1484,7 @@ static drmModeModeInfo *connector_get_mode(igt_output_t *output)
> > > > > static void init_mode_params(struct modeset_params *params,
> > > > >                                igt_output_t *output, enum pipe pipe)
> > > > > {
> > > > > +        int i;
> > > can you rename variable i to cnt or any meaning full name to that the
> > > variable is used
> > IMO, cnt isn't very meaningful to what the variable is actually doing.
> > The variable i is simply being used to iterate over an array. As such, I
> > think the current variable name is suitable and conforms to a pattern
> > that is already being widely used on the code base:
> > 
> >      $ git grep '\<for\s*(\s*i\s*=\s*[^;]\+;\s*i\s*<\s*[^;]\+;\s*i++)' | wc -l
> >      1535
> > 
> > --
> > Gustavo Sousa
> > 
> > > > >           drmModeModeInfo *mode;
> > > > > 
> > > > >           igt_output_override_mode(output, NULL);
> > > > > @@ -1515,6 +1516,18 @@ static void init_mode_params(struct modeset_params *params,
> > > > >           params->sprite.w = 64;
> > > > >           params->sprite.h = 64;
> > > > > 
> > > > > +        /* If we endup changing the primary mode parameters, we need to
> > > > > +         * invalidate any existing cached stuff from a previous configuration. */
> > > > > +        if (params == &prim_mode_params) {
> > > > > +                if (pipe_crc) {
> > > > > +                        igt_pipe_crc_free(pipe_crc);
> > > > > +                        pipe_crc = NULL;
> > > > > +                }
> > > > > +
> > > > > +                for (i = 0; i < FORMAT_COUNT; i++)
> > > > > +                        blue_crcs[i].initialized = false;
> > > > > +        }
> > > > > +
> > > > >           free(mode);
> > > > > }
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> > > Thanks,
> > > Ravi kumar V
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
