Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44DDC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 21:33:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6826710E00E;
	Fri, 17 May 2024 21:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cPymLy18";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380B010E00E
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 21:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715981584; x=1747517584;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=egp92BOlIapWX8ZXQO+B7OhiZIIrHXdGfxmQhdN8kfw=;
 b=cPymLy18+KiOcGlhpxVuev0Z3yvwv64YTik9jczljohzQJCgBRnf1wfq
 2TexbItcc9dxK0qdiVLBKTVhimUntQYjyRKiUYlYS8x96WEvgX0cGwEnX
 8l5U21mzGbi9EnPjni66qDykRYTw3C2Vf+y80gvsVGA94vd+zdHF4qUrp
 0JDUap4tnlgAutaBOVUZMGrJlw+NqqVQME5WVPqNw4C6cq2gjaOladPxj
 er+w+UOjsCP3bqvqcouYxgY7XoOpV9f4iW/MK0W9Mzve28luHJtohmyrN
 bpPiad7lp+JjaI0yjwickWZvVU5oBwSjjwzr10MxrmbHBGf5hNSNooNuh Q==;
X-CSE-ConnectionGUID: +6C3Js+ERj+uAP3YoGY7Ag==
X-CSE-MsgGUID: KAck2eSxSYiaNqMZZKaTsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12025129"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12025129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 14:33:04 -0700
X-CSE-ConnectionGUID: c5hZAX8ZSwmi6CObNClLzw==
X-CSE-MsgGUID: Kh2rO0kYThaH3ZiUZZKhyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="55135425"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 May 2024 14:33:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 17 May 2024 14:33:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 17 May 2024 14:33:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 17 May 2024 14:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j/FajUuxto6x1+cQDg29wBBFF1N29UJbqMWHa7kU1iBFnPl2OG1arqP3jZZ8Cr9cM4y7C15a1k1ADnvcWrFXVK/o4k+opAISJYUxmrX1u6O67W2zscUqtKL7Aa1VM3/HiZEaaF6cZ5KaH03iz4bo6Wv2F04KR08X8oNO+GqE2y7eG4TQiOkStAYV048xXTMNOBPhWAltRG3dI7qQuikNNaXKoqSFlLgTk/HuCf+PZlRM4Jx9xr/9kgF5gk65PXS+185AN12g0S38kX6j30hlaHeCpc/q2km1Rr1mYeJoTYqnvhgC4jG1DSoKN9kurd3qcdsP4wmsRPm3Wvdt5aBJZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7F62Z03P6SdS+baxn1GVxE08/KhmD1WiiUgiWEKDZM=;
 b=gn2X4B30QRv3BoB0isuzQAL+fv6HZxqqPuDZmMWpy22YRYW3ndOdDEfsnjMY7wxpOh224kCRnGzBspmR/LV4cnUdNRRSaYlY9Leqdj1K7rydeHkXL9hZjXYvg8rpF9oCy7iLrWOu6IIGRCXbzsnhi5FQv1hWsGAlqA0rwneyDz8HaTBwXqD6Vk/iAGN3laBxyYuexldsjQarjmG2BrGKqkbdJ9XDgZTHvLFo3LEbWYLlh024WtxgXEjQ2pUo78+TCV0TiqMrYv0rI6UjWQ8EjOPIRt0rii+5pvtDeAvuNb/4vhScTtO9ebPyA7VRUfkofdgoX07CQHvNYgCHR1Imrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by PH7PR11MB6607.namprd11.prod.outlook.com (2603:10b6:510:1b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30; Fri, 17 May
 2024 21:33:00 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%6]) with mapi id 15.20.7587.028; Fri, 17 May 2024
 21:33:00 +0000
Date: Fri, 17 May 2024 14:32:57 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
CC: Gustavo Sousa <gustavo.sousa@intel.com>, <igt-dev@lists.freedesktop.org>
Subject: Re: [i-g-t] runner: Remove useless null check for delim in
 job_list_from_test_list
Message-ID: <20240517213257.GB2343622@mdroper-desk1.amr.corp.intel.com>
References: <20240430211934.349775-2-gustavo.sousa@intel.com>
 <7e484d91-9c79-45db-9f15-9782eb4bbb51@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <7e484d91-9c79-45db-9f15-9782eb4bbb51@linux.intel.com>
X-ClientProxiedBy: BY5PR20CA0028.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::41) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|PH7PR11MB6607:EE_
X-MS-Office365-Filtering-Correlation-Id: c1da95d5-b5b2-4867-dfba-08dc76b8ece7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EeaHqdeV3Ts3YU0aGZf6P0htECELkXDYcyffTygb3Ko/KvGtGyKXRdNghqKf?=
 =?us-ascii?Q?g+14IGPxI9Oii0yuJG2cwEImywfwSxZVeOLfbbaDw6BaX7iJejaduLuOFnEM?=
 =?us-ascii?Q?KvWBoF9dy9zxDW+bTMgfOYgOPjEi99Y6q6d45/O7CG8t1iPtewvxuir2Zyh0?=
 =?us-ascii?Q?j2Bf6KpMYKfmrHICBrsc1PVP9HhMZNAsxQ6Grguj1GpIR9fkutvg4femtYtR?=
 =?us-ascii?Q?TXkfMwC1xXvNxg1yUQ2vyek4WK5ZNtIokPhgetVlnGoLAE6trxa5W31BsLEg?=
 =?us-ascii?Q?+Qxxail8z7gcq/TAscrIw62owmdQZQP3JUXMNkkpV09SE29EqncZxnzdQLWG?=
 =?us-ascii?Q?kHWg58mMNqPWfCgLN0SRaPGoFEKhZiZQA8TZwIzHgeMxcpUgFJkWDMndPwVb?=
 =?us-ascii?Q?AX6ha1SjVrcY0PdrofsaY98ePxzZCL5AtD1GihHg5Z52FydTIYkgiar5L22a?=
 =?us-ascii?Q?NNdz7VMSNy1kkI6Ct8leHTxwnrirNOYgfgagKfLv8a7hfCuu09vpWtnEPqhk?=
 =?us-ascii?Q?TeYsa1sfsoo0b9EdeCCAbF6H3uppVroVnyqvImI3HDwqa8+39PxBXid83DxL?=
 =?us-ascii?Q?iSv/QNHud14IUutrnqWiQw+fSigAlRBX6OUP2DCvA9+pzmFuioR8eJTsEscx?=
 =?us-ascii?Q?lWVHTvQfxoeOyJr75Ju1fSBKwnJ65qUXF/IwHL/JBAeBo/xGBqW0QVCS1vWQ?=
 =?us-ascii?Q?gXojrNzzZpjyEbxZZyOnMl5HsBDKEL4G2WpbhDjoefbKyCcmkB2QgKQRVgdR?=
 =?us-ascii?Q?Q7o1AAJaNYHLf+/ytJ3DAsZ6su0m8+IyTyagY/j2BoJspJobjD8gwqmPQxIP?=
 =?us-ascii?Q?cMghCBYX1U8tVcRw/iM8wg1Ngz9Zp1PeaVwVdzQlktkgAXT3oksH6MZn5xgC?=
 =?us-ascii?Q?4U88PWfsqOSia22pqJ8antpj1m/WBq5eVHFUs+j+ACG5UAtXJOCAzn5hDXQ3?=
 =?us-ascii?Q?15taU5P7XlDlHC9lt9rZ5ULZ25Cvgl9Sh1aIHyGsk3ZXnPrPaLH3s+gHk1D3?=
 =?us-ascii?Q?MaLlgvh5ZUwkJB47zZUBUFGisqCrIAQrMiZ0yTl5Qekh8lX+3hW7N5ESL/uW?=
 =?us-ascii?Q?yIzh4pPfAcB2d8risE0dmhIQ9Ay/1PTzFfafjwx1gs9Kh7RSZa1A3CmJ8OuV?=
 =?us-ascii?Q?abClj5Zr/2XP3z+IoTAypEsJ7huxIkp5cQ+X13JA1DgDFkRTuxzPN4pwunMI?=
 =?us-ascii?Q?7GZVSQhLqHDKEMCrBHovqQD4tD3QD8DDnwpdC5ad8KjsNN+IWd4AKEiX2vJV?=
 =?us-ascii?Q?9wYUQUgFHQD/GTpteWT7Z//+CXfQickaqmBhEL6/lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CXCyF1ldKzjXQ8sTfCLKq7jqviWTMtF41qjmnnfrgDnccJMbUcvOZhySlB+Z?=
 =?us-ascii?Q?NZDfQLZr1Fou28dsIi7lKg4OiRgQg3HolnZ6eJnQUtaJGG/LnYCwQ52HqMVn?=
 =?us-ascii?Q?HzfpkbDMwVTk06SE4KeEQcPamcOvPLPwtBMw/FVQposoyY5P3YNdYmmCA4Sm?=
 =?us-ascii?Q?gNxxOScl3seRJEPB2n+FkIivk3LYIEz5lDRgpZ2JARSEiarxh+6tu3yP8zAB?=
 =?us-ascii?Q?DI58nxEIiDAp8vidwuTzztKa10kNRpYuZ4NWm80VsP5jN+wz0iY2PRy8wANr?=
 =?us-ascii?Q?jGeG08nA6kmZtnI0vV2oh6OP24tSLVxbe6wYF4rfiYwg+ixzc7qSBY73DIQs?=
 =?us-ascii?Q?XASwBVTocEiz8zcrXo9jW44PjeQhzg0ZGHUpET6fX0DMD+9H+klDDM+qMb7Z?=
 =?us-ascii?Q?Uo2hSEEwTA1Z5H/QVO8MTqjVsU1jtYnjgKhVFeO46ZfSS6DdQBJDRMwbBbzP?=
 =?us-ascii?Q?9erptdGkW5grOM4y2kbdzxKf9nNP0BkX18H342wafmHEBXfUlSGdovviT6Ic?=
 =?us-ascii?Q?VLkSnvd/0kvVHiTmpKwGganr8sB8ZQBoOItZ2AEnViRpMzHMwbra7pOcTnfa?=
 =?us-ascii?Q?sfz3sE/aY42XzDEq/aWUyptgoMMuPX4/lMkkUa+PEBsZfb3avXcxBBEibkE+?=
 =?us-ascii?Q?MGkx4F9JXdZXLu3n5soyfdJd/w1cyRnJmzFEV2v3K4ycDD5EVwAi5ssV+ysD?=
 =?us-ascii?Q?EFajmdoqOJUirIVoLM9cHNQQTtN8mLQraj32UWISRx2jXrZOd2MIQZfxdMXt?=
 =?us-ascii?Q?opCNilcQmKB2k9zHURXh+VIXx+L8yxwO0pfYN7BlcQgoPePn/KcT4veEld8P?=
 =?us-ascii?Q?ULdBp86+uzpIyLFlQP3BjKT21IhJIClpGNT5yJ9dL4Y3uvbIwf0zthFgJqNO?=
 =?us-ascii?Q?scitdGUSaTvBTSKIjsg2YZNRS1ORWyhs9v+r6p83up2bIx6+xYu+LfOaS/48?=
 =?us-ascii?Q?oYCuZ0dq8mVkCgyz9UsUWFsLt6EcgarIcIoxSIv1lgnqKql51CZE2ZWlBoTZ?=
 =?us-ascii?Q?G3k18gXNboI8yArCfUY+aCRLDoB6pUCHlgmUOcWc5kJDzsbOs7gFWC2GxuO6?=
 =?us-ascii?Q?jFPoIr9ka4xLkl3g+4s3Z4ulZyhVnSopOqFJblAOtJy/gR9RypZP21DBrpwT?=
 =?us-ascii?Q?nut6s8ecZ2IlFUPmV9LWEkoGBZR02tIeUEJhMPaGMX1ITsbcdx7j9IwMMxZV?=
 =?us-ascii?Q?NQyydj/6X4I5zrNaxfOxSv5f14GvECyolCESBAMKW7C3b13V0/BCz5lNhSrf?=
 =?us-ascii?Q?lxe2rZb8RtwygvOGtLa4ln8LghNng/MEXh1A90F7+hxjVhQ2z+Npx4e0itQ+?=
 =?us-ascii?Q?KG0UsVF7mv/PrFQ8jypI2ijfcHfNIaJVViM8gMEAuDFrwmNx7pH0fNs9Xidt?=
 =?us-ascii?Q?5GC+odOaT7yiUWOmCeqE1Ny8iE2ZQ0uXSgRpUUFmZNtcEQfZULftaBFTXeMq?=
 =?us-ascii?Q?vk1dFNfw0xzul/Ap16NqHT5Tab0GmfFxK2qO5xKS8rsvlYPkpemCQ8/JkQ8T?=
 =?us-ascii?Q?T88v0ne9C/nvDK4EFW/7sy0CIKI1fd2A18Bj5kFNYI2dg5xFt4X1XwXCAOnB?=
 =?us-ascii?Q?3DpWU5tAeg5AxCSLqntJZ9rTlJgAvmN+TdV2j6z+2d+4pZ+xeqCXCyqdqoBR?=
 =?us-ascii?Q?7A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1da95d5-b5b2-4867-dfba-08dc76b8ece7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2024 21:33:00.2045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0TE/3fGBgIV0AW+JkhPzlT6hsxDwtcdUFGn5mbbk2+rZBk999giUfJZLOKEKdd24hr9Cey6IIwZA/ty9RuDq3lxo6cX4aGijym89603VsBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6607
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

On Tue, May 07, 2024 at 10:13:45AM -0700, Ngai-Mint Kwan wrote:
> Hi Gustavo,
> 
> On 2024-04-30 14:19, Gustavo Sousa wrote:
> > The function job_list_from_test_list() uses a while loop to read entries
> > from the testlist.
> > 
> > The condition ((delim = strchr(binary, '@')) != NULL) checks if the
> > current entry specifies a subtest. When no subtest is specified, the
> > else clause will cause a jump to the next iteration. That means that we
> > are certain any statement executed after that if block has (delim !=
> > NULL). As such, all null checks on that variable after that point are
> > pointless.
> > 
> > In fact, certain unnecessary null checks might even cause confusion to
> > readers. One example is the block meant to display the "Unexpected test
> > without subtests ..." message: it would never happen, since that
> > condition is handled earlier in the iteration (i.e. the full set of
> > subtests is expanded for that entry in the else clause previously
> > mentioned). The following execution (done before this change)
> > illustrates that:
> > 
> >      $ cat <<EOF > /tmp/foo.testlist
> >      igt@xe_pm@s2idle-basic
> >      igt@xe_pm
> >      igt@xe_pm@s2idle-exec-after
> >      EOF
> > 
> >      $ ./build/runner/igt_runner -d -m --test-list /tmp/foo.testlist build/tests /tmp/results
> >      [36408.109043] Dry run, not executing. Invoke igt_resume if you want to execute.
> >      Done.
> > 
> >      $ cat /tmp/results/joblist.txt | sed 's/^\(.\{50\}\).\+/\1.../'
> >      xe_pm s2idle-basic
> >      xe_pm s2idle-basic,s2idle-basic-exec,s2idle-exec-a...
> >      xe_pm s2idle-exec-after
> > 
> > Let's remove those unnecessary checks.
> > 
> > Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> 
> Reviewed-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
> 
> Thanks,
> Ngai-Mint Kwan

Applied, thanks for the patch and review.


Matt

> 
> > ---
> >   runner/job_list.c | 21 +++++----------------
> >   1 file changed, 5 insertions(+), 16 deletions(-)
> > 
> > diff --git a/runner/job_list.c b/runner/job_list.c
> > index 27cbb10bce56..aeabb59f49d3 100644
> > --- a/runner/job_list.c
> > +++ b/runner/job_list.c
> > @@ -276,16 +276,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
> >   			 * specified, also start a new entry.
> >   			 */
> >   			if (entry.binary && !strcmp(entry.binary, binary) &&
> > -			    (delim == NULL || strchr(delim, '@') == NULL)) {
> > -				if (!delim) {
> > -					/* ... except we didn't get a subtest */
> > -					fprintf(stderr,
> > -						"Error: Unexpected test without subtests "
> > -						"after same test had subtests\n");
> > -					free(binary);
> > -					fclose(f);
> > -					return false;
> > -				}
> > +			    strchr(delim, '@') == NULL) {
> >   				entry.subtest_count++;
> >   				entry.subtests = realloc(entry.subtests,
> >   							 entry.subtest_count *
> > @@ -303,7 +294,7 @@ static bool job_list_from_test_list(struct job_list *job_list,
> >   			memset(&entry, 0, sizeof(entry));
> > -			if (delim != NULL && strchr(delim, '@') != NULL) {
> > +			if (strchr(delim, '@') != NULL) {
> >   				/* Dynamic subtest specified. Add to job list alone. */
> >   				char **subtests;
> > @@ -314,11 +305,9 @@ static bool job_list_from_test_list(struct job_list *job_list,
> >   				any = true;
> >   			} else {
> >   				entry.binary = strdup(binary);
> > -				if (delim) {
> > -					entry.subtests = malloc(sizeof(*entry.subtests));
> > -					entry.subtests[0] = strdup(delim);
> > -					entry.subtest_count = 1;
> > -				}
> > +				entry.subtests = malloc(sizeof(*entry.subtests));
> > +				entry.subtests[0] = strdup(delim);
> > +				entry.subtest_count = 1;
> >   			}
> >   			free(binary);
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
