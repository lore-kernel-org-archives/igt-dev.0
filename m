Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC09FD5321
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 09:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A24010EACE;
	Fri, 27 Feb 2026 09:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GamFd698";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6AE10EACE
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772185312; x=1803721312;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=w1IA+4gdoxTJoiswS+4mZ3irtK4uVY6bINQ4kuB6MJM=;
 b=GamFd698fCtesIXRV/n3wJ68Dxn/5Zla+UrRd9O9w78uPlN3t3Uu/S6z
 WWTeJ+NW3ZiAAvMWDd83SHmciUSnYh933wyaAtBHyqKDPfMtvXiQMJgiS
 JY5ZgYSRXPgCw+eUIbgLQCf/IOjLhr0zd2pf3g0JLoOeYC/oeYurjlLOU
 BBpPptQxOENdDtfFRqHE9JUiszVPUwLfWofokqa/lvLzNyRwL0NCtQcPC
 ry0Yqvv09W+QngGa+mC/2+LZ9bzPuuFFHyh0grUKrRVkioTrBuxRi4tT3
 FhJwacO7DASmYsvd1b8LKGDFjj/GwQ4+Dju/M4lnwtJJax8y1x3t9Sn15 g==;
X-CSE-ConnectionGUID: glEXU7U4SMGXKJY9orWhMg==
X-CSE-MsgGUID: GxUS6eT6TX+UXDvGP+9FVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73170890"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="73170890"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 01:41:52 -0800
X-CSE-ConnectionGUID: C6PqsiviThmbv+wLeegy2Q==
X-CSE-MsgGUID: 3lT5VZieRD6gsW+MmgJIEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="254629416"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 01:41:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:41:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Feb 2026 01:41:47 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Feb 2026 01:41:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYfaKYCSkVvPdBzsiFV9M0sZyytDTvIx9bt5P2AJy4Z2U/UJEty0bV9mmHnuFioH0w2gMLMH/ecgkK1y4V1dihVznArELYz/mBjv9H+JFmL3t7oT6UOpO25rbLd4MFssRT+SQ3nCqBIW7Gmtbnw6SuvJ4p4Vdj5VWshvu7C94zXwCTU21dbTCnlONseZrYfuR9rvqyvBYeFbctbG89rcLxN1rbRiux2pkx80i9TWLS4mtALQ8GWlc7AR4Xh4rHRH7wntnG+HcJNlGc3ciwOrhWNgWN9BnzYb4D6e+NeKsqaQLg1/KlOmNKv+JhTKrPW7CkvDQ36BBaH3GclXtQgzUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ml0BVtX/wDVHTiJl572ln7t6ZGirJgQb/tAm4Mwza4=;
 b=AQKh3/QsJz/k/6vKXnLEO4SZifgewXMTVhswzfySxc1CWohQBjHVc/lPsg3JMUKnYBiFHI4cnfH0LmTjVxVqbJC4Y7N+hX1YYBtSaUQA1wvmdNpG0pH+0gRvfMCBap4srj5g+49njtVHYDcCX7ttA4HDUZa8wjVb20QGqcph84Hrh2PENLcu7omulMxL01heWgixzqmmOixhd7bWmWL9METt3U7qnsWoNXxWvR6Ec158+tKM/R4uY8oq7+SVqZimEMai9YtvE1NSKk2ayMb2gyMOmgTE/sftK/s4iWKHGsrtduEWfVSFw7Lu97zypdTmPqk0CD55uJ87UvZdLSsW0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by LV8PR11MB8606.namprd11.prod.outlook.com
 (2603:10b6:408:1f7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 09:41:44 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::682f:20b8:f518:49b3%6]) with mapi id 15.20.9632.017; Fri, 27 Feb 2026
 09:41:43 +0000
Message-ID: <b631418a-c941-4f72-90c0-028da0db2825@intel.com>
Date: Fri, 27 Feb 2026 10:41:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] scripts/generate_iga64_codes: Add support for
 xe3p and xe3
To: <priyanka.dandamudi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260224082800.1581935-1-priyanka.dandamudi@intel.com>
 <20260224082800.1581935-5-priyanka.dandamudi@intel.com>
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Content-Language: en-GB
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20260224082800.1581935-5-priyanka.dandamudi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR04CA0108.eurprd04.prod.outlook.com
 (2603:10a6:803:64::43) To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|LV8PR11MB8606:EE_
X-MS-Office365-Filtering-Correlation-Id: 9582646e-4a2d-4ba6-6698-08de75e46a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: WXXPmP4Q3JBYplaUlulaJnUiLYzMJpgCwU5kH7sHyhhvFCD7gbL47Q/JLUAW2XcHB1igNbhbyD16alDj9d+BBxREUYdA4FhFXJX6J2pTlXoMO+VgB5z8J5bnzSTy7D1ZSq/iMXRSDhtDEvjdnveVXfngp7lbDX95YjNig0H3F2rRk7snf5+IcOWdNAQY/HdOGK2kHFDRyYtu81BgPbtICVclGguW1Wku2Yg1LPl5NbeAdA9tWFpUHelDXeySt/SN+wVcc7sPmGgbDrzkpSAz9luSDXAnfwEM0dsFaWfEgdBvJuJjEVPVJ7/lb+OnbDBJeXCQYPNrDK3L902IJux1pSSBFt2BUJrnVjtw4DCLjPR3jjbwQiSGU++VSxeAgFH4Kjr7/wXyD5jZ6rkOTZO3APWkXEZ4CdjjeQHRkp0CQj/CikDrjaBGq5XxQLSHz7qJg8i46Ld6aCvWCjI7v06OVZv9xonApGHwTVwmxcuBLuU156qye9rnatft31k/2B07mgCUV0Y46T6Q4KpqySPWtRZaNJTvh0MdR3DnlhCQLX5g2xW40bvGP5D5SzJ4BFfIERY9t2WnrELJFpGBNlBPitj9aM2F3CkQcFnPXFmvSiUgmrmH2tipZj7QZkyO9EZnesZYacA3UEaxIP2Kc0VwLNWGz8uM6w92kmIF/TMhywRva0fl/2gHUt/dCwZe+9rsReYrvHaAvGKIeURJW/gzO98ISK3RYCO4iXXXqsImcko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWR2ZnNKejdnYzI4MmI4bldnTXBESXkrNGxkK2FnbGxpZ2FtVnJUOVBpSWdE?=
 =?utf-8?B?d2FicXA0UVpCb3N2emVxOUJZT09tOHRwZ1FkdTIvUFUyWjViNXVUVG1MSFZE?=
 =?utf-8?B?aWN3Yms0eXdZZ1JMWkt1RSt2OUphbHZKUVZBK2tlb0ljWTl0YWQ5a3l4ZmpX?=
 =?utf-8?B?MVNHSlNzVnVGUVFvQ1lydE9JamZGeFNzSHQrTnZCSkJuRzZNZkl2ejd1SnBM?=
 =?utf-8?B?MXFySTYvUmkvaG1UQXFrUXNIVENTZU5pNU82NEtBekJ0Q1FTWHU2cGV3a2Vp?=
 =?utf-8?B?T1FKY1JTbjFqRTdYR2YzNzI1MFZib0c3N0YzY1pQM3NGSzlGc0dPcUdUa1Mr?=
 =?utf-8?B?L1owM1FZTnlUVjBPNk5sNlptTzF1Ym1PYnhKR3FXVG0yc2VVbHdidlpicWNa?=
 =?utf-8?B?RXA1ZnJia0szVFRwZXhxN1VHQk1HSUpQbUk5MmtJOEIwRHRJSCs1c0lSYVIx?=
 =?utf-8?B?QUU2emJObjhnbGZsODVpNVlJY2VseEFFL2RBczNJclhVRGJ4anFUSDVrNWpm?=
 =?utf-8?B?cGtlU2N0OWZIK1I4WkNMWWhVeFdYNDRUNEY1Ykg2aWs3ZjZwNG5qU2tpY2JF?=
 =?utf-8?B?YVBLbncxek9WUldtclpNWDQ1VU0rRzhLR1o4VFBPbVd3NHdPQ1JzK25JdEJn?=
 =?utf-8?B?M2p4ZTZWUk5XMjBxamNmVDBrbnNKM09uOVp0K2lLQ3JuV3drbG9ocmZQQjBI?=
 =?utf-8?B?MU9hT0hweEpYaUxZNEpVTHdVSlRlNHJKNGVrb2dhT29KUHA0SlRhQmZjZzlm?=
 =?utf-8?B?T0J4UWpTUXRGbFBsa051MERrY0xtWnRzZkpkSUhTSFp0OExlN29TemVxemxh?=
 =?utf-8?B?dUh5cVRMdS9zM05haHMvSjN1MTJ4TVZYaG5mMFZybjVsZW9hRlJ5R3lXeCtI?=
 =?utf-8?B?WVVCK1ArTWFZRDl1ZmkxdFIzZUR5dE4zbmY3akYvK09peTI4QXowSlQ0Si9L?=
 =?utf-8?B?QjZEWlBwRlpLS216cEcyMWQxMm5XaTI4STJzMVRmZGtGdUlqQU85QkVaUWp0?=
 =?utf-8?B?aFpuR2JOODVMaXc2WXd1am1qQXNpKzBjOUVVRHByWGU0WW1zNERzUmZySXlh?=
 =?utf-8?B?dTdTNSt5c2kzQWRBU3RDQm0xWTlpWFRweHlmK2Q1U2hzVjBxZm1HOXFSakFQ?=
 =?utf-8?B?d0IvMWdVNHJ1VVExRXR4bHlrNGU2MkRjTTZnTDR1OXVXc1VoWWRsdU1uM2h3?=
 =?utf-8?B?S3FJb1lpOHVRYXRZL0g1N0xPMjBqZDNRL0dGRllZczk0NWx0VW0wYmltNWJQ?=
 =?utf-8?B?djFEblpCYVY0RDYxQWFnS3hmK2JSVEpNZlYyb2grVnJQYWVGdFhCYml1MThl?=
 =?utf-8?B?NkYydG52WlhUSVE5ZmxWd2svMHEyV0E3Nlg0alZjd0lIQkNGdU5EdDRmNHRH?=
 =?utf-8?B?S3BXV1FnMzc1WWNsODJOWk1GSFdvVUt2RTlhdjJnQ0lkN2FGMDBzNklRcG1X?=
 =?utf-8?B?K3htVjBGdzJiYytHaDM0ckFKck5IS1Z3Z1pFMFFlOE8zT1JxUFczemk1UEV2?=
 =?utf-8?B?TWhnUGtaN3M2anljK1ZtYXVVa0pUd2ZmV0dtOGowV3NzR0JHVmczNTZNcHVW?=
 =?utf-8?B?UFE3cnpnMVBja2ladnMwYUlwTnZac1Z4a3laNmt5UUIzTWx3Nk5TZlJKQThJ?=
 =?utf-8?B?c3JuVmJLMTROVE9pVU1MRlE0SEZ1Z2pLV0phcTVDdy9CeVNubHpjMnd1NXlt?=
 =?utf-8?B?K1hVcGhoaUhPQm9wQnFKZHBRWlljOGplbnN0MHRnWFNvOTVCd1podWpETkNO?=
 =?utf-8?B?NExoN3RwaVFZUGI2WEF2b3Q0TDhYNHM1N1VnVmhqWWlKTzF0TjBuanpRY1Qy?=
 =?utf-8?B?RlJsZHJEMjl2NldPTHQ0MUNYN0hyR29TN3pjZFVtWnlqRTUrd2pXSFYzemIz?=
 =?utf-8?B?aTRzd0l3dGxteE1CSm5XTjZzWEgyMDgwWHBHa3I5cWZ3Q1NONGZza0RVM0VO?=
 =?utf-8?B?aWlQYmJUZVNaUzFVZFBIZ056SHJ5dzFCd2gxNFYrWm0xVncyMG5zYnRhZjY0?=
 =?utf-8?B?WjBjdjJRUUZ4YUYwOWJ0bVdsQ1kvby9sRVZGVlF5YUVGSzBMYVVxZTFPNVJY?=
 =?utf-8?B?NDc5NjFUa1lKaTlmbVcxakc3WUVIMWVNaTJvUFU0djYwYUFMT2VvK1I2Tllm?=
 =?utf-8?B?dUo1QVRuWFhGVUR1VGpqdzFUUW55SGFoai8xVW1CUTdNUTVsajdHQWN0NlJk?=
 =?utf-8?B?TDZCZDN0c0NtRDR0bUVwTEVFK05LZXgwR051aXJhZzRYRnJZNFVCczFFWmdE?=
 =?utf-8?B?TmVMdkJtYXI4N0ZxSmtKZ0gza1I2WWsvMUhnMXFMeU5TSUs3MHRvV2d4eElT?=
 =?utf-8?B?WUVwOS9KOFpBcXhVMFhrK1d0R3M1SnkrRENiM3ViM3pLemVHOFpDZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9582646e-4a2d-4ba6-6698-08de75e46a7d
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 09:41:43.6061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDgN/iDxR1+DNxyjGX87+1HKE7ta167HoF3hiryaTiYKTmj5Mv1DnGBS9R38Q6ZzfXkM6dKboHL2mfeIelpYiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
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

W dniu 24.02.2026 o 09:27, priyanka.dandamudi@intel.com pisze:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Add support for xe3p and xe3 for the existing tests and generate dynamic iga64
> codes for xe3p and xe3 for those tests.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
