Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525DEC88E75
	for <igt-dev@archiver.kernel.org>; Tue, 15 Sep 2026 09:49:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C97C910FB40;
	Tue, 15 Sep 2026 09:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VjcNclaJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78DB10E27B
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Sep 2026 09:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789465701; x=1821001701;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=qQPDaQgJbASeCe2YtNxA5a8Q1RJP1FEqqUvidw2WmVM=;
 b=VjcNclaJVz1+st+v/FkYNFXJMtdjH4kGdqCvTobBEUgR+YJcWhad5fnp
 q1IZcoRmxvXaYK8jtHcrpkf1D4C+tRYXo0QqyF2XbD6PINHcKMBHAqGHd
 FPs8yJlYvSxoVhnCl7ohvKyJhnoEBttVgd3Pbne+LK3lVSaqtOT9CsiMR
 XFHIU+g/E+0b7hvfTeKWzMbKyGeMcMyPWuoGk7/5t0QtkFpozf8emw55m
 w01kiAvKkFx1TWU7c1c8Ii3g8iZt072JJgMfmmiz9frZrGRcV0m2A5KSu
 MJwonBWcaATXj+2TKOhjvLzu/V3rUqGnETXlzOWLvh1i8BtwnsZjc6olT A==;
X-CSE-ConnectionGUID: WnAHrEtlRI6M9ODJxvSgog==
X-CSE-MsgGUID: iy+/a1SuSSWS3W9+DxzFOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112592448"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="112592448"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:48:21 -0700
X-CSE-ConnectionGUID: ljuP/V+FThOYOikJn1oiZg==
X-CSE-MsgGUID: OwTb63m1TIKY9STDK9xfCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="276479164"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 02:48:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:48:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:48:20 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:48:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H61DXSITRtxsn29XxJfKJc78P5fWmbgQKhiey5JxaTyWxtGIAak2jduI566MUlYIn0LIoGNA1jMnSDy+mvhJiSMqt3NxlALF5PPsVyQmrLcp3du0X3XArgea/v+CVpHCIBMv1CDXNKN4uwdSJQaTnWgFSiAmmdHnB/pJZf3CG1cFcrd5xCiBLPoIUvtc2jH5XNQLE+baqQDHP6Fs7UBocrBN7s5M9D1H9pqHIA3ULMzARYPTcsMF8y17ZzkQlyC+plra9+71Rz6mMrY8OWjfMJUl/G91uLW8FEg1G2zllq2NpjLeprXVcra/dWCblW0iWiCRxiavE5Lket11+dYuvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvZSei7SzLtNUm624dveWJofKOM9pT6t4SSNHCF2oTU=;
 b=NF3Kb1Pe9JKxmPxQfJNkb4mvGvdLPz13npDXMqXirn/pLXNvF2PYXIB990BbrKVkjriDoStsFFc7W9Xhyx5XpFTQf46mkmpfw+pesiWTsW62K9FiQax4BDNZo2aUYuulz7AA9XHCChtZwjdCwRaR5yGZgVwuhGHV/62XTlf0/ne+Mwd7uheYEgmqSHGYYCi7HnQbK6kbfKKXtTGu081ElL13hgwtENIYxq+HAOAK0KvHzcp1sCPsxx1Av1e1SjJbjpj61zpcGIAoqYlqURf8f4K2uDYr6mYnWUqUxcRzp4E3S/Y95RlzQhrjfDwKo+IeQAXigF+a/3bYkLXoWEdPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by EA3PR11MB028977.namprd11.prod.outlook.com (2603:10b6:303:2eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 09:48:16 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:48:15 +0000
Message-ID: <7bdb3dd4-6967-45ed-b2ee-12b67ce192fb@intel.com>
Date: Tue, 15 Sep 2026 15:18:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] tests/intel-ci: blocklist multi-queue tests on NVL
To: <shivtej.eknath.patil@intel.com>, <igt-dev@lists.freedesktop.org>,
 <kamil.konieczny@intel.com>, <smitha.balasubramanyam@intel.com>
References: <20260915085346.38452-1-shivtej.eknath.patil@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260915085346.38452-1-shivtej.eknath.patil@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0262.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::18) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|EA3PR11MB028977:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fada321-91cb-4384-25ad-08df130e76b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|5023799004|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 8vUeizqU78+j+s8lNbcHY5ryOP61aQPNSgltCXcC6EtfeDu64WwLlHlaJ7mwuavqX3D7NyfujBqdOIXS6W7rR/n5uF3ILg1YfjuGlzcTL6wxiInAACYKMBt8v9BNmRei+NQTlS5q6h3CCWbm/5ejiVwCBoOr4OMBJCSHRgxURKr0zNYv3rTt47vAhk44rfK1e28iWXZ3F880nQVq5m3WwVncFYVyPMPPPp/HTh1T9Xk6WcyDmosVSJdrpU6R749VG15OK7UgZ/IiKUBdCd4OY8LETJiOeMu5S0sIBStDeJ4Arwa3R19V38cJovt+U8OStOV7oUG5C74VpbVOls01Gnffroy08G2mNGSexSIKreg6lrT1wzte1Muy9JPUzwDyTAztAWQ38I6OIdwF5zepnblSOwbs/TRGvrR8JRBE+kcPAAViU1go20i7aEfMUAwhOoqR0anHhT4dyIOa2ReM0G3iOlFPRl3yLeo44glVM4k7cIHsFLvyl0yBR3sQ/NE7PHQ8Pylmpv4d5yIHTyiprQE3iBAgYMyifiSiJgdj9z3LWGJN6EEDnYng1FF7A8fWp8mLPYqra1BmdSGMpXhbWe6oQCQEnlD0es2JHhq1rrN5F7ieYpirFTpH4yWijHLnMFDBUws/4Yj+doTYtx7wcemH8G0siPSffyvSSpTtIpw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(5023799004)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lrTFAyWnpEQldPZUpoNEVvRzF6M2JEQzRiOXo0TS9waDh3R0FRdkxjVGNY?=
 =?utf-8?B?VzgvZTZpNFFNYnpjM2MvL1grRWQ5eThWeHBVNDZ4NzQxcmhUUFgzSmFuOXNQ?=
 =?utf-8?B?ZUtRNW9RQlUzcXlZam1yRmVUMW9lVkNEWVRCMUdkU2ExZEtJcE1CWENnbGx3?=
 =?utf-8?B?YjNna2xtYjNXUVpZekF1cm8wYTBEZnBwOExVRWtqajIyQ3BYTHhKUTB2SCtq?=
 =?utf-8?B?R3J4NjhJcnpCSjVIVWRQQlI0M3BsYXppUllxaWRMMmw1K1YzZmExd2JYRmg5?=
 =?utf-8?B?OG5GcS9pYTVxNjF2UnRmOFA4dlNQRXVOOU5vcUpQV29zUTlBakQ4YVNsZ2hN?=
 =?utf-8?B?Mm5TNkh4aEtxZmplSFhjQXJiYlVDdWJ5dXQyVGlxck5DVGQ0RUxhc0UwM0t5?=
 =?utf-8?B?OTI3eUxVdi9kQ1VqWk9MNjYxUkVYQTlnMmRyUlZab082ell6QXF4N0h0dGdi?=
 =?utf-8?B?RkJ1NVBWdG5GSEQyQmJNWFUwYm84Ykw0azludzJFTXVWYXlWN3c3VWp2bjBM?=
 =?utf-8?B?Mm1lNlVkVkY2ajMwNktjVCtQNlh5WXRLQldxdzZ0RGhzWDBRQWdTcHpsbnZ5?=
 =?utf-8?B?QjZlc2wzWjYwWmZOVzFHb2x3OGZxVjRGVllPM1VuZitYVTdxTEF4TmF3VUVZ?=
 =?utf-8?B?TUh4MTVjQS9rMkFRYUlTVklVUU1FN2Y2UENhYXg2Z2ZmZ2t4ODVHU1RrYjI0?=
 =?utf-8?B?SXdoNDhEbjdBZUIzY3lDTWJPQkpZdlNIdHpEeHdheVFzSlpjNWltbFVSUGxM?=
 =?utf-8?B?cFJ3TEcwa2lQYlhhZmxCeWRia1RiYi9EU3QxclN6SWdybnFMak40Nm9XUmNn?=
 =?utf-8?B?aERHV0pvNnNTaGltaXdlbFdYcFk4aG92Wk5UdXIrMTgvZUc3dFpBTjc2ZjM3?=
 =?utf-8?B?Sldlc2JWVkU1VFNYazNwK0poMTJUSmN2QjhQOWdPV29VL1IxT0NZVy93UlVY?=
 =?utf-8?B?aURsN2dlanRLR25obHl4V2FzNEU1RUMxSytBSlVKZHY1Qmx4YlQzbldNWURq?=
 =?utf-8?B?NmVMWjNGd1h1UkdHY0huRE02NU9QcWgrZWhxenYyQXRrZ0ZjYkM2ZFhNUkpk?=
 =?utf-8?B?NnNXeVJKeDA3ZDB5WVJ4S3VCK0pjbzZ6eGc5Y1hxdjdXMCtINHdwMTZBREdU?=
 =?utf-8?B?RTd2Q2xOWGdpbjBqZVhMbFVsZWU1Sm1OY0gveE9ja0I2NkZoRnQyV2JpZEJp?=
 =?utf-8?B?RzlzUExKK05SZ0xtV2lmRDBzbXRnTFQ0RXVIQjFmTEpvY2EwaktvZnB0OG5P?=
 =?utf-8?B?cTFlSnN6SlN5Y09Wd0lnOTBQbHFGc1VMeVlUTndJVlVGNlNkQ3BxMEJJeWZR?=
 =?utf-8?B?RmdETUdvc3E1VlBTK1UxV3hkM0VhbDFEQ2s1TFdIZzlWcEI1SGtYYS9uS0lR?=
 =?utf-8?B?R2M5NzUrejYxZE81cWJHR09JUFVScFkxQXpLajBqank1Vi8ybXRhZnpPc1V0?=
 =?utf-8?B?a1dtYkU3NklRazVtUFZSZ3dIUmZoZ2hpNTZGYjQ5TVN0S2lQdFZ5TVFrQnRy?=
 =?utf-8?B?RDRrRUtmV0wvdGlPVXo4c0djNTR6MkNGTmsvL3gzMUkyQ01lUkNhZHBrU1Zn?=
 =?utf-8?B?UElJdVNmOTNHaXRmdmR6dnVCdjRHWHV1aXNkamlqWEZ2UUZLYlRPbTVrYVpz?=
 =?utf-8?B?NHFGVVdTbC9GY3d2bmQwZWlhZ1ZON1g2ZWVaRzlHM1Jwb2ZRQmk2Tll0ZkpT?=
 =?utf-8?B?dW83YU52SUNXeER1ZXlWKzVDOVAvTCtYWTF2bVo0ZFlINWJWODBPd3Y5enNE?=
 =?utf-8?B?bURJRGRlamdUczE1N1l4ckVQQU54ZEczdDV3bGFtNVNvM2xycmRDcStwaEZS?=
 =?utf-8?B?NXZUVHAzVDhXT2xWS3YrdEowZnpIYjg0akFRblV6NkUyQytvMStOOGhBank5?=
 =?utf-8?B?VXlacDVGdFloOENXemRMTytCZ0dzTjB4OVB5OUsrZ0wzbzdKbXkwMWhyQXFi?=
 =?utf-8?B?enU0WkNxcU53OHhwcGVQWGMrSndxTXJBTVVlUTFYb21pRW5nc09UOWVONlcx?=
 =?utf-8?B?K0xZdndwNTBid2d0eDRFbHZaMUY0d1VsMWxjZFQ4TGRPcUJyMXQveU44V2Jz?=
 =?utf-8?B?UDdIWk85SWo4bVREVnlzeWZObHNOQnJqUE9TV0NaV3FNUG5ML1JRT0F6WCtM?=
 =?utf-8?B?Y1lLb3JETGtZTDE1cVI4cFRPZG1jbGk0bStwY1k5Q2syRkltOW9MSjk5RHJY?=
 =?utf-8?B?ZitZaGZzMENzVGZGdDRRbVdMUGk1dnMyZFpqclZySWluN0J3Ym03VzNDNkY1?=
 =?utf-8?B?YWwwTTd3bzFsY0gxT2pBSkFMRi93S3hYYlAxd3dWMXNXN0xJRjJHSkVkam5l?=
 =?utf-8?B?Q0VxTFlNTmMzM3dDc0VNWks2czY4MGphWWVTZ1RsWnBxcFZtcDBPdz09?=
X-Exchange-RoutingPolicyChecked: FAaCzJAa8rQpJejsHQOABbA/PPlYLv2qAKdwsjqe8MkWhuH7E7mthfi5Szkg9d0jFOeLtKXdBc5iurw6LGXb35IgzS4tEXGCES8BwM4K6fn5I5/Z+qbzTBmh7uzpdG9vCuMcvin6kthdunDBwL2joNZ4l8FU9rZGAxNsgVPGa5ldlvtRvVP5TJ30zRqX7X+11B4vGIt2j//y7nf3UmmRbhdxMDk4gxfao2CB2mQhmumNu4MFFHdC6Vhs9T2pfN/Y81nIC84CwTv3uZ9zmCJYp/57ift99mVFSZ69//0rftpwF1IAl+ACW4qHFXGnHhJmCRdb64heATCm331I/JCLJw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fada321-91cb-4384-25ad-08df130e76b7
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:48:15.5682 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o914p1M4kU2eFkkZFgAOdLGjHO1Z9V1YnB2dBXfI49yheC1ksJ8lTGhAgmqt9rm8PWFbqDLY3f/9axukf2bdmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB028977
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

HI Shivtej,

On 9/15/2026 2:23 PM, shivtej.eknath.patil@intel.com wrote:
> From: Shivtej Patil <shivtej.eknath.patil@intel.com>
>
> The multi-queue subtests require xe_has_multi_queue_engine(fd).
>   
> On NVL platforms these tests are expected to skip because
> multi-queue engine support is not available.
>   
> Add blocklist entries to suppress expected CI failures.
>
> Signed-off-by: Shivtej Patil <shivtej.eknath.patil@intel.com>
> ---
>   tests/intel-ci/xe.nvl.core.blocklist.txt | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
> index 7de332352..0d28e1b60 100644
> --- a/tests/intel-ci/xe.nvl.core.blocklist.txt
> +++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
> @@ -107,3 +107,9 @@ igt@xe_exec_sip@.*
>   igt@xe_exec_sip_eudebug@.*
>   igt@xe_live_ktest@xe_eudebug
>   ##################################################################
> +# Expected skip on NVL due to unsupported multi-queue capability
> +# Multi-queue is not supported on platforms older than xe3p
> +##################################################################
> +igt@.*multi.queue.*
> +igt@.*multiqueue.*

This .*multiqueue.* doesn't resolve anything, I mean it doesn't give any 
subtests with multi-queue as substring. Please remove it as it doesn't

have any effect. ./build/tests/xe_exec_threads --list-subtests | grep 
.*multiqueue.* gives nothing.

> +##################################################################
