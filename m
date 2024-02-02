Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D44DC4828E
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 10:27:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0970110E162;
	Fri,  2 Feb 2024 10:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d5TgCv1E";
	dkim-atps=neutral
X-Greylist: delayed 441 seconds by postgrey-1.36 at gabe;
 Fri, 02 Feb 2024 05:56:38 UTC
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD1110E2B1
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 05:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706853398; x=1738389398;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JQ+gkEC1BqByTUZcDs3vqMk92eMug4fV9AwzpxgFbIU=;
 b=d5TgCv1ELRFz60qAMbXohbzti6eTBXE7qMHroCj0miMjCL7EzFB6zynD
 A1kg8narVCMA2WQSNETPRTepoxRwDjT8i19DH6c/ntTwaW6p+TYLhzrH0
 lBsFyRFnI7O+m98WWO3/UyfirCxcz0zZs/SwZwCJn7ktYeQjKYPjFePfj
 99jVMIlxMcfMgKmQcSpA459Y9q1GaqTh55ks2Hn13jPdDfzg+RwAVarUl
 QpV8obvennJM35Q47eu8rVNPZIi3S+2ZXQ7HuJJKwQiB2bIha7DW7tVKS
 lrnaaxZZ7RwYuoc3SF3d5JxFgl3s6LWN+ctqA5QXwe/cTmIHI0z+DYS/R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="270468"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
   d="scan'208";a="270468"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 21:49:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208";a="31074209"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 21:49:13 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 21:49:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 21:49:12 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 21:49:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvh9OgsCvqtKge8nkSxisvhvL1Sg8RcqC+UMqHnUk9uRAjnjEo1SnfhdMph0JO0/QY6hJOTR5P0yHSKLvAzsiREOPZuKo02Im7rLN/teEkWt29qGtuAy7a9xIFHYjHG4WqsFh8MzEQ3LYLrjCZmvhf/ZQDOmhzV32LRWuSFomyntVBOdijaos1jiox0AsmuKoxq6HXKJq0BNb8pDlNLsc0svxUAA+s7tUj4u88GeJY7TlmKbRR1qw90oyyZMcfMSg7t/5J44TwaTOOqj1VEhNxEAal6810hPofany42S1cl2NgszWBqoSy9YV+z/zhVPn3kobub+wtBtGVOxP9lZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbBQ0SSgUHTQf3i9jMg13+uwSFwWOMJpUfrXsujM8+w=;
 b=Vjy5Nq9qOK8uBRfa54Z31rwucOG43n5aAXojCHZj0Iubi5YEQfjArqVJjFCO6jhuMXkEdqBxWLpIaWpIoR0UAMhlR9p2aucUvQM4NhlKFXe1GR+/sVFkESlsLAxJDDqKNKmTmY18U6SUuCbqqIJP7sNb6/pdV89rVhqqusE6NEpL0wTdOxBykECXGN4+xKbnz5ZzA2TspNRyGd81eRg8bCMYKmcL698GwufUA58R1gvouCqqP63XMWASQqA74UK9QGhnPcuUOJ98xfrIYeH3yHGuPPPz03aLj3zwd+6vOqpxMWLYoOlahaLCxR9v4RoybLbNVZoLaP7KJl9dP6FBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.27; Fri, 2 Feb
 2024 05:49:05 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 05:49:05 +0000
Message-ID: <3d031f71-19f6-4769-8ec8-755e2d95329d@intel.com>
Date: Thu, 1 Feb 2024 21:49:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel/xe_pat: assert flat CSS support
 for xe2
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240201103017.321466-1-matthew.auld@intel.com>
 <20240201103017.321466-3-matthew.auld@intel.com>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240201103017.321466-3-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0070.namprd03.prod.outlook.com
 (2603:10b6:303:b6::15) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: ddfb6250-3cfc-4c14-373a-08dc23b2aa78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4i5WsrnkiYcANI+WqfK3Cuoc7eMyToSdD/qXLGdadXX/LdDsCyQY1W6jP9MUM2VPIs12/piGatuIFzkS8E0tz03f4N4XnGEFOanFkNaF9VrnrHgioaEo7ykoW0BgAUOiR/tB/0tvNvT/KcFFOFgd3RnDcpr5JOcYzU+k+8MhiptsUKg0puLhe7hb378BnsIdYk1SYvLRxetT1k5TmvqXYK8St/pJL8wA+RxJS+tzA6rAzMXrCK2eIT6WGnDAfVbfUTgNwca/U+eFl9ELIO+IWNMtlw7Jh4j/WOgCXfKCPM066M/cjui653DVsCQAgPy6WlF1yFrdrXwhzZ1ZIJwTmFFeWOZHW7yE6ZKP/UC1aPoDAUSfuKtI6Ic6YzCtSpPzMN+ngPKOVWbkTIHeq877KTaZFr5aRdgB7yXPZd8PShdpsxfA6AC33qXePafTR7kHIluYfE9FfOOsfjZSt/Edqy5YLMU84/8/9RwMrT5i6ayyX5hO280v9MSmqrh59Rd4qt/atyvA4Uuxc8pWiMxg+b9oQAvKl1g8ieJL6fNqFEydEtVOgB/lwQ0WfeCjT+Gx9le6i1oY1Sm6TqajKcHR9G764Z7wSm+dK/LcgmYixFvL8qFEJ21DKt1Z95dY6fzXTD53c8bsihRHlw4fD7UJwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(366004)(346002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(5660300002)(478600001)(6512007)(6506007)(66946007)(53546011)(31696002)(86362001)(316002)(8676002)(8936002)(66476007)(4326008)(41300700001)(66556008)(36756003)(26005)(107886003)(2616005)(38100700002)(82960400001)(6486002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEtudXJmQ1VjVGxFYW1PbFNSOEd1N3dYemN3MEhwWU1zcEhUWnY4SGxYNHJU?=
 =?utf-8?B?SDNBdnVOcHQwbVpxS0JheHlYU2UycVQvYVBxeExlZ1hWOVlwNEliZjZ5NlE2?=
 =?utf-8?B?TDRtVFpuRXNzaDRlU2VYZnVwWjRodlJ6aWhISFJZZ1RITkZLVkh3R0VXbUM2?=
 =?utf-8?B?MmtndHVZeEFwYjRRSGMxbVVsZDVCaWZMTWl4N2JwS29RbmhXemx5VU5yTlJq?=
 =?utf-8?B?UHk1Tit4ajJxMTljM1dCTm1iNzRtN1pqKy9xSGh4cCtVSVNGdzhZcS9BRlVT?=
 =?utf-8?B?N3lPMVREbGZiWU92cktLaDUzaWZRWmVoZnN6Tm5aV0FTaGZVY3RYbEtlb2Vz?=
 =?utf-8?B?OWc5WGlpUW9KcUFmNHF1dHNEbGk5WWpwQml6ZENvQk1kTnR6ZTZJNTZHNEdz?=
 =?utf-8?B?SzNORno5dHJxRVdUakxPMFRCYnh0N0dJTU5ocXpLWDBzQlpIT1BTSUZicSs2?=
 =?utf-8?B?YUpqL0pnNGppRVEyVm9CQTZac0JOdm5QckMyRmJ4QkxhaEl0ZE9hd0h3c0VN?=
 =?utf-8?B?Z1liMmhEWVFvZEZiVC9ubFkybHllVkxQYUFlaXhWOEJtOTB2VWNKOFY3ZnMv?=
 =?utf-8?B?UGRiZUNieUYyNFRiZzR1eU9wWVhNaHdjNEFkdGtCdVRwblN1cERkaEhQenRs?=
 =?utf-8?B?c09wc2QwS0dpekt0b21sU0hBOVN4K2lTYzh2aU5mZlpuMjJudEoxMGUyUUVr?=
 =?utf-8?B?K2xqbW81b0pXZExydU1KTk1WdXBaV09YaWxPSnRaMWJNV3U3ZHBFQ3U0QXpZ?=
 =?utf-8?B?djVRRDRKZ0V2WmFyVm41aG0vcFdIVmFFWVIyaTBWRW13S3RZd3VCNFN2eGxF?=
 =?utf-8?B?Tkw3VXhFUnZEUkhMU0xOQ01mUVl5aWZUanErYmdrTnkxNklzVjEzNWxLQlB5?=
 =?utf-8?B?OTJ6djNPczJYbTBaeG5xV3hFQ3phdlVHQXUwdVhwcyszWWhCNk1Sb2hUY2NG?=
 =?utf-8?B?ZW9NUW9ZTGtKRGxkektITDQ3QVU5cmNPcCtZZ0p2R0FZcFQxcldxZHZ2U2lt?=
 =?utf-8?B?REdPeUZyKzV5U2lDcE0xQ1pBZmY3bjdkR1RXOFp1cHhyN1NoSVVkYjFJNnlk?=
 =?utf-8?B?ZDJvUmV6aVlIclY5alZheTJKdTNQY3lIZVI5elhBaFRCeEF6ajRlV0V6aUpn?=
 =?utf-8?B?WWJzUUJ0Ry8wUUVWVFpuK0Z2VFdFOTdWbDlDY0RXaFNWa2Q4YzJCdXJadUhO?=
 =?utf-8?B?cFB5SmFYKzlkVW9JVGx3VTV2OEZydGhZU29PQTdzZXB6am1ZZFJnemQ3RVpr?=
 =?utf-8?B?dlJPdnl2RkZVSEVLZkt4RldSNEhITlhQWEt0OWkxc3FvMjdjQ2owMkxHbXor?=
 =?utf-8?B?YUNLS0xWT24vb0RsOFVFVHFMSmdJekdicm1Fd2tvVlFGNHlOMkttS0E5NCth?=
 =?utf-8?B?ZWxkaTlEQWwrQXYrOWNZV2wvdWpmMWkzWWF4Y0dwMXRuUERQdzVMd0ErcFNr?=
 =?utf-8?B?QTc2QjBjZXdmWHdlbkxGaE1CUXp3eXpvMmR2Wm1BTDVOUitUL3VkajQxZWZV?=
 =?utf-8?B?bXo4NFU5RGZ1T2FaSGFsQUVVS2pjL1VDTmpFdE1SNmIvR2tIVGNBNEZpUHBu?=
 =?utf-8?B?MW8wbXBNbWl5YnhVaG9tTHhoQlpzTUlXU3hZZ20wME5JYUpVYzlBbUF0Qkxj?=
 =?utf-8?B?ZWFUODZCajFCUW90cWJQYzl6eVZwQ21TZFh3K3k5SG9Fc1l2U0lTSkJnemdD?=
 =?utf-8?B?TGUyaHd2dUs0MVlGbW93cm84RGFlT1MrWWVkYWlWaEgyNWJJT21nYWhQdmph?=
 =?utf-8?B?VkxhL3VqQmZQTVkxeG41VGplWHBhb3J3a2w4MS9OVERCUVVUL255R2o5WTBC?=
 =?utf-8?B?NjJkSEZZaDBGOHk5OE51MlFnRjBEVDBaTFVhTC9OUXJHNitxbzE0Z3ltdWYz?=
 =?utf-8?B?M0hzRUt3ZGc4djVsYkJXS25YZnVpNVNSV0NGYzY1enpJcFI2NHpMNEFSZllN?=
 =?utf-8?B?M2x4OXFLRjdZL2drQm91a0UvVDJKMks2WVZQcnF1WWlvUW9IN3QxVnZFbXhj?=
 =?utf-8?B?THErK2J2aXQ1dlRtU2RMeml0MVE0dTQ3b1ZXbjRMeVBJZWxGeVM3VlZSamp2?=
 =?utf-8?B?clRVL0tYcjhNL3ZnVkwwdWF6UW9IWGppMWtrejVWelM3aXo3R2hqZE5NUlZW?=
 =?utf-8?B?NTlHNkVJaWhObldXaUxpYm84cnlmbGt0LzVJTHZFY0Y1d1Awb2JZSHg5MnZS?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ddfb6250-3cfc-4c14-373a-08dc23b2aa78
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 05:49:05.1867 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E4vrV4850lJexhTCfpW+J89XbrjscTTgCBe3LAK8I4+m6R5iHb59QtuIF2ZxPyzfk9Y62rrtNEA6eYjDti6T2sj4S9xi1+xFuxMlVxD4SDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Fri, 02 Feb 2024 10:27:22 +0000
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


On 2/1/2024 2:30 AM, Matthew Auld wrote:
> Xe2+ should support flat CCS compression, and here we are using
> compressed PAT index modes. Assert the platform indeed has flat CCS
> here, otherwise something is likely wrong.
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>   tests/intel/xe_pat.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
> index 40256bada..3d7d7400c 100644
> --- a/tests/intel/xe_pat.c
> +++ b/tests/intel/xe_pat.c
> @@ -1049,6 +1049,7 @@ igt_main_args("V", NULL, help_str, opt_handler, NULL)
>   
>   	igt_subtest_with_dynamic("pat-index-xe2") {
>   		igt_require(intel_get_device_info(dev_id)->graphics_ver >= 20);
> +		igt_assert(HAS_FLATCCS(dev_id));
>   		subtest_pat_index_modes_with_regions(fd, xe2_pat_index_modes,
>   						     ARRAY_SIZE(xe2_pat_index_modes));
>   	}

Reviewed-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>

- Akshata

