Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC176C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 05:27:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6681A10E136;
	Thu, 18 Jan 2024 05:27:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF63210E136
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 05:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705555671; x=1737091671;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IQ/O4YOGCkv86qpjMmAQpPXTPP0CmJmPkuHnNWrODyg=;
 b=YZC1WwjHgxTTR8i400fVYjTWhsr+yfsXFZPxGGKrhGU20lPDZ74Rxp0e
 1ABYe8pJSC6R3j3I7uecxCYQS7HXiAIFE6VEm5FtTOo/7ezXnfpYqMcVO
 zYc5nNXlUgF2wSlNeNMPQbsuWCdrA8/iZWX0UeCUKZPbUDJ4vRnXghGP+
 54GQgKM9zf6JgJrhaqPj8Wstk9kKCsHoYesiI3vSsIEiZkzpYqRxLEmEZ
 51kVUHA76qPhkgebEpzJKIjV/h7VVAmTvHOFB3Knn+9oZJfKMG/QZAEP0
 sT9gMYgzJVR9AvWMg4Z12p/u3SSwlXpguY9l5HhSUgaQaerGUWvsxzk+k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="21836291"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="21836291"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 21:27:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="874982059"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="874982059"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 21:27:49 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 21:27:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 21:27:49 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 21:27:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTDlZchiKDOPapxImWjIz//CjviHKk73h6aejUEV76FkFCcxY+uv1NuzH09X3+MxM0NpP0Y8UMj0Uv/rVJdaYWeuW9LEysqAGD0ttBHtic+JUTRoTPZSw9lK+Icu8h1MyPTUO2ZuMELt0/WKOusi+pr7GmwGYV2wpJf9x96n5Gg1mU68X6cJXt/svmR4PI+v4PI32hLN9X294BUS9MlKxejLlW0H4QOKzGoZs+m9xwegK8z43QQbR52M1PJzPhx9WcKC0XnrxaPbB3Ey2rbyCrdQ6Vzsa04ZbJ2HtiQ1LsB2sNnEUlyp95uo4MzdX9PhT1I1xFBtgsggsbjbHjWhOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u6UnHIRtwtZv2XxwAMFKOKWOVLXXHMlZwJQk1x/hJ8I=;
 b=JFuZU5L0WrJG9V53BOfO3Z5BscIt/bPb7UKyMPobowNWgkE2pGC95f2ciYrsgsR5yrWRRBz+wyg1WWZHvXxXzKO28HlRTVhVQ/bNRGox5uUa8bfryjkuDX7mDodPusRO3WjSmGCIkomNz9HdaV/5pjOeshyrVuJbmu0bH7FQGbbxxmQLGE19eLfO9mGq+7Dopg2whKcxF3FsDEpcR/3fVpQadT0UeetWl1BVDZLgfqbPzpmB2OIaWD2bXGY0J7M1HBOwWOBC16lDwK1TYI0872Y9nbVGI1+g1LHhRrQVpUzLOHIRdZeJytDt+0R0z8cUFoI5uwnjUZM7sS6Rl6+b0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB8017.namprd11.prod.outlook.com (2603:10b6:8:115::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 05:27:33 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::84d5:a92f:c16f:bf91]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::84d5:a92f:c16f:bf91%5]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 05:27:33 +0000
Message-ID: <48ce7aa7-3475-4ce5-9087-3f53560af0e8@intel.com>
Date: Thu, 18 Jan 2024 10:57:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] tests/kms_async_flip: Speed up the CRC test
 on Intel hw
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20231207171136.30669-1-ville.syrjala@linux.intel.com>
 <20231219010231.6329-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20231219010231.6329-1-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0249.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: c0150ffd-7298-49cb-e55e-08dc17e62bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zF834zkZiZw0RBE2LasZlJHDpUcqzyLvfCCbHZOsXP0IWe2sOpwDHK9akkyZ3i2I6GH4WSA8c4K+qWZOP3JUnnNjRqhxbO7n6jZjC7Iwewuf0UZJPxMAmF9d1DtZsAVCVv5xrSELOIt54hjnrPQ1B8GZKFhA58QEvPkrnibqjzs++PZ2vDTcypnkS4kvbh4vnsP+o5i2SOCOXzvNh8G8owQSAXIK5wcUuAEg52/BWwVxiEGRH6p61mfasBzkVeSwPRNaWk+a9i8Q81SVfrgUaZLt3PEAqrhKXwQ/J7a8Il7Ti55RjT6lmKwMI92pizp459fuenWAskIuyeSPYBnzjfDQ5WeoAY3hWWuv1AEzgaw3Gg9AMdJqWlgp/aZ1jyHPQNM24asMIJYG8r3HiSFEg7Mvvh4XJAhgXcGvoYkx6Zs3GAA8WCfmTrUhCruaEmQLDWYCjiZckMcDWtL6bJ1EEPSaFv7C9NAE6/Ceh9L08BdVe6AVvRQKxmUgthEVABI0N/Kmdo6OAb0EFg9bjz2BX1ib0gZ6tsQmADAbdWV6KwvPCcSqQN1lSMOw2LFVF+iToc9N9TkDuZZNFS4lM+26t9CtjLex3mv5FcIm0Cnd+bOtWDEWHesHhaFfBnY4DukB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(136003)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(38100700002)(83380400001)(86362001)(36756003)(31696002)(66556008)(82960400001)(6486002)(966005)(316002)(66476007)(2906002)(66946007)(5660300002)(8936002)(26005)(2616005)(66574015)(478600001)(55236004)(53546011)(6666004)(6506007)(6512007)(8676002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEtrVDhnMlZEeXIzVVMrZEVsaU1Qb3BrdnJEOStldG9NRUpvaU1KOUdwRXdx?=
 =?utf-8?B?VGlQMGtaMWRKTjlSZkNhb2xGTzNzeVNIeERUMDI3emJVWUdBY3ZWTGtEaVd3?=
 =?utf-8?B?aUprRWR2cWU4SmdaWG50cFpQQmtCWkxHVVdaR2pVb0owalFML2JaYWUxdEtE?=
 =?utf-8?B?SmxoWm1yd0w0aUZVdklUVUxNV2djeXBiUlczZTB1OFMzNXh2OEhZRXovMU1I?=
 =?utf-8?B?ekJVWXVMZWtNaWF4bjRETWcyNWxsUStyTGllS0FWTTVMRXVSeGZKSDN4L1Jt?=
 =?utf-8?B?RzZBaldzbWJERU5wWGJUK0xnaExUUDVnM0poNnNpeHBLUGYyUGcxb2tERVZK?=
 =?utf-8?B?M092U08yNEtEdnN0UjlFZTBTVUVSUVYyTXFiZDBNZU5DWDZyL01WTkpERTVp?=
 =?utf-8?B?WXo3aXljbno4L0VWYlFpYlVKdlR3NnZ4SjJVZ0ttZ0UzcTY4V25nalNuRWdU?=
 =?utf-8?B?SjQ2YWhwbzdJZGpBcUJRKzZzRTNkMW9jTlE3Nkl3Z0JMbUM0SXRNWktNSkZG?=
 =?utf-8?B?N2pydFBwajJEZVMwK3czYzNjOUVxcmJ2QjZtSzJkK3JabGk5QlE1eVZFZll6?=
 =?utf-8?B?UWJKa3hCd3pFTk91RnBqZ05FdmpPbmRjVVI0M1ZmY3RiTEQ0Z1ovTGZVM2FC?=
 =?utf-8?B?N2hhK1BsVitoSzVKRmZXazlQdE5SNFk4STVGUGhNV2RibHhNY0R0L2lrSE5n?=
 =?utf-8?B?MGxDSnB6cHprdmx6UGlobkhpV2NZcTk1MUtQeXpyK3Z0dUF1WnFvU1F2dDdj?=
 =?utf-8?B?MlJ4WjZOMitzMURteTROTkFSK2dVWFU5TW0wWGc0Z0FkNGRMMnJpNG1wNU1Z?=
 =?utf-8?B?d1N3SE9uRGN3SEtmZjlHenZBUWt2aUJtOStYL21yVXpLYVpEWEgzcGZRUkhL?=
 =?utf-8?B?TnVyME01QUdpRzhOd1hpbnhMdmVxYWg1REI3R1RlQjMveGc5QkI1L2V5aTJH?=
 =?utf-8?B?TWZ5V2J3V2c2b2ZsVmpVa21ON0sxOGxqTFRuQW9GeTVpYXA4eGFjdXZJb3Jx?=
 =?utf-8?B?QUtRbjYwYXpnN1hNSzgvRWRoQ3lldkNNdTZUZHJ0SlFudE03b0dlWkRNUmdZ?=
 =?utf-8?B?c0F5REtTeG5mOTFpamRCYXZTb08zckhmTWVBcUN3azE1TnBkM29VMCtRNGMx?=
 =?utf-8?B?U3llOUhMeGd5b29zbHNxZU5MeHkxSWtJRW04Q29lMWZrbS84cjlaM0x1SjNm?=
 =?utf-8?B?UEVhblByTVBQU05MVHRKWW84YzBudG9wQnlzRm8wVmtwY0J1UEZXeDNZeTFz?=
 =?utf-8?B?OFdvcWhobWxjeHUxV09RRHBpa2NITHFadDZNemJubEh3R0FGNWxEV1FvT0R1?=
 =?utf-8?B?amFiWjk5VW9JWFFicGdXOWVscDA3VVZSSXNUUjVFSFZLcUhzM3VWek95VkJI?=
 =?utf-8?B?NDZtUmVWNDZjTHlZRWVraS9GdUU4NEh4b3J6S0VjR0gzVG5Ga3kyZHhrS3Q5?=
 =?utf-8?B?Z1lqZU8yNGI0bDFRZmxmUlNOOFVIaXNyYjFackdxMFVKcUJLUTExVHcvdldU?=
 =?utf-8?B?MkdZOHlQM0h1dHVxVzhCWFU0M05GbmhqZEw4T2ZrV0NQbmtwdURjaHpTbTl0?=
 =?utf-8?B?UFptbzlFTlQrMHRmcFBBdENsbnlYWnMrN2tCcy93ZVdRZ3VjRnhBVHZNam9C?=
 =?utf-8?B?aUF2akFHUHFVc29KaEo3OEJoVkFENFBJVHJRdUoyM1lBUlIwOHI2Y3pRcVo1?=
 =?utf-8?B?dE1xN1FVVjdQbi8ya1R4aldYNHlVZzU1b3YxTWo4ZjdTeVVtajRhek1BRnEr?=
 =?utf-8?B?S2pQSUpweFJDMVFwVlhYcGlIOXRBVDNqK0RQdUpLYkFnUGY2UWtjMEsyQTNM?=
 =?utf-8?B?TEJLei9DNVlrVWp3NW80aG1MS0h1U3pzeHBJVE85SCt2R0pQUU1kSCt1eEp4?=
 =?utf-8?B?ZENhbkVBOFVmU3REMUtHL1BYRnVidlFsT08raGtNNXNac212ZlVHajQrWGJC?=
 =?utf-8?B?MHR0K1JTMHBKaFZNb25YbjhncjNjbHR3N0RQZ3ZwSVY0eGgxcXNkUldNMGtH?=
 =?utf-8?B?aXA3dENiZk42SVRRbkVyZHZPTllBZWsyYXZnb3Zra2Q5cmY1TWprWll1SWNZ?=
 =?utf-8?B?QjBrWkp3Uy9CdVZKSlJubEtOWnBFQXpwVVpOSitmeHVoOUZzSEVkalhDMFlL?=
 =?utf-8?Q?lNoBM7aGVxiIr2Pe/EvWxuCun?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c0150ffd-7298-49cb-e55e-08dc17e62bef
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 05:27:33.0106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ya6RFRQGxup5/iF1Ip60/hjwAsZdlstkTHkRmNw60WiPl0FJz0F/AkrSBMKNlg67h+uPd3hgOhkAx6sZdKiFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8017
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


On 12/19/2023 6:32 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Go back to using igt_draw mmap stuff to do the mid-test
> rendering in the CRC subtest to make it faster. Going
> via all the cairo machinery is very very slow, but we'll
> leave that codepath in place for non-Intel hw. This makes
> the test pass on a DG2 here as we can now produce enough
> frames to have some confidence in the results.
>
> Note that some extra care is apparently needed with the order
> in which things are done. If we pin the buffers to the display
> first the mmap is likely to fail (due to the FB getting pinned
> outside the reach of the small BAR presumably). Curiosuly the
> mmap itself succeeds but we get a SIGBUS when trying to acccess
> the buffer contents. If we touch the FBs first via mmap and only
> then pin them to the display everything works correctly.
>
> v2: Use igt_draw_supports_method() so it works on xe (Bhanu)
>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Alex Hung <alex.hung@amd.com>
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Fixes: 8ba806e7e196 ("tests/kms_async_flips: Support more vendors")
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

Also had locally verified using v1 of this patch that this also fixes 
https://gitlab.freedesktop.org/drm/intel/-/issues/8561, which was seen 
consistently with the high RR eDP panel on MTL. The change b/n v1 and v2 
shouldn't affect this in any case.

Tested-by: Karthik B S <karthik.b.s@intel.com>

> ---
>   tests/kms_async_flips.c | 66 +++++++++++++++++++++++++++++------------
>   1 file changed, 47 insertions(+), 19 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 6fddad093913..31573f7065e6 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -100,6 +100,7 @@ typedef struct {
>   	enum pipe pipe;
>   	bool alternate_sync_async;
>   	bool allow_fail;
> +	struct buf_ops *bops;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -230,8 +231,6 @@ static void test_init_fbs(data_t *data)
>   
>   	igt_plane_set_fb(data->plane, &data->bufs[0]);
>   	igt_plane_set_size(data->plane, width, height);
> -
> -	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   }
>   
>   static void test_async_flip(data_t *data)
> @@ -240,6 +239,8 @@ static void test_async_flip(data_t *data)
>   	long long int fps;
>   	struct timeval start, end, diff;
>   
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	gettimeofday(&start, NULL);
>   	frame = 1;
>   	do {
> @@ -336,6 +337,8 @@ static void test_timestamp(data_t *data)
>   	unsigned int seq, seq1;
>   	int ret;
>   
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	/*
>   	 * In older platforms(<= gen10), async address update bit is double buffered.
>   	 * So flip timestamp can be verified only from the second flip.
> @@ -381,6 +384,8 @@ static void test_cursor(data_t *data)
>   	struct igt_fb cursor_fb;
>   	struct drm_mode_cursor cur;
>   
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	/*
>   	 * Intel's PSR2 selective fetch adds other planes to state when
>   	 * necessary, causing the async flip to fail because async flip is not
> @@ -429,6 +434,8 @@ static void test_invalid(data_t *data)
>   	struct igt_fb fb;
>   	drmModeModeInfo *mode;
>   
> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
> +
>   	mode = igt_output_get_mode(data->output);
>   	width = mode->hdisplay;
>   	height = mode->vdisplay;
> @@ -525,28 +532,48 @@ static unsigned int clock_ms(void)
>   	return ts.tv_sec * 1000 + ts.tv_nsec / 1000000;
>   }
>   
> +static void paint_fb(data_t *data, struct igt_fb *fb,
> +		     int width, int height,
> +		     uint32_t color)
> +{
> +	if (is_intel_device(data->drm_fd)) {
> +		igt_draw_rect_fb(data->drm_fd, data->bops, 0, fb,
> +				 igt_draw_supports_method(data->drm_fd, IGT_DRAW_MMAP_GTT) ?
> +				 IGT_DRAW_MMAP_GTT : IGT_DRAW_MMAP_WC,
> +				 0, 0, width, height, color);
> +	} else {
> +		cairo_t *cr;
> +
> +		cr = igt_get_cairo_ctx(data->drm_fd, fb);
> +		igt_paint_color(cr, 0, 0, width, height,
> +				((color & 0xff0000) >> 16) / 255.0,
> +				((color & 0xff00) >> 8) / 255.0,
> +				((color & 0xff) >> 9) / 255.0);
> +		igt_put_cairo_ctx(cr);
> +	}
> +}
> +
>   static void test_crc(data_t *data)
>   {
>   	unsigned int frame = 0;
>   	unsigned int start;
> -	cairo_t *cr;
> -	int ret;
> +	int ret, width, height;
> +	drmModeModeInfoPtr mode;
> +
> +	/* make things faster by using a smallish mode */
> +	mode = &data->output->config.connector->modes[0];
> +	width = mode->hdisplay;
> +	height = mode->vdisplay;
>   
>   	data->flip_count = 0;
>   	data->frame_count = 0;
>   	data->flip_pending = false;
>   
> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
> -	igt_paint_color(cr, 0, 0, data->bufs[frame].width, data->bufs[frame].height, 1.0, 0.0, 0.0);
> -	igt_put_cairo_ctx(cr);
> -
> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[!frame]);
> -	igt_paint_color(cr, 0, 0, data->bufs[!frame].width, data->bufs[!frame].height, 1.0, 0.0, 0.0);
> -	igt_put_cairo_ctx(cr);
> +	paint_fb(data, &data->bufs[frame], width, height, 0xff0000ff);
> +	paint_fb(data, &data->bufs[!frame], width, height, 0xff0000ff);
>   
>   	ret = drmModeSetCrtc(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id, 0, 0,
> -			     &data->output->config.connector->connector_id, 1,
> -			     &data->output->config.connector->modes[0]);
> +			     &data->output->config.connector->connector_id, 1, mode);
>   	igt_assert_eq(ret, 0);
>   
>   	data->pipe_crc = igt_pipe_crc_new(data->drm_fd,
> @@ -562,9 +589,7 @@ static void test_crc(data_t *data)
>   
>   	while (clock_ms() - start < 2000) {
>   		/* fill the next fb with the expected color */
> -		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
> -		igt_paint_color(cr, 0, 0, 1, data->bufs[frame].height, 1.0, 0.0, 0.0);
> -		igt_put_cairo_ctx(cr);
> +		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
>   
>   		data->flip_pending = true;
>   		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
> @@ -575,9 +600,7 @@ static void test_crc(data_t *data)
>   
>   		/* clobber the previous fb which should no longer be scanned out */
>   		frame = !frame;
> -		cr = igt_get_cairo_ctx(data->drm_fd, &data->bufs[frame]);
> -		igt_paint_color_rand(cr, 0, 0, 1, data->bufs[frame].height);
> -		igt_put_cairo_ctx(cr);
> +		paint_fb(data, &data->bufs[frame], 1, height, rand());
>   	}
>   
>   	igt_pipe_crc_stop(data->pipe_crc);
> @@ -644,6 +667,9 @@ igt_main
>   
>   		igt_require_f(igt_has_drm_cap(data.drm_fd, DRM_CAP_ASYNC_PAGE_FLIP),
>   			      "Async Flip is not supported\n");
> +
> +		if (is_intel_device(data.drm_fd))
> +			data.bops = buf_ops_create(data.drm_fd);
>   	}
>   
>   	igt_describe("Verify the async flip functionality and the fps during async flips");
> @@ -704,6 +730,8 @@ igt_main
>   		for (i = 0; i < NUM_FBS; i++)
>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);
>   
> +		if (is_intel_device(data.drm_fd))
> +			buf_ops_destroy(data.bops);
>   		igt_display_reset(&data.display);
>   		igt_display_commit(&data.display);
>   		igt_display_fini(&data.display);
