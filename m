Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D11C98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 17:41:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B1EB10E93B;
	Wed, 23 Sep 2026 17:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R/XNNp8t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09FC10E93B
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 17:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790185243; x=1821721243;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WlcCQfc/7Dy0L4oaQI3RCYkyh+5wAIHYblFEPuNqbX8=;
 b=R/XNNp8tR0gvDb8k7FNBOthdjLqKCi7RUW4hIjD0N4PtHgHWuOzxSQi4
 Oymlss0iaTQAbxFbMZDIA9YA5N6nrF+A0R5e9Rcc/FuvILj39dfg/noZB
 KpXfPQPmu4jlf8m/DYQQrqnQxJXyXainSIprZAqkzyylGXdcSErSGXA8N
 kF7BC3O7j0qznSerEueE5lJam9+vb6C+d1DTWq6qCpaIO6Ck1jhxIl19r
 pKW4pMaW8ydpnSPS8RmLk6bfNM9Q+SVFvVJ052lnqdqCVP2VOWbirxHgu
 RzN0FEsoRdt2IUGOQQr0/Ls+KUdSnnrDOU936O+V3knueV+ti56Al5z+S Q==;
X-CSE-ConnectionGUID: W+llnk/DSjCm8fxsNyAJDQ==
X-CSE-MsgGUID: vLdDNaG+RM6hM20AlGe2DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93410409"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="93410409"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:40:33 -0700
X-CSE-ConnectionGUID: AUfd6eWMQx26Oc+8OiJLaw==
X-CSE-MsgGUID: oLrT4PJMTUKnIJKByV2lsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="272888987"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 10:40:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:40:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 10:40:32 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 10:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=urcmyhYgN3lv74UZd6y4NVSCIp0PqSHyHTq2uw4WJ+k3fgkvl8B3NhWljtgQrvMnnqJWmMYrRg2mWFlq6ySFFiAvxmlv4WLQqr42D4M40cg1dMhczoO+MroYsg7Uz2KfO4gbyR+Qs1AoKzqe2lkxqANyhjHsXWQQ+iixY0BzRBHrjAItHB1LZ4XssESCqZ3k7glMwj0cfWR7+rR4oIsd0emfxt5jm/H46wlCtkdl8Y9AQGBLO7KVCN/DJ5tLBHiRJcMcMYE2c8X7RGonUJ7DN7ZCKdvLlTPptsu9ONKrTntoQQHpnxBPbFN2BHzXcJP+hq6GMXdKu5wsyhSk0kJMIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HJ8wSOzms3i5YZ0HMHkxXX5p0SCZwtJFdI0xbU9vtc=;
 b=TjktfHU7UEDUIMBhhf02DWu9/eX/hJZmCnguZtiBR9j0t2ulbFH5vXeDYN+WAuY0uy76TzQsUdYJNc0mdPhi4ZEN847dEoMoOG/mewVZ5NWF2QEkkcNF4mDTZG7WNrOgWyODApyZyxATYQi2fuwOnlEVmQL6Yc4yL238+HTykGeSEdGOdix/jBkEmUPbOrJwMxE1iY2ymW3SkE3h6+4S1wBFVRHrPnyRrF2tmggcj/zWIPm5/MknDN2lAcP1AmjyCsRpsqYhgyla/4Tk4WUqsnNjWPIaN+mTwvxiy68Jrf+QGlUkGjiT9jlto5lxJR8fOSbWVprU9FMnft1fqWbrlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB4861.namprd11.prod.outlook.com (2603:10b6:a03:2ac::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 17:40:16 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 17:40:15 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 08/10] lib/intel_pat: Encapsulate management of
 xe_device's pat_cache
In-Reply-To: <20260819204325.GP8279@mdroper-desk1.amr.corp.intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-8-0c147eeefefa@intel.com>
 <20260729223532.GH7790@mdroper-desk1.amr.corp.intel.com>
 <87pkzfb80x.fsf@intel.com>
 <20260819204325.GP8279@mdroper-desk1.amr.corp.intel.com>
Date: Wed, 23 Sep 2026 14:40:11 -0300
Message-ID: <875wzvj284.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 29638533-35e4-416e-fdcb-08df1999ba42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|22082099003|18002099003|3023799007|5023799004|11063799006|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: gCro2A76GqdeJWlQqdKXhmySYTtr1i5Pmgn6j3KtM/khqwIMBxVeWqx22lT3jOU8JDo/DmhOs0K6+ZLb8FyQM4lOO7Zyn36YfKjkDzQs7EkGNOoTRBBrVqK/BXqKdtr79s08jmcZM4KVTVuIdfkb81qfksnP4RLQY/u8qutzrQeL1PIGUYpQnhAA9qmRY4jN67HkxXtcOVy80ApNAyWkYIXwn6aIdCyK/hVrisz8SOsMZKGbHnOiy05l7fI3PsHfgpRpqn3uLKO7tRG6oyh3F2AcXxoB2CFX02/g2zbsWqShdRW6xjJ9SqXGv/mFPpRifjQSqw2r94DzAniQMN9BdRuW5u/f/bzfDpmCB3caWpKQm25FIxWF6pIO93v4ebu815mH15JnqIzzPEjhBUkAYLC5kIPPBnp2UVyMrRoNIVlXV1su/SusCHVwImK+yEqXMjXk0mvYvzYjhae4Lf88qdl/7vFI3ddFfbtEsTT0w6UQpc+95Xzd0YcQ60dWJx7TX4gv9d4gYApYTxKj8KoRDf6tH1FiRc00ce1pC2mO7DpwlvJLRGcTJgNxULM/2iQsc3psVbQWTxo0cu46NVMJPoTfzu3caUCfq6k6dQi+I3AX32LQZ3Lolx9fZdiCIbB1jLltXtffw1Y1C0q6hZCzp+bw4gmTgqmMd87K5ixy+do=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(5023799004)(11063799006)(10067099003)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wHlyMOw3O9g/lW/c8NG/33a7hJxup/n/vM6mEgp0k/pE5ijnYZyBrpnNJjnt?=
 =?us-ascii?Q?2CZ3T/NeapuMDHhqWm+MAnBSRN1OqpnrxUfRR6X5pAaWNpn2/oGGXLrnjegA?=
 =?us-ascii?Q?ftPf+6lhc4b9G3GOD8rAYV3/2Y+b5GuTWnMyGOCTKImgdRSOZU5OBINve8q+?=
 =?us-ascii?Q?SR4G0swvCtktCLF9m9H3CG1SdADuAY3j/zRmufmwglW3iP27QPnLj02GSdS3?=
 =?us-ascii?Q?fffiysjvogMJYtaMXHH5uUp9wRK/zw5K+kamGtuRvAA1CihbIQyHkVbKlA8l?=
 =?us-ascii?Q?Rb2qy3N6vDd2K09DhlCo3oJG+u6+KAYAhIwzWmbkk2G9PVaZahFBd76CFKMI?=
 =?us-ascii?Q?hJQDt+wYS/Fx1VfyhZq+YDeX05meG7+SloAMPjHQLXPi1zhSs43YgIcYRZup?=
 =?us-ascii?Q?Tj/uwcW2d4qDrdb3BfH0fN82ZswkuRPd4HeaqWsypwoJH3gotAbFkOh9i/sv?=
 =?us-ascii?Q?+8qWMCmJkNgmNrPTguH2WUgj1xoXPU03ixV+MwQm7uCuy39pYQx8vGH6Js1J?=
 =?us-ascii?Q?nBxmqEiAOIlJ8KmCkZZasII4VdkuCzb3+osQkpNmsjen45TSxYpVPgeS9WR6?=
 =?us-ascii?Q?QuSlKEoyYZN3nzwUzOd02K/QowVqzCArjAI4qRT9nmEtrY2l63g6kUByNkcw?=
 =?us-ascii?Q?zUd3fJ8nIvKCCNBPmNEj+qg8M0AORWtGApBOPoaXCk9GuYIfFIojNYS9T4sp?=
 =?us-ascii?Q?YW+1MThsqBn0ksuOvMnam5MLkbs+aL/bQpia/aRr2oshKcOsHZVOXtxibmY7?=
 =?us-ascii?Q?Kzj9DfhN8h29S2gAOAlr6OWuaBZOagJHZWq/QobNUDiNhmaHN7z/DOWC6FQu?=
 =?us-ascii?Q?Kfza0IVk1Ps3EzHH4J7F/WeF42o0z58CJZqzfWWZIXPVBWMuCrMN5PzGGP+H?=
 =?us-ascii?Q?q3HCkL5yOgE926Qpj88d4i/rhDieOiIqWqx/K+CaksoddacReiwJTKeux2er?=
 =?us-ascii?Q?KTM4dwGFPXyWy201zxUlybCgzxSBky/Vp9yLpX8iuNh2Q02RSmUy8RwgjPRf?=
 =?us-ascii?Q?ba3aQPosWoPb9fU7Cf6/aPRJdLdVYhqCMB+dDFl9YOtVRHWxksL2Hkldz6g2?=
 =?us-ascii?Q?+9hZZcQsttlKTfhkcE/d0ya60orfou5CsuQbTk20MWoHMBYdjpohmIn9G0rC?=
 =?us-ascii?Q?mcbnMRB2cchExbqEGetAzkOFkqgsibLZlqBN5R9tvNZvW8kAgUIbPlVAJZk8?=
 =?us-ascii?Q?CftNTWhBiWgQHzXirxDuX8qg0bRVoEjG9/wGppZevGeNLQ9jzxj9wXIiN9nn?=
 =?us-ascii?Q?hbmuZa9WVslQxeSwQeBMPE8yasRyQmw3Pqx0dLnMpxr8LMUJ+Kl47re27fw0?=
 =?us-ascii?Q?nkIl3IDk3+/INlutyi3PqP55GV6zw1Ne3/8+MNPUXQVXI1NYS3EUkSPX9AFo?=
 =?us-ascii?Q?F6mlAgoJVka/pVFBtLXU+CcWxoMBAJpWDGsLhZuKdCm87hMwEji2UXyGTn3Y?=
 =?us-ascii?Q?OF26Z8mGRcRGcEzYowi/9ZKTP0yJzLQC7dqsWeZMfdtL0cOD6J0YOK0u78Xl?=
 =?us-ascii?Q?feFXUHpUvOz9fRPVeoiUkmPoSIJV35rOpDlPshEySCklFSNA+CvHidZSIly/?=
 =?us-ascii?Q?iknKqBMQbsxI1FVP1NYPXY7r2/f7gnxTxoVQXnTsaLB6E9nPHljxnsFRk6Di?=
 =?us-ascii?Q?dJW7cfooRiSelRbXEUPQAtELfKB/fWoZQvED0r4s7MW/gN26T+cGXcanjAMJ?=
 =?us-ascii?Q?i8OffyQbpBlEz8hZuclMuWNpoD1w5eYYVujQWLIBVWrphPqOxln4RQ/Y2u10?=
 =?us-ascii?Q?gWBvfxOm8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: kfMsscsbHt2z7NB58zULxQ2tODBX2XliM6YN0FvKy7rHx2d12ZyKa8gIDiLVXac4tIEYFbmHoNeiFHhQxNZfHOHHFsd1xjzMnVRkLOz7537SfBdhDCarAwJ8svGpo2DSlW6rsjqsXYC9U2v8tYWonRSt2qrVz3kKV4F5uMs0JyLoar9/8sK+drO/UQlc+lpyBe044lWt2l4RTwFJc2eLN57JoABEZ2KWvsy0h050Mo2uyP0o/4lKsr1k3JPcIPXn0dCmpQ+9DisNKazSO4bCKm7KZLqm6P1x9wyFmd1iAVXs3KhLCHb92nIQV6F4bnc0Iv0L4W0GidFw1ZYHG64M9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29638533-35e4-416e-fdcb-08df1999ba42
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:40:15.9297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: teU8YHEWVI6XjbgT6wLix5Y7/Iavjcb/FVsCKD9Es/zH+46CMrDVehUBGVlf3eMXwG0OO1VCD12QXvzJPrm5nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4861
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

Matt Roper <matthew.d.roper@intel.com> writes:

> On Tue, Aug 18, 2026 at 03:25:34PM -0300, Gustavo Sousa wrote:
>> Matt Roper <matthew.d.roper@intel.com> writes:
>> 
>> > On Tue, Jul 21, 2026 at 04:00:01PM -0300, Gustavo Sousa wrote:
>> >> Currently xe_device_get() manages the PAT cached information
>> >> information by itself, by doing the necessary memory
>> >> allocation/deallocation and calling xe_get_pat_sw_config() to
>> >> initialize the cached information.
>> >> 
>> >> Such management is arguably better suited to be implemented as part of
>> >> the intel_pat module and encapsulated such that xe_query doesn't need
>> >> to know the details.
>> >> 
>> >> We will introduce changes that will require an extra logic for
>> >> initializing the cache and having such encapsulation makes it much
>> >> easier to implement.  Since we will touch this area, take this
>> >> opportunity to move the existing management to intel_pat.
>> >> 
>> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> >> ---
>> >>  lib/intel_pat.c   | 27 ++++++++++++++++++++++++++-
>> >>  lib/intel_pat.h   |  5 +++++
>> >>  lib/xe/xe_query.c |  9 ++-------
>> >>  lib/xe/xe_query.h |  4 +---
>> >>  4 files changed, 34 insertions(+), 11 deletions(-)
>> >> 
>> >> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
>> >> index 2f35bb77249f..14935e3c4692 100644
>> >> --- a/lib/intel_pat.c
>> >> +++ b/lib/intel_pat.c
>> >> @@ -144,6 +144,31 @@ int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, i
>> >>  	return xe_get_pat_config(drm_fd, xe_pat_cache, gt, PAT_HW_CONFIG);
>> >>  }
>> >>  
>> >> +void intel_pat_build_xe_cache(struct xe_device *xe_dev)
>> >> +{
>> >> +	struct intel_pat_cache *pat_cache;
>> >> +
>> >> +	pat_cache = calloc(1, sizeof(*pat_cache));
>> >> +	igt_assert(pat_cache);
>> >> +
>> >> +	if (igt_debug_on(xe_get_pat_sw_config(xe_dev->fd, pat_cache, 0) <= 0)) {
>> >> +		free(pat_cache);
>> >> +		return;
>> >> +	}
>> >> +
>> >> +	xe_dev->pat_cache = pat_cache;
>> >> +}
>> >> +
>> >> +void intel_pat_free_xe_cache(struct xe_device *xe_dev)
>> >> +{
>> >> +	if (!xe_dev->pat_cache)
>> >> +		return;
>> >> +
>> >> +	free(xe_dev->pat_cache);
>> >> +
>> >> +	xe_dev->pat_cache = NULL;
>> >> +}
>> >> +
>> >>  /*
>> >>   * Hardcoded PAT indices for Xe platforms, used as a fallback when the
>> >>   * kernel doesn't expose gt0/pat_sw_config in debugfs.
>> >> @@ -217,7 +242,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>> >>  		struct xe_device *xe_dev = xe_device_get(fd);
>> >>  
>> >>  		if (xe_dev->pat_cache) {
>> >> -			*pat = *xe_dev->pat_cache;
>> >> +			*pat = *((struct intel_pat_cache *)xe_dev->pat_cache);
>> >>  		} else if (xe_pat_fallback(fd, pat)) {
>> >>  			igt_info("PAT sw_config debugfs not available, "
>> >>  				 "using hardcoded fallback\n");
>> >> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
>> >> index a31b60e86e2a..fc9ef9b650bf 100644
>> >> --- a/lib/intel_pat.h
>> >> +++ b/lib/intel_pat.h
>> >> @@ -13,6 +13,8 @@
>> >>  #define XE_PAT_IDX_INVALID ((uint8_t)-2) /* no such PAT index on this platform */
>> >>  #define XE_PAT_MAX_ENTRIES 32
>> >>  
>> >> +struct xe_device;
>> >> +
>> >>  struct xe_pat_entry {
>> >>  	uint32_t pat;
>> >>  	bool rsvd;
>> >> @@ -40,4 +42,7 @@ uint8_t intel_get_pat_idx_uc_comp(int fd);
>> >>  int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>> >>  int32_t xe_get_pat_hw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache, int gt);
>> >>  
>> >> +void intel_pat_build_xe_cache(struct xe_device *xe_dev);
>> >> +void intel_pat_free_xe_cache(struct xe_device *xe_dev);
>> >> +
>> >>  #endif /* INTEL_PAT_H */
>> >> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>> >> index ea095b207534..aa81db45a41a 100644
>> >> --- a/lib/xe/xe_query.c
>> >> +++ b/lib/xe/xe_query.c
>> >> @@ -377,8 +377,8 @@ static void xe_device_free(struct xe_device *xe_dev)
>> >>  	free(xe_dev->mem_regions);
>> >>  	free(xe_dev->vram_size);
>> >>  	free(xe_dev->eu_stall);
>> >> -	free(xe_dev->pat_cache);
>> >>  
>> >> +	intel_pat_free_xe_cache(xe_dev);
>> >>  	xe_wa_free_cache(xe_dev);
>> >>  
>> >>  	free(xe_dev);
>> >> @@ -458,12 +458,7 @@ struct xe_device *xe_device_get(int fd)
>> >>  	 * should be extended to cache PAT entries by platform version/
>> >>  	 * revision instead.
>> >>  	 */
>> >> -	xe_dev->pat_cache = calloc(1, sizeof(*xe_dev->pat_cache));
>> >> -	igt_assert(xe_dev->pat_cache);
>> >> -	if (xe_get_pat_sw_config(xe_dev->fd, xe_dev->pat_cache, 0) <= 0) {
>> >> -		free(xe_dev->pat_cache);
>> >> -		xe_dev->pat_cache = NULL;
>> >> -	}
>> >> +	intel_pat_build_xe_cache(xe_dev);
>> >>  
>> >>  	/* We may get here from multiple threads, use first cached xe_dev */
>> >>  	pthread_mutex_lock(&cache.cache_mutex);
>> >> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>> >> index f70476945dee..82f72314f072 100644
>> >> --- a/lib/xe/xe_query.h
>> >> +++ b/lib/xe/xe_query.h
>> >> @@ -20,8 +20,6 @@
>> >>  #define XE_DEFAULT_ALIGNMENT           SZ_4K
>> >>  #define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
>> >>  
>> >> -struct intel_pat_cache;
>> >> -
>> >>  struct xe_device {
>> >>  	/** @fd: xe fd */
>> >>  	int fd;
>> >> @@ -78,7 +76,7 @@ struct xe_device {
>> >>  	uint16_t dev_id;
>> >>  
>> >>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
>> >> -	struct intel_pat_cache *pat_cache;
>> >> +	void *pat_cache;
>> >
>> > Is there a need to change this to a void pointer?  It seems like we can
>> > just leave this as-is and avoid the cast earlier.
>> 
>> The rationale here is that intel_pat is the only unit supposed to know
>> the details of the cached information, so I think it is best to make
>> this a void pointer to make it explicit and also to keep other units
>> from using it in the future without going through the proper functions
>> provided by intel_pat.
>
> But using a void pointer with casting doesn't really address that
> properly.  If we want the internal details of 'struct intel_pat_cache'
> to be something that only intel_pat code can access, then we make sure
> that the structure definition is inside the .c file (or inside a
> "private" header if the intel_pat unit spans multiple files). Everything
> outside of that unit will just see "struct intel_pat_cache;" on the line
> you removed here, which declares it as an opaque structure for them.
> They can pass around pointers to that freely, but can't access its
> internals since they don't have the definition.

Yeah.  I agree that we don't need to make the member a void pointer in
order to keep the details hidden.  I guess the void pointer is actually
useful when we don't know the type of the data that it will be pointing
to, but here it is a different matter and using the proper type is
better.  Thanks!

I moved it back to be a pointer to struct intel_cache_pat.  In the same
spirit, I also changed the patch for cached workaround data to also be a
pointer to struct xe_wa_cache.

--
Gustavo Sousa

>
>
> Matt
>
>> 
>> --
>> Gustavo Sousa
>> 
>> >
>> >
>> > Matt
>> >
>> >>  
>> >>  	/** @wa_cache: cached data for xe_wa() and related functions. */
>> >>  	void *wa_cache;
>> >> 
>> >> -- 
>> >> 2.55.0
>> >> 
>> >
>> > -- 
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
> -- 
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
