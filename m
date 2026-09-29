Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12053CA5FA5
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 09:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7C2310EDC1;
	Tue, 29 Sep 2026 09:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgT5ElB3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4D410E9BD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790674777; x=1822210777;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=FSTwxGlRa9CGDHJHVJC4I4SMSKyLgpAduIkmsWskRIo=;
 b=BgT5ElB3hz4DUarUvqYJvT2Y6+MWdLSl8p2DORsXRYhps4tkK+aowpGc
 QGY/WQMCg/UD9F1yYWZJelpQ+hIiN9OZT1JBgnUQuPB9IqL0DgbTzcfry
 GqLrnjkTfg5yRU5SW12CTcXWD1NbSheaBkf28bBx33iPPo0wNDjYhRhqY
 9WiUvLbryKzPlITotk7MFgnXO8Ljsp/6uO1vpvl9BzvpdKEfAjbbOOD4Q
 ZwACgyWVWW47Lqs2p/nH4udA8mR+y0H9pZeEKsDvyMclDy+XnpCW7tAKd
 xQ9eZfx7Hl9uctSxilNOsHFM+pu1JhnlxBayuQNjTjZM5g7Tcyij3jugQ w==;
X-CSE-ConnectionGUID: ENUWmoEeRmiezw7+XWjfWw==
X-CSE-MsgGUID: Tq0G8ti4S2y859GvF0dyvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91249475"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="91249475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:39:37 -0700
X-CSE-ConnectionGUID: J6/Kic+nTp6t0EQHc1yO8A==
X-CSE-MsgGUID: z0KxluZwSziYTBpIaTeIow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; d="scan'208";a="283413352"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 02:39:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 02:39:36 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 02:39:36 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 02:39:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpvT04jshhEhC0jhefYVIU0NPg6BaPZ4zT/ycnwdJtkVuTPLBI8vW0uq3ZUmm7+yrJqyn8tO0AgysTrtKANWVywFtBEqkcO7FRNW+8WhqdZae4dyFqijkbz5Om0KgmIZt6+7BFNCQ4Unw3tviPyl+ndPTN2j3JYClbJfQ8401I7S2JVzV/xz/WNbeRU9Sn+u38sAlQAtgNm44idwtjgeCY4lqhAUAO2LaCVtXXU102gLVEIVWTHrnjtfAzC6BW3uovgog4gvK//9b+0XlzIPSzYfhbq7X/MUezBQ/2P7Dv4mHoEEFoNH+E1rWrED6eKVgJMhcHUrd/gNjBoIePx54g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42WIaIHwmZHjhgUVPRjREIa3VLqGzlnHtlZo3LP7+RQ=;
 b=FbKT3bcnAZ9T/gbNoIuKrseBuv9tiS+hsFBK6efcneLRRLN6SMujnbuxBT24pVpj57pn4fs6j/09hVfIj9vXn4/NNBmjBjJO2CnfelLpcClENVLN2Gz0NZhUnkDcJh7I5QrfCV5oTarg074ndRJwoSzzh0i+0zJ6FtaQcMco9dzxd8EEuUJzLaXHqp+j7c6x1GBdSIRDsX7RQik8lT3EvNewSWwXTpztXgAW4W8JO77K0wlR8bPAjq9RXu+6QFvjUgO2zSpuuTm5HSGy2+ODaUXkN0o/uj4ILVX7HTYTNXUfUlRf5LjDOsl21P4BdVUVky2EzGpxJHUIYUybACSvKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by CY8PR11MB6844.namprd11.prod.outlook.com (2603:10b6:930:5f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.25; Tue, 29 Sep
 2026 09:39:28 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 09:39:28 +0000
Date: Tue, 29 Sep 2026 09:39:18 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>,
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH i-g-t 8/8] tests/tools_test: add gputop PMU engine
 monitoring subtests
Message-ID: <wegzc7vxlk3pde2p3wak662v4g4agffb7yjaytukwuttzvo7fg@f5npnzg6zwrr>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <cover.1790331690.git.sebastian.brzezinka@intel.com>
 <7b993f51125a4d3cf188d9f9007ceb5f448eecb1.1790331690.git.sebastian.brzezinka@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7b993f51125a4d3cf188d9f9007ceb5f448eecb1.1790331690.git.sebastian.brzezinka@intel.com>
X-ClientProxiedBy: TL2P290CA0010.ISRP290.PROD.OUTLOOK.COM (2603:1096:950:2::8)
 To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|CY8PR11MB6844:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a9fab05-b355-4544-8424-08df1e0d8e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: btQB0ICRe9kOk48RHDERPT4eE8quHvWPS0HDHRKekywJGX9stRmCS12H8iPb0JyJqzUB+TbSDrwMnfwOUZpeEkubMsbuX3jHBfw1aYRt+6xchZrwT8y7KlrRVGk0xvi3blxUE4xIqaUCxJbvNNAV+9FppKqdEbVtxhZsWbzQFy6oqJlNbVTJAYUJn2l9zpKFdr1KWeGhpafZaIxRwzOUGUIb1yqhjgXJV7rZd0Y85tR2Ma/re2DcYWDvqdXdb/TFPa5hMaxY5HEFCSGs9jXwMc4TM2dRpg8qVJbTE30zfEQYXNIgoBWQt3Lxy+ycIk/gdbCzSSCmJqerZW9TRdKgVwOCKLH1m6iLCvJ600FNvszWeN1vYYL+qb4qxBGCnchTQ8T7/nEKCpUz9yBA+ZafILVjzvHAC4wNGHOcb9ZThpOODgwFLoTr6eINI4gkPxZ7xTEgWjfnF9FNtqHRRe8ynRa23zltuCYenUrmAKfkUbAHIhkwq4vXLMqoyRGvVasCFnaIHjg0cYxh3iKH3mBciOpskeOkmDgIvx4028LflPR9eHrP8AjYLTEKfOKsjwdue0FhgPrd+mbozXQSepU/Jw0e/pzrVRMg6uOcXeWj6kpJlciHY10geM3rVEFQHltB6wvJWnrKzkOsUoQViUXePUA5neFF+OeoxTo+a0YPE5k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjZUUEZhRmx3T0lMekhWWm82OW5FRmlBdmxZM3ZGWWhVU0lVR1hpcDUrd05Z?=
 =?utf-8?B?dElLU3kyRUVoU2QvMmFNTzFzMEVBMGJLT2JoNEdiRjcwNmtRYTJ2VHlGSkZp?=
 =?utf-8?B?NVRmTXpFeDZQdngrR2lPN2t5YnhyYlQxU2MyWEs4Y2RldkxhVnowSDNZSjZ4?=
 =?utf-8?B?VDF4c2VYcFk2Y3BmdURZa1VlT3NodHFxUWtFNFVybW5NZHUwS0hNL3BNQXZE?=
 =?utf-8?B?U2xGZWJaNWV2ZzJCMndCSWJSS2tEOVF2NXpLUEFwZTViOXlRclp0V293Z0pZ?=
 =?utf-8?B?ekdWN1UraGplWkJETlk2ZmZmeTcvN0cxR3lxNDdtRGpCcmh6OWw5ZDZGc0tV?=
 =?utf-8?B?eDFnVm52WXZFaWUwcktJWDNVQTdUbWlzVUM3TG0xUDVpVVpMRE92Wk1BVGhI?=
 =?utf-8?B?K3QrRFk0emk0RVlHVFR0Z1Z4NEp0SXBLalR5dGxibFJIeHJSVDdvSXFKaFBD?=
 =?utf-8?B?QmpzWDZxQlhUZW92SGNEaVJ3anF4N0k0NW4rcGM1RDd4aURFWDVNSEp1WUE4?=
 =?utf-8?B?VjRBNHRnTmQ0NUd4MkR1aEdUWk1RRkg1Q083ajVCN01iUkM0NGJWMk9sTXZB?=
 =?utf-8?B?Z2Z6OFR0bExTZVUrUDhmOStaZjZBcTlsSHJiaSs0Y0x0L0NnQ09OcGdCMXI4?=
 =?utf-8?B?VVROaXh1MElYR05MYzRuY3oyVVlkQm01TDZjcktKOCsrdUZwS0Q4bmpXWlVa?=
 =?utf-8?B?alN5R2s0RUJwU0tGbHg5dDFDTENPeW9wSHB6aDZ2ZThzejlBWG9KMEMycmhx?=
 =?utf-8?B?aHB3NktrdHlDMXJHang4UXhTaGRiNE5odDF1ZnV6WThXWU4xbnFQSmdhSDgv?=
 =?utf-8?B?c0pwWnZKRXZxc2p5SCtidkVWb2R3akMvNzhmTExRYmJ6Ui9WYWdYZkROOWVz?=
 =?utf-8?B?dmpkY2swNG1jV2hNTmIrekpsWDRGa1NLTTJUZml4bVdvZXZrSHAyaG9hcUto?=
 =?utf-8?B?RkZiUTZqdytzNXE1Wm1zaTRaQ1B4QUNOZ2wxdTJPRnNEbnVsejlzZXNjWjBT?=
 =?utf-8?B?Q045Yi9FeTdveGsvTWpuMDRHVmVDbHc1QUdJd3k2c3lsdlNNNDZuZXczYnpa?=
 =?utf-8?B?ZlhNM2p0UjdsVzQyQjFRSyt5eUNNdGp2anNRSUhwbjZOLzJhYWFTVjJjVzB6?=
 =?utf-8?B?a1lFWkZxcFJ6TVBHRnhZYUw5WXhBNGFnbGxnWW9qMFJsZXc2M0MxaTFkUndP?=
 =?utf-8?B?Vk5ySmNtVDFERG9ZU3l3QXA1YU5jSE8xcFI0eEgvaEVVQ0dUZnpqbm1CVU5U?=
 =?utf-8?B?bUZQTldxRnczQlRqYk44VnBqRnBzaVdndmJNcWZZRTNkSGdFeHJ0VGw2K09R?=
 =?utf-8?B?RWt6ckFtd3pZS1ZleWcyQlRsTE5qeE9vUjdCRXR5bCthajVQU1NnalZoNHhC?=
 =?utf-8?B?a2hpcTFTQU9kY25YV3lKUjg0Mis0WTJUaG1NT3FIcUQxU251THphNitRWS9J?=
 =?utf-8?B?Wk5Nd1BkbG05MWl4N2NJdmR4UFRDRTZ6NFV1VEY2TVlmb2lYczhFd04wWXRD?=
 =?utf-8?B?Rm9CUWdMM3dDRVM5TnJML1VWL05qb2tMY0hDZGxROFdyaWN1b0JBQ2JGeHF4?=
 =?utf-8?B?VG0vTWZ1UVdsOVdFR3RFZzEwYTRzZ2FVNTNkckk1SWVua1lLR00wRm5YOFlK?=
 =?utf-8?B?b0JoU0tJQldseWhwS0pqTlV1czJsZUxkVTY1aEY4UFRFTzNEL3lqUVBvQXQr?=
 =?utf-8?B?amlENjhjZG5wRXJ2S2Nsb3RlQW5QU0JzL0MxYmdxWHh2Wkc5d25WMWpNbU9P?=
 =?utf-8?B?cVZIT1J5ZnFoUjJER05xQ0p2VDEwQ2FUdWRYL2hNMWFXYWtPRmhidktkV0RU?=
 =?utf-8?B?a1dSaUt0TW9MRDdXMTY0NHAzeGErU0liQi9URWVGVGFqak1DNVEzdXdBYlF5?=
 =?utf-8?B?QXdNTjgwdFhsSWxiWG93eFNrdmpVTDh0VHQzeitsZXdnR3NNWHZZbUlFa3FF?=
 =?utf-8?B?N2NMZ2JjZThQR3RqSE0yZk1venAxUHpSY3JERWdXYU9PdnNDSDMxOThkZ1F0?=
 =?utf-8?B?eXowTXpNcFBNKzllSUpLMWJwNWhzQnNDeGhFT0VrNjdUNEpnQkNlYjRCOG1S?=
 =?utf-8?B?TTNaWHR3R0k4QVdZTHFEQTJPTmNSZXFBZ01EMDRkc2dnOEVzMjdZaFM5TC9t?=
 =?utf-8?B?SCswZUN5WVNKMyt1RFZlNDVPT0Yvb3phQ0x5OWs0K1pkZWVqZ3U2cWRtS1Yz?=
 =?utf-8?B?U1BXOFlZVTFMQTEvR3dFRE9XclZBRWZuMkdKRWxycS9UR0R6RnRPa1dENHFl?=
 =?utf-8?B?WjdyUGRxVy84MlRidHJLSDVBa2p6d3BCTkJxTlRFSDZJZ3BXVTJvMmFabGlP?=
 =?utf-8?B?THFFbWM0RlQrL2JmdkZNUjU0ZHdVK0pWeGtnWUVITldicy9OR2hHYXM2Qm04?=
 =?utf-8?Q?J5SCFV60rouuEyRE=3D?=
X-Exchange-RoutingPolicyChecked: pmk2K5jWENvSqR2M0BG/iM6LTMLBebhJWslqWimEVoVXDOqMO5FUlPPJUeNwqqTsw9+aWEErcjRX3+06lbfN3IBYNxKO5gus4buC4ipWTD7UOFIqsBNxE8RucOVEGxwxuQvNwAoFzXKyvfFN5NWlpHWzfErUwpuoOjPgv2YUi/mRmTfbp7/R7sD6E7NyD4A0036doPIp7Scmas6f23K6FIV8Z8XX3nQQigSRcknLUXKU+N6UaEAeYKYZNdZNs4YRHsNqyIMa9690Idq53q6JJN5JXdUEFNyf77GDmPKajIitVezZAno4ts7Pt4mQ+Ucqfr4AiYfJfXvixdWnFyhaNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a9fab05-b355-4544-8424-08df1e0d8e48
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:39:28.2014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ndC+cupwFWEpDsaXL9NlGFUIJ6Bim/icbkoCqEOSkDJispR4czEBXjHNCRb1Srycx0Z9m7jIsgq+YthWhGFLZf1pB4EuRWdCqD/cMdpN/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6844
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

Hi Sebastian,

On 2026-09-25 at 12:57:48 +0200, Sebastian Brzezinka wrote:
> Add three subtests covering the gputop tool.
> 
> gputop_engine_discovery runs 'gputop -n 1' and verifies a DRIVER header
> and at least one engine row appear in the output, and is skipped when
> no GPU is present.
> 
> gputop_no_crash_unprivileged runs 'gputop -n 1' as an unprivileged
> user and asserts the process does not crash with SIGSEGV or SIGABRT,
> since gputop must exit gracefully when PMU access is denied by
> perf_event_paranoid.
> 
> gputop_pmu_sampling is a root-only subtest that runs 'gputop -n 2' and
> checks that no 'PMU read error' messages appear and that percentage
> values are present, confirming that the perf sampling path works for
> both the i915 and xe backends.
> 
> Signed-off-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  tests/tools_test.c | 78 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/tests/tools_test.c b/tests/tools_test.c
> index 857f71d14..9ce17f897 100644
> --- a/tests/tools_test.c
> +++ b/tests/tools_test.c
> @@ -22,6 +22,7 @@
>   */
>  #include "config.h"
>  #include "igt.h"
> +#include <signal.h>
>  #include <stdio.h>
>  #include <sys/types.h>
>  #include <sys/stat.h>
> @@ -171,4 +172,81 @@ int igt_main()
>  		igt_assert_eq(igt_system_quiet("./intel_reg dump"),
>  			      IGT_EXIT_SUCCESS);
>  	}
> +
> +	igt_subtest("gputop_engine_discovery") {
> +		int exec_return;
> +		struct line_check line;
> +
> +		igt_require(access("gputop", X_OK) == 0);
> +
> +		igt_system_cmd(exec_return, "./gputop -n 1");
> +		igt_skip_on_f(exec_return == IGT_EXIT_SKIP,
> +			      "no GPU found\n");
> +		igt_assert_eq(exec_return, IGT_EXIT_SUCCESS);
> +
> +		/* Driver header must be present */
> +		line.substr = "DRIVER:";
> +		line.found = 0;
> +		igt_log_buffer_inspect(check_cmd_output, &line);
> +		igt_assert_f(line.found > 0,
> +			     "no DRIVER header in gputop output\n");
> +
> +		/* At least one engine row must be present */
> +		line.substr = "|";
> +		line.found = 0;
> +		igt_log_buffer_inspect(check_cmd_output, &line);
> +		igt_assert_f(line.found > 0,
> +			     "no engine rows in gputop output\n");
> +	}
> +
> +	igt_subtest("gputop_no_crash_unprivileged") {
> +		int exec_return;
> +
> +		igt_require(access("gputop", X_OK) == 0);
> +		igt_require_f(igt_system_quiet("command -v setpriv >/dev/null 2>&1") == 0,
> +			      "setpriv not available, cannot drop privileges\n");
> +
> +		/*
> +		 * gputop should exit cleanly even when perf_event_paranoid
> +		 * prevents PMU access. Run as an unprivileged user (uid/gid
> +		 * "nobody" 65534) via setpriv so PMU access is actually
> +		 * denied. Any non-signal exit code is acceptable, what we
> +		 * must not see is a crash (SIGSEGV/SIGABRT).
> +		 */
> +		igt_system_cmd(exec_return,
> +			       "setpriv --reuid=65534 --regid=65534 "
> +			       "--clear-groups ./gputop -n 1");
> +		igt_skip_on_f(exec_return == IGT_EXIT_SKIP,
> +			      "no GPU found\n");
> +		igt_assert_neq(exec_return, SIGSEGV + 128);
> +		igt_assert_neq(exec_return, SIGABRT + 128);
> +	}
> +
> +	igt_subtest("gputop_pmu_sampling") {
> +		int exec_return;
> +		struct line_check line;
> +
> +		igt_require(access("gputop", X_OK) == 0);
> +		igt_require_f(geteuid() == 0,
> +			      "PMU sampling requires root / CAP_PERFMON\n");
> +
> +		igt_system_cmd(exec_return, "./gputop -n 2");
> +		igt_skip_on_f(exec_return == IGT_EXIT_SKIP,
> +			      "no GPU found\n");
> +		igt_assert_eq(exec_return, IGT_EXIT_SUCCESS);
> +
> +		/* No PMU read errors */
> +		line.substr = "PMU read error";
> +		line.found = 0;
> +		igt_log_buffer_inspect(check_cmd_output, &line);
> +		igt_assert_f(line.found == 0,
> +			     "PMU read errors detected in gputop output\n");
> +
> +		/* Percentage bars must be present */
> +		line.substr = "%";
> +		line.found = 0;
> +		igt_log_buffer_inspect(check_cmd_output, &line);
> +		igt_assert_f(line.found > 0,
> +			     "no percentage values in gputop output\n");
> +	}
>  }
> -- 
> 2.55.0
> 

Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
