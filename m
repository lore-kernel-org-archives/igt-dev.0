Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC212C4828C
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 13:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6F010EDF9;
	Thu,  1 Feb 2024 13:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7LvKCur";
	dkim-atps=neutral
X-Greylist: delayed 386 seconds by postgrey-1.36 at gabe;
 Thu, 01 Feb 2024 13:51:39 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAEA610EDF9
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706795500; x=1738331500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MGICJ1lZzg/Vb7m+Oms/HMNwFnZLx6q2sqfq7YVftmk=;
 b=U7LvKCurpcU1uaOaTPVRKnd9ZKyMhW6oZeqHPaDEro8D2Y6u5ykbXuOd
 j9HOnL4vRClVGDm6SnyFqPdy5B4oMO+eX9Yi0g09gHVNtK2FqZVvrFxF+
 IuVg1zlWNlvhHRbA/lwIB/2GP+zLu0UDoJfIOkfMhVaed1r3o4iZD/dHE
 rOsxoH9CQxKRodpzc8EV5MqiLK+INGjxDFYRVVEnmMDeuQtCCenhuzo8C
 68FCSMD4ixIvH3kNSHGThPXwDZsqXzcTJy1N7kNdcrn89WdMEDoZmdhkZ
 Gu3W/B70uBsYMcN6PQl6GtTFJYn2hQlXVyCALPQ/1GaQmsqw2EJEIYjno Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="116392"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="116392"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 05:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="76490"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 05:51:39 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 05:51:38 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 05:51:38 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 05:51:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cLCjh9j93xQ9T6qzcTI9Wwp5zIbEHXyBpdtT8LSdYyAUHltN1AFvw/6mPSDQhZEEP2Snp7uf2PbMPcpqKJTNwKPEH2KUqJf8g0szQz58y96Ld33akaOZa9N3SgmiDCrGdchqvFyK5StFOgrXud566z6rWLBt/xsjrdaGdCcSBoBUYRqxSKBPfoTnjRJvncA/i+4dx93OTOmNeGo0jQ7iJMseGK5smmvSRcLSYgq8h7w6p9M6CunwE1Mz07Zw5rP6Ym+QVAzAGKFT9S9bqa3JkWHe3DTxy/urc72MQTU3Mh2jDYNjHSKM/xsag2QFtTJDOn5f6mk9hbf6hJVIKxdOsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqvy9fLMtXmOkKau02nwhxdxoD576YdxoFLhoOFO08k=;
 b=CrZ668yvMIfzNuTCGxSLCgrZIvzS0sWgnEXJ23AVnZhbEn0lZ6x3m4wrizDiYXePYfzLL0Xs+9T68xAOgce1m7eWg7F3asRiE2EmtgMz3MkD0dIgGgtnC7cvuDHu8GKBcBzR9td/elvKfjs+/8bE5nul1SR5xZoERvNWvHC05GReU+Dvvz7ZctYi+BY0gXf4esQLuZZZMnmUWpXBCUoErUDQLQ4WaXzKaDExbBXGIlATVcm35QkP0YsjZvALWGzUtH6U+KiOO3k/shLAqZ7BP0hFk9TKAdVpAjGVlpHxu4P7wBa33G6xAD+8uvlsjjoDQU60xpaqZyILG44SgMUilg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by SA1PR11MB8320.namprd11.prod.outlook.com (2603:10b6:806:37c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 13:51:35 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::c6da:e343:1799:4566%4]) with mapi id 15.20.7249.017; Thu, 1 Feb 2024
 13:51:35 +0000
Message-ID: <2fae2b34-03e0-4ea6-8023-af943b9dcf8e@intel.com>
Date: Thu, 1 Feb 2024 14:51:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_blt: Use object pitch and aligned
 height on png write
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Karolina Drobnik <karolina.drobnik@intel.com>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
 <20240201100724.257845-4-zbigniew.kempczynski@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240201100724.257845-4-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0038.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::21) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|SA1PR11MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: 16693625-711c-4615-5799-08dc232ce7ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KDbMHKXJgjWTUl8pFZcKLxx4oUAC7g2rjZVW8Bzi3bm3y/ch4N9PjWcLx4H2Z+2jzpnrBqehW3NctOl8X2CSBmNwKFNk7RjDuFZFasNjc7+x4Nz1QkGobJMyQB2LmhRk0XqLGCBFE4wGk4qcoAkP7cdDGAaDG5mXxnASx81maAedul0a+5ZUCjTGhL87QoJZePEQvaGzMpQ/ogRysOt3WCXBk+HSVBTdHDTIu1rXbusjRNgdslitAIfKU/q28khgdzMtiNSd38G10em+m08jgSe+N9cutoa7puH1k0q54CgpUMdlpbnx/15+tzmHdvdFSO4aIdewkGx54XJ9MhnWyqqzTw3b/rAQjMzeXT0jHK0OdJWaB1ixKQOLY+KddsNrObQ8ccYVooZvdub1LeOoo0xBBGEvfAd/w5T+Q62BVzk9bU/19t7IxjpjCejr+Po+IyI0S8jtJaHjSoGgMOzHAj3HNWi6w2QJYUJ/WhSE1E1kqJmqfAKxYLWhDtdb8GxrOYp7aR08CLl454f+0CKudFHh/JslPWZsuwVvbuOypY5vUjdQKDprbmNFxaJOloY8u5Hd/Ol+KukUJwJm2sycq65n/wAotgiaeaXFfYiC9AFaW+t5mHcTTze68Pi4N6Fz3VUqWiJfuqOrGhavWEpVtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(478600001)(6486002)(66476007)(66946007)(66556008)(82960400001)(44832011)(86362001)(5660300002)(30864003)(2906002)(316002)(4326008)(8676002)(8936002)(36756003)(31696002)(38100700002)(41300700001)(107886003)(53546011)(83380400001)(26005)(2616005)(6506007)(36916002)(6512007)(31686004)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWZ1aGNEbVFmeTJrZ0ZIWTNlN0FIUGVCYWVuUjJpOS9IUDMvdlpqSXNwdzk3?=
 =?utf-8?B?QUtXMlRFZ0ZlZloxTHhnUGNyanJmUElHdWlldG40YktoazhRMW0ycnlvNmdV?=
 =?utf-8?B?ZDdYWjN4K3F5SGRHZDB3MkdnenlZVllNZVU5WGQxY0V0QXZPOXNSZHYxTjJi?=
 =?utf-8?B?K2JwSGs2bzZGQlI0WlBNWnlqYTZ5ZTdpRUtYY2FvekVKaVhQRDhvdEhaNkdH?=
 =?utf-8?B?WXZmZnpUM2pBMVRtd1o0Mkp6eVkwZkNXQVhFNXd0RE1nbEdmZkROYUtzaFlO?=
 =?utf-8?B?a1JqaUljbGREUjJXTTJQUlpUakJpOCs2VVZjbENTNmpHRnkyLzcrUndvQzdH?=
 =?utf-8?B?UFNReENIMk83NGFqZ1VoSGtaT0VHb1ZjbjNCQklmTnhReUZyWHVydHJ1YTVF?=
 =?utf-8?B?b3g2blVzQWZTYnp4SmNwS2YyWFZheEVrZW9BNGwxeDFGZkdUd0RRRTdXL09n?=
 =?utf-8?B?Qm9iUzVYZnYzVFFHanBBSm1qMVU1dkNmNlRwd1NjMUZZK0RjWDFRNmVJZE5X?=
 =?utf-8?B?MXhpNFdsaEtSb3N1d3dNU3RJWkl2dVhnYlJJMm9jcVBJYkRiZWpVdDRHY1pm?=
 =?utf-8?B?VXBDaGowaldJZEJsVE1CQ25vbVMrUzNPNGdQZGhjT0xjanR5eWtYOXMyKzhi?=
 =?utf-8?B?cHhOTkYvc3lXbkloTG1lb0Z6dXAzYVQ4N3Q3RTE0Qk5OMFlxNitQUCtwZWRC?=
 =?utf-8?B?dko0cWhJMFlMYW1IZnprRWJTdTM0Nk9Zdy9yN2ZRNkE2aSsxRnJBd3JPYk5v?=
 =?utf-8?B?RzZIK3RPajBMaXRhMEwwUW9BenJVOURFbHVhQzJNNG52OXNobC9ybHhCVnRS?=
 =?utf-8?B?WnRabmY4bHdYWUQzb3JUek85WFJGTUp5WlZWM2pCWjNqZktRTGJHOEd5cTJH?=
 =?utf-8?B?WW1sYkd4NHV5NmtMRzdaS0ZWajhRLzFPZkVsM1NJeDc3UitjQzVraStzdnhJ?=
 =?utf-8?B?N2Q5YUd6WktMUUk1dWFTditkbXJXVXIxWTY0MGRacGJFODRvQ0pkR3hiUzdS?=
 =?utf-8?B?WkpWWEVVdEtZMkNBSjI4emU2L0lHclppTEJ0OGRKK2lEUU1SQjZIS1dVd0JI?=
 =?utf-8?B?T2pQeitybWpCbTJIMFNuUDMyaGY5em1XMkZFTHo3UW1ZbDBhbVYrUE5SVXFI?=
 =?utf-8?B?Zm82QjY3aHdNYnBvUkZWM2hGN01HMWNPdHJ1OFdidTltQU9QTUhoTVRreXUx?=
 =?utf-8?B?LzJSdTJlOVA1dlludlNCbWtBK2xUM1NiWFh1WEEzTE5PZkJwTDhub3dSVzI5?=
 =?utf-8?B?a2tWaDNKUExPMkhQVURlS1hQT2t0TUM0Y0ovaXZYNlVMeEdCaG1xczdXSW82?=
 =?utf-8?B?OTNHR2V0RnU1OGhLLzVtRTl3V3hLdjVHVXo3R1V6QmtRLzZNckZQSC9wUUYr?=
 =?utf-8?B?MHlSWTNVOVhOaFlQdzV4WGhPRWpCMTIwbUNXTVF1cERsRHhUUlZxeGQ3eFVn?=
 =?utf-8?B?cFV5QklYK2d4eU1hM1FtRXhIYm1QaVZqU2hXYXl3RVEzamNsakFFeEhCRThN?=
 =?utf-8?B?VzdQaHZJL3AwbXlPVVNVaXFHNXB4UnI1RXprbUZXbkphZTVHbFVGdTZQQjAz?=
 =?utf-8?B?RTVKb2YzcVN5S1NJckNuK2QwKzAxWGNQUGlvdjNZbzE5VEdvOVBHZFZGSVN6?=
 =?utf-8?B?NTNucWhDNG1LdnN3QWg3RjNkMVgwQnVQTzRUQW9kNUpFU21vQm9DRzZOVUpy?=
 =?utf-8?B?cSsxSFJEZFlac1pCWmh3OVVzeGIya1hxVVZxUjhHODJvazk2b1FIMFNsV0Zz?=
 =?utf-8?B?aXZGTEU5Q3JUMURjVm5KTmsydnJtQXdBY1FVVlhhbnRFLy9TR2poTEdhTzZl?=
 =?utf-8?B?MHgzSmc0QVdYSE5pUFI4cWE2K1J1ZWtEY1BSN01rclhBR1JQUFFIY2ZwV2E0?=
 =?utf-8?B?dFFLM2RRLzYzNktZMWxNOHZrVGxLSS9KSjA0WS8yZVFyQS9HVzVZMjNRRG5a?=
 =?utf-8?B?ZGc1MWVzNS92YTk0cWJGWlN3VlVBU1oxWitpVUdRZjR5anpxem1rTlFva0My?=
 =?utf-8?B?ZVVIWWQ0cFZnbExTQmpPSVF6aHVkTWtvaHVwMHdwZjJpQ2dQZ2UvQmdJOU1B?=
 =?utf-8?B?RmNqTWFKV29PQ0haaDY4VFlXTy9jeUZ3Vk1tN0JYcVh4REErZEFwNElRM3Nx?=
 =?utf-8?B?a254THVrL3VtM2VxMFZQd3lLejVsQ1ZpRjNBR2hmQ2RzNStPRHkxQlVsKzUy?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16693625-711c-4615-5799-08dc232ce7ba
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 13:51:35.4641 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CPCqKktMye2oWPfr36VxaGC5Bhmpu1a7VU6enRBWGt544xkFW/GSUv3N5i0SYmQ4xR4ZFJtMe5oe2GOqxnW+Q0gVQvly2l8Hww/7l2QksU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8320
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

On 1.02.2024 11:07, Zbigniew Kempczyński wrote:
> Pitch and buffer height on tiled surfaces might be bigger than
> image width and height so dump memory to png using pitch size
> instead width and aligned height instead height.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Karolina Drobnik <karolina.drobnik@intel.com>
> ---
> v4: Use original width/height in filename instead stride/aligned
>      height to avoid png overwriting (Zbigniew)

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

> ---
>   lib/intel_blt.c                | 13 ++++++++++---
>   lib/intel_blt.h                |  2 +-
>   tests/intel/gem_ccs.c          | 23 ++++++++++++-----------
>   tests/intel/gem_exercise_blt.c | 16 ++++++++--------
>   tests/intel/xe_ccs.c           | 23 ++++++++++++-----------
>   tests/intel/xe_exercise_blt.c  | 16 ++++++++--------
>   6 files changed, 51 insertions(+), 42 deletions(-)
> 
> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
> index 00208fc243..1cb5e68763 100644
> --- a/lib/intel_blt.c
> +++ b/lib/intel_blt.c
> @@ -2076,21 +2076,28 @@ void blt_surface_info(const char *info, const struct blt_copy_object *obj)
>    * @obj: blitter copy object (@blt_copy_object) to save to png
>    * @width: width
>    * @height: height
> + * @bpp: bits per pixel
>    *
>    * Function save surface to png file. Assumes ARGB format where A == 0xff.
>    */
>   void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
>   			const struct blt_copy_object *obj,
> -			uint32_t width, uint32_t height)
> +			uint32_t width, uint32_t height, uint32_t bpp)
>   {
>   	cairo_surface_t *surface;
>   	cairo_status_t ret;
> +	uint32_t dump_width = width, dump_height = height;
>   	uint8_t *map = (uint8_t *) obj->ptr;
>   	int format;
>   	int stride = obj->tiling ? obj->pitch * 4 : obj->pitch;
>   	char filename[FILENAME_MAX];
>   	bool is_xe = is_xe_device(fd);
>   
> +	if (obj->tiling) {
> +		dump_width = obj->pitch;
> +		dump_height = blt_get_aligned_height(height, bpp, obj->tiling);
> +	}
> +
>   	snprintf(filename, FILENAME_MAX-1, "%d-%s-%s-%ux%u-%s.png",
>   		 run_id, fileid, blt_tiling_name(obj->tiling), width, height,
>   		 obj->compression ? "compressed" : "uncompressed");
> @@ -2103,8 +2110,8 @@ void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
>   							obj->size, PROT_READ);
>   	}
>   	format = CAIRO_FORMAT_RGB24;
> -	surface = cairo_image_surface_create_for_data(map,
> -						      format, width, height,
> +	surface = cairo_image_surface_create_for_data(map, format,
> +						      dump_width, dump_height,
>   						      stride);
>   	ret = cairo_surface_write_to_png(surface, filename);
>   	if (ret)
> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
> index e3084dc0cd..077283a088 100644
> --- a/lib/intel_blt.h
> +++ b/lib/intel_blt.h
> @@ -315,7 +315,7 @@ void blt_surface_fill_rect(int fd, const struct blt_copy_object *obj,
>   			   uint32_t width, uint32_t height);
>   void blt_surface_to_png(int fd, uint32_t run_id, const char *fileid,
>   			const struct blt_copy_object *obj,
> -			uint32_t width, uint32_t height);
> +			uint32_t width, uint32_t height, uint32_t bpp);
>   void blt_dump_corruption_info_32b(const struct blt_copy_object *surf1,
>   				  const struct blt_copy_object *surf2);
>   
> diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
> index 80a29ecab7..e8f16d7d88 100644
> --- a/tests/intel/gem_ccs.c
> +++ b/tests/intel/gem_ccs.c
> @@ -82,9 +82,9 @@ struct test_config {
>   	if (param.print_surface_info) \
>   		blt_surface_info((name), (obj)); } while (0)
>   
> -#define WRITE_PNG(fd, id, name, obj, w, h) do { \
> +#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
>   	if (param.write_png) \
> -		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
> +		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
>   
>   static void surf_copy(int i915,
>   		      const intel_ctx_t *ctx,
> @@ -98,6 +98,7 @@ static void surf_copy(int i915,
>   	struct blt_copy_data blt = {};
>   	struct blt_block_copy_data_ext ext = {};
>   	struct blt_ctrl_surf_copy_data surf = {};
> +	const uint32_t bpp = 32;
>   	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
>   	uint64_t bb_size, ccssize = mid->size / CCS_RATIO(i915);
>   	uint32_t *ccscopy;
> @@ -172,7 +173,7 @@ static void surf_copy(int i915,
>   	blt_set_batch(&blt.bb, bb2, bb_size, REGION_SMEM);
>   	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
>   	gem_sync(i915, blt.dst.handle);
> -	WRITE_PNG(i915, run_id, "corrupted", &blt.dst, dst->x2, dst->y2);
> +	WRITE_PNG(i915, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>   	result = memcmp(src->ptr, dst->ptr, src->size);
>   	igt_assert(result != 0);
>   
> @@ -182,7 +183,7 @@ static void surf_copy(int i915,
>   
>   	blt_block_copy(i915, ctx, e, ahnd, &blt, &ext);
>   	gem_sync(i915, blt.dst.handle);
> -	WRITE_PNG(i915, run_id, "corrected", &blt.dst, dst->x2, dst->y2);
> +	WRITE_PNG(i915, run_id, "corrected", &blt.dst, dst->x2, dst->y2, bpp);
>   	result = memcmp(src->ptr, dst->ptr, src->size);
>   	if (result)
>   		blt_dump_corruption_info_32b(src, dst);
> @@ -346,7 +347,7 @@ static void block_copy(int i915,
>   	PRINT_SURFACE_INFO("dst", dst);
>   
>   	blt_surface_fill_rect(i915, src, width, height);
> -	WRITE_PNG(i915, run_id, "src", src, width, height);
> +	WRITE_PNG(i915, run_id, "src", src, width, height, bpp);
>   
>   	blt.color_depth = CD_32bit;
>   	blt.print_bb = param.print_bb;
> @@ -363,7 +364,7 @@ static void block_copy(int i915,
>   	if (mid->compression)
>   		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
>   
> -	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height);
> +	WRITE_PNG(i915, run_id, "mid", &blt.dst, width, height, bpp);
>   
>   	if (config->surfcopy && pext) {
>   		const intel_ctx_t *surf_ctx = ctx;
> @@ -408,7 +409,7 @@ static void block_copy(int i915,
>   	blt_set_batch(&blt.bb, bb, bb_size, region1);
>   	blt_block_copy(i915, ctx, e, ahnd, &blt, pext);
>   	gem_sync(i915, blt.dst.handle);
> -	WRITE_PNG(i915, run_id, "dst", &blt.dst, width, height);
> +	WRITE_PNG(i915, run_id, "dst", &blt.dst, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt.dst.ptr, src->size);
>   
> @@ -491,11 +492,11 @@ static void block_multicopy(int i915,
>   	blt_block_copy3(i915, ctx, e, ahnd, &blt3, pext3);
>   	gem_sync(i915, blt3.final.handle);
>   
> -	WRITE_PNG(i915, run_id, "src", &blt3.src, width, height);
> +	WRITE_PNG(i915, run_id, "src", &blt3.src, width, height, bpp);
>   	if (!config->inplace)
> -		WRITE_PNG(i915, run_id, "mid", &blt3.mid, width, height);
> -	WRITE_PNG(i915, run_id, "dst", &blt3.dst, width, height);
> -	WRITE_PNG(i915, run_id, "final", &blt3.final, width, height);
> +		WRITE_PNG(i915, run_id, "mid", &blt3.mid, width, height, bpp);
> +	WRITE_PNG(i915, run_id, "dst", &blt3.dst, width, height, bpp);
> +	WRITE_PNG(i915, run_id, "final", &blt3.final, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt3.final.ptr, src->size);
>   
> diff --git a/tests/intel/gem_exercise_blt.c b/tests/intel/gem_exercise_blt.c
> index 7355eabbe9..4a9bc37298 100644
> --- a/tests/intel/gem_exercise_blt.c
> +++ b/tests/intel/gem_exercise_blt.c
> @@ -50,9 +50,9 @@ static struct param {
>   	if (param.print_surface_info) \
>   		blt_surface_info((name), (obj)); } while (0)
>   
> -#define WRITE_PNG(fd, id, name, obj, w, h) do { \
> +#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
>   	if (param.write_png) \
> -		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
> +		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
>   
>   struct blt_fast_copy_data {
>   	int i915;
> @@ -167,7 +167,7 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
>   	PRINT_SURFACE_INFO("dst", dst);
>   
>   	blt_surface_fill_rect(i915, src, width, height);
> -	WRITE_PNG(i915, mid_tiling, "src", src, width, height);
> +	WRITE_PNG(i915, mid_tiling, "src", src, width, height, bpp);
>   
>   	memset(&blt, 0, sizeof(blt));
>   	blt.color_depth = CD_32bit;
> @@ -180,8 +180,8 @@ static void fast_copy_emit(int i915, const intel_ctx_t *ctx,
>   	fast_copy_one_bb(i915, ctx, e, ahnd, &blt);
>   	gem_sync(i915, blt.dst.handle);
>   
> -	WRITE_PNG(i915, mid_tiling, "mid", &blt.mid, width, height);
> -	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height);
> +	WRITE_PNG(i915, mid_tiling, "mid", &blt.mid, width, height, bpp);
> +	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt.dst.ptr, src->size);
>   
> @@ -234,8 +234,8 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
>   	blt_fast_copy(i915, ctx, e, ahnd, &blt);
>   	gem_sync(i915, mid->handle);
>   
> -	WRITE_PNG(i915, mid_tiling, "src", &blt.src, width, height);
> -	WRITE_PNG(i915, mid_tiling, "mid", &blt.dst, width, height);
> +	WRITE_PNG(i915, mid_tiling, "src", &blt.src, width, height, bpp);
> +	WRITE_PNG(i915, mid_tiling, "mid", &blt.dst, width, height, bpp);
>   
>   	blt_copy_init(i915, &blt);
>   	blt.color_depth = CD_32bit;
> @@ -247,7 +247,7 @@ static void fast_copy(int i915, const intel_ctx_t *ctx,
>   	blt_fast_copy(i915, ctx, e, ahnd, &blt);
>   	gem_sync(i915, blt.dst.handle);
>   
> -	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height);
> +	WRITE_PNG(i915, mid_tiling, "dst", &blt.dst, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt.dst.ptr, src->size);
>   
> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
> index 7d0e8ed7a5..a7785edcb1 100644
> --- a/tests/intel/xe_ccs.c
> +++ b/tests/intel/xe_ccs.c
> @@ -79,9 +79,9 @@ struct test_config {
>   	if (param.print_surface_info) \
>   		blt_surface_info((name), (obj)); } while (0)
>   
> -#define WRITE_PNG(fd, id, name, obj, w, h) do { \
> +#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
>   	if (param.write_png) \
> -		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
> +		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
>   
>   static void surf_copy(int xe,
>   		      intel_ctx_t *ctx,
> @@ -94,6 +94,7 @@ static void surf_copy(int xe,
>   	struct blt_copy_data blt = {};
>   	struct blt_block_copy_data_ext ext = {};
>   	struct blt_ctrl_surf_copy_data surf = {};
> +	const uint32_t bpp = 32;
>   	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
>   	uint64_t bb_size, ccssize = mid->size / CCS_RATIO(xe);
>   	uint64_t ccs_bo_size = xe_get_default_alignment(xe);
> @@ -179,7 +180,7 @@ static void surf_copy(int xe,
>   	blt_set_batch(&blt.bb, bb2, bb_size, sysmem);
>   	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
>   	intel_ctx_xe_sync(ctx, true);
> -	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2);
> +	WRITE_PNG(xe, run_id, "corrupted", &blt.dst, dst->x2, dst->y2, bpp);
>   	result = memcmp(src->ptr, dst->ptr, src->size);
>   	igt_assert(result != 0);
>   
> @@ -189,7 +190,7 @@ static void surf_copy(int xe,
>   
>   	blt_block_copy(xe, ctx, NULL, ahnd, &blt, &ext);
>   	intel_ctx_xe_sync(ctx, true);
> -	WRITE_PNG(xe, run_id, "corrected", &blt.dst, dst->x2, dst->y2);
> +	WRITE_PNG(xe, run_id, "corrected", &blt.dst, dst->x2, dst->y2, bpp);
>   	result = memcmp(src->ptr, dst->ptr, src->size);
>   	if (result)
>   		blt_dump_corruption_info_32b(src, dst);
> @@ -326,7 +327,7 @@ static void block_copy(int xe,
>   	PRINT_SURFACE_INFO("dst", dst);
>   
>   	blt_surface_fill_rect(xe, src, width, height);
> -	WRITE_PNG(xe, run_id, "src", src, width, height);
> +	WRITE_PNG(xe, run_id, "src", src, width, height, bpp);
>   
>   	blt.color_depth = CD_32bit;
>   	blt.print_bb = param.print_bb;
> @@ -342,7 +343,7 @@ static void block_copy(int xe,
>   	if (mid->compression)
>   		igt_assert(memcmp(src->ptr, mid->ptr, src->size) != 0);
>   
> -	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height);
> +	WRITE_PNG(xe, run_id, "mid", &blt.dst, width, height, bpp);
>   
>   	if (config->surfcopy && pext) {
>   		struct drm_xe_engine_class_instance inst = {
> @@ -393,7 +394,7 @@ static void block_copy(int xe,
>   	blt_block_copy(xe, ctx, NULL, ahnd, &blt, pext);
>   	intel_ctx_xe_sync(ctx, true);
>   
> -	WRITE_PNG(xe, run_id, "dst", &blt.dst, width, height);
> +	WRITE_PNG(xe, run_id, "dst", &blt.dst, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt.dst.ptr, src->size);
>   
> @@ -486,11 +487,11 @@ static void block_multicopy(int xe,
>   	blt_block_copy3(xe, ctx, ahnd, &blt3, pext3);
>   	intel_ctx_xe_sync(ctx, true);
>   
> -	WRITE_PNG(xe, run_id, "src", &blt3.src, width, height);
> +	WRITE_PNG(xe, run_id, "src", &blt3.src, width, height, bpp);
>   	if (!config->inplace)
> -		WRITE_PNG(xe, run_id, "mid", &blt3.mid, width, height);
> -	WRITE_PNG(xe, run_id, "dst", &blt3.dst, width, height);
> -	WRITE_PNG(xe, run_id, "final", &blt3.final, width, height);
> +		WRITE_PNG(xe, run_id, "mid", &blt3.mid, width, height, bpp);
> +	WRITE_PNG(xe, run_id, "dst", &blt3.dst, width, height, bpp);
> +	WRITE_PNG(xe, run_id, "final", &blt3.final, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt3.final.ptr, src->size);
>   
> diff --git a/tests/intel/xe_exercise_blt.c b/tests/intel/xe_exercise_blt.c
> index c908800cf4..ddf9d188a7 100644
> --- a/tests/intel/xe_exercise_blt.c
> +++ b/tests/intel/xe_exercise_blt.c
> @@ -53,9 +53,9 @@ static struct param {
>   	if (param.print_surface_info) \
>   		blt_surface_info((name), (obj)); } while (0)
>   
> -#define WRITE_PNG(fd, id, name, obj, w, h) do { \
> +#define WRITE_PNG(fd, id, name, obj, w, h, bpp) do { \
>   	if (param.write_png) \
> -		blt_surface_to_png((fd), (id), (name), (obj), (w), (h)); } while (0)
> +		blt_surface_to_png((fd), (id), (name), (obj), (w), (h), (bpp)); } while (0)
>   
>   struct blt_fast_copy_data {
>   	int xe;
> @@ -141,7 +141,7 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>   	PRINT_SURFACE_INFO("dst", dst);
>   
>   	blt_surface_fill_rect(xe, src, width, height);
> -	WRITE_PNG(xe, mid_tiling, "src", src, width, height);
> +	WRITE_PNG(xe, mid_tiling, "src", src, width, height, bpp);
>   
>   	memset(&blt, 0, sizeof(blt));
>   	blt.color_depth = CD_32bit;
> @@ -153,8 +153,8 @@ static void fast_copy_emit(int xe, const intel_ctx_t *ctx,
>   
>   	fast_copy_one_bb(xe, ctx, ahnd, &blt);
>   
> -	WRITE_PNG(xe, mid_tiling, "mid", &blt.mid, width, height);
> -	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height);
> +	WRITE_PNG(xe, mid_tiling, "mid", &blt.mid, width, height, bpp);
> +	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt.dst.ptr, src->size);
>   
> @@ -205,8 +205,8 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>   
>   	blt_fast_copy(xe, ctx, NULL, ahnd, &blt);
>   
> -	WRITE_PNG(xe, mid_tiling, "src", &blt.src, width, height);
> -	WRITE_PNG(xe, mid_tiling, "mid", &blt.dst, width, height);
> +	WRITE_PNG(xe, mid_tiling, "src", &blt.src, width, height, bpp);
> +	WRITE_PNG(xe, mid_tiling, "mid", &blt.dst, width, height, bpp);
>   
>   	blt_copy_init(xe, &blt);
>   	blt.color_depth = CD_32bit;
> @@ -217,7 +217,7 @@ static void fast_copy(int xe, const intel_ctx_t *ctx,
>   
>   	blt_fast_copy(xe, ctx, NULL, ahnd, &blt);
>   
> -	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height);
> +	WRITE_PNG(xe, mid_tiling, "dst", &blt.dst, width, height, bpp);
>   
>   	result = memcmp(src->ptr, blt.dst.ptr, src->size);
>   
