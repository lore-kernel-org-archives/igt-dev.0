Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A63E010775F9
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 18:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD5910E44B;
	Wed, 18 Mar 2026 18:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IvTjyy5y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 736E810E44B
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 18:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773858075; x=1805394075;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=W0rs/iQJuYT/U8tJ6mqMAQ2l9C9Xsa7oSawsisPC/eg=;
 b=IvTjyy5yCt/CoO5GQ08e29U4h4sicomurSTGi2gF9JKS6OiblqvAN/IE
 7tKpXwKEE8ViVXkheDMKTd2B5OISew/Bw7Ai6uKKkH16PV5ajwWlBQxpU
 haJQgLMr4rcFmlSPmy5MyeE1KAloTfPX/9Hbz0Qh6kADQlDGz4O/3ADrA
 7zSxMa/fh/0mFnpdUxIq+OoP25bQZckN7b/IuQDe1UVBXh5wxe92DdE+T
 elrCV9AgbY2Buie9DP9PVz6I5brbcJign/1bG3+ezl5TFZk3hN2vTfU3j
 rL2pc53++fM4dPNO2UXdG/87vbq3p8AacCMNYslr+/NlfCzaNqEWXtVnQ g==;
X-CSE-ConnectionGUID: DrKJRQtsQZqOvdGZUrlWlg==
X-CSE-MsgGUID: 0roTrIKwS0aK2+aB+g/MLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75044448"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="75044448"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:21:15 -0700
X-CSE-ConnectionGUID: m/G0gGKkQgW3+647lC7Fyg==
X-CSE-MsgGUID: qYmBctrBRAiUPXPmSnkjRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="245730461"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 11:21:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:21:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 18 Mar 2026 11:21:14 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 18 Mar 2026 11:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AC6hn+DPN3mMHdl/c2bP39iLSy2BIYw/q84FXT4un0EJKFCzJ1TiTxf1SeIRwollRCQrrpKBLB6Nd+wx6tTrlCJpmIuQquAGRNinTDhUUH/OREqN+OTl6Met6uiLrKURLnTTI8H4ppBiiPIwq2knkcvCxleU7AB/xqJdTngMzIs2naG5PZqJR0Zpp4DiUD7l4Xl+np9aeAVdbVTIfGq+G6LVWmzKRhjQHY6Md+V+asqd+lDqRG16BQPyZaV8a4XZeTOTNrPxwgJ3F9KUqzkLH14XGdQyWwCfpbbcgj1DonLzjGUsfOfR7Bh+4GIBtyDRCCIrF/zI2Cpj1CW24aRQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpzIGRZg6epg7yvtPYcNicnP+6hntMM0qq93C8EMOn8=;
 b=RlStR9CIv46OGbJHMK14q69d//g9S0oDh0HKnxJd4Yu+a+eAmiJX+8/9GHfk4J+AWl9JoRiRP9HNcpJcTwVVY7X8avINfSt2ngZwgLV8J7GEeI2+H5s9QYioc2htutPgVWHv0JuXIY4vu5bUOzBti7djbLJAoid7WFZSv27kLK6UWF3Np3fon/U/MhWUYR64CQCrRaISRAK0dSRdjv6nXfnLVFOLxVSB7i5fFCee6ZUirXv17ytQ0DMfBisqz8y2sXCR5GG3vWSmPBTFsWWrBsw6tTGaWp8eLs+aVepETbiNGTaeRuShyldr/zDm1GJH/6Rtm2KsRrO5GkgYkiEvEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SN7PR11MB7511.namprd11.prod.outlook.com (2603:10b6:806:347::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.13; Wed, 18 Mar
 2026 18:21:11 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::246b:dc12:ea88:b19c%4]) with mapi id 15.20.9723.014; Wed, 18 Mar 2026
 18:21:11 +0000
Message-ID: <81623037-95a2-4fd2-84ac-ac952363b50c@intel.com>
Date: Wed, 18 Mar 2026 23:51:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] intel-ci: Add *-planes-random chamelium test to Xe
 blocklist
To: Mohammed Bilal <mohammed.bilal@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <kamil.konieczny@intel.com>
References: <20260316075611.3333142-1-mohammed.bilal@intel.com>
 <20260316075611.3333142-5-mohammed.bilal@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260316075611.3333142-5-mohammed.bilal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SN7PR11MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d612a9c-c068-45ed-6ff7-08de851b2180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: N2vmnj8kB8cz+VOPegR5rxS/IRmVck2GtTOFQlNtY/w9VGQW2xASNdkULZ28IAkjh5v5X/Lv33YobnxXCPaWwDLvpxZynpBi8M6byaQim3QosaVys/32YYOqrXwQ0cZP6jLV/MJVm1pb3xNFBZWDJGazhdXwgSuCDqJMyNSShXqgkAO2pEcD0coq37OLg3Lvvs9DBJX5d3WXye0qxzKvc+nmeqwGfa2tCx6PF0Iz+/YqMZx8uryY+WQVN/U1OESzDT3RudR66FdeF8ob0IATdeY2UKhydev5Komxi4+YvIJhg+d9RRHMp7HjMYg68Pnxfh5nmEMHWHJ6H+HJ0VEuyawkQEpIMwef1mS0FU792o/So/QDYKcFfnNEzJQ1vlx0LkW7Q/4q9w9jAeTxbWK/OdnD5k2ZK1rKoMlp03BYlzlKIYYgPjvD6QeNyB4+l4HfcZKgwiSocgHtSGE4+NdNgrAv7TtKPwccpn34oB328fzKGsqeunNTa9Wj1GCZoEOF9chQ99yC803cmZAL9QbdKf8uR+FH412upV4LHSf8SpDsCMQezDzxO1vNWKYZ9dVsQWKd1poQQDv68Km8sw57E7qeOhyQCb+iH2bv8xq7EglYJOGCxHBOxK99CqjqqmEzumvFNC0cIS/cfllf3aoGq9JA70rnzTzlQO1cYk3wrLbJnXyxiNApQOMyJRMyb7F5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjRUSDFReXZsc2JObjNEVmlGOGdWVDRXbmc5RG1kWjBQL2JiRGhHL0E5ejcy?=
 =?utf-8?B?UkxUL2JUTmxwSTdWSmxNOE5aOURFNXExcHRZUUNxbW9pb2ZTVS92VHZZN25J?=
 =?utf-8?B?OU9OVkZRbzFqL0hERDFURXVkOVhTMzNFQjhIZEtWczdSbnE4azNLQ3MrRXp4?=
 =?utf-8?B?TUI4c0tuNzNRVlBTLytuVkxteU1KanovVXkzaHBVclMyOHkyOGg2Q3pEOFBy?=
 =?utf-8?B?QWJJbG5Bdk5nN3REcUhIRXRMNGRvK25WNFZWcXk4NWF2VW11aERFUFZWcmpl?=
 =?utf-8?B?Nkk1WUpnWWlUVDZXbHZNdkI1VzQ3Um1sQ3FYR1J5M0JEcXBFRlRQZ0F4VUVE?=
 =?utf-8?B?WTF0amtJVzhoaVBRYXRRd1JDT2c2ODg1Vys4Qmd0SytrWWlJZzNiNzNoTnhl?=
 =?utf-8?B?STJ2eDNsN0piOGZhNW96a3haRlhidFdLbGt5YkF6MjNOYWFuZVovM3poalpP?=
 =?utf-8?B?NU9ubGZZd2ZXWXdBOFlobDgwdkFTU1VJQTJwMWdDOFhMMEZxRHdxMTNHamNJ?=
 =?utf-8?B?MmZucFcvNHpPaDNtVy9VbWI1R3FuYXRGRnRQUFd4ZExuemphZVd4K1VMQUJJ?=
 =?utf-8?B?b3IzYnpRenA1NVpQa1Z0SGpaMStFSVVEelloL0I0Y1RyOUZRcUR4OThEL0Qz?=
 =?utf-8?B?dUpPbkZRRzVWeUM1WVRXdXZmREFoWEh0MG4rZEtzMzkxOUFOR0FSR2psa3gy?=
 =?utf-8?B?eWxFaWhXUE1oQ2pMTVZ5T29pYmR4Z3IxYWRXZFFYQzkvSmpja0xRNTFJMXRX?=
 =?utf-8?B?YlVPcUx1NEJyb09CQzlqbldGUGVJWU5qOGVxcGNGMzR3SHRRN2toeFE1Mk9s?=
 =?utf-8?B?WU40S2xLZXB2U0FPRDNjTmpxd1pUMkxpMUlkWjlWbTQvck5oOUxtQUY3WnE5?=
 =?utf-8?B?VUFsYjY4eDg5N2pCU0hQM2F3UXF6dGtvOXY2UWtpMjJWMnIraFhlaWIvSTlP?=
 =?utf-8?B?aGZrM3JrcU9TMmlsN3B6eFU5Z1VHdkdIN3huSFVjaElJcUJvMWk0ZitheDFP?=
 =?utf-8?B?eGpYYWYrYzhOcVdjR3BwZzVrYkZJSWprUGRGeHF5QlhoaGxPQitpNXhaV01R?=
 =?utf-8?B?ODlGdmVDWXcrcDF3a2drOEFCc1ROMXF6dzlMOHZWWHBqQUFhRXpZMHFJSG5L?=
 =?utf-8?B?dUNWUjlJVVdZUlhmTlIwdnpDMHdmczBhWVlMTk8xUW9zSzBQQVNIVDRwV0oz?=
 =?utf-8?B?UUdZRmZzN0NwQXR4M0dLMVFJblVmZ2h6dEw2QVVseTc0ODhlL1ZDOUlUNlJj?=
 =?utf-8?B?RWZscnI0OUlObHZIUXdvLzR5RUNCWEdQdUhINXhCOFljbWpuQnYyL1RLQWs1?=
 =?utf-8?B?WXBodE1XeTBsUjFhMytYM3dXUUlPMUlOTUVsNTFZUVJDelM0anlzYmlhRXJ5?=
 =?utf-8?B?L0VGdW9IQVpJTndnNVpnRGNPeERoTDVLQkVpeWdLNmVIWFJSUHZJWXZxOEdw?=
 =?utf-8?B?dlgxU1BYeWJpdlNRTTlrOEhNWGxabnNjYytLbHdEa3lWc3EzRGZXbXc5dFZt?=
 =?utf-8?B?M0FYVDl1dWZ4YUtNeStMQ2N4YmFmaUV1Zi9rMmxQK3ZwcFQzM2N4NUdtRlBD?=
 =?utf-8?B?S0JESkQ4NTZFR3ZGNnkyVGx4UUtNczFoWGZ6Y0dwc3U0ZXRQblVYSmxQMDJG?=
 =?utf-8?B?SmU2Q0dhYmtpaEthTnNRQ0MvYnBDbWhoOTdtTTh2Q3hkd0tDd1c3NzA5WlQ5?=
 =?utf-8?B?UkpnQW9oMmhqWHJ1R3F6amFScFdVUGVuRHhObC9ycG1KdVhhUE82azBlclA4?=
 =?utf-8?B?TnA5QndZYndWRm8vajVoZHBRZ2dUMXA4TGF5bGgrVms0anFPeE5XdWcwbVlV?=
 =?utf-8?B?aWJMbVZodEUraVU1VGxTRTlzZzFqcHc2aHRrK29ucy9qc2VpVmM1ei9HOEgz?=
 =?utf-8?B?MmM4QkJlY2gvSjlqcytyNE5ERkVyUFQ1dUR4cEQwZ09GSkNlVGY2R3UzTXlm?=
 =?utf-8?B?VEVPK3l6LzdMckVKZkRzOEhkZ2JpL3VYRi9VL05kY3RLTUdBeHN5SUp1NDc1?=
 =?utf-8?B?Wk15dlVoR3dsQVNpM01FbnNHelhYUWZvbDNjdjZVYytGTzlXWWxQRHY5ak5j?=
 =?utf-8?B?Y2RrbjVPYWtSRnR6YWVtQUQ1d0Z4dEpZN1FGY3Q0c3NsZUdrTG15czVOUGhG?=
 =?utf-8?B?ZC81ZVpTT1ZsbEFzL2NYVmpmV3hGUWx5cWE2ZDVka0xFNGhOWHlDMkw5dnkx?=
 =?utf-8?B?emRPMUg1SW9qWnVzeE1Cd0JQdEVKWGJ2Z0F6clJ4L1d4SmY3d2o4aEJLY2RJ?=
 =?utf-8?B?K0F4K0NCK3RKd0NBYjd5SjRpVlU4N0JjOFZmS2E5MjRoa0ZyTmUycjhQSSs1?=
 =?utf-8?B?NTVLbTc5Q1YrcmNmeGNJbGhDb2RmMWZtUTBRa1gyZXRIUmlJVkFCQT09?=
X-Exchange-RoutingPolicyChecked: e9bJHxK8iKieb+b50CUDkZ0NsWcArUm6EoPu+uV6ta5sM4VUix9zEMyXftZUqmvv/p79P/+54YYBVn/J6MK0F+obH4YSXmMr0mtb9P6c9nEyVck5vLNhqnnZmavWxEeEYRuokVbFl+x2w+bx58h4j9223mrrsV9SB3GfUkBWNbL0iIEItu4k7X8SBvJTOHgPEUIpv1r/oRMZ9hu7boWv+/Q8MYpSzHKq5cFmBjTAof0eIz3WO+kKMzn6MsvYc22JIcuu66R/uzFQNYmrBfhS36Cx8LIUYQdrGDfXbq0ytlzt5lyaNj43No3ff6GmL1ya5Vbf27k1k31JbRHYkEHiUA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d612a9c-c068-45ed-6ff7-08de851b2180
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 18:21:11.2656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r74z/dxBMQ+gWnBWZOnB2R6aJ7eSRGBEc5ZNbrDe1PGOjL9r2tZknnMIsdZf6q2A+kLDg6SP3rL03JEqEEhAEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7511
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

Since we have fix for this

https://patchwork.freedesktop.org/series/163296/

lets drop this patch.

On 16-03-2026 01:26 pm, Mohammed Bilal wrote:
> Tests are exhaustive and pick random configurations, results are
> non-deterministic on each run.
>
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 80a0ee904..80cc98608 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -132,3 +132,14 @@ igt@kms_async_flips@async-flip-with-page-flip-events-linear.*
>   # driver does not support VGA connector types.
>   ##################################################################
>   igt@kms_chamelium.*@.*vga.*
> +###############################################
> +# Tends to generate invalid configurations
> +# using CCS planes or configurations that
> +# exceed HW capabilities resulting in sporadic
> +# failure with -EINVAL.
> +#
> +# Maintaining extra constraints for Intel's HW
> +# is too costly in comparison to the value
> +# provided.
> +###############################################
> +igt@kms_chamelium_frames@hdmi-.*-planes-random
