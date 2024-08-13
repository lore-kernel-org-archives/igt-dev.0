Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4417AC3DA7F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Aug 2024 03:10:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7210E1AD;
	Tue, 13 Aug 2024 03:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bN+WQDKm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E827D10E1F6
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Aug 2024 03:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723518628; x=1755054628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=e415GJpK/Gb8q9Rp83arh/lk+sltLWj3ozA6uAnEj/4=;
 b=bN+WQDKmWX99uoRn2NFEYN6gQ7Ro92FuNMo7FdrCHbpDUJmmnDaRvHnq
 tlY2elcPisoZ7EJgVXkewpbp/NvrPqQkzjM0h3MWybPpdbHEXPRInb6j3
 f6cAnsq2yM6NTM2mIbOsS2oSLY6LKxvV0+YSE5eJ8ELx3cElhcTenckRf
 g0PBR12uO+KXxFFLMm835ymn9gSa1olI1m43JHkMNOxq2ERytCyzL6G9T
 Cs6nGF7OO0e7IPhCMh4qSxCDiV93gDgIq/tM+VPCkmfcNP7cQR+GqzbQ6
 72cGOEDh/fGjZ5rgTYSZetC3pN3jSRbX6YqbUcCfOPDgqM0tcHISWz86G A==;
X-CSE-ConnectionGUID: 0RCoIHxYTHWjuoK/mkRA7w==
X-CSE-MsgGUID: L0TqljfFRkiirg8uFLoPEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32279408"
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="32279408"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 20:10:21 -0700
X-CSE-ConnectionGUID: vEuLOELxSzCIfokFezA+OA==
X-CSE-MsgGUID: I3w9iDV9S6qd8bqCM0jYqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,285,1716274800"; d="scan'208";a="58163713"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 20:10:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 20:10:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 20:09:59 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 20:09:59 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 20:09:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Za9k4UvUceGINOA76vlYbgkcBElwcn1Ji03G6ep0BXjb+Ih6S33GUL7KFQVLOTQUaPUtBrLtDrBb5rCz2KA/sFZyFeAKaBCvSIYhukpk/FN9pfOw9DP3OqWG+ZLCYGqGFEgr5Xht1Z4fxM82sEJBGkZIHHVPgZCmRGNwbcTwmuYjIdXfMsBThpnE/63VARfWDJh/nuxoucXmfxozo9kBKy9p8UFAkmsMZdZdGACVoccu6syL/ckIr12aDcKuC9AexPO3aeY/WBR6x8Fz7m23RzIPoneIi2uJDoBmyAARrrVU58pZxPUt3NoRcHC4r+BR8Ztm5O5hfIDAaIOeUPR0NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adaEwN0/ndThMuNTWoBwSelSPtuJaCeh7CqI9istN2A=;
 b=VxKmxtzbtrLaKnZ9JKNmo/G8syPmzvjhgPMm0mnIvfSEOX0XLlRz6gHp1/TNdT7wVzpCseYawybCTFehjX+NdWIsJUMmuAy9Oa61jNHlmfelF80/8cUel8jEIa0vrgz32Xq7inyopMQW1K0c6Ktu+FKhlc+C/T4InmaRVdKJsrlfO7O01GEynCE1zVLpNJ/PwLwv7NByVSw6Zrz2VB8vaC7T5rDDi2gCWDtfjCMazDcKuKbFizCk4VGzHLnXGeW9453wxojZBBmih3hBtmd7P+XjBFDWcLDZFl9l3ZfI9dA8opv76e7WPM3lIB2lpvpdDk/h8Xqoe+YeDZEt6M8XBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5166.namprd11.prod.outlook.com (2603:10b6:a03:2d8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 13 Aug
 2024 03:09:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Tue, 13 Aug 2024
 03:09:57 +0000
Date: Mon, 12 Aug 2024 22:09:54 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_module_load: Rename enable_display
 module param
Message-ID: <f2jd52lg3ph77s7wxzw4aeegggfecibzvuvkzqaa2xugckke7d@vubaglzwdj4z>
References: <20240809172936.2718506-1-lucas.demarchi@intel.com>
 <20240812231034.GH5774@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240812231034.GH5774@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0252.namprd04.prod.outlook.com
 (2603:10b6:303:88::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5166:EE_
X-MS-Office365-Filtering-Correlation-Id: adb7bdc4-7a2f-4e1f-1413-08dcbb456967
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WJbLxniffFGYGqq2t+tHpsTJW4LBeOMQZQwT99Im6K/7oSTC6IKe0U1CbixM?=
 =?us-ascii?Q?LzJEZ5yIcSLTs0/YinvytPWxAFJEZCtIEfL060cfB2EM7d/YGGaYLIdo29OA?=
 =?us-ascii?Q?l9MTQACMuIV+nJiDhw+LNEWKiMarb5g3RuivVh8kTnwFk5faCVSImrJd+QqN?=
 =?us-ascii?Q?3n//GRHx5JdPkz3PB3HpZ9+VgtXuIcGN14SBnLgT76ICb8hYk9w/TkzovG1V?=
 =?us-ascii?Q?P+GykZNsV/+fsq/B8DEwcUFZMNzJGlukI72UfKpSDjNseKX54JToc5NfUyTv?=
 =?us-ascii?Q?uJ4VRdmgnOIeSd97J4PXT9mutz98Lf9x6Pe/pw9XkBxPmYTHi2VAciQ0Vzf8?=
 =?us-ascii?Q?0l5EZjDgL2Af+zivv98cXFeg1bmojGVb9f+02loyyW8MpN2/qVJNeubxfda0?=
 =?us-ascii?Q?D2g44sGPUrcgJ/CMWDxG3WhGJttVeSwdrK9IJU3Ip6X19DN+xh1HoIbva8kk?=
 =?us-ascii?Q?VrZwatyP5J9XYkNYKO6eMMHgNeN/OO60F9VBtg52DEJkPGHTLwu7boDO51Nf?=
 =?us-ascii?Q?kJQv0yxPViVaMnFrrTUjyhM5gNe9iN4hiA2ct0xxsPRzblO2gcBGhFUMXzES?=
 =?us-ascii?Q?iyDhjTbc7grOE1VoewdXOgdlRojmw/H0XZPQY9G2XEmpEZ1ouQDLtth9q9QV?=
 =?us-ascii?Q?vc7yK5V7JgOH2NXgkTll1Cse3ZvAt+c7kPCCCMs9h9eqEaM9tZ85A8zfPVcy?=
 =?us-ascii?Q?/7ih4wL5j9qHZXBrI0qmwicMsD9/OHtSVTMAteN0Syz3jcUjs37tUNnnGp1o?=
 =?us-ascii?Q?imXM8GaV0sk+pzGw03XC7VUscz940C2UReJ+i42IQiqt2JCTQVqqkcuLOLVP?=
 =?us-ascii?Q?8xseonSLwMJAiFUIg4lq2Olmj73M1yoiJc7B9MX2LJSTgRbD6nLcsF9F9I0M?=
 =?us-ascii?Q?YpgekV0qDXFp619+ZdTHw0Xz3t6OqYWe6vSHSNNnjaZHTTNMQNYZE1N+XcqS?=
 =?us-ascii?Q?q1reFq0il8k4Tt5K0fpLfDPLy7WyFvfhyIEb6ygkOSFGVRLEFxJLfxyJgn9x?=
 =?us-ascii?Q?8uShWeT5GN2Tep//VZqKRP/WSNN5lsYR7LOgaaqeKLvD3AtUbsytGKze+L5r?=
 =?us-ascii?Q?gQ3S89+I5BHczNwrvEUaQ1wX4LugV8tf3NwIxlKj/ueXKig08KckOI2YlyV3?=
 =?us-ascii?Q?/K+2Z2yY/FR/ekc4w9EDTLnbfzzKZwwKRByyXvNLCXoMXY4kb3i6FIDtMakV?=
 =?us-ascii?Q?UmHXYbbLz6KdSy4dy2k7nGnKWh5TBwjtT0PHEgmErTUokfgZjsmmVv0GMMi3?=
 =?us-ascii?Q?OH70v64/O9xLhYDeMvj16TPg12xNW2fI4pnzMhAB8vcLvWeKCAyc3SVHeADP?=
 =?us-ascii?Q?tVg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?T+HRIl3RUqSuCGa99lF/wRcuosnWFgJaWJ0C90xTpo+7a7luRs0EaWgKnXTc?=
 =?us-ascii?Q?k3D+eGcgJ327pn4gFybPezqSHWW0tczL4pJZt3nMn+JTT5ke4LUaOMGXrJlK?=
 =?us-ascii?Q?Fp6OIVvfVKN30318Bqv4kQuHi2Ec9VIUJ37ZeJAtgDP1MQjc/uW63JSnQ8/8?=
 =?us-ascii?Q?7rotBXB1bkvOBGiq35KdmO+fAQ9Jul5186afbgD96qDeN8q7X3ln0hONilWY?=
 =?us-ascii?Q?BBiB+/jEbDApE5q5iR5zDNyBmPbxbsFFOD4HiXkToZoqt6FjHPNLHQmnO7xn?=
 =?us-ascii?Q?HGrD3tXsGvfsAPImfIcz0OEW+6ypbBv4yKbdUsyrqsEzx5O4NO79g3Onsb+7?=
 =?us-ascii?Q?uB0ejc9ZaPEwuaacck4ewyvqtVcqPLOIGjmy4LIFhVDg7vTGxsbxyZWygH9d?=
 =?us-ascii?Q?n0MrS1DqUp0aSxbQwOsyi3i/3HHdQrDcJn/sos8IFQaq7auiZ+bGT4BUFmgi?=
 =?us-ascii?Q?HXGy9qfZaxL6xRLoXguwh+ccnewnE9ZU9yQbvNOQmFG/BUoanfPY4lWMa2Pf?=
 =?us-ascii?Q?5laLjQc4fjfFEcR9LJ4b41NBOMAz6kce4Ua/cGbQimtf0FfWS1zgmN1M7+RZ?=
 =?us-ascii?Q?i18WpczZv+/dz2KnPXAH5yh7EsPFzPbY6FU4/CzPHICDYs79ccRnFOXd+CnL?=
 =?us-ascii?Q?5Ot8m8ef5WXfoekzXZzpcGc8LL0nqW1RLk7IZ/MtzlACx2ajkEecinH4DMkt?=
 =?us-ascii?Q?qLvasKu4nUv15XzF48RvXcpg14+B38ER123jInJ5ekUPfGStLYAU7c1uj3CX?=
 =?us-ascii?Q?5q8ZHjsycnAoixFCuLFyHVS1Qv4rQvmmPW+3+I2e93R0PtMVWBq+ulPkckN4?=
 =?us-ascii?Q?rpYMaFWWEc1UefWZMicdYX+ZyQWz4lxqMKW90gRWTsl5ibCqGesPe3uurB11?=
 =?us-ascii?Q?qJ+S5FRUq3KmHDErB0ID92Lajt417WFn86n7Xq+7wxBV+SE+RR8h2ZqM2PNI?=
 =?us-ascii?Q?H6tAMo/kH3z28hJTQlKqAZCJ0pj/nwK8JN3D2XrC7Qa7jAI+ahoWB3HnK3gr?=
 =?us-ascii?Q?xpgi27eXXwCfi8ggyklSNi+f4JaI2kewDrfMpi8PETHwmQWurUovhGNhnkBR?=
 =?us-ascii?Q?01e0PlVtvb89o3yF5GkutyXb5yw0ub3P2ucoCtMrx5Ti11mzQ5rLMW3CTsaa?=
 =?us-ascii?Q?J68/eGfco/8lH+xbnhjXp++el8QuYbMZ+rokhSbJO4pi/FQT4e2YICQtGquC?=
 =?us-ascii?Q?MuNU9TN5bmRYwZKF/048aLFJueXAG+MaPVdNra9qNuMSf17kIOVbjSAKASQu?=
 =?us-ascii?Q?P+1/E+DHxs4KFN7bZS9RDQ3IzwUwMliVUsW0fdiR7RpYEWES6WSsJ+7Aekli?=
 =?us-ascii?Q?WxcxB04FwH3DokVKpWszD5Er/8XQYs0+jGOvnkBCIRR9No5QHVppvxtClYzR?=
 =?us-ascii?Q?oFqZJ6dVf4cnKAS+6PtaHhBBhqtxYytD4emY3GPz0F1ELfwC9miP4nLSJwjy?=
 =?us-ascii?Q?YiLCQ40gPMhYTDQUA/xrgSjWeyFhwgN+PN/KPh5Pd6kAEoR84od3+s8ZgxC0?=
 =?us-ascii?Q?cMs2d4F/9SOoGI1Z41t3UAry1oqTEd8K5EZsCGGZ5BV5sxaXfo0diMZPmdd5?=
 =?us-ascii?Q?GObrdFxp9osPzHWMMjrFQg1hCKuZLyKBAjz61LCAdQpuDNDoRFIuUJ8mQH7/?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adb7bdc4-7a2f-4e1f-1413-08dcbb456967
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2024 03:09:57.6791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mRxCRGS55cMwtBPSZBTY4D0Ot85MadgCYwI6TtPZG4bJ7Q++Z1w7ov+51dp6L9bB8/Ak/9UgJ6IiysBxerBi5uPAFEb4E7VYX3AHayFnAwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5166
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

On Mon, Aug 12, 2024 at 04:10:34PM GMT, Matt Roper wrote:
>On Fri, Aug 09, 2024 at 10:27:28AM -0700, Lucas De Marchi wrote:
>> enable_display is being renamed in the kernel since it's ambiguous:
>> https://lore.kernel.org/all/20240808180154.2495634-1-lucas.demarchi@intel.com/
>>
>> Prepare for that renaming it in igt.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>
>> After doing this I'm wondering if it would break anything in CI if
>> either
>>
>> a) igt started passing both for some time
>> b) the kernel to have one additional enable_display module param,
>>    documented as deprecated,  that we keep for a couple of releases
>
>I don't see a pressing need for either of these if we get CI's kernel
>and IGT updated together.  But between the two, (a) sounds better to me
>than (b) if we want to allow mismatched versions for a while.

updating both atomically is not possible, however things won't really
break if we merge the kernel and later igt... it will just misbehave on
this single subtest (it will test with rather than without display).

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks, I will push this after the kernel patch.

Lucas De Marchi

>
>>
>>
>>  tests/intel/xe_module_load.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/intel/xe_module_load.c b/tests/intel/xe_module_load.c
>> index 0856a57c8..30259fc26 100644
>> --- a/tests/intel/xe_module_load.c
>> +++ b/tests/intel/xe_module_load.c
>> @@ -112,7 +112,7 @@ static const char * const unwanted_drivers[] = {
>>   * Description: Reload the Xe driver
>>   *
>>   * SUBTEST: reload-no-display
>> - * Description: Reload the Xe driver passing ``enable_display=0`` parameter
>> + * Description: Reload the Xe driver passing ``probe_display=0`` parameter
>>   *
>>   * SUBTEST: many-reload
>>   * Description: Reload the Xe driver many times
>> @@ -145,7 +145,7 @@ igt_main
>>
>>  	igt_subtest("reload-no-display") {
>>  		igt_xe_driver_unload();
>> -		load_and_check_xe("enable_display=0");
>> +		load_and_check_xe("probe_display=0");
>>  		igt_xe_driver_unload();
>>  	}
>>
>> --
>> 2.43.0
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
