Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD0FD1BDF2
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 20:49:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EAC10E0EC;
	Mon,  4 Nov 2024 20:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VBumFxve";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8A7810E0EC
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 20:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730753390; x=1762289390;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kkK3DfOjYOghcnodAZlcOBzksOaie/QlE3hH7Umz+dU=;
 b=VBumFxve25mngj1piSGfT21spHFq2gXfaut7bpzjowLVJFOHvaNWaIRL
 sMI03Z4lDkUsdZZ8jTULZKE4rY+zRca3N5sZwI8Ofxe+KjiOdmkZLLcNw
 yD2ZU4PIZDbokLdXQ6xbsAIvferk1YuLgsbLsae27SL5nv761T6v+K9Zv
 rJ5F6/ygbfNYObiqRCI0x2IrXEeSskWVQ+Q/l7sin6QKjbbS4OiMwqnh5
 fG/VtBNXH3TcthdU6fQ8T3nz+Y4eXsDIbD5hRQbhLIwmcobgiQlA84TJP
 Ggdv/I1DSo6trGOD8D/4YmiuF5aamKT2/0fKisLJNV8rW6mS0Xmm2oGyQ Q==;
X-CSE-ConnectionGUID: 5Yy+LFIbQWuLTk8AiO5mcw==
X-CSE-MsgGUID: a8aqdni0TgyCe6hYAWRvhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41845473"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="41845473"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 12:49:49 -0800
X-CSE-ConnectionGUID: TwJp3DsCTH+KMkaGuNcjuQ==
X-CSE-MsgGUID: jkyMsjSGSAaODKvHP0kcQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; d="scan'208";a="88590355"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 12:49:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 12:49:48 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 12:49:48 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 12:49:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3nZ8k1lVDmafB4Acim1SezqpJqaTrUcO9sU60U3pDAqWESfeMfNJPp9InaLRg5afQ0qf3bGm4QlTtWUXMgRzktsrotUkvUGF0ca/I6To5HnqFU7iA7AfaseJ4CV3PY0U4YIpXCpG3aoEDReKHabD0a8QNUXso3HgFMSagmU1qayQOuEONXR99ju0GKqAPFmEW2igHmDmAjK7OCv2CVVjUvjDGWch70ijHH5l7BGBQLrY79UwocxtO39YhvO7sZXb30788xeApX3WQfyKMVtqgC4RY1PCUbY47GSUrU4KNhc33q1vCBRgXeirwg9THjsvnQE3806X1NTfwIwkLkm/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/frztKTEeP+hzruDR7RUldvxh/cs64Pj/Mu9EYZBrmY=;
 b=V8TsmcJk5jWFdgsYTysYyOr+YH60ZEF3520DHLHQBckPHVBdG5EoG9UDKpO348oFIfrZRskxPDqj6KQ6tTFiNZuvS6mgQqoUkcVlhV5cBYQnX90AZXn61zYH+ukNqAmaWQ7+AhDwMjpi7v99qZ8CbWQo8ToG230rbA0cHQb7UKUmAtvYDDc1M2m3+bSuAR0GacdfV/LcUZbWGoRahHNm22It5o7pfpz7JGEGEgM0lQ7dOLiYFxa8By5YoiSql5x2f2s0bezhAQCQMqEi6OwOqaeNu80Layqt7HgsW6TCSaoCkELYc1ISkZC0ao+5IrA7weBcGbAjBCYsCydLKzxB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV2PR11MB5974.namprd11.prod.outlook.com (2603:10b6:408:14c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 20:49:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 20:49:45 +0000
Date: Mon, 4 Nov 2024 14:49:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/intel/perf_pmu: Migrate to unbind + unload
Message-ID: <vwuotvz3q2juoio576fdfbenrysl7awrmmyywg2tbev4xh7vfl@enz5kz5xd67j>
References: <20241023050502.3049664-1-lucas.demarchi@intel.com>
 <20241023050502.3049664-3-lucas.demarchi@intel.com>
 <ZykfkqmVRApXn/w2@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZykfkqmVRApXn/w2@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0049.namprd04.prod.outlook.com
 (2603:10b6:303:6a::24) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV2PR11MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d3a5ad-1ecf-4548-3667-08dcfd1236df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vhguzBHvJ4G0HIrMji7OJ7XUpdZV7miGgA2LWNg4swur0Desari2dOb7+a9A?=
 =?us-ascii?Q?ZoA1/o8+xTHddOzOWzc3y0MxzzjUinKwZri070TFW3lAZKDWyAnD38t0wNNy?=
 =?us-ascii?Q?cp34oFj7y/EmML2nhMQwAX21GEvyzHH+wYAdNtjyyYYrpVNdsCQPiHV5yYP7?=
 =?us-ascii?Q?BGFuw1aVIUhen526XQpIpi+5s/qSCTo+oL5KGJFVLB21Zu+LjpP0c3zBLunp?=
 =?us-ascii?Q?IYAXg2Hf/jiKTl7Hx5Z3qUd1kGauDJlDOOzO2ib7BHz8BdvC9z4miuz7VCUy?=
 =?us-ascii?Q?2nS/mOcPzPM+TJvl3Vlkm9GB0zFP9hBlpr8UoQDVusR1jnTiVCNy1FNBN7gu?=
 =?us-ascii?Q?T4MS7ojMKPT+Y+n7dSXvcPXII2kkmo5UsMbagXqE/DvvU1jCeXMHQUIqJT0/?=
 =?us-ascii?Q?nSNHWosOrYikAf/gUKEqokpTTmPQfAktIIBA+1CoIXABE3+zoqIu0Vvfunby?=
 =?us-ascii?Q?w/G3P8koTQLjqzXVOWUf3uYKJsbgsclYxfCFbachrn0PtSYvNnPwFf5mN/Ei?=
 =?us-ascii?Q?c+DPDrIUmMFCPY/N0+/2hB5ak1jEqp6i4FOmY8Q27k1E07ydvPATCMwJdYSk?=
 =?us-ascii?Q?dySF5BWWExo76B8eMFZvXw0Kd3aU9k1ibGadrEjZc8EBjFVjtvy2BJin3dE9?=
 =?us-ascii?Q?w6oM1znPkU9fB7HKGx04b/MJ/hC63Pk41zaLXRoisCOlW1CnT7BSkJIFHw82?=
 =?us-ascii?Q?eDIE4jg10zkGoQqK4NSQp0YTXBLwlrxIIR0cR6D+1ROZmO06Y4TzAj54AVXR?=
 =?us-ascii?Q?9s/KTBC82fTKyQV6VmNcyBSoWIYqJFEMc+jnntmH76ag0+bgc73BKU+omuvA?=
 =?us-ascii?Q?WhmWCthua38ZPJ+6rD3qppRfkaQDCCjk4CRQqyi7HjukAyuHP8c/xfdIQa+A?=
 =?us-ascii?Q?3Sj6Q0H7HztBGP1SU9qIA1EhiuL6ziTKg0Qfg3epghYNOqMwZ/vwjHg/7jPr?=
 =?us-ascii?Q?Wjj7+SQXdSVWVB8yTQnXL7/7EEfYi0PZ6YZQ6/RTsLpr26zFZDo9z5YS3Q8c?=
 =?us-ascii?Q?esvZTIbZGkbrCirLOl/d7HMSVtJfMae9qS8uEywHBG0BUP6Foo/N6txhpEEz?=
 =?us-ascii?Q?T86Xrk85Nyr0j3ibK2rct/ZqmZPM+JacWWURyNt+Ho745phQOKEtSXIopgB2?=
 =?us-ascii?Q?uLIVeWl6MGhABJpLZQekqK2DN0vhsRqH+sziNajlfNAoCNbosI2YsKKZXU4w?=
 =?us-ascii?Q?wf8qGT3tMd89kYwAFBCPZl2GuNpqWP+AvtPJ/jpgJ7XEwmqZ7TbYZ4QnIISz?=
 =?us-ascii?Q?mHjVl5tiGT+64NnSip6DbHHzzOXVjgh2bjEz5WT9yfF/VN0TrOgFnjpkdnGZ?=
 =?us-ascii?Q?ogE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YRU5pirfIvi9szqm8tJCTXhUJUbiC4bOfaFN7w5XGjwqSFYADgCbFtM17Eo4?=
 =?us-ascii?Q?AuvQCJKtz8YmfSd//Cljgz2IwTTOD4Ly26s7dZKIMoZ76gRdUBJMED+yIWMO?=
 =?us-ascii?Q?tWImfFq/9osjMN3eo/UbZsrWF/rfoAiQQ3hfV9i7WAo+yFYBVge+JN4w94S0?=
 =?us-ascii?Q?rFnKstFSZaAk+xxGejWJkSKHUsp+wK05KV9l0W4pyY5sx7WvDzfYt/cTZDTw?=
 =?us-ascii?Q?ohqAA935iOxn4XSTVL5SDE6P6qv07BhXMcioTRqPIz+DxyoAJgYp/jV7Wquf?=
 =?us-ascii?Q?OjM6Fjow4EhTzWEbBbFCIZHatmAIhWQGdsAW+2FQvcETIi/XFRc1b5N50J3A?=
 =?us-ascii?Q?cEEnJ1L6LIuJ0zSpLgRZE9jH9+W2r4wl+ZrU3Dqr/p6mCwXTRSIJkTr/0bNr?=
 =?us-ascii?Q?qmxJofwccaEqKNg6vQOr9Ee0RYEXIKZtUw4xm59E4klvwaCsGx2XGqyJ057Z?=
 =?us-ascii?Q?1cEegBRZMHDauSTwn80ugEXckqRcTOpAbIf5MvSTzNTDpndL4hpH4DrsCE+M?=
 =?us-ascii?Q?XYggxKThuNRlS5Q5YAOmldFm+5f4e0FtuAYsXsrAmpURedQT2qjEOpVaL/CI?=
 =?us-ascii?Q?B0ONRETWTpFdrWOL/5kmwMiCoXsdY5QGKkgrozeRPGe04NfBbcNNp2GMI4SL?=
 =?us-ascii?Q?2zSA4WAjzIwYtqlreDEnEy73NctGxfa0KG0oOn+5OeBCC2yaR0cy6kC+rNqs?=
 =?us-ascii?Q?ZKkk589uS5kLqOj7L4CrVyV5XSvm8pGDxgFOQl4d6U+dHQQUXYf0uM+vi5PT?=
 =?us-ascii?Q?mW7UzQE5l37sBf+I7Fp61t6jl6AlrF3mrm1VSMUIeHcc457LEdXn0I8uE3DP?=
 =?us-ascii?Q?Qwwjx3yEPTLLPHRFuG5/Plo2CeHILDzJUF87C4k/5bKmtQ9ibqjg47zf5bri?=
 =?us-ascii?Q?OWCi0pxbEbmXpHQ/3m1BsFctVL3FYS2Stgj4Qo8ynHVCzzRot1X8vaBjE0RP?=
 =?us-ascii?Q?2YFzFuT+wt67oiswbX1c0Ew5pF5ImwViXq4DzepSoPyS9QEmgFOF89tZTETO?=
 =?us-ascii?Q?xHzC3YGFLI87yekMy1BR7RGK9JJICPs+VyrdEBvAqs9unF8zOEQI9Bm288eR?=
 =?us-ascii?Q?1bbAZJ8O084je4k0EMiLvczC808fuXsRgab+kFiZ/2sDX+GGiNE9DDUmZ0rZ?=
 =?us-ascii?Q?P6MKIUTagNfZNosO2oWGt1xbJrgyaS8STFutr4CH7n9q34EXu5VRPFR2lfnm?=
 =?us-ascii?Q?SMBeGdpslpeeY/SRzELxzSOSnpBRSfFg17FL3sGJkPqRkjT3Ujx7qIOYjA/6?=
 =?us-ascii?Q?gyaODYA6amKU1mft5/uYMmeQbi2xHpkKlryds5HZypl7yNuiwr0YyDKIpSSM?=
 =?us-ascii?Q?oyPmQH96/PheNK2FEteZSsf7k4wAvYOeOxDHPBxQNKDtmxSpm7U1pf2z6tfH?=
 =?us-ascii?Q?aqwD5Bm76RvErajuj32j/KqVMJB2T5X6T68rjKpd2laJJRCovD8xWQ2jDrBC?=
 =?us-ascii?Q?KIdZMua5icRxkjkm/kAO4VzRhIl0w4Uw73MsDtSQwPYmgd0aY+gPY1rZOHMw?=
 =?us-ascii?Q?fo6XRVPu7/HFqjPw5p3Rvhp1vr/M38X89h6JEMQR+uQpn0EsPqknQLEhXCs+?=
 =?us-ascii?Q?vFsJR9tNLA2pHrgFRKEZc5Sb4q69JQMW/jw5dVdcbVMSJCg4jZ6ZLuvJMbEs?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d3a5ad-1ecf-4548-3667-08dcfd1236df
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 20:49:45.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fUXY+IwnqjXEFRDp5UqHYgRLLAz/6VkGM1zeN8eJsSf5MKr//MSmutpgR75c1FGk0033fE5M1swfhSd/hE9UAfSrjil6ujaL6fadge6KIcY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5974
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

On Mon, Nov 04, 2024 at 11:25:06AM -0800, Umesh Nerlige Ramappa wrote:
>On Tue, Oct 22, 2024 at 10:05:02PM -0700, Lucas De Marchi wrote:
>>There isn't much point in testing we can't remove the module directly
>>after removing *some* known dependencies. The point in this test is to
>>make sure that if the HW vanishes, driver still behaves. That is
>>currently not true, as it will cause perf to explode.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>LGTM,
>
>Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

I'm actually thinking about splitting this patch. See below.

>
>Thanks,
>Umesh
>>---
>>tests/intel/perf_pmu.c | 22 ++++++++++++----------
>>1 file changed, 12 insertions(+), 10 deletions(-)
>>
>>diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>>index bfa2d501a..6eb4f09d1 100644
>>--- a/tests/intel/perf_pmu.c
>>+++ b/tests/intel/perf_pmu.c
>>@@ -2282,7 +2282,6 @@ static void test_unload(unsigned int num_engines)
>>		int fd[4 + num_engines * 3], i;
>>		uint64_t *buf;
>>		int count = 0, ret;
>>-		char *who = NULL;
>>		int i915;
>>
>>		i915 = __drm_open_driver(DRIVER_INTEL);
>>@@ -2337,23 +2336,26 @@ static void test_unload(unsigned int num_engines)
>>
>>		igt_debug("Read %d events from perf and trial unload\n", count);
>>		pmu_read_multi(fd[0], count, buf);
>>-		ret = __igt_i915_driver_unload(&who);

I think I will drop this part first, so I can remove the
__igt_i915_driver_unload() and finish migrating i915 to unbind + unload.

Then when the kernel is fixed (which will probably happen on 6.13 or
6.14) we can think about adding back the additions below for unbind
while perf is open. Thoughts?

Lucas De Marchi
