Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597F6C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 06:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E258810E08B;
	Thu, 18 Jan 2024 06:15:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6684510E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 06:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705558536; x=1737094536;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GAmtjXbKoZrX4Q7z5n+CpSF5kp+dh2yOiuyuT69nvc8=;
 b=WhkEXvq19mHgu1SKwEUhBqHxsY0ChGhX9ugrhgiu8pucSM0e9DeUXlIj
 /wOABgdEPvJk2b210Z+pTKPTq54q5VTV86JzngMT7kPAaOtbs8TOtYuAA
 cXIO9plnWeTsltudDoSHiZFovnvlnHVzsF3E0MksJOMNUJwqv/AjtJ3ca
 l/8Tea07reX2VFLZsvkKzV0vt3M+miQHs6rt86PDtiW3nMNGBxTRi2f1c
 vn7GWeCEzhaiMmhVpMWUbxeSHXxdenzUei4Ilabd8iJgrVZmTx456JgUZ
 tnNiq1lpKEfylebjzro2LsQdWWsQ4OZjkoFw2UnsKIWLVuS5CIZesRsqA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7056369"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7056369"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 22:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="280856"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jan 2024 22:15:29 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Jan 2024 22:15:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Jan 2024 22:15:29 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Jan 2024 22:15:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDMLXvh7YzVszsF9hsXdcwo+fFw2e6zhXpBFBml+BSuOD81eZc7wct/YUX0m3HYUq+jIhc/p32P+axPhjJ06luH2P580i0zHsCeOL71k5Uc2jL70Alv19+drhm7EYRlDrcpfd+aTsPLlY7yPg9lTQa8IFWywu+OWjS2o1HGj5vqlSRcXevk7e0ZC5+w7cleHC4a4IfR/9Vbl6pwDcU9pxY3QT+b8zOFrHeXQyuASfAMUQBxygA5z+/qEGEjOvcEOvuaOaOxkeM3T9wsnhOTe1Ua163y3iGXXxV7/Rbw2S+gx4zXHkMKGZnExBDs1WDET4g/+DT9oWH+Wr66Cv9pQjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCKukWkp2nI4HllF1hKAeY5g05MDxP/5CIHELNhe2o0=;
 b=IhBTKqq4hl3n5VgyRsEM/VPnxX3vcLt9+fyqK1fCvI72OFfWXExHc8zL5eWIwLvXb0pof02p+RfJVPZqOPitXMaCv94YgzH9uLKzA5jUOYrXWIs4b3ukGrELm2uS51qpe2Wlf++qYKc3pedsK7ayRqt61TziL2MStsVqFUHPum5UPfdLsgB6NAOGcM03BAjE8sUWUmq0iGuZrcmR4cGFDx+sN2a/TbUkE3boKuY6XRnfNexstWhlcRUz2BDbiVS40zsz6kEpcuiARodX7i3tQlsXntMYYB8IyKNdKQD4O876W5QnRdo60il0jwVTYMbJ6LiFRmoEK1CqRVO0EkIamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by LV8PR11MB8772.namprd11.prod.outlook.com (2603:10b6:408:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Thu, 18 Jan
 2024 06:15:27 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::9cbe:76c6:c834:b88c]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::9cbe:76c6:c834:b88c%7]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 06:15:27 +0000
Message-ID: <761f6968-1f07-4d5b-a2dd-9482b44915df@intel.com>
Date: Thu, 18 Jan 2024 11:45:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] lib/igt_kms: Correct the check for igt_require
To: <igt-dev@lists.freedesktop.org>
References: <20240117141323.14994-3-mohammed.thasleem@intel.com>
 <20240117145308.26010-1-mohammed.thasleem@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240117145308.26010-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::19) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|LV8PR11MB8772:EE_
X-MS-Office365-Filtering-Correlation-Id: 45462761-6af6-4c53-82ef-08dc17ecdd00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2mPlqWE91ubAWyXjVh1VzTozS98+tDC32rLhR61sGHyOtf/oNqCrEp4jJLs9joHGrG9vWJrrRZW3pF5bGNs2eulnv/NQjChm1MquJftdNl3kfGaMVVaWE3nGY34jc1/GFPIcVjKKEJSdgmO+e07lEEwY43VOYwKS7ycVSnbNAM2baH/YIKpweiVkOZ+ji7V2XeJMSWrdSASXXT5LjxkdIXT8YoGsYrkZC0BEkeKFyj8/xFUGflGDQDAOxB+PNSv1QWm9HfvOq1Mx1vyf+tLniq5BlyTldI2sasWrCtr0u+j4JqmmUVc/8+vV4tncy96jLVO9O/yaqSxzv0pY7rEVRjJBwgzl2hcSFpaG6IAbKuvVNpAGjkpaVD63FUiR1kRoTYLaJqaXA/LnxKkzIpxbs5aqr6lDUPLVJochtheObbc0c2hHcoPHoAJuFnDtxAtfAnZOdDL8LXP5L8pAyA+9LjjvssqXr/m8VaRiTdyn8oC6znrsb3GA5Q0xEc+B3rw+jLSggXuDjVIYiMLVQoWwfCBEGs95NRP984+HVM5yhOBJLZ2Lddpy2Z6rmkskO23EOYVRXlp/VwLV7jdL68dZRXV3hd28btLyr0VgZKAF2Z12cTZ1RKzUuvatN9xyuYMNd+GsuGLu8Ni4BNUVvo1Uw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(136003)(366004)(346002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2616005)(36756003)(83380400001)(26005)(6666004)(53546011)(316002)(31696002)(6916009)(6506007)(66556008)(8936002)(86362001)(41300700001)(5660300002)(6486002)(478600001)(66476007)(8676002)(66946007)(2906002)(38100700002)(6512007)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEo0QUhtd3l5ckdabERaU21uU0tJdWp3eVVDNWdXUVQ0VC9mK1cxVTNLZkJV?=
 =?utf-8?B?cGgvTkticmkzQnMrSjJGenVnWERjMXJQQ3RmUnBkeDdWOFVGWFNVcy9YTXVU?=
 =?utf-8?B?UW1sNFdWMDUvZkFzWmRwSHJ6aHZzMnpIcnJ6R1FnMEltaFlpaEwvM3ZEZk9z?=
 =?utf-8?B?ak9pdDdjRHI5emVOYVBZbUprV2NIRmwwUU41dUlTUzVyQnN1MEx2eDZHNS8z?=
 =?utf-8?B?NkNWVE5PaDlQaXZZYTV1N2hMOVc5NWQxWHEvSGsxeWZsQUxBdVZhaXl6YmxS?=
 =?utf-8?B?OVJqemlGNTN3L0VwbXpOazMybmducmEwY2kwSHY3Q0JkVlBQa1U2MFRaMGhq?=
 =?utf-8?B?L1g4ODdmekdxYjlacFZCMUlTQThWWVBVREFIZXdxVllCSnhrcFJEVFZmamND?=
 =?utf-8?B?aXFENHFkTTIxNlc2WFpGZUhtWlkrL1JEL0MreU5lZTFjYVAyaHlQQTh1K0JF?=
 =?utf-8?B?QThzUGJRdWcwMGxaR0R2dzh6MUphZzV4TDBjMFlSRkVrN2o1R3N4ZEhySlkx?=
 =?utf-8?B?bXc1NTAzN2FrQVNCMGdkRzdNL1Y4alE5cUVEOC93ai9YUDlhSHFENDltb3Yy?=
 =?utf-8?B?K1lhMlhyZkhhcWV4ekN4NTRCWFJEb3liaTU5WnpidlB6RzJTcURHd2dFUC9W?=
 =?utf-8?B?Wno4dUo2c0J2KzQwRnpPZWhFeVp1dlZEZ09SZFFPNnJodHd2UmNtdU84RUZX?=
 =?utf-8?B?d3dTY1lnOE9QaWhOVXF4VXBEcHVpS2g4STNOazdtcW1sL1BMejJZUFplQW5r?=
 =?utf-8?B?Y0c2QTRncEVJbXhCYkpGZXVCQXRUM0thUUsyNkl6SXo5c3liOUdJTlQvbHRX?=
 =?utf-8?B?TGs5MU84bjVyaHl4ZnNnRUoxMGN2blBwZUdXUFVWRUF2RDcycDdBOUFZbURR?=
 =?utf-8?B?b0ZZZnVtYkg1dU5lS01jSzZwU2Zma25paW1jTlFSYTcwRXo1TXF4R0plY2hy?=
 =?utf-8?B?SHJlVGMrdGxGUngvMVM5U3JYSTNGa1ViQ3ZtM1VCNHJLbUdXSmVjQ2lvbDNo?=
 =?utf-8?B?NU81YWFpT1NzNlZUQWIvU0NidDRRenFrSkV3ZXh6WlhwNDA3ck5TbUtHUVN2?=
 =?utf-8?B?eSsvbFN1V2tERmZiMnJGbGRneW9tOEVGWTNMUmZSSXFPdlhwYmFGQnFWdmRJ?=
 =?utf-8?B?MFloaXgwVk15bXQvVUc3QlBOTXh2cFNzTjR4cDZ0czNPMUZCNDBmN0UzckNY?=
 =?utf-8?B?cERtVGZJbDRXaERRYkJwb1lVL0F6VW9sUThJTGVqeTJUYS9kVFNva2RiMzhL?=
 =?utf-8?B?MnJIQ2w2Umw0VkdWTmh3dnFDSVcwelJ4TUVFVHBVb3VtSVZpVUJPOElIU0sr?=
 =?utf-8?B?M0orbVgySmpjN01sRVZZU3VSeVpUbkIwR1VZYVErYnpiQUF5a0NQNWhmcFZY?=
 =?utf-8?B?ZFBzZW5aendEYll3bkZVZDBKS3dQRXRZT3hYdWJ5QzVuem9pZi9wbVBhK2Ju?=
 =?utf-8?B?NEh2MnNEYTJkZkN2U3R4K2JHc2ZNNytXK0RtbHh1RTZ3UFdhMjh3TE4vYXVv?=
 =?utf-8?B?QXhRUWNwWXROVWJ1R09tVC9SbWFlWFQ4RmREYmNKZFloWkV6L2lWVnhxU28r?=
 =?utf-8?B?Zmx4bTB0R3ZNc0lMaUQrblI3VnZUa1RpeFhWSnBFQXErckk2L0lnWk5QQlZ3?=
 =?utf-8?B?VTQyVkhGWmdSMENsOWdFK0VnMmkwNG5adEQ3bGc3ZGNHcE84YTFwS1BJQ2w3?=
 =?utf-8?B?ODJqZEIxOUdIbUdoRjBiYWI5YnNRUmJ6TUlGWFJCNTNKSnJnWHExSDFpV3RR?=
 =?utf-8?B?TW00ZW56WFp1bUloeDNPcWFtZzhPV01mZmZ0UTRNV21EY1lCbFVncEhhYXVW?=
 =?utf-8?B?ZE41ZEl3azFZMjBmUVY1N01yODlEb0dmSTdoVTRKMGZvR0l6N0ZPSThTNW1h?=
 =?utf-8?B?SWRNczI3Q0phZ2NMcDFpV2dWRFZoQ2xTN1ZSaXduMjNqcktxMzNnZTVzdU5V?=
 =?utf-8?B?b1FGM2pBYytENTlsNHhJRHhyYWlYNWxmSnNrQ2Fud1piajkyRVZwZVV4SzZp?=
 =?utf-8?B?aWVoYjdKS1U0MlZnbXU5OXMrWUFSbU5NeE5JWVNGMFVqMWdIZm5iUkNzaHU1?=
 =?utf-8?B?TSt3YzlIajQ4alhDeTlKeGwxYmFWdzQ2WUpFWnBHY2Z2ZVp6Qk5XdEp2S0RN?=
 =?utf-8?B?Q0JTV2lqNDlTaDByTm4zSmFEUHBMUUNMc3h1SkxHUjl5S2NrS2xmaHV4VDNM?=
 =?utf-8?B?TlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45462761-6af6-4c53-82ef-08dc17ecdd00
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 06:15:27.0420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pGqi7Lq9bU4HyjAJ3fa0hzCOslDZJr5zmmInaqn6/otiDP+N/0kNtsr5IeUnLlNTb1nAVeL19uQgumla45Jt2sXFt5Mj6HRgD3kjNxs2+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8772
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


On 1/17/2024 8:23 PM, Mohammed Thasleem wrote:
> The function 'igt_debugfs_dir()' returns -1, if it fails and a non-negative
> fd otherwise. However in the function igt_get_max_dotclock() the condition
> to check the debugfs directory uses igt_require (dir), which fails even if
> the dir is 0.
> So correct the igt_require check for a valid igt_debugfs fd.
>
> v2: Correct the logic in igt_require.
>
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>   lib/igt_kms.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index e4dea1a60..1b4d0d761 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6100,7 +6100,7 @@ int igt_get_max_dotclock(int fd)
>   	drmModeFreeResources(resources);
>   
>   	dir = igt_debugfs_dir(fd);
> -	igt_require(dir);
> +	igt_require(dir != -1);

Open() does return -1 in case of failure, with errorno set, so looks 
good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   
>   	/*
>   	 * Display specific clock frequency info is moved to i915_cdclk_info,
