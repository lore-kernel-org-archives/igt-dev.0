Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ADEC48BC3
	for <igt-dev@archiver.kernel.org>; Wed, 14 Feb 2024 20:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A7BC10E246;
	Wed, 14 Feb 2024 20:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ARWcyGeD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4316210E1D2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2024 20:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707942138; x=1739478138;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=ycu8ltSTnvk9HULbuCbIJ10WMQQbnhcpSr6geLr9Y/g=;
 b=ARWcyGeDVfpHblvyVrmqKkHkPJ9RKINDURplZCMJ1FeAzOrW4kNkWrkP
 1jH6q9UoAUJR0zaxciyIw2NGsQNHqW0KevbrWUOCavvZPsQTkKbsi917w
 CF3fWiT2copZQ3vbOQYfJWSHhENZ2PVYDmaCygc7Xx/eUBrQyBNOU+4pE
 nubovGcnxrmkoE0TBp4rpdAI/RWzc3hAkIXmr+1Mljg9SZ6MZs+YgIbsE
 ZobNppfOssF4XewP2esu3q6SDFFrIkHK+YkCh7hNmwphNEOGT13Ul+THo
 9ZJdBZDx74BqVREX75WvbvV9Cmz4HNUlnuXhQOgj21djgJjbTtZunO0uP Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="12556720"
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; d="scan'208";a="12556720"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 12:22:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,160,1705392000"; 
   d="scan'208";a="7914387"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2024 12:22:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 12:22:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 14 Feb 2024 12:22:15 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 14 Feb 2024 12:22:15 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 14 Feb 2024 12:22:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MkOMPKiGw1qkicxSQ24Q1wAkZejQq+RxPsxr+FuiGXTxO+fjtDyIA5+MHJHC5Izaq9UtODy3GkgGEAwnK8rrXOkURrhXjH8nVfT/VkRoCXomxCEq61bW5ySJAxCE7lJCyRtSL8Bcyd85AtY7SjmtpYGIusFvGuFOiYEwLrf3YJH9yxfd48QUPgDDeIHVMiYAszmPproTTgjUN0aBrRXR+eVAriSeXoPxiAun/EL9fT8q0cIvEdxnbJaIjW45ascOGywXTIgQ2dwRXcxXAGSPdXsnnWMhZCAq3XcUox1YVnqqkbnWokcqhisljhVsInyE/Z9QVvKNl/4kQ4gZud6Pag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3nB3U7axi/ah9ydb8kT1h4A8UlE+pPS5myWWZCA95M=;
 b=mEncDcLcFOH2gypI6BncmakPckIGAimigsc6BioUAttGDcbe6RAvQqJF7H1IkGVkgUrUVbDvzNAX1O+0ssdoFkHqF8kKpKDWSf04WMGm/vVK+0aqZlLd7oFmUdKyUUGJGaGMskMEkorABlZiVqe7t90p4mx6EJDz/Aa1Cl0xzIKJbTAi05AK1FwAwy/kikJrG234izE3EDmg26tJhtXAXbNIuKnYogMC3Yv8UBvh0HGdgQi1lsPZpnUg+Y3KVlmzzmpQRoUT1Ev9IC580EG2BnfEjyhVmXzHwXuTGjvzDX18N22JD909dtSc/STZYOdsq8Zt7PNAlaNDOD/elw9bHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB6870.namprd11.prod.outlook.com (2603:10b6:806:2b4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Wed, 14 Feb
 2024 20:22:12 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::152d:16f5:ab9a:7c6e%7]) with mapi id 15.20.7292.027; Wed, 14 Feb 2024
 20:22:12 +0000
Date: Wed, 14 Feb 2024 12:22:10 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH i-g-t] i915/pmu: Add pmu tests to catch unbind cleanup
 issues
Message-ID: <Zc0g8lsBV6fDHNao@unerlige-ril>
References: <20240213062948.32735-1-umesh.nerlige.ramappa@intel.com>
 <20240214150803.pxmnzxltdpazdzak@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240214150803.pxmnzxltdpazdzak@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: BYAPR07CA0037.namprd07.prod.outlook.com
 (2603:10b6:a03:60::14) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f18b476-e857-4484-a5fa-08dc2d9aa063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /zENdex/0GYHkzdGUreR/iRomeuYn0p7elwFXh+2ZULU4Jr3J1uPacagsAlfge0ovKFiiLN7ulEuNAz08IJOrOUSGf6JDqqvl0uuey018r1LrKIXjTY2fHCMpptl8mhnBUCy6xxVvPNJOJMoLSyK/lwqaGbtQfZ9T4e/X8CR4KRz+GP15uzsp+J6PYbANgiIdyxu7fsgz1ODPbNmro4AiLz0kNz2JTukIaSckA75jGMBNbwviEyjwlGAke0YHBKckqFcYasqLlGH0hUs8cNSdsUHkvLyynSlb5Sj+4iHvUIr9oRXZaOgCbEz/UH7xx8MerCKecpHFV5tMnlKz+qLyXUi0DdNa1F20LV4hXWZ8IFi45dgqyswExG7G6oZjRwgtMqu4WIi18/tZTCYmW7/4e3/ndVxOtoU/kxlsDRorday4xuWEeRzO0+14lIljevmCuyI9MQaJN55b0KgBiQiIEuXFKjIFQDAGaZjWuPrGvnCxT+Xl/2m+sussi1xoJtDBslsJ8A6hTdAF7fFtaP8VB5S/2b+0LWH49BKUihF+auAz0TBOkxGVUeUHiGlvwNF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(366004)(376002)(136003)(346002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(8936002)(5660300002)(33716001)(110136005)(2906002)(83380400001)(26005)(38100700002)(86362001)(6506007)(66946007)(66476007)(316002)(82960400001)(66556008)(9686003)(6512007)(478600001)(6486002)(41300700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0hOMExGb2F0NER6OURtbW1vKzB2TlZ2SElqVmRTSzEyTHdZSlcwTU1tc21C?=
 =?utf-8?B?YkwwaXFnUTNRdEN5YUo2aVFQeXBCRUVhQ1lhdlBzRTllUXpnVkRRMUFySUt1?=
 =?utf-8?B?aVljL256Mm5lTXdtVEVtc3lUWk9JZGZoWFdmU3NNU0F6eDdnTzJ5YVREMUdi?=
 =?utf-8?B?cWdlSVIvS1htSVhNcUZDelJncXRERWZoZkl5eVZOSFE4NitlVnAyK3luRTYy?=
 =?utf-8?B?R0dnZlpVbSsxemFhQkVCY3dlbi9iSkpiK1EwRkZIVTYwMmZLbEFWTUd0NDZL?=
 =?utf-8?B?Ym81SGJyVVhwd3o4aWNQbTcwWjF0M21qUW1GYnVNVU9LV0c2Y29jcjhnYnJn?=
 =?utf-8?B?VHMxK1lZQ1JjbTJrcDBuVlk3VjJ2K09Sb1dMZDBTZnZFbHRMSzVUMTNuOFVB?=
 =?utf-8?B?NUl0ZmQzMFZ1VUwyNU44am14RisxR0xzc252MmpxWjViWDVZbW9TR01GQWRk?=
 =?utf-8?B?U2d4QmVpTERic3VteDRXNDNJTjRmY0hFTjJ4YUR4SmxvTndpYlJ2b0dlZGd5?=
 =?utf-8?B?T0lGWWRWb01vSlVTQVBKcFErTXVPeHJVOWJXbkh2VGRHbXRySU4xMDhZNW9Z?=
 =?utf-8?B?WkVXTDBuVXVGZjFpbFFIVUNnNlpiK3RYUGJWWGNaZmFwSnk4ZU0zd1Z1RHJu?=
 =?utf-8?B?Q3NsWERuV3RiWHcrVVVKUEsxbEVMK21jU0J2LytlaENoNDZRcmN6SWlIbm4y?=
 =?utf-8?B?ZEhMS2F2OFpmWmdEWWt5TVVKQTZZSG5sbDBXeGxmR3E0R3lwekpUQXp1K1lD?=
 =?utf-8?B?ckVtTDliVTk2UElLRFRxd2VGSHB3NFJrY0J3bVpKRGliQVFZYlBjYlViSi9u?=
 =?utf-8?B?SnBHWlB1NHNtRkVodXA3aExDWjAwUkZwVUJiOEJROHRvWUtDOHdybmF5U3pU?=
 =?utf-8?B?YVBmcGZ1OXd2RlRIOFd3VDBSc0tGcVlKdFZpSjQ0YU1NNkFNUmNZd2N2S2E1?=
 =?utf-8?B?RFVTbDFWM3RVNFc4ODVPM3ZOSUJudVR6REpxN1B6WWtoc29yRTM3ZzFNRVRx?=
 =?utf-8?B?cXNzaFh6OFZzS1g2Z1pvenZ4M2hKU1ovUWVsdEc5QWRaV0k2SHpDci9BWTEy?=
 =?utf-8?B?WjM5THBWdG9HYVVIYjVCbnBUSEhaRGJaVnFrR25aMS9oOFJvTXB2Qlhad0dR?=
 =?utf-8?B?MXdFNWJzVUt3ZVVSS09WTXVBKzNBSDRmZjU2MW9IQjdJRHV4QXIzb0pPQ0ty?=
 =?utf-8?B?V3hrTUpkanVtSjRIaWQvZmtUWmJDUzhYMDRUNE9DQTZ0M0lvZXFUWmIxOGZK?=
 =?utf-8?B?cjU0RFlHdnhlRE9VOTJNdUgwK0I1MWx4ajIyOEphcFY4bEdkaGZTOTFrekoy?=
 =?utf-8?B?RzB6NlBvTTVHZmE4c2laTEFEVW53M1FIT0hQK2VqMWt1aDN6bzlzOE5jbldF?=
 =?utf-8?B?eFRNdFVGN1dXZUpFMTd0bnVsNUhSemNaUFZuQTU3Sk5na0JoZlFMZEVKbk42?=
 =?utf-8?B?QkV6bFlnNEROc2pvVEVKQk0zejZHNEJNOGVTdDB5bi9IQytPNzNaOEQzcjRG?=
 =?utf-8?B?NWNPOTR6NWxYOHJadE5jQUtyZDBFVEdVc1RhMXY4dXQvWHFTQTIydUQ2eTJi?=
 =?utf-8?B?VEJSN1BPcSs2NC91RjdVWCtFckhpenl2UTJsemlMS0FhR0xuZkVIUVl2ZkJ3?=
 =?utf-8?B?OE1CWG1yUlBYSDY3emljUmxzRERRVGNXcHJVRnBHdFMwZW9IWHEvdVRTd2dy?=
 =?utf-8?B?TFhsbk5YaHhVZUdmTGZDNlJ3YkhkQml5VnRDWEFpVUhpNkowMmxaWWZCS1Fv?=
 =?utf-8?B?TmxwWi8zZkpYZHBXREc2S092V0ZlbUR5bGJHdjhkRHQ3STdWZ0dKbWx0V0Jm?=
 =?utf-8?B?eUlKNlcwV09Mamxkc08xeXkyaVZ1ZzBOZnhXZXBtOFBIT2R1dURIU25QNHI2?=
 =?utf-8?B?dEVib1VZUnh1UkM0NHVydU1ON0pZMitnZ2dwU2djVjdBcDdHSmw0amhQWm4v?=
 =?utf-8?B?UWE4NmhRay9HM05DNXF2S2hoUkpHQkVIRDJ6cFBCdzA2WXVPa0VoN3FuSjVR?=
 =?utf-8?B?bSsrbHQ2ekZGS3JpbmluaGk0c09JSDNjOGtiOW9TQ1piVUh5a2NRNE05bjFV?=
 =?utf-8?B?U1Y0Q2lsTEJ5Y1J0N2wyWTUvb2R6MDhhd21Ybnc1SlZPRWphTVdEMHJzWktx?=
 =?utf-8?B?c20wZGdEeXJQZTUvRDdHcGcydklyeTBMK1Brd3JUUTZTZzVsVHd2ZWRGbm53?=
 =?utf-8?Q?bpLjBj34H0LGY8rvgUi/QjI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f18b476-e857-4484-a5fa-08dc2d9aa063
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 20:22:12.0321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fm+QMbQ02W4xeo4r7l7gD1Dc5u3uxSObVJiGMdQVPAKzA8+HiF7QYrruQ68Yx/yLUI9JV9RnxEk4wA4n3rQBR4Q6luyGkfUF+uPCSZ1Y7Ds=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6870
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

Hi Kamil,

Thanks for your inputs. I will include them in the next revision.

Regards,
Umesh

On Wed, Feb 14, 2024 at 04:08:03PM +0100, Kamil Konieczny wrote:
>Hi Umesh,
>On 2024-02-12 at 22:29:48 -0800, Umesh Nerlige Ramappa wrote:
>> Doing an flr (unbind followed by bind) on i915 device while a user holds
>> a reference to the PMU events results in null-pointer-dereferences
>> (npd). Add some tests to validate the fix for this issue.
>>
>
>Could you rename tests? Here you are testing functionality of
>unbind-bind with a user holding ref to PMU events, so what about
>naming it explicitly as such? NPD is only one of bugs you
>encountered.
>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/perf_pmu.c | 202 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 202 insertions(+)
>>
>> diff --git a/tests/intel/perf_pmu.c b/tests/intel/perf_pmu.c
>> index 4ae2b60ae..4d60c8bd3 100644
>> --- a/tests/intel/perf_pmu.c
>> +++ b/tests/intel/perf_pmu.c
>> @@ -249,6 +249,41 @@
>>   * Description: Test the i915 pmu perf interface
>>   * Feature: i915 pmu perf interface, pmu
>>   * Test category: Perf
>> + *
>> + * SUBTEST: flr-npd
>-------------- ^^^^^^^
>imho better name would be: rebind or unbind-bind
>I do not know of good short name for 'ref to PMU event', what
>about 'pmu-event-ref-rebind' ?
>ref-event-unbind-bind ?
>
>rebind-with-pmu-event-ref ?
>
>> + * Description: Test null pointer dereference case
>------------------ ^^^^
>Write here same description you wrote in commit description:
>
>Verify unbind-bind with holding reference to PMU event
>
>Correct also descriptions below.
>
>> + * Feature: i915 pmu perf interface, pmu
>> + * Test category: Perf
>> + *
>> + * SUBTEST: flr-npd-close-after-unbind
>> + * Description: Test null pointer dereference close perf after unbind
>----------------------- ^^^^^^^^^^^^^^^
>Same here and below, drop NPD from descriptons and write a sequence of
>user actions you are validating (here and below).
>
>> + * Feature: i915 pmu perf interface, pmu
>> + * Test category: Perf
>> + *
>> + * SUBTEST: flr-npd-event-group
>> + * Description: Test null pointer dereference case with event groups
>> + * Feature: i915 pmu perf interface, pmu
>> + * Test category: Perf
>> + *
>> + * SUBTEST: flr-npd-separate-events
>> + * Description: Test null pointer dereference case with separate events
>> + * Feature: i915 pmu perf interface, pmu
>> + * Test category: Perf
>> + *
>> + * SUBTEST: forked-flr-npd
>> + * Description: Test null pointer dereference case with forked FLR
>> + * Feature: i915 pmu perf interface, pmu
>> + * Test category: Perf
>> + *
>> + * SUBTEST: forked-flr-npd-event-group
>> + * Description: Test null pointer dereference case with forked FLR and event groups
>> + * Feature: i915 pmu perf interface, pmu
>> + * Test category: Perf
>> + *
>> + * SUBTEST: forked-flr-npd-separate-events
>> + * Description: Test null pointer dereference case with forked FLR and separate events
>> + * Feature: i915 pmu perf interface, pmu
>> + * Test category: Perf
>>   */
>>
>>  IGT_TEST_DESCRIPTION("Test the i915 pmu perf interface");
>> @@ -2417,6 +2452,151 @@ static void test_unload(unsigned int num_engines)
>>  	igt_assert_eq(__igt_i915_driver_unload(NULL), 0);
>>  }
>>
>> +static int sysfs_driver(int i915)
>> +{
>> +	int dir, drv;
>> +
>> +	dir = igt_sysfs_open(i915);
>> +	igt_assert(dir != -1);
>> +
>> +	drv = openat(dir, "device/driver", O_DIRECTORY);
>> +	close(dir);
>> +
>> +	igt_assert(drv != -1);
>> +	return drv;
>> +}
>> +
>> +#define CLOSE_FD_AFTER_UNBIND	0x00000001
>> +#define GROUP_FDS		0x00000002
>> +#define SEPARATE_FDS		0x00000004
>> +
>> +#define NPD_MAX_FDS 4
>> +static void test_flr_npd(uint32_t flags)
>----------------------- ^^^
>This should be unbind_bind or rebind:
>
>static void test_flr_unbind_bind(uint32_t flags)
>or
>static void test_flr_rebind(uint32_t flags)
>
>> +{
>> +	struct pci_device *pdev;
>> +	int fd[NPD_MAX_FDS], i915, drv;
>> +	uint64_t buf[NPD_MAX_FDS];
>> +	int count = 0, i;
>> +	char *snd = NULL;
>> +	char addr[80];
>> +
>> +	i915 = __drm_open_driver(DRIVER_INTEL);
>> +	pdev = igt_device_get_pci_device(i915);
>> +
>> +	snprintf(addr, sizeof(addr), "%04x:%02x:%02x.%d",
>> +		 pdev->domain, pdev->bus, pdev->dev, pdev->func);
>> +	igt_debug("Opened %s\n", addr);
>> +
>> +	if (flags & GROUP_FDS) {
>> +		fd[count++] = open_group(i915, I915_PMU_REQUESTED_FREQUENCY, -1);
>> +		fd[count++] = open_group(i915, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
>> +		fd[count++] = open_group(i915, I915_PMU_RC6_RESIDENCY, fd[0]);
>> +		fd[count++] = open_group(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME, fd[0]);
>> +		pmu_read_multi(fd[0], count, buf);
>> +	} else if (flags & SEPARATE_FDS) {
>> +		fd[count++] = open_pmu(i915, I915_PMU_REQUESTED_FREQUENCY);
>> +		fd[count++] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
>> +		fd[count++] = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
>> +		fd[count++] = open_pmu(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
>> +		pmu_read_single(fd[0]);
>> +		pmu_read_single(fd[1]);
>> +		pmu_read_single(fd[2]);
>> +		pmu_read_single(fd[3]);
>> +	} else {
>> +		fd[0] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
>> +		pmu_read_single(fd[0]);
>> +	}
>> +
>> +	drv = sysfs_driver(i915);
>> +	close(i915);
>> +	igt_audio_driver_unload(&snd);
>> +
>> +	igt_set_timeout(30, "Driver unbind timeout!");
>------------------- ^^
>Why that long? Isn't 5 seconds enough?
>
>> +	igt_assert_f(igt_sysfs_set(drv, "unbind", addr),
>> +		     "Driver unbind failure (%s)!\n", addr);
>> +	igt_reset_timeout();
>> +
>> +	if (flags & CLOSE_FD_AFTER_UNBIND)
>> +		for (i = 0; i < count; i++)
>> +			close(fd[i]);
>> +
>> +	igt_set_timeout(30, "Driver bind timeout!");
>------------------- ^^
>Same repeated value, consider making it define or const.
>
>> +	igt_assert_f(igt_sysfs_set(drv, "bind", addr),
>> +		     "Driver bind failure (%s)!\n", addr);
>> +	igt_reset_timeout();
>> +
>> +	close(drv);
>> +
>> +	if (!(flags & CLOSE_FD_AFTER_UNBIND))
>> +		for (i = 0; i < count; i++)
>> +			close(fd[i]);
>> +}
>> +
>> +static void test_forked_flr_npd(uint32_t flags)
>------------------------------ ^^^
>Same here, don't use npd in function name, use
>unbind_bind or rebind.
>
>> +{
>> +	struct pci_device *pdev;
>> +	int fd[NPD_MAX_FDS], i915, drv;
>> +	uint64_t buf[NPD_MAX_FDS];
>> +	int count = 0, i;
>> +	char *snd = NULL;
>> +	char addr[80];
>> +
>> +	/* not supported for the forked version */
>> +	igt_assert(!(flags & CLOSE_FD_AFTER_UNBIND));
>> +
>> +	i915 = __drm_open_driver(DRIVER_INTEL);
>> +	pdev = igt_device_get_pci_device(i915);
>> +
>> +	snprintf(addr, sizeof(addr), "%04x:%02x:%02x.%d",
>> +		 pdev->domain, pdev->bus, pdev->dev, pdev->func);
>> +	igt_debug("Opened %s\n", addr);
>> +
>> +	if (flags & GROUP_FDS) {
>> +		fd[count++] = open_group(i915, I915_PMU_REQUESTED_FREQUENCY, -1);
>> +		fd[count++] = open_group(i915, I915_PMU_ACTUAL_FREQUENCY, fd[0]);
>> +		fd[count++] = open_group(i915, I915_PMU_RC6_RESIDENCY, fd[0]);
>> +		fd[count++] = open_group(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME, fd[0]);
>> +		pmu_read_multi(fd[0], count, buf);
>> +	} else if (flags & SEPARATE_FDS) {
>> +		fd[count] = open_pmu(i915, I915_PMU_REQUESTED_FREQUENCY);
>> +		pmu_read_single(fd[count++]);
>> +		fd[count] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
>> +		pmu_read_single(fd[count++]);
>> +		fd[count] = open_pmu(i915, I915_PMU_RC6_RESIDENCY);
>> +		pmu_read_single(fd[count++]);
>> +		fd[count] = open_pmu(i915, I915_PMU_SOFTWARE_GT_AWAKE_TIME);
>> +		pmu_read_single(fd[count++]);
>> +	} else {
>> +		fd[count] = open_pmu(i915, I915_PMU_ACTUAL_FREQUENCY);
>> +		pmu_read_single(fd[count++]);
>> +	}
>> +
>> +	drv = sysfs_driver(i915);
>> +	close(i915);
>> +	igt_audio_driver_unload(&snd);
>> +
>> +	igt_fork(child, 1) {
>> +		igt_set_timeout(30, "Driver unbind timeout!");
>------------------------^^
>Same here.
>
>> +		igt_assert_f(igt_sysfs_set(drv, "unbind", addr),
>> +				"Driver unbind failure (%s)!\n", addr);
>> +		igt_reset_timeout();
>> +	}
>> +	igt_waitchildren();
>> +
>> +
>> +	igt_fork(child, 1) {
>> +		igt_set_timeout(30, "Driver bind timeout!");
>------------------------^^
>Same here.
>
>> +		igt_assert_f(igt_sysfs_set(drv, "bind", addr),
>> +				"Driver bind failure (%s)!\n", addr);
>> +		igt_reset_timeout();
>> +	}
>> +	igt_waitchildren();
>> +
>> +	close(drv);
>> +	for (i = 0; i < count; i++)
>> +		close(fd[i]);
>> +}
>> +
>>  static void pmu_read(int i915)
>>  {
>>  	char val[128];
>> @@ -2810,4 +2990,26 @@ igt_main
>>  		for (int pass = 0; pass < 3; pass++)
>>  			test_unload(num_engines);
>>  	}
>> +
>> +	igt_subtest("flr-npd")
>-------------------- ^^^
>Please change 'npd' error you see from subtest name, use a name
>describing sequence you are testing, here and below, for example:
>
>s/npd/rebind-with-pmu-event-ref/
>
>> +		test_flr_npd(0);
>> +
>> +	igt_subtest("flr-npd-close-after-unbind")
>imho better:
>rebind-with-event-close-after-unbind
>
>> +		test_flr_npd(CLOSE_FD_AFTER_UNBIND);
>> +
>> +	igt_subtest("flr-npd-event-group")
>Same here, change test name.
>
>> +		test_flr_npd(GROUP_FDS);
>> +
>> +	igt_subtest("flr-npd-separate-events")
>Same here, change test name.
>
>> +		test_flr_npd(SEPARATE_FDS);
>> +
>> +	igt_subtest("forked-flr-npd")
>Same here, change test name.
>
>> +		test_forked_flr_npd(0);
>> +
>> +	igt_subtest("forked-flr-npd-event-group")
>Same here, change test name.
>
>> +		test_forked_flr_npd(GROUP_FDS);
>> +
>> +	igt_subtest("forked-flr-npd-separate-events")
>Same here, change test name.
>
>> +		test_forked_flr_npd(SEPARATE_FDS);
>> +


>
>Regards,
>Kamil
>
>>  }
>> --
>> 2.34.1
>>
