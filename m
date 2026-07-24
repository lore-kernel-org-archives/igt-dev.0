Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D8EC531F9
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jul 2026 08:14:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB2E310F33E;
	Fri, 24 Jul 2026 08:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JED1TLCw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FAE10F33E
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2026 08:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784880838; x=1816416838;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SZjGf6lL14gQJfGx0/j3zMKHwXgcaGoMuX0jpSAb3K0=;
 b=JED1TLCwc5FdU/IZyyjXEOukKnz+L3OH1fiXxpdon8gzf++ftDhiCV/o
 5m7x9ZeY2r0MlLN2pFGpG8lvZh8v5VM5gzDvCcOJNw3idr7Ec1UocB1Uv
 SBckrHURIzC0YytjB+yTuljgamMwo9rzQaS8xF5GVkkeQqiUJgsHonqkZ
 dLyn1y/AJWpzGF5iuyO3vwdLeTQY0tlsfnrYgiVhpnq9QPRwteJi31Oep
 b8qRLMLAh4uXHgCCRHb3IrheUhoc1G8e7+JDI7yqHgkMaetDYOo1z6Znz
 0eKKXSbWkiy466b3oesAVX475XHG2+l0xg4G/gkw9plrHukKV0b/eylsv Q==;
X-CSE-ConnectionGUID: STpHKiuYSquTNF9IZ3zzkg==
X-CSE-MsgGUID: MQeUk+WHTyWmC9T1/dthsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="73087044"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="73087044"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:13:57 -0700
X-CSE-ConnectionGUID: E1xpTWHYTBqWhQRA15lzyg==
X-CSE-MsgGUID: FKP5RkqUTU6wKzkFbqmcnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; d="scan'208";a="283148295"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2026 01:13:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 01:13:57 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Fri, 24 Jul 2026 01:13:57 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.43) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 24 Jul 2026 01:13:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3l6mK/cQ5Pj4wrnqx1jno3kQWlbGV1TiVETsGLYgPxanLvUCdDCcyVM8nIPFEjIhfCrYa86851z80CBOGdf2wsKmE+b700sHi4dmUQFYDmB7lE31kyZiyNthGdCaaT29LxrlWpaa0cPlFLm3idHfBpkOTJFUw2ZWTVZojLS7/qpEi4gP5g2X9W7s0Ewr7FiKeJgX1uzlwnrpkh6qr9mw8eUOAsS0kGAuUv4rS8i0zNwWj8WIELMgzYoPjfPPkoGSCDqq47ihNuA0VMd/HRzt2jA/1iZdmS51c42mOGGRgD4bWy/gZqlDS+sDArdLzM1otWAY9rYJloxjGc3/zaaXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M5jEHuNoz9VDfWoV7CYeSdDQrD86y1s30OKy7IOtzBk=;
 b=N3PIKB0cU+Xjw2EosGT9LRqz3lC0ecE9wUP2cVnYfN7YOs9+Q2O5On+yufxyKNEvO75wX2rXroVYHJZuP/HUylHuBzj6z5moFjAr7Wzj2v47mDhQNAugx9rjPQiJVF6fB3n0PnBzUGH0B5SXtXRnuIKPmabZ+/R49ka5j8p7kF0UJ0z7kxgPy3vDl9C8BDNwsMwWrKDIJSjR/ANGEDlztp1HTHop3/K+tsum2U7nFDdUYKR+SKzGP41oOfWuMFlYcM495RY1LfiZQpq7md9GFi8fpN4IqNgsF4DlK3muiaOTPkS4HaAzDWwWdQnqacAJumNfsxA/ytX40QrLLdlu8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SAWPR11MB9900.namprd11.prod.outlook.com (2603:10b6:806:54d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 08:13:50 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 08:13:50 +0000
Message-ID: <fdcb1eac-5f9d-4f27-ae69-d679f350be02@intel.com>
Date: Fri, 24 Jul 2026 13:43:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] intel-ci: Block kms_setmode@basic-no-cpu-idle
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Swati Sharma <swati2.sharma@intel.com>
References: <20260723141109.174083-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260723141109.174083-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SAWPR11MB9900:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a42558-031d-4bfc-c25c-08dee95b7e48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|42112799006|1800799024|366016|376014|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GOUlHclmtYgMmhyOxE5Puk0m12bvXwBw/ALgTQJTd5ZZjqBgXRf0PpOa9EnI+wVWGPoYNrl2sPEmyDApvELhK1J4qiyM/qVKEdqd6/D1lbi1dLY9W9JBvfrj9/noh7ntaEw222y9p77oaamLDFVEc6I/bNb9UI69XqZ+LzYiWZi1MzrhbVTf4pV99CoasHXatb/oc70afPnxGfAEzpnMdF9jt2wTRPeSo4Ql87R5vZuXvy3bo6VypPy/jf835rUCTeJ0iK7jMOdHAQKy6AjsL/TAA5UBOpihR5SGgJhoCjv6taYbrKitTfVlL1fuG63n2LalMfG/gUBxCkj3w20vTs8UF5vUJVGLPhbLLQ6NIDjRglQWMAdPTtwN1P7pbPPFLNayldI9p4st0cbh23eQ0CqVjs3GPC7KhRcSjBg4xQ1M2npUJZsL2BehRsfQtTROqxJPwu3SfvnDEM24Lhu81WXYfNdZuAG9HiwszhwPY59S8aLghQ/Fi+B7f1aKM8v8dQSBGilnhZ+Ex7coPDksrn2o8wPvvUcfXwJYkJiVGv0Dy1bOzmOba7Ojw3p6yCZ5q2FkIkkfldT39feWgBTsR8Ole73pzriPtUrts0c3/nsY+V9eA11u0yf1PuWsBEeO0a4HrC8ur4h8kDn9836sKBlRM+iHTsw6prGC8m+QX24=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(42112799006)(1800799024)(366016)(376014)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFRjblVDMm1uRG1pS3Mva2ZRTTYyaVhaYVYxNUJBS3dLQTI0QXFQeXdrMGFY?=
 =?utf-8?B?K2Ric1dNVEZyTGVGOEJmenA5RVlvRUJJNnNBMkVXNHdBZXhLNHU3eDVGUGZZ?=
 =?utf-8?B?VU5HdjZWbUQrK3Nib0ZtdGhidmNhcWltL01GWUJjWnB5cW54dWJGREdCQnNH?=
 =?utf-8?B?enNJcGc5OFFxanlVd2dGZkF5UWJ4Yi85ZzRudW5BYmxBeS9pUUhTQ0JwZ0N4?=
 =?utf-8?B?QXpuaHZ6KzVlaWN3ZkpqckhCVC9TM3hkdlpoVUs3V3BCVHIzUWU1STdVV3ZH?=
 =?utf-8?B?emtWaGpJUmVOK0VnNTdVeEpQL1lMYmQ1QytORDlIMEF5L3pxN1M4VXZBYjlx?=
 =?utf-8?B?Z3E0amNhREU5alZ0UTZWWGhEWmZiRXFiVTVoQ2hSVlh0Q1hSM0k3dFhjUTd0?=
 =?utf-8?B?YU9CODRMOEN5RmRRNGRmSU0reEhKRFcvbGgwZXVmb0RSZ3A2akZhZm50Yy9X?=
 =?utf-8?B?QzQ1QkViSVFydEdCSlJtWERnTTcydlJHYWxFaytxVnlmSWNtaW1mVXBoQTlp?=
 =?utf-8?B?akxLYm50SElUcTFyeE9wdkZsbjJJSkxaaXdTVEI2a0M2SW5QR3ZmT3ZIRkxt?=
 =?utf-8?B?eTZMSUw0ODdsQ3N2ZWt6enlCanZPMEhUQ3lrSnlJQzNwZUFxbXd0UTgxT0RV?=
 =?utf-8?B?NGNneFR5NWVEb0I3RllPMnMrZFoyT0hFOEJsVWFvVTYrakFLdGdPL01TcitV?=
 =?utf-8?B?VHl6ZjVCSjFVR25JQXdCU216ZWV6UEZodHFDTFpCTytEbGVtR3FZaHNNTHNq?=
 =?utf-8?B?elFVZnErWktpQnNCQy9FcU85MHArY05xNmJyeENzbndMb2ZtSDRPN3dxN2lu?=
 =?utf-8?B?L2I5ajE5elFpZjBMMzZBRWtQVmNTVXJhTEtxdGFsbTFTb0ExTXQ1K0JSck5l?=
 =?utf-8?B?bE11TnVaajkrb1ViYkNmN2NSdlQ3UmxBL1orTmJkbFJnWWZiakIvTVpINEp0?=
 =?utf-8?B?SXZvR0RWeVhhZ0RRQmk1WnNwb2ZnRUlhK2dEMUR1ejB1Wkk2YTVTdmNkVHYx?=
 =?utf-8?B?cEpoV2NVNno3dldiYVFyTk1sVTBWUTNZRzh3c2JwTUFDRnd0cjlVQm1URDE4?=
 =?utf-8?B?VXp5ZDYvSHowWVBQM2Q2RGwrM01BWVpJUFJOcFJSbW00Yk5hY0VWUXArZE9n?=
 =?utf-8?B?OGtOdGU3WGxJT0VKdUJaTjk2ay9wMnA3SlprUWVOOGJLelBuZFJhYzMrTSs4?=
 =?utf-8?B?L3BLTmtNYkg3WlFXakhxYlNyd08zd1RGWDJqVk1kY3l6TExGcEJNVWlQamgz?=
 =?utf-8?B?cnZhSGdxRFIrMmtNMFFzUVV3RnhwRmJiOC9EOExwY2o5bGg1RzJwNlRsZkQ2?=
 =?utf-8?B?SGp6RFNuTE1aUHVNUGxFN2htVFk5Q3NMQXB6ZnAyNFhYM1V1bno3VDVYd2RD?=
 =?utf-8?B?Uyt1SzRuUWNWNlJqS3hqdGNCVjJHdWNWRW1INENmMTdLZTcxWkl5VURIU1NK?=
 =?utf-8?B?SVdwbm1JcEVzdFYxWnVtRWdvTkt3TkFOTjIySTJURUIyQ2lMb2tLdTEycUlo?=
 =?utf-8?B?Tno3WWNjMVpPcjMxaDBlYWg3L0k0UW9SWE1kckFsczNLQjB3NkV5QytTVDZ3?=
 =?utf-8?B?bEtwYi91RkhGTjlIdURiTmlpSGZodEVhZUNBUTVBQTJ2NFZLU1ppS3c0eHpH?=
 =?utf-8?B?b2FiYUV3ZVNFK1lxcld0cHBCU0FTQm5UTnR1SXFLRERCTUUwclFMdnhOR0gr?=
 =?utf-8?B?UlpzVkR3aWZuaWpubktKQkhBNk44NjBRa0kwUitCVWY4dG93SWJzOVJYdUJV?=
 =?utf-8?B?WmtCRWJuNTd6bFBuL2ptMHJ6N05KU295RjFjQ3RCRkhiUm1xRnlIL0V2Q0Rs?=
 =?utf-8?B?VUJEOUVJMFRQdDdjMU0xUWlHc0srUWtrQVR1ZDdLbmxEWFV3b2ZMalhlRENN?=
 =?utf-8?B?eUZCM09SdDNPdmd5K2RiTG9BVVA5S29HWXEybWZYcTlNTFVzeTdFb3hDMS9s?=
 =?utf-8?B?elNXdi9BM25ZSXNzZXZXaDFkbDdRMTllL3BYNXpZM05ld1R2MWJUemJqUEd3?=
 =?utf-8?B?ajhHbk1LVE5NZEJ3YjE5Vy9GRGJHK1N2TGNpUFBuSzdOdFlBdWRMRStuQ2cw?=
 =?utf-8?B?L1FqQjRqRUFXYWJMZ0RrRERLQ3BkbUNoUXNzcDlGbjRha2JjL0RMYWkvL0o5?=
 =?utf-8?B?dWF5Qjd3bTd2c3pVRUdOcUdQWnlLdTBQWW8wWVlrdlBLTVYrNnE4LzdMbmEy?=
 =?utf-8?B?djFJTzFjWEFhbUI2bzBuRWV4K094SVJVb3RKbThLV0pkMGhZRkpURm43djZE?=
 =?utf-8?B?K2RpRzUrNHh1UVdRZzc3NXZGRVVmQ1dqQmNOeEFLRm5GT1lqbDRYWWt1S0NV?=
 =?utf-8?B?WjhEV2xCNXV6dzdwZmVLYkYwa2xUTTNUZVlzYS9ZUGtCSmxLelBhUT09?=
X-Exchange-RoutingPolicyChecked: NLlwfUkaKE9fI7D7qoMtG9WytK15/wgGFkYWx3oqQuo7bxUYRHwPAJbqPyGLjqWINRCyqwDRqwmlf3BtujPjKI9dr8eechTanoaMQcdySEezkXuAIqHLvEAA3fObKxj9FD43u3+K7x4gfYSk/LkrAvc23IsMgQ3g8/ckXgBtnxXtevxZOHrMSDRAqCrf5hYKvtZiyvM4VlnLUSgqKPo7ai5oRV60VNgjBLsigCF7uz9hKIs80RsXYXFstM3ZSMx8daTxhb50HWxoeaBelxhImfmH4u3yFa+PqMSTbc10Q+F9f/Wo5YbbOjSufgsuaAb05CC+uEETTZiyLdRLMtqxxA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a42558-031d-4bfc-c25c-08dee95b7e48
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 08:13:50.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vrZDCk0yBiXALjKaDXjP6ehq3X4RsffeVBT6/eeZK4Ou3VWNTlUuWQW8qeZfO3IE6ZSvOIMX/7A3GzJWRuCGUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR11MB9900
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


On 7/23/2026 7:41 PM, Kamil Konieczny wrote:
> Test kms_setmode@basic-no-cpu-idle has the same behaviour as
> @basic on Intel, so add it to both i915 blocklist and Xe
> display blocklists.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel-ci/i915.blocklist.txt           | 4 ++++
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.lnl.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.nvl.display.blocklist.txt | 4 ++++
>   tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ++++
>   5 files changed, 20 insertions(+)
>
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
> index 6ab955fda..bfb1e6b5a 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -213,3 +213,7 @@ igt@kms_flip_scaled_crc@.*linear-reflect-x
>   igt@kms_pm_dc@dc3co-.*
>   igt@kms_vrr@lobf-dc3co
>   ##################################################################
> +# Valid skip :- Same as @basic on Intel hardware
> +##################################################################
> +igt@kms_setmode@basic-no-cpu-idle
> +##################################################################
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index 3e30e5772..9259d1aaa 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -143,6 +143,10 @@ igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(atomic|legacy|varying-size)
>   ##########################################
>   igt@kms_setmode@basic-clone-single-crtc
>   ##########################################
> +# Valid skip :- Same as @basic on Intel hardware
> +##########################################
> +igt@kms_setmode@basic-no-cpu-idle
> +##########################################
>   # Valid skip :- Connector uses CRTC that is incompatible
>   #		with the connector
>   ##########################################
> diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
> index 7462294aa..e5151c33c 100644
> --- a/tests/intel-ci/xe.lnl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
> @@ -124,6 +124,10 @@ igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
>   ##########################################
>   igt@kms_setmode@basic-clone-single-crtc
>   ##########################################
> +# Valid skip :- Same as @basic on Intel hardware
> +##########################################
> +igt@kms_setmode@basic-no-cpu-idle
> +##########################################
>   # Valid skip :- Connector uses CRTC that is incompatible
>   #               with the connector
>   ##########################################
> diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
> index d44c4030f..c57766ce2 100644
> --- a/tests/intel-ci/xe.nvl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
> @@ -41,6 +41,10 @@ igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
>   ##############################################################################
>   igt@kms_setmode@basic-clone-single-crtc
>   ##############################################################################
> +# Valid skip :- Same as @basic on Intel hardware
> +##############################################################################
> +igt@kms_setmode@basic-no-cpu-idle
> +##############################################################################
>   # Valid skip: Connector uses CRTC that is incompatible
>   # with the connector
>   ##############################################################################
> diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
> index c46312d1e..7ec8d434c 100644
> --- a/tests/intel-ci/xe.ptl.display.blocklist.txt
> +++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
> @@ -50,6 +50,10 @@ igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
>   ##############################################################################
>   igt@kms_setmode@basic-clone-single-crtc
>   ##############################################################################
> +# Valid skip :- Same as @basic on Intel hardware
> +##############################################################################
> +igt@kms_setmode@basic-no-cpu-idle
> +##############################################################################
>   # Valid skip: Connector uses CRTC that is incompatible
>   # with the connector
>   ##############################################################################
