Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D21C43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 03:41:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86ECB10E141;
	Tue, 30 Jun 2026 03:41:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XrXEtOY/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D6A10E159
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 03:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782790833; x=1814326833;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rki7R7rJPqec7xZfqxlUy8HVbE2BmJ05Sd0ZaFPYNzE=;
 b=XrXEtOY/n0DgVqrvls9APfY4YXdL1GPO0MWISqAZvt81hu7lgjXiOseq
 iUdmhsAwqcK9nEZsHrNus4mKKZCqabjoM2IQYd01tVnXVf07kNylYXEa6
 7N/k6x14p/sOIjTOMNUChRxqKigEeMnEnV0JxsE5oOjs2aIKYW02q95xq
 Xnn+NLgZKJYJVJ1SJ/eOYItnPqbLqdOR8fdnrWYxZetQNlRcU+ZMs9Gj7
 7jK+iY6+ybhivynH8fE5T+qiJKPdSEbhnmUajF8Ac9tkMRx9Ogq+3CsbU
 bc68LfWaRqQ8CWHADltLMKuiHpp5CySnGoza04I/352lb1BtTVQ7MAHjM g==;
X-CSE-ConnectionGUID: EOal6nRZT6KsHgSzfoLW0Q==
X-CSE-MsgGUID: 6+TPX7m2TjSKwxjF2Ia5lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82487245"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="82487245"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 20:40:33 -0700
X-CSE-ConnectionGUID: CkthezlHTRaWQ2d5X5yQ8w==
X-CSE-MsgGUID: WfQMGcw2SvetdiHVSN38ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; d="scan'208";a="245798113"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 20:40:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 20:40:32 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Mon, 29 Jun 2026 20:40:32 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 29 Jun 2026 20:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qo4BHYfDOUq98L3mx1HPHL6Iqzppzf22ZQ3JiX38OBahs3W8C7dvw3ilmCJhu9wzxAdEggw66wsaAya9dd5V/crLy1b+fWcR8v7ecvgjXMm3ud68T+GUsy3tZDKVNEb+FwKRORbPsqWUCFiXp3jI1vU54N5upTXp61lQVmqE0k90UEeSt0NMQom0aPzR9Sy4hRGF8KTJVR7rM7rpE7zbgyapyRbdniK0LTdaf3UNmKXkpGnqSSYXQOaAR1O0UdNwcpyOGmrmYUcG8vvpPkYw8TAgcfwRydDRwsR1XGB6gkXHMRU59Hjh4MFargX4tTF/bOp409DbSg3ggADfEMpHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xmd4IkAi2qLcDV94iYZjRePk6/lqIslCVS/V8QhNuEE=;
 b=K5RDiIQZwcBlRQrtDEg9IZxBEolBnSEMfjI8ag5v3U9Sj9uPq7qMRr0uy6A9OPl+Aj0HUB5iTiJCK+E3X24vGFgZajhKLxICK0nU24m5xhxa3WvqmXw3yS45XMFO1Pts59FQdNme2dHI71EXEzPE/p1m2ZeB6HdXcXyu8reEvyzBOHbtoQ1WZ81AYYiJX/xx17dSuajS6roApq/j/h1MvgVBo99bJ2SEp7fYzvjMZc+WigjoKHx4eKqadZOduUwEaPplnx22GqLsLdIeOc8XkeT9YgKR4NbapT3mYBoluhcavy+lO4CKpmRjcyp+thqwpHm2Dk3XSeKXdJFCTsISwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS4PPFCE18D981F.namprd11.prod.outlook.com (2603:10b6:f:fc02::50) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:40:30 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0159.015; Tue, 30 Jun 2026
 03:40:30 +0000
Message-ID: <da8087b8-24f0-4b32-8a7e-d11706aae6b7@intel.com>
Date: Tue, 30 Jun 2026 09:10:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Add
 suspend/resume audio tests
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <pranay.samala@intel.com>
References: <20260629120129.3412130-1-jeevan.b@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260629120129.3412130-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0239.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::15) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS4PPFCE18D981F:EE_
X-MS-Office365-Filtering-Correlation-Id: 61076d80-83f5-4057-fe1b-08ded6595537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|42112799006|3023799007|6133799003|5023799004|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8vScnbN76sw39u5W7PAL2a+zvlrwImEadiKz0bOcnCUGwF6CESKNm+32mH96onA1JBCwwSXZn4TWisvKSbGoqFP6FhHd6VOHguQyvEOwHuUyqCRb1KZmxjvtlDTj14POmS5Q9tnITxVGBJM+5dDZg6umwdzOsXiKvCFNgWcRAVkvgdpnAxxgNGb0EJUf6yspjLUVjQC4nu/M5qG2g9kOL/0uUs8zRmrqLuXOhVjP/z3jCIHLUGRBvavRs58wP2TXy+fcyyN3T9Mba+IUAsxAamEqBkJNDTK+gR0VyH3yNNc+khCJfbXVVW7th5VPjLW8lzGar111KakDdxfA0v2hR8CjICNHG2JNJCpmQKsBpCW68etHCqMB5FEF1dqU8FE76G0rinaz+YZtsSg3Y+sK0crjRGtZMl3dg+sf7UAGIFRxhWzKZ839neNvrKVW0KUdsMqnkg6u86MsXBAvVnif+cecEWzunQxsoY+J+EFRajp9l9kyEWjJy0arA59IG0dyCaHSlVx2WztPgyfXTxfqcBDWC35Njybpk3D0kTgQSaa/3xxkUwr/A4FOD8a2/bGTDLLxCbQIs8o1igt1BQR+CEocRUSqrall9qkM7lWgdB4j7ZwESTVrpx8xh3df7t6+UR7gKbehX4sv42ZeT2ahr2GjZGIT5Aq2Dc8RaYplSaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(42112799006)(3023799007)(6133799003)(5023799004)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDJoRTRoTVQyYWhYb0RaTlBVQk04azB3TS9nVGp0Vk1xNUF4NW5wOGFhOCs3?=
 =?utf-8?B?K1FZWStkTm1Wa3pnQjJWVTlKWmtLYW1YMmwrc2VjeFRNSXBvRW1NMDk2dXk4?=
 =?utf-8?B?NHBJNldvNVZQaW8yMlFEa2doSk5XdEN5MGNvVWFhUE1nK2NYVXM5VHNzNDJY?=
 =?utf-8?B?blF4MHlXYmxWZ1EwU1V6WWRuMkFHVUl6dmF3eTMrdWlicWljUElWYXFiakxs?=
 =?utf-8?B?MFNCK0MvVytpS2ZJOUwyT2loQldJQlpIQUl4bVdzc1VoR0duajhKUEw3blpz?=
 =?utf-8?B?R0xOTklLblk1dFV0dmFUM1hFM1dub3RLSXovdFlpWEFNSVdwSHhvNHpKamRB?=
 =?utf-8?B?dW9leEtGYkZ2RHhrUnR2L3BsOHVMRjlpd1BGY0s5Qi91RC85WlBNeVNBUGxD?=
 =?utf-8?B?bXdsWENKWi9CYmxmVmp4ZTJ2anBGWXNnRkcyYUpwWXovb1pUaldZOGtpYUVF?=
 =?utf-8?B?T1VpVEhrMHNIYnVIVWZXNEZCNVpySEhiTWhmcFVBcjgwN25wUUN1dGZLWmlZ?=
 =?utf-8?B?VDZ5SWh3cklmbEhWV3ZiSWhpTHZWaVV1WXhNNzVESG5BZ1V5WVEzQlRVRHFk?=
 =?utf-8?B?NmlpS1RtSkt2L25yR2w2NWNjSm1hQ0pPV2I2OXI0a0huSW5DTUYrTDBlTFlR?=
 =?utf-8?B?bHdrNktPcmg0SFRDS1d2MWtlUDRNbWVuWGhsY0dxSnVxSkRKMWsrN2g3bWFU?=
 =?utf-8?B?a0x4a3FhMFlLYUhSMGg5VnFhcXhaaklOb0NLdTlCOXk3TXEreUVhVmtnczdG?=
 =?utf-8?B?MkpvcWJCOTFPaCtCMysxWS93Lzc0VGRiNzBCVjdHaWJ4aTFOTllJNlNPOFpK?=
 =?utf-8?B?QWY3VGpSU0N0Y3ZOS0J6d1FSVlVXQ29IVmhlNkJTSWV6d0pjbzdRZW50TlNG?=
 =?utf-8?B?dDd3cGZhVlJ3ZnJjRE0yK28rMW9uY1J0eTJrVklvdkhGUUlnSk9hY1NkbUhX?=
 =?utf-8?B?SW5SK2R0Z204azVrd2pieGdTV01acitPWDR5bVVKNm5aR0VQNzlYZzhNaTZh?=
 =?utf-8?B?MTJBMDJiaTI3WkNTckswVFdsdHBkR3pxeG1vQ0RFQzFkSGw2bUNLS3ZrTUhH?=
 =?utf-8?B?NGtiVDIyN3gxTHNhSjY5K0lCeFhkZHlaUjMzR0JpRzhiK3g2UDZpc0RUaGRi?=
 =?utf-8?B?V255UC9RUHBydGNZa1hESW44RU9iU2pOZ3QyVk9KeHc1MmFlU2J3ZkRlcThE?=
 =?utf-8?B?MzN4R1Y3ejA3LzEzZU9BNGRvaU1BSm5sbWRpV295czRoNXoyOVg5c2pEUGNT?=
 =?utf-8?B?RjZvNjRTeEVpalZOWnM1Mmw2NXY4Z083RUd3Y2hUZVlvVGhaZWJlaFlMN0tv?=
 =?utf-8?B?WUpvNmliU0YyN1pQRGJ3MTJmMHQ2TUQrUUtzY0xTSG15L0h6cXlEckF1YlRS?=
 =?utf-8?B?VXc5QzZubkNYaTBwa2xyTTEyMHNEOHpDVUYyUUw1eU5lenNVdGFpc2ZreXlz?=
 =?utf-8?B?ZVUzREJDQ1UwLzFtN1M4cHFRb2R4ZmxiVDdQVVJTb2FKS0hUZHhQZkcvZTJi?=
 =?utf-8?B?dlRiUFhkcExqVzMxRk0xUGNEVzIzR3dPY05BNC9xZGZXVGMwOHhBMm8vMHBL?=
 =?utf-8?B?eldaRWhMbWIyVnZPdGU4QmtyRFNDTGk4VDNOcXN0QlVDK2x2dlgwVDFLanJ5?=
 =?utf-8?B?cnAvUnlXNzA3OUdMQlV3L0QvY21Mb2F1Zk14ektrNHJ2OGV5QVlwWkJlYW5L?=
 =?utf-8?B?dkdiL3VIU2x5OElLM3NOQ1hEQUNLS0I2dGYxVkJ1aTlqcFdKZzdCdGdVaDhm?=
 =?utf-8?B?eksyTUdyTlJCaFZaUnRWazZUam1rbUQwSnBPWWNKU0hWNEF6KzVqNGV5ZHM4?=
 =?utf-8?B?WlJ0S2dVYWcza2dYVkZydHpDRW01dnRGd1pqRG1yajlmZGZtVEZYOEN4V05V?=
 =?utf-8?B?a0xOYmRTNFdwY0RpZ0dCYld0WG5ZdGd0MFppOHVHMUdVa0NCd0VpeXhmdE15?=
 =?utf-8?B?THVKQzZZbmxBL1IxQXVTdm9ydDVaSG1mbG1vMTZZMDlLL3J5dmFXd0o4Z051?=
 =?utf-8?B?N0NFTlQwN3k2eHBzMEVhRnRyNkpmNmd1aEVObmN0ejF1bzV1bWZvd1ZiNmJa?=
 =?utf-8?B?SkVUTEdGUnZQbDBVeDVyaUI3cVlLMCszU2V1ZEFtMnBvRmJxckxHeVE0dzlN?=
 =?utf-8?B?aVR4L3ZOcjQrWkhvVTluRnpYOXpFVE9CQWV5WUVDRWJkWEU3bDJrb0wzS0NI?=
 =?utf-8?B?aTIyRkRqVHhrY3pvU2pEem5Bc2Q2Q0k3UHlLb3ZrYW90dDlOdUdMM0hXR1No?=
 =?utf-8?B?eDNhNEpQZFpuNFNoeHVMTXpxZEYzZzZWa3dvZDlKMnZHSU9sdjFWVGpOZkVu?=
 =?utf-8?B?eEZ1TGNORElpR2hnYlFObEJjUVJIcnFEM2c5dGlhaDlxRnVLbUF5QT09?=
X-Exchange-RoutingPolicyChecked: A33jZHYDUV70d27TlNkpeMzceB1f5ZqDteEFTwPOplzdjTEk357O7lilIc9NxqIqlZQDAIdAD5r6MWhHRa24LoVUbY4BotwcRU0/N2zysJe+JWSp0o8TdZqBsoDCZatWK5V775ghz+7Zfg6OCzonNCToR+wo5l6j9kGLcgmL6s/TKvpDL0aADdbSXbIZFVuBc/UIuZm+G+5vBPd8bQHy/hKD/KBuysr10LHjlySRZsuEGcTZv0dteY4+1t8FWK9o6yhqzVUWXXgROi0Hg2D3t+/tpIhVF+Hp2uRWVkxgXJU4rGqufCjkGRJkME033etS+68n2nglFd82tOZWgjBMqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 61076d80-83f5-4057-fe1b-08ded6595537
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:40:30.7182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wufgdKurtz3Fo9Osg47M4bPIYEsPEximuV8fiG+Pd2vi/8PCrBs3M5L8yPF/6ByrAgiimoFHd2q+rhfP+MtYVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFCE18D981F
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

Hi Jeevan,

On 6/29/2026 5:31 PM, Jeevan B wrote:
> Add test to validate audio works after suspend/resume on HDMI/DP
> connector.
>
> v2: Perform a single suspend/resume for all audio combinations.
>      Re-enable chamelium after suspend and separate pre-suspend
>      and post-resume validation paths for clearer failure diagnostics.
> v3: Drop commit and use igt_assert_f with explicit messages to
>      distinguish failure in audio tests.
> v4: Updated test to avoid false-pass on zero executed configs.
>      Replace post-suspend forced re-enable with connector
>      re-probe/connected checks.
> v5: Remove unused variable and add chamelium_assert_reachable check.
> v6: Skip suspend/resume subtest when pre-suspend audio validation fails,
>      and update suspend subtest descriptions.
> v7: Update fixture handles cleanup regardless of skip/assert.
>
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/chamelium/kms_chamelium_audio.c  | 158 ++++++++++++++++++++++++-
>   tests/chamelium/kms_chamelium_helper.h |   3 +
>   2 files changed, 160 insertions(+), 1 deletion(-)
>
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
> index df8d27c0c..e3c0e4b86 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -52,6 +52,12 @@
>    * SUBTEST: hdmi-audio-edid
>    * Description: Plug a connector with an EDID suitable for audio, check ALSA's
>    *              EDID-Like Data reports the correct audio parameters
> + *
> + * SUBTEST: dp-audio-after-suspend
> + * Description: Verify audio works after system suspend/resume
> + *
> + * SUBTEST: hdmi-audio-after-suspend
> + * Description: Verify audio works after system suspend/resume
>    */
>   
>   /* Playback parameters control the audio signal we synthesize and send */
> @@ -695,6 +701,66 @@ static bool check_audio_configuration(struct alsa *alsa,
>   	return true;
>   }
>   
> +static bool run_audio_test_once(chamelium_data_t *data,
> +				struct alsa *alsa,
> +				struct chamelium_port *port,
> +				snd_pcm_format_t format,
> +				int channels,
> +				int sampling_rate)
> +{
> +	struct audio_state state;
> +	bool success;
> +
> +	audio_state_init(&state, data, alsa, port, format, channels,
> +			 sampling_rate);
> +	success = test_audio_frequencies(&state);
> +	success &= test_audio_flatline(&state);
> +	audio_state_fini(&state);
> +
> +	return success;
> +}
> +
> +static bool run_audio_tests(chamelium_data_t *data,
> +			    struct alsa *alsa,
> +			    struct chamelium_port *port,
> +			    const char *audio_device)
> +{
> +	bool run = false;
> +	bool success = true;
> +	int ret, i, j;
> +	int channels, sampling_rate;
> +	snd_pcm_format_t format;
> +
> +	for (i = 0; i < test_sampling_rates_count; i++) {
> +		for (j = 0; j < test_formats_count; j++) {
> +			ret = alsa_open_output(alsa, audio_device);
> +			igt_assert_f(ret >= 0,
> +				     "Failed to open ALSA output\n");
> +
> +			format = test_formats[j];
> +			channels = PLAYBACK_CHANNELS;
> +			sampling_rate = test_sampling_rates[i];
> +
> +			if (!check_audio_configuration(alsa, format,
> +						       channels,
> +						       sampling_rate)) {
> +				alsa_close_output(alsa);
> +				continue;
> +			}
> +
> +			run = true;
> +
> +			success &= run_audio_test_once(data, alsa, port,
> +					      format, channels,
> +					      sampling_rate);
If we do need to run all the possible formats even if one of them fails, 
then IMHO we at least need an igt_info/igt_debug calling out exactly 
what format failed here?
> +
> +			alsa_close_output(alsa);
> +		}
> +	}
> +
> +	return run && success;
> +}
> +
>   static const char test_display_audio_desc[] =
>   	"Playback various audio signals with various audio formats/rates, "
>   	"capture them and check they are correct";
> @@ -762,8 +828,10 @@ static void test_display_audio(chamelium_data_t *data,
>   			sampling_rate = test_sampling_rates[i];
>   
>   			if (!check_audio_configuration(alsa, format, channels,
> -						       sampling_rate))
> +						       sampling_rate)) {
> +				alsa_close_output(alsa);
>   				continue;
> +			}
>   
>   			run = true;
>   
> @@ -789,6 +857,75 @@ static void test_display_audio(chamelium_data_t *data,
>   	free(alsa);
>   }
>   
> +static const char test_display_audio_suspend_resume_desc[] =
> +	"Verify audio works after system suspend/resume";
> +static void test_display_audio_suspend_resume(
> +				chamelium_data_t *data,
> +				struct chamelium_port *port,
> +				const char *audio_device,
> +				enum igt_custom_edid_type edid)
> +{
> +	struct alsa *alsa;
> +	igt_output_t *output;
> +	struct igt_fb fb;
> +	drmModeModeInfo *mode;
> +	drmModeConnector *connector;
> +	int fb_id;
> +
> +	igt_require(alsa_has_exclusive_access());
> +
> +	igt_require(chamelium_has_audio_support(data->chamelium,
> +						port));
> +
> +	alsa = alsa_init();
> +	igt_assert(alsa);
> +	data->audio_alsa = alsa;
> +
> +	igt_modeset_disable_all_outputs(&data->display);
> +	chamelium_reset_state(&data->display, data->chamelium,
> +			      port, data->ports,
> +			      data->port_count);
> +	output = chamelium_prepare_output(data, port, edid);
> +
> +	connector = chamelium_port_get_connector(data->chamelium,
> +						 port, false);
> +	data->audio_connector = connector;
> +	igt_assert(connector->count_modes > 0);
> +
> +	mode = &connector->modes[0];
> +
> +	fb_id = igt_create_color_pattern_fb(data->drm_fd,
> +					    mode->hdisplay,
> +					    mode->vdisplay,
> +					    DRM_FORMAT_XRGB8888,
> +					    DRM_FORMAT_MOD_LINEAR,
> +					    0, 0, 0, &fb);
> +	igt_assert(fb_id > 0);
> +	data->audio_fb = fb;
> +
> +	chamelium_enable_output(data, port, output,
> +				mode, &fb);
> +
> +	igt_skip_on_f(!run_audio_tests(data, alsa, port, audio_device),
> +		      "Audio test setup failed, skipping suspend/resume audio test\n");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
> +				      SUSPEND_TEST_NONE);
> +	chamelium_assert_reachable(data->chamelium, ONLINE_TIMEOUT);
> +
> +	/* Re-probe connector state after resume instead of forcing a re-enable. */
> +	drmModeFreeConnector(connector);
> +	connector = chamelium_port_get_connector(data->chamelium, port, true);
> +	data->audio_connector = connector;
> +	igt_assert_f(connector->connection == DRM_MODE_CONNECTED,
> +		     "Connector disconnected after suspend/resume\n");
> +	igt_assert_f(connector->count_modes > 0,
> +		     "No modes available after suspend/resume\n");
> +
> +	igt_assert_f(run_audio_tests(data, alsa, port, audio_device),
> +		     "Audio test failed after suspend\n");
> +}
> +
>   static const char test_display_audio_edid_desc[] =
>   	"Plug a connector with an EDID suitable for audio, check ALSA's "
>   	"EDID-Like Data reports the correct audio parameters";
> @@ -854,6 +991,9 @@ int igt_main()
>   
>   	igt_fixture() {
>   		chamelium_init_test(&data);
> +		data.audio_alsa = NULL;
> +		data.audio_connector = NULL;
> +		data.audio_fb.fb_id = 0;
>   	}
>   
>   	igt_describe("DisplayPort tests");
> @@ -866,6 +1006,11 @@ int igt_main()
>   	connector_subtest("dp-audio-edid", DisplayPort, &data, test_display_audio_edid,
>   			  IGT_CUSTOM_EDID_DP_AUDIO);
>   
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("dp-audio-after-suspend", DisplayPort, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_DP_AUDIO);
> +
>   	igt_describe("HDMI tests");
>   
>   	igt_describe(test_display_audio_desc);
> @@ -876,7 +1021,18 @@ int igt_main()
>   	connector_subtest("hdmi-audio-edid", HDMIA, &data, test_display_audio_edid,
>   			  IGT_CUSTOM_EDID_HDMI_AUDIO);
>   
> +	igt_describe(test_display_audio_suspend_resume_desc);
> +	connector_subtest("hdmi-audio-after-suspend", HDMIA, &data,
> +			  test_display_audio_suspend_resume,
> +			  "HDMI", IGT_CUSTOM_EDID_HDMI_AUDIO);
> +
>   	igt_fixture() {
> +		if (data.audio_fb.fb_id)

This check is redundant and already checked inside igt_remove_fb. Please 
remove this.

With the the above 2 updated, patch LGTM.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> +			igt_remove_fb(data.drm_fd, &data.audio_fb);
> +		if (data.audio_connector)
> +			drmModeFreeConnector(data.audio_connector);
> +		free(data.audio_alsa);
> +
>   		igt_display_fini(&data.display);
>   		drm_close_driver(data.drm_fd);
>   	}
> diff --git a/tests/chamelium/kms_chamelium_helper.h b/tests/chamelium/kms_chamelium_helper.h
> index 606079666..65c6067db 100644
> --- a/tests/chamelium/kms_chamelium_helper.h
> +++ b/tests/chamelium/kms_chamelium_helper.h
> @@ -81,6 +81,9 @@ typedef struct {
>   	int drm_fd;
>   
>   	struct chamelium_edid *edids[IGT_CUSTOM_EDID_COUNT];
> +	struct alsa *audio_alsa;
> +	struct igt_fb audio_fb;
> +	drmModeConnector *audio_connector;
>   } chamelium_data_t;
>   
>   void chamelium_init_test(chamelium_data_t *data);
