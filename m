Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C42E7C5475B
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 18:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EE910E073;
	Tue, 20 Feb 2024 18:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JiV+O/YL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2903210E073
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 18:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708454797; x=1739990797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1ffZbeEF3Ng6r87A1qdcEj3Xqwft/C81GXZjh95yYNE=;
 b=JiV+O/YLC8TOXTd43qXtCSNxZZn+ZpSH7oyV8NN68Lrv+dnOVkqoQG9s
 QhFNg4lzUHPVZl/wmMueDRL8RIzQWLdw/jGGazCPDHODJsBLxEtmKBW8z
 pQJKHzFlVrkvrCK3O7+oONS0+/iULG+rHP0W23g6d0Al63ue09BY01h4d
 eHAj7SHIIabfcumLyfoJnugPq5Cjjovi/L9CXwH9GvI0bIXmRXIbAj8Oz
 21K9olFuK5VDAbCZLkrT9aTv4rgFaE/uLkm806wgYAHFWyjVJOPx+q0il
 E6iGlHCMAUwXIfPYDRdjGfRZYJQ5c5ChjcWCQSv176CLOuC3yCmnbI7AJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6404691"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6404691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 10:46:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="9476463"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 10:46:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 10:46:35 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 10:46:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 10:46:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUE6EZt13mlhwRE1+W73ffVOEpM2sjuZfVUmR9hhRAeyxelUqbpc0UtoXkp+We6pNeQaNtCznfppq/UzxBwuEr9h7S7Gjm6L/s9N2QDyToRLSxcyo2lLYWGnEr5NZpVsPkk14ldU53fNz8ZTH64slITXoj06nvnlQeT8mYzmDn9EC1E/qFp6uG2qXpGWJR/4KADQwLBXKWJDREV/5E1y2h7zmyn4jdbqvu8ck4JqG7UCxyZKTG1SCgUxsqS5mpKMiIrhxvvBnQqciUF/PCYsLu/7kM4S2zrzpgLsrWp1ruUtHnnsJ4mka8js8ECCmGgiIHRBNihGj9LaKJTziqm39Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnFEPgfc1VchDsksPkzPcgzS2Zz1tUGkr4iC7SCnPS8=;
 b=QMLOiIRZ0KQPoVwAGYifTcKruoWn0ysGSLqcx0S0/Tx2ApvlGxmY412NMSz4bS48M9jR8z4Hb/sO2eOfpBzwNdDzPBb3YCic3o64VTDFfe9B9tZPIcNM+Dc+4SKaKjsA/INyv0ikk774VCdAl3AH6mm/yKso7k+sdIXnHiE8Vk18jk3jA3JpxG2Is+SpkKJYVt9LPygpoeA5w18ykUYhHq2k9s1D7RBzENSBTazBTDFUZRl5/OoMQnFtiCjEwuoyWFY+c5S6UEZe867IomXdctlmyedeg3g4/9z6/OeBR7fYSX1wi93GPfODMiUwILC6k/RXwKHL/9uRqIHt9zIvEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN6PR11MB8147.namprd11.prod.outlook.com (2603:10b6:208:46f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.32; Tue, 20 Feb
 2024 18:46:33 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::c590:37b4:ad48:cd0f%3]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 18:46:33 +0000
Message-ID: <c49c01a4-ca4d-42f5-9167-9afe8b566b64@intel.com>
Date: Tue, 20 Feb 2024 10:46:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v3 1/2] drm-uapi/xe: Add test to query GuC firmware
 submission version
Content-Language: en-GB
To: Francois Dugast <francois.dugast@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>, "Lucas De
 Marchi" <lucas.demarchi@intel.com>
References: <20240219143501.7-1-francois.dugast@intel.com>
 <20240219143501.7-2-francois.dugast@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20240219143501.7-2-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14)
 To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN6PR11MB8147:EE_
X-MS-Office365-Filtering-Correlation-Id: ca5c9fa8-1d1b-4962-4251-08dc3244424e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A2AREq5UzUYaOrRvdHU9KzCzmZhwa0LV5PEekcWSiboVWBLSxTkyzkexYgaVZR1M7zcJDlE+Xlz2nw/kCwObL9uJlXrJ2PiqvR37iVPGkv99H5LgIhdlTKHfrSrLSMd/QNCWaz/XNFxBqRjEr5VXlQvtK5qGYLk+P6npiaR0G4kbP4VNOs4ss1D2dt/xXfSAWDP2oSJqM79+1+Dm4FBUnQee7w9WGYR6YuJM2qBfqLGItl2ArZwwzGIr1aJsI5G4/fhnNecqt/7vZ18GghqP+sAx6YxLnR4vP3/zIJ5672x7Wa5yNdiMQNJyaTUAZg43M6OkG0tyQ1KCQlzhQP4cU26wuftg7OjfPtZApk6XWW2YDoHPKoba3Z5hM9B+4IZ/ClZf++wb6YKSXvW65P77TUXMDmRvQPr+Xri+8/KxCfCeMMzmbNwNZ5We1bOm2hzu+62AcSsIClb5mFOW7ZYg4JA5zH6p2OOt3C+pFSiyC7+erkf9SrNUtMQBWp14PKeoLkvZ8O9g40kINtAXFCkF3wuLQDhoPN4km7RlL25H2Pc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TGNiL3k3WEcrV0wzVEZNOCs4MHJMRXZpUlRDTVd0RTVIR1JBM0trTUhnSVo0?=
 =?utf-8?B?Qkp2L0xQL3VEZGdlVGpyVU9OVzlVRlM5bS9ZMS9xc3kvY2NEY2ZjOGUwRWNZ?=
 =?utf-8?B?UWw1YXhmTnBlR2pnbmluR1IrZ002dnBIQ3huTkl2U1FKc1VySFFkV3dOR3Ex?=
 =?utf-8?B?cEE3cVRraUVsUzBWT3FlVWxreVVESGpSZk5mMzZ3UWR2WXNRc0JCcFJQS2pD?=
 =?utf-8?B?K3ZEdmtEQkI2aHhHWitQbWl5NllEeGxzcEo4TWJaM245YmtSRzdqcUZxS0hV?=
 =?utf-8?B?aFRaNklmM0FqQVlrZkhwMlJoSU1tdmFIT0hINGVXL0ZkUDY2T2QyajRXY0xV?=
 =?utf-8?B?WXRhL3BOY3E4bU14NC8zdG1DbnhjMzYvV29mZ3R1TkVMQUhVaVQwblhXdlA5?=
 =?utf-8?B?UGt5RGRZU2haakNxamp6TVNCcllxQUZzUDlLanBmak9JTGlGQ1Z5SHJWQ042?=
 =?utf-8?B?b3dhekg1QWhjb2dXTUxDeFJrL1pOOEo3N0M0c3JhaTQ5OTRjQVJNOFEzTGVu?=
 =?utf-8?B?UEowZk94MVdXNlhSU1U1VjY5eEtieEVld0xQeGkwb01OdTI4NzhRS3ZuTnBD?=
 =?utf-8?B?UXFZU0w2OG95eWRpaUZwNkJ6UStnQ1dyT3QwWTBIWU9RVW9RaHlpWUFzdzNB?=
 =?utf-8?B?Qldkb0JUWnJmV0czWitYZ1NmQkRBU0Fad1F1V01rM3VBVUVQTThyU3VIT3BU?=
 =?utf-8?B?SlBkVzdSTFB5cmlCWksweUFMQmVsRi83a3B2enVhdDlUOFU3MXFSNDh0R3NB?=
 =?utf-8?B?dG81UDEwZXBrNEZmTFRTcnRwSks0T04vRnBYVzJ0akUzckh1YlJFNFkyNFJh?=
 =?utf-8?B?NytZS0N1d0xLc0hsWE5TVjl3MTF5QkFZVFBucjlhbXFycnMrajVaYlZPUisz?=
 =?utf-8?B?OE1TdnhmNnNCVStrWE9rTmM1Zk5odDRSWURTM01sNWpVR2lsQjNuU1JGT2tr?=
 =?utf-8?B?c3FDSDhWaTV5S1VkREpNOTZ4ZmJSSTNMRDV3dWo5bkpwVFNCYWd3V1l3Q2Rx?=
 =?utf-8?B?dDR5MTkwb1dDY0hYU1JMdy91RW9xUmhiVEl0U0NxUUduVGplUzJSRG5qNTZv?=
 =?utf-8?B?TWtYSUNWa01TVTY4MkYvTzNGVU96dVk0eDJBNTNQbVJMMnNDZGxMQS9Sdm14?=
 =?utf-8?B?TVIvZEtPaUNFRlhvT3JramxvZ0FvMS9HUG81UUEwejdOTUxtVnJObXNsdUNU?=
 =?utf-8?B?ZmsxeHBmaU1paXpObHNISTNUd1ZHelZiY280Vk1jTUtndFg4N0sxQy84UGor?=
 =?utf-8?B?dGJOVXRySVN0TCtwSER3b0pucVBHOXE3cmFGQVBpV0dsclk3Sm4rYzgwT3dv?=
 =?utf-8?B?SG02ZVlxTW01YmU1cFZ6SGYxT1Bscjhxc2U3Kys1UHRCUEZucWUwY1ZqWmhG?=
 =?utf-8?B?R3NrYnlUUjVpdHBOUHJpQ3p6dHBvYzJaL012c2xKS3YrQnB1dlJLczV0TGNB?=
 =?utf-8?B?V3FCam5vc1FPQVRZQTlFV0ZFSkk1OTZxS1hIRW5XalBsTm1IZDNrT1gyNSt1?=
 =?utf-8?B?d3BvdkRiL0Y1aUNibW1pTUZNeFR5ZnpFak9oTDJtM1dXVGVRckxmelVjNjJi?=
 =?utf-8?B?Zit4dnNKLzZjMGJhNzQ1VWJLSk15N2E1R3VvcTFSOE4ya0w4MjZpMHp6YWNT?=
 =?utf-8?B?b05iTjdNZ29xbFVPTDhrNHdLNlBnL096UmZ6dWtJZUdWbHlSd0FPejdoeVQz?=
 =?utf-8?B?OUtDb3FXRmJnczRXQm96R0tzNGlZWmQ1SmF5UHpBZkVDRVJ0OU5QZVl2dnEx?=
 =?utf-8?B?WCtSZVV0SVdzTU5mdUI3cXpMSW9TbFVyWnNzWitNSlZLb0FKdndFSU8vSHdz?=
 =?utf-8?B?Q05MSlN0NU5mUXJSYUpBOUgzUm5kdjVtTkhFWWxueS91RnRZZWE1dTBjcE05?=
 =?utf-8?B?NzFBSlNJWkZ1TnZSTmNVWmdZcHF3dURYN3A0SmpvWFJiYWZZZzRZMHFqNTc3?=
 =?utf-8?B?MUtFdGpES3ErYi8yV0N2amlvZkFOOVVmY3dzUkp6TUN2c2w2bm9LczJ1OE9q?=
 =?utf-8?B?SkhoQVJhSkV4Z3FBKzJ0TkxrY3FiOFl2MktuaFVSNGtjYVFER2pNODNPRUhy?=
 =?utf-8?B?bFlmR3hQSDJxaEJhWWROY0k1RXhnelJkcENpUGR4T2VnTzh2VUpkMGtYU280?=
 =?utf-8?B?UVBkd0EyQlBIc3hHd3poOVNEWVhaMDVoaE5QSFNBbzYvVG15clo1Yk52ZVNa?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5c9fa8-1d1b-4962-4251-08dc3244424e
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 18:46:33.3023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X2XlQKcPRh8D51w2yqxzGxhAQEw2k4hHrEHpvzzdRczEXW9LrABCRvGFNx2W9zwKchiXUe265Pkz47ZSET1pqfgQBLfKBJahWD0CW5+K1v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8147
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

On 2/19/2024 06:35, Francois Dugast wrote:
> This aligns with kernel commit ("drm/xe: Add uAPI to query GuC firmware
> submission version").
>
> v2: Print branch first, use memset to zero the query (John Harrison)
>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: José Roberto de Souza <jose.souza@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Reviewed-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>   include/drm-uapi/xe_drm.h | 31 +++++++++++++
>   tests/intel/xe_query.c    | 92 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 123 insertions(+)
>
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index bacdca787..3bd795f27 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -574,6 +574,36 @@ struct drm_xe_query_engine_cycles {
>   	__u64 cpu_delta;
>   };
>   
> +/**
> + * struct drm_xe_query_uc_fw_version - query a micro-controller firmware version
> + *
> + * Given a uc_type this will return the major, minor, patch and branch version
> + * of the micro-controller firmware.
> + */
> +struct drm_xe_query_uc_fw_version {
> +	/** @uc: The micro-controller type to query firmware version */
> +#define XE_QUERY_UC_TYPE_GUC_SUBMISSION 0
> +	__u16 uc_type;
> +
> +	/** @pad: MBZ */
> +	__u16 pad;
> +
> +	/* @major_ver: major uc fw version */
> +	__u32 major_ver;
> +	/* @minor_ver: minor uc fw version */
> +	__u32 minor_ver;
> +	/* @patch_ver: patch uc fw version */
> +	__u32 patch_ver;
> +	/* @branch_ver: branch uc fw version */
> +	__u32 branch_ver;
This does not match the KMD version. Branch should be first.

John.

> +
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved;
> +};
> +
>   /**
>    * struct drm_xe_device_query - Input of &DRM_IOCTL_XE_DEVICE_QUERY - main
>    * structure to query device information
> @@ -643,6 +673,7 @@ struct drm_xe_device_query {
>   #define DRM_XE_DEVICE_QUERY_HWCONFIG		4
>   #define DRM_XE_DEVICE_QUERY_GT_TOPOLOGY		5
>   #define DRM_XE_DEVICE_QUERY_ENGINE_CYCLES	6
> +#define DRM_XE_DEVICE_QUERY_UC_FW_VERSION	7
>   	/** @query: The type of data to query */
>   	__u32 query;
>   
> diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
> index 9a6799c84..bbe5955eb 100644
> --- a/tests/intel/xe_query.c
> +++ b/tests/intel/xe_query.c
> @@ -730,6 +730,96 @@ static void test_engine_cycles_invalid(int fd)
>   	query_engine_cycles(fd, &ts);
>   }
>   
> +/**
> + * SUBTEST: query-uc-fw-version-guc
> + * Test category: functionality test
> + * Description: Display the GuC firmware submission version
> + *
> + * SUBTEST: multigpu-query-uc-fw-version-guc
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Display GuC firmware submission version for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_guc(int fd)
> +{
> +	struct drm_xe_query_uc_fw_version *uc_fw_version;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	uc_fw_version = malloc(query.size);
> +	igt_assert(uc_fw_version);
> +
> +	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
> +	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
> +	query.data = to_user_pointer(uc_fw_version);
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +	igt_info("XE_QUERY_UC_TYPE_GUC_SUBMISSION %u.%u.%u.%u\n",
> +		 uc_fw_version->branch_ver,
> +		 uc_fw_version->major_ver,
> +		 uc_fw_version->minor_ver,
> +		 uc_fw_version->patch_ver);
> +	igt_assert(uc_fw_version->major_ver > 0 || uc_fw_version->minor_ver > 0);
> +
> +	free(uc_fw_version);
> +}
> +
> +/**
> + * SUBTEST: query-invalid-uc-fw-version-mbz
> + * Test category: functionality test
> + * Description: Check query with invalid arguments returns expected error code.
> + *
> + * SUBTEST: multigpu-query-invalid-uc-fw-version-mbz
> + * Test category: functionality test
> + * Sub-category: MultiGPU
> + * Description: Check query with invalid arguments for all Xe devices.
> + */
> +static void
> +test_query_uc_fw_version_invalid_mbz(int fd)
> +{
> +	struct drm_xe_query_uc_fw_version *uc_fw_version;
> +	struct drm_xe_device_query query = {
> +		.extensions = 0,
> +		.query = DRM_XE_DEVICE_QUERY_UC_FW_VERSION,
> +		.size = 0,
> +		.data = 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	uc_fw_version = malloc(query.size);
> +	igt_assert(uc_fw_version);
> +
> +	memset(uc_fw_version, 0, sizeof(*uc_fw_version));
> +	uc_fw_version->uc_type = XE_QUERY_UC_TYPE_GUC_SUBMISSION;
> +	query.data = to_user_pointer(uc_fw_version);
> +
> +	/* Make sure the baseline passes */
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	/* Make sure KMD rejects non-zero padding/reserved fields */
> +	uc_fw_version->pad = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->pad = 0;
> +
> +	uc_fw_version->pad2 = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->pad2 = 0;
> +
> +	uc_fw_version->reserved = -1;
> +	do_ioctl_err(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query, EINVAL);
> +	uc_fw_version->reserved = 0;
> +
> +	free(uc_fw_version);
> +}
> +
>   igt_main
>   {
>   	const struct {
> @@ -743,10 +833,12 @@ igt_main
>   		{ "query-hwconfig", test_query_hwconfig },
>   		{ "query-topology", test_query_gt_topology },
>   		{ "query-cs-cycles", test_query_engine_cycles },
> +		{ "query-uc-fw-version-guc", test_query_uc_fw_version_guc },
>   		{ "query-invalid-cs-cycles", test_engine_cycles_invalid },
>   		{ "query-invalid-query", test_query_invalid_query },
>   		{ "query-invalid-size", test_query_invalid_size },
>   		{ "query-invalid-extension", test_query_invalid_extension },
> +		{ "query-invalid-uc-fw-version-mbz", test_query_uc_fw_version_invalid_mbz },
>   		{ }
>   	}, *f;
>   	int xe, gpu_count;

