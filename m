Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E85D10399
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 00:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0D910E0E4;
	Fri, 25 Oct 2024 00:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YUiIErqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3492210E0E4
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 00:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729816943; x=1761352943;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gpsshUWRsq/avEjuijKvD0xcfKiKvalyWi3mXf1uvDs=;
 b=YUiIErqjqc4NbgvjGyAoJ2PYuMHQcs7EbGgUbBTvQbjEnzc1+ZmM4jCq
 5GcqHQTu0eC32zbz5jh+2mDe7kSHKHVFxk5BH94pEKgN563IGVfB4VjFM
 FW0C4wfYygl/nUvW6+JsSXA1YIExUunyHMYHTM6EwwZUZyuTtl442Iq5n
 yYW5z4m1xsVWjg/U0cBB9WyOOEnWa39VYMPx6EkVuMzNfBc5grSlu7fmq
 4/Exp2JiKg++a+6ORC5V2/Fn/q6FjXA0xQXZxTQRWjSb/IEyGE8rEMbAi
 0w6aKUW7DolMdopBvaYWLZN36EpkUzJV0ajefxkqw9FH9ExiQz1sg8ZVJ w==;
X-CSE-ConnectionGUID: YDF4oOXbSlGzaXljlbzx9Q==
X-CSE-MsgGUID: Ufaz/6NXT9OPEKyod6OA8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32331633"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="32331633"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 17:42:23 -0700
X-CSE-ConnectionGUID: RR6NE4mHRUawKoKxvZ/Btg==
X-CSE-MsgGUID: kWHkFaPLTwakHzMlqF8xdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="104074055"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Oct 2024 17:42:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 24 Oct 2024 17:42:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 24 Oct 2024 17:42:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 24 Oct 2024 17:42:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDLaGXZpn0fsBhx6TPpD1e4z+YFMgUz0ZYXNQu61tvavvhDPDkPahu9hvm7n8yPebe9KRWr7zCKyncSHLO4SN3W0op7FfjTdLEDm0H5UtLa2Q42ilC5kU9QHzkNk2cpi7/MGGV174qgighDWc+yQ0YmWAyjhIiYqadhAIEI2mxA7lEeP4ZrjhBTGDSJ6eGTSuh0KMOvydA46g4C40CWUgzdWiudE9jf0JZmjBQo+oIKaz8OEpf2I4WNmL2KepxXCsZ1L3BFQViGzfvRst/Q0s5tJ6ln4uw4+9HVBw/dHVUpPTwkGW1qRe3oBn6L0KfOencs305Pcge3i0E/2XACw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1AEfKmLbq/2iVrhhOxcIdO+G/25xaCUR5kDb9wX07g=;
 b=XShUiMshofr/zZ62d+egu4VxFbfTyCULIHvDpmWDbjnQRwMmHBRAzgXAYSzM67iGfp3KdrTSLp7161d1nU+kV+SLqayJJv0VgeAyJNY5/zlbnWS7PqierPRvuM3Y8nwNUcMM8NXa09sVnI4i/RAkTEHREm/JPUK83FTS65DWtIgj7GIh/brdFQL9rx6PtJ7hIRLJVIw0coWXrKx9NJWzQurLNwLE4aA8jdvTRf8tNeNtZjWtdtCLFhOyMPWSlkfxChbTlf2vmge3ePgIzcLs3RIHA6KDRJBkNFIOc8yyuDoIsI9GTEy+MM0xvxw91qJVphIO9EmQEDn8sTcwlSocKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6122.namprd11.prod.outlook.com (2603:10b6:208:3ee::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Fri, 25 Oct
 2024 00:42:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 00:42:19 +0000
Date: Fri, 25 Oct 2024 00:41:56 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <fei.yang@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <ashutosh.dixit@intel.com>,
 <nirmoy.das@intel.com>, <priyanka.dandamudi@intel.com>,
 <apoorva.singh@intel.com>
Subject: Re: [i-g-t 1/1] tests/intel/xe_exec_fault_mode: wait for the
 completion
Message-ID: <ZxrpVF3N88rDpyvv@DUT025-TGLU.fm.intel.com>
References: <20241025002322.1422552-1-fei.yang@intel.com>
 <20241025002322.1422552-2-fei.yang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241025002322.1422552-2-fei.yang@intel.com>
X-ClientProxiedBy: BYAPR11CA0048.namprd11.prod.outlook.com
 (2603:10b6:a03:80::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: f204a918-cffa-4999-c8cd-08dcf48de1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I6Uz7O+i9q+nNueDpsAnI1+E1Gzsr/prL57hBkWKydvCROwxSXgAYuGV2HJM?=
 =?us-ascii?Q?yj4wLjtf7kzBo//PInGhtVuRAy4HjaHisu8fsSlgC0jhHb6Iigkkf88aAtlV?=
 =?us-ascii?Q?2OBzPQndaEw7OZUWFYEVDW9aOK7Pc4WOIaTSpzdLEyyNN54u51eKg4yJCScG?=
 =?us-ascii?Q?XuBlH0zGu3jRcNT0ETyhJ4Ung+FiNOZS7f6xbhcN/3VjZLEvYBdL97oGH0pY?=
 =?us-ascii?Q?eAwYROYkcOTmRLg6o7aAqrsW1I7YZnJojGuBwiH6RS2Fy5GWN01Wwq2S8bhy?=
 =?us-ascii?Q?VZIeeCa3XKEEqG8RL6Yx/8yxH4SiFWuVcx4p+EneRhsOGkpBJp9Ea7IOtHGR?=
 =?us-ascii?Q?D6sPAZwvlJ9h6nZiFVheqRltJ3JYdk+49uJJmOnI51pQuWUycuqIzdE4uqtk?=
 =?us-ascii?Q?E7qF7gvgaFct0AsD42JfseaApvKss8Hknb1vz6FiZlDWpC/AAkAIBt/HGeo/?=
 =?us-ascii?Q?i6zlCH1OHpFCm5iSLqXVbQfIWRwse0ZDWh8aVtMjAn4oie8WBMA+4/2+77Ii?=
 =?us-ascii?Q?NC1JVxl4tvk4eC2y315mUJtqFUs8k6hvR6C6G+fxbSIk/4CwM2AnBqLkZHys?=
 =?us-ascii?Q?OgvuAwseewz+mpAyuv+8Egks8dVrtsOXvKqGAk7pJ/ceffpmhmt4GcPH/7sh?=
 =?us-ascii?Q?jKrSHudvWwyJQRm6Dp2z2VBOMKVSKr1CvknlqgN2diix2DMwmf7UHrv3/aGl?=
 =?us-ascii?Q?vZcoUBTmTzzIjzKji/4AaC2Rqbcy8gKG1WTIx3ldt8Wnco7YvKjozsMYYej8?=
 =?us-ascii?Q?7tqdYl+m/YpxHx56LxOHJSvqQiE1szSpJi/uWctGS1QPGGviLmSZs0Nj8v5J?=
 =?us-ascii?Q?l1ySpKqTfqYU1KXYdp75v/PB4qljcDmEJ1T20mbdkEswKkHPOh05iBVGqcB8?=
 =?us-ascii?Q?DVaJYzHC/4mUqo5b9/wlfhjnuC9tu3MEnFUA1H/ol2gxMt8yg+XzpcolUFwF?=
 =?us-ascii?Q?q9yrO+iKWzlc6PgxdTHNfRIOYUjW77EOmXCKqIQGj4rtIXkQ5aewRFD0ux8M?=
 =?us-ascii?Q?VkNtkUTBsXSkX+dpx8YHxZj4+BvFlcr3aCYlxqCVkY8NBZolJ9E5lKOvnfkT?=
 =?us-ascii?Q?Gga7CQN0gJg0vxp2ctVXMusfP6Y9V0KhRvJPUv5R+qXDtTnJ21YouRGbDCTd?=
 =?us-ascii?Q?oBO7VkQwmQUS/VGgIaR76dyiT6IiW6lpgnzQa8ojZL33LHRnJc9bKbWMidsp?=
 =?us-ascii?Q?2m7U7G+x19HTzPhXavbjAd7qiI2y9rNOliu0RlKKMEC93FqqdVH09upnfct0?=
 =?us-ascii?Q?pKTAJ06tvFnUXN0XMJ2tIBbvnQBqqSDuVgh9SqZoENCIDqylPDtwlx2zw8Pc?=
 =?us-ascii?Q?rHvpKlI85/8dKJy7E0oN6aES?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VqGQiHv8CHB6bYr/akE05JZPY27nPvYSQnA18TOfX30yHm+sfoqFGLzcjZwu?=
 =?us-ascii?Q?34yvWIxAgcgO32fykNYPvyeK++ixCYh1S2frlT3zs74siGDqGqREX7tJCQgz?=
 =?us-ascii?Q?CE1lBuFDjsThypzAFEN2yXwCK1ocPj1DSJWw8+uJR2v2afvzOjR78BbeKjAg?=
 =?us-ascii?Q?OtQMLrC5QkY6ZNCM0MuFqOIqgFMzCyXgOlalPszdhkO8WGQ7o+dJhfmDCitY?=
 =?us-ascii?Q?BbVmseyh05PEQpeKDkVd7FHpah/KLnquw6ueL7P6KAMP483SwOW41FxGgxMs?=
 =?us-ascii?Q?9+ZxYqZ4hX9V7Vu6F7jJKskhw+XvZzibKIJ9bNY6QjxcjG6aqUkcZ9pq9twb?=
 =?us-ascii?Q?tOnO7ebef8GAkC3f9SHwN038XhS9ZE/PIE/svXUGU3lh8zQcdzinozklValw?=
 =?us-ascii?Q?JqCC7pFD0vFvrwzQLtsBGgX6OrlA+1tcQiY7YX2sovmhtBhIa/cQyFmwTVD6?=
 =?us-ascii?Q?hvsAhleQvJ25WKtrRmKoGORicoRIMXfe/MebH6o9P2Iv1TjoBTFhbgiPqJhO?=
 =?us-ascii?Q?4jCUEWXpnszkPhtAlItHCouKo2I+KLa1mmE+vimR4b3DmYmcVnW0poFjx1CS?=
 =?us-ascii?Q?/j3o6UaSFye6dB/tqsoYxCtqUy93Ff4EHOKK1y3EZxZ3FCBx0JO2anan7VIj?=
 =?us-ascii?Q?FrLskFSmctE1c5dqDAspjYT4HKfrBTAgc39DYoK9X/l0PO4xH81jTfnh+fT9?=
 =?us-ascii?Q?xhyVwkrux5bbF1nNOWke9BEZaIuRDbcx/wReSjewbplRoXOSlQ4yDwvKQhLZ?=
 =?us-ascii?Q?JxcI+M8zqX+snvPS8JvhAecxC+Q8jNyRlgMnHklzLewJCwJVhYTkb1JDdOfk?=
 =?us-ascii?Q?BfNNGXPhCzud8Vt1ze7JGuW+VCR4zYa2U1UWEqzlCd+oUzO/l4QYwQVx4djl?=
 =?us-ascii?Q?bL1tzQOeiEdj2tb9qYyO06hRWeofH17k8xlUcQMDjoMu9ff/iejbKmpKQ8z6?=
 =?us-ascii?Q?CeXh0UQcsF68HpSo1L2iTNY8szQZ0T3FHADg4fEaZw9vSYJ8QsPWa4Q22g50?=
 =?us-ascii?Q?Ek+t+rLWCxnJm5WIvFqMlrxyNk7U/SQObY2tsmVYvAgjvVeERBeMbu3J3q9Y?=
 =?us-ascii?Q?d9iYGgGr54MQb/bHaQGtvL50L/Fa/4aZmc3/sQTUUS8Aq/L9PmJt7P8b93xY?=
 =?us-ascii?Q?prHpWooKabKO4KbmRbUhynqBL8heS39RQaVhyjqZwRektkPv1ZDjFdTJpn2F?=
 =?us-ascii?Q?T2eq/TLiPUDsQeQd87Bi8LMHSege8e+BMkCfJRN890m0D1MhEuTkikPXmoTr?=
 =?us-ascii?Q?yd4DuU1d1NhSUCA+e8JvXHow9XaMX1mVMCUJt3ql+QsEbI8o219FaqLIoQ9T?=
 =?us-ascii?Q?EawGGRqLpSxb2YKHcBkgS2IEb17biwInydLsHK5pjro3zgBi6HkdOvw5hZU0?=
 =?us-ascii?Q?cbNySIzC4EaKIIO6XfRyCwmnjCcwqaS8XYNZCj5dJUY0gNgX1cAOUPn92JlE?=
 =?us-ascii?Q?BOspgrRwe2Ium8cDw9vg6zk8M1+4b1u3KyN6IyqZ8bHwjWSnTHET/c+fTdJ/?=
 =?us-ascii?Q?CjVNOfgTe3UTFZ+A1aSW9LOJxWKp+8RZf7ZmcDMXip3/DI0AjH8F2xB0fFjC?=
 =?us-ascii?Q?+wbhLHZKw6rbT65ajh9Prw+8T8vLcZ6dLorWioM55gaj5kWIp9rFl0Kk3Oqj?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f204a918-cffa-4999-c8cd-08dcf48de1c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 00:42:19.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXSfqsiAe18CpgCkFtCqXaQTtNU7yqcGFZNaY6D5e4xFi1cLhDMc2isMeclGkRfwRESypv7iZ00rVkVSDdI6PA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6122
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

On Thu, Oct 24, 2024 at 05:23:22PM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> The execution on GPU is out of order, the completion of the
> last submission doesn't mean all the jobs are completed. We
> need to make sure all the jobs are completed before moving
> on to unbinding the buffer, otherwise the test would run
> into CAT errors.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  tests/intel/xe_exec_fault_mode.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> index 9cc51b7d3..d416c773b 100644
> --- a/tests/intel/xe_exec_fault_mode.c
> +++ b/tests/intel/xe_exec_fault_mode.c
> @@ -305,7 +305,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>  		}
>  	}
>  	if (!(flags & INVALID_FAULT)) {
> -		j = flags & INVALIDATE ? n_execs - 1 : 0;
> +		/*
> +		 * For !RACE cases xe_wait_ufence has already been called in above
> +		 * for-loop, we should only wait for the completion of the last
> +		 * submission here. For RACE cases we need to wait for all submissions
> +		 * to complete because the GuC scheduling can be out of order, the
> +		 * completion of the last submission doesn't mean all submission are
> +		 * completed.
> +		 */
> +		j = (flags & INVALIDATE && !(flags & RACE)) ? n_execs - 1 : 0;

This makes sense and xe_exec_threads has similar code to this in
function test_compute_mode() and given that is threaded test much more
likely to hit this race.

I checked xe_exec_compute_mode and I believe we need a similar patch for
that test too. While you are here can you fixup that test too?

This patch LGTM though, with that:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  
>  		for (i = j; i < n_execs; i++) {
>  			int64_t timeout = NSEC_PER_SEC;
> -- 
> 2.25.1
> 
