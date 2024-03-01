Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C414EC5478C
	for <igt-dev@archiver.kernel.org>; Fri,  1 Mar 2024 15:55:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581B310E042;
	Fri,  1 Mar 2024 15:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kg41zwKb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E353110E042
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Mar 2024 15:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709308536; x=1740844536;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=v3FX39lCOpnP9f6HofjGqgifNBJLs+i69o/FU1rRFaM=;
 b=Kg41zwKb1vWaVCUYBHemYFYNWqeL/EecGkQz0vtCMMrsUs7M/qsV6azo
 US6Aq5AH4JA2ii+o8s3/HHC8eG8uc8w2qk56P675eyNSwzzWfqsBlXJZZ
 yuzoIrptD7lOcBWGx3haqM44XNo7DX79T2b4fUYSZj68q+h9SU1vz95+u
 wOA1TsJFKTROInIhTzR2JkBTF1/ymPojop0+Y7zwUx7LojNdeKcEIb/KI
 kZZbjtxEzCYhhCOStIbRw2yB8hPcdvXDTh9PWrcD7mFfubvP1xGQLLAF4
 yXpg2Ev/7/N/ykn2FoRo/t8Zl9FFN0bTcQYmw9WbH5ijj5r5buITL1Vim A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="4425752"
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="4425752"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 07:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,196,1705392000"; 
   d="scan'208";a="8160399"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 07:55:35 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:55:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 07:55:34 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 07:55:34 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 07:55:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffU92qurdvS/tRsOHayUjxsQg40whIicT8iO+NVo8BW/7Cs3AVfWrb5/toc9NgEYFbGoY8p8QmPXN2jYhVQG+nyzhHR7GAfiDGAHv/biMJiA2u7v9RAv55/vu8vNp7pWoFyc002C6ltFQRbJ0E4mEakT21pUEfz1WnfnND7FRCX4imw/Om17P0wWblsjYO/dnWyNhP1mP5StxSKJSP+O04uXTra8+kxdkXeKz6i/2Rh3JIMO+ZbnpaZICzVXtnZc669xkS/gztzHlGEPX02yktTgqfORKsHt15EGcWTyufUJM/+qi4sHqnGcmM71zlScsgEm0sOp895dOt3T7ZNxxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiEHx+LKz003sXPqlQoy0p2Aaxk7cnkWir3f4fCfJb8=;
 b=A1qM9+8NPYuArYJJzwpDzoP56+H1RBqY5i2S4AZQfxzHXSWJoblFLgqItJAA2ZubmjxQIsHUlBikBYUOwGLAyjRA1ilQz1dtJ7FYXqryx+BQnrQmD8TqF36689HEC/6zha6fKwxSz8NsNtPEhCF0g1jDQDd4/UDI2p4H2T/2OR1AGirlD7jwN6ixXUvk94CVWF7OtdAl3HDLeU4bdVg5UnSQghUZm3gM76YmLC3AqFCNgwnKkgIeayimInR8FZt0WIXplYjsaOgs1OGXGWohFHsznldGT7w1iFJEznghsV3Qgp6w1bERrWlqO8Ebus5EW4oIwHfeO2DjlBX/uifOAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8727.namprd11.prod.outlook.com (2603:10b6:408:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Fri, 1 Mar
 2024 15:55:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7362.017; Fri, 1 Mar 2024
 15:55:31 +0000
Date: Fri, 1 Mar 2024 09:55:29 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 3/4] lib/igt_sysfs: Fix off-by-one in buffer size
Message-ID: <dsex6e6tusu56vraoc7tkkiqfi66s2tppyed3fmbhudshlkm26@4rvhblcqiviw>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <3709752.RUnXabflUD@jkrzyszt-mobl2.ger.corp.intel.com>
 <oxofhejmm73jbch4js4uhoobmjiqa36bxbcptzt6wqscmxaxmi@t4trup4np5ci>
 <10760528.aFP6jjVeTY@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <10760528.aFP6jjVeTY@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BYAPR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8727:EE_
X-MS-Office365-Filtering-Correlation-Id: becaf173-036c-4669-a451-08dc3a08061e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jip/vOHN30tPtVlo1b1myXl/yL5bdYoseGB0sa6AVJWBrDsskvOdE3cL05mo5fEwdzmUK7HvSl8XrCdbmlNhHdNLqY58iaEcJw+lqQkA3kl6fyrWNJ1roNZY0L7hKWYOH5b/3TOv45hTU1PjV9a3d+IQ6KOH9++d4+UIh5BtEJSQBm47jT557nyuQsGM3t9qPj3hTyU5iSS6MUDOK2weBnyl4scthUasTtaVAF0z+xqhGUaCg2RzRQz12+JcUA1EjzPC8y7adl/J+ofei3jAZS+Y03TXHc+jj9IsRGctVdfiGFJLWv48QeXD/JRMyhVwKugE9bplpU7eugYymBPDRF/rxCr4pW9ITH+6KmiswrIuWKq0EVciJkofYRZBGvsm/bv5DB8JlNNmpuKezQ7jj5oeICArgRuqRRZmRSYoWYQJjgHeX7mTDi5NhLI3KVPC8kqH41KQNEoNFQ4hO6Ck4E6vtu0i8f7md74PmysiIQ9z/W0KrAdJdZGZ6/6xqzNGv1vNLNx3htWZ4tqlHRXqSRLcKEigxJ2M1qMDuA3bT/4p5rk8RwE97V4zDPPobpjh6vf2uCUVK48LrT2yUtDMYP9e0juEl/hxyrBOUeC6s1mG0zEn1eJJ1c6vNZXbuBjkn+uFAZ96SleHUYGz+QgYqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YW3khYVxGmFc55hEG/NMY9rAuuMIGnb/zA34Peh2zVrGKUF5WD4VDpVChGO+?=
 =?us-ascii?Q?xmR4HrfxZJ4aX9mZqctHlwNYaWj0DhHZAJv6XuQEUWNwJJSEAP6TdLcWs7o2?=
 =?us-ascii?Q?5JKpMI3OxZYnPlsZWAkS7oK58U5r604oYrgmVSH26S5vrMr+YuamtRW5xitK?=
 =?us-ascii?Q?mpKEuw3Ibw+eqHXTahd1qf4MtS7J1NltpRwIIbrH9ob2BOLIGQoKPUDRAJL5?=
 =?us-ascii?Q?Cb+drbDim+55tXRnJOTsSUXt/yfbqn3eWsXcYKJo8MiTwFDHWvQXDB7h2HoX?=
 =?us-ascii?Q?FO/Qz6YNBzJwgAtsSOKic0wrom9sc8ZFZs+dkaNMgg7mtNSse5G4SDwcIyPU?=
 =?us-ascii?Q?B3ylxaGYn+oxny5H3nRZO4Kj1Z9RT5rJbE1F2Ply+Cintj6g4SBtZ0Jo93xf?=
 =?us-ascii?Q?tww5+yh2tPupMfZCdzYg4irJ5cSziyfG1FF+GNgvBZuNdS/QLelqd2OaZXB3?=
 =?us-ascii?Q?1sj7CPCYkmnsBMt0OD4bfas9FXL+FKoyiFk8Q99zhng6ovQtX2yTKmHoMVTi?=
 =?us-ascii?Q?AfMRHZOI86N3Y31mchK+L/tIf/cIZ05NHkJXvabsx6+fv/A4kkhw/I8xfd10?=
 =?us-ascii?Q?6iOFMCtOay9J6I1BjXwc2FqmV9SmHvgsRGR7tQA2/B93Yas3Op7MOSMyqkTv?=
 =?us-ascii?Q?TadMEzdjewpixslw7YQyszlRt1IqY+50yNkRPBtc3iorj78G82KZKfqkSRkE?=
 =?us-ascii?Q?IFAgiiRR0fdOBNgz2LSPVbdIMpBgGBeyrPaJHZxkiM8nfwSy++8UYWtlIbiy?=
 =?us-ascii?Q?emFDYvT44sTKuPxyswNI95kOddFztB8MrLmDq3Ktem83il3mOnI9aLVgqJPp?=
 =?us-ascii?Q?IS5NkjOlZ7jXD+DJ5p4pDicBsRTQnnlyfIohTIOvve9DkHv+3F5FQIIk4yHv?=
 =?us-ascii?Q?ICOA6KzvMYDfEOxMLC0azLg+mCWRrigFqx9RMOLThD4xo3ZbiGARPegGnz/U?=
 =?us-ascii?Q?8qLo1pK3d2qD1LFTfgUjz+pxYsmSOUyf6c3QYRjunE+4VINpOkN9YVyD54Dy?=
 =?us-ascii?Q?sFRJ7cT80hVnSl+/xwMqEhL2VovhvrdDiXOORm0dBBzDazqKisw+BP71r88T?=
 =?us-ascii?Q?/cdPnAVfss2gRNl+fUsmp8Djh8h9aH9Er70tInQi3pPEnXYp8x85sRHssrle?=
 =?us-ascii?Q?E9IV3Neq0EIOEbUULWTsS/IynMikpItmrWf7dRZTn9hKg+wa4piN/ifzze77?=
 =?us-ascii?Q?X/4CzGi6HKwxZxY4AEv/WJu2EfFr/dY1lD5slEHv81cFOXXbJP4TXWqIijID?=
 =?us-ascii?Q?zw8TS3Ej5Aaq64fNtpeAMKnxU6ZM5imYq53mBXGtbxCYO6ibHVKTRa0kRAvV?=
 =?us-ascii?Q?tynAiG0JvUiFdk8YFIPhMFO7eqk/acB3D8tF/Ts3wprc2jgTuKYh92YTKTTJ?=
 =?us-ascii?Q?gFlrfcWYNVtMDL6r8OhY35Yz7lo+TrwsQnLbKkBaJ6YpkGAcYMqiXv1ZK1ku?=
 =?us-ascii?Q?X1EZXD4K12FAE6EwGoBD0dHKyMPahX7gp/OO++APQzXx6UNb3rU9jaYGciXB?=
 =?us-ascii?Q?BJu+ASPrKglfN57guE8HqCr8ccABLJ2Q/SDSyPbAz2zZ1REMESeWN5mMjGq5?=
 =?us-ascii?Q?cADnFLQ/OR1U7CKFdKh+INxtu/eeItzfLoTXVoDgp2AS4Mh6yPxu0BIbaQHo?=
 =?us-ascii?Q?4A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: becaf173-036c-4669-a451-08dc3a08061e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 15:55:31.7848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fntf+vdi/pbaKQXZe28KOh8qlmBbszRss2sIiUtLpy/GpYJO+eHnpOtTTt7TlouFiJAtipYAWmHKgtBQfgE147Q7FDpjXPYiUIvlxR0HWgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8727
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

On Fri, Mar 01, 2024 at 04:16:51PM +0100, Janusz Krzysztofik wrote:
>On Thursday, 29 February 2024 18:01:29 CET Lucas De Marchi wrote:
>> On Thu, Feb 29, 2024 at 12:07:01PM +0100, Janusz Krzysztofik wrote:
>> >Hi Lucas,
>> >
>> >On Wednesday, 28 February 2024 23:31:33 CET Lucas De Marchi wrote:
>> >> vsnprintf() should receive the buffer size as argument, here called `len`,
>> >> including the trailing '\0'. There was truncation if the return is "size
>> >> or more". In this second call to vsnprintf() the value should be exactly
>> >> the same as in the first call, otherwise something really unexpected
>> >> happened.
>> >>
>> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> >> ---
>> >>  lib/igt_sysfs.c | 4 ++--
>> >>  1 file changed, 2 insertions(+), 2 deletions(-)
>> >>
>> >> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> >> index 2997925e5..a1ff5655d 100644
>> >> --- a/lib/igt_sysfs.c
>> >> +++ b/lib/igt_sysfs.c
>> >> @@ -529,8 +529,8 @@ int igt_sysfs_vprintf(int dir, const char *attr, const
>> >char *fmt, va_list ap)
>> >>  			goto end;
>> >>  		}
>> >>
>> >> -		ret = vsnprintf(buf, ret, fmt, ap);
>> >> -		if (igt_debug_on(ret > len)) {
>> >> +		ret = vsnprintf(buf, len, fmt, ap);
>> >
>> >Oh, so I missed that we didn't use the len variable, initialized with a
>> >calculated value of required buffer length, when allocating that buffer --
>> >good catch.  OTOH, since we then pass the buffer to a function that doesn't
>> >care for a terminating null char, a buffer of ret length, with no room for
>> >that terminating null char, should be sufficient.  But anyway, let's request
>> >that extra byte so the code is less confusing.
>> >
>> >> +		if (igt_debug_on(ret != len - 1)) {
>> >
>> >OK, let's also take care of strict consistency of the result with that from
>> >the initial vsnprintf().
>> >
>> >But then, the len variable is really needed only for that comparison with the
>> >new result  The required size of the buffer doesn't need to be calculated from
>> >ret as ret + 1 in advance, only just when passing it as an argument to
>> >malloc().  Under such circumstances, wouldn't that be more clear if we changed
>> >semantics of len to always carry an initially detected length of the data to
>> >be printed, not the required buffer length, and then compare it directly with
>> >the new result, without recalculating that initial value back from the buffer
>> >length?
>>
>> this patch only fixes the bug. Path 4 is already reworking this to make
>> it prettier, which afaiu includes this reasoning, with len always being
>> the length of the string, not mixed with buffer size.
>
>So if there were no follow up patches in the series then you would agree to
>make this patch prettier, but in this case your choice is to leave it not
>quite pretty, right?

yes, probably as a second patch so we have 1) fix the bug; 2) make it
pretty.

>
>Up to you.
>
>Acked-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

thanks
Lucas De Marchi

>
>Thanks,
>Janusz
>
>
>>
>> Lucas De Marchi
>>
>> >
>> >Thanks,
>> >Janusz
>> >
>> >>  			ret = -EINVAL;
>> >>  			goto free_buf;
>> >>  		}
>> >>
>> >
>> >
>> >
>> >
>>
>
>
>
>
