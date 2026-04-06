Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CB0FB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 22:25:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA2710E2E2;
	Mon,  6 Apr 2026 22:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X+uatVjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC9610E2E2
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 22:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775514330; x=1807050330;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cZT1APEJsHB/9v+aGWPyQ0uC5zIWIW+xY1tEwQKoJNA=;
 b=X+uatVjE/U51KWWTJdgdjxjWZRk1O2iq4Zpa+GXkCKHnqshTDBPmmYOI
 NlU2vCu7QO81z/vaYInkXazKGCJQ4gDOtL86cmRH8LsIc7gPXXi7ncrBV
 U9hDbBUj4xiZA4VjHnaTmiCLgLV8VqxAKrROpX7jecYHjse/2sTrqIzIO
 cRwaL5nw9rYhuX42udHOW0LxVwg0vrk2eE/aYDwR7FQMjJIMSv/HyVg8A
 1a+RyQ7gMlSmY3voD3+JrW9ayl6dNql99diusZPVg/ZsqZl+PxxCe/hnI
 SgP7+nHxGTvNVx7q6WR4vATxjFMK197bstkbGZF0cM0ZSH+BoaVrmdQJD Q==;
X-CSE-ConnectionGUID: 7aI1CeGIQ+eDNu4TR5S22w==
X-CSE-MsgGUID: 2tA5bSFQTfSXDHVdFRbDhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="87170996"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="87170996"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:25:29 -0700
X-CSE-ConnectionGUID: QwtCqWMSTnqbXuS/CywSAA==
X-CSE-MsgGUID: MAvL8yroSHKB5PGuH9EdhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="251261632"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 15:25:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:25:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 6 Apr 2026 15:25:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 6 Apr 2026 15:25:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANxuV8JKhFwRB/GQX0bm18LF5bpMwU+vHOeLNZJ0E3kPA3J1CfuEH1z4Qu2IHS0xMF9QdbJYlK307SieYQz5/QBTPwX7QRydOmhtlrbv9cDhsqcG28mkkuRLLkHtBuBMaTIAQZHf2ZtFuXZ/PYL0T6Za9TpkbR3jspxSvRs8IApgN+uSCofk06QTZqzJkrq40GRwRwhOiYV+IcG+Ro6BpdUPHTZi1gskPy5qn2oRjmhEjvZAelmzRzfnpjRDQ86khCWOwypGUfonvq5XgvkN4R/2i5cbfhv9p41wVnn8c1mlSXJP6pPm9Gpje9KQRvpAwwl1seMoa/d0S205JFC+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UBGtx9h7hwCKbIZl5fCJ/N2v+spUk2ow1lZFVCwxkjc=;
 b=TSk1zcseCquo5u8xokH3Fw13UPKDZq/ynamk56gL5RmKR6MJAMtFZlcFDo1lYHAAt10kLQGaqFuCTlfhQ6ruINVGYA0VNjgYNiobW0UjnRWoMIw43GnZDw3C16HzlH6A7fJzdr7spdy/8LeINg/6E8UTcypdnMrE22R7vyVQgUD29aV+cIqY/q7zJiAltx4zZSyJ1MdpApj/UXgL329Rl6Z6WJoopFToh8k+NmB3672JIRjfIx0Vl/lj6vmMBZ+s8fmJsGngxHmfruRNGgiQIq0AVBZcBgty3lDi941CFZt6+ckMkdTDZY+VbQlFZ58o4LjS1W6OEOqmpRrjxhU55Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 22:25:25 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 22:25:25 +0000
Message-ID: <a1ad3d65-5cf8-471e-a977-af18386d3e8c@intel.com>
Date: Mon, 6 Apr 2026 15:25:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,1/4] lib/xe: cache engine class masks from debugfs info
To: Xin Wang <x.wang@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260403071322.366766-2-x.wang@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260403071322.366766-2-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY5PR15CA0015.namprd15.prod.outlook.com
 (2603:10b6:930:14::29) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|CY8PR11MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 16d605a7-d671-454a-94bb-08de942b65d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: +dR+462BtNq7FNBTjrE6kvLjpD0Qykl3V+t55kNwk9Kv4rqQ2Qifdr4/4Sk04FfVHBXp1toT2Odj1o1Iz35MOhyrGGcJ9CokBoihwxy6IjHRuTAA9WHhk/EFKWsfAxnZ9IgCjWENb0IFGkrqxpfp4nbFjrKxH4EKASVpB6BFBQ3ACKRGVVz+hgmlh1GQ/Q/2kasVQRcXnDOZdONz8lh8Rb6BDDUiAWWNLUBrbaqAGzyWbcK/z83cpWiej6EVG7au3UbWWEVSNALY6w+Mxv5I36K6YQknoo48hzXk3Xy7deW746c7nVIdNwWjbvQuRTyJHCp0bQassgaAzTWuznjCla0WMp6C0Ld+LFvU83W7jldQ/x3B6d2Td2sGZuZnB60o3RDVrq+otsTtJks7SuAz5inXrVfaFmJCv/BB989MuIV69YtSFbKshW/tWGY0ZJQV8LOizzpalVDGEc4vRk86Gz80gthZaKnGaJUjCD7JOn7Im+9Kex4fd5NPTMpQrppl3hF6YJktOGz7Y/800/nIuXmG7UFefELNhfoRBBuBrO4eeDv1cWF/VkFiaMkKHMcmjI10fjc790w9uy6xXkr9yiaZP0cmiMO8RG3NsmNIIJwvQ331RT/FKSzl8pTVPs000sYV1eA1L1+gldbRgyW6441tK8NPPO9Jt1zDXhZGNCUL+vXbcyi1MydK9+fL9HAAtKkfPywyspckNMqLYpFq1eZ/zsoRIVkaSWsy3GAofI8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K25USE4reEtwNk04RVhieTNqTEh6dENTVlhNdWtUMW5uSFY0UXFaTDV3VHZX?=
 =?utf-8?B?dnhpdnNkNHdNR0ZTY0VuUFZyWkVGaFJ2RVlXa3JIdXJER0dwWTZhR2tnZlBP?=
 =?utf-8?B?ZDZtckxNQ3pkaUpIa28zemovRVpFc1BCODlEWmdzRS9DbFRtWjhtUlZuamU0?=
 =?utf-8?B?NUJ6TDNqVkQ1VExyUWcvZjkxRUlod0VYMjJaY01TU0hDTWJWVlJ1R0g0VytP?=
 =?utf-8?B?dk03cjFCVWF1eSthbUZBL2JNNWJQdGJYcUdGNllwSldwOE9TbHpaeXdlYm9n?=
 =?utf-8?B?SUY5RzMzZDFMM2lXMlRRVWZaYnpKZnhUSGRrRUJoUFpBeXdoem9xM1BLblFE?=
 =?utf-8?B?YUdYbk1BVWRKWDJGSlM1YUlXYTJjSEt2UUwzam5pcjNSNkwzUGh0Vlg3Zy95?=
 =?utf-8?B?T0ZzQXVGS2FFNk1OR0NOL2Npay9HNW55UUdQd085clQydzhlYkZ4eFdsK0JB?=
 =?utf-8?B?UmtTQ3lpQUcvRzhtc2VUbnlEYTFuOFVIYTZSQ29BeU1PdllGc1FwT0thdFZo?=
 =?utf-8?B?QVRNWWRPcXVlVWk4dUwrTnRRZGRpL3dDVjY1T2NUdkpOYU5yRGV4cEV1eHhT?=
 =?utf-8?B?UFNFRjM3SmdkSzhwYUhGSldlYUwyaFVyU3J2bE0rMFBweHpNMS8vLzFnaE1o?=
 =?utf-8?B?dTFRNkU0TmNneXpuVmZSdkNKQ2tDQ01Rczh3V0EzQUVkQ0lMb2RaaS9lSGVH?=
 =?utf-8?B?SDgvZWNTaGtjWVlranU4WkFGb1FVMVdJZm9PeUJLdGovREdabWtnVWlOSVRp?=
 =?utf-8?B?RHVwMmd3TWpZdTBjVUpYbFQrN1RRcnU0WFkxMGNzWnYyVXUyZnpscGJRY1dX?=
 =?utf-8?B?cysvaFk2SVBqQTVzcHlSeDQ4VFFYNHVLUm5RbUVwTFhFUVRkcWx2SFpmZDBv?=
 =?utf-8?B?dXhZdFJlZUdIV04wMkJ2Wlc3NEozWTVOeDRLS2twYU9xWUttL0NRRHVIZUR5?=
 =?utf-8?B?Qld1SDAxV1dISk1zNmV3Z3BRTVRsd29hamxRbytjbUZQa2JxNU1MbFdZcG1I?=
 =?utf-8?B?eDdVRTUyaytwdGpnZUQ3bXJkOWRIaG5UbldvVlVRQnpmUklld1dKbEhHUU1E?=
 =?utf-8?B?OFFPZ1I1eUhVUE1OMm1tL1crcisxRWZsTjdya0JIVysySjhyUXNJL3Awekk5?=
 =?utf-8?B?VFFRcUpCU00wdmxVbmt4S1N3WjhteDJWVkNyOFRuSHcrR2dENldxU3JLbWgw?=
 =?utf-8?B?VklKdmhEcnMrSXNlZ0F3QVFBMWtyRE5wRzRVVCtNR0NuK1pycCtWNFF1aVFu?=
 =?utf-8?B?OHVQNk0xSHNqRHN2ell6RHpCWndmZVd0NTNyK2VFSloxMHFkZEtJOXdNcmNq?=
 =?utf-8?B?ZHZGazgzWmtnV1ZwTFFDRENmRU1Ja1NSUi92SXpvanZZbENvYStocVBNV1Ni?=
 =?utf-8?B?WSs1VVZSWWUzSjd6OVlaQVE1MjlEOEMzMktuK1d4MjhVU0ZHMlhWbEpWSndR?=
 =?utf-8?B?SVk1bEgwVnV5WERtalhtbStqZ2FNR3dacmQ4Ryt5VzNTaXhLcFFHTDVMRFd6?=
 =?utf-8?B?eno2VmRYc3ZjT1dSNWJCUEgxcW85NnpzSjJWVzk4ZHd0YXJEcDg2QmJ3OVZa?=
 =?utf-8?B?eTIzQWVVcWVObnMvRzk2STJOZlRKN1dBOE9DaGcxa3NGeHpvWnBPS1RFRlIy?=
 =?utf-8?B?MEZrVGxGU21vcjZkVnlubzg0dk5pYjBwcW5DcFBMTXVKaHEvbXFvQzJDQlpB?=
 =?utf-8?B?K1ZZa2FsMTdsK0V0LzJ1TWZVRXpnVzZNQWsrTU5Pd2VIeG1QNFltc3pVMVkz?=
 =?utf-8?B?bnlHVkVtRkZTSkRuSVlZVVl2aUZTeksrNXlJV1JsWTJYeFNkZDNIUE5HanNW?=
 =?utf-8?B?azRZaEhDVjQreU9ZRjJ5VjJZNGhaWEc3Rlc2UEloRGljcFVRREE0M0ZLVUEx?=
 =?utf-8?B?MWRUeVN5eHRFSFYva00ySVVwKzh2MjdWMTR4aDZjdjhpR05YM0VQRzBDbkJn?=
 =?utf-8?B?d2FtMFQ3Z3ZaMFBjbDIxV2ttOG5xalphb0dlWHpTRmQ4Ukt5Vk12R2tXcTUy?=
 =?utf-8?B?Vmg3UE90bXlPcEVhaVI4ZnhJWFJrY0thUjFsVEZWZWNnemptdnJvZnVZNU1Y?=
 =?utf-8?B?WDgvNEF5ejl3Q3BKbmNQU0c3YlZadm5MSnBNaHB2angvRmVKWkxiVmxpS2NE?=
 =?utf-8?B?Nk8rbzJ6TFVZQmlxaGJrK21rNFhuVWNNNmVlK3VPMnBaMzBHTGNTc0IyZkw0?=
 =?utf-8?B?WGxHMS9oUTcyeUQvS2ZXdXRvaVFrRFI4V3RsMTR0VmUvTHBLenE2VURYT2ww?=
 =?utf-8?B?RGpSd2FmMHk2aGwvYmJqSGpnaEVuellocmpZT1NYTDdCUE1OcjNaVlQxb0ZT?=
 =?utf-8?B?UjdTbXVXaDhmKzlla2NOdEdEakNPZ29IZVJQZTBtNFY4L29KVnFSTjZmOE1N?=
 =?utf-8?Q?zmRYMORvdLBL9j/g=3D?=
X-Exchange-RoutingPolicyChecked: Awxb2ZDvHYUZn143wNc6lReNydqPSCvClZOzRURLV7RIXAIa7HOz5TC+wPXe68qc0R5R2tdZKooAfxxxBciI4315D/TOxsWrsUa+2ZVlF4f78C6R8DaC6wxJ/nnMsEIldB8LpAQ3P8ZRhjGDxOVDtlZ9Zf/w9xLsTwUbe70huVnQsItTKmPdeMq2rzLpcjfAlxUrZZvOozkIUZ9f1GKZO+EpiN9LpWpS6MVR0+0AFdCvAu0BnPLLxekA5MpYAOAOnKlpxh3e7Gl9T6XvtL2hMrLNFba4hmc6srs6dgO8cNxdTuN9WMdb46jfA9lj35wdC7aM4jelmMtmLba473bjoA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 16d605a7-d671-454a-94bb-08de942b65d6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 22:25:24.9666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /NjI3G6+bZjANJsJfj3TAXOjhNNeSxEPkkSyI0shh9DGPBfPPjI+w7dOXxsXFelXBsAnKkExcKkbXo0xIaajbWBRzzLX91HLfDYJcd7PJ5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289
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


On 4/3/2026 12:13 AM, Xin Wang wrote:
> Read the multi_lrc_engine_classes and multi_queue_engine_classes lines
> from the xe debugfs info node and cache them in struct xe_device as
> bitmasks indexed by DRM_XE_ENGINE_CLASS_* values.
>
> The new fields are set to UINT16_MAX when the kernel does not yet expose
> the information (i.e. when the key is not present in the info node), so
> callers can distinguish "not available" from "empty set".
>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   lib/xe/xe_query.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_query.h | 12 +++++++
>   2 files changed, 98 insertions(+)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 00331c628..441e95794 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -6,6 +6,7 @@
>    *    Matthew Brost <matthew.brost@intel.com>
>    */
>   
> +#include <fcntl.h>
>   #include <stdlib.h>
>   #include <pthread.h>
>   
> @@ -19,6 +20,7 @@
>   #endif
>   
>   #include "drmtest.h"
> +#include "igt_debugfs.h"
>   #include "ioctl_wrappers.h"
>   #include "igt_map.h"
>   #include "intel_pat.h"
> @@ -134,6 +136,85 @@ static uint32_t __mem_default_alignment(struct drm_xe_query_mem_regions *mem_reg
>   	return alignment;
>   }
>   
> +/*
> + * parse_engine_class_mask - parse a space-separated list of engine class names
> + * into a bitmask indexed by DRM_XE_ENGINE_CLASS_* values.
> + *
> + * @names: the engine class names string, e.g. " vcs vecs" or "bcs ccs"
> + *
> + * The kernel debugfs "info" output for multi_lrc_engine_classes and
> + * multi_queue_engine_classes uses the same short names as
> + * xe_engine_class_short_string(): "rcs", "bcs", "vcs", "vecs", "ccs".
> + *
> + * Returns the bitmask, or 0 if no known class names were found.
> + */
> +static uint16_t parse_engine_class_mask(const char *names)
> +{
> +	static const struct {
> +		const char *name;
> +		uint32_t engine_class;
> +	} class_map[] = {
> +		{ "rcs",    DRM_XE_ENGINE_CLASS_RENDER },
> +		{ "bcs",    DRM_XE_ENGINE_CLASS_COPY },
> +		{ "vcs",    DRM_XE_ENGINE_CLASS_VIDEO_DECODE },
> +		{ "vecs",   DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE },
> +		{ "ccs",    DRM_XE_ENGINE_CLASS_COMPUTE },
> +	};
> +	uint16_t mask = 0;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(class_map); i++) {
> +		if (strstr(names, class_map[i].name))
> +			mask |= BIT(class_map[i].engine_class);
> +	}
> +
> +	return mask;
> +}
> +
> +/*
> + * Read the debugfs "info" file and OR together the engine class bitmasks from
> + * every line that contains @key.  Returns UINT16_MAX if @key is not found
> + * (kernel too old to expose this information).
> + *
> + * multi_lrc_engine_classes is printed once at device level; multi_queue_engine_classes
> + * is printed once per GT, so the OR handles the multi-GT case transparently.
> + */
> +static uint16_t xe_device_query_engine_class_mask(int fd, const char *key)
> +{
> +	char *line = NULL;
> +	size_t line_len = 0;
> +	uint16_t mask = UINT16_MAX;
> +	size_t key_len = strlen(key);
> +	int dbgfs_fd;
> +	FILE *dbgfs_file;
> +
> +	dbgfs_fd = igt_debugfs_open(fd, "info", O_RDONLY);
> +	if (dbgfs_fd < 0)
> +		return mask;
> +
> +	dbgfs_file = fdopen(dbgfs_fd, "r");
> +	if (!dbgfs_file) {
> +		close(dbgfs_fd);
> +		return mask;
> +	}
> +
> +	while (getline(&line, &line_len, dbgfs_file) != -1) {
> +		const char *p = strstr(line, key);
> +
> +		if (!p)
> +			continue;
> +
> +		if (mask == UINT16_MAX)
> +			mask = 0;
> +		mask |= parse_engine_class_mask(p + key_len);
> +	}
> +
> +	free(line);
> +	fclose(dbgfs_file);
> +
> +	return mask;
> +}
> +
>   /**
>    * xe_engine_class_supports_multi_queue:
>    * @engine_class: engine class
> @@ -330,6 +411,11 @@ struct xe_device *xe_device_get(int fd)
>   	}
>   	pthread_mutex_unlock(&cache.cache_mutex);
>   
> +	xe_dev->multi_lrc_mask =
> +		xe_device_query_engine_class_mask(fd, "multi_lrc_engine_classes");
> +	xe_dev->multi_queue_engine_class_mask =
> +		xe_device_query_engine_class_mask(fd, "multi_queue_engine_classes");
> +
>   	return xe_dev;
>   }
>   
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 05e2ad84f..f33562bda 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -79,6 +79,18 @@ struct xe_device {
>   
>   	/** @pat_cache: cached PAT index configuration, NULL if not yet populated */
>   	struct intel_pat_cache *pat_cache;
> +
> +	/**
> +	 * @multi_lrc_mask: bitmask of engine classes supporting multi-LRC.
> +	 * UINT16_MAX if not available (older kernel).
> +	 */
> +	uint16_t multi_lrc_mask;
> +
> +	/**
> +	 * @multi_queue_engine_class_mask: bitmask of engine classes supporting
> +	 * multi-queue. UINT16_MAX if not available (older kernel).
> +	 */
> +	uint16_t multi_queue_engine_class_mask;
>   };
>   
>   #define xe_for_each_engine(__fd, __hwe) \
>
>  From patchwork Fri Apr  3 07:13:20 2026
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: [v2,2/4] lib/xe: add xe_engine_class_supports_multi_lrc()
> From: Xin Wang <x.wang@intel.com>
> X-Patchwork-Id: 716341
> Message-Id: <20260403071322.366766-3-x.wang@intel.com>
> To: igt-dev@lists.freedesktop.org
> Cc: Xin Wang <x.wang@intel.com>
> Date: Fri,  3 Apr 2026 00:13:20 -0700
>
> Add xe_engine_class_supports_multi_lrc() to query whether an engine
> class supports multi-LRC submission.  When the kernel exposes the
> information via the debugfs info node it is used directly; otherwise
> fall back to a hardcoded default to keep compatibility with older KMD.
>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   lib/xe/xe_query.c | 30 ++++++++++++++++++++++++++++++
>   lib/xe/xe_query.h |  1 +
>   2 files changed, 31 insertions(+)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 441e95794..e13d5e143 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -308,6 +308,36 @@ static struct xe_device *find_in_cache(int fd)
>   	return xe_dev;
>   }
>   
> +/**
> + * xe_engine_class_supports_multi_lrc:
> + * @fd: xe device fd
> + * @engine_class: engine class
> + *
> + * Returns true if multi LRC supported by engine class or false.
> + * Uses the kernel-reported bitmask from debugfs when available, otherwise
> + * falls back to the hardcoded per-class default.
> + */
> +bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class)
> +{
> +	struct xe_device *xe_dev = find_in_cache(fd);
> +
> +	if (xe_dev && xe_dev->multi_lrc_mask != UINT16_MAX)
> +		return !!(xe_dev->multi_lrc_mask & BIT(engine_class));
> +
> +	switch (engine_class) {
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +		return false;
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return true;
> +	default:
> +		igt_warn("Engine class 0x%x unknown\n", engine_class);
> +		return false;
> +	}
> +}
> +
>   static void xe_device_free(struct xe_device *xe_dev)
>   {
>   	free(xe_dev->config);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index f33562bda..5c26a3e88 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -162,6 +162,7 @@ uint32_t xe_va_bits(int fd);
>   uint16_t xe_dev_id(int fd);
>   int xe_supports_faults(int fd);
>   bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
> +bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class);
>   const char *xe_engine_class_string(uint32_t engine_class);
>   const char *xe_engine_class_short_string(uint32_t engine_class);
>   bool xe_has_engine_class(int fd, uint16_t engine_class);
>
>  From patchwork Fri Apr  3 07:13:21 2026
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: [v2,3/4] lib/xe: use debugfs info to implement
>   xe_engine_class_supports_multi_queue()
> From: Xin Wang <x.wang@intel.com>
> X-Patchwork-Id: 716343
> Message-Id: <20260403071322.366766-4-x.wang@intel.com>
> To: igt-dev@lists.freedesktop.org
> Cc: Xin Wang <x.wang@intel.com>
> Date: Fri,  3 Apr 2026 00:13:21 -0700
>
> Update xe_engine_class_supports_multi_queue() to take a device fd and
> use the kernel-reported multi_queue_engine_classes bitmask from debugfs
> when available, with a fallback to the hardcoded default for older KMD.
>
> Propagate the new fd argument through the xe_for_each_multi_queue_engine
> and xe_for_each_multi_queue_engine_class macros and all their call sites.
>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   lib/xe/xe_query.c                 | 52 ++++++++++++++++++-------------
>   lib/xe/xe_query.h                 |  8 ++---
>   tests/intel/xe_exec_multi_queue.c |  4 +--
>   tests/intel/xe_exec_threads.c     |  4 +--
>   4 files changed, 38 insertions(+), 30 deletions(-)
>
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index e13d5e143..3286a3b37 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -215,28 +215,6 @@ static uint16_t xe_device_query_engine_class_mask(int fd, const char *key)
>   	return mask;
>   }
>   
> -/**
> - * xe_engine_class_supports_multi_queue:
> - * @engine_class: engine class
> - *
> - * Returns true if multi queue supported by engine class or false.
> - */
> -bool xe_engine_class_supports_multi_queue(uint32_t engine_class)
> -{
> -	switch (engine_class) {
> -		case DRM_XE_ENGINE_CLASS_COPY:
> -		case DRM_XE_ENGINE_CLASS_COMPUTE:
> -			return true;
> -		case DRM_XE_ENGINE_CLASS_RENDER:
> -		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> -		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> -			return false;
> -		default:
> -			igt_warn("Engine class 0x%x unknown\n", engine_class);
> -			return false;
> -	}
> -}
> -
>   /**
>    * xe_engine_class_string:
>    * @engine_class: engine class
> @@ -338,6 +316,36 @@ bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class)
>   	}
>   }
>   
> +/**
> + * xe_engine_class_supports_multi_queue:
> + * @fd: xe device fd
> + * @engine_class: engine class
> + *
> + * Returns true if multi queue supported by engine class or false.
> + * Uses the kernel-reported bitmask from debugfs when available, otherwise
> + * falls back to the hardcoded per-class default.
> + */
> +bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class)
> +{
> +	struct xe_device *xe_dev = find_in_cache(fd);
> +
> +	if (xe_dev && xe_dev->multi_queue_engine_class_mask != UINT16_MAX)
> +		return !!(xe_dev->multi_queue_engine_class_mask & BIT(engine_class));
> +
> +	switch (engine_class) {
> +	case DRM_XE_ENGINE_CLASS_COPY:
> +	case DRM_XE_ENGINE_CLASS_COMPUTE:
> +		return true;
> +	case DRM_XE_ENGINE_CLASS_RENDER:
> +	case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +	case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +		return false;
> +	default:
> +		igt_warn("Engine class 0x%x unknown\n", engine_class);
> +		return false;
> +	}
> +}
> +
>   static void xe_device_free(struct xe_device *xe_dev)
>   {
>   	free(xe_dev->config);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 5c26a3e88..8815c6c66 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -113,10 +113,10 @@ struct xe_device {
>   
>   #define xe_for_each_multi_queue_engine(__fd, __hwe)	\
>   	xe_for_each_engine(__fd, __hwe)			\
> -		for_if(xe_engine_class_supports_multi_queue((__hwe)->engine_class))
> -#define xe_for_each_multi_queue_engine_class(__class)			\
> +		for_if(xe_engine_class_supports_multi_queue(__fd, (__hwe)->engine_class))
> +#define xe_for_each_multi_queue_engine_class(__fd, __class)		\
>   	xe_for_each_engine_class(__class)				\
> -		for_if(xe_engine_class_supports_multi_queue(__class))
> +		for_if(xe_engine_class_supports_multi_queue(__fd, __class))
>   
>   #define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_SYSMEM)
>   #define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class == DRM_XE_MEM_REGION_CLASS_VRAM)
> @@ -161,7 +161,7 @@ uint32_t xe_get_default_alignment(int fd);
>   uint32_t xe_va_bits(int fd);
>   uint16_t xe_dev_id(int fd);
>   int xe_supports_faults(int fd);
> -bool xe_engine_class_supports_multi_queue(uint32_t engine_class);
> +bool xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class);
>   bool xe_engine_class_supports_multi_lrc(int fd, uint32_t engine_class);
>   const char *xe_engine_class_string(uint32_t engine_class);
>   const char *xe_engine_class_short_string(uint32_t engine_class);
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index f987f8d6a..b5ded0633 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -1052,7 +1052,7 @@ int igt_main()
>   
>   	igt_subtest_f("sanity")
>   		xe_for_each_gt(fd, gt)
> -			xe_for_each_multi_queue_engine_class(class)
> +			xe_for_each_multi_queue_engine_class(fd, class)
>   				test_sanity(fd, gt, class);
>   
>   	igt_subtest_f("exec-sanity")
> @@ -1061,7 +1061,7 @@ int igt_main()
>   
>   	igt_subtest_f("virtual")
>   		xe_for_each_gt(fd, gt)
> -			xe_for_each_multi_queue_engine_class(class)
> +			xe_for_each_multi_queue_engine_class(fd, class)
>   				test_exec_virtual(fd, gt, class);
>   
>   	igt_subtest_f("priority")
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index f082a0eda..ab9565beb 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -1141,7 +1141,7 @@ static void threads(int fd, int flags)
>   	int gt;
>   
>   	xe_for_each_engine(fd, hwe) {
> -		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
> +		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>   			continue;
>   		++n_engines;
>   	}
> @@ -1170,7 +1170,7 @@ static void threads(int fd, int flags)
>   	}
>   
>   	xe_for_each_engine(fd, hwe) {
> -		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(hwe->engine_class))
> +		if ((flags & MULTI_QUEUE) && !xe_engine_class_supports_multi_queue(fd, hwe->engine_class))
>   			continue;
>   		threads_data[i].mutex = &mutex;
>   		threads_data[i].cond = &cond;
>
>  From patchwork Fri Apr  3 07:13:22 2026
> Content-Type: text/plain; charset="utf-8"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> Subject: [v2,4/4] tests/intel: skip or adjust tests for non-multi-LRC engine
>   classes
> From: Xin Wang <x.wang@intel.com>
> X-Patchwork-Id: 716344
> Message-Id: <20260403071322.366766-5-x.wang@intel.com>
> To: igt-dev@lists.freedesktop.org
> Cc: Xin Wang <x.wang@intel.com>,
>   Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
>   Matthew Brost <matthew.brost@intel.com>
> Date: Fri,  3 Apr 2026 00:13:22 -0700
>
> Use xe_engine_class_supports_multi_lrc() to guard multi-LRC test paths:
>
> - xe_exec_balancer: skip tests requiring multi-LRC if the engine class
>    does not support it
> - xe_exec_reset: same guard for the balancer subtest
> - xe_drm_fdinfo: skip utilization_multi() for non-multi-LRC classes
> - xe_exec_threads: assert multi-LRC support before test_balancer()
> - xe_exec_multi_queue: only validate parallel-queue rejection (-EINVAL)
>    for engine classes that support multi-LRC; non-multi-LRC classes do
>    not accept the MULTI_GROUP flag at all so the check is irrelevant
>
> Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c       | 2 +-
>   tests/intel/xe_exec_balancer.c    | 6 +++---
>   tests/intel/xe_exec_multi_queue.c | 2 +-
>   tests/intel/xe_exec_reset.c       | 2 +-
>   tests/intel/xe_exec_threads.c     | 1 +
>   5 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 411ca6ec4..3c113ed5d 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -673,7 +673,7 @@ utilization_multi(int fd, int gt, int class, unsigned int flags)
>   	igt_assert(virtual ^ parallel);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return;
>   
>   	igt_debug("Target class: %s\n", engine_map[class]);
> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
> index 9cd641b4e..3c6ec45f1 100644
> --- a/tests/intel/xe_exec_balancer.c
> +++ b/tests/intel/xe_exec_balancer.c
> @@ -57,7 +57,7 @@ static bool test_all_active(int fd, int gt, int class)
>   	int i, num_placements;
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return false;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> @@ -187,7 +187,7 @@ test_exec(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return false;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> @@ -402,7 +402,7 @@ test_cm(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   	igt_assert_lte(n_exec_queues, MAX_N_EXEC_QUEUES);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return false;
>   
>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
> diff --git a/tests/intel/xe_exec_multi_queue.c b/tests/intel/xe_exec_multi_queue.c
> index b5ded0633..ca96099d3 100644
> --- a/tests/intel/xe_exec_multi_queue.c
> +++ b/tests/intel/xe_exec_multi_queue.c
> @@ -112,7 +112,7 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
>   
>   	/* Multi-Queue can't be a parallel queue */
>   	multi_queue.value = DRM_XE_MULTI_GROUP_CREATE;
> -	if (n > 1)
> +	if (n > 1 && xe_engine_class_supports_multi_lrc(fd, class))
>   		igt_assert_eq(__xe_exec_queue_create(fd, vm, 2, 1, eci, ext, &val), -EINVAL);
>   
>   	/* Specifying multiple MULTI_GROUP property is invalid */
> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> index 7aaee31dd..95191139d 100644
> --- a/tests/intel/xe_exec_reset.c
> +++ b/tests/intel/xe_exec_reset.c
> @@ -184,7 +184,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>   		fd = drm_open_driver(DRIVER_XE);
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
> -	if (num_placements < 2)
> +	if (num_placements < 2 || !xe_engine_class_supports_multi_lrc(fd, class))
>   		return;
>   
>   	vm = xe_vm_create(fd, 0, 0);
> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
> index ab9565beb..7b8100c5b 100644
> --- a/tests/intel/xe_exec_threads.c
> +++ b/tests/intel/xe_exec_threads.c
> @@ -85,6 +85,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>   
>   	num_placements = xe_gt_fill_engines_by_class(fd, gt, class, eci);
>   	igt_assert_lt(1, num_placements);
> +	igt_assert(xe_engine_class_supports_multi_lrc(fd, class));

The series looks good to me

Reviewed-by: Daniel Charles <daniel.charles@intel.com>

>   
>   	bo_size = sizeof(*data) * n_execs;
>   	bo_size = xe_bb_size(fd, bo_size);
