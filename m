Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7FB310F930F
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 00:11:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8191110E8A2;
	Wed,  1 Apr 2026 00:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I4l7ogVN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D4510E8A2
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 00:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775002257; x=1806538257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6zrdxpQ2Nw6tL0jYBlTqvMoY2sDlAXW7xaRp+nX9nfY=;
 b=I4l7ogVNaXIrjbkkDIio//qlIfLt7zn1djkJka2GLwNUjNI2Jd2l99Av
 27iXbmdCRfs8snE3ol7ecfg8uBXlclKLEggAMKCtXmOMlRJ2NxdwFv/gc
 fspTVqwNOPYUpnwWPGqoH5h/6eUmR0NzoTBpmNahKHcPvBybvhRXPmpU2
 wRlRubeD5qmu5BNzijJPy0wqFP/SZaAIHPGGh5tgEtwSxBphgIThRVuaH
 9uGP4ms6edVz/AdGTxuvgC3VDiCf5/BT4ZAXoDEnL8a5UP68z9PPx4f6Z
 n/RIwzk/ic0oYiYiKeDFw04famGpW182OpfYodd61ISuZtwkWCFZK0ffT w==;
X-CSE-ConnectionGUID: boWfg8DjTsirQsC7yh5evA==
X-CSE-MsgGUID: tnKKIocXQoOor341Q6rrdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="76044956"
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="76044956"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 17:10:56 -0700
X-CSE-ConnectionGUID: 2kB/2POjRZe1D9cxKK+iVA==
X-CSE-MsgGUID: grC25v1FQGqzDQoh+orHqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,152,1770624000"; d="scan'208";a="230579839"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 17:10:56 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 17:10:55 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 17:10:55 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 17:10:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M/7/68pvedkD+cjROe+bFqovNg2UC5/1qZGZQsrniYWlP3USg2tZVciWGWAlPTe77XJSq8LHucmC6qBohreu/33n3xAVcVW68hkf5gAqL2+ZM0Xy7BlAtIEv1682NqPWbZfKyaJZovfMNQeCcPhXEUSkwzvuQvXX0Ttr4I8zApYlCNosK5V2xLFs1/m6jCUu2cNMuYZhM2CSkzFBS1mXu3TgE3mEDgJQLjcjLjj18AIjn/1e5SfC6wqTm/dxFcbXo6xMbOdOrIyUrCbYq4VIe7375Wvrd+guNFFbyG74Wf0PoX9GorxzUTFSwpaI0TwwJhlBQh2Z9Yo0IGn9S+jt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLwgrCWvJRNM463GtVRkdQRxtD1nxK1TfM2oB7zagP0=;
 b=ZnA1oq5k+pP74edpMDUK4+u/M+AeLJI8NhGopm9QtuDJPKgOeAwsfGtvHAYjcsYjXNPRK/WnMA/uf4NkZ9xgxvX8T1Nb7GP3vyI5igncOj+utMH3WaV9h7Oyoko80Qzo1j1j5TckSBb3viZXU0DZkYjjL805RQzFt95PA6rNBDw+3vsYcsnX4Z6xY1eQSgO2RRxQqG7BtpBZ4Lq789/zoEQB2ZlzWl8KNpuXvX4KpByD0kMHgau9KkVTRgRH9t4j8dzELe12R7aDrAIa3seGEsySagu/XZbU7eIyyBCdRJLin3LQAd5ONonkLSCXaX6ra4iQ4UvU98TjBfCHFmGjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by PH7PR11MB5960.namprd11.prod.outlook.com (2603:10b6:510:1e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 00:10:53 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::87cd:16d5:8dbe:2286%4]) with mapi id 15.20.9769.015; Wed, 1 Apr 2026
 00:10:53 +0000
Message-ID: <55c9788a-1db5-4a8b-afa1-e7850c600fd8@intel.com>
Date: Tue, 31 Mar 2026 17:10:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel_pat: add hardcoded PAT fallback for older
 kernels
To: <himanshu.girotra@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.d.roper@intel.com>, <francois.dugast@intel.com>,
 <matthew.auld@intel.com>
References: <20260327052212.27431-1-himanshu.girotra@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <20260327052212.27431-1-himanshu.girotra@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::30) To SA3PR11MB8046.namprd11.prod.outlook.com
 (2603:10b6:806:2fb::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB8046:EE_|PH7PR11MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a697f09-544d-4765-cf66-08de8f832389
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|42112799006|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: PF7ooDgxXmXCpvGSOK+iLUV6Ix4ouv0bmLarWyjcDB5QVuIstPeBr1rxHhKjOgHtm89Fd3x+nmU4ieaIj8VaW9dh3TSUJ/9qHovXj7G9ZHIgRPUEv+IMA2ZEPKhJRkHf335l+qAFLwNQodwJK9cLxqQPUWeSjm+DJ+/+5/zHdo6FNT30+HCBVttlPhLQd4GQCyeb19UgNbmLyfCdm7yEBfm9LwnuZL50rVhZxGCDRY/S4mYIOAJY+S+XwEWWbNVXmbfZiV3UWOTZlejcyretQHxBl8JTp7078wc0ugBmzmBEoAcLr8uPtdZ3L4Vd/xGXxmaSL443rjNo+t3OLhdhBPilfvsQv9BTDBfMdGqnNb0l5vURZurK1slttqfKuxBTjN0Xpp/mncbQShA/Z2e5oNliImOn/mPJfdfDYhOuEpnvDpr2+DK8RiZ7rBpYFyywdXAudkbac5qpca1DtthTmg2Hfud1KU4GuwH2SAU60xvtTMG0ftT97IiuwtOHTEDcTf7V1TUmOBJ+JxA5alEodXP2RRDi4T7/IU3Gsr87RT5JGgDupjd0luHc8JDsGSwB+pbckY0zCTjIgX1EcXptjLoThjjwY57OdtBWHobsWnhgIRNu+syzABpQGRT9h459qxyVbwO+tQZhTwFIzXRZ1dHKaVcBtQkO4bkRwctIf9XMZaru3O6MX5ii2ODuLgj3WyTzS31oouX1bPHIZLNp0iXE3Hvf3G3WWTl8lHs2dgE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGxDR1NXaGFQSTd2NFRZdnZhdzhqck54S3RZQ3FzN2U5UTRCZjErTUtTcFNM?=
 =?utf-8?B?cDhIYUczS3BvdTNMTXI2U0ZZQzFqSzI3VXFJMDJHN0lGOWkwTGNKSVFDUFF4?=
 =?utf-8?B?dVVGT1FJdTJLWXVRdUpVdExtYlJnYUcrSlZLZ3JFNXFFdko2QjhVYUNOVm1E?=
 =?utf-8?B?b2RnckpvUU9LZDJvcVpBZ3ZyVjZ0YzNZMnI4VDJEcEE0L2JkT2EwVFZESHVo?=
 =?utf-8?B?US9zUVB6VkEyY3ZCYkhZa015OWQreXd2Z3FqQ0dZemdwdWZGY1Z5ZW04N2JB?=
 =?utf-8?B?Mkg5RFk2Y3dDN0p3cFV4SlN0OHliaHE1Rzg4ZHNDTklSYkVtV2FrTlEwSXMw?=
 =?utf-8?B?bTFHcVd1bGlhb3A3OVZaa044Vk1VU2VyeElHdmthRitTR1UzbVFQMy9aa2ZM?=
 =?utf-8?B?S1BpYmF0M2RneUlBSUxMWVhLYlhFYWpKWm5jbW5TMDl0SjUyY2xjUWc0VVVr?=
 =?utf-8?B?T3ZYeFJLclJPZU04YkFseVRnK2kvUmV5My8ybUhNYm45R1ZqUy94QWRndm1x?=
 =?utf-8?B?emFSa3dFTlNoMDdtempkeEZBWWpNbllrbitzY0l3a1AwR0Q0dlJOWFU0ejRj?=
 =?utf-8?B?UGY2UmxkT1Y3TmRwRVFTcEJRSm1qWXc3MDhmSGdTQ0pkZmlEV29TWUtwU2Rs?=
 =?utf-8?B?RXpZWkgyZjVoRVpYanQ3N0l6K2x3MnZtM0dTc2Vtdkh0cWRwMnBRTWJ5ckF5?=
 =?utf-8?B?VXVkVDhLOXluWlBVSm1rRjJLeTgwZDNTNTl6YlFYZ0QvU3hEVTg5T0VQTE5t?=
 =?utf-8?B?engrUHlzTWk4TXhPTFRFL3Fyc1RxMmFVbkswVDVKOXJRWlRLTFJrY0ZWUTMz?=
 =?utf-8?B?dm1PNC9OT0ozMDc2bU9rY0puZXVlYVB6ZGlvUjBpQVd6TXh1c2VxanFhWmE5?=
 =?utf-8?B?Mk5aeFluNGMvRXdZN3hmMGtGQll3YktnYmkwc05mbEpZMW4wVE94Z1dpeWdx?=
 =?utf-8?B?dG5wcXdpNzB3Yk5XQkRaczRKTmpEZjRBdTBQNVpDSFJJcS9waTZITndqTUF4?=
 =?utf-8?B?MDVCUUVFODRSU2dkUXoxRW9LN3NmaVBxSzFZVWptVWh0V3hkWVdvYVB6ZTJz?=
 =?utf-8?B?b0hURi9uNVh2T0NHZjVJMzhoVlh6K1lRdHpvdTNIaklieWQvQVRESXdLbUZ3?=
 =?utf-8?B?TzFqUG1WUTEwbkRGZFRhU1RMYTFuODlpeE1CYU0ydnZiaXdQUGNoRUpVdENV?=
 =?utf-8?B?bXBxSDJXTlFGeG9NbFJQZXE1dmtTemU2akNPY2J1MXYyVlFieThhZFlZN2tz?=
 =?utf-8?B?RGlQSWV2Q1h1RVhCNEZSczVuWHJvZkw1Um92VXEvRTdmSm9tRGs3WStOeHln?=
 =?utf-8?B?SjVTQWdYOFJ4QkxEWU5rdk5RVUJ2YVlpS0JXQU9EWGlCSSs0bWtTckNlMUR2?=
 =?utf-8?B?cHJ1YW5FQVA2VFRrc0ZyTmJkeld6MUN6Qm9MdnZvWEdlSHBCSHBmOXF0bXdD?=
 =?utf-8?B?bFMxelZJQzgxVWJ6aGZ0OHBoSmVjdTVhUlRmR0FuaWFtQ0wvaW5OQUhyNG85?=
 =?utf-8?B?bmNmY3BKYzRIdWZYZUZVa2NqLzI3L2czUm52R3MzeGQ4Q1N6RllyMzVGRnZT?=
 =?utf-8?B?TUZlZTYxUlB4TFNnUlB5enhOZVkyMHlzR3RSSEl0TDhka2wzR0pBTnhwc1lI?=
 =?utf-8?B?NGpTalhaTStDcllCTytMdUpYQjZDWkxPcVRCNWp4YmV2cVB3YWlZTkxsTXJT?=
 =?utf-8?B?L3Y5SjJRNWpYL2hSaE1TSG85SnFJVEd3TkNXSzQwTkFhTXU5RG1Pa2M4TGVw?=
 =?utf-8?B?MG9KUExJT2o2UTdKUmhWcjBUSWJzODRtKzVUQkl0NXpCbXFRcEc1emxQNlpm?=
 =?utf-8?B?RmhHQmIyUFJKZW4zb21jb2R4T2FVZEpzbGNHWnVnamlXemx1bXdraW5LWXE3?=
 =?utf-8?B?a2RaWXBvUll6Y3pScmkzSDhyM0djWjErL2tMa0JLWU5VWXUvOWFrWlJtOE0z?=
 =?utf-8?B?TkZHV3pVblNGZEpSWDNqVGZDcVBRT1QvR1I2MVVtNmtJemFsVGFqNzZ3d3Jj?=
 =?utf-8?B?SGtHSkpIa0VxaXYrZENkYmRIZm80TXgvSWJ3dE5tVHRIOUNqZHk5OU5ERVVa?=
 =?utf-8?B?VEJJOHkrMnErT0ZOSERjVm5TcFFJa3A0enNkd01veHdjM2ZaOXpHNURLRmtK?=
 =?utf-8?B?OUdHNjQwQXFTcGpZbm5xem44MDhmWkNYK0lIdU1ieDR6VkU2WTBYVVRpTCsw?=
 =?utf-8?B?ZWNYTVRlejNpOTQ3Q3kyZ29SZWRQYkxud1I1eEM2VlpLcTM1Q256azJ4em5T?=
 =?utf-8?B?UzJlUmx5NjZSTnlXaWJwaUdON1BJdkZpU09JdGpVVm5qVGFKUWxuVGNMZnhV?=
 =?utf-8?B?dzJRZVJjc3ZmZTUveU05azZEWjhmeGI4dXVKemJKdi92WkNIdDJXUT09?=
X-Exchange-RoutingPolicyChecked: faOhf/BwVb9fjiQBusJX6U6xLAI5yhXRY58MjV3t8wTpIWymdPZ9FB+2zPlQmTkkvWc2iuJ7zl9502wFm0obQhhN1yKicpwzT9gDD2TmFKARWYfKM2T6n77gvb6Deubv3DMtZH3ouEfCBnASS+RjxCRTA6RpSey+rK2CJ4e0oe9YOakOcBErgQQYpNfTQi26MMzdSz6fSP3uQrvDykASvQYWjqyVbMCwUiVBZrfZeu57KU6vnJd1QPi+GzSfwyWUnwyQUfRSsC+L3zXRWzm2IUCEGebMl/Hd1L9edKJwqWukgNGaGSouTQ6iUv0WCjomqkEICOKxDIioU0m97yd0NA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a697f09-544d-4765-cf66-08de8f832389
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 00:10:53.4419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vt+y6Tr0aMj9M6084DR5d7NDcM1m+25OjSayTfUrJNxlLkPYXZIfW44TzMhSKKfoto2kqOMluYhawa3iF9TX3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5960
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


On 3/26/2026 22:22, himanshu.girotra@intel.com wrote:
> From: Himanshu Girotra <himanshu.girotra@intel.com>
>
> When IGT runs on kernels that lack the gt0/pat_sw_config debugfs entry
> (commit "drm/xe: expose PAT software config to debugfs"), the PAT cache
> is NULL and intel_get_pat_idx() hits a fatal assertion.  This breaks
> basic tests like xe_exec_basic on stock distro kernels (e.g. Ubuntu
> 25.10).
>
> Add xe_pat_fallback() with hardcoded PAT indices matching the kernel's
> xe_pat_init_early() for platforms up to Crescent Island (xe3p XPC).
> When the debugfs is unavailable, the fallback provides correct values
> instead of crashing.  Newer platforms (xe3p LPG and beyond) are not
> covered because their kernel support arrived after the debugfs entry
> was already in place.
>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
> ---
>   lib/intel_pat.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++---
>   1 file changed, 72 insertions(+), 4 deletions(-)
>
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index b202a6241..71633b314 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -97,6 +97,62 @@ int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
>   	return parsed;
>   }
>   
> +/*
> + * Hardcoded PAT indices for Xe platforms, used as a fallback when the
> + * kernel doesn't expose gt0/pat_sw_config in debugfs.
> + *
> + * Covers platforms up to Crescent Island (xe3p XPC) that have Xe driver
> + * support in current stable kernels.  Anything newer must run a kernel
> + * that provides the pat_sw_config debugfs entry.
> + *
> + * TODO: drop this fallback once stable kernels ship with pat_sw_config.
> + */
> +static bool xe_pat_fallback(int fd, struct intel_pat_cache *pat)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(fd);
> +
> +	pat->uc_comp = XE_PAT_IDX_INVALID;
> +
> +	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> +		/* Xe3p XPC (GFX ver 35.11): no WT, no compression */
> +		pat->uc = 3;
> +		pat->wt = 3;   /* No WT on XPC; use UC */
> +		pat->wb = 2;
> +		pat->max_index = 31;
> +	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> +		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> +		/* Xe2 / Xe3: GFX ver 20 / 30 */
> +		pat->uc = 3;
> +		pat->wt = 15;
> +		pat->wb = 2;
> +		pat->uc_comp = 12;
> +		pat->max_index = 31;
> +
> +		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> +		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> +			pat->max_index -= 4;
> +	} else if (IS_METEORLAKE(dev_id)) {
> +		pat->uc = 2;
> +		pat->wt = 1;
> +		pat->wb = 3;
> +		pat->max_index = 3;
> +	} else if (IS_PONTEVECCHIO(dev_id)) {
> +		pat->uc = 0;
> +		pat->wt = 2;
> +		pat->wb = 3;
> +		pat->max_index = 7;
> +	} else if (IS_DG2(dev_id) || intel_graphics_ver(dev_id) <= IP_VER(12, 10)) {
> +		pat->uc = 3;
> +		pat->wt = 2;
> +		pat->wb = 0;
> +		pat->max_index = 3;
> +	} else {
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
Since we've already hardcoded some things, essentially repeating
parameters from the KMD, why don't we just copy the complete PAT
table as well? This way, all tests for xe_pat's dependencies on
the complete PAT table will pass smoothly.
>   static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   {
>   	uint16_t dev_id;
> @@ -105,14 +161,26 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   	 * For Xe, use the PAT cache stored in struct xe_device.
>   	 * xe_device_get() populates the cache while still root; forked
>   	 * children that inherit the xe_device can use it post-drop_root().
> +	 *
> +	 * Fall back to hardcoded values when the kernel lacks the
> +	 * pat_sw_config debugfs. Platforms newer than Crescent Island
> +	 * must have the debugfs available.
>   	 */
>   	if (is_xe_device(fd)) {
>   		struct xe_device *xe_dev = xe_device_get(fd);
>   
> -		igt_assert_f(xe_dev->pat_cache,
> -			     "PAT sw_config not available -- "
> -			     "debugfs not accessible (missing root or not mounted?)\n");
> -		*pat = *xe_dev->pat_cache;
> +		if (xe_dev->pat_cache) {
> +			*pat = *xe_dev->pat_cache;
> +		} else if (xe_pat_fallback(fd, pat)) {
> +			igt_info("PAT sw_config debugfs not available, "
> +				 "using hardcoded fallback\n");
> +		} else {
> +			igt_assert_f(false,
> +				     "PAT sw_config not available and no "
> +				     "hardcoded fallback for this platform -- "
> +				     "kernel with 'drm/xe: expose PAT software "
> +				     "config to debugfs' required\n");
> +		}
>   		return;
>   	}
>   
