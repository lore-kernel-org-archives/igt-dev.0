Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46277C982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 15:48:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2DE410E4B7;
	Thu, 17 Sep 2026 15:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xvfa2YR1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42F610E4B7
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 15:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789660068; x=1821196068;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=cKVHOGgkoKRFAjz67oxNzFg5FJn/ATKkJM2CpatO0pg=;
 b=Xvfa2YR1iy16fo6W4TTG7dr0/sT75B4QWKtIf7C/eElyqA7rrSqPUmoV
 sEiVK7idYf7Wf2wfTknmSM97x0AfizFsrr1MqP0hT6Aeh0IivFWYTWb9u
 NBNM6gw2MNILUvakFx6luU0Zl1hkPru1f9sA3whf/XoeHSowsShOn3Wc4
 Mu8uuAUCnTYrO2GB+lEdxWld09TEfqWRDrBe48sNXijEHqL+V+md5OtHt
 zC3vMGqev6wO+SaommkUeqahL0ieMyScfFOBdSe9bqpDuEe1HFbZ707VQ
 D9+5QnIUHZiBBIiuaL0obXdpKONWUNeAjzcM2uPKOSSRoQrB9k2fEk6xN Q==;
X-CSE-ConnectionGUID: HAyDz5UFS6CH3CIClaOGOw==
X-CSE-MsgGUID: MY7lKAIRQ/O3Z/mGncqzkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89960431"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89960431"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:47:31 -0700
X-CSE-ConnectionGUID: 7mzd4zjgSaWsZFz4yG2GDQ==
X-CSE-MsgGUID: uJK6IsLAQO2RzzQMRABM9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="279103684"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:47:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:47:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 08:47:31 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:47:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbTwRj7Habox01QrxW4/eTk54szTqrnlv3wSbW/J3mhXHtaAQESLGx3kp3MQU6yb3v3jtR+OAiCUpUiJ4dcl7LKoyg0Ob2l0ldG1112kF5c8G74NIQKpJs8cmGOaZJWDr07+oOwicyofB7FkN/4NwdLSbRSTkxhKIdVdDTZ5QYp+StuEu1v3oZwlrMLIiT8w7Cu5T4pV1BkwHIWg3N6HdKYeGZSbQQjtzzSmcYfWp9u66Fhm/VH69GK3zUEhHDECb7rUUZi4Zqv36NmXyiFGC22yXhJxYE4zG43AJImb1W5EE/woOjfE5Le5Hq27SPdK/hR17D5Pb74e0A3leRHC3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CJuT+lezi/0nM2JBGPjsEdVAYJVB47qYwECn1RrQHQw=;
 b=GKxYQ8av/NXizajtWGBMeOd+7InArfMCxUWqSraj/WNIXloGW4dkOWQbd+YaPc0UQyi5NSX0H12PmC2Y0H04aUwmR76E/LbbHVK79Jg61KLPPgqJcjGcB4HzxDXAj4p3z7vF5ssaeFpBawGdsbJfwPPQSu08XL33zx12UfRf3Mf1Slg10PnjdMFmwZzoVZ+sLx0mXXtczrVSQkwcucQwtNj0hqQWwpaU5GU92eUFTh8qxTUZ9biEJOivzA9nX5VA/7d3XQERaUvTWx9HdZI9jilq0Kg7PRHl/YCRnOoGdRn6SRa2OZlsFIbd/SNFaTYGQAqGN69XeZUt7U+2B2Fp7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by SA3PR11MB984635.namprd11.prod.outlook.com (2603:10b6:806:5a5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 15:47:29 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 15:47:29 +0000
Message-ID: <e8277e01-28c6-424a-927d-31b23ca14c2c@intel.com>
Date: Thu, 17 Sep 2026 17:47:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,4/4] tests/sriov_pci_config: Add optional capability checks
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260916115201.1973752-5-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260916115201.1973752-5-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0104.eurprd04.prod.outlook.com
 (2603:10a6:803:64::39) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|SA3PR11MB984635:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c2162b4-0f18-49e7-66d5-08df14d2faa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|11063799006|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: Rr12cJoLTehmUTtL5EFQQWxTjgNqHgYwKYhVFKaRkS+MCUxOYYb5GxXrHFzFwUvT9wQSV6pkNc6HSxNSY6xEFD2y516slR9BZZcPNcBnnlY7QCI41YvjuiadbBpOMiZIjqmgA9Y9arX15TdwkciscOAidNfxFAepAQgd5VGg4kCDVLlxFTRrUdUOUxYlsG/czH1y+rBbPK6btoCXq0G9pe4eZQl5HU+O4iMXuN/BlzxRJ4JUhe8sFBuGrJyjXyLLd3hKnypf582kG8edv2W1tRLK0fCIp78w4V2ov3RLn6CFWlaTp00jc3YohvDc3sXAb/uQJO2+aPolSdDk3KwzGi4df/WV1R7wtygLNM4fhUbrRKicCa0M+mUCnl/teFspQUiQRw59/e1NBmBBTS7dnrdqbdyPccZsRxm4NssjlVWtu7zgjKW/YrFZuRW/h+yeYWXNaBnpdDITGweTTWFMdeFcLUbJGZVh+kx3fBo1zHYMu/hn3HDS+yUHkMrtKbQUnJ1MpDRVtj9rM8rM+erCepo6+1d4P3GFHJMdAi76AxZbEHAuGa1NH5a1d/6holmpgLb7z4su8Rn2Nr9CvTLKIyQilfP/K3ycFxfnIQSyXZMGfRFpf3a3HKD6SvOMUsIxX8EVRJDt1yh9jvgP+aiRkNka548eFD6J2NW96zaE31Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bS95UkdRMXR2cEtubkZ1djlHWmsvaFc5T2YyZzRqemd5Q3JXK2Yzci93QkZW?=
 =?utf-8?B?cENhdWRZZW5SM3I5MmNGak9GT0lqM0IyTXNtK1JERjNYSk54SzFsTlVmbFJj?=
 =?utf-8?B?M3ZCSlowMEdBVTZ2Q0tzc2gzRmhNOTFjaWJGamZYM3cxekxXdEVkVjlnUC9V?=
 =?utf-8?B?V0c4WUxMWndyMTdNTmZXdXAwaUxUMUt2TTl0a1hjWHFsanMxN0owTGJJQ0sr?=
 =?utf-8?B?Q3ZLdUNNTEdKTlIyM3VXL294VjJwbE1CY0pjZ3JVZkhhSnhUU29MMnBKOS81?=
 =?utf-8?B?bHQ3Q2FvMmYyOXJnVVVhTXQrTXJzdXA1VnE1eGRqSENmVEFxRDVKaXJPM2N3?=
 =?utf-8?B?YlZpSjdJUmZBQ1dLNzFPUTNxZ0piQkRqV2dTWFNWU2YwRE1HUGI2eHA5Vk52?=
 =?utf-8?B?Wm5wU2dZTnVQbU5PU0JpU2ZnUnNiMC9RNFRTazFrbXBnOTlpZFVqbStsUVE2?=
 =?utf-8?B?VnFadU13ditTSmxJM1IzNi9UT0Q5WGc2RGJHSXp4OThLbzJRMkpaWVpkVVF1?=
 =?utf-8?B?SHgwSEpoS0E1YmM2UkJYbWR2aVRrdHhSbllRNzZZSEoxQXBvRis2cGlyeVNP?=
 =?utf-8?B?T0loTFYyQmFPeldJU2NtendPU1NCa01IcWlsQ3VVS0lnNmtid2p4WFU5bll4?=
 =?utf-8?B?WG16LzNNdUNGZFZGWjdwSkZaM3hGTmlTSG5WNmxGeWJ2NzdlelhwN0VEdW51?=
 =?utf-8?B?ZmdQMG9xY1N2b0JIZmZrbWpNOFJFRk1VNjg0Mld3K3Y5WlpPSGRkSStqZEVU?=
 =?utf-8?B?b2ozdVdvTEdwYTZTTDhmS0ZhZ0RCbjZJQy8wOWgzSUF4QmdFcjRyRzRuMHUr?=
 =?utf-8?B?WlVGSEx3Y0lGelMvWTlBdlhOSmtnTkQ2Q0RlMEZUTDZyYjNhV1lmZjVRdmUy?=
 =?utf-8?B?TEhnMWpNN2c5QzZVNnpzREthQkI0NkJFZXY5bWdSOEY5dmNKbmduVXBndVdT?=
 =?utf-8?B?Q0pjNnY5SjBNbmIwb2NsUHE3N3FxWTcxZW8zbE1rM2UzOENKWXl0VGlvZlp1?=
 =?utf-8?B?SVBsbTB5UzVwNy9GbENLWnA2VHF0SDZteS9WKzBzU3psRWJ5cUJqejRnVWU1?=
 =?utf-8?B?VnNuMGU4UVh4cFRXT25EYVFxeEFreFJmUEZuUzZKekN0Y1RuQW9pQTh3ajFu?=
 =?utf-8?B?Z1pJZDErdDhBYjV6MXVaeGRieHlkOGVsNVBRcFR3YWt0N1dXSmRFV3RzM1o3?=
 =?utf-8?B?TitBdTU0ZnRoSWhwYzdDMDRaL1AxbXpwMWhveGh6SUorVE9TL05JSmhJVjlY?=
 =?utf-8?B?WmU4ZVo2dWNQODZYWHh4aWI0dXBOY3lPUi92YW8raWZub0d2QW5GN3VjcERX?=
 =?utf-8?B?YjQ1WFhJWEg1Nk03V0lIdlJlVmZkOWdDVFJDTE1LTTNBS0EyNXgzT2Q1K1po?=
 =?utf-8?B?c1lSTG90d2xzc1F1cGJNQ0xGV054SFE5UjFLN1RLOFo3VldJcFdGK1FFRExG?=
 =?utf-8?B?OEx3dllaNmYzNU13R0NtSDI1aW5QR0R4YlprQzJ5Qmpra0FjcTg0d3dsSWpF?=
 =?utf-8?B?TkxpOXc1OGdxeVdaTVQyZFRYdkJFamdqRW1tWGNvekdZa3dsZEYzOVJlV1li?=
 =?utf-8?B?ejB1SWJSaGNXRFUwWHRBVUlkak5hbUV5L0t5ZVViLzNoRGJPR3k2MVBBOWd3?=
 =?utf-8?B?TnZyRHVac3BCVFY5a1QvU0cyOUZhNkFJdFhJYzhYSy8yeThvSVlDMno0UXVz?=
 =?utf-8?B?YlVxekdsMDNpZ25LYkp4ZXY3UVdoM1oyOVgwNzBBbnd0OVN1anlzYlNmVDdr?=
 =?utf-8?B?M05TMS9Iai94SWRaNHJRQTE4Rm13a2R5R2hUTUFEQXJGdUZ3VTdvRno3enEv?=
 =?utf-8?B?N21MRU9jNCtjdUY3eDUyaS9STjVrL2kvcWVZQm5YZWF4d0RpUW1sV05OQ0cr?=
 =?utf-8?B?TTRDS2tWVmlKc0N1dFZjUHNmT3dOdUdpYlR5Y3B6QS9ybzZKbE1DRTM4cEtq?=
 =?utf-8?B?bkZNVXlVN3BPekZzdVUzWndzTzBvVk1wS2VKWUxoSFgvY09QNnNFSFJONklL?=
 =?utf-8?B?TTNvQmlyTElhekpSVlFoaXI1SmJ6Rjd3bC9yZmtDN21lbTE4cGd3aWJTRis5?=
 =?utf-8?B?Y3g5cXBYY29yVGdOZllEZzh3bEE1ajFrbWhRcXExbVNMeVN1dVNKUzBMa2JG?=
 =?utf-8?B?TURuU2lJc3hpVEZvY254STl0TlpMZnJycTNMN2h4WDFtL0FEdG9qNnMyRHgz?=
 =?utf-8?B?YkpLaGdPRlR2cGFYT0Z1NWZjbUdvVnY5QzFONWhuZlc1WUJHSGhWZ3gxL2kv?=
 =?utf-8?B?RTI2MFJ4V0NSMFlxN0ZVNnBHd2VWOGFPRmNuYkUxWHRLN05MY0taNGVGWk1s?=
 =?utf-8?B?N21MVkhxYjVIR29yNmZva2FySVZBMW9DNkRrYUMrRkdsV3BTZXhCQT09?=
X-Exchange-RoutingPolicyChecked: nRoiJT4lksnN/hi7k2Pblu9EcW/dL6JQKTxq4AeiUbDJdbib9JehIIK5z2GYrih0y9LJmYOu/hvPqhvpbXU/0UN4MkbjkoQf5dhLsEeNuMiuiWhPmC/RgJHpTDpZn5/AoweOi+Sx9ixwe3hLJWAA6gOYldojnCdH4BgUbXQ1i3qu/pi+b01gjlli4+qqx+PbqHs0hvbNcENNowJU6MUgiExuD8s6FiQxl+r//h8bkekWOw/6c3cjY0WR+f4X3ka0JtqJEiAHpc8y8Jdqo9j51gfOC5FYnf0Hku4pZHA3B4RQF3RUSEs5OENbyyKupMbQW/J1zzB4pUiAZHIOCShPbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c2162b4-0f18-49e7-66d5-08df14d2faa2
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:47:29.4915 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRpg1Jpb/7TQAIQjDYNWI9PawyxpJyizLPlS0nfbHXavWB9bnDGNi/Rren4aMBTjk0jwTH6+xOOt5719S/xO0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB984635
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


On 9/16/2026 13:52, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add subtests for the optional Power Management, Advanced Error
> Reporting, and Address Translation Service capabilities.
> Skip an optional-capability subtest when the capability is not exposed
> by the VF.
> Validate the VF ROZ fields required by the SR-IOV specification,
> including Power Management Data Select/Data, AER status/mask/severity
> fields, and ATS Queue Depth/STU.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna
> ---
>   tests/sriov_pci_config.c | 118 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 118 insertions(+)
>
> diff --git a/tests/sriov_pci_config.c b/tests/sriov_pci_config.c
> index 9f8fd9fb50..590a9cd7e5 100644
> --- a/tests/sriov_pci_config.c
> +++ b/tests/sriov_pci_config.c
> @@ -38,6 +38,21 @@
>    * Description: Validate that the Current De-emphasis Level field in Link
>    * Status 2 is RsvdZ and therefore reads as zero for PCIe Capability Version 2
>    * and later.
> + *
> + * SUBTEST: vf-power-management-capability
> + * Description: Validate that Data Select in Power Management Control and
> + * Power Management Data are ROZ and therefore read as zero when the optional
> + * Power Management capability is present.
> + *
> + * SUBTEST: vf-advanced-error-reporting
> + * Description: Validate that the specified ROZ bits in AER Uncorrectable
> + * Error Status, Mask, and Severity, and Correctable Error Status read as zero
> + * when the optional AER capability is present.
> + *
> + * SUBTEST: vf-ats-capability
> + * Description: Validate that ATS Queue Depth and the Smallest Translation Unit
> + * (STU) are ROZ and therefore read as zero when the optional ATS capability
> + * is present.
>    */
>   
>   IGT_TEST_DESCRIPTION("Validate PCI configuration fields required for SR-IOV, "
> @@ -183,6 +198,88 @@ static void check_vf_pcie_capabilities_2(const uint8_t *config)
>   		     lnksta2);
>   }
>   
> +static int get_optional_cap(const uint8_t *config, uint8_t cap_id, const char *name)
> +{
> +	int cap = igt_pci_config_raw_find_cap_offset(config, cap_id);
> +
> +	igt_assert_f(cap >= 0, "Invalid VF PCI capability list (%d)\n", cap);
> +	if (!cap)
> +		skip_vf_test(name);
> +
> +	return cap;
> +}
> +
> +static int get_optional_ext_cap(const uint8_t *config, uint16_t cap_id, const char *name)
> +{
> +	int cap = igt_pci_config_raw_find_ext_cap_offset(config, cap_id);
> +
> +	igt_assert_f(cap >= 0, "Invalid VF extended capability list (%d)\n", cap);
> +	if (!cap)
> +		skip_vf_test(name);
> +
> +	return cap;
> +}
> +
> +static void check_vf_power_management_capability(const uint8_t *config)
> +{
> +	int pm_cap = get_optional_cap(config, PCI_CAP_ID_PM,
> +				     "Power Management capability is not present");
> +	uint16_t pm_ctrl = igt_pci_config_raw_read_u16(config, pm_cap + PCI_PM_CTRL);
> +	uint8_t pm_data = config[pm_cap + PCI_PM_DATA];
> +
> +	igt_info("Checking optional Power Management capability\n");

Not needed

> +	igt_assert_f(!(pm_ctrl & PCI_PM_CTRL_DATA_SEL),
> +		     "Power Management Control: Data Select must be zero (0x%04x)\n", pm_ctrl);
> +	igt_assert_f(!pm_data, "Power Management Data: expected 0x00, got 0x%02x\n", pm_data);
> +}
> +
> +static void check_vf_advanced_error_reporting(const uint8_t *config)
> +{
> +	const uint32_t uncor_roz = PCI_ERR_UNCOR_DLP | PCI_ERR_UNCOR_SURPDN |
> +				   PCI_ERR_UNCOR_FCP | PCI_ERR_UNCOR_RO |
> +				   PCI_ERR_UNCOR_MALF_TLP | PCI_ERR_UNCOR_ECRC;
> +	const uint32_t cor_roz = PCI_ERR_COR_RCVR | PCI_ERR_COR_BAD_TLP |
> +					 PCI_ERR_COR_REP_ROLL | PCI_ERR_COR_REP_TIMER;
> +	int aer_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ERR,
> +					   "Advanced Error Reporting capability is not present");
> +	uint32_t uncor_status = igt_pci_config_raw_read_u32(config,
> +							     aer_cap + PCI_ERR_UNCOR_STATUS);
> +	uint32_t uncor_mask = igt_pci_config_raw_read_u32(config,
> +							   aer_cap + PCI_ERR_UNCOR_MASK);
> +	uint32_t uncor_severity = igt_pci_config_raw_read_u32(config,
> +							       aer_cap + PCI_ERR_UNCOR_SEVER);
> +	uint32_t cor_status = igt_pci_config_raw_read_u32(config,
> +							   aer_cap + PCI_ERR_COR_STATUS);
> +
> +	igt_info("Checking optional Advanced Error Reporting capability\n");

Not needed

> +	igt_assert_f(!(uncor_status & uncor_roz),
> +		     "AER Uncorrectable Error Status: VF ROZ bits are set (0x%08x)\n",
> +		     uncor_status);
> +	igt_assert_f(!(uncor_mask & uncor_roz),
> +		     "AER Uncorrectable Error Mask: VF ROZ bits are set (0x%08x)\n",
> +		     uncor_mask);
> +	igt_assert_f(!(uncor_severity & uncor_roz),
> +		     "AER Uncorrectable Error Severity: VF ROZ bits are set (0x%08x)\n",
> +		     uncor_severity);
> +	igt_assert_f(!(cor_status & cor_roz),
> +		     "AER Correctable Error Status: VF ROZ bits are set (0x%08x)\n",
> +		     cor_status);
> +}
> +
> +static void check_vf_ats_capability(const uint8_t *config)
> +{
> +	int ats_cap = get_optional_ext_cap(config, PCI_EXT_CAP_ID_ATS,
> +					   "ATS capability is not present");
> +	uint16_t ats_capability = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CAP);
> +	uint16_t ats_control = igt_pci_config_raw_read_u16(config, ats_cap + PCI_ATS_CTRL);
> +
> +	igt_info("Checking optional ATS capability\n");

Not needed

> +	igt_assert_f(!(ats_capability & PCI_ATS_CAP_QDEP),
> +		     "ATS Capability: Queue Depth must be zero (0x%04x)\n", ats_capability);
> +	igt_assert_f(!(ats_control & PCI_ATS_CTRL_STU),
> +		     "ATS Control: STU must be zero (0x%04x)\n", ats_control);
> +}
> +
>   int igt_main()
>   {
>   	igt_fixture() {
> @@ -218,6 +315,27 @@ int igt_main()
>   		with_vf_config(check_vf_pcie_capabilities_2);
>   	}
>   
> +	igt_describe("Validate that Data Select in Power Management Control and "
> +		     "Power Management Data are ROZ and therefore read as zero when the "
> +		     "optional Power Management capability is present");
> +	igt_subtest("vf-power-management-capability") {
> +		with_vf_config(check_vf_power_management_capability);
> +	}
> +
> +	igt_describe("Validate that the specified ROZ bits in AER Uncorrectable "
> +		     "Error Status, Mask, and Severity, and Correctable Error Status "
> +		     "read as zero when the optional AER capability is present");
> +	igt_subtest("vf-advanced-error-reporting") {
> +		with_vf_config(check_vf_advanced_error_reporting);
> +	}
> +
> +	igt_describe("Validate that ATS Queue Depth and the Smallest Translation Unit "
> +		     "(STU) are ROZ and therefore read as zero when the optional ATS "
> +		     "capability is present");

These descriptions probably don't need to contain such details. It 
applies also to the previous patch.

> +	igt_subtest("vf-ats-capability") {
> +		with_vf_config(check_vf_ats_capability);
> +	}
> +
>   	igt_fixture() {
>   		igt_abort_on_f(pf_fd < 0, "Device is not accessible\n");
>   		igt_sriov_disable_vfs(pf_fd);
