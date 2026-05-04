Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDB8CD3430
	for <igt-dev@archiver.kernel.org>; Mon,  4 May 2026 13:25:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB4310E3D1;
	Mon,  4 May 2026 13:25:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ank0rv9j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9189510E3D1
 for <igt-dev@lists.freedesktop.org>; Mon,  4 May 2026 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777901097; x=1809437097;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=poyT9e0iji/J3Cf8IQ062LzBd83PyhNwTD3AlPetxDc=;
 b=Ank0rv9js17pNKKe22M5NgxnqcpVOvIRpneTH/wYw+l4XGbzLV71VgLu
 Y2XQ43PS+j89159756eYpEBGtiE89n1hjr7b9xUuuDFBn+PmMEdODG9cd
 EThxQvbKuRdXXRxBSJ4wQpCG3HElxc5fbRz4QZUIf9ZEpLV5f1sdlacUU
 qXXXOqElX8Hag8F2++u1AdySC6ygXqaEIvueqlNukE1tQ10b5/4ZKoHp+
 IGWNdtQR63pfNFBm8lXQNe1uiiY0vs5OHmn+ZO//3TcamyxL1+2dvBHvp
 E9zbBQt79YuPcIBrpSG49AgKPdqzu6pnGFdjvz/h0dzdOVsCl/dR1v6hH w==;
X-CSE-ConnectionGUID: 0J3K7hFiTbu84t9zV53MXA==
X-CSE-MsgGUID: sldPnvqASFqipPa0JLPViA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="96323426"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="96323426"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 06:24:56 -0700
X-CSE-ConnectionGUID: 163gvIKzSUyPhQuot7KoQg==
X-CSE-MsgGUID: LqSwqKAcTuWgA5nKN6gx3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; d="scan'208";a="259160238"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 06:24:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 06:24:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 4 May 2026 06:24:55 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 4 May 2026 06:24:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MSCRx29QkwK4edg+bglIDfn/OhUx3EE51pTaBiEYxt8b1ekrptRpmkV3ctz6m5gNDDpCemM1HL6Qnk1wKOJLPZTD3dcrrbQ42w25GTvdmVs1IePDJr/ruCX35sml0KJDZSkze5lVsjVI2G8CG5yb7xCpniJ1eWZ1k30Vky6TqBTWOdo8vaQDplxv8Wx3uOu8EV8hLDt+WgTIdzd7hspciVylAKPvHrvTg7D9g9PY/rwKy1h58uD6LdspoKyNGFJ89a7behStmXTy4pxPIRv7AME89wm3SKSJHN0MJjrzt3HC5Hhuhfs6bpyCFmGXPD1yEC3WotfmW8taIqX6PwOAoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvoWQ/ZEGxzMk9+humjR64NY1GvOyQ2gwDfupvpossc=;
 b=nNfIGL2Z7xXvThCZJLdS78op29LE0fnx0fe6SK/+Im0Z+vDusb1qSzmUEx2FPVxyiQFgkwByfpGK2ksG5ZFbPxLXrcCePBmO3YSH7tpOPR4Wt7sUGt8GHjQttm/tJ/q5cIHyIud+z4Xf46+t4w7cRTa49SFpCe3x335tXgjvVaN/mVVHhJ+ekQwczgjXYKtcdcLn8VNfThLFRsVy1a1GWX6TrKMQxCg2/c907dTeKmjor7ZU7N7do2EWCq3Z2G4f0O99IUwK+XwinkkKp9gJR+OI3WPJlXple2xNLws1aqdB+KglPouPQAtVhvFEVv5IpspyJXf+Wxha6l9w92NbRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB8052.namprd11.prod.outlook.com (2603:10b6:8:122::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 13:24:51 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%7]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 13:24:51 +0000
Date: Mon, 4 May 2026 15:24:44 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] lib/intel_compute: Fix localgroup size passed in
 indirect data for Xe3p
Message-ID: <afieEvWrJLfRZsrg@fdugast-desk>
References: <20260504113814.3720157-2-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260504113814.3720157-2-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DB8PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:10:110::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB8052:EE_
X-MS-Office365-Filtering-Correlation-Id: 8689496c-0168-47e7-d700-08dea9e08582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: ga3R+cdOtWROs4gF2Y5OFj/gP5SVcEzT1jhMF5Jl9T2SKiP5NZnRkF4K0jU0eihtqAhIDq4fqnY/+loO7Y4qLtYtXN0fL0UIULyec+7TAqamGQ5lDgXTK6DjGhoW5gWkAy/0w4kSUly1tP9mZGHSz2uFeENWV3dljoeRCrpiUYhXtf8ggs9bYv1OvTPiyWQIxgj/Kr1CEOtqawH/JDwfnok3991SiIq5sKhW7+SU5ZQ1McGiVQ2PGhoHhdWYTH+5nC28WAaaSMbO+JfMPnBTkDuqp4u9959DU4c3oHh1+mxWTjHo9iHBZEgu15ZPrpUyZPQgcsvnPNgyHqW4Rt/0Qm6SfZW4o4j7sd4o9LfSVrJU5bOLqr2ecuO0TDZZBXd6RrTNtluHi/DMG2u8Io6t3o9MGxeeOZFULkf5Zd9sOxpIWREWIjhyqlSImvmeS4qpR+5tNZkYG5Q/UgdJCFxo0HB6pdYXouB+Y6lYakQRyp9ghJfDkNTqH/lkxc2L9qBDVowwQFCLVyBW47tqnCvkyWKmS7e8mudCcf5kvguFMrcMj/JbC/rEC8wggN8rjBZQwgQp+HEZWEDrBYbzBeh3ftD22zhJnH6BYN5UHyYFokLpvsWhasQwRdzBCqb/SVQDqrE4ge1baiZt0bpiAhKBFpvMUmZRpkVadQb9wfI2uiWvbzumqqyyCepQc3ypATvy
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEp0bU9CSU91S1hNWFhPQzlKeHZkYXZJTUNWZHRsVTAyV1VxS0NWUHM2RFBP?=
 =?utf-8?B?eVYvMTFtaTVwa0plNlU2Y3QxekVBQUgydUE5VjUyeWk1Sm95REg1bkIwektS?=
 =?utf-8?B?RzNpYklqMUsva0xOQlQ3eU5EeC9UcytFalJsMlB6VUIzYU9lb2pnQThzN25L?=
 =?utf-8?B?YUF2MnJDNFFvTUxCN3JLazB3cEhSN2dOYnQrNUVqaGFwOGN5QmxxNk5nYTlT?=
 =?utf-8?B?YUx1Q1JmQ2RlUmloQVdzdHFJSDNyS2dhUjRFKzVKNDlqWHE4QThGWjVvYUkz?=
 =?utf-8?B?Y1hIL1lncGVYZG02Sy9oWFRENGkrcjlBK21SSTVqSnlneGFGQ1hPTE5VT3o1?=
 =?utf-8?B?VE5NeDVOMVNCWmFJb2hGQmNqUVNmNGlocnlkYlF3T0lnT2VtdzVJMWptOTFZ?=
 =?utf-8?B?Qm9QdkVDWm9CMWlrcXB1Rk1tZmNUOFhjWHc5VXh2Zkx6bFZtSHJZTmhDTVRZ?=
 =?utf-8?B?NHJrbFc1SjRDYmREOTZ1UGtBbkhtTjZrUHBoMk92R3YzRnFGODRFUWsvcjJm?=
 =?utf-8?B?Ti9qa2RhMis0N0c1Uldwd0V0dk4zeGx0dXA2SHh1M1h5SXAwdEpDTmRLTWRM?=
 =?utf-8?B?eGFtYTJva1d4VkI1UVhQVkhwMGNvaGFZY0hEVTJncW9ZUXFnOFNDRUxBVGRO?=
 =?utf-8?B?NFBRTXhKSWVoajhRdzRhT05IK1B5ckJLVTdzTC94a0xra1hiaFUrbklNSjBn?=
 =?utf-8?B?dFlveVZBcS9VWUNycHkwM2I4Sjk2YVVwQS9zcDExbzNjR1VTUE5GSnpJVEFZ?=
 =?utf-8?B?MlNiSVU0ejNWTXVJN2JlSllqeVpLZGMxZXlwQ0RPQTlNMWFSYmgvd2pLUWps?=
 =?utf-8?B?cmdXWVhNZVJKKzY2c0VPL2tjZ3ozV0gwQ3lqVWxvQUNuRTRKUzQ3QlFOMVEr?=
 =?utf-8?B?Z0ZkaFlydUptMHc1a1RFdTdWeXNzQXZTT3V6aHMxYUFJNmhtSkJKUHRCK0hL?=
 =?utf-8?B?Wm93Qi9ZTGxod0x1TG9tTGx2d0NHWTlpb2dWSlFSSG9YVU5ob1hsVGxuT3pF?=
 =?utf-8?B?NkZac09tUVZneWIxaG5OeGtNK25uYm9LUXZsdGczNzZXdi85Qmx6VHlDR2tJ?=
 =?utf-8?B?NzluOXFmSzkvU1Ribk14Y0xzUFdERmJkR0dNTDU5TGp1cG9qVFNUV0syem5Q?=
 =?utf-8?B?ZjZ1OWlJc0FxWXJvaGNaeDFFS3g5NFprQ0p5eEZOYUVHRWdhQit0bmZwaUF2?=
 =?utf-8?B?d081OEFEYlh3SHVRdTkraHdlZ2tGSFVVak9NbWo5eUNEZ0NWK1NKTitQajcy?=
 =?utf-8?B?NTg4eUl0VDVPWU9OY2VBcHYzUTZ2cDNEcitaNUsya2F1Z3V0cFF0UUZ0RVJp?=
 =?utf-8?B?ME1JdHRpbllBRlNvQmg3TWRvUUdtUFYvRDVlSzl5eXFTZTdZajNydWhWQkwy?=
 =?utf-8?B?NFlYRUVoTHJIVFVPcFFqNmRZYjBWMXo3WmdPUmxjQTdnWTFoYVNGaXNvNncy?=
 =?utf-8?B?TVJsM01MeFQ0NFRJRnNWY3RYMXYyWHJzVG5peVJBNkdzZEUrOGpHRFYzSk9M?=
 =?utf-8?B?ekVaYlZvUkVDUVp3L2tSbjNpOWpPR081MkI2czRVYm11L2tuUzZESDdlSmkr?=
 =?utf-8?B?L0NFYTRMb3FhVE5WcFJqc1BDU05jNlA3bTZVTlo4dmhyQmRSUXYyQWRYbzFs?=
 =?utf-8?B?aExLNk0vNkJ5Q0ZjekdzTGtuVWdBUmVoNFN5dFFIL1BIUVcwNXN1UXQzeGlZ?=
 =?utf-8?B?UlBxSTVucHlZeCtFYW1EUGhRMFcwSGVsZzdsUllPSks4NWZneEl4S0VqRFRW?=
 =?utf-8?B?VGt1MXJkT3YyQ1ZRaGlYdWxvWFhTb1BRZzRjZlQ1QkJWeUVzTVR0a2txTEx3?=
 =?utf-8?B?SlpLTjRBS2lQVStaeEFQeGZYcDM0R1daSDFTSWJSNHdlSmJId3hlZlBXYW81?=
 =?utf-8?B?NVdmbHJvSnZ0aU9RTXhJU2o3SnM5Wkw3cU03Y0xLVnVEdUVoOUdrVllRNzZU?=
 =?utf-8?B?T1MyVzVDbU1xa3dNNnVkZXNLckd3NzR1cHZoTmhUajBRYWdUR09LMVMvdnZu?=
 =?utf-8?B?ZEtZWWtvdGdKYnVMdXNiVjF6RVNWZzNEMkhWR1BITE9sZWEvUjFrYUNUN0Fp?=
 =?utf-8?B?M2l1TVkyMWFpZE14SlI4Rlo4djlpQ0hQL1JMdUtsTExVVDhEdnRyM09oSU01?=
 =?utf-8?B?UnJiYWJSbUdoUXZtRjB1aEhCSlRpbFE0S0dYL29oRVpZcmRRbW9aeXJiL1ln?=
 =?utf-8?B?cnZMc0M1djhQeEdjOStzZVcwVTI5WlNXM2ZYeHJNb2l0Z2ZncG1aRnhNbmFz?=
 =?utf-8?B?UWhUdWVLL2hWeE5yRldQSi94b1g4bk85RUl2WWpDbXFvdEFUdDloZHU4ZWF1?=
 =?utf-8?B?YUhCMGVYQzlJTmkrYXV1cFpKVThLeTZkS1VocGNuRW5rMCtkUi9aUkY2c1J3?=
 =?utf-8?Q?mrxRQdCf0B3tzzdM=3D?=
X-Exchange-RoutingPolicyChecked: h7epMIMeM41TDd+ia7ScC3F+ofDTM70daA8HRekgoaQ9DWtb3hapSlc/MiII5wVmTXyhF3AZLueVMSdfJetcaDk9WctOLHoa0PNVBA42oCkLsl/2ThWRr7NeAfIBONqp7+yvnSWwiD2X+onsxfmduYJC2CbB6hFQOrlDJ5DTzzpYNAYZh8m9tzWDGXS+kxWJe3oT05Slr6pIYhZuXIZCOoL9r3yUR8u/FnWrPk3Xa7b5mqrB1uW+Irea1WTvcFCN6B454iSYRiV2juVEbEgnMVZBd5D4KOkV9a6dUrgmdxkdYyBVZ73vve+tf6wqZ1QJzOJzTJUt++oX7Aun/jbe/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8689496c-0168-47e7-d700-08dea9e08582
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 13:24:51.2800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QpioRqBx+wu26j49LPunl+Cf2bnXb9VGkw4u1dj+aHeLNzJ6Jsffbq2WdvLMet9s5MOz+2DZWIRJSjYhZtuI/Q4lCmbjxgh/Nc6E/uL/EnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8052
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

On Mon, May 04, 2026 at 01:38:15PM +0200, Zbigniew Kempczyński wrote:
> Previously hardcoded constants are not correct for handling larger buffers
> in compute square tests in Xe3p. Replace these values to commonly used
> localgroup size definitions.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  lib/intel_compute.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index 7dda423c80..680675982a 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -2054,7 +2054,7 @@ static void xe3p_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
>  	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
>  	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
> -	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
> +	addr_bo_buffer_batch[b++] = 0x000003FF; /* dw6 */ // Local X/Y/Z Dimension
>  
>  	if (threadgroup_preemption)
>  		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
> @@ -2081,7 +2081,7 @@ static void xe3p_compute_exec_compute(int fd,
>  
>  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
>  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
> -	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
> +	addr_bo_buffer_batch[b++] = 0x0C000000 | THREADS_PER_GROUP; /* dw24 */
>  	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
>  	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
>  
> @@ -2135,9 +2135,9 @@ static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
>  	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
>  	addr_bo_buffer_batch[b++] = addr_output >> 32;
>  	addr_bo_buffer_batch[b++] = loop_count;
> -	addr_bo_buffer_batch[b++] = 0x00000200;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> -	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_X;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Y;
> +	addr_bo_buffer_batch[b++] = ENQUEUED_LOCAL_SIZE_Z;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
> -- 
> 2.43.0
> 
