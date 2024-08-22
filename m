Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298F4C5320E
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 21:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D640A10EB0E;
	Thu, 22 Aug 2024 21:01:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkq18zmP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A6810EB0E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 21:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724360490; x=1755896490;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QAxu8qq8Y/L5NxfT5xrdZmZLj0h2LekIOxcTJezgsIw=;
 b=dkq18zmPswFHAaXMxQebzBoWMOKQic7A81ZNltqa/5YmN3KyxC2O/xju
 K9E99vI3/PEpjF/EMiJ99ee4y61hF7WaBUTvSy4mwSJDDTSqFS00iECpO
 CbGV8u/x6pObRdEtnX6YHHXq3e2rgykeP6SB1etdDEYpev7MYpDl1QcMJ
 OTtYBP1z9KR3g90EwAhKAdNOCCmUr3Qcr3lJ3irubfLeNTweZnjghbYj/
 PdSlfnySUOMEGpp+ieBHgi1S2Yo3ouPBSGDJYPNiXcUqV8oL7cNZLQ1Lw
 zcZgOHw2DdUqQNaY3oQI+69Bgies3X5vzumliZKQVyvPeP1kYrZA8rsHj A==;
X-CSE-ConnectionGUID: n6on+WdLTv+lFbZtmwVdjQ==
X-CSE-MsgGUID: X96AKXkBRrWCyb9WXJlYNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40269460"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="40269460"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 14:01:30 -0700
X-CSE-ConnectionGUID: WFgNFFOxRTe2XamTVn6RLA==
X-CSE-MsgGUID: NYBP1tybS7qDZmdHmbxruw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; d="scan'208";a="62290076"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Aug 2024 14:01:30 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 14:01:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 14:01:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 14:01:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snRolchVvjGcLUz0yVK4J8z2zixCFY3IISuf6zHSU1ViVfDJxsVGs3RBntbAE99Fzuk7nXZiiTUZgVSwss7aWkkkJn9x7/3n7sTqhesiy3AMe2JjwrK1SG4CwQXQFcMncoQXzeN+7BlppVbHty8C+3K7Sda9PpTSXWSi2tKdPoKpKYX/pK5MyeSMRBZIuZ7c0eRe63UaKHjX0W9mAvfLJGao5LtxVQZEEXDeZV107TnrawD3g+bxIp2NRj8OhHRdiI1xcenwP1Hd1Y/4Ke5kKf7nGY2GrCs2IlzyredCQ1XSOPLGdVYmHuMMXQyDBlDa0Uhwo0fHfFmUUmqEKTOXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Wpf7nFQ5vtJIfMgY8CSIMIA0gliKH+UZ3CA9zVCeZs=;
 b=NIRV4KfWtD+PQCHk/Skh5IFNkPHpNGY9jQSJRuvAn5GDHU2wwkuJdspHHfk6UVKjnh95P4NjhzX2KUZlz2aGqt++JHMBAC7iNpbCicll38zf6Q7QC1JSNHy02kddNHpWoc2d/vtsNdw9PSEZ6nPF3VH7vdlnDyAmkUO4szOlYFGMy88QKsHrJOC15g69sSBC8sOlCRb4R6E4f/NqyFB39RezlazASmwzhvstLGbFZkCjVO5bvi4Y21+YqjMxRlSLHRQJXuHkJCkHRZBcRR8guAtitGZPDpV/kDw7Yzfecz+Ep07pRx3F773cbKfoGOb55ezpQU7lYEfauwYNcxQRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB7276.namprd11.prod.outlook.com (2603:10b6:610:14b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Thu, 22 Aug
 2024 21:01:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 21:01:24 +0000
Date: Thu, 22 Aug 2024 16:01:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Sujaritha Sundaresan
 <sujaritha.sundaresan@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <katarzyna.piecielska@intel.com>
Subject: Re: [PATCH i-g-t, v4] tests/intel/xe_pm: Add tests for suspend
 without display
Message-ID: <4e6gyyd3qf7bfyrtwbun4w42clu55v7r5glgrfikstw5hs5xyn@wdfocxn3uqsg>
References: <20240822092058.26784-1-sujaritha.sundaresan@intel.com>
 <20240822165243.kfcmvdlxsxh6p4mv@kamilkon-DESK.igk.intel.com>
 <172434871596.2055.1015145340873010177@gjsousa-mobl2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <172434871596.2055.1015145340873010177@gjsousa-mobl2>
X-ClientProxiedBy: MW4PR04CA0223.namprd04.prod.outlook.com
 (2603:10b6:303:87::18) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB7276:EE_
X-MS-Office365-Filtering-Correlation-Id: e18b8363-4119-465d-ddca-08dcc2ed94ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OxTkRcmmG/VFwEMs0cTEQguXpHJ0ELA5AHZFBUsCHV9hcqoS773CMrkkf0vl?=
 =?us-ascii?Q?NqOctkiD+mw/EfkbNuCqoUINGAx+cC3B5JkNulHmD4nSk5nowIo9u7W53UrA?=
 =?us-ascii?Q?4aUwEibQ2Tztu0zRwDwhhWoB6bFZGcr9kSeKdWa8SnPX6BkCJZpsfgm3KH/W?=
 =?us-ascii?Q?fGbdheUYlB0ED9tjvWMj48XVEqTsWi79GtX9IkLOh2mChElCN66W3tuPTsvx?=
 =?us-ascii?Q?qEbSslJ9leH+fGTrfdSkT9CCzuOXVW9WzOjojaWQr5wLT81x9siJxRs5qI6O?=
 =?us-ascii?Q?5Pm/lrNXOmPAwVVuyQriGcuudcTtJ63sR/nM7nytTRxi1EbMBosf6B2LwKFD?=
 =?us-ascii?Q?l36J7qFSWNstFEjqOk47ZcA9FYSlDuuO7FESLYkqe0s3oYesafEiG7Ikit9w?=
 =?us-ascii?Q?MNtm4XD5bLLqKuBlrqdAyk+FNqbS4bw1Rj3AkdBaSEB47I9PcCtsh8zIwyPj?=
 =?us-ascii?Q?SpfwYKXRaFwo9EMzWOVQJPDzXY9mEkSR8uyONpdNxLxn2yQxYT+YiUlm3E83?=
 =?us-ascii?Q?eF7n2bk6/OnQVjdurlWGRmVF0AkOl9UdzpMBAl5Fl54Pb/gXkNMXunzxhPDs?=
 =?us-ascii?Q?xmN6CYFY5iYCl/LU4KxHLakQ8qrKs9VRv/EC3VCuuBzYPGKjQG8K0HIIG04d?=
 =?us-ascii?Q?pFfw6CFF30TbW35v3yEh2rbrA6byEIFCe7M48H3T9paTIxhG2r14LCMP68LX?=
 =?us-ascii?Q?daNPhdhUW0f351DXmGB6IIfvOHV3flD96HJZkUeuWHcfh4mcaWT65v3pBJyo?=
 =?us-ascii?Q?nsJ4mBBHYTQtlxVloFp0DpNWv9VyRlT9zn3oluB6QXfbbPpbELS7iEKxFhN5?=
 =?us-ascii?Q?CeLUal/jLShXPymyV8o2K/zS6HeNlj6dYITgqiNgDMGv50L+lKk5XGDH8xNc?=
 =?us-ascii?Q?JAoWmsWSTpaMgDkjyq93l1bMLtYGKXA2oQpflkM3OY4plLEWs4qJ3K9OUghJ?=
 =?us-ascii?Q?A7BRHiY1UgA9ueXm8aoRrceyxnp82QhkhGNUA5FZFUxuazFZ8qAk+VZ+uA2r?=
 =?us-ascii?Q?mUu0ujjpowpbYEquVPVN+D7jQBZLpjr/3yvmpenBJGLFS8Yg9jpp7hr/QrfA?=
 =?us-ascii?Q?HMoRf2AG20JJ1BtlSZ4wMPbG9dLSuUsN3aPZdnt6FR/HIPHKc0K3DfVmq0wu?=
 =?us-ascii?Q?tILqVUeQ6+hZgBxNLRZvcm7xw0rH9/og70yL9KDsvIbpuNPTuM5Fb6o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aSYb+TiR8iH1+0sVKFcm6URrhCWCx88hHNpzT+SsP09CGX9uvJ+BxhTUymqu?=
 =?us-ascii?Q?ssAvZpCTTyz9KlILMsfwcWak1xlJ/snJhSLTN7KKcPSdejjmYiBiUf0u73ij?=
 =?us-ascii?Q?PwlFk2LcVZvkj7dayygqY8Owcq4yi5cnQDrvcu9iSh2Fspdnb+r5iOgTeJ1o?=
 =?us-ascii?Q?ZAuSSCxzKuUvjQS8fSjrvXnqG5eb8W309HE2GGCUmlwM+OLCh51wqh9Lo5IW?=
 =?us-ascii?Q?82eIIsOlpi3/6GAqXBHeOqUrh13K6QShwNN/WDanol4amPPsqIMIh+U1Zmf9?=
 =?us-ascii?Q?4CLtILhtr08E+9+Y6YWQy9dRPwi24vp+W2AkLKiXmMW6i6QZ8+x0FAZwG+h1?=
 =?us-ascii?Q?aayMCXi8kAQbx1xydMZAAgeeDalUW3D3hquvp7sPewPJg+Zimi/CYZi3gvEf?=
 =?us-ascii?Q?aP0eHA+kq5IuHqJC3PJCvhcNY0lvcbY9rs94vrsQ9g7aucnzwN9OKMYGNGU8?=
 =?us-ascii?Q?AYJ/ytTCsjVjb+yF5nKTwoPAfuUi+1sTC15shOAWJ2a1QAJVa30eTkyDM1SL?=
 =?us-ascii?Q?wEbp48pulPucaazV5MDzCtDTe5771fwQXwoVaMiRZg5NcTcFCSupuPzUe8JW?=
 =?us-ascii?Q?OCsmkzj+a1w1gbIof7vYaXHbWMtsuu75TotJBFlWicGIEJD7fClX0k1Nauou?=
 =?us-ascii?Q?oEB53UPYox17gl/KufKPftKGcd+vow/NbH16i0d+Sbl4jouVtTFpHWZgrJ2T?=
 =?us-ascii?Q?5Y9I+rzIUWBIyvTqW2yxLt8FYGZ2iqp7Y/4LY13PrjLafrc6vRmzBNf4Nlzg?=
 =?us-ascii?Q?KL72COucyzMrEvnLHDbFHODDfHmoTjzAJJ0FyDEbcyh3NAdzBX/uFrIxW6Bo?=
 =?us-ascii?Q?nxnyrsK+UNe5hHVtfe0ET6xLarD/otpn9/T7BZLdUevmfZuAEmAGn7CHO2Ka?=
 =?us-ascii?Q?2REa4Wd2Mg3ctQFh5LaZxld4r+5pKAOAUd8jMCiRt8j9ySHkfzbTwnjiuTJc?=
 =?us-ascii?Q?TwReyXuFyCI47i5EXNn6G0/csX0O9hBrfmGnvahed/BqX6pZNuFAxdT1X0sQ?=
 =?us-ascii?Q?bzy4FJqnOVckJofW05zKvOaqdkrl+8IndMUL/h/CQGDp7I7gFaQxBZEaO1bA?=
 =?us-ascii?Q?hhdjaILNPc7evoMqAaaSmDytYiUVOLsdMKeChcQ+ZKRW3g50K+gRcx5QAYU4?=
 =?us-ascii?Q?bkPBVr8gjz1+3ZnFmwyi8BtL7GT6m2UR1THvLgLln6kiV3K0lXY4NSRRtLcQ?=
 =?us-ascii?Q?IK+nHY50PVRhpMBzYPSPnpW2bsQY/z7MvMfP60yPIkUFEqnRGPgLwijqnntS?=
 =?us-ascii?Q?63ftF4hQd8HjASht6j8Fi2keaUp+z3qWBQdbeQ3Z/QqfxOrH9tu4lIzaeort?=
 =?us-ascii?Q?eflOevFWtrnMUgZGrwG/z6Y1o/mcGlcq4uS4t2jZw6lFxfD+itDi8jjsZs15?=
 =?us-ascii?Q?0wcqcxcdeAVe+fies7fFADmOkMznxBNDb+q3SggctAiKpbMibxeOrjgxoyaD?=
 =?us-ascii?Q?HaLk+W4zwwT3JWOpPHvF2ju/PCfKEqAIYKQsb65BU7fwB88QBAek/VrA114P?=
 =?us-ascii?Q?bA0+Y2CTG1N8UCys1KtbACWCNhDTWMrzap57oW1lWfa8DADtbypea6e5mf7b?=
 =?us-ascii?Q?gZoUIO6gl8RWG1xMaeCaUOv1dv2TQbAXV/vxijBJ+5bCXLW9VxmtUuUCNZ8g?=
 =?us-ascii?Q?CA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e18b8363-4119-465d-ddca-08dcc2ed94ee
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 21:01:24.3446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S4uHjJDmKt8UTS/EBbVN8ko7dLkRTBUMJeFd/7FtM+YGMrg+5w6lTm4WrfoJqEu9sZdp/8lk4k9pFT9290M2hG5vK59F5AHpp9f+4s5o8I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7276
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

On Thu, Aug 22, 2024 at 02:45:15PM GMT, Gustavo Sousa wrote:
>Quoting Kamil Konieczny (2024-08-22 13:52:43-03:00)
>>Hi Sujaritha,
>>On 2024-08-22 at 14:50:58 +0530, Sujaritha Sundaresan wrote:
>>> Add tests to validate basic execution suspend/resume cycle
>>> without display module to rule out display related issues
>>> from the suspend/resume stack.
>>>
>>> v2: Add normal reload cycle after running test (Anshuman)
>>>
>>> v3: Rebase
>>>
>>> v4: Change commit name/header (Kamil)
>>>
>>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>>> Acked-by: Katarzyna Piecielska Katarzyna.piecielska@intel.com<Katarzyna.piecielska@intel.com>
>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>> ---
>>>  tests/intel/xe_pm.c | 34 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 34 insertions(+)
>>>
>>> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
>>> index eee89428c..1623a56c7 100644
>>> --- a/tests/intel/xe_pm.c
>>> +++ b/tests/intel/xe_pm.c
>>> @@ -17,6 +17,7 @@
>>>
>>>  #include "igt.h"
>>>  #include "lib/igt_device.h"
>>> +#include "lib/igt_kmod.h"
>>>  #include "lib/igt_pm.h"
>>>  #include "lib/igt_sysfs.h"
>>>  #include "lib/igt_syncobj.h"
>>> @@ -229,6 +230,10 @@ static void close_fw_handle(int sig)
>>>   * Description: suspend/autoresume on %arg[1] state and exec after RPM
>>>   * Functionality: pm - %arg[1]
>>>   *
>>> + * SUBTEST: %s-without-display
>>> + * Description: suspend/autoresume on %arg[1] state without display
>>> + * Functionality: pm - %arg[1]
>>> + *
>>>   * arg[1]:
>>>   *
>>>   * @s2idle:        s2idle
>>> @@ -681,6 +686,7 @@ igt_main
>>>          struct drm_xe_engine_class_instance *hwe;
>>>          device_t device;
>>>          uint32_t d3cold_allowed;
>>> +        const char *opts;
>>>          int sysfs_fd;
>>>
>>>          const struct s_state {
>>> @@ -757,6 +763,34 @@ igt_main
>>>                                            NO_RPM, 0);
>>>                  }
>>>
>>> +                igt_subtest_f("%s-without-display", s->name) {
>>> +
>>> +                        if (!drmModeGetResources(device.fd_xe))
>>> +                                return;
>>
>>This should be skip or save it (as global?) and run test on headless.
>>
>>> +
>>> +                        xe_for_each_engine(device.fd_xe, hwe) {
>>> +
>>> +                                igt_debug("Reload w/o display\n");
>>> +
>>> +                                igt_kmsg(KMSG_INFO "Unloading Xe\n");
>>> +                                igt_assert_eq(igt_xe_driver_unload(), 0);
>>> +
>>> +                                igt_kmsg(KMSG_INFO "Re-loading Xe without display\n");
>>> +                                igt_assert_eq(igt_xe_driver_load("enable_display=0"), 0);
>>
>>This param was renamed to probe_display, see
>>https://patchwork.freedesktop.org/series/137096/
>>tests/intel/xe_module_load: Rename enable_display module param
>>Submitted by Lucas De Marchi on Aug. 9, 2024, 5:30 p.m.
>>
>>+Cc Lucas
>
>And disable_display=1 might be more appropriate, because probe_display
>would simply skip the probe for display?

Good point. For platforms with display, is it expected that suspend works
if DMC is not loaded? Otherwise we will actually have to touch display
to disable it to be allowed to suspend.

Lucas De Marchi
