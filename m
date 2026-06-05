Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C09CD6E74
	for <igt-dev@archiver.kernel.org>; Fri,  5 Jun 2026 04:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C6111A421;
	Fri,  5 Jun 2026 04:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TaAI5t9M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF5D11A421
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jun 2026 04:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780632761; x=1812168761;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fYgCb6OEN4FM7ls/M5oYDNLaZnKMcCH97F3OuBlz/2Y=;
 b=TaAI5t9MnF9Rp9SjJz/wVTrvzvHwLPGtPT3bDN5Y6MV2Gy6sR4QIQ0eX
 /V5d7NrB1ISlwTeHDjTEgiEsFqQ/o/eauhMoePaExhsJSH2H/ssqv/nnm
 /XpxwqJ9qBPvk3rNV52Db28QrYziFtOcmyWjsfn1rw75HfQSSHEe1IlgP
 22sgieYEW9tQGU+bjDXTyXQBywSAVhS+v0L28qKshDBxOXu4EYq7WA97P
 7rjkMLShAF+MJ59+1K+UrLWSUN1Kgj5bw43uIQs6/XPGB0vFdUS8mwyBb
 Y4Sz00kkntdc5pphSKTYMhn/x5UNgTiEu7HoTgjYz5z+kAYM7rJtjYzFD Q==;
X-CSE-ConnectionGUID: jAp446DLQzi1jPQhVZblMA==
X-CSE-MsgGUID: 6XSgT9D2Twaf0pW0mQU7jQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81498729"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81498729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 21:12:41 -0700
X-CSE-ConnectionGUID: wxWbyNSdTWKhqtoqn+YRjQ==
X-CSE-MsgGUID: nSoXY07oSEqXFoW2pKnvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="249066634"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 21:12:41 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 21:12:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 21:12:40 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 21:12:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttDxSnh8E1sA/PhfIJhPyZe0alXdazxfPvLiiQaOSDIDmSnUpNbH2f2ym9GlUP057G7qhhsBwMRjvGRirTFTYgx84DhnwsafEkTi6mRH0taaj0tOgJ8ipU+vMAMbJoo3d3pQiV6sjwmcMj7wSl/qtQ74Z5QFimF8+PFbiGRe7exWJMe4SB6ZZ+z5KGPnN0VvqOiYuZp2e3OYZJJhxdPI2x4k3/zLMqri+JruYlXzockmD+GDsxZk1o6YvK9KoEP7K8GSrq9e9sd7NW0Vt0ohgkyrNHC0wPrp1wx7a4NnEmN1FwYbM+D5+sZBxtYY7u8kGT7LmU1ZaGzziY227gcgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B8cWkqGSUTN6kloUVmf/T0sdvLuReB+EOWYsRrpFwBI=;
 b=ih5F11BGXyki6Xo0YqD8RJTEQIp41mgHhqlDl4QyglP1LqlC3omSgWWIYPOVzdMByutn/oHo/oBoiNYF2JgzBYIGtxiQ8iUrPsLK8oAoFjhvFun0uZsrzzKZZnopZ66Vl1L6TWpHs8GFmRs57b1XM4EkjGx0o4jV/jugkhkbvtPwcTeT5mGigHj+pIdGMZD8pxxBm4pJYJdKrDqjUMFSphXIosiOwRSnbQIn7UinBuEt0YSKt2HbGChc/mZQC30I/bkKwMWLj5ACugVbtWEwO5fKCcxGyiB0iCVSPYzac3/bhTub7AAD6kuU1d99hGRqQjOCR9Z/cnq68jQtTiSSxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB7516.namprd11.prod.outlook.com (2603:10b6:510:275::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Fri, 5 Jun 2026
 04:12:33 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%7]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 04:12:33 +0000
Message-ID: <e2c76ae3-a99e-4843-932b-e956a37eb524@intel.com>
Date: Fri, 5 Jun 2026 09:42:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_kms: add --connector option to filter
 outputs by name
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 <igt-dev@lists.freedesktop.org>
CC: Vinod Govindapillai <vinod.govindapillai@intel.com>
References: <20260603152140.3501317-1-juhapekka.heikkila@gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260603152140.3501317-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB7516:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c95ab72-8a23-404a-29c6-08dec2b8ab08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|56012099006|3023799007|22082099003|18002099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 6lLfjNJLW5SkiTK5MTZERXRnyr/+TT+PEjV/3qH4pHNlaz9PqzxU4LVVwhUMLSh2SQpg+bE0LsaWW8owi6IKTn7n81MOUjOMFpQDt+3rclIPjGzR+xHY24sK3OLgnA40sFw8sh4s9uJ683JmGfZevqSVBFai5OASbW2zSB+l8GmKNKHK0iO+WBnjykTPizDURyvvy0xteqj0sREw2b0L1Ta4FQuvIvGpcxCgcFMN6ELG/aIC4tYkyRauTLl39jXTJ+9L1LaNFlfcbUaZ9yuKLerriQDaBE5lRI6Bv3Fx/CYr0Xp3FXUy+ZrAXVkbR64wGsxImrYs8alCyWk1I789zPmlI4YfY4cxqCm3PHhsXJCvMS7esuPgkOxdbdoDuJYi+Xc+zxLANe5FZCp4DGIoe5mvGNIN9wh/klsmgJUm5P1U28489hVl5ySI+flu082jyZWo+IXGwx9f7ALZxtFTJshl1ZsXRnobYAIrrL2CTZJZR9yQmFlZfvCxKHx2Peq7LP7gKAgrrobPr56YSoPl6ZXVTX3LhmxeI3bjwR0bF7whI/pJ+L421buG841nf2Rkfk/XldP6Wu24DF61I5ZO0IoHUquu1D6MQdsrGleya90jgZv/v9RHp3TVIvB7GDfPcyqsmn5HIbwfQnO2ehQa8BJ1QO6fI7IFpodfc8uaKI8q4gA/9r784Y/0tM7nW8eN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(56012099006)(3023799007)(22082099003)(18002099003)(5023799004)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTBEYVJDNi9XcDNmVEJhK04wUXJBNk1iYkZpWEh0am5NeVd4dGY4WjM5aEFE?=
 =?utf-8?B?c09Yb2hHZHJyY0Q5dFYydWZoRkdOUDJ2dkphZFNpc1gvMVNNa051OG5MNkdL?=
 =?utf-8?B?VTgwdlpBQVNOK3c4bTkzb3Z0ZFpnOGlqL2VyUTBaODlFa1ZTRjRSU1NLeXc4?=
 =?utf-8?B?UHBYTlZMVUo0RlBJYkR2cWRpVDVxOUZ3ZUtqeWU5ZHBJNk9aclVQWWtGSzZq?=
 =?utf-8?B?SXNITDg1cUhwcE5CTDQ2dUx6VGtYWXZBR1RJSjNhc2U5dXE5Z25iUW00S05l?=
 =?utf-8?B?SWxqbnB2ZnZ6eGM2Q3lia3hxZW1lREY2OHQwNS93Wk5tajZJNGtvWmlMRU1C?=
 =?utf-8?B?VUVQbkJwZ0ppa3RLb0E0bCs0NmE4bFFNbFlRRmFnYm9HRGwvQitERSsrdlFo?=
 =?utf-8?B?RlVRME0vM20vSk1RaGd4K1hFK2dPVFMrNHZSZUticWRCd24waEMxcEkzYWp0?=
 =?utf-8?B?VnhJMEEwdlpqQ3JjU1ZuaXEyeGQwVDBHSDdLQUxFSnFxdExJTnhyT2R2SGFO?=
 =?utf-8?B?K085Z2tJK1FnNTFZQlowT1dla3NZRGg2Wlg1MUVPQVNRa2RuUk9KZFhUOVc1?=
 =?utf-8?B?cHFYdHljMTlHWEo0ZlJKZXloQmJ6Z21CRTBQMDlpMkVFWU9keEZySDByMkx4?=
 =?utf-8?B?K09hV2J6eGNHeUlkRTQ3UzdOYXd3aEtoelgyMG5aR2RyY0h5ZEtDcnIxL3R5?=
 =?utf-8?B?bjJKeGNOVDZmTHJXWnloRWlDdzdPTHFpcDRCdTBkVnZLaDc1amNPUS9qbisy?=
 =?utf-8?B?ZHpmMC9DRjJpWEh1SFU3aDkwVEo5a0t2ZndJM1NNeHkzdmsxa0Z3aG0xVVNV?=
 =?utf-8?B?U0tVUFo3UlVPSVIyaTl2YUlyV3ZaUVloenJLVjdZdS9OeEhrRmZ0a1dXdVcy?=
 =?utf-8?B?cS84U1pZVlMzV2VVdTlCSk5RT0pUcnZKY1E3YnEzcm43VDBzYWdyei9hNERv?=
 =?utf-8?B?OTJWeWJCYXI0UTBYRlRsUWM3VjFxczVJbzRiamVPOGdZV0JjZ24vNG9QWFhF?=
 =?utf-8?B?SndqZ3NuKzlxdmE2dTRGbEwwMTRlWnJWekRnczJYYXpMaG01ZG9xU0ltbERm?=
 =?utf-8?B?MGtyTGFEMm55ZVcrRlh2SjFUVEZDbFNGWTNDMTJ3WHZrWjJ1UWgwN0I1Qkh6?=
 =?utf-8?B?VEw4ejljYVRMNGpobUQ0ZlZ1dSsycXcySVVIa2kvbmJGWGloS3BWUXJacXZk?=
 =?utf-8?B?QjcrWUFYNXVHRUtZQXZDM3pCM2xSK0Z2ZllRakw3Tmp6RjFrTUNUTUFKdUFI?=
 =?utf-8?B?eW9QV0QveFcyQUVZN0R0WXh2YktxNmZzMng1aElDNGdJQ3Bib3FwWXR1clJa?=
 =?utf-8?B?SUpjQVl0MCswTS9EQzRHNEtjS3FUY1pQVzBJNVlzM1dOOXlldmx3dDU3ck9H?=
 =?utf-8?B?WWVjLzZUMXJJTkJhdEk5QzZnYVE5ZFJ5SjJmck01RGRYQ3dTS1JadXBybS9w?=
 =?utf-8?B?bXBqTU1VY2xJMS83OFZaV3l5Z3FQSWI5emlNdFhzZnk5dzB4SkVCSnBlR2s2?=
 =?utf-8?B?UzJkdVFPeEtVS0VtNThNMjRoT0lWT1ZzWXgxWjJSZEtEQjVUT0JDY0R5RHBO?=
 =?utf-8?B?M0lHNUsxbWx4clpQc3NtY25kQktqS2xDcEtUZ1JuWlBJQ3NCSTg3Z1ZZMlFW?=
 =?utf-8?B?VzdoS0RBNzRxMGhEcUdlM2pNOFZ6QzVpNGtRODYxdk5UQ2VrMWc4VHlQV1hE?=
 =?utf-8?B?clROSjlxRVU2UkEzSTRvd0cyNWxOSGV0U1JMTmhKZHg5ME9yNkZudm1IR0JC?=
 =?utf-8?B?RVh4cktyR25iaDBxTDIyazFxVUN3b0UxOVZ1OGliTmcvbWdPbEIwTlRwSGRB?=
 =?utf-8?B?Nk1vSkRvZkUxdTlGTWMvM1c4alAralpzRUtRVmFFcFV0UVQ5d3k1aXptNm5i?=
 =?utf-8?B?OXhKK1J5RVo0eFY5MmJ4YmtaOXZaVEhMTVE5anVlU0RCMWtlMFNqa2JQcUor?=
 =?utf-8?B?YWtLQkVTY29sRzBmNE9vZ2x4T0txaWJTNXBiQjJPQWYwUkxBcHVpM3Q1SUFa?=
 =?utf-8?B?Z2ppSVBTa0xlQVBFQ0V0MEdpSnR0bUxLMEF4d1lLV2xkVWthYXRXMnhGdVl0?=
 =?utf-8?B?MGE4VlpoK3FTdVk4TmpqZFZOZ0VHZzU3QWd3dzNVbHRhYUpQZjBDQjAwUmtS?=
 =?utf-8?B?REpVY1VNbW5XT2Y5TnluR0NkTVJ1V1lQaFZ3S2xRSFJrSkJ0aGp5NW1xMmFq?=
 =?utf-8?B?ZnI3WFZEY1ltYXFNc1VkcU9IRVV0MkhIZXh2RlIrbC9odVZ5aXQ1a25rNkxy?=
 =?utf-8?B?ZHgwYkFXaWc5T2VBeEdaSmZzbm80OUFXbjRrU2JpR2g2NlptaWZ1c01lOERr?=
 =?utf-8?B?bUdwMWxXTzNVVzAwOURmN2tJZDdwTCs2enVrSGVIWjRUR0dXWDNwQT09?=
X-Exchange-RoutingPolicyChecked: l8EDfuAXlcvYycR22Asqu56uXDzVoC3ENvmizYQ9NyIhUq1C6hyp8Ok3qHnWoDl+hnK80GgTD0PskhlsZxo0FfrPb1/sACl15jZRuYA8ul4qneSxieVHJ7E1L4+7bMjpR2kK8OwD8w2lFvpWZKJQQBtfTH43ubNJIdIhnFBEXPN5qeUme3gLv9EH6nrOYTowsgM5j21nYFobn1GZb5/pDM2IDSt8FbEBUqrM8yzrv8YHEPv8ltQdE8d5CBrJ35S3TIFatOdlhVeeAEoQGyTXT4wbHKB2GJmxMn+9iDMhysUhVrGhlvGG0wRM92e84vr+YHFV6MnUZ7B8UN6yYCsGMA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c95ab72-8a23-404a-29c6-08dec2b8ab08
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 04:12:33.5776 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ShfHiO1sItX7v2aMov4hl0UJcClJIajJ0d07h4UQ+vSympPxDruXAAOqA6SXqduwaNuRgMgr2AhgFutL7hhlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7516
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

Hi JP,

On 6/3/2026 8:51 PM, Juha-Pekka Heikkila wrote:
> Add a global --connector command line option and IGT_CONNECTOR
> environment variable which allow restrict KMS tests to subset

Nit: 'allow restrict' -> 'allows restricting'

Can be updated during merge.

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

> of connectors by name. Matching is done with strstr(), so "HDMI"
> selects all HDMI connectors, "DP" all DisplayPort connectors, and
> "DP-1" only DP-1.
>
> The filter is applied in the two core output-iteration primitives,
> for_each_connected_output() and igt_crtc_connector_valid(), so all
> higher-level macros (for_each_valid_output_on_crtc,
> for_each_crtc_with_valid_output, for_each_crtc_with_single_output)
> honor it automatically.
>
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>   lib/igt_core.c | 12 ++++++++++++
>   lib/igt_core.h | 12 ++++++++++++
>   lib/igt_kms.h  | 27 ++++++++++++++++++++++++++-
>   3 files changed, 50 insertions(+), 1 deletion(-)
>
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index dc3ac5304..5198d4ec5 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -358,6 +358,7 @@ enum {
>   	OPT_HOOK,
>   	OPT_HELP_HOOK,
>   	OPT_DEVICE,
> +	OPT_CONNECTOR,
>   	OPT_VERSION,
>   	OPT_HELP = 'h'
>   };
> @@ -951,6 +952,7 @@ static void print_usage(const char *help_str, bool output_on_stderr)
>   		   "  --help-description\n"
>   		   "  --describe\n"
>   		   "  --device filters\n"
> +		   "  --connector <name>\n"
>   		   "  --version\n"
>   		   "  --help|-h\n");
>   	if (help_str)
> @@ -1119,6 +1121,10 @@ static void common_init_env(void)
>   		igt_rc_device = strdup(env);
>   	}
>   
> +	env = getenv("IGT_CONNECTOR");
> +	if (env)
> +		igt_connector_filter = strdup(env);
> +
>   	env = getenv("IGT_RUNNER_SOCKET_FD");
>   	if (env) {
>   		set_runner_socket(atoi(env));
> @@ -1147,6 +1153,7 @@ static int common_init(int *argc, char **argv,
>   		{"hook",              required_argument, NULL, OPT_HOOK},
>   		{"help-hook",         no_argument,       NULL, OPT_HELP_HOOK},
>   		{"device",            required_argument, NULL, OPT_DEVICE},
> +		{"connector",         required_argument, NULL, OPT_CONNECTOR},
>   		{"version",           no_argument,       NULL, OPT_VERSION},
>   		{"help",              no_argument,       NULL, OPT_HELP},
>   		{0, 0, 0, 0}
> @@ -1300,6 +1307,10 @@ static int common_init(int *argc, char **argv,
>   			}
>   			igt_device_filter_add(optarg);
>   			break;
> +		case OPT_CONNECTOR:
> +			assert(optarg);
> +			igt_connector_filter = strdup(optarg);
> +			break;
>   		case OPT_VERSION:
>   			print_version();
>   			ret = -1;
> @@ -1440,6 +1451,7 @@ int igt_subtest_init_parse_opts(int *argc, char **argv,
>   }
>   
>   enum igt_log_level igt_log_level = IGT_LOG_INFO;
> +char *igt_connector_filter;
>   
>   /**
>    * igt_simple_init_parse_opts:
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 7ee9ceddd..8e468cc74 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1354,6 +1354,18 @@ void igt_log_buffer_inspect(igt_buffer_log_handler_t check, void *data);
>   
>   extern enum igt_log_level igt_log_level;
>   
> +/**
> + * igt_connector_filter:
> + *
> + * Global connector name filter, set via the '--connector' command line option
> + * or the 'IGT_CONNECTOR' environment variable. When non-NULL, KMS output
> + * iteration macros (e.g. for_each_connected_output(),
> + * for_each_valid_output_on_crtc()) only enumerate outputs whose name contains
> + * this string (matched with strstr()). NULL means no filtering
> + * (all outputs are enumerated).
> + */
> +extern char *igt_connector_filter;
> +
>   /**
>    * igt_warn_on:
>    * @condition: condition to test
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index c2a3099de..3d59b0d93 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -32,11 +32,13 @@
>   #include <stdbool.h>
>   #include <stdint.h>
>   #include <stddef.h>
> +#include <string.h>
>   #include <assert.h>
>   #include <limits.h>
>   
>   #include <xf86drmMode.h>
>   
> +#include "igt_core.h"
>   #include "igt_fb.h"
>   #include "ioctl_wrappers.h"
>   
> @@ -672,6 +674,27 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>   	return false;
>   }
>   
> +/**
> + * igt_output_matches_connector_filter:
> + * @output: #igt_output_t to check.
> + *
> + * Checks whether the given @output passes the global connector filter set via
> + * the '--connector' command line option (or the 'IGT_CONNECTOR' environment
> + * variable). The match is done with strstr(), so e.g. "HDMI" matches all HDMI
> + * connectors.
> + *
> + * Returns: True if no filter is set or the @output's name contains the filter
> + * string, otherwise False.
> + */
> +static inline bool igt_output_matches_connector_filter(igt_output_t *output)
> +{
> +	if (!igt_connector_filter)
> +		return true;
> +
> +	return output->name &&
> +	       strstr(output->name, igt_connector_filter);
> +}
> +
>   /**
>    * igt_crtc_connector_valid:
>    * @crtc: CRTC to check.
> @@ -682,6 +705,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
>   static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *output)
>   {
>   	return igt_output_is_connected(output) &&
> +		igt_output_matches_connector_filter(output) &&
>   		output->config.valid_crtc_index_mask & (1 << crtc->crtc_index);
>   }
>   
> @@ -708,7 +732,8 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
>    */
>   #define for_each_connected_output(display, output)		\
>   	for_each_output((display), (output))	\
> -		for_each_if ((igt_output_is_connected((output))))
> +		for_each_if ((igt_output_is_connected((output))) && \
> +			     igt_output_matches_connector_filter((output)))
>   
>   /**
>    * for_each_disconnected_output:
