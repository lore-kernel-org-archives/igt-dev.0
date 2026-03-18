Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3D8103E162
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 11:35:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BD110E7B4;
	Wed, 18 Mar 2026 11:34:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="errL3SdA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9282810E77F
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 11:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773833695; x=1805369695;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ht3w6520uHD5kgWhrwXZpK1AWOjV6U2zEHnFghu04FA=;
 b=errL3SdAmqv2ww7jdD8TyhOI6+Mq5BsZ4BuJa6Lu/raOPXTzbO2/t2JX
 zyvDm7QQo7VYdnWuYtU2eEl7RcTi7Qjg0dV+dUgnitlfBMeMG4XrpIik5
 /RUbJdTfM7zvr35IIO4YOADTnLsA+ZV7MMjvMHeVoxXnLcogAwgQTsb8E
 7C8LtRwNJxhhQXqQ1u+GzHlEsGtEpmeI1Pj4ok7W68rAFdsFDLEX5UV91
 CZO2jESgW/Y7PZUInXjeFV4JRDisaugxLAhi6kLCE70MMzojEOXODwi3s
 5rgxOxKrfEU7Ai1ynxI3Dc/EzePDAy8awWZT7evLwUX9vlcSCHfgYX8t/ w==;
X-CSE-ConnectionGUID: w/FU/2E/T6KdVw0CWA2wFA==
X-CSE-MsgGUID: x1aUU1LAQ3GBblgjPvi8Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85514404"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="85514404"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:34:54 -0700
X-CSE-ConnectionGUID: eIR7zTvDRGyVSEwW9JIHwQ==
X-CSE-MsgGUID: w6dGIEFGS+GhRr6WcmZfOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="260500117"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 04:34:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 04:34:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 04:34:53 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 04:34:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ui5Y7JN5pO9Gd0OSnC1PYpq3+XHYKltf5P7/JQYhVJIQz9oCwUnWhlk9Esc98tWMumqsx92YWd9nXdZnXLdzlvrwnp7pNErvn7iWsWzf/r+P986/B8RP5PdUQdXGjNmX2DK1LA5JVYeqkoMeXmzps4JtLPn3ZUMCuc9neGvHVJDqUS5oESqw3B5jhS8MBbKsZ1Co2I7jfm++/xam2vI9TGtDTEn0fNYD0bS+GZL9n/x3VC0IIMRI4BZHTm2jBf+0mUQaM9QQCJO4QYk6fqL40R2oy32C3wOdq6sjhDcdqda/7D5KE/wxHUGQ8/Nt3p6Lu/bCQL+LoJimZ16Gxii3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOkX9+1i1JvefuWLCHnvR9hmUZraKD3nRdIHpIHTAQY=;
 b=W6PadZgdNiXjcGa4MJdHVpnSTBeRPAXdAAI15a2lbkBYeYZPvtU1R7AJac+mWNRdYgyu2ipqXBENY2RFZU/YLZws4bllQhJfluoKa1IrVlAr8ODqLFtAUISTzmGZC6XJ4BodhQ+mVmPUVlns8w0kMk6mrUREm0BVZJXWmD1zFhwWNmDMAaGxcrvjlpOrCHpMkm5NSWw02zFzMNjLn2ay5hgI4cm40A65qjkAtEXmthJ0mAhWwip85JtLWjEwRlelaNglXhv4pmG/zNdS5Yt5LH++L8e8RV5HY5SLh7K3httRfPR7viW77y/ftVXu7FEmHs3f/5RVjeRcPSL+3GGy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 11:30:02 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 11:30:01 +0000
Message-ID: <75b0c228-ed97-4ffc-a9ef-8c0cac995e4c@intel.com>
Date: Wed, 18 Mar 2026 16:59:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] intel: Add Xe FULL chamelium run type to
 kms_test_config
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <kamil.konieczny@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
 <20260316075611.3333142-3-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260316075611.3333142-3-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::17) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 027eeb0a-da0e-4c69-458a-08de84e1b198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|56012099003|18002099003; 
X-Microsoft-Antispam-Message-Info: kvZ/mxZmYrcsGnYsHjgeD+x4UXe47g5NrMuR65e3qiWHQVFIjIgsx+B30U3Bl2pQZqptxq2KSZER/RlHHmStGazWysgaqkPQO3MR7vttb+q2Hlr72THGVSYzVbef1foraUeCyNKu8uE1CgzOsYMQp7mmOwt9bzI2Tr4YHiU+qEmlwKrv3sQIRIC41S8iqAK74oyNMXBHbPs4n2P/XO0mjZNpn07+BPeztLZfeaihn8PWAvsIORz30Y/FS07D/i1pdstiEKA5vujCe5fr0QFaIy5ru3QrXbb97D8L/GQGOTynjfM76OWTlkKLp0ny73/NoQd5wNIL/sXjGfYfCkiDs1y8Tfi2HBTXFAgCqCV39LwhaNHRfYoe4W736tIMcWySlMx7zJrSZIviUeunwbJq+ldtSCVNzeiqWGiBF05yH33uDYNsc4GKs1yReL2x7Dk6qT7LQ9V6TwmeiW9wksgtIbTSrH5paJmC4rNSVuhEm/1LOEjgv4k9AUJi6CL/NGFTtw0jEVV5D2S6OAr9WI4dJm3AhHCAATpYN1MBO2nphde4lTu1TmSRjHdZpt2Mw/IJOTi2fwNsXQF1Ahzmd94Ij5LidCNLWKITELQC6rJJZuTV0mB08K9RfttpC5yPKeKuGnJvJtBky4hslpMXxUUiqNN6aDWZt+LIba0ZRhDFepn6ekqUdUlCZrhAVlt37armEPgMHEbHRd8/0g8n/EJ8a7itpaYzPgSnqn3EFChbr/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkQxK2ZycTBnbWNOYmd6WE9pUkx4eDk5YlhJS2VUSjVCK0pyNUZGank5YkpT?=
 =?utf-8?B?Z0ppSEZtYW5rUHprN0FtT0JWcmhBN05GYU83SHdCdWdTdTYvaWtKWnV4V2ZJ?=
 =?utf-8?B?MEZMZDRSUlMwejRCVHBXSjFPZWhpSU5zTlpoZ3lBaVNvQlpMeXdac0crUy9W?=
 =?utf-8?B?TFRZeHRqRzFFMlNGLzFoNjVCMXg2NmRkOU9ReW83KzBqY0xSYzJrbks4MC9J?=
 =?utf-8?B?UDNSN0QycjFtT1M2dXhRTVZOdEhXeG0xaWlBQ3dCRkVOQWtUMkZjcWhBYi9i?=
 =?utf-8?B?MWJnUWowY3N2T1V0M1hHdlZSSEpqQTBuQmhtY3kyNGZsOGJtZEtodkJ1b1RL?=
 =?utf-8?B?N0ZIZTVGeTFkQ2poaEhZR0ladE83RmxzbVJSS21ZZVdZbE9LL2daUXdMb0Nk?=
 =?utf-8?B?T0cxaC8weldXbjdZOHFUOU40ZERveWs4Q3ZyRHhxOXE5bWJGbTZwSnMwNnhV?=
 =?utf-8?B?ZjVFSmtxUWUwSHJIWWRuMTZNc3IrNlM5NnRZZjg1TDhYcjg0QXpCSy9WdTZt?=
 =?utf-8?B?U3JCdk4zSHg4SDZCWnFUSVZEZmNFVnV1ZHZFcFVJQlpxQ2tqM2t3QTJSeDdp?=
 =?utf-8?B?N3h3ZExNeWJleVJSand2V2sxR3hZQmtScFZEekhSVFFtSlhhb251MHpwWGlG?=
 =?utf-8?B?NVE4VDd2RGFxa01qb2ZjRlZ3RkVQNDc0L2xmbWNUSkFxbEc1Z2lOMEZQR0x4?=
 =?utf-8?B?c1lFWE90ZjlJVHV3RHZ3cHpNNnU3UndPQ3lMMjJPMDVsVThNRUpCZjY5S3JU?=
 =?utf-8?B?N1V1VWszcTM3TXhhVTRHdy9CN2VoakRVSnd4TkNKSVVnN3JTQWRHMHpNdTVr?=
 =?utf-8?B?eCtRVEhkRmZFbzdnOWVMUWZRMXEyUitnc0g4NWUyZjUyeS94TlFuN2l5QmFz?=
 =?utf-8?B?KzZZeVFVUzBsV21MWkRqNGYwaVdaUkZCWitGQmVGd3lMWlFOSm0zRmdmbEVi?=
 =?utf-8?B?ckVKeHZtdkE2Qnc2Ym5wS2NPd3RVNG5ZVGpxaHBrNkZNU3pleC85MEVwT1lO?=
 =?utf-8?B?bXVtYm15THVwVVdBTXR2NHdxUlExeTNtRS9yaU96ZS9sb2NiVndnMFk4SHY0?=
 =?utf-8?B?d3VZa01nelp1aWtCZWNHN0RlYkdoaUhmRGQ5M0swU0xob3J1bUduR0FSMUtt?=
 =?utf-8?B?QWtaRzBXcWEzeWhYUkloazVzMG1iMnd2VmFFS3VrMGl0MTJIQm1DS0QwNTZY?=
 =?utf-8?B?ZzRNZ3ZPWFJNcDQrVDRXM1hZTmtqNExqZ0NYOUYrY1hXVW5pcDVVY3ZiWi9S?=
 =?utf-8?B?L2RoSWkxM0xPdFpNQ0FxeU9LMk1FVTQrNzZVZU5zZFdGVGlyTUxXdGUvVDhs?=
 =?utf-8?B?L1dSaWQ2T2hqZTJicHJ3OGFsNE9FbGk5WTZpaXRsczZ5SFdBTmZjdWhxWWd6?=
 =?utf-8?B?eGx5Y1kvcE5GckdIeHo2VEE0cjdMRFRmYzFDd3c2NHBUWUxpcXdtNkJramhw?=
 =?utf-8?B?RkVpc1FnTnhWamF2K1JjQTVWZ2Rzci9jQW8welVwYktickNIc3hXdEhkUjB4?=
 =?utf-8?B?QktIaGZzTU5hV083bU0yLzR6Uml3WUxuRk1LQXFjTmlxNVViZ29wMUJ0WTFi?=
 =?utf-8?B?TUZybEMxMmx4cDh1MUVEU2gwTk1XUTR4Tm9Od1A2VTNSZTkxenlpQjlyRXh6?=
 =?utf-8?B?TTlFb2I4OVd1SXRYQTVneXA2ejkrNVF5VEZkZHU5L3JpSnMxUXFjai9rWlQx?=
 =?utf-8?B?dDNOdXc0WVVxYmRBU0Zpamx1Z05BeGJqdU9QeEpCa1dTV0drTDVEaGk4VTlP?=
 =?utf-8?B?ZGptZWdKS2xuaWVoSDI5cnlrRStRUXJQejMraldmN3cvenhPUElqRVhxMWlx?=
 =?utf-8?B?SG5lYVp2b3p6dXp2SDRIR0tBOStzSFlEZytMTFV3aE9mTi9XdytodGVieUIy?=
 =?utf-8?B?OVdybjJVcmRkNUFxYU41MThWNSsxSElZV2VCNkhLNkZ6eUVNcitiMUZpcWs0?=
 =?utf-8?B?QndPdTNaYXRxQnFkTXVUSDlKaTVTcmszeUVtVWdWSHVTVC9NbnBKZlY4dlQw?=
 =?utf-8?B?SmtqK3hXVlJoNDdXUFl2TG5EVDJVWkpWdzIrNXBrT0FrMDJybUc2SG9sNGJq?=
 =?utf-8?B?L3duSjFYUlMrTFpzMTIwTGU2R0IzS1hVRXRpTFFaRU1xR2lLYXBweWhacGZT?=
 =?utf-8?B?WXJlTUhOcTlEN0duT0R5Q2taeW4zVUE4K3dRTWZVVXFZYnRRN29DeFUzU1ZM?=
 =?utf-8?B?ZTMrWTZxek9PWEFwSUdTQTdkdWRIUCtPMC9lSkZGN2tjVko1V2E2MkRwaitK?=
 =?utf-8?B?Y3lubUZzeE9ubExGbFFmdlphcXNTTjg0c1diMldFS1pTbHFqNHJxWkZBV3M0?=
 =?utf-8?B?Wk9aTW1MZGJXb01STmRrdzRjSmNkb1FheWY5amFnOFBBekYvM1pOdz09?=
X-Exchange-RoutingPolicyChecked: ZXQiIA89jQOW4S6B8PwfPG0G9dcfHNc2IArH8vZZQwuTQ9AeeK6TqpyJ3pNfcR4Z4e6yGv6WvCb2SUI4VympBZPtwWTQ5tMETg7ulR/SHOMhNQKPYz5uuvazldfjJRMu8m15R+vnyoeYWLTBp32GooWpHwp11wydPKusD2RTg6VBUIgr72tYfLVv0XsWbOJyL4OjNaz0zm67G6Ax/BxQYbkZgUihcQCRKzxCFhRrCng9oje2K4UBpGfh35dVgx0trx5ZVPhFSSXhfzxdbyqEtabKrA7HWBaAmnNMKe3ardpUpVsgt6ERddh3HLNzghwd0mV/SwbT6kBiTkmA4Pe8qQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 027eeb0a-da0e-4c69-458a-08de84e1b198
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 11:30:01.6960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4o7ZmUZTLnX2GAntuV1SGaky/0yaHUk9P8jfciyoY3pj9502+HA5qDHs0JMVHaRelX3cVVLmaiWeMmnvpz8GJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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

Hi Bilal,

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 16-03-2026 01:26 pm, Mohammed Bilal wrote:
> Add Xe FULL chamelium include mapping pointing to the shared
> chamelium-only.testlist and update exclude labels to apply
> xe.blocklist.txt to the new run type. Also rename i915 chamelium
> to i915 FULL chamelium for consistency.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel/kms_test_config.json | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index 61a70a9bb..7eab10b04 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -15,14 +15,15 @@
>                       "include": [
>                           { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
>                           { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
> -                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
> +                        { "i915 FULL chamelium": "../intel-ci/chamelium-only.testlist" },
>   
>                           { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
> -                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
> +                        { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" },
> +                        { "Xe FULL chamelium": "../intel-ci/chamelium-only.testlist" }
>                       ],
>                       "exclude": [
> -                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> -                            { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
> +                        { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
> +                            { "Xe BAT, Xe BAT chamelium, Xe FULL chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
>                       ]
>                   }
>               },
