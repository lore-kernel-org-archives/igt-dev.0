Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B163CD128A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Apr 2024 15:28:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEBD112748;
	Wed,  3 Apr 2024 15:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea6L+DKG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13E07112748
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2024 15:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712158080; x=1743694080;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=YJNGjhHnFf2dIdIIhL52CoyGOMcLhYt0Jmq+JGvf93k=;
 b=ea6L+DKG3nP+rGHWtm7c9TzQs91Kab2tXmFrHyviXALmKhkctvO1FMZd
 gPZOYvdPYNwISlM7ytYUj0A5V/jENM1lRuz1cvbYJmY29DO8cQglX/woX
 w0Ogc4s0nCB57Z9vh4Z5KxMqqRL+vu01lAKWUvbXkQTUVALKt4ZrgUhti
 tqfNe5g7gncMx0HeKbrDh+KkWAUHDK2tkIf87M4dVUcuH34cKh5FFTmVV
 L5D1ROcQXjdmDp5LkVG6cBGKWmK12eMwngnGV1Cz+aZen36gRcv6c6UV2
 GNSU1kAZwBJIl3hosXjwfo5F3BQtcIoFTbb2l2x5FvrwWkXFFZ3K2BCCr Q==;
X-CSE-ConnectionGUID: Al6oW/KwTteCiNyjq4lCeA==
X-CSE-MsgGUID: s1YQ45/pSQSa4r3LhfQc6g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7265924"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7265924"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:27:59 -0700
X-CSE-ConnectionGUID: WNtTp+HFRnuTSjAI0XPG/g==
X-CSE-MsgGUID: Dzs83zM9TrKFYIfRJacWaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18299625"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:27:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:27:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:27:58 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:27:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu4PB4JVbQ8L1dGR/aTg/ox5lCxfNHpKavABeu6WUASph+P0IiA672aRwuSAk61UWceSkrCpm7Mn1sSDqSg4DsG8ILxnWOymjREAdJFl8bQ7Z0hzsHdYhucM+uw0gAicsQrODQxfgKS0khQGGYOF/LzGw4H002P9K809DlG6Vp6bQfYGh3/bg0AADth4eJCQ5HlgGei7s6xfGI1TW2VgIIuJ9f7XB24iHOT2+gTDNBsMPKinenX+9To3BiP52GQD/niptFTJqQst6B5bCOBHqYXYS5MQM7AtNN3EzwRXruPmhWQ33luUGr9cYUVja4+UZgWxYXYbV37dprWcxTI6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLzSVl4Jqi6gOOqQOZplivW2r6L6IIcHpSayIEW0nng=;
 b=BBR8FUAhQ78rbigWzvOLJZD4x02F2gJvlum7dwIFveCieofPO1VDvUxeYBaWVcm1UIymAnBuEw4vStJBSr2nLeiDhg+OEa0zjqEvBCEYXEBzE6I9HW9FOgAl1R6+5dCCQSeks72Yf5HoGqOhnmbKTioCRBDsAJhdGbAtrIljPtuCe4D6UNOV5YWPJCRDyqY7LFcmR71nTKK1+56ZSlFle07LXRL3c4B7K28YqlUakMoTGzN9tqVrqZnP+RKvtJxAHSbPqzdAOCbRQWWJ7PxpW028UvuwHzk/RIzfbYv0kv4pDHpTikI67hWyFbDb2YdCGMncx9tNZF2YtWlw48sxlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6335.namprd11.prod.outlook.com (2603:10b6:8:b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 15:27:56 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::cc14:a507:b02c:b551%7]) with mapi id 15.20.7452.017; Wed, 3 Apr 2024
 15:27:56 +0000
Date: Wed, 3 Apr 2024 08:27:47 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t 1/8] lib/igt_drm_clients: Use calloc
Message-ID: <Zg11c9WlsvwNsnvT@unerlige-ril>
References: <20240402221716.1840148-1-lucas.demarchi@intel.com>
 <20240402221716.1840148-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240402221716.1840148-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW3PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:303:2b::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6335:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TgFHDVWXawQcHv4kMIxwDv+HXb87eq1bn3OqhDyF15oG+Tt6pkHuB46AlClpIvze9tozF5UNLXk7w7Mk9Bp8eSamO4JWSA7rxaTj8SiNEs+KssyVubHHph6PsZEnEXBvHdVFMg2Pvt9HXBemSGx4ZYKMIDMlSp3Pb3CzPMZ0O7Xp43xYfhAPcMmZykh9khuMR/Ts6OJWj38zjCrsr5CVkDuh84ozqSob/9MrtQrou00+IO1xXdVJcK210bS3onrNShESbbKRStt3FkD7Oq2S19U1B4dPmxv1FJAEDlFZ86l4f4F6qHgfP6sinedBtSi2tyBsHGpZlUtzmTbUawBANdn8hJmAaqTndd4P8QNuluPiMtGoiIfxU+1iI0LFPdN6fRB+jEMciNGkICbhsTiwEHvpWPLJDptz37iWbBt/9GC4INbnyVoPUaHz6WzA8WvZDqX/1PiYOY/4IHV7kuXJGMKSXrsUs7p0LK07OluovJcYGOmTKANkipCYKNlDi9VjLw6UYIc24xK0mFPpNjojDTiUfEqk+4hstyJNR4r1ltgM6gJDUwFF1C0Q7OZd/VFXFp0P2npXtrrVrzBlEUZG7eQs4ThdHqr2q8Ef+UM6gOx/xttRsp5L14OZlL/ZqX8KFHhTJ0eEJTEBmXqnxATHnXV5ErouBon1uc5rKau1Yio=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXd4T255aHBUdXZCWnhPUFRxQ05CbU1NNWpqRENQL3h1Q05nbnJlWjBGNlhE?=
 =?utf-8?B?QWtjZkI1Q3dGMmFsekNMMFBqTHFmbnlxQ0JGSExIdG92L0F5cjBQK0xQR0ps?=
 =?utf-8?B?OW41Z2tiN1ZNbDVpZFhOOHJqQkZCcGZ1dnR6R1lHejc0UTRLMkRhU3pLeGlt?=
 =?utf-8?B?MDlOQXgxWkFDcWpBT09LTGhTdWxsY2VSKzlWenloT0RReVBDbU83SDBhWXVL?=
 =?utf-8?B?RnRkSFArTGZzTW1UemI4SmhLNWY0V2lnSUdiUUZsdERkV2RWcFFwYU5LaXF0?=
 =?utf-8?B?Y2Y2ZDlZaVVtbUQvUy82YnhIZytndEVvdy84aVB2bHFmRTJlKzZ0aTJZRHdO?=
 =?utf-8?B?dWRlMXhzZEFQVk55R0kwNk56WE5sdnhOd2VkZm5VRzBpUFV5SDVnWHVFTlJW?=
 =?utf-8?B?R3lnMU9odGdyYllqVnFDU0c2SVltSUNyL3lVengyd3lubmJ1Szd3aENVdXRI?=
 =?utf-8?B?akRuNFRRclpzT1ZFQ0ROWWlMb0J5QkMvN0ZNRUtiTDhaTzBpbkJBK1FRTkcr?=
 =?utf-8?B?SE5na000VlRJTTZsbDI1UC9HcTM2V2NlT1E2dm5sQ0ZkLzN0VnZpaGFzR0VC?=
 =?utf-8?B?ZElKNDhtSnNwTll1QTA1TUNqOXVyNC9QNUd5VWxCL1pVVk10TlBNNHRxNGJz?=
 =?utf-8?B?eTJoOWhwWm1udVVWdGVHWkhSdnZvcTNJWmp6bG0yaUxxcENjektBR2JyU0pn?=
 =?utf-8?B?aEFGdGNPZWhRUGhzbW95S3dVVU9saFU2UHg3dW5vemhsRkN5MmNtOHRUVEw3?=
 =?utf-8?B?SzcyQW9ldCtDeXVFTEdoaVd5VlUyZVl4QXFJOHp2NWgzNFk2cEMyeE1xVVVv?=
 =?utf-8?B?bzVRc0wwYTJwRjhBSEh2U1Y0NGxFcmc5Q0xRN0RXUkNvRWF0QVZxV00xbWxS?=
 =?utf-8?B?bXFZOUU5UEFjZUF1NUlpQlFKQTZReUNaQXNMUXRQY3BiRDhBNHVtMnQ4aGw4?=
 =?utf-8?B?QUNqOW41RHVRZ3hFWWx4WWxzeGVOcU5vWVZhMVc3dmk4RHpvVVF5dEVTL0ZP?=
 =?utf-8?B?YVdxWC9GTmFCWkw3WkNIWEJ1aVJDN0NPK0hia0U1djF3YmZaSklheGxXS0c1?=
 =?utf-8?B?QmxoQ2ZsOVArTEx5QUQxOXBURUhwYUdiQk8rZVowRjFQdDIvTnRtdHFlcjFZ?=
 =?utf-8?B?eXc2YS96cWJTTmlkZTF1QTljZWJLaHNVakRBZmJ4MGxWempJWmdmVk5mZjRW?=
 =?utf-8?B?MzllazFuaU5SYU1wdDVkditrTFAvbmRxemRvSENxVy8xaXpLSVVUNW9pZHMr?=
 =?utf-8?B?di9PR1JPT3R6dDY2eS9OTEtNSGRUekY4a2M3UllHdXQrbm81dUp6cGRIL0p4?=
 =?utf-8?B?bHBlb1V6M2FoUVdHVFZvTTRCYVg2M3RYazFDNVoxTzl5akxhWUtLbjJib09C?=
 =?utf-8?B?NU1RU1JSTUpHejdtdU5IU0NrYXp1ZlE4WDcvZVZMSVZ0eTkzWjE3NlNlRTd1?=
 =?utf-8?B?aXpyelV2YmJuN2lGTUJ3d0pDTGhTU0N4NVRpcW1mUTdGUyszeXlNQWJJZ2ow?=
 =?utf-8?B?dzg2WDljbGpoUXBkMVMwbG1YOHlHa0ZkcXJxMlJqMk9rd2NyN3JVRXBRVHZK?=
 =?utf-8?B?dCtXSmdGM1h3eGZVcGdYYnArc2tKZkRkQzJyQ2hVVUZ4UDBnZzVzbEp0c1dG?=
 =?utf-8?B?U2EwU1AxcXArVkJYS2hVeHVlbnZVT1hqYm9Hb0ZpaVUxdUxWOTllcCtWYXZ2?=
 =?utf-8?B?QzdDQXNXb2gyQUIyTzdnUGd2Ky8yODFyKzN0R3FRN3Q0VjZ5aGN1b3RJK1Z2?=
 =?utf-8?B?TWVvUEl3ckJkMjIrelFhVmxWUnE1R09DVmRySnlhaG1YczN6MUFxMW1mSlVT?=
 =?utf-8?B?OTNpTDJYSU0wZ2UwY0wzbG1tZTZKTFZzWm9qU05UUlQrdGlHcEUwTXJseGxh?=
 =?utf-8?B?OEcyeTlCa2hPTFdqdUFISVVxeDB2YkZWSzdqRHJNcklLRXdnTjhLbGF6UXdE?=
 =?utf-8?B?NW0rb3hZZWVYODJzR1RxNERMd004YWJHZ1Rrb1YzOTdQUlRUbmxJaUlnTUp2?=
 =?utf-8?B?R1EwVnVhUUJkSUpLbFpQZlZGSlRrbEU0eFBHc1RsK2FWSHpFVUc0UnJxT0x6?=
 =?utf-8?B?cmVNU3g2cjJGOUR2bmM3S1VYVUFPVmZXcTZNQ1NOVlNyMWl4VkM5c0hIZUE4?=
 =?utf-8?B?TmtsbGVCeGhYVzJYT2JvRUR0RDltUWtUdGZPMVNQZldLNHpmUXBjNlJNMWhR?=
 =?utf-8?Q?9fsn82UnqLbcnY3Y9JHGp/E=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0616caf7-4ff1-461d-2651-08dc53f2a319
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:27:56.4990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfEv7IsH+WK4LM2D8ttjfRJLf1E6wi2LEcrLILh6tlssaYlbE6eOBYQ3/2WI6fjQ/Rb0xZYt4y5Q8G6/NAqE0wqw0K1v5vhACDfeAVI6yZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6335
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

On Tue, Apr 02, 2024 at 03:17:09PM -0700, Lucas De Marchi wrote:
>Replace malloc + memset with a single calloc as it's shorter and there's
>no point keeping them separate.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

LGTM,
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> lib/igt_drm_clients.c | 10 +++-------
> 1 file changed, 3 insertions(+), 7 deletions(-)
>
>diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
>index 025d60c51..90ca6d61c 100644
>--- a/lib/igt_drm_clients.c
>+++ b/lib/igt_drm_clients.c
>@@ -35,12 +35,10 @@ struct igt_drm_clients *igt_drm_clients_init(void *private_data)
> {
> 	struct igt_drm_clients *clients;
>
>-	clients = malloc(sizeof(*clients));
>+	clients = calloc(1, sizeof(*clients));
> 	if (!clients)
> 		return NULL;
>
>-	memset(clients, 0, sizeof(*clients));
>-
> 	clients->private_data = private_data;
>
> 	return clients;
>@@ -165,9 +163,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
> 	c->clients = clients;
>
> 	/* Engines */
>-	c->engines = malloc(sizeof(*c->engines));
>+	c->engines = calloc(1, sizeof(*c->engines));
> 	assert(c->engines);
>-	memset(c->engines, 0, sizeof(*c->engines));
> 	c->engines->capacity = calloc(info->last_engine_index + 1,
> 				      sizeof(*c->engines->capacity));
> 	assert(c->engines->capacity);
>@@ -190,9 +187,8 @@ igt_drm_client_add(struct igt_drm_clients *clients,
> 	assert(c->val && c->last);
>
> 	/* Memory regions */
>-	c->regions = malloc(sizeof(*c->regions));
>+	c->regions = calloc(1, sizeof(*c->regions));
> 	assert(c->regions);
>-	memset(c->regions, 0, sizeof(*c->regions));
> 	c->regions->names = calloc(info->last_region_index + 1,
> 				   sizeof(*c->regions->names));
> 	assert(c->regions->names);
>-- 
>2.43.0
>
