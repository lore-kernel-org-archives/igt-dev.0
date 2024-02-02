Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BD2C4828E
	for <igt-dev@archiver.kernel.org>; Fri,  2 Feb 2024 10:27:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C7110E17F;
	Fri,  2 Feb 2024 10:27:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NOMPtW0A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E24A10E6C5
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Feb 2024 05:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706852083; x=1738388083;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=hONhDY+y8CRTqFfIcAIO64lslHYF2le216/2gHPRQoo=;
 b=NOMPtW0AKGcOqYqsQFk4UyfOYKeueylqkuoInkORO0imxKMj2jXZVX80
 /mMf+DJjLRmwbmsmE0ei4R+5XR/h0uYOBLwkC5WqZGXj5Vk8J57l6mvtP
 ESJTPMZ96A5iOnXdgc5PXO6eENfsHrOj19mBVLv5wlTie/R/yh7Do5u3A
 80XqgUTmLTiqrUxXZQ4igJPlC8bxXAxCR8BDD20eZIq5+c5l5l1+WZUAK
 KN+HXXtx7ubaZmVEoexw5XYNV9EOB5KJB46GlbQuepp31dmtJ3gjZfZpC
 Ek19xOD3jgXEW0twow/KtwGIHEVT94ibejK3Z3AJ2hq6npbPBYtfU1QlI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="394526175"
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; 
 d="scan'208,217";a="394526175"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 21:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,237,1701158400"; d="scan'208,217";a="4597997"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 21:34:38 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 21:34:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 21:34:35 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 21:34:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bdlAgFH1YB3p0jsDWuFbByXKcfpsGrXawdDe+MCdvbj39Sucah5PDBj1DSyWd3aKqDWYjsGb6v1eWMoAVDi6ktdF0XuXdu1u9iFrv2lpgNTP6Y7fH73jYXbmKS4j1SVwwL5/mZI5KysX3/vEC7dWTixwwOJjtTZ+zNOayjUa19lbQKNSak3bghOJ0R5vF26LnQyEdjTF99MrgpQ8aMYCNB/RTPIJuHcVieUXHdK3XIEnvuwyQSSIUIG30+lUlYjWFNtPlGwD63u3POWKONbvt93jDl78PF7QnpPXVsjdbC7jParoQ05ukhhCxIL1VQ7BnyQvX0I1mSScows+TFUTfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrwzqQP4c2Tw05JHMYBua637G25eeQhqapiGYiJ7rWo=;
 b=IA4a/AUTiCfTKzZUlSuxAK5kRAvbW3wkVUIrmEi3qhsKEFGWAsMU1YE9Xz/ZZhNsnqmfMw7KtR4K7gsSRm5fKk38ypLYGJ448nUiCAaeCyUDsT9vx6iDr1byOco179XKuW9C23x9fBpz96yDz21GcllLkQdIxtd5V71OBVLwInf641n4KdDXj7Lw3hNJmcyXQX2LRTwsSeYHU4/2Byl9n6qHpY4h8MjJgMJfUvuGnvnpiuCN+w6ZZUBYsnMTXl/u5IAEL4gCEG2mzku/mkewpSzXWA1WU3Afg6a/wGI4bgZCyQsjtd5eO/QS7JUi+HljyEzRjNFUhQb0vnAxAF3O5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by MN6PR11MB8145.namprd11.prod.outlook.com (2603:10b6:208:474::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Fri, 2 Feb
 2024 05:34:28 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::57c7:cb8d:3964:5f91%7]) with mapi id 15.20.7249.027; Fri, 2 Feb 2024
 05:34:28 +0000
Content-Type: multipart/alternative;
 boundary="------------7Howzezexb75iJrnLs0WTlyS"
Message-ID: <b749b213-424d-4211-be41-e8fa25a00bf2@intel.com>
Date: Thu, 1 Feb 2024 21:34:27 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20240201103017.321466-1-matthew.auld@intel.com>
 <20240201103017.321466-2-matthew.auld@intel.com>
 <20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2>
X-ClientProxiedBy: MW4PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:303:83::33) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|MN6PR11MB8145:EE_
X-MS-Office365-Filtering-Correlation-Id: 613dbf80-71ec-4feb-f937-08dc23b09faa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lF21DLwsdYjWlcK6BDeW3Biy3iTy8ptMERIxrsGsJLygyfm5kmOEuroj333YN6OeBKKqF+k3AZIytCbqB5Gi+vv9KnbCL5RCyg+QUKgoV2U9k08Q/uxAPwYGYN0Wr9ZYB02a9SHSCV2aRcgXzDg07DtkR7hgrCuH217nNl6DquApnlKov6hknFN2xPYyI1jpMjrwop3C3qjoHXiHFASp+MCh/WRHUUpHVnqUWQS776QDWy5FeZIYRlvuuSvvM9BSNXfq12Rn0l2NqLJN3QjeMwQ1jP64CQe0a2RA/XabvrWoSws7/PHiZEHqZD4y/PO/yQQ+YurYa0I+boZUBaKM5plEzNLcFLO2fIpv8NV6ET5ED7Rj13hBlRlDA6gRNOQIpegDt8Y/YoTdf4wgzNvWN0EJf9bb2hThDk6ozhZa8gewD8DnYqV0wu8o704s04VDVjbciT20PQ74O3Q9If7ThVg+aEAlf5loaVEzaMQ+/px8kKuXbPzmNULk3hncO9MHe65/BAoH4LRxcvDOLViCdSrYzXvgbvaxqjQpdfl+K36ScCygaxDzNw61sbmQf/VtvpLLR+wRewWSjHTosnJYuOuC3hcjFi5ZEB0ivcFktJjuKE+McdMDRb9sRwUCGB2RRjIEmxK4792A+hfaICuINg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(39860400002)(136003)(366004)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(41300700001)(83380400001)(2616005)(38100700002)(26005)(6512007)(8936002)(4326008)(66476007)(6486002)(6506007)(66556008)(33964004)(8676002)(2906002)(53546011)(316002)(478600001)(110136005)(66946007)(5660300002)(6636002)(36756003)(82960400001)(31696002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzJ5WWZzUUk2L0FCd2ZpWkFEejN4OFFpdUlOSlg1TitQeG5xY3h6ai8wYjZK?=
 =?utf-8?B?aElNWjB2SHFTN2xIV2J1ZFh3MytuWGdNM0JpTEIzUnMyMlJOVFhpM21QZi9U?=
 =?utf-8?B?bHlUZFJEdThTRllYOVJyTE1pOXE2RVRaSGNIL1JRN1RpS2Z4UUoxL1hoQllM?=
 =?utf-8?B?MVZBaE56ZE9ndm4vQUUvSkpNQStJUzNLTm9nT1dId04vUE5CcUFabXlsc1p5?=
 =?utf-8?B?SEJROVVlTFFwRzRWcnpiMGJyYklvb3hWTlhDb3pZMHJKcDJvcUFXSzFVbk00?=
 =?utf-8?B?eUM1Y3E2UWVFbUtQUVMxUnpOV20vTElqM0ZGMnB1TGNpRS8zRlVPeDZhYWJO?=
 =?utf-8?B?RFVXZjNlYVVmdXpCQk16U1UzN1hRS3hBZUlVT1Z5bE03RzFGMTV0ZXRZc2g5?=
 =?utf-8?B?enNyUzZKUG1pVlJud3BQZm1IWXQ3TWtQRGc5YUhWZ0hReCt1ZklVdVZaOGxZ?=
 =?utf-8?B?c2FhREVQSC96dEhTTlJxOUZWZmdHTktld09SUTk4eVMzMWN3djNuYWU5OEpq?=
 =?utf-8?B?RHV2WHQ5aWdsUUFqOStBcXJyT0hnMlg2M3k3dGJCN3loSTBFWkxiTzNONHV6?=
 =?utf-8?B?SnVxUDA1eDZBc3g3QjNUdXR4VHB6NzVXeCtZTTVZQ3VEd3ZycFBPR21HbHk4?=
 =?utf-8?B?dU9oQU5uTlRrTGRZY2ZyNzFxSWY5bU9ZR3Y0bnI1SSszQ3hRRmZCdnlCK2tu?=
 =?utf-8?B?UXFIdDVCU0N1TUQ4SkQ4NlIzR1lyR1dhUHBuMTlKRHhJR2dYL0VqSE56d0x6?=
 =?utf-8?B?SWxpMHpySU95TWN3VDRyZmlPQk5idGQ5QnlyOTA4Yjc5U2VTcTFIeGMyME9r?=
 =?utf-8?B?Uk5haWx4dUxOMCs5Q1VvTUNiWXJVNVdjYWRqNXN4YWYxNHdDSkpXMG8xNUhJ?=
 =?utf-8?B?UVpMMENEd0lWTmdTVXVhUlVtRXRnL28zVDRVRzBscC9YdnFHMUppcDRTUlNr?=
 =?utf-8?B?bUdsOGREcG5RY0NBRURaRkZRYW55dXpYNjBVUDFuL0U3c1J3OHo1Q1lsZzFC?=
 =?utf-8?B?QzJ6Y0FVNVZ4WElGMkxtQ2lYWEZwNzlCeWlyaGRIOXdGcjRScGZZbXNCS1BG?=
 =?utf-8?B?TVlzbk96WENZdzV3Zk04bXlaZG1SVzdpd1lkOUR5ejE5V0t2TU1ja0JGZWtH?=
 =?utf-8?B?ZTRIcndWMkJGb3RLVHJ1ZDlubFFaQ3JvdDRVdEpkSDJMU0wzb1lMUnYrTGNh?=
 =?utf-8?B?eHV1ckNSemNUVDVCdE5JQnNIYWErUlFmVHVCaWtYakcyenNGcldiVzYyV0RP?=
 =?utf-8?B?c0JiamhnN3REMmlyM29rMCtWenAzTkpyYnhaekd0cFVQb1pDalBSbnNzRTNj?=
 =?utf-8?B?RG5RWEVEcXQya3pnV3JWNUhFdUNzTnZzOG9zdzZOZjc0aURjajhJU01wTGRU?=
 =?utf-8?B?TDJ1dThDeTNjRmJEM3hGeFVaaGR3SFRDS0M2eXBZaE0zVHhJSE95WGk3bmpQ?=
 =?utf-8?B?Mk5JVXFZZXNYZzFobUFYUmNTTlJUeWhZVlpOeTkvakcrUmxueEpFcmh4QUpE?=
 =?utf-8?B?dUNESWc1ZzJma0gycG5lRCtKVjZQUUdzQTBjWGZEeDhmY2tJdXlXY3E1dFpC?=
 =?utf-8?B?SFVoZ3ZhTGFUcHh6SHpwMS9WeE5LTEt6REtxMUpKY3o1bEZnN3Y4YkZ3ekJq?=
 =?utf-8?B?WHFkWURoVHBtK3BES3ZTMHBsSTFTZTIwaEFpOWVyclIwTW1UTzc0QkZCZkpi?=
 =?utf-8?B?WmlCcDhGcndRNjZuY1ROL0RoRFhoMEYzNmI3UUxidVRrMmZLVlcvdm8wUktY?=
 =?utf-8?B?NCt4OFZEWG9IT3NTdXlYMXlaTEM1THYxd0JFakc3RFc1KzZjSTB4NkpGSVBG?=
 =?utf-8?B?a0NVZmdhakFPMWVPUW9XMTNOU3BPQkRXdEhSUkVqYW40Y3Y0R3JLSklaekZr?=
 =?utf-8?B?bEFmQTZiVDV5ZFRXT0h1WU1Ic2tyaHJSSkdEU0VtWmdYRmpDamQrTm1YTXo3?=
 =?utf-8?B?RkZRbzZsR2dURXRyTkRVb1lReVU1UFFkVjROcTB6QndsaENRTGJUU0wxaElm?=
 =?utf-8?B?UnVURGwxbDZiZ2FLRFhyUkd2SXVWUldPeFc0amFsZnZXMWVmcGdHanU2OXps?=
 =?utf-8?B?eTQ1djZlZ2ZveTFNdGFaTXpWelljWlA3eXZHNlVFNmZjQlF6MGtPSDhDZ2tx?=
 =?utf-8?B?U3VRMUdUcU9SZWRTVTZGTW5yUFhZRm5CVTFpZXdBeUljVjRXWXJGeWpBNW0x?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 613dbf80-71ec-4feb-f937-08dc23b09faa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 05:34:28.1520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LmMG8ss4nCy4VkEaEvspsJnfoWHrDyfDvg3hFBrOpdrjbjYjdJxrD7IicCVf392hGLD/2frOCKKh5LXKfxAlv3qf29u1LY8FhdK5h/oLhF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8145
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

--------------7Howzezexb75iJrnLs0WTlyS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 2/1/2024 1:14 PM, Zbigniew Kempczyński wrote:
> On Thu, Feb 01, 2024 at 10:30:16AM +0000, Matthew Auld wrote:
>> On Xe2 compression is handled via PAT indexes and flat CCS, even on
>> igpu. Ensure the device has flat CCS support on such hardware, to
>> determine if these tests are valid.
>>
>> v2: (Zbigniew)
>>   - There is at least one uncompressed test also, which is valid
>>     regardless of CCS. Move the skip deeper.
>>
>> Signed-off-by: Matthew Auld<matthew.auld@intel.com>
>> Cc: Akshata Jahagirdar<akshata.jahagirdar@intel.com>
>> Cc: Zbigniew Kempczyński<zbigniew.kempczynski@intel.com>
>> ---
>>   tests/intel/xe_ccs.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
>> index 7d0e8ed7a..3430db2d2 100644
>> --- a/tests/intel/xe_ccs.c
>> +++ b/tests/intel/xe_ccs.c
>> @@ -532,6 +532,7 @@ static void block_copy_test(int xe,
>>   			    struct igt_collection *set,
>>   			    enum copy_func copy_function)
>>   {
>> +	uint16_t dev_id = intel_get_drm_devid(xe);
>>   	struct drm_xe_engine_class_instance inst = {
>>   		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
>>   	};
>> @@ -540,6 +541,9 @@ static void block_copy_test(int xe,
>>   	uint32_t vm, exec_queue;
>>   	int tiling;
>>   
>> +	if (AT_LEAST_GEN(dev_id, 20) && config->compression)
>> +		igt_require(HAS_FLATCCS(xe));
> Just to make sure - above will lead to skip on xe2 if there's
> no flatccs.
>
>> +
>>   	if (config->compression && !blt_block_copy_supports_compression(xe))
>>   		return;
> This will check compression either, but indirectly via .cmds_info
> set to xe2_cmds_info in which we use BLT_CMD_SUPPORTS_COMPRESSION
> flag for block-copy command.

on a side note, IIUC the BLT_CMD_SUPPORTS_COMPRESSION flag doesn't make 
sense anymore due to xe2+ unified compression?

- Akshata

> Do we have any Xe2 without compression on block-copy?
>
> --
> Zbigniew
>
>>   
>> -- 
>> 2.43.0
>>
--------------7Howzezexb75iJrnLs0WTlyS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/1/2024 1:14 PM, Zbigniew
      Kempczyński wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">On Thu, Feb 01, 2024 at 10:30:16AM +0000, Matthew Auld wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">On Xe2 compression is handled via PAT indexes and flat CCS, even on
igpu. Ensure the device has flat CCS support on such hardware, to
determine if these tests are valid.

v2: (Zbigniew)
 - There is at least one uncompressed test also, which is valid
   regardless of CCS. Move the skip deeper.

Signed-off-by: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Akshata Jahagirdar <a class="moz-txt-link-rfc2396E" href="mailto:akshata.jahagirdar@intel.com">&lt;akshata.jahagirdar@intel.com&gt;</a>
Cc: Zbigniew Kempczyński <a class="moz-txt-link-rfc2396E" href="mailto:zbigniew.kempczynski@intel.com">&lt;zbigniew.kempczynski@intel.com&gt;</a>
---
 tests/intel/xe_ccs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0e8ed7a..3430db2d2 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -532,6 +532,7 @@ static void block_copy_test(int xe,
 			    struct igt_collection *set,
 			    enum copy_func copy_function)
 {
+	uint16_t dev_id = intel_get_drm_devid(xe);
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
@@ -540,6 +541,9 @@ static void block_copy_test(int xe,
 	uint32_t vm, exec_queue;
 	int tiling;
 
+	if (AT_LEAST_GEN(dev_id, 20) &amp;&amp; config-&gt;compression)
+		igt_require(HAS_FLATCCS(xe));
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Just to make sure - above will lead to skip on xe2 if there's
no flatccs.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
 	if (config-&gt;compression &amp;&amp; !blt_block_copy_supports_compression(xe))
 		return;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This will check compression either, but indirectly via .cmds_info
set to xe2_cmds_info in which we use BLT_CMD_SUPPORTS_COMPRESSION
flag for block-copy command.
</pre>
    </blockquote>
    <p>on a side note, IIUC the <span style="white-space: pre-wrap">BLT_CMD_SUPPORTS_COMPRESSION flag doesn't make sense anymore due to xe2+ unified compression?</span></p>
    <p><span style="white-space: pre-wrap">- Akshata
</span></p>
    <blockquote type="cite" cite="mid:20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2">
      <pre class="moz-quote-pre" wrap="">
Do we have any Xe2 without compression on block-copy?

--
Zbigniew

</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:20240201211441.b5yncl7w2pn6dwk4@zkempczy-mobl2">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap=""> 
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7Howzezexb75iJrnLs0WTlyS--
