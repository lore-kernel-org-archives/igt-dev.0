Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54364CD1283
	for <igt-dev@archiver.kernel.org>; Mon,  1 Apr 2024 05:16:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC0A810EE9A;
	Mon,  1 Apr 2024 05:16:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FgLwtl9I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2550410EE9A
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2024 05:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711948593; x=1743484593;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QJBn3MN03eNfDxg1k2Jo4LeiPqa8zAQ8ZgCq238mgcM=;
 b=FgLwtl9IcGL6v3Yr4Tb36+rBz5oUY2PJ3SJ1z9cgcUhwEc6hwBubB9fD
 XA7UUmutEoE1dKlkDlmhyTuIphpiLTYYcaxz7GD537QnzV/YYwvF4+gy1
 RlosmPgOmxXalNVlLC7tn4sPuUjwryzVukiTTKl6un/Jt2Yz2K/yZcTnt
 Ru9Yed8V3fyrnblnBHoFyX89dQ/GgPfTPGrYB3MTOYGH/4PCk70+0+8uW
 ggk+5D9WYK4s7T82wp4FUJ2hCMolP2H2sNNRkuSvbgyRH5FxpKpokNAOS
 2HwsYK9vW9dfg52Om9Hrjz2OWjRTeki4/HWYTOnaBRT+HsjF3FKBl2OlV g==;
X-CSE-ConnectionGUID: 3v59vhlFRC2KUIlLXm8Ohw==
X-CSE-MsgGUID: m76pFGuGSzmyP8EFbdvO/A==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="18213585"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; d="scan'208";a="18213585"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2024 22:16:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; d="scan'208";a="48795902"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Mar 2024 22:16:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 31 Mar 2024 22:16:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 31 Mar 2024 22:16:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 31 Mar 2024 22:16:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0kH18/2XOVFsvqn9PufYUhUknY2Nsl8jRzVOahji6JIlQ1lwR2PG7XtH5HLJS0qfMrzKkjOsJjJGIgrBne3rUQ5s87nLo1YKk7TULP9d5CTW0jjnSlBfYSnfiGJ1lGVymf5oOKZhswpV/d41FYv/d7oY5sTkQZd+hdpTceauflFod6tgZtnnHqFcL2D45ae6Smd2tHupHtOW8oLIHW8echq3/JD5kjmIJNXpKnCnG/3y4uPqeAKnz+jMI/JyYZ1eXSSid/rvr/dxs9tLEx/c97emhM+zzwsyVi6+LYmVVtZmqhQytZBUsEM5raz+spSZd2LvSX3hl+Sxcj7FsQrVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=383Jv/+4+NiepVSwRi1YVDAxDXuvmSMzZwwN+PxQAfM=;
 b=EEm4+xMfedJqiDNjxr9XVOHWiZ0xCnjUR93pKhEz2tCK40E/ndosXLouSo/aiAa2kphT0lm+fEZezqQXNFhZTMHAKFgI+kAal0c1xmDqrheao6V9ZziZqes16EI7j3RKJIC/BlhGUycQS3+odvwaMbOvfMf0wEod6G69agNYCCyFlyrcgpiKLO+jK+GUW3vkFsEv2l3ZOKk3iXUgtXtILli2Bhg/RtaPNvfWXP0Kz8uCFw66ASAXBe8Qyxk+yowv9hyH1TmMO9PEDX5WoY2oB7hbYmYejg0NyZEnArBirntDJEFuWClNwrzF02QVLS8GEH6/nX213/lJXsCcq4PKng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA0PR11MB4637.namprd11.prod.outlook.com (2603:10b6:806:97::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.24; Mon, 1 Apr
 2024 05:16:24 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::31a1:93ed:8501:f2c9%3]) with mapi id 15.20.7452.017; Mon, 1 Apr 2024
 05:16:24 +0000
Message-ID: <93ad9ef2-114a-4932-9c75-68f31af23631@intel.com>
Date: Mon, 1 Apr 2024 10:46:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] tests/intel/kms_big_joiner: add tests for force
 joiner
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>, Karthik B S
 <karthik.b.s@intel.com>, Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20240328144554.1371727-1-kunal1.joshi@intel.com>
 <20240328144554.1371727-5-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240328144554.1371727-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::22) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA0PR11MB4637:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lu3N5Dqut2GvwfE6cNreSbWU5W/l0f5R0lBz/g9JERFpIAunIkgBHv3yr+3MenlFDAtsPgC8n3bUakILHt8zYeJ3JsT7Y/37XbOsAwgOMCEFguVuKbLjx7SFlYENLasTFVZA4XErb1SC3SUOhseEcwdN0OH2Ohh9/CYjVt90A8QuQn2adgHEzXL2Flx67RXOE8aOHivpjx7gSvQgc0ICHIV44vPiPJmP9ccWtupNlcBQ+Q36N6IcwusTmu8s92XJjPTkp4TnPkEITSNZd7XuBiLaIH+EoW5adFCLFpclccq3ehwpV1OgR3HGskcdu0jvNlHcmUjskDy0Begvn0+XcKr+FpifVuU8t3Ht0s/YZaVoF8tInCtqQCm3kZ0Ge2ZmHXRaBOECj9hwAzwAupl+v0rj2m8pDdkIzgpOXRgtXq47l5eKW8lNHcblT03ee//zPWpVNQOB0PG402AkYla2rogWST8ioolCL66dAMUZu0Og0Oq/yYFZQtL2mgz0BHmwB7UXXePsDUIOvjTHDK2Vagv6/F5mJK/O7PydcGU5GhfglsRW5VP0+sOwu87LQalQRO2WzgpTtivsiZ1VCLX3A/RzIy+HCj5HRrYdg9IjfAXZtgzyGEWHmbAt25p713mkuoQhzSs6oYTY7YwkuqsmrRYisjJg3YuYEbqoKotxvKM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXBtNGNKdkdoMDFKaDFqQnFiUTJBNU1PWEdnRGZYYkRNNnhESHdkWVljeFZS?=
 =?utf-8?B?alhkYTloekFkVnpKOVJtVll1TmdyZ2hoeDByaDFmTVRsaWlNYWdJbDNtUXB6?=
 =?utf-8?B?T1BvQXJrZUt4WmhLQU5TaFhObVlLMkhrUlhBVndiNnMzWVdNWktlcHdadjVJ?=
 =?utf-8?B?YTg2VlV1aUx0UUpXdkZlVkZIY1BoaVI0VS9nVVg3dkc5MHdzVzhtUFRtWWY3?=
 =?utf-8?B?emZTT0I0ZXNKM3NsQysxdlRTcHdzYURQeU9odzhFbVNCSm1kYXphN0RxaVd1?=
 =?utf-8?B?ZzducDV0R2UxVnJNNGJsUjlVdHhTbDlRSjR4VU03N1FEWjBaRDZQcmpMRFhP?=
 =?utf-8?B?WWFWRTc0aWR2R1hWUC9pTTNLNG40L2pRSnBadkw4bDNIT3lrazYrVGVNT2do?=
 =?utf-8?B?T0FIQm9zS0NWZFZ0bFZ6ZVh6VXlHanhOTVk1cFREL0pINE4zd2VtOFpoeHlO?=
 =?utf-8?B?K0pzMnBNOHF1bHhlNGx5ZHdsV2RGMEt0SkRKSVptS1hZSTM2QVZGdDBCYnhQ?=
 =?utf-8?B?aE4vT1B0eStORm1CbWZ0WnZ3dWNUL1IxbVdZcTg5YU5PK3NVWURwTy9ISVJz?=
 =?utf-8?B?V0ZCdUc1Z1NTL0ZFVXhRWEZWVVlHTXErdFNFR05qU0svOFE1aHE4L1VhekFj?=
 =?utf-8?B?aTJ1UWNtMk9CSWxIZHp6SmR5R1BpOWx4NnFwMWt4OW9sUWFvV2pJZGNGYXFl?=
 =?utf-8?B?d2RUSXNFSVB4WUZRdkdvVHVOMFpMZDZXUFoyb3Q5VlR3TzBSVVpaYzY4N2VW?=
 =?utf-8?B?LzRGa0NQd1RJWHQyS0xiRXRFOGttMDNhOTBueDFwQzdIOXpyeGZkcS9SV0Fi?=
 =?utf-8?B?VGczTDl4T05Hdk1ob3JhelpNUWY3U0drSXVieXJLZXpxTDlnRlZxTFQxNExz?=
 =?utf-8?B?WGowRUt0a1dsNkVzT2J3ZjdjQXo3TEZTeUswTnFhMDhkYUxoVDV2MTE1TVhB?=
 =?utf-8?B?UXFiMnNtVzRNczlSNFV5alFSREJwd1NQY3hpNFhrVVZZbUJjcCsvUUVZdFJL?=
 =?utf-8?B?Q3lHVHU4dHJsTllTcDhYRlVWZ25WZlB1eTRRMkYzWHdFSHFTZUNMWVp3dXdt?=
 =?utf-8?B?UnN6Q2xSRDRsTkVaTHdZRHkvdVlnTCtVTytEaDJNWDNqU3BkMlo4TG8wQWQ3?=
 =?utf-8?B?ZUJjWEZiR2tjWVNEWmFSTXQyaE5MNTA4Qm9NcXRJUytZK2g0ZG8ySWhUSGlt?=
 =?utf-8?B?L2V5ank0aC9ra2s3aFZXMDFDRURNZ3p5aHNIZGxUSURNeEpuYkZqczBBY2JZ?=
 =?utf-8?B?WkdvWVRFekM2ME9DY1NhOTBvT0cvZ1hZdm92dVJWRnFrYWRpL2lzbnJ0akdP?=
 =?utf-8?B?aGZQeEg4bFFPK2h0b05CNXozM292a0p3aGp2MkQxNCtpd0J1bjI1OWs3cm42?=
 =?utf-8?B?ZlEvaWduVFZ4T0hYMmdoRS84TXVNdS94b3ZWTG5QUWRCY3AxMFRkSGNubytq?=
 =?utf-8?B?STFacWVEeWdCMUhrSi9MTkhNbzlDQ3ZVUHlOSGhGS0h0TFJNZVFDTDB3MGMy?=
 =?utf-8?B?aFovUUlUVXRHZmhXdGEyKzRkL1I1QXV1VzgwWlFxZ0lTcGgybGZVeDJjbjNa?=
 =?utf-8?B?Uk5Vb1pWV0h5cEhOTjdUNlRjbm8wb3A4TllLZXprWGFwa2hDOXlocEFlMmR4?=
 =?utf-8?B?eTE1OU14TVA5VFYzbWRnN1lWREQ2NUhoSFJkWVZVSDA5VmY2QjJwWUZCK0Yz?=
 =?utf-8?B?alczM1Q4ZjFJQmpMK2U5bVhvaFpZUGtsKzdHM3dLOWZEdkxZcTlldllTSk1S?=
 =?utf-8?B?UkpLMTB4aTB2UVRXU0dETFhOcVhLNnNqR1RFTGg3QzVUZDRXM3UrUHBoTWxj?=
 =?utf-8?B?M2c0empLcWQyL3g1QVIxakNwd1VnbjB4bkZrMGlSTWk1L01pTy9oRzJiUnls?=
 =?utf-8?B?M2F2enVvNGtOczVSWjRzaDJ3Z2RoaHpmQzJvNHNBYWF1cld5V3FQNWVPMWYv?=
 =?utf-8?B?VWtYUHBsY2xyZ09qOUU1SWFpc0N2MmNIemZjRUFqS0hYSXk4Q2hxLytFcFFj?=
 =?utf-8?B?dGNMTU81ZEdmaHV0Vkoza2d3SnUwQmcxZEgrMHVzUk9LeGhEZ2QxVSs0b1RW?=
 =?utf-8?B?NXc1anpTTllSdjJpUWtSQjBqaWdFOWw5YmpkZWhQR0E5Yjlja2FSV0VhbFp2?=
 =?utf-8?B?c1Rta0VKS3c3cEgyZHErTnFrQjN0NndkRnNJNXEwcE41Y2cvWWR0YmgvVGpz?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b32ad3a0-7165-4030-09bf-08dc520adfa7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 05:16:23.9453 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v7sSH/ZIN6ZG4CKfPUigJkfvuNMjSU4/ZbODtyog0H+vTvLrk71tOMEWWmYuJiNqfUVnQtpRGQ38fFddQ/Esjmkj0LAFUEx/8txXXYSSrR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4637
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


On 3/28/2024 8:15 PM, Kunal Joshi wrote:
> add tests for force joiner
>
> v2: check status after forcing (Ankit)
>      take out commoon code (Ankit)
>      fix missing force_joiner (Ankit)
>
> v3: add doc (Ankit)
>
> Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   tests/intel/kms_big_joiner.c | 119 +++++++++++++++++++++++++++++------
>   1 file changed, 100 insertions(+), 19 deletions(-)
>
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index c13d58bcc..7daf47cda 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -44,9 +44,20 @@
>    * SUBTEST: basic
>    * Description: Verify the basic modeset on big joiner mode on all pipes
>    *
> + * SUBTEST: invalid-modeset-force-joiner
> + * Description: Verify if the modeset on the adjoining pipe is rejected when
> + *              the pipe is active with a force joiner modeset
Nitpick : This sentence should here.
> + *              force joiner is to used to force bigjoiner functionality on

Force joiner is used to..


> + *              non bigjoiner outputs, hence test will run only on non bigjoiner
> + *              outputs
> + *
> + * SUBTEST: basic-force-joiner
> + * Description: Verify the basic modeset on force joiner mode on all pipes
Nitpick: This sentence should end here.
> + *              force joiner is to used to force bigjoiner functionality on

Force joiner is used to..


Other than that looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> + *              non bigjoiner outputs, hence test will run only on non bigjoiner
> + *              outputs
>    */
> -
> -IGT_TEST_DESCRIPTION("Test big joiner");
> +IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
>   
>   #define INVALID_TEST_OUTPUT 2
>   
> @@ -79,6 +90,19 @@ static void set_all_master_pipes_for_platform(data_t *data)
>   	}
>   }
>   
> +static void toggle_force_joiner_on_all_non_big_joiner_outputs(data_t *data, bool toggle)
> +{
> +	bool status;
> +	igt_output_t *output;
> +	int i;
> +
> +	for (i = 0; i < data->non_big_joiner_output_count; i++) {
> +		output = data->non_big_joiner_output[i];
> +		status = igt_force_and_check_bigjoiner_status(data->drm_fd, output->name, toggle);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +}
> +
>   static enum pipe get_next_master_pipe(data_t *data, uint32_t available_pipe_mask)
>   {
>   	if ((data->master_pipes & available_pipe_mask) == 0)
> @@ -105,7 +129,7 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> -static void test_single_joiner(data_t *data, int output_count)
> +static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
>   	enum pipe pipe, master_pipe;
> @@ -116,12 +140,13 @@ static void test_single_joiner(data_t *data, int output_count)
>   	igt_fb_t fb;
>   	drmModeModeInfo *mode;
>   
> -	outputs = data->big_joiner_output;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	for (i = 0; i < output_count; i++) {
>   		output = outputs[i];
>   		for (pipe = 0; pipe < data->n_pipes - 1; pipe++) {
> -			igt_display_reset(&data->display);
>   			master_pipe = setup_pipe(data, output, pipe, available_pipe_mask);
>   			if (master_pipe == PIPE_NONE)
>   				continue;
> @@ -131,13 +156,14 @@ static void test_single_joiner(data_t *data, int output_count)
>   					      DRM_FORMAT_MOD_LINEAR, &fb);
>   			igt_plane_set_fb(primary, &fb);
>   			igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +			igt_display_reset(&data->display);
>   			igt_plane_set_fb(primary, NULL);
>   			igt_remove_fb(data->drm_fd, &fb);
>   		}
>   	}
>   }
>   
> -static void test_multi_joiner(data_t *data, int output_count)
> +static void test_multi_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
>   	uint32_t available_pipe_mask;
> @@ -149,9 +175,11 @@ static void test_multi_joiner(data_t *data, int output_count)
>   	drmModeModeInfo *mode;
>   
>   	available_pipe_mask = BIT(data->n_pipes) - 1;
> -	outputs = data->big_joiner_output;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
>   
>   	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
>   	for (i = 0; i < output_count; i++) {
>   		output = outputs[i];
>   		for (pipe = 0; pipe < data->n_pipes; pipe++) {
> @@ -177,7 +205,7 @@ static void test_multi_joiner(data_t *data, int output_count)
>   }
>   
>   static void test_invalid_modeset_two_joiner(data_t *data,
> -					    bool mixed)
> +					    bool mixed, bool force_joiner)
>   {
>   	int i, j, ret;
>   	uint32_t available_pipe_mask;
> @@ -190,10 +218,12 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   	drmModeModeInfo *mode;
>   
>   	available_pipe_mask = BIT(data->n_pipes) - 1;
> -	outputs = mixed ? data->mixed_output : data->big_joiner_output;
> +	outputs = force_joiner ? data->non_big_joiner_output :
> +		  mixed ? data->mixed_output : data->big_joiner_output;
> +	igt_display_reset(&data->display);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	for (i = 0; i < data->n_pipes - 1; i++) {
> -		igt_display_reset(&data->display);
>   		attempt_mask = BIT(data->pipe_seq[i]);
>   		master_pipe = get_next_master_pipe(data, available_pipe_mask & attempt_mask);
>   
> @@ -215,6 +245,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   			igt_plane_set_fb(primary[j], &fb[j]);
>   		}
>   		ret = igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> +		igt_display_reset(&data->display);
>   		for (j = 0; j < INVALID_TEST_OUTPUT; j++) {
>   			igt_plane_set_fb(primary[j], NULL);
>   			igt_remove_fb(data->drm_fd, &fb[j]);
> @@ -223,7 +254,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
>   	}
>   }
>   
> -static void test_big_joiner_on_last_pipe(data_t *data)
> +static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
>   {
>   	int i, len, ret;
>   	igt_output_t **outputs;
> @@ -232,8 +263,8 @@ static void test_big_joiner_on_last_pipe(data_t *data)
>   	igt_fb_t fb;
>   	drmModeModeInfo *mode;
>   
> -	len = data->big_joiner_output_count;
> -	outputs = data->big_joiner_output;
> +	len = force_joiner ? data->non_big_joiner_output_count : data->big_joiner_output_count;
> +	outputs = force_joiner ? data->non_big_joiner_output : data->big_joiner_output;
>   
>   	for (i = 0; i < len; i++) {
>   		igt_display_reset(&data->display);
> @@ -257,12 +288,14 @@ static void test_big_joiner_on_last_pipe(data_t *data)
>   
>   igt_main
>   {
> +	bool force_joiner_supported;
>   	int i, j;
>   	igt_output_t *output;
>   	drmModeModeInfo mode;
>   	data_t data;
>   
>   	igt_fixture {
> +		force_joiner_supported = false;
>   		data.big_joiner_output_count = 0;
>   		data.non_big_joiner_output_count = 0;
>   		data.mixed_output_count = 0;
> @@ -290,7 +323,10 @@ igt_main
>   				data.big_joiner_output[data.big_joiner_output_count++] = output;
>   				igt_output_override_mode(output, &mode);
>   			} else {
> -				data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> +				if (igt_has_force_joiner_debugfs(data.drm_fd, output)) {
> +					force_joiner_supported = true;
> +					data.non_big_joiner_output[data.non_big_joiner_output_count++] = output;
> +				}
>   			}
>   			data.output_count++;
>   		}
> @@ -316,10 +352,10 @@ igt_main
>   			igt_require_f(data.n_pipes > 1,
>   				      "Minimum 2 pipes required\n");
>   			igt_dynamic_f("single-joiner")
> -				test_single_joiner(&data, data.big_joiner_output_count);
> +				test_single_joiner(&data, data.big_joiner_output_count, false);
>   			if (data.big_joiner_output_count > 1)
>   				igt_dynamic_f("multi-joiner")
> -					test_multi_joiner(&data, data.big_joiner_output_count);
> +					test_multi_joiner(&data, data.big_joiner_output_count, false);
>   	}
>   
>   	igt_describe("Verify if the modeset on the adjoining pipe is rejected "
> @@ -329,13 +365,58 @@ igt_main
>   		igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are required\n");
>   		if (data.big_joiner_output_count >= 1)
>   			igt_dynamic_f("big_joiner_on_last_pipe")
> -				test_big_joiner_on_last_pipe(&data);
> +				test_joiner_on_last_pipe(&data, false);
>   		if (data.big_joiner_output_count > 1)
>   			igt_dynamic_f("invalid_combinations")
> -				test_invalid_modeset_two_joiner(&data, false);
> +				test_invalid_modeset_two_joiner(&data, false, false);
>   		if (data.mixed_output_count)
>   			igt_dynamic_f("mixed_output")
> -				test_invalid_modeset_two_joiner(&data, true);
> +				test_invalid_modeset_two_joiner(&data, true, false);
> +	}
> +
> +	igt_describe("Verify the basic modeset on big joiner mode on all pipes");
> +	igt_subtest_with_dynamic("basic-force-joiner") {
> +		igt_require_f(force_joiner_supported,
> +			      "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(data.non_big_joiner_output_count > 0,
> +			      "No non big joiner output found\n");
> +		igt_require_f(data.n_pipes > 1,
> +			      "Minimum 2 pipes required\n");
> +		igt_dynamic_f("single") {
> +			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +			test_single_joiner(&data, data.non_big_joiner_output_count, true);
> +			toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +		}
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("multi") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_multi_joiner(&data, data.non_big_joiner_output_count, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +		}
> +	}
> +
> +	igt_subtest_with_dynamic("invalid-modeset-force-joiner") {
> +		igt_require_f(force_joiner_supported,
> +			      "force joiner not supported on this platform or none of the connected output supports it\n");
> +		igt_require_f(data.non_big_joiner_output_count > 0,
> +			      "Non big joiner output not found\n");
> +		igt_require_f(data.n_pipes > 1,
> +			      "Minimum of 2 pipes are required\n");
> +		if (data.non_big_joiner_output_count >= 1) {
> +			igt_dynamic_f("big_joiner_on_last_pipe") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_joiner_on_last_pipe(&data, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +		}
> +		if (data.non_big_joiner_output_count > 1) {
> +			igt_dynamic_f("invalid_combinations") {
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, true);
> +				test_invalid_modeset_two_joiner(&data, false, true);
> +				toggle_force_joiner_on_all_non_big_joiner_outputs(&data, false);
> +			}
> +		}
>   	}
>   
>   	igt_fixture {
