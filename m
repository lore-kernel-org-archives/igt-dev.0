Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F9EC4725D
	for <igt-dev@archiver.kernel.org>; Sat, 20 Jan 2024 00:56:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2275110EAC8;
	Sat, 20 Jan 2024 00:56:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA3C10EAC8
 for <igt-dev@lists.freedesktop.org>; Sat, 20 Jan 2024 00:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705712188; x=1737248188;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=me5BYPplmbRrnji3s/1jWveKVNIYe1tLnsNvBlviqSM=;
 b=JxaSEqdXFa7s4yXcTpYje4oyOtCArBtQKOVXsQrPrYt1CvbqtQIqgJ5U
 QZYTdvFi1Byra/JKSxkfqrnDcYq0EoN9vD1M722pnnnvLhF2jfoJB+EG6
 WHNTiW4EK2UsO0PdbcGn4Sf2KJ3L8+Cm+JmKuytnC9b2JN13u45Ob2kIb
 KSq1SvuPFtYODUC0B2joKbpdMDzClu4Qxajivcr3syDjuBBKhwNozjv2B
 DhZZJO3aZn8I2j4llz6IENBfqbrtwz3x7sqeeR1uEYSX0OXtIK7Naq+ZH
 ZuGC5R48kCM/VXrt1Ox1XrtMrgzbYPDRDYX9A7JSf2WEgrScB5CrbWMc0 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="14243907"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; d="scan'208";a="14243907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 16:56:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="685635"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 16:56:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 16:56:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 16:56:24 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 16:56:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1O6eHagEBOPo+Gl46ar/5hR62deeqL+tTQlD348mN/NtMvcyRlRq6ofY8Acrpa6s7/mwQeCJCwP11LSAy54Zy95wKOvKBouHz87bznZzYcigEfr3Amf172IKri4oDsHOlP4JRyPKEX4kRX015/CU0qufjvluM1JwY6OcNdRVU2Dpo+fsUbph50crI6cFkZN19M9FQE/n8yLN3D30u8353Iucnt7kOEkNSfQuv0BqgUgvbrqOb8lO2SLYys8KCeYL7VlODhbcDGKEJPoEkc02pmh9shzXF0sjeTX3Y1fUBAXgWxJdPpbeHRiyjBJdpz1iSgsOlvxvV7KPZ1tWW0r5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4J4HEq+V8gaUqJ+ORIIRQePRpa6y9aC4GtK5yNSIzz8=;
 b=Rl/l98TXCk0KbmWQXNJIc7ftJ/+m2K3V3TccGWupZE0SbUfT9TTEDwuyb5ZJQDao01+qX4PjSag9x3imlKSphfsqo8ACx+qi3eUI2EMAEt4lpqy9Wqsec5jbi9mCtiE+dBYdIdWednKh8ILq976fMMzfZJwOT96T2VhqXaq7/m6qG+SOcdwfZ6wug1s3zfUaBtygXtHsVSp2FdwEPP8XjYXNJjMOPJ+j3+i1fmQ5WdLxhNKuFmts1RTemA/7B+uOLvDzkcqdlMryktZXNPUZUihVyhShNjGi7m3Bg9/D+X9BrDW/fv5eUm0ujX2PDUw+vuOHRuszYL8ueWLTIypwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by SA2PR11MB5145.namprd11.prod.outlook.com (2603:10b6:806:113::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Sat, 20 Jan
 2024 00:56:22 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::e4bf:f84b:b278:8ff3%4]) with mapi id 15.20.7181.019; Sat, 20 Jan 2024
 00:56:22 +0000
Message-ID: <64e5eae0-3f78-43f3-807f-5f3423b17ab3@intel.com>
Date: Fri, 19 Jan 2024 16:56:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/xe_gt_freq: Fix freq_low_max test
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240119170448.1889777-1-badal.nilawar@intel.com>
 <20240119170448.1889777-2-badal.nilawar@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20240119170448.1889777-2-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::7) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|SA2PR11MB5145:EE_
X-MS-Office365-Filtering-Correlation-Id: d1ac9149-9e5a-426e-0987-08dc19529eb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2lsfRMkXkazTjT9QzrAmzYLQwn8P95wgaUstL02r1ih8eYzzFy1RjIZpwPmdd8xo6E4CkJN15rzZ4yDcUaSzVO8neAKt8PLEYUlyKnEuk/O7vWCPI8JiY+LUXcfY4woLtkThChcP6AZ/PpBjLvFnzDfNpnWAiiQA22HrGG7njaaeI/fL6NHA+/oFzEkijax6fQ0hB/BwXNk5p1Bn0j0ZaJahvuO+Z2RBuzzT/C0qZCEgL9fIzjUBz5fWFmzYnSyIF+KCUbwcwiHAW6TS1V1+AVtzj+gDeNyamDjUQZA0QwCbaXduFTKoqAze4pRE+XIENnwVf0WyO8PinUGP9MUaEPHLGcYkEIdV0ucLVtFBAhtr/JrccTopR2+n5cmXCcuzgDM+PxUxLWuw14YhUg620F2GRzCfFNFjv2PTD24IEorgjxMAlYINarc5wq1NG2pUdL9RTut3zSvAc+A9ld58S7VuK4OSTbbb0qM8rUhWhl3N4J5vXK1KcwllbQULC79oyIMVQx/rObyzzvmo4CWEb+imDVIKHW23ILpLU8q68mIYtrHC1R6EiFlli9g+d1+GdaA4llZWc9yCAJXo5sHBBfnvDEmQ+zRkoANXrrI19yHXNarhqRkjaCeY2QyjjttxkzpboR+zRzONwlH3Uo9rSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(4326008)(8676002)(36756003)(5660300002)(8936002)(26005)(31686004)(66476007)(31696002)(316002)(66556008)(66946007)(6486002)(53546011)(2906002)(86362001)(6506007)(478600001)(107886003)(82960400001)(41300700001)(6512007)(83380400001)(2616005)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymx5NDN1MDAwV2JiVWFWdDlwVHFsSU90Nit4RGtscnNDbUpBRUlSd1haN3VB?=
 =?utf-8?B?WE1CcTUyaGpzUnZhU2tTRzJoR0ZmNFNDa0hRV3VQSzVxOHZhOE5zTkZvcVla?=
 =?utf-8?B?SU9OZWR3d0lJWVR2MVJCWXBqSk9XME81eDZtaTZXZmRkMGVvZi9PR3EraDRv?=
 =?utf-8?B?MGZmaC91TUI3blVjejd1eEpzc2FBOFlIVjFqK21PdFZrK25xTmRXRE5wZ1pi?=
 =?utf-8?B?K2hyekZvL016VkhYa1pGK1VlR28rQ3pob2xWcjhKMFh3VkNQNHNTQjRweCtY?=
 =?utf-8?B?eDZqM1U2dHZIR2NRUUF5dzJuN0hKM1FGTElyMVB2emZOTVFCYmE3UnBHMkRp?=
 =?utf-8?B?cXo1YndXdzBOcktxUjV4cmhqTU1FNGNKKzg5WUdnWTNubkU0aGZVVzlLTE1K?=
 =?utf-8?B?VUFlU2JDejFKWWZwQ1NxRDNZdXRGSkloT01vMmRvS3RFVjY1TEt2bFNEOFVF?=
 =?utf-8?B?OW9mcDFSeC9iQklHU3JvMlRxUi9iNkExWUtvUEFvdWJwQVFWcTZXazRvSG55?=
 =?utf-8?B?MXFlZ0tTK2tZak15WW9ienYxeFZYK3Z6YVU5SEIwRXhJUkxzLzBKTHRvSkUy?=
 =?utf-8?B?bWdiVXZGbVZMQnhtTjRoQmFtVHVUZG1TWWlIRTk1Q3E1Sno0eUIzS1cxNWFM?=
 =?utf-8?B?ZUtLalhSL2trc3liS3RueGhnblRBUWpIcVpZWXVqbkUrZDdtV0ZkanorTklO?=
 =?utf-8?B?aDR3SWo2cFhaVDVPeWgwbFNRMm5KdjR6V0l5QndHY0NkZncvWi83VUdtSFhV?=
 =?utf-8?B?UmVRTGk3RXBvUjYrcU1Uc2FaZlZDbjBZVFMvVGk2UDBBcGYxWmRnVEY0Y1o5?=
 =?utf-8?B?SXdrdno1dXJ1bVpONVBpZDZpTmdHZVZ0MHBpMVRaRlkwT0RGd1VlQjVEZTdY?=
 =?utf-8?B?bVlhY05TUGx0Y2x5VGkrYW5ESW5UcUJ6aVZvL3pKWWlJQytHb2gxenQ1aVlK?=
 =?utf-8?B?YmlVYmlRVWUyY01CTWdWajNVWFJSaXROdmFhM2hDWGQ2cGF5cVNHd0dBV01t?=
 =?utf-8?B?enRYOE5vRlcrRE9jQ1V4L1lsMERJa2RJMXZhUjFtTDJvR3JMRk1WWGt3eGxs?=
 =?utf-8?B?UnJBbEx0WHRXeDBBSVBDUGJzMmdOdWE1bjJ1K1BpM3NUY3pMY3QwUXNGb2I4?=
 =?utf-8?B?UTNuaVI1b2lpMVNnU3BFSzhTcDB0VXRZMFJjaE5ndlRKQm84VW1BWjV4UlpD?=
 =?utf-8?B?ak1HOGlJV1owZ0FVOWtvd1Fka085bDhuWXAxNEo3K1c4bVlRUkh2OUtiSHk2?=
 =?utf-8?B?ZGVhVG9uTGNBZlhJUTRFcUNuVDAzVmNqc0F5R3BrUjZZWVRlRmNiNWxRQjdk?=
 =?utf-8?B?SmkrOTY5OTlmbEpYRUZxZlRFZjM0M2djQkdQYnh0YnJQVGYrNGE0clMzeWdX?=
 =?utf-8?B?RmtTbWk4aENmOFZwQXNLYXpWeGg4QUU2NGdUeWY4ZGg0S1JDL1p2Ynk0TkNi?=
 =?utf-8?B?RFlqMzNkaktQTVpCV0RWZXErbFFHQjAwR3NybTdIOU5MTm1IZFJ6MUk3eWU1?=
 =?utf-8?B?bzNlektkWjZMS1N6N0JCeTlDV25LNCswK0svbnA2aWJtMVBNVTF3UXc3ZFgz?=
 =?utf-8?B?UVExb1pHUEhOM01ySVBKbW10cFpUWXpsVHNkVDBvdGREWnZsMFc4TnQwUUgr?=
 =?utf-8?B?dFhkN1N6dlVGbDNuYzljaFM5eEMvSlNPM0pxR2MybFY1bHkzSjVaUW5nVTdz?=
 =?utf-8?B?VldjdXBnWEw1dmxLVEd3UEx0R0t0c0d2QXBwdHZSK2RyWW9LTWRBcEN6Sll2?=
 =?utf-8?B?ck5uWHBleGlTY2dmSHp1UTZqLytpZHNISUZYK2E0b3FJaXJCV0Z5UXJHa3Er?=
 =?utf-8?B?MGFwRmxHK1ViVnMwYjVpalAyL244S2lVZ0tOb090Q2tzYlVjM1h4ek16SU5l?=
 =?utf-8?B?OEZUQWJLRm43TTBUNkFNY2ZrSXVSZEFLSFp2REwxUGlMK0ZZeUdkU3RGYkpB?=
 =?utf-8?B?QS9lNlExNEtNRm5RdHc2MUpDaGNMek1LbU9rU2lYMitqMmlIS2Uwb2RTTDMv?=
 =?utf-8?B?SzhMMHNKVWowMnpDOWI0cXlGanhzWjN3YkUwUG1LZjRnNUdVMmVQWnd5KzRS?=
 =?utf-8?B?RUx5N2VXRUFwTGU5bXp3WW8va2dMcTRzb01qYU5YTW9RZElnb3haWlROZzFY?=
 =?utf-8?B?QjVZallGMHBNQVNiOHlkYzBhZUcyU1VFWXlvcHoxUzlXclFKVGpVcEcyZVhT?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1ac9149-9e5a-426e-0987-08dc19529eb3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2024 00:56:22.1640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MyxccOcDteT4GD4R4CCgjGYalIEyHLdYGJuJj68WRuutpuzQzJigkEynVBgHLISQOCfRa3L8+3fP3tGvm3ddMYhx+hsiVn9R0NFkcS9y1qY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5145
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
Cc: matthew.d.roper@intel.com, rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>


On 1/19/2024 9:04 AM, Badal Nilawar wrote:
> freq_low_max test is intended to validate GuC PC (SLPC) behaviour
> when max freq set to less than min freq. As workloads are not being
> run validating cur freq is enough.
>
> v2: Validate act freq as well when gt is not in C6 (Vinay)
>
> Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 4334a8a41..bf63e4298 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -263,7 +263,9 @@ static void test_freq_low_max(int fd, int gt_id)
>   	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
>   	usleep(ACT_FREQ_LATENCY_US);
>   	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
> -	igt_assert(get_freq(fd, gt_id, "act") == rpe);
> +
> +	if (!xe_is_gt_in_c6(fd, gt_id))
> +		igt_assert(get_freq(fd, gt_id, "act") == rpe);
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>   }
>   
>   /**
