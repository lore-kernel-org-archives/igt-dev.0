Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BBBC54E64
	for <igt-dev@archiver.kernel.org>; Thu, 28 Mar 2024 07:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC28410F77C;
	Thu, 28 Mar 2024 07:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBMp8wtI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4EEF10F77C
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Mar 2024 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711609930; x=1743145930;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vHav1TJjThwCfrBXmjp1hUEl8MCkRc0E4bb6h+qGQek=;
 b=jBMp8wtI/XI/V0w52572YHL7RB1PKLXwv7XYNzPs3z2Ma6q/to9MA6BO
 7GfDWa9U1wJmRJOwZoIOZFOgd3oIz9in+kcVB35776KSLAjskpoVFWNgA
 XAy4+hF/C6f8bWZVW1I2rZ1PtcdxEHaWTvdJzp1nK718NQDpP9hMc50Sx
 TlNpLs20KGIYeyv4kz3O2NMuaGU2pUhFkxCXrIadzsAba4TTXy2e89Omy
 aQyaqsGaG360ij/ErtI+poBXRXwudlVIIX3TdTUozhDIaFYaTObtyN/Jk
 t9iHz7LNlW8YbfXIpIpwSP8TuxBz7KzMWsb5iLIywbtUvD5ChVEyUfzP0 g==;
X-CSE-ConnectionGUID: 4jnqRMIxRHegeRuq0oySYQ==
X-CSE-MsgGUID: RbQPOX79Ts61GJJNXlvbUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="18181766"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="18181766"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 00:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="47537365"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 00:11:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 00:11:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 00:11:57 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 00:11:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgudSsqystf1p/a/e9FPwR2YmLTlVFnuikgxqithIRsxJ2F3ZKYgszmSl4iXmAF4XXRSUbqGDa9aaFSAvT7PcYbpleoJcljZRl5EckkxpOeGjIbxSA6km391KcADiZmH2du1y43IR2VT221uquYfFukYZOeiZVCYqDvViahLA/Au+Qk8QxGcFMkXl8kL/WGYxtUQwLEDbqDmk3Wns8quAEkUT075v7WW8F2bG4GxHOGPvFu16kIJez9izJGPbr2gRveuDxY4X74jKGmnxaTpsi5zLVW/OY4ZNSFLSRLmFKM5vnOz1DJX4Gh2Z3cIEnSHMviRjO88QLMG31wPJ62/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HtpqUVXDsBsJpx+AlLaVDfIV33GRQB5L/9b0Cu0mtE=;
 b=YOhWmMpeaiPyxydmmqH27m1Arij0lATFPnN/f8TIGQTYw+NTZNAj9dSuaefCTbLVX5mkRIdotuXD98d1U9mjyrSEeHOcUtFpJHiRAL66y97uS8AbSkvMnlg4vr55NUX3uNAHLOnV4sZUqbEoOZ6bW496z5cAXn3nZm1xLZZZkcLhA+aVfqmgOl7QyOrN7rB77yqohIycLqm5db7leXdMtkeG+HisacjwS5hm5/ACmbeFKgO0pvw+iqI444+rgrt0Amla3iQVXErtnGn5TZOtLKiEVFHydMnOU66s/u84CKA6XOIbcTCNIcHxB+gcEW3V3/QEpt1eTH1iRavw7RD+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Thu, 28 Mar
 2024 07:11:55 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 07:11:55 +0000
Message-ID: <e3b7dc46-a988-4147-838b-63fd9324a429@intel.com>
Date: Thu, 28 Mar 2024 12:41:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/4] lib/igt_kms: add helper to enable/disable force
 joiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240325165136.1265895-1-kunal1.joshi@intel.com>
 <20240325165136.1265895-4-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240325165136.1265895-4-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0243.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::6) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a949b5f-acde-4b70-3557-08dc4ef659bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nStTz3XUz/Nscog6eBT1MYcA3XkIrlVoPUqukjzazecGcCiDmMrt6qblimIA3NHzQa0qvdt52CmROco/mBCFdDzs5dovqkh7E/VJR13Avzx9xJBW8klKveFZUISc7F6yHKZ5ZfX1a9VuPvPbqfzXUh75xsZcPLOWOZBofkB89qUsitlUEsdtmDfyxsrH+nWoFfRoMxL831A6uixwENWzEhLmb9taIMEpZvv+FVjwMo+9uirziQJHD3eZoxscBP4pGjnkKRO9fJQFrNVoHDUWbkH8vwnqw2IrgpJ2YIJmiZbGDxC93zyVcwvv383TI4kZz2a7h108Qvco0XI4UU2e0aL18UjYGu4hDhOWRCmnajJl/OwCUh8i5DnhGZS2Z3ggferg1z5Ir//vutStscIUiTgUbAkV3jcjzhCOxrAYhooVWJ6VAByu2+tRAHOx+anCNLZ6lYnzD9RkMTUUT1Qyyd1gM7A+lQjM+TIpzZJ159HadyNxLkcLapgndWRduST5qbzdPD9bUjDe5iYmIBqaz1AXaZEnAGcBUgFEXACFrKda3H6Y7XpZ1Pt9LLqISK9akiQNWCogU89G3jgaxqi1XmCfxbcqXHBp81fPpsvrUoa4wDMG5rG2Qo5BgeXiQfTvUfGVP5hQMO5xQqQOkX9/u+iSKyGWM0pkzn4D5gfeGOE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDdRQ3ZaSXd6bkxLbVhYck5nd1cwczUyZmNjdW5PMmMrV21GQzlEZmlmdElk?=
 =?utf-8?B?Z0pOZHREdUhQRWhvTGRVUERWZndTSVpIK2NZY0hlVjVjdGM4aVE0QksrNXlC?=
 =?utf-8?B?Tkl4YkhwWEJPVkdTVlJsVStOa25tVEIyMUVvcFl4aVpJVmJXWkVZbFp1RWRh?=
 =?utf-8?B?dm5lTXhLdkMvSC9PLzJnbUt3RHhJVjAyOEovMEk3eTNiaTdaNzlKaXpqSGtU?=
 =?utf-8?B?Qm9qK1d1bVhCVXFnd2ViR3NZUmZYUmNMNStkUWkwSzg1TjAxZHA4ZHZydmJs?=
 =?utf-8?B?OXA4REJLQko1TithNmIwYitXMWZNeUtOZEpuRSt4eVBWbkVBZzFyU0tLMC9V?=
 =?utf-8?B?emZBaTJGMXRqWjhSZXg4RHpvanFEOVVQek9pSUdNK3RvOFNXOC9rWkNBUmJk?=
 =?utf-8?B?VTVZMmYwcUNwRHlyRDdEbXdlRXpzc2tDMDZ0U2dkajZ4dG5WNTRhZFdmckJv?=
 =?utf-8?B?aFhLM1JsV0tDWU5oSGxXcm1ka2JraGtKQWRRbU1Nc0RwVVdKSGRxOHdweUxJ?=
 =?utf-8?B?OEl5RlcyVU9JTlQ5eDRzdUh1V0hBZFhrSStncUpTYXZ5dmxEd2xCeDFCN1li?=
 =?utf-8?B?NStrcEVnYzBrUnZrZUxqK3FKUE9ieEtxS09hTlp6SWNBclhTNXoya3dtUjFT?=
 =?utf-8?B?bEk2RjdlZGhXa05CWmF6clA0Z3F6bkltYWNDR0p0bXBOa2tmYTVkNHhOSFY3?=
 =?utf-8?B?WTNoNUVxZUx2UVVmVnozM3hzci9NbUJlZGd1alh2Mng1bjB0NzNCTnh4aXlx?=
 =?utf-8?B?cHQvYUhRei95c1FJbHBjaWlNRWxBQ3J5UkZDVG9oam1MYzA1YWNmNlEwMDFn?=
 =?utf-8?B?MFVralVwbnFkV0twWWFSTllNSnhqNVlEVWU5TC9uSWc1alNDMThEUmtJcnNT?=
 =?utf-8?B?a1cwWjhLdUpOTGdscEQrVkFGblppblc5MjNEVkY1M1EyVW83anJJUkhVdWlO?=
 =?utf-8?B?MWpwRlhWVmc1UklnakcyTXhQbVgzWVFSYXJyYlI3ak1wUkoxVm5aYUdmNzJN?=
 =?utf-8?B?NHhSUjVVOEg1MnpiZHIzcnZRNFlIYitQLzM3TjQxcXhWWXlLQk9CanlxMFRr?=
 =?utf-8?B?eDVRWHkrekl0bzIvb0R4bWFxWUd4VHNmb1BFZUY2QTB5Rkc4dzZSVmF4UHIz?=
 =?utf-8?B?MVZvakFUd25yV0FLY3BKSy9IcEJVNVpDaEJqTDh0YWJJaURHbkRDNyt1djcx?=
 =?utf-8?B?dWZpZzU3QmFwRW8wRW1aeGQ0U1l6R1h5UW83Q2VpajV2aGplMlZKS1R2R3FN?=
 =?utf-8?B?OVR6T0ZkOVNIenBDQkcxYm4zU1piTWZjejVVZDV6U1RMR1FkcGM3bk1WTWth?=
 =?utf-8?B?ZUtYK09QSjE4bUN5V1pBUXZpdmMySUIzYi83dUlaKzg0a25ta3dBNGV4Y1FE?=
 =?utf-8?B?S3hSY3dlYXFteDRwdVVqYW0zNFlrZHphUEZaM0FiRmFrdzJFeUlnOStFM0Fo?=
 =?utf-8?B?em1IY2Z2eURIekt0U3dBZ2JibGVIMXNub0tYZmxUeVVRc0VjeWRXUng3TnNa?=
 =?utf-8?B?a1U2cEFKRnh5RWpDRWw2TFIwVm95bHh4TnNHNkF2czlTamd4d3J2OXpaQ1Qy?=
 =?utf-8?B?ZGd0U2J4SjlWT0l0VnRtbDVVQ1o4ZzMyR21mbDJ4UDNYZDJPSjVNVWF2Sjhq?=
 =?utf-8?B?dC9kbHdsZVJEdzZwWDd1S25NMWovK1VFVXllMUlXOGJLUkJhV0tibHlCalkw?=
 =?utf-8?B?dGVsam44bk1UWDhZRi91aHVjRnlwd0J1TTBTYmdURVhrdzNnaGI4cm5yU1hu?=
 =?utf-8?B?RVNnNVV3MTZGdmdoY3ZKbEJnbmM3UzA0WWUyYk4xYlNWcUFiZ2dnN2ErTFFs?=
 =?utf-8?B?d2hGY2x2OXcxVTlCRWl1WVIxUWtoWHpPdWFCYk5uN1N0bzBmSVRTZlBYSzRi?=
 =?utf-8?B?MHorNGdnN2pRN3pKUDUrY29FOXhPQWEvUTFpUCt5MzZsS0NBTmh1aFBjdE05?=
 =?utf-8?B?ZWlYZEVUV0d0TEhQRUFWczkzWW9RSXRjNjk0aUtiL05ZWTM1MHBuSlhmWS9I?=
 =?utf-8?B?M1NScjJ4Z1g4c3ZPTjFEKzBrY0ZlU1J3ZEVvTHZpWXQ3LytQeS9qZVBONXJr?=
 =?utf-8?B?OGFkMHN5V1V2M25RYkRLMmZhanRZR3pwUXlhT045QUZJN2xvMGxJaVVIVXV4?=
 =?utf-8?B?bklYYlRUUGJ1NEtmZDNMcE1lMGVVdHZXZGY5TFhEcjgwbGw2MGtzci8vZDRF?=
 =?utf-8?B?RUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a949b5f-acde-4b70-3557-08dc4ef659bd
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 07:11:55.8224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B8tpc032+YdN5APe2WJweSXW95Eakz6zJUiSni7IJDst7hO4RZMDBZGMw8ZmG51h+D9Uc3YPhIrfCJEMGrZ1sdnwFRTOHYn/EVSD2/aHI1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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


On 3/25/2024 10:21 PM, Kunal Joshi wrote:
> v2: Add documentation and rename (Ankit)
>      Combine enable/disable and status check (Ankit)
>      Don't assert in igt_has_force_joiner_debugfs (Ankit)


Version history should come after the commit message.

I think this got mix up between series rev 7-8.


Regards,

Ankit

>
> add helpers to check whether force joiner debugfs exists
> and to enable/disable force joiner for a specific connector.
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   lib/igt_kms.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_kms.h |  2 ++
>   2 files changed, 53 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 548c9d1f3..c38021dd7 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6171,6 +6171,57 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   	return found;
>   }
>   
> +/**
> + * Checks if the force big joiner debugfs is available
> + * for a specific connector.
> + *
> + * @drmfd: file descriptor of the DRM device.
> + * @output: output to check.
> + * Returns:
> + *  true if the debugfs is available, false otherwise.
> + */
> +bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
> +{
> +	char buf[512];
> +	int debugfs_fd, ret;
> +
> +	igt_assert_f(output->name, "Connector name cannot be NULL\n");
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
> +	if (debugfs_fd < 0)
> +		return false;
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	close(debugfs_fd);
> +	return ret >= 0;
> +}
> +
> +/**
> + * Forces the enable/disable state of big joiner for a specific connector.
> + *
> + * @drmfd The file descriptor of the DRM device.
> + * @connector_name The name of the connector.
> + * @enable The desired state of big joiner (true for enable, false for disable).
> + * Returns:
> + *  true if writing the debugfs was successful
> + *  and the state was set as requested, false otherwise.
> + */
> +bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable)
> +{
> +	int debugfs_fd, ret;
> +	char buf[512];
> +
> +	igt_assert_f(connector_name, "Connector name cannot be NULL\n");
> +	debugfs_fd = igt_debugfs_connector_dir(drmfd, connector_name, O_DIRECTORY);
> +	igt_assert_f(debugfs_fd >= 0, "Could not open debugfs for connector %s\n", connector_name);
> +	ret = igt_sysfs_write(debugfs_fd, "i915_bigjoiner_force_enable", enable ? "1" : "0", 1);
> +	igt_assert_f(ret > 0, "Could not write i915_bigjoiner_force_enable for connector %s\n", connector_name);
> +	ret = igt_debugfs_simple_read(debugfs_fd, "i915_bigjoiner_force_enable", buf, sizeof(buf));
> +	close(debugfs_fd);
> +	igt_assert_f(ret > 0, "Could not read i915_bigjoiner_force_enable for connector %s\n", connector_name);
> +
> +	return enable ? strstr(buf, "Bigjoiner enable: 1") :
> +		    strstr(buf, "Bigjoiner enable: 0");
> +}
> +
>   /**
>    * igt_check_bigjoiner_support:
>    * @display: a pointer to an #igt_display_t structure
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0fa7a2ea1..6d13e5851 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1214,6 +1214,8 @@ int igt_get_max_dotclock(int fd);
>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>   			  int max_dotclock, drmModeModeInfo *mode);
> +bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output);
> +bool igt_force_and_check_bigjoiner_status(int drmfd, char *connector_name, bool enable);
>   bool igt_check_bigjoiner_support(igt_display_t *display);
>   bool igt_parse_mode_string(const char *mode_string, drmModeModeInfo *mode);
>   bool intel_pipe_output_combo_valid(igt_display_t *display);
