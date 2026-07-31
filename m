Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42328C54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 06:03:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC3010E180;
	Fri, 31 Jul 2026 06:03:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLxHsX35";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51AD10E1DA
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 06:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785477787; x=1817013787;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=yaCducvYibHhizzes2x5FPLaxTE5QAJKASoy1bKeKQ8=;
 b=JLxHsX35oJpK8Ghf+jrYcOeF9DrQGWJpw8V1sB4Y77YjADl860gGyQaB
 +hxFpM5W+HynOI61Lu7Ukfpsn3Iyvm3ViMISc8uUPKU/Yt7U3rQYU0Ydr
 jYqyH5/cDBko1sBEVCX/TE4pdVccQGoHH9K2RYwhEYoBNOITuLEc2l+wO
 DOhJmSImdJYmPQjaaSlpG6d5dOq9Vd49zwQpJlLOkBTcpDteqEvNKyZQq
 Trre9xWnKLypg8zf8UEaD8ZbjWtr53zTcV2+E3A12Ymj2z1eCv1iQeIiJ
 hhcC+Y4BVNoBnRt8e1glhPOo7HOIcIL3VkZXu2lJ+C1FkFv5xcaCaddZp A==;
X-CSE-ConnectionGUID: pUIM9KHtQEW4nXjPEOTHag==
X-CSE-MsgGUID: v3VJmcDxR6qvh8jobCWSTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89782669"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="89782669"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 23:03:06 -0700
X-CSE-ConnectionGUID: OMqtCaZaSx6awZSpWQOdsw==
X-CSE-MsgGUID: pYkWkyo4Qv2G2y6m2BFTmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; d="scan'208";a="262465952"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2026 23:03:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 23:02:39 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 30 Jul 2026 23:02:39 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 30 Jul 2026 23:02:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FuiOYjLn5eVV6FolvUfiDjymcWvOxT8q4AD+CDchN/p7cTG4/mVRwYXl1QxObI8kb2uVqsasMk5IltP6FTsMWJKr9CSco/UdlatE8cwhVeOvtqe6D/eEVm+XkeJ1r6WAJk5xEKHorB+Y1Eism2gRYGNTVaPHhGNMVoljv++qIXR/Bch5RfAOVnd8mBYpa64MYmdNsT2xTQqyc/BB8xc03uxTarZMjbVwLAEzEHOJzhE4D6I0w8/CSR1z81XJ/y33ghxn+TEKg0Ckm+hJ4Rr7em+phWvc0JVmijKSSo1WsOfH95byKeYTBd7V2pSBqYvb2qPKLO+abYVUkhW4LtzcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Anf64YAheQDXoFsE2Es7fvdXkxPWUM4HZBQVJ9RmpzM=;
 b=rzxrJgoOOR07CiJHue5EaPZhKVhw5L7m67HoOy0tCbO76N9HcfMMeCtndu2O/oOnJOYCnadRwXWcP+Xl7jkyxTy+d+A3d+vCV9MjNYnwyQ9u1Q2gf40XEUaIC1RsP1rDFD9lBF1av73CZdbe8dZc6dGgL/BDDPlmBSzuuRk/0LLWLPqr9eEJdwvtbsp4wEnSL01WiqwrX1g+NorpLhgDgUkHuYgLZEPX+fj32SXyAq0nKrZqIYuX16Bkk0QYXErU1XFj2e7nID+XbczJ/GoX7l5Ga0wwBbXB4YP1glpgfcoe4TP+vk2omA56dMWG/q19G2+4AKJt+FGA8XEnsfOyuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 MN0PR11MB6112.namprd11.prod.outlook.com (2603:10b6:208:3cc::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.15; Fri, 31 Jul 2026 06:02:36 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 06:02:35 +0000
Message-ID: <9eb4bd03-21c6-4818-8ce1-07df3cc4d0e7@intel.com>
Date: Fri, 31 Jul 2026 11:32:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_feature_discovery: Fix subtest
 documentation
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260730114041.4084117-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260730114041.4084117-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0260.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21c::8) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|MN0PR11MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: a0a7df22-fb93-4273-bfe6-08deeec95166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|10067099003|5023799004|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: cnOx1j/AO/wsRdYm6OTbSMGN4OOEdEXrvjVkN9XfmYsREuAMkZd8PLMv+VzH3AmA/jOR9QCXL3zUkS/TnHyiEGDi2x8PJJK3fq4YvtsuK4WABX4mAGnklJgWWtk4xZeuxgk/WRdJAqqNWJum76Qh78V033iQnjxA2OoAdwYNYfr8Q20PqB1AebZFp5VVobiONNG4c7bwdCl5jB/zKwTrFh5aoop8veAcI4XcQiCvbTaLagKwnpoPpC3losJlkPGgZNwsmJSGzg0FFP95d+VPZJTDy5oCYG4vxGvqnZL0OBakSY5AQHSJKSw2fGDnZdXTkoe1Q0Ij/cCULJWTciJtPQ8FXy2nt6GLdtm6YATXk2VJsAlacEasopOE+h/3Kojw4IwdvIzLG6D9pLL8PFacSPu1sO+86W36+N41VZrnoT+VKGDBHqJ62Imfl4G6idGBYKfWTRE4Ed+fUL3tFgSay2qbxU5ZdSDMO1bes7xeOdPROeW6XSeB3kmSsDNcbZt3R9H6+Lvzqm+RHZzQ0IEqmi2uXvs7zRdvk/OkqzqNogufRYsm9CvEF8uKAZfA8c79oq8CeNBUQ6bdMZpKQoSQ3c5Qwhw43brJKgM+5ZZjIDGJEPDUHN6M/cNoXN3PhBsX2X87vYLD9U9JZk5Uczgyo0GNujR6YJcDKAV3tekPFxg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(10067099003)(5023799004)(11063799006)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3JGc0d5K1F5L25JSTkvK0pqemg4alZ5UTczYkI4RUI4b3Y2RzkzRFIwUW1r?=
 =?utf-8?B?K0pIZlJqdlJNTm94OGUzcHpZR0JBZktDT25nemNmOGg5ZzZRUFFZRlh1emFB?=
 =?utf-8?B?NWM0azUvOVBuVTdxSDVrUjBNRFg3Umt4NjV0ZHNYd1prRWlkYWpVSS9xSzZz?=
 =?utf-8?B?d3h0VXVWazVSY0QxRU45NklCeHFXcDVCbzR6MGRVTW5RVWNDdzlLUEJVblRj?=
 =?utf-8?B?Vjl3WFoyMDFJNmJ3NFYyK0luUzVpb2tWOFFKT1FYdzVyUHJUY1RacTBuTVl5?=
 =?utf-8?B?ZWFFTHh1TEVhbHBOanZTSENrMnBWbkwzSkVUaFExckM1RFNDd0ZRQlJ1d2Jv?=
 =?utf-8?B?YWlJRGIrVWMybVh0K1g1aEp6WWoxZXJxTXk1UHVWNk5NN0pkc3FJblBOdW9D?=
 =?utf-8?B?UDBRM0NOUE13OHNiS05rYWk3aDJUMDAxWnBOeUp6WmhaSkpOYXFGQW1UazBV?=
 =?utf-8?B?MjlEK1lnYThPZVRxMW9GRjd1RlVyYXY0MnBXamt6c2FjbUJwUU9tMHBsNytO?=
 =?utf-8?B?eUVteW0rOGFVV3ZvVnhiNEs0cHhTMDh2dXpPaDVwdWlIZTFlZHJhcTQ0cGpl?=
 =?utf-8?B?RFNYcXFRcithUWg5YkdSSjhvMzcrRisrd2ZOZk8vcUx3Y2RlakZRYzM1aTQr?=
 =?utf-8?B?UDdDazl2REk2emZDQmJBTk5zYjAzSVZ5ZGcxTXdKT3R6Q29tMEgybUNSY1dD?=
 =?utf-8?B?RzFjUDcvRFJ2UGlxeUVjVFJERERiWGlyNldLdVJiZncrSG9GZ2NhZFE1d1RY?=
 =?utf-8?B?K1JXSjB2UjYxUHh5Y3JLNlk4ZTh5UmdJUVliZUFnU2NoVWJRTFU1Zjl4WFAv?=
 =?utf-8?B?QUU1cGFZeXlBWENheVlJU1RITWZNM0xNdzVOMm1OWFNRN1ZxOVV4MVN2eWFN?=
 =?utf-8?B?ODVrdjdYYmpjR2VHaWxDcGpwaVdIOGNObDBOdlVSZ0w4SDRBSkVSbkNNSDlF?=
 =?utf-8?B?dGVUMlFWVjZvTHBKS3VTdWJudzBWZWpEWkV6Z0lwSmxXL25EVTM1Nk92R2pK?=
 =?utf-8?B?R1JzRWptbEhvWGNZOXBjK2crUHNjd3BQQjJTL280UXA4dHFZTys4bDI3Qjha?=
 =?utf-8?B?K1kvZnQ2OHphWmp1VktEM0ZvSTBEMU1pSFB2Q0JGcThPcG1Fak5vVEJmTEwy?=
 =?utf-8?B?R3FUNkh2OVJBY1ltNS9tRnJLTmZGekZndHlWWEdCRUlFZlE0UDhIRHgwWFVT?=
 =?utf-8?B?NFNVc09Sdzh1cTRwY3VuZEdxSDV3eU9kR2VrOUdsYVR4ejRwMWJ6dllnd2s0?=
 =?utf-8?B?dkZ5N3J4dy8yKzRBbWM3dHBjNjB0eVM3RWFDTk9nL3ZraUZPQjBkT20rakY4?=
 =?utf-8?B?eXNScC84cEVhdkVmRzZkUkNENmNTLytVb0ZhSmpzalpKSi95Q3Y2UWc2Z0F3?=
 =?utf-8?B?YkZuR1FkZW1tSmFhenp3N3J2ZmZOeWszam4vdnROVFh3LzBMK2ZUdG5lWW5B?=
 =?utf-8?B?d0FOdTBPUjU0UjVQVXZuVWFsMzNLcWhFc09Kb2F5TlpwVmtnYTBDdFQ3V3Zz?=
 =?utf-8?B?TXQzbFdBYmpyYzg3SGovVUdJelRmbGExZ05Ta2haelRya3U5QnhZY1lUSnQ4?=
 =?utf-8?B?Nkx4ZXJZbXRlT0hyRThMbDJQT2JwMW5ETTM5RUhoTExpOWQxK2VZN1hpRThD?=
 =?utf-8?B?NXRualViZVF2VWRtdzZCR2VWTlQ1UHlabGVnMTBKekFQbjIxTi9aaGI1eTVz?=
 =?utf-8?B?TEJFZ1IxUnYvN2VuY2tuK1hmQWxOTXdoTXQrVmcvUlhnSmlxZmdRNWFCeW1B?=
 =?utf-8?B?SFRjWmUzUTdKZTJJMVpUeUtrSllVSEo1WkVUWlduMitOc2wxYi9rWk1Ja21p?=
 =?utf-8?B?Zjd1R05RUzVXZXpTZ1RrL0UvbEl4c0d1dkxRVHpLTjVJd3pxSzVXY3FuMjYz?=
 =?utf-8?B?ZGM5a0Y3cTZHV25VWkRmSEU5bXVpZnJtakRUWWlqNDNYaHhiTWZ3cjJPNlA1?=
 =?utf-8?B?ekY2VGZBU3BTVFdLQkNScWVOU2htVmpLSlRXRk9uV2xnc0RTRE56a1poTllB?=
 =?utf-8?B?RCtZS3dld0ozNkNsOW1BcGx3WmdtZEI2VjhMQ3o5dC9jR3RCYkMwZ2pXWFdK?=
 =?utf-8?B?M25QRkQxOHprZFRzU3ZrSm15T1hiTXVxYlJDNTc2dEVmVkV1YTh0bndtTDFk?=
 =?utf-8?B?VFptUTN6aHhsQm5VYXhBMzFNSGV5UndOc2owSjJkbVY3SVQzVGFNQlBZbTlC?=
 =?utf-8?B?MVMxV2lXa0tuT0V2YTFPcStuNjhaZkppbjJ1UEdSbkM4OGs1WGNGSE0vRjFU?=
 =?utf-8?B?ZmZ2TjhYVkgvZGJzcTB0THpDY0hrQU05MFFRWENzT3ViWnRBVmRVMnJ0QzI0?=
 =?utf-8?B?WVJkbElrVytDdmJJNlE2NE5xZkxKbEJpNW5pdmpyMkVoZnQra3dHY2dSS214?=
 =?utf-8?Q?HdTrKRePnIAkCM8fG1jxv7re9KoRdZVYNErNv?=
X-Exchange-RoutingPolicyChecked: RM6urh2wY84UmDr+adAdXiWyQFZCqIEayGndqjGN8hz3o12/gvU6ioujs0yT0tXSchqYoVoxbZFitoksdzRqO6etnscVn7Q20s+WT2oN8VLgzcVFgyd8MEjHywrriYfIVfIia56CV5nGoRLQdxklRGpv7S8/TBx4wXOAnXLZefH26Xb1vrEaeDQjg6jCBLzV4wG56uUFCA3+t7tjXR49lIPByDFpQlEv0sPxTa59RFtEONClufXSEu873c/ff6uaLJL5/Dn+9vfjD6TYIoutHb/s2dNIavUaNHmmz71KA/2UbtbTHg59nEMarUKPZR+5sOE6BwtzDsTwVTQKM3r0bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a0a7df22-fb93-4273-bfe6-08deeec95166
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 06:02:35.8132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QL7NBA8LHFZpHpYE7ugIe15IlvdpoPx2bJiAGcVBYdA4oW/8k0qg93bLuuU6KfFDSUza5xtMZ1u5MfLjYeQjlKOpHv/uapQoW7K9rBUszd7+fVUw8EEC/QYYBUESfy/O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6112
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



On 30-07-2026 17:10, Swati Sharma wrote:
> Fix VRR and DSC mega features documentation.
> 
> Fixes: 2609f72fc ("tests/kms_feature_discovery: add HDR, VRR and DSC discovery")
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>


LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

> ---
>   tests/kms_feature_discovery.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index 97bb25360..d18272b97 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -70,11 +70,11 @@
>    *
>    * SUBTEST: vrr
>    * Description: Make sure that we have at least one VRR-capable panel.
> - * Mega feature: VRR
> + * Mega feature: Adaptive Sync
>    *
>    * SUBTEST: dsc
>    * Description: Make sure that we have at least one DSC-capable sink.
> - * Mega feature: DSC
> + * Mega feature: VDSC
>    *
>    * arg[1].values: 1, 2, 3, 4
>    */

