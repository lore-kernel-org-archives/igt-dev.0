Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0544DCD6E56
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 11:04:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED4D1131BC;
	Mon,  1 Jun 2026 11:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j8PtLYvs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8971131DE
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 11:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780311851; x=1811847851;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=bLIK9miXsgd2A7Ax3+n9ebctHcNTDcQqDYIRf2NJnCo=;
 b=j8PtLYvsAj6BTApkhoXa5qImMQJwnwyaartTtm8JOpPgHOPJ0pzG8IM9
 qVZEiZENFgwmkYrsDOez9rA4vdrWV1N/SfbDCiLfPKbw1IH3/WlJeCbBP
 xEhPZSfqhA0eZjJ2hBiduXulYFDkp7YdstuEplh51LBCy2OdpR+TBEwCf
 0b4CQ3iDXRTQn9LkbAwagNs4xv8Ioa/Xw8W+CJ5aNJqFTZmdlMrdukjWO
 4W5OdPC/t2UdylMs10G6kw74AD+a+wULe6ufUfgxBc+5y+HocTrZnl5jP
 afUCya7GBLqxaDNBs/s1a0C97kXWAKSRO0Ebf+V7rTTghcYWBXzV6CBvb w==;
X-CSE-ConnectionGUID: JiMxRBn2T5udTq8MM4fz3A==
X-CSE-MsgGUID: y0/vEWBES/WPKqs+YG7MmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="80100034"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="80100034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 04:04:10 -0700
X-CSE-ConnectionGUID: 6vodwaNHRIOZeRior7XmWQ==
X-CSE-MsgGUID: R0dIoY19Tp2p011e6GERww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; d="scan'208";a="241029573"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2026 04:04:10 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 04:04:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 1 Jun 2026 04:04:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 1 Jun 2026 04:04:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFa7GYiTR6FxQmd9kG/kc4X5evmKQKuU3N9elnClg//d1zZBciC6LOg3+JCt+F6vRU35g0VBrxW64YcUDpl8x8PGZgT9ypMp4XX7CcPB/iF3U0x+j0TsyvveQWFQQN2Xj5ZDIKM0Ch7tpeo72vCzNm/NLGVOjNtfuPOgwUglxrOJpcumJ2pB4bkylj8uoLiiSTGUrIo68ChG+CGbbASJEaZOnr/8W57u6Tj3MCbgxP5Dg7oyuRgaZafnpLlYr2TRom3g3zjDxCLGJfA+MbVLar8qOZg1kgOQRVANLiZyXGRwCeuXjm7frew+KgT4eFSGK2QkmT8IQR9QSwDvX30PCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SaJbU3vnIBBxBcbDdwY6a/RN0/AHmxAdvJVtRHwoWY=;
 b=RzMk1LcmaqL0hyQaM7XFhtJeIOam9ad+zLlm7smodcvYr78pBvbR+weC4RXWSZFKefkMJIdP3+JgQpQ/ax0RbdIdkyNkzPO4upMrewAhCcDPmS5OssZ6IezPQohjrhR/RmXLHF9YvJ7y10ID9FrkZfgD/KORubCPE7FqZdcB1Ck9dthR+R53HB/cHuJD6q9HOHdww8ehzXxD1LNSAtLOS5HvgDxY0Kvo9ZSzRqiE7QGde+C+6E4+yHkVDmlqWjJdD4smCDflNAjTtZUsgSuVgeO+U6x3GXpqXT9Fk5FdRYxfg4gv1axBjBRXXLIYyKXRF915ges3d54DXoz4QCWHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB6897.namprd11.prod.outlook.com (2603:10b6:806:2a5::11)
 by IA4PR11MB8913.namprd11.prod.outlook.com (2603:10b6:208:565::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 11:04:07 +0000
Received: from SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833]) by SN7PR11MB6897.namprd11.prod.outlook.com
 ([fe80::16b1:b7d2:4f56:1833%4]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 11:04:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 1 Jun 2026 13:04:08 +0200
Message-ID: <DIXNVODLU6P4.1NBSJFQ90R8CZ@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH i-g-t] tests/intel: Add current IGT PID to driver options
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Karas <krzysztof.karas@intel.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.21.0
References: <20260528055957.2876648-1-krzysztof.karas@intel.com>
In-Reply-To: <20260528055957.2876648-1-krzysztof.karas@intel.com>
X-ClientProxiedBy: DB8PR06CA0046.eurprd06.prod.outlook.com
 (2603:10a6:10:120::20) To PH7PR11MB6908.namprd11.prod.outlook.com
 (2603:10b6:510:204::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6897:EE_|IA4PR11MB8913:EE_
X-MS-Office365-Filtering-Correlation-Id: 81e91ed7-2f8a-4cce-ddc1-08debfcd7f88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: oI+3em38vVCiokmYM+lrwKHTSi4YCjk769mJOK0WBWnKknOAC0gqDDhC6jPr/ltQJR386xjpbe55gOLPc34nP8hZXtTuQlub/F8XKN88gL9XvfAPFYdeKyuxzswOQtm/huvqlEw/m9zuGnMvnbl61rKeMr38oJq1nAuKlcRjNNKBBXlN9RFs8Vgc7VWbvygis/2KU2yzBcl1tKriPv+IhSKKWjd+BmBTeSN8B87XVCw2PphL9xAZ0PI6mDede4+i3L8aArCca9ScLBRMhByC7zTHFT2fWniKudAQ8LZ9g4AHtrg/HDMJTQnE51P9o1hTmXFGLsyo1/6MUwNvWVbyKxLAt6GVxoZP8aAo5TBpa2dqWqpYYV2h7E+eZxqBBCN02umpRaTKJWJEqMGsfhDJGWxdx/kWY244yNcS0wXxeoES7L8omlw/YPDUrWBr4v1fQSbbWfse6qHDX4Y918BgyZWhg2M536tU6fkx/+7ZFzDBiBX6JBqhgTcSYJnQ/kdztsp6M0K925VVdZUbkwdSy3JR6k6XJfluI7P0bZ96suCAFom4XRDccXKZGZMJNjU42al1oApMhrdkSY+NoJ4G+JCLAwrKUOWuuk1LRIj1ugKbCL5A1tQEuvNbTpML4Z5AUtCcN5eWMpqC3lNremneuX+im35NPL+3Nq/16H9QIP2X7CWSEcixNg4vZ8KL7sQ+h2G1QuLmF2R6D6YQTVlAeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB6897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnQvQnZYM1RwRXovQWlucTFOYlVJbGh4cW94VVh5NWtUSFBxQStPMmI4OXBq?=
 =?utf-8?B?dGxodVFnWG40MlZHdTV4TzBPTE5KMVV0YkF2K25Kcm0ranI3ZEJmQ1dQRzFM?=
 =?utf-8?B?L1k0Y3UwTmJMYU1JYUVERDRNbnJnVUw5bHRPQmJCS0FtMFluTzI3cUw0d3J4?=
 =?utf-8?B?dEszN1ZZdG9TUkJhTDJ0dE1GWHc5VzhNTWVJWjh5RnVGYTVnVzVTZmtScEY3?=
 =?utf-8?B?K0ZJSXpGYzloNkdHZm4yVXl6cUR1N0lJWFBvUTRmbEYzaENQbWl6MGFwSVZo?=
 =?utf-8?B?QUF1bC9XcUQyK0ZydnlBekFxdFdxcmlkcEZIUmRvejVXMndJRTJEaGljakxp?=
 =?utf-8?B?aURGZnZtaXNLekxMY2V1MnhLNFJpSFNSd1JWUzlXWTBCRmZvc0ViWHRNT1JM?=
 =?utf-8?B?bWl4THF3bDBITVF2WmowTS9iYkhhdWdMM0NXbXZYdlFpVE81ZndOTUVFcWI4?=
 =?utf-8?B?MHJqdFJCa3c3MmpZck0veXh5Tkt4U2MrcXhxckpPSGxRV1ZKZ2UyTm92NXFh?=
 =?utf-8?B?cFh1cGgvNlAxZ0ozcENIenpLYml0dTkyeXY0S2djb0tjMU9OYXBOOXg1SS9a?=
 =?utf-8?B?WlV1Ym4wenQxVDZhQ0JpczNDTGUzTUduSFNRMXVtTXltS3psRlErREcvbFZj?=
 =?utf-8?B?YTdaNGdHTE9laFVLdHNhWC9ZWUhmK2xCL2ZyenRUTVR0anFmMURRQmVjWnVM?=
 =?utf-8?B?UGRMTXYrdHl4dlI5OWhVd1huWGh5b3VubXp6ZzQxcUViYXErV0lKTEYzdmRF?=
 =?utf-8?B?b1hPSFhIaldtenlVZFcvSk9Lc2FWbk1pSkczd2dVaGhEY3hYdFVsbFRycDYr?=
 =?utf-8?B?Qmp3YWRqd1p0cFVPYjA5U3NGM2hjMkFtRXBLaVQzUHZ2d1BZOEp4OFZEQ2dM?=
 =?utf-8?B?aEVQUllVMkNKakI3N0J2YWpiN2M5UUd5NHZOVTB0VVBZOTZET2c2TXJxeTQx?=
 =?utf-8?B?Ymd0UGFHMVk0eHZOZFN2cjlEbUo2TU9KVmVZL05MdEV2S2JXeVVWSTZOK0FJ?=
 =?utf-8?B?SW9BYnRLQnVudytQa2IrN25JTFQwYkdNZk9vZnNLMDZVWGx0WW8rR2paRFZV?=
 =?utf-8?B?b0F6N3lsNlBZMWcxL0NuaXBvTDBXbnl6TllTa1dLbEg4VVNGR3lLeFVrQmJT?=
 =?utf-8?B?dzRnb04zWGc0Q2wyZmEzMjdWVEZLeDBKbmNwd1czS3NBV2pYKzBmdXRpR1p1?=
 =?utf-8?B?cFZnKzI2ekZUaGQxVlBwVTcxekZGLytJQWxpdVJIemJuZGlGMUpqdkliS0hF?=
 =?utf-8?B?K0pZQk9ET1FqeStadXpoR2VrRWxYcjVIbVpXRjdYblBGcFYwZVF6NVJnVFVn?=
 =?utf-8?B?UFA1T1YrVEFhVERqWWxPUFVrOTlQbVdxL1JHR1hSWWNKaVVVQVR2RDVleFhS?=
 =?utf-8?B?cXQ2YjhyMkJyRkhIODQ4Z3hidWJ3eHp3RFRWTmJrUkkzdGpmS1gwL3NSSVFN?=
 =?utf-8?B?RlVpbllZZ0E1WVFQNzZIQVBnb2JRY3VITWVKS2pucUJQRkMrR2lnaS8yU0wz?=
 =?utf-8?B?NU5QSVAzVEczaUZ3SHBINm5NcFBTbHUyNS9QbkpNMkJ5clFleGwwUjFyWTBv?=
 =?utf-8?B?cEZFZ2NwVTFxejFSaHcrSjdlWXpDd1FsZ3BTYVg0cWIwZUFyMDRxdlpvMlE0?=
 =?utf-8?B?aTJzYkdFelV4WHhqUjk4T3R1NGpwN1YvVFVnUjJoMU5TY0VYSVc1L0NSeEhE?=
 =?utf-8?B?WGhPZUJzakt2YW5wazh0N1V3Z3RqUlMvTjhWWU5pcEZsOU1RSm9mckgvYjVk?=
 =?utf-8?B?b1VENGpoU2pGdFozYmYzVjROejRRQlovVnVIY3VmQzBqb1pSZ0RJSG51dEk4?=
 =?utf-8?B?MWJpYXBsbXFnVE9VbVk2QW0zbTQ2SFRDKy9CNmdhREJYa2tqNk9TV1d1KzBj?=
 =?utf-8?B?Sm1UNUZxN3VWVnZYRFlUYk5TYVRLeWNPMlVJcW1YaXpLazMvN1cwalV1SEFv?=
 =?utf-8?B?OGZEQWRQalZOZ0tnOE1FQXJDeVJHUDdUeXVGSHp2QmJzTFRxOEVQU3BNVEZD?=
 =?utf-8?B?YjlqTTk1NDB2R05Ob2Nqc3RUbU9rQ1FkVkJnWFdNenhXRzhMUDdBUUE0OW5p?=
 =?utf-8?B?NXcreEF5aUZIN1VhSWdEMG9xcExvM1NvcmszSmxTT2xwa3Myckg0eWQzSkc4?=
 =?utf-8?B?M3BuT1pKeEY2REtVQTBTQmtQdEFTdmdqWXJiNTg2NUZyRTdldzJGSENrN3NQ?=
 =?utf-8?B?TWZaQndTd2hNZ2pJbkZVS0VwYTVqYzdpMFlSUjlRbWdLUXFTczJmcy83NnlY?=
 =?utf-8?B?eEJVTndIbldqME9hSTRCV2FkVkdvZjk2eVNvTm8veDFaVk5qWkRaTDU4WTdh?=
 =?utf-8?B?MzJqdGNZMy84RUlWZWxyQlp2Y0IzcUYzL1k1OXpYb2tiZGgwMzhiR2F6dUtL?=
 =?utf-8?Q?vd4+Q6MU6RnGdKEg=3D?=
X-Exchange-RoutingPolicyChecked: XBlrvcJWikYR7AnHD7LJLN4s/jQOh60c311U2qBtbJWN+a/1NxAptgEj7w+zpULb8RTiEdvWuCX95iM+RfyRPs1ZsKiddwARSCIWQj+ywwyMMcBPKaTQcvWpWJvphNBhuqqvM/7J4FO5Xm2VCVthfCgj1bPSQF/tCp8WDBS2RsSoBd7O85pb2CfUyaN9ZoMjnOiqeUSBRSlEnqY6bDfty2XkATGN77NVmBP4rMQ6oXFaYbyZKHMrTSW22HlFY60+GQiRuBivmBPZP95FlYw+FEVEXuBaslY94jubfSNttKcfePW4dZIzMw2YbF5xTMH4GCjFujzQLN33ryShHT+T0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e91ed7-2f8a-4cce-ddc1-08debfcd7f88
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 11:04:07.0469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueAKQtOIRprGbcSYI2sEHJVK61MfN3AHoP+pojey9cZhgIzpaUaNTevyGZr38dirWabTox4zbSjtfgFnpdQg/wSPylRRgctDxWREK9usKiU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8913
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

Hi Krszysztof,

On Thu May 28, 2026 at 7:59 AM CEST, Krzysztof Karas wrote:
> i915 mmap selftests lack trusted address space in userspace,
> so use a driver parameter to pass IGT process's PID to borrow
> memory from for mapping. This will help to restore test
> coverage, which was temporarily limited when following series
> on kernel side was merged:
> e8c3344765aa ("drm/i915/selftests: Prevent userspace mapping invalidation=
")
> 82eb94b1fa13 ("drm/i915/selftests: Run vma tests only if current->mm is p=
resent")
>
> Signed-off-by: Krzysztof Karas <krzysztof.karas@intel.com>
> ---
>  tests/intel/i915_selftest.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/i915_selftest.c b/tests/intel/i915_selftest.c
> index 6972de64c..1a8385883 100644
> --- a/tests/intel/i915_selftest.c
> +++ b/tests/intel/i915_selftest.c
> @@ -649,8 +649,8 @@ int igt_main()
>  	igt_kselftests("i915", opts, NULL, "mock", NULL);
> =20
>  	igt_assert(snprintf(opts, sizeof(opts),
> -			    "live_selftests=3D-1 disable_display=3D1 st_filter=3D%s",
> -			    env) < sizeof(opts));
> +			    "live_selftests=3D-1 disable_display=3D1 st_filter=3D%s st_usersp=
ace_pid=3D%d",
> +			    env, getpid()) < sizeof(opts));
>  	igt_kselftests("i915", opts, "live_selftests", "live", NULL);
> =20
>  	igt_assert(snprintf(opts, sizeof(opts),
LGTM
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>


--=20
Best regards,
Sebastian

