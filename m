Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F90FC43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 08:27:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 529C810F238;
	Thu,  2 Jul 2026 08:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+tGsr8M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B4910E4A4
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 08:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782980808; x=1814516808;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gh6zcYinPB2qTxY1jAw3fms94fW83I8TUBXMRelAa/M=;
 b=M+tGsr8MZr+CNGVh4IoHJ/+3MGG2DctFme5diLLzmR/+vPp12HDVtctK
 BCgYv+k/rT/xhCqMMmDeU7uZntH1B54invtW8bXrRPy00bmZAgq+pvxTV
 MSi1cr6dMIwAVNngBCsLoiocbNcX/3z0J7WGdhXfomILL6+lx553e5sKd
 8wzIXn3RbE8QRhiDUY9OM0n5Ffq7CEk/ntjtUGXJ4FE20J782qSQ4Lt9V
 EZrSWwhJ2bBfuEfykxsxt/ytcjiWZ9KFGjEtPsFdsahcY1Xz8uHyVyRzc
 7mSHGJk/zldu2zlP/Q0EXZTUsOFUSMSWf7ASupvqmDDjDXIH+F5EfTkZb w==;
X-CSE-ConnectionGUID: Nsg6vC3tQoOaJij1+gdJEg==
X-CSE-MsgGUID: 6s6htdGTSTOa07uXIUXOcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="106522116"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="106522116"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 01:26:47 -0700
X-CSE-ConnectionGUID: 5NCZoZ7NTSi6xJ3R/s0FZw==
X-CSE-MsgGUID: NYGlvd4vS4uHiDwXo85njA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="257696142"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 01:26:47 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 01:26:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 2 Jul 2026 01:26:46 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 2 Jul 2026 01:26:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbQrhz4x5y3iPJlSYYpG+wrnxusQU+CNWC+0Q0pdDixGsXdGO1JxoBpJ0rY9gkFIp7SQAtpwOtHEgCX8EDLsh7PmHZK2XnYRwK0sgCx40Tg11/jsTe/Cp98dhlFx/Gn5164wZA4IO+FmA/QNyX6jAk2Ubm7FGh9mRLMw7DTRy7BUgdiEHkZP7tZroQv3UslJ8MefoF7tcNABsSldOt+MxgAMZAUgoF8h8Y7hr2Hr+S7HSpSdpN6QPmlo858+LY8QCrTrgdjmXhyUvVin4QrgLFUpySmie1afozYFFg6lr1g00nrsA9wNGgg3oZXuHEVd9lkGoD7dxPX9zWptp5KrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5BUMGDHKV0yqBqaepG3RV+C8iSfIUOUcAR9tmBEtYk=;
 b=Scz3uTCdTalQSM0mpHufo8fxoA6FgmGGGmpUtvtUQe5REEiJkQMYk2LjD3FxgtMeNTCZK9HLHTFM9wM0Sw3bLmDI8/766rpK8YALfkEpLna5T1TUAVGBvB/vH+SlKBchsjyslbr1Gw3glpO8Q7JpmuiZISY3kY+AAahkCdkJdawEKT4EFc5keDSN7cCiqK284aBbq9cqQYPZLNhT08WGxAzfQpR5R84OpVbNYdAcKWutcgzLgcYxyW1tJfNkQ+Q/wQhmWv4SKyfWqAltgW9XmvioMNb8M5M7D0Jo0rTDt69THsAZAuNODQX/W56eJ26fg8G8kQTsZYRR897Mh9y/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7)
 by IA4PR11MB8941.namprd11.prod.outlook.com (2603:10b6:208:55d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 08:26:44 +0000
Received: from PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2]) by PH0PR11MB7424.namprd11.prod.outlook.com
 ([fe80::c448:1138:6981:52e2%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 08:26:44 +0000
Date: Thu, 2 Jul 2026 08:26:33 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] docs: Add comprehensive platform filtering
 documentation
Message-ID: <j2ij3jd57iuprni4nws57e7k4syvfnd4ow5hcobena2xfggadw@l2hefjt22qtn>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
 <20260630032442.200729-6-vitaly.prosyak@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630032442.200729-6-vitaly.prosyak@amd.com>
X-ClientProxiedBy: TL2P290CA0028.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::10) To PH0PR11MB7424.namprd11.prod.outlook.com
 (2603:10b6:510:287::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7424:EE_|IA4PR11MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c10fe12-8a39-4e77-aef9-08ded813a66a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|56012099006|3023799007|11063799006|5023799004|4143699003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: gfq2nNooeiapnIrZHdHXhMe5ZMQO4XL/OxJxMam1pRBJ+UM9bLcQCd8ZwiSS4UWOIikwSJLvNXAl83RfMdQCgLiNhTkgjvsyhJOYfanOVLt6KV6/HWw//zVmPpOh5RKqwf/O+wXBTtIuWws1ckndM7jhIby+uMWlVeZFm15Ezu08NV4cd50k/q/kdvSA44mZ8/XNkQyhwJEmkNOAgjSS9qt9CFaBqMfsoSDyqs1Cz2kO1ocZyE5uP0eAEYisGUqknOMH70Y6oeITwF8Th+olDVIzxSkuiMTGywr7VFsbHYglRZh6bs12uCeRpwDG9lUh+a9F3ZgbdTBOqFhW8gxgmEhrsdDbIKC67jFmXlP46vdl6S/AMube+e7HOTtVL8XEL0tZjwSJjUEKz4+8APL6XztxXYgL+kcCGcAIqso+7dh/QFbk42i1Fc5Irod2Ht1LPCr2SJ9e4No1+H21nDUiko7K6PVxgGEwJZxruxhoNlPLJT6w9r2zaNRV1o+84aPA2312EUZVyuiU9jDzu6R5qesQSWoLJ4fojAskyws8LKT7ajXJ7p1TY+vbuFSLLTXk9XEE8zAnA1SkPbpDkyO69TGY/JP7jw4jw4mSgoZQREZB0TrDTn30jjZJYL91/a+nRMlXOR+ajgN8b5BVtNoWTO+/r1Dicl2lpzTZIIrNpHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7424.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(56012099006)(3023799007)(11063799006)(5023799004)(4143699003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFVWLzRaQWNES1l4dVIxNGtjK3o1WURHcCt2U2lUdEp1d1NkR2tQWUxvQko4?=
 =?utf-8?B?OXRTc3NhOG5LWjVtQ0ZtekFPb0F6MjBkS25DcXNNVXVNc3RBYU9DeWdJRDIr?=
 =?utf-8?B?R2NTbmlDVHQxTWIwV0xVWjA4V3YrUDM2a2JOcVQ3NTc0UlFvKzFKWFdrbDlU?=
 =?utf-8?B?UjZiUHFPN25CeWlXVnFibHFSSFJJSi9PWHRNanNkczJ4enFtbnoyOUNhSDBt?=
 =?utf-8?B?M1lKaGFwSkJEcWxSVENnajhpL2lUSVg2ek1QVGxmM1ZWTmsxZHh5ckRXTVdF?=
 =?utf-8?B?U0oxWDREVTgwU3h4UmMwNlZMT1hJREU3WGE1V0FlNWVIU2lDODgyTTg3UmJs?=
 =?utf-8?B?SjVTVEdPcjh3SEc5aXp0eTFuMmR1bXZMT0hkL2lYc3B3UmhmWmp6c3NBdnJU?=
 =?utf-8?B?a1E5aXZzSytyaEU5UStzcFQyOEJMMng3WUo0clJzVHdEcUMrREV3eEVBN3Jk?=
 =?utf-8?B?c0srSGsrTW55RDBYVjBZRDRpRnJ0NS9nYnFvY1JnRGRTdlBHK01CWHYzMEJl?=
 =?utf-8?B?YTREVEtEZ25ER3M5eHhrUjZNRmFIcFJzWEsvbWMvUXkzNy8zNkJSaWpTb0pE?=
 =?utf-8?B?YkR2MHFNbWRRa2FUS0MwdVViOFcxS1BXWDdhenZqN3pCWUQzeE5XUlJrL0ZG?=
 =?utf-8?B?UXhISFVkTld6K016L3pMZmRiWnZDQkt1blhlc3ZucHo3Z04wNDRSSHFrZDNH?=
 =?utf-8?B?czluenlCU3pvVGRGWHgxUlgrUUZTdkVaMDVqSUp0OGI2QlFCeWtjVVpPMnl0?=
 =?utf-8?B?WkNnaHJWWGhiVm10Qkw1UEMrZzFEdkdyS2VHdkh1WktzUDZGUGN2WTFUaFIv?=
 =?utf-8?B?bHQwQi9US0tFVEpSVUhIblRVdCttTTlJQTNEaHZaMnZja2FsdlFBa1lJbUFH?=
 =?utf-8?B?dEsxUy9HdTJCdFFDcUZEaEFLZ25mYVZZb1UxeXBZbHNRSzZmaFRZOHVpbW9q?=
 =?utf-8?B?eXdDdzJFQUxMdjdaRER1YmxEbWFkY1BkWjRIYUpmbnFEN2pBaDgySE5ITkV6?=
 =?utf-8?B?ZmNmMEhMankxU1d4bGtERGEyWkhoNy9udE5waU9nRjFxb2YxNmgycTNrUDBD?=
 =?utf-8?B?dDRHU1l5MlBjL0tYQTBJZTBibDJQUFBsTStnOUJ4U2dxK0NPQU9ZWHBpcDRq?=
 =?utf-8?B?bWdwcHVibmRDbUhlcWluLzVGVTB4OFVOMno5SXprazdqUDBQaTJFUlE2cFQz?=
 =?utf-8?B?RzA4Nm91bFd0emYrYXVvbkJpaFlqOXRka0dpeFNOVnp4dHJoOGd3RlBpMmcy?=
 =?utf-8?B?RnRxdDFPREI0WGR3OU1reG5Ya1pCRHFMWW13NGR0aFNYbjk5MjdpUU85TjJV?=
 =?utf-8?B?R2MxTkRPWGR5YTJvUG51NG0xWnZiZ0dGNDc2TW02VlFOMDFsRmFrbUpRUW5u?=
 =?utf-8?B?YTRxYkhvSWdtS2ttWWptQW5aYnh2ZzJWSmsvakZyZE1OeEI2aUdlOEloTHFZ?=
 =?utf-8?B?aEMrWEtEOFo5VEJaaWt5ZGZMazhyRk40cFNUanRLVTBvbklKTWNVRWFUSnAv?=
 =?utf-8?B?TkhzMFhMRFJJM2Y2c0hjMG9pcFFMQ01veGRYc0Q0d2R2L2dmbUQ5bHBlSGZ1?=
 =?utf-8?B?T2NrY25OdlVjZEhnTTVZRVUvSVByVkxhZkFudVE1TEhxWlNLNitQeWRpOGxK?=
 =?utf-8?B?RFljU0RWVHIydTJqVXQveVhIbDNnOER0ZVp4VUcweGFzL2I0WkovQUx6aita?=
 =?utf-8?B?eCtLMWhacTVveXA0MWFnZlBNdG9YRWdaY2pSN1RQdHhiMHFsTmxrdlUvLzE1?=
 =?utf-8?B?Mk1XZzdDMXdOUTBpR2swcG1MTVlFb2hRaFpzVWVmckhLamlNLy9Ec3RZbE1L?=
 =?utf-8?B?TlZoaWFRckw3NFFYOUNFNVZPeDhCdDlzaUpSQ3FGaFlDMWpMa2ZrTFNNMnR2?=
 =?utf-8?B?akU2ZjR0MGJicXhiQmR1aDZrTEtsL2dRV1lGajM2Vy9scis2WkNhN2dBaGNP?=
 =?utf-8?B?cVBmV2ZLUHVTSG1TNmZ0WVlNZjFGUGJFYVV3bC9hRldibkprOGxUYW82ditE?=
 =?utf-8?B?L1FtVXZCK20xSnZTYmxjQVNURHpqR1FQSEFoVll0dkROdjZyVEEyNG1xUHBW?=
 =?utf-8?B?OHlQbVhZZkxUdzJqUzg5eEU3K0w2bVMvRzJZQUp4eEk5MkVDeFliTzhEN1lo?=
 =?utf-8?B?T1h6dDNqR2JZTE4wWGdNa0pDbittaGJKay9mUU12SnRrb2h4STRlSVI0SU1U?=
 =?utf-8?B?d0I2K0djL3BBZWRGeEdjaDZPMGdoazI1M1laRG5kT3BsS3FiMk0yVmJrMk1L?=
 =?utf-8?B?YkdGWFJJUE9IWWtXcDRKai9ia1BwK0NJanhuZWU2c1ZibFJ1aE50TmhoeEd6?=
 =?utf-8?B?NUs0amxyajR0ZWw4c2RWalF6NU1kUXhsYytBbTZzN1JaamZIZkovQjVxekFp?=
 =?utf-8?Q?ANaQ7S3IKX0qNJvc=3D?=
X-Exchange-RoutingPolicyChecked: OPaqfJCWQp0M9hrFWGwzILh65OCWmQH57oLJs3hHTmNLLj3aaci/MmSftH5TPd1Kkbr6y733FP4oFztg5pP67guXUSQgf0QP8hH3Kkn4VhsX8w8BZlVOobBbbldwwDNie4n3kXsrwpLQnD+ru8cstmpG1CUyDPyF9JDKTHAaAsY31Y6xzqZq/nsrMiJtjNwmyC5z8riyy21NeWg/si8hWEukd7ZO16AG+Hk689UNmY+szZYxJVGsUGyCtJCVTqAn3djrKR3l72nj8EoJf03hT5gKTHWrN32UH5VGfv5/ErAyze4vUnH/z5SV3bRf7ZrS/FfvJPnL9DSdtrnBDWZkEA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c10fe12-8a39-4e77-aef9-08ded813a66a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 08:26:44.2282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dl9I4Lf1IyItjhe3Ll7Ek1eFiv1L3lwGwL5qI7qmAYEouvHEV3Yw4uCuImc4fpcv/PJn63W7xxqSm61PJ0Di0muJdZJywZsNxBS/rQA6O3k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8941
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

Hi Vitaly,

On 2026-06-29 at 23:23:25 -0400, vitaly.prosyak@amd.com wrote:
> From: Vitaly Prosyak <vitaly.prosyak@amd.com>
> 
> Add complete platform filtering usage guide demonstrating all three
> filtering methods with emphasis on config file approach as recommended
> by Kamil.
> 
> Documentation includes:
> - Automatic filtering explanation (no manual calls needed)
> - Config file examples (RECOMMENDED for large test lists)
> - Environment variable examples (quick testing)
> - Built-in rules examples (production)
> - Wildcard patterns and priority system
> - Real-world examples with ticket references
> - Best practices for dev/team/CI/production use
> 
> Addresses Kamil feedback: "Add also example with config file as env vars
> are not convenient for large tests lists."
> 
> File location: docs/platform_filtering.md (integrated with MkDocs)
> 
> Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
> ---

[...]

> +### 2. Configure Filtering Rules
> +
> +Use one of three methods (checked in priority order):
> +
> +1. **Built-in rules** (highest priority) - Compiled into test
> +2. **Config file** (recommended) - `/etc/igt/platform_skip.conf`
> +3. **Environment variable** (lowest priority) - `IGT_PLATFORM_SKIP_CONFIG`
> +
> +---
> +
> +## Method 1: Config File (RECOMMENDED)
Since built-in holds the highest priority, you could put is
first on this list.

[...]

> +### Run Tests
> +
> +```bash
> +# Config file is loaded automatically - no environment variable needed
> +./build/tests/amdgpu/amd_basic
> +
> +# Output shows:
> +# Subtest cs-gfx-with-IP-GFX-UMQ: SKIP
> +# Platform filtering (config): SWDEV-12345
> +```
> +
> +### Advantages
> +
> +✅ Persistent across sessions
> +✅ Easy to manage many rules (add/remove/edit)
> +✅ Team-wide configuration
> +✅ CI/CD friendly
> +✅ No rebuild required
> +✅ No environment variables to remember
I think listing Advantages/Disadvantages is misleading. Each of
these methods has its intended use case, so you could just put a
note about that and let users decide which option is best for
them.

> +
> +---
> +
> +## Method 2: Environment Variable
> +
> +**Best for**: Quick testing, temporary overrides, single test skip
> +
> +**Variable**: `IGT_PLATFORM_SKIP_CONFIG`
> +
> +**Format**: Same as config file, semicolon-separated
> +
> +### Example - Skip Single Test
> +
> +```bash
> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:cs-compute-with-IP-COMPUTE-UMQ:Testing"
> +./build/tests/amdgpu/amd_basic
> +```
> +
> +### Example - Skip Multiple Tests
> +
> +```bash
> +export IGT_PLATFORM_SKIP_CONFIG="navi48:amd_basic:*-UMQ:Testing;navi31:amd_basic:cs-gfx-*:Known issue"
> +./build/tests/amdgpu/amd_basic
> +```
> +
> +### Disadvantages
> +
> +❌ Not persistent (lost when session ends)
> +❌ Inconvenient for large test lists
> +❌ Easy to forget it's set
> +❌ Hard to manage multiple rules
Currently, there are no advantages at all listed here, so one
may wonder why was this implemented in the first place.

As you mentioned at the beginning of this document env variable
is supposed to be used for small test lists and quick test runs.

[...]

> +## Platform Names
> +
> +Platform names are vendor-specific. For AMD:
> +
> +- `vega10`, `vega20` - Vega family
> +- `navi10`, `navi14`, `navi21`, `navi22`, `navi23`, `navi24` - RDNA1/2
> +- `navi31`, `navi32`, `navi33` - RDNA3
> +- `navi48`, `navi44` - RDNA4
> +- `strix_halo`, `phoenix` - APUs
> +- `arcturus` - MI100
> +- `aldebaran` - MI210/MI250
This list is sure to change in the future, either by addition
of new platforms or decision to remove unsupported ones, so I
wonder if there is much sense in listing all of them for AMD,
Intel or any other vendor.

[...]

> +## Summary
> +
> +| Method | Use Case | Persistent | Rebuild Required |
> +|--------|----------|------------|------------------|
> +| **Config file** ✅ | Team/CI exclusions | Yes | No |
This ✅ is redundant, since you re-iterate that the file is the
recommendation.

> +| **Environment** | Quick testing | No | No |
> +| **Built-in** | Production rules | Yes | Yes |
> +
> +**Recommendation**: Use **config file** for managing test exclusions at scale.
> +
> +---
> +
> +## See Also
> +
> +- `lib/igt_platform_filter.h` - API documentation
> +- `lib/igt_platform_filter.c` - Framework implementation
> +- `lib/amdgpu/amd_platform.c` - AMD backend reference
> diff --git a/mkdocs.yml b/mkdocs.yml
> index 0abb76704..6f427b20f 100644
> --- a/mkdocs.yml
> +++ b/mkdocs.yml
> @@ -29,6 +29,7 @@ nav:
>      - How to document tests: 'test_documentation.md'
>      - How to categorize tests: 'test_categories.md'
>      - How to blocklist tests: 'blocklists.md'
> +    - Platform filtering: 'platform_filtering.md'
You could change the title to match other's in "how to" style:
"How to filter platforms" or "How to filter tests per platform".

>      - How to get code coverage: 'code_coverage.md'
>      - How to port new IGT driver: 'new_driver.md'
>      - How to plan a new test: 'test_plan.md'
> -- 
> 2.54.0
> 

-- 
Best Regards,
Krzysztof
