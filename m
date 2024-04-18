Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0178CC4345F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 22:27:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A44A310E57C;
	Thu, 18 Apr 2024 22:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ih0CD6Gm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB00C10E57C
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 22:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713479259; x=1745015259;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bfaVZuNh7gbRZ1LxftZM05JZ16b4uUjoK9XkI8LbXSI=;
 b=Ih0CD6GmE+GMs58nwCmCoajhqIE16OHvVkey+9sFq7qojhbXp4XOmrG9
 MNYcRkrqJSycLRhs1+ytO3hL33ojDbwRm6O5PVjrxM9JCP3CG+GVS63g4
 E968ArZCu5JoLBxRP7+r9EQ9kbqh1Dw4YH3UQO3sWqzx1ZYG9hXMxVb88
 xs7IgqEBqpXiRGTtyugGx9rtHUsj9g6JQLVVdBu6KxIKkUMsS+QEc0/lZ
 A3zUPM61FtYjauy2Zb/gEOBoPAX6kW4Oe8FP+q/RbXYVSd1tFb0tmKL9+
 GNSF6gDbUYugyuV+5ecjUMbjZ0DCJHV6qHMzNPG8wOQYEtmPuUBuC8kJj w==;
X-CSE-ConnectionGUID: SJAVvil/Rl6Ep6q0xmF+jg==
X-CSE-MsgGUID: 8cxw+SA5S5efi7xwcLB4Wg==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8919578"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="8919578"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 15:27:39 -0700
X-CSE-ConnectionGUID: 2H7uJ7AQQcKChpWAS4ao8w==
X-CSE-MsgGUID: bQvNWNKoQ0OIq/czzYiaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; d="scan'208";a="54051457"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Apr 2024 15:27:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:27:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Apr 2024 15:27:38 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Apr 2024 15:27:38 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Apr 2024 15:27:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PhnlIypfz4fP63w+emYKn0G6Zd9s4eqnNTzTwKrsAXjSDj8BiFO/MMsJYCQk7vrvxdl60q++/jbGC9vZW2Nxb628lGb1E0tz2kyvUdEhsI/vp7qMTbVTFN2MV6HMgq1EZ3xHpet0KJmvlP7JHLegHnmnUJZstDH5IhvXYpqihS9tGmGiWPvxezXkchD/idcWzKXZDVWKNs9l90w2D3Sq5h0qXfC+Em9cBliUnP4GSXOUMiz5JkwOplz0R0vJpWbtPLU8qcaMWI/JsXYTyEugt5CMZpr6XJMaTUhKLu75cP3YvqCTW8kgt7cV5Ji2uYVXXS0ihvLXu1siXV8xMm/fjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kDqtq/qj73e0zc1OJPPiKFlqPdNO8lAPwc0iSbZ8vg=;
 b=lEChckG3eNscxqhjJ0KZJDBZ/7r2Z+UN+80L+aYFzrHajKyE+rAhkQ369Z0AE48NHcz9nQP3dhCrByTQVoNTMi+0mLbtdO0S8zC3ESZznhI2Ey++YdqbM6Vgg0Gbx3LyYjeWa4s8hF6mM7bHJVDboZD+OMPHDpNLFeBaezSEwrOWfhcyexS8pCx6rAdfp0HTYmqvd2Vd+6LUXpDKqFTMrm6LaQWbE6tpakFSSujzkAgpD6VLU6t7bQ4+hoAX7oQFfdC/OYHsLArubOfcE5OyaIbypANt9pYuu1O7v2nGvYv4UgrXXKozH7dGYluGcbC7J6Wr+F4B4t/HpEmFTpN5vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Thu, 18 Apr
 2024 22:27:35 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7519.010; Thu, 18 Apr 2024
 22:27:35 +0000
Date: Thu, 18 Apr 2024 15:27:33 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 04/12] lib/igt_drm_fdinfo: Assert pdev is not
 truncated
Message-ID: <ZiGeVQ39ioXQZm6C@orsosgc001>
References: <20240405060056.59379-1-lucas.demarchi@intel.com>
 <20240405060056.59379-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240405060056.59379-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|PH8PR11MB7142:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dc083f5-a664-4bcb-4657-08dc5ff6beca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nOdCq73riruceSLIftO5v4a4yODspC/hFTrYbBWTnBHRAjsgf9zRgywEGBz0AIBujwfCXbZFujSdoSNimL+nVRVGZwYbHNCZ4XS97uUq8ZzXFB5l4R9f52d5UCVQKbJo20b1rLsu+YZvjRta2IfX0tmO+zG0LO9TZL9xJAyaE3LIU++eKDi0fBSLg9MrbRoIMzbyuUlwapr+a0MH0WObqVnTY4uKPtKGb9/83TJQvnSeE/IU3GRtDacAlK8MKDYs13TzKfmAkYt701OyGfIgVdZBsoleVK41mcGDftmJreF8BgGpt/fPrm86C23Z7CNEsVXM3q9cKyNCBqQdyR7vCxO85JFhWmAi8tBti+RiN8ezY4ohoaQ5BT11XyhL4HbPxqiIL2nJTZcPZMXiMvm54AbakdpzOK+y65JvQi3oBaiYEjfrdFu+9SRPlXMtNF2JP+rg+VslPbupPcoN7ZpxFtflHL4FHUEw673qvjojQJ8xatCuLbQHtfkTV0b1BEnZ3/SWgTQoQP4/QDvW+iF//4IQ73p3skUBROQ3eVnDEAa4bSIRDy9E2bmiEdSKFdfzrGdmUb6bAAAF3+D10drfy7BjMToyt44h/10r4JoeWVumiI+EfGUOSacWbJql1TeCANHkDvJ9kAAPqPGtnTlPb+nmKOHPjIft+UefeZUoC2k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVVrTVN3dHhWbE15WGt0bzhnbmU1NDh0YzdJc0NmbHltdUI2b3U5OWRwd1JE?=
 =?utf-8?B?UmVlN1lnQk4reVdQdnlmTkVjOWVwZUJBeHAvdWxCL1poZHZJam9ZZ1pQV2M3?=
 =?utf-8?B?eTh3Nk5yWHorNHhhL2hpNHhnbEJ2dG40TUJlMEppdDUxOENJeGdwYWd2eEx2?=
 =?utf-8?B?U3BXMlhFTUdIWTVSbThPSXNvLzZSS2Jtemh4bnYvWEFEVlBnYk0zQ3ZYL2V0?=
 =?utf-8?B?SVY5L1dCUmVVWnZpdUZzeUthNnZCbURRbXRRTU0wcm9uclhKV2RWeXVGYmc2?=
 =?utf-8?B?Z3ZtbHQwR1hwZzRVU3hmTEhYT2Jhc3IyRHBUam5nekxOeXpXQ09BallNOTlB?=
 =?utf-8?B?dWRZZXZnYWJBNkd1U2ZsdkE3MXVYT1pYZUgrUHhOeUVjR0xuWnlFUDFNdTRQ?=
 =?utf-8?B?QldKeWFNVENoWEFubDZ4cU9SSloxYWc1LzNnZnFQTHJBRkd0ajN6OWo4VGFC?=
 =?utf-8?B?OExNU05yQlBGakl5ZERObUhScXZTMFlORDhDTUpEWVRiMTdLV1RaZEg2K21U?=
 =?utf-8?B?bVZDSVg2K250b3lyazFkbHhaeFJ5Z2U2azk2Rm95T0p1dHpBbkNOUXl0K0N3?=
 =?utf-8?B?WEcrU0dZTHBwUUMvRU44cllPTmk5d0t0RHEwL056MjJIanpDdVhMVmdYZEJa?=
 =?utf-8?B?cktidENDeGxMOWtxMkNtT0JXOEJmbDBmS2F4WHE3OXFUbTRzbmxaSld6ZW5S?=
 =?utf-8?B?K2VnL1JmTE9rOWxvM2t0WjhPTHlUT2xjSGdJRTlsbWQ5WUtwMkxsQ2FuQkNG?=
 =?utf-8?B?Mi9YUFQ1cEkrQzZFTWd3TjZLWUFFS3pua3dmelFGdktleXRONXp5a0R1UzBR?=
 =?utf-8?B?QXNvWkJzcGc4NksrTjJMVU1HTzEyVFM2Tnhnb3JjV3MwS3JCVGxsSEprWWtH?=
 =?utf-8?B?eDFJUzJtc245emxFbUM5V1ZqT1VSdDlST1RnbTE3WUpyaE1SMHYwN0lsNlpX?=
 =?utf-8?B?bm5NTHFOQUJjZlo4OWwxZnZBVW1qOHNLWUFPTnhuQktWOEV4VzdNc2FkdzB4?=
 =?utf-8?B?VGN0Zlc1TmJEWDNKUHVKOC9yb01rZnhjNE55aENVbWlQS1h0TVVVU1M0Njh2?=
 =?utf-8?B?VWY0VS9LMlNPK1RiUFZaMkNhdmRBWFV4eXFvM1N5ZE55OXpHRWVHM2J5b2l5?=
 =?utf-8?B?YUhzK29JSzF0NzRHSGJaODJvOGNWcnJQYmR1U1FlMDNrYWdENCtnKzFrbjVB?=
 =?utf-8?B?dWhXZFJKR0xaYjgzUzRoNVU5eGRyKy9RcmF0cEpGREVMUFRlcXBZMmxHeTJD?=
 =?utf-8?B?cFVBZ2d1a3VnT1U1Q3RPSGg1L3FzTFZacmtpeTRMcTFpSW15QnkwTnhSL0VU?=
 =?utf-8?B?clExWkhvNTYvSjRtRnByNFZoTlFxL0xic1AyT0tHYm0yWkQzV2l1b2d4VTZR?=
 =?utf-8?B?ZVVvTU9VczNZTktQdUdwWDhHS1BIV0czVE9VT2pYaHpBYjNoK0NSQWM3WGZu?=
 =?utf-8?B?VGhIVkZZWkVOeGx6WFN4QVpCN2h0OGNCd1lsRTBKeU1pSTZNTml0REJ6OTdP?=
 =?utf-8?B?L0ZaejVUdFUydUp5akI1S015REd1c3Bpd3RYWlN5dnBIMDMrb3FkYjgyZVI4?=
 =?utf-8?B?M3pvSnhicEtrc1Btbmoxbk9XTkJoU2hzWXlUUEhlanJCODBIL05iSjlIM1NM?=
 =?utf-8?B?bWt4akVxTVRCZEg4SzFvZXpUYzlWeEs1cFBSc1Iyck9hUkpzblFxbFdkTjUr?=
 =?utf-8?B?NzZldmI4Tm9lUC9YS3V2ZUhwZnhoM0Jqck5vQUk1Y25XRUg3SFNEN1hneFhk?=
 =?utf-8?B?RXNxaDdzNjVTT0NhVnNIQU5sZ2pyL2RrTUdpNStpRXpINUlzbHJzYWYzM3Jt?=
 =?utf-8?B?ZmM4bkNEUHR2M2FvT1NNcFFKNXg3SVUwZ1NpNXlqMUxEaG9hdjVJNlZFQ1NO?=
 =?utf-8?B?UW5ZZTJ2cFk5ak0yNUM1eWJvTEhCUWxxbUp1cGFCdXVwNmVmT2dac2I2bS9D?=
 =?utf-8?B?Ri80NFJyL3dUcHVrRVV6b3IrV0NOaXNJNW1wNFA1UThDU0dSUXNlb01lbHlw?=
 =?utf-8?B?Vk5OeXR2Wnh2WVBsSkR4MllkY2RueU5JbVV1enNGazNxMGFmby9RZUhJVmNO?=
 =?utf-8?B?OHNDd0p0aE9jUTJJTnFtb1kxU200NWFuY0R0aHFtalpjaWxEVVhnNk1GUzlD?=
 =?utf-8?B?cUExMzRxOVRWS2lkelNibmhjeWU4U0l1bFJiUGM1OFRldUwxZDlqL3BraURD?=
 =?utf-8?Q?j7akP9zTbJonkvaq2SfUbOc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dc083f5-a664-4bcb-4657-08dc5ff6beca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 22:27:34.8575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KvQ0Cjo4uxbjHeV/uMHFeBSchpPOOd7DSKS887i4mOqQQuOs8RNj7V8sTWK5cT+v6hB7htvUI2qsc5oLQspqqQkZ1Ud0FV098OpUeQo8cwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7142
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

On Fri, Apr 05, 2024 at 01:00:48AM -0500, Lucas De Marchi wrote:
>Since strncpy() may truncate the output, just assert we have enough
>room for the string. It's not a big problem since we always copy 1 byte
>less than the capacity and info->pdev is zero-allocated. But we may as
>well be sure we aren't truncating it.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/igt_drm_fdinfo.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 9b1776775..de1962efa 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -237,6 +237,7 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
> 		} else if (strstartswith(l, "drm-pdev:", &keylen)) {
> 			v = l + keylen;
> 			v = ignore_space(v);
>+			assert(strlen(v) < sizeof(info->pdev));
> 			strncpy(info->pdev, v, sizeof(info->pdev) - 1);
> 		} else if (strstartswith(l, "drm-engine-capacity-", &keylen)) {
> 			idx = parse_engine(l + keylen, info,
>-- 
>2.44.0
>
