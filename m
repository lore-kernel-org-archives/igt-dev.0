Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E5DC98302
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 14:32:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD3A10F0D5;
	Wed, 23 Sep 2026 14:32:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dLRGgEdh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F1710F0E5
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790173879; x=1821709879;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2/DUypvHrF27pB53cpZYDtEgFlmaLtghtgsvrROzDYo=;
 b=dLRGgEdh2h09f/AvXPovrt+18BNzXem1bCcVNFpOhMpKvhQuVJq8ED5D
 wlQA1RYFtIUM5cJ2jHcCN0W4Km9UdH6W8Ki1sk3t1/AhjktuqzlgzKQCm
 AtEqKRCUsgpbRKPrlw8L5Wbd1+84K8mMXpKBxsngWyAx8voEpJMfIfIwG
 CEN9/T/L5s2BZb+4KjJ/OcJXFwnHl8PKDlOH19udy+oeVSGQ+J/1djsB8
 vzpkEfuN8R9qOjrKYy1EgIzjBe/oPo13+baFOZxCphDLAYRP+e17HbX68
 zl+5U+cYg7I1q2Z+H7+0MxMmjG+D0OvnOPJHZuDIxzEH5jk+HY/3zGD/u w==;
X-CSE-ConnectionGUID: 9gv72NdwQUO3KuPlYGaZ+Q==
X-CSE-MsgGUID: XMXOFIReQ1m8E3QmeOkvMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1369188"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1369188"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:31:19 -0700
X-CSE-ConnectionGUID: HynRszaGTNOoWGAaBxt4sw==
X-CSE-MsgGUID: 4WgiZW9oQqClojcVyx/5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; d="scan'208";a="278361058"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 07:31:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 07:31:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 07:31:18 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 07:31:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWNGagSd0KLq2P0fkAqYSGzCp3ptXsPaEl6LzbOpuY4SU3bJ2PUUzjOFgEtLQeZvUAsJDIDJPTDIOd1+OJ7qtbyLoSx1hUR9OXBlHSNAVIELp9ucIDxlYppn8cRomLo2mF8pZbxxGfqsHsVXdUp5rFgjlU5Q5HTt1izXnVg0PEn+6ItTETvKnncPsaOSnPGbcsyYja8Z/WzpVL9YtufeZDVDkvmP+LAKkPXT6oZY2cQWvBJByyG1/+cipfwm08JtkLpoCow1Kyf9HtC15q8Wb3COI1OVGaBH0Oy/TkU/9dWqjmfBbEJ+SJj10vdBWHIzvy3WQVeoXDR6LI7VMAdGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qmd7sSkBt9SdSF7KBXsb+xji+5ZmutxMRdtzh9A50LE=;
 b=IOdlL6QfkT0TkbmXTEriJFU2CIxAIy8gG7io6YJLIxPd7/tQ3DSGNJIl07OSHWU4OVAx5iDKhu5txdfSbsjvWcVNXMeRoDv+2bI+yKs+dtO9nWVjNyY8qvsft5vRJilKPfkbnyVSaMRGxm5Ev3jL3MY3U0NPTNc71T2SX83DMEtqnxvd2lqgkJfrIfWUX5GdlHwyglgVrCNYvlm2xOHXMp2cT/X6qK4hLTuYuZSFzZpjx2Lo7H4aIuV4F5cDrYfnQoB3TXWrAtbKdqcxUmJhMjUF5PM8XR+ETcINtdMXF8pXT8O7rRLZ8/F1iwVJkKKgcvYPLd3EO60F7gHvyyEWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DSVPR11MB9577.namprd11.prod.outlook.com (2603:10b6:8:388::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 14:31:14 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%4]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 14:31:14 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 04/10] lib/xe: Cache workaround information in
 xe_device
In-Reply-To: <87wltnb93s.fsf@intel.com>
References: <20260721-wa_14026539277-v1-0-0c147eeefefa@intel.com>
 <20260721-wa_14026539277-v1-4-0c147eeefefa@intel.com>
 <20260729215814.GD7790@mdroper-desk1.amr.corp.intel.com>
 <87wltnb93s.fsf@intel.com>
Date: Wed, 23 Sep 2026 11:31:09 -0300
Message-ID: <87cxu4hweq.fsf@intel.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0019.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DSVPR11MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f787f02-ac03-4e37-84fa-08df197f5238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|6133799003|18002099003|22082099003|11063799006|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: I43RUluv7udOnN3bpEqPXU6vz/72TEzet73IMQlAjEZzlY04N2d2hVAqJb2VME+tXx4MPcae824S+Ok0ptQDOhTzEMIoLAQP79nQT4R/7/MZetK2j3DDZannlNFGc5hxTnu01chQPA4GTwlhlfq+TalGDL5X55MXtl2XYQTsToHh/XaciU80hB2sHjylrkej/pEGdqgi7eej2D6Z1pIavrY6FQn6GP1Ae27slbpIIKSVGc0/2wtGWv7V6bmJorVmbpDI+JEllNi0YwVjI9cPYTBXwolHnjuqaDDwwhAN2V8pXFoxx6l/nMraronAm6gt6+IwMgerUtx+9iEe2WL0HFrW7wjFHcXfQplBZYQyjhXLRaYyvF0tIgvJt9fVvSyasoo+q7ONEKW3yuU6PaEvHLQHaIgMO4HqD6/RoAV/ZZmXBpIbwlwehPSUfURvgTiMopCd1BGiRDsyUiLNE/p8BH4s/68YmsaEDmKEK6bCzzW+ym3NzsRgGpjFoULZV3PQtoHescc8CrO9+jIFzgpY2LhmHSJO/azEZOLh6+Dn73O7c0F5PaxgsbewO2El1Ll2eeoojAn9HT2XY2Ju9Bpja/Rg7XvUMfKQsYCGU2AwqL8yOvjTaaovWrfBukdpeTovHhGOEvOM90GVfkP4f6tt4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(10067099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3cqbfAjrRleC7gxzUBffIIn7lEwLfqCdkfv+3LegCE3BTYtD3kp3o2Ikne1k?=
 =?us-ascii?Q?5r4Nmc9HCHJI8QLWfVZhrAFXp1KH4Qj07tu32eEKzTFiCs0RyxQRKBtkDoix?=
 =?us-ascii?Q?3WCIFERuRBeDwvnJwpXpvd24pBCekBeangAW7FfHuaXPnvLTd2BblWXx4Gx2?=
 =?us-ascii?Q?hqje4TZFJvecrfHJtxmgL/HT1KwmkgDzDtF8kzwCyjMzEi2vcTpzTG2ry2rz?=
 =?us-ascii?Q?7MzbZ95jkpdB8bEKWLo9kAamnJQRi3M7CuqXwETowiYEoDBHzcxLqOeE5xXC?=
 =?us-ascii?Q?2O32hMPd62C0I4kPeQ+0ndpPOvjv7hCfcMfyg/UGgpxZfnQIvma+pQJGdLRr?=
 =?us-ascii?Q?0l1XuZKfrthzlEFdflLGtKCx4rgM2BUdwLEaFxdrPXKfUquSqHscqZf3XhnV?=
 =?us-ascii?Q?jzd1tjlZkC5mRcFTnChA3K3khLxjJRO7TPecM2aMjRbpFwmRfmcqDX1YHcP2?=
 =?us-ascii?Q?puKzGu1BII0B6pftgK4AMDtEsCvMINzP9YyzOq+/TmsMq1k/0Z3Ud2f8lysO?=
 =?us-ascii?Q?QmxdEAr3cDZaT5aT0AZd7S5N2CxVZrUEJZIht+ZVgvLGpSmpp4kEXaimnDWO?=
 =?us-ascii?Q?igjX6DgQmLserO7g3WjhnBxwrqIMl1W8pQ+GzOMcz0lIdtdBYWUGTzx0T+VZ?=
 =?us-ascii?Q?KunYD938t6D5PbJAQxLsruOU49w/fx4izc5RE13wxpzUYnFT6W6rFpGtVdeW?=
 =?us-ascii?Q?+444XShyUe9cvaDpzq8Pnp11B/IZfJLweGXTlSQdr3JnZomBb1QatSmzmqmN?=
 =?us-ascii?Q?JfTzQR+h31zJtchv5FJ2l1nPP+UmM6cqzP9/CCRxXjyyrkKH8mT/rPAcO5DA?=
 =?us-ascii?Q?qP9ZIZSXzz/pJWY0i2IpXbLy4f33N99DvCbtFbsjDXklAVAzf51hLQfqFaaQ?=
 =?us-ascii?Q?lpVGplDJV21qSdsa96Ygxvahurcfbec8sjDlfJTT9qSmeWl6oDKiFdOe127z?=
 =?us-ascii?Q?GawQPiqrzbv3PJHmLQ8hvjXkfnt2bOz6fvd+P6l2nHVQKvt73ZHKZHaRxsMD?=
 =?us-ascii?Q?7k3BJ9QKJ9mlyMnpofg8m+wPueLVXrbJo4tZ3djNjZdoFfa6puJlVAdg+wKF?=
 =?us-ascii?Q?7MOljHeSgdu4/qI1qV2Qbqu7MOdAL5fq71Cb4qLU+s71X0O3OsyCUVkKiWKZ?=
 =?us-ascii?Q?1WmiSPqRb2ZpHieF2ywifI6UheVZmHu3n5CpWj1voZz2aIPN+cakqG7l3BKw?=
 =?us-ascii?Q?/0CbmOkwgO2nP0RW6qTRS65irdQLnBo55ZzhXfg5ssS/8hrka4BwY7aqKWfj?=
 =?us-ascii?Q?cSSHfvxmC8MsTm+6E7B7XzDHVU5fajZcdi14KYnfgv6vv10LoREESQmgQHeJ?=
 =?us-ascii?Q?CSI9h53NsjWawNiwwmiLmVhrEdFeApEQRTR2cB7jWIAqSD2j5NyGeLejAJyH?=
 =?us-ascii?Q?VCKbD8vqthNaoM6v3+kmljVk0BDW+cYm+wl6jZkYdpE1F6XsOoQof1rcbtO9?=
 =?us-ascii?Q?AbIMIatsBEaUBj1seR7ckrz4xfFK2vjz3P43J4kVu8etaZ7vl5NdAueYM9SF?=
 =?us-ascii?Q?C4f9QpB4PaX7qwL0zgR+L0w9eu5rrXguIIT15S2KUmayQyof74SQ4TYE8NE9?=
 =?us-ascii?Q?nxJ5bKvbizJ9CFr4awfK08urDR4BxYKzrLqiIJX0ADKp4FnnEC4EIu1DzKP9?=
 =?us-ascii?Q?IYReJVDYIvZcHodti5V8JrHPRgIXIOdalx91qQisgWG91pjG5hlC1CaBgWrL?=
 =?us-ascii?Q?gzYpQ1pH2SYX/OJXgx2QSIsjWGINn73KSuvpZ9blSFACgOEQqgkaoo59ZtZ8?=
 =?us-ascii?Q?eKd34bfbOw=3D=3D?=
X-Exchange-RoutingPolicyChecked: F4kJsI6HYKAVWg/LOXzr90tsQy/6NobxhGQlKq53pws4IfDREtttC9oixOfHKPsbh/6BBdYX1KbLi9tJJVnR3nSuvGLfVvSP+84p9eOC60j4slhpLEJfyj8+p2RycYTPD0AO5Fr/l5HoH0zwMBjdjOf+icbeorhJYQs7nGjHJ6F8STZGNB+38PMMyTYgFU0LqKMmVY8S7rlS8pRtsS6r+e0EmKocb04UPUfw+KrRIp8hadx5+AyRWOD/rU9RF1DMzR4YdHq9QTDeHmu2rwdR7+AxaLpDhPHStdo5j1Wb547BJgjaYXefyQubfEnHarkQaJPwFln1qgkKe8OWD1SaOQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f787f02-ac03-4e37-84fa-08df197f5238
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 14:31:14.4759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w/coKRIVDn8xVzow40OLTkwAsPA4463hxxAZFSyTsRTq8uqAdBwgbKrtdhyRyXFpcROAUEHRAFSlh4YQIcrvhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9577
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

Gustavo Sousa <gustavo.sousa@intel.com> writes:

> Matt Roper <matthew.d.roper@intel.com> writes:
>
>> On Tue, Jul 21, 2026 at 03:59:57PM -0300, Gustavo Sousa wrote:
>>> One existing inconvenience with xe_wa() is that it needs to dump from
>>> debugfs every time it is called.  A more concerning issue is that the
>>> dump will fail if xe_wa() is called from a context without the
>>> required privileges.
>>> 
>>> We currently have only one user of xe_wa(), but shortly we will have
>>> another user that will need to check for a certain workaround in a
>>> non-root user context (in test cases that use igt_drop_root()).
>>> 
>>> Let's resolve those issues by ensuring that xe_device_get() caches the
>>> workaround information.  Tests that need to check for workarounds in
>>> underprivileged context will need to make sure to call xe_device_get()
>>> before dropping privileges.
>>> 
>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>> ---
>>>  lib/xe/xe_query.c |  6 ++++++
>>>  lib/xe/xe_query.h |  9 +++++++--
>>>  lib/xe/xe_wa.c    | 37 ++++++++++++++++++++++++++++---------
>>>  lib/xe/xe_wa.h    |  5 +++++
>>>  4 files changed, 46 insertions(+), 11 deletions(-)
>>> 
>>> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
>>> index 68e60ddc75a2..ea095b207534 100644
>>> --- a/lib/xe/xe_query.c
>>> +++ b/lib/xe/xe_query.c
>>> @@ -28,6 +28,7 @@
>>>  
>>>  #include "xe_query.h"
>>>  #include "xe_ioctl.h"
>>> +#include "xe_wa.h"
>>>  
>>>  /**
>>>   * xe_query_device_may_fail:
>>> @@ -377,6 +378,9 @@ static void xe_device_free(struct xe_device *xe_dev)
>>>  	free(xe_dev->vram_size);
>>>  	free(xe_dev->eu_stall);
>>>  	free(xe_dev->pat_cache);
>>> +
>>> +	xe_wa_free_cache(xe_dev);
>>> +
>>>  	free(xe_dev);
>>>  }
>>>  
>>> @@ -441,6 +445,8 @@ struct xe_device *xe_device_get(int fd)
>>>  	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>>>  	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>>>  
>>> +	xe_wa_build_cache(xe_dev);
>>> +
>>>  	/*
>>>  	 * Populate the PAT cache while we still have sufficient privileges
>>>  	 * to read debugfs.  Forked children that inherit this xe_device
>>> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
>>> index 59330d80fd1b..f70476945dee 100644
>>> --- a/lib/xe/xe_query.h
>>> +++ b/lib/xe/xe_query.h
>>> @@ -80,6 +80,9 @@ struct xe_device {
>>>  	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
>>>  	struct intel_pat_cache *pat_cache;
>>>  
>>> +	/** @wa_cache: cached data for xe_wa() and related functions. */
>>> +	void *wa_cache;
>>> +
>>>  	/**
>>>  	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
>>>  	 * UINT16_MAX if not available (older kernel).
>>> @@ -99,10 +102,12 @@ struct xe_device {
>>>  #define xe_for_each_engine_class(__class) \
>>>  	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
>>>  	     ++__class)
>>> -#define xe_for_each_gt(__fd, __gt) \
>>> -	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
>>> +#define xe_for_each_gt_from_mask(__gt_mask, __gt) \
>>
>> The gt_mask changes in this commit don't seem necessary/related to the
>> rest of the patch?  We still pass xe_dev->gt_mask to
>> get_wa_debugfs_dumps() so it doesn't seem like there's any change of
>> behavior related to this.
>
> The difference here is that xe_for_each_gt_from_mask() will not attempt
> to do a xe_device_get() to get the mask.  Now that we are caching the wa
> data as part of xe_device_get(), using xe_for_each_gt() would cause an
> infinite recursion.

I added a note in the v2's commit message to clarify the need for the
new xe_for_each_gt_from_mask() macro.

Based on your feedback to patch #08, another change I did for v2 is to
have a type for the cache: struct xe_wa_cache.

--
Gustavo Sousa

>
> --
> Gustavo Sousa
>
>>
>>
>> Matt
>>
>>> +	for (uint64_t igt_unique(__mask) = __gt_mask; \
>>>  	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>>>  	     igt_unique(__mask) &= ~(1ull << __gt))
>>> +#define xe_for_each_gt(__fd, __gt) \
>>> +	xe_for_each_gt_from_mask(xe_device_get(__fd)->gt_mask, __gt)
>>>  #define xe_for_each_tile(__fd, __tile) \
>>>  	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->tile_mask; \
>>>  	     __tile = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
>>> diff --git a/lib/xe/xe_wa.c b/lib/xe/xe_wa.c
>>> index e4e1b0bb7972..0f4d2edc0795 100644
>>> --- a/lib/xe/xe_wa.c
>>> +++ b/lib/xe/xe_wa.c
>>> @@ -22,14 +22,14 @@ static void free_wa_debugfs_dumps(char **dumps)
>>>  	free(dumps);
>>>  }
>>>  
>>> -static char **get_wa_debugfs_dumps(int fd)
>>> +static char **get_wa_debugfs_dumps(int fd, uint64_t gt_mask)
>>>  {
>>>  	char **dumps;
>>>  	int gt;
>>>  	int debugfs_fd;
>>>  	int count = 1; /* Device workarounds */
>>>  
>>> -	xe_for_each_gt(fd, gt)
>>> +	xe_for_each_gt_from_mask(gt_mask, gt)
>>>  		count++;
>>>  
>>>  	dumps = calloc(count + 1, sizeof(*dumps));
>>> @@ -45,7 +45,7 @@ static char **get_wa_debugfs_dumps(int fd)
>>>  	if (!(dumps[count++] = igt_sysfs_get(debugfs_fd, "workarounds")))
>>>  		goto err;
>>>  
>>> -	xe_for_each_gt(fd, gt) {
>>> +	xe_for_each_gt_from_mask(gt_mask, gt) {
>>>  		char name[32];
>>>  
>>>  		snprintf(name, sizeof(name), "gt%d/workarounds", gt);
>>> @@ -112,17 +112,36 @@ static bool debugfs_dump_has_wa(char *dump, const char *wa)
>>>   */
>>>  int xe_wa(int fd, const char *wa)
>>>  {
>>> -	char **dumps = get_wa_debugfs_dumps(fd);
>>> -	int ret = 0;
>>> +	char **dumps = xe_device_get(fd)->wa_cache;
>>>  
>>>  	if (igt_warn_on(!dumps))
>>>  		return -1;
>>>  
>>>  	for (char **dump = dumps; *dump; dump++)
>>> -		if ((ret = debugfs_dump_has_wa(*dump, wa)))
>>> -			break;
>>> +		if (debugfs_dump_has_wa(*dump, wa))
>>> +			return 1;
>>>  
>>> -	free_wa_debugfs_dumps(dumps);
>>> +	return 0;
>>> +}
>>> +
>>> +/**
>>> + * xe_wa_build_cache: Build cached data for xe_wa().
>>> + * @xe_dev: Xe device where the cache will be stashed.
>>> + */
>>> +void xe_wa_build_cache(struct xe_device *xe_dev)
>>> +{
>>> +	xe_dev->wa_cache = get_wa_debugfs_dumps(xe_dev->fd, xe_dev->gt_mask);
>>> +}
>>> +
>>> +/**
>>> + * xe_wa_free_cache: Free cached data that was built with xe_wa_build_cache().
>>> + * @xe_dev: Xe device where the cached data is stashed.
>>> + */
>>> +void xe_wa_free_cache(struct xe_device *xe_dev)
>>> +{
>>> +	if (!xe_dev->wa_cache)
>>> +		return;
>>>  
>>> -	return ret;
>>> +	free_wa_debugfs_dumps(xe_dev->wa_cache);
>>> +	xe_dev->wa_cache = NULL;
>>>  }
>>> diff --git a/lib/xe/xe_wa.h b/lib/xe/xe_wa.h
>>> index 4ff897196545..f0a826553df8 100644
>>> --- a/lib/xe/xe_wa.h
>>> +++ b/lib/xe/xe_wa.h
>>> @@ -6,6 +6,11 @@
>>>  #ifndef XE_WA_H
>>>  #define XE_WA_H
>>>  
>>> +struct xe_device;
>>> +
>>>  int xe_wa(int fd, const char *wa);
>>>  
>>> +void xe_wa_build_cache(struct xe_device *xe_dev);
>>> +void xe_wa_free_cache(struct xe_device *xe_dev);
>>> +
>>>  #endif /* XE_WA_H */
>>> 
>>> -- 
>>> 2.55.0
>>> 
>>
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation

>  LocalWords:  xe struct wa
