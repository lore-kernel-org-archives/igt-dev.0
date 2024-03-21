Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27B9C54E58
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 06:04:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27A5E10E907;
	Thu, 21 Mar 2024 06:04:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eF0ph8UR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA9210E907
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 06:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711001055; x=1742537055;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=1L1nw+t8r7ZyuamFsI9B2i42gXJgkMckNKkcuq0cWpw=;
 b=eF0ph8URuT398nCBNaGhztjWQlVMxv4ooHA8JbzdeTOwHP3qGxWIDZmc
 wnrtiJHFP4T6I6D3Qq3+esS1BMC/1CsTilMDAJUUW7cTP2HgMNC/R18Db
 AabP9OzkhAWCNtLdctCZdamj79peVtx0TakODAy00HX8pbYMasV0CbOoq
 yaE3qMK1JNctvOhb/l8ORhULqlvkbQnfpqUaGC0xYwZMHJvs59SVz/o3e
 6Ks7ASf/haZhRvSh2p/runTb048JTRDDhHGf4UEJP9y+dvIBkIoE+eCgg
 lOpHi1fd/SUQXAPzEJgy7DkXzXLQvLcTzy2BDOg8GvxpSqAj/cutlCn1M w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="16511514"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="16511514"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 23:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="14424662"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Mar 2024 23:01:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 23:01:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Mar 2024 23:01:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Mar 2024 23:01:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Mar 2024 23:01:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UrNBJD9RKDLJMkEVCrJjRJah3DT1q6PkoIQzgWyhSxzdtH2l6qePlXQ0NGt0d/9PZhK+wxBrIOZhfAGqxUu99RO7UifIgH6k7f58YB4flpJygPJBkY8ssxd0Fy+ltd3unPYLkYd6Igc+kVCq9RFutnhq3aPDnpk7zS82L6fmgSCgL0hHTASFZFhmedtuJ/oSV7oqIFjMaHUs/s2Z22pv0wn23ZuHuzxawyav6oEUTSVU01L6XBbedwcl7p8wG4fHbZGBdB+dmOi/Xk4t8KpyZihsj+bs3wLUJZr+C7X84SPTGBxh+sdJ/c+4JKZ1zqqMQRerEF3hP2EhvVyQfXm08A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6kHbLzqUk5AOpq7akYSZhGx/USutwp5DVL8P0cxhpg=;
 b=SE1OlRt8VTCCEGQFS37HmDlKaEzGobdID0tXa330QZWC+9Zk3pUBweWH1fNDeE+WXvWekyRRHDWxqawfyAChzpiLTrE+gStmxl9poJ78u/LNDyGus5lEDZY8QrWaVxFnZCUY5akONdfUI/tM1C2Kzp8wpKjN4Y43axDnSWtgh68AT95kq9RqemKbjDXXJ9GpIXmd3wrx2XLXkFxg1nHqVUxD/sCQ/fwxv6KaA6Xr9rFFCOok3KFjgQXxX+49a27/Ni5/N89yhNNAgs5/1s3bEPHOi4XNOxnOKuyqxafwzrRwWXSYjq0ftjBCiFh66XVAmRZVehZuTD8/QnG1RqV4Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12; Thu, 21 Mar
 2024 06:01:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7409.010; Thu, 21 Mar 2024
 06:01:29 +0000
Date: Thu, 21 Mar 2024 01:01:22 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Fill in GT field for second
 balancer thread
Message-ID: <5frc2lhbpyb7xlpt2pt3rce4jo4pes5qbpjjsuase57pwen4hm@44wimyrmjomc>
References: <20240320192356.359327-1-matthew.d.roper@intel.com>
 <7vgrnkw4ndo5ydxybh3qoqriovorgyvrrsatt4tgifis7xo3ju@3g7qmeluwrps>
 <ZfuHpR6TCEnzLw8X@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZfuHpR6TCEnzLw8X@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BYAPR21CA0005.namprd21.prod.outlook.com
 (2603:10b6:a03:114::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 86c65645-0e61-41af-49fa-08dc496c59b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q8FTGdSbbkPoCNSWTa5Ql0oTuu3LKkpetbwCtkbBlIVQMXf7lJZN4loOucjxW4zAslPbs1wS37g3QlkepqlB7btZF4j0Nl4LZ6yvjO/+CgwfE++SmLqk/ykLzFhucTGI6c39/TEKPJarx4KrRG14qQ35vNGUiq6ORYuJytDjCDIGFL1IWWNoK27Qe+ZC5u5CZj1LyJHexmHSpWkfiULQkz+efd34mpeSxzP2AwoUx9p0L+FNlSd9Kw1pplrgyfPlj7AzFLzrYGcbSi0LsDdpXAkwuZkaNFhfIfYka87oiuoB7t+in4KY6NFR6xo+4CgaYr/AD2JJAKiJjW/nSTy8BDbib9pkb+uO5KLrJtW1PEKMG/Cji0YyWdk0kdjbc+Su7mDY2snkNCI4uAJjo3zt8Gd+5G52IacnCyoZ0oKzsmD5oMFjhQ+83wLHuRBvwvYa/skfbqRAG7dXMitQjimp29BtTXXoem4EbXbobVZTmy5oM2L78s9HtpeZVKDNN8PJQhofTYo1CUzMtpwL3hQ2esLKwPDOZbh0LYqHuAzWIdQlgqvSxnyU55DWloh2M+aA1X465eDAZecSVtAn2gsPZH2X/oij3ncb3gKMv7LQ5eH4W5F44S4Z7m6LLNn3/zIelgU9iR62SPohQgKpKcpI/+7booWMU+rEMwI0KhjI0Ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?du6GDVptnEBW+09QWEkE7DynXToNMaPJ62gLIkgUiiinrV0JLGiRipTwL12s?=
 =?us-ascii?Q?BKvx5W/rsNBtqAx7tTj+Uau8K5lSl+cAPBxq2zS2HpUi8+lExifALmMYtfIR?=
 =?us-ascii?Q?3XqWz/4keV5zTUPtp6bAYPAMD5oABehgGgQ91iA5DLIS7f3lP2K9hPyhwyss?=
 =?us-ascii?Q?vPNGcjfBjHomSYTDmHdEuv1fHcPoZPb2qLzegfp96qmT/WAhq9q6TtcKfI5S?=
 =?us-ascii?Q?D70giz70j6H8SvoZMW6iOhxZf6TvOjmM+J2JyRJVIW1oyWAs5kHT5myWilDJ?=
 =?us-ascii?Q?nyGsmNfPykz5rBYoRfdLIbfofR2rTySHkAYJhr+KbDXIrauZr63yx+NAdyQm?=
 =?us-ascii?Q?a3yUf8hIfnXx/4lPCfDo6uEvFu7RwAXEH6TSC58//looW0q/5Kb07zu3Ou56?=
 =?us-ascii?Q?Cm1zmMHPyHIzIrVh9JEsEw615R1cUZeZlbnvqpuqOPJWO20oIQF7aIN63x/H?=
 =?us-ascii?Q?wzfD/aMck8MaTmMACkZlCqinD/FTnazRcObwttk+911hmZAVtC62CWytln+b?=
 =?us-ascii?Q?HFPhIr8MTDOEbJh2TTB2M3dcuIEsHMJrDyIaU5ktQAT+fLBVE2ZHBmt6X1PO?=
 =?us-ascii?Q?KNfS1VYVqadVYW6BfjZbDUwbnRHU7zm9xzuAx5WkNbLXfxodTFtlRwjaMTZ1?=
 =?us-ascii?Q?wkUc4USMgc4SNgprX0SRg8sfypPseCeW/2h2TcvzXBP6uINNQYjtqzTHrlE0?=
 =?us-ascii?Q?lWI+tuGXadpvPeej9bbPJvRmTVcQXS/M20vmoURsuxgVwKy7Q7LNaFn6XYrg?=
 =?us-ascii?Q?IlA5iOH420P6laRFral4Yk+VdyPDdQhT5BvNc+N/jpeTwiLK7USdFX9TbiNY?=
 =?us-ascii?Q?NngC2b37ugMUK8/c8WsuZiDAByMSt5D1/3wLM62NXvfwAcLpFJlVu+he4IsG?=
 =?us-ascii?Q?oQBmmghpu20gLFfSlHauEmiocul0+PRJiPVyQJBtXb8G7Xtn/Ru1q++jZP2b?=
 =?us-ascii?Q?K57wsN+WlHWSHEbQloe04gtbZ8u9+6IOougStSN1m7poxAndvGAZqV+ASgUJ?=
 =?us-ascii?Q?lN1NaelM40O5moajYmtlB2RtA4WitwKoh1sq/0vAy7PxmYTuK65nUcge/FNE?=
 =?us-ascii?Q?PXy4pH41LwzJU7jEh0OtOiC4fekI5zArwera4qN0cYk7qA+P+fDe7A1wk8qH?=
 =?us-ascii?Q?Kn6GaJGAOkHx69tdqF6uq55UscjYToP0FmtPSQZB15sF5cKpQOp5sPdRZiDL?=
 =?us-ascii?Q?zZoeNyOu7lsbE6run4Ika/Xwv4K2k9u6fhnaGXI7JEBmgFpTMMCjCzf9i7nT?=
 =?us-ascii?Q?RFnqf8GFCDtlREEOU+lka44ctU7PNPiKhHX3z6VoZj0qiaNDmH1qWEpFCTSU?=
 =?us-ascii?Q?jBOAH+YuU6MbqI506Aop9jSbEwBoETZ3WeZH93DT+AFaFZAqK1QHDfw0jN6r?=
 =?us-ascii?Q?qdmONUGnT0o+X89T3nX9/kcGoAkj2/GVY27PBZfLu5ZvMNIv/oBromhoEMs5?=
 =?us-ascii?Q?RsnBNGxuUJPxvkt5t2jIH1dzmiuy1QpssM1GgssLg0a0qfeUNnD7DjcHNtiz?=
 =?us-ascii?Q?f7bzkowiGAZj0OHZ83rkY01OtGrdZL0odRkLwE4TkfZ0eLzdG0e6D1GC/dNn?=
 =?us-ascii?Q?+6Soq9Ni26CJFc5tCHswF3tKw4MF7LZfr92pTzQtarJK4I4ZoyGjeHWGjVn5?=
 =?us-ascii?Q?dw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86c65645-0e61-41af-49fa-08dc496c59b9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 06:01:29.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u8I3EOYYLiBSRIcfTZrzlmyT13KQ2StSmuUXGTFVADjsWv9RIWNbqnq4uG0zvauJPQVvQdeD4TLG3aVYuNXLFUHFlA5LVOTEbvG9NwBRSR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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

On Thu, Mar 21, 2024 at 01:04:37AM +0000, Matthew Brost wrote:
>On Wed, Mar 20, 2024 at 03:47:57PM -0500, Lucas De Marchi wrote:
>> On Wed, Mar 20, 2024 at 12:23:56PM -0700, Matt Roper wrote:
>> > The balancer subtests spawn two pthreads per engine class if there are
>> > multiple instances of the class.  The GT field of the data structure is
>> > filled in properly for the first thread, but not for the second,
>> > effectively leaving it set to "0."
>> >
>> > For platforms with standalone media, this will result in failures when
>> > the thread tries to find the instances of a media class on GT0 and trips
>> > the "igt_assert(num_placements > 1)" assertion in test_balancer().
>> >
>> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> do you know why we unrolled a loop in there and did a wrong copy and
>
>I think the for_gt loop was added after the original version of this.
>Likely an ommision when that was added.
>
>> paste? That together with vertical spacing on flow control seems to be a
>> good source of bugs. Good find.
>>
>> The only difference between the first and second thread data I'm seeing
>> is flags VIRTUAL vs PARALLEL. Matt Brost, is this test from you? Could
>
>Yes, I wrote this one. Not my finest work in terms of copy / pasting,
>indeed the only difference should be VIRTUAL vs. PARALLEL. I think this
>should be consolidated into a loop.


sounds good. Something like this on top of this patch? (completely untested, it builds)

   diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
   index 977e8c600..b95870714 100644
   --- a/tests/intel/xe_exec_threads.c
   +++ b/tests/intel/xe_exec_threads.c
   @@ -1030,6 +1030,7 @@ static void threads(int fd, int flags)
                   xe_for_each_gt(fd, gt)
                           xe_for_each_engine_class(class) {
                                   int num_placements = 0;
   +                               int *data_flags = (int[]){ VIRTUAL, PARALLEL, -1 };
   
                                   xe_for_each_engine(fd, hwe) {
                                           if (hwe->engine_class != class ||
   @@ -1038,36 +1039,10 @@ static void threads(int fd, int flags)
                                           ++num_placements;
                                   }
   
   -                               if (num_placements > 1) {
   -                                       threads_data[i].mutex = &mutex;
   -                                       threads_data[i].cond = &cond;
   -                                       if (flags & SHARED_VM)
   -                                               threads_data[i].addr = addr |
   -                                                       (i << ADDRESS_SHIFT);
   -                                       else
   -                                               threads_data[i].addr = addr;
   -                                       threads_data[i].userptr = userptr |
   -                                               (i << ADDRESS_SHIFT);
   -                                       if (flags & FD)
   -                                               threads_data[i].fd = 0;
   -                                       else
   -                                               threads_data[i].fd = fd;
   -                                       threads_data[i].gt = gt;
   -                                       threads_data[i].vm_legacy_mode =
   -                                               vm_legacy_mode;
   -                                       threads_data[i].class = class;
   -                                       threads_data[i].n_exec_queue = N_EXEC_QUEUE;
   -                                       threads_data[i].n_exec = N_EXEC;
   -                                       threads_data[i].flags = flags;
   -                                       threads_data[i].flags &= ~BALANCER;
   -                                       threads_data[i].flags |= VIRTUAL;
   -                                       threads_data[i].go = &go;
   -
   -                                       ++n_threads;
   -                                       pthread_create(&threads_data[i].thread, 0,
   -                                                      thread, &threads_data[i]);
   -                                       ++i;
   +                               if (num_placements <= 1)
   +                                       continue;
   
   +                               while (*data_flags >= 0) {
                                           threads_data[i].mutex = &mutex;
                                           threads_data[i].cond = &cond;
                                           if (flags & SHARED_VM)
   @@ -1089,13 +1064,14 @@ static void threads(int fd, int flags)
                                           threads_data[i].n_exec = N_EXEC;
                                           threads_data[i].flags = flags;
                                           threads_data[i].flags &= ~BALANCER;
   -                                       threads_data[i].flags |= PARALLEL;
   +                                       threads_data[i].flags |= *data_flags;
                                           threads_data[i].go = &go;
   
                                           ++n_threads;
                                           pthread_create(&threads_data[i].thread, 0,
                                                          thread, &threads_data[i]);
                                           ++i;
   +                                       data_flags++;
                                   }
                           }
           }

>
>> you add an overview to its documentation? The boilerplate doc added
>> there after the fact looks less than helpful.
>>
>
>What kinda of documentation were you thinking of? Most all the IGTs are
>light on doc but updating the doc for ones I wrote is on my todo list...

It would be good to have an overview on what the test is checking and
how the different subtests are different from each other.

thanks
Lucas De Marchi

>
>Matt
>
>> Lucas De Marchi
>>
>> > ---
>> > tests/intel/xe_exec_threads.c | 1 +
>> > 1 file changed, 1 insertion(+)
>> >
>> > diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>> > index 55907e2b3..977e8c600 100644
>> > --- a/tests/intel/xe_exec_threads.c
>> > +++ b/tests/intel/xe_exec_threads.c
>> > @@ -1081,6 +1081,7 @@ static void threads(int fd, int flags)
>> > 						threads_data[i].fd = 0;
>> > 					else
>> > 						threads_data[i].fd = fd;
>> > +					threads_data[i].gt = gt;
>> > 					threads_data[i].vm_legacy_mode =
>> > 						vm_legacy_mode;
>> > 					threads_data[i].class = class;
>> > --
>> > 2.43.0
>> >
